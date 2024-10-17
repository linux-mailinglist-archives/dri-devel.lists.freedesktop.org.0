Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD249A3113
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 00:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3B610E064;
	Thu, 17 Oct 2024 22:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IOWnfb4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9910C10E064
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 22:54:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HIpikk013279;
 Thu, 17 Oct 2024 22:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 udSvq1C78g2ybpLzpRiraZIab6iFDvkSD4f9AwGC4p4=; b=IOWnfb4wR9uktgdU
 wpptarWLsEvsTTBUYodGBinXayooEtXsvnUIW8M8MHOSS3Obq5UmiLBbmS+/HTh/
 ry8IFmw/+6MUOPONWqoudNZiecemNnHUdOYdyrZQBsgmfGzYIevUBCX2j48Y3VQC
 puomslosPb5bjHW5mxuKmoeYqcO62FmBtHEJj0mHwFYHDy2yjzqJ87WGQ5y2/N+l
 0NSklfMoAHzXNulL4Nu9SkigGIq8803abbEbb41gOUwMojRikKD9vqej4ebT2nSs
 tCMCUjXgFmUx9MqQUg/xLp/PxMYEnHKdRz5zQ+w3EHVXPXfpB/FCJkYj52g/Fwmp
 rlYkZA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxwq3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 22:52:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HMq789030742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 22:52:07 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 15:52:06 -0700
Message-ID: <c633a57f-7f22-41e0-8b3d-bd95ad212e9b@quicinc.com>
Date: Thu, 17 Oct 2024 15:52:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
To: Jean Delvare <jdelvare@suse.de>, <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Doug Anderson
 <dianders@chromium.org>, YueHaibing <yuehaibing@huawei.com>
References: <20241015134606.5b87093e@endymion.delvare>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241015134606.5b87093e@endymion.delvare>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Qi6nSij_vao25x4vmDC-dJll4SJBYyNh
X-Proofpoint-GUID: Qi6nSij_vao25x4vmDC-dJll4SJBYyNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=916 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410170154
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



On 10/15/2024 4:46 AM, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> To avoid reintroducing the randconfig bug originally fixed by commit
> 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> on OF. This is consistent with what all other DRM drivers are doing.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> For regular builds, this is a no-op, as OF is always enabled on
> ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
> explained before, allowing test builds only when OF is enabled
> improves the quality of these test builds, as the result is then
> closer to how the code is built on its intended targets.
> 
> Changes in v3:
> * Rebase on top of kernel v6.11.
> Changes in v2:
> * Let DRM_MSM depend on OF so that random test builds won't break.
> 
>   drivers/gpu/drm/display/Kconfig |    2 +-
>   drivers/gpu/drm/msm/Kconfig     |    1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
