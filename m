Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C768B84D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9510E2E3;
	Mon,  6 Feb 2023 09:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D7010E324
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 08:38:10 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z11so10837380ede.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 00:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DWfHL0H4RcGc/9vwZFDc3pqRoIpAUQtt5uy5sPb3mDw=;
 b=DnRIKTlE62K58fmrH1s6BsP0H0kJ5mFYpenpK3aZ57FGsR7XJTDSFgrRS/ntpgsoyQ
 eR7Y0YDb/L752cOfHPabI1FWqqGHRFCyq38CNdJxCjp57dGYEyyfJ1g4IUyuxv5HZOB7
 kmjbRdzUtWTicncNmVV07sQFKl3rLSqOkE4RRe8H23Y0O3DqQhq/Rwud4cKShp0mLfJ4
 GF+l/fq5m1/jl6zGRE1lIPiPLnL3qC/gmoqZMKemBF/HkRDE7RRtUXjdM8XmE+a5N4tD
 1NiNWwcY6FNu8ebG+r3pIxwX36MrwHIl04YiydYhyiF4wwHIban0ZbwL9U8Iao1s92GU
 99dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DWfHL0H4RcGc/9vwZFDc3pqRoIpAUQtt5uy5sPb3mDw=;
 b=L1bXGSdt3HYxSbQ2NCFtIPzc2DlytIjInJE/qL1uePg8P43u/ZYKgSCabMytXSjeh+
 J1/NCAw3GE2Bzp/VGaQGz8K+fgsgtQ7knDPXYvdt8OlnJObixsoqeqFqchdANHjfV720
 IH7q5qtk2hG0huWjdNaTef0p8y9od/AgugbKUG7LZ9bNOe1lCPz/tUqt5WYWZu6Ga5yh
 HVNcqRCj7rhXupXfeMD8dS8lZZmf0dVGps7NtDbOrPXTPA8KiGgbQQGxfOeyD+JxT92i
 VAIX7YSwOZvAw3eM+NlDW5wT3uS0h/j+Sij04xI0YujvkrHKlcyYav5VSjuks8hG//rN
 jOnw==
X-Gm-Message-State: AO0yUKVHDyoQowSYO1X+YgYOlDgncgoeS2t7lH3RGijY2ot2QLeXNTcN
 lX2TqBsUVvw24/ng80BbmgucuCbdbmWkr9Hpac0=
X-Google-Smtp-Source: AK7set8tTfKfH+/2a9vka/r/NJsmTdNVUW1FPAzY3/4oY2J+N/iK41rmYLXwp865+kvJXM3KnAvGEZwx3tku0o8y2Gc=
X-Received: by 2002:a50:935a:0:b0:4aa:a503:7354 with SMTP id
 n26-20020a50935a000000b004aaa5037354mr1591526eda.49.1675672688930; Mon, 06
 Feb 2023 00:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20230205210751.3842103-1-airlied@gmail.com>
 <CAOkhzLWSJsDK9Gm-AzeUw7fCpkjDg7d9GuDWyF-6hDr5UZ4DZg@mail.gmail.com>
 <CAPM=9tyaCUmA2bNP1YA1B=cFZP=nKPhQoWR7UwBD2Nfj8ZTODA@mail.gmail.com>
 <CAOkhzLVLbOEp4QnJynxV3cgiqOV5Rm=+dMgexiRmyDs-bRCTPg@mail.gmail.com>
 <CAPM=9tx0D54oQ6QmjF_NxnBBxbLzhXxi5uH2p6fLWfg2L3xPFw@mail.gmail.com>
In-Reply-To: <CAPM=9tx0D54oQ6QmjF_NxnBBxbLzhXxi5uH2p6fLWfg2L3xPFw@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Mon, 6 Feb 2023 09:37:57 +0100
Message-ID: <CAOkhzLUspmZjC0x6nJoHyc9nijqZu7BOWc8vsqHSRbQhVzd=Gw@mail.gmail.com>
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

On Mon, Feb 6, 2023 at 9:10 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 6 Feb 2023 at 18:01, Zeno Davatz <zdavatz@gmail.com> wrote:
> >
> > Dear Dave
> >
> > On Mon, Feb 6, 2023 at 8:54 AM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > On Mon, 6 Feb 2023 at 17:52, Zeno Davatz <zdavatz@gmail.com> wrote:
> > > >
> > > > Dear Dave
> > > >
> > > > Thank you for your patch.
> > > >
> > > > On Sun, Feb 5, 2023 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
> > > > >
> > > > > From: Dave Airlie <airlied@redhat.com>
> > > > >
> > > > > This driver removed the console, but hasn't yet decided if it could
> > > > > take over the console yet. Instead of doing that, probe the hw for
> > > > > support and then remove the console afterwards.
> > > > >
> > > > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > > > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > > > > Reported-by: Zeno Davatz <zdavatz@gmail.com>
> > > > > ---
> > > > >  drivers/video/fbdev/nvidia/nvidia.c | 81 +++++++++++++++--------------
> > > > >  1 file changed, 42 insertions(+), 39 deletions(-)
> > > > >
> > > > > diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> > > > > index 1960916098d4..e60a276b4855 100644
> > > > > --- a/drivers/video/fbdev/nvidia/nvidia.c
> > > > > +++ b/drivers/video/fbdev/nvidia/nvidia.c
> > > > > @@ -1197,17 +1197,17 @@ static int nvidia_set_fbinfo(struct fb_info *info)
> > > > >         return nvidiafb_check_var(&info->var, info);
> > > > >  }
> > > > >
> > > > > -static u32 nvidia_get_chipset(struct fb_info *info)
> > > > > +static u32 nvidia_get_chipset(struct pci_dev *pci_dev,
> > > > > +                             volatile u32 __iomem *REGS)
> > > > >  {
> > > > > -       struct nvidia_par *par = info->par;
> > > > > -       u32 id = (par->pci_dev->vendor << 16) | par->pci_dev->device;
> > > > > +       u32 id = (pci_dev->vendor << 16) | pci_dev->device;
> > > > >
> > > > >         printk(KERN_INFO PFX "Device ID: %x \n", id);
> > > > >
> > > > >         if ((id & 0xfff0) == 0x00f0 ||
> > > > >             (id & 0xfff0) == 0x02e0) {
> > > > >                 /* pci-e */
> > > > > -               id = NV_RD32(par->REGS, 0x1800);
> > > > > +               id = NV_RD32(REGS, 0x1800);
> > > > >
> > > > >                 if ((id & 0x0000ffff) == 0x000010DE)
> > > > >                         id = 0x10DE0000 | (id >> 16);
> > > > > @@ -1220,12 +1220,11 @@ static u32 nvidia_get_chipset(struct fb_info *info)
> > > > >         return id;
> > > > >  }
> > > > >
> > > > > -static u32 nvidia_get_arch(struct fb_info *info)
> > > > > +static u32 nvidia_get_arch(u32 Chipset)
> > > > >  {
> > > > > -       struct nvidia_par *par = info->par;
> > > > >         u32 arch = 0;
> > > > >
> > > > > -       switch (par->Chipset & 0x0ff0) {
> > > > > +       switch (Chipset & 0x0ff0) {
> > > > >         case 0x0100:            /* GeForce 256 */
> > > > >         case 0x0110:            /* GeForce2 MX */
> > > > >         case 0x0150:            /* GeForce2 */
> > > > > @@ -1278,16 +1277,44 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > >         struct fb_info *info;
> > > > >         unsigned short cmd;
> > > > >         int ret;
> > > > > +       volatile u32 __iomem *REGS;
> > > > > +       int Chipset;
> > > > > +       u32 Architecture;
> > > > >
> > > > >         NVTRACE_ENTER();
> > > > >         assert(pd != NULL);
> > > > >
> > > > > +       if (pci_enable_device(pd)) {
> > > > > +               printk(KERN_ERR PFX "cannot enable PCI device\n");
> > > > > +               return -ENODEV;
> > > > > +       }
> > > > > +
> > > > > +       /* enable IO and mem if not already done */
> > > > > +       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> > > > > +       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> > > > > +       pci_write_config_word(pd, PCI_COMMAND, cmd);
> > > > > +
> > > > > +       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
> > > > > +       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> > > > > +
> > > > > +       REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
> > > > > +       if (!REGS) {
> > > > > +               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> > > > > +               return -ENODEV;
> > > > > +       }
> > > > > +
> > > > > +       Chipset = nvidia_get_chipset(pd, REGS);
> > > > > +       Architecture = nvidia_get_arch(Chipset);
> > > > > +       if (Architecture == 0) {
> > > > > +               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> > > > > +               goto err_out;
> > > > > +       }
> > > > > +
> > > > >         ret = aperture_remove_conflicting_pci_devices(pd, "nvidiafb");
> > > > >         if (ret)
> > > > > -               return ret;
> > > > > +               goto err_out;
> > > > >
> > > > >         info = framebuffer_alloc(sizeof(struct nvidia_par), &pd->dev);
> > > > > -
> > > > >         if (!info)
> > > > >                 goto err_out;
> > > > >
> > > > > @@ -1298,11 +1325,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > >         if (info->pixmap.addr == NULL)
> > > > >                 goto err_out_kfree;
> > > > >
> > > > > -       if (pci_enable_device(pd)) {
> > > > > -               printk(KERN_ERR PFX "cannot enable PCI device\n");
> > > > > -               goto err_out_enable;
> > > > > -       }
> > > > > -
> > > > >         if (pci_request_regions(pd, "nvidiafb")) {
> > > > >                 printk(KERN_ERR PFX "cannot request PCI regions\n");
> > > > >                 goto err_out_enable;
> > > > > @@ -1318,34 +1340,17 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > >         par->paneltweak = paneltweak;
> > > > >         par->reverse_i2c = reverse_i2c;
> > > > >
> > > > > -       /* enable IO and mem if not already done */
> > > > > -       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> > > > > -       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> > > > > -       pci_write_config_word(pd, PCI_COMMAND, cmd);
> > > > > -
> > > > > -       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
> > > > >         nvidiafb_fix.smem_start = pci_resource_start(pd, 1);
> > > > > -       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> > > > > -
> > > > > -       par->REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
> > > > >
> > > > > -       if (!par->REGS) {
> > > > > -               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> > > > > -               goto err_out_free_base0;
> > > > > -       }
> > > > > +       par->REGS = REGS;
> > > > >
> > > > > -       par->Chipset = nvidia_get_chipset(info);
> > > > > -       par->Architecture = nvidia_get_arch(info);
> > > > > -
> > > > > -       if (par->Architecture == 0) {
> > > > > -               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> > > > > -               goto err_out_arch;
> > > > > -       }
> > > > > +       par->Chipset = Chipset;
> > > > > +       par->Architecture = Architecture;
> > > > >
> > > > >         sprintf(nvidiafb_fix.id, "NV%x", (pd->device & 0x0ff0) >> 4);
> > > > >
> > > > >         if (NVCommonSetup(info))
> > > > > -               goto err_out_arch;
> > > > > +               goto err_out_free_base0;
> > > > >
> > > > >         par->FbAddress = nvidiafb_fix.smem_start;
> > > > >         par->FbMapSize = par->RamAmountKBytes * 1024;
> > > > > @@ -1401,7 +1406,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > >                 goto err_out_iounmap_fb;
> > > > >         }
> > > > >
> > > > > -
> > > > >         printk(KERN_INFO PFX
> > > > >                "PCI nVidia %s framebuffer (%dMB @ 0x%lX)\n",
> > > > >                info->fix.id,
> > > > > @@ -1415,15 +1419,14 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
> > > > >  err_out_free_base1:
> > > > >         fb_destroy_modedb(info->monspecs.modedb);
> > > > >         nvidia_delete_i2c_busses(par);
> > > > > -err_out_arch:
> > > > > -       iounmap(par->REGS);
> > > > > - err_out_free_base0:
> > > > > +err_out_free_base0:
> > > > >         pci_release_regions(pd);
> > > > >  err_out_enable:
> > > > >         kfree(info->pixmap.addr);
> > > > >  err_out_kfree:
> > > > >         framebuffer_release(info);
> > > > >  err_out:
> > > > > +       iounmap(REGS);
> > > > >         return -ENODEV;
> > > > >  }
> > > > >
> > > > > --
> > > > > 2.38.1
> > > >
> > > > This patch fails for me.
> > >
> > > I've based the patch on 6.2-rc7, please make sure to not have the
> > > previous revert committed, this is to replace that patch.
> >
> > Can you guide me through the steps please?
> >
> > I done:
> >
> > 1. cd /usr/src/linux
> > 2. sudo git pull
> > 3. then I applied your patch.
> >
> > Am I doing something wrong?
>
> What is your top of tree commit? (git log)
>
> have you got any commits on top?
>
> git reset --hard origin/master should reset your tree to Linus top.

1. git log shows "d2d11f342b179f1894a901f143ec7c008caba43e"
2. No, no patches on top.
3. I am doing the following steps:
/usr/src/linux> sudo git reset --hard origin/master
Passwort:
HEAD ist jetzt bei d2d11f342b17 Merge branch 'fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
/usr/src/linux> sudo patch -p1 < /tmp/patch
patching file drivers/video/fbdev/nvidia/nvidia.c
Hunk #1 FAILED at 1197.
Hunk #2 FAILED at 1220.
Hunk #3 FAILED at 1278.
Hunk #4 FAILED at 1298.
Hunk #5 FAILED at 1318.
Hunk #6 FAILED at 1401.
Hunk #7 FAILED at 1415.
7 out of 7 hunks FAILED -- saving rejects to file
drivers/video/fbdev/nvidia/nvidia.c.rej

Best
Zeno
