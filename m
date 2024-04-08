Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D6889C143
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 15:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4E310EA95;
	Mon,  8 Apr 2024 13:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P1xj6QPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA4B10EA95
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 13:19:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-343d6b55c42so2889779f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 06:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712582377; x=1713187177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=XYIK4LJue/cF21wmqnutz+6NKwjmC1hO8sQh8o/YKFM=;
 b=P1xj6QPeJOF2Oh2sFNBh3kSwr2cJiqgHYxSeN6sji/0H0TD//RQbBHqMKD4v31p95u
 Jm6Lnjbfp8mkg0zacEPKEMjrEjYNkbFnLWhYiGqsbRxyj3GFafhjl5PMt03AswW7acM4
 IwEHoe7fZ9tAoGzmvKiXCZUFamZ5B1E9btfqIsb0qPMIBS3M85F2KNVZ66ro1J1t/W7h
 jQ6wZkqC8XKOwBTRhB8ysNVxoOpUDsNX50ME7zbCutiUUi/A9Y7JN1bZme3tteky5X4i
 Q8q6H2MR3rLCD71oyLo30LUHAhOWdjAcXWLwCsBxfHt9M1/E2Lfri2S6Tk5uNVGCNR8t
 moDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712582377; x=1713187177;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XYIK4LJue/cF21wmqnutz+6NKwjmC1hO8sQh8o/YKFM=;
 b=ZZG/qMiUlKV7Yavy2CQJwkB3CI/kifr5ov7qi6eBkVbLce9a+e2giMcNtUD3E90OKJ
 Ab6LP361Ou3HQQ0tcO93cssQnf6YWlBxPuCDIHpTm7ZfhqJcykKaHhn+91PwjciE2Xmz
 HJJjuXyjI77nZl1bSVTVW41Bc8y9XoCmAaKfOHeieBxYvjx7uE2M55bK6GiE/lLfWIDu
 q7p76YXfEhg20yLTDwsiWShFVcKrqe94SzjCQO2gua257J2iZpi6hKU7EKLLeU7AUSgr
 L65lKwqMpal5PBKBsy8WWEMK6TQ0j5tXdJtyAiV3GEeiaozFf4qoiBNhUI950BdJ4vR/
 sHcQ==
X-Gm-Message-State: AOJu0Yz0WbYoEaGVkkOjfxcuXgHHhObXRWFzpoMddE1C7lt7EwUOnSe4
 CMNOPsj6vp5HZ4J9jw9h6g0Z/Jkbls94vP4/oMHdqxwO7jZ30nS5SDOWOCt65Gc=
X-Google-Smtp-Source: AGHT+IGxYINFTE0+L2NRQ33n6tYyXcB8vn7xaSfTbYTm2nlZEEHvY1s/I1R/oG9X6vidTNN9RnNa5w==
X-Received: by 2002:a5d:588b:0:b0:345:ca71:5ddc with SMTP id
 n11-20020a5d588b000000b00345ca715ddcmr2286456wrf.26.1712582376912; 
 Mon, 08 Apr 2024 06:19:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b0c8:7091:4315:491e?
 ([2a01:e0a:982:cbb0:b0c8:7091:4315:491e])
 by smtp.gmail.com with ESMTPSA id
 jg25-20020a05600ca01900b00416928e239csm633018wmb.35.2024.04.08.06.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:19:36 -0700 (PDT)
Message-ID: <e428656d-5e5a-46cb-9382-1d8fe7805759@linaro.org>
Date: Mon, 8 Apr 2024 15:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: Khadas VIM3/3L New TS050 support patch
To: Jacobe Zang <jacobe.zang@wesion.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nick Xie <nick@khadas.com>
References: <d9b282de6a7846269b595d9bdae9102dTYZPR03MB7001ED3D869727EE9331530A803D2@TYZPR03MB7001.apcprd03.prod.outlook.com>
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
In-Reply-To: <d9b282de6a7846269b595d9bdae9102dTYZPR03MB7001ED3D869727EE9331530A803D2@TYZPR03MB7001.apcprd03.prod.outlook.com>
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

Hi Jacobe,

On 08/04/2024 15:16, Jacobe Zang wrote:
> Subject: [PATCH] drm/panel: add New TS050 Panel support
> 
> Hello all,
> 
> I have made some changes to the panel-khadas-ts050.c. Here is a brief overview of what has been done:
> 
> - Add dt-bindings in document.
> - Add New TS050 Panel timing sequence.
> - Make it compatible with the old TS050 panel.
> - The only difference between them is the timing, so I change the node in overlay to identify the specific panel.
> - Changes in DTS doesn't push, because preceding commits have not been merged.
> 
> The proposed changes have been successfully run on Khadas VIM3/3L.
> 
> Please find the patch attached/inline.

You should read https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html
and perhaps use a tool like b4 (https://b4.docs.kernel.org/en/latest/) to send your patches in text only,
you can follow https://www.marcusfolkesson.se/blog/use-b4-for-kernel-contributions/ for example.

I'm afraid this patchset will be rejected and not reviewed if sent in this format with patches as attachments.

Thanks,
Neil

> 
> Jacobe Zang (2):
>      drm/panel: add New TS050 panel support
>      dt-bindings: panel-simple-dsi: add New Khadas TS050 panel bindings
> 
> drivers/gpu/drm/panel/panel-khadas-ts050.c | 1119 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------
> Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 ++
> 
> ---
> Best Regards
> Jacobe 臧介皓
> Amazing Khadas, Always Amazes You!

