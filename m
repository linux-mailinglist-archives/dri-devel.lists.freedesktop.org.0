Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F891BA80
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 10:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC2F10E69E;
	Fri, 28 Jun 2024 08:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kRkP8Qch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4AD10E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 08:56:34 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52e7d2278d8so345499e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719564993; x=1720169793; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G0/fXtxHzxiSZJyy61Hud7FSSfRF9PobKUFTEvqKe8E=;
 b=kRkP8Qch97fhNRzh5iq6BYBMwmeBArX+T0Q6JwYsknBnyEyG1w1OPZ5zu2Va8tIkXi
 UPk0ZZvw0Iw7iy5Ba6ZcOgl+kssJwDGEec+w1hFkISjL3V2VvMvbyVO7A9jezNtm5Vba
 MFYtO1LxyKt+yO2+AiWeyyvov6C9uJwNMKSGHbQs2szGGPE8L4E5Ph/bvGE0IRw2WocQ
 4X7mEJexBCHwmTZpC02WGlAIPep2yD/w5JurQg9sfv3afe6gyAr6RrB0QG3Njxb+vOWK
 y+wa8Sd5GK/R3g1G5LrVRimTx2jhKrh6Ajn42IT24SE7J3bqTSftNf2cp0gUJ8sSHLh5
 VZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719564993; x=1720169793;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0/fXtxHzxiSZJyy61Hud7FSSfRF9PobKUFTEvqKe8E=;
 b=OaQnSGEucq89OAI0QU0O3qUAAiauDkdxX/V0qKGftSMDH0gumKn85+LJAk0gV5b5d9
 VpGhcu1UCbEZ/f7kwFVe5lXXKtDeZI4KR6jj4kFDFQJGMXE/hZPQnu5TQkP+9YJWey5U
 ZcXFsgJy5mrCvWbyw0K5baVSoldWoqg3YxSdMHPnKvScgHWaDlitSdFw+z2mwQtXnjKV
 kXVBJsS3EX6//E3eGnazUD1eGYCwGV+jYbE2o1tHsbzS7huU5zKHc/BcaM/CKzSzxNFk
 6vwi+nwKVCX5atSnUVnSDbi1atwMdpqlrHVzipg9i1WqhVguI9If87twwjJoYURLG06f
 xeqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnJ7LAkYBuO8MfKHLWPt2gksjTNt+1zyU0wf7HSju19dBEGs5FrMvSn/+lHgLpeKtCgcobErEBlqlqQWsarzWJiTbhvLYGjBWT4O7C/iEU
X-Gm-Message-State: AOJu0YzlHyBlJOS7eW9Yj1XaZFSpYtJPtVFZeCAco8M44Fz1LlwpCf38
 Yk3iIXrjh8aAmtQIiNmeTn17aQVyGnMst2PVNMn0A11zvEwJZI2LdTzeWl8paVY=
X-Google-Smtp-Source: AGHT+IGyMkgUnh6bttOHSTc8HADwe9dEhAxSgr60CTSFMQWZlDbk/VecTjiLPbTW2itaDM+uq+3S3w==
X-Received: by 2002:a05:6512:ea4:b0:52b:c33a:aa7c with SMTP id
 2adb3069b0e04-52ce185ced0mr15126638e87.65.1719564992926; 
 Fri, 28 Jun 2024 01:56:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2eabfsm211556e87.199.2024.06.28.01.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 01:56:32 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:56:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Paul Gerber <paul.gerber@ew.tq-group.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add AUO G104STN01 panel entry
Message-ID: <koapph3wqmkwovyjp4ms5flfbaoip642c3nzg5gt4e5czq7tal@pwy2o3zt45tk>
References: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
 <20240627084446.3197196-3-paul.gerber@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627084446.3197196-3-paul.gerber@ew.tq-group.com>
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

On Thu, Jun 27, 2024 at 10:44:44AM GMT, Paul Gerber wrote:
> Add support for the AUO G104STN01 10.4" (800x600) LCD-TFT panel.
> 
> Signed-off-by: Paul Gerber <paul.gerber@ew.tq-group.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Tested on TQ TQMa8MPxL on MBa8MPxL.
> 
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index dcb6d0b6ced0..5eacd2085a53 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1081,6 +1081,30 @@ static const struct panel_desc auo_g104sn02 = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct drm_display_mode auo_g104stn01_mode = {
> +	.clock = 40000,

Nit: could you please express this as (800 + 40 + 88 + 128) * (600 + 1 + 23 + 4) * 60 / 1000 ?

LGTM otherwise.

> +	.hdisplay = 800,
> +	.hsync_start = 800 + 40,
> +	.hsync_end = 800 + 40 + 88,
> +	.htotal = 800 + 40 + 88 + 128,
> +	.vdisplay = 600,
> +	.vsync_start = 600 + 1,
> +	.vsync_end = 600 + 1 + 23,
> +	.vtotal = 600 + 1 + 23 + 4,
> +};
> +
> +static const struct panel_desc auo_g104stn01 = {
> +	.modes = &auo_g104stn01_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 211,
> +		.height = 158,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>  static const struct display_timing auo_g121ean01_timing = {
>  	.pixelclock = { 60000000, 74400000, 90000000 },
>  	.hactive = { 1280, 1280, 1280 },
> @@ -4434,6 +4458,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "auo,g104sn02",
>  		.data = &auo_g104sn02,
> +	}, {
> +		.compatible = "auo,g104stn01",
> +		.data = &auo_g104stn01,
>  	}, {
>  		.compatible = "auo,g121ean01",
>  		.data = &auo_g121ean01,
> -- 
> 2.44.1
> 

-- 
With best wishes
Dmitry
