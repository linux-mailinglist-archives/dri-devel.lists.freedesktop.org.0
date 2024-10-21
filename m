Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D119A60B6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2266310E46B;
	Mon, 21 Oct 2024 09:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mQhhPkcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B3410E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:54:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so12226415e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729504445; x=1730109245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4qi7OYn87uV2q8GTh+ArF53BAcD9TZF/0fbdqswgZQc=;
 b=mQhhPkcRwOxWyNUIB3I3ydlzr6vo42y6EcW3n+Lb0qi882huw6eBGzicxAcxLgWJmW
 /vQMK69cfXpNh3Bs+Mpj6ESi+gyDUhONRPhKJrolciapm7/Wka0MG+pE9YqwX/YX3quE
 8vmJGvMjPJ+jygAawgIoy61D79ttSPhqScoNNWzkFoGKOpbKanHKGIZez+tuS6nBS725
 fdGFyRJaN12JL1NEGJLJTyDmY+BaTHNBpoY0eSdWfHzKfCuT3wDqAoAomNrA6obU/8Jl
 OhTh5g1GOrEz7mwgvTasRdXM9tA3UV0oV79Rq5xgCYq93kuutS1AYwh/lskcBO1caTHC
 cPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729504445; x=1730109245;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4qi7OYn87uV2q8GTh+ArF53BAcD9TZF/0fbdqswgZQc=;
 b=VIwLEtTd6v4G76YDLwypy1740B3AnyiF0X1znwAtzj8Uw1hF+zh3xEnoD43CIaHRYt
 b2a8ZvD+1OsDREv+hbWB4t+6Ho2ue/R2xjKAxQfX6CN9YjXDzlXuSpgneNErlW7YE2tX
 hQiftlDV698smWRydZxxwXMqy4GMXHaVPGFzwd1hSHGMtJD4SkT49CYdJ+s0tcjLtRnM
 b6f+xnl/HLq8z8drkQCWoveXfrFT2bFSxb63n0MImMVKitV4iQKq0d1PoP/pLFAd1yvj
 JoO1mJLX26tGzuH4Dza7ET9X5fxKRTXhNgAqUGhLV4405Bh9wb7ODg9OxtPi19fj6cE1
 4GYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDJYatui4ydCoonnVs4G4ayguzHEDieB51JhTCQFnl+fZsL0hW7t7VH/k81tALc54z/ZZ+De18CZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnCcPHoHzoPw8m1tu7necxEW0nlL/0nOu13yiFX3G207soyE6O
 Elf5trU75tUUIHfggPgbu2sLN4SLQVObzAGAVWuatTcTjkSNFgJkxH+Mo7W3Nn0=
X-Google-Smtp-Source: AGHT+IE9JUG+K0WiGUxbiRQjV6Ys6ZBgKlpyp4KdsaqN6dI9kfVnMsINzdIld9EWOaNctSRAQ0i66A==
X-Received: by 2002:a05:600c:c8a:b0:431:2b66:44f7 with SMTP id
 5b1f17b1804b1-4316169737dmr79858395e9.31.1729504445445; 
 Mon, 21 Oct 2024 02:54:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f570da9sm52614305e9.5.2024.10.21.02.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:54:04 -0700 (PDT)
Message-ID: <88d16fd7-eac5-447b-8926-00eb8bafe3ff@linaro.org>
Date: Mon, 21 Oct 2024 11:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
 <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
 <CAA8EJprfpKqJBvrS_dLKy40LHOaL4XVSpmXMGP__z1jsOjZ7Ag@mail.gmail.com>
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
In-Reply-To: <CAA8EJprfpKqJBvrS_dLKy40LHOaL4XVSpmXMGP__z1jsOjZ7Ag@mail.gmail.com>
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

On 21/10/2024 11:06, Dmitry Baryshkov wrote:
> On Mon, 21 Oct 2024 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
>>> Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
>>> bridges in the chain still might limit YCbCr 420 support on the
>>> corresponding connector.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/bridge/display-connector.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
>>> index ab8e00baf3f1..aab9ce7be94c 100644
>>> --- a/drivers/gpu/drm/bridge/display-connector.c
>>> +++ b/drivers/gpu/drm/bridge/display-connector.c
>>> @@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
>>>        /* All the supported connector types support interlaced modes. */
>>>        conn->bridge.interlace_allowed = true;
>>>
>>> +     if (type == DRM_MODE_CONNECTOR_HDMIA ||
>>> +         type == DRM_MODE_CONNECTOR_DisplayPort)
>>> +             conn->bridge.ycbcr_420_allowed = true;
>>> +
>>>        /* Get the optional connector label. */
>>>        of_property_read_string(pdev->dev.of_node, "label", &label);
>>>
>>>
>>
>> I think we should make sure all HDMI bridges can filter out 420 before
>> landing this, no ?
> 
> No, it's the other way around: if one of the bridges in a chain
> doesn't set 420_allowed, then 420_allowed won't be set for the
> connector, disallowing YCbCr 420 modes.
> Before this patchset the bridge / platform drivers had to manually set
> the flag on the created connector (see dw-hdmi + meson-encoder-hdmi or
> msm/dp).
> 

Right, sorry for the noise...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
