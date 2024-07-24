Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F293AD89
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7307F10E3BB;
	Wed, 24 Jul 2024 07:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m5EKLeGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C71810E3D7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:54:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-36844375001so3720010f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721807674; x=1722412474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=B/gAlhU9x34vyOesMYY33jaEx8HM/aSpGhMD3X372qA=;
 b=m5EKLeGfAC6WONCA5MhcOYjKVBMyi3BBC7Um4SKKUE/xOSwfCL84pUNYsaIYQhziYj
 s6lZ+QchZYLXXKWQCB1JlyqwzENZ1tXP3egWE1kQv9aAYMZvlzyz9M61Us4ZZBOPbCIw
 +FXPCclBFCOeNW1KOM4XbeiNo0O8xcoQ4cpMyxwyZqUK9hRRn7W2RM0hL7ITeVwMsSEF
 s8ESNaFHf8iezGPOD2dsNEAJD4lYuKqnCHtrmAl74IPIFfLxya+7UwtKMWmti2MEUexI
 h7BdUlrQfIJDr7r0iGzK8/FLWmjzAo0WABIxLRHtLJeuZcpNHV+lc1bk5EV/FzmWDw1g
 XgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721807674; x=1722412474;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=B/gAlhU9x34vyOesMYY33jaEx8HM/aSpGhMD3X372qA=;
 b=SJNkF7CTZJAk24oFkGJOeOnN4CNcwt9dgXZk7lt8qYh1gM0g/TYxaviE15Um+Rmx6o
 zAkoXFEcAN+cAclBc92b0XOAn5dChjWYGyohvwhhZ1P2pS83DhBC+GAEZfEEAZUPiwNE
 n02g0sTlYEK58b91mdK5OiSg9xIaPHRDnHKHM17WYayTIWZIYYNkHhY84WmSETqqy2NM
 BFZ+icckwWRKmxjigKjzYMF9EsFvDw0VTDVHkCpKodrjdyMI3NCYtcD38YpAKdErGJH2
 rrx5Mmn+SIEcq0ECK8gyVMYWoSRbLHHkV/5g/aJpG/eua31n3yAzPH0SVqfjxTg2HTYT
 t5IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnU/PlpAH2kHXq2LwX/fLyQGjYtd9iIVHjnoQwDzUCLo45cs71Y/QOqBkTbjHu7m6vQ74KT+qNg32fALqIB+d3eKSV0Qvk6czDCJiZZPvD
X-Gm-Message-State: AOJu0YyfxovmqEMquMQHo70LLyPSGSD/6cgOLN2H/Os+X4smajY684f6
 ut+M43iKg3Z3RwW2wXIMIMd/cvVHaJlDlVThLT40ynUDs/+zbngubkxx7k49QiU=
X-Google-Smtp-Source: AGHT+IEINaLP4EC8j2JGyw8glYn/Klp3D0U5DMgaW5zZecLjyM/6LmT85iIxjDYOV/jqmliBp+/kWg==
X-Received: by 2002:a5d:6791:0:b0:368:3b1a:8350 with SMTP id
 ffacd0b85a97d-369f5b2c7ddmr905882f8f.19.1721807673400; 
 Wed, 24 Jul 2024 00:54:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7?
 ([2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f9359710sm17396355e9.1.2024.07.24.00.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:54:33 -0700 (PDT)
Message-ID: <2b970471-114e-4955-811d-592c12b1782f@linaro.org>
Date: Wed, 24 Jul 2024 09:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
To: Conor Dooley <conor@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20240706102338.99231-1-kikuchan98@gmail.com>
 <20240706102338.99231-4-kikuchan98@gmail.com>
 <20240710-showdown-antirust-a3eb8b65c57f@spud>
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
In-Reply-To: <20240710-showdown-antirust-a3eb8b65c57f@spud>
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

Hi,

On 10/07/2024 16:01, Conor Dooley wrote:
> On Sat, Jul 06, 2024 at 07:23:34PM +0900, Hironori KIKUCHI wrote:
>> The RG28XX panel is a display panel of the Anbernic RG28XX, a handheld
>> gaming device from Anbernic. It is 2.8 inches in size (diagonally) with
>> a resolution of 480x640.
>>
>> This panel is driven by a variant of the ST7701 driver IC internally,
>> confirmed by dumping and analyzing its BSP initialization sequence
>> by using a logic analyzer. It is very similar to the existing
>> densitron,dmt028vghmcmi-1a panel, but differs in some unknown
>> register values, so add a new entry for the panel to distinguish them.
>>
>> Additionally, the panel only has an SPI instead of MIPI DSI.
>> So add and modify for SPI as well.
>>
>> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> 
> With a mention in the commit message about why we are adding a property
> and then immediately forbidding its use:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Can you resend a v4 with this suggestion ?

Thanks,
Neil

> 
> Thanks,
> Conor.

