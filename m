Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071F608101
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 23:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802AF10E11A;
	Fri, 21 Oct 2022 21:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2B10E08D;
 Fri, 21 Oct 2022 21:58:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LKf1IK004514;
 Fri, 21 Oct 2022 21:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=G0y8yXOi0AMwy3r05tclL3Xy1hVN5riwv7bwfNItq9o=;
 b=VmMnSdCs5hQWcspWfY9OI52vbAVKAfqyDVsVji9mtr0ifrE3PNZbXj6WE0kH3hyHxMwV
 5uYXkqC+i0yC1wPJT/KbLidQSRBovvpMtkTISGfLjt/5F7bbJm/bRqG2WRjIMp+EMu1Q
 g5Drkl2aFyfyYrIu9DrGB3Wnb78P8TFGAgtLTBLmISk/Kd0sEYIdpCGQJ5lhYHB/G2Zg
 u8v+U/4z89gK0xwQiYDog9q5Zm8+eu0K13mxMaqqpSRKXFij2uWXHPLG6qL1ZySeHZwW
 13AzeSCI42vY2TyGM6riUvBtraoJwvFqegNfAM+xooPOp9aZeLv94SBrSHBhBxiJiJiU Qg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kbjcgbm16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 21:58:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29LLwZIk001937
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 21:58:35 GMT
Received: from [10.111.175.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 21 Oct
 2022 14:58:33 -0700
Message-ID: <778ae711-50a4-ae37-db18-8faa26f4c0ae@quicinc.com>
Date: Fri, 21 Oct 2022 14:58:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221021192641.2423237-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221021192641.2423237-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: l4mZ35VcisBCndwE8kD4EOBgyDO_s5GT
X-Proofpoint-ORIG-GUID: l4mZ35VcisBCndwE8kD4EOBgyDO_s5GT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210127
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

A couple of comments below.

On 10/21/2022 12:26 PM, Dmitry Baryshkov wrote:
> The rest of the code expects that master's device drvdata is the
> struct msm_drm_private instance. Do not override the mdp5's drvdata.
> 
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav, Rob, please pick this for -fixes.
> 
> This is an updated version of [1]. Fixed the read_mdp_hw_revision()
> function. PM runtime isn't available at the moment, as priv->kms is not
> set.

Can you split them into two changes?

Any reason fixing the read_mdp_hw_revision() needs to be in this?
> 
> [1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1
> 
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 37 ++++++++++++++----------
>   1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index b0d21838a134..506c64940972 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
>   							  slave_encoder);
>   }
>   
> -static void mdp5_destroy(struct platform_device *pdev);
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>   
>   static void mdp5_kms_destroy(struct msm_kms *kms)
>   {
> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>   	}
>   
>   	mdp_kms_destroy(&mdp5_kms->base);
> -	mdp5_destroy(mdp5_kms->pdev);
> +	mdp5_destroy(mdp5_kms);
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> @@ -519,9 +519,15 @@ static void read_mdp_hw_revision(struct mdp5_kms *mdp5_kms,
>   	struct device *dev = &mdp5_kms->pdev->dev;
>   	u32 version;
>   
> -	pm_runtime_get_sync(dev);
> +	/* Manually enable the MDP5, as pm runtime isn't usable yet */
> +	if (mdp5_enable(mdp5_kms)) {

mdp5_enable() always seems to return 0 so do we need this if block?

> +		*major = 0;
> +		*minor = 0;
> +		return;
> +	}
> +
>   	version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
> -	pm_runtime_put_sync(dev);
> +	mdp5_disable(mdp5_kms);
>   
>   	*major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>   	*minor = FIELD(version, MDP5_HW_VERSION_MINOR);
> @@ -559,6 +565,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>   	int irq, i, ret;
>   
>   	ret = mdp5_init(to_platform_device(dev->dev), dev);
> +	if (ret)
> +		return ret;
>   
>   	/* priv->kms would have been populated by the MDP5 driver */
>   	kms = priv->kms;
> @@ -632,9 +640,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>   	return ret;
>   }
>   
> -static void mdp5_destroy(struct platform_device *pdev)
> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>   {
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>   	int i;
>   
>   	if (mdp5_kms->ctlm)
> @@ -648,7 +655,7 @@ static void mdp5_destroy(struct platform_device *pdev)
>   		kfree(mdp5_kms->intfs[i]);
>   
>   	if (mdp5_kms->rpm_enabled)
> -		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_disable(&mdp5_kms->pdev->dev);
>   
>   	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>   	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
> @@ -797,8 +804,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   		goto fail;
>   	}
>   
> -	platform_set_drvdata(pdev, mdp5_kms);
> -
>   	spin_lock_init(&mdp5_kms->resource_lock);
>   
>   	mdp5_kms->dev = dev;
> @@ -839,9 +844,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	 */
>   	clk_set_rate(mdp5_kms->core_clk, 200000000);
>   
> -	pm_runtime_enable(&pdev->dev);
> -	mdp5_kms->rpm_enabled = true;
> -
>   	read_mdp_hw_revision(mdp5_kms, &major, &minor);
>   
>   	mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
> @@ -893,10 +895,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>   	/* set uninit-ed kms */
>   	priv->kms = &mdp5_kms->base.base;
>   
> +	pm_runtime_enable(&pdev->dev);
> +	mdp5_kms->rpm_enabled = true;
> +
>   	return 0;
>   fail:
>   	if (mdp5_kms)
> -		mdp5_destroy(pdev);
> +		mdp5_destroy(mdp5_kms);
>   	return ret;
>   }
>   
> @@ -953,7 +958,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
>   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   
>   	DBG("");
>   
> @@ -963,7 +969,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   
>   	DBG("");
>   
