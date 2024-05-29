Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3AA8D39A2
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374A8113C87;
	Wed, 29 May 2024 14:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A5pvJLsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AC610FE33;
 Wed, 29 May 2024 14:46:39 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-681919f89f2so1601235a12.1; 
 Wed, 29 May 2024 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716993999; x=1717598799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvVzHd5AxSKnApKESDyHK3nerTyOYWeW+tQfkc76wG0=;
 b=A5pvJLsNHUIt2zNeJXcre723PAxqL4usIjVBT6dDnU6sI6X93E16NLq+UNYDLl07n6
 SW8s2lKElB27CYtRjm9E2EsO5+lwEUL/BI311RM7+TyPR9cx4hbzuob2KBmCF/yaeZ2X
 K7fbaU1KhVhl3bgphf8vemk4dAvNRTLg8CdfSJnObYYW03PZd8ay/mUZsmQjjTjeP1bK
 Aodg6Svg577ttXcOF1xBmengOSbw1I7gubUh3hTXAnX9Gii134XQoQhwiyKYOFejtkVL
 ikA/LAjdqFvUJBq8d7WpIeHxEU8s1LPVpjWX8e8bwTZ2vx2fizByTJScxI2TrXpcEOO7
 Uo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716993999; x=1717598799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvVzHd5AxSKnApKESDyHK3nerTyOYWeW+tQfkc76wG0=;
 b=dN1CO2oMFIH0AABDfmYOSmYqM8qU8uKceFG+JqgKdNx09Z+2d8e1uupSeq1DEAZ4WC
 NAKLJJaZc6FQYXnD71FBM00vPkfSFujxQEQ4jM01BbfAqEdddo508cRjTuHZEmSPEBBm
 EIlT1pJP0xKh0CnWmJEjJxQLIhZAdEGkoisEG9Yx17p5Hsuqy5CvWd8h6a18XZpbE+tc
 CbLPdjZFTRrO6CNwHsi1cXpwkAzO2JGkp2ZBxClL/qRerUcS1uWgA1mpSFYqkAL+vkC1
 7N4L+gIttprPtrG/ZlaUcNOWRXsL/2353A0cNIC0CtKDOYMSpL7d3h+vk2c9m+KUuOGZ
 g8jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPihE8Yi4ji7XnvppOxpp1SQMjs+zNcPUH0b69oiIdxOmaJceM2rQwiT6a66YTMWuJanMzZS4+/GOG2ZY95Qqkb0WvAN1CQmMcgjq2Rb9zEch7pHaivUxzFC57XzQpTB7LqWx9quW7jMFTnSaKXA==
X-Gm-Message-State: AOJu0YxMwfluVSiQQj7/+Jcp0KrHdyYEMFpLD0FpcznH6iQKTjVRIJ7R
 L/gvvCQGC/AY2QiuxqByIB6N2ek5OmSFXCBRkdmU9ZbR+Cv0HarW4FC6dKWq5xMVgUaNFfJTdVB
 hDGTI6WEVnluhS0JFkqr2MygmA8s=
X-Google-Smtp-Source: AGHT+IHB40gqF5o5YJJk218HRfK46Q5oKExKxc9X5bl9vAXS05a8NVPXgx8Ecwt6Mp58v7Qb3PXOwkGnAsNDaWJCJz8=
X-Received: by 2002:a17:90b:400a:b0:2bd:5c9c:b080 with SMTP id
 98e67ed59e1d1-2bf5ed1e3b6mr16295128a91.12.1716993998803; Wed, 29 May 2024
 07:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240528115146.2870032-1-arnd@kernel.org>
In-Reply-To: <20240528115146.2870032-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 May 2024 10:46:27 -0400
Message-ID: <CADnq5_OtL0D+mE8bsoWmPz0e7USC=UrpFjcZZ2LTeaHePToBxQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] [RESEND] drm/amd/display: dynamically allocate
 dml2_configuration_options structures
To: Arnd Bergmann <arnd@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Wenjing Liu <wenjing.liu@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Jun Lei <jun.lei@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Dillon Varone <dillon.varone@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, 
 Roman Li <roman.li@amd.com>, Aric Cyr <aric.cyr@amd.com>, 
 Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org, 
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

Applied the series.  Thanks!

Alex

On Tue, May 28, 2024 at 7:52=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This structure is too large to fit on a stack, as shown by the
> newly introduced warnings from a recent code change:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.c:=
 In function 'dcn32_update_bw_bounding_box':
> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.c:=
2019:1: error: the frame size of 1180 bytes is larger than 1024 bytes [-Wer=
ror=3Dframe-larger-than=3D]
> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.=
c: In function 'dcn321_update_bw_bounding_box':
> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.=
c:1597:1: error: the frame size of 1180 bytes is larger than 1024 bytes [-W=
error=3Dframe-larger-than=3D]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c: In function 'dc=
_state_create':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:219:1: error: th=
e frame size of 1184 bytes is larger than 1024 bytes [-Werror=3Dframe-large=
r-than=3D]
>
> Instead of open-coding the assignment of a large structure to a stack
> variable, use an explicit kmemdup() in each case to move it off the stack=
.
>
> Fixes: e779f4587f61 ("drm/amd/display: Add handling for DC power mode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Originally sent as https://lore.kernel.org/all/20240418083421.3956461-1-a=
rnd@kernel.org/
> ---
>  .../display/dc/resource/dcn32/dcn32_resource.c   | 16 +++++++++++-----
>  .../display/dc/resource/dcn321/dcn321_resource.c | 16 +++++++++++-----
>  2 files changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> index 022d320be1d5..0f11d7c8791c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> @@ -2007,21 +2007,27 @@ void dcn32_calculate_wm_and_dlg(struct dc *dc, st=
ruct dc_state *context,
>
>  static void dcn32_update_bw_bounding_box(struct dc *dc, struct clk_bw_pa=
rams *bw_params)
>  {
> -       struct dml2_configuration_options dml2_opt =3D dc->dml2_options;
> +       struct dml2_configuration_options *dml2_opt;
> +
> +       dml2_opt =3D kmemdup(&dc->dml2_options, sizeof(dc->dml2_options),=
 GFP_KERNEL);
> +       if (!dml2_opt)
> +               return;
>
>         DC_FP_START();
>
>         dcn32_update_bw_bounding_box_fpu(dc, bw_params);
>
> -       dml2_opt.use_clock_dc_limits =3D false;
> +       dml2_opt->use_clock_dc_limits =3D false;
>         if (dc->debug.using_dml2 && dc->current_state && dc->current_stat=
e->bw_ctx.dml2)
> -               dml2_reinit(dc, &dml2_opt, &dc->current_state->bw_ctx.dml=
2);
> +               dml2_reinit(dc, dml2_opt, &dc->current_state->bw_ctx.dml2=
);
>
> -       dml2_opt.use_clock_dc_limits =3D true;
> +       dml2_opt->use_clock_dc_limits =3D true;
>         if (dc->debug.using_dml2 && dc->current_state && dc->current_stat=
e->bw_ctx.dml2_dc_power_source)
> -               dml2_reinit(dc, &dml2_opt, &dc->current_state->bw_ctx.dml=
2_dc_power_source);
> +               dml2_reinit(dc, dml2_opt, &dc->current_state->bw_ctx.dml2=
_dc_power_source);
>
>         DC_FP_END();
> +
> +       kfree(dml2_opt);
>  }
>
>  static struct resource_funcs dcn32_res_pool_funcs =3D {
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> index e4b360d89b3b..07ca6f58447d 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> @@ -1581,21 +1581,27 @@ static struct dc_cap_funcs cap_funcs =3D {
>
>  static void dcn321_update_bw_bounding_box(struct dc *dc, struct clk_bw_p=
arams *bw_params)
>  {
> -       struct dml2_configuration_options dml2_opt =3D dc->dml2_options;
> +       struct dml2_configuration_options *dml2_opt;
> +
> +       dml2_opt =3D kmemdup(&dc->dml2_options, sizeof(dc->dml2_options),=
 GFP_KERNEL);
> +       if (!dml2_opt)
> +               return;
>
>         DC_FP_START();
>
>         dcn321_update_bw_bounding_box_fpu(dc, bw_params);
>
> -       dml2_opt.use_clock_dc_limits =3D false;
> +       dml2_opt->use_clock_dc_limits =3D false;
>         if (dc->debug.using_dml2 && dc->current_state && dc->current_stat=
e->bw_ctx.dml2)
> -               dml2_reinit(dc, &dml2_opt, &dc->current_state->bw_ctx.dml=
2);
> +               dml2_reinit(dc, dml2_opt, &dc->current_state->bw_ctx.dml2=
);
>
> -       dml2_opt.use_clock_dc_limits =3D true;
> +       dml2_opt->use_clock_dc_limits =3D true;
>         if (dc->debug.using_dml2 && dc->current_state && dc->current_stat=
e->bw_ctx.dml2_dc_power_source)
> -               dml2_reinit(dc, &dml2_opt, &dc->current_state->bw_ctx.dml=
2_dc_power_source);
> +               dml2_reinit(dc, dml2_opt, &dc->current_state->bw_ctx.dml2=
_dc_power_source);
>
>         DC_FP_END();
> +
> +       kfree(dml2_opt);
>  }
>
>  static struct resource_funcs dcn321_res_pool_funcs =3D {
> --
> 2.39.2
>
