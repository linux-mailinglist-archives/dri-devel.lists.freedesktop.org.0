Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF74C4A3F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5162610E3D1;
	Fri, 25 Feb 2022 16:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4312A10E3D1;
 Fri, 25 Feb 2022 16:13:58 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id 12so7901370oix.12;
 Fri, 25 Feb 2022 08:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uCHRnXL4mKn+6E5duIIhmS6dWA7zitZos+dayOXocss=;
 b=S3xzZ2wu0aDRY6jiUq3aQZLTl1ZPMRPGsn8JyzoJPpbsVYqUKBH/CCh4T10JldqDKe
 Y4cXW3IHkYtNO0ncBeau2TBq+l9aSdWTuWKwepu43ms4v0UMbrXWCriIoAFLFvTvmjEh
 +/770KIESfIKDVeHs/n0owPxGSpb4lApAIGm6/ZGpQsltz2HPhG2OPFe44OSG3IJFQC/
 ivU5q9VSwtRyCGXFfbXB1oYkqv9jPpqzOstobW3Z2O+0jjbUYA/ys9CKeQ8xFrONWvUG
 pTYuv5UBhAw1dqLycQXV+ocRM7nTMtl0qerhcSbM/Z2xRxk16PWyu5umKwGz/lANzIcQ
 pIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uCHRnXL4mKn+6E5duIIhmS6dWA7zitZos+dayOXocss=;
 b=bINkpjZTGywOdDNuQV+Iv3S6j6SdSlXYnV2OQ9q7ZttAaf47LMoYdEeTHuA3XjNpVm
 CFhYv82OyUhqjQoeHKfpgEyjxQPauJS0xInBddE6leYRBI2K+qAYIb3FzbO2VadrYBL9
 MJ3dIONbbpGVD2hBXMo3Zg6y7dsiqIlVMGdbbVafDb0QVCrM0A/Of8Borc/CWQ0+tMAP
 zgeErqOFaZhrGY6UlzdrqFbaf5jcQExxbUycCq+crCV6ne/OLtiRZNKkZw5POzBjL6Ph
 dQV3L3a0eoVCYsn3b9tm76POl4bsbQqf4F+D6yn+671tH9Wv++jI2xEozVVOnzt0H3pm
 Tk5w==
X-Gm-Message-State: AOAM533hSIC4i3u3YyrkEMpfGGvH76LTAsm9hcAvEOdE2L6gSgB7iVwQ
 PedyBMvxiONKN395E558EeB/Q3dJdrcx4DOumRI=
X-Google-Smtp-Source: ABdhPJwC+u1A6lmB7w4Qa6qwmF6pQMGUN+HIW84cdgjX/rDWEnFjdpliXt2qnrq9vZGGa/EuxEZUepTh9GVIquBzdzM=
X-Received: by 2002:a05:6808:118d:b0:2d4:be7e:6748 with SMTP id
 j13-20020a056808118d00b002d4be7e6748mr1963019oil.123.1645805637487; Fri, 25
 Feb 2022 08:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20220224215116.7138-4-mario.limonciello@amd.com>
 <20220225012346.GA317859@bhelgaas>
In-Reply-To: <20220225012346.GA317859@bhelgaas>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Feb 2022 11:13:46 -0500
Message-ID: <CADnq5_OA5O=5QLG9B6dgU_qfSJUc7eGDdn0TD5ZTL04EDNfyrQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 8:23 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Feb 24, 2022 at 03:51:12PM -0600, Mario Limonciello wrote:
> > The `is_thunderbolt` attribute originally had a well defined list of
> > quirks that it existed for, but it has been overloaded with more
> > meaning.
> >
> > Instead use the driver core removable attribute to indicate the
> > detail a device is attached to a thunderbolt or USB4 chain.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >  drivers/pci/probe.c               | 2 +-
> >  drivers/platform/x86/apple-gmux.c | 2 +-
> >  include/linux/pci.h               | 5 ++---
> >  3 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 17a969942d37..1b752d425c47 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -1584,7 +1584,7 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
> >       /* Is the device part of a Thunderbolt controller? */
> >       vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
> >       if (vsec)
> > -             dev->is_thunderbolt = 1;
> > +             dev->external_facing = true;
>
> I assume there's a spec for the PCI_VSEC_ID_INTEL_TBT Capability.  Is
> that public?  Does the spec say that a device with that capability
> must be external-facing?
>
> Even if it's not public, I think a citation (name, revision, section)
> would be useful.
>
> >  }
> >
> >  static void set_pcie_untrusted(struct pci_dev *dev)
> > diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> > index 57553f9b4d1d..4444da0c39b0 100644
> > --- a/drivers/platform/x86/apple-gmux.c
> > +++ b/drivers/platform/x86/apple-gmux.c
> > @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
> >
> >  static int is_thunderbolt(struct device *dev, void *data)
> >  {
> > -     return to_pci_dev(dev)->is_thunderbolt;
> > +     return to_pci_dev(dev)->external_facing;
>
> This looks ... sort of weird.  I don't know anything about
> apple-gmux.c, so I guess I don't care, but assuming any
> external-facing device must be a Thunderbolt device seems like a
> stretch.
>
> Ugh.  This is used via "bus_for_each_dev(&pci_bus_type)", which means
> it's not hotplug-safe.  I'm sure we "know" implicitly that hotplug
> isn't an issue in apple-gmux, but it's better not to have examples
> that get copied to places where it *is* an issue.
>
> >  }
> >
> >  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 1e5b769e42fc..d9719eb14654 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -442,7 +442,6 @@ struct pci_dev {
> >       unsigned int    is_virtfn:1;
> >       unsigned int    is_hotplug_bridge:1;
> >       unsigned int    shpc_managed:1;         /* SHPC owned by shpchp */
> > -     unsigned int    is_thunderbolt:1;       /* Thunderbolt controller */
> >       unsigned int    no_cmd_complete:1;      /* Lies about command completed events */
> >
> >       /*
> > @@ -2447,11 +2446,11 @@ static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
> >  {
> >       struct pci_dev *parent = pdev;
> >
> > -     if (pdev->is_thunderbolt)
> > +     if (dev_is_removable(&pdev->dev))
> >               return true;
> >
> >       while ((parent = pci_upstream_bridge(parent)))
> > -             if (parent->is_thunderbolt)
> > +             if (dev_is_removable(&parent->dev))
> >                       return true;
>
> I don't get this.  Plain old PCI devices can be removable, too.
>
> pci_is_thunderbolt_attached() is only used by GPU drivers.  What
> property of Thunderbolt do they care about?
>
> nouveau_vga_init() and radeon_device_init() use it to decide to
> register with vga_switcheroo.  So maybe that's something to do with
> removability?  Of course, that's not specific to Thunderbolt, because
> garden-variety PCIe devices are removable.
>
> amdgpu_driver_load_kms() and radeon_driver_load_kms() apparently use
> it for something related to power control.  I don't know what the
> Thunderbolt connection is.

For GPU drivers, we need to determine which dGPU on the system has
d3cold control via ACPI and which GPU would use a mux for display
switching between the iGPU and the dGPU for hybrid graphics platforms
(e.g., iGPU + dGPU built into a laptop or all-in-one PC).  The dGPU
built into the platform would be the one we want to use for mux
switching and ACPI power control.  You would not want that for the
dGPU connected via thunderbolt (or some other hot pluggable
interface).  I had suggested that we could check if there is an ACPI
device associated with the dGPU and use that to determine this, but I
think someone brought up a case where that didn't work.  We need to
know whether the dGPU uses platform power control to determine whether
the driver should let the platform manage the power state via ACPI or
if the driver should do it (e.g., for dGPU PCIe add-in cards) for
runtime power management.

>
> nbio_v2_3_enable_aspm() looks like it uses it to change some ASPM
> parameters.  Seems like potentially a device erratum or quirk
> material?

I think this one is a quirk specifically for thunderbolt.  Thunderbolt
attached dGPUs needs a different ASPM L1 inactivity threshold for
stability.  I can check with the relevant teams for more background on
this.

Alex

>
> If these things are not specifically related to Thunderbolt, I'd
> prefer to get rid of pci_is_thunderbolt_attached() and see if we can
> help the GPU folks figure out what they really need.
>
> >       return false;
> > --
> > 2.34.1
> >
