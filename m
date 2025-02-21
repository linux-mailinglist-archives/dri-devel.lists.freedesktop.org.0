Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16E8A40174
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9F910EB30;
	Fri, 21 Feb 2025 20:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GBWnjC8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2AA10EB30;
 Fri, 21 Feb 2025 20:56:40 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fc288da33eso656623a91.0; 
 Fri, 21 Feb 2025 12:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740171399; x=1740776199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GTZj1VfgXuSxDSAhZ5TKDIe0iQGufaJMlCuZk2vxFBY=;
 b=GBWnjC8XvxDLNIhE6rKfa3KgbS9euouQHP8z1j5wG98MQWUSjRVcHwM7JMvsAVcOfB
 mLm3ZTOvLyEVZ52KjQSSPeUPaIU0H2cwylrycrdv/Ptizw70SBH1VZjIryy5HaymXq51
 IVczqm2gKUCb6npKEBLNGZByXdATmuO11vw+Plyt1kQnvxfSCL9kctWd6Dbu/QDnKuZZ
 z1LRyY3xgyE7LmoRwTl+ubLoP9dPME5+9mvUIgR4p56G3ATfEkG3rVzptoICll4txTB0
 5Zar5HSZZvL3+dxyZRPniu+VNd/DdSvKMrtdxiL/s/TvncooPe2If8FbUIn0PeurfAcM
 Di0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740171399; x=1740776199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GTZj1VfgXuSxDSAhZ5TKDIe0iQGufaJMlCuZk2vxFBY=;
 b=Nbjxw9dnRlBXDcY8gwp9p9Ki3JO0Ji8gR0wT3tuj91irvH3HEkHod83xgdCSvDpkP5
 wv+hKgDoe9egNHvNN1n/7YdeOM/sF6kNAmlb62yQMhOyBwe8iPcE/HGAS6E6PClmcmAi
 9pYUwyL1REPPdqaimv3mqgbRdWCGAGHxOpbxKEN6cxcNZbX44cgCcXqjQnfGsnHNWSX3
 UojWkPMRrwSLgFUKq6bd76Qt9Gnu6/9+nXrW5ZqErJ7VUVPGiCbWkd1paRplsxZS6Bmw
 Y28d3vkUvdqgAVfxb+sN2fOMUB4ebwp6y6iVQc5r2hhSHc1WBLWzjbmIsGLR2rKOxKK8
 h1vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7QpDoJNe7s9G9yrPhIrzBfk9Gz4tQH91cUWpwJNlSbVqxb84zEQyBD/LbmdzeKPQmTxyYvsfJ@lists.freedesktop.org,
 AJvYcCW8jGXpLXHmIUb4KRn288NDw+oh7dQUtLI8M512hIowiN8u+eDAIHOkq8KGO+L9ZGONaBcT+G9R2P2p@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0+l84Dc4XsX3RlY9gYr2Kdw0uoHs16mjDHgp5hz2pzgvDKzca
 2kfgNMx3lYCXnUbEk+dPZEtIcyGce6zMNvtMLPRLCAM+yvXf8XG0Td8fkk0pCuGvlCmxO8j9P1k
 KaeJD2Z7ixc1iyv7YJLueeNTILMWxMw==
X-Gm-Gg: ASbGncvYFl/VqLVkKoB4ez2DduWHja6uvwR6EXYRaUma954aKITN7egIAU+Mp6aYkrJ
 Aq+sXvNskkKav20A7ZGki4yYOvrpiiV+20erCsZW46V8Gfu4iYfo/ZSCdBm7AEK5igTxjRExwGx
 xfDpFqF1Y=
X-Google-Smtp-Source: AGHT+IFM/J8ccLUv6pCWoCHFq6aIfv3z+UGD1zIf76O88EjqTbIyqqsctg0qW8JzGFkwIsg0BzVkO6VURoA+T3MG9O8=
X-Received: by 2002:a17:90b:3a81:b0:2ee:b665:12ce with SMTP id
 98e67ed59e1d1-2fce789cc70mr2888192a91.1.1740171399575; Fri, 21 Feb 2025
 12:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20250217095325.392152-1-colin.i.king@gmail.com>
In-Reply-To: <20250217095325.392152-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Feb 2025 15:56:27 -0500
X-Gm-Features: AWEUYZlGjjBQHXFe4kVYYoLXSOdkH8QC_8D4sDFG32SyXzn4R5IkXpUkq-hRSHg
Message-ID: <CADnq5_MPcshUk9uYqZ9eroJ8Pcbdr_ymqnaHeGYQf-VuVseDEg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake "oustanding"
 -> "outstanding"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Feb 17, 2025 at 5:48=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in max_oustanding_when_urgent_expected,
> fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h    | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_cor=
e/dml2_core_dcn4_calcs.c
> index 87e53f59cb9f..243d02050e01 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> @@ -5058,7 +5058,7 @@ static void CalculateExtraLatency(
>         double HostVMInefficiencyFactorPrefetch,
>         unsigned int HostVMMinPageSize,
>         enum dml2_qos_param_type qos_type,
> -       bool max_oustanding_when_urgent_expected,
> +       bool max_outstanding_when_urgent_expected,
>         unsigned int max_outstanding_requests,
>         unsigned int request_size_bytes_luma[],
>         unsigned int request_size_bytes_chroma[],
> @@ -5106,7 +5106,7 @@ static void CalculateExtraLatency(
>         if (qos_type =3D=3D dml2_qos_param_type_dcn4x) {
>                 *ExtraLatency_sr =3D dchub_arb_to_ret_delay / DCFCLK;
>                 *ExtraLatency =3D *ExtraLatency_sr;
> -               if (max_oustanding_when_urgent_expected)
> +               if (max_outstanding_when_urgent_expected)
>                         *ExtraLatency =3D *ExtraLatency + (ROBBufferSizeI=
nKByte * 1024 - max_outstanding_requests * max_request_size_bytes) / Return=
BW;
>         } else {
>                 *ExtraLatency_sr =3D dchub_arb_to_ret_delay / DCFCLK + Ro=
undTripPingLatencyCycles / FabricClock + ReorderingBytes / ReturnBW;
> @@ -5121,7 +5121,7 @@ static void CalculateExtraLatency(
>         dml2_printf("DML::%s: qos_type=3D%u\n", __func__, qos_type);
>         dml2_printf("DML::%s: hostvm_mode=3D%u\n", __func__, hostvm_mode)=
;
>         dml2_printf("DML::%s: Tex_trips=3D%u\n", __func__, Tex_trips);
> -       dml2_printf("DML::%s: max_oustanding_when_urgent_expected=3D%u\n"=
, __func__, max_oustanding_when_urgent_expected);
> +       dml2_printf("DML::%s: max_outstanding_when_urgent_expected=3D%u\n=
", __func__, max_outstanding_when_urgent_expected);
>         dml2_printf("DML::%s: FabricClock=3D%f\n", __func__, FabricClock)=
;
>         dml2_printf("DML::%s: DCFCLK=3D%f\n", __func__, DCFCLK);
>         dml2_printf("DML::%s: ReturnBW=3D%f\n", __func__, ReturnBW);
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_c=
ore/dml2_core_shared_types.h
> index dfe54112a9c6..4e502f0a6d20 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_s=
hared_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_s=
hared_types.h
> @@ -1571,7 +1571,7 @@ struct dml2_core_calcs_CalculateWatermarksMALLUseAn=
dDRAMSpeedChangeSupport_param
>         unsigned int *DSTYAfterScaler;
>         bool UnboundedRequestEnabled;
>         unsigned int CompressedBufferSizeInkByte;
> -       bool max_oustanding_when_urgent_expected;
> +       bool max_outstanding_when_urgent_expected;
>         unsigned int max_outstanding_requests;
>         unsigned int max_request_size_bytes;
>         unsigned int *meta_row_height_l;
> --
> 2.47.2
>
