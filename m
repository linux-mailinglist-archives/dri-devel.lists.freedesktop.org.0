Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A86788ED1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 20:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBD510E14B;
	Fri, 25 Aug 2023 18:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F092410E14B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 18:38:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37PDqLbD012607; Fri, 25 Aug 2023 18:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0VReRN1N5x/WPlCXO6ei+ZSQ9KffN8nFcZopw4l1kuE=;
 b=LTXCdNvH/RspTTgTGXRk26qfmbC1ise7AiJF3mdqiomI+A+geh6ch5o6coQHtbjamHtX
 6gq8K5e7gmlw+syQDZVbdeH8BhK/59yPTS8tQuA+Vi1MPD9nAeggPn5gV4gNagLQF/0Y
 8I91YAGyQMCs8oM5+mbfy7NxKZ0VH3DMS8NkveHCewY4Jgovd88RVrh0B1z7j6J/dy+L
 lHv8Kkh9hLdBXDux3DfizlRUOtWZT4HMm5rbGZnKmci8NWmSbX7ry7QLbBUSL3FanQgn
 GfcFP24t/EBy4Zb45cmjHKQxudbzPrv3Y11Dwttuim7nyxOPGnrWUnzwuMDmzqg5b+2N 7A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3spmrhhnf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Aug 2023 18:37:50 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37PIbnOw020519
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Aug 2023 18:37:49 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 25 Aug
 2023 11:37:48 -0700
Message-ID: <54b37d60-61b1-e939-c71d-30aecad65598@quicinc.com>
Date: Fri, 25 Aug 2023 11:37:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>
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
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <76e76728-974e-46ff-8046-c61c54d07c76@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3VshZ4YUGIdsw7XqUte3vqcqO9rneSdW
X-Proofpoint-ORIG-GUID: 3VshZ4YUGIdsw7XqUte3vqcqO9rneSdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_16,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250167
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, quic_parellan@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/21/2023 3:01 AM, neil.armstrong@linaro.org wrote:
> Hi Maxime,
> 
> On 21/08/2023 10:17, Maxime Ripard wrote:
>> Hi,
>>
>> On Fri, Aug 18, 2023 at 10:25:48AM +0200, neil.armstrong@linaro.org 
>> wrote:
>>> On 17/08/2023 20:35, Dmitry Baryshkov wrote:
>>>> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
>>>>> Sending HS commands will always work on any controller, it's all
>>>>> about LP commands. The Samsung panels you listed only send HS
>>>>> commands so they can use prepare_prev_first and work on any
>>>>> controllers.
>>>>
>>>> I think there is some misunderstanding there, supported by the
>>>> description of the flag.
>>>>
>>>> If I remember correctly, some hosts (sunxi) can not send DCS
>>>> commands after enabling video stream and switching to HS mode, see
>>>> [1]. Thus, as you know, most of the drivers have all DSI panel setup
>>>> commands in drm_panel_funcs::prepare() /
>>>> drm_bridge_funcs::pre_enable() callbacks, not paying attention
>>>> whether these commands are to be sent in LP or in HS mode.
>>>>
>>>> Previously DSI source drivers could power on the DSI link either in
>>>> mode_set() or in pre_enable() callbacks, with mode_set() being the
>>>> hack to make panel/bridge drivers to be able to send commands from
>>>> their prepare() / pre_enable() callbacks.
>>>>
>>>> With the prev_first flags being introduced, we have established that
>>>> DSI link should be enabled in DSI host's pre_enable() callback and
>>>> switched to HS mode (be it command or video) in the enable()
>>>> callback.
>>>>
>>>> So far so good.
>>>
>>> It seems coherent, I would like first to have a state of all DSI host
>>> drivers and make this would actually work first before adding the
>>> prev_first flag to all the required panels.
>>
>> This is definitely what we should do in an ideal world, but at least for
>> sunxi there's no easy way for it at the moment. There's no documentation
>> for it and the driver provided doesn't allow this to happen.
>>
>> Note that I'm not trying to discourage you or something here, I'm simply
>> pointing out that this will be something that we will have to take into
>> account. And it's possible that other drivers are in a similar
>> situation.
>>
>>>> Unfortunately this change is not fully backwards-compatible. This
>>>> requires that all DSI panels sending commands from prepare() should
>>>> have the prepare_prev_first flag. In some sense, all such patches
>>>> might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first
>>>> flag to drm_panel").
>>>
>>> This kind of migration should be done *before* any possible
>>> regression, not the other way round.
>>>
>>> If all panels sending commands from prepare() should have the
>>> prepare_prev_first flag, then it should be first, check for
>>> regressions then continue.
>>>
>>> <snip>
>>>
>>>>>
>>>>> I understand, but this patch doesn't qualify as a fix for
>>>>> 9e15123eca79 and is too late to be merged in drm-misc-next for
>>>>> v6.6, and since 9e15123eca79 actually breaks some support it
>>>>> should be reverted (+ deps) since we are late in the rc cycles.
>>>>
>>>> If we go this way, we can never reapply these patches. There will be
>>>> no guarantee that all panel drivers are completely converted. We
>>>> already have a story without an observable end -
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>>>
>>> I don't understand this point, who would block re-applying the patches ?
>>>
>>> The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over multiple
>>> Linux version and went smoothly because we reverted regressing patches
>>> and restarted when needed, I don't understand why we can't do this
>>> here aswell.
>>>
>>>> I'd consider that the DSI driver is correct here and it is about the
>>>> panel drivers that require fixes patches. If you care about the
>>>> particular Fixes tag, I have provided one several lines above.
>>>
>>> Unfortunately it should be done in the other way round, prepare for
>>> migration, then migrate,
>>>
>>> I mean if it's a required migration, then it should be done and I'll
>>> support it from both bridge and panel PoV.
>>>
>>> So, first this patch has the wrong Fixes tag, and I would like a
>>> better explanation on the commit message in any case. Then I would
>>> like to have an ack from some drm-misc maintainers before applying it
>>> because it fixes a patch that was sent via the msm tree thus per the
>>> drm-misc rules I cannot apply it via the drm-misc-next-fixes tree.
>>
>> Sorry, it's not clear to me what you'd like our feedback on exactly?
> 
> So let me resume the situation:
> 
> - pre_enable_prev_first was introduced in [1]
> - some panels made use of pre_enable_prev_first
> - Visionox VTDR6130 was enabled on SM8550 systems and works on v6.5 
> kernels and before
> - patch [2] was introduced on MSM DRM tree, breaking VTDR6130 on SM8550 
> systems (and probably other Video mode panels on Qcom platforms)
> - this fix was sent late, and is now too late to be merged via 
> drm-misc-next

Hi Neil and Maxime,

I agree with Neil that 9e15123eca79 was the commit that introduced the 
issue (since it changed the MSM DSI host behavior).

However, I'm not too keen on simply reverting that patch because

1) it's not wrong to have the dsi_power_on in pre_enable. Arguably, it 
actually makes more sense to power on DSI host in pre_enable than in 
modeset (since modeset is meant for setting the bridge mode), and

2) I think it would be good practice to keep specific bridge chip checks 
out of the DSI host driver.


That being said, what do you think about setting the default value of 
prepare_prev_first to true (possibly in panel_bridge_attach)?

It seems to me that most panel drivers send DCS commands during 
pre_enable, so maybe it would make more sense to power on DSI host 
before panel enable() by default. Any panel that needs DSI host to be 
powered on later could then explicitly set the flag to false in their 
respective drivers.

Thanks,

Jessica Zhang


> 
> I do not consider it's the right way to fix regression caused by [2]
> I consider [2] should be reverted, panels migrated to 
> pre_enable_prev_first when needed, tested and the [2] applied again
> 
> I have no objection about [2] and it should be done widely over the 
> whole DSI controllers
> and DSI Video panels.
> 
> I also object about the Fixes tag of this patch, which is wrong, and 
> Dmitry considers [1]
> should be used but it's even more wrong since [2] really caused the 
> regression.
> 
> And if [2] was to correct one to use, it was pushed via the MSM tree so 
> it couldn't be
> applied via drm-misc-next-fixes, right ?
> 
> [1] 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter 
> bridge init order")
> [2] 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI 
> hosts at modeset")
> 
> Thanks,
> Neil
> 
>>
>> Maxime
> 
