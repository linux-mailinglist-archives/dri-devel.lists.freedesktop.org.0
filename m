Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C350B47836
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28DC10E43F;
	Sat,  6 Sep 2025 22:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="haD/vaqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5384F10E350
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:09:47 +0000 (UTC)
Message-ID: <4b29a3d0-c1b4-4a59-8c51-66dd2513257c@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1757009386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njoucinG9fuQB8MatP08sKlyuCvmD+sj97bdY637AAQ=;
 b=haD/vaqXFva8QVdel8TMrGGNI1Qcj5WWCWWb94nxFPSlDxyz1utDg8s1I7JDH5Di46p56v
 NxXBGhx7tSoplBwkzbPdb2+9yw1n91ozwLuQu6YAczT0PdKmrazh3HJd33tkJ2pBM7qamO
 5fN+ZggefXhOzlXBdrNEZaQ5aFoGz1xElAfyQ5nx1W3DT/ZDkdfS4LPRyGn5bDOp6OCffS
 oTgLzaoEMZwcP6uWyrRKQ93drJeRuuTt/sjOeIwmIpAK79o5x/JEnt06oue55Ih7MPKpc5
 G5DmllBMDjB8HJ/rtZ5qYKlfApoXhzeKCv54tOXuqnBkVxcwX7N+uwQWnIeVPg==
Date: Thu, 4 Sep 2025 20:09:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1 10/10] drm: panel-orientation-quirks: Add Zeenix Lite
 and Pro
To: Antheas Kapenekakis <lkml@antheas.dev>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904175025.3249650-1-lkml@antheas.dev>
 <20250904175025.3249650-11-lkml@antheas.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20250904175025.3249650-11-lkml@antheas.dev>
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
> Add quirks for two Zeenix handhelds, the Lite and the Pro.
> They are identical to the Ayn Loki and the Ayn Loki Pro respectively.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 5f896d6e4090..201e5349f3ac 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -594,6 +594,18 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
>   		},
>   		.driver_data = (void *)&lcd1280x1920_rightside_up,
> +	}, {    /* Tectoy Zeenix Lite */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Lite"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
> +	}, {    /* Tectoy Zeenix Pro */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>   	}, {	/* Valve Steam Deck (Jupiter) */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),

Reviewed-by: Philip Müller <philm@manjaro.org>

-- 
Best, Philip
