Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDEA6F22B1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 05:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7647010E269;
	Sat, 29 Apr 2023 03:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291E710E269;
 Sat, 29 Apr 2023 03:31:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33T3VL8E027560; Sat, 29 Apr 2023 03:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7CTLvOJ6WyS4+EGaBMjf9uMcozJp5gxF5echuTGMx5M=;
 b=gE9YZhDn+QSGVnvVWyZ2muWsw+5KD5yQnICl0kmDEOJr7XXuTHbxQNmcnG5zdaVUI4im
 SoAyH9AMqCXbqWtgk4pY6xy+in+z2NF0v0wfAhiUheUYNUJJVKxzX545uc8NxIo463Is
 7rBeWf4FNeiGVau0MATHRbgtu6GtG6HN1afBmUKnfDOFBhyCwopwvAL3/l0DK6xNSLE+
 4aL5khgmocG7M2ez2beq6esRlQqtu908BdW2iEftZ9ANmnZMmVYwaMT16nVkii7JM1wU
 r4PRrw0AMASQGPPmfi7ouBjUUqP6yokGWGfZV+VU/FlYBARVWvunprBnLCbQcPOkSjX+ vA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8tju01ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 03:31:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33T3V02u007906
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 03:31:00 GMT
Received: from [10.110.119.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 28 Apr
 2023 20:30:59 -0700
Message-ID: <bebbe640-7e1a-520f-d4a2-977135fc6fee@quicinc.com>
Date: Fri, 28 Apr 2023 20:30:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 0/7] add DSC 1.2 dpu supports
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqqhP1QL7TuW8JXeVFqukWggYmB1XU8OeB65fQA+jhLAg@mail.gmail.com>
 <ff60439f-9955-5e89-ee2c-17bc2b07d1e1@quicinc.com>
 <CAA8EJppr7zYGTJcR4EAB3eybCz0tY=t4Srf2QhLVc4Uu5ZqNtQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppr7zYGTJcR4EAB3eybCz0tY=t4Srf2QhLVc4Uu5ZqNtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ouoIwlQ19Taee-V9igTCySvtJI4jrONv
X-Proofpoint-ORIG-GUID: ouoIwlQ19Taee-V9igTCySvtJI4jrONv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290032
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/28/2023 8:12 PM, Dmitry Baryshkov wrote:
> On Sat, 29 Apr 2023 at 05:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/28/2023 7:46 PM, Dmitry Baryshkov wrote:
>>> On Sat, 29 Apr 2023 at 02:45, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>
>>>> This series adds the DPU side changes to support DSC 1.2 encoder. This
>>>> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
>>>> The DSI and DP parts will be pushed later on top of this change.
>>>> This seriel is rebase on [1], [2] and catalog fixes from [3].
>>>>
>>>> [1]: https://patchwork.freedesktop.org/series/116851/
>>>> [2]: https://patchwork.freedesktop.org/series/116615/
>>>> [3]: https://patchwork.freedesktop.org/series/112332/
>>>>
>>>> Abhinav Kumar (2):
>>>>     drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
>>>>     drm/msm/dpu: add dsc blocks for remaining chipsets in catalog
>>>>
>>>> Kuogee Hsieh (5):
>>>>     drm/msm/dpu: add support for DSC encoder v1.2 engine
>>>>     drm/msm/dpu: separate DSC flush update out of interface
>>>>     drm/msm/dpu: add DPU_PINGPONG_DSC feature PP_BLK and PP_BLK_TE
>>>>     drm/msm/dpu: save dpu topology configuration
>>>>     drm/msm/dpu: calculate DSC encoder parameters dynamically
>>>
>>> Another generic comment: this patchset doesn't have discussed RM
>>> changes to allocate DSC blocks in proper pairs as required by DCE.
>>>
>>
>> We have already made that change. It will be pushed with the DP series
>> because today DSC only support 2-2-1 so they will always be allocated in
>> pairs.
> 
> Then there is no reason to touch the dpu_encoder in this series as the
> topology is also known to be 2:2:1.
> 

Agreed, no concerns with that.

>>
>>>>
>>>>    drivers/gpu/drm/msm/Makefile                       |   1 +
>>>>    .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +-
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   8 +-
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  26 +-
>>>>    .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  35 ++-
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  26 +-
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   2 +-
>>>>    .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   2 +-
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  14 +
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   7 +
>>>>    .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  16 +
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  14 +
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  14 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 102 ++++---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 ++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  36 ++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  22 +-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  14 +-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 335 +++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 +-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
>>>>    23 files changed, 642 insertions(+), 116 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>>>
>>>> --
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
>>>
>>>
> 
> 
> 
