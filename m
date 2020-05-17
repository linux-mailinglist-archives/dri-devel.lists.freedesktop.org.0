Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C2F1D6D6D
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 23:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C97C6E0AC;
	Sun, 17 May 2020 21:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE036E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 21:11:33 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id e7so2371565vsm.6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pS6rsKOx2NlgRMIkpuNZy1aWSRLDNax4OfYSZRKfBK4=;
 b=sRI2awQU1CCgH2QZGeVWlqfdWUktkqScKv3xetm+Xi3bETiLKZl/gRqnqgrANiHZ8o
 kYQeEV6tyEKSwqoBudxg21WBawsQO5Mjpe7Bv++v0FPDa/gg7dvIE8pR/Be9NqI/s/38
 o5PPzB7gGJpZZuwI03d4T8lNI0CwuTrwwrRbUx/UaTVTjeotO0VjVMjIn8P4TPhKhpN/
 unE4RY0viEJFRgLCT7DLwW+vUiKFvqVO4L6791+wgFCO2qh3z4kTr/TTWGw8tU1tfqEl
 3BxCZntyMjc+gdh5ieYUTgVMeSuIFXFhBetYhCwx2J1OtSIS3NB+Os+BnV6MMoJuNsf9
 LeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pS6rsKOx2NlgRMIkpuNZy1aWSRLDNax4OfYSZRKfBK4=;
 b=OHssNMeLXYdwacOd0F1qDaoLcdE7ZjcRa42w6R+l+ZPVk7m6BDpBSOXPGVK5YF6pmJ
 fJegI6V1U0lFU/1rk00RC8P0T1jlxbfw0qM02PvmtfCAdIq/riEk7QaWoFRw87CfL21k
 t5QqwMHsAuNk5uuvCCTgalsS2fm56XQe4Lq2InKXO6ogeGquSMgpc5e1W/Ct2UNLVhed
 fndI9bdFV+nEvtJi3eCrU6CsYXMjS5pv8TjotzOC6WFoKKalaVGhGKpykI2G2UJPRN1C
 XxhaKNj1X7p4g0xeNmJksVxLi+i+iHU32t1O4kRREk1MoyafcKbzSaDtlSiQZd5pMP+T
 TIGg==
X-Gm-Message-State: AOAM530CLKX/7tq+O2Pk05LIzjD5lPL4xdLuoUQEH24/jLmGPj4CG2Pf
 28vdeKuv9BxQfT7xKNQzoRgDMmrX1MupSOElB8k=
X-Google-Smtp-Source: ABdhPJxsotUSshgEqdsswCJgkh3hTeWWx0kLTasnyOGe6CvxTYAxGOIceX0CTXUHGLxmhfSj2EfI8mB4Yp99bcNUO+w=
X-Received: by 2002:a67:ecc2:: with SMTP id i2mr8496841vsp.85.1589749892414;
 Sun, 17 May 2020 14:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200513215627eucas1p1c919a6175b210c13fe7b920c455ebb62@eucas1p1.samsung.com>
 <20200513215342.2145495-1-emil.l.velikov@gmail.com>
 <178a203a-fc3e-0027-60c9-786c3e907407@samsung.com>
In-Reply-To: <178a203a-fc3e-0027-60c9-786c3e907407@samsung.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 17 May 2020 22:08:43 +0100
Message-ID: <CACvgo53YRogMB_Xh+=+gNLQ28beNJdhyECR0550hVqqtD0J8Bg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: annotate rivafb/nvidiafb as obsolete
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 at 14:28, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:

> > diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > index 1b2f5f31fb6f..cad3e4bc5e52 100644
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@ -868,6 +868,7 @@ config FB_ATMEL
> >
> >  config FB_NVIDIA
> >       tristate "nVidia Framebuffer Support"
> > +     depends on BROKEN
>
> Please don't add new users of BROKEN config option.
>
> Either it is broken and should be removed right now (BROKEN config option
> predates git and with git nothing is ever lost), or it still works and
> should be left alone.
>
Seems like not everyone got that memo. BROKEN is still in use, with
dozen or so cases for last year.
See for example:

commit 9d60d93198c62ac3b3e59e8bba7079646c972a4c
Author: J. Bruce Fields <bfields@redhat.com>
Date:   Mon Aug 26 10:28:58 2019 -0400

    Deprecate nfsd fault injection


That said, your suggestions are pretty good. v2 coming in a moment.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
