Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6C780CAC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD4110E51B;
	Fri, 18 Aug 2023 13:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1DB10E519
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:41:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37IDeqWW040473;
 Fri, 18 Aug 2023 08:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1692366052;
 bh=yVtiPTv6CeRPJ4Jb/cDPAV523O0JTgtbNjA9sWskqC4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Y+13QdZM5mp9tY8rZ+zB9vaH7Wa02punkkkrjk+kxhMQ7LrkfoFOzTWEGwVsAsL5O
 aNs75QN2oWa6auHlQ5NbCtCND3pCcW4YhehUcojpTFEmQc9ilFqIDT5UuFPIisF42G
 XSmqDTt9udHZ+RBZCWPH8w4Wo6eQZWwhF4tHEkhg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37IDeq16023260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Aug 2023 08:40:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Aug 2023 08:40:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Aug 2023 08:40:51 -0500
Received: from [172.24.227.132] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37IDekNs026605;
 Fri, 18 Aug 2023 08:40:47 -0500
Message-ID: <5def6ace-ea11-8837-ca40-81ee789e9583@ti.com>
Date: Fri, 18 Aug 2023 19:10:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] drivers/tidss: Add support for AM62A7 DSS
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230818131750.4779-1-a-bhatia1@ti.com>
 <20230818131750.4779-3-a-bhatia1@ti.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20230818131750.4779-3-a-bhatia1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18-Aug-23 18:47, Aradhya Bhatia wrote:
> Add support for the DSS controller on TI's AM62A7 SoC in the tidss
> driver.
> 
> This contrller has 2 video pipelines that can render 2 video planes on
> over a screen, using the overlay managers. The output of the DSS comes
> from video port 2 (VP2) in the form of RGB88 DPI signals, while the VP1
> is tied off inside the SoC.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 53 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
>  drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 9d9dee7abaef..0e2d55d9a0d7 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -322,6 +322,54 @@ const struct dispc_features dispc_am625_feats = {
>  	.vid_order = { 1, 0 },
>  };
>  
> +const struct dispc_features dispc_am62a7_feats = {
> +	.max_pclk_khz = {
> +		[DISPC_VP_DPI] = 165000,
> +	},
> +
> +	.scaling = {
> +		.in_width_max_5tap_rgb = 1280,
> +		.in_width_max_3tap_rgb = 2560,
> +		.in_width_max_5tap_yuv = 2560,
> +		.in_width_max_3tap_yuv = 4096,
> +		.upscale_limit = 16,
> +		.downscale_limit_5tap = 4,
> +		.downscale_limit_3tap = 2,
> +		/*
> +		 * The max supported pixel inc value is 255. The value
> +		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
> +		 * The maximum bpp of all formats supported by the HW
> +		 * is 8. So the maximum supported xinc value is 32,
> +		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
> +		 */
> +		.xinc_max = 32,
> +	},
> +
> +	.subrev = DISPC_AM62A7,
> +
> +	.common = "common",
> +	.common_regs = tidss_am65x_common_regs,
> +
> +	.num_vps = 2,
> +	.vp_name = { "vp1", "vp2" },
> +	.ovr_name = { "ovr1", "ovr2" },
> +	.vpclk_name =  { "vp1", "vp2" },
> +	.vp_bus_type = { DISPC_VP_INTERNAL, DISPC_VP_DPI },
> +
> +	.vp_feat = { .color = {
> +			.has_ctm = true,
> +			.gamma_size = 256,
> +			.gamma_type = TIDSS_GAMMA_8BIT,
> +		},
> +	},
> +
> +	.num_planes = 2,
> +	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
> +	.vid_name = { "vid", "vidl1" },
> +	.vid_lite = { false, true, },
> +	.vid_order = { 1, 0 },
> +};
> +
>  static const u16 *dispc_common_regmap;
>  
>  struct dss_vp_data {
> @@ -823,6 +871,7 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
>  	switch (dispc->feat->subrev) {
>  	case DISPC_K2G:
>  		return dispc_k2g_read_and_clear_irqstatus(dispc);
> +	case DISPC_AM62A7:
>  	case DISPC_AM625:
>  	case DISPC_AM65X:
>  	case DISPC_J721E:
> @@ -839,6 +888,7 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
>  	case DISPC_K2G:
>  		dispc_k2g_set_irqenable(dispc, mask);
>  		break;
> +	case DISPC_AM62A7:
>  	case DISPC_AM625:
>  	case DISPC_AM65X:
>  	case DISPC_J721E:
> @@ -1330,6 +1380,7 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
>  		dispc_k2g_ovr_set_plane(dispc, hw_plane, hw_videoport,
>  					x, y, layer);
>  		break;
> +	case DISPC_AM62A7:
>  	case DISPC_AM625:
>  	case DISPC_AM65X:
>  		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
> @@ -2249,6 +2300,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
>  	case DISPC_K2G:
>  		dispc_k2g_plane_init(dispc);
>  		break;
> +	case DISPC_AM62A7:
>  	case DISPC_AM625:
>  	case DISPC_AM65X:
>  	case DISPC_J721E:
> @@ -2356,6 +2408,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
>  	case DISPC_K2G:
>  		dispc_k2g_vp_write_gamma_table(dispc, hw_videoport);
>  		break;
> +	case DISPC_AM62A7:
>  	case DISPC_AM625:
>  	case DISPC_AM65X:
>  		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 33ac5ad7a423..2aa1c814ea2a 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -59,6 +59,7 @@ enum dispc_vp_bus_type {
>  
>  enum dispc_dss_subrevision {
>  	DISPC_K2G,
> +	DISPC_AM62A7,
>  	DISPC_AM625,
>  	DISPC_AM65X,
>  	DISPC_J721E,
> @@ -88,6 +89,7 @@ struct dispc_features {

Made an oopsie and missed sorting 'DISPC_AM62A7' in above instances. It
should be under DISPC_AM625. Please ignore this patch / series. Will
send a v2. Apologies for the noise.

Regards
Aradhya

>  
>  extern const struct dispc_features dispc_k2g_feats;
>  extern const struct dispc_features dispc_am625_feats;
> +extern const struct dispc_features dispc_am62a7_feats;
>  extern const struct dispc_features dispc_am65x_feats;
>  extern const struct dispc_features dispc_j721e_feats;
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 4d063eb9cd0b..edf69d020544 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -231,6 +231,7 @@ static void tidss_shutdown(struct platform_device *pdev)
>  static const struct of_device_id tidss_of_table[] = {
>  	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
>  	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
> +	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
>  	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
>  	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
>  	{ }

