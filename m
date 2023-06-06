Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5A7247FD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 17:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587EC10E377;
	Tue,  6 Jun 2023 15:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D55010E376;
 Tue,  6 Jun 2023 15:40:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356DvJNq030987; Tue, 6 Jun 2023 15:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=tUScCHzizZ/C+ej3pCM4XinFAiRehlQxC2s7tiS5bfs=;
 b=KcM0G2SbrCusBexwQweYkkwQYV/B5BNteCKCOzKhZhiQXtgVrVsWriyvnXi6qiAm7PcN
 AioMY4zFW4j3c80YwvcGA3VdzIBJDMzckbtmrD2O4LhHhnlD+dYSrQAIlWgKFu0+1xwy
 /NluWp+iv7vGwmp3851cVIcHyXWGCKnKuyCY1oM5VZrI+LOgy0BLxoshCzqnBwF6v3dh
 z7UAH1XCC4W3X+VV6KNgCMhqiPPJ2M8TcBHVClba0SJKdhhbeOsUoFVJEMW8qTZwybAj
 7SU9JAXbSxEMD/RPGH7sSyk5C+06NuZ4358DwZO5ZE0JDVMEn9ZRDHY9iui0uz8VTUM/ TQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r1jg3jk8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 15:40:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356Fe0nw027434
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 15:40:00 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 6 Jun 2023 08:39:55 -0700
Date: Tue, 6 Jun 2023 21:09:52 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [Freedreno] [PATCH v8 11/18] drm/msm/adreno: Disable
 has_cached_coherent in GMU wrapper configurations
Message-ID: <yx4pb2j2dn274ebhufxibti7zt6tozgd7c6qkaun6q7eonz3tw@roapp52oed75>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-11-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-11-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pnloLZMP3zTSKVaX3P58vlyOKhb92D_H
X-Proofpoint-ORIG-GUID: pnloLZMP3zTSKVaX3P58vlyOKhb92D_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_11,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060134
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn
 Suijten <marijn.suijten@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 03:52:30PM +0200, Konrad Dybcio wrote:
> 
> A610 and A619_holi don't support the feature. Disable it to make the GPU stop
> crashing after almost each and every submission - the received data on
> the GPU end was simply incomplete in garbled, resulting in almost nothing
> being executed properly. Extend the disablement to adreno_has_gmu_wrapper,
> as none of the GMU wrapper Adrenos that don't support yet seem to feature it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 8cff86e9d35c..b133755a56c4 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -551,7 +551,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  		config.rev.minor, config.rev.patchid);
>  
>  	priv->is_a2xx = config.rev.core == 2;
> -	priv->has_cached_coherent = config.rev.core >= 6;
>  
>  	gpu = info->init(drm);
>  	if (IS_ERR(gpu)) {
> @@ -563,6 +562,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> +	if (config.rev.core >= 6)
> +		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
> +			priv->has_cached_coherent = true;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.40.1
> 
