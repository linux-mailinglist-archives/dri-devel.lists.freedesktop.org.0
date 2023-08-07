Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6A772A99
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F36C89EAC;
	Mon,  7 Aug 2023 16:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD8E10E2B3;
 Mon,  7 Aug 2023 16:25:06 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1bb69c0070dso3602436fac.1; 
 Mon, 07 Aug 2023 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425506; x=1692030306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOWOgyUv1qrx+9DmmFpIQpCVfnmLKrcEfAnIcHRhdZs=;
 b=s4nBDeDhgnn0DtVRgUkqUUbApXJue9T4uVFIFUPgNM1dYs3VFIDrG+fZyR8Fnzx+xk
 ucLapytaUbg4ZOTBpkKRPOHgqqUXbyKVRxnYZyOfql03n15oL+y96fOlFUb7A4NQ4UCo
 PmdvH9Uhs+Z/fezk0PP9PMZHr43jFqmHM6FBr2sUYsupkWnZrtb4sg42CjzNqEfjPNGM
 IIVnqEg/2Qwk7ka5cBx1hOSOTXB1qQYuChoR6pJqRzYn8jeZe+xHETu71HWRmfVUgITL
 0ZdZI0gsGYK2hQbnhqvvnwyWeTygqZhy6KVfrXsE2COuDARkVWOHTj2yNVkEOs03a7kk
 eLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425506; x=1692030306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOWOgyUv1qrx+9DmmFpIQpCVfnmLKrcEfAnIcHRhdZs=;
 b=bhq+HVmwAEDmh1ee3uXlSAisHjT3vs3t8l7yK+Vg9Pk5LrgDZO2LmuwRuKCLNjxAOc
 MRfXDCFznxNfPQUiE2k8zdDqdJL149YSM7KFWG8TlDE3d2eKcKJ5MjqsxUR7WwEilNUi
 Tg1PSHtJwplsiCurPbLG/Bbukb348d0keO6S9xLVofm9Ju7hdKn1Ytr0Yy6zOzrFKRL6
 luYh20xqbFmKdXLEuJTZZSgLZ91kouGEruMYVuxGgj6IuyoZJQhkzQuDPap4aEE91TBo
 ctoLkrDWlO49cUUUCcv7D7tXboz8PV4/skuxmeJsHTfOtLx8dua/gQ2SsJ2d8fF12PDe
 PB8A==
X-Gm-Message-State: AOJu0YyIFGYkWVmbmVprbHoSm8AgIhR5o7HRhJcQzUfzbr1pwXuiP7Dp
 Ld2I3IMwxAqv+3mQwrjLAELiW8alux2/e9mFvfo=
X-Google-Smtp-Source: AGHT+IHoGDnJkdKJd57JSppSx0FZ3g/L3aeLHmPRvBh3gPJZJymQwuBQvcISwk0qOsAZz6TrB9OBfNswDJLtwJ7ghPE=
X-Received: by 2002:a05:6870:56aa:b0:1bf:2661:4871 with SMTP id
 p42-20020a05687056aa00b001bf26614871mr10898197oao.4.1691425506060; Mon, 07
 Aug 2023 09:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230801024448.4848-1-sunran001@208suo.com>
In-Reply-To: <20230801024448.4848-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:24:55 -0400
Message-ID: <CADnq5_PzOPWca4mU12MCaibRS8=tgY1-o7853sh0tf_Twh2ukQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega10_baco.c
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

On Mon, Jul 31, 2023 at 10:45=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: space prohibited before that ',' (ctx:WxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/vega10_baco.c  | 26 ++++++++-----------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_baco.c b/drive=
rs/gpu/drm/amd/pm/powerplay/hwmgr/vega10_baco.c
> index 46bb16c29cf6..6836e98d37be 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_baco.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_baco.c
> @@ -31,24 +31,22 @@
>
>
>
> -static const struct soc15_baco_cmd_entry  pre_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry  pre_baco_tbl[] =3D {
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIF_DOORBELL_CNT=
L), BIF_DOORBELL_CNTL__DOORBELL_MONITOR_EN_MASK, BIF_DOORBELL_CNTL__DOORBEL=
L_MONITOR_EN__SHIFT, 0, 1},
>         {CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIF_FB_EN), 0, 0, 0, 0},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_DSTATE_BYPASS_MASK, BACO_CNTL__BACO_DSTATE_BYPASS__SHIFT, 0, 1}=
,
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_RST_INTR_MASK_MASK, BACO_CNTL__BACO_RST_INTR_MASK__SHIFT, 0, 1}
>  };
>
> -static const struct soc15_baco_cmd_entry enter_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry enter_baco_tbl[] =3D {
>         {CMD_WAITFOR, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), THM_BACO_=
CNTL__SOC_DOMAIN_IDLE_MASK, THM_BACO_CNTL__SOC_DOMAIN_IDLE__SHIFT, 0xffffff=
ff, 0x80000000},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_EN_MASK, BACO_CNTL__BACO_EN__SHIFT, 0, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_BIF_LCLK_SWITCH_MASK, BACO_CNTL__BACO_BIF_LCLK_SWITCH__SHIFT, 0=
, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_DUMMY_EN_MASK, BACO_CNTL__BACO_DUMMY_EN__SHIFT, 0, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SOC_VDCI_RESET_MASK, THM_BACO_CNTL__BACO_SOC_VDCI_RESET_=
_SHIFT, 0, 1},
> -       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SMNCLK_MUX_MASK, THM_BACO_CNTL__BACO_SMNCLK_MUX__SHIFT,0=
, 1},
> +       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SMNCLK_MUX_MASK, THM_BACO_CNTL__BACO_SMNCLK_MUX__SHIFT, =
0, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_ISO_EN_MASK, THM_BACO_CNTL__BACO_ISO_EN__SHIFT, 0, 1},
> -       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_AEB_ISO_EN_MASK, THM_BACO_CNTL__BACO_AEB_ISO_EN__SHIFT,0=
, 1},
> +       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_AEB_ISO_EN_MASK, THM_BACO_CNTL__BACO_AEB_ISO_EN__SHIFT, =
0, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_ANA_ISO_EN_MASK, THM_BACO_CNTL__BACO_ANA_ISO_EN__SHIFT, =
0, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SOC_REFCLK_OFF_MASK,     THM_BACO_CNTL__BACO_SOC_REFCLK_=
OFF__SHIFT, 0, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_POWER_OFF_MASK, BACO_CNTL__BACO_POWER_OFF__SHIFT, 0, 1},
> @@ -58,13 +56,12 @@ static const struct soc15_baco_cmd_entry enter_baco_t=
bl[] =3D
>         {CMD_WAITFOR, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO_CNTL__B=
ACO_MODE_MASK, BACO_CNTL__BACO_MODE__SHIFT, 0xffffffff, 0x100}
>  };
>
> -static const struct soc15_baco_cmd_entry exit_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry exit_baco_tbl[] =3D {
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_POWER_OFF_MASK, BACO_CNTL__BACO_POWER_OFF__SHIFT, 0, 0},
> -       {CMD_DELAY_MS, 0, 0, 0, 0, 0, 0, 10,0},
> -       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SOC_REFCLK_OFF_MASK, THM_BACO_CNTL__BACO_SOC_REFCLK_OFF_=
_SHIFT, 0,0},
> +       {CMD_DELAY_MS, 0, 0, 0, 0, 0, 0, 10, 0},
> +       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SOC_REFCLK_OFF_MASK, THM_BACO_CNTL__BACO_SOC_REFCLK_OFF_=
_SHIFT, 0, 0},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_ANA_ISO_EN_MASK, THM_BACO_CNTL__BACO_ANA_ISO_EN__SHIFT, =
0, 0},
> -       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_AEB_ISO_EN_MASK, THM_BACO_CNTL__BACO_AEB_ISO_EN__SHIFT,0=
, 0},
> +       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_AEB_ISO_EN_MASK, THM_BACO_CNTL__BACO_AEB_ISO_EN__SHIFT, =
0, 0},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_ISO_EN_MASK, THM_BACO_CNTL__BACO_ISO_EN__SHIFT, 0, 0},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_PWROKRAW_CNTL_MASK, THM_BACO_CNTL__BACO_PWROKRAW_CNTL__S=
HIFT, 0, 1},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SMNCLK_MUX_MASK, THM_BACO_CNTL__BACO_SMNCLK_MUX__SHIFT, =
0, 0},
> @@ -74,13 +71,12 @@ static const struct soc15_baco_cmd_entry exit_baco_tb=
l[] =3D
>         {CMD_WAITFOR, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), THM_BACO_=
CNTL__BACO_EXIT_MASK, 0, 0xffffffff, 0},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(THM, 0, mmTHM_BACO_CNTL), T=
HM_BACO_CNTL__BACO_SB_AXI_FENCE_MASK, THM_BACO_CNTL__BACO_SB_AXI_FENCE__SHI=
FT, 0, 0},
>         {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_DUMMY_EN_MASK, BACO_CNTL__BACO_DUMMY_EN__SHIFT,  0, 0},
> -       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_BIF_LCLK_SWITCH_MASK ,BACO_CNTL__BACO_BIF_LCLK_SWITCH__SHIFT, 0=
, 0},
> -       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_EN_MASK , BACO_CNTL__BACO_EN__SHIFT, 0,0},
> +       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_BIF_LCLK_SWITCH_MASK, BACO_CNTL__BACO_BIF_LCLK_SWITCH__SHIFT, 0=
, 0},
> +       {CMD_READMODIFYWRITE, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO=
_CNTL__BACO_EN_MASK, BACO_CNTL__BACO_EN__SHIFT, 0, 0},
>         {CMD_WAITFOR, SOC15_REG_ENTRY(NBIF, 0, mmBACO_CNTL), BACO_CNTL__B=
ACO_MODE_MASK, 0, 0xffffffff, 0}
>   };
>
> -static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D
> -{
> +static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D {
>         {CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_6), 0, 0, 0, =
0},
>         {CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_7), 0, 0, 0, =
0},
>  };
> --
> 2.17.1
>
