Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78963C83854
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E339F10E296;
	Tue, 25 Nov 2025 06:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEwiCI4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2628410E296
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:45:41 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-4331709968fso22007245ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764053140; x=1764657940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IsF5eyPm5D0gid1WP94EjKSLX8fKCt2A7fCrcAWZGhA=;
 b=mEwiCI4F4FAJraTFsE4vsYnIosk/Dv+F1EHiM0oe3vardyGUtUu6+ktOk6jo0kQIOp
 Zv1tfRwNFps3pTvuQA8wLPq0tKlYtDeQqp6a/W/PUSoqAvNR7prW35Zl3c8FeuTKU3N4
 yOweLYOoGrIwtZSreUO5ntW0xJaPvzm+wV4oX11b1llDHC0E4jidWYqkjXNHeQUNXy0t
 572y56I0NnaSsfeXza/sl9uQ9nmEVdqTD3gjps04jnqYFURmyo5VD66MMZ7ZB/8OJX4G
 KZOawKaw9usJdzvY+yi50zXlJrBP2HFPp/KtXL5dDfNcq7YwpuRuzrFYLeToncjfZ/A4
 5Ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053140; x=1764657940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IsF5eyPm5D0gid1WP94EjKSLX8fKCt2A7fCrcAWZGhA=;
 b=q8UkNdL/7wABECLmSDbj2RurookEr85vWZ6H4RXh2j7PN/hHUuDGmEKw4yXSRndWaA
 pMt6r15eTzEzW6HKC1kau9nzB5WhN5eygw1LcjHO+YIyVHCxRJeA7lsj9aS/jAzJAKCS
 eoVBLiQYSBC0tfeTmSoVgDnL3VR4ThR2grgMW9aaBdNibWQeh/AxpV4LtN3pjteyyu8A
 F0N0Gxgs4EpuUDp1fkEX3kMq8d1m9P8GqiS8DfHVVpfkQNsMhQjM8RcQ8hA4VJCocQ9Z
 z6Uc32y/CkTXsK/iVXO6I38I9yg65UR56SUO/AuC2ym7/MZVU0VsScVivVGvPsKpT6VC
 aJQg==
X-Gm-Message-State: AOJu0YyeaBUmKH0etISAPBk8B7r3fUFMmiz77qhHfflEupy9hgDFXJXR
 LhYs9Dz+OWODZghaz5wR/6cqABuDQAHj5wd1kUYU1Q883F/e186K7KRiu+PRAQU7O3g4buoI6qk
 zJISzy/jYAaXidZiCDXoHr9nMAvw5n9s=
X-Gm-Gg: ASbGnctWiVTfXw+haAG2iCBfiiyqF5kxxi6kzazW+BPxc2XVzItCE3D4bnssuZPJTwi
 zwfnLxgESXPVnTPOiddb7xMqJkqJ10K97MbU2EJni2w5E5NlbiAF4VgsylPlSsy78G+I8ApMyQI
 0NxClSvGBqJL1N+U27X2q4u5wZFX1I0gw5/zApiutDiOjh8gUkh7tZn8TNro8iahl81jWi3pquD
 wnOIV1RfSKkqzxEd7b2vvuwa2s6k68lPfZa+o0JQFlU36gEDy/nDSbvyNCvBPC7nQ8HrpxwvSwC
 ycXBUTs=
X-Google-Smtp-Source: AGHT+IFlwpM/STs/M4A8Gps/6JrLLw9BZ3rwafDm87wpn52a9KZ2S9oV3t9bnIxT/s4MLRSBU9V9esqgc398fqtS//I=
X-Received: by 2002:a05:6638:3005:b0:5b7:3ab8:b3e6 with SMTP id
 8926c6da1cb9f-5b967a03b20mr12368791173.5.1764053140073; Mon, 24 Nov 2025
 22:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20251118105934.748955-1-rk0006818@gmail.com>
 <20251118105934.748955-4-rk0006818@gmail.com>
In-Reply-To: <20251118105934.748955-4-rk0006818@gmail.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 25 Nov 2025 12:15:28 +0530
X-Gm-Features: AWmQ_blOG8GEza5G6XzhJM41xBln2w1aYZJbuz28zwuHh0bWqYflD3KPVWNuuJ8
Message-ID: <CAKY2RyYgvr3z_KZKjEgcVLqKZ8Sq0hb+eoXkhFTPfFqU3N=STg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/komeda: Convert logging in d71_dev.c to drm_*
 with drm_device parameter
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Liviu,

On Tue, Nov 18, 2025 at 4:32=E2=80=AFPM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Replace DRM_DEBUG() and DRM_ERROR() calls in
> drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c with the
> drm_dbg() and drm_err() helpers in functions where a drm_device
> parameter is available.
>
> The drm_*() logging macros require a struct drm_device * parameter,
> which allows the DRM core to prefix log messages with the device
> instance. This improves debugging clarity when multiple Komeda or
> other DRM devices are present.
>
> Logging in early hardware probing functions such as d71_identify()
> is intentionally left unchanged because they do not have access to
> a drm_device pointer at that stage of initialization.
>
> This conversion follows the DRM TODO entry:
> "Convert logging to drm_* functions with drm_device parameter".
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
> Changes since v1:
> - Fixed incorrect use of dev_get_drvdata(): it returns struct komeda_drv =
*,
>   not struct komeda_kms_dev *, as pointed out by Liviu Dudau.
> - Updated DRM device pointer retrieval to use drv->kms.
> - Combined both changes into a 0/3 series.
> Link to v1:
> https://lore.kernel.org/all/aRdT1qscQqO7-U6h@e110455-lin.cambridge.arm.co=
m/
> ---
>  .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 24 +++++++++++++------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/g=
pu/drm/arm/display/komeda/d71/d71_dev.c
> index 80973975bfdb..39c51bbe2bb9 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_print.h>
>  #include "d71_dev.h"
>  #include "malidp_io.h"
> +#include "komeda_drv.h"
>
>  static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
>  {
> @@ -348,6 +349,9 @@ static void d71_cleanup(struct komeda_dev *mdev)
>
>  static int d71_enum_resources(struct komeda_dev *mdev)
>  {
> +       struct komeda_drv *drv =3D dev_get_drvdata(mdev->dev);
> +       struct komeda_kms_dev *kms =3D drv->kms;
> +       struct drm_device *drm =3D &kms->base;
>         struct d71_dev *d71;
>         struct komeda_pipeline *pipe;
>         struct block_header blk;
> @@ -366,7 +370,7 @@ static int d71_enum_resources(struct komeda_dev *mdev=
)
>
>         err =3D d71_reset(d71);
>         if (err) {
> -               DRM_ERROR("Fail to reset d71 device.\n");
> +               drm_err(drm, "Fail to reset d71 device.\n");
>                 goto err_cleanup;
>         }
>
> @@ -376,8 +380,8 @@ static int d71_enum_resources(struct komeda_dev *mdev=
)
>         d71->num_pipelines =3D (value >> 8) & 0x7;
>
>         if (d71->num_pipelines > D71_MAX_PIPELINE) {
> -               DRM_ERROR("d71 supports %d pipelines, but got: %d.\n",
> -                         D71_MAX_PIPELINE, d71->num_pipelines);
> +               drm_err(drm, "d71 supports %d pipelines, but got: %d.\n",
> +                       D71_MAX_PIPELINE, d71->num_pipelines);
>                 err =3D -EINVAL;
>                 goto err_cleanup;
>         }
> @@ -455,8 +459,8 @@ static int d71_enum_resources(struct komeda_dev *mdev=
)
>                 offset +=3D D71_BLOCK_SIZE;
>         }
>
> -       DRM_DEBUG("total %d (out of %d) blocks are found.\n",
> -                 i, d71->num_blocks);
> +       drm_dbg(drm, "total %d (out of %d) blocks are found.\n",
> +               i, d71->num_blocks);
>
>         return 0;
>
> @@ -555,6 +559,9 @@ static void d71_init_fmt_tbl(struct komeda_dev *mdev)
>
>  static int d71_connect_iommu(struct komeda_dev *mdev)
>  {
> +       struct komeda_drv *drv =3D dev_get_drvdata(mdev->dev);
> +       struct komeda_kms_dev *kms =3D drv->kms;
> +       struct drm_device *drm =3D &kms->base;
>         struct d71_dev *d71 =3D mdev->chip_data;
>         u32 __iomem *reg =3D d71->gcu_addr;
>         u32 check_bits =3D (d71->num_pipelines =3D=3D 2) ?
> @@ -569,7 +576,7 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
>         ret =3D dp_wait_cond(has_bits(check_bits, malidp_read32(reg, BLK_=
STATUS)),
>                         100, 1000, 1000);
>         if (ret < 0) {
> -               DRM_ERROR("timed out connecting to TCU!\n");
> +               drm_err(drm, "timed out connecting to TCU!\n");
>                 malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE)=
;
>                 return ret;
>         }
> @@ -582,6 +589,9 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
>
>  static int d71_disconnect_iommu(struct komeda_dev *mdev)
>  {
> +       struct komeda_drv *drv =3D dev_get_drvdata(mdev->dev);
> +       struct komeda_kms_dev *kms =3D drv->kms;
> +       struct drm_device *drm =3D &kms->base;
>         struct d71_dev *d71 =3D mdev->chip_data;
>         u32 __iomem *reg =3D d71->gcu_addr;
>         u32 check_bits =3D (d71->num_pipelines =3D=3D 2) ?
> @@ -593,7 +603,7 @@ static int d71_disconnect_iommu(struct komeda_dev *md=
ev)
>         ret =3D dp_wait_cond(((malidp_read32(reg, BLK_STATUS) & check_bit=
s) =3D=3D 0),
>                         100, 1000, 1000);
>         if (ret < 0) {
> -               DRM_ERROR("timed out disconnecting from TCU!\n");
> +               drm_err(drm, "timed out disconnecting from TCU!\n");
>                 malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE)=
;
>         }
>
> --
> 2.43.0


Just following up on my v2 Komeda logging patch series.
Please let me know if any changes or suggestions are needed.

Thanks,
Rahul
