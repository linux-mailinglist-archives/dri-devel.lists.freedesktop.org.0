Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A3750BF63
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A7610E012;
	Fri, 22 Apr 2022 18:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Fri, 22 Apr 2022 18:21:16 UTC
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0024310E012
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5psihodelspOkPgV0bRhG+/NT64DPkO0GhHpysa53SQ=;
 b=RnNkHR6S7UV/63wF6C1flUbhdNpVMcpqrWK0jU7nUJ4c+uqPYr3+2HbLN+4yuR49CHQ7PBYQI6IBJ
 4pEsTyCKhEuaZQGVpqYS3Ec9BrjZv+1+DHdLBQkLQXnmtADSya05nW4OZwmdkEN7gX7lqa5M8cV5oK
 N6Uekkv+dPJIjEDV+e4RfWlnxgt8JE8Tu2r5+Z/hUoWCFEzZHbIVWdmiCDwQgnXMNDPsKGrowWgyUZ
 zzlcQvGSAHhM2opS18lezsc41EKWlAzPmpR3SxwnWNIxuZdNKvKSwsf93UHh9+fVbRGlhN4XysSkc7
 e7RCTYT3bMtbVptDdTwLAPN0M7b8TBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5psihodelspOkPgV0bRhG+/NT64DPkO0GhHpysa53SQ=;
 b=iQ7OXPWFdQBf3oVLEvZjiumJ9xZlIuS55k6ZB/NhWFSKtuX+0uuI/uz9ZaRIJqrFdMUYbFDG0rB39
 +zbk9gWBw==
X-HalOne-Cookie: 8128e7c66d35dfffd85c19680931a80b60358633
X-HalOne-ID: d9d0f710-c268-11ec-a906-d0431ea8a290
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id d9d0f710-c268-11ec-a906-d0431ea8a290;
 Fri, 22 Apr 2022 18:20:13 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:20:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Startek KD070WVFPA043-C069A
 panel support
Message-ID: <YmLx27U6WSvpvWry@ravnborg.org>
References: <20220420005625.990999-1-festevam@gmail.com>
 <20220420005625.990999-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420005625.990999-2-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 09:56:25PM -0300, Fabio Estevam wrote:
> From: Heiko Schocher <hs@denx.de>
> 
> Add Startek KD070WVFPA043-C069A 7" TFT LCD panel support.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a34f4198a534..ca8cd017821d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3311,6 +3311,36 @@ static const struct panel_desc tsd_tst043015cmhx = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>  };
>  
> +static const struct display_timing startek_kd070wvfpa_mode = {
> +	.pixelclock = { 25200000, 27200000, 30500000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 19, 44, 115 },
> +	.hback_porch = { 5, 16, 101 },
> +	.hsync_len = { 1, 2, 100 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 5, 43, 67 },
> +	.vback_porch = { 5, 5, 67 },
> +	.vsync_len = { 1, 2, 66 },
> +};
> +
> +static const struct panel_desc startek_kd070wvfpa = {
> +	.timings = &startek_kd070wvfpa_mode,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.delay = {
> +		.prepare = 20,
> +		.enable = 200,
> +		.disable = 200,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};

Please fix so order of startek_kd070wvfpa is the same order in
platform_of_match.

startek_kd070wvfpa is after tsd_tst043015cmhx above, but before
tsd_tst043015cmhx below.

	Sam

> +
>  static const struct drm_display_mode tfc_s9700rtwv43tr_01b_mode = {
>  	.clock = 30000,
>  	.hdisplay = 800,
> @@ -3990,6 +4020,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "starry,kr070pe2t",
>  		.data = &starry_kr070pe2t,
> +	}, {
> +		.compatible = "startek,kd070wvfpa",
> +		.data = &startek_kd070wvfpa,
>  	}, {
>  		.compatible = "team-source-display,tst043015cmhx",
>  		.data = &tsd_tst043015cmhx,
> -- 
> 2.25.1
