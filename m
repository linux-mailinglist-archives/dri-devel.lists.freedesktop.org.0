Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E34B47833
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5210E439;
	Sat,  6 Sep 2025 22:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="Dd0lqhS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE1810E350
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:04:33 +0000 (UTC)
Message-ID: <45345a77-76aa-42c8-bb25-8b37f27f2495@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1757009071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oq/uojrYW5csmb0d80Eu12YQJ327C4sZD+phfZR5BpU=;
 b=Dd0lqhS5GnYAQo+oOzuHDTMZK5rBe54PaFnLgPb/H4DZ2B23Lr7BGcvFil7R9foJA/IVUL
 A7+8nbsTNEfPHx5Z4ELu6vjFpQWUAR1ASI67uexK/JDgjDW3txNx2VR4XOFDF5XXG8bocj
 B+cw6r17LWbB4laFbNyPUTVCKFY8POXugoFk1XH2M+nWqwogL3lgQdGZ7gcfmGw8U6Y+vy
 3szhWv7LFSVJmooJxfvW6jPDzeXjbJdUO6+4TwKPMimwp6rE9+IJgJqhGqRjlGnQuWERxW
 KrwGCavKImKiemIkjQn6boLr/CIz0RU1r7nF8f3wGXXZMLRaha8oqubhPUlW6w==
Date: Thu, 4 Sep 2025 20:04:30 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1 02/10] drm: panel-orientation-quirks: add additional ID
 for Ayaneo 2021
To: Antheas Kapenekakis <lkml@antheas.dev>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904175025.3249650-1-lkml@antheas.dev>
 <20250904175025.3249650-3-lkml@antheas.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20250904175025.3249650-3-lkml@antheas.dev>
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
> The Ayaneo 2021 has an alternate variant that skips AYA in the
> beginning. Add that as well.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index f5c7275cf026..d724253407af 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -215,6 +215,12 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
>   		},
>   		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO 2021 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NEO 2021"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>   	}, {	/* AYA NEO AIR */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),

Reviewed-by: Philip Müller <philm@manjaro.org>

-- 
Best, Philip
