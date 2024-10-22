Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F49AA1F9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 14:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD21410E316;
	Tue, 22 Oct 2024 12:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cM4DjDjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D7010E316
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:15:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4314c452180so43824975e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729599358; x=1730204158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hzfBBiQZO/3JmQPAp3trpD9H/FhA5SSKZP4PSmekS78=;
 b=cM4DjDjC1K2mOrzJ9Lme8mCW2FsowQguXr8EdIVCovQLTMEIz6QzXc2TXCvJC0Yj0X
 ObSznX1nfR1SDRoUBbb3b3bznK2xNO7wBYS2mBHBw6Mfg09moiMHaCfxfw7hIDPd6+Bu
 vvbQ3+FEsNbzD9ebBjDv2lSqqo7d6l0BSHtfRBMvp4FPfbh+66n0q8Ysi+aPGCDn0cI6
 Bf0L4jE0mpq+3pI6SuuAmcml/RqqCvFtTo4+02pCSIBdSzBolvaiJj4Ti5pBDS7QmIhf
 qkierOWxEKEEWnJ9DiIS71807BCBPlJ0PlfCAYeXkxuE7gE8/PSMgwpyw0LrzsGpDYYD
 ZbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729599358; x=1730204158;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hzfBBiQZO/3JmQPAp3trpD9H/FhA5SSKZP4PSmekS78=;
 b=pMrIbuBw629AkuAEuhIy0IsCXKzuDSgX7K5GI1IjB2ELZySQpPOnlWjDdHbFAWMHhx
 P1cIlMscLK1Q0slTKEiGmNVVAPe/3DKdzjizQVE62cTmJ8cngd6+xvNUSAe+WgGKnP03
 E0nhAcKraOnkPaa7fJA0HqpnKumNcotX8O1WWD+QJSkBq99WuI2oDbB1oY5oK8nA4b1E
 WqO4w4DtfjQS8+bZvfZU7XVgtcvmgcxR75PfNF4IoP7gfsY40ZJ0XTcAiFfBc7PClsWG
 pjXUrsqyvSl0AgD8PQcw+3iZhkpCiLvUFllybP7razosPhP+pshT+YMknhhWKwKuAOQl
 2IZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXNbO5MUXluUwXcA9A+D/dJJ84xQdcxSVK14/jei4yJkCNs7/SIzTFgWcd0s5wtRDHrHUck9uIgoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRV/UKstgyeomtxDA5PFewE0ft90MSntsqxvQDgqSL6m3LSELc
 hv7Vztr0fdP0w0DLqicq8RLQoQmrCH8kQDUrhCPvjCaNEd1OJkl77b8x8NTuWE4=
X-Google-Smtp-Source: AGHT+IHT8U2le7TP7Fhl0aRlnvkTfgE3DG0+6uSqVHO9u7XR2ZILafOv7A3oM9rdGHL/IP38m1XIAA==
X-Received: by 2002:a05:600c:1d8e:b0:431:4e33:98b6 with SMTP id
 5b1f17b1804b1-4317bd858camr19814435e9.5.1729599358069; 
 Tue, 22 Oct 2024 05:15:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:43af:403f:2c26:9ea7?
 ([2a01:e0a:982:cbb0:43af:403f:2c26:9ea7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cbe64sm86619065e9.40.2024.10.22.05.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 05:15:57 -0700 (PDT)
Message-ID: <ad1d1208-fb0d-4656-80e7-1af0e8a4e421@linaro.org>
Date: Tue, 22 Oct 2024 14:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
 <CAA8EJpoy=nYMix3m2n7KkwemCNoh_qg8FH0ENaa8VNcLtqZuww@mail.gmail.com>
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
In-Reply-To: <CAA8EJpoy=nYMix3m2n7KkwemCNoh_qg8FH0ENaa8VNcLtqZuww@mail.gmail.com>
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

On 21/10/2024 20:22, Dmitry Baryshkov wrote:
> On Mon, 21 Oct 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
>>> One of the features that drm_bridge_connector can't handle currently is
>>> setting of the ycbcr_420_allowed flag on the connector. Add the flag to
>>> the drm_bridge struct and propagate it to the drm_connector as AND of
>>> all flags in the bridge chain.
>>>
>>> As an example of the conversion, enable the flag on the DW HDMI bridge,
>>> MSM DP bridge, display connector drivers (for DisplayPort and HDMI
>>> outputs) and AUX bridges.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Dmitry Baryshkov (6):
>>>         drm/display: bridge_connector: handle ycbcr_420_allowed
>>>         drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
>>>         drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
>>>         drm/bridge: aux: allow interlaced and YCbCr 420 output
>>>         drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
>>
>> How do you plan to merge this serie ?
> 
> Once Abhinav ack's the msm/dp change, I'd like to land it through
> drm-misc. I think it's the most logical way to go.

Yup, Abhinav acked it, LGTM

Neil

> 
> 

