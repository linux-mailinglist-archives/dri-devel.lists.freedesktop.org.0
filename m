Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3786C446
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B5110E185;
	Thu, 29 Feb 2024 08:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hwvJ3Ope";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2610E185
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:55:02 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso332643f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 00:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709196901; x=1709801701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=bywCsrw+XZLoeXDHPoYCv95po2j/Way1FVc9H/uzC18=;
 b=hwvJ3OpexILNtokTmgqVPAa+/m7nXDX0w5X40+GAKZlboX7qm9EQl/8n8vDZMBzQVI
 CEofmmSRUvbTnqFC94F7A5x9INhCld5R6JnavX7xVZUNIxcMTSvqztcoes9RVcBqXHGR
 qit+kUViT3ApJYqboAyB9Fw5Paq9UV1fkG8wX5NK8CnaCYb0Mtn0MOZZMWyAohUgTKFJ
 C5Rx6hhGyxICYRKKtP5aj9MORexQj7/2SFKueEo6n30ST/jZ5ag9mJdnNRMOWjgckeV5
 dwx5r3nzsePyn6iG+M1sFJ75nvyMd+m9Av0CoPwe/lVxIBGVkWkXhCOhGrSq2OUKNwK9
 7qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709196901; x=1709801701;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bywCsrw+XZLoeXDHPoYCv95po2j/Way1FVc9H/uzC18=;
 b=FAGBET0DT8vTnjs3eGKmZTSuODJvG/08Y6DzDywgyuuLxov00zKiHOFQg/9lQpiPeA
 jVAnRZlqmY6hGtane8x6DRZIpo2j4TVKredsN2Ae8hfWhivZ3MG0u2m6VMdaD9RzbyBi
 oceSKB2rHfWL7HUJtjOTOrPiZ8wNbKjEV7NL8XXhWb3urQBTE7H0tG+ilHbWAAIbYfMT
 NnuE0/ZF/zqBKyQijSUGZHebFwnxZuW+8VIawj/g3+HDvkHXIVkiov/SfsTcWzUKT/RW
 0UAxE5foT5i3+3nY4wMQlDw0L2oYtRXlwXiSRy8C8I7eHsOYyGY15FG2TgnSLvE7f35V
 AsBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqWenagmJXPRb2lSABvR/Si79CS8hVtWMGSByKsPPUqfJAbmcxex4aekDrJWH68BQWcr0zk07iWEwJBVKzh8FfSO7swCuVu9WNPOSEKL38
X-Gm-Message-State: AOJu0Yyb/mikdikMAVYSdy3f669+TpocABcA2lsVhMW/Th66Bxh7deXh
 yCto4y7iBLCRUn0jfTpzdeU2Qh/f31cyyQKSIeOct4jbsYi82/3jbWh/Ll0ncaQ=
X-Google-Smtp-Source: AGHT+IGhwBfki4H2etcVqI2wWOlCAK4Oa7uGbH0TNjA60QSjyGlk9/cDjceeJdn4BFzAS7udycYwbA==
X-Received: by 2002:adf:a308:0:b0:33d:608c:da8d with SMTP id
 c8-20020adfa308000000b0033d608cda8dmr903741wrb.9.1709196900689; 
 Thu, 29 Feb 2024 00:55:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:651:5318:b12c:be82?
 ([2a01:e0a:982:cbb0:651:5318:b12c:be82])
 by smtp.gmail.com with ESMTPSA id
 bp16-20020a5d5a90000000b0033e0567e90bsm1200056wrb.5.2024.02.29.00.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 00:55:00 -0800 (PST)
Message-ID: <23832e29-5bf4-4dab-ac00-4a4090233c3f@linaro.org>
Date: Thu, 29 Feb 2024 09:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add Crystal Clear Technology vendor
 prefix
Content-Language: en-US, fr
To: Conor Dooley <conor@kernel.org>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
References: <20240223134517.728568-1-jeremie.dautheribes@bootlin.com>
 <20240223134517.728568-2-jeremie.dautheribes@bootlin.com>
 <20240223-prepay-stadium-f09044e3e123@spud>
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
In-Reply-To: <20240223-prepay-stadium-f09044e3e123@spud>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jérémie,

On 23/02/2024 19:22, Conor Dooley wrote:
> On Fri, Feb 23, 2024 at 02:45:15PM +0100, Jérémie Dautheribes wrote:
>> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
>> include "cct" as a vendor prefix for "Crystal Clear Technology". CCT is
>> the vendor of the CMT430B19N00 TFT-LCD panel.
>>
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> And add a
> Link: http://www.cct.com.my/
> as that actually explains why "cct" is the right choice.

Can you send a v2 with this change ?

Thanks,
Neil

> 
> Cheers,
> Conor.
> 
>> Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index fef2e12b504e..96e47742e250 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -248,6 +248,8 @@ patternProperties:
>>       description: Catalyst Semiconductor, Inc.
>>     "^cavium,.*":
>>       description: Cavium, Inc.
>> +  "^cct,.*":
>> +    description: Crystal Clear Technology Sdn. Bhd.
>>     "^cdns,.*":
>>       description: Cadence Design Systems Inc.
>>     "^cdtech,.*":
>> -- 
>> 2.34.1
>>

