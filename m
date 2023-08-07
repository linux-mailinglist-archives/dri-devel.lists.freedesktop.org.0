Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B744A772A7A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F6410E2A9;
	Mon,  7 Aug 2023 16:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B0B10E2A8;
 Mon,  7 Aug 2023 16:22:20 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1bfca0ec8b9so1134871fac.2; 
 Mon, 07 Aug 2023 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425340; x=1692030140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUVPtQ4uffECPeWL3GR8MnvNWj95BmoZE6AwQJLdvYA=;
 b=JnhpwUbEwmaB1X5eMIa1H0Ttk0AcCLltM036ifUFbLvc6yGDivsEkCFumZISCdcDMQ
 AhQV9+qcbVwMEM03Pjgf1D2o1DLKUssmEsUOhimspCKQ6jDnv9JbmeNHT7lrn0ixFj/r
 HQclzQrXsdiftsx6b1pSUD9/R6NvZvwJiezg/6QBJkytuZ6q46c1ekYhW5aQ15ByKVHe
 3uIaTxEP8DV/s/yV9vbn1e+pFzKTEZaBGnekH11guLHmPJCZrf8SdadeGaxJN84+02wR
 2H0VsNVHdZ4frXhUXTbICU/4wu4ujQIoq7lOOL5gfuNkyxiE7CsiarObdDICNyXL7reA
 sAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425340; x=1692030140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUVPtQ4uffECPeWL3GR8MnvNWj95BmoZE6AwQJLdvYA=;
 b=X/ClrROqxRrziyCddbNxjFYYeXu0X3UF2m7Fym92Sl67ZYA1/o0fZsgvXfw01q/FwW
 raIyrruxedBn49u0dKgs+Sf89QcuxwxQdnInBXq+wbt0Rx+PhvQJAwDZUVV7qCcFuYLc
 CrhdNPxnGC7Qyli+hOct6RfAie7DYKfN2N58ay9KjZEpDT1AI/5zTNgb+GtfuYz23AUs
 ZAV2iHcCRrBUBKiSdtZL5Xi1BwfE/B7OAqGwYz/zJ2stFEezUzJrUmz+g8yZR+5B95Np
 3zQbifRWnJ/outmDAuhurvxZj6gRq6j8hntpzIQvUH0/iCfi3WxnsVrHScGBBMbfSLWu
 V9dQ==
X-Gm-Message-State: AOJu0Yxb7+NxkmVgMgO7YZpsLizTTPWbQw14+qrInXjc3X8zCbhpMcIy
 2OVpcFfBdaIyn2qBjEWBHu/tL7/DPEozjI6hlmw=
X-Google-Smtp-Source: AGHT+IFG0/Am3diUr/m2+r/PPuvSgAgvYLcl/89tTxa/yB4pEVFb/nj9I+lomFUljhKSdlsnRF0dCzxkTjpd/0TGMUs=
X-Received: by 2002:a05:6870:7010:b0:1bb:5480:4b4 with SMTP id
 u16-20020a056870701000b001bb548004b4mr11226715oae.8.1691425340185; Mon, 07
 Aug 2023 09:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230801020839.4369-1-sunran001@208suo.com>
In-Reply-To: <20230801020839.4369-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:22:09 -0400
Message-ID: <CADnq5_PYShAc4M47zrfbzv4FUe1oD8+k08Q4_oDPzp4xoE_eGA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_5_ppt.c
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 10:08=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space prohibited before that ',' (ctx:WxW)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
> index 42f110602eb1..87a79e6f983b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
> @@ -75,7 +75,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_5_message_=
map[SMU_MSG_MAX_COUNT] =3D
>         MSG_MAP(SetDriverDramAddrHigh,            PPSMC_MSG_SetDriverDram=
AddrHigh,      1),
>         MSG_MAP(SetDriverDramAddrLow,          PPSMC_MSG_SetDriverDramAdd=
rLow,  1),
>         MSG_MAP(TransferTableSmu2Dram,           PPSMC_MSG_TransferTableS=
mu2Dram,               1),
> -       MSG_MAP(TransferTableDram2Smu,          PPSMC_MSG_TransferTableDr=
am2Smu ,       1),
> +       MSG_MAP(TransferTableDram2Smu,          PPSMC_MSG_TransferTableDr=
am2Smu,        1),
>         MSG_MAP(GetGfxclkFrequency,          PPSMC_MSG_GetGfxclkFrequency=
,      1),
>         MSG_MAP(GetEnabledSmuFeatures,           PPSMC_MSG_GetEnabledSmuF=
eatures,               1),
>         MSG_MAP(SetSoftMaxVcn,          PPSMC_MSG_SetSoftMaxVcn,        1=
),
> --
> 2.17.1
>
