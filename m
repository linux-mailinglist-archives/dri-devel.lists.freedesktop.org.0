Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73264371C7E
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EDF6E123;
	Mon,  3 May 2021 16:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BFB6E123
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 16:55:35 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id o27so5711986qkj.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 09:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WTaPZJJAb+agZFdITzeXOjZnWTBVRqn0ZvSBSvsqyj8=;
 b=KPPMi8esPiixHTvAdzjM1N0qW/guYzs1KzH9fDZI4345Xh0a+0njo5pRHf/sVYbNfp
 PabktArLEDIdcVFhAkDgyadtRbNJDn4dafcTG2RtZl+LsjdNdxrriJeg5Ss619IEeUSn
 rzhLOppLZScRfHHm9uhyiGH4PoNuoziso7orE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WTaPZJJAb+agZFdITzeXOjZnWTBVRqn0ZvSBSvsqyj8=;
 b=LotmzHa2amfyXzRYqw1JeB2MlyN9inbYjbfUU4LOe7CshWmlEqvjCsuvoze+B25gSz
 ByVyO5OkV0a1N3AJCHC8f7POYi5eVmI1t1dHVnULDmc7Zxi8cr5P7/d7ysjSo8JQY6/k
 6KJ9gRE263wS5V74G8f2kC4AsNzf/yjdsFG6tpkoBcFF/Sb+GBkwTWcSU3rW/+3NCHDJ
 g7B62TgqBRI+JDIB/CzH3Dnxm6L2IbqfC0lhEjEmAm/mvmadrGqtuqA4yxI9GGgr22DU
 st0bpGUw7yy/WsiWjSRdirsi1d2hd20jiWD9Alnk/vlggUmD1XyVLfnkoTmMGORm9hZk
 KoNw==
X-Gm-Message-State: AOAM530x48Sc3tBhHGSWJsBvoNcA+dG+r175ZqoXFXzNA+rdUyaJMlVs
 XPlYKwA80zA6pENdAc1kF649mNsWH9s7sg==
X-Google-Smtp-Source: ABdhPJyfKTW7tdtXvry260R7e79/Xfwrk3ShjES2t4S6NcnzyyFemWCdoi6OOTUo1lqWF5wrc0td/A==
X-Received: by 2002:a05:620a:13c3:: with SMTP id
 g3mr18754585qkl.429.1620060934284; 
 Mon, 03 May 2021 09:55:34 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id p5sm3364169qki.20.2021.05.03.09.55.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:55:33 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y2so8369951ybq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 09:55:33 -0700 (PDT)
X-Received: by 2002:a25:d9ce:: with SMTP id
 q197mr15755336ybg.276.1620060932851; 
 Mon, 03 May 2021 09:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.9.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
 <CACRpkdbZxauBFLvR_MMx4WD+K6DftK19Fivt_mkE=+Xr2EPUvQ@mail.gmail.com>
In-Reply-To: <CACRpkdbZxauBFLvR_MMx4WD+K6DftK19Fivt_mkE=+Xr2EPUvQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 May 2021 09:55:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGYHNasnqaFopUnuZNaBn+Nbf4+ak7vUoERaA8pRBTsw@mail.gmail.com>
Message-ID: <CAD=FV=XGYHNasnqaFopUnuZNaBn+Nbf4+ak7vUoERaA8pRBTsw@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] drm/bridge: ti-sn65dsi86: Break GPIO and
 MIPI-to-eDP bridge into sub-drivers
To: Linus Walleij <linus.walleij@linaro.org>
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
 Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, May 1, 2021 at 4:59 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 23, 2021 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > Let's use the newly minted aux bus to break up the driver into sub
> > drivers. We're not doing a full breakup here: all the code is still in
> > the same file and remains largely untouched. The big goal here of
> > using sub-drivers is to allow part of our code to finish probing even
> > if some other code needs to defer. This can solve some chicken-and-egg
> > problems. Specifically:
> > - In commit 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for
> >   delaying prepare()") we had to add a bit of a hack to simpel-panel
> >   to support HPD showing up late. We can get rid of that hack now
> >   since the GPIO part of our driver can finish probing early.
> > - We have a desire to expose our DDC bus to simple-panel (and perhaps
> >   to a backlight driver?). That will end up with the same
> >   chicken-and-egg problem. A future patch to move this to a sub-driver
> >   will fix it.
> > - If/when we support the PWM functionality present in the bridge chip
> >   for a backlight we'll end up with another chicken-and-egg
> >   problem. If we allow the PWM to be a sub-driver too then it solves
> >   this problem.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v5:
> > - Fix module compile problems (Bjorn + kbuild bot)
> > - Remove useless MODULE_DEVICE_TABLE (Bjorn).
>
> This is generally a good idea. I have no idea when to use
> auxbus or MFD

It was a bit hard for me to figure out too. I think historically this
could have been implemented by MFD but I believe that the point of
introducing the AUX bus was that MFD wasn't a great fit for things
like this. It's talked about a bit in
"Documentation/driver-api/auxiliary_bus.rst". For me the important
thing here is that we think of the bridge chip as one device, not a
collection of IP blocks glued together in one package. As some
evidence, the DT bindings don't have sub-nodes for this. There's a
single DT node that says that this one device is the bridge, is a GPIO
controller, and can provide a PWM.


> but I trust that you researched that so:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks! I'll land it then to whittle the patch stack down to just the
controversial EDID one.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
