Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CFBD1D75E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1F510E5A1;
	Wed, 14 Jan 2026 09:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OqCJSNua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49DC10E5A1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:19:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3889160051;
 Wed, 14 Jan 2026 09:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF66C4CEF7;
 Wed, 14 Jan 2026 09:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768382356;
 bh=Xg1uHokVbkf/AB2//v/o26tM7fQq3fxLmTkHi/dCKX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OqCJSNuaAT78SEraUTtYh0fRVp8B6jlBxK2JyJV482UDQUwQdmzFk0qDMDkjSR35o
 /CXRBt/4AamKHYyutIZOCn67NCiuL4ZMiGrpz9yof5z5hubpfJpWlXFvaTtiNyhB6T
 gkTnlxFiLa6Ge+Lf4f2y514Gd7BlW/yvPpSaK+jS1u063ZfiwGGn5v0HJ6Ad4KlZmc
 2pRFkbM7CRKADwD5KkjqSx6nxUvVNhpJXLa1HKaaMcf0sU3xtgNzF6Z3aDhK1gQUcJ
 w6CwejK4wKGOl0TvBhHE0zAP3K7309Gm2kePd4c2iPpvRfttp+C5OXb/xpUjMWakw7
 ClVCrhDBPmQcw==
Date: Wed, 14 Jan 2026 10:19:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] drm/panel: simple: add EDT ET057023UDBA panel
Message-ID: <20260114-keen-persimmon-salmon-8cf683@quoll>
References: <20260113-v6-18-topic-panel-simple-et057023udba-v1-0-54ad218ee52b@pengutronix.de>
 <20260113-v6-18-topic-panel-simple-et057023udba-v1-2-54ad218ee52b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-panel-simple-et057023udba-v1-2-54ad218ee52b@pengutronix.de>
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

On Tue, Jan 13, 2026 at 01:18:38PM +0100, Marco Felsch wrote:
> Add support for the EDT ET057023UDBA 5.7" 24-bit 640x480 DPI panel.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0019de93be1b663f55b04160606363cd043ab38b..0f135eb35aa4302e9a33d91f29d1ad5c9959ced0 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2096,6 +2096,35 @@ static const struct panel_desc edt_et057090dhu = {
>  	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  };
>  
> +static const struct display_timing edt_et057023udba_timing = {
> +	.pixelclock = { 23200000, 24190000, 39640000 },
> +	.hactive = { 640, 640, 640 },
> +	.hfront_porch = { 20, 40, 200 },
> +	.hback_porch = { 87, 40, 1 },
> +	.hsync_len = { 1, 48, 87 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 5, 13, 200 },
> +	.vback_porch = { 31, 31, 29 },
> +	.vsync_len = { 1, 1, 3 },
> +	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc edt_et057023udba = {
> +	.timings = &edt_et057023udba_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 115,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct drm_display_mode edt_etm0700g0dh6_mode = {
>  	.clock = 33260,
>  	.hdisplay = 800,
> @@ -5112,6 +5141,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "edt,et057090dhu",
>  		.data = &edt_et057090dhu,
> +	}, {
> +		.compatible = "edt,et057023udba",

again, why is it so hard to keep things ordered?

> +		.data = &edt_et057023udba,
>  	}, {
>  		.compatible = "edt,et070080dh6",
>  		.data = &edt_etm0700g0dh6,
> 
> -- 
> 2.47.3
> 
