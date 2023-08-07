Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8F7772A9C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F5910E2B2;
	Mon,  7 Aug 2023 16:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589A010E2B5;
 Mon,  7 Aug 2023 16:25:47 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1bb954414e8so3600981fac.0; 
 Mon, 07 Aug 2023 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425546; x=1692030346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WiRoo0vL6kJ0w8/dkfqWYfJVOit9SFqabx1jj5i4xE=;
 b=MvZlnZBWLkQV8gMSfR7hfCYwLdRhK3YICmTNiPt26cN+I+OrIUHngzBL+nCym/cPRX
 NdS2LnVSU9qr41ss0lf+5GBtc4Gwk1o2KvWB3WuBj2yOBk9ZVBz0CzCABKDKWb8TYci9
 4usW7ZHcm40vToln4809gQlVLasWfqPGB+DZGkJj5Mc8maib8t1a/0Tu7w0bmeqk9mDq
 bpKd+Omc4SGwT+76iqWRTidAWW54Fa/idbWR6lNei2QM7D+XLh1Dlrzs2rnrP3umd+FT
 fKk9LPRFPMYeWMkNrm5OS8zbcmtIHYWrKF2ZSKsrvfstf6EQe4P0PcmA92qhCxrhIk57
 Wa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425546; x=1692030346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WiRoo0vL6kJ0w8/dkfqWYfJVOit9SFqabx1jj5i4xE=;
 b=ZTQZyYJJLD1Vs72yaO/R0Kwp/4VqTzzxef13JlOMF5LdXd6wRED0I0AHtGUTAO7lhV
 cACXvH4BcHoMn1Ua9/7zWPGR4sUplQLj2hjAgdSDVIGLHFFt/mPwcbGZ0cSBzmAk9XrS
 mHlv2s5tDTl0CYrFfNkoP4JVOfB+w47jcpqSXmEpWTgy4TTZ1DUJFtxTLfVJevlFaBlB
 kaFATIY8T4GzUMnfxAUaz1rKK4qxOIr7UuIzjteZ738pelJYVXZxmgAcQ4M9hnOS3iG9
 e3we1cp1t0l9gQ4Z8ak9uiIEvbcsa4oUo19SyC6MRb0lhzbVLVvsWIisPdBal3hDcjH/
 pAOQ==
X-Gm-Message-State: AOJu0Yxjexm1lJkOBcOyNXhATERTlIYQEWg8do5RhkjTKpoHH+ksg1BB
 HvLAuZ6jklCqRCeI4ZeKsnchFc53O+zt1+bmfPQ=
X-Google-Smtp-Source: AGHT+IFg5y/8EPsteDlZHT0mE68zLPv3NjXJQrYnMkt2dG/pGwKCgDInQFjJZaPyiy8PnosX7rv/QyIDNJa+dA7mxBY=
X-Received: by 2002:a05:6870:d147:b0:1b0:653a:af92 with SMTP id
 f7-20020a056870d14700b001b0653aaf92mr11357377oac.8.1691425546593; Mon, 07 Aug
 2023 09:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230801025703.4979-1-sunran001@208suo.com>
In-Reply-To: <20230801025703.4979-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:25:35 -0400
Message-ID: <CADnq5_NLSmco8_zs7pt9KSr7hia-2HcjpLR6PEN6YLZs3Nf=7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega12_hwmgr.c
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

On Mon, Jul 31, 2023 at 10:57=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: need consistent spacing around '/' (ctx:WxV)
> ERROR: code indent should use tabs where possible
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> index 1937be1cf5b4..4bd573d815ff 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> @@ -1623,13 +1623,13 @@ static int vega12_notify_smc_display_config_after=
_ps_adjustment(
>
>         if (data->smu_features[GNLD_DPM_DCEFCLK].supported) {
>                 clock_req.clock_type =3D amd_pp_dcef_clock;
> -               clock_req.clock_freq_in_khz =3D min_clocks.dcefClock/10;
> +               clock_req.clock_freq_in_khz =3D min_clocks.dcefClock / 10=
;
>                 if (!vega12_display_clock_voltage_request(hwmgr, &clock_r=
eq)) {
>                         if (data->smu_features[GNLD_DS_DCEFCLK].supported=
)
>                                 PP_ASSERT_WITH_CODE(
>                                         !smum_send_msg_to_smc_with_parame=
ter(
>                                         hwmgr, PPSMC_MSG_SetMinDeepSleepD=
cefclk,
> -                                       min_clocks.dcefClockInSR /100,
> +                                       min_clocks.dcefClockInSR / 100,
>                                         NULL),
>                                         "Attempt to set divider for DCEFC=
LK Failed!",
>                                         return -1);
> @@ -2354,8 +2354,8 @@ static int vega12_apply_clocks_adjust_rules(struct =
pp_hwmgr *hwmgr)
>         uint32_t i, latency;
>
>         disable_mclk_switching =3D ((1 < hwmgr->display_config->num_displ=
ay) &&
> -                                 !hwmgr->display_config->multi_monitor_i=
n_sync) ||
> -                                 vblank_too_short;
> +                               !hwmgr->display_config->multi_monitor_in_=
sync) ||
> +                               vblank_too_short;
>         latency =3D hwmgr->display_config->dce_tolerable_mclk_in_active_l=
atency;
>
>         /* gfxclk */
> @@ -2522,7 +2522,7 @@ static int vega12_set_uclk_to_highest_dpm_level(str=
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
> --
> 2.17.1
>
