Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7C4B47838
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B348F10E43E;
	Sat,  6 Sep 2025 22:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="Zo2m9vfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FE110E350
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:09:08 +0000 (UTC)
Message-ID: <7e709a39-45ae-499b-bafd-706489e180e9@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1757009347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1t3DdUHbRL7Z4Mgfcjt/Br8K22doewpd3l5EF3Tt8g=;
 b=Zo2m9vfOCmKZMkOFA97DRsKy/uUVMlZyO1s8ehhyPT44/UNZzdRO384nxe5PUEOCYnU+Hv
 idchhuhBKg6xcAbFtq9OYRqxh8GPUqxEW+ghxwpjF31ehxd4kaTRJpDvp3s/oetvWcTw2Z
 cbqeL6qIhxEKt4fCEdmDMS1D1Wl4nvsD2GVxk9atlhyP75HnU45WAebvTjA2ZjetJ6cQhz
 CPml+HHksowaVuug1IuY7dHwp4uqPvV/K3j1abiKDyGfd2jzTRlWvTIC0VanBeR1j7NKz1
 NmTdOhFktyAZ+VvgC6weTT4Xc0yVZMP9p5GsbLCnHYnd7a9sARwN57AmeZf9mQ==
Date: Thu, 4 Sep 2025 20:09:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1 06/10] drm: panel-orientation-quirks: Add OneXPlayer F1
 variants
To: Antheas Kapenekakis <lkml@antheas.dev>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904175025.3249650-1-lkml@antheas.dev>
 <20250904175025.3249650-7-lkml@antheas.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20250904175025.3249650-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=philm@manjaro.org smtp.mailfrom=philm@manjaro.org
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:50:09 +0000
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

On 9/4/25 19:50, Antheas Kapenekakis wrote:
> The OneXPlayer F1Pro has a 144hz 1920x1080 portrait OLED panel.
> Add a quirk to correct the panel portrait orientation. In addition,
> it comes with a red limited edition variant in the Chinese market,
> so add that as well. Then, add the 8840U non-pro variant as well.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 0c0fe66e94ad..6f5ce26a84b7 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -540,6 +540,24 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro EVA-02"),
>   		},
>   		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) LE Red variant */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
> +	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) Hawk Point */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 OLED"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
> +	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) Strix Point */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1Pro"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>   	}, {	/* OrangePi Neo */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),

Reviewed-by: Philip Müller <philm@manjaro.org>

-- 
Best, Philip
