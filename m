Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F81772A72
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79C410E2A4;
	Mon,  7 Aug 2023 16:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8249410E2A1;
 Mon,  7 Aug 2023 16:21:05 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1bb7e083783so3588928fac.2; 
 Mon, 07 Aug 2023 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425265; x=1692030065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qdhSHKQRIMTZzpksAfKTLhsTCnLJ8e90lPKFhVQAZo=;
 b=bvhiDDHiteijaY/QjGL96LOgdtUIXutA20l3dKbKx5vF65uC7pO8E37gF0qFen70fZ
 YWlikcaVtC/4FgGMBx2xbw5QU944OaCj5/Pl04yh+IYho/PPRMLaUqFGRoYdIB26SCfA
 3xoZ8FpzOu4dJL7hzdPEH2jyAj1XsnnIQjkzlbywdY3KJuYevgzK8W4kNmjwqvGT3V31
 d8I/PDe5S2LczaqsiXBRvX9FKfpAIob8PjPddv34Cy5v6kBpd7NEo/HWeaALL4Bwg2yD
 WuZcmHIWZZFtLcmTUw8lfH9ko3DBxagu/DrGQOfoc1ezwnksE0gp2Sot/hwZkf9xSqer
 SRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425265; x=1692030065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4qdhSHKQRIMTZzpksAfKTLhsTCnLJ8e90lPKFhVQAZo=;
 b=HdRIA9jTSIa2yy/AKNO1vdh/CSS+3AJJeXPJ/x1RP785GTi6HMBlcv+FQnSZ6tNyA/
 IhFAma3PDonCHeQ9PAbRBFlP5QyNZvrEibcE2YnNA5jsCWcT1xFT1fFSb3IpgWyyTUpl
 frDHIUakjho8ptSsCP1797MvYnlJqGUFENW+v68dHME0J2YZDGvwOs30df/KQFheU+La
 RALMm/c2ws6M4KVW+e0H7lr+iV5sm994vq7N8uBEvQz51/oQy22PUpZD+0MgyJfbmJgw
 I2kdTWcEP1ecPhx8uvBvLRF/7GbHwhbukaOGDkA744/vIeJRrkpwX206vjZ4YxL5kemI
 YSNw==
X-Gm-Message-State: AOJu0Yw+PfwUsepWMv6DIJIZXJgGb4+1GVABaGMJz9KZh00TJfKzoSBO
 A0dWTOd33bBAQExfnfgT65j52sOTwYyxLyk+Yjw=
X-Google-Smtp-Source: AGHT+IEBgJHKm4YZQsiROKtAjjgXuEh7bfHD2CzK9d1Yg8UYoKcOAC62IPpoaO/VmasLCDJ4K+m+OHzfabjSQRTa0ZE=
X-Received: by 2002:a05:6870:5b9c:b0:1ba:dbbd:31cf with SMTP id
 em28-20020a0568705b9c00b001badbbd31cfmr10688237oab.7.1691425264743; Mon, 07
 Aug 2023 09:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230801020052.4192-1-sunran001@208suo.com>
In-Reply-To: <20230801020052.4192-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:20:53 -0400
Message-ID: <CADnq5_O9oAvxwcd5x5aAiXbDF36GeO6hnRGySr0rkHcXWtMXUw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in aldebaran_ppt.c
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

On Mon, Jul 31, 2023 at 10:01=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: spaces required around that '=3D' (ctx:VxW)
> ERROR: else should follow close brace '}'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index ce50ef46e73f..8f26123ac703 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -94,8 +94,7 @@
>   */
>  #define SUPPORT_BAD_CHANNEL_INFO_MSG_VERSION 0x00443300
>
> -static const struct smu_temperature_range smu13_thermal_policy[] =3D
> -{
> +static const struct smu_temperature_range smu13_thermal_policy[] =3D {
>         {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 9=
9000},
>         { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000,=
 120000},
>  };
> @@ -196,7 +195,7 @@ static const struct cmn2asic_mapping aldebaran_featur=
e_mask_map[SMU_FEATURE_COUN
>         ALDEBARAN_FEA_MAP(SMU_FEATURE_FW_CTF_BIT,                        =
       FEATURE_FW_CTF_BIT),
>         ALDEBARAN_FEA_MAP(SMU_FEATURE_THERMAL_BIT,                       =
       FEATURE_THERMAL_BIT),
>         ALDEBARAN_FEA_MAP(SMU_FEATURE_OUT_OF_BAND_MONITOR_BIT,  FEATURE_O=
UT_OF_BAND_MONITOR_BIT),
> -       ALDEBARAN_FEA_MAP(SMU_FEATURE_XGMI_PER_LINK_PWR_DWN_BIT,FEATURE_X=
GMI_PER_LINK_PWR_DWN),
> +       ALDEBARAN_FEA_MAP(SMU_FEATURE_XGMI_PER_LINK_PWR_DWN_BIT, FEATURE_=
XGMI_PER_LINK_PWR_DWN),
>         ALDEBARAN_FEA_MAP(SMU_FEATURE_DF_CSTATE_BIT,                    F=
EATURE_DF_CSTATE),
>  };
>
> @@ -580,7 +579,7 @@ static int aldebaran_get_smu_metrics_data(struct smu_=
context *smu,
>                                           MetricsMember_t member,
>                                           uint32_t *value)
>  {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         SmuMetrics_t *metrics =3D (SmuMetrics_t *)smu_table->metrics_tabl=
e;
>         int ret =3D 0;
>
> @@ -1906,8 +1905,7 @@ static int aldebaran_mode1_reset(struct smu_context=
 *smu)
>         smu_cmn_get_smc_version(smu, NULL, &smu_version);
>         if (smu_version < 0x00440700) {
>                 ret =3D smu_cmn_send_smc_msg(smu, SMU_MSG_Mode1Reset, NUL=
L);
> -       }
> -       else {
> +       } else {
>                 /* fatal error triggered by ras, PMFW supports the flag
>                    from 68.44.0 */
>                 if ((smu_version >=3D 0x00442c00) && ras &&
> @@ -2116,7 +2114,7 @@ static const struct pptable_funcs aldebaran_ppt_fun=
cs =3D {
>         .register_irq_handler =3D smu_v13_0_register_irq_handler,
>         .set_azalia_d3_pme =3D smu_v13_0_set_azalia_d3_pme,
>         .get_max_sustainable_clocks_by_dc =3D smu_v13_0_get_max_sustainab=
le_clocks_by_dc,
> -       .baco_is_support=3D aldebaran_is_baco_supported,
> +       .baco_is_support =3D aldebaran_is_baco_supported,
>         .get_dpm_ultimate_freq =3D smu_v13_0_get_dpm_ultimate_freq,
>         .set_soft_freq_limited_range =3D aldebaran_set_soft_freq_limited_=
range,
>         .od_edit_dpm_table =3D aldebaran_usr_edit_dpm_table,
> --
> 2.17.1
>
