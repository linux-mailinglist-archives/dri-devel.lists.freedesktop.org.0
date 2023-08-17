Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA677FDEF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 20:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05DD10E179;
	Thu, 17 Aug 2023 18:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD0910E179
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 18:36:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c93638322so25566766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 11:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692297360; x=1692902160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WBS9wYJOGZO6RPvKwuPSgpbxq1EN3smSQy6tE1tHU9I=;
 b=ihKDwyrHEfcmDVEaCRMqs0Ajrw8F55LitLdqxwy2N7eopJvWP4Mo7LqFHPdj+zaOaa
 XivVFM0hlogzJhfvsfQ3JVEHhNl90c4aXxBe/3voojVsINiXiLAgK9vzgZ/idkeqR6wo
 u8EJ/rh5VMIry61oYaKRsXJ+uIStmfn+IZ11fhdEpYM+r0WsP+RXnpt0nCgHTyGLhjLH
 fZp6G9d/TR/j2MRfG/PP6g2RoqkOwMVigOFXB4AqvO0pDzzEqQH7NqfSVkd9uScdQxcL
 sqfGAizSJZNi/7MB7XcYm9Mx/MgRIAG85T2XB0Dzkh1yuLcVnUEGN3JyfGzrx76miJwy
 1BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692297360; x=1692902160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WBS9wYJOGZO6RPvKwuPSgpbxq1EN3smSQy6tE1tHU9I=;
 b=UJkPjKzyBKke1bBchMqri3+DSC6FUguasZG+fwme4PyJTOFv2wmJs1hj0sw21dirIS
 CpaUkhNBXI8bxpQekoa9KOyg5j+vAabA3YgVuOtLR/CV0CDC13Z/bj0tRWV2Y9CWOnpS
 4TsItlRjNPHs/aLMxAidUe9+xaWEBek1/+5eQUOW51IlWXNA8r+FlhknbQYLLlxLTdw3
 pq2xpTBnVrfx1QUi62JgDA0B1/sBmXRTdzRu/cgTCChx2EDt2P6eD/5wuA7ajMXWa9X3
 n1VPkpb6/ONIaeiL2PNJLxgjjdwOb9DWHHwRJlrl7oVuT5Tmg2prtSIlBN8HbX2OUsAo
 YD2Q==
X-Gm-Message-State: AOJu0YxYabe7T0/dqq4F2hLADXe//aBH4VMPfpoOJ+WqVhRz0afJ+vNc
 LZ3esOfzH7Xe2AlNMCeqX6ZtNspb76bnXNh3w8cuzA==
X-Google-Smtp-Source: AGHT+IEDIvCTrFdB1ShWf0WHc4tK5DUpGRm91TbCX7LMcZ3fR54EK9AHfY3CfFGlJE8wso5+ZjL5QQ==
X-Received: by 2002:a17:907:3da0:b0:978:2b56:d76e with SMTP id
 he32-20020a1709073da000b009782b56d76emr4071139ejc.12.1692297360461; 
 Thu, 17 Aug 2023 11:36:00 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a170906528800b009887f4e0291sm72247ejm.27.2023.08.17.11.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 11:35:59 -0700 (PDT)
Message-ID: <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
Date: Thu, 17 Aug 2023 21:35:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-GB
To: neil.armstrong@linaro.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: quic_parellan@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
> Hi Abhinav,
> 
> On 14/08/2023 20:02, Abhinav Kumar wrote:
>> Hi Neil
>>
>> On 8/14/2023 1:01 AM, neil.armstrong@linaro.org wrote:
>>> Hi Abhinav,
>>>
>>> On 10/08/2023 18:26, Abhinav Kumar wrote:
>>>> Hi Neil
>>>>
>>>> On 8/3/2023 10:19 AM, Jessica Zhang wrote:
>>>>>
>>>>>
>>>>> On 7/31/2023 6:00 AM, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 26/07/2023 00:56, Jessica Zhang wrote:
>>>>>>> Due to a recent introduction of the pre_enable_prev_first bridge 
>>>>>>> flag [1],
>>>>>>> the panel driver will be probed before the DSI is enabled, 
>>>>>>> causing the
>>>>>>> DCS commands to fail to send.
>>>>>>>
>>>>>>> Ensure that DSI is enabled before panel probe by setting the
>>>>>>> prepare_prev_first flag for the panel.
>>>>>>
>>>>>> Well this is specific to MSM DSI driver, it's not related at all 
>>>>>> to the panel.
>>>>>
>>>>
>>>> I dont fully agree this is a MSM DSI driver specific thing.
>>>>
>>>> If the panel can send its commands in its enable() callback, then 
>>>> this flag need not be set.
>>>>
>>>> When a panel sends its DCS commands in its pre_enable() callback, 
>>>> any DSI controller will need to be ON before that otherwise DCS 
>>>> commands cannot be sent.
>>>>
>>>> With this in mind, may I know why is this a MSM change and not a 
>>>> panel change?
>>>>
>>>> As per my discussion with Dmitry during the last sync up, we were 
>>>> aligned on this expectation.
>>>
>>> As of today, only the MSM DSI driver expects panels to have 
>>> prepare_prev_first because it's the first
>>> one calling pre_enable() before the DSI controller to be on, all 
>>> other DSI drivers I know
>>> still enables the DSI controller in mode_set() and thus can send 
>>> commands in pre_enable() which
>>> is a loose way to map the pre-video state for DSI panels...
>>>
>>
>> It looks like there are multiple panels already setting this flag so 
>> this panel will not be the first unless they were added to make those 
>> work with MSM (which seems unlikely)
>>
>> panel-samsung-s6d7aa0.c:        ctx->panel.prepare_prev_first = true;
>> panel-samsung-s6e3ha2.c:        ctx->panel.prepare_prev_first = true;
>> panel-samsung-s6e63j0x03.c:     ctx->panel.prepare_prev_first = true;
>> panel-samsung-s6e8aa0.c:        ctx->panel.prepare_prev_first = true;
>>
>> This is where I would like to understand a bit that if the panel sends 
>> out the ON commands in enable() instead of pre_enable() then, this 
>> flag will not be needed. So its also depends on the panel side and 
>> thats why
>> the bridge feeds of the panel's input in 
>> devm_drm_panel_bridge_add_typed()
>>
>> bridge->pre_enable_prev_first = panel->prepare_prev_first;
>>
>>> A panel driver should not depend on features of a DSI controller, 
>>> which is the case here
>>> with this patch. Today's expectation is to send DSI commands in 
>>> pre_enable() then when enabled
>>> expect to be in video mode when enable() is called.
>>>
>>
>> We are not depending on any feature as such. Any DSI controller , not 
>> just MSM's would need to be ON for DCS commands to be sent out in the 
>> panel's pre_enable() callback.
>>
>> Its not true that MSM is the only driver powering on the DSI 
>> controller in pre_enable(). Even MTK seems to be doing that
>>
>> mtk_dsi_bridge_atomic_pre_enable
>>
>> So I assume any panel which sends out commands in pre_enable() will 
>> not work with MTK as well.
> 
> Sending HS commands will always work on any controller, it's all about 
> LP commands.
> The Samsung panels you listed only send HS commands so they can use 
> prepare_prev_first
> and work on any controllers.

I think there is some misunderstanding there, supported by the 
description of the flag.

If I remember correctly, some hosts (sunxi) can not send DCS commands 
after enabling video stream and switching to HS mode, see [1]. Thus, as 
you know, most of the drivers have all DSI panel setup commands in 
drm_panel_funcs::prepare() / drm_bridge_funcs::pre_enable() callbacks, 
not paying attention whether these commands are to be sent in LP or in 
HS mode.

Previously DSI source drivers could power on the DSI link either in 
mode_set() or in pre_enable() callbacks, with mode_set() being the hack 
to make panel/bridge drivers to be able to send commands from their 
prepare() / pre_enable() callbacks.

With the prev_first flags being introduced, we have established that DSI 
link should be enabled in DSI host's pre_enable() callback and switched 
to HS mode (be it command or video) in the enable() callback.

So far so good.

Unfortunately this change is not fully backwards-compatible. This 
requires that all DSI panels sending commands from prepare() should have 
the prepare_prev_first flag. In some sense, all such patches might have 
Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel").


> None of the panels using LP commands uses prepare_prev_first:
> 
> $ grep prepare_prev_first `grep -l LPM drivers/gpu/drm/panel/panel-*`
> $
> 
> Note that there's a smart move for VTDR6130 with the command mode 
> introduced in 20230728011218.14630-1-parellan@quicinc.com,
> in the way prepare_prev_first could only be set to true if command-mode 
> is selected.
> I'll accept that since it would be logical, video mode won't work 
> anymore but by default
> the panel would still work in command mode + prepare_prev_first.
> 
>>
>>> The main reason is because some DSI controllers cannot send LP 
>>> commands after switching
>>> to video mode (allwinner for example), so we must take this into 
>>> account.
>>>
>>> For v6.6, I don't see other solutions than reverting 9e15123eca79 
>>> (reverting won't regress anything,
>>> because now it regresses also other panels on MSM platforms) and try 
>>> to find a proper solution for v6.7...
>>>
>>
>> No, I would prefer not to revert that. It will bring back special 
>> handling for the parade chip into MSM driver, something which I would 
>> prefer not to go back to. Powering on the DSI in modeset() was done 
>> only for the parade chip.
> 
> I understand, but this patch doesn't qualify as a fix for 9e15123eca79 
> and is too late to be merged in drm-misc-next for v6.6,
> and since 9e15123eca79 actually breaks some support it should be 
> reverted (+ deps) since we are late in the rc cycles.

If we go this way, we can never reapply these patches. There will be no 
guarantee that all panel drivers are completely converted. We already 
have a story without an observable end - DRM_BRIDGE_ATTACH_NO_CONNECTOR.

I'd consider that the DSI driver is correct here and it is about the 
panel drivers that require fixes patches. If you care about the 
particular Fixes tag, I have provided one several lines above.

> It's not a fatality or the end of the world, but this is an indirect fix 
> and not way all this should be fixed.

But why? It is the way all the panels are expected to be fixed: DSI 
commands in prepare() => prepare_prev_first flag.
And for the bridges, DSI commands in pre_enable() => 
pre_enable_prev_first flag.

> We already had the case for the lt9611 breakage, and it's the same case 
> here.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#n776




> 
> Neil
> 
>>
>>> Neil
>>>
>>>>
>>>> Thanks
>>>>
>>>> Abhinav
>>>>
>>>>> Hi Neil,
>>>>>
>>>>> I think there might be some confusion caused by the commit message 
>>>>> -- instead of "enabled before panel probe", it should be "enabled 
>>>>> before panel pre_enable()" as the panel on commands are sent during 
>>>>> prepare(), which is matched to bridge pre_enable().
>>>>>
>>>>> IIRC the general rule is that the panel driver should set the 
>>>>> prepare_prev_first flag if the on commands are sent during 
>>>>> pre_enable(), so I'll keep the code change but correct the commit 
>>>>> message if that's ok with you.
>>>>>
>>>>> Thanks,
>>>>>
>>>>
>>>>> Jessica Zhang
>>>>>
>>>>>>
>>>>>> Neil
>>>>>>
>>>>>>>
>>>>>>> [1] commit 4fb912e5e190 ("drm/bridge: Introduce 
>>>>>>> pre_enable_prev_first to alter bridge init order")
>>>
>>> It's not the right commit that cause regression here, it's :
>>>
>>> 9e15123eca79 drm/msm/dsi: Stop unconditionally powering up DSI hosts 
>>> at modeset

Regression was caused by 9e15123eca79. But the real source of the 
regression is 5ea6b1702781, which didn't update all panel drivers to 
follow the expected sequence.

>>>
>>>>>>>
>>>>>>> Fixes: 2349183d32d8 ("drm/panel: add visionox vtdr6130 DSI panel 
>>>>>>> driver")
>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
>>>>>>>   1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>>>>>>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>>> index bb0dfd86ea67..e1363e128e7e 100644
>>>>>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>>> @@ -296,6 +296,7 @@ static int visionox_vtdr6130_probe(struct 
>>>>>>> mipi_dsi_device *dsi)
>>>>>>>       dsi->format = MIPI_DSI_FMT_RGB888;
>>>>>>>       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>>>>>>> MIPI_DSI_MODE_NO_EOT_PACKET |
>>>>>>>                 MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>>>> +    ctx->panel.prepare_prev_first = true;
>>>>>>>       drm_panel_init(&ctx->panel, dev, 
>>>>>>> &visionox_vtdr6130_panel_funcs,
>>>>>>>                  DRM_MODE_CONNECTOR_DSI);
>>>>>>>
>>>>>>> ---
>>>>>>> base-commit: 28a5c036b05fc5c935cc72d76abd3589825ea9cd
>>>>>>> change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f
>>>>>>>
>>>>>>> Best regards,
>>>>>>
>>>
> 

-- 
With best wishes
Dmitry

