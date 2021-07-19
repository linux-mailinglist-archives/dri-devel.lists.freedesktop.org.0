Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8A3CE8E7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 19:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701EF6E1F4;
	Mon, 19 Jul 2021 17:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B85389D7D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:43:52 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a6so25871841ljq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lkb64p666TsMQoJB8bFW0M3JYMVrr4pV3PJi1xmP1sQ=;
 b=SCfJHRU6fnw/UMQ5GYy0ViwQJ1/EotLasE0u7oWiQ3108H8J1jp36eN0UgTgXZ70kb
 367x5tyu4Ih0c1uu1XsKkwIbgtCH4I8EakwPF4jvugPRuheEe5lnKS/XFoC0C3+vxeN8
 klhUV9++zgYfZZYTuE8G2ylpXcqXerxlI9WS3YJYheVPFpj7/qzeipOxZaNeh1H3ci/s
 Z2aZZx3V3gP6kyDJV2tyq5VBlmdntZbWTvY8rZbPMmrt8cK+tny9Ki0/TKhE+Iwky6ci
 tbix8ML+ZaCFQ8XIHZ6oNhaX2ayeN4y4IrvThIcUi7wsVcpTWVrlJ9kUdEY1JqyXtpM6
 EzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lkb64p666TsMQoJB8bFW0M3JYMVrr4pV3PJi1xmP1sQ=;
 b=fw6HujO619ISzSckRkDoVxeOr7hR+cfrZ4yYCoLubvAqvYGZt/63dT1CE5HjZOW92/
 1qeC9fv8M9I9LvCInyeGRT9+cQcctPuyi68zBAkFxpQHGTQui/OLpvIY2CmzdD229B98
 js6rUT12UcIG2g6dGv/UejFJmrS0zxKD62bUgRc5zmCGbNp9z9CgKC09MNcTiTQL0uJ5
 bINB2BBVq6ps2+w64TNNnKTgEJUsZt5HPf1HdtHdI5ly4Hpq0/2meR5S2H7Pux9C9J8r
 rdClCG/n2G97rC6ruzl+sZVoXin8aqiSWu0OvbUhqCsOsw1snce7bOZscU2GdN09adGa
 mcxQ==
X-Gm-Message-State: AOAM5305oOJvytGCV3upryrfy91nUJyxapDijeUnAmXaMolQHgzrHS7c
 gzbyYakMGqQhxc9+zo4od5JtZGxr+CNjZoz0xaN7aE8kXLR9Qg==
X-Google-Smtp-Source: ABdhPJzIhAU4QrjoXm1+IuJ1PPgygM3ag3xTzeuBXWLLnwly7hdscJbAtcdKyZjdEHduEPdpeEFkHja8VzimP7DuAvw=
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr21872042ljk.468.1626695031106; 
 Mon, 19 Jul 2021 04:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210715182551.731989182@linuxfoundation.org>
 <20210715182634.577299401@linuxfoundation.org>
 <CAJn8CcF+gfXToErpZv=pWmBKF-i--oVWmaM=6AQ8YZCb21X=oA@mail.gmail.com>
 <YPVgtybrZLxe3XeW@kroah.com>
In-Reply-To: <YPVgtybrZLxe3XeW@kroah.com>
From: Xiaotian Feng <xtfeng@gmail.com>
Date: Mon, 19 Jul 2021 19:43:39 +0800
Message-ID: <CAJn8CcHHKSo7GF29Z1ufXJJpMUzn6+fdvwiqe9=JvgpcfvnbHQ@mail.gmail.com>
Subject: Re: [PATCH 5.12 237/242] drm/ast: Remove reference to struct
 drm_device.pdev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Jul 2021 17:43:09 +0000
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
Cc: kernel test robot <lkp@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 7:23 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 19, 2021 at 05:57:30PM +0800, Xiaotian Feng wrote:
> > On Fri, Jul 16, 2021 at 5:13 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > From: Thomas Zimmermann <tzimmermann@suse.de>
> > >
> > > commit 0ecb51824e838372e01330752503ddf9c0430ef7 upstream.
> > >
> > > Using struct drm_device.pdev is deprecated. Upcast with to_pci_dev()
> > > from struct drm_device.dev to get the PCI device structure.
> > >
> > > v9:
> > >         * fix remaining pdev references
> > >
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > Fixes: ba4e0339a6a3 ("drm/ast: Fixed CVE for DP501")
> > > Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> > > Cc: kernel test robot <lkp@intel.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20210429105101.25667-2-tzimmermann@suse.de
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > >  drivers/gpu/drm/ast/ast_main.c |    5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > --- a/drivers/gpu/drm/ast/ast_main.c
> > > +++ b/drivers/gpu/drm/ast/ast_main.c
> > > @@ -411,7 +411,6 @@ struct ast_private *ast_device_create(co
> > >                 return ast;
> > >         dev = &ast->base;
> > >
> > > -       dev->pdev = pdev;
> > >         pci_set_drvdata(pdev, dev);
> > >
> > >         ast->regs = pcim_iomap(pdev, 1, 0);
> > > @@ -453,8 +452,8 @@ struct ast_private *ast_device_create(co
> > >
> > >         /* map reserved buffer */
> > >         ast->dp501_fw_buf = NULL;
> > > -       if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
> > > -               ast->dp501_fw_buf = pci_iomap_range(dev->pdev, 0, dev->vram_mm->vram_size, 0);
> > > +       if (dev->vram_mm->vram_size < pci_resource_len(pdev, 0)) {
> > > +               ast->dp501_fw_buf = pci_iomap_range(pdev, 0, dev->vram_mm->vram_size, 0);
> > >                 if (!ast->dp501_fw_buf)
> > >                         drm_info(dev, "failed to map reserved buffer!\n");
> > >         }
> > >
> >
> > Hi Greg,
> >
> >      This backport is incomplete for 5.10 kernel,  kernel is panicked
> > on RIP: ast_device_create+0x7d.  When I look into the crash code, I
> > found
> >
> > struct ast_private *ast_device_create(struct drm_driver *drv,
> >                                       struct pci_dev *pdev,
> >                                       unsigned long flags)
> > {
> > .......
> >         dev->pdev = pdev;  // This is removed
> >         pci_set_drvdata(pdev, dev);
> >
> >         ast->regs = pcim_iomap(pdev, 1, 0);
> >         if (!ast->regs)
> >                 return ERR_PTR(-EIO);
> >
> >         /*
> >          * If we don't have IO space at all, use MMIO now and
> >          * assume the chip has MMIO enabled by default (rev 0x20
> >          * and higher).
> >          */
> >         if (!(pci_resource_flags(dev->pdev, 2) & IORESOURCE_IO)) { //
> > dev->pdev is in used here.
> >                 drm_info(dev, "platform has no IO space, trying MMIO\n");
> >                 ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
> >         }
> >
> >         That's because commit 46fb883c3d0d8a823ef995ddb1f9b0817dea6882
> > is not backported to 5.10 kernel.
>
> So what should I do here?  Backport that commit (was was not called
> out), or just revert this?
>
I think we can just simply revert the patch. Because commit 46fb883c
removed drm_device.pdev usage,
then commit ba4e0339 used drm_device.pdev again. Since commit 46fb883c
is not in 5.10.50 kernel,
it's not a stable fix.

> thanks,
>
> greg k-h
