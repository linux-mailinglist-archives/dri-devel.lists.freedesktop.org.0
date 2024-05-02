Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32458B9558
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562DF10F474;
	Thu,  2 May 2024 07:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T1LsONvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A2910F474
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:34:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41c7ac73fddso34874995e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714635260; x=1715240060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9nnme5G8aKwETF1NnkE5a2PnON8OxSKOySsaYwxkktk=;
 b=T1LsONvkaJt8HMLvltnvdV2fSfxT7aBJQ3G+0bJHRGfIhmRx6NT2hpPsyK7OLIMsjO
 D7z2wPOyfxdyueug/rV39jCcQbblbn/PagrC/r9kEA90iqShn0foKwGmi1zDd+IPvEXn
 zl7umUO12m40Gi40dVMerRCByxU+g14FEqEw5EzJI9Csb6fjshw0siq13qtOdmLj/MiZ
 8czQD8eWAPziNLg8/5+WCRaI70SocHirdPjesxmoXUlKhuqREICEI5RGb7qEoI6cKpwV
 JO7/ymKOpqjGUzcQgmvmQWb/y01SfNloX0WVbc/d7QfujiX/GBUejkhFpH6JduzvwplM
 kwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714635260; x=1715240060;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9nnme5G8aKwETF1NnkE5a2PnON8OxSKOySsaYwxkktk=;
 b=ILOIlEjlon2Mez3eLVpIL0S00HxkOM78VurYQRYbAzuxpksHC8kCfYRieLOlY+QCoy
 h7yOI9jc39XTMCkEScBng6AGcsx1ZPI0+dMjSNuv2kpQuRe82wM0prqAd+unh62tiO7l
 STiklmTJoTqxHN8YUYyPQm+ScAm64ofTKnY3FObV79bxZIKNLvdwXTuimBCLyVd7LE0j
 jm6P/jWDumOmoqSt7i88FYl2pBJdxzQ+dVYxE95jMNiLnahCqROnL7t16oaZMXAv4Cut
 fnvsr6I9fwTwL391iOu0sIawlLWNISiq19yv+Xipto4OaMrx9LHGtolgIfYMAhv6SsgA
 99lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU4V56XnLFXUedSzb8Vi+GT/a99g/5p0ldtVnlS8GberlPuKuIE6iBsT2A6Mhnw9SmxOJy9ImBSMXES22xpnB4ergvOkNO+ZLvvi+3qq8I
X-Gm-Message-State: AOJu0YxZw29vIVTA2iZYvmKYizfsqPcEGf2PRAMm+ATcriXsSxhGXctB
 t225hM3l2UnjAdvbZL/S4K1dv/OuQvaIu2pJ27jc2uhMT0O4xHal/lqzK8irl24=
X-Google-Smtp-Source: AGHT+IHi1WoUYjNSiAZKw0550HKJl19GsqnsMgjJ1oLuqpkAgecLit2AZfAMGJgBFDYEaA0HoIrbog==
X-Received: by 2002:adf:e259:0:b0:34d:a650:46f8 with SMTP id
 bl25-20020adfe259000000b0034da65046f8mr3400530wrb.9.1714635260513; 
 Thu, 02 May 2024 00:34:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129?
 ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a5d6907000000b00349bd105089sm546582wru.47.2024.05.02.00.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:34:20 -0700 (PDT)
Message-ID: <75a89efb-f653-4185-a451-ef496dffd804@linaro.org>
Date: Thu, 2 May 2024 09:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
To: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
 <20240426-married-augmented-mantis-ff7edd@penduick>
 <509b3822-dcf6-45eb-9516-ba8ff2cc4382@linux.dev>
 <20240429-bouncy-attentive-vole-9964f1@houat>
 <795bec5d-c7ba-4fc2-9be9-78c4063743d9@linux.dev>
 <20240430-unnatural-steel-spaniel-dbacef@houat>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20240430-unnatural-steel-spaniel-dbacef@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/04/2024 11:34, Maxime Ripard wrote:
> On Tue, Apr 30, 2024 at 12:54:39AM +0800, Sui Jingfeng wrote:
>> On 2024/4/29 19:55, Maxime Ripard wrote:
>>> On Sat, Apr 27, 2024 at 01:57:46PM +0800, Sui Jingfeng wrote:
>>>> On 2024/4/26 14:23, Maxime Ripard wrote:
>>>>> On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
>>>>>> On 2024/4/26 03:10, Andy Shevchenko wrote:
>>>>>>> On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
>>>>>>>> On 2024/4/25 22:26, Andy Shevchenko wrote:
>>>>>>>>> It seems driver missed the point of proper use of device property APIs.
>>>>>>>>> Correct this by updating headers and calls respectively.
>>>>>>>> You are using the 'seems' here exactly saying that you are not 100% sure.
>>>>>>>>
>>>>>>>> Please allow me to tell you the truth: This patch again has ZERO effect.
>>>>>>>> It fix nothing. And this patch is has the risks to be wrong.
>>>>>>> Huh?! Really, stop commenting the stuff you do not understand.
>>>>>> I'm actually a professional display drivers developer at the downstream
>>>>>> in the past, despite my contribution to upstream is less. But I believe
>>>>>> that all panel driver developers know what I'm talking about. So please
>>>>>> have take a look at my replies.
>>>>> Most of the interactions you had in this series has been uncalled for.
>>>>> You might be against a patch, but there's no need to go to such length.
>>>>>
>>>>> As far as I'm concerned, this patch is fine to me in itself, and I don't
>>>>> see anything that would prevent us from merging it.
>>>> No one is preventing you, as long as don't misunderstanding what other
>>>> people's technical replies intentionally. I'm just a usual and normal
>>>> contributor, I hope the world will better than yesterday.
>>> You should seriously consider your tone when replying then.
>>>
>>>> Saying such thing to me may not proper, I guess you may want to talk
>>>> to peoples who has the push rights
>>> I think you misunderstood me. My point was that your several rants were
>>> uncalled for and aren't the kind of things we're doing here.
>>>
>>> I know very well how to get a patch merged, thanks.
>>>
>>>> just make sure it isn't a insult to the professionalism of drm bridge
>>>> community itself though.
>>> I'm not sure why you're bringing the bridge community or its
>>> professionalism. It's a panel, not a bridge, and I never doubted the
>>> professionalism of anyone.
>>
>>
>> I means that the code itself could be adopted, as newer and younger
>> programmer (like Andy) need to be encouraged to contribute.
> 
> Andy has thousands of commits in Linux. He's *very* far from being a new
> contributor.
> 
>> I express no obvious objections, just hints him that something else
>> probably should also be taken into consideration as well.
> 
> That might be what you wanted to express, but you definitely didn't
> express it that way.
> 
>> On the other hand, we probably should allow other people participate
>> in discussion so that it is sufficient discussed and ensure that it
>> won't be reverted by someone in the future for some reasons. Backing
>> to out case happens here, we may need to move things forward. Therefore,
>> it definitely deserve to have a try. It is not a big deal even though
>> it gets reverted someday.
>>
>> In the end, I don't mind if you think there is nothing that could
>> prevent you from merge it, but I still suggest you have a glance at
>> peoples siting at the Cc list. I'm busy now and I have a lot of other
>> tasks to do, and may not be able to reply you emails on time. So it up
>> to you and other maintainers to decide.
>> Thank you.
> 
> So far, you're the only one who reviewed those patches. I'm not sure
> what you're talking about here.

Well I (as drm-panel maintainer) did review them positively because the patches looked
perfectly correct in regards of the commit message and the patchset motivation and
because I trust Andy being a long time contributor with a lot of expertise.

Anyway since the rant is finished I'll land the patches.

Neil

> 
> Maxime

