Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F168B84A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D929910E15F;
	Mon,  6 Feb 2023 09:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B7310E327
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 08:01:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p26so31614494ejx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 00:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7JpnDkvk/DgCTjw3qEAYwYwK2ND+2NmFbWHW/DhdVDU=;
 b=ZQh0Md3EdC8MJC37bk/2cagaIHoDDvkd+OwesYutfssSpy0BDsTmuiX5EF6kyBK4kN
 T4qZxYzLN+7XbHDzP/o81g89gWW+AL7kmKu2j54tGfaCa5y1MHwHzUuDVyugQ8VWOadA
 4JiCHcJoCHvSlMAxi/AeGheBwjP0vo9EKAtciRVGVi3My7bMt1WvG6CKvMAQu/q85UkH
 /4XgrglOLW+oTwdndw5+AowpwoCFESosVvznD5k5patAUo7mYJd9gMSl1rJAlB9sphhg
 yuaT9HebrsPbxFyWDIrF9X0T885zT2tF42oS5IDCkoa5/e7XhYQBMyL1gHe36u9oFiNl
 n5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7JpnDkvk/DgCTjw3qEAYwYwK2ND+2NmFbWHW/DhdVDU=;
 b=57514NlVgNhKa1hrctvDqoRpAOmpjQVsQeRNEyfPVqPEnQ/35CdGinniZGRRykLD7l
 o7fFLguyZnTbi017C3P78oGPlBdPxtnqWbWisRUBvgt6j9YddggNY2HSTfN7OkEmD8WE
 p+Ul56fVnlMUsaYSSuzpCu/5MnFvXbhfBx4dCi7xg2/E//HR382UxG7upirqzNh9jPOj
 xNPK7Qa3seM6z7KSFENlWH55ztzWvNUMXv5tQuXMVy8t0+uIcFkEQeegT9yeFaQqcVDB
 9OF4S+z4jW5aClcrUdhqPCeSAcF99MxpZF5nbTmCn3GRPea0QmX3L1HGOoSZgqWCgf7j
 qfgQ==
X-Gm-Message-State: AO0yUKXzVqtkwiTCeYBxJvCXO5OtGuy/XNzRn2O4YpD5EtF+4t+jsvwW
 xZbGR58c9f/UjbILJLF1bXxcLF3V3RqZq3msr0M=
X-Google-Smtp-Source: AK7set/QmbsZMrY5BFYcskwuf8BRvZ0yksWH0muxlF/qn38hZirgeEw3yEn7ip5KwXyRLU9yFetwowJ0zZbDCIWLRco=
X-Received: by 2002:a17:906:6d0d:b0:87e:94bb:8174 with SMTP id
 m13-20020a1709066d0d00b0087e94bb8174mr5694759ejr.249.1675670491604; Mon, 06
 Feb 2023 00:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20230205210751.3842103-1-airlied@gmail.com>
 <CAOkhzLWSJsDK9Gm-AzeUw7fCpkjDg7d9GuDWyF-6hDr5UZ4DZg@mail.gmail.com>
 <CAPM=9tyaCUmA2bNP1YA1B=cFZP=nKPhQoWR7UwBD2Nfj8ZTODA@mail.gmail.com>
In-Reply-To: <CAPM=9tyaCUmA2bNP1YA1B=cFZP=nKPhQoWR7UwBD2Nfj8ZTODA@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Mon, 6 Feb 2023 09:01:20 +0100
Message-ID: <CAOkhzLVLbOEp4QnJynxV3cgiqOV5Rm=+dMgexiRmyDs-bRCTPg@mail.gmail.com>
Subject: Re: [PATCH] nvidiafb: detect the hardware support before removing
 console.
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 06 Feb 2023 09:10:58 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bjorn@helgaas.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Dave

On Mon, Feb 6, 2023 at 8:54 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 6 Feb 2023 at 17:52, Zeno Davatz <zdavatz@gmail.com> wrote:
> >
> > Dear Dave
> >
> > Thank you for your patch.
> >
> > On Sun, Feb 5, 2023 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > This driver removed the console, but hasn't yet decided if it could
> > > take over the console yet. Instead of doing that, probe the hw for
> > > support and then remove the console afterwards.
> > >
> > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > > Reported-by: Zeno Davatz <zdavatz@gmail.com>
> > > ---
> > >  drivers/video/fbdev/nvidia/nvidia.c | 81 +++++++++++++++--------------
> > >  1 file changed, 42 insertions(+), 39 deletions(-)
> > >
> > > diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> > > index 1960916098d4..e60a276b4855 100644
> > > --- a/drivers/video/fbdev/nvidia/nvidia.c
> > > +++ b/drivers/video/fbdev/nvidia/nvidia.c
> > > @@ -1197,17 +1197,17 @@ static int nvidia_set_fbinfo(struct fb_info *info)
> > >         return nvidiafb_check_var(&info->var, info);
> > >  }
> > >
> > > -static u32 nvidia_get_chipset(struct fb_info *info)
> > > +static u32 nvidia_get_chipset(struct pci_dev *pci_dev,
> > > +                             volatile u32 __iomem *REGS)
> > >  {
> > > -       struct nvidia_par *par = info->par;
> > > -       u32 id = (par->pci_dev->vendor << 16) | par->pci_dev->device;
> > > +       u32 id = (pci_dev->vendor << 16) | pci_dev->device;
> > >
> > >         printk(KERN_INFO PFX "Device ID: %x \n", id);
> > >
> > >         if ((id & 0xfff0) == 0x00f0 ||
> > >             (id & 0xfff0) == 0x02e0) {
> > >                 /* pci-e */
> > > -               id = NV_RD32(par->REGS, 0x1800);
> > > +               id = NV_RD32(REGS, 0x1800);
> > >
> > >                 if ((id & 0x0000ffff) == 0x000010DE)
> > >                         id = 0x10DE0000 | (id >> 16);
> > > @@ -1220,12 +1220,11 @@ static u32 nvidia_get_chipset(struct fb_info *info)
> > >         return id;
> > >  }
> > >
> > > -static u32 nvidia_get_arch(struct fb_info *info)
> > > +static u32 nvidia_get_arch(u32 Chipset)
> > >  {
> > > -       struct nvidia_par *par = info->par;
> > >         u32 arch = 0;
> > >
> > > -       switch (par->Chipset & 0x0ff0) {
> > > +       switch (Chipset & 0x0ff0) {
> > >         case 0x0100:            /* GeForce 256 */
> > >         case 0x0110:            /* GeForce2 MX */
> > >         case 0x0150:            /* GeForce2 */
> > > @@ -1278,16 +1277,44 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > >         struct fb_info *info;
> > >         unsigned short cmd;
> > >         int ret;
> > > +       volatile u32 __iomem *REGS;
> > > +       int Chipset;
> > > +       u32 Architecture;
> > >
> > >         NVTRACE_ENTER();
> > >         assert(pd != NULL);
> > >
> > > +       if (pci_enable_device(pd)) {
> > > +               printk(KERN_ERR PFX "cannot enable PCI device\n");
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       /* enable IO and mem if not already done */
> > > +       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> > > +       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> > > +       pci_write_config_word(pd, PCI_COMMAND, cmd);
> > > +
> > > +       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
> > > +       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> > > +
> > > +       REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
> > > +       if (!REGS) {
> > > +               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       Chipset = nvidia_get_chipset(pd, REGS);
> > > +       Architecture = nvidia_get_arch(Chipset);
> > > +       if (Architecture == 0) {
> > > +               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> > > +               goto err_out;
> > > +       }
> > > +
> > >         ret = aperture_remove_conflicting_pci_devices(pd, "nvidiafb");
> > >         if (ret)
> > > -               return ret;
> > > +               goto err_out;
> > >
> > >         info = framebuffer_alloc(sizeof(struct nvidia_par), &pd->dev);
> > > -
> > >         if (!info)
> > >                 goto err_out;
> > >
> > > @@ -1298,11 +1325,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > >         if (info->pixmap.addr == NULL)
> > >                 goto err_out_kfree;
> > >
> > > -       if (pci_enable_device(pd)) {
> > > -               printk(KERN_ERR PFX "cannot enable PCI device\n");
> > > -               goto err_out_enable;
> > > -       }
> > > -
> > >         if (pci_request_regions(pd, "nvidiafb")) {
> > >                 printk(KERN_ERR PFX "cannot request PCI regions\n");
> > >                 goto err_out_enable;
> > > @@ -1318,34 +1340,17 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > >         par->paneltweak = paneltweak;
> > >         par->reverse_i2c = reverse_i2c;
> > >
> > > -       /* enable IO and mem if not already done */
> > > -       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> > > -       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> > > -       pci_write_config_word(pd, PCI_COMMAND, cmd);
> > > -
> > > -       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
> > >         nvidiafb_fix.smem_start = pci_resource_start(pd, 1);
> > > -       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> > > -
> > > -       par->REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
> > >
> > > -       if (!par->REGS) {
> > > -               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> > > -               goto err_out_free_base0;
> > > -       }
> > > +       par->REGS = REGS;
> > >
> > > -       par->Chipset = nvidia_get_chipset(info);
> > > -       par->Architecture = nvidia_get_arch(info);
> > > -
> > > -       if (par->Architecture == 0) {
> > > -               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> > > -               goto err_out_arch;
> > > -       }
> > > +       par->Chipset = Chipset;
> > > +       par->Architecture = Architecture;
> > >
> > >         sprintf(nvidiafb_fix.id, "NV%x", (pd->device & 0x0ff0) >> 4);
> > >
> > >         if (NVCommonSetup(info))
> > > -               goto err_out_arch;
> > > +               goto err_out_free_base0;
> > >
> > >         par->FbAddress = nvidiafb_fix.smem_start;
> > >         par->FbMapSize = par->RamAmountKBytes * 1024;
> > > @@ -1401,7 +1406,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > >                 goto err_out_iounmap_fb;
> > >         }
> > >
> > > -
> > >         printk(KERN_INFO PFX
> > >                "PCI nVidia %s framebuffer (%dMB @ 0x%lX)\n",
> > >                info->fix.id,
> > > @@ -1415,15 +1419,14 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > >  err_out_free_base1:
> > >         fb_destroy_modedb(info->monspecs.modedb);
> > >         nvidia_delete_i2c_busses(par);
> > > -err_out_arch:
> > > -       iounmap(par->REGS);
> > > - err_out_free_base0:
> > > +err_out_free_base0:
> > >         pci_release_regions(pd);
> > >  err_out_enable:
> > >         kfree(info->pixmap.addr);
> > >  err_out_kfree:
> > >         framebuffer_release(info);
> > >  err_out:
> > > +       iounmap(REGS);
> > >         return -ENODEV;
> > >  }
> > >
> > > --
> > > 2.38.1
> >
> > This patch fails for me.
>
> I've based the patch on 6.2-rc7, please make sure to not have the
> previous revert committed, this is to replace that patch.

Can you guide me through the steps please?

I done:

1. cd /usr/src/linux
2. sudo git pull
3. then I applied your patch.

Am I doing something wrong?

/usr/src/linux> cat .git/config
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        fetch = +refs/heads/*:refs/remotes/origin/*
        url = git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
[branch "master"]
        remote = origin
        merge = refs/heads/master
[remote "stable"]
        url = https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux-stable
        fetch = +refs/heads/*:refs/remotes/stable/*

I am pulling from the "master" branch.

Best
Zeno
