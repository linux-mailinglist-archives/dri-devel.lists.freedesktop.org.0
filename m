Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47456B34993
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B37E10E52B;
	Mon, 25 Aug 2025 18:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="msXfKb5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1581E10E52B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 18:01:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFrvMW024522
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 18:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=l3krV4DimGMoggozloFtQJaF
 UVxZsFMkEyNjuC+LCWY=; b=msXfKb5Tdleshl3nU4do/Q6esbnFsFVfGCgjUxrU
 P3wlW34jyxCR2N8rEmjKPh8PKNJh9hpVJJy86HB3lC6vTc1tqdmGOXSZfj5/IlBz
 JwJOh+vSIOAG+E4eHzKEl9PD2Xi95ft1y/KJhH+2QbuAkJzHLICDP2MYFCjEf87A
 bsiFXIaC2vsKQvygI8ugvqoiVuH0v01JRn4KRdqhT7iU+gTZ7HJ+EXPVlUINUUxn
 b6lOziDEEJa8e7H2yKeg11AjjaV9OEVyYqh1jzzjKP8Ja6qMROr5gwqzdsTiRtKQ
 lXaeIWUzbNlYnSNV9tD6H+lyjqw0tEAhHrMh9cOhwrwY9Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thx1kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 18:01:44 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-435de5ad4dbso1812977b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 11:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756144903; x=1756749703;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3krV4DimGMoggozloFtQJaFUVxZsFMkEyNjuC+LCWY=;
 b=BhiI6xgEofPV0sHoiCP6dcCVEQOM96CSNhe/bo77dRdxcaxkZbgpVgXt0PTL8Gz4xI
 gWhaslKpd6NK/bsCfHhv1Vh1Ukv2QOIpM/Gq0P/J4AbDHee2sJsXNK8c/3P32AsZvtc/
 Y6v64AzsSAa0XbwKFfAMFzQy/gviNW0DsK3/ACLKJlJFV8rhwQiUAgxuIf6T9DdR8jNi
 5oyLiv4/kN/Ze7rjUScxYDU0PAoUH0bJ+eVc8ZLfarwhSyv4oUeFsGHTiznJYObmbitb
 xmzFmTV/7YrAbHPc47Xyb4SeYUe651P+jhB6rNZ5Bgx5gN7dXVBZT3gXit0W0BKXTEKJ
 VpWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZA5adl5VMJ+WNtXnXrLs4AhfIuoujpqExJqWnGtihT1S6pLA50rnEQ2nT+SSvrhfkdM9zrsLtd88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0JMJ9wGikqEm2lvd32llZunK1NrEy/XZuv+oUNgVmAlyBzSfT
 CQpD8GIQZghFwvFViMHhDis7MroLaz83PkTiuephJvZZZ2CpB9+oYtp58UgBfapVOSb4up6yNIf
 2dhAXmmgy8MY37Fxa8s+c+jtc3Pgc2Bt9mkcBLLapJtwqv3oKCGusLJrE4030+ZpQIW5I6qw=
X-Gm-Gg: ASbGncth02hIgRteCDw/V7jRLOfs4u3QpPS+MuglbatV1ceaaKKBJrJ65VkeaGwIdW5
 Mx74ueM3GBvaNXij1YCZrCfTKP5FWAkh/J0jKLDtkydwxSpvojW1p2IGHHe0TljrojnBBBDIfIn
 x4QiDtLsRuk2HHBCt37oorLAUde9WFtt0yz62Q6JIyeK9sNPJijDHRopvbgpFswovFwyicMeBx/
 85zx1xnJt7wr4FN5RbDA40vAgCCK41DvrNThBYZeANebCIfzkNKCkg4EIuocwFZciJ0d/c1Riwp
 jC/8HTBWmiS+ldLe9jspj+u00NaFfEkKHLawMuR7AQ5ospEJ6A9yINNJ5rWmv2jtZK4fclYbiSx
 YtSgFS37YrKR8IWBSv7/7cylCVgYi9I+V8ASeasqxxQ0B9Cfbucja
X-Received: by 2002:a05:6808:8217:b0:437:b10d:3b41 with SMTP id
 5614622812f47-437b10d3dcamr1487498b6e.11.1756144902854; 
 Mon, 25 Aug 2025 11:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrb0jbgzeZeKKuruFAP5sOp4zpFX1eeYvmLmMkQQwupgcqsxv5D3u7TNw6ZtYwsIAtVoml9g==
X-Received: by 2002:a05:6808:8217:b0:437:b10d:3b41 with SMTP id
 5614622812f47-437b10d3dcamr1487334b6e.11.1756144900854; 
 Mon, 25 Aug 2025 11:01:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e20dad4sm16711071fa.9.2025.08.25.11.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 11:01:40 -0700 (PDT)
Date: Mon, 25 Aug 2025 21:01:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 15/38] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <vrbxqjfvg6urywwmehoykz463vphfg6c2qiryedulvlrcbvals@55lm4fmgf3in>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-15-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-15-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX2VgKT0a9kqef
 vNaPBsqZD4xuv91U7JJ8BU6vLZUtvaTJeMitE03AHMmLIo8baYBmSyJBwzWTcjNwg2It5aqrXKt
 0vJEmK1vnXMP+VkBNQqcPQu8aAW5n8kzZgPvkc+Zjd6y9i4I2GUNkXfVGDWMni/w/rUG3NQCDRW
 9BqwPwFE7KZOkYxLb4qYgaAZByx7AI5q3u6RvgvWNCTuqOcA0ASIN+5zNTjev7c/1uBRaYCxGan
 WUOd3/47kcL0fzl9VbjnLpVsMxPOfLMSHYdAJlC60eBXJD0WDOWNGloQtKFLY4vl5MDCbs+SSpq
 jGHZ1uIaiteVzk0UcZo1RLm0ta1aSDG466XGjkTxnr095CNHxpE1qOvoQ7tYkO+n02FDd2AgOBj
 FFaFu23e
X-Proofpoint-ORIG-GUID: vNOifcu996rmU70Obv_vxnfAwToLaSFi
X-Proofpoint-GUID: vNOifcu996rmU70Obv_vxnfAwToLaSFi
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68aca508 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VvG12yxvb3aggvTkYH8A:9
 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

On Mon, Aug 25, 2025 at 10:16:01PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Use the dp_panel's stream_id to adjust the offsets for stream 1
> which will be used for MST in the dp_catalog. Stream 1 share the
> same link clk with stream 0 with different reg offset. Also add

Shares what? How do we handle streams 2 and 3?

> additional register defines for stream 1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_reg.h   |  9 +++++
>  3 files changed, 79 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d4a74c6b70fb182ad8a0a786f85a0f50982d3858..b8b6a09966aed96f705bdd54cb16ea63e5f0141f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -384,6 +384,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  					    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
> +	u32 reg_offset = 0;
>  
>  	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>  
> @@ -400,7 +401,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  
>  	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
> -	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>  }
>  
>  static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> @@ -451,12 +453,16 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  					   struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 colorimetry_cfg, test_bits_depth, misc_val;
> +	u32 reg_offset = 0;
>  
>  	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
>  		msm_dp_panel->msm_dp_mode.bpp);
>  	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
>  
> -	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +
> +	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
>  
>  	/* clear bpp bits */
>  	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> @@ -466,7 +472,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
> -	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
> +	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
>  }
>  
>  static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
> @@ -2431,6 +2437,7 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>  }
>  
>  static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> +			       struct msm_dp_panel *msm_dp_panel,
>  			       u32 rate, u32 stream_rate_khz,
>  			       bool is_ycbcr_420)
>  {
> @@ -2440,6 +2447,12 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  	u32 const link_rate_hbr2 = 540000;
>  	u32 const link_rate_hbr3 = 810000;
>  	unsigned long den, num;
> +	u32 mvid_reg_off = 0, nvid_reg_off = 0;
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
> +		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
> +	}
>  
>  	if (rate == link_rate_hbr3)
>  		pixel_div = 6;
> @@ -2482,8 +2495,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  		nvid *= 3;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
> +	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
> +	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
>  }
>  
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> @@ -2559,6 +2572,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>  
>  	msm_dp_ctrl_config_msa(ctrl,
> +		msm_dp_panel,
>  		ctrl->link->link_params.rate,
>  		pixel_rate_orig,
>  		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index e8c1cf0c7dab7217b8bfe7ecd586af33d7547ca9..d1af389dffcfee2d21a616de6ee027374997aaee 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -377,27 +377,35 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
>  	u32 header[2];
>  	u32 val;
>  	int i;
> +	u32 offset = 0;
> +
> +	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
> +		offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
>  
>  	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>  
> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
> +	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
> +	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
>  
>  	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>  		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>  		       (vsc_sdp->db[i + 3] << 24));
> -		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
> +		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
>  	}
>  }
>  
>  static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
>  {
>  	u32 hw_revision = panel->msm_dp_panel.hw_revision;
> +	u32 offset = 0;
> +
> +	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
> +		offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
>  
>  	if (hw_revision >= DP_HW_VERSION_1_0 &&
>  	    hw_revision < DP_HW_VERSION_1_2) {
> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, UPDATE_SDP);
> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, 0x0);
> +		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
> +		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
>  	}
>  }
>  
> @@ -406,16 +414,25 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>  	struct msm_dp_panel_private *panel =
>  		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  	u32 cfg, cfg2, misc;
> +	u32 misc_reg_offset = 0;
> +	u32 sdp_cfg_offset = 0;
> +	u32 sdp_cfg2_offset = 0;
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
> +	}
>  
> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
> +	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
> +	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> +	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>  
>  	cfg |= GEN0_SDP_EN;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>  
>  	cfg2 |= GENERIC0_SDPSIZE_VALID;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>  
>  	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
>  
> @@ -425,7 +442,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>  	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
>  
>  	pr_debug("misc settings = 0x%x\n", misc);
> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
> +	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>  
>  	msm_dp_panel_update_sdp(panel);
>  }
> @@ -435,16 +452,25 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>  	struct msm_dp_panel_private *panel =
>  		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  	u32 cfg, cfg2, misc;
> +	u32 misc_reg_offset = 0;
> +	u32 sdp_cfg_offset = 0;
> +	u32 sdp_cfg2_offset = 0;
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
> +	}
>  
> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
> +	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
> +	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> +	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>  
>  	cfg &= ~GEN0_SDP_EN;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>  
>  	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>  
>  	/* switch back to MSA */
>  	misc &= ~DP_MISC1_VSC_SDP;
> @@ -452,7 +478,7 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>  	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
>  
>  	pr_debug("misc settings = 0x%x\n", misc);
> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
> +	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>  
>  	msm_dp_panel_update_sdp(panel);
>  }
> @@ -510,6 +536,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  	u32 msm_dp_active;
>  	u32 total;
>  	u32 reg;
> +	u32 offset = 0;
>  
>  	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
> @@ -524,6 +551,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  		drm_mode->vsync_start - drm_mode->vdisplay,
>  		drm_mode->vsync_end - drm_mode->vsync_start);
>  
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
> +
>  	total_hor = drm_mode->htotal;
>  
>  	total_ver = drm_mode->vtotal;
> @@ -554,10 +584,10 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  
>  	msm_dp_active = data;
>  
> -	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER, total);
> -	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
> -	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
> -	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
> +	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
> +	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
> +	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
> +	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
>  
>  	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
>  	if (wide_bus_en)
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index b851efc132ea03884ce2563990fbc24c9577e724..43a9ce0539906e1f185abf250fdf161e462d9645 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -141,6 +141,7 @@
>  #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
>  
>  #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
> +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
>  #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
>  #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
>  #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
> @@ -159,11 +160,15 @@
>  #define REG_DP_SOFTWARE_MVID			(0x00000010)
>  #define REG_DP_SOFTWARE_NVID			(0x00000018)
>  #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
> +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
> +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
> +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
>  #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
>  #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
>  #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
>  
>  #define REG_DP_MISC1_MISC0			(0x0000002C)
> +#define REG_DP1_MISC1_MISC0			(0x0000042C)
>  #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>  #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
> @@ -230,8 +235,10 @@
>  #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
>  
>  #define MMSS_DP_SDP_CFG				(0x00000228)
> +#define MMSS_DP1_SDP_CFG			(0x000004E0)
>  #define GEN0_SDP_EN				(0x00020000)
>  #define MMSS_DP_SDP_CFG2			(0x0000022C)
> +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
>  #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>  #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
>  #define GENERIC0_SDPSIZE_VALID			(0x00010000)
> @@ -240,6 +247,7 @@
>  #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
>  
>  #define MMSS_DP_SDP_CFG3			(0x0000024c)
> +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
>  #define UPDATE_SDP				(0x00000001)
>  
>  #define MMSS_DP_EXTENSION_0			(0x00000250)
> @@ -288,6 +296,7 @@
>  #define MMSS_DP_GENERIC1_7			(0x00000344)
>  #define MMSS_DP_GENERIC1_8			(0x00000348)
>  #define MMSS_DP_GENERIC1_9			(0x0000034C)
> +#define MMSS_DP1_GENERIC0_0			(0x00000490)
>  
>  #define MMSS_DP_VSCEXT_0			(0x000002D0)
>  #define MMSS_DP_VSCEXT_1			(0x000002D4)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
