Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313EA9B686
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 20:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C8010E1A6;
	Thu, 24 Apr 2025 18:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Xh3vreAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137A10E052;
 Thu, 24 Apr 2025 18:39:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3E4U006854;
 Thu, 24 Apr 2025 18:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mxLBzeuWZhCXuUx7GN5HKoSEL571jl+7JkCTFc6StIA=; b=Xh3vreAPaUyvNZNm
 3qdGUOGBr7fLqp6fLkCTmjTYnmYS7D7wQ86MCIGmCU2FGk2wVnHsafJ7eo3ZK1QS
 3SS2VW7utVePQW1wFjDPN3brPfeDbeF46ZtndsLWGI2zpJ4vpvk7eX+sZgD5WNXw
 nYIjaVWP/x8eYExQ9btoegWcLzX6tZCom6LnsCAtwwcUgvMQkugzNuI+wcl8mv5C
 iuHI+dA9xnHczRRIWZBe49570a5McLa4uCQb0dySckrfgBvx52NKCXEVVPKoCs7h
 HNF0jgBe6r3TGUwkF1J1Rh4qYvCkZN0hJZQH9WqYJncoJs/E6q0fTizkr+hwlza1
 XjB8OA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5ekux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 18:39:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OIdB0E031348
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 18:39:11 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 11:39:10 -0700
Message-ID: <0e452bde-6182-4779-8ad1-5019703da092@quicinc.com>
Date: Thu, 24 Apr 2025 11:39:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] drm/msm/hdmi: convert clock and regulator arrays
 to const arrays
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-3-6224568ed87f@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-3-6224568ed87f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEyOSBTYWx0ZWRfXyrfj85aWAIbS
 Z3qfYoj+bJwXrAAINp1TJctRpMvjV2H8swyfrM7u34OBdYNguco4+COFKbNLsHll63FpqM1z5gN
 7T1iGPrAXCfKn6Ah9Ii8K7KIXizKSRgfurKr4ZNKByfDDF/VSkkZpnLPqR6s1v4rHmxbzvntPos
 HxhF+ia3fDYa0jGo/VeyyEb9bN+9beq6/pl5xQkRoq3yOWUrERpfrzOmIKQa1rCEuPeXcES7sTS
 Wj7rOJe8Wt4XekdkkeVyVi569KlnLvsMYz2tfgyRbLH8obMa8pdMqRha6uMbFgmqVZAYx4TF2Jz
 Q5OC5RCHDbKkLbiLm9Vo6KKetn4JkDPXDlYb187Ipf5cIzt0XwlYEonun/yteJpf6ZfxIcE1uFw
 MsHppActh8bh8z+DUVuq4pAcuJxeCeKTkAvIk7m4F2A/OoOZBLV6I1IQ1bMK9soh8v8/SvJT
X-Proofpoint-GUID: dHfsF6sTGtwWynzqtgjuASI4y4rUNOyY
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a8550 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=LHP2PRoX459aX8Xl4qEA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dHfsF6sTGtwWynzqtgjuASI4y4rUNOyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240129
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


On 2/8/2025 9:04 PM, Dmitry Baryshkov wrote:
> As a preparation to the next patches convert 'static const char *'
> arrays to 'static const char * const', as required by the checkpatch.pl
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>


> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 10 +++++-----
>   drivers/gpu/drm/msm/hdmi/hdmi.h |  8 ++++----
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 248541ff449204c72cd444458dadb9ae4a0a53d1..9e9900882687fa2ae4a734d5cf10b5bae5af2f87 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -224,17 +224,17 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   	.item ## _names = item ##_names_ ## entry, \
>   	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
>   
> -static const char *hpd_reg_names_8960[] = {"core-vdda"};
> -static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
> +static const char * const hpd_reg_names_8960[] = {"core-vdda"};
> +static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8960_config = {
>   		HDMI_CFG(hpd_reg, 8960),
>   		HDMI_CFG(hpd_clk, 8960),
>   };
>   
> -static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
> -static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
> -static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
> +static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
> +static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
> +static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
>   static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
>   
>   static const struct hdmi_platform_config hdmi_tx_8974_config = {
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index a5f481c39277631b7a19d294b086d6208be26511..381f957b34305494cb4da0b7dccb73b6ac3a1377 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -84,20 +84,20 @@ struct hdmi {
>   /* platform config data (ie. from DT, or pdata) */
>   struct hdmi_platform_config {
>   	/* regulators that need to be on for hpd: */
> -	const char **hpd_reg_names;
> +	const char * const *hpd_reg_names;
>   	int hpd_reg_cnt;
>   
>   	/* regulators that need to be on for screen pwr: */
> -	const char **pwr_reg_names;
> +	const char * const *pwr_reg_names;
>   	int pwr_reg_cnt;
>   
>   	/* clks that need to be on for hpd: */
> -	const char **hpd_clk_names;
> +	const char * const *hpd_clk_names;
>   	const long unsigned *hpd_freq;
>   	int hpd_clk_cnt;
>   
>   	/* clks that need to be on for screen pwr (ie pixel clk): */
> -	const char **pwr_clk_names;
> +	const char * const *pwr_clk_names;
>   	int pwr_clk_cnt;
>   };
>   
>
