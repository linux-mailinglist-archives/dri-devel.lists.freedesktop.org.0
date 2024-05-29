Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61EC8D3E88
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 20:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA010F036;
	Wed, 29 May 2024 18:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YYNj6qob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475CD10F0B4;
 Wed, 29 May 2024 18:48:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TBVbJQ012157;
 Wed, 29 May 2024 18:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ab81luCQi39eJfDPVl2fNVgypINjt9s7zOvtaAtxDg8=; b=YYNj6qobyCffIr2g
 WnEBNc1XeMzQROmhvtKSiBwUJBZkv1vdyqn44Jc71ALpmMOAi04pP0GbJp6kd+wk
 wu1ZZkRYC0ISAIF1zla//7Nw8rpn0yy2iowAa0pFsACqPQyo6EgxFmZjo26jUYs/
 NtukDGd3MB68iJGDZT6UtytdIZOcvM1qEvLHRxjBBFBi4xPDpgu2okLRMpbAEgC4
 MWe6T8KLTaQVLwQQC2/lBrVKU0HR+p98SJcNBW8GqY1Qk2fQQoh28a0dNt8YMFOX
 YJed9XiOy830qKYWp5poffWMYkJQ116MsI5fo3nzPujVoAwawVtjt6+4HpBHbTYt
 hO5XAg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yja498-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 18:48:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TImGmU026691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 18:48:16 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 11:48:10 -0700
Message-ID: <05306686-922c-6646-3308-ebd6bc3e1219@quicinc.com>
Date: Wed, 29 May 2024 11:48:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
To: Vignesh Raman <vignesh.raman@collabora.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <daniels@collabora.com>,
 <helen.koike@collabora.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robdclark@gmail.com>, <david.heidelberg@collabora.com>,
 <guilherme.gallo@collabora.com>, <sergi.blanch.torne@collabora.com>,
 <mcanal@igalia.com>, <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
 <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
 <12f14064-fd1c-4e9c-94ee-ba7d492a4056@collabora.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <12f14064-fd1c-4e9c-94ee-ba7d492a4056@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yAOcEUDxqMb3ILGVj-wikK1cqOlETKxm
X-Proofpoint-ORIG-GUID: yAOcEUDxqMb3ILGVj-wikK1cqOlETKxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_15,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290129
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



On 5/29/2024 2:48 AM, Vignesh Raman wrote:
> Hi Dmitry,
> 
> On 29/05/24 13:39, Dmitry Baryshkov wrote:
>> On Wed, May 29, 2024 at 08:10:47AM +0530, Vignesh Raman wrote:
>>> test-list.txt and test-list-full.txt are not generated for
>>> cross-builds and they are required by drm-ci for testing
>>> arm32 targets. This is fixed in igt-gpu-tools. So uprev
>>> IGT to include the commit which fixes this issue. Also
>>> disable building xe driver tests for non-intel platforms.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
>>>
>>> v2:
>>>    - Split IGT uprev to seperate patch.
>>>
>>> v3:
>>>    - No changes.
>>>
>>> ---
>>>   drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>>>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ci/build-igt.sh 
>>> b/drivers/gpu/drm/ci/build-igt.sh
>>> index b7d2a49a6db3..eddb5f782a5e 100644
>>> --- a/drivers/gpu/drm/ci/build-igt.sh
>>> +++ b/drivers/gpu/drm/ci/build-igt.sh
>>> @@ -45,6 +45,10 @@ 
>>> MESON_OPTIONS="-Doverlay=disabled                    \
>>>                  -Dlibunwind=enabled                   \
>>>                  -Dprefix=/igt"
>>> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
>>> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
>>> +fi
>>> +
>>>   mkdir -p /igt
>>>   meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>>>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml 
>>> b/drivers/gpu/drm/ci/gitlab-ci.yml
>>> index 8f32de63d92e..1b29c3b6406b 100644
>>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>>> @@ -5,7 +5,7 @@ variables:
>>>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>>>     TARGET_BRANCH: drm-next
>>> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
>>> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
>>
>> Let's land this, then I'll ask to uprev to
>> dc2d7fb4f978048b87707ea9ec32da748b01b378, which fixes an issue with the
>> writeback tests on MSM devices.
> 
> Sure. Once this is merged, we can uprev to the latest IGT.
> 
> Regards,
> Vignesh
> 

Thanks, yes moving to latest IGT after this is merged will be great.

>>
>>>     DEQP_RUNNER_GIT_URL: 
>>> https://gitlab.freedesktop.org/anholt/deqp-runner.git
>>>     DEQP_RUNNER_GIT_TAG: v0.15.0
>>> -- 
>>> 2.40.1
>>>
>>
