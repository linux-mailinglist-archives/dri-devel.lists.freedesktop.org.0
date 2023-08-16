Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23E77DB5F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 09:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84A910E28D;
	Wed, 16 Aug 2023 07:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D544910E28D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 07:51:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ba1e9b1fa9so96809121fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692172264; x=1692777064;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=u89h35VZUFU7oFhgg4xY+gsNp+JZwekwjFY4ath1SXw=;
 b=ucPP4NvcbQKXeey+xG4dHvX9kc7jTataZ+pT3fXEJBxZ2Z0q7xGxu94JfhsYASzi8R
 k3W2dBY9e7v06jdavSdV51TXULnKtq4azXOWEcs6ZOZDK9OUmY0MKA0gu3X23p833YWq
 +vZBmvT0hRa6OlgCw8eVzhfZNyjete+fn+Il9QgldGS6V8+SPpkDsA84RsgtvNyahRKg
 vH/0P97mkWos1nQnhead8NItNA6xLXTaX7ud/4j2HPV+1UVQe/ugJXRRYZWreAos6y4A
 57LWm+fRMed7PE4+iGJtzlWsaYTOWPuz1TkqpChAWg1iFAMB6pbEPDMi+oocuDYKPxIs
 cbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692172264; x=1692777064;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u89h35VZUFU7oFhgg4xY+gsNp+JZwekwjFY4ath1SXw=;
 b=jzobDMfpd7yMzeF6/6Q4diyCXzjbEgxwDBbT6J1FVMm2A6t51WyxqMIYoS7onvPoAS
 9d/2REX35YLph44Hl3cXjC0Npl5cfj6zr4yez+8fWMWwcDMb06kSvh+12bl2BVG8Kr0g
 DLXgeH48T2WMeKPMPExRTn+Y9cw9UxtHKsXJ6Fv/zhkeyU1nyYORwoR0BFBVy4IjyfqA
 /aLpXssIw8P6WRkQS24B8cTl7o2Kddv0urKFr6NuX1smtK4ktTeH3+BqWokv4DCtVI63
 8rPdfVNYNhGxwWN/iUar2cdNVYS9biwCIG8IT/btdksi8qIy4SFOC5MCep9HwZpMvkXS
 QoDA==
X-Gm-Message-State: AOJu0Yz2Zho8Vc37LCj3FsmZ7bmUQXrRV+4kpKGOhG1FRIphkCzfh7pK
 QnkCZncJmmsJhS7el1s0pkSvKQ==
X-Google-Smtp-Source: AGHT+IENpZDsmMPNtWMc+9x1g9K3gGcn34PsdnS7ZCTTU446wk+45iMOjBqyJ2731in2wO8fDKTUEw==
X-Received: by 2002:a05:6512:4005:b0:4f8:5e49:c613 with SMTP id
 br5-20020a056512400500b004f85e49c613mr1211979lfb.43.1692172263961; 
 Wed, 16 Aug 2023 00:51:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:60eb:1b42:890:194?
 ([2a01:e0a:982:cbb0:60eb:1b42:890:194])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a1c7209000000b003fe577eb8cbsm23033512wmc.44.2023.08.16.00.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 00:51:03 -0700 (PDT)
Message-ID: <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
Date: Wed, 16 Aug 2023 09:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US, fr
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: quic_parellan@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

On 14/08/2023 20:02, Abhinav Kumar wrote:
> Hi Neil
> 
> On 8/14/2023 1:01 AM, neil.armstrong@linaro.org wrote:
>> Hi Abhinav,
>>
>> On 10/08/2023 18:26, Abhinav Kumar wrote:
>>> Hi Neil
>>>
>>> On 8/3/2023 10:19 AM, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 7/31/2023 6:00 AM, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> On 26/07/2023 00:56, Jessica Zhang wrote:
>>>>>> Due to a recent introduction of the pre_enable_prev_first bridge flag [1],
>>>>>> the panel driver will be probed before the DSI is enabled, causing the
>>>>>> DCS commands to fail to send.
>>>>>>
>>>>>> Ensure that DSI is enabled before panel probe by setting the
>>>>>> prepare_prev_first flag for the panel.
>>>>>
>>>>> Well this is specific to MSM DSI driver, it's not related at all to the panel.
>>>>
>>>
>>> I dont fully agree this is a MSM DSI driver specific thing.
>>>
>>> If the panel can send its commands in its enable() callback, then this flag need not be set.
>>>
>>> When a panel sends its DCS commands in its pre_enable() callback, any DSI controller will need to be ON before that otherwise DCS commands cannot be sent.
>>>
>>> With this in mind, may I know why is this a MSM change and not a panel change?
>>>
>>> As per my discussion with Dmitry during the last sync up, we were aligned on this expectation.
>>
>> As of today, only the MSM DSI driver expects panels to have prepare_prev_first because it's the first
>> one calling pre_enable() before the DSI controller to be on, all other DSI drivers I know
>> still enables the DSI controller in mode_set() and thus can send commands in pre_enable() which
>> is a loose way to map the pre-video state for DSI panels...
>>
> 
> It looks like there are multiple panels already setting this flag so this panel will not be the first unless they were added to make those work with MSM (which seems unlikely)
> 
> panel-samsung-s6d7aa0.c:        ctx->panel.prepare_prev_first = true;
> panel-samsung-s6e3ha2.c:        ctx->panel.prepare_prev_first = true;
> panel-samsung-s6e63j0x03.c:     ctx->panel.prepare_prev_first = true;
> panel-samsung-s6e8aa0.c:        ctx->panel.prepare_prev_first = true;
> 
> This is where I would like to understand a bit that if the panel sends out the ON commands in enable() instead of pre_enable() then, this flag will not be needed. So its also depends on the panel side and thats why
> the bridge feeds of the panel's input in devm_drm_panel_bridge_add_typed()
> 
> bridge->pre_enable_prev_first = panel->prepare_prev_first;
> 
>> A panel driver should not depend on features of a DSI controller, which is the case here
>> with this patch. Today's expectation is to send DSI commands in pre_enable() then when enabled
>> expect to be in video mode when enable() is called.
>>
> 
> We are not depending on any feature as such. Any DSI controller , not just MSM's would need to be ON for DCS commands to be sent out in the panel's pre_enable() callback.
> 
> Its not true that MSM is the only driver powering on the DSI controller in pre_enable(). Even MTK seems to be doing that
> 
> mtk_dsi_bridge_atomic_pre_enable
> 
> So I assume any panel which sends out commands in pre_enable() will not work with MTK as well.

Sending HS commands will always work on any controller, it's all about LP commands.
The Samsung panels you listed only send HS commands so they can use prepare_prev_first
and work on any controllers.

None of the panels using LP commands uses prepare_prev_first:

$ grep prepare_prev_first `grep -l LPM drivers/gpu/drm/panel/panel-*`
$

Note that there's a smart move for VTDR6130 with the command mode introduced in 20230728011218.14630-1-parellan@quicinc.com,
in the way prepare_prev_first could only be set to true if command-mode is selected.
I'll accept that since it would be logical, video mode won't work anymore but by default
the panel would still work in command mode + prepare_prev_first.

> 
>> The main reason is because some DSI controllers cannot send LP commands after switching
>> to video mode (allwinner for example), so we must take this into account.
>>
>> For v6.6, I don't see other solutions than reverting 9e15123eca79 (reverting won't regress anything,
>> because now it regresses also other panels on MSM platforms) and try to find a proper solution for v6.7...
>>
> 
> No, I would prefer not to revert that. It will bring back special handling for the parade chip into MSM driver, something which I would prefer not to go back to. Powering on the DSI in modeset() was done only for the parade chip.

I understand, but this patch doesn't qualify as a fix for 9e15123eca79 and is too late to be merged in drm-misc-next for v6.6,
and since 9e15123eca79 actually breaks some support it should be reverted (+ deps) since we are late in the rc cycles.

It's not a fatality or the end of the world, but this is an indirect fix and not way all this should be fixed.
We already had the case for the lt9611 breakage, and it's the same case here.

Neil

> 
>> Neil
>>
>>>
>>> Thanks
>>>
>>> Abhinav
>>>
>>>> Hi Neil,
>>>>
>>>> I think there might be some confusion caused by the commit message -- instead of "enabled before panel probe", it should be "enabled before panel pre_enable()" as the panel on commands are sent during prepare(), which is matched to bridge pre_enable().
>>>>
>>>> IIRC the general rule is that the panel driver should set the prepare_prev_first flag if the on commands are sent during pre_enable(), so I'll keep the code change but correct the commit message if that's ok with you.
>>>>
>>>> Thanks,
>>>>
>>>
>>>> Jessica Zhang
>>>>
>>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>>> [1] commit 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
>>
>> It's not the right commit that cause regression here, it's :
>>
>> 9e15123eca79 drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset
>>
>>>>>>
>>>>>> Fixes: 2349183d32d8 ("drm/panel: add visionox vtdr6130 DSI panel driver")
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
>>>>>>   1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>> index bb0dfd86ea67..e1363e128e7e 100644
>>>>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>> @@ -296,6 +296,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>>>>>>       dsi->format = MIPI_DSI_FMT_RGB888;
>>>>>>       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
>>>>>>                 MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>>> +    ctx->panel.prepare_prev_first = true;
>>>>>>       drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>>>>>>                  DRM_MODE_CONNECTOR_DSI);
>>>>>>
>>>>>> ---
>>>>>> base-commit: 28a5c036b05fc5c935cc72d76abd3589825ea9cd
>>>>>> change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f
>>>>>>
>>>>>> Best regards,
>>>>>
>>

