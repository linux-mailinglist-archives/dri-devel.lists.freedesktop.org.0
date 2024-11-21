Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CAD9D4FEC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E38910E9A6;
	Thu, 21 Nov 2024 15:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E+W2Xj1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4173D10E9A3;
 Thu, 21 Nov 2024 15:42:18 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71e52582d28so75522b3a.1; 
 Thu, 21 Nov 2024 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732203738; x=1732808538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQSpT9bmaRTRYEXJVSo+BnSr44G1gB51FRi8tOTD2dg=;
 b=E+W2Xj1P9wJR482QOPt3Q94mcL9J9j+9QhlwfAh1JMRnHKp9R6e00Gg4V1Wn8why62
 gDvyvPYfPQbMbJOwM9GB6NzIPqIekMCZr1h2fjNEUqlaQ0WubFJxbHbEMYm2OeXEStPc
 yi5nhqnbQEVKmQpMOAeh4U9aW3y6YJAwpnh+mFPU4XmP/4pcDZTYWA2EpAlngpLoVEgI
 LKXrCCunyZwDX+rjhzIQXg6Wrw4zkNwkmDdCBhp0PGsztgwTHfNSOV5oiwVmSdsOrGLb
 KtlY7gCqGEZGAPXRYRE3yyukgy7eDZrXUjxJO6ELPkHwmp4tQZMsPm2eVhqNRkBzaUaa
 1Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732203738; x=1732808538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQSpT9bmaRTRYEXJVSo+BnSr44G1gB51FRi8tOTD2dg=;
 b=ae4XAGyp18VaXVtDizghf+IONIPvYxzd2BIE8Lmacp4xZbASmkSOfEEV9pllY9RqER
 tRU92NnHTpV4P6jpbW2PS2tCghTin0gt4OxhsnBLpJDMBuPM/wrBXptLhuwf0+m+fgY8
 A9lyy06OmhG3pvbq3P3n4lfl8wZceM3nMw9tCZbObr/OHKkAKDNCEPbVQ73jkJA4Wj6e
 ntI1oo0Ij01Ie7XM54BaQamr0xghGG91e6TFCpV604v0yx8bLDffgYMzEQJOCNo44/ke
 96aETCN8dkiCWHjZJO7hOe6yW3by2g2sdi5yH4lj+Zc7SOAaplSmHuy1iJOFAx0oP2hj
 v4kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrnp5WtN7KH7BmBmNH1D9ulMVrGk4Dd80AiiYRdUUCMco/QWdXstfZVnf0QYOujgv3FTOlZBzt@lists.freedesktop.org,
 AJvYcCWA7c3wdVU43rffUSmWEy5W8Y7rHjcX68r+4zhS8f8lfZO75m0WkStoGnQ43GHLJ6O506n+DNkikwyu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0Skh7XyX6NY0+S+gVtvVwfDyxZWMYza+Zcnfxvmz2iauHK/M4
 7+kPJH8aIG0V7kfkE1YdM3gGh6z4g8H47iX+0yIwri1zAxTyQ9xDq8MkS2OD9g+G1hnYPZpsKuE
 hWXsKFWqwdLaB6AEgdQaRPFjsMU8=
X-Gm-Gg: ASbGnct2SYrUFXMU691t/C26OyUIE7NUzH+wJqMUFC3DCrhiWhfo4gHNz4cuHEA2pS5
 rrXpxK+KoaNPwf8Y1HF0oVihrn6ltK0Q=
X-Google-Smtp-Source: AGHT+IEa4XS/aPX09o9Gf1pNHRKm6CMplBWWo0+kJxEqOaNThCKWOQIJeVjor8T23Yi1+3FbTFs8YQUmuTIn9frlbn8=
X-Received: by 2002:a05:6a00:ad84:b0:724:bf53:34a6 with SMTP id
 d2e1a72fcca58-724bf533648mr4054740b3a.7.1732203737604; Thu, 21 Nov 2024
 07:42:17 -0800 (PST)
MIME-Version: 1.0
References: <6584a62da5436ffd726d68e5dbdaf5eadde8af9d.1732047767.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <6584a62da5436ffd726d68e5dbdaf5eadde8af9d.1732047767.git.christophe.jaillet@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Nov 2024 10:42:06 -0500
Message-ID: <CADnq5_ONUa=8g6qKqFHDeiNNeJ7QidyReGhNYoxBzPX7B36EJg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Fix an error handling path in
 vega10_enable_se_edc_force_stall_config()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Evan Quan <evan.quan@amd.com>, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Tue, Nov 19, 2024 at 4:02=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> In case of error after a amdgpu_gfx_rlc_enter_safe_mode() call, it is not
> balanced by a corresponding amdgpu_gfx_rlc_exit_safe_mode() call.
>
> Add the missing call.
>
> Fixes: 9b7b8154cdb8 ("drm/amd/powerplay: added didt support for vega10")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> *Not* even compile tested only because of missing "hwmgr.h". I've not
> checked on which arch it is supposed to run in order to cross-compile.
>
> This patch is speculative, review with care!
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c b/=
drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
> index 3007b054c873..776d58ea63ae 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
> @@ -1120,13 +1120,14 @@ static int vega10_enable_se_edc_force_stall_confi=
g(struct pp_hwmgr *hwmgr)
>         result =3D vega10_program_didt_config_registers(hwmgr, SEEDCForce=
StallPatternConfig_Vega10, VEGA10_CONFIGREG_DIDT);
>         result |=3D vega10_program_didt_config_registers(hwmgr, SEEDCCtrl=
ForceStallConfig_Vega10, VEGA10_CONFIGREG_DIDT);
>         if (0 !=3D result)
> -               return result;
> +               goto exit_safe_mode;
>
>         vega10_didt_set_mask(hwmgr, false);
>
> +exit_safe_mode:
>         amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
>
> -       return 0;
> +       return result;
>  }
>
>  static int vega10_disable_se_edc_force_stall_config(struct pp_hwmgr *hwm=
gr)
> --
> 2.47.0
>
