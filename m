Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677688B2EE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7140610EB22;
	Mon, 25 Mar 2024 21:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pis1j0nd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FF510EA7E;
 Mon, 25 Mar 2024 21:39:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42PLNbd4012736; Mon, 25 Mar 2024 21:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=0jLGL4SMuqDxWHqmlXOEG0WE44DYRZawG79sF/kR754=; b=pi
 s1j0ndkzxZgqgS56A7sv42VCkAaU8tBoR/bhLQXBXLclpGP7YJYL1rOqUIhNoJN4
 TSGuOJK40x2SXnFB2uhoCcXcL3YLAqOJTmDYWmO4GKdiViqq9aCbh1bU6HIv65+A
 70Yxt1uS2hAV5xAbWqPWlNvij4MwBBINmhq1FD+0ckkXFeQBO5UD/mguc2oPDzQV
 UZVFo8haUXOYHbDi6P4Epn/SG4pAy7zl0X5X6CJsT3YSXq6eyEX8bPbux1moB5Gj
 JOhxzZMoCO2RmkrvLtXA2PEnAtmCTQioV9CZPO6emNMJtPAoqAvxAri79PCeY+kR
 veOO/OZzd3K3QC+vTk2w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3h52r0s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 21:39:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PLdGLx018575
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 21:39:16 GMT
Received: from [10.110.56.183] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Mar
 2024 14:39:14 -0700
Message-ID: <6220c995-5893-9da3-e7c6-e1f8d292be64@quicinc.com>
Date: Mon, 25 Mar 2024 14:39:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: Add newlines to some debug prints
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240325210810.1340820-1-swboyd@chromium.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240325210810.1340820-1-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 26ruocLNZy91ePL63B0oOr9hcAWZJxyH
X-Proofpoint-GUID: 26ruocLNZy91ePL63B0oOr9hcAWZJxyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_21,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=898
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250134
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



On 3/25/2024 2:08 PM, Stephen Boyd wrote:
> These debug prints are missing newlines, leading to multiple messages
> being printed on one line and hard to read logs. Add newlines to have
> the debug prints on separate lines. The DBG macro used to add a newline,
> but I missed that while migrating to drm_dbg wrappers.
> 
> Fixes: 7cb017db1896 ("drm/msm: Move FB debug prints to drm_dbg_state()")
> Fixes: 721c6e0c6aed ("drm/msm: Move vblank debug prints to drm_dbg_vbl()")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fb.c  | 6 +++---
>   drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
