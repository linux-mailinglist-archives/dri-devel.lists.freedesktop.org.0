Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2731378071A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 10:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08BA10E47E;
	Fri, 18 Aug 2023 08:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6A110E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 08:25:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fea0640d88so6334905e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 01:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692347152; x=1692951952;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=P94G+aGtqWqzp7JQVW55iVN3o77kNsr2r3KDiAceVkY=;
 b=qDF12JnMRPZYLFEG68a2swDvXax4/q83Hcu0/wjWG4x2q9+yy14DhBYzZ/2k1VEWnw
 eb+m7WyOPxXKs+UgwvK+bpq501HaMs2ATbC9Wpaatf0Pkk38OjiFCVFPp1b7LziR5+gN
 TNG8iQ5MCu+G0vmKc6LXxy0c7dWQA6ZksA+ryWzk0H6ATsEWxvM6Wu190NVtT0JBIOIC
 HYqr4z5yLXFN1Cxa7w4i+pg8/S9wo6u3rmKjfTgwYYRHFVIhtT3U1YMXrIpq1yNiuUkD
 OuJF/4XPw09TJ3Sqxod7ucYKZY6UY3659oD5rXpaNnv9YGugIXVnP1wVI7NdyGyiiwJn
 Eczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692347152; x=1692951952;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P94G+aGtqWqzp7JQVW55iVN3o77kNsr2r3KDiAceVkY=;
 b=F7YIzH5lPSRYMVT70X20GOUdhgrweIYRmObqYGbyrvfQ9c0QSOBUVmM5pxChUmHwBO
 OApKmioY5VKSxlQkhdGnmunf3ZRpYPqNYk3sEvyIUEFenrWZNbBS6wUKgD8N5d6f8UBt
 ROk2wB1xtW+uwpKJl/qJTtIGjJ7vr4McgS5ILmhYg95y0qE55ESDR0odG3FO9aRR2wcr
 NYdjSagKxpihHUf5dtu5m2LS7Hzs9nuazuyhdO+coHXuz5/nLm5M3fERXVg70gSobpSu
 nn/rKc1gM55HtHgPZzjssH+WNdOcu+weoAqaPXadx1ZkXdASFUTIFwe0+6PaqrPKCNsS
 cI1g==
X-Gm-Message-State: AOJu0Yxw5B4qY+0jWZ+ixplsiWlUD4Ls6QMwV11SXYreZygIz8Bt6raT
 E+Lw4EHBZQ9ocr3QROZ0ipBJaQ==
X-Google-Smtp-Source: AGHT+IHiGuRAdkMZLvWSmTmWtiKwEOeQJsA+zLM1gbXkZTLmP+ZCpLbwuWawN0pefdMRH4VCdJpGBw==
X-Received: by 2002:adf:e48c:0:b0:317:2574:c2b1 with SMTP id
 i12-20020adfe48c000000b003172574c2b1mr1567864wrm.30.1692347151897; 
 Fri, 18 Aug 2023 01:25:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b9f6:39b9:fff4:e741?
 ([2a01:e0a:982:cbb0:b9f6:39b9:fff4:e741])
 by smtp.gmail.com with ESMTPSA id
 s12-20020adfeccc000000b00317b5c8a4f1sm1968862wro.60.2023.08.18.01.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 01:25:51 -0700 (PDT)
Message-ID: <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
Date: Fri, 18 Aug 2023 10:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
 <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
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
In-Reply-To: <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Dmitry,

On 17/08/2023 20:35, Dmitry Baryshkov wrote:
> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
>> Hi Abhinav,
>>
>> On 14/08/2023 20:02, Abhinav Kumar wrote:

<snip>

>>
>> Sending HS commands will always work on any controller, it's all about LP commands.
>> The Samsung panels you listed only send HS commands so they can use prepare_prev_first
>> and work on any controllers.
> 
> I think there is some misunderstanding there, supported by the description of the flag.
> 
> If I remember correctly, some hosts (sunxi) can not send DCS commands after enabling video stream and switching to HS mode, see [1]. Thus, as you know, most of the drivers have all DSI panel setup commands in drm_panel_funcs::prepare() / drm_bridge_funcs::pre_enable() callbacks, not paying attention whether these commands are to be sent in LP or in HS mode.
> 
> Previously DSI source drivers could power on the DSI link either in mode_set() or in pre_enable() callbacks, with mode_set() being the hack to make panel/bridge drivers to be able to send commands from their prepare() / pre_enable() callbacks.
> 
> With the prev_first flags being introduced, we have established that DSI link should be enabled in DSI host's pre_enable() callback and switched to HS mode (be it command or video) in the enable() callback.
> 
> So far so good.

It seems coherent, I would like first to have a state of all DSI host drivers and make this would actually work first before adding the prev_first flag to all the required panels.

> 
> Unfortunately this change is not fully backwards-compatible. This requires that all DSI panels sending commands from prepare() should have the prepare_prev_first flag. In some sense, all such patches might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel").

This kind of migration should be done *before* any possible regression, not the other way round.

If all panels sending commands from prepare() should have the prepare_prev_first flag, then it should be first, check for regressions then continue.

<snip>

>>
>> I understand, but this patch doesn't qualify as a fix for 9e15123eca79 and is too late to be merged in drm-misc-next for v6.6,
>> and since 9e15123eca79 actually breaks some support it should be reverted (+ deps) since we are late in the rc cycles.
> 
> If we go this way, we can never reapply these patches. There will be no guarantee that all panel drivers are completely converted. We already have a story without an observable end - DRM_BRIDGE_ATTACH_NO_CONNECTOR.

I don't understand this point, who would block re-applying the patches ?

The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over multiple Linux version and went smoothly because we reverted
regressing patches and restarted when needed, I don't understand why we can't do this here aswell.

> 
> I'd consider that the DSI driver is correct here and it is about the panel drivers that require fixes patches. If you care about the particular Fixes tag, I have provided one several lines above.

Unfortunately it should be done in the other way round, prepare for migration, then migrate,

I mean if it's a required migration, then it should be done and I'll support it from both bridge and panel PoV.

So, first this patch has the wrong Fixes tag, and I would like a better explanation on the commit message in any case.
Then I would like to have an ack from some drm-misc maintainers before applying it because it fixes a patch that
was sent via the msm tree thus per the drm-misc rules I cannot apply it via the drm-misc-next-fixes tree.

Neil

<snip>

