Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4A8614D7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 15:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D704910EC39;
	Fri, 23 Feb 2024 14:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gOI0tzDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECE610EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 14:55:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412969705c2so2981005e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708700114; x=1709304914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YR4FOB3mTjpSyt3x+AV6258Jdc3Bc2u/zffBWrsEEk0=;
 b=gOI0tzDyjCM+Rgpogqk3c+aIHIZs/zKQwYDWoTzPrpMjR8Gphe2Txc89a91h61K1Zk
 oYVjwksYBV/VWyWYhcnCQgoRc2K7wFgAHa4GbLrVLcdBoSImZkT4mzCda0X96EVPDeUM
 BzzemrPKsJEe8I8iSlWVv8NsjXgiWkLM88AuBZ6/YoWRC8vNBxnE40fmRF7ooJ2/9YQQ
 gzkmrzsIb9GV/dVKNfQyKnidKARXZpyHWz+e+Rl1fWGpd7/cSQFJjqKSh/6gvMM5VHFB
 F280Z45+SaLlMYo0CyXqaYl4CO3Qh5v4jijvGl5PSOou7H8i7aQC5jNaiG7jUj727wLP
 NQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708700114; x=1709304914;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YR4FOB3mTjpSyt3x+AV6258Jdc3Bc2u/zffBWrsEEk0=;
 b=m8d4clRYLULGX4kxADVYOFyP2JR5YgtG7mzFG6oRSHmeHKSirp7w4W00zDkmcEuchc
 XDIvu27swcMM9z/T53DsbauS8puRC/YBiZtMRrdjhVwLxNPCnCbUt2vidaMCWtuZ+wRA
 J05+6XXPu7hJ3SOuBx/dCIcimvjZMRNnpC35qBbjoc/RIh7uAqVKDub2G3QWmEY2paTg
 pFqNpcFBlkfDLLQQ5xhy0wKgrKl0E1kZQOABRjPw/yt8IZ25eh4zy/j55TsJUGUBi2DL
 +wplC4+4+G/2DHeS6WWnEiaCLY4ohvw5G9u/Qa83RWa1yAk90UYhw2HosGi89rtseJuH
 FuGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpFtwc2sND11dJIiNNJpkSWwYnkVAEFv0zKoIwMfkfRwYJXusikP5qW0xjBsLP9DF0svcYxTyfMlnDTpRURuZJ3LhKGuaRJIUfMPKT86nq
X-Gm-Message-State: AOJu0YyhoeR7+KmV7qiODSZGw06KYrUxYRZeLVJzxa2qImD068E8Rvo9
 F2fx56A3QI4xN5xMJdIeOhGQGQfhKMWfDmDXR0rWyyZNzKg0/zytnUDUVWkA+LI=
X-Google-Smtp-Source: AGHT+IGAy96HbSPMW3k44GU39oK9LfJtPL+l0X+t5AUlvKsigL3XKGl9EWcCWb2kXfdcmrgGHf2JOw==
X-Received: by 2002:a05:600c:46d0:b0:412:5fbe:3740 with SMTP id
 q16-20020a05600c46d000b004125fbe3740mr36553wmo.24.1708700113947; 
 Fri, 23 Feb 2024 06:55:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58e3:6b80:c446:11f4?
 ([2a01:e0a:982:cbb0:58e3:6b80:c446:11f4])
 by smtp.gmail.com with ESMTPSA id
 fa15-20020a05600c518f00b0041294a1d7bcsm2314742wmb.36.2024.02.23.06.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 06:55:13 -0800 (PST)
Message-ID: <b5401b19-09d9-4907-86d6-9aab9dc2970e@linaro.org>
Date: Fri, 23 Feb 2024 15:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-US, fr
To: Johan Hovold <johan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
 <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
 <ZdiqAPPTn9SvsjL8@hovoldconsulting.com>
 <77715ecd-ddb9-450c-98bf-4fcade0e81c0@linaro.org>
 <ZdixFo2EjUQDgeFh@hovoldconsulting.com>
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
In-Reply-To: <ZdixFo2EjUQDgeFh@hovoldconsulting.com>
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

On 23/02/2024 15:52, Johan Hovold wrote:
> On Fri, Feb 23, 2024 at 03:38:13PM +0100, Neil Armstrong wrote:
>> On 23/02/2024 15:21, Johan Hovold wrote:
> 
>>> But it is *not* standalone as I tried to explain above.
>>>
>>> So you have to drop it again as the later patches depend on it and
>>> cannot be merged (through a different tree) without it.
>>
>> drm-misc branches cannot be rebased, it must be reverted, but it can still be applied
>> on drm-misc-next and I'll send a revert patch for drm-misc-fixes if needed, not a big deal.
>>
>>> I thought you had all the acks you needed to take this through drm-misc,
>>> but we can wait a bit more if necessary (and there's no rush to get the
>>> first one in).
>>
>> If you want it to be in v6.9, it's too late since the last drm-misc-next PR has been sent
>> yesterday (https://cgit.freedesktop.org/drm/drm-misc/tag/?h=drm-misc-next-2024-02-22)
>>
>> Please ping Thomas or Maxime, perhaps it's not too late since the drm-misc-next tree
>> really closes on sunday.
> 
> I don't want this in 6.9, this is needed for *6.8* as this fixes a DRM
> regression in 6.8-rc1 that breaks the display on machines like the X13s.
> 
> If you guys can't sort this out in time, then perhaps Bjorn can take
> this through the Qualcomm tree instead (with DRM acks).
> 
> But again, this is fixing a severe *regression* in 6.8-rc1. It can not
> wait for 6.9.

Right, I can't apply them right now, I send a patchset ack so it can be applied ASAP,

Thanks,
Neil

> 
> Johan

