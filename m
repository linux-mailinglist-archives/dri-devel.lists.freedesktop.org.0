Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD98C34BF
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 01:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456910E032;
	Sat, 11 May 2024 23:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eNwt+8lq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8E310E032;
 Sat, 11 May 2024 23:52:40 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44BNX2fd025593;
 Sat, 11 May 2024 23:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=e6ENqyxIQZA/ZVDqighZgSXE2MZS1LUDrO/qoWPPNGA=; b=eN
 wt+8lqC4gIrnr9Xm2yo9GPHQOO+Zf4sv7INC+7cfM4O8aHeIOam03FdL04HoaD3e
 07wURugB04HLiSgkmbskN5tg7O3TOHnOsNQk3+m9SX3ycuvZwcdOesLSdMHvOpJE
 /cpjSGKZ1YZCgBtQm+kxtnTELYgFTyMjQNiG2+zGHDQZCu/kgLA0ebLw0Q5Ym40+
 bUJ2HLl8FZAfiWds+bxewYNI8lFIiIX2c9zWOXh2scMi1ihMz8Njl0a1nyvjG7DV
 7E+WbFMVbzNNfqW7KSG3z5IePezgZtuNa2q2ky4+FzZtDL5aJ3IpoouELD3svbul
 pnULTxt0YepXnLq0fQcw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y212593w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 May 2024 23:52:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44BNqWVJ005233
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 May 2024 23:52:32 GMT
Received: from [10.110.113.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 11 May
 2024 16:52:31 -0700
Message-ID: <68e05c6f-d0ed-efea-6eef-a9ee008c6c24@quicinc.com>
Date: Sat, 11 May 2024 16:52:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] docs: document python version used for compilation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
CC: <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>
References: <20240512-python-version-v2-1-382870a1fa1d@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240512-python-version-v2-1-382870a1fa1d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: w0cgzoGxbAFqIURiF96Y0iqyA8G6T8BB
X-Proofpoint-ORIG-GUID: w0cgzoGxbAFqIURiF96Y0iqyA8G6T8BB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405110180
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



On 5/11/2024 3:32 PM, Dmitry Baryshkov wrote:
> The drm/msm driver had adopted using Python3 script to generate register
> header files instead of shipping pre-generated header files. Document
> the minimal Python version supported by the script. Per request by Jon
> Hunter, the script is required to be compatible with Python 3.5.
> 
> Python is documented as an optional dependency, as it is required only
> in a limited set of kernel configurations (following the example of
> other optional dependencies).
> 
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Depends: https://lore.kernel.org/dri-devel/20240507230440.3384949-1-quic_abhinavk@quicinc.com/
> ---
> Changes in v2:
> - Expanded documentation for the Python usage.
> - Link to v1: https://lore.kernel.org/r/20240509-python-version-v1-1-a7dda3a95b5f@linaro.org
> ---
>   Documentation/process/changes.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
