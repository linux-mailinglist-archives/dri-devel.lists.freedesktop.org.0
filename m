Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77BB954D3C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 16:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4B510E054;
	Fri, 16 Aug 2024 14:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XMQbS8qE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A909E10E054
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 14:57:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GA6xI9017862
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 14:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qymygs/GVKuQxXMUGUzlyqRfc0plgeVS3FvPH2z+wy8=; b=XMQbS8qEnbwH7p90
 RLM19uXvZPQWmltyZ8hlVbqA5fJ2AWi6kwPn81IrE6pVIJwRcawnd6B4pQmMXMOP
 hm6JF/oCGu6VtAHzbU6cIO75bbe+hmW2UJAPqTwSs8Bm6UyynDpOLoMbWJT8ftEQ
 kMlyz5IFfCL5oXhSx2dT6QakZlz+Os2gXyxCRHGgYgbKkO+ZkhWA5TCDycWqCYh0
 u0mp6ZglsitzJYb6aqihldNgQJ6cBI2XMANGRHPAhwFWemIPTWZWxZj44Q5jLlRQ
 1ldAd4v1sQTpnib7nfAtGHm3NgYWRm3yis0yPSyxGa9FjRbECZL5kwbgB09yM5E1
 Tvm9vw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411rvra7y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 14:57:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GEvQc7009414
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 14:57:26 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 07:57:26 -0700
Message-ID: <442effaa-15f4-3214-2ce3-08a29eb591d7@quicinc.com>
Date: Fri, 16 Aug 2024 08:57:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] MAINTAINERS: qaic: Drop Pranjal as reviewer
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>, <quic_carlv@quicinc.com>
References: <20240726155310.765164-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240726155310.765164-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iHqud8ZKrQpn_Kx464MURyhoX7th5fOk
X-Proofpoint-ORIG-GUID: iHqud8ZKrQpn_Kx464MURyhoX7th5fOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_08,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=925 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160108
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

On 7/26/2024 9:53 AM, Jeffrey Hugo wrote:
> Pranjal's email address is bouncing.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71b739b40921..258f6236ac1c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18461,7 +18461,6 @@ F:	include/dt-bindings/clock/qcom,*
>   QUALCOMM CLOUD AI (QAIC) DRIVER
>   M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
>   R:	Carl Vanderlip <quic_carlv@quicinc.com>
> -R:	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>   L:	linux-arm-msm@vger.kernel.org
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported

Pushed to drm-misc-next

-Jeff
