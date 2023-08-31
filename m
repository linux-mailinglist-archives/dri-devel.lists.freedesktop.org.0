Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED578F37C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0743310E6CF;
	Thu, 31 Aug 2023 19:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B0110E6BA;
 Thu, 31 Aug 2023 19:42:11 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1cca0a1b3c7so730328fac.2; 
 Thu, 31 Aug 2023 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693510930; x=1694115730; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEe1IaLH3Ycd9RB7YwbM8pbf+9g4srWsZCIhmgdINf8=;
 b=lOkWN2X+x752nQ6MzwgTD+OhU6x6LWyC6FYJp09zcPfH5fxDczFDY0z2vknw13aknO
 Pzk9rb73J1ZmkNB3WE6DM6IzDo4oskfz6CFI8oAxwgYw1fIaIyIzXuvJCqTSfJuUatgV
 LZWDKzBO35zXUHBhHXgYCZ00UliEr7C37UckLRqQ4f9W7s4rhDnVEkycfx5VvnsTX7fU
 HjNZ6DSOU2fU2drWtcuQII0WykXjBtmruMrJMXsHioAFutxVtUMInMos2Pmu6amSgpdY
 ozvyHAoPMuCT6xq5W6jXL/q8sixTuN5PKVYepeKf0+5xYCwDGlCzmXr9hXrIYzXFBned
 6uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693510930; x=1694115730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cEe1IaLH3Ycd9RB7YwbM8pbf+9g4srWsZCIhmgdINf8=;
 b=NzukYLteZ6GSA6W2FfvPCjFOpmAkjDrkTB0QamwN1b0z6DZaqkv47Ct5IYUQwUozsM
 XkSka6G6mTJCuGNKAolc8ef93uObGb7Ewi6LOqRZx/CFtm/9qA/UcwJKBae8o7p8UPFL
 AJlCC7P7rlb0FDJuelkajhxBPQxnH/jKqGPCjUac+13Wryw/z01ENhjRsq8oGjXHt2ZH
 Zp4enzTv7izhP09qRYcjndviZTs+vJmhY9+VGaEt/gVpB9jxxRPueDqjIa3WZ6VizlLr
 to4WhQAymXTrU6uWj8EfbV3gWnrGFhJeMwscC+nybKK08qP9Y2hPRtBMuOWyveXZzsmm
 LUiA==
X-Gm-Message-State: AOJu0YxWlckusOt6bq5xN69tbk6KMcVTAMtOsXWCoLF1bICHhkXpYNBK
 ayLg3bsjWi9Kpy74JvttiO+3J2iQzho7m4eWwFo=
X-Google-Smtp-Source: AGHT+IHdBOdD/yy+CaDsyJrVO8eCM9GPyDLarT64nF7L/zvhJX9Nngj1E3+pSE9v42PbWKZ6bKa/lF651aKTdwpczGo=
X-Received: by 2002:a05:6870:3921:b0:1bf:61e3:df1 with SMTP id
 b33-20020a056870392100b001bf61e30df1mr464502oap.50.1693510930588; Thu, 31 Aug
 2023 12:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230831161228.206735-1-mwen@igalia.com>
In-Reply-To: <20230831161228.206735-1-mwen@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 31 Aug 2023 15:41:59 -0400
Message-ID: <CADnq5_McUzYqt1RWox5VpCSxPkeD7Z9oFvxU9kd+dGdN+NahMA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: enable cursor degamma for DCN3+ DRM
 legacy gamma
To: Melissa Wen <mwen@igalia.com>
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, kernel-dev@igalia.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Aug 31, 2023 at 12:12=E2=80=AFPM Melissa Wen <mwen@igalia.com> wrot=
e:
>
> For DRM legacy gamma, AMD display manager applies implicit sRGB degamma
> using a pre-defined sRGB transfer function. It works fine for DCN2
> family where degamma ROM and custom curves go to the same color block.
> But, on DCN3+, degamma is split into two blocks: degamma ROM for
> pre-defined TFs and `gamma correction` for user/custom curves and
> degamma ROM settings doesn't apply to cursor plane. To get DRM legacy
> gamma working as expected, enable cursor degamma ROM for implict sRGB
> degamma on HW with this configuration.
>
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2803
> Fixes: 96b020e2163f ("drm/amd/display: check attr flag before set cursor =
degamma on DCN3+")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> v2: cc'ing stable
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index df568a7cd005..b97cbc4e5477 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1270,6 +1270,13 @@ void amdgpu_dm_plane_handle_cursor_update(struct d=
rm_plane *plane,
>         attributes.rotation_angle    =3D 0;
>         attributes.attribute_flags.value =3D 0;
>
> +       /* Enable cursor degamma ROM on DCN3+ for implicit sRGB degamma i=
n DRM
> +        * legacy gamma setup.
> +        */
> +       if (crtc_state->cm_is_degamma_srgb &&
> +           adev->dm.dc->caps.color.dpp.gamma_corr)
> +               attributes.attribute_flags.bits.ENABLE_CURSOR_DEGAMMA =3D=
 1;
> +
>         attributes.pitch =3D afb->base.pitches[0] / afb->base.format->cpp=
[0];
>
>         if (crtc_state->stream) {
> --
> 2.40.1
>
