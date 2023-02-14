Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC43D696BE2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DA510E242;
	Tue, 14 Feb 2023 17:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAF610E263;
 Tue, 14 Feb 2023 17:41:00 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-16aa71c1600so19938299fac.11; 
 Tue, 14 Feb 2023 09:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c3+qCkN2LjXU9wdlskKeXV1f7YIw+Dw3wL4cke/NBXs=;
 b=O7lnX86nedndzTHO2cIe1U9Q+Zb46HfI/rkJZdfe75Tkn0Um8KMM3XigDOoiJYK/hZ
 OtK6GWXzy/dwNKPHn4ry2JvIzd+LX6/Ugiqaba1YDUAbWtmv1svMFqdAnQDmXALeiqM/
 7eecl5h91cItROovkOC9AKytTnWACuCv6LytlNIRpbm9iBY9BT4kT5Fs/XJ+mVw8cBaP
 G4UKoxwRaSAoFGIS9/5SXagsaJRR5PbYVJRLL17OJWpep91jMtS3Vc63c+XAZgwsjKIs
 jwfk4Ui1bAp0ckqdOwPovwLR2KjbVGRXal5Ik7lgZpJOh9vG8Sf0amJaCnwKfo1klrBI
 0UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3+qCkN2LjXU9wdlskKeXV1f7YIw+Dw3wL4cke/NBXs=;
 b=WoB64H/iRyFi4P7DKWJ+D5alYsM4EvoIFBXM2zRJtz4wa6QH9ohkX7J1of2byq66tQ
 zkJ1mSB+OWsjC9ry9BSeea6KayY9GBQUFUsFXEZC8l+6wHh5utRsqyFqrmJvph4iMSKT
 v/pOQfbcUQ3J+2FXIM4rIbM/tK1cx6UpcDXK72YtoKl3Dg3i6BRQQLX1nq8GHAr3vzmK
 YluBAE5BQ5vSnMCWkdsDFVoyrIRQfUpshXgWeB/eWk4NXB4LDsVd+2qzDyYBnYJgLyFN
 iBN9K1WrVu5HoLqAQehvhDVuzdq5QMHBLliaipSqxol5uQvem0bg9wOwR2mulK9Wk7mi
 3QKA==
X-Gm-Message-State: AO0yUKXKQwMbcAXrIzoT0v1rdEYlguzB3WyhFVeinLh7LOh7yYgMoBhs
 0ghhKgpVSTLW2E/7CH70bFnScbOt/kb/Wdayijg=
X-Google-Smtp-Source: AK7set9lTncuGv2q+IVj/HjwkeJ5SzlWHaWQhGH+EOQl8mGOQYgk+4bbdoEAbhi20VsbzhPX5D7cga0yJhO5eVWMMhA=
X-Received: by 2002:a05:6870:c154:b0:16e:2d40:daf5 with SMTP id
 g20-20020a056870c15400b0016e2d40daf5mr40700oad.96.1676396460141; Tue, 14 Feb
 2023 09:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-3-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-3-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 12:40:48 -0500
Message-ID: <CADnq5_Ox-ZO6rdQ7xqavryuDOxQzd9cTyxYA6xJnLFwpSB=x4Q@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/amd/display: Add function prototypes to headers
To: Arthur Grillo <arthurgrillo@riseup.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Feb 13, 2023 at 3:50 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Add function prototypes to headers to reduce the number of
> -Wmissing-prototypes warnings.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h | 2 ++
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h | 2 ++
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h   | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
> index e015e5a6c866..89d6208287b5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
> @@ -133,6 +133,8 @@
>  int hubbub31_init_dchub_sys_ctx(struct hubbub *hubbub,
>                 struct dcn_hubbub_phys_addr_config *pa_config);
>
> +void hubbub31_init(struct hubbub *hubbub);
> +
>  void hubbub31_construct(struct dcn20_hubbub *hubbub3,
>         struct dc_context *ctx,
>         const struct dcn_hubbub_registers *hubbub_regs,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
> index bdc146890fca..b20eb04724bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
> @@ -204,6 +204,8 @@ void hubbub32_force_usr_retraining_allow(struct hubbub *hubbub, bool allow);
>
>  void hubbub32_force_wm_propagate_to_pipes(struct hubbub *hubbub);
>
> +void hubbub32_init(struct hubbub *hubbub);
> +
>  void dcn32_program_det_size(struct hubbub *hubbub, int hubp_inst, unsigned int det_buffer_size_in_kbyte);
>
>  void hubbub32_construct(struct dcn20_hubbub *hubbub2,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
> index 56ef71151536..4cdbf63c952b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
> @@ -61,6 +61,8 @@ void hubp32_phantom_hubp_post_enable(struct hubp *hubp);
>  void hubp32_cursor_set_attributes(struct hubp *hubp,
>                 const struct dc_cursor_attributes *attr);
>
> +void hubp32_init(struct hubp *hubp);
> +
>  bool hubp32_construct(
>         struct dcn20_hubp *hubp2,
>         struct dc_context *ctx,
> --
> 2.39.1
>
