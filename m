Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A5E7F6EFF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0501210E7BC;
	Fri, 24 Nov 2023 08:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081F10E7BC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:56:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-331733acbacso1109257f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700816217; x=1701421017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YpH25VVaDNC+MLoaQ1DB8fQgI4xWo2G6evnD7UeJlN4=;
 b=XmA1/RRg3pRJjVTk6pfw7n5+5X2xwP8uQ9GBF7Wt7ufolYxMbcOKutK/4Zu+rPOqkq
 FNlqI/I9M+jowgtwGCgvapF2fm+WnghE/1x/ZvNLX8neAVy/9jGJWHVA4mk9J/FRF7Q5
 l8bzulW2JS6wpynYb8chFUmjlqw0YM+l7y3dTgjyQGTyrz/S3YKfMIt4gZQkPSjJVMJM
 ruA3xAF9u0fVBr+VWHiMXb0HINj9nWB/sGLDNprMszNepbvXRJBA8mGUBb/D75PXsgKl
 Mgl5NOgeDbxcrqL+3xIKTfXkHsHkgdOfFA9R5/eruUEvK0jhpCljf1yO5Hy4XhAi5+h2
 WPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700816217; x=1701421017;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YpH25VVaDNC+MLoaQ1DB8fQgI4xWo2G6evnD7UeJlN4=;
 b=Bpl90IrkTgNuxyy9qrlGMMfZIFQWp1oIazZVm98SI76N+Sw84HSi/SCIeFWaQiMJw4
 nzKmiTbjtzW2L4o+kPlow2FYNj6AIEPPn4iKCzipPSy9hNfby0lsXMC6cavjnXJmGP0X
 cWfyqxHnU9y+yf0BG/NrUmpe3RpG+ftrqj2DbQvwmvh/IOHnHIV17QGzs6M03//MkiUd
 0m/Fe9VtJTXVXddGsyEaV5kV6DJqRhbO6wEhbNDSiVy30uqYJmbrd2lwQ6BSx3evzCqh
 094TRrKEm7zLTitsRxS/R+J5PDHo4Qsr5iFacJVgKwvoBGBfTUtOPdFY8RUh/P4t3fDP
 eISQ==
X-Gm-Message-State: AOJu0YxUf1EVSgeeDS7pdmEh/02fxqFw+F1KUt9YV/tAsEzlRdWok/o6
 ZA4Ps/rsCqKZ/k/UFIuPGJYAWw==
X-Google-Smtp-Source: AGHT+IHKrBFiTM1eUf+Hew9RZCRNUuBzh187e1KaFVdMuek5xFss9FyZAScmjB5qqfczxYA1gu2Jkw==
X-Received: by 2002:adf:fd8f:0:b0:331:6ae6:d25f with SMTP id
 d15-20020adffd8f000000b003316ae6d25fmr1660069wrr.26.1700816217395; 
 Fri, 24 Nov 2023 00:56:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4?
 ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d480d000000b00332cb0937f4sm3757284wrq.33.2023.11.24.00.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 00:56:56 -0800 (PST)
Message-ID: <b1fde098-edde-4c44-b73f-a429f5d62f8a@linaro.org>
Date: Fri, 24 Nov 2023 09:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] drm/bridge: ti-sn65dsi86: Some updates
Content-Language: en-US, fr
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
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
In-Reply-To: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23/11/2023 18:54, Uwe Kleine-König wrote:
> Hello,
> 
> this is a series I created while starring at the ti-sn65dsi86 driver in
> the context of my pwm-lifetime series.
> 
> The first patch should be fine. The last one has a few rough edges, but
> maybe you like the direction this is going to? The 2nd patch probably
> only makes sense if you also take the third.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>    drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()
>    drm/bridge: ti-sn65dsi86: Change parameters of
>      ti_sn65dsi86_{read,write}_u16
>    drm/bridge: ti-sn65dsi86: Loosen coupling of PWM to ti-sn65dsi86 core
> 
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 146 +++++++++++++++-----------
>   1 file changed, 83 insertions(+), 63 deletions(-)
> 
> base-commit: 4e87148f80d198ba5febcbcc969c6b9471099a09

It looks fine to me, even without the goal to move the driver to drivers/pwm
I think it's same to move the pwm ddata out of the main pdata ans associate
it to the pwm aux device lifetime.

I don't anything wrong, and so far it's of for me, let's see if there's comments
for other people before applying!

Thanks,
Neil
