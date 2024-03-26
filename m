Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FC288D0A5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 23:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C77610F3EB;
	Tue, 26 Mar 2024 22:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="M3dwunM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F47010F3EB;
 Tue, 26 Mar 2024 22:19:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QMBilY006721; Tue, 26 Mar 2024 22:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=v/h8fn+ezmmVCUczdMEJ+P7+lSq+OzxeYrR2eeze/Qs=; b=M3
 dwunM9KvVp2lUsbHhwYCRKZB+2f7urn9ON+PgFkO44rSuY17kqHSt1Bj9XO42o1K
 wVo8p52RzAGcNriQRwrxAXiE0aVQldXdXS8datCkI8U+uWyZCuI0YwBL44vFITSm
 zGeBIbDlgqCXqlEbUJ+n7C2LJCGwGua9DUDvJJ/LRmmFxDYiubgny1dEsFQRK6em
 nv+cE0oqaI557AXpj8fl4A59Zzfj9ZzeBs3pj5EkoFcvY/V6JPMYeFsi2X8AfwGQ
 XmarEDjQUk9cDiNTqUbRkRpAzvylAc1J212MGUM+i4g6z0fJC9sTZsVXcnCFSviv
 cBInGUiclI5zTaKrA5bQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3w1h9qch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 22:19:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QMJVrF011126
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 22:19:31 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 15:19:28 -0700
Message-ID: <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
Date: Tue, 26 Mar 2024 15:19:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wT24LDR8rBdvp_3-w7Z2S5PA9O97t9hy
X-Proofpoint-ORIG-GUID: wT24LDR8rBdvp_3-w7Z2S5PA9O97t9hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_09,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260159
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



On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> Import the gen_headers.py script from Mesa, commit FIXME. This script
> will be used to generate MSM register files on the fly during
> compilation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
>   1 file changed, 957 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> new file mode 100644
> index 000000000000..ae39b7e6cde8
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -0,0 +1,957 @@
> +#!/usr/bin/python3
> +

We need a licence and copyright here.

Also is something like a "based on" applicable here?

<snip>

> +import xml.parsers.expat
> +import sys
> +import os
> +import collections
> +import argparse
> +import time
> +import datetime
> +
> +class Error(Exception):
> +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> +http://gitlab.freedesktop.org/mesa/mesa/
> +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> +
> +The rules-ng-ng source files this header was generated from are:

Is this still applicable ?

Now gen_header.py is moved to kernel.

