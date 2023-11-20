Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966847F0D8A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDFD10E174;
	Mon, 20 Nov 2023 08:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9573910E174
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:28:58 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so5284693e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700468937; x=1701073737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=aZl/UWuGk9uDp12xg1J9H6b3bGFNb0COtKrYyg1r2QE=;
 b=P2WhAm02WNApP9NZmYuS66eAWjVAwBV2Y6ma5KIVGPSegrdfXPcGIHgEvl9+reUtzm
 k/4bmuO+7HjeetoPsYutp5onokORCrTGWm9nmX4U7bAx7XUfUVVGYYe/tuCImwfR4jFt
 1NV5SE3PYUrjO8h7TqFe54Gpw51xbumZ+wcMTjYIHDkpQLFaEEr2hi+Kvu7rSU49VObf
 KSwB6RwL+biaUIfoawJomjzpIEihfaMRIF6D309acvwM8nL5eEdt/zfgQU/j7yaZep0D
 rZZfTt5s3cjuO+DnBDDqh7aZ4GgFVmmoPw5eDsspEQeyepyV11Fwg8z+iSMegIDdtHBb
 BoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700468937; x=1701073737;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aZl/UWuGk9uDp12xg1J9H6b3bGFNb0COtKrYyg1r2QE=;
 b=icgM5z7BVXeeh62QvKdwEsNY6dVpS57jeyUDiCOrwjHsQ2fG5o7mcM5yWDG7anZ1vZ
 QpRonJkG+vWuhnB8Y8Z5k5JIKKioL8jRRtDknIGTliQhf6VEEXwhjzUNT7/gSzkp8gp2
 PGQLoN8IsB5N+iJ086yzChxT//2Ul37DCne+8xaq/TMY9BQgtn9mU2fAPVd60zYQPNJO
 N5347kTowWROrzncfdxbqHl8EJDGdYG3wtJWK2+TEC5C2OYcM+/q035jHqivJ0sjRZvN
 zviRk5bltwz79YmAitbK+To0Z5ofZAktMGAtjULw0JNFVrsd4mlw2edZFBGyt5AqSK0X
 NjQQ==
X-Gm-Message-State: AOJu0YzPz4DyWfHJcHYboeS/7lN137m7uYpxBNAIksXQj+5drbBRFkZs
 0ScqSLM8GmbEbTA04K+HiMPyxw==
X-Google-Smtp-Source: AGHT+IEt/kxzbALCrOQohhOzLKUpVW+6MTUXII0zJQ8KxpbzpM1K9SGKYubH3mE2/+y8j4jH5bUQJQ==
X-Received: by 2002:a2e:7a04:0:b0:2c5:23e3:ed11 with SMTP id
 v4-20020a2e7a04000000b002c523e3ed11mr4893889ljc.30.1700468936577; 
 Mon, 20 Nov 2023 00:28:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06?
 ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a05600c1f8c00b0040839fcb217sm12641000wmb.8.2023.11.20.00.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 00:28:56 -0800 (PST)
Message-ID: <87ec313d-d849-4a0c-9220-e5fbdc41d918@linaro.org>
Date: Mon, 20 Nov 2023 09:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
Content-Language: en-US, fr
To: Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>
References: <20231008223315.279215-1-marex@denx.de>
 <ea0e3550-83ca-4006-819a-64780589d687@linaro.org>
 <5481d74f-4b58-4527-987a-562e1b213a6b@denx.de>
 <oe2rcrep4rukf7k3aqc6grfbp2hh4syehtmxivbjx746u46lg2@74v2bl526mpm>
 <ed4b33fb-403c-4c1d-b1a4-f63b765c38cf@denx.de>
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
In-Reply-To: <ed4b33fb-403c-4c1d-b1a4-f63b765c38cf@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/11/2023 20:50, Marek Vasut wrote:
> On 11/17/23 09:40, Maxime Ripard wrote:
>> On Thu, Nov 16, 2023 at 10:15:31PM +0100, Marek Vasut wrote:
>>> On 10/9/23 10:58, Neil Armstrong wrote:
>>>> On 09/10/2023 00:33, Marek Vasut wrote:
>>>>> Add missing .bus_flags = DRM_BUS_FLAG_DE_HIGH to this panel description,
>>>>> ones which match both the datasheet and the panel display_timing flags .
>>>>>
>>>>> Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 panel")
>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>> ---
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> ---
>>>>>    drivers/gpu/drm/panel/panel-simple.c | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c
>>>>> b/drivers/gpu/drm/panel/panel-simple.c
>>>>> index 44c11c418cd56..8e4ea15f0e1e5 100644
>>>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>>>> @@ -2318,6 +2318,7 @@ static const struct panel_desc
>>>>> innolux_g101ice_l01 = {
>>>>>            .disable = 200,
>>>>>        },
>>>>>        .bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>>>> +    .bus_flags = DRM_BUS_FLAG_DE_HIGH,
>>>>>        .connector_type = DRM_MODE_CONNECTOR_LVDS,
>>>>>    };
>>>>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Maybe it is time to apply ?
>>
>> The expectation is that you would kind of apply it yourself. Do you have
>> a drm-misc committer account? If not, you should apply for one, you
>> definitely qualify.
> 
> Applied to drm-misc/fixes


Sorry for the delay, thx for applying it finally.

Neil

