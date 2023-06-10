Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECC72A6EE
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 02:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2C710E110;
	Sat, 10 Jun 2023 00:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC0F10E110;
 Sat, 10 Jun 2023 00:00:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359NhYIT028385; Sat, 10 Jun 2023 00:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=G+t0EXnw41DiMmjm25D5UjowmOGfVudWiv2L1IIEZ2c=;
 b=DWI0MKZyQYQz2XdHDV1yoKcsMNpBKzfU+RX6IfgVOcKx2d8r9ZFc8SIH1FWCC5fORhOq
 nKSF0MnKSHLD52AT1QGhu88cXQLUzlnrcAtRUNRuyLx1b+OcPvX6Ww2I3EOaGyvogT4N
 6/ob/c5xX3+Hzbfol3hKmV0BkTbGhUmBdwi1D/CU44EOf1+gWT2f6FQ0n+N/vYwTIvZB
 7vPfGhAZtL4FPpeZOjo8gnUEakNaO+5ga+0h7diLb/+2xJ82MHGHAqX00Z/bw+xmSrT4
 wvma70ohOa+idSVfrjrvLGHJWgO9gO1/BTcqk3iGLMNV7vS7eNcOsiRQsHiTxtu6mx24 ag== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3t70jccu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Jun 2023 00:00:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35A00DhY009993
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Jun 2023 00:00:13 GMT
Received: from [10.110.51.236] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 9 Jun 2023
 17:00:11 -0700
Message-ID: <a144f18a-bffb-d9ed-dd2e-12977404d71e@quicinc.com>
Date: Fri, 9 Jun 2023 17:00:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 12/13] drm/msm/dpu: add support for virtual planes
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-13-dmitry.baryshkov@linaro.org>
 <78594a9a-f834-f2d2-1d8a-3e13e18c5477@quicinc.com>
 <43a856be-e6a4-b9ff-eb38-d1e9ff857754@linaro.org>
 <7d8372ff-6cb3-5bcb-ff9f-386937bff218@quicinc.com>
In-Reply-To: <7d8372ff-6cb3-5bcb-ff9f-386937bff218@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eruSdcBDXdnIlcMEMjC9PKCvSJo2C-jE
X-Proofpoint-ORIG-GUID: eruSdcBDXdnIlcMEMjC9PKCvSJo2C-jE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_17,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090202
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/8/2023 12:51 PM, Abhinav Kumar wrote:
> 
> 
> On 6/7/2023 2:56 PM, Dmitry Baryshkov wrote:
>> On 08/06/2023 00:05, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>> Only several SSPP blocks support such features as YUV output or 
>>>> scaling,
>>>> thus different DRM planes have different features.  Properly utilizing
>>>> all planes requires the attention of the compositor, who should
>>>> prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
>>>> to end up in a situation when all featureful planes are already
>>>> allocated for simple windows, leaving no spare plane for YUV playback.
>>>>
>>>> To solve this problem make all planes virtual. Each plane is registered
>>>> as if it supports all possible features, but then at the runtime during
>>>> the atomic_check phase the driver selects backing SSPP block for each
>>>> plane.
>>>>
>>>> Note, this does not provide support for using two different SSPP blocks
>>>> for a single plane or using two rectangles of an SSPP to drive two
>>>> planes. Each plane still gets its own SSPP and can utilize either a 
>>>> solo
>>>> rectangle or both multirect rectangles depending on the resolution.
>>>>
>>>> Note #2: By default support for virtual planes is turned off and the
>>>> driver still uses old code path with preallocated SSPP block for each
>>>> plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
>>>> kernel parameter.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>
>>> There will be some rebase needed to switch back to encoder based 
>>> allocation so I am not going to comment on those parts and will let 
>>> you handle that when you post v3.
>>>
>>> But my questions/comments below are for other things.
>>>
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  59 +++++--
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 120 ++++++++++----
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 187 
>>>> ++++++++++++++++++----
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  24 ++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  65 ++++++++
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  24 +++
>>>>   7 files changed, 413 insertions(+), 70 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> index 8ef191fd002d..cdece21b81c9 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> @@ -1273,6 +1273,29 @@ static int dpu_crtc_assign_resources(struct 
>>>> drm_crtc *crtc, struct drm_crtc_stat
>>>>       return 0;
>>>>   }
>>>> +static int dpu_crtc_assign_plane_resources(struct drm_crtc *crtc, 
>>>> struct drm_crtc_state *crtc_state)
>>>> +{
>>>> +    struct dpu_global_state *global_state;
>>>> +    struct drm_plane *plane;
>>>> +    int rc;
>>>> +
>>>> +    global_state = dpu_kms_get_global_state(crtc_state->state);
>>>> +    if (IS_ERR(global_state))
>>>> +        return PTR_ERR(global_state);
>>>> +
>>>> +    dpu_rm_release_all_sspp(global_state, crtc);
>>>> +
>>>> +    drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
>>>> +        rc = dpu_plane_virtual_assign_resources(plane, crtc,
>>>> +                            global_state,
>>>> +                            crtc_state->state);
>>>> +        if (rc)
>>>> +            return rc;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>>           struct drm_atomic_state *state)
>>>>   {
>>>> @@ -1281,7 +1304,6 @@ static int dpu_crtc_atomic_check(struct 
>>>> drm_crtc *crtc,
>>>>       struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>>>> -    const struct drm_plane_state *pstate;
>>>>       struct drm_plane *plane;
>>>>       int rc = 0;
>>>> @@ -1294,6 +1316,13 @@ static int dpu_crtc_atomic_check(struct 
>>>> drm_crtc *crtc,
>>>>               return rc;
>>>>       }
>>>> +    if (dpu_use_virtual_planes &&
>>>> +        crtc_state->planes_changed) {
>>>> +        rc = dpu_crtc_assign_plane_resources(crtc, crtc_state);
>>>> +        if (rc < 0)
>>>> +            return rc;
>>>> +    }
>>>
>>> Can you please explain a bit more about the planes_changed condition?
>>>
>>> 1) Are we doing this because the plane's atomic check happens before 
>>> the CRTC atomic check?
>>
>> Yes. Another alternative would be to stop using 
>> drm_atomic_helper_check() and implement our own code instead, 
>> inverting the plane / CRTC check order.
>>
> 
> I am fine with that too but as you noted in (3), if planes_changed will 
> be set by those functions and you can drop explicit assignment of it in 
> this patch, that will be the best option for me.
> 
>>>
>>> 2) So the DRM core sets this to true already when plane is switching 
>>> CRTCs or being connected to a CRTC for the first time, we need to 
>>> handle the conditions additional to that right?
>>
>> Nit: it is not possible to switch CRTCs. Plane first has to be 
>> disconnected and then to be connected to another CRTC.
>>
>>>
>>> 3) If (2) is correct, arent there other conditions then to be handled 
>>> for setting planes_changed to true?
>>>
>>> Some examples include, switching from a scaling to non-scaling 
>>> scenario, needing rotation vs not needing etc.
>>
>> Setting the plane_changed is not required. Both 
>> drm_atomic_helper_disable_plane() and drm_atomic_helper_update_plane() 
>> will add the plane to the state. Then drm_atomic_helper_check_planes() 
>> will call drm_atomic_helper_plane_changed(), setting 
>> {old_,new_}crtc_state->planes_changed.
>>
>> I should check if the format check below is required or not. It looks 
>> like I can drop that clause too.
>>
> 
> Yes, please do. From the above explanation, it seems like we dont need 
> to explicity set it again ourselves for format change.
> 
>>

I have a basic doubt about the split between dpu_plane_atomic_check Vs 
dpu_crtc_atomic_check() because the next patch is also relying heavily 
on the fact that plane's atomic check comes first and then crtc.

Please help me understand this better.

-> dpu_plane_virtual_atomic_check() is called and today that doesnt seem 
to do much :

	- marks visible as false if there is no fb
	(wouldnt the DRM core already do this?)
	- caches the format
	(this part is used in the dpu_crtc_atomic_check())

-> dpu_crtc_atomic_check() gets called which calls 
dpu_crtc_assign_plane_resources() which finally reserves the SSPPs to 
back the planes

-> perform dpu_plane_atomic_check() on each of the planes on the CRTC by 
checking the planes attached to CRTC state

1) What would be wrong to continue using dpu_plane_atomic_check() 
instead of the newly created dpu_plane_virtual_atomic_check() to get the 
backing SSPPs because it seems we need to maintain lot of information in 
the dpu_plane_state to manage co-ordination between the two atomic 
checks? A big portion of even the next patch does that.

2) Even dpu_plane_atomic_check() /  dpu_plane_virtual_atomic_check() is 
called only for each plane in the CRTC state, so why all the movement to 
crtc's atomic_check()? I am missing the link here. Was it done only to 
move all resource allocation to CRTC ID?


