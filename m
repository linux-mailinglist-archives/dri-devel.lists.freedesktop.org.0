Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A1B764109
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 23:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034310E063;
	Wed, 26 Jul 2023 21:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A6E10E047;
 Wed, 26 Jul 2023 21:21:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QLJGk1006558; Wed, 26 Jul 2023 21:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wCOW3WN2xYSg1qSIxKRn0wWX3JjSuUSQBVSKyC4GADY=;
 b=SxjoXjYE5ZURzcFpEQf1YClZsrXePm2NX9Z36pvFywEwjlUHoTKDZqKbKdH0xXJkYx56
 6ZeYR13sG76R1b/74RBXhGR/f2fxtfDfYaAJq2oLlPnkzqK0msV6d+qz7CKZNaDXsQI6
 unsHmLh0MJJt/sA6Ww8uBPj+lBPRhhGhliJ+vvU/h2EFZ97dkoiDzF7ifzWXHkE91alB
 hurw4aUGsAsKi3035ZX3vaNggniJ0Lzt6FHIEq5A0rCt8Ut9AZ2BvX0VPX+qAxgxHI6J
 4AHB1cCUdmOI8A59POmIoWcubHGj5SolY6i68neKt3zUK+8wC8w22mqBY6jWpkIvB3Nu Lw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2ufm9ypa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 21:21:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QLLKpS030243
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 21:21:20 GMT
Received: from [10.110.29.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 14:21:19 -0700
Message-ID: <05f4708d-5db7-37ff-2d79-b4a9483606f9@quicinc.com>
Date: Wed, 26 Jul 2023 14:21:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] drm/msm/mdss: export UBWC data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230521171026.4159495-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AFXOICb-2awt2A_vTKaZZrPjPgyD_McH
X-Proofpoint-ORIG-GUID: AFXOICb-2awt2A_vTKaZZrPjPgyD_McH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=902
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307260190
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> DPU programming requires knowledge of some of UBWC parameters. This
> results in duplication of UBWC data between MDSS and DPU drivers. Export
> the required data from MDSS driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++-----------------
>   drivers/gpu/drm/msm/msm_mdss.h | 27 +++++++++++++++++++++++++++
>   2 files changed, 40 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index d1e57099b517..ed836c659688 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -13,7 +13,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/reset.h>
>   
> -#include "msm_drv.h"
> +#include "msm_mdss.h"
>   #include "msm_kms.h"
>   
>   #define HW_REV				0x0
> @@ -26,16 +26,6 @@
>   
>   #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
>   
> -struct msm_mdss_data {
> -	u32 ubwc_enc_version;
> -	/* can be read from register 0x58 */
> -	u32 ubwc_dec_version;
> -	u32 ubwc_swizzle;
> -	u32 ubwc_static;
> -	u32 highest_bank_bit;
> -	u32 macrotile_mode;
> -};
> -
>   struct msm_mdss {
>   	struct device *dev;
>   
> @@ -185,12 +175,6 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>   	return 0;
>   }
>   
> -#define UBWC_1_0 0x10000000
> -#define UBWC_2_0 0x20000000
> -#define UBWC_3_0 0x30000000
> -#define UBWC_4_0 0x40000000
> -#define UBWC_4_3 0x40030000
> -
>   static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
>   {
>   	const struct msm_mdss_data *data = msm_mdss->mdss_data;
> @@ -236,6 +220,18 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>   	}
>   }
>   
> +const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
> +{
> +	struct msm_mdss *mdss;
> +
> +	if (!dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	mdss = dev_get_drvdata(dev);
> +
> +	return mdss->mdss_data;
> +}
> +
>   static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
> new file mode 100644
> index 000000000000..02bbab42adbc
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_mdss.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2018, The Linux Foundation
> + */

Fix the copyright year .

Apart from that,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
