Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D305E8BB447
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192EA10FB98;
	Fri,  3 May 2024 19:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GmtIxKKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D6A10FB98;
 Fri,  3 May 2024 19:42:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443Jeo2Z014580;
 Fri, 3 May 2024 19:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Rgm4jiBiBwxRzKcwO+Se0j2hgZlRD3hn15OaPV3cY8A=; b=Gm
 tIxKKwsXCk3RYVFfgKI/qKa/36laJsGV+Pfdx18zKNlIuDEQYKaTQ5n8HopRxfMP
 xIr4r7kq7nxVOIZiuf7D9llaTej8edvKXHYb8Z/p8WlTBIrZRdxLDNm64S2jmgZV
 i9E1AkkdINb0T2/xN2Bg0QYHM0SAze33EiG9gNNoo9k6UulD8uoeXVr6npSgr6x5
 /EFeQbvJUbrzEMAyWd174OZeJvnc5ht7FCgxdix/Z/AvFK9s5yt5hzhiF+tYyOwT
 TwVQwDXP8dfUxXENcmmRyr2iWJOUzIYh7IF4IQeBsfAL/IgCMN7OvDqaxdIB4qz3
 TafBAtLZXfqsX0kec6Eg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xv8vsbmbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 May 2024 19:42:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 443JgXuS023300
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 May 2024 19:42:33 GMT
Received: from [10.110.114.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 12:42:32 -0700
Message-ID: <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
Date: Fri, 3 May 2024 12:42:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WEqClIqYZAfkNL2YIBX1xByGEZaaO_ot
X-Proofpoint-GUID: WEqClIqYZAfkNL2YIBX1xByGEZaaO_ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_13,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030139
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



On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
> In order to validate drm/msm register definition files against schema,
> reuse the nodebugfs build step. The validation entry is guarded by
> the EXPERT Kconfig option and we don't want to enable that option for
> all the builds.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/ci/build.sh  | 3 +++
>   drivers/gpu/drm/ci/build.yml | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 106f2d40d222..28a495c0c39c 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
>   apt-get update
>   apt-get install -y libssl-dev
>   
> +# for msm header validation
> +apt-get install -y python3-lxml
> +
>   if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>       GCC_ARCH="aarch64-linux-gnu"
>       DEBIAN_ARCH="arm64"
> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> index 17ab38304885..9c198239033d 100644
> --- a/drivers/gpu/drm/ci/build.yml
> +++ b/drivers/gpu/drm/ci/build.yml
> @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
>     extends: .build:arm64
>     variables:
>       DISABLE_KCONFIGS: "DEBUG_FS"
> +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
>   

Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.

Cant we make this build rule msm specific?
