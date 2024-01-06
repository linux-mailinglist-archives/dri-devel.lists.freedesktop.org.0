Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8318825D4A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 01:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C75710E06B;
	Sat,  6 Jan 2024 00:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5B410E028;
 Sat,  6 Jan 2024 00:04:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405LIUMG019395; Sat, 6 Jan 2024 00:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=As75EitWRrYPFDkoeJblxIa+0pEysES3yZycpSeCVpk=; b=mj
 f0SGT4cHNoD0jrutYp547/QvEa3BflHFx4KUVper+V1n5YSOp1CUCFFcQ5ksk2tx
 WiWaE78ZANsT7Vqisf8vlxhAz68EhVPYI5LrNTFnxaq/szGwzUQXs/+BwoRPTKW/
 1YD/y+Reb3HJ/AlQHyRS2tCD1j8qOtL9ZaLL8oY2zaS+gsekyvOg1qxiyeB/FDkk
 H7bPvpgbyVBzpHFr8yqpVUhYls2mkrnCHldKPMANw0gEusSkKYYbAf3YJkeRqbIn
 +bn5ihsHBwtt7NRT/CBJP31UoXvx6f1qP1OMH8DKxUu5gzCBTumZeAnbbl6N9PxI
 YypWgLuLf6lCudmDKMnA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve94rak56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jan 2024 00:04:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40604W6C022634
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 6 Jan 2024 00:04:32 GMT
Received: from [10.110.102.225] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 16:04:31 -0800
Message-ID: <c8d6769b-eb28-337c-fa55-4dae86611da5@quicinc.com>
Date: Fri, 5 Jan 2024 16:04:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-3-3d2750378063@linaro.org>
From: Carl Vanderlip <quic_carlv@quicinc.com>
In-Reply-To: <20240106-fd-migrate-mdp5-v3-3-3d2750378063@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ryZi8V0l36XY5wTVDl89TDtQDTlscZ3q
X-Proofpoint-GUID: ryZi8V0l36XY5wTVDl89TDtQDTlscZ3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050183
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Stephen
 Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
> possible to support this platform via the DPU driver (e.g. to provide
> support for DP, multirect, etc). Add a modparam to be able to switch
> between these two drivers.
> 
> All platforms supported by both drivers are by default handled by the
> MDP5 driver. To let them be handled by the DPU driver pass the
> `msm.prefer_mdp5=false` kernel param.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
>   drivers/gpu/drm/msm/msm_drv.c            | 31 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h            |  1 +
>   4 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa9e0ad33ebb..8f11a98491a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1276,6 +1276,9 @@ static int dpu_dev_probe(struct platform_device *pdev)
>   	int irq;
>   	int ret = 0;
>   
> +	if (!msm_disp_drv_should_bind(&pdev->dev, true))
> +		return -ENODEV;
> +
>   	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
>   	if (!dpu_kms)
>   		return -ENOMEM;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 0827634664ae..43d05851c54d 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -866,6 +866,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
>   
>   	DBG("");
>   
> +	if (!msm_disp_drv_should_bind(&pdev->dev, false))
> +		return -ENODEV;
> +
>   	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
>   	if (!mdp5_kms)
>   		return -ENOMEM;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 50b65ffc24b1..ef57586fbeca 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -969,6 +969,37 @@ static int add_components_mdp(struct device *master_dev,
>   	return 0;
>   }
>   
> +#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
> +bool msm_disp_drv_should_bind(struct device *dev, bool mdp5_driver)

s/mdp5_driver/dpu_driver/

> +{
> +	/* If just a single driver is enabled, use it no matter what */
> +	return true;
> +}

This will cause both MDP/DPU probes to return -ENODEV, rather than
select the enabled one.

> +#else
> +
> +static bool prefer_mdp5 = true;
> +MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
> +module_param(prefer_mdp5, bool, 0444);
> +
> +/* list all platforms supported by both mdp5 and dpu drivers */
> +static const char *const msm_mdp5_dpu_migration[] = {
> +	NULL,
> +};
> +
> +bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
> +{
> +	/* If it is not an MDP5 device, do not try MDP5 driver */
> +	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
> +		return dpu_driver;
> +
> +	/* If it is not in the migration list, use MDP5 */
> +	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
> +		return !dpu_driver;
> +
> +	return prefer_mdp5 ? !dpu_driver : dpu_driver;
> +}
> +#endif
> +
>   /*
>    * We don't know what's the best binding to link the gpu with the drm device.
>    * Fow now, we just hunt for all the possible gpus that we support, and add them
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 01e783130054..762e13e2df74 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -563,5 +563,6 @@ int msm_drv_probe(struct device *dev,
>   	struct msm_kms *kms);
>   void msm_kms_shutdown(struct platform_device *pdev);
>   
> +bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
>   
>   #endif /* __MSM_DRV_H__ */
> 
