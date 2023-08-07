Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C816C772B7F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103BB8826D;
	Mon,  7 Aug 2023 16:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235338826D;
 Mon,  7 Aug 2023 16:52:19 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1a1fa977667so3606422fac.1; 
 Mon, 07 Aug 2023 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427138; x=1692031938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zr5bzEAJ4u0jG+0pMtfI/Oc4OFWdg2dWRl6/DHgxTs=;
 b=pJSy8y2sNQTIav/8/1US++ovx3EBG/babM+jC9VSwH89YPxl/9l32061+nQxW9EMWI
 QWlkrZQ4KKLTf+RmB45uhJqZW6NrUpS+dNFJ+4+8epIfUH+YMao7jkNBcNfYeOCukpYV
 m5HtCxp9KNdLxCPm4yO9Sjqvx2gLN+dFUOzoj5J608N8TBbfpo7gLJbmykemeXXgQcAp
 jUzg98RKSoFx6nOjDZS+nCA+UrRJLoPMWDcGFXUqCQLMopI7zeWwS2NTepvlYGXd1v07
 4UzIAVAJLJBYw6VXtbtktd3jAZHOty0o8wg/kXympToTH20QNTRBw83wRUasuHO3uIN6
 TUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427138; x=1692031938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zr5bzEAJ4u0jG+0pMtfI/Oc4OFWdg2dWRl6/DHgxTs=;
 b=M5F3RnkxrcxEQR1hf8gr6csQb+O0D25VhSOpjRrBEJdnMDrfwEf1t+hMKPKSio0c+/
 hT/FkShIblYfZVA3VRKjmJICgkmhLh4zyl3/jmhMgdRo+akxs+Fi3WfZCBH4VfoCZEI0
 YaXA2nQDvmTdrdd64flm2S+mKlLhTO2h4Kn5qaO/ARj29VFcswJhryU2/JOgve3dmauA
 9gtmiWP3J2x2lS8wus7qdyGa5EIf0zTZK42l6BAzBzo8uMybggUl7hYnM9Z/DdNNpapX
 Tf2k2BfpgD5u+fD2VYF5d0iJf6LedK6khB+or5uM2fPknTM1x2yXvWk++P+mNioPtcB9
 MtsA==
X-Gm-Message-State: AOJu0YwOIARGxpt0LkVBWl+mU1fS5UU2TRFI7baOT3HdSSvJEdzC9cYM
 pqRbVpdGVSaRLiuOJi9uyN9xNya1J+WEJHpUYqQ=
X-Google-Smtp-Source: AGHT+IGOylr6WBFk/yfrsvOLNljNjtq4DOhPqdkeGj2n7GfTSiG1+C4wb1gY88HX3UzRmxq6kEie15ZwuW5xRY6gCUo=
X-Received: by 2002:a05:6870:e6d4:b0:1b7:4655:2ac3 with SMTP id
 s20-20020a056870e6d400b001b746552ac3mr11502882oak.13.1691427138338; Mon, 07
 Aug 2023 09:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230801094742.8032-1-sunran001@208suo.com>
In-Reply-To: <20230801094742.8032-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:52:07 -0400
Message-ID: <CADnq5_N_EQgTBLsJ_PFtEBi_0TD+8=Zp3=2D7NcsmJH1MEEJpQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in polaris_baco.c
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

On Tue, Aug 1, 2023 at 5:47=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/polaris_baco.c | 30 +++++++------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/polaris_baco.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/polaris_baco.c
> index 8f8e296f2fe9..a6a6d43b09f8 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/polaris_baco.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/polaris_baco.c
> @@ -35,8 +35,7 @@
>  #include "smu/smu_7_1_3_d.h"
>  #include "smu/smu_7_1_3_sh_mask.h"
>
> -static const struct baco_cmd_entry gpio_tbl[] =3D
> -{
> +static const struct baco_cmd_entry gpio_tbl[] =3D {
>         { CMD_WRITE, mmGPIOPAD_EN, 0, 0, 0, 0x0 },
>         { CMD_WRITE, mmGPIOPAD_PD_EN, 0, 0, 0, 0x0 },
>         { CMD_WRITE, mmGPIOPAD_PU_EN, 0, 0, 0, 0x0 },
> @@ -49,15 +48,13 @@ static const struct baco_cmd_entry gpio_tbl[] =3D
>         { CMD_READMODIFYWRITE, mmDC_GPIO_SYNCA_MASK, 0, 0, 0, 0x00001111 =
}
>  };
>
> -static const struct baco_cmd_entry enable_fb_req_rej_tbl[] =3D
> -{
> +static const struct baco_cmd_entry enable_fb_req_rej_tbl[] =3D {
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, 0xC0300024 },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, 0x1, 0x0, 0, 0x1 },
>         { CMD_WRITE, mmBIF_FB_EN, 0, 0, 0, 0x0 }
>  };
>
> -static const struct baco_cmd_entry use_bclk_tbl[] =3D
> -{
> +static const struct baco_cmd_entry use_bclk_tbl[] =3D {
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPL=
L_BYPASS_EN_MASK, CG_SPLL_FUNC_CNTL__SPLL_BYPASS_EN__SHIFT, 0, 0x1 },
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, 0xC0500170 },
> @@ -70,8 +67,7 @@ static const struct baco_cmd_entry use_bclk_tbl[] =3D
>         { CMD_READMODIFYWRITE, mmMPLL_CNTL_MODE, MPLL_CNTL_MODE__MPLL_MCL=
K_SEL_MASK, MPLL_CNTL_MODE__MPLL_MCLK_SEL__SHIFT, 0, 0x0 }
>  };
>
> -static const struct baco_cmd_entry turn_off_plls_tbl[] =3D
> -{
> +static const struct baco_cmd_entry turn_off_plls_tbl[] =3D {
>         { CMD_READMODIFYWRITE, mmDC_GPIO_PAD_STRENGTH_1, DC_GPIO_PAD_STRE=
NGTH_1__GENLK_STRENGTH_SP_MASK, DC_GPIO_PAD_STRENGTH_1__GENLK_STRENGTH_SP__=
SHIFT, 0, 0x1 },
>         { CMD_DELAY_US, 0, 0, 0, 1, 0x0 },
>         { CMD_READMODIFYWRITE, mmMC_SEQ_DRAM, MC_SEQ_DRAM__RST_CTL_MASK, =
MC_SEQ_DRAM__RST_CTL__SHIFT, 0, 0x1 },
> @@ -92,8 +88,7 @@ static const struct baco_cmd_entry turn_off_plls_tbl[] =
=3D
>         { CMD_DELAY_US, 0, 0, 0, 5, 0x0 }
>  };
>
> -static const struct baco_cmd_entry clk_req_b_tbl[] =3D
> -{
> +static const struct baco_cmd_entry clk_req_b_tbl[] =3D {
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixTHM_CLK_CNTL },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, THM_CLK_CNTL__CMON_CLK=
_SEL_MASK, THM_CLK_CNTL__CMON_CLK_SEL__SHIFT, 0, 0x1 },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, THM_CLK_CNTL__TMON_CLK=
_SEL_MASK, THM_CLK_CNTL__TMON_CLK_SEL__SHIFT, 0, 0x1 },
> @@ -108,8 +103,7 @@ static const struct baco_cmd_entry clk_req_b_tbl[] =
=3D
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, MPLL_BYPASSCLK_SEL__MP=
LL_CLKOUT_SEL_MASK, MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL__SHIFT, 0,     0x4 =
}
>  };
>
> -static const struct baco_cmd_entry enter_baco_tbl[] =3D
> -{
> +static const struct baco_cmd_entry enter_baco_tbl[] =3D {
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_EN_MASK, BACO=
_CNTL__BACO_EN__SHIFT, 0, 0x01 },
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_BIF_SCLK_SWIT=
CH_MASK, BACO_CNTL__BACO_BIF_SCLK_SWITCH__SHIFT, 0, 0x01 },
>         { CMD_WAITFOR, mmBACO_CNTL, BACO_CNTL__BACO_BIF_SCLK_SWITCH_MASK,=
 0, 5, 0x40000 },
> @@ -126,8 +120,7 @@ static const struct baco_cmd_entry enter_baco_tbl[] =
=3D
>
>  #define BACO_CNTL__PWRGOOD_MASK  BACO_CNTL__PWRGOOD_GPIO_MASK+BACO_CNTL_=
_PWRGOOD_MEM_MASK+BACO_CNTL__PWRGOOD_DVO_MASK
>
> -static const struct baco_cmd_entry exit_baco_tbl[] =3D
> -{
> +static const struct baco_cmd_entry exit_baco_tbl[] =3D {
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_RESET_EN_MASK=
, BACO_CNTL__BACO_RESET_EN__SHIFT, 0, 0x01 },
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_BCLK_OFF_MASK=
, BACO_CNTL__BACO_BCLK_OFF__SHIFT, 0, 0x00 },
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_POWER_OFF_MAS=
K, BACO_CNTL__BACO_POWER_OFF__SHIFT, 0, 0x00 },
> @@ -142,14 +135,12 @@ static const struct baco_cmd_entry exit_baco_tbl[] =
=3D
>         { CMD_WAITFOR, mmBACO_CNTL, BACO_CNTL__BACO_MODE_MASK, 0, 0xfffff=
fff, 0x00 }
>  };
>
> -static const struct baco_cmd_entry clean_baco_tbl[] =3D
> -{
> +static const struct baco_cmd_entry clean_baco_tbl[] =3D {
>         { CMD_WRITE, mmBIOS_SCRATCH_6, 0, 0, 0, 0 },
>         { CMD_WRITE, mmBIOS_SCRATCH_7, 0, 0, 0, 0 }
>  };
>
> -static const struct baco_cmd_entry use_bclk_tbl_vg[] =3D
> -{
> +static const struct baco_cmd_entry use_bclk_tbl_vg[] =3D {
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPL=
L_BYPASS_EN_MASK, CG_SPLL_FUNC_CNTL__SPLL_BYPASS_EN__SHIFT, 0, 0x1 },
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, 0xC0500170 },
> @@ -160,8 +151,7 @@ static const struct baco_cmd_entry use_bclk_tbl_vg[] =
=3D
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, MPLL_BYPASSCLK_SEL__MP=
LL_CLKOUT_SEL_MASK, MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL__SHIFT, 0, 0x2 }
>  };
>
> -static const struct baco_cmd_entry turn_off_plls_tbl_vg[] =3D
> -{
> +static const struct baco_cmd_entry turn_off_plls_tbl_vg[] =3D {
>         { CMD_READMODIFYWRITE, mmDC_GPIO_PAD_STRENGTH_1, DC_GPIO_PAD_STRE=
NGTH_1__GENLK_STRENGTH_SP_MASK, DC_GPIO_PAD_STRENGTH_1__GENLK_STRENGTH_SP__=
SHIFT, 0, 0x1 },
>         { CMD_DELAY_US, 0, 0, 0, 1, 0x0 },
>         { CMD_READMODIFYWRITE, mmMC_SEQ_DRAM, MC_SEQ_DRAM__RST_CTL_MASK, =
MC_SEQ_DRAM__RST_CTL__SHIFT, 0, 0x1 },
> --
> 2.17.1
>
