Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B08CAE6F
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D9010E0E1;
	Tue, 21 May 2024 12:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zD5NLCO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2181810E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:39:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a620a28e95cso142947066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716295162; x=1716899962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=rFHfSKWBFX4oULUBSbLjfPQh2Pl5/BKyXUIZgUEiiGU=;
 b=zD5NLCO8tebP2qgs84KYtQpxTYcTbNacJfv6YCR2fiKKth3eYyim+8dF8inJ0WU7jm
 1CCkdwJXqgUhLPt4sHdak7rSAOYNKXGqJmm6Cg5mWLcHRjHen1o8dIO0as/aNU73+azb
 9NWTsHtpwxkuQRf0+PWRFdF3zaRDBSobuGos1jbvUaBxJSzjiQpEJ/SWO94peW7/M7WT
 DeXGDkRwg1zFB0FkTFky6pgNsAhcIKCkcnJtuQAqXm2bLBBb0om1R0+bjAPBfhH7NOD0
 Hv0filca74W5ju30N5O3W0MpK/rq2kZq8dCEhif1iqp6Zpw2vpgOS97iWLPVW/NDkQym
 y02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716295162; x=1716899962;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rFHfSKWBFX4oULUBSbLjfPQh2Pl5/BKyXUIZgUEiiGU=;
 b=OLhgvbPUyQQXEz8yEly2vOZE1NnPEpkE+Wnhc7gU0E+pyVeIa7Fn1gpOkNPXAZDz04
 2yN7rkw7T1UBk6afNeSGXmQHCydLYX+3XlFYZBC3/QvlH8kjCtxe1/3iBd9NqmVbrE6m
 8sSS7wZpKUmOI7gHAmYYqIbD2N81+hpkSKD7ImbFVRTn9+hZUef5vRbc0Qg2F8C2/owB
 iFUGudF64pvGUQo3XbdJvv18G5i1+aZ+PkFU/FlvfqmWNaJWRFbKE1xinMYBfR4PE/Lo
 jB1oH8N8tpLpzCE1c4gteyM+0eQ3I9+EFC6kG0Lg5GYbDAKamHd8Uk2tsXRYogtz59GF
 q5Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk7YgFDxieoRkajiPsrkwm3MM3HGWhfldrl9hAy7gTcMExdJU9wtcmsgLW61YhxGmaFu3aIoWjGbyxEdak/aGYcz1fpkfaKwk4j4k6zFq8
X-Gm-Message-State: AOJu0Yz+bk74kLUHmEVn1B8b+eQKQlTQD/DbajKWCjKLbgygd70hsenw
 zEYax9bR2xTR/6Wh2rnW9WxRlYLH7i7xWGZgYVI5sZMDYtuSl6JF0f/Vp1kCz04=
X-Google-Smtp-Source: AGHT+IEvltkz4if2mxEen2lTr2KhIpEOYd6K4dZEz4QIB3jeYLnsT4m4Ugjdm0c34cbMTb/+slMGSg==
X-Received: by 2002:a17:907:7da3:b0:a58:e3d9:e2d6 with SMTP id
 a640c23a62f3a-a5a2d672f76mr2711555566b.56.1716295161772; 
 Tue, 21 May 2024 05:39:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:adf9:e5d:4c15:f725?
 ([2a01:e0a:982:cbb0:adf9:e5d:4c15:f725])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7ecesm1603819566b.112.2024.05.21.05.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 05:39:21 -0700 (PDT)
Message-ID: <af573ea4-5bfa-4a21-84aa-31fd7c486732@linaro.org>
Date: Tue, 21 May 2024 14:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: synopsys, dw-hdmi: Mark ddc-i2c-bus
 as deprecated
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Yao <markyao0591@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
References: <20240521104057.10485-1-marex@denx.de>
 <20240521122955.GH16345@pendragon.ideasonboard.com>
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
In-Reply-To: <20240521122955.GH16345@pendragon.ideasonboard.com>
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

On 21/05/2024 14:29, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Tue, May 21, 2024 at 12:40:47PM +0200, Marek Vasut wrote:
>> The ddc-i2c-bus property should be placed in connector node,
>> mark the HDMI TX side property as deprecated.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Mark Yao <markyao0591@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml     | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> index 828709a8ded26..d09a0bee54247 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> @@ -47,6 +47,7 @@ properties:
>>   
>>     ddc-i2c-bus:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>> +    deprecated: true
>>       description:
>>         The HDMI DDC bus can be connected to either a system I2C master or the
>>         functionally-reduced I2C master contained in the DWC HDMI. When connected
> 
> How about adding an additional sentence here to explain what should be
> used instead ?
> 
>         to a system I2C master this property contains a phandle to that I2C
>         master controller.
> +
> +      This property is deprecated, the system I2C master controller should
> +      be referenced through the ddc-i2c-bus property of the HDMI connector
> +      node.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

With the additional sentence:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 

