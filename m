Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00E678A9F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F3F10E5A2;
	Mon, 23 Jan 2023 22:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAB310E59F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:17:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id rl14so31019690ejb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WEJCKFdjYo7/IVhVCm8AADTKhVefjweLe+Hh3JRaamM=;
 b=YkZbmEjzlEHI7psm5eT7QDxkiIxJOaSaEyAhHaVyS7I6epAJygcBFyIVnz1ffgQm1R
 tyiYTJF2jTX1Ta4wzWywDPPUTCPMznDcWZizxeJ8Nur/Qjsky9kGT/EcQtsZYgPrgAJP
 Ix4kVxUSQiTu+Moot3RfEfTokcM0NtjGdNs1MVvFRZiV9DXpyjE8pob5BwcFMjzVHTH9
 EMNdMAmYaB4LtiJ+1rUGONta89eertXRKASUiXeA/JWqehSAIJnan4+a5ABSe6Pc99zT
 qCPYJ+Yf/Scm7ihMeugXcurESOGkYZ2oToTHLNyQn4Dg68BCZOV4mATB9UJerUnCoK3P
 iP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WEJCKFdjYo7/IVhVCm8AADTKhVefjweLe+Hh3JRaamM=;
 b=GvnOohi0wCpaS7IiUBiKflB9zYi1JLZ/d3pLMPNgbAmXlSrrXIKsn3WzuFcbYKf5qD
 iqHrRYyj49JiWDEGD9Tj1rtQCZ/KG2nJ25Sn+jk9U2trVennDoFenHhrzkT4Y/UyrCUL
 9Vv7WQa+jpb6IQZI9PE2jgonIxnQLd/+l9nfOY/EwCyczv7Bsoqww4M+gxY7YAU3sOZc
 +BedKIYzCewExd6tRqNmKDaPYPrxSCAO8Vme1pYFUfYdsqCbQ74AEkT08ej5SkYJC9Ey
 nPL4yltQL3nUkaQBj7TUgZa2H6F5WX6vanYjRaC/bm2yZkDB3/HHy7gE5GZz3nTlsLpq
 G02A==
X-Gm-Message-State: AFqh2kpAQ5vrexjGBUGexJR4f4O9EOaXYLiFVj+4UFv+qxtUCAev1lBZ
 PRRkpJ4zmyz7Tsfs85mMMk19Ow==
X-Google-Smtp-Source: AMrXdXtYtfXTtIAQnaUD/Ct3lTRFyOqcwB5jp+SprzQujvlZmZxPpXRR5cz2BELW/Wus++KxU7uvpg==
X-Received: by 2002:a17:907:c019:b0:867:ef3f:dd85 with SMTP id
 ss25-20020a170907c01900b00867ef3fdd85mr26873215ejc.56.1674512275078; 
 Mon, 23 Jan 2023 14:17:55 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fx2-20020a170906b74200b0084d4b907ff8sm16725ejb.120.2023.01.23.14.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 14:17:51 -0800 (PST)
Message-ID: <8ba56c15-12e5-f476-9b6b-0951531cae8c@linaro.org>
Date: Tue, 24 Jan 2023 00:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 01/14] drm/msm/dp: add dpcd read of both dsc and fec
 capability
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> FEC is pre-requirement of DSC. Therefore FEC has to be enabled
> before DSC enabled. This patch add functions to read sink's DSC
> and FEC related DPCD and decode them and set enable flags
> accordingly.

Please split this to FEC and DSC patches.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 91 ++++++++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_panel.h | 20 ++++++++-
>   2 files changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 1800d89..5078247 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -1,14 +1,18 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #include "dp_panel.h"
>   
> +#include <drm/drm_fixed.h>
>   #include <drm/drm_connector.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_print.h>
>   
> +#define DSC_TGT_BPP 8
> +
>   struct dp_panel_private {
>   	struct device *dev;
>   	struct drm_device *drm_dev;
> @@ -68,6 +72,9 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   		goto end;
>   	}
>   
> +	print_hex_dump_debug("[drm-dp] SINK DPCD: ",
> +		DUMP_PREFIX_NONE, 8, 1, dp_panel->dpcd, rlen, false);

I think this can go away.

> +
>   	link_info->revision = dpcd[DP_DPCD_REV];
>   	major = (link_info->revision >> 4) & 0x0f;
>   	minor = link_info->revision & 0x0f;
> @@ -154,6 +161,83 @@ static int dp_panel_update_modes(struct drm_connector *connector,
>   	return rc;
>   }
>   
> +static void dp_panel_decode_dsc_dpcd(struct dp_panel *dp_panel)
> +{
> +	if (dp_panel->dsc_dpcd[0]) {
> +		dp_panel->sink_dsc_caps.dsc_capable = true;
> +		dp_panel->sink_dsc_caps.version = dp_panel->dsc_dpcd[1];
> +		dp_panel->sink_dsc_caps.block_pred_en =
> +				dp_panel->dsc_dpcd[6] ? true : false;
> +		dp_panel->sink_dsc_caps.color_depth =
> +				dp_panel->dsc_dpcd[10];
> +
> +		if (dp_panel->sink_dsc_caps.version >= 0x11)
> +			dp_panel->dsc_en = true;
> +	} else {
> +		dp_panel->sink_dsc_caps.dsc_capable = false;
> +		dp_panel->dsc_en = false;
> +	}
> +}
> +
> +static void dp_panel_read_sink_dsc_caps(struct dp_panel *dp_panel)
> +{
> +	int rlen;
> +	struct dp_panel_private *panel;
> +	int dpcd_rev;
> +
> +	if (!dp_panel) {
> +		DRM_ERROR("invalid input\n");
> +		return;
> +	}
> +
> +	dpcd_rev = dp_panel->dpcd[DP_DPCD_REV];
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +	if (dpcd_rev >= 0x14) {
> +		rlen = drm_dp_dpcd_read(panel->aux, DP_DSC_SUPPORT,
> +			dp_panel->dsc_dpcd, (DP_DSC_RECEIVER_CAP_SIZE + 1));
> +		if (rlen < (DP_DSC_RECEIVER_CAP_SIZE + 1)) {
> +			drm_dbg_dp(panel->drm_dev, "dsc dpcd read failed, rlen=%d\n", rlen);
> +			return;
> +		}
> +
> +		print_hex_dump_debug("[drm-dp] SINK DSC DPCD: ",
> +			DUMP_PREFIX_NONE, 8, 1, dp_panel->dsc_dpcd, rlen, false);

Oh. An extra dump again. Can we get rid of them please? Or can we use 
the standard drm debug levels? So that it would be possible to turn them 
on and off with standard params.

> +
> +		dp_panel_decode_dsc_dpcd(dp_panel);
> +	}
> +}
> +
> +static void dp_panel_read_sink_fec_caps(struct dp_panel *dp_panel)
> +{
> +	int rlen;
> +	struct dp_panel_private *panel;
> +	s64 fec_overhead_fp = drm_fixp_from_fraction(1, 1);
> +
> +	if (!dp_panel) {
> +		DRM_ERROR("invalid input\n");
> +		return;
> +	}
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +	rlen = drm_dp_dpcd_readb(panel->aux, DP_FEC_CAPABILITY,
> +			&dp_panel->fec_dpcd);
> +	if (rlen < 1) {
> +		DRM_ERROR("fec capability read failed, rlen=%d\n", rlen);
> +		return;
> +	}
> +
> +	print_hex_dump_debug("[drm-dp] SINK FEC DPCD: ",
> +		DUMP_PREFIX_NONE, 8, 1, &dp_panel->fec_dpcd, rlen, false);
> +
> +	dp_panel->fec_en = dp_panel->fec_dpcd & DP_FEC_CAPABLE;
> +
> +	if (dp_panel->fec_en)
> +		fec_overhead_fp = drm_fixp_from_fraction(100000, 97582);
> +
> +	dp_panel->fec_overhead_fp = fec_overhead_fp;
> +}
> +
>   int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   	struct drm_connector *connector)
>   {
> @@ -224,6 +308,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   		}
>   		panel->aux_cfg_update_done = false;
>   	}
> +
> +	dp_panel_read_sink_fec_caps(dp_panel);
> +
> +	if (dp_panel->fec_en)
> +		dp_panel_read_sink_dsc_caps(dp_panel);
>   end:
>   	return rc;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index f04d021..fb30b92 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #ifndef _DP_PANEL_H_
> @@ -11,6 +12,7 @@
>   #include "dp_aux.h"
>   #include "dp_link.h"
>   #include "dp_hpd.h"
> +#include "msm_drv.h"
>   
>   struct edid;
>   
> @@ -34,12 +36,21 @@ struct dp_panel_in {
>   	struct dp_catalog *catalog;
>   };
>   
> +struct dp_dsc_caps {
> +	bool dsc_capable;
> +	u8 version;
> +	bool block_pred_en;
> +	u8 color_depth;
> +};
> +
>   struct dp_panel {
>   	/* dpcd raw data */
>   	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
>   	u8 ds_cap_info[DP_DOWNSTREAM_PORTS * DP_DOWNSTREAM_CAP_SIZE];
>   	u32 ds_port_cnt;
>   	u32 dfp_present;
> +	u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE + 1];
> +	u8 fec_dpcd;
>   
>   	struct dp_link_info link_info;
>   	struct drm_dp_desc desc;
> @@ -53,6 +64,13 @@ struct dp_panel {
>   	u32 max_dp_link_rate;
>   
>   	u32 max_bw_code;
> +
> +	struct dp_dsc_caps sink_dsc_caps;

Why do you need both decoded and raw DSC caps?

> +	bool dsc_feature_enable;
> +	bool fec_feature_enable;
> +	bool dsc_en;
> +	bool fec_en;
> +	s64 fec_overhead_fp;
>   };
>   
>   int dp_panel_init_panel_info(struct dp_panel *dp_panel);

-- 
With best wishes
Dmitry

