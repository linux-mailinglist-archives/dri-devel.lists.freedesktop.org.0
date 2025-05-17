Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D2DABA787
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 03:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3065F10E06D;
	Sat, 17 May 2025 01:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TA+R+Nn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A5710E06D;
 Sat, 17 May 2025 01:23:11 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so527722466b.3; 
 Fri, 16 May 2025 18:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747444989; x=1748049789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25iFNJ5FYOB28Ks45PjA86xu93MkwtBe+kaVmwZePmc=;
 b=TA+R+Nn3UUhA63XkQu7AVVbjgjJ4ozvOpe0o9O2sprlGs14cppd8gzdPTNIBvGGuoe
 xG53YZmCK9e2Uru0khKSdtV4IB6hIsgG3SkzF1Mo98wCoLgMHMPmfhhwYipKga2VurLL
 vyo4y5UOOCyP2UAC/WFz6n/LBFYaFlIeWF6ABkaz7liqJ5ACu0Pz9G8pmvu150bh063w
 3bPQfYSm8akS1QaRlOyJYWGkkZ5LtO7enP+yiXyUdRNI0xHxolnFAFG60UBMM32l9m5h
 /Z5fhXfE3LCZJC2lKR2FMt1gDUNjnVu9YjjuNjiYq+Sgj+yRLPfxm9HMSaJ8Q1xeeX7H
 M1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747444989; x=1748049789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=25iFNJ5FYOB28Ks45PjA86xu93MkwtBe+kaVmwZePmc=;
 b=CSNH0j12WCN6PMJZHFA/ht8S7acYH3bZsuRcmsFoTO9cCvBRLWCJ13Z2LRDcT/pR+/
 ORR1JFgVr+JZe9r4hJDPcy/2E5YQJW6gA606gM9B9oOUL3VDDdZ15wH+rn2B9dqDVsN8
 USGBoQUk/32393q4c2c1gITbzDVVv7BiB+1ssL5nHDXiphs0U6rP1nVQXdCCWLrx3gss
 +QHWR2qohV4xJq8SVakTuXCgyEDEuiMbU261q1YlzLW6VNtFoB6QwxbGDVjZTXgAHjN+
 LF+98p2LXsGUQ3zoFrHMaJ3sxENOur9BhSL5NUCteX/F2l8/nYoxMKZ3pmSYSKH7pveY
 agvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmu3C1s3jKju+warmZNeKVsoyTHL2TGE5ry+PrNmIDeJLLHR31ckr8zkiGsLMO+yhQ90l915eQEMhqJYHapQ==@lists.freedesktop.org,
 AJvYcCWPoMe9TXfSE7BXZePhFZ1c7TiQyXmtu1Ypu4zHjZ4zzh4D7fnaS7OO+d0K240rvOk022moVhxZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+mg7r4e77SZ9D0aWmeN47TEu+x3D6axdHzdybTHVwhpRZEr87
 n1QFKk0FV94Ql7eMkSg9eFnTkpYL0TrFv9uWxvw/zU64ad1YpO+j7m4anRir2OGaXnrKx0PKSUP
 MFDIjuIW0gcPmJpEoybqcV/Qnk0Fd35Q=
X-Gm-Gg: ASbGncu4gC+j6NQQM36eohMeWE1BBSxXkDy7w7SSrGNwsiM2iebWgZuKxn9AhgIjUxp
 U9ozIzsG3T2ugsou9bbU8oWtQuBBrBIMDSP64xqsui0b7rdoXEJaQ1mrNU52MM/JaUm/Wh3ygm8
 M3yvw7fMhHG6bAgki40yhqMksngI1KXoh2FX4AMymrRehlmrYm99rV1fuo5eRg0q0BXA==
X-Google-Smtp-Source: AGHT+IGJZZYvjvNgphG6zPo450tizZ0G45jOjPvl7iZI4z2BBNA5YMtn+7uFPFYF8eBndJAzXugGC3fw9GHpEwFqMZ8=
X-Received: by 2002:a17:907:7ba3:b0:ad4:d0b7:c990 with SMTP id
 a640c23a62f3a-ad52d4df2d5mr472506066b.26.1747444989393; Fri, 16 May 2025
 18:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
In-Reply-To: <20250326234748.2982010-41-alex.hung@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Sat, 17 May 2025 03:22:58 +0200
X-Gm-Features: AX0GCFuvD3OsCGzAPf7Ov-LvC6QAawQsojy7fJfqOKgGdwWusDq4JeBH8jLa7d0
Message-ID: <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
To: Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
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

Am Do., 27. M=C3=A4rz 2025 um 00:58 Uhr schrieb Alex Hung <alex.hung@amd.co=
m>:
>
> It is to be used to enable HDR by allowing userpace to create and pass
> 3D LUTs to kernel and hardware.
>
> new drm_colorop_type: DRM_COLOROP_3D_LUT.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> v8:
>  - Fix typo in subject (Simon Ser)
>  - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
>  - Delete empty lines (Simon Ser)
>
> v7:
>  - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon =
Ser)
>
>  drivers/gpu/drm/drm_atomic.c      |  6 +++
>  drivers/gpu/drm/drm_atomic_uapi.c |  6 +++
>  drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         | 21 +++++++++
>  include/uapi/drm/drm_mode.h       | 33 ++++++++++++++
>  5 files changed, 138 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 0efb0ead204a..ef47a06344f3 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct dr=
m_printer *p,
>         case DRM_COLOROP_MULTIPLIER:
>                 drm_printf(p, "\tmultiplier=3D%llu\n", state->multiplier)=
;
>                 break;
> +       case DRM_COLOROP_3D_LUT:
> +               drm_printf(p, "\tsize=3D%d\n", colorop->lut_size);
> +               drm_printf(p, "\tinterpolation=3D%s\n",
> +                          drm_get_colorop_lut3d_interpolation_name(color=
op->lut3d_interpolation));
> +               drm_printf(p, "\tdata blob id=3D%d\n", state->data ? stat=
e->data->base.id : 0);
> +               break;
>         default:
>                 break;
>         }
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 947c18e8bf9b..d5d464b4d0f6 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -719,6 +719,10 @@ static int drm_atomic_color_set_data_property(struct=
 drm_colorop *colorop,
>         case DRM_COLOROP_CTM_3X4:
>                 size =3D sizeof(struct drm_color_ctm_3x4);
>                 break;
> +       case DRM_COLOROP_3D_LUT:
> +               size =3D colorop->lut_size * colorop->lut_size * colorop-=
>lut_size *
> +                      sizeof(struct drm_color_lut);
> +               break;
>         default:
>                 /* should never get here */
>                 return -EINVAL;
> @@ -771,6 +775,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *c=
olorop,
>                 *val =3D state->multiplier;
>         } else if (property =3D=3D colorop->lut_size_property) {
>                 *val =3D colorop->lut_size;
> +       } else if (property =3D=3D colorop->lut3d_interpolation_property)=
 {
> +               *val =3D colorop->lut3d_interpolation;
>         } else if (property =3D=3D colorop->data_property) {
>                 *val =3D (state->data) ? state->data->base.id : 0;
>         } else {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index e03706e7179b..224c6be237d2 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type=
_enum_list[] =3D {
>         { DRM_COLOROP_1D_LUT, "1D LUT" },
>         { DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>         { DRM_COLOROP_MULTIPLIER, "Multiplier"},
> +       { DRM_COLOROP_3D_LUT, "3D LUT"},
>  };
>
>  static const char * const colorop_curve_1d_type_names[] =3D {
> @@ -82,6 +83,11 @@ static const struct drm_prop_enum_list drm_colorop_lut=
1d_interpolation_list[] =3D
>         { DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
>  };
>
> +
> +static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_l=
ist[] =3D {
> +       { DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
> +};
> +
>  /* Init Helpers */
>
>  static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *=
colorop,
> @@ -349,6 +355,51 @@ int drm_colorop_mult_init(struct drm_device *dev, st=
ruct drm_colorop *colorop,
>  }
>  EXPORT_SYMBOL(drm_colorop_mult_init);
>
> +int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *c=
olorop,
> +                          struct drm_plane *plane,
> +                          uint32_t lut_size,
> +                          enum drm_colorop_lut3d_interpolation_type inte=
rpolation,
> +                          bool allow_bypass)
> +{
> +       struct drm_property *prop;
> +       int ret;
> +
> +       ret =3D drm_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT,=
 allow_bypass);
> +       if (ret)
> +               return ret;
> +
> +       /* LUT size */
> +       prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  =
| DRM_MODE_PROP_ATOMIC,
> +                                        "SIZE", 0, UINT_MAX);
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       colorop->lut_size_property =3D prop;
> +       drm_object_attach_property(&colorop->base, colorop->lut_size_prop=
erty, lut_size);
> +       colorop->lut_size =3D lut_size;
> +
> +       /* interpolation */
> +       prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "=
LUT3D_INTERPOLATION",

Do we ever expect this to be something with multiple options that
userspace could select? I think it would be good to keep our options
open and make this property not immutable (properties that are
sometimes but not always immutable are more annoying to deal with in
userspace).

Same applies to 1D LUTs as well.
