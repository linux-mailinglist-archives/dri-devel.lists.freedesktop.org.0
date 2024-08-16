Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D582D955023
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 19:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8DE10E033;
	Fri, 16 Aug 2024 17:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ExaKS6h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B4510E033
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 17:42:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G8Yldp026847;
 Fri, 16 Aug 2024 17:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w6x3V93yXeelddB4K/3iELJK/EZHe1LNqYghcj33GY4=; b=ExaKS6h8RxHALzT/
 eLWTXsqHKJl6YEaSZ5a6NOIrfNBtSMkDcV4n0rACELP6hGuRixTRYLy+sBQXNu6S
 Xli9/eQNqDtt8rZOgMAl/BqwiF3x0NlTLLSXZnZHaWIPvJxmoZVQ88aB8g408hYI
 kdFT44f7qKmAztGLyYZKqJhWuzBQkFK4bxAtk5/fe5dB+iZYg4aj1QM5MoMqcvJw
 I1N1Y9rSUesX55Eh97m9Sjrn8VUobo+fNnnVFeiAVwj0BB6xsNe/vuOcz6qdwOAC
 LRBKKogIatMcc2imQEIiOXXCPXztMMPZg47KyPzqu9AvVsCCVo/fndS0+uJQ3tud
 bwVp9A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4123cr9b8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2024 17:41:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GHfqkV004705
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2024 17:41:52 GMT
Received: from [10.110.127.113] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 10:41:51 -0700
Message-ID: <4a4b6009-f54a-4c4f-9cf7-d0e7b807e1f2@quicinc.com>
Date: Fri, 16 Aug 2024 10:41:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Remove unused declaraions
To: Zhang Zekun <zhangzekun11@huawei.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <dri-devel@lists.freedesktop.org>
References: <20240815111936.78601-1-zhangzekun11@huawei.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240815111936.78601-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: h7kZeAfBlMEIdZXlcft1aJKu3HWFXGqq
X-Proofpoint-ORIG-GUID: h7kZeAfBlMEIdZXlcft1aJKu3HWFXGqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_12,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 mlxlogscore=598 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408160124
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



On 8/15/2024 4:19 AM, Zhang Zekun wrote:
> The definition of msm_atomic_state_clear() and msm_atomic_state_free()
> has been removed since commit c21c731d93e8 ("drm/msm: Don't subclass
> drm_atomic_state anymore").
> 
> Also, the definition of msm_dsi_host_set_src_pll() has been removed
> since commit 9b077c1581cf ("drm/msm/dsi: stop setting clock parents
> manually"). So, let's remove this unused declarations.
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.h | 2 --
>   drivers/gpu/drm/msm/msm_drv.h | 2 --
>   2 files changed, 4 deletions(-)
> 

It looks like you did not run get_maintainers.pl because freedreno list 
is not CCed on this. For future reference, please do to get our attention.

The change itself is fine, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
