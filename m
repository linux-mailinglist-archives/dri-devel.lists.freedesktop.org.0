Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771557ED737
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 23:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12DE10E283;
	Wed, 15 Nov 2023 22:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6073A10E283
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 22:30:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFLpVkA031610; Wed, 15 Nov 2023 22:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vksiK8Ov8bH7PrqS5YyQfOD/LKFN1lfNFZwKmBJ82MA=;
 b=Dd0PHR3OWkvVFphgx6TY+dUtYJQs8HIhqAPxY5futR4jeHh6Moripz//QEqnQmv6ub4Q
 nr8XUGeJFzEig5Kj12SQibN9QzpHBRLpGma07ObmOlQ3TEwWu028AbjFDU1/6p9e6MK2
 uZn/WqlKAQmSnktLUKQMPcMxSnfKAxBni5UBo8LQD9eI4NmmlXdgosPztUQVC5eRIljI
 ay+DD1t7G4knKvoy0MHX5gvmiZ+fzer9q+DaqCMBOYB+3qJi+QNcQknNR8Wh6SNDNMLX
 voubU3xeSxcgbYfyUxt4EuTQ0iHilfgd1YeShGLLsMkXQ3RQEM8XqwnoGoaBGWcKnsY6 tA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucba6v01k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 22:30:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AFMUaMC009035
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 22:30:36 GMT
Received: from [10.110.75.112] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 14:30:36 -0800
Message-ID: <4865be55-9683-466d-bbb3-c3b80923e352@quicinc.com>
Date: Wed, 15 Nov 2023 14:30:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/panel-elida-kd35t133: Drop prepare/unprepare logic
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
 <20231115152647.2303283-5-macroalpha82@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231115152647.2303283-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rTia7nOrRFnWOKBXkdumIpIbCV80Cw0n
X-Proofpoint-ORIG-GUID: rTia7nOrRFnWOKBXkdumIpIbCV80Cw0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150178
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/15/2023 7:26 AM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Drop the prepare/unprepare logic, as this is now tracked elsewhere.
> Additionally, the driver shutdown is also duplicate as it calls
> drm_unprepare and drm_disable which are called anyway when
> associated drivers are shutdown/removed.

Hi Chris,

In the commit message, can you mention that this [1] was the change that 
made tracking the prepared flag common?

Also, it seems to me that this patch squashes 2 different changes 
together. Maybe we can split this into 2 patches -- one to drop the 
prepared flag checks and another to drop shutdown().

Thanks,

Jessica Zhang

[1] d2aacaf07395 ("drm/panel: Check for already prepared/enabled in 
drm_panel")

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c | 28 --------------------
>   1 file changed, 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index 29b4ee63d83b..00791ea81e90 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -43,7 +43,6 @@ struct kd35t133 {
>   	struct regulator *vdd;
>   	struct regulator *iovcc;
>   	enum drm_panel_orientation orientation;
> -	bool prepared;
>   };
>   
>   static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
> @@ -91,9 +90,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>   	int ret;
>   
> -	if (!ctx->prepared)
> -		return 0;
> -
>   	ret = mipi_dsi_dcs_set_display_off(dsi);
>   	if (ret < 0)
>   		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
> @@ -109,8 +105,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
>   	regulator_disable(ctx->iovcc);
>   	regulator_disable(ctx->vdd);
>   
> -	ctx->prepared = false;
> -
>   	return 0;
>   }
>   
> @@ -120,9 +114,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>   	int ret;
>   
> -	if (ctx->prepared)
> -		return 0;
> -
>   	dev_dbg(ctx->dev, "Resetting the panel\n");
>   	ret = regulator_enable(ctx->vdd);
>   	if (ret < 0) {
> @@ -166,8 +157,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
>   
>   	msleep(50);
>   
> -	ctx->prepared = true;
> -
>   	return 0;
>   
>   disable_iovcc:
> @@ -296,27 +285,11 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>   	return 0;
>   }
>   
> -static void kd35t133_shutdown(struct mipi_dsi_device *dsi)
> -{
> -	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
> -	int ret;
> -
> -	ret = drm_panel_unprepare(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
> -
> -	ret = drm_panel_disable(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
> -}
> -
>   static void kd35t133_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
>   	int ret;
>   
> -	kd35t133_shutdown(dsi);
> -
>   	ret = mipi_dsi_detach(dsi);
>   	if (ret < 0)
>   		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> @@ -337,7 +310,6 @@ static struct mipi_dsi_driver kd35t133_driver = {
>   	},
>   	.probe	= kd35t133_probe,
>   	.remove = kd35t133_remove,
> -	.shutdown = kd35t133_shutdown,
>   };
>   module_mipi_dsi_driver(kd35t133_driver);
>   
> -- 
> 2.34.1
> 
