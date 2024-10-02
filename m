Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA898E1FC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 19:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75CC10E224;
	Wed,  2 Oct 2024 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B6ciPPp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49E110E058;
 Wed,  2 Oct 2024 17:58:52 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-71c6ea6d276so10311b3a.3; 
 Wed, 02 Oct 2024 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727891932; x=1728496732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLfkn1lM7ycmc5uJvg9Y+3m1F6E5illHhSwCELlgxaI=;
 b=B6ciPPp7QTpxygNa6fcTAtNzsteoWdhChMjy2eZmkPLU7Ixob6FQFt0EAyQyipiuzm
 TvVpGrN6+45+JnWCwbFodJvWddnFOWTIIN5xeeQBD3u2qPXq+aqI91i2mf/ojCtjeZJ7
 02G7uhQxgYeegiY968dFKmAylw6nXt8dHtbpyG/MXJrE2oyXysPTTbkIt+3adV1jJ1Zb
 yZ+XeZa0lbMj6HmXI8nsZDh5MWib8MSiLIDO4q51lMOxIAIrlgTaMWh/94HnRZX00cVS
 S6Nd5RMdoQfux5mcx3paXmQF6Z6ziVKwFt5Skmn3VqRsBfSkVLDS2Hb3edTKnClCVniH
 inqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727891932; x=1728496732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLfkn1lM7ycmc5uJvg9Y+3m1F6E5illHhSwCELlgxaI=;
 b=cJufYYgw0wDSVR3jASPMTU+w4kyhNuTOOO99lMUeDDBSyX4WdsFAzNPsZQcyLbEN+l
 0yaWKvahM4pi7cTPiYO2gvxCuHzatXCOgz8Wm5mCdF8/f4IJqIzQQM0X/d32YgDoRJbm
 fV8ZNnEyJprL/nSIxm6kVoBnc4eKJAGWVh+ba1fDWSk4rK6BMI3OXfS1i8AqsXD2AWJQ
 zhMIHxcvjKZXf7MAKpJvhUv0n9awFMtl1BsWrrSv/AgLo1zG5qpCjXKMa8HBrr5fk9Cy
 b21SdH1TrXzllQ8AvkgC5G8Kg2QRPH0SuOWmpDy6fEH/NH5ooRZaWMpAsjLs3qiQYycH
 Lv5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0nNQzkHeBwXZnsnhoHqsOJ8J7NfUPOppetkAIJwO2EwVWcBJFz3US/QGNcI+XHDzW6e0giYHT@lists.freedesktop.org,
 AJvYcCXa9+kC/RsnQu1oFIqBFfkPGeklaF1o3W9KbDu44r9VgPVN+4Zp7cKaGo4X9DzM73sAt6qfnlZEPSJP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6hYVRkBfM5uw/eulFAZ6Oew/CsS+VGVE60nyncL1mgjnA/90F
 JDPpT9hNp2amaeS39/73lo72A+KZ35Bcp52f4z3GVu5yekBhfp07JbCPDRklY6ZYEicKixDp7VO
 vl3KOlu6NEmenkNDhoN8tuJo1LjI=
X-Google-Smtp-Source: AGHT+IHtlRNM5uRFEVN6FSCHavCcGjEq0D5Hjyp+TCSnmhFR0BtpMClRHIiEQtbc9O2HGYJeKD2+1b6qLbI7bol5+yg=
X-Received: by 2002:a05:6a20:12d3:b0:1cf:4edd:e6f7 with SMTP id
 adf61e73a8af0-1d5bee0be1amr2778540637.0.1727891932175; Wed, 02 Oct 2024
 10:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <7b3ea9a6-575e-4fe5-98d9-6e53803188fa@amd.com>
 <20241002130149.1607979-1-Igor.A.Artemiev@mcst.ru>
In-Reply-To: <20241002130149.1607979-1-Igor.A.Artemiev@mcst.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2024 13:58:40 -0400
Message-ID: <CADnq5_NiUmJ3K0cYcToDQ34D9zkEREfub6CBY3iC8515ss_E3A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: check return value of amdgpu_irq_add_id()
To: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Kenneth Feng <kenneth.feng@amd.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
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

Alex

On Wed, Oct 2, 2024 at 9:28=E2=80=AFAM Igor Artemiev <Igor.A.Artemiev@mcst.=
ru> wrote:
>
> amdgpu_irq_ad_id() may fail and the irq handlers will not be registered.
> This patch adds error code check.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
> ---
> v2: Remove the cast to struct amdgpu_device as Christian K=C3=B6nig
> <christian.koenig@amd.com> suggested.
>
>  .../drm/amd/pm/powerplay/hwmgr/smu_helper.c   | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> index 79a566f3564a..50a3085c00aa 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> @@ -647,28 +647,41 @@ int smu9_register_irq_handlers(struct pp_hwmgr *hwm=
gr)
>  {
>         struct amdgpu_irq_src *source =3D
>                 kzalloc(sizeof(struct amdgpu_irq_src), GFP_KERNEL);
> +       int ret;
>
>         if (!source)
>                 return -ENOMEM;
>
>         source->funcs =3D &smu9_irq_funcs;
>
> -       amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +       ret =3D amdgpu_irq_add_id(hwmgr->adev,
>                         SOC15_IH_CLIENTID_THM,
>                         THM_9_0__SRCID__THM_DIG_THERM_L2H,
>                         source);
> -       amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +       if (ret)
> +               goto err;
> +
> +       ret =3D amdgpu_irq_add_id(hwmgr->adev,
>                         SOC15_IH_CLIENTID_THM,
>                         THM_9_0__SRCID__THM_DIG_THERM_H2L,
>                         source);
> +       if (ret)
> +               goto err;
>
>         /* Register CTF(GPIO_19) interrupt */
> -       amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +       ret =3D amdgpu_irq_add_id(hwmgr->adev,
>                         SOC15_IH_CLIENTID_ROM_SMUIO,
>                         SMUIO_9_0__SRCID__SMUIO_GPIO19,
>                         source);
> +       if (ret)
> +               goto err;
>
>         return 0;
> +
> +err:
> +       kfree(source);
> +
> +       return ret;
>  }
>
>  void *smu_atom_get_data_table(void *dev, uint32_t table, uint16_t *size,
> --
> 2.39.2
>
