Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFE8FE30E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6396010E8AF;
	Thu,  6 Jun 2024 09:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wqYBNaRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5460510E8AF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:37:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-421208c97a2so7974865e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717666653; x=1718271453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=RCQdvPHC+1D0KbLKcaQqh85703XDLJL62lsU4LBVhIk=;
 b=wqYBNaRLrkq2VCNr1lobwnZBIrXQ+KlpatO+Hca16WdeHujMooTsMoWBRlMXUR6NcK
 zqn8BfCUdWYUe2f4st/WV2jNzPTdNHS0PebiCMC8jjY4UTkYrjaH8J/azBxY+9lwy1U9
 774sqBd+VpWtjb1DIaWRwH4Ptu1nN0e03WUDqvoDfe3G5cSugR4iLwpybKWQuKN6+HQs
 TqEcIv2ETO/8RNMlajjf7W2/OQ2Izx/FAxAp3/nLpOAlLvloYNXNjA9QkkEmj1ATMjZX
 j8FTUPIJlahX5/eXxLEP7m3mjBSUPEhXLfZf5wfUt8t/wCFvsDqT0kYenhmTFUj0dCU0
 hQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717666653; x=1718271453;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RCQdvPHC+1D0KbLKcaQqh85703XDLJL62lsU4LBVhIk=;
 b=fEWMZPDqv6ejRmDoukvgrmUndpLhuXsu9K81llJ11nkfiBcuKqsaqlduXEAsR02gTz
 IqoxWdlHqiV5iqpkdRWqzAafEsC90tAr9mhn3jklX8cN56cFqNCQmfyI8M3K5wbIVYlf
 nXye8Set9X9fobvKvCC1Z4Oewg4K+YqUIMBNLq5Z6+gmOJrmxNwOqbTy9Mik/SIkuKAI
 hT8jPja7+6iFBYCLXtwP0SgDdEw0zX0AakhQk3JRN4bG7WHXRCCF/A2CT7Xm7qZ2D1gD
 RRHo4aIilS7/XfcpiwZY7BjA+6KTUTZOCDBAwGjXLphV/VBDm+kg4I2jfGhX5aQoOgXs
 A+6g==
X-Gm-Message-State: AOJu0YzMWVAzcRot0JQlwCa++QT5A/6Yg6zbFofPB4vhys4RFVOOc8jZ
 gL9AaajZDAHFjfuC3ep4dj/AdW9fWM+ODwYI5xC7qpqJs//Zqf7yoDvE17SEiKyv39quCweqN7P
 a
X-Google-Smtp-Source: AGHT+IG6HdUEIpt883LUTHjTSr7jGD/461VkUD1BosW8cmHsPaeNl6UmT40F+K7TVSbyuBhGfQv37w==
X-Received: by 2002:a05:600c:c3:b0:421:48ad:60b3 with SMTP id
 5b1f17b1804b1-4215634db50mr44930755e9.34.1717666653403; 
 Thu, 06 Jun 2024 02:37:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2?
 ([2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2c7e8fsm15503555e9.38.2024.06.06.02.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 02:37:33 -0700 (PDT)
Message-ID: <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
Date: Thu, 6 Jun 2024 11:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
To: Maxime Ripard <mripard@kernel.org>, Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
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
In-Reply-To: <20240606-intelligent-aromatic-magpie-80a7a4@houat>
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

On 06/06/2024 11:32, Maxime Ripard wrote:
> On Fri, May 31, 2024 at 09:12:14AM GMT, Ryan Walklin wrote:
>> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display used in a
>> number of handheld gaming devices made by Anbernic. By consensus a
>> vendor prefix is not provided as the panel OEM is unknown.
> 
> Where has this consensus been found?
> 
> I had a look at the previous discussions, and I can't find any consensus
> being reached there. And for that kind of thing, having the ack or
> review of any of the DT maintainers would have been great.

There was a consensus with Conor, this is why he acked v2, see
https://lore.kernel.org/all/20240525-velvet-citable-a45dd06847a7@spud/

```
I think if we genuinely do not know what the vendor is then we just
don't have a prefix.
```

I agree with Conor so I applied the patchset after Connor reviewed it and the comment was fixed in v3:
https://lore.kernel.org/all/20240530-satchel-playgroup-e8aa6937b8b9@spud/

> 
> For this kind of cases, we usually use the device it's attached to as
> the vendor, so anbernic in this case. Can you send a followup patch?
> 
> Maxime

Neil

