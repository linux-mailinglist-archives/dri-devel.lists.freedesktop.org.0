Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AD5772CFA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A2E10E367;
	Mon,  7 Aug 2023 17:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D130310E367;
 Mon,  7 Aug 2023 17:30:04 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bf08ca187cso3536417fac.3; 
 Mon, 07 Aug 2023 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429404; x=1692034204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRFYnEPdLG8+V3CbBn+Rgg8YFLvKXfz9kmIHrHlJZqY=;
 b=i3AZl7f1zQofjB/HlnVbZ0HkHBJAKfQRelucEctSEMbl3SzjzuOLPDMB3JyLPFd3Jo
 y/afLAWDZkGKugC/SslQIaj42iw2fBK5bAg0NJvAPvyEfnXp1N4J95KebsMtI5IQlgMt
 NMWEM1l0ba1qcCgKdR46GTsKUyolgRKeWaJm7PSy26bb98/2C4X4vtnmgJBPDgHx9Z0C
 oPs+dFG+87CDjhFjsz/3A6MuHm6WYG4JSLFu7ZqSltqLAIDBcqb6i+J+fJ4EUCqpHKo1
 1i0TpKUo9T/IF/FfUr799Mc9ec4zbzUFgf4CBZ2jGLYo3566dqTOwct9jJrCOYvPanN0
 qA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429404; x=1692034204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRFYnEPdLG8+V3CbBn+Rgg8YFLvKXfz9kmIHrHlJZqY=;
 b=WTJb8gwLx4zrZUga8YEFDl7TK8BNZq0piCEn+4JEagkZeKLLNoqFFp136dQXklGPfw
 fgsaQmIrL43g31E8Xuo9EhQlCTDvxRJLXG9zvUOwpzfwXAJnuBia19f5OtaKnqL+s0VA
 nCLc5Vi0HBJynbSTKFVP7IwdvLAVV3R/thmDDZb+hPkyxSAJJ3tOxzhVjixCcC6Sc0/j
 ck/Bf3Q6vvehdR+N4SGlKD5IfgVGBJaf1gn+/dqgntDE44J8fYwhznKHhSA+zG/wUwjF
 yx08wKg2my77cFxWbqG8wZciGu/mQ93/6TGuH+GnKimQs2PtMsohAkDRRV7yIBQkyJqB
 n0UA==
X-Gm-Message-State: AOJu0YyArvGQ/t3G/fqPRjovCRJGKkoyycI3V2z3BUWx2tVkZd5A6Z8F
 f6SlieUH5PkqfHkWQTIjwa0ASvA9pdIwPDH1nnZ+9Ogw
X-Google-Smtp-Source: AGHT+IGAoRJJR7tAjLWYKQe5Tl1E9/UL30bicC3/HiF0MJyfYZJ1OmqLbll+xzQSnmt85AMPJBAJpYGa5/jvPggjckE=
X-Received: by 2002:a05:6871:6a9:b0:1ba:2c39:5cf3 with SMTP id
 l41-20020a05687106a900b001ba2c395cf3mr12446829oao.31.1691429404084; Mon, 07
 Aug 2023 10:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230802073439.13432-1-sunran001@208suo.com>
In-Reply-To: <20230802073439.13432-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:29:53 -0400
Message-ID: <CADnq5_MwqU2dumXc4tjkap63sv4ynni29M3=MTFngzmbZ0BbLw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in nv.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:34=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/nv.c | 48 +++++++++++----------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu=
/nv.c
> index 51523b27a186..414c3c85172d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -67,21 +67,18 @@
>  static const struct amd_ip_funcs nv_common_ip_funcs;
>
>  /* Navi */
> -static const struct amdgpu_video_codec_info nv_video_codecs_encode_array=
[] =3D
> -{
> +static const struct amdgpu_video_codec_info nv_video_codecs_encode_array=
[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 2304, 0)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC, 4096, 23=
04, 0)},
>  };
>
> -static const struct amdgpu_video_codecs nv_video_codecs_encode =3D
> -{
> +static const struct amdgpu_video_codecs nv_video_codecs_encode =3D {
>         .codec_count =3D ARRAY_SIZE(nv_video_codecs_encode_array),
>         .codec_array =3D nv_video_codecs_encode_array,
>  };
>
>  /* Navi1x */
> -static const struct amdgpu_video_codec_info nv_video_codecs_decode_array=
[] =3D
> -{
> +static const struct amdgpu_video_codec_info nv_video_codecs_decode_array=
[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG2, 4096, 4=
096, 3)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4, 4096, 4=
096, 5)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 4096, 52)},
> @@ -91,8 +88,7 @@ static const struct amdgpu_video_codec_info nv_video_co=
decs_decode_array[] =3D
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VP9, 8192, 435=
2, 0)},
>  };
>
> -static const struct amdgpu_video_codecs nv_video_codecs_decode =3D
> -{
> +static const struct amdgpu_video_codecs nv_video_codecs_decode =3D {
>         .codec_count =3D ARRAY_SIZE(nv_video_codecs_decode_array),
>         .codec_array =3D nv_video_codecs_decode_array,
>  };
> @@ -108,8 +104,7 @@ static const struct amdgpu_video_codecs sc_video_code=
cs_encode =3D {
>         .codec_array =3D sc_video_codecs_encode_array,
>  };
>
> -static const struct amdgpu_video_codec_info sc_video_codecs_decode_array=
_vcn0[] =3D
> -{
> +static const struct amdgpu_video_codec_info sc_video_codecs_decode_array=
_vcn0[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG2, 4096, 4=
096, 3)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4, 4096, 4=
096, 5)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 4096, 52)},
> @@ -120,8 +115,7 @@ static const struct amdgpu_video_codec_info sc_video_=
codecs_decode_array_vcn0[]
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_AV1, 8192, 435=
2, 0)},
>  };
>
> -static const struct amdgpu_video_codec_info sc_video_codecs_decode_array=
_vcn1[] =3D
> -{
> +static const struct amdgpu_video_codec_info sc_video_codecs_decode_array=
_vcn1[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG2, 4096, 4=
096, 3)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4, 4096, 4=
096, 5)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 4096, 52)},
> @@ -131,27 +125,23 @@ static const struct amdgpu_video_codec_info sc_vide=
o_codecs_decode_array_vcn1[]
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VP9, 8192, 435=
2, 0)},
>  };
>
> -static const struct amdgpu_video_codecs sc_video_codecs_decode_vcn0 =3D
> -{
> +static const struct amdgpu_video_codecs sc_video_codecs_decode_vcn0 =3D =
{
>         .codec_count =3D ARRAY_SIZE(sc_video_codecs_decode_array_vcn0),
>         .codec_array =3D sc_video_codecs_decode_array_vcn0,
>  };
>
> -static const struct amdgpu_video_codecs sc_video_codecs_decode_vcn1 =3D
> -{
> +static const struct amdgpu_video_codecs sc_video_codecs_decode_vcn1 =3D =
{
>         .codec_count =3D ARRAY_SIZE(sc_video_codecs_decode_array_vcn1),
>         .codec_array =3D sc_video_codecs_decode_array_vcn1,
>  };
>
>  /* SRIOV Sienna Cichlid, not const since data is controlled by host */
> -static struct amdgpu_video_codec_info sriov_sc_video_codecs_encode_array=
[] =3D
> -{
> +static struct amdgpu_video_codec_info sriov_sc_video_codecs_encode_array=
[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 2160, 0)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC, 7680, 43=
52, 0)},
>  };
>
> -static struct amdgpu_video_codec_info sriov_sc_video_codecs_decode_array=
_vcn0[] =3D
> -{
> +static struct amdgpu_video_codec_info sriov_sc_video_codecs_decode_array=
_vcn0[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG2, 4096, 4=
096, 3)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4, 4096, 4=
096, 5)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 4096, 52)},
> @@ -162,8 +152,7 @@ static struct amdgpu_video_codec_info sriov_sc_video_=
codecs_decode_array_vcn0[]
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_AV1, 8192, 435=
2, 0)},
>  };
>
> -static struct amdgpu_video_codec_info sriov_sc_video_codecs_decode_array=
_vcn1[] =3D
> -{
> +static struct amdgpu_video_codec_info sriov_sc_video_codecs_decode_array=
_vcn1[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG2, 4096, 4=
096, 3)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4, 4096, 4=
096, 5)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 4096, 52)},
> @@ -173,20 +162,17 @@ static struct amdgpu_video_codec_info sriov_sc_vide=
o_codecs_decode_array_vcn1[]
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VP9, 8192, 435=
2, 0)},
>  };
>
> -static struct amdgpu_video_codecs sriov_sc_video_codecs_encode =3D
> -{
> +static struct amdgpu_video_codecs sriov_sc_video_codecs_encode =3D {
>         .codec_count =3D ARRAY_SIZE(sriov_sc_video_codecs_encode_array),
>         .codec_array =3D sriov_sc_video_codecs_encode_array,
>  };
>
> -static struct amdgpu_video_codecs sriov_sc_video_codecs_decode_vcn0 =3D
> -{
> +static struct amdgpu_video_codecs sriov_sc_video_codecs_decode_vcn0 =3D =
{
>         .codec_count =3D ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vc=
n0),
>         .codec_array =3D sriov_sc_video_codecs_decode_array_vcn0,
>  };
>
> -static struct amdgpu_video_codecs sriov_sc_video_codecs_decode_vcn1 =3D
> -{
> +static struct amdgpu_video_codecs sriov_sc_video_codecs_decode_vcn1 =3D =
{
>         .codec_count =3D ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vc=
n1),
>         .codec_array =3D sriov_sc_video_codecs_decode_array_vcn1,
>  };
> @@ -536,8 +522,7 @@ static void nv_program_aspm(struct amdgpu_device *ade=
v)
>
>  }
>
> -const struct amdgpu_ip_block_version nv_common_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version nv_common_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_COMMON,
>         .major =3D 1,
>         .minor =3D 0,
> @@ -642,8 +627,7 @@ static int nv_update_umd_stable_pstate(struct amdgpu_=
device *adev,
>         return 0;
>  }
>
> -static const struct amdgpu_asic_funcs nv_asic_funcs =3D
> -{
> +static const struct amdgpu_asic_funcs nv_asic_funcs =3D {
>         .read_disabled_bios =3D &nv_read_disabled_bios,
>         .read_bios_from_rom =3D &amdgpu_soc15_read_bios_from_rom,
>         .read_register =3D &nv_read_register,
> --
> 2.17.1
>
