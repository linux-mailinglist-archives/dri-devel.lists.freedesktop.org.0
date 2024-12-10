Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369C9EA371
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 01:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C5C10E2BD;
	Tue, 10 Dec 2024 00:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HXbGKIQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE2D10E2BD;
 Tue, 10 Dec 2024 00:12:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GpjpA018318;
 Tue, 10 Dec 2024 00:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tFAJm3a5+OgeIBuSRbyQMPfvVWvutbETEkOeu/rQ2Us=; b=HXbGKIQzFzDZ4X6I
 QTCPxXme9EofWgSBzvqxXrduto1ishWUJIB2G/IF2j3A8r9R1f/HzZ+WMZgIJvfK
 aivyVPzzyMncZOT0Cb3GmG4m+jaDxf5wx7wVPw6QMiu0b7mycnt3fQk0tc1lj5lB
 +fjED+o0FCzPSyZ7AH+2qs0B2QCGAWDoTZ/NZR43JE7M7E9B6pZRYSijz0TZyQ0m
 HPD02ICQo9KU8fzdgNWMvV0TJgwtPhLK+80TBVwdZsmJyp8oflU2yRUNkdwegLCF
 RhtHE72DNK9ks93a5vCRRtyq96a0oIq0Zavk/mEdKwdVdMpaHvB0XjmV3SEy0x9f
 XnGiOA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetpppj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 00:11:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA0Bc9B012333
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 00:11:38 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 16:11:35 -0800
Message-ID: <65f9b40f-3ed1-4842-8992-3be14137aada@quicinc.com>
Date: Mon, 9 Dec 2024 16:11:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Leonard Lausen <leonard@lausen.nl>,
 =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, Johan Hovold
 <johan+linaro@kernel.org>
References: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
 <9c42bbb1-bf6c-4323-95f9-0ac9e7426d0c@quicinc.com>
 <CAA8EJppMA-AREJata0MWHCDYC-7ra723zhC4Nu_xD59O0mX_Ag@mail.gmail.com>
 <a22262d5-f1e3-498b-a850-d377f29166f1@quicinc.com>
 <eysj65p526ice7taxh5c7whvyb4o4rnxnydgs6wz5ccnjh5mlj@z6xqdbqqy3lw>
 <8b3a4e0d-fcaf-4dcc-913d-1a4aa9546d53@quicinc.com>
 <CAA8EJpqOT9gWLL1PDMnwXHnKpySNhWwoz1XMxXM6aZJEuJg0Tg@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqOT9gWLL1PDMnwXHnKpySNhWwoz1XMxXM6aZJEuJg0Tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hMghoyiM2t_01X1CtFXebLe7cGYMWvF1
X-Proofpoint-ORIG-GUID: hMghoyiM2t_01X1CtFXebLe7cGYMWvF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090188
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



On 12/9/2024 4:07 PM, Dmitry Baryshkov wrote:
> On Tue, 10 Dec 2024 at 02:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/9/2024 3:51 PM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 09, 2024 at 03:36:29PM -0800, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 12/9/2024 1:55 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, 9 Dec 2024 at 21:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 12/9/2024 2:04 AM, Dmitry Baryshkov wrote:
>>>>>>> During suspend/resume process all connectors are explicitly disabled and
>>>>>>> then reenabled. However resume fails because of the connector_status check:
>>>>>>>
>>>>>>> [dpu error]connector not connected 3
>>>>>>> [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
>>>>>>>
>>>>>>> It doesn't make sense to check for the Writeback connected status (and
>>>>>>> other drivers don't perform such check), so drop the check.
>>>>>>>
>>>>>>> It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: move
>>>>>>> writeback's atomic_check to dpu_writeback.c"), since encoder's
>>>>>>> atomic_check() is called under a different conditions that the
>>>>>>> connector's atomic_check() (e.g. it is not called if there is no
>>>>>>> connected CRTC or if the corresponding connector is not a part of the
>>>>>>> new state).
>>>>>>>
>>>>>>> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
>>>>>>> Cc: stable@vger.kernel.org
>>>>>>> Reported-by: Leonard Lausen <leonard@lausen.nl>
>>>>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
>>>>>>> Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
>>>>>>> Reported-by: György Kurucz <me@kuruczgy.com>
>>>>>>> Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/
>>>>>>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>>>>>>> Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
>>>>>>> Tested-by: György Kurucz <me@kuruczgy.com>
>>>>>>> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
>>>>>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>> Leonard Lausen reported an issue with suspend/resume of the sc7180
>>>>>>> devices. Fix the WB atomic check, which caused the issue.
>>>>>>> ---
>>>>>>> Changes in v4:
>>>>>>> - Epanded commit message (Johan)
>>>>>>> - Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>> - Rebased on top of msm-fixes
>>>>>>> - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - Reworked the writeback to just drop the connector->status check.
>>>>>>> - Expanded commit message for the debugging patch.
>>>>>>> - Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
>>>>>>>      1 file changed, 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>>>>>> index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>>>>>> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>>>>>>>          if (!conn_state || !conn_state->connector) {
>>>>>>>                  DPU_ERROR("invalid connector state\n");
>>>>>>>                  return -EINVAL;
>>>>>>> -     } else if (conn_state->connector->status != connector_status_connected) {
>>>>>>> -             DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
>>>>>>> -             return -EINVAL;
>>>>>>>          }
>>>>>>
>>>>>> Can you please explain me about why the status was not already connected?
>>>>>>
>>>>>> In all the places I checked (unless I missed something), if the detect()
>>>>>> callback is not registered, the connector is assumed connected like below:
>>>>>>
>>>>>> 404     if (funcs->detect_ctx)
>>>>>> 405             ret = funcs->detect_ctx(connector, ctx, force);
>>>>>> 406     else if (connector->funcs->detect)
>>>>>> 407             ret = connector->funcs->detect(connector, force);
>>>>>> 408     else
>>>>>> 409             ret = connector_status_connected;
>>>>>>
>>>>>> We do not register .detect for WB as WB connector should be always
>>>>>> connected.
>>>>>>
>>>>>> What scenario or use-case is making the connector status to something
>>>>>> other than connected?
>>>>>>
>>>>>> The places which mark the connector as unknown seem to be covered by
>>>>>> warnings in drm_probe_helper.c but the bug report doesnt seem to be
>>>>>> hitting those.
>>>>>
>>>>> Because nobody asks for the getconnector on that connector. For
>>>>> example,drm_client_for_each_connector_iter() explicitly skips
>>>>> WRITEBACK connectors. So, drm_client_modeset_probe() also doesn't
>>>>> request ->fill_modes() on that connector.
>>>>>
>>>>> I'm almost sure that if somebody runs a `modetest -ac` on the
>>>>> unpatched kernel after boot, there will be no suspend-related issues.
>>>>> In fact, I've just checked on RB5.
>>>>> /sys/class/drm/card0-Writeback-1/status reports 'unknown' before and
>>>>> 'connected' afterwards. You can easily replicate that on your
>>>>> hardware.
>>>>>
>>>>
>>>> Yes this is correct, I just checked on sc7180.
>>>>
>>>> It stays at unknown till we run IGT. This matches your explanation
>>>> perfectly.
>>>>
>>>>>>
>>>>>> I am wondering if there is some case in fwk resetting this to unknown
>>>>>> silently (which is incorrect) and perhaps other drivers dont hit this as
>>>>>> there is a .detect registered which always returns connected and MSM
>>>>>> should follow that.
>>>>>>
>>>>>> 111 static enum drm_connector_status
>>>>>> 112 komeda_wb_connector_detect(struct drm_connector *connector, bool force)
>>>>>> 113 {
>>>>>> 114     return connector_status_connected;
>>>>>> 115 }
>>>>>> 116
>>>>>
>>>>> No, that won't help. You can add a detect() callback and verify that
>>>>> simply isn't getting called. It's not resetting the connector->status,
>>>>> it's nobody setting it for the first time.
>>>>>
>>>>
>>>> What we found is that drm_atomic_helper_suspend() which calls
>>>> drm_atomic_helper_duplicate_state(), uses drm_for_each_connector_iter()
>>>> which does not rely on the last atomic state but actually uses the
>>>> config->connector_list which in-turn disables all connectors including WB.
>>>>
>>>> Is this expected that even though WB was not really there in the last
>>>> atomic_state before the suspend, still ended up suspending / resuming and
>>>> thus exposing this bug?
>>>
>>> Note, atomic_state is a "patch", not a full state. Thus the described
>>> behaviour is expected: it walks over all connectors and checks their
>>> drm_connector_state information. Some of the connectors (if they were
>>> not touched by the commit) might have been skipped from the last
>>> drm_atomic_state structure.
>>>
>>
>> Yes, I understand the patched part. So what i meant was, we observed
>> that CLIENT_CAP_WRITEBACK was never set which means WB was never exposed
>> as a connector so it could not have been part of any commits. IOW, it
>> would have never been enabled. In that case, is it still right to
>> disable WB connector and enable it again considering that it could not
>> have been enabled at any point before this.
> 
> ... to disable WB connector on suspend and restore its state on resume ...
> 
> Yes, it's correct behaviour. It requires less clumsy code and less
> special cases compared to using some other euristics in order to
> select, which connector was ever enabled.
> 

Acked..it will be harder to track this for sure, I am fine with this now

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

FWIW, we retested kms_writeback with this and it still works as well.

>>
>>>>
>>>> I am  now more convinced of this change as I understand the flow better. But
>>>> wanted to highlight above observation.
>>>>
>>>>>>>
>>>>>>>          crtc = conn_state->crtc;
>>>>>>>
>>>>>>> ---
>>>>>>> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
>>>>>>> change-id: 20240709-dpu-fix-wb-6cd57e3eb182
>>>>>>>
>>>>>>> Best regards,
>>>>>
>>>>>
>>>>>
>>>
> 
> 
> 
