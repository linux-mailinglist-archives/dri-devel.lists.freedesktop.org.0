Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAC19622E0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331D010E4C9;
	Wed, 28 Aug 2024 09:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AoK9mdGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D082A10E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:02:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3718ca50fd7so4064833f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724835728; x=1725440528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5Z4NxETDH0rFSk+745J6bpRFGLfHusheDiIWrN8jBhk=;
 b=AoK9mdGaKTyLimIQkwf5wuKRunign9Ac9MhsQcYsuA0aOGNib2FfLJ10FzlbtxqtcF
 ef5NfLkS7th6rj3u3mU162tBFIwyuV4XIG6u1b7M5woKKkqP4hEu0A4I9QSi6x6eoJCV
 NlynzjdD3IfQ+/pzsxEqzHqnQ8OqUda5FiYF8/QWUoyABI4tAcejOf7OljrMd3z84G5R
 RVq3gUfEKHLS3FWojlzP1wSQMA5cMyRctL45WVL3c+IepTrIwCloiO/bqMmeZzHx1wrt
 Bb2TGYTvpn7v5904QrQbDcr2HzZpw9e+T7mhiTQ6RgfgbYuFkqeKFeHdg2FPZqWa5+ib
 Nuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724835728; x=1725440528;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5Z4NxETDH0rFSk+745J6bpRFGLfHusheDiIWrN8jBhk=;
 b=DoTjFnBVX6tAy2xc/ceYNe4dBNRBFzmBh7NWIkHef7gHdxFkC0kmhHmnSjnBygwuN5
 CBIq4dERLYhC0Jb1xFKM12X/JFGL+6D3C3xy9osCePo4hjGApE9pKLPxFo7bDCs+vXcO
 qYbhi2YELalaCr1zaqAnwJj3NhQ0uZuJEpJG+c9Vg3HAcGFq0F+55cobHmpk8DeKFc/4
 q48Y2fgV3z81YQb0Yg1AT7ELqmBUhgMILpA9a+KecWOsSqrEomxmHjVeb0ozgjVqa1zT
 YEyWsBOiAvSj/ogLnZRfgIC6Z8jz0AY8ZZJZS89rQRgS/sNGW/zi2fzhbGfVzAHAPO5G
 1VRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg2Hq3yqyuy5Mp1lp8GxX11ehjbHvxDHCeBomHjFqoAdyh1huVmL0ByFLHSDDTbMArqdEjDMwU6Vo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJtNy7RJhEZcPFWKbjtE2CW0BWKXzc5o4kTfqi4gPPv4UZ/V/B
 Y1zNy7Q0kx8IaGzdSvYEfJ7n5rn3vG5r1jQPVlAHYg1c7hXhpUNmcSp9mbgqEKE=
X-Google-Smtp-Source: AGHT+IFmdAK9+lZzMofTlrPBow7WEkGGYo1oX9YCwv64L8aM54t+v71mKdHMhcNTUKhnMvxpvZFm0g==
X-Received: by 2002:a5d:6041:0:b0:367:4383:d9b4 with SMTP id
 ffacd0b85a97d-37496859743mr787025f8f.56.1724835727419; 
 Wed, 28 Aug 2024 02:02:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:765d:64ff:5f38:550?
 ([2a01:e0a:982:cbb0:765d:64ff:5f38:550])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730815b420sm15057475f8f.50.2024.08.28.02.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:02:07 -0700 (PDT)
Message-ID: <e3dee615-1df5-400c-82a3-3baff08c66bf@linaro.org>
Date: Wed, 28 Aug 2024 11:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: add BOE tv101wum-ll2 panel driver
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
 <20240709-topic-sdm450-upstream-tbx605f-panel-v1-2-af473397835d@linaro.org>
 <CAD=FV=VL1Wxd0veW7N+0Hy=LdKMzNbBang9_EZ9Zo_d-wZOBfw@mail.gmail.com>
 <dfb29dca-7110-4c11-b86e-9063f71a8ada@linaro.org>
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
In-Reply-To: <dfb29dca-7110-4c11-b86e-9063f71a8ada@linaro.org>
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

On 24/07/2024 09:50, Neil Armstrong wrote:
> On 23/07/2024 21:17, Doug Anderson wrote:
>> Hi,
>>
>> On Tue, Jul 9, 2024 at 6:06 AM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>

<snip>

>>
>>> +static int boe_tv101wum_ll2_get_modes(struct drm_panel *panel,
>>> +                                     struct drm_connector *connector)
>>> +{
>>> +       return drm_connector_helper_get_modes_fixed(connector, &boe_tv101wum_ll2_mode);
>>
>> Random question for you: on panels that don't use the
>> drm_connector_helper the "bpc" gets set here. Is there a reason why
>> some panel drivers (like this one) don't set bpc?
> 
> Good question, I'll check

Ok so the documentation says :
https://elixir.bootlin.com/linux/v6.11-rc5/source/include/drm/drm_connector.h#L698
	 * @bpc: Maximum bits per color channel. Used by HDMI and DP outputs.

and looking at the code, all drivers considers bpc=8 when unset.

but yeah ultimately drm_connector_helper_get_modes_fixed should have a variant to set the bpc
when != 8.

In this case it's useless.

Neil


<snip>

