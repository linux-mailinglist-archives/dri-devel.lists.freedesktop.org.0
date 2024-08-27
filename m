Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC049615E9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5571910E3F2;
	Tue, 27 Aug 2024 17:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h8wlrkMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF65E10E3F2;
 Tue, 27 Aug 2024 17:51:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RGWqRq002804;
 Tue, 27 Aug 2024 17:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kmAQPiK8M0fRx5xm+Hl50rN5MEsIa1ctSGh0cUkukik=; b=h8wlrkMWDWSIggh/
 miO7z8Bdn51EHfrCEIQHfV4ZFlO3UZd3YK8z8lsOy4gMHUx6zCCVKZkCnieFqkM4
 U2TvROhirTt6v5mh1EwLydUktsV8mP/yg48DdtanWE8URMlr5uQqqoHZbheeZC/G
 PcdoCa0uHhQqHVTfoL1jVzxumZRN6v2bzlIha45pUcKxCkYuHXVCPuZCkk8t0i9C
 GCNnCmxzFfgEqLfobg3MttMk4zxEQ/8pF0ogtHGYXJh5SNfweoxgKX/JsU+h5GwV
 L9vTNf7GpYEwV2f38Rh/tMz7ZXzQ7x5ZuVzurMjRxT7ta0BrbRAtZQ0vl637rAHa
 a48NOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419aq79rax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 17:51:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RHp2oN011551
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 17:51:02 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 10:51:02 -0700
Message-ID: <e8169167-3de3-4fc7-90c4-ac3b9fb60c38@quicinc.com>
Date: Tue, 27 Aug 2024 10:50:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/msm: fix %s null argument error
To: Sherry Yang <sherry.yang@oracle.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <ruanjinjie@huawei.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240827165337.1075904-1-sherry.yang@oracle.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240827165337.1075904-1-sherry.yang@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RtvrCThp2LVSkESS0xIZVvJb_RG6hh9L
X-Proofpoint-ORIG-GUID: RtvrCThp2LVSkESS0xIZVvJb_RG6hh9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270134
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



On 8/27/2024 9:53 AM, Sherry Yang wrote:
> The following build error was triggered because of NULL string argument:
> 
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c: In function 'mdp5_smp_dump':
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:352:51: error: '%s' directive argument is null [-Werror=format-overflow=]
> BUILDSTDERR:   352 |                         drm_printf(p, "%s:%d\t%d\t%s\n",
> BUILDSTDERR:       |                                                   ^~
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:352:51: error: '%s' directive argument is null [-Werror=format-overflow=]
> 
> This happens from the commit a61ddb4393ad ("drm: enable (most) W=1
> warnings by default across the subsystem"). Using "(null)" instead
> to fix it.
> 
> Fixes: bc5289eed481 ("drm/msm/mdp5: add debugfs to show smp block status")
> Signed-off-by: Sherry Yang <sherry.yang@oracle.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

I am not sure how the patch got titled 1/1 and not just "PATCH". It 
should be just "PATCH"

> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> index 3a7f7edda96b..500b7dc895d0 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> @@ -351,7 +351,7 @@ void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p,
>   
>   			drm_printf(p, "%s:%d\t%d\t%s\n",
>   				pipe2name(pipe), j, inuse,
> -				plane ? plane->name : NULL);
> +				plane ? plane->name : "(null)");
>   
>   			total += inuse;
>   		}

Change itself looks fine to me,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
