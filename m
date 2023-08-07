Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8F5772AB4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E59710E2BA;
	Mon,  7 Aug 2023 16:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D986110E2B8;
 Mon,  7 Aug 2023 16:28:11 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bc479cc815so3686627fac.1; 
 Mon, 07 Aug 2023 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425691; x=1692030491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBBuDI+9splS1pnBc+KXC2tvqjZTNnwYYin+vd+ZusA=;
 b=TyEXAOeXsOHZJSdCLFjJOts0i1CUzU4U2kZa0bd6SlgoVASnjLfib6uCG8HcFHlC1V
 py44hX/0m8a/l7Q0tNPyvoDnrYqlfZnBBcrOWF241VffmiVTF9lz8i4jtuhHFJIu9yAX
 OnwvGoERLcUVfhfbIuvqUbDF0OXAADJSK0ncHzZtlQbDAZ2+0UJFTLDzcRdCW8uB2xHK
 7G0IOSkR0ADMeXY6j+1SdEqEPfLOHSX1CBsQWcGNLgAgXKXSUbyMGrZCjdFP6XivvVXX
 x4kP/9Nl7lWQ9vVL9UTI/aGEB4uulCIAqFUpvZkyoMiDRJkjGPYFQyRqpEbCguMYwg5r
 F/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425691; x=1692030491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBBuDI+9splS1pnBc+KXC2tvqjZTNnwYYin+vd+ZusA=;
 b=Vd0sn7DoKAl+i4hs6wOTRYPI1bvQssOpvavphugr4mAnbI5W/QlbfqbQ64LzmTYjf8
 fBdX6PdnrbguJvn7TEV6yQw05Tw+Na5kN8DquVOsPpvjJunxYOFXBOFBQOM6IC4R0alG
 v1Vpp/7BxmExBY2IkZU0uoXG+JCF6GJMsDnWyFNKJ4Kj4nqZDSSgEMxAHBKwB+SGyXx5
 znLOVZhihVZ1tzunkPvN5hZsyMpiprfd5P6rm/sZhNC2VrFigXaQfbx/ebb02KRJNaLI
 iQQIaMf1P3xS/LnYfJgP/F1tg+8H43Uph5m6UG6/sgiiTmSJxnoSXO/LE0JTAiuInMoK
 ooNA==
X-Gm-Message-State: AOJu0YyPea4QaobtSMKH+jtLq4xvvFJvHrvqMc27UpCpnYEY2vs7/tFD
 WPuGC20K//FynTdstQXWgF2cm/UzlG42UnkPgb0=
X-Google-Smtp-Source: AGHT+IFwaosLDH0Ba5G6pXQk30jVkppAo725i0nFFwHkn7bEe8zkkOgguoqmJ8vCc7Xakh5eRP/drsdqlfvUc0qWsFg=
X-Received: by 2002:a05:6871:521e:b0:1bf:607:e0ed with SMTP id
 ht30-20020a056871521e00b001bf0607e0edmr13625803oac.39.1691425691082; Mon, 07
 Aug 2023 09:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230801031603.5283-1-sunran001@208suo.com>
In-Reply-To: <20230801031603.5283-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:28:00 -0400
Message-ID: <CADnq5_MuE1-K100y0GzBrycuG5as90bfxewZG+2_U_2-yw1gGw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in fiji_baco.c
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

On Mon, Jul 31, 2023 at 11:16=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/fiji_baco.c    | 24 +++++++------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c b/drivers=
/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c
> index c0368f2dfb21..b3e768fa79f2 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c
> @@ -36,8 +36,7 @@
>  #include "smu/smu_7_1_3_sh_mask.h"
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
> @@ -78,8 +75,7 @@ static const struct baco_cmd_entry use_bclk_tbl[] =3D
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, MPLL_BYPASSCLK_SEL__MP=
LL_CLKOUT_SEL_MASK, MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL__SHIFT, 0, 0x2 }
>  };
>
> -static const struct baco_cmd_entry turn_off_plls_tbl[] =3D
> -{
> +static const struct baco_cmd_entry turn_off_plls_tbl[] =3D {
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPL=
L_RESET_MASK, CG_SPLL_FUNC_CNTL__SPLL_RESET__SHIFT, 0,     0x1 },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPL=
L_PWRON_MASK, CG_SPLL_FUNC_CNTL__SPLL_PWRON__SHIFT, 0,     0x0 },
> @@ -88,8 +84,7 @@ static const struct baco_cmd_entry turn_off_plls_tbl[] =
=3D
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, 0x8000000, 0x1b, 0, 0x=
0 }
>  };
>
> -static const struct baco_cmd_entry clk_req_b_tbl[] =3D
> -{
> +static const struct baco_cmd_entry clk_req_b_tbl[] =3D {
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_CLKPIN_CNTL_2 },
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_CLKPIN_CNTL_2__FORC=
E_BIF_REFCLK_EN_MASK, CG_CLKPIN_CNTL_2__FORCE_BIF_REFCLK_EN__SHIFT, 0, 0x0 =
},
>         { CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixMPLL_BYPASSCLK_SEL }=
,
> @@ -104,8 +99,7 @@ static const struct baco_cmd_entry clk_req_b_tbl[] =3D
>         { CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, THM_CLK_CNTL__TMON_CLK=
_SEL_MASK, THM_CLK_CNTL__TMON_CLK_SEL__SHIFT, 0, 0x1 }
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
> @@ -122,8 +116,7 @@ static const struct baco_cmd_entry enter_baco_tbl[] =
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
> @@ -138,8 +131,7 @@ static const struct baco_cmd_entry exit_baco_tbl[] =
=3D
>         { CMD_WAITFOR, mmBACO_CNTL, BACO_CNTL__BACO_MODE_MASK, 0, 0xfffff=
fff, 0x00 }
>  };
>
> -static const struct baco_cmd_entry clean_baco_tbl[] =3D
> -{
> +static const struct baco_cmd_entry clean_baco_tbl[] =3D {
>         { CMD_WRITE, mmBIOS_SCRATCH_0, 0, 0, 0, 0 },
>         { CMD_WRITE, mmBIOS_SCRATCH_1, 0, 0, 0, 0 },
>         { CMD_WRITE, mmBIOS_SCRATCH_2, 0, 0, 0, 0 },
> --
> 2.17.1
>
