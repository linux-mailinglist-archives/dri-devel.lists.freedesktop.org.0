Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606A772AF7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6364B10E2D1;
	Mon,  7 Aug 2023 16:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9EC10E2D1;
 Mon,  7 Aug 2023 16:33:39 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bb575a6ed3so3599532fac.2; 
 Mon, 07 Aug 2023 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426019; x=1692030819;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GS+s5QA+7fmn3p9NicYuopwCAnPqna71fQArihZ77Ho=;
 b=IlOvTRmvh6IFmi2KYgc6P7/WQhjjiI803ANoTJS/TMU5RE0REjCmC26D5/ucnqh/KV
 VYFo9cfL4bdnTXtAjtg4sbtOJbHLzJnKv3e/bAIuNYhqqlHVrd8PUPpohDfB/3KbHtuO
 GsCYAUrwdAyii6Q4bUqufJZek12biEoQJj7KQyGE5YeK/d9bHyAkQOM7tmxjyGxUF41s
 sC4h2ProWpEMXieZv3bOOujlt+eKSiolxbSpg5tV708kBGRVfoYQiWwXszDn+6RsMaey
 ftMtRAAZ/VZaUNgOWmvWfDNHDZ4Na9j9y1RkNsgDcyGXlzQFGqhO9o7T/FFHn1f3gA5E
 eMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426019; x=1692030819;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GS+s5QA+7fmn3p9NicYuopwCAnPqna71fQArihZ77Ho=;
 b=GthL7v2ZhnF/Z50LOJ04bd66O/c3GOJ0+F5e1n6dQrziD84l6CU+XUH04I+AGlmJez
 QSqPBZL9T3HPbtsQeotEGgu0yxHBvryl0LnEDVrbejcmYlTB0nT/NdpZ1dcDqEe8Ggk1
 bT7PAyF4/XMvpRGPveScLpy4NwdJwp7+QllEox6d1BFiidqHKEZOa+p/gqbvhZuzQhPB
 /dqJULsMDMd6XvLhLBCBPds2egVpU6jpf/0ZWsq9KXnBzNG68Slask39zA34mk8t2WND
 aZTij6ZBxIjuVfyxMaoHkwyc+9vwWTptvC355nCh7rM456j5HhGg1Qq48VeArp59pLBZ
 8IoQ==
X-Gm-Message-State: AOJu0Yxom5vxk4/iO/joweH7sKfEOXh2Occkshsqa+vlSp3EwD1i4+Qx
 9ytY30uV55jGaZVzV7fjQm1oOucYcRBz138RScE=
X-Google-Smtp-Source: AGHT+IEXPlOEjWezLgBbrAHmlydU64OP4b3QmZeeluV9R+nkqbnRn+LuWwHIFce6PmDPG8N6fuZTeoH0br82T7XlKZ4=
X-Received: by 2002:a05:6870:4153:b0:1bb:8162:dfcc with SMTP id
 r19-20020a056870415300b001bb8162dfccmr10564902oad.11.1691426017331; Mon, 07
 Aug 2023 09:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230801060937.6178-1-sunran001@208suo.com>
In-Reply-To: <20230801060937.6178-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:33:26 -0400
Message-ID: <CADnq5_MbgT64L+7ga8zzTrNJ1G0TvMFV4BPw5Lv9gDFfNCukMw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega12_baco.c
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

On Tue, Aug 1, 2023 at 2:09=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c b/drive=
rs/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c
> index bc53cce4f32d..32cc8de296e4 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c
> @@ -29,16 +29,14 @@
>  #include "vega12_ppsmc.h"
>  #include "vega12_baco.h"
>
> -static const struct soc15_baco_cmd_entry  pre_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry  pre_baco_tbl[] =3D {
>         { CMD_READMODIFYWRITE, NBIF_HWID, 0, mmBIF_DOORBELL_CNTL_BASE_IDX=
, mmBIF_DOORBELL_CNTL, BIF_DOORBELL_CNTL__DOORBELL_MONITOR_EN_MASK, BIF_DOO=
RBELL_CNTL__DOORBELL_MONITOR_EN__SHIFT, 0, 0 },
>         { CMD_WRITE, NBIF_HWID, 0, mmBIF_FB_EN_BASE_IDX, mmBIF_FB_EN, 0, =
0, 0, 0 },
>         { CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_ID=
X, mmBACO_CNTL, BACO_CNTL__BACO_DSTATE_BYPASS_MASK, BACO_CNTL__BACO_DSTATE_=
BYPASS__SHIFT, 0, 1 },
>         { CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_ID=
X, mmBACO_CNTL, BACO_CNTL__BACO_RST_INTR_MASK_MASK, BACO_CNTL__BACO_RST_INT=
R_MASK__SHIFT, 0, 1 }
>  };
>
> -static const struct soc15_baco_cmd_entry enter_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry enter_baco_tbl[] =3D {
>         { CMD_WAITFOR, THM_HWID, 0, mmTHM_BACO_CNTL_BASE_IDX, mmTHM_BACO_=
CNTL, THM_BACO_CNTL__SOC_DOMAIN_IDLE_MASK, THM_BACO_CNTL__SOC_DOMAIN_IDLE__=
SHIFT, 0xffffffff, 0x80000000 },
>         { CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_ID=
X, mmBACO_CNTL, BACO_CNTL__BACO_EN_MASK, BACO_CNTL__BACO_EN__SHIFT, 0, 1 },
>         { CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_ID=
X, mmBACO_CNTL, BACO_CNTL__BACO_BIF_LCLK_SWITCH_MASK, BACO_CNTL__BACO_BIF_L=
CLK_SWITCH__SHIFT, 0, 1 },
> @@ -56,8 +54,7 @@ static const struct soc15_baco_cmd_entry enter_baco_tbl=
[] =3D
>         { CMD_WAITFOR, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBAC=
O_CNTL, BACO_CNTL__BACO_MODE_MASK, BACO_CNTL__BACO_MODE__SHIFT, 0xffffffff,=
 0x100 }
>  };
>
> -static const struct soc15_baco_cmd_entry exit_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry exit_baco_tbl[] =3D {
>         { CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_ID=
X, mmBACO_CNTL, BACO_CNTL__BACO_POWER_OFF_MASK, BACO_CNTL__BACO_POWER_OFF__=
SHIFT, 0, 0 },
>         { CMD_DELAY_MS, 0, 0, 0, 0, 0, 0, 10, 0 },
>         { CMD_READMODIFYWRITE, THM_HWID, 0, mmTHM_BACO_CNTL_BASE_IDX, mmT=
HM_BACO_CNTL, THM_BACO_CNTL__BACO_SOC_REFCLK_OFF_MASK, THM_BACO_CNTL__BACO_=
SOC_REFCLK_OFF__SHIFT, 0, 0 },
> @@ -77,8 +74,7 @@ static const struct soc15_baco_cmd_entry exit_baco_tbl[=
] =3D
>         { CMD_WAITFOR, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBAC=
O_CNTL, BACO_CNTL__BACO_MODE_MASK, 0, 0xffffffff, 0 }
>  };
>
> -static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D {
>         { CMD_WRITE, NBIF_HWID, 0, mmBIOS_SCRATCH_6_BASE_IDX, mmBIOS_SCRA=
TCH_6, 0, 0, 0, 0 },
>         { CMD_WRITE, NBIF_HWID, 0, mmBIOS_SCRATCH_7_BASE_IDX, mmBIOS_SCRA=
TCH_7, 0, 0, 0, 0 }
>  };
> --
> 2.17.1
>
