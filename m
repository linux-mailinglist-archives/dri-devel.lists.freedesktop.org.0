Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC73772CDB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EC210E35E;
	Mon,  7 Aug 2023 17:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B6810E368;
 Mon,  7 Aug 2023 17:26:18 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a7a180c3faso551058b6e.2; 
 Mon, 07 Aug 2023 10:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429177; x=1692033977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSOWVrjZ1/u9To54jiA15JDLcV2I1XHj1QAMnIKhAvY=;
 b=scuOA7ac5toaJ55K4HcKWCHf+y9/KRko3nm0b2dp7tiEtLP/mHWWtrzGVarrKClqZ2
 nAV2UNP3Xmw2LjuWLSQri0TO6ZQRdStQ3OUySRdMZu1rHxgjcIgGuTndjgCnFDhwkWNf
 Q2kTu7A34vC0xJMsWFysuLy24ib3d4MJWJRybTw6uOibnqX5An7404wPNV+2MSLOADet
 9vkGQpE22x30LHyy9KUBNF7cWDgsTaIczRB8rmIxIe5xLo9Lw/3AvJY8Fuq6+9vOivyH
 R7Rr8HmIQULCm3oiCkyGJD++nyniXbTrUPv44+xW0osY7fEfCZSDuGNJ+CAQRr9on78R
 NDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429177; x=1692033977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CSOWVrjZ1/u9To54jiA15JDLcV2I1XHj1QAMnIKhAvY=;
 b=aUaL+KulmwYxwlcjVfE+cz1zSLtD4lmUmNoDHsfmPRXgD/xYo68CBBObrj6WZma/+O
 AmSNDN3ppv9gmLO0nCo2oYJp71yPUEmGaPnsZfhbkMjVy57UWL4rY95fB7SOg5kJkCDL
 MkJNw4MUpAokfVlSFM5z38R0lCy0cKtTZV/XwrHANThU8ijC9zL9HZH6w7057SEKD+Og
 mzfpMfZytYDYEfscynLbQ+8TU23WL5oNI3LXFKPOT1ykTrCM0c3EF9Fh/+XC5YM5QXVG
 twHkVaDs7L/y+Bj6vgLcK1Ls+kbvHyh340U1HIXnZ6GYsPPnVz8Ww/sCS9SVZLPjFxc/
 IjQQ==
X-Gm-Message-State: AOJu0Yyuj8XYb0WTaU5TbUm6wKinVxi5/YZcuF+BIx81c7Pu/mfneWbr
 5ZanL5wN57KcEtBd+GNRzx7zCiuv1gaBnrUBZ6A=
X-Google-Smtp-Source: AGHT+IHv07CWDxAqO5ul3ZXsB9vYEfcAx0bnOry4mrq0FjhomLVxvTG9la8IwMlZQuK33HtwaISGD3Uk9EzhigswBg0=
X-Received: by 2002:a05:6808:1410:b0:3a3:640d:ed71 with SMTP id
 w16-20020a056808141000b003a3640ded71mr14211892oiv.10.1691429177306; Mon, 07
 Aug 2023 10:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230802072127.12896-1-sunran001@208suo.com>
In-Reply-To: <20230802072127.12896-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:26:06 -0400
Message-ID: <CADnq5_NK9xz9OAoLkjKMtaZ+k+7PsOT7oeCacqap8MRs_9oG1g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in soc21.c
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

On Wed, Aug 2, 2023 at 3:21=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/soc21.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amd=
gpu/soc21.c
> index e5e5d68a4d70..4f3ecd66eb6b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc21.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
> @@ -48,33 +48,28 @@
>  static const struct amd_ip_funcs soc21_common_ip_funcs;
>
>  /* SOC21 */
> -static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_encod=
e_array_vcn0[] =3D
> -{
> +static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_encod=
e_array_vcn0[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 2304, 0)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC, 4096, 23=
04, 0)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_AV1, 8192, 435=
2, 0)},
>  };
>
> -static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_encod=
e_array_vcn1[] =3D
> -{
> +static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_encod=
e_array_vcn1[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 2304, 0)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC, 4096, 23=
04, 0)},
>  };
>
> -static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_encode_vc=
n0 =3D
> -{
> +static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_encode_vc=
n0 =3D {
>         .codec_count =3D ARRAY_SIZE(vcn_4_0_0_video_codecs_encode_array_v=
cn0),
>         .codec_array =3D vcn_4_0_0_video_codecs_encode_array_vcn0,
>  };
>
> -static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_encode_vc=
n1 =3D
> -{
> +static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_encode_vc=
n1 =3D {
>         .codec_count =3D ARRAY_SIZE(vcn_4_0_0_video_codecs_encode_array_v=
cn1),
>         .codec_array =3D vcn_4_0_0_video_codecs_encode_array_vcn1,
>  };
>
> -static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_decod=
e_array_vcn0[] =3D
> -{
> +static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_decod=
e_array_vcn0[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 4096, 52)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC, 8192, 43=
52, 186)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_JPEG, 4096, 40=
96, 0)},
> @@ -82,22 +77,19 @@ static const struct amdgpu_video_codec_info vcn_4_0_0=
_video_codecs_decode_array_
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_AV1, 8192, 435=
2, 0)},
>  };
>
> -static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_decod=
e_array_vcn1[] =3D
> -{
> +static const struct amdgpu_video_codec_info vcn_4_0_0_video_codecs_decod=
e_array_vcn1[] =3D {
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC, 409=
6, 4096, 52)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC, 8192, 43=
52, 186)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_JPEG, 4096, 40=
96, 0)},
>         {codec_info_build(AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VP9, 8192, 435=
2, 0)},
>  };
>
> -static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_decode_vc=
n0 =3D
> -{
> +static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_decode_vc=
n0 =3D {
>         .codec_count =3D ARRAY_SIZE(vcn_4_0_0_video_codecs_decode_array_v=
cn0),
>         .codec_array =3D vcn_4_0_0_video_codecs_decode_array_vcn0,
>  };
>
> -static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_decode_vc=
n1 =3D
> -{
> +static const struct amdgpu_video_codecs vcn_4_0_0_video_codecs_decode_vc=
n1 =3D {
>         .codec_count =3D ARRAY_SIZE(vcn_4_0_0_video_codecs_decode_array_v=
cn1),
>         .codec_array =3D vcn_4_0_0_video_codecs_decode_array_vcn1,
>  };
> @@ -445,8 +437,7 @@ static void soc21_program_aspm(struct amdgpu_device *=
adev)
>                 adev->nbio.funcs->program_aspm(adev);
>  }
>
> -const struct amdgpu_ip_block_version soc21_common_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version soc21_common_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_COMMON,
>         .major =3D 1,
>         .minor =3D 0,
> @@ -547,8 +538,7 @@ static int soc21_update_umd_stable_pstate(struct amdg=
pu_device *adev,
>         return 0;
>  }
>
> -static const struct amdgpu_asic_funcs soc21_asic_funcs =3D
> -{
> +static const struct amdgpu_asic_funcs soc21_asic_funcs =3D {
>         .read_disabled_bios =3D &soc21_read_disabled_bios,
>         .read_bios_from_rom =3D &amdgpu_soc15_read_bios_from_rom,
>         .read_register =3D &soc21_read_register,
> --
> 2.17.1
>
