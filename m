Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF6AAC8AC
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 16:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B021B10E360;
	Tue,  6 May 2025 14:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G3gC5+eO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480710E360;
 Tue,  6 May 2025 14:51:57 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-30a8c177f39so78135a91.3; 
 Tue, 06 May 2025 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746543117; x=1747147917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrvQLl0wy1XN7F1KXa2GtXnCc3OPj79LA4bOD8IjDg4=;
 b=G3gC5+eOdB6RDRTgWt4N1ZEdyYtgp8Zy6A+EJXTHMJGATOlyGIOJPqDEiZ7hXWKtSG
 2Osk3wpafzA/KhnGKoQYM15No6nIZkzYPaZoVplRPSgANdb8+RLVTAUWQRnxH7dBefvk
 77c1KWhsOlSzhMX8NkgU/Mg8KU92gX/6S4wC82iO2ectCkaQqQyHcMD7b83uJX7ws/wH
 6vWh8wAaHPgw+Z25vabjxbLtSnf0PNVKbpT4L56c/ISvI5OJ/KQc73E9DOZdWoQ0M28E
 g3uJjvIIiqo0YOdUQOHnCRezvFHiofJZ5u0EmHqJm4UEM4LWjqm25Je3Dz5rX4E1a97m
 A9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746543117; x=1747147917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrvQLl0wy1XN7F1KXa2GtXnCc3OPj79LA4bOD8IjDg4=;
 b=BWQUcjz/OVYp8O0/hsES3G0aQGtTVUAhVd0CgZcXubQyp6DcS7FA0MdfImkg+nXeWe
 daIbso8o0Ni+7YQXCOZR/gnpzXmHpXgp5a+BWvF2FNpjYNZMQUeAEuQ4SUA+J5rMT+T8
 c/YxPd4XB7vAIhE1oqUc9OeUtJ6C6NEKrAEfSmCAWoMHQmA8qHJMO9nqEW7iIfOx6EDK
 zromYY+lP60qCjRoROLFSsisV8tCHEekTw9ZHFDkrZFRqFLHOFHtNgGVuxwNwSgO4P/n
 xSGTCPBiAAWxIpxnugVrcRuawNtpQ60OO6PDR14rpxZR6u5dR10xxCKEbHPateUsVaV3
 J/vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtY9klHxCHfFTMk84/Q9x5WPY/Xenne8igxSaASAbb5xfZICyMwpy3kM6dLue4rdoqotwlif4ELbSU@lists.freedesktop.org,
 AJvYcCXt5vOYxhd0eICGO6JgNqy0+jxZwRUEJQd+jqZ04OUnsQmElIZfSMr6rjigD5J/r8+AFfhZIfRO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygK8GtbTNHANgyHQTp0xl+bj2tJn+/yxepXsiJCdvHYP+DqXHu
 Ha1ccV6rvVTPUocsbRK7qeGMjQdAxiKAnjWU8Ox5BUknqGqqImKawHNgXY+EHmc5qSYCCFW7Dat
 Wb18ikgzXeSeKstfm4f0pv6KfoFM=
X-Gm-Gg: ASbGncv4JIwTuWSbLxnA0kQfx3GcsllvV/+5wD5kow2TR4COn6/x6Ae2WkNcy9mVC61
 itqX+hABRF8CJ7XEEu5MYAvaeZvo2JQN+xcudBlKqG59knrWgggm9kH2hC45UA9XDP1QWN/8RJi
 oCO4ZBDKvXbq/oDJVNNhnfcw==
X-Google-Smtp-Source: AGHT+IEXSCTDToZhh1jFM95PCZ0I/E206Rg+MKBboqgunyBsE/pFYw40iBWN2ZEpR0s0+75jhOyYC81tR+CvcVK4+P8=
X-Received: by 2002:a17:90b:1d8b:b0:2ff:7970:d2bd with SMTP id
 98e67ed59e1d1-30a4e6913e8mr9498552a91.5.1746543116650; Tue, 06 May 2025
 07:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250505221419.2672473-1-sashal@kernel.org>
 <20250505221419.2672473-483-sashal@kernel.org>
In-Reply-To: <20250505221419.2672473-483-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 May 2025 10:51:44 -0400
X-Gm-Features: ATxdqUHNIz2XY7_fK65CkP4RU9ZYclbCYI52nxG7JH7RRQaFM7OP72dHJwqOZKo
Message-ID: <CADnq5_MHZSO6aRTKuZ_NJUiDCDfxkUCGQzg9fRwEhcMo5goQww@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.14 483/642] drm/amd/display/dc: enable oem i2c
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

On Mon, May 5, 2025 at 6:34=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
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

This isn't a bug fix.  This is a new feature and depends on other
changes to actually utilize.

Alex

> ---
>  .../dc/resource/dce120/dce120_resource.c        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c
> index c63c596234333..eb1e158d34361 100644
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
