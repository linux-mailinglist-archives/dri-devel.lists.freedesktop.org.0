Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639078295B1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517EA10E713;
	Wed, 10 Jan 2024 09:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0649C10E713
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 09:06:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so28880075e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704877559; x=1705482359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YGn05+FOp2S6kGAYx1CC3XYu3wPlmxWSpkBFMyATYt8=;
 b=Yz+3vByTgJ1t2HMGlT7DeLD1sIm9XQ5xYVNZsvnKj/+n2A/DAnyW8lSeRrtcXPpTAY
 l1o+dr2zOrzOmJMwoX22/8dbUmokreAqrtQv66K2jjdtsSogEWwdtNqIrGkTacHKOdF5
 sbtFeRIoh/patEhAZ/N3ZvN9eM3cdkG4gyhfIV6u17NxPlPIvTBH2b6OF4pFiYvfToMs
 lKSsRb370uxQHQmpf7pxd8B6wJelnqydLqQEDotLURHKrwY4jYn8BoLxjLimDSM110eq
 c4//xk9nG4W/HxJWc3Ppv9pwude/dnimQ2ZFVc3Me7p5PJDMDewYSNU4extRh067NmPQ
 9utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704877559; x=1705482359;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YGn05+FOp2S6kGAYx1CC3XYu3wPlmxWSpkBFMyATYt8=;
 b=OM0DwT2blDlDLUd8CyEpqf0A/k55a1WVnrG+bUw79FpJiHHTa7UpzanB/8qr9O08ST
 jQlZvQkoIYtymiWbz+ULamFO03naAgSGnUV+uk/w5PuBgrLc/SryTw6H2CucSm/WWrqW
 NvVmLR8KPIKc2tM30iKzU+cXmSjnlmA4WlZNoYdG21k1RSkm4vUGcPZXg88HcDwIeJXX
 UO0MZb2o4sD4TO7689RqlEv8G4Qi0cZZJhsFl+GPPbeCo7RwChQZ8Ego+hQ85MxUujLL
 9k31r0Z9Bm6dQI7li7oAt7B56gzSzc2mlDalguQGhUz+oB5zHtyBBGQRGhZenTUgdnxw
 fOlg==
X-Gm-Message-State: AOJu0YxgT/IHPYKBbzOqeAQtMJMpyrnc8AUNfHFLzXn03DL51pPI6r0/
 Bhdfl18P3vx8/9WXOx9o+v89ufP94Sedug==
X-Google-Smtp-Source: AGHT+IEFouJoUbml6X/7HBn2vGnyrbIlj3qsE0X5+d3U6eg+CtsrfuuLfyDPpRGpHb1rp2//5OPqsQ==
X-Received: by 2002:a05:600c:1e84:b0:40e:4a73:f6b7 with SMTP id
 be4-20020a05600c1e8400b0040e4a73f6b7mr374107wmb.150.1704877559419; 
 Wed, 10 Jan 2024 01:05:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5dee:51de:9349:2adf?
 ([2a01:e0a:982:cbb0:5dee:51de:9349:2adf])
 by smtp.gmail.com with ESMTPSA id
 fs14-20020a05600c3f8e00b0040e38b7cfdasm1412519wmb.4.2024.01.10.01.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 01:05:58 -0800 (PST)
Message-ID: <80b898a0-1f44-4623-9df2-edccb9307098@linaro.org>
Date: Wed, 10 Jan 2024 10:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: Add
 compatible property for waveshare 7inch touchscreen panel
Content-Language: en-US, fr
To: Conor Dooley <conor@kernel.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <20240109070949.23957-2-shengyang.chen@starfivetech.com>
 <20240109-worsening-material-fae02ff4e611@spud>
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
In-Reply-To: <20240109-worsening-material-fae02ff4e611@spud>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 keith.zhao@starfivetech.com, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, dave.stevenson@raspberrypi.com,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jack.zhu@starfivetech.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, mripard@kernel.org, quic_jesszhan@quicinc.com,
 changhuang.liang@starfivetech.com, wahrenst@gmx.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2024 17:32, Conor Dooley wrote:
> On Tue, Jan 09, 2024 at 03:09:48PM +0800, Shengyang Chen wrote:
>> The waveshare 7" 800x480 panel is a clone of Raspberry Pi 7" 800x480 panel
>> It can be drived by Raspberry Pi panel's process but it needs different
>> timing from Raspberry Pi panel. Add compatible property for it.
>>
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
>> ---
>>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> index 11422af3477e..02f6b1b2ddc9 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> @@ -335,6 +335,8 @@ properties:
>>         - vivax,tpc9150-panel
>>           # VXT 800x480 color TFT LCD panel
>>         - vxt,vl050-8048nt-c01
>> +        # Waveshare 7" (800x480) touchscreen LCD panel
>> +      - waveshare,7inch-touchscreen
> 
> Is "7inch-touchscreen" really a specific enough identifier for this
> device?

Waveshare has very precise SKUs, this should be something like waveshare,7inch-dsi-sku19885 perhaps

Neil

> 
>>           # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
>>         - winstar,wf35ltiacd
>>           # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
>> -- 
>> 2.17.1
>>

