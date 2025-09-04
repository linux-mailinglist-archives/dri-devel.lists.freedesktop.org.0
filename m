Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5AB47831
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B395D10E432;
	Sat,  6 Sep 2025 22:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="or71Y3L9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5800F10EAB3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:04:21 +0000 (UTC)
Message-ID: <3ec43f82-26ad-478d-8470-31ab4719cc2a@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1757009059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqcJUFkw3lfYabmECLa0bCXwkv5VvVIV6gzH7YTUci4=;
 b=or71Y3L9Fo+tKY03r0JQIZNejIO+T7cIUz51B2XLV1xQBqL0/RE/5TPmSmZZf/m/5Mm2BY
 jNhAkntzH5Jtj5tKaH2mOKUSw8kUBfSEMDb5YCJKEnCkwTzwo57Te4yxs9mHTEPPqNQbSG
 0LlZQZaMc0pNsA/BkOcAmJo7bqMr5EC+7BV8fu0ktMa/doMdbkZKp60Xp4d1Y6Q6X35wzh
 CA7r9498ls+XIQgLap+5NknSq22j4TptwSYWELyCspMl7gGvW6r76TGDmToKXT05TyuMSC
 8SpfJBvRi2GyBwWTXw4v8AFbCE3qgKtmN41C8thraW/Xd1SYF9eUYS9Sks+aoA==
Date: Thu, 4 Sep 2025 20:04:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1 01/10] drm: panel-orientation-quirks: Add AOKZOE A1 Pro
To: Antheas Kapenekakis <lkml@antheas.dev>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904175025.3249650-1-lkml@antheas.dev>
 <20250904175025.3249650-2-lkml@antheas.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20250904175025.3249650-2-lkml@antheas.dev>
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
> The AOKZOE A1 Pro has a portrait 16:10 panel, add a quirk for it.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3a218fb592ce..f5c7275cf026 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -179,6 +179,12 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Win600"),
>   		},
>   		.driver_data = (void *)&lcd720x1280_rightside_up,
> +	}, {	/* AOKZOE A1 Pro */
> +		.matches = {
> +		 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AOKZOE"),
> +		 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AOKZOE A1 Pro"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_leftside_up,
>   	}, {	/* Asus T100HA */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),

Reviewed-by: Philip Müller <philm@manjaro.org>

-- 
Best, Philip
