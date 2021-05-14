Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56B38065D
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 11:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269666EE43;
	Fri, 14 May 2021 09:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F216E2C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 09:39:05 +0000 (UTC)
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lhUHf-0007Hj-IG
 for dri-devel@lists.freedesktop.org; Fri, 14 May 2021 09:39:03 +0000
Received: by mail-lj1-f198.google.com with SMTP id
 v4-20020a2e96040000b02900ce9d1504b5so15756828ljh.16
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 02:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BOeJR7+8V9SrfRJ7P6Px6DDdP07HsZ2AaHT/i8QQJDk=;
 b=q3Xmz/ahe+2R+oLb71znxf9zsnLy9HbvZiI8ZHGbeUaSK8FVdoUgll/Y4wikGdbY9m
 4AeUdNqvvEDdjlfdjgNzdZ1iHZ9yFs6GLuPQzs7PT4qM3ka4fC2Nl+FmIc5O7LwY1agy
 qhLEYmQgdWuI0joFUqlnn//G0NbIee4o8XUDFIAurEbP+csrjFnuxfPDLo58oNNyjU1O
 UFw0xodoUGrlIq8IvFx+LZkMnt97yS2e4GjfujpxG90FjfnB0FvRB3lVJOtPIvOey0g8
 6ZixjXP20dp7PPqcrt6Wzfz9fGLLbTy9ISvpFkQCh5cIyf57dcZ5R+o7yDgsZ0d0VCWS
 AuIA==
X-Gm-Message-State: AOAM532yhoqycT03FTXN1AZ8W17ggI8bpkUTJFhKUtJ026HYXZ8e8iHx
 hlkjxEMBhoEl2Hpr0tgW9T0zeKt7qF6sHmLBJs1fUXT2b/viKaOH4T0G3qsMtVhdyA73kU8FZxd
 fJdpCWBYFVZejPJGdE9Do/3liA0xa8jSHFZi9lA0RjRkl6N+rB5wjgwCPGz9NXA==
X-Received: by 2002:a2e:b531:: with SMTP id z17mr37029653ljm.126.1620985142903; 
 Fri, 14 May 2021 02:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKHIuUDJuL9g4ZUwIgFtHu6cFFNFFSmfs/psYlO3CunDrkKG6ZwseHlgQ0qyUpzLJKZXyqO3GC7Wei/JHqA9E=
X-Received: by 2002:a2e:b531:: with SMTP id z17mr37029623ljm.126.1620985142551; 
 Fri, 14 May 2021 02:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210426152420.359402-1-kai.heng.feng@canonical.com>
 <YJrKnHppE5FnaZ72@intel.com>
In-Reply-To: <YJrKnHppE5FnaZ72@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 14 May 2021 17:38:51 +0800
Message-ID: <CAAd53p7kFD-PrdeONF8-c=JG5rtHXpz1sxTbPkwg8YY4ZcCYWg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915: Invoke another _DSM to enable MUX on HP
 Workstation laptops
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Karthik B S <karthik.b.s@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 2:19 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Mon, Apr 26, 2021 at 11:24:10PM +0800, Kai-Heng Feng wrote:
> > On HP Fury G7 Workstations, graphics output is re-routed from Intel GFX
> > to discrete GFX after S3. This is not desirable, because userspace will
> > treat connected display as a new one, losing display settings.
> >
> > The expected behavior is to let discrete GFX drives all external
> > displays.
> >
> > The platform in question uses ACPI method \_SB.PCI0.HGME to enable MUX.
> > The method is inside the another _DSM, so add the _DSM and call it
> > accordingly.
> >
> > I also tested some MUX-less and iGPU only laptops with that _DSM, no
> > regression was found.
> >
> > v3:
> >  - Remove BXT from names.
> >  - Change the parameter type.
> >  - Fold the function into intel_modeset_init_hw().
> >
> > v2:
> >  - Forward declare struct pci_dev.
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3113
> > References: https://lore.kernel.org/intel-gfx/1460040732-31417-4-git-se=
nd-email-animesh.manna@intel.com/
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_acpi.c    | 18 ++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +++
> >  drivers/gpu/drm/i915/display/intel_display.c |  2 ++
> >  3 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/dr=
m/i915/display/intel_acpi.c
> > index 833d0c1be4f1..d008d3976261 100644
> > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > @@ -13,12 +13,17 @@
> >  #include "intel_display_types.h"
> >
> >  #define INTEL_DSM_REVISION_ID 1 /* For Calpella anyway... */
> > +#define INTEL_DSM_FN_PLATFORM_MUX_ENABLE 0 /* No args */
>
> This block of defines is for the other DSM. We don't want to
> mix these up. We also want to name it according to the spec,
> so something like GET_BIOS_DATA_FUNCS_SUPPORTED. Similarly
> for the intel_dsm_enable_mux() wrapper function. + it needs
> a comment to document that some BIOSes abuse it to do MUX
> initialization and whatnot.

Will do.


>
> We should perhaps rename all the old DSM stuff to
> something a bit less generic as well...

I can rename them as well. But what's the naming scheme you prefer?

>
> >  #define INTEL_DSM_FN_PLATFORM_MUX_INFO 1 /* No args */
> >
> >  static const guid_t intel_dsm_guid =3D
> >       GUID_INIT(0x7ed873d3, 0xc2d0, 0x4e4f,
> >                 0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
> >
> > +static const guid_t intel_dsm_guid2 =3D
> > +     GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> > +               0x9d, 0x15, 0xc7, 0x1f, 0xba, 0xda, 0xe4, 0x14);
> > +
> >  static char *intel_dsm_port_name(u8 id)
> >  {
> >       switch (id) {
> > @@ -176,6 +181,19 @@ void intel_unregister_dsm_handler(void)
> >  {
> >  }
> >
> > +void intel_dsm_enable_mux(struct drm_i915_private *i915)
> > +{
> > +     struct pci_dev *pdev =3D i915->drm.pdev;
> > +     acpi_handle dhandle;
> > +
> > +     dhandle =3D ACPI_HANDLE(&pdev->dev);
> > +     if (!dhandle)
> > +             return;
> > +
> > +     acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_I=
D,
> > +                       INTEL_DSM_FN_PLATFORM_MUX_ENABLE, NULL);
> > +}
> > +
> >  /*
> >   * ACPI Specification, Revision 5.0, Appendix B.3.2 _DOD (Enumerate Al=
l Devices
> >   * Attached to the Display Adapter).
> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/dr=
m/i915/display/intel_acpi.h
> > index e8b068661d22..def013cf6308 100644
> > --- a/drivers/gpu/drm/i915/display/intel_acpi.h
> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
> > @@ -11,11 +11,14 @@ struct drm_i915_private;
> >  #ifdef CONFIG_ACPI
> >  void intel_register_dsm_handler(void);
> >  void intel_unregister_dsm_handler(void);
> > +void intel_dsm_enable_mux(struct drm_i915_private *i915);
> >  void intel_acpi_device_id_update(struct drm_i915_private *i915);
> >  #else
> >  static inline void intel_register_dsm_handler(void) { return; }
> >  static inline void intel_unregister_dsm_handler(void) { return; }
> >  static inline
> > +void intel_dsm_enable_mux(struct drm_i915_private *i915) { return; }
> > +static inline
> >  void intel_acpi_device_id_update(struct drm_i915_private *i915) { retu=
rn; }
> >  #endif /* CONFIG_ACPI */
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index a10e26380ef3..d79dae370b20 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -11472,6 +11472,8 @@ void intel_modeset_init_hw(struct drm_i915_priv=
ate *i915)
> >  {
> >       struct intel_cdclk_state *cdclk_state;
> >
> > +     intel_dsm_enable_mux(i915);
> > +
>
> This should probably be somewhere around where we do all the other
> semi ACPI related init (OpRegion/etc.).

Hmm, but Jani prefers to put it inside intel_modeset_*() helpers. But
I don't see any opregion related functions are being called by
intel_modeset_*() helpers. Any suggestion?

Kai-Heng

>
> >       if (!HAS_DISPLAY(i915))
> >               return;
> >
> > --
> > 2.30.2
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
