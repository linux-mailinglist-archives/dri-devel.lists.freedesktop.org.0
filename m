Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DDFA43288
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558B610E0E1;
	Tue, 25 Feb 2025 01:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BLsw08Yv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B079B10E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:41:37 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-54524740032so5295138e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740447693; x=1741052493;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpinBTLgUsFr4FW8ynMBn6mnM1bFPNOn+l/M0TzxPak=;
 b=BLsw08Yv8dOXTFE7x7IGrkQEwJ7ytDMlYA74zW6BQYWvXpag45ylq0xRla2ctf/rG8
 v9LR+p0HBX/mhtmilOWJSs8IqY7gEFzXLKMDlvkVdcaW01AzG8LSDW8SistsmhY/Xbru
 vmqxbichz2QxbQHOCe+gedu0giKz1iy8Gd17s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740447693; x=1741052493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpinBTLgUsFr4FW8ynMBn6mnM1bFPNOn+l/M0TzxPak=;
 b=VooAgTmIRB6ya9Xi+OLXOLY4tzMAxFuAO4FwZH9d2nStuFYRvj/eJ6iSr4vwqKlpcb
 /iTDuK+skTniMbmEsdgON9Q9V59VD75KKlTXgmOpdw9q4zUHWeJYRtFt+xFblPl+riOD
 7rb8tZ9RKav7LnhwLdCY/mcX4OPNNwSoUCgNrLBOmKjMK12dBPjY8RmL3OPgj3JJMf6y
 OZctoCNDvECiZzBSWjtQdN3zQAbaD/RUX6gmmQv6+0eSNRwm7SPJ8sPEWv5+wapUKyYh
 aKwW49U/zuuBEHcWIksBCNVkyGLFWWCZmWZVzns84c1k6ZjlgFLuYiX8ySvBM0CHW1Ad
 l2CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr6dkVSBLoErgIKVakza5ABEDydEx02fkefvWqIhr0kClwl+402yRsbWs6yhha11NcSXCgtpmSqVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSFYipIKtpsAz6dWB05GFooqpMAPjXZRqfSsB+B3dMGepQuzxd
 p7dnD9cHwmnG7ZX0rpEw/HEcRwtj0Zb0/b6SQ3XRvY0NspbQ3++IYLDWU3yWPV5YU9pnQlsQBwz
 tgzDM
X-Gm-Gg: ASbGnctpRGth930wLM1/bQ4BUErOGVrz38VE4AUGS/4/UNigD33kTFeGOzI9UNmmyjk
 6qwVSj8CqOcuV++OF7jP7T9RKkolA4TDtYK3PLCwqIBs+6BTOpNZI1QcdM8U/h/AILQ9hf2tUQD
 Ui73/elEm8sfAbFhPALGsOma1Y2XRVzsBVTMUMUfpUuQpYuD26Yp1UA4JPCttAWBWRPaDQBhiXP
 b1WFavLekPsyUBsK5mRsqeh0zLJZi3zy1txJJFZHalmSeW6nHCCpn+Nd9YJEyDvA52wu8OFzdSW
 DPVyE1KkBrpPtw6GhKp4ayiHgkMm142AyNy2kSQSuQydNCsDq3kq8sEAk8fQC33feWiAng==
X-Google-Smtp-Source: AGHT+IGQTw0svBlhZ3CazT05thAFBi10fjw2+jzaiuK40l0H6hOGwEmjaODr31BeXYF/WBO+NZlH5w==
X-Received: by 2002:a05:6512:224b:b0:545:54b:6a05 with SMTP id
 2adb3069b0e04-548510eebcdmr482535e87.45.1740447692542; 
 Mon, 24 Feb 2025 17:41:32 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f4caesm47060e87.194.2025.02.24.17.41.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 17:41:31 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30918c29da2so53677781fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:41:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWL5S2U4SivDUXtS21xqlJDDPX76ZAVFrbodddTqJwcj82/ZL+mCE8j6UAXFV4W+x6dxZF2Zc5zJA4=@lists.freedesktop.org
X-Received: by 2002:a05:6512:12d3:b0:545:5a5:b69f with SMTP id
 2adb3069b0e04-548510cd51bmr337321e87.9.1740447688736; Mon, 24 Feb 2025
 17:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-10-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-10-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:41:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
X-Gm-Features: AWEUYZnKr8Y-H4FsK-guhyhHxicg1iDHnSI-Q2A1gzO1kxk46bWqe3yORiZ3SvY
Message-ID: <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
Subject: Re: [PATCH v7 09/15] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi,

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operations to
> ensure that eDP controller and phy are prepared for AUX transmission.
>
> Additionally, add support for &drm_dp_aux.wait_hpd_asserted() to help
> confirm the HPD state before doing AUX transfers.

Maybe move the addition of the analogix_dpaux_wait_hpd_asserted() to a
separate patch?


> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>
> Changes in v5:
> - Advance PM operations to make eDP AUX work well
>
> Changes in v6:
> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>   operations
>
> Changes in v7:
> - Fix the misspelling of word 'operations' in commit message
> - Remove the check related to CONFIG_PM
> - Remove the unnecessary call to pm_runtime_dont_use_autosuspend() if
>   devm_pm_runtime_enable() fails
> - Remove unnecessary function analogix_dp_remove()
> - Add new function analogix_dpaux_wait_hpd_asserted()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 37 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index a57e06d303a1..ff81c37dbe1d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1548,6 +1548,22 @@ static ssize_t analogix_dpaux_transfer(struct drm_=
dp_aux *aux,
>         return ret;
>  }
>
> +static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsi=
gned long wait_us)
> +{
> +       struct analogix_dp_device *dp =3D to_dp(aux);
> +       int val;
> +       int ret;
> +
> +       pm_runtime_get_sync(dp->dev);
> +
> +       ret =3D readx_poll_timeout(analogix_dp_detect_hpd, dp, val, !val,=
 wait_us / 100, wait_us);

More than happy if someone else wants to overrule me, but it seems
weird that you're looping over a function that already has a loop.
Shouldn't you be calling analogix_dp_get_plug_in_status() directly?
...and if "dp->force_hpd" you probably shouldn't be polling at all. If
HPD is not hooked up I think we decided in sn65dsi86 that we should
just sleep for the maximum time (choosing a conservative value if told
to wait forever).


Aside from that and the idea of moving
analogix_dpaux_wait_hpd_asserted() to a separate patch this looks good
to me.


-Doug
