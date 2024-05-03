Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B48BB79A
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 00:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E079E10E91E;
	Fri,  3 May 2024 22:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZmAhSACs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0565410E89B;
 Fri,  3 May 2024 22:38:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443LNWRh020078;
 Fri, 3 May 2024 22:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=urnXA00algNWY4sZig1/JWwNFY3hO76XDLqsf9MC3bE=; b=Zm
 AhSACs0y5sI5/mfNnvkifc1xLlUywujp2TTczjo1qapAfjws9dv5Smr/bJYOgL/a
 f3OYu5ekBvmX/bJOGb90K2bKdnqrM6ZCS94BjVuZa3ebVj5NRAVw9U6e2m5ROGjn
 GCbGbBNS5Rck0F5tnArbksG5rvNakGMEauflI+hQZ/TFc9xJxhghTZJrCg6o4YFw
 +QfqwEi9t4pm1NNiCZOqoO4aFlx4zMPLdzaWlkbkzj4cy+9mjmjph0gotYL5xCSr
 Ao+N5T7DN/0iFlT/ZtfDRWGPRnZC9nfniNONBs/WhhC10BYm34/GDHW3eY61NIKU
 THKJTCR765/UCmX6EoOA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xvwfa9j3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 May 2024 22:38:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 443Mce6T028489
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 May 2024 22:38:40 GMT
Received: from [10.110.114.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 15:38:39 -0700
Message-ID: <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
Date: Fri, 3 May 2024 15:38:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
 <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
 <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5O7mhWqJWY2GtAgNP9TNe07xL1XgU3Z8
X-Proofpoint-ORIG-GUID: 5O7mhWqJWY2GtAgNP9TNe07xL1XgU3Z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_15,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405030161
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



On 5/3/2024 1:20 PM, Dmitry Baryshkov wrote:
> On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
>>> In order to validate drm/msm register definition files against schema,
>>> reuse the nodebugfs build step. The validation entry is guarded by
>>> the EXPERT Kconfig option and we don't want to enable that option for
>>> all the builds.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/ci/build.sh  | 3 +++
>>>    drivers/gpu/drm/ci/build.yml | 1 +
>>>    2 files changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>>> index 106f2d40d222..28a495c0c39c 100644
>>> --- a/drivers/gpu/drm/ci/build.sh
>>> +++ b/drivers/gpu/drm/ci/build.sh
>>> @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
>>>    apt-get update
>>>    apt-get install -y libssl-dev
>>>
>>> +# for msm header validation
>>> +apt-get install -y python3-lxml
>>> +
>>>    if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>>>        GCC_ARCH="aarch64-linux-gnu"
>>>        DEBIAN_ARCH="arm64"
>>> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
>>> index 17ab38304885..9c198239033d 100644
>>> --- a/drivers/gpu/drm/ci/build.yml
>>> +++ b/drivers/gpu/drm/ci/build.yml
>>> @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
>>>      extends: .build:arm64
>>>      variables:
>>>        DISABLE_KCONFIGS: "DEBUG_FS"
>>> +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
>>>
>>
>> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
>>
>> Cant we make this build rule msm specific?
> 
> No need to. We just need to validate the files at least once during
> the whole pipeline build.
>

ah okay, today the arm64 config anyway sets all arm64 vendor drm configs 
to y.

A couple of more questions:

1) Why is this enabled only for no-debugfs option?
2) Will there be any concerns from other vendors to enable CONFIG_EXPERT 
in their CI runs as the arm64 config is shared across all arm64 vendors.
