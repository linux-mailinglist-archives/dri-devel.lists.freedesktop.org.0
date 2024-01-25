Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0865383CEDD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C200010E46F;
	Thu, 25 Jan 2024 21:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC9610E46E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:49:11 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-510221ab3ebso803207e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706219289; x=1706824089; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QTpw7P7AMy43afMGdLyQLOOGeTEVvo3DKM/GhoJqPaI=;
 b=fjFxoDDnk7vSsNF5ayiS11mhDT+98mKbmF0Tqjf2yoy2x6nkeO9SG00naeo51v77lr
 VJoJJ0CLb2o/6LjnlXzyRnNskIXFSb8ZDGoZNH/TRV21HylYi5BHOCG9qT6ufWAoRr78
 vg27PsXC3BxbkMOtSo3sRG1zFhuzBKWS8QCMORo/BXx4wFUW1I6gGHiSFtX1rocnQI06
 WnGFi0Qurk22Z4/6fQQcoNmHcx/4hhJd5x9tRbjS+UF+whNoaYsU12UUcVsm2rJB9VAd
 Fdy/YUGklxUvyjGLrBkqifE3o14sgSaVSdiRyCCUKDrcom1zml0FQN96IVnsdGGHsME9
 vUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706219289; x=1706824089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QTpw7P7AMy43afMGdLyQLOOGeTEVvo3DKM/GhoJqPaI=;
 b=SWjYvFxlzed1uH4uwU7FU/RZJYLssTd1W8Nyg0qPD3qtuGSEMyCZh/cFo1kDRZykwd
 VYCNRtlkS+zBYMTyuFaXjMbcsjc5ub9T32KnouJQf2nAixONIOynv9yNTXeLsjYcl7wx
 i8wWf7Trxgm7boWlii1cHyy0dJ5cPuABgmHZzjZPcqze4HdEJCZ87VNlybRyhTsM3bne
 KGcad3SfPJcD0uPsoYJZJwSosJnee9aE9h1fGRWLwTL0IS1kXGbmsqbCUcx3amXKO/UJ
 8xkBCDrHvLO0rbnNXRsGpnoGZ4kO4AtV6QnMU/uytWHyvzKPEJrRqojoURttJllOV6T4
 rKlg==
X-Gm-Message-State: AOJu0YxjkPqPOXtGYYxTDBl2DtX3fNrmudqYJzJXPtuEOvtxWEsYz6nu
 Y5xF7XH20mi+a6LfJT2TlV5dKvK3JDpCal13/6ywwQrCDTauoQnPALbSHJDSP7U=
X-Google-Smtp-Source: AGHT+IG4oov4hE7wkIWwfmOSomgqSsX0EdqgYTWYXCJr5R6CNvYXLcC6BOpTNVqSf4Grfs25Zhf3FA==
X-Received: by 2002:ac2:4ac2:0:b0:50e:3d69:69a7 with SMTP id
 m2-20020ac24ac2000000b0050e3d6969a7mr244455lfp.42.1706219289474; 
 Thu, 25 Jan 2024 13:48:09 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05651232cc00b0050f0dce126bsm2942118lfg.214.2024.01.25.13.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:48:08 -0800 (PST)
Message-ID: <d94434ec-00fd-489f-98f2-8c811522ff82@linaro.org>
Date: Thu, 25 Jan 2024 23:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm/dp: add VSC SDP support for YUV420 over DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-12-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-12-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> Add support to pack and send the VSC SDP packet for DP. This therefore
> allows the transmision of format information to the sinks which is
> needed for YUV420 support over DP.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 147 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
>   drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++
>   drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>   5 files changed, 205 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index c025786170ba5..7e4c68be23e56 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -29,6 +29,9 @@
>   
>   #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>   
> +#define DP_GENERIC0_6_YUV_8_BPC		BIT(0)
> +#define DP_GENERIC0_6_YUV_10_BPC	BIT(1)
> +
>   #define DP_INTERRUPT_STATUS1 \
>   	(DP_INTR_AUX_XFER_DONE| \
>   	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
> @@ -907,6 +910,150 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>   	return 0;
>   }
>   
> +static void dp_catalog_panel_setup_vsc_sdp(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog;
> +	u32 header, parity, data;
> +	u8 bpc, off = 0;
> +	u8 buf[SZ_128];
> +
> +	if (!dp_catalog) {
> +		pr_err("invalid input\n");
> +		return;
> +	}
> +
> +	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +	/* HEADER BYTE 1 */
> +	header = dp_catalog->sdp.sdp_header.HB1;
> +	parity = dp_catalog_calculate_parity(header);
> +	data   = ((header << HEADER_BYTE_1_BIT) | (parity << PARITY_BYTE_1_BIT));
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_0, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	/* HEADER BYTE 2 */
> +	header = dp_catalog->sdp.sdp_header.HB2;
> +	parity = dp_catalog_calculate_parity(header);
> +	data   = ((header << HEADER_BYTE_2_BIT) | (parity << PARITY_BYTE_2_BIT));
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> +
> +	/* HEADER BYTE 3 */
> +	header = dp_catalog->sdp.sdp_header.HB3;
> +	parity = dp_catalog_calculate_parity(header);
> +	data   = ((header << HEADER_BYTE_3_BIT) | (parity << PARITY_BYTE_3_BIT));
> +	data |= dp_read_link(catalog, MMSS_DP_GENERIC0_1);
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);

This seems to be common with the dp_audio code. Please extract this 
header writing too.

> +
> +	data = 0;
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_2, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);

Generally this is not how these functions are expected to be written. 
Please take a look at drivers/video/hdmi.c. It should be split into:
- generic function that packs the C structure into a flat byte buffer,
- driver-specific function that formats and writes the buffer to the 
hardware.

> +	dp_write_link(catalog, MMSS_DP_GENERIC0_3, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_4, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_5, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	switch (dp_catalog->vsc_sdp_data.bpc) {
> +	case 10:
> +		bpc = DP_GENERIC0_6_YUV_10_BPC;
> +		break;
> +	case 8:
> +	default:
> +		bpc = DP_GENERIC0_6_YUV_8_BPC;
> +		break;
> +	}
> +
> +	/* VSC SDP payload as per table 2-117 of DP 1.4 specification */
> +	data = (dp_catalog->vsc_sdp_data.colorimetry & 0xF) |
> +	       ((dp_catalog->vsc_sdp_data.pixelformat & 0xF) << 4) |
> +	       (bpc << 8) |
> +	       ((dp_catalog->vsc_sdp_data.dynamic_range & 0x1) << 15) |
> +	       ((dp_catalog->vsc_sdp_data.content_type & 0x7) << 16);
> +
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_6, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	data = 0;
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_7, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_8, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	dp_write_link(catalog, MMSS_DP_GENERIC0_9, data);
> +	memcpy(buf + off, &data, sizeof(data));
> +	off += sizeof(data);
> +
> +	print_hex_dump(KERN_DEBUG, "[drm-dp] VSC: ", DUMP_PREFIX_NONE, 16, 4, buf, off, false);
> +}
> +
> +void dp_catalog_panel_config_vsc_sdp(struct dp_catalog *dp_catalog, bool en)
> +{
> +	struct dp_catalog_private *catalog;
> +	u32 cfg, cfg2, misc;
> +	u16 major = 0, minor = 0;
> +
> +	if (!dp_catalog) {
> +		pr_err("invalid input\n");
> +		return;
> +	}
> +
> +	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +	cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> +	cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> +	misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> +
> +	if (en) {
> +		cfg |= GEN0_SDP_EN;
> +		dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> +
> +		cfg2 |= GENERIC0_SDPSIZE;

When I see a something_SIZE macro, I'd naturally expect it to be an 
actual size of some data. Please consider renaming to e.g. 
GENERIC0_SDPSIZE_VALID.

> +		dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> +
> +		dp_catalog_panel_setup_vsc_sdp(dp_catalog);
> +
> +		/* indicates presence of VSC (BIT(6) of MISC1) */
> +		misc |= DP_MISC1_VSC_SDP;
> +
> +		drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=%d\n", en);
> +	} else {
> +		cfg &= ~GEN0_SDP_EN;
> +		dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> +
> +		cfg2 &= ~GENERIC0_SDPSIZE;
> +		dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> +
> +		/* switch back to MSA */
> +		misc &= ~DP_MISC1_VSC_SDP;
> +
> +		drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=%d\n", en);
> +	}
> +
> +	pr_debug("misc settings = 0x%x\n", misc);
> +	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> +
> +	dp_catalog_hw_revision(dp_catalog, &major, &minor);
> +	if (major == 1 && minor < 2) {
> +		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
> +		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
> +	}
> +}
> +
>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>   				struct drm_display_mode *drm_mode)
>   {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 94c377ef90c35..6b757249c0698 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -7,6 +7,7 @@
>   #define _DP_CATALOG_H_
>   
>   #include <drm/drm_modes.h>
> +#include <drm/display/drm_dp_helper.h>
>   
>   #include "dp_parser.h"
>   #include "disp/msm_disp_snapshot.h"
> @@ -76,6 +77,8 @@ struct dp_catalog {
>   	u32 dp_active;
>   	enum dp_catalog_audio_sdp_type sdp_type;
>   	enum dp_catalog_audio_header_type sdp_header;
> +	struct dp_sdp sdp;

I assume that the sdp field contains only transient data, which is not 
used after it gets written to the hardware. Please remove it from the 
struct allocate on a stack or via kzalloc.

> +	struct drm_dp_vsc_sdp vsc_sdp_data;
>   	u32 audio_data;
>   	bool wide_bus_en;
>   };
> @@ -196,6 +199,7 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
>   
>   /* DP Panel APIs */
>   int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
> +void dp_catalog_panel_config_vsc_sdp(struct dp_catalog *dp_catalog, bool en);
>   void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>   				struct drm_display_mode *drm_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 209cf2a35642f..ddd92a63d5a67 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1952,6 +1952,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   	dp_io = &ctrl->parser->io;
>   	phy = dp_io->phy;
>   
> +	dp_catalog_panel_config_vsc_sdp(ctrl->catalog, false);
> +
>   	/* set dongle to D3 (power off) mode */
>   	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>   
> @@ -2026,6 +2028,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   	dp_io = &ctrl->parser->io;
>   	phy = dp_io->phy;
>   
> +	dp_catalog_panel_config_vsc_sdp(ctrl->catalog, false);
> +
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
>   	dp_catalog_ctrl_reset(ctrl->catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index af7820b6d35ec..d6af9898b00d8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -307,6 +307,49 @@ bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
>   	return panel->major >= 1 && panel->minor >= 3 && panel->vsc_supported;
>   }
>   
> +static int dp_panel_setup_vsc_sdp(struct dp_panel *dp_panel)
> +{
> +	struct dp_catalog *catalog;
> +	struct dp_panel_private *panel;
> +	struct dp_display_mode *dp_mode;
> +	int rc = 0;
> +
> +	if (!dp_panel) {
> +		pr_err("invalid input\n");
> +		rc = -EINVAL;
> +		return rc;
> +	}
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +	catalog = panel->catalog;
> +	dp_mode = &dp_panel->dp_mode;
> +
> +	memset(&catalog->sdp, 0, sizeof(catalog->sdp));
> +	memset(&catalog->vsc_sdp_data, 0, sizeof(catalog->vsc_sdp_data));
> +
> +	/* VSC SDP header as per table 2-118 of DP 1.4 specification */
> +	catalog->sdp.sdp_header.HB0 = 0x00;
> +	catalog->sdp.sdp_header.HB1 = 0x07;
> +	catalog->sdp.sdp_header.HB2 = 0x05;
> +	catalog->sdp.sdp_header.HB3 = 0x13;
> +
> +	/* VSC SDP Payload for DB16 */
> +	catalog->vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> +	catalog->vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> +
> +	/* VSC SDP Payload for DB17 */
> +	catalog->vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> +
> +	/* VSC SDP Payload for DB18 */
> +	catalog->vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> +
> +	catalog->vsc_sdp_data.bpc = dp_mode->bpp / 3;
> +
> +	dp_catalog_panel_config_vsc_sdp(catalog, true);
> +
> +	return rc;
> +}
> +
>   void dp_panel_dump_regs(struct dp_panel *dp_panel)
>   {
>   	struct dp_catalog *catalog;
> @@ -370,6 +413,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>   	catalog->dp_active = data;
>   
>   	dp_catalog_panel_timing_cfg(catalog);
> +
> +	if (dp_panel->dp_mode.out_fmt_is_yuv_420)
> +		dp_panel_setup_vsc_sdp(dp_panel);
> +
>   	panel->panel_on = true;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index ea85a691e72b5..756ddf85b1e81 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -142,6 +142,7 @@
>   #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>   #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>   #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
> +#define DP_MISC1_VSC_SDP			(0x00004000)
>   
>   #define REG_DP_VALID_BOUNDARY			(0x00000030)
>   #define REG_DP_VALID_BOUNDARY_2			(0x00000034)
> @@ -201,9 +202,11 @@
>   #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
>   
>   #define MMSS_DP_SDP_CFG				(0x00000228)
> +#define GEN0_SDP_EN				(0x00020000)
>   #define MMSS_DP_SDP_CFG2			(0x0000022C)
>   #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>   #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
> +#define GENERIC0_SDPSIZE			(0x00010000)
>   
>   #define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
>   #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)

-- 
With best wishes
Dmitry

