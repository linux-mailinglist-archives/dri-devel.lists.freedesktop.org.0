Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1085EFF9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 04:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BC310E867;
	Thu, 22 Feb 2024 03:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eO52uUaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C9710E866;
 Thu, 22 Feb 2024 03:40:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M1tnR2015354; Thu, 22 Feb 2024 03:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=Ds2yZ/R7d+RJNs02PAlJC
 WH5zE4c0b1LVXuVtLmrDDY=; b=eO52uUaYx4Y8uQ8BsYzqGugmFo9cihMcFgvg1
 zLl3F2+Z6x69+KyYofIc9HUSSupDJaoadJE3tjfzS66CUucvHQp4uH45Q0tWmtRG
 FXYnsV5aZZdEiRAgDM3SQ2OyAFNfd0ZdJbYMem87T6k9Fd+cl7FRaLEwB3tEym/y
 2B92LyQ+wVrB8SfJj+Y9LyjlhbCRP5Dr8dQpRcIEINiTkgnunG/wt64tcwyZFcg1
 2ssM0tcfirzIsgLCZL9EBAziVge55MrAuxG5bvbA94mg+WcsKeRTBShyv0auFJ6b
 gYqzb06JQcxxQ1Aisg6VClR01TLUEoCQbIYOGtsh8lIjtzrPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdw13866p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 03:40:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M3ed73030760
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 03:40:40 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 21 Feb 2024 19:40:39 -0800
Date: Wed, 21 Feb 2024 19:40:38 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Abel Vesa <abel.vesa@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Johan Hovold <johan@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 3/3] drm/msm/dp: Add support for the X1E80100
Message-ID: <20240222034038.GC2273464@hu-bjorande-lv.qualcomm.com>
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
 <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ujOmDQbP3bxRMRsHhIRF5eLpgclOwkFe
X-Proofpoint-GUID: ujOmDQbP3bxRMRsHhIRF5eLpgclOwkFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_01,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402220026
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

On Wed, Feb 21, 2024 at 12:50:33AM +0200, Abel Vesa wrote:
> Add the X1E80100 DP descs and compatible. This platform will be using
> a single compatible for both eDP and DP mode. The actual mode will
> be set in devicetree via is-edp flag.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9e58285d4ec6..7b8c695d521a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -171,6 +171,14 @@ static const struct msm_dp_desc sm8650_dp_descs[] = {
>  	{}
>  };
>  
> +static const struct msm_dp_desc x1e80100_dp_descs[] = {
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
> +	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_en = true },
> +	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_en = true },
> +	{}
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
>  	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> @@ -179,6 +187,7 @@ static const struct of_device_id dp_dt_match[] = {
>  	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
>  	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
>  	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
> +	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },

This doesn't look like alphabetical order.

Regards,
Bjorn

>  	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
>  	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
>  	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
> 
> -- 
> 2.34.1
> 
