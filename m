Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0E38B66C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 20:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BE46F4CB;
	Thu, 20 May 2021 18:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0256F4CB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 18:59:03 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so15789201otp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 11:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMH8paZbMD/P3ANx+uV5my+Ut2BSGoI4lUNA1erm+40=;
 b=T1aocE9MmvdWLUTaZX6Zr03oC0SnhF99GgdanDIQcQ2BoHY7TNcf1ztGejIuvd/Xge
 81LWz80/BdSIG2u3oe3RYIekh2zVOJr0aVO4TxPkAFSeqAe/Ecz9G9BWO++OT8KeneR4
 +sFSp8yN7i9tY99RtrYp4cvEs83t7nInX5ar/B37tJv71roa4kq+/PJ/CC2R6CqCjyRH
 QCaOtVJwhZM0lrjYN7aPJu7WuOZ4tcgL9QvZyMlNMqUHW0k+iQw7YGxNvDuKlhaWBUzj
 LonciF/gFSzqaxP1uCErmbuugXEwUoxGzGqfqCu5rVRPf/0LIXEFEKHX8RFWpT8TFG7u
 WidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMH8paZbMD/P3ANx+uV5my+Ut2BSGoI4lUNA1erm+40=;
 b=Tjrsxw6mHs/T/6Sj8sNeV/HjyMSWVEIpDeDnyb4tSL+VQmRzHgH8CBfCFbNN7sGAja
 apggdOoNyorQKt2NO+B2QmnJrCMrDz7A2o56AYt9+MK+/morZjIOsWaUP9PjheRKzREq
 2nY6M/SiIwiThgbgMqI8vsr2un2LCtJ8IIursURzGnjBxGzKUFkrAoGZdpZiBc3Wytov
 k0iaJspvJ08EsAHpWyFNyhLVGaKAnex0GzC85YH2uFc3AazuMFhzg9WX+JrFY7apbRpR
 F+w4nP/4SzPoPrm70Nd5s6oSd56EVMZwPS+aIEBrY6HhAe4/4q0Mz52gZEuDdDaijYJ5
 tDWg==
X-Gm-Message-State: AOAM532fMEUj9b4T/pu+CPsm14DmF1DI/5AwAO9CHJUJZT7rpzZNx9bu
 zzKk2QA1sBQBCA2z2uP4bDX4fXPyGTMcitdmEOw=
X-Google-Smtp-Source: ABdhPJxQZSpurrf2XJVUawSq+g2mvlD6Jo293mjKCpffeEmhs06EEyovileXa+/XFpIcY1c1/P/P+3be5i8vSQcHGkY=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5080330otl.132.1621537143037; 
 Thu, 20 May 2021 11:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210519135723.525997-1-kai.heng.feng@canonical.com>
 <CADnq5_OstgUmLxa4DU2s19m5E1zScKY0Pe=644BvBTp=LAPvJg@mail.gmail.com>
In-Reply-To: <CADnq5_OstgUmLxa4DU2s19m5E1zScKY0Pe=644BvBTp=LAPvJg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 14:58:52 -0400
Message-ID: <CADnq5_MdCHrCKV6sjSwbknscDh1pUm-OMzxmFSwhnnDpZcTeUw@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Use ACPI HID name to find integrated GPU
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next.  Thanks!

Alex

On Wed, May 19, 2021 at 12:45 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, May 19, 2021 at 9:57 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > Commit 3d42f1ddc47a ("vgaarb: Keep adding VGA device in queue") assumes
> > the first device is an integrated GPU. However, on AMD platforms an
> > integrated GPU can have higher PCI device number than a discrete GPU.
> >
> > Integrated GPU on ACPI platform generally has _DOD and _DOS method, so
> > use that as predicate to find integrated GPU. If the new strategy
> > doesn't work, fallback to use the first device as boot VGA.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> Unless there are any other comments, I'll apply it tomorrow.
>
> Alex
>
> > ---
> >  drivers/gpu/vga/vgaarb.c | 31 ++++++++++++++++++++++++++-----
> >  1 file changed, 26 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> > index 5180c5687ee5..949fde433ea2 100644
> > --- a/drivers/gpu/vga/vgaarb.c
> > +++ b/drivers/gpu/vga/vgaarb.c
> > @@ -50,6 +50,7 @@
> >  #include <linux/screen_info.h>
> >  #include <linux/vt.h>
> >  #include <linux/console.h>
> > +#include <linux/acpi.h>
> >
> >  #include <linux/uaccess.h>
> >
> > @@ -1450,9 +1451,23 @@ static struct miscdevice vga_arb_device = {
> >         MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
> >  };
> >
> > +#if defined(CONFIG_ACPI)
> > +static bool vga_arb_integrated_gpu(struct device *dev)
> > +{
> > +       struct acpi_device *adev = ACPI_COMPANION(dev);
> > +
> > +       return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> > +}
> > +#else
> > +static bool vga_arb_integrated_gpu(struct device *dev)
> > +{
> > +       return false;
> > +}
> > +#endif
> > +
> >  static void __init vga_arb_select_default_device(void)
> >  {
> > -       struct pci_dev *pdev;
> > +       struct pci_dev *pdev, *found = NULL;
> >         struct vga_device *vgadev;
> >
> >  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > @@ -1505,20 +1520,26 @@ static void __init vga_arb_select_default_device(void)
> >  #endif
> >
> >         if (!vga_default_device()) {
> > -               list_for_each_entry(vgadev, &vga_list, list) {
> > +               list_for_each_entry_reverse(vgadev, &vga_list, list) {
> >                         struct device *dev = &vgadev->pdev->dev;
> >                         u16 cmd;
> >
> >                         pdev = vgadev->pdev;
> >                         pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> >                         if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
> > -                               vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
> > -                               vga_set_default_device(pdev);
> > -                               break;
> > +                               found = pdev;
> > +                               if (vga_arb_integrated_gpu(dev))
> > +                                       break;
> >                         }
> >                 }
> >         }
> >
> > +       if (found) {
> > +               vgaarb_info(&found->dev, "setting as boot device (VGA legacy resources not available)\n");
> > +               vga_set_default_device(found);
> > +               return;
> > +       }
> > +
> >         if (!vga_default_device()) {
> >                 vgadev = list_first_entry_or_null(&vga_list,
> >                                                   struct vga_device, list);
> > --
> > 2.31.1
> >
