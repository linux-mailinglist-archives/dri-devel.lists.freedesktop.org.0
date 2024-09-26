Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC89987B71
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 01:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181D210E34A;
	Thu, 26 Sep 2024 23:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="L1VGlq0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7B610E34A;
 Thu, 26 Sep 2024 23:01:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QG9mG7026541;
 Thu, 26 Sep 2024 23:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bDhnhxaLSsQjl7xe4xa9yaUsNXJSZfAHaDNanf+MtVA=; b=L1VGlq0yeiNIwbWD
 rauKzq2Npx92dXPG2lryye+al+tOxfhhN9iKJfacVJR0/J9ZOC2Ca7DN7ICbUYt1
 fd4qRogLR3EGLww/vfyLSqOejT9EajrE2A4iisWpTarlDlidDX0maKIrT5eDLFVz
 EHFs9NRc8SDF9/aJpM/CMuI2RRDpbY+x/l8hBLB0nNXc2BZR04bDnvfaknKCBwIL
 RTt//+k6m9HJrAjlWIWNfwSTRTNP5kig2z1sIvdnOBZ5IYeHPKhgBbRgtouVydox
 jyH5jDY0utWXZKkcxK+lhUtyxGRpLtfKMn8Mqb16HuZ5klrQkfH5H3FPgK/g6reY
 2ac6hg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5c151y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2024 23:01:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QN1TuF007471
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2024 23:01:29 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 16:01:27 -0700
Message-ID: <e9f38fe1-10fb-49ad-b209-0e2786ec6f94@quicinc.com>
Date: Thu, 26 Sep 2024 16:01:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/gpu: ci: update flake tests requirements
To: Vignesh Raman <vignesh.raman@collabora.com>,
 <dri-devel@lists.freedesktop.org>
CC: <daniels@collabora.com>, <helen.koike@collabora.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <robdclark@gmail.com>,
 <guilherme.gallo@collabora.com>, <sergi.blanch.torne@collabora.com>,
 <deborah.brouwer@collabora.com>, <dmitry.baryshkov@linaro.org>,
 <mripard@kernel.org>, <rodrigo.vivi@intel.com>,
 <linux-mediatek@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20240926070653.1773597-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240926070653.1773597-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pSkChFDu4ef4NamDTDMy0qtaNpRfUdmK
X-Proofpoint-GUID: pSkChFDu4ef4NamDTDMy0qtaNpRfUdmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260160
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



On 9/26/2024 12:06 AM, Vignesh Raman wrote:
> Update the documentation to require linking to a relevant GitLab
> issue for each new flake entry instead of an email report. Added
> specific GitLab issue URLs for i915, xe and other drivers.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
> - Add gitlab issue link for msm driver.
> 
> ---
>   Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..f918fe56f2b0 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific hardware revision are
>   known to behave unreliably. These tests won't cause a job to fail regardless of
>   the result. They will still be run.
>   
> -Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +Each new flake entry must include a link to the relevant GitLab issue, the board
> +name or Device Tree name, the first kernel version affected, the IGT version used
> +for tests and an approximation of the failure rate.
>   
>   They should be provided under the following format::
>   
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $GITLAB_ISSUE
>     # Board Name: broken-board.dtb
>     # Linux Version: 6.6-rc1
>     # IGT Version: 1.28-gd2af13d9f
>     # Failure Rate: 100
>     flaky-test
>   
> +The GitLab issue must include the logs and the pipeline link. Use the appropriate
> +link below to create an issue.
> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
> +https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver
> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
> +

Acked for MSM.

Thanks

Abhinav
>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>   -----------------------------------------------------------
>   
