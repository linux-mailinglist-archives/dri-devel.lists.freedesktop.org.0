Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E25A02D8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A36AC6AD9;
	Wed, 24 Aug 2022 20:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA7510E293;
 Tue, 23 Aug 2022 17:52:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NGlCIZ013898;
 Tue, 23 Aug 2022 17:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rUw2in+AH1erjyxM6/5u1ukVrsGpIF9x+6A1qOpftQY=;
 b=nJyJANptU6yyFLb6ikz3Hp7PqxgKAij4TjmVWMjSKLJeo8wbHR9iv9wwDZ0/RtvMT6/E
 2xV2l9RoaKODrCgAzBoXBDDEeeGLYL3QkqU9fNWOUh3lMdQE3VIjyKZsrlGq96JCHFBT
 px9xcXPA/tfziFgK7v7yTToSAyKxdSl5qcI1YwbzRN9Ij3IgqP5TuL3WRqQkpk1EbbNw
 gpmwi4DSTfMi9GiVrK8VyUqXzQDSq8FemxJY6oujhA96Fc5kq1DSH/rAX28neFvEdevz
 igxyeJqf04hlXEbZIZId/YR/HRxFqFQuMwZPdZoN+HwkdN5wAgT8lwS1WP5HwEftJF8s hw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pq8a11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 17:52:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NHqcDG013801
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 17:52:38 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 10:52:36 -0700
Message-ID: <2237e6d0-8ee3-48a9-ab4c-4a99ed0e5646@quicinc.com>
Date: Tue, 23 Aug 2022 10:52:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] disp/dpu1: fix repeated words in comments
Content-Language: en-US
To: Jilin Yuan <yuanjilin@cdjrlc.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20220823115100.44060-1-yuanjilin@cdjrlc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220823115100.44060-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 70aeHVeJT2NAGntlt0BzuPj93oCTqYFp
X-Proofpoint-GUID: 70aeHVeJT2NAGntlt0BzuPj93oCTqYFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1011 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230070
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please fix the subject line .

It should be drm/msm/dpu: fix repeated words in comments

Also, you can add

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

On 8/23/2022 4:51 AM, Jilin Yuan wrote:
>   Delete the redundant word 'is'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index bce47647d891..59ca7d70a652 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1169,7 +1169,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   	/*
>   	 * max crtc width is equal to the max mixer width * 2 and max height is
> -	 * is 4K
> +	 * 4K
>   	 */
>   	dev->mode_config.max_width =
>   			dpu_kms->catalog->caps->max_mixer_width * 2;
