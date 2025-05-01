Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A476AA5945
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 03:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3987210E186;
	Thu,  1 May 2025 01:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kSpWVJG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC4410E167;
 Thu,  1 May 2025 01:15:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGpQkR021321;
 Thu, 1 May 2025 01:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GhVDqE0B9Bpr5apMvnfQKRAQ/2j088Db9RmH6AOhqbs=; b=kSpWVJG+m3Ny/tw4
 fTll299ucraaVmD3nq85b3tH88V0frziR+EB8rgJ1wnQtuJRLJIxJZx5Q2bfwp/5
 Xbn6WmltriWD3sRBFvCW4aHTf7hHqH73dLMMSb+TZ0xQDCb506fgt9KhitUXpUpC
 anQ3gTPRfL5jhLB5/Vvjf+SWOgDYVwqJ2BsrcVKuHNkjwE48aUQMgmfCHOZTZCfe
 5wmsBIuoQ+RG+07dYTBBKo7MOWusembHHaiLtmzkfBlPysrzq2JmSQdoZ4PyZD7l
 8Hr08fJUjwwvTnr0eLkR1wN/RURvgrEBztEJcK88JZpW2URME/JKFh4qSBrbAAMv
 55AXng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u743r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 May 2025 01:15:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5411FIWJ030790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 May 2025 01:15:18 GMT
Received: from [10.110.26.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 18:15:16 -0700
Message-ID: <94da79ca-5c32-4744-bc57-3a03a3c8379d@quicinc.com>
Date: Wed, 30 Apr 2025 18:15:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, "Bjorn
 Andersson" <andersson@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
 <20250418-sar2130p-display-v5-7-442c905cb3a4@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250418-sar2130p-display-v5-7-442c905cb3a4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDAwOCBTYWx0ZWRfX2DJr6WLc0edV
 I4UAvc3yot50l6XraxRL/48fmG1pohIk6ZF0BNE0PsZkOLa57/myXFJhvutcIjA96mFLUrToUUl
 3r5gG4oanNcY2kX9+m/IruaZ3m+5BFTtNyNYz+bqO/qgH1DuHkEs/9okS+xanaAyDcyPpamubTZ
 3C71obBj5nsrxGDN/DT0J6bLoge6dB5WmhPFHEzq0pE28Tk/kYy3iPoZ7bmZJgnOvtiC2esFM1M
 uzrn4JV/+5A5NAWiAhzG8LcCTnemf7JTGAnPCelcCep5nfJ3Cki9VmnTw59SYUHooIqw56c+BFT
 Jzc4i1wyIROkoHHygQbneBPs05q0/da6sk+YI4HjIyqqligfYsL1XyoYze5hbkS1KmGHPIOVEkL
 VLzjkZJ7o879cxpuF13/jJM2Yh/PLEb+nOLnIE8Wbs0y5XzDWObJy49RwodzhmksSD4GLdXu
X-Proofpoint-GUID: i4KL4M6P_4CsjhTj2vgnrh6O15uMeXR1
X-Proofpoint-ORIG-GUID: i4KL4M6P_4CsjhTj2vgnrh6O15uMeXR1
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6812cb27 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=WWvJJprN3eueWNfT7O0A:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010008
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



On 4/18/2025 12:50 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
> is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
> the configuration is the same as SM8550 DSI PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>   3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_7nm_cfgs },
>   	{ .compatible = "qcom,dsi-phy-7nm-8150",
>   	  .data = &dsi_phy_7nm_8150_cfgs },
> +	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
> +	  .data = &dsi_phy_5nm_sar2130p_cfgs },
>   	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>   	  .data = &dsi_phy_7nm_7280_cfgs },
>   	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
>   
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
>   	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
>   };
>   
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae95000, 0xae97000 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>   	.has_phy_lane = true,
>   	.regulator_data = dsi_phy_7nm_98400uA_regulators,
> 

