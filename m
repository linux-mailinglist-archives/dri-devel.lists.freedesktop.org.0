Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A77FB6E0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE2510E475;
	Tue, 28 Nov 2023 10:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA9310E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:13:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b474c925bso11504265e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 02:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701166425; x=1701771225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=V/bPqzwcXSoaxZqZzSa+865x33KMqhVaJChFNtyeUsQ=;
 b=GQYNn7F+UD6Los5u1Ad0EZsbYQNSqwcNquJgVHtUZwQBKdlJEtRdmO4VLAyFmpgnuY
 JawT4LWitWYXx8QPBxhb+TSxdd3NKPiIkTO6kIm1azJZ3CIQ8HkxW8lBHdTllBtjmBWk
 xf5yi+vf6Ro9jAwoAeMTrChZ6iWTSC+l5lrOAtKlnSHdBQS6GhXdZGnwIDZwusQFPnM2
 ZMcQGzz0g4wZbC7gmDdvGLv8ZTOVCJQ6D/fb9gbuwzepReGtmzKkLEYREl3Nfv0gmeh4
 EY1Dk70AhgkrJBUXOy41cztbmzzATpXN0Dk/NDjLXPvshWkHPK/5njbs2X5AkLeHVRY+
 Ytlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701166425; x=1701771225;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=V/bPqzwcXSoaxZqZzSa+865x33KMqhVaJChFNtyeUsQ=;
 b=BxiP0PxjI9X/BICylyDMMqvyJdfp4Jqr/1QYTta0EzalqFQukPJBAL1R4DGNIyUHKO
 og9C2V6UJTDYX4jhPAvcxLyq3VgjBX77e2wWq/u6N36KtboyIwmQHPjYB9VQc1lHRPUW
 Nx8y3G70aFeyW+wdf4LObr3Qrt0hibydsRMjeqi22W3U4OfjI6SKqaJzl2Hz1OjwzaIZ
 4SNf1M1ZrpSkwsVPWkHMrLl/ubWOGn9I8rvis3u7tOywNE3/NRg3N1S703YwTbQCX/vO
 doprnSJ44n/Ol/Z2dbA4k/UXFtFN8KLdh/plIyp4pEBXejcXLyGOWq8OZzHeoCXqJQzi
 HW/w==
X-Gm-Message-State: AOJu0YwllsAwi+RHKgLTkQl9Qxw/upVkekQV5oisWFBQl28bbKihp+V0
 +vy2Iue+8PkV88F91yjhzyC25w==
X-Google-Smtp-Source: AGHT+IFReERGOX7oXJ+dIqXvZzDJECETDbU4qHYNGhN6de5X76QTA6m4TBcX09Ww4m6To4duFCSYTA==
X-Received: by 2002:a05:600c:4f16:b0:40b:3633:9380 with SMTP id
 l22-20020a05600c4f1600b0040b36339380mr10281011wmq.33.1701166425346; 
 Tue, 28 Nov 2023 02:13:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003fefaf299b6sm17017275wmq.38.2023.11.28.02.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 02:13:44 -0800 (PST)
Message-ID: <b6d79cad-a545-48cb-a0e4-e9fdc457bec3@linaro.org>
Date: Tue, 28 Nov 2023 11:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/3] Revert panel fixes and original buggy patch
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <170116632194.2250210.1478661000647719120.b4-ty@linaro.org>
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
In-Reply-To: <170116632194.2250210.1478661000647719120.b4-ty@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/11/2023 11:12, Neil Armstrong wrote:
> Hi,
> 
> On Tue, 28 Nov 2023 00:10:18 +0100, Linus Walleij wrote:
>> This series reverts the attempts to fix the bug that went
>> into v6.7-rc1 in commit 199cf07ebd2b
>> "drm/bridge: panel: Add a device link between drm device and panel device"
>> and then it reverts that patch as well.
>>
>>
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
> 
> [3/3] Revert "drm/bridge: panel: Add a device link between drm device and panel device"
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9b6a59e5db87c2c6b3ca0391176ed4358623d5e4
> 

b4 got really confused that I picked the patches in the wrong order, but I applied
the 3 patched in the 2, 1, 3 order.

Neil
