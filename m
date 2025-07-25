Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EEB120C3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186DB10E9E5;
	Fri, 25 Jul 2025 15:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATzB3/mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE4810E9F0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:23:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PAXrJr001048
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eTjMO6ThCzwsibq1lFHZiZoZ
 coN7Cs449c4GQQHgyao=; b=ATzB3/mcmVV/zkia8P/vSXPv93q3nC5wTBFv+1r/
 5uWPW6GrxvL87y7HUByOa2Ttbk4hL7YBaSfy+DxR6b6lUfj0hX5m1kZvmc5AvxO0
 AMpk2yriLI+GTqVwMWwKvaLrL9SlYgnNF8fnqP85/fwYXqQM2c9y+m0xSD27g1mf
 qn4ZuW6BvJd25PDtjqTvkXpYWx1twdBna5bVHpx/j7zs+shz3AksF8RMdWsOFnFS
 YA5sstgBn4/XGQR4x7ZwuLRDg/bKcxtdrpcybdIgzboAZ3w17aki59yy5mP/qni2
 EalIrVPMU2SqA1ni43Fo7HJRtYrOo/20XSu3gg/hmb1jNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4848970sp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:23:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab81d016c1so35343961cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 08:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753456981; x=1754061781;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTjMO6ThCzwsibq1lFHZiZoZcoN7Cs449c4GQQHgyao=;
 b=RmASh2E+SQPMLWSswCbU4iksfRiiRcXysCaB5eFIeN4ll7MhYL13n3zXPhnzUfC0Bz
 IR3/A+HTJ01s0sCyXvYMtPXNtCDG8z5ft/IVF0XJvdPuH7Nv2KU6LTuMeVS5rsUPHzBp
 uAh5wgLLe9JuGvqzVwL8HGqs0Syftp3TdW2Daz4PH4z0GgdaFaNpKTJI7CDPpuniXxQM
 WYVAGexFoqqf96Bh2tJvn6ZO6T1maBBRGBw12TZd1EOLkhcQpXJcK2nk3R30KJyiez+U
 Efo6n1FkgoGMGPhxnaoOnX7SoFwTg8592H8dNDS7U0tT3O/4u+5UaWCUHV3cdZp3zCIL
 RTbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq6FVyCmlUmoElKUvsRIIy1sVu6jc2MJ9UTJnhz2/9cYe+/2LpTjesTYtQQC7/XqFZyUdBEl4LUi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOPhUXxCLaAIq9kNPQAnlD6Blr1zvb6PxJVZMs2IkaO46fnKA0
 VZpoq9cxN7aKDoG1yBuZEbKN4fZCW7cQWKJOhWyR5VmXVuu3kSFYBv5mYiqQ5QD/uRAmI9g2DEY
 yHFURD11H7r3vbvLDTizjR4P0GFykibqlqvftP3RkjGM81d9H2fIOLVnBLD9JMD1TAsybuI4=
X-Gm-Gg: ASbGncuZdMtwxBKdrefyGYxoKvhE2BRYMnYYetdBMUcvkAB5bDr4kjNR5FOrirj3QRc
 tuvOHjOUqyd4f/Mqt7OUCMNFTiQKzoWh3sIxiLm3zAY9zOq9PpDzk5SyMlqcH4kcLHFDusTWTNB
 f3bmx4ipJTSvW/cSW+Cyt0iDDsmIDv9+gZVH+KnO8D1plPCTe8K9au/j8PF4yePxd6fQxkDzgMZ
 fAFK3QIyxBdk5cIsOLkyYq2esjPPy+GDFZnIycjI8Hbz9tKWZ6PdB/ZM7U75wrZNU62vHxbVkMb
 EerO8BcD4xCBIOVRXyCtodDzZCZCW/ZotxuAtQBmlJY6CTdBEyNkZE+LpBxzB1Vpng9GZsq1rr0
 UUrGjhu2rMGuNIupXxPU6FOU7nCWiBHVM+ZSbLq+bF1i2kPp3sCRn
X-Received: by 2002:a05:6214:1cc9:b0:705:538:65ab with SMTP id
 6a1803df08f44-707205ea86cmr34752196d6.39.1753456980768; 
 Fri, 25 Jul 2025 08:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5LDQ3JiR87dSBEdbMLaQa7N1rf2mWwVfPEnOCbZ2F/UBqPcJrWvG8vZus18ZIxSK6RRVlQ==
X-Received: by 2002:a05:6214:1cc9:b0:705:538:65ab with SMTP id
 6a1803df08f44-707205ea86cmr34751036d6.39.1753456979758; 
 Fri, 25 Jul 2025 08:22:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6336355dsm8672e87.86.2025.07.25.08.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:22:57 -0700 (PDT)
Date: Fri, 25 Jul 2025 18:22:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 02/10] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <svn2p46qguxrpn6fhqnjffqpgv7keabwgld53uw6ckkn4piu47@gedy4t22cqfx>
References: <20250716100440.816351-1-andyshrk@163.com>
 <20250716100440.816351-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716100440.816351-3-andyshrk@163.com>
X-Proofpoint-GUID: ZoBpgribUiLYIZxlYLSDKX1Xq18zvogC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzMiBTYWx0ZWRfX+xr/fyfXdZ5c
 +qqOPmHbk/dPtaMFVICGhWAAWx4r+FcoyIZXBnqKIUXrny9i39JXuwuhlr0Ik4B2riFC1yjkv1p
 DgcKxjL7PrZQqlYX/83d/TzkfIL/+/fUVi4FkWRIc8OeFWepAOvfXpI7vc0jWw2FV7Qgu/AGGrN
 UtqfLyMzBDQZuiBlYizIZzqokMYwqi092aW4vHEuuInH96HP25TZXqz+dB94XloECsZKBzO3TCl
 K1vqxHoMitUztA5cCRd/7Ory5UZ+abQzVJ46DkgR8rGPMrsCL/G7yvSs4jcNPXsYV87lFZqZk5U
 lDNZvNHheUqh0DoQxvZLa2Tta2anAHITRT3ES/dVGzP/iiRWU6CSkUqo8kNXg8nsplPxAn+u94o
 X735HINYNNuOUeAiSotNutC6m2CPInQEi+IYt1TjalE5FCLYXXxX6ZcTlOt0HcpfkCLFncOF
X-Authority-Analysis: v=2.4 cv=VJjdn8PX c=1 sm=1 tr=0 ts=6883a156 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=w3-XvOWwJNVOjCSRI-QA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: ZoBpgribUiLYIZxlYLSDKX1Xq18zvogC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250132
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

On Wed, Jul 16, 2025 at 06:04:29PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DW DP TX Controller is compliant with the DisplayPort Specification
> Version 1.4 with the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> Add library with common helpers to make it can be shared with
> other SoC.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v5:
> - Use drm_dp_read_sink_count_cap instead of the private implementation.
> 
> Changes in v4:
> - Drop unnecessary header files
> - Switch to devm_drm_bridge_alloc
> 
> Changes in v3:
> - Rebase on drm-misc-next
> - Switch to common helpers to power up/down dp link
> - Only pass parameters to phy that should be set
> 
> Changes in v2:
> - Fix compile error when build as module
> - Add phy init
> - Only use one dw_dp_link_train_set
> - inline dw_dp_phy_update_vs_emph
> - Use dp_sdp
> - Check return value of drm_modeset_lock
> - Merge code in atomic_pre_enable/mode_fixup to atomic_check
> - Return NULL if can't find a supported output format
> - Fix max_link_rate from plat_data
> 
>  drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
>  drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2044 ++++++++++++++++++++++
>  include/drm/bridge/dw_dp.h               |   20 +
>  4 files changed, 2072 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
>  create mode 100644 include/drm/bridge/dw_dp.h
> +
> +static int dw_dp_link_parse(struct dw_dp *dp, struct drm_connector *connector)
> +{
> +	struct dw_dp_link *link = &dp->link;
> +	u8 dpcd;
> +	int ret;
> +
> +	dw_dp_link_reset(link);
> +
> +	ret = drm_dp_read_dpcd_caps(&dp->aux, link->dpcd);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_dp_read_desc(&dp->aux, &link->desc, drm_dp_is_branch(link->dpcd));
> +
> +	if (drm_dp_read_sink_count_cap(connector, link->dpcd, &link->desc)) {
> +		ret = drm_dp_read_sink_count(&dp->aux);
> +		if (ret < 0)
> +			return ret;
> +
> +		link->sink_count = ret;
> +
> +		/* Dongle connected, but no display */
> +		if (!link->sink_count)
> +			return -ENODEV;
> +	}
> +
> +	ret = drm_dp_dpcd_readb(&dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &dpcd);
> +	if (ret < 0)
> +		return ret;
> +
> +	link->vsc_sdp_supported = !!(dpcd & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);


drm_dp_vsc_sdp_supported()

> +
> +	link->revision = link->dpcd[DP_DPCD_REV];
> +	link->rate = min_t(u32, min(dp->plat_data.max_link_rate,
> +				    dp->phy->attrs.max_link_rate * 100),
> +			   drm_dp_max_link_rate(link->dpcd));
> +	link->lanes = min_t(u8, phy_get_bus_width(dp->phy),
> +			    drm_dp_max_lane_count(link->dpcd));
> +
> +	link->caps.enhanced_framing = drm_dp_enhanced_frame_cap(link->dpcd);
> +	link->caps.tps3_supported = drm_dp_tps3_supported(link->dpcd);
> +	link->caps.tps4_supported = drm_dp_tps4_supported(link->dpcd);
> +	link->caps.fast_training = drm_dp_fast_training_cap(link->dpcd);
> +	link->caps.channel_coding = drm_dp_channel_coding_supported(link->dpcd);
> +	link->caps.ssc = !!(link->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
