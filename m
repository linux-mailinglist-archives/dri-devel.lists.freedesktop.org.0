Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47253AAC900
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910C110E6E0;
	Tue,  6 May 2025 15:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TczUgbZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C15E10E6E0;
 Tue,  6 May 2025 15:02:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ff6ce72844so549758a91.2; 
 Tue, 06 May 2025 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746543767; x=1747148567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vktEqjsuV79dKuAmz5AcIDcSZ1EaHWsuQpXRAcNjy50=;
 b=TczUgbZnb7E+exo19daw2UHrzXoyDUllSVPXAhZlOvllSqy/zmpsu/CqdmFa3WRHFk
 GtwnDgOZQ0iAkAUUEA1zXxtqz0YzO9JX4rE8kD2/f1qcsL4+JpfzTRxiXq66WsS5IBJE
 1XlrI8wvXqlhDJuW1tl6TAI8ILtHszUpBfbekzmqd6jKwakP2HxkrqfxMJOz61Yar1GY
 YSArwPBD9VgLQ2zEkxJ1oE/odwuWP86fZQzMgOJKZhwuVNoB+zFJv7dczlM5gWTjSbZh
 fsKI3FFe5Mx0CFDX3YUagw2rMiVOQldQcNFkMDdoifvt4goo3QwVBp2+ZNyndqxxsaPP
 VYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746543767; x=1747148567;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vktEqjsuV79dKuAmz5AcIDcSZ1EaHWsuQpXRAcNjy50=;
 b=pLufKjLEH0VVZZfK//sydlV/h7Y0xnL0w/w8Vy0ISVs/SQ/c9LcgYG2Z8WcAOUKRT/
 tXQIqVw0gsBHm/MuynLS8l1CpqjXI4nNRegSAP0rEwqZmGQqr6k7v0r0sJZQUCXNpwqD
 SMF4pDih2ijbmUeMWlMOYPdxt3+lrP1KM5iS97kyd2NlWRrxcNCJaIFhzsvLHEoLBomg
 YdkBVbeZIReLoccaawGioc4sX82T/qmoz6tusGXlCi+T/iR/QHWkXktNYDtktqOLiv7U
 7K/1nMK2Pm5gJt0kV/tlv4ejcH4+3Bg4e7A7qo6/7fugvC2L+mxEHwDTlTNsC6/lXMgA
 AyBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXlsYhDLMEQqjOFEZVZafuLVX3M5F53TXz0axRhtjECdzIUtmjlaI4jdrnlWZECwU516bSXSu2@lists.freedesktop.org,
 AJvYcCVPw4+i87Om7sIV606UA9LpNoUGpZb8GfRUyI2so+hJCKFBLbUnqi+G6HOMg6ggyokt+fTM+jgTh9rM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEmq4ZfJ+RrDoMNuu+ZIGugCtkz44lN95LQUZf0zIWNeKPo4vF
 YUyj5wbf3sSXd+9jtrqXGO6KUyY0QJMUYhd7M3Rv9VJPYXy6eUkiZirEKouEELG/q7+2iP0k5By
 1T4TcKrZOw+1dX4FPksfrYeYnjIMK1Q==
X-Gm-Gg: ASbGncsithAs/X1p8p6a/kJPOLpNJKmUJrezCfassBNe3TW8M5YT2z0K5/Q3HnZO03V
 zEjncPz2cA7BTOEmrdlBMJJZCTSzhHDc8YlZfSRUFUo+isZv/ll6cwQljorHCyvWTj+pGYxcORL
 aOtnJE1gx/9aBrTSyUxQGVKw==
X-Google-Smtp-Source: AGHT+IHZJQerd5lYSgmKXFBIMwEXybKqQi7T2CP9X5INnCGIYqT3c4QEYnsAvtwWrnxL4AncipR/8wXzDf9JUdFle5I=
X-Received: by 2002:a17:90b:4d07:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-30a4e69f90dmr9231704a91.3.1746543766820; Tue, 06 May 2025
 08:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250505225634.2688578-1-sashal@kernel.org>
 <20250505225634.2688578-229-sashal@kernel.org>
In-Reply-To: <20250505225634.2688578-229-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 May 2025 11:02:34 -0400
X-Gm-Features: ATxdqUEpmmNKQiGhMbisn4FhardjqBOJI2VMqCRzuJwevOedc0cvX0fCONYxO10
Message-ID: <CADnq5_OGPGwbKfFSP6BpNAhtOXnZ+L3Vmga9TxLDAAub=bu9JA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 229/294] drm/amd/display/dc: enable oem i2c
 support for DCE 12.x
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Mon, May 5, 2025 at 7:04=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Alex Deucher <alexander.deucher@amd.com>
>
> [ Upstream commit 2ed83f2cc41e8f7ced1c0610ec2b0821c5522ed5 ]
>
> Use the value pulled from the vbios just like newer chips.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This is a new feature not a bug fix and this change only makes sense
with the other changes in kernel 6.15.

Alex

> ---
>  .../drm/amd/display/dc/dce120/dce120_resource.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c b/dr=
ivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> index 18c5a86d2d614..21f10fd8e7025 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> @@ -67,6 +67,7 @@
>  #include "reg_helper.h"
>
>  #include "dce100/dce100_resource.h"
> +#include "link.h"
>
>  #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
>         #define mmDP0_DP_DPHY_INTERNAL_CTRL             0x210f
> @@ -659,6 +660,12 @@ static void dce120_resource_destruct(struct dce110_r=
esource_pool *pool)
>
>         if (pool->base.dmcu !=3D NULL)
>                 dce_dmcu_destroy(&pool->base.dmcu);
> +
> +       if (pool->base.oem_device !=3D NULL) {
> +               struct dc *dc =3D pool->base.oem_device->ctx->dc;
> +
> +               dc->link_srv->destroy_ddc_service(&pool->base.oem_device)=
;
> +       }
>  }
>
>  static void read_dce_straps(
> @@ -1054,6 +1061,7 @@ static bool dce120_resource_construct(
>         struct dc *dc,
>         struct dce110_resource_pool *pool)
>  {
> +       struct ddc_service_init_data ddc_init_data =3D {0};
>         unsigned int i;
>         int j;
>         struct dc_context *ctx =3D dc->ctx;
> @@ -1257,6 +1265,15 @@ static bool dce120_resource_construct(
>
>         bw_calcs_data_update_from_pplib(dc);
>
> +       if (dc->ctx->dc_bios->fw_info.oem_i2c_present) {
> +               ddc_init_data.ctx =3D dc->ctx;
> +               ddc_init_data.link =3D NULL;
> +               ddc_init_data.id.id =3D dc->ctx->dc_bios->fw_info.oem_i2c=
_obj_id;
> +               ddc_init_data.id.enum_id =3D 0;
> +               ddc_init_data.id.type =3D OBJECT_TYPE_GENERIC;
> +               pool->base.oem_device =3D dc->link_srv->create_ddc_servic=
e(&ddc_init_data);
> +       }
> +
>         return true;
>
>  irqs_create_fail:
> --
> 2.39.5
>
