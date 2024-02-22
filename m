Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559185EFE0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 04:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FF510E860;
	Thu, 22 Feb 2024 03:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l0Ibl/cA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D7F10E85D;
 Thu, 22 Feb 2024 03:29:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M2Oqw2027341; Thu, 22 Feb 2024 03:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=DCjZ7JcUutr11PASE41wp
 VLY4d3szWyOc4z87emDhzU=; b=l0Ibl/cAN+hmnftU65EXcLA4RlvcLtFkgwMEW
 XGAqc1or/RBUpztmaTRB+OrikApwqTDLzlUkeMVD+nsvKNFhsm3kuEEqRH9HpBu9
 yiHtPr95pJyUE9SYUUn8QJw7QBLnROtJ5LIlJnAbWxoU6d5eyN1JbzplwHxsaOR+
 dBg5j6tU0y8+O5/I25MEQF90dFapU+WuUHmBl9oVYciZ3SrlzmfMk5Xu8D7gefph
 0yb4oLIXxEhSh0/SK9b2mY1h8v9UhfvqaXR5VjHOSlgOpwsIvsTjc1F+jqmgsIwr
 SffTzDZx8wWKBYeTJqdW5+6JsE0Qo1Z444aYfKbFik0uWmxsw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdfqa23v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 03:29:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M3Tfvc007837
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 03:29:41 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 21 Feb 2024 19:29:41 -0800
Date: Wed, 21 Feb 2024 19:29:39 -0800
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
Subject: Re: [PATCH RFC 2/3] drm/msm/dp: Add support for setting the eDP mode
 from devicetree
Message-ID: <20240222032939.GA2273464@hu-bjorande-lv.qualcomm.com>
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
 <20240221-x1e80100-display-refactor-connector-v1-2-86c0e1ebd5ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-2-86c0e1ebd5ec@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rMimyKKcqjJHZoUz8yBKf5ZMp3rhSsCT
X-Proofpoint-ORIG-GUID: rMimyKKcqjJHZoUz8yBKf5ZMp3rhSsCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_01,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1011 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220025
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

On Wed, Feb 21, 2024 at 12:50:32AM +0200, Abel Vesa wrote:
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index fa014cee7e21..a10d1b19d172 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -32,6 +32,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>  			struct phy *phy);
>  
>  void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
> +int dp_ctrl_phy_set_mode(struct dp_ctrl *dp_ctrl, int mode);
>  void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e4433891becb..9e58285d4ec6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1229,6 +1229,7 @@ static int dp_display_probe(struct platform_device *pdev)
>  	int rc = 0;
>  	struct dp_display_private *dp;
>  	const struct msm_dp_desc *desc;
> +	bool is_edp = false;
>  
>  	if (!pdev || !pdev->dev.of_node) {
>  		DRM_ERROR("pdev not found\n");
> @@ -1243,13 +1244,19 @@ static int dp_display_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> +	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP ||

dp is just allocated, and will be 0. You need to check
desc->connector_type here.

Regards,
Bjorn

> +	    of_property_read_bool(pdev->dev.of_node, "is-edp"))
> +		is_edp = true;
> +
> +	dp->dp_display.is_edp = is_edp;
>  	dp->dp_display.pdev = pdev;
>  	dp->name = "drm_dp";
>  	dp->id = desc->id;
> -	dp->dp_display.connector_type = desc->connector_type;
>  	dp->wide_bus_en = desc->wide_bus_en;
> -	dp->dp_display.is_edp =
> -		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> +
> +	dp->dp_display.connector_type = is_edp ?
> +					DRM_MODE_CONNECTOR_eDP :
> +					DRM_MODE_CONNECTOR_DisplayPort;
>  
>  	rc = dp_init_sub_modules(dp);
>  	if (rc) {
> @@ -1257,6 +1264,12 @@ static int dp_display_probe(struct platform_device *pdev)
>  		return -EPROBE_DEFER;
>  	}
>  
> +	rc = dp_ctrl_phy_set_mode(dp->ctrl, is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> +	if (rc) {
> +		DRM_ERROR("setting PHY submode failed\n");
> +		goto err;
> +	}
> +
>  	/* setup event q */
>  	mutex_init(&dp->event_mutex);
>  	init_waitqueue_head(&dp->event_q);
> 
> -- 
> 2.34.1
> 
