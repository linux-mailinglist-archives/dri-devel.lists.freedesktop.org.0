Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F282E772B52
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E03D10E2EC;
	Mon,  7 Aug 2023 16:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8FC10E2E5;
 Mon,  7 Aug 2023 16:43:25 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6bcd4b5ebbaso2720994a34.1; 
 Mon, 07 Aug 2023 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426604; x=1692031404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnJspdP6uFshcd/ClPJoHP/OplKyZfFGjP8C4TEvEX0=;
 b=GP5AjxymDdX6TPUAaEC8uc/2Xr8X4pwTOPjPy3RXD1RaNBARQFqTHQIVGcYspRpACx
 Ev8DfZTes/e3EcsFMn9HyCXFwUnC34bi+r9cq/nCavbhdzMZejL/gNFrVmPVPZqTnwU8
 cbGg4y3Tes4iI/759ZSwunBiQ0fquE3mqckX0tr2EpsPEXbJ+vs/oSVqJVzn4brjWkO2
 odhZMac7HXGvm1DOA3EfrcOria3ksRyz7ZkWdGKWLkqSSgdcOm1ThbzgHuZ81AU/uVcr
 q01/+M/Vne1T35C25Qfc5pdtMJCnwlZTNgbPO2tsMxKpVN++piqIR69Bo5wp8pzsAYeW
 zM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426604; x=1692031404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnJspdP6uFshcd/ClPJoHP/OplKyZfFGjP8C4TEvEX0=;
 b=E0xnmzIs3nTWMaU6lDJSyASrqw88YLpJ7DWjNQpM54GRlwCsJEDCFj1PhljDmy04hx
 uBlW273HJGiS041qIJtpP7I9edwn4U/s+vOupdhHBr5hSnTQ6rL3oVvoALIxQOEhTi24
 QkrmIz1fDrOe7U8oVks5I2pU3l3aHNGqitvFut0uBxV5yt8w/GG8HZ0a+LH0wlSl1F09
 pPIOTdglEGcbKD8zlqjVnFIBoXHy6v/7xwK1eMFgG1Sn22wPmXm1z65S6HjG4TUrzyTx
 Joqd3IEjAROFU6jJz57KjYJl0KpJNL0G9n4ZVcEEKe+2Y9PW8bHI43mvtevhfAZq6qTH
 PD5w==
X-Gm-Message-State: AOJu0YydqycRwx1tAIOsY4krwuDWM6D8fbmoWg1K2IPOaM2DqXOACHTB
 A8RgsELrS+xVbW9g7A8Cf1GEq0Dozk7Wkg5nk+0DECM5
X-Google-Smtp-Source: AGHT+IHLSWBhQgqchaBUBCE8UV4V5n1zKpJe1asRH0MnfD/Ysu4F/DvU3E8c2WYCysDQbC1u4zoH5D1kb13yO5sZcm8=
X-Received: by 2002:a05:6871:821:b0:1bb:d808:da72 with SMTP id
 q33-20020a056871082100b001bbd808da72mr11632433oap.57.1691426604555; Mon, 07
 Aug 2023 09:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230801092821.7495-1-sunran001@208suo.com>
In-Reply-To: <20230801092821.7495-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:43:13 -0400
Message-ID: <CADnq5_NsAjYq=Fq8oSYYdfh+QB=TMgSjTZS+cLWWezunzzHU6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/powerplay: Clean up errors in vega20_hwmgr.c
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

On Tue, Aug 1, 2023 at 5:28=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: code indent should use tabs where possible
> ERROR: space required before the open parenthesis '('
> ERROR: space prohibited before that close parenthesis ')'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> index 4e19ccbdb807..492ca33637d6 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> @@ -1402,7 +1402,7 @@ static int vega20_od8_set_settings(
>                         "Failed to export over drive table!",
>                         return ret);
>
> -       switch(index) {
> +       switch (index) {
>         case OD8_SETTING_GFXCLK_FMIN:
>                 od_table.GfxclkFmin =3D (uint16_t)value;
>                 break;
> @@ -2360,7 +2360,7 @@ static int vega20_notify_smc_display_config_after_p=
s_adjustment(
>                 dpm_table->dpm_state.hard_min_level =3D min_clocks.memory=
Clock / 100;
>                 PP_ASSERT_WITH_CODE(!(ret =3D smum_send_msg_to_smc_with_p=
arameter(hwmgr,
>                                 PPSMC_MSG_SetHardMinByFreq,
> -                               (PPCLK_UCLK << 16 ) | dpm_table->dpm_stat=
e.hard_min_level,
> +                               (PPCLK_UCLK << 16) | dpm_table->dpm_state=
.hard_min_level,
>                                 NULL)),
>                                 "[SetHardMinFreq] Set hard min uclk faile=
d!",
>                                 return ret);
> @@ -3579,7 +3579,7 @@ static int vega20_set_uclk_to_highest_dpm_level(str=
uct pp_hwmgr *hwmgr,
>                 dpm_table->dpm_state.hard_min_level =3D dpm_table->dpm_le=
vels[dpm_table->count - 1].value;
>                 PP_ASSERT_WITH_CODE(!(ret =3D smum_send_msg_to_smc_with_p=
arameter(hwmgr,
>                                 PPSMC_MSG_SetHardMinByFreq,
> -                               (PPCLK_UCLK << 16 ) | dpm_table->dpm_stat=
e.hard_min_level,
> +                               (PPCLK_UCLK << 16) | dpm_table->dpm_state=
.hard_min_level,
>                                 NULL)),
>                                 "[SetUclkToHightestDpmLevel] Set hard min=
 uclk failed!",
>                                 return ret);
> @@ -3605,7 +3605,7 @@ static int vega20_set_fclk_to_highest_dpm_level(str=
uct pp_hwmgr *hwmgr)
>                 dpm_table->dpm_state.soft_min_level =3D dpm_table->dpm_le=
vels[dpm_table->count - 1].value;
>                 PP_ASSERT_WITH_CODE(!(ret =3D smum_send_msg_to_smc_with_p=
arameter(hwmgr,
>                                 PPSMC_MSG_SetSoftMinByFreq,
> -                               (PPCLK_FCLK << 16 ) | dpm_table->dpm_stat=
e.soft_min_level,
> +                               (PPCLK_FCLK << 16) | dpm_table->dpm_state=
.soft_min_level,
>                                 NULL)),
>                                 "[SetFclkToHightestDpmLevel] Set soft min=
 fclk failed!",
>                                 return ret);
> @@ -3727,8 +3727,8 @@ static int vega20_apply_clocks_adjust_rules(struct =
pp_hwmgr *hwmgr)
>         uint32_t i, latency;
>
>         disable_mclk_switching =3D ((1 < hwmgr->display_config->num_displ=
ay) &&
> -                           !hwmgr->display_config->multi_monitor_in_sync=
) ||
> -                            vblank_too_short;
> +                               !hwmgr->display_config->multi_monitor_in_=
sync) ||
> +                               vblank_too_short;
>         latency =3D hwmgr->display_config->dce_tolerable_mclk_in_active_l=
atency;
>
>         /* gfxclk */
> --
> 2.17.1
>
