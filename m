Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDAAAC90A
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BBC10E6B9;
	Tue,  6 May 2025 15:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GkpSQQcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6CE10E6B5;
 Tue,  6 May 2025 15:04:28 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b0459668101so369448a12.2; 
 Tue, 06 May 2025 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746543868; x=1747148668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4N5L0OBe3ScafzL36/5ps8MdmhuELISisHME8PJ2jE=;
 b=GkpSQQcIwgE3XFacPDFbqOSw1K6hiawhrUcobEOlraWRn18gJ6yFuDNs5APZDh3BH7
 p4J4ANILnUKjtsYOiCFqP26Cc2kOaa5W9YWgfDYAwSsuMUYnJYsgPcMeTERUmHqVJqNS
 TgnqUiHAF0dBRPB3QC/mj4NCN7Ttx7rzA+mL11LH7TkQThmzVZxH3sw58G1Q8jHKmDN3
 hODE8vG/SIpMQzWnjAZdPBLBypTeLBivKxsp6XU/S425s+mSn8OijhlF0hf+3VFwRsMA
 riwzAhpYiD0qrXLjjtOiHqZmON2Vkl8DUcvFQ+kwAX5sYXNaPpU5E2ID0m4NSm+pdk4T
 0C9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746543868; x=1747148668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4N5L0OBe3ScafzL36/5ps8MdmhuELISisHME8PJ2jE=;
 b=VfthY1OMvh7rnbX9u7EgXW+S98iTpJKPt6bl1b62SVoAZeMFDIO4TYFIz9x0/9HzA2
 3UfBVNlowLZ/csuBfVN+QQpFWkIYil1k0GhIRp6a2TS3WOGJTpdBrnkJoy3A0KjGaXVy
 KLqqo8iU3xqv4k3V7JiMGvWhbayzVTbnBNFHsULkEx64RwnzeEYBk8EowzlnqDZOFRCI
 FsKU8l5sOoE71IG4TlI0EY60rG5rfYPjzC30b2WYarqViQ/R/LkF7AC6+WYUyhq1uE/W
 JZm0iLHYc4vF8hNnI/qtPPPZ4oxQpELWDjRAOM44HlflGA/LO4z5ei5HCHZ9u+xkSIzv
 ASKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7upjdla52O3Jx23efb6iT/sOm6Bi2D/a1YvIkRdAqk/Shd82LR4vV1133648QJRYjwBGw4S96@lists.freedesktop.org,
 AJvYcCXWQG9Eg38BpECh6DCZkhXna43iBHUSdY58Bh2vQNw+OijAu8IJrnDevejph3akNRrGEP4YpcbpzkJC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMoPTsE/iEA0g9DVCEkCUn0Oj1pS5Qlj/zuGLA32YQ44oVOMvN
 nuj+gqY7iI2HO+zpHoJslIFKScjzexerTlplaBRVRs2R1hZo5anvd6XqcE6IBKlvHkEEkMRYJbf
 iwqanIaMzFe4UvL0xWjMABlQWA1E=
X-Gm-Gg: ASbGncvXyAjhPRQvwdUFjlgP/MDziVxE2S6ZPZYWBXiNf+wes9jg7jnNtsJY/a1zRvq
 87jXRUpqcRlAQGp/F3Hb4xTUCBr5v7UGIX8HLeA6Jyy/VsoCeB2URg4DQyl4cuKUTKsfZ1bbWga
 64h3Zmm3pK8hqzy2ehJeLu6Q==
X-Google-Smtp-Source: AGHT+IEwhGFD8IpYiUNhIRLVGumkHh+0GyHsr9sLU3ivDsfBTh2hkFmQUsf7kNoEKGjP7WIXJpifuA65WP3UfME/oGg=
X-Received: by 2002:a17:90a:2c83:b0:30a:9935:bea8 with SMTP id
 98e67ed59e1d1-30a9935c11fmr469594a91.8.1746543867772; Tue, 06 May 2025
 08:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250505223922.2682012-1-sashal@kernel.org>
 <20250505223922.2682012-376-sashal@kernel.org>
In-Reply-To: <20250505223922.2682012-376-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 May 2025 11:04:16 -0400
X-Gm-Features: ATxdqUH3rURebALiwxQAtHGTZB9JcLWKbXWjGIu3U-Z3H9ymj5qHKILAnoy8wd0
Message-ID: <CADnq5_PTVy-gTr=xWnTULQfUsBYY9WbyL1yZ45ew+OPHpO8xdA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 376/486] drm/amd/display/dc: enable oem i2c
 support for DCE 12.x
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 roman.li@amd.com, srinivasan.shanmugam@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Mon, May 5, 2025 at 6:53=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
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

This is not a bug fix.  It's only applicable as part of a new feature
that was added in 6.15.

Alex

> ---
>  .../dc/resource/dce120/dce120_resource.c        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c
> index 621825a51f46e..a2ab6776b8855 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c
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
