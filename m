Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B371B85AA71
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 18:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CC210E268;
	Mon, 19 Feb 2024 17:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="byL8U/DS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB65310E06E;
 Mon, 19 Feb 2024 17:55:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41JFErwH029986; Mon, 19 Feb 2024 17:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=NFaur2+AKSSTaUh1jwIy7KDR536evIuZN72D5jcNy1M=; b=by
 L8U/DSsMOGfPwjBbxbdCDzh7WjecoqIUi7FZvsBkCr3O02f+lpjhcavpr6PrJQG0
 FNLY8RFZUKHk0CpoXgFOFaRkR6lk5ibQNhVYSBnQlrLStfEl5vUkjElelUqWyVnN
 JCt/sepaXlI6zuOnm7LfePCvTxZjWX3n97dCRZZW3emElnreq0EyAmcR7iXCh7CK
 6HIOmRBtREiKu/SEgABl4sp9P4xWGPIkvHwuIHYCQqjPrQoxFz2/tSJcch4VHt6z
 l59nvUyLGBW1Tay946S746Tg+diw/kIryPeZKqqfuziEEGo9JEOCW6TOaGC6sqvB
 57BujAqyQZ+Q99knjQrA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wc3t2s4s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Feb 2024 17:55:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41JHtTr7028776
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Feb 2024 17:55:29 GMT
Received: from [10.110.50.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 19 Feb
 2024 09:55:28 -0800
Message-ID: <525cfc94-146e-5389-753b-545a9fef2ef4@quicinc.com>
Date: Mon, 19 Feb 2024 09:55:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5] drm/dp: add an API to indicate if sink supports VSC SDP
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Paloma Arellano <quic_parellan@quicinc.com>, <robdclark@gmail.com>,
 <freedreno@lists.freedesktop.org>, <dmitry.baryshkov@linaro.org>,
 <intel-gfx@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <linux-kernel@vger.kernel.org>
References: <20240215191556.3227259-1-quic_abhinavk@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240215191556.3227259-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: m-8WQih43M6Ga5N_avK_itKu9UjiDU_r
X-Proofpoint-GUID: m-8WQih43M6Ga5N_avK_itKu9UjiDU_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_15,2024-02-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402190135
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

Hi DRM maintainers

Gentle ping for reviews on this one.

Since the dependent series is mostly complete, would like to get your 
reviews on this one to land it.

Thanks

Abhinav

On 2/15/2024 11:15 AM, Abhinav Kumar wrote:
> From: Paloma Arellano <quic_parellan@quicinc.com>
> 
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.
> 
> changes in v5:
> 	- rebased on top of drm-tip
> 
> changes in v4:
> 	- bail out early if dpcd rev check fails
> 
> changes in v3:
> 	- fix the commit title prefix to drm/dp
> 	- get rid of redundant !!
> 	- break out this change from series [1] to get acks from drm core
> 	  maintainers
> 
> Changes in v2:
> 	- Move VSC SDP support check API from dp_panel.c to
> 	  drm_dp_helper.c
> 
> [1]: https://patchwork.freedesktop.org/series/129180/
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 23 +++++++++++++++++++++++
>   include/drm/display/drm_dp_helper.h     |  2 ++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 8d6ce46471ae..61b11cb45245 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2913,6 +2913,29 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
>   }
>   EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>   
> +/**
> + * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
> + * @aux: DisplayPort AUX channel
> + * @dpcd: DisplayPort configuration data
> + *
> + * Returns true if vsc sdp is supported, else returns false
> + */
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	u8 rx_feature;
> +
> +	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_13)
> +		return false;
> +
> +	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
> +		drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +		return false;
> +	}
> +
> +	return (rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
> +
>   /**
>    * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>    * @dpcd: DisplayPort configuration data
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d02014a87f12..36351f3cdba9 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -100,6 +100,8 @@ struct drm_dp_vsc_sdp {
>   
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> +
>   int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
>   
>   static inline int
