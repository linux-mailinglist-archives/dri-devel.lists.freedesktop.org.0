Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D968FB4783A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2526910E42A;
	Sat,  6 Sep 2025 22:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="IGmGETWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E476610E350
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:08:29 +0000 (UTC)
Message-ID: <799e763c-8f1f-4d4b-8aca-94c416871f65@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1757009308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESwECSRa5+yZuW0lPSnfO/0go7wcxVcfexfShM/7fac=;
 b=IGmGETWDUVyk5CMfeoP63n9L1QSwAJfr8SosdYjUOnknuJQ3r1Hfd0RkVPXvNxz4+Raa5I
 r0tTMTwnEzV7lJTEdyetXkIoT0GBTqx4GUUKNuoswHrFrPcTKS4ERtjtzlRiWdFctoT+E1
 MGBIO5yzqqvEw8l5gWt075YEqBPzqq0fZAwZJd9HAVsYBfqxyFhCVxEvP4tCAaJoah+xjM
 hBCrnceHSgvw9jofHgcc99Rf2gcqj0p8jViNBB6u2AF9Xp2lRpkfHJMmTvKOturkdA1wGq
 pndXsUMkbY49kHsi0YJ/hwEkG6+2SeG8SbsQ4IakMAm8j57QXtq8tTEYVXXSZQ==
Date: Thu, 4 Sep 2025 20:08:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1 04/10] drm: panel-orientation-quirks: Add OneXPlayer X1
 variants
To: Antheas Kapenekakis <lkml@antheas.dev>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904175025.3249650-1-lkml@antheas.dev>
 <20250904175025.3249650-5-lkml@antheas.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20250904175025.3249650-5-lkml@antheas.dev>
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
> The OneXPlayer X1 series features a 2k 10.95 display with a portrait
> orientation. Add quirks to set the panel orientation to portrait mode
> to the Intel, AMD, and EVA-02 variants.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   .../gpu/drm/drm_panel_orientation_quirks.c    | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 0ea06f928f79..378a3f692952 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -504,6 +504,30 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>   		},
>   		.driver_data = (void *)&lcd1200x1920_leftside_up,
> +	}, {	/* OneXPlayer X1 AMD */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 A"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 Intel */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 i"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 AMD Strix Point */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1Pro EVA variant with Intel */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro EVA-02"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
>   	}, {	/* OrangePi Neo */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),

Reviewed-by: Philip Müller <philm@manjaro.org>

-- 
Best, Philip
