Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453658C7690
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B5210ECC0;
	Thu, 16 May 2024 12:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kLOZBvpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E3110ECC0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:36:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4202ca70318so3280365e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715862998; x=1716467798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=7u9UgrXAiHW9UrrIdHLjqFr2KCY8YsT8XD0QgC4VHdw=;
 b=kLOZBvptHR9hfzkoolsSn2OXJzLy54WGE7WO15ly+tPL+FoaVYHD6SuKbfmoZO3AIE
 BSUQdpK3OaL2f5UIEgHa0b8nlVGQZErsSrVmxEWH8tdeaHZgoQ5RynUCXTtI/s5MvfWi
 HYTYv++cTLQY3d5pAPEgvxAR+QJ6W0B2Y9EV3Xf0CVJInPNN1u3tUgDedNFqRpRj8JhG
 8+bafig4PL+W0+nMkMnNUYSaC2IBE+b0baG5MrxdBPrLPCg8RNadSQcGFuZWX9Bb+FLE
 MMiwWMBRhejEHpE+erMGkX81F0EIr2RhMY1EP7FemqFXHcAqtYzgzVuovr0xjkfb1Hje
 2oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715862998; x=1716467798;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7u9UgrXAiHW9UrrIdHLjqFr2KCY8YsT8XD0QgC4VHdw=;
 b=uYjMEE3s8sacnQsZm3A/B2G76uNr4+geQmR1w/jPYmtXvqYU4WsA5WeLbONbStn//y
 fq1r9jKOG5x9Pt1SL1XT4QPrEMjDNXNffWIxNHOUBjZ+duFrWvO4DVozbBX63oJVftBo
 03Bb4OjZwJliHeNm9Uv5bZZxAGt0prSeO/BimLXlMfycnICD9SBB2560luQ6BNq00FR8
 TdPeN4GTN2SK8atVT2+12K8amk+/M05TxHOzSFK12kFvp5BW7HfNkvWLYglUpU7e0gSY
 lprEI5wJjDe5fqpPIbtLkyAihpBnPZLVcnbk9kxkZHp+2fzPY/Y5Rmwpyw5b20ILTQu+
 +cqA==
X-Gm-Message-State: AOJu0YxKhJi8g3W0MYanMKrXpOmaBRxGdCHaYnUAqJyPRzJHg8MwcT+O
 YEFSazJ1o2N2ezFJOAp912+mAWsJhCaQo9EI6z1JIH75Yl/Rv0P8nIk9XdcMQkQ=
X-Google-Smtp-Source: AGHT+IG1y1kInySg9tuz9weH7g2TaNqHI/69k6mVraLoKsovAscO+fx1x3wznKwq9TAkINyZgf+a3w==
X-Received: by 2002:a05:600c:444e:b0:418:fb6f:5f59 with SMTP id
 5b1f17b1804b1-41fea931860mr146950595e9.2.1715862998070; 
 Thu, 16 May 2024 05:36:38 -0700 (PDT)
Received: from [10.91.0.73] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce24cdsm271027755e9.15.2024.05.16.05.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:36:37 -0700 (PDT)
Message-ID: <6f54a590-d3dc-48f2-9061-27afb1c34fef@linaro.org>
Date: Thu, 16 May 2024 14:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: display: simple: Add Microtips &
 Lincolntech Dual-LVDS Panels
To: Aradhya Bhatia <a-bhatia1@ti.com>, Liu Ying <victor.liu@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
 <20240515095133.745492-4-a-bhatia1@ti.com>
 <9f3c1825-0438-464e-bd6d-88da6a9c3b3b@nxp.com>
 <cecb865d-2f59-4cdf-991a-4607b200d503@ti.com>
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
In-Reply-To: <cecb865d-2f59-4cdf-991a-4607b200d503@ti.com>
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

On 16/05/2024 13:06, Aradhya Bhatia wrote:
> Hi Liu,
> 
> Thanks for reviewing the patch.
> 
> On 16/05/24 07:49, Liu Ying wrote:
>> On 5/15/24 17:51, Aradhya Bhatia wrote:
>>> Add the Microtips Technology USA's MF-101HIEBCAF0 10.1"[0] panel,
>>> MF-103HIEB0GA0 10.25"[1] panel, and Lincoln Technology Solutions'
>>> LCD185-101CT 10.1"[2] panel.
>>>
>>> Thes are all dual-lvds panels.
>>>
>>> Panel Links:
>>> [0]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2588/13-101HIEBCAF0-S_V1.1_20221104.pdf
>>> [1]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2660/13-103HIEB0GA0-S_V1.0_20211206.pdf
>>
>> This one mentions some controls in '3. PIN DESCRIPTION' which
>> don't comply with this binding, like RL, TB, STBYB and RESET.
>> Note this binding only allows compatible, ports, backlight,
>> enable-gpios and power-supply properties, nothing more.
>>
> 
> Maybe the internal module _can_ support these control options but the
> actual panel hardware does not expose any of these controls on its
> connector pin-out, and hence has no possibility for additional SW
> control. Even for the usage, the device-tree node for the panel only has
> "compatible" and "ports" properties defined.
> 
> The panel is being used within the confines of a simple panel.

If somehow some modules with those panels would need more control lines,
we'll simply move them out of simple panel bindings & drivers if
required.

Those are perfectly fine as is, we don't want useless description and dead code.

Neil

> 
> Regards
> Aradhya
> 
>>
>>> [2]: https://lincolntechsolutions.com/wp-content/uploads/2023/04/LCD185-101CTL1ARNTT_DS_R1.3.pdf
>>>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> ---
>>>   .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>>> index 716ece5f3978..e78160d1aa24 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>>> @@ -41,6 +41,12 @@ properties:
>>>         - auo,g190ean01
>>>           # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
>>>         - koe,tx26d202vm0bwa
>>> +        # Lincoln Technology Solutions, LCD185-101CT 10.1" TFT 1920x1200
>>> +      - lincolntech,lcd185-101ct
>>> +        # Microtips Technology MF-101HIEBCAF0 10.1" WUXGA (1920x1200) TFT LCD panel
>>> +      - microtips,mf-101hiebcaf0
>>> +        # Microtips Technology MF-103HIEB0GA0 10.25" 1920x720 TFT LCD panel
>>> +      - microtips,mf-103hieb0ga0
>>>           # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
>>>         - nlt,nl192108ac18-02d
>>>   
>>

