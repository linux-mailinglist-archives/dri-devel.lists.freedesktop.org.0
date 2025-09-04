Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7EAB47839
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0B910E440;
	Sat,  6 Sep 2025 22:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="mEgIevQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4005710E350
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:09:32 +0000 (UTC)
Message-ID: <5682ab63-d979-4be9-952e-82b00ca9d796@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1757009370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Euv4No74X68IhkaDokRPif19XB+//dlC/qMiC9ds8aA=;
 b=mEgIevQQx+kvAMKZFLTxqWbBYOC6e3mcwi5MRc5jw45F4V0WAY2DtDU1VuCj9sjYJnfVWN
 vLs6/3kSKvNVsjHriQsdbFoi+tv+hHAfpphkXeL1nT4MHjoxnFMb/lsm8KITAF8XljqYiW
 YrRH3ivCTGglyU/cgoeCX3IfITVL9Y8CPIA4Pn5LNKzDU9KIJ/pwTBUXnSSkimFdZ3fowE
 QB4Tgoke3kUE2WC6/hmP1g+fRJ0mWpyz1yohHD7dNufJ2kGkGoCcdWnwurae5rk48Kd7X0
 1Ugmu4GFC8sWL9Z2uJA+0r22e+Y89+kqSE4ZKbTBY/Du0aYmf6UtW8fI0K4WVw==
Date: Thu, 4 Sep 2025 20:09:30 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1 09/10] drm: panel-orientation-quirks: Add GPD Pocket 4
To: Antheas Kapenekakis <lkml@antheas.dev>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904175025.3249650-1-lkml@antheas.dev>
 <20250904175025.3249650-10-lkml@antheas.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20250904175025.3249650-10-lkml@antheas.dev>
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
> The GPD Pocket 4 is a mini laptop replacement with a portrait
> 2k panel. Add a quirk for it.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 75a8c4532434..5f896d6e4090 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -388,6 +388,12 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1617-01")
>   		},
>   		.driver_data = (void *)&lcd1080x1920_rightside_up,
> +	}, {	/* GPD Pocket 4 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_rightside_up,
>   	}, {	/* I.T.Works TW891 */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),

Reviewed-by: Philip Müller <philm@manjaro.org>

-- 
Best, Philip
