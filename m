Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949B30986B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 22:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94A86E0CA;
	Sat, 30 Jan 2021 21:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482226E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 21:21:41 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id m22so7338699ljj.4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 13:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4OLWHP5uIeHtH/PXlg2tlgcv8JFrhZJ4lrJ+/6QlsXg=;
 b=TkwE6cDIlq3Ulq8HgLNEIM6EYrtozp42Sm0p/p4zDaSl5J0I8sZ4KmQlXefAdYicY+
 GyABmIneBgRIbZRP699lCQa+5zUti3bUF0tlnzaZ/iB5FP8xI65c+cEObASDkktuXEvP
 zqb/w602mz1S4euF85t2YVTDSoo8aJDoQ6pJVN5XjVEsMPPq7hQpijTUBa3cahpSu+/4
 zG/VvNdm5n0/IbgkrADrBsguCxbtCKcaq14+zE9mawYjnSqZhCptTK1CwlFgzXlWU7Ma
 Wwj6NkFIPkZVV9dmCdXyhIaJc7MisffmdM5ViSM9nh894lOtqPOR0AWs8vDKuysuD1RP
 lovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4OLWHP5uIeHtH/PXlg2tlgcv8JFrhZJ4lrJ+/6QlsXg=;
 b=WWhA+UlJwubF7efs89Zh9BCV8Lnhz/+FMmT94tYkKmdsI2Qz3bi+g8FnprfLGFWtss
 ozUY1KpLJf6o5i72VYaN9P1/KKyN3YogXXMiUedQruy0r7/OmZdDNDlLVRfwc/Q6epgg
 8yyi1mz0oWR04ML1jjMPdJfmiL5QtGi70WSeJ/MSVG9+Dtbx7lNiTzuyKVXE4b78XrHn
 GleoKZZBZUDCPw/rOaBvk7MA2RWL12paAz1zm9UnOIdfRnFWhfztJBcKX/O64tZxA/su
 t8xOG2g2D4tB55ZcHZmuTYIUidGiG7ADAtnkihCkg5RE+P6XHp8trqnS+LOeEPDRM5oL
 pSjA==
X-Gm-Message-State: AOAM5323Nt9r65oiabQXmbpS1mPFYqBSl6ziYcVipwCqrzBtGZZZK04H
 1qnGj0AtMgsMKTmJz9oFnuMG6IYn9C/T3N6fEWEFUhYG
X-Google-Smtp-Source: ABdhPJxMctLHhEr5QovTAK8vnfklN4wZPyhd9VVDt5AXngNpDGuuasMi5rBdEgIW290rZ3IgrRYdvzJKPTwLXWBWhBs=
X-Received: by 2002:a2e:993:: with SMTP id 141mr5224764ljj.372.1612041699687; 
 Sat, 30 Jan 2021 13:21:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1598331148.git.joe@perches.com>
 <e96626cd1301ff44e5101e0e5913d8439b425c9f.1598331148.git.joe@perches.com>
 <49b8e2550e661d5f8a5d0b353ec23819cdcae3d2.camel@perches.com>
In-Reply-To: <49b8e2550e661d5f8a5d0b353ec23819cdcae3d2.camel@perches.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sat, 30 Jan 2021 22:21:28 +0100
Message-ID: <CAMeQTsaaL7bGxp+hYyAzD2e8ibrszcSkUcYmMToOaxYu1iEmdA@mail.gmail.com>
Subject: Re: [PATCH 09/29] drm/gma500: Avoid comma separated statements
To: Joe Perches <joe@perches.com>
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
Cc: David Airlie <airlied@linux.ie>, Jiri Kosina <trivial@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 30, 2021 at 7:47 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> > Use semicolons and braces.
>
> Ping?

This entire file is going away so perhaps just drop the patch to avoid
a conflict.

-Patrik

>
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  drivers/gpu/drm/gma500/mdfld_intel_display.c | 44 +++++++++++++-------
> >  1 file changed, 28 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> > index aae2d358364c..bfa330df9443 100644
> > --- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
> > +++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> > @@ -824,33 +824,45 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
> >               if ((ksel == KSEL_CRYSTAL_19) || (ksel == KSEL_BYPASS_19)) {
> >                       refclk = 19200;
> >
> >
> > -                     if (is_mipi || is_mipi2)
> > -                             clk_n = 1, clk_p2 = 8;
> > -                     else if (is_hdmi)
> > -                             clk_n = 1, clk_p2 = 10;
> > +                     if (is_mipi || is_mipi2) {
> > +                             clk_n = 1;
> > +                             clk_p2 = 8;
> > +                     } else if (is_hdmi) {
> > +                             clk_n = 1;
> > +                             clk_p2 = 10;
> > +                     }
> >               } else if (ksel == KSEL_BYPASS_25) {
> >                       refclk = 25000;
> >
> >
> > -                     if (is_mipi || is_mipi2)
> > -                             clk_n = 1, clk_p2 = 8;
> > -                     else if (is_hdmi)
> > -                             clk_n = 1, clk_p2 = 10;
> > +                     if (is_mipi || is_mipi2) {
> > +                             clk_n = 1;
> > +                             clk_p2 = 8;
> > +                     } else if (is_hdmi) {
> > +                             clk_n = 1;
> > +                             clk_p2 = 10;
> > +                     }
> >               } else if ((ksel == KSEL_BYPASS_83_100) &&
> >                                       dev_priv->core_freq == 166) {
> >                       refclk = 83000;
> >
> >
> > -                     if (is_mipi || is_mipi2)
> > -                             clk_n = 4, clk_p2 = 8;
> > -                     else if (is_hdmi)
> > -                             clk_n = 4, clk_p2 = 10;
> > +                     if (is_mipi || is_mipi2) {
> > +                             clk_n = 4;
> > +                             clk_p2 = 8;
> > +                     } else if (is_hdmi) {
> > +                             clk_n = 4;
> > +                             clk_p2 = 10;
> > +                     }
> >               } else if ((ksel == KSEL_BYPASS_83_100) &&
> >                                       (dev_priv->core_freq == 100 ||
> >                                       dev_priv->core_freq == 200)) {
> >                       refclk = 100000;
> > -                     if (is_mipi || is_mipi2)
> > -                             clk_n = 4, clk_p2 = 8;
> > -                     else if (is_hdmi)
> > -                             clk_n = 4, clk_p2 = 10;
> > +                     if (is_mipi || is_mipi2) {
> > +                             clk_n = 4;
> > +                             clk_p2 = 8;
> > +                     } else if (is_hdmi) {
> > +                             clk_n = 4;
> > +                             clk_p2 = 10;
> > +                     }
> >               }
> >
> >
> >               if (is_mipi)
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
