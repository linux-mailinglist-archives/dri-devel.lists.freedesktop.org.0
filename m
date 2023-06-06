Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D1724E31
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AD110E3BD;
	Tue,  6 Jun 2023 20:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E5910E3C7;
 Tue,  6 Jun 2023 20:36:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356JMYTI031608; Tue, 6 Jun 2023 20:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nIXCfbY+N4bgA3JgPdpuMsnhcQ/xO+DVIepsN79Nd1g=;
 b=cWbEHA/ahrRitslRqOh9bzs5tTbOLeP6olErOKUKiuWik/yuIktMbLLzr2NNWMpkbWND
 kcI1H7BIBzMsb59kW1wWDoAi3ZpHlNFYoheuf9s8mrqD85Id5OF2omM0kJ7O5PU1OuZK
 zfBw26fdPWRuqXc9YKZchgsxUIb9Dwyp10FsNuvoFVY/uc4xoFuvLUG6B7ffn8Yp0EcR
 QzPbwf73LIIJxZd/o2IKh9w7fWpSOhVbp4DwYeKdrbmX6cLv1C9HvELZNox+cUTmt4ZH
 KM5Y9KSsrtlzoDvvkJaXSdxTkJq5w3hkg3hf/QP3OQURhofyxsH1twAyz0B0wJUuwcU1 sA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a72075x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 20:36:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356KaQAg012661
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 20:36:26 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 13:36:25 -0700
Message-ID: <34f18541-29d7-c3bd-2973-0deb1f6b0a2d@quicinc.com>
Date: Tue, 6 Jun 2023 13:36:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 04/13] drm/msm/dpu: remove unused
 fields from dpu_encoder_virt
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-5-dmitry.baryshkov@linaro.org>
 <94d7d0bf-ad61-628b-f10e-2d676ebe3838@quicinc.com>
 <5bcbee05-5468-d853-df48-82bf3ae448d8@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5bcbee05-5468-d853-df48-82bf3ae448d8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mBKgGMujej0qNF5WGjTaPzhwI2XSvg9i
X-Proofpoint-GUID: mBKgGMujej0qNF5WGjTaPzhwI2XSvg9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_15,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306060175
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



On 6/6/2023 1:29 PM, Dmitry Baryshkov wrote:
> On 06/06/2023 23:25, Abhinav Kumar wrote:
>>
>>
>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>> Remove historical fields intfs_swapped and topology fields from struct
>>> dpu_encoder_virt and also remove even more historical docs.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
>>>   1 file changed, 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 28729c77364f..4ee708264f3b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -130,18 +130,12 @@ enum dpu_enc_rc_states {
>>>    *            pingpong blocks can be different than num_phys_encs.
>>>    * @hw_dsc:        Handle to the DSC blocks used for the display.
>>>    * @dsc_mask:        Bitmask of used DSC blocks.
>>> - * @intfs_swapped:    Whether or not the phys_enc interfaces have 
>>> been swapped
>>> - *            for partial update right-only cases, such as pingpong
>>> - *            split where virtual pingpong does not generate IRQs
>>>    * @crtc:        Pointer to the currently assigned crtc. Normally you
>>>    *            would use crtc->state->encoder_mask to determine the
>>>    *            link between encoder/crtc. However in this case we need
>>>    *            to track crtc in the disable() hook which is called
>>>    *            _after_ encoder_mask is cleared.
>>>    * @connector:        If a mode is set, cached pointer to the 
>>> active connector
>>> - * @crtc_kickoff_cb:        Callback into CRTC that will flush & start
>>> - *                all CTL paths
>>> - * @crtc_kickoff_cb_data:    Opaque user data given to crtc_kickoff_cb
>>
>> no concerns with the above 3
>>
>>>    * @enc_lock:            Lock around physical encoder
>>>    *                create/destroy/enable/disable
>>>    * @frame_busy_mask:        Bitmask tracking which phys_enc we are 
>>> still
>>> @@ -160,7 +154,6 @@ enum dpu_enc_rc_states {
>>>    * @delayed_off_work:        delayed worker to schedule disabling of
>>>    *                clks and resources after IDLE_TIMEOUT time.
>>>    * @vsync_event_work:        worker to handle vsync event for 
>>> autorefresh
>>> - * @topology:                   topology of the display
>>
>> As we are still going to go ahead with encoder based allocation for 
>> now, we should keep this topology and start using it for DP DSC's 
>> 1:1:1 topology.
> 
> It is currently unused, so it can be dropped. Your patchset would have 
> to reintroduce it.
> 

Ok same old argument which I tend to always lose. We will add it back 
with DP DSC.

> And I'm still not happy about the encoder-based allocation. You 
> persuaded me that it is irrelevant for the wide planes. So I'd split it 
> and post the allocation patchset after the virtual-wide is fully 
> reviewed (when would come that blissful moment, btw?).
> 

Post the allocation with a compelling feature for us to be convinced.

The moment is happening as we speak :)

>>
>>>    * @idle_timeout:        idle timeout duration in milliseconds
>>>    * @wide_bus_en:        wide bus is enabled on this interface
>>>    * @dsc:            drm_dsc_config pointer, for DSC-enabled encoders
>>> @@ -180,8 +173,6 @@ struct dpu_encoder_virt {
>>>       unsigned int dsc_mask;
>>> -    bool intfs_swapped;
>>> -
>>>       struct drm_crtc *crtc;
>>>       struct drm_connector *connector;
>>> @@ -201,7 +192,6 @@ struct dpu_encoder_virt {
>>>       enum dpu_enc_rc_states rc_state;
>>>       struct delayed_work delayed_off_work;
>>>       struct kthread_work vsync_event_work;
>>> -    struct msm_display_topology topology;
>>>       u32 idle_timeout;
> 
