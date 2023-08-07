Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9AF772B6A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7647110E2F0;
	Mon,  7 Aug 2023 16:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8814E10E2E8;
 Mon,  7 Aug 2023 16:47:33 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-56ca4d7079aso3228842eaf.0; 
 Mon, 07 Aug 2023 09:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426853; x=1692031653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3ILY1Xc3ixm+CYC3BThxO0I9niViD5h2B8iBeASacA=;
 b=ae/t/y8TnbdKKDl1qLhChYi/Z2W0FRt3NVn07NkuIIFwvYKNgZ830Hc5MoeCaE2dAE
 yLDT2VOIdpthU7lOlHESqYTMW/eMvJ6Qr8hcetlsb12ZdTjDPeYND3HV9MurSeiaB9CG
 7WnRBnd3r6fpXlMc8vIEmrX5l8DRDjBM7tD7iS5ug/235ryibMV3jbsA+M0HMcyMdX9f
 dfsCf9JWY7tsYWTEJBE2hdGoE/IdaV5c/hvJXv8IL9uM/DyrEYKIqRL114wUa2RkukQZ
 g+P31D+ibeeINPdfcRiDUpd63PzkNiPvUCyUfdbzN1H2V03o+o3lONLsZ7DdDle2QBzL
 hENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426853; x=1692031653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3ILY1Xc3ixm+CYC3BThxO0I9niViD5h2B8iBeASacA=;
 b=Il5UISVcVtpnqL+nYxvr8DkEmglNzFAmsQHQnGt+oO3LJg1lEZSk4LJX+zGCrQWym3
 53r1FMhHzRM7i6wVTWMGdqnlY+dSoEuWHjzYoYNSNNlFr9IcMVS+LTs/FxwjWYCKiIT2
 KHZKpSd+Tfta59H+E7vdKxu+gahXm4VlJ7NiVDcBleFRMbLNCoFazmyIR5imtmT5qKO0
 1XZhcEyzDgfw+vvGWPrYUqXV6G4N6Ibud02BIqT0SbooHOrx7vOn67MXxIQl6dA2OdW4
 hrGbW0DSxM2k87dBONwKAVbgRMV5qFdWgLfoY3+BBDLGk0zmud3N98WpjdIKnq54sk3p
 s6eQ==
X-Gm-Message-State: AOJu0Yy0SK1+Uhf/8EVwv7rVlZ5JHX9E3ouOsy6wn0svghgwfYJ7lSyg
 b81UyvJ9sbZjDyrn+0zSUxkNH2XV3LQotXJHx1Y=
X-Google-Smtp-Source: AGHT+IHduCsMJ2/SXA/WPpbSn3DxjnhLMV8iqTXXVRj3sXL/nB2Lw18TjjmoVqx6RUEGVP+ORSSpcRZq5+vdBapAPj8=
X-Received: by 2002:a4a:3045:0:b0:566:b483:ee00 with SMTP id
 z5-20020a4a3045000000b00566b483ee00mr8954274ooz.5.1691426852705; Mon, 07 Aug
 2023 09:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230801093414.7673-1-sunran001@208suo.com>
In-Reply-To: <20230801093414.7673-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:47:21 -0400
Message-ID: <CADnq5_P-iaxR2uF2QbZLp6B2hKFGAjhBW4=qpxD2iJ=FztVKjA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in tonga_baco.c
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

On Tue, Aug 1, 2023 at 5:34=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/tonga_baco.c   | 30 +++++++------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/tonga_baco.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/tonga_baco.c
> index ea743bea8e29..432d4fd2a0ba 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/tonga_baco.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/tonga_baco.c
> @@ -36,8 +36,7 @@
>  #include "smu/smu_7_1_2_sh_mask.h"
>
>
> -static const struct baco_cmd_entry gpio_tbl[] =3D
> -{
> +static const struct baco_cmd_entry gpio_tbl[] =3D {
>         { CMD_WRITE, mmGPIOPAD_EN, 0, 0, 0, 0x0 },
>         { CMD_WRITE, mmGPIOPAD_PD_EN, 0, 0, 0, 0x0 },
>         { CMD_WRITE, mmGPIOPAD_PU_EN, 0, 0, 0, 0x0 },
> @@ -50,15 +49,13 @@ static const struct baco_cmd_entry gpio_tbl[] =3D
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
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL_2 =
},
> @@ -80,8 +77,7 @@ static const struct baco_cmd_entry use_bclk_tbl[] =3D
>         { CMD_READMODIFYWRITE, mmMPLL_CNTL_MODE, MPLL_CNTL_MODE__MPLL_MCL=
K_SEL_MASK, MPLL_CNTL_MODE__MPLL_MCLK_SEL__SHIFT, 0, 0x0 }
>  };
>
> -static const struct baco_cmd_entry turn_off_plls_tbl[] =3D
> -{
> +static const struct baco_cmd_entry turn_off_plls_tbl[] =3D {
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPL=
L_RESET_MASK, CG_SPLL_FUNC_CNTL__SPLL_RESET__SHIFT, 0, 0x1 },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPL=
L_PWRON_MASK, CG_SPLL_FUNC_CNTL__SPLL_PWRON__SHIFT, 0, 0x0 },
> @@ -112,8 +108,7 @@ static const struct baco_cmd_entry turn_off_plls_tbl[=
] =3D
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, THM_CLK_CNTL__TMON_CLK=
_SEL_MASK,  THM_CLK_CNTL__TMON_CLK_SEL__SHIFT, 0, 0x1 }
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
> @@ -130,8 +125,7 @@ static const struct baco_cmd_entry enter_baco_tbl[] =
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
> @@ -146,22 +140,19 @@ static const struct baco_cmd_entry exit_baco_tbl[] =
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
> -static const struct baco_cmd_entry gpio_tbl_iceland[] =3D
> -{
> +static const struct baco_cmd_entry gpio_tbl_iceland[] =3D {
>         { CMD_WRITE, mmGPIOPAD_EN, 0, 0, 0, 0x0 },
>         { CMD_WRITE, mmGPIOPAD_PD_EN, 0, 0, 0, 0x0 },
>         { CMD_WRITE, mmGPIOPAD_PU_EN, 0, 0, 0, 0x0 },
>         { CMD_WRITE, mmGPIOPAD_MASK, 0, 0, 0, 0xff77ffff }
>  };
>
> -static const struct baco_cmd_entry exit_baco_tbl_iceland[] =3D
> -{
> +static const struct baco_cmd_entry exit_baco_tbl_iceland[] =3D {
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_RESET_EN_MASK=
, BACO_CNTL__BACO_RESET_EN__SHIFT, 0, 0x01 },
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_BCLK_OFF_MASK=
, BACO_CNTL__BACO_BCLK_OFF__SHIFT, 0, 0x00 },
>         { CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_POWER_OFF_MAS=
K, BACO_CNTL__BACO_POWER_OFF__SHIFT, 0, 0x00 },
> @@ -177,8 +168,7 @@ static const struct baco_cmd_entry exit_baco_tbl_icel=
and[] =3D
>         { CMD_WAITFOR, mmBACO_CNTL, BACO_CNTL__BACO_MODE_MASK, 0, 0xfffff=
fff, 0x00 }
>  };
>
> -static const struct baco_cmd_entry clean_baco_tbl_iceland[] =3D
> -{
> +static const struct baco_cmd_entry clean_baco_tbl_iceland[] =3D {
>         { CMD_WRITE, mmBIOS_SCRATCH_7, 0, 0, 0, 0 }
>  };
>
> --
> 2.17.1
>
