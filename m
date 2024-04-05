Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B189A645
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 23:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3DA10E65E;
	Fri,  5 Apr 2024 21:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fcOsco/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E2E10E65E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 21:44:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435L0uwn018392; Fri, 5 Apr 2024 21:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=TIKqf+/mjzQE++LZKAfQ2rUXtVcdStL2Y6GyMNGqRI8=; b=fc
 Osco/lNvkY6OidF/l10oMq/2bzYr87JRZ5QClRwsOF0qMRXt4Fbz1ai4i80V+xNG
 n6kTky/7imsZnueu5JfZ1/Apo6xIAcuKe3rTW2TaZIByRFb3pbWuA8oSz0ssIBPC
 cEObCzwZzNHCJQRg+/DRgTQeDlpBTFc+eyPyes5cwsGKlu8+dCdY6XXwMgOxdGpF
 e8rxNuAwvoHSq0Et6V1/MXaZ5B3zTi7g+ax8plIEBp1SE1ksHvzFEjIQT6obj9/8
 xPNvC3Wo1QdFwtGQwIpJhtUXwFfqSNMTNLArTKyxPYNEUrLsT1bY+efbCCZoRi0t
 jB7abRAktHMD7Ot/48BQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xahgt1479-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 21:43:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435LhivP032282
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 21:43:44 GMT
Received: from [10.110.71.75] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 14:43:43 -0700
Message-ID: <d1368d46-5350-4455-ad72-418bad1dec09@quicinc.com>
Date: Fri, 5 Apr 2024 14:43:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/panel: novatek-nt36682e: don't unregister DSI
 device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthias Kaehlcke
 <mka@chromium.org>, Harigovindan P <harigovi@codeaurora.org>, Ritesh Kumar
 <quic_riteshk@quicinc.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-2-9f56953c5fb9@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240404-drop-panel-unregister-v1-2-9f56953c5fb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nXJjY52e_EB-AGW9EaVj9oyjdD6YtJQt
X-Proofpoint-ORIG-GUID: nXJjY52e_EB-AGW9EaVj9oyjdD6YtJQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_26,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050155
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



On 4/4/2024 3:08 AM, Dmitry Baryshkov wrote:
> The DSI device for the panel was registered by the DSI host, so it is an
> error to unregister it from the panel driver. Drop the call to
> mipi_dsi_device_unregister().
> 
> Fixes: ea4f9975625a ("drm/panel: Add support for Novatek NT36672E panel driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> index cb7406d74466..c39fe0fc5d69 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> @@ -614,8 +614,6 @@ static void nt36672e_panel_remove(struct mipi_dsi_device *dsi)
>   	struct nt36672e_panel *ctx = mipi_dsi_get_drvdata(dsi);
>   
>   	mipi_dsi_detach(ctx->dsi);
> -	mipi_dsi_device_unregister(ctx->dsi);
> -
>   	drm_panel_remove(&ctx->panel);
>   }
>   
> 
> -- 
> 2.39.2
> 
