Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B843367FF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 00:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF186E170;
	Wed, 10 Mar 2021 23:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9516E170
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 23:47:29 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id s7so18874021qkg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 15:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LW3ygLOJO4TeqznHJVAd2FSG2faQIgInXSeqKmxiPtM=;
 b=TPKH47gasYhLVZ3uiNyUFA5axyHpDZgCgeGZitPXEivZqj8E6ox2FrazEllNWC4sfA
 lztfY1z4luH7jYDCGt5hJ7vKJMrPvHqocLway7sTmuYduAWaA0pU3RK4OoLawl0wN62K
 XlZfY0nHdOqXZkE+WbZsRRTp3X8HfXM0uyHPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LW3ygLOJO4TeqznHJVAd2FSG2faQIgInXSeqKmxiPtM=;
 b=DpmmMSvy7bADENUtj/YT7Lt1CCcglUAIsr2rGJY1rzfV8eN1gr3VRGdGUoNKwzy6en
 j+o69DHXruCAbf3qLyKnOe3NQH19M25iXDlwvR9GjB+pKZSgOMH3vxQDoB41QDHckKI3
 TcpPPvqtxzc5rkvyGupVS98iAIRPxrIiCzvJi9h9FSGFQnld1sFThRt+tVYrg4sbe73T
 2vRL8SABUmR1z+s3rG0GgUBXgUdTaW2IpHncC99lDkF0Ga5MutJyQ5tQtUa+wybLt7eh
 NfFn0TLbTW1t0rLbROfqmvCibhfURS4VVJHO3+5GfMudQgW9RAv/zGq/wwxCXKgOyB2O
 DGLg==
X-Gm-Message-State: AOAM5314qFLVMpe0BmKXhyg0H5znT8FbK+dlwG4Z0+fiHFrHNkBDjT0b
 StEwDERlv15/hBlTLuZM6KLEFfU7D16Yug==
X-Google-Smtp-Source: ABdhPJyltCjQFdjl+00nuaAD4rL1s93bSNo8gQyoapmvTK4pwzYAdmkY0rHMBsOyezxWYVu9wnPzQQ==
X-Received: by 2002:a37:8506:: with SMTP id h6mr5147242qkd.134.1615420048206; 
 Wed, 10 Mar 2021 15:47:28 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id n35sm614515qte.19.2021.03.10.15.47.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 15:47:27 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id f145so3364560ybg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 15:47:27 -0800 (PST)
X-Received: by 2002:a25:aa43:: with SMTP id s61mr8352296ybi.32.1615420046847; 
 Wed, 10 Mar 2021 15:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
 <CACRpkdYUs2W3b_u8YrmYwq_kcUCf0DhZ-o2o6O2EmU5rdtv=BA@mail.gmail.com>
In-Reply-To: <CACRpkdYUs2W3b_u8YrmYwq_kcUCf0DhZ-o2o6O2EmU5rdtv=BA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Mar 2021 15:47:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WDVAj+OcVXaTJRUu8tvdDzySW0KOfiGqZHi5YvP42BTA@mail.gmail.com>
Message-ID: <CAD=FV=WDVAj+OcVXaTJRUu8tvdDzySW0KOfiGqZHi5YvP42BTA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 10, 2021 at 3:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jan 15, 2021 at 11:44 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > - ("drm/panel-simple: Don't wait longer for HPD...") new for v2.
> > - ("drm/panel-simple: Retry if we timeout waiting for HPD") new for v2.
>
> I couldn't find these patches in my inbox

Doh! Sorry about that. I think get_maintainer tagged you only on the
patches that had the explicit "fixes" in them on something you were
involved in. I tend to rely on get_maintainer heavily unless I think
someone is particularly interested in the whole series. I will make
sure to CC you on the whole series if I post it again. In the meantime
the whole series is on lore:

https://lore.kernel.org/lkml/20210115224420.1635017-1-dianders@chromium.org/

> but my concern would
> be that at some point panel-simple will turn from simple into
> panel-rube-goldberg-machine.

Yes, it's definitely something to watch out for. I guess you're
commenting on the general number of changes I've made to simple-panel
in the last year or two? I guess my comment on those:

* Many of the changes I made were around HPD handling and supporting a
GPIO (and also supporting the "hpd absent delay"). The fact that we
use a GPIO for HPD is actually an attribute of our board design,
though, so if I had forked panel drivers for each of the panels that
needed it then it would have required copying the code lots of places
(or implementing some code sharing). I was specifically asked to do
the HPD handling code at the panel layer.

* The other big change I made recently was around allowing for
relative rather than absolute timings (instead of a fixed delay at a
given stage adding a constraint that enough time had passed since a
previous event). When I proposed that the feedback I got back was that
it was a good improvement for all panels and something that had been
on a TODO list for a while.

...so while it feels like I keep piling crap onto simple-panel, I
_think_ they've been good general improvements that many people will
be able to benefit from and I don't think they've uglified things
lots.

> Given that the talk with the manufacturer may result
> in even more quirks... maybe this should just be a separate
> panel driver?

I don't _think_ this will end up with more quirks. At least I sure
hope not. So far it seems like pure luck that I even noticed it
because only one other device in the whole batch produced had similar
problems. That leads me to believe that there could be other panels
with a similar need.

> (I expect pushback because I see how handy it is, but
> I am the guy writing new panel drivers all the time rather than
> using simple.)

I guess what I'd say in summary is:

* If you object to the retries in simple panel, I still hope the rest
of the series can land.

* If somehow this panel gets out into real users hands and we find
that the retries are necessary and people still don't want the retries
in simple panel, I can fork a special panel driver just for it then.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
