Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F9A021D0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE59610E5E9;
	Mon,  6 Jan 2025 09:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qGwX9MaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCBA10E5E9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 09:28:50 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 203662A5;
 Mon,  6 Jan 2025 10:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736155678;
 bh=pFiiEIEBLnz/j8YfwMmRhAD4EGgidCXDYj5puigczcs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qGwX9MaQb+7aw3qqQslHHi8trSxqjswbpToLrNk8izPhnz7Ei8W1QTwPpx4iHXD8N
 jpaWidiBL6A2zATDfmu8VyDgAvBcJ+EkEsQiGD8VVXs7pgvKH2hMrGcNWkWfWvJmY5
 tTKbPyVLL3gaoEw1zUGdqk8IuWD73Tqi4sjKA428=
Message-ID: <4a85d26f-19de-4846-998f-c35547e9a7f2@ideasonboard.com>
Date: Mon, 6 Jan 2025 11:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tidss: Add support for AM62L display subsystem
To: Devarsh Thakkar <devarsht@ti.com>
Cc: praneeth@ti.com, vigneshr@ti.com, aradhya.bhatia@linux.dev,
 s-jain1@ti.com, r-donadkar@ti.com, j-choudhary@ti.com, h-shenoy@ti.com,
 jyri.sarha@iki.fi, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20241231090432.3649158-1-devarsht@ti.com>
 <20241231090432.3649158-3-devarsht@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241231090432.3649158-3-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 31/12/2024 11:04, Devarsh Thakkar wrote:
> Enable display for AM62L DSS [1] which supports only a single display
> pipeline using a single overlay manager, single video port and a single
> video lite pipeline which does not support scaling.
> 
> The output of video port is routed to SoC boundary via DPI interface and
> the DPI signals from the video port are also routed to DSI Tx controller
> present within the SoC.
> 
> [1]: Section 11.7 (Display Subsystem and Peripherals)
> Link : https://www.ti.com/lit/pdf/sprujb4
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 34 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
>   drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
>   3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index cacb5f3d8085..cd322d60b825 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -376,6 +376,35 @@ const struct dispc_features dispc_am62a7_feats = {
>   	.vid_order = { 1, 0 },
>   };
>   
> +const struct dispc_features dispc_am62l_feats = {
> +	.max_pclk_khz = {
> +		[DISPC_VP_DPI] = 165000,
> +	},
> +
> +	.subrev = DISPC_AM62L,
> +
> +	.common = "common",
> +	.common_regs = tidss_am65x_common_regs,
> +
> +	.num_vps = 1,
> +	.vp_name = { "vp1" },
> +	.ovr_name = { "ovr1" },
> +	.vpclk_name =  { "vp1" },
> +	.vp_bus_type = { DISPC_VP_DPI },
> +
> +	.vp_feat = { .color = {
> +			.has_ctm = true,
> +			.gamma_size = 256,
> +			.gamma_type = TIDSS_GAMMA_8BIT,
> +		},
> +	},
> +
> +	.num_planes = 1,
> +	.vid_name = { "vidl1" },
> +	.vid_lite = { true },
> +	.vid_order = { 0 },
> +};
> +
>   static const u16 *dispc_common_regmap;
>   
>   struct dss_vp_data {
> @@ -879,6 +908,7 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
>   		return dispc_k2g_read_and_clear_irqstatus(dispc);
>   	case DISPC_AM625:
>   	case DISPC_AM62A7:
> +	case DISPC_AM62L:
>   	case DISPC_AM65X:
>   	case DISPC_J721E:

Not related to this patch, but these lists are getting a bit silly... We 
probably should handle them in a more centralized way. Maybe with the 
dispc_features.

  Tomi

>   		return dispc_k3_read_and_clear_irqstatus(dispc);
> @@ -896,6 +926,7 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
>   		break;
>   	case DISPC_AM625:
>   	case DISPC_AM62A7:
> +	case DISPC_AM62L:
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
>   		dispc_k3_set_irqenable(dispc, mask);
> @@ -1388,6 +1419,7 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
>   		break;
>   	case DISPC_AM625:
>   	case DISPC_AM62A7:
> +	case DISPC_AM62L:
>   	case DISPC_AM65X:
>   		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
>   					  x, y, layer);
> @@ -2308,6 +2340,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
>   		break;
>   	case DISPC_AM625:
>   	case DISPC_AM62A7:
> +	case DISPC_AM62L:
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
>   		dispc_k3_plane_init(dispc);
> @@ -2416,6 +2449,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
>   		break;
>   	case DISPC_AM625:
>   	case DISPC_AM62A7:
> +	case DISPC_AM62L:
>   	case DISPC_AM65X:
>   		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
>   		break;
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 086327d51a90..275de8d02b75 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -62,6 +62,7 @@ enum dispc_dss_subrevision {
>   	DISPC_K2G,
>   	DISPC_AM625,
>   	DISPC_AM62A7,
> +	DISPC_AM62L,
>   	DISPC_AM65X,
>   	DISPC_J721E,
>   };
> @@ -91,6 +92,7 @@ struct dispc_features {
>   extern const struct dispc_features dispc_k2g_feats;
>   extern const struct dispc_features dispc_am625_feats;
>   extern const struct dispc_features dispc_am62a7_feats;
> +extern const struct dispc_features dispc_am62l_feats;
>   extern const struct dispc_features dispc_am65x_feats;
>   extern const struct dispc_features dispc_j721e_feats;
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index d4652e8cc28c..f2a4f659f574 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -242,6 +242,7 @@ static const struct of_device_id tidss_of_table[] = {
>   	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
>   	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
>   	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
> +	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
>   	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
>   	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
>   	{ }

