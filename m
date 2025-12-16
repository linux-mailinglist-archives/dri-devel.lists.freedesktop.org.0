Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558BCC3F30
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCE010E972;
	Tue, 16 Dec 2025 15:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BxpBT/t/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8A510E6CB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:31:45 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a110548f10so4237835ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765899105; x=1766503905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svUIaOG21t8pBd8rzyD543GDtySRa+E41ytkXqBTkY0=;
 b=BxpBT/t/qdQYSJpwpBTVGe2sZH9VHTmz5Pjq5TOmUq3fP5J5dMgJ8LgMR5btLit6Ig
 H6lLaVoFnisdbyRfcICafdhprbJtWuuiVvQXqHE0ZgCOnfrcsqd05j4kS16AbARjQdJe
 +ha6KcTWudAalCXZazNORMksxuYPE37HT5hV6+I2QRyK8AouUIQX6tjeoTwNA2oci0yQ
 YYmZfKnZEHCkszH+EjPJaZSiZIgOdl7kWUV40j7PIDpBQuD767m9uUbHNUcAGtdShPCr
 9qO/VgFUmaBVKzP8R3RONvYXqMVuytoFg6Id/ciN3duAJKWjhIMz6mpNZbhz+mvUmRTj
 +xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765899105; x=1766503905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=svUIaOG21t8pBd8rzyD543GDtySRa+E41ytkXqBTkY0=;
 b=CLUyXiWcr8zJ/Aa9Ah+TuAb2UCoA3upH28yT9z+BDG4YdRmZjcIqcUUALm3EPcIoXZ
 m5ZJrwucbh3Eo1AScXDJQhXdRQGir+TvW8wY8eYU+7wDRKQ33JZ35JRULdlFnw9kerp8
 3c+peZVTOEG7aa27a0tEPQAsLggtAS5iSAQuMbFvolvezEy0m2M6bAal65Zai/joVvHI
 LW57MG5p9RYirC8zi6LAcztN/iEjnEOmu4V/Y0JCgMJcECKU8BENe5j6G6o82GJ6M3S4
 HyDsFTdIrOV88f3/7uF82nzuvun2E9RtCIbnkfPuu3yieB+U71CDjSnzzK+zsUKuKr8c
 BV1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPWYM5AnFWlEikIGZh+m8Z3U9+HSjBX0s1jHIOMm2rJVOSrvwc6VFAG+9XkByh/qR1ob73q/4+e6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTGcb1oAEyhETrp6gnLSvhibotLY5aX2lJIzJ5a+E9dP3OZccL
 f+lxf6PhGKdxZbkYj+QP6aZFzPWr2SBBWlsYQyz6wW/LtbLlyhuUKFqnF0snwHHf2i3q/3tE1sQ
 XPCiyk3Yh6M+0QKLKtRS9FqCCrpukePY=
X-Gm-Gg: AY/fxX6oBN2+Ezc0CbLR43jgjXa7Z1ikYcwOdjyoQCZFg32zkP5ARehcU3MLYovqZxF
 YpoQgM1hpz7q12Mfd36JDQGEpivdncCQQjW4XtvEW5JIhxGSOIcGV/2Izq0+RxgHGPuX9k+oiTI
 yx2E/pyfwidR3bStHN1L9loXoy7ZDpYQIG+wow4tGJX3oCNWpLXN1krYQNay3svTk7mD2RN/n5m
 IpWllNsVP+9Wd84sCHbH/uShKzl9o5enUYKKyVzeNDll3olT9J6nLkhb4sR9EUQTtuYPZoKP59G
 cUFnHBg=
X-Google-Smtp-Source: AGHT+IH8mTIHhr4wUuLgIVmA9tJRsYUZz+0HDP02iGV+xt5Xpe5m3m/9I/9gCYBMxlAAAJZl3KvNVhPW3jYkL9EuyVc=
X-Received: by 2002:a05:7022:fa2:b0:11b:862d:8031 with SMTP id
 a92af1059eb24-11f34874285mr6166112c88.0.1765899104995; Tue, 16 Dec 2025
 07:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20251216064224.537759-1-mukeshogare871@gmail.com>
 <e5e0547b-4ba7-4862-a0f1-a63ad5e5425f@amd.com>
In-Reply-To: <e5e0547b-4ba7-4862-a0f1-a63ad5e5425f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:31:33 -0500
X-Gm-Features: AQt7F2qO-jOd3It1Yb7zsX58vhlKcPMz-wyw8zgLrD3pjm3g-iTFJkreLmQeG4k
Message-ID: <CADnq5_N7kZeHaDXSdHsutgo8n8DjtWCWT1=KitEOycXCBWtyZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Convert logging in radeon_display.c to drm_*
 helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mukesh Ogare <mukeshogare871@gmail.com>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Dec 16, 2025 at 3:37=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 12/16/25 07:42, Mukesh Ogare wrote:
> > Replace DRM_ERROR() and DRM_INFO() calls in
> > drivers/gpu/drm/radeon/radeon_display.c with the corresponding
> > drm_err() and drm_info() helpers.
> >
> > The drm_*() logging functions take a struct drm_device * argument,
> > allowing the DRM core to prefix log messages with the correct device
> > name and instance. This is required to correctly distinguish log
> > messages on systems with multiple GPUs.
> >
> > This change aligns radeon with the DRM TODO item:
> > "Convert logging to drm_* functions with drm_device parameter".
> >
> > Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>
>
> Of hand looks reasonable to me, but I don't have the time to check everyt=
hing for typos. So only:
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Alex will probably pick this up when he has time.
>
> Thanks,
> Christian.
>
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/=
radeon/radeon_display.c
> > index 35fb99bcd9a7..bc28117e01b4 100644
> > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > @@ -41,6 +41,7 @@
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_vblank.h>
> >  #include <drm/radeon_drm.h>
> > +#include <drm/drm_print.h>
> >
> >  #include "atom.h"
> >  #include "radeon.h"
> > @@ -273,7 +274,7 @@ static void radeon_unpin_work_func(struct work_stru=
ct *__work)
> >               radeon_bo_unpin(work->old_rbo);
> >               radeon_bo_unreserve(work->old_rbo);
> >       } else
> > -             DRM_ERROR("failed to reserve buffer after flip\n");
> > +             drm_err(&work->rdev->ddev, "failed to reserve buffer afte=
r flip\n");
> >
> >       drm_gem_object_put(&work->old_rbo->tbo.base);
> >       kfree(work);
> > @@ -434,7 +435,7 @@ static void radeon_flip_work_func(struct work_struc=
t *__work)
> >                       r =3D dma_fence_wait(work->fence, false);
> >
> >               if (r)
> > -                     DRM_ERROR("failed to wait on page flip fence (%d)=
!\n", r);
> > +                     drm_err(dev, "failed to wait on page flip fence (=
%d)!\n", r);
> >
> >               /* We continue with the page flip even if we failed to wa=
it on
> >                * the fence, otherwise the DRM core and userspace will b=
e
> > @@ -521,7 +522,7 @@ static int radeon_crtc_page_flip_target(struct drm_=
crtc *crtc,
> >
> >       r =3D radeon_bo_reserve(new_rbo, false);
> >       if (unlikely(r !=3D 0)) {
> > -             DRM_ERROR("failed to reserve new rbo buffer before flip\n=
");
> > +             drm_err(dev, "failed to reserve new rbo buffer before fli=
p\n");
> >               goto cleanup;
> >       }
> >       /* Only 27 bit offset for legacy CRTC */
> > @@ -530,14 +531,14 @@ static int radeon_crtc_page_flip_target(struct dr=
m_crtc *crtc,
> >       if (unlikely(r !=3D 0)) {
> >               radeon_bo_unreserve(new_rbo);
> >               r =3D -EINVAL;
> > -             DRM_ERROR("failed to pin new rbo buffer before flip\n");
> > +             drm_err(dev, "failed to pin new rbo buffer before flip\n"=
);
> >               goto cleanup;
> >       }
> >       r =3D dma_resv_get_singleton(new_rbo->tbo.base.resv, DMA_RESV_USA=
GE_WRITE,
> >                                  &work->fence);
> >       if (r) {
> >               radeon_bo_unreserve(new_rbo);
> > -             DRM_ERROR("failed to get new rbo buffer fences\n");
> > +             drm_err(dev, "failed to get new rbo buffer fences\n");
> >               goto cleanup;
> >       }
> >       radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
> > @@ -604,7 +605,7 @@ static int radeon_crtc_page_flip_target(struct drm_=
crtc *crtc,
> >
> >  pflip_cleanup:
> >       if (unlikely(radeon_bo_reserve(new_rbo, false) !=3D 0)) {
> > -             DRM_ERROR("failed to reserve new rbo in error path\n");
> > +             drm_err(dev, "failed to reserve new rbo in error path\n")=
;
> >               goto cleanup;
> >       }
> >       radeon_bo_unpin(new_rbo);
> > @@ -772,15 +773,15 @@ static void radeon_print_display_setup(struct drm=
_device *dev)
> >       uint32_t devices;
> >       int i =3D 0;
> >
> > -     DRM_INFO("Radeon Display Connectors\n");
> > +     drm_info(dev, "Radeon Display Connectors\n");
> >       list_for_each_entry(connector, &dev->mode_config.connector_list, =
head) {
> >               radeon_connector =3D to_radeon_connector(connector);
> > -             DRM_INFO("Connector %d:\n", i);
> > -             DRM_INFO("  %s\n", connector->name);
> > +             drm_info(dev, "Connector %d:\n", i);
> > +             drm_info(dev, "  %s\n", connector->name);
> >               if (radeon_connector->hpd.hpd !=3D RADEON_HPD_NONE)
> > -                     DRM_INFO("  %s\n", hpd_names[radeon_connector->hp=
d.hpd]);
> > +                     drm_info(dev, "  %s\n", hpd_names[radeon_connecto=
r->hpd.hpd]);
> >               if (radeon_connector->ddc_bus) {
> > -                     DRM_INFO("  DDC: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x=
%x 0x%x\n",
> > +                     drm_info(dev, "  DDC: 0x%x 0x%x 0x%x 0x%x 0x%x 0x=
%x 0x%x 0x%x\n",
> >                                radeon_connector->ddc_bus->rec.mask_clk_=
reg,
> >                                radeon_connector->ddc_bus->rec.mask_data=
_reg,
> >                                radeon_connector->ddc_bus->rec.a_clk_reg=
,
> > @@ -790,11 +791,11 @@ static void radeon_print_display_setup(struct drm=
_device *dev)
> >                                radeon_connector->ddc_bus->rec.y_clk_reg=
,
> >                                radeon_connector->ddc_bus->rec.y_data_re=
g);
> >                       if (radeon_connector->router.ddc_valid)
> > -                             DRM_INFO("  DDC Router 0x%x/0x%x\n",
> > +                             drm_info(dev, "  DDC Router 0x%x/0x%x\n",
> >                                        radeon_connector->router.ddc_mux=
_control_pin,
> >                                        radeon_connector->router.ddc_mux=
_state);
> >                       if (radeon_connector->router.cd_valid)
> > -                             DRM_INFO("  Clock/Data Router 0x%x/0x%x\n=
",
> > +                             drm_info(dev, "  Clock/Data Router 0x%x/0=
x%x\n",
> >                                        radeon_connector->router.cd_mux_=
control_pin,
> >                                        radeon_connector->router.cd_mux_=
state);
> >               } else {
> > @@ -804,35 +805,46 @@ static void radeon_print_display_setup(struct drm=
_device *dev)
> >                           connector->connector_type =3D=3D DRM_MODE_CON=
NECTOR_DVIA ||
> >                           connector->connector_type =3D=3D DRM_MODE_CON=
NECTOR_HDMIA ||
> >                           connector->connector_type =3D=3D DRM_MODE_CON=
NECTOR_HDMIB)
> > -                             DRM_INFO("  DDC: no ddc bus - possible BI=
OS bug - please report to xorg-driver-ati@lists.x.org\n");
> > +                             drm_info(dev, "  DDC: no ddc bus - possib=
le BIOS bug - please report to xorg-driver-ati@lists.x.org\n");
> >               }
> > -             DRM_INFO("  Encoders:\n");
> > +             drm_info(dev, "  Encoders:\n");
> >               list_for_each_entry(encoder, &dev->mode_config.encoder_li=
st, head) {
> >                       radeon_encoder =3D to_radeon_encoder(encoder);
> >                       devices =3D radeon_encoder->devices & radeon_conn=
ector->devices;
> >                       if (devices) {
> >                               if (devices & ATOM_DEVICE_CRT1_SUPPORT)
> > -                                     DRM_INFO("    CRT1: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    CRT1: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_CRT2_SUPPORT)
> > -                                     DRM_INFO("    CRT2: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    CRT2: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_LCD1_SUPPORT)
> > -                                     DRM_INFO("    LCD1: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    LCD1: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_DFP1_SUPPORT)
> > -                                     DRM_INFO("    DFP1: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    DFP1: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_DFP2_SUPPORT)
> > -                                     DRM_INFO("    DFP2: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    DFP2: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_DFP3_SUPPORT)
> > -                                     DRM_INFO("    DFP3: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    DFP3: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_DFP4_SUPPORT)
> > -                                     DRM_INFO("    DFP4: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    DFP4: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_DFP5_SUPPORT)
> > -                                     DRM_INFO("    DFP5: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    DFP5: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_DFP6_SUPPORT)
> > -                                     DRM_INFO("    DFP6: %s\n", encode=
r_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    DFP6: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_TV1_SUPPORT)
> > -                                     DRM_INFO("    TV1: %s\n", encoder=
_names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    TV1: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                               if (devices & ATOM_DEVICE_CV_SUPPORT)
> > -                                     DRM_INFO("    CV: %s\n", encoder_=
names[radeon_encoder->encoder_id]);
> > +                                     drm_info(dev, "    CV: %s\n",
> > +                                             encoder_names[radeon_enco=
der->encoder_id]);
> >                       }
> >               }
> >               i++;
> > @@ -1747,7 +1759,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_cr=
tc *crtc,
> >                                * (ie all encoder can work with the same
> >                                *  scaling).
> >                                */
> > -                             DRM_ERROR("Scaling not consistent across =
encoder.\n");
> > +                             drm_err(dev, "Scaling not consistent acro=
ss encoder.\n");
> >                               return false;
> >                       }
> >               }
>
