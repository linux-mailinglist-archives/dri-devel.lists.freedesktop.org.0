Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9587EA92
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FF810E2FC;
	Mon, 18 Mar 2024 14:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xFUnSs3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9752010E2FC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:08:07 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4142296d8aaso3491775e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 07:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710770886; x=1711375686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3nPK3ysxs1xx6fjG3/EoRSQ40WVHya8WPq6yF/INz0c=;
 b=xFUnSs3j4A36ue3qZoHc0yZeNCZjAQoRCZtpFhAuxEe0m5aL6e3lpKTHxwW6HLnVWf
 XpNXlAnav6GASyQrj5b7vj9Xb6GPyzabJxHnvcX8QwhlkBUmYficd5ep+FxJmg8HCWFx
 rZveRi8b1ZifilY6F+/CZBPG7dGcD1lWB0ClFZGx3IEwf3qDd8QQIHp1tWW0H0FIYSlM
 JYrbI4qoI3OeTLYus68BzO4bLR5ZU/o2eqeVGKgKrMCHrchq7G0TB8YowAJtKQi2TQqG
 CJp4XjnkdguRpWIGf6y2QkEDeZlLBU/mV0gF+/wi++huhvKTC1CTXFkhn615Hsd8A7qd
 n6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710770886; x=1711375686;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3nPK3ysxs1xx6fjG3/EoRSQ40WVHya8WPq6yF/INz0c=;
 b=qJN0DiGWlBweBZYqLdG63J1qgo9MtVq6EOFpNhz6INehDFBBV7aTH3qPNGDDNZlMTX
 ynEz/uChgizPHGu1jCc6DWu9jN7ZkCare/hzaPl565bvPeujGBi6WM2dIeQnnM2ePUMp
 +N0jMhw2Csl+BucCGw+sL2UwzIBUwBvEBspJkNTWBJFHVJLUr9PF6XVJNBqXL0SMbG6C
 hD2tOojDi7dhj9UIkh/Szo5h2A38lptsYeEBZDJ6lLwLT3+lwZ3ckM9fit41y6qAFfrp
 tw2R8zisGkjPjLrnT7JsbUy5ehw7nNW6tTxM25tQdm3TlUzRsyrFN3MhyarDRwhZmEpm
 tBgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhg5e00Lfz2Qeo7291WMoNsC8JBtR2VIZGeBYhDGLpbgyn6eEkm7ALeBikvl+UDHAvJcAINmwyQ3x7dU5QU8dGpQWI3aLNw2rhxGgweUXW
X-Gm-Message-State: AOJu0YwPFUPQOiT0cKe195e0mNttNnD/CqOdBzeYP2R06N6O3IgItG1O
 i2JLasi3tpCjmtn0w22jE/qemK8PexyFy90BrhRRiCA43cQXVPVMV6BmZ/YPwuw=
X-Google-Smtp-Source: AGHT+IHJPw11WaGYzy6KPpwU+OfAbIYVcsWo8Tev5a9gx3VLenR9TukZSv3QrHRWrps+Zw7pT00Rkg==
X-Received: by 2002:a05:6000:4021:b0:33e:7a42:68e2 with SMTP id
 cp33-20020a056000402100b0033e7a4268e2mr10505839wrb.21.1710770885373; 
 Mon, 18 Mar 2024 07:08:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc?
 ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
 by smtp.gmail.com with ESMTPSA id
 bu27-20020a056000079b00b0033ecbfc6941sm9630900wrb.110.2024.03.18.07.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:08:04 -0700 (PDT)
Message-ID: <c2d86017-7523-4f4e-ace3-980689b7a881@linaro.org>
Date: Mon, 18 Mar 2024 15:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Luca Weiss <luca.weiss@fairphone.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
 <87wmpzq0bp.fsf@intel.com> <ZfhEpBLfAHk3JdlM@intel.com>
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
Organization: Linaro Developer Services
In-Reply-To: <ZfhEpBLfAHk3JdlM@intel.com>
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

On 18/03/2024 14:41, Ville Syrjälä wrote:
> On Mon, Mar 18, 2024 at 12:52:10PM +0200, Jani Nikula wrote:
>> On Mon, 18 Mar 2024, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>> Hi,
>>>
>>> On Thu, 11 Jan 2024 13:38:04 +0100, Luca Weiss wrote:
>>>> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
>>>> bridge/panel.o to drm_kms_helper object, we need to select
>>>> DRM_KMS_HELPER to make sure the file is actually getting built.
>>>>
>>>> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
>>>> be properly available:
>>>>
>>>> [...]
>>>
>>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
>>>
>>> [1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
>>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3f18b0dd1db242791afbc3bd173026163ce0ccc
>>
>> With my kernel config, e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER
>> for DRM_PANEL_BRIDGE") leads to:
>>
>> WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
>>    Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
> ...
> 
> All the defconfigs in drm-rerere also seem to fail here.
> 
> Neil, are you using some weird .config, or did you not actually
> build test this before pushing?


It definitely built fine, but my config test is not extensive and went through it,
I'll send a revert patch ASAP.

Neil

> 
> PS. the drm-rerere defconfigs seem pretty outdated (eg. missing
>      tons of panel drivers). Would be good if someone could update
>      those to provide better coverage
> 

