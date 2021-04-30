Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AF37029A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 23:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5319D6F5C0;
	Fri, 30 Apr 2021 21:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6216F5C0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 21:04:55 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id d19so36471133qkk.12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ydzc/UQSfGeVQNFG/QnxGDWnpFhecwtLoJxqG8ZG8Cg=;
 b=Ov5R523poXhFI1+DTO58fwJyVG5rNJSwtnBjJkc2d0NfuddPNjyjVNuQDvPuV3xvSz
 HvpREttduQPxVSPQAOIyOYBQxfZyhIf/3wphxaf8asWM5RUMbVBRfrz5KxXU54bvlJws
 Xz7/VHZ58xLOEFJrCnt8mUt8eX7GqtBE7DXmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ydzc/UQSfGeVQNFG/QnxGDWnpFhecwtLoJxqG8ZG8Cg=;
 b=nYeqzvVqCyb9rxDbanmZJaKQDTNDFsMePySCTv8s6TB90TikG69qks0mIEDuujpNMn
 qtg9QBfp91AAxbVyBnOn2/5nBKr0J3c23yxxBXM0k0q68XmyNinpW+WAwyBDKxE0JGaU
 tljP+9/ZplxgQolD6M5045fTJ0CYSM360ZWorUO/4iInmNbw2jKp5O0pOlbG+3FmJNdv
 lxspQ3BnHh+ijHrwXoVnu2iz7WYkrBywUPxB/TnoRWijHchV4w7wVB+SW4EwJUpUKNuG
 sA0/aJfCbBgRZSESGAJO9Ne/vo3OFCAI/CSokumtp/N6mt6khzv8eegkfoN1jR5jz8Xw
 1qvw==
X-Gm-Message-State: AOAM530L4RXjNQiGCA0eIMgQz2IYy9z4SCJXOW844/p6+GWYXLYJergh
 ABdJLEHZFDJWLzZ1qPBb1ZdhwJeG6IelLA==
X-Google-Smtp-Source: ABdhPJw0k13r87GagwqxJWbF/QS8xAN8xDt1TpqJXYT4uV6drPa2KmrUjE1heIezmBYSO72UgNMtdA==
X-Received: by 2002:a37:2e87:: with SMTP id u129mr7569136qkh.316.1619816693995; 
 Fri, 30 Apr 2021 14:04:53 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id o12sm3201339qtg.14.2021.04.30.14.04.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 14:04:52 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 130so41025456ybd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:04:52 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id
 u130mr10217798ybb.257.1619816691670; 
 Fri, 30 Apr 2021 14:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
 <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
 <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
In-Reply-To: <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Apr 2021 14:04:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXxTz8hi92y6p3hX7iVEHuqKHsrKPSnX_a__WCEQRAKw@mail.gmail.com>
Message-ID: <CAD=FV=XXxTz8hi92y6p3hX7iVEHuqKHsrKPSnX_a__WCEQRAKw@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To: Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 29, 2021 at 6:28 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 30, 2021 at 3:25 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > > I think pm_runtime_disable(); need to be added there?
> >
> > I'm a bit confused. You're saying that I need to add
> > pm_runtime_disable() to panel_simple_remove()? Doesn't this patch do
> > that?
>
> It does, sorry, too late at night :D
>
> I was looking at the previous patch and mixed up which was the
> patch and the patch to the patch...
>
> Thanks, apply this!

Pushed this one patch. Rest of the series is pending adult
supervision. Overall summary:

1. I could probably push some of the early sn65dsi86 cleanup patches
in this series since they have Bjorn's review and are pretty much
no-ops / simple cleanups, but there's probably not tons gained for
shoving those in early.

2. The whole concept of breaking up the patch into sub-drivers has no
official Reviewed-by tags yet. Presumably Bjorn will give those a
re-review when he has time again. Assuming nobody is really upset
about it, I could land those which might unblock some of Bjorn's
future PWM work. It would probably be good to get an extra set of eyes
on them, though, just so someone else agrees that they're not "too
hacky" or anything. IMO it's actually a pretty nice solution, but I'm
biased!

3. Laurent and I had a big discussion on #dri-devel yesterday about
the EDID reading. He's not totally convinced with the idea of doing
this in the panel when the bridge could just do it by itself, but it
sounded like he might be coming around. Right now this is waiting on
Laurent to have time to get back to this.

My summary of the IRC discussion with Laurent (please correct if I got
this wrong):

a) In general I argued that it was important to be able to provide the
EDID and the DDC bus to the panel driver. Providing the EDID to the
panel driver allows the panel driver is one of the prerequisites for
my proposal for solving the "panel second sourcing" problem [1]. Being
able to provide the DDC bus to the panel will likely be important in
the eventual solution to Rajeev's problem [2].

b) Today, if we provide the DDC bus to simple-panel then simple-panel
will assume it's in charge of reading the EDID.

c) Having the panel driver involved in reading the EDID feels like it
makes sense to me. The panel driver knows how to power the panel on
enough to read the EDID. It also might know extra quirks needed to
read the EDID on a given panel. This feels a little cleaner (to me)
than just re-using the panel's "prepare" and assuming that a prepared
panel was ready for EDID read, though I can see that both may have
their advantages.

d) Laurent proposed that some eDP controllers might have special ways
to read an EDID but might not be able to provide a DDC bus or an i2c
bus. If we run into controllers like this then we would be painted
into a corner and we'd have to come up with a new solution. This is
definitely a good point, though it remains to be seen if this is
common with eDP (like Laurent says it is for HDMI). Some eDP panels
need custom DDC commands in order to be configured and so hopefully
all eDP bridges out there at least provide a DDC bus. It does feel
like this could be solved later, though. My patch series is leveraging
the existing concept that the panel driver is in charge of reading the
EDID if it's given the DDC bus, so it's not creating a new mechanism
but instead just continuing to use the existing mechanism. If the
existing mechanism doesn't work then it can be improved when there is
a need.

e) Laurent worried about circular dependencies and wanted to see my
solution to the problem before deciding if it was too big of a hack.
Hopefully it looks OK since it solves not only this problem but also
the HPD GPIO problem and will be important for when Bjorn exports the
PWM from the bridge chip.

[1] https://lore.kernel.org/lkml/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com/
[2] https://lore.kernel.org/r/78c4bd291bd4a17ae2a1d02d0217de43@codeaurora.org

OK, I'll shut up now. ;-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
