Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70455939B95
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 09:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1E910E451;
	Tue, 23 Jul 2024 07:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AqNS8pbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CCB10E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 07:16:37 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-427db004e36so23592035e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 00:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721718995; x=1722323795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=c8+z1hzRqPPRvxreD5f+LLq696wigaoWrNTEWZo7r6M=;
 b=AqNS8pbZloQGqBrQviswKyL4GGSxDNUVABpnsx2X7XNUMZNkIWQzcZ8GoFaGcz0Z5+
 HTk+C9JNk3cl4rkeedw1P1VitefacylnNvA6i9+EbqE+BNTayxIvWV+qfmUad0rHpvAF
 FK0Z4PRL02V8WYx1wylX4rQhBTyh6rVhgU7cnosKT1v9ja7dGejEXIZq4dAylx+tT7EG
 /10BZxwErncWSl4MCjTG5mpVP2q3u2NxDx7O2wWvhzmOdq4DJuHd9lGNZWF8aUxZsu1R
 jqtssAEta8zBIsCyqsKHyCFbaKfmvsHO0kRBm860RvE2gHfRWzqtrWVR5SmafXxdP76N
 7yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721718995; x=1722323795;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=c8+z1hzRqPPRvxreD5f+LLq696wigaoWrNTEWZo7r6M=;
 b=HhSvo78fbz+pA7iRxL+HtzHYt8LYJr18/uUG3P6zXL+mYDFG280HKIBTl2lkH96FDn
 UvGmaLN9+KqcMfootaDabUfHhsXdBRDyHJDH/l131dtq1pFfhr7RbceQaQFWECin5ohJ
 Xmso4HObS/7aX3vVQC1hM6dvQKaUvOQfrv/3rominwT1ggXKsg2MC38Kv+6W4WoGcnqZ
 cVQU7yfVtLceUIHIsrbzVLouWaFDL9Yvm9B0fFpl4EbINeg2GAtAtFcBxdGv4jJUqPnZ
 evRDyQtvw5pgvHVNtHo4gKkFDE988Zme7BV28CDXumWaAfUoY3MyCIGMOVFPJsgOY8uN
 bQaw==
X-Gm-Message-State: AOJu0YyOCmX2PbAZ+Vq9lyrm4chO/gn5AEiVyCgS0RpMP4ukGT6cxeNi
 o1tzN42haVWJovlo9y5hC1Fplw5YsGC8QOAlRnjTBulgL7S5CsIb8avFzDTwY94=
X-Google-Smtp-Source: AGHT+IG5VufI8pqRrLSqh+8rndOpIB3ocF60gG2oVIkHsjs5kqH3um83dyn6qiiPjAfzqwGfRkOfzw==
X-Received: by 2002:a05:600c:384d:b0:426:5d0d:a2c9 with SMTP id
 5b1f17b1804b1-427dc522895mr67647995e9.10.1721718995075; 
 Tue, 23 Jul 2024 00:16:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c?
 ([2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a5c564sm183341265e9.14.2024.07.23.00.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 00:16:34 -0700 (PDT)
Message-ID: <4f48f5ea-4247-401f-8d4c-0ddffe696bf8@linaro.org>
Date: Tue, 23 Jul 2024 09:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: add BOE tv101wum-ll2 panel driver
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
 <20240709-topic-sdm450-upstream-tbx605f-panel-v1-2-af473397835d@linaro.org>
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
In-Reply-To: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-2-af473397835d@linaro.org>
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

Hi Jessica, Doug,

On 09/07/2024 15:05, Neil Armstrong wrote:
> Add support for the 1200x1920 BOE TV101WUM-LL2 DSI Display Panel found
> in the Lenovo Smart Tab M10 tablet. The controller is unknown.

Could you review this patch ?

Thanks !
Neil

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                  |   9 +
>   drivers/gpu/drm/panel/Makefile                 |   1 +
>   drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c | 240 +++++++++++++++++++++++++
>   3 files changed, 250 insertions(+)
>

<snip>
