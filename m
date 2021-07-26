Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A333D6277
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 18:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92AB72E1F;
	Mon, 26 Jul 2021 16:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C7472E1F;
 Mon, 26 Jul 2021 16:21:16 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id x15so11491505oic.9;
 Mon, 26 Jul 2021 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RzqYyx4FR7sCrBhVHjBA0CDyBFjYgG7IgNT86nowXgo=;
 b=g4p5z+yzeE7ukCCQRmGvIK2pTqWQUbx98eUtLXCTnBspUYz0Vs/TqlRFUDu1C3+ZS4
 upvCu/qoOMnjwG03nVW5LENb/M5QdC9WZpZn2a8gJybqe1IQDMxpuNB0PQj21vITxXXc
 nFvgEqS8UfDmizRommqPy2WIc/oxmm2IyHKFePSQQrr8b3oDeB2+R1Fm2Y/eIda5QWKt
 w2OPPkm/xVv2w4CtIKQNLeaq3pRigOw1t4JGwGGvHj3OFAMTh3mDnAJ3TsgwZshX0Kmk
 jhm9BJkF5cKf8s4yJglVibR7Yz/5WOFfOut8WO9AuLccgcTuiNS5MsPPXGCprT6B/DNr
 U/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RzqYyx4FR7sCrBhVHjBA0CDyBFjYgG7IgNT86nowXgo=;
 b=LtsCeCeAmcXZY9Oh8hpqrtcoamjh4h/rOOyQrjW4R3wZoASv3gCapcIZqChKwhOqxR
 IRyAnjzLDiLDzRWHKupeob6+04i1Dabq8OrVv6Q1HP24rWDJHuBxSKqNwnw4v0i+H1Yr
 MwqiNY7lvUE8Y5CF6c/LhIhrAdfql/MhaYKe3L/YCbYtFlbGHJnM90rlo5Ss+ZSfg6mO
 m229251WcunL65MBmJFPMM8YLvDeVvQK4ZIBHeQAhpXBsp+ajnqGO78F/NXvdSAu+2UN
 ODtCETa9wmN8d5psNqvJbZCLTPCnf2ye06cdsgG5xR+8xiT3ZlaC9E7iR57yKxQN7vNH
 V4vQ==
X-Gm-Message-State: AOAM530mStE7R7jUjNiC1dQ2kVp00Il8WtCXGT3kfvSgfo6CcUcn1e24
 RSrdk2svJSCGgNjzJpESDaYW28j21O1ZCI/rTT0=
X-Google-Smtp-Source: ABdhPJw7mI6wtSt/64LnNdBcHF5IAosMx51NG8kWVnpEWzPsPpLqfgmnV6sRivzE7FlM3+sGjT5UR42Q6spbLyRFkAw=
X-Received: by 2002:a05:6808:6d2:: with SMTP id
 m18mr11546855oih.120.1627316475282; 
 Mon, 26 Jul 2021 09:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210721170705.4201-1-Ryan.Taylor@amd.com>
 <20210721170705.4201-2-Ryan.Taylor@amd.com>
 <CADnq5_NYP4Gp7DntrnSaSGHuZYzSs_1DfMAjUQv+ksE1jJ9ohw@mail.gmail.com>
 <DM5PR12MB2469E019BB91B58EA547B628F1E69@DM5PR12MB2469.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2469E019BB91B58EA547B628F1E69@DM5PR12MB2469.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Jul 2021 12:21:04 -0400
Message-ID: <CADnq5_OnYuMrZ_s6XtYQeJR1dgqdoC4rnv5DKc3h4hEo0k+RVQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
To: "Chen, Guchun" <Guchun.Chen@amd.com>
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Taylor,
 Ryan" <Ryan.Taylor@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 10:07 PM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
> [Public]
>
> Look copy right statement is missed in both amdgpu_vkms.c and amdgpu_vkms=
.h.

It's there, it just uses the newer SPDX license identifier.

Alex


>
> Regards,
> Guchun
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex D=
eucher
> Sent: Friday, July 23, 2021 10:32 PM
> To: Taylor, Ryan <Ryan.Taylor@amd.com>
> Cc: kernel test robot <lkp@intel.com>; Daniel Vetter <daniel.vetter@ffwll=
.ch>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; amd-gfx list <amd-gfx@l=
ists.freedesktop.org>; Melissa Wen <melissa.srw@gmail.com>; Maling list - D=
RI developers <dri-devel@lists.freedesktop.org>
> Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
>
> On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor <Ryan.Taylor@amd.com> wrote:
> >
> > Modify the VKMS driver into an api that dce_virtual can use to create
> > virtual displays that obey drm's atomic modesetting api.
> >
> > v2: Made local functions static.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/Makefile      |   1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 411
> > +++++++++++++++++++++++  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |
> > 29 ++  drivers/gpu/drm/amd/amdgpu/dce_virtual.c |  23 +-
> >  7 files changed, 458 insertions(+), 11 deletions(-)  create mode
> > 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> >  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
> > b/drivers/gpu/drm/amd/amdgpu/Makefile
> > index f089794bbdd5..30cbcd5ce1cc 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> > +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> > @@ -120,6 +120,7 @@ amdgpu-y +=3D \
> >  amdgpu-y +=3D \
> >         dce_v10_0.o \
> >         dce_v11_0.o \
> > +       amdgpu_vkms.o \
> >         dce_virtual.o
> >
> >  # add GFX block
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 54cf647bd018..d0a2f2ed433d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -919,6 +919,7 @@ struct amdgpu_device {
> >
> >         /* display */
> >         bool                            enable_virtual_display;
> > +       struct amdgpu_vkms_output       *amdgpu_vkms_output;
> >         struct amdgpu_mode_info         mode_info;
> >         /* For pre-DCE11. DCE11 and later are in "struct amdgpu_device-=
>dm" */
> >         struct work_struct              hotplug_work;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index d0c935cf4f0f..1b016e5bc75f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -1230,7 +1230,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >         int ret, retry =3D 0;
> >         bool supports_atomic =3D false;
> >
> > -       if (!amdgpu_virtual_display &&
> > +       if (amdgpu_virtual_display ||
> >             amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
> >                 supports_atomic =3D true;
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > index 09b048647523..5a143ca02cf9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > @@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
> >         }
> >
> >         /* disable all the possible outputs/crtcs before entering KMS m=
ode */
> > -       if (!amdgpu_device_has_dc_support(adev))
> > +       if (!amdgpu_device_has_dc_support(adev) &&
> > + !amdgpu_virtual_display)
> >
> > drm_helper_disable_unused_functions(adev_to_drm(adev));
> >
> >         drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel); diff
> > --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > new file mode 100644
> > index 000000000000..d5c1f1c58f5f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > @@ -0,0 +1,411 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_simple_kms_helper.h> #include <drm/drm_vblank.h>
> > +
> > +#include "amdgpu.h"
> > +#include "amdgpu_vkms.h"
> > +#include "amdgpu_display.h"
> > +
> > +/**
> > + * DOC: amdgpu_vkms
> > + *
> > + * The amdgpu vkms interface provides a virtual KMS interface for
> > +several use
> > + * cases: devices without display hardware, platforms where the
> > +actual display
> > + * hardware is not useful (e.g., servers), SR-IOV virtual functions,
> > +device
> > + * emulation/simulation, and device bring up prior to display
> > +hardware being
> > + * usable. We previously emulated a legacy KMS interface, but there
> > +was a desire
> > + * to move to the atomic KMS interface. The vkms driver did
> > +everything we
> > + * needed, but we wanted KMS support natively in the driver without
> > +buffer
> > + * sharing and the ability to support an instance of VKMS per device.
> > +We first
> > + * looked at splitting vkms into a stub driver and a helper module
> > +that other
> > + * drivers could use to implement a virtual display, but this
> > +strategy ended up
> > + * being messy due to driver specific callbacks needed for buffer mana=
gement.
> > + * Ultimately, it proved easier to import the vkms code as it mostly
> > +used core
> > + * drm helpers anyway.
> > + */
> > +
> > +static const u32 amdgpu_vkms_formats[] =3D {
> > +       DRM_FORMAT_XRGB8888,
> > +};
> > +
> > +static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct
> > +hrtimer *timer) {
> > +       struct amdgpu_vkms_output *output =3D container_of(timer,
> > +                                                        struct amdgpu_=
vkms_output,
> > +                                                        vblank_hrtimer=
);
> > +       struct drm_crtc *crtc =3D &output->crtc;
> > +       u64 ret_overrun;
> > +       bool ret;
> > +
> > +       ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> > +                                         output->period_ns);
> > +       WARN_ON(ret_overrun !=3D 1);
> > +
> > +       ret =3D drm_crtc_handle_vblank(crtc);
> > +       if (!ret)
> > +               DRM_ERROR("amdgpu_vkms failure on handling vblank");
> > +
> > +       return HRTIMER_RESTART;
> > +}
> > +
> > +static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc) {
> > +       struct drm_device *dev =3D crtc->dev;
> > +       unsigned int pipe =3D drm_crtc_index(crtc);
> > +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > +       struct amdgpu_vkms_output *out =3D
> > +drm_crtc_to_amdgpu_vkms_output(crtc);
> > +
> > +       drm_calc_timestamping_constants(crtc, &crtc->mode);
> > +
> > +       hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MOD=
E_REL);
> > +       out->vblank_hrtimer.function =3D &amdgpu_vkms_vblank_simulate;
> > +       out->period_ns =3D ktime_set(0, vblank->framedur_ns);
> > +       hrtimer_start(&out->vblank_hrtimer, out->period_ns,
> > + HRTIMER_MODE_REL);
> > +
> > +       return 0;
> > +}
> > +
> > +static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc) {
> > +       struct amdgpu_vkms_output *out =3D
> > +drm_crtc_to_amdgpu_vkms_output(crtc);
> > +
> > +       hrtimer_cancel(&out->vblank_hrtimer);
> > +}
> > +
> > +static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> > +                                            int *max_error,
> > +                                            ktime_t *vblank_time,
> > +                                            bool in_vblank_irq) {
> > +       struct drm_device *dev =3D crtc->dev;
> > +       unsigned int pipe =3D crtc->index;
> > +       struct amdgpu_vkms_output *output =3D drm_crtc_to_amdgpu_vkms_o=
utput(crtc);
> > +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > +
> > +       if (!READ_ONCE(vblank->enabled)) {
> > +               *vblank_time =3D ktime_get();
> > +               return true;
> > +       }
> > +
> > +       *vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expires)=
;
> > +
> > +       if (WARN_ON(*vblank_time =3D=3D vblank->time))
> > +               return true;
> > +
> > +       /*
> > +        * To prevent races we roll the hrtimer forward before we do an=
y
> > +        * interrupt processing - this is how real hw works (the interr=
upt is
> > +        * only generated after all the vblank registers are updated) a=
nd what
> > +        * the vblank core expects. Therefore we need to always correct=
 the
> > +        * timestampe by one frame.
> > +        */
> > +       *vblank_time -=3D output->period_ns;
> > +
> > +       return true;
> > +}
> > +
> > +static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs =3D {
> > +       .set_config             =3D drm_atomic_helper_set_config,
> > +       .destroy                =3D drm_crtc_cleanup,
> > +       .page_flip              =3D drm_atomic_helper_page_flip,
> > +       .reset                  =3D drm_atomic_helper_crtc_reset,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_st=
ate,
> > +       .atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_stat=
e,
> > +       .enable_vblank          =3D amdgpu_vkms_enable_vblank,
> > +       .disable_vblank         =3D amdgpu_vkms_disable_vblank,
> > +       .get_vblank_timestamp   =3D amdgpu_vkms_get_vblank_timestamp,
> > +};
> > +
> > +static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> > +                                          struct drm_atomic_state
> > +*state) {
> > +       drm_crtc_vblank_on(crtc);
> > +}
> > +
> > +static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> > +                                           struct drm_atomic_state
> > +*state) {
> > +       drm_crtc_vblank_off(crtc);
> > +}
> > +
> > +static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > +                                         struct drm_atomic_state
> > +*state) {
> > +       if (crtc->state->event) {
> > +               spin_lock(&crtc->dev->event_lock);
> > +
> > +               if (drm_crtc_vblank_get(crtc) !=3D 0)
> > +                       drm_crtc_send_vblank_event(crtc, crtc->state->e=
vent);
> > +               else
> > +                       drm_crtc_arm_vblank_event(crtc,
> > + crtc->state->event);
> > +
> > +               spin_unlock(&crtc->dev->event_lock);
> > +
> > +               crtc->state->event =3D NULL;
> > +       }
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_helper_func=
s =3D {
> > +       .atomic_flush   =3D amdgpu_vkms_crtc_atomic_flush,
> > +       .atomic_enable  =3D amdgpu_vkms_crtc_atomic_enable,
> > +       .atomic_disable =3D amdgpu_vkms_crtc_atomic_disable, };
> > +
> > +static int amdgpu_vkms_crtc_init(struct drm_device *dev, struct drm_cr=
tc *crtc,
> > +                         struct drm_plane *primary, struct drm_plane
> > +*cursor) {
> > +       int ret;
> > +
> > +       ret =3D drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> > +                                       &amdgpu_vkms_crtc_funcs, NULL);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to init CRTC\n");
> > +               return ret;
> > +       }
> > +
> > +       drm_crtc_helper_add(crtc, &amdgpu_vkms_crtc_helper_funcs);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct drm_connector_funcs amdgpu_vkms_connector_funcs =
=3D {
> > +       .fill_modes =3D drm_helper_probe_single_connector_modes,
> > +       .destroy =3D drm_connector_cleanup,
> > +       .reset =3D drm_atomic_helper_connector_reset,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplica=
te_state,
> > +       .atomic_destroy_state =3D
> > +drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int amdgpu_vkms_conn_get_modes(struct drm_connector
> > +*connector) {
> > +       int count;
> > +
> > +       count =3D drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> > +       drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> > +
> > +       return count;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper=
_funcs =3D {
> > +       .get_modes    =3D amdgpu_vkms_conn_get_modes,
> > +};
> > +
> > +static const struct drm_plane_funcs amdgpu_vkms_plane_funcs =3D {
> > +       .update_plane           =3D drm_atomic_helper_update_plane,
> > +       .disable_plane          =3D drm_atomic_helper_disable_plane,
> > +       .destroy                =3D drm_plane_cleanup,
> > +       .reset                  =3D drm_atomic_helper_plane_reset,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_s=
tate,
> > +       .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_sta=
te,
> > +};
> > +
> > +static void amdgpu_vkms_plane_atomic_update(struct drm_plane *plane,
> > +                                           struct drm_plane_state
> > +*old_state) {
> > +       return;
> > +}
> > +
> > +static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plane,
> > +                                         struct drm_plane_state
> > +*state) {
> > +       struct drm_crtc_state *crtc_state;
> > +       bool can_position =3D false;
> > +       int ret;
> > +
> > +       if (!state->fb || WARN_ON(!state->crtc))
> > +               return 0;
> > +
> > +       crtc_state =3D drm_atomic_get_crtc_state(state->state, state->c=
rtc);
> > +       if (IS_ERR(crtc_state))
> > +               return PTR_ERR(crtc_state);
> > +
> > +       ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> > +                                                 DRM_PLANE_HELPER_NO_S=
CALING,
> > +                                                 DRM_PLANE_HELPER_NO_S=
CALING,
> > +                                                 can_position, true);
> > +       if (ret !=3D 0)
> > +               return ret;
> > +
> > +       /* for now primary plane must be visible and full screen */
> > +       if (!state->visible && !can_position)
> > +               return -EINVAL;
> > +
> > +       return 0;
> > +}
> > +
> > +static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
> > +                                 struct drm_plane_state *new_state) {
> > +       struct amdgpu_framebuffer *afb;
> > +       struct drm_gem_object *obj;
> > +       struct amdgpu_device *adev;
> > +       struct amdgpu_bo *rbo;
> > +       struct list_head list;
> > +       struct ttm_validate_buffer tv;
> > +       struct ww_acquire_ctx ticket;
> > +       uint32_t domain;
> > +       int r;
> > +
> > +       if (!new_state->fb) {
> > +               DRM_DEBUG_KMS("No FB bound\n");
> > +               return 0;
> > +       }
> > +       afb =3D to_amdgpu_framebuffer(new_state->fb);
> > +       obj =3D new_state->fb->obj[0];
> > +       rbo =3D gem_to_amdgpu_bo(obj);
> > +       adev =3D amdgpu_ttm_adev(rbo->tbo.bdev);
> > +       INIT_LIST_HEAD(&list);
> > +
> > +       tv.bo =3D &rbo->tbo;
> > +       tv.num_shared =3D 1;
> > +       list_add(&tv.head, &list);
> > +
> > +       r =3D ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> > +       if (r) {
> > +               dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
> > +               return r;
> > +       }
> > +
> > +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> > +               domain =3D amdgpu_display_supported_domains(adev, rbo->=
flags);
> > +       else
> > +               domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > +
> > +       r =3D amdgpu_bo_pin(rbo, domain);
> > +       if (unlikely(r !=3D 0)) {
> > +               if (r !=3D -ERESTARTSYS)
> > +                       DRM_ERROR("Failed to pin framebuffer with error=
 %d\n", r);
> > +               ttm_eu_backoff_reservation(&ticket, &list);
> > +               return r;
> > +       }
> > +
> > +       r =3D amdgpu_ttm_alloc_gart(&rbo->tbo);
> > +       if (unlikely(r !=3D 0)) {
> > +               amdgpu_bo_unpin(rbo);
> > +               ttm_eu_backoff_reservation(&ticket, &list);
> > +               DRM_ERROR("%p bind failed\n", rbo);
> > +               return r;
> > +       }
> > +
> > +       ttm_eu_backoff_reservation(&ticket, &list);
> > +
> > +       afb->address =3D amdgpu_bo_gpu_offset(rbo);
> > +
> > +       amdgpu_bo_ref(rbo);
> > +
> > +       return 0;
> > +}
> > +
> > +static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,
> > +                                  struct drm_plane_state *old_state)
> > +{
> > +       struct amdgpu_bo *rbo;
> > +       int r;
> > +
> > +       if (!old_state->fb)
> > +               return;
> > +
> > +       rbo =3D gem_to_amdgpu_bo(old_state->fb->obj[0]);
> > +       r =3D amdgpu_bo_reserve(rbo, false);
> > +       if (unlikely(r)) {
> > +               DRM_ERROR("failed to reserve rbo before unpin\n");
> > +               return;
> > +       }
> > +
> > +       amdgpu_bo_unpin(rbo);
> > +       amdgpu_bo_unreserve(rbo);
> > +       amdgpu_bo_unref(&rbo);
> > +}
> > +
> > +static const struct drm_plane_helper_funcs amdgpu_vkms_primary_helper_=
funcs =3D {
> > +       .atomic_update          =3D amdgpu_vkms_plane_atomic_update,
> > +       .atomic_check           =3D amdgpu_vkms_plane_atomic_check,
> > +       .prepare_fb             =3D amdgpu_vkms_prepare_fb,
> > +       .cleanup_fb             =3D amdgpu_vkms_cleanup_fb,
> > +};
> > +
> > +static struct drm_plane *amdgpu_vkms_plane_init(struct drm_device *dev=
,
> > +                                               enum drm_plane_type typ=
e,
> > +                                               int index) {
> > +       struct drm_plane *plane;
> > +       int ret;
> > +
> > +       plane =3D kzalloc(sizeof(*plane), GFP_KERNEL);
> > +       if (!plane)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       ret =3D drm_universal_plane_init(dev, plane, 1 << index,
> > +                                      &amdgpu_vkms_plane_funcs,
> > +                                      amdgpu_vkms_formats,
> > +                                      ARRAY_SIZE(amdgpu_vkms_formats),
> > +                                      NULL, type, NULL);
> > +       if (ret) {
> > +               kfree(plane);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       drm_plane_helper_add(plane,
> > + &amdgpu_vkms_primary_helper_funcs);
> > +
> > +       return plane;
> > +}
> > +
> > +int amdgpu_vkms_output_init(struct drm_device *dev,
> > +                           struct amdgpu_vkms_output *output, int
> > +index) {
> > +       struct drm_connector *connector =3D &output->connector;
> > +       struct drm_encoder *encoder =3D &output->encoder;
> > +       struct drm_crtc *crtc =3D &output->crtc;
> > +       struct drm_plane *primary, *cursor =3D NULL;
> > +       int ret;
> > +
> > +       primary =3D amdgpu_vkms_plane_init(dev, DRM_PLANE_TYPE_PRIMARY,=
 index);
> > +       if (IS_ERR(primary))
> > +               return PTR_ERR(primary);
> > +
> > +       ret =3D amdgpu_vkms_crtc_init(dev, crtc, primary, cursor);
> > +       if (ret)
> > +               goto err_crtc;
> > +
> > +       ret =3D drm_connector_init(dev, connector, &amdgpu_vkms_connect=
or_funcs,
> > +                                DRM_MODE_CONNECTOR_VIRTUAL);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to init connector\n");
> > +               goto err_connector;
> > +       }
> > +
> > +       drm_connector_helper_add(connector,
> > + &amdgpu_vkms_conn_helper_funcs);
> > +
> > +       ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_=
VIRTUAL);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to init encoder\n");
> > +               goto err_encoder;
> > +       }
> > +       encoder->possible_crtcs =3D 1 << index;
> > +
> > +       ret =3D drm_connector_attach_encoder(connector, encoder);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to attach connector to encoder\n");
> > +               goto err_attach;
> > +       }
> > +
> > +       drm_mode_config_reset(dev);
> > +
> > +       return 0;
> > +
> > +err_attach:
> > +       drm_encoder_cleanup(encoder);
> > +
> > +err_encoder:
> > +       drm_connector_cleanup(connector);
> > +
> > +err_connector:
> > +       drm_crtc_cleanup(crtc);
> > +
> > +err_crtc:
> > +       drm_plane_cleanup(primary);
> > +
> > +       return ret;
> > +}
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > new file mode 100644
> > index 000000000000..5dab51fbecf3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +
> > +#ifndef _AMDGPU_VKMS_H_
> > +#define _AMDGPU_VKMS_H_
> > +
> > +#define XRES_DEF  1024
> > +#define YRES_DEF   764
>
> Squash in the 768 fix here.
>
> > +
> > +#define XRES_MAX  16384
> > +#define YRES_MAX  16384
> > +
> > +#define drm_crtc_to_amdgpu_vkms_output(target) \
> > +       container_of(target, struct amdgpu_vkms_output, crtc)
> > +
> > +extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_block;
> > +
> > +struct amdgpu_vkms_output {
> > +       struct drm_crtc crtc;
> > +       struct drm_encoder encoder;
> > +       struct drm_connector connector;
> > +       struct hrtimer vblank_hrtimer;
> > +       ktime_t period_ns;
> > +       struct drm_pending_vblank_event *event; };
> > +
> > +int amdgpu_vkms_output_init(struct drm_device *dev,
> > +                           struct amdgpu_vkms_output *output, int
> > +index);
> > +
> > +#endif /* _AMDGPU_VKMS_H_ */
> > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > index 7e0d8c092c7e..642c77533157 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > @@ -22,6 +22,7 @@
> >   */
> >
> >  #include <drm/drm_vblank.h>
> > +#include <drm/drm_atomic_helper.h>
> >
> >  #include "amdgpu.h"
> >  #include "amdgpu_pm.h"
> > @@ -40,6 +41,7 @@
> >  #include "dce_virtual.h"
> >  #include "ivsrcid/ivsrcid_vislands30.h"
> >  #include "amdgpu_display.h"
> > +#include "amdgpu_vkms.h"
> >
> >  #define DCE_VIRTUAL_VBLANK_PERIOD 16666666
> >
> > @@ -374,6 +376,12 @@ static const struct drm_connector_funcs dce_virtua=
l_connector_funcs =3D {
> >         .force =3D dce_virtual_force,
> >  };
> >
> > +const struct drm_mode_config_funcs dce_virtual_mode_funcs =3D {
> > +       .fb_create =3D amdgpu_display_user_framebuffer_create,
> > +       .atomic_check =3D drm_atomic_helper_check,
> > +       .atomic_commit =3D drm_atomic_helper_commit, };
> > +
> >  static int dce_virtual_sw_init(void *handle)  {
> >         int r, i;
> > @@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *handle)
> >
> >         adev_to_drm(adev)->max_vblank_count =3D 0;
> >
> > -       adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
> > +       adev_to_drm(adev)->mode_config.funcs =3D
> > + &dce_virtual_mode_funcs;
> >
> > -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> > -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> > +       adev_to_drm(adev)->mode_config.max_width =3D XRES_MAX;
> > +       adev_to_drm(adev)->mode_config.max_height =3D YRES_MAX;
> >
> >         adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
> >         adev_to_drm(adev)->mode_config.prefer_shadow =3D 1; @@ -399,15
> > +407,11 @@ static int dce_virtual_sw_init(void *handle)
> >         if (r)
> >                 return r;
> >
> > -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> > -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> > +       adev->amdgpu_vkms_output =3D kzalloc(sizeof(struct
> > + amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
>
> You can use kcalloc here.
>
> >
> >         /* allocate crtcs, encoders, connectors */
> >         for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> > -               r =3D dce_virtual_crtc_init(adev, i);
> > -               if (r)
> > -                       return r;
> > -               r =3D dce_virtual_connector_encoder_init(adev, i);
> > +               r =3D amdgpu_vkms_output_init(adev_to_drm(adev),
> > + &adev->amdgpu_vkms_output[i], i);
> >                 if (r)
> >                         return r;
> >         }
> > @@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *handle)
> >
> > hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
> >
> >         kfree(adev->mode_info.bios_hardcoded_edid);
> > +       kfree(adev->amdgpu_vkms_output);
> >
> >         drm_kms_helper_poll_fini(adev_to_drm(adev));
> >
> > --
> > 2.32.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cg=
u
> > chun.chen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd8961fe4884
> > e608e11a82d994e183d%7C0%7C0%7C637626475284480052%7CUnknown%7CTWFpbGZsb
> > 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > 7C1000&amp;sdata=3D0bbTKflaP2RPk%2BpboaNNiwffbEw1pW0zkqcxzPWjzmI%3D&amp=
;
> > reserved=3D0
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cguchun=
.chen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637626475284490043%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
VQ1liQG9OOsBA3NtjS93WNu6NhlLQ0fXQRbLwLmz95g%3D&amp;reserved=3D0
