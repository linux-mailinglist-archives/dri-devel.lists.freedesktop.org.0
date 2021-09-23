Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4FB4155E4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 05:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BD76ECAA;
	Thu, 23 Sep 2021 03:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB556ECAA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 03:20:35 +0000 (UTC)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7E7EB3F22C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 03:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632367233;
 bh=+y78UmABh7HK9tr/4S4sGTCsj4Mr5ovgzCxdWvhQlG4=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=uNh29KRnZbR8/SoCvkGLKHhi21F46gzpXddgQxLgNCgULNmoyDkZf+eDMDWgsn0bD
 Qle+q3LTLuci42Bf+CLTCIsExq9sYVuMIO4nlq42XJvTXKkbDfniIZ05BpyiGtwLE/
 mlQo6sRqbJXnCWhfxR3I7HMSwO/YaBp6Eefpsg7r+5TRtRnZba1dRns34iCvVg4e0r
 fI7MmQJ7pcdTyItQJdpOKCDI+h9nZSqTEx7HjfAYr/Oih/hdXw8wgwZRUZvHdiY2T6
 EKZg7cCaLgQE0OPFM16ApS4s6WgynHyyD4dbuy2K4ZVmCHTx5/b9NO2/P6B3nJiaQ7
 pdolEWpvn5SSg==
Received: by mail-oo1-f69.google.com with SMTP id
 68-20020a4a0d47000000b0028fe7302d04so3033733oob.8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 20:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+y78UmABh7HK9tr/4S4sGTCsj4Mr5ovgzCxdWvhQlG4=;
 b=p1Xa3dVGfWE7QSnU5SKW+Jj3sDndPXyrIJ9rcYnpTKbdXdOqtS8y/SRWAiwUwiiQoi
 9kLmSDxIOKucG+DavnQiNF5p8fIOWlLJb8s7WmsSYEE80HmsFGwpbId2HCDYna+DzDfb
 dy1u9mIRDsLz3zBINlAf9LPtKppjN+wpVVnWUSzsVSlZx6t5s7LgB+oJWBfboi9vGJ7Y
 Lr/MoNAGMMFjy9Hd+zFVpOHLGIc5bgWzvqnkDMoSRHIbU/to39WpDHRvDsmScsDxVXqJ
 IBP8SiDxqpoN5MmqPUMKUFp9CNEDUJEkHnjoiv+bHsIkg5rasuaz5JpMd9o9r8MpSL3H
 /BSg==
X-Gm-Message-State: AOAM531sB1FUUXYWDGV3tw14w3EDpMYoGTXsZvKOaHoeby6v5HWsO48C
 /YcOvp3uVGXMaJzeAmWjLzLDo+LCgyE384pN/j7n/blYQMcZsQVF8aqVXBMRiIF0MkK4iW7+xTW
 MwUuVtger3gPziKkC7tryh/FA9B+DX8P6JfnjDjQYTovm2FkrnHHGX7Uf4jvCpw==
X-Received: by 2002:aca:2102:: with SMTP id 2mr10887120oiz.98.1632367232283;
 Wed, 22 Sep 2021 20:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo/AOHrlw7eOB4SMFrUrqCF4z6yGeBZyQ9DCJWkuum5LRKyrbRQIRZgx6p+VovUjqHalCZTcYbTL6gqQfhfKI=
X-Received: by 2002:aca:2102:: with SMTP id 2mr10887103oiz.98.1632367231968;
 Wed, 22 Sep 2021 20:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd53p6XdeYcLNctghOi5VPy1YHEOaGoeo9Wc_T9P-RmYTJKzA@mail.gmail.com>
 <20210917165500.GA1723244@bjorn-Precision-5520>
In-Reply-To: <20210917165500.GA1723244@bjorn-Precision-5520>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 23 Sep 2021 11:20:20 +0800
Message-ID: <CAAd53p4raiRuWQ3O9VFpxhtro4YJ-E2sUiDrnFnNEMDyxXDK=w@mail.gmail.com>
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

On Sat, Sep 18, 2021 at 12:55 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Sep 17, 2021 at 11:49:45AM +0800, Kai-Heng Feng wrote:
> > On Fri, Sep 17, 2021 at 12:38 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > [+cc Huacai, linux-pci]
> > >
> > > On Wed, May 19, 2021 at 09:57:23PM +0800, Kai-Heng Feng wrote:
> > > > Commit 3d42f1ddc47a ("vgaarb: Keep adding VGA device in queue") assumes
> > > > the first device is an integrated GPU. However, on AMD platforms an
> > > > integrated GPU can have higher PCI device number than a discrete GPU.
> > > >
> > > > Integrated GPU on ACPI platform generally has _DOD and _DOS method, so
> > > > use that as predicate to find integrated GPU. If the new strategy
> > > > doesn't work, fallback to use the first device as boot VGA.
> > > >
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > ---
> > > >  drivers/gpu/vga/vgaarb.c | 31 ++++++++++++++++++++++++++-----
> > > >  1 file changed, 26 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> > > > index 5180c5687ee5..949fde433ea2 100644
> > > > --- a/drivers/gpu/vga/vgaarb.c
> > > > +++ b/drivers/gpu/vga/vgaarb.c
> > > > @@ -50,6 +50,7 @@
> > > >  #include <linux/screen_info.h>
> > > >  #include <linux/vt.h>
> > > >  #include <linux/console.h>
> > > > +#include <linux/acpi.h>
> > > >
> > > >  #include <linux/uaccess.h>
> > > >
> > > > @@ -1450,9 +1451,23 @@ static struct miscdevice vga_arb_device = {
> > > >       MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
> > > >  };
> > > >
> > > > +#if defined(CONFIG_ACPI)
> > > > +static bool vga_arb_integrated_gpu(struct device *dev)
> > > > +{
> > > > +     struct acpi_device *adev = ACPI_COMPANION(dev);
> > > > +
> > > > +     return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> > > > +}
> > > > +#else
> > > > +static bool vga_arb_integrated_gpu(struct device *dev)
> > > > +{
> > > > +     return false;
> > > > +}
> > > > +#endif
> > > > +
> > > >  static void __init vga_arb_select_default_device(void)
> > > >  {
> > > > -     struct pci_dev *pdev;
> > > > +     struct pci_dev *pdev, *found = NULL;
> > > >       struct vga_device *vgadev;
> > > >
> > > >  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > > > @@ -1505,20 +1520,26 @@ static void __init vga_arb_select_default_device(void)
> > > >  #endif
> > > >
> > > >       if (!vga_default_device()) {
> > > > -             list_for_each_entry(vgadev, &vga_list, list) {
> > > > +             list_for_each_entry_reverse(vgadev, &vga_list, list) {
> > >
> > > Hi Kai-Heng, do you remember why you changed the order of this list
> > > traversal?
> >
> > The descending order is to keep the original behavior.
> >
> > Before this patch, it breaks out of the loop as early as possible, so
> > the lower numbered device is picked.
> > This patch makes it only break out of the loop when ACPI_VIDEO_HID
> > device is found.
> > So if there are more than one device that meet "cmd & (PCI_COMMAND_IO
> > | PCI_COMMAND_MEMORY)", higher numbered device will be selected.
> > So the traverse order reversal is to keep the original behavior.
>
> Can you give an example of what you mean?  I don't quite follow how it
> keeps the original behavior.
>
> If we have this:
>
>   0  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID
>   1  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID
>
> Previously we didn't look for ACPI_VIDEO_HID, so we chose 0, now we
> choose 1, which seems wrong.  In the absence of other information, I
> would prefer the lower-numbered device.
>
> Or this:
>
>   0  PCI_COMMAND_MEMORY set
>   1  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID
>
> Previously we chose 0; now we choose 1, which does seem right, but
> we'd choose 1 regardless of the order.
>
> Or this:
>
>   0  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID
>   1  PCI_COMMAND_MEMORY set
>
> Previously we chose 0, now we still choose 0, which seems right but
> again doesn't depend on the order.
>
> The first case, where both devices are ACPI_VIDEO_HID, is the only one
> where the order matters, and I suggest that we should be using the
> original order, not the reversed order.

Consider this:
0  PCI_COMMAND_MEMORY set
1  PCI_COMMAND_MEMORY set

Originally device 0 will be picked. If the traverse order is kept,
device 1 will be selected instead, because none of them pass
vga_arb_integrated_gpu().

Kai-Heng

>
> > > I guess the list_add_tail() in vga_arbiter_add_pci_device() means
> > > vga_list is generally ordered with small device numbers first and
> > > large ones last.
> > >
> > > So you pick the integrated GPU with the largest device number.  Are
> > > there systems with more than one integrated GPU?  If so, I would
> > > naively expect that in the absence of an indication otherwise, we'd
> > > want the one with the *smallest* device number.
> >
> > There's only one integrated GPU on the affected system.
> >
> > The approach is to keep the list traversal in one pass.
> > Is there any regression introduce by this patch?
> > If that's the case, we can separate the logic and find the
> > ACPI_VIDEO_HID in second pass.
>
> No regression, I'm just looking at Huacai's VGA patches, which affect
> this area.
