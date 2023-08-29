Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE378CDB7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 22:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD1710E49A;
	Tue, 29 Aug 2023 20:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5F810E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 20:43:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TJVQ2v030011; Tue, 29 Aug 2023 20:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MaQsiNdOvymXFR2WoY1SLKICVk6JLya1RdGbuftlJgM=;
 b=CopjFO3Bhhzt20Kp/xkyRgUwXe0nyAMbTtkJS7wMkRQU+Cp28u4OHvdwXhboXhjVbEQs
 6orShZHHjEDRm5qefl8k5hIutMibbYMf2T2E5oZwcqs9iSFANeOI5cZb5hR3S1N4EC4W
 SzoQU+K6qtoFglzJyleXV8TneKDsdtM6w/dAUprvz+prAg/ZPmQSHNpEuVbZMPk2mt4A
 aSv3sakT+P1teLzk42cmzkaogcp3/3EsIBp9a+EHz7U92/5KIkp0eD57ngxtMh4O9068
 tuASwloHRCdIh/mH+kTEAc4phMHZ3ugUKFETS9BGkP1E5pKNscScfm6cW7uDSJjWzZ2O MQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssmcv8gb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 20:43:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37TKh5hi018689
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 20:43:05 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 13:43:04 -0700
Message-ID: <5ab2464e-a986-0f10-48c9-a32f653806e2@quicinc.com>
Date: Tue, 29 Aug 2023 13:43:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 <neil.armstrong@linaro.org>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
 <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
 <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
 <giimknikofbipipawfmrcjiar5qfyw3t7sqy3iewjahsm3ktkt@qcn4g23zfcnj>
 <76e76728-974e-46ff-8046-c61c54d07c76@linaro.org>
 <54b37d60-61b1-e939-c71d-30aecad65598@quicinc.com>
 <0cb96702-b396-4223-870f-b798d32991ee@linaro.org>
 <CAPY8ntDf+sD-2mtLBxfrMKQiW5YYi6cfmCe2Sm8CYK9kO3W+nQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAPY8ntDf+sD-2mtLBxfrMKQiW5YYi6cfmCe2Sm8CYK9kO3W+nQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JZ5vsnNlk9310rjgkj97-HTuENeXGNmK
X-Proofpoint-GUID: JZ5vsnNlk9310rjgkj97-HTuENeXGNmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_14,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290180
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
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_parellan@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave

Nice to e-meet you.

On 8/29/2023 7:13 AM, Dave Stevenson wrote:
> Hi Neil
> 
> On Mon, 28 Aug 2023 at 09:49, <neil.armstrong@linaro.org> wrote:
>>
>> Hi Jessica,
>>
>> On 25/08/2023 20:37, Jessica Zhang wrote:
>>>
>>>
>>> On 8/21/2023 3:01 AM, neil.armstrong@linaro.org wrote:
>>>> Hi Maxime,
>>>>
>>>> On 21/08/2023 10:17, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Fri, Aug 18, 2023 at 10:25:48AM +0200, neil.armstrong@linaro.org wrote:
>>>>>> On 17/08/2023 20:35, Dmitry Baryshkov wrote:
>>>>>>> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
>>>>>>>> Sending HS commands will always work on any controller, it's all
>>>>>>>> about LP commands. The Samsung panels you listed only send HS
>>>>>>>> commands so they can use prepare_prev_first and work on any
>>>>>>>> controllers.
>>>>>>>
>>>>>>> I think there is some misunderstanding there, supported by the
>>>>>>> description of the flag.
>>>>>>>
>>>>>>> If I remember correctly, some hosts (sunxi) can not send DCS
>>>>>>> commands after enabling video stream and switching to HS mode, see
>>>>>>> [1]. Thus, as you know, most of the drivers have all DSI panel setup
>>>>>>> commands in drm_panel_funcs::prepare() /
>>>>>>> drm_bridge_funcs::pre_enable() callbacks, not paying attention
>>>>>>> whether these commands are to be sent in LP or in HS mode.
>>>>>>>
>>>>>>> Previously DSI source drivers could power on the DSI link either in
>>>>>>> mode_set() or in pre_enable() callbacks, with mode_set() being the
>>>>>>> hack to make panel/bridge drivers to be able to send commands from
>>>>>>> their prepare() / pre_enable() callbacks.
>>>>>>>
>>>>>>> With the prev_first flags being introduced, we have established that
>>>>>>> DSI link should be enabled in DSI host's pre_enable() callback and
>>>>>>> switched to HS mode (be it command or video) in the enable()
>>>>>>> callback.
>>>>>>>
>>>>>>> So far so good.
>>>>>>
>>>>>> It seems coherent, I would like first to have a state of all DSI host
>>>>>> drivers and make this would actually work first before adding the
>>>>>> prev_first flag to all the required panels.
>>>>>
>>>>> This is definitely what we should do in an ideal world, but at least for
>>>>> sunxi there's no easy way for it at the moment. There's no documentation
>>>>> for it and the driver provided doesn't allow this to happen.
>>>>>
>>>>> Note that I'm not trying to discourage you or something here, I'm simply
>>>>> pointing out that this will be something that we will have to take into
>>>>> account. And it's possible that other drivers are in a similar
>>>>> situation.
>>>>>
>>>>>>> Unfortunately this change is not fully backwards-compatible. This
>>>>>>> requires that all DSI panels sending commands from prepare() should
>>>>>>> have the prepare_prev_first flag. In some sense, all such patches
>>>>>>> might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first
>>>>>>> flag to drm_panel").
>>>>>>
>>>>>> This kind of migration should be done *before* any possible
>>>>>> regression, not the other way round.
>>>>>>
>>>>>> If all panels sending commands from prepare() should have the
>>>>>> prepare_prev_first flag, then it should be first, check for
>>>>>> regressions then continue.
>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>>>
>>>>>>>> I understand, but this patch doesn't qualify as a fix for
>>>>>>>> 9e15123eca79 and is too late to be merged in drm-misc-next for
>>>>>>>> v6.6, and since 9e15123eca79 actually breaks some support it
>>>>>>>> should be reverted (+ deps) since we are late in the rc cycles.
>>>>>>>
>>>>>>> If we go this way, we can never reapply these patches. There will be
>>>>>>> no guarantee that all panel drivers are completely converted. We
>>>>>>> already have a story without an observable end -
>>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>>>>>>
>>>>>> I don't understand this point, who would block re-applying the patches ?
>>>>>>
>>>>>> The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over multiple
>>>>>> Linux version and went smoothly because we reverted regressing patches
>>>>>> and restarted when needed, I don't understand why we can't do this
>>>>>> here aswell.
>>>>>>
>>>>>>> I'd consider that the DSI driver is correct here and it is about the
>>>>>>> panel drivers that require fixes patches. If you care about the
>>>>>>> particular Fixes tag, I have provided one several lines above.
>>>>>>
>>>>>> Unfortunately it should be done in the other way round, prepare for
>>>>>> migration, then migrate,
>>>>>>
>>>>>> I mean if it's a required migration, then it should be done and I'll
>>>>>> support it from both bridge and panel PoV.
>>>>>>
>>>>>> So, first this patch has the wrong Fixes tag, and I would like a
>>>>>> better explanation on the commit message in any case. Then I would
>>>>>> like to have an ack from some drm-misc maintainers before applying it
>>>>>> because it fixes a patch that was sent via the msm tree thus per the
>>>>>> drm-misc rules I cannot apply it via the drm-misc-next-fixes tree.
>>>>>
>>>>> Sorry, it's not clear to me what you'd like our feedback on exactly?
>>>>
>>>> So let me resume the situation:
>>>>
>>>> - pre_enable_prev_first was introduced in [1]
>>>> - some panels made use of pre_enable_prev_first
>>>> - Visionox VTDR6130 was enabled on SM8550 systems and works on v6.5 kernels and before
>>>> - patch [2] was introduced on MSM DRM tree, breaking VTDR6130 on SM8550 systems (and probably other Video mode panels on Qcom platforms)
>>>> - this fix was sent late, and is now too late to be merged via drm-misc-next
>>>
>>> Hi Neil and Maxime,
>>>
>>> I agree with Neil that 9e15123eca79 was the commit that introduced the issue (since it changed the MSM DSI host behavior).
>>>
>>> However, I'm not too keen on simply reverting that patch because
>>>
>>> 1) it's not wrong to have the dsi_power_on in pre_enable. Arguably, it actually makes more sense to power on DSI host in pre_enable than in modeset (since modeset is meant for setting the bridge mode), and
>>
>> I never objected that, it's the right path to go.
>>
>>>
>>> 2) I think it would be good practice to keep specific bridge chip checks out of the DSI host driver.
>>
>> We discussed about a plan with Maxime and Dmitry about that, and it would require adding
>> a proper atomic panel API to handle a "negociation" with the host controller.
>>
>>>
>>>
>>> That being said, what do you think about setting the default value of prepare_prev_first to true (possibly in panel_bridge_attach)?
>>
>> As Dmitry pointed, all panels sending LP commands in pre_enable() should have prepare_prev_first to true.
> 
> Any panel wishing the clock and data lanes to be in a defined LP-11
> state before pre_enable() is called need to set prepare_prev_first to
> true. This is not a universal requirement of all DSI peripherals for
> which commands are sent from pre_enable - a number will happily power
> up at LP-00.
> It is true that no harm will occur on those devices that do support
> non-LP-11 power up if the host is in LP-11, so a blanket setting of
> the flag for any panel driver sending DSI commands in pre_enable
> should be safe.
> 
> It is documented [1] that transfer can be called at any time,
> regardless of the state of the host. The MSM driver isn't supporting
> that, hence issues.
> [2] further clarifies that it is expected to power up the host
> controller, send the message, and power down again.
> 
> [1] https://github.com/torvalds/linux/blob/master/include/drm/drm_mipi_dsi.h#L84-L87
> [2] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_bridge.c#L185-L188
> 

This is very good information. Its not that MSM driver isn't supporting 
that, there seems to be a check to fail the transfer if the host is not 
powered on:

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/dsi/dsi_host.c#L1629

That was the error we were hitting.

This condition has been there since ages. I will need to investigate 
what happens if we relax this condition. Will check it up.

That being said, the documentation seems a bit non-specific. Yes, it 
tells us that transfer can be called even before pre_enable but its not 
just about this API right.

When we are powering on the peripheral, it usually has a sequence to follow.

So something like goto LP11 ---> send the ON commands ---> start video 
stream etc

The documentation is talking about a "generic" call to .transfer and 
that it should handle it but the ON sequence of a peripheral clearly 
follows a sequence which needs the host to be powered on first and we 
cannot immediately turn it OFF as the documentation says as that will 
put the lanes in LP00 or even undefined state and confuse the peripheral.

Now the discussion is revolving more around how to handle the 
pre_enable_prev_first in the DSI ON cases.

>>>
>>> It seems to me that most panel drivers send DCS commands during pre_enable, so maybe it would make more sense to power on DSI host before panel enable() by default. Any panel that needs DSI host to be powered on later could then explicitly set the flag to false in their respective drivers.
>>
>> A proper migration should be done, yes, but not as a fix on top of v6.5.
> 
> I looked at this when adding prepare_prev_first, but as the DSI
> control path is separate from the bridge chain there's no obvious way
> to automatically set a bridge flag from the mipi_dsi registration.
> 

Since there is documentation in the DSI spec about the peripheral 
expecting LP11 state and we agree its no harm, would something like 
below be incorrect?

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 9316384b4474..2b38388d4e56 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -416,7 +416,10 @@ struct drm_bridge 
*devm_drm_panel_bridge_add_typed(struct device *dev,
                 return bridge;
         }

-       bridge->pre_enable_prev_first = panel->prepare_prev_first;
+       if (connector_type == DRM_MODE_CONNECTOR_DSI)
+               bridge->pre_enable_prev_first = true;
+       else
+               bridge->pre_enable_prev_first = panel->prepare_prev_first;

         *ptr = bridge;
         devres_add(dev, ptr);



>    Dave
> 
>> Neil
>>
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>
>>>>
>>>> I do not consider it's the right way to fix regression caused by [2]
>>>> I consider [2] should be reverted, panels migrated to pre_enable_prev_first when needed, tested and the [2] applied again
>>>>
>>>> I have no objection about [2] and it should be done widely over the whole DSI controllers
>>>> and DSI Video panels.
>>>>
>>>> I also object about the Fixes tag of this patch, which is wrong, and Dmitry considers [1]
>>>> should be used but it's even more wrong since [2] really caused the regression.
>>>>
>>>> And if [2] was to correct one to use, it was pushed via the MSM tree so it couldn't be
>>>> applied via drm-misc-next-fixes, right ?
>>>>
>>>> [1] 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
>>>> [2] 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
>>>>
>>>> Thanks,
>>>> Neil
>>>>
>>>>>
>>>>> Maxime
>>>>
>>
