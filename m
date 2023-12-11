Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE2E80D4FC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 19:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B556810E4D5;
	Mon, 11 Dec 2023 18:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5493510E4D0;
 Mon, 11 Dec 2023 18:10:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BBFhNGW032546; Mon, 11 Dec 2023 18:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=XHwxvdnorYSN/lc1MHmTN
 BeycNeOZrCvtYEa6cs0SAY=; b=EArWtRW921xLIGy4mz+bXFE3gFj8UU5TWBzD6
 DO+5xXbh72iAq0B1EMEYauHcgehlSAWyLGV2EXmHyBXlwXa0rw07NBTv4m0F7dUe
 uhU+t72EwD3hH8uRb4JTyzzkNM9r1ULGXBqCkpSBonpS7u6s7W+PGHt0NLExDIl+
 5ARjoyxGJBTtkC1bzsLLOX1QgQ/LjtcKNi4lTaIRGDLJ/85dsQC/mvNmtykDVbZs
 7I5BTKXPyVlYTvSyOYgZ2gwNhxl/rk78/WxrQs0LNp0Du1DoimHI/dt4l3Ghk2ka
 6DrXv9njnAwrIAVGhOTFxBzDA7ecMtZYZzyIJplTrW9uktqvg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux25u0v57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Dec 2023 18:10:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBIAKXx001678
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Dec 2023 18:10:20 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 10:10:19 -0800
Date: Mon, 11 Dec 2023 10:10:18 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: call dp_display_get_next_bridge() during probe
Message-ID: <20231211181018.GL1766637@hu-bjorande-lv.qualcomm.com>
References: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: EjheDSGwnJGoZIDX5olxx_NyFLrysbMG
X-Proofpoint-GUID: EjheDSGwnJGoZIDX5olxx_NyFLrysbMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110149
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 02:43:33AM +0200, Dmitry Baryshkov wrote:
> The funcion dp_display_get_next_bridge() can return -EPROBE_DEFER if the
> next bridge is not (yet) available. However returning -EPROBE_DEFER from
> msm_dp_modeset_init() is not ideal. This leads to -EPROBE return from
> component_bind, which can easily result in -EPROBE_DEFR loops.
> 

Nice!

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Dependencies: https://patchwork.freedesktop.org/series/120375/
> 
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 36 +++++++++++++++++------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d542db37763a..ddb3c84f39a2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1197,15 +1197,27 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>  	return NULL;
>  }
>  
> -static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> +static int dp_display_get_next_bridge(struct msm_dp *dp);
> +
> +static int dp_display_probe_tail(struct device *dev)
>  {
> -	int rc;
> +	struct msm_dp *dp = dev_get_drvdata(dev);
> +	int ret;
>  
> -	rc = component_add(aux->dev, &dp_display_comp_ops);
> -	if (rc)
> -		DRM_ERROR("eDP component add failed, rc=%d\n", rc);
> +	ret = dp_display_get_next_bridge(dp);
> +	if (ret)
> +		return ret;
>  
> -	return rc;
> +	ret = component_add(dev, &dp_display_comp_ops);
> +	if (ret)
> +		DRM_ERROR("component add failed, rc=%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> +{
> +	return dp_display_probe_tail(aux->dev);
>  }
>  
>  static int dp_display_probe(struct platform_device *pdev)
> @@ -1280,11 +1292,9 @@ static int dp_display_probe(struct platform_device *pdev)
>  			goto err;
>  		}
>  	} else {
> -		rc = component_add(&pdev->dev, &dp_display_comp_ops);
> -		if (rc) {
> -			DRM_ERROR("component add failed, rc=%d\n", rc);
> +		rc = dp_display_probe_tail(&pdev->dev);
> +		if (rc)
>  			goto err;
> -		}
>  	}
>  
>  	return rc;
> @@ -1415,7 +1425,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>  	 * For DisplayPort interfaces external bridges are optional, so
>  	 * silently ignore an error if one is not present (-ENODEV).
>  	 */
> -	rc = devm_dp_parser_find_next_bridge(dp->drm_dev->dev, dp_priv->parser);
> +	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);

This transition worried me, but after reading the code the current model
of mixing devices for devres scares me more. So, nice cleanup! But I
think we have a few more of these...


That said, &dp->pdev->dev is dp_priv->parser->dev, the function no
longer relate to the "parser module", and we stash the return value of

  devm_drm_of_get_bridge(dev, dev->of_node, 1, 0)

in parser->next_brigde, so that we 5 lines below this call can move it
into dp->next_bridge.

As such, I'd like to propose that we change
devm_dp_parser_find_next_bridge() to just take &dp->pdev->dev and return
the next_bridge, in an ERR_PTR().

But that's follow-up-patch material.


Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

>  	if (!dp->is_edp && rc == -ENODEV)
>  		return 0;
>  
> @@ -1435,10 +1445,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  
>  	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
>  
> -	ret = dp_display_get_next_bridge(dp_display);
> -	if (ret)
> -		return ret;
> -
>  	ret = dp_bridge_init(dp_display, dev, encoder);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev->dev,
> -- 
> 2.42.0
> 
> 
