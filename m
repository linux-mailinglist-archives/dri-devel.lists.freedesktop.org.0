Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10B40F07E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 05:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325AF6EB41;
	Fri, 17 Sep 2021 03:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C176EB41
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 03:50:00 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 38E5A40262
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 03:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631850598;
 bh=o2WwArOaqXO510rowzIQD3yCaqD7PjB7l55ID7TA3xc=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=KC/wMMq6u4xVTIC9gWwtWw3qFPdmYtz6bE0+rjN44ZoRNnma/rFGmlEFwdE+tN1vu
 IomElIncX/Wfo9BttVhsPysERGTi6sgoRZDtDaVpIGx8+dP75WV+wrpa+oRoBKMiKQ
 lbtTSAJQ6UAwoWZtiXZ13JPJFNb8wCuGfQTgT/tGtEr/VcdBNmlzR1BCyjthRQZwcO
 G6LeIy+gbZXkWoNL88gMLndA2hHOm44Hc4VA/qdwEg6tPjrsqXtjcl3azNgtzmN5wO
 HRLszHr1z4BXuRjitmpzM7VQqcBb73I1tVFx06Z4miObasxZxclDOup3CXV58llczG
 w8nLNVLFHrU4w==
Received: by mail-oi1-f197.google.com with SMTP id
 n9-20020a0568080a0900b002689a4834e4so33202635oij.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2WwArOaqXO510rowzIQD3yCaqD7PjB7l55ID7TA3xc=;
 b=CzxNaqRqWIoe/mogaRjbGimt9Pb6i73ULQoZKL9aRdgCd1sldhY/9OeU1ZXddDA54D
 /umqwjBxd0jmZTIFFTfLbT6eh0eszs9aiwLVrWukryeI9Fc1xAq8qMxL6YE/46DHzZXq
 RJ3hGCQSWaTj/snjHIVaCjynDyHPxJGSR3uj5G8DbNW06cedBI9MFWP/YlmFHMwX6RSf
 OFfSoMLHaTQsC6T2CZ6PTYSYgKyQQ4XWbNi1Ly7zxsw06soj534ksjIhp5DfaJS5mDYz
 F+nSyodMJR57kQz2d4zYxZafpD6xPzbmFPx7+QQANkhc4mtheG1qG5azkzSHmoYgGzzV
 gGvA==
X-Gm-Message-State: AOAM530hCAAncIJpNvbEwzbmkLR89dYJhtJ2wPGWHWkOb/sd/IYVBHvs
 +8RkTAkWafrFQkcUv7tnXi8dJbomfC5LUwxADrs5AltMYbm/Q++rEEa7byOQQFd2Cq7Bpi8N/Dv
 wxtJL4+Y67lWpReGLDG635pSKIPSuf9QCZviixGSM/iKN0F6KNtNXPc0CIebGhQ==
X-Received: by 2002:a9d:1708:: with SMTP id i8mr37626ota.233.1631850596966;
 Thu, 16 Sep 2021 20:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw7/JqD91vFn6Wh+g3/wCVkduUO+JuLE1VRUyT5ut6P5TQKvgQDp/KcbJC9Gr75Lp89fxAxavZwAorE2CYMic=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr37613ota.233.1631850596710;
 Thu, 16 Sep 2021 20:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210519135723.525997-1-kai.heng.feng@canonical.com>
 <20210916163755.GA1620802@bjorn-Precision-5520>
In-Reply-To: <20210916163755.GA1620802@bjorn-Precision-5520>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 17 Sep 2021 11:49:45 +0800
Message-ID: <CAAd53p6XdeYcLNctghOi5VPy1YHEOaGoeo9Wc_T9P-RmYTJKzA@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Use ACPI HID name to find integrated GPU
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux PCI <linux-pci@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 17, 2021 at 12:38 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Huacai, linux-pci]
>
> On Wed, May 19, 2021 at 09:57:23PM +0800, Kai-Heng Feng wrote:
> > Commit 3d42f1ddc47a ("vgaarb: Keep adding VGA device in queue") assumes
> > the first device is an integrated GPU. However, on AMD platforms an
> > integrated GPU can have higher PCI device number than a discrete GPU.
> >
> > Integrated GPU on ACPI platform generally has _DOD and _DOS method, so
> > use that as predicate to find integrated GPU. If the new strategy
> > doesn't work, fallback to use the first device as boot VGA.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
> >       MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
> >  };
> >
> > +#if defined(CONFIG_ACPI)
> > +static bool vga_arb_integrated_gpu(struct device *dev)
> > +{
> > +     struct acpi_device *adev = ACPI_COMPANION(dev);
> > +
> > +     return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> > +}
> > +#else
> > +static bool vga_arb_integrated_gpu(struct device *dev)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> >  static void __init vga_arb_select_default_device(void)
> >  {
> > -     struct pci_dev *pdev;
> > +     struct pci_dev *pdev, *found = NULL;
> >       struct vga_device *vgadev;
> >
> >  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > @@ -1505,20 +1520,26 @@ static void __init vga_arb_select_default_device(void)
> >  #endif
> >
> >       if (!vga_default_device()) {
> > -             list_for_each_entry(vgadev, &vga_list, list) {
> > +             list_for_each_entry_reverse(vgadev, &vga_list, list) {
>
> Hi Kai-Heng, do you remember why you changed the order of this list
> traversal?

The descending order is to keep the original behavior.

Before this patch, it breaks out of the loop as early as possible, so
the lower numbered device is picked.
This patch makes it only break out of the loop when ACPI_VIDEO_HID
device is found.
So if there are more than one device that meet "cmd & (PCI_COMMAND_IO
| PCI_COMMAND_MEMORY)", higher numbered device will be selected.
So the traverse order reversal is to keep the original behavior.

>
> I guess the list_add_tail() in vga_arbiter_add_pci_device() means
> vga_list is generally ordered with small device numbers first and
> large ones last.
>
> So you pick the integrated GPU with the largest device number.  Are
> there systems with more than one integrated GPU?  If so, I would
> naively expect that in the absence of an indication otherwise, we'd
> want the one with the *smallest* device number.

There's only one integrated GPU on the affected system.

The approach is to keep the list traversal in one pass.
Is there any regression introduce by this patch?
If that's the case, we can separate the logic and find the
ACPI_VIDEO_HID in second pass.

Kai-Heng

>
> >                       struct device *dev = &vgadev->pdev->dev;
> >                       u16 cmd;
> >
> >                       pdev = vgadev->pdev;
> >                       pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> >                       if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
> > -                             vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
> > -                             vga_set_default_device(pdev);
> > -                             break;
> > +                             found = pdev;
> > +                             if (vga_arb_integrated_gpu(dev))
> > +                                     break;
> >                       }
> >               }
> >       }
> >
> > +     if (found) {
> > +             vgaarb_info(&found->dev, "setting as boot device (VGA legacy resources not available)\n");
> > +             vga_set_default_device(found);
> > +             return;
> > +     }
> > +
> >       if (!vga_default_device()) {
> >               vgadev = list_first_entry_or_null(&vga_list,
> >                                                 struct vga_device, list);
> > --
> > 2.31.1
> >
