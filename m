Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD979B7A7F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED7610E2D8;
	Thu, 31 Oct 2024 12:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dDjocsqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040AF10E2D8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:29:27 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so6906395e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730377765; x=1730982565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UQjZxBSmS0nagomVi07puYwXxun+vOekud8EvxwhAn4=;
 b=dDjocsqSO8DNT1cjP+yAracOXIkztUqZffty2xMfq1rsaa2wqD05WsAHzT+St5S32j
 dE+0x5aDPAK+DrLtY5UrIZPAF8x37BMpZqd0M6zCmIvzGTIpnMV9lKTXMxzQUtw39FFz
 LEpYhQibaM0otCYhZY7skXYkadT3U9SLDfZd7dURZS367byLCvFp+Nkh5iH7xRgfWx/g
 B+K+wNB/j47f6usr32WHcdoszRTMKq2IYcq5GFzOXdu361WPwKSMyXj/SyDBfpKoYUEn
 fpIsbpAjXjCsIKym+QOjCZe1LWrY9TDWNnOOspQCjjCo/uPocyHrWyuZ+CZnoGv/DtQE
 0TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730377765; x=1730982565;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UQjZxBSmS0nagomVi07puYwXxun+vOekud8EvxwhAn4=;
 b=hn9rlL3weVG6lWtQGITZrQljbkx6YqP0eNZezulWIbb1C0nrtcyyCg0thQfR8ZZ6j7
 oQ9ipRuvQNOupyMOvr/UPoMiKaY5bPoNZ9kMFTJQIEPmvUBzEiKFrnaUU7sBB11Qob7Z
 JBqsT3XdkaSx4uVb8n0ENylWo74bEDt+HrLjB1+Em28/Y/SaTGZmb3XrC45mRohTOtCy
 gGZ/vYc1/kgDj5gD3yf5CP4q4I8aoCSJlxfgjaVAyR5IjMNnBceIwwBWKWYv67o0IP5q
 dZPH2i0Oa21XwCcIQQnR7sGc9CmVhGLJ2TzuJ1ZrE0I2gxfQov5f/tDq7jiPy5qUJXUJ
 /K6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFmVA1SwiNbZ7f7M4hdbzUkCHgnRmT4sMaCeQdodDp1pNo6btibejckCzo1R0x4dabOSnAZyF8WS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMGRPeZEdQbJAhrio8kMAbI25XXwTJ/zMHpqfRDinFwxuD0NIw
 nRJ07oGYkBTpnja7yiEBEYN8/1E6t91mdoLtwJBh6Mj7JTTa4UfAr0+36S470nw=
X-Google-Smtp-Source: AGHT+IGV3ikK4LIVn2AEbWDsvCMNTGZrNaaz9Bv2gNUYQPFFcoac/gExNqwApmsNW+NykCyyZ64SOA==
X-Received: by 2002:a05:600c:a01:b0:42c:ba83:3f01 with SMTP id
 5b1f17b1804b1-431bb984e8cmr62424155e9.8.1730377765149; 
 Thu, 31 Oct 2024 05:29:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514?
 ([2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5ab305sm24596425e9.7.2024.10.31.05.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 05:29:24 -0700 (PDT)
Message-ID: <eb0c7296-ed5d-4bf3-8fab-130216a6d87b@linaro.org>
Date: Thu, 31 Oct 2024 13:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ux2lfkaeoyakulhllitxraduqjldtxrcmpgsis3us7msixiguq@ff5gfhtkakh2>
 <f2119a4d-7ba3-4f11-91d7-54aac51ef950@linux.dev>
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
In-Reply-To: <f2119a4d-7ba3-4f11-91d7-54aac51ef950@linux.dev>
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

On 30/10/2024 17:45, Sui Jingfeng wrote:
> Hi,
> 
> On 2024/10/18 23:43, Dmitry Baryshkov wrote:
>> On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
>>> The assignment of the of_node to the aux bridge needs to mark the
>>> of_node as reused as well, otherwise resource providers like pinctrl will
>>> report a gpio as already requested by a different device when both pinconf
>>> and gpios property are present.
>>> Fix that by using the device_set_of_node_from_dev() helper instead.
>>>
>>> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
>>> Cc: stable@vger.kernel.org      # 6.8
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>> Changes in v2:
>>> - Re-worded commit to be more explicit of what it fixes, as Johan suggested
>>> - Used device_set_of_node_from_dev() helper, as per Johan's suggestion
>>> - Added Fixes tag and cc'ed stable
>>> - Link to v1: https://lore.kernel.org/r/20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org
>>> ---
>>>   drivers/gpu/drm/bridge/aux-bridge.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
> Technically speaking, your driver just move the burden to its caller.
> Because this driver requires its user call drm_aux_bridge_register()
> to create an AUX child device manually, you need it call ida_alloc()
> to generate a unique id.
> 
> Functions symbols still have to leak to other subsystems, which is
> not really preserve coding sharing.

???

> 
> What's worse, the action that allocating unique device id traditionally
> is the duty of driver core. Why breaks (so called) perfect device driver
> model by moving that out of core. Especially in the DT world that the
> core knows very well how to populate device instance and manage the
> reference counter.

This has nothing to do with DT, auxiliary device is a nice way to actually
use the driver model to handle devices sub-functions without overloading
drivers. It's still young and we need to collectively solve some issues,
but it's now agreed auxiliary device helps designing multi-functions drivers.

> 
> HPD handling is traditionally belongs to connector, create standalone
> driver like this one *abuse* to both Maxime's simple bridge driver and
> Laurent's display-connector bridge driver or drm_bridge_connector or
> whatever. Why those work can't satisfy you? At least, their drivers
> are able to passing the mode setting states to the next bridge.

HPD handling is now shared along all the bridges, because it corresponds
to a reality.

It simply takes in account complex uses-cases like Type-C Altmode where
we need to describe the connection between the DP controller and the
Type-C retimers/muxes and properly propagate HPD events to synchronize
all the chain.

> 
> Basically those AUX drivers implementation abusing the definition of
> bridge, abusing the definition of connector and abusing the DT.
> Its just manually populate instances across drivers.

It abuses nothing, the DT representation of the full signal path
in the Type-C complex was required by DT bindings maintainers.

The fact we can describe an element of the Type-C Altmode DP
path is very handy, and we have the full control of the data
path unlike x86 platforms where all this handling is hidden in
closed firmwares.

If you have an issue with the aux-bridge design please open a separate
thread, because the actual patch has nothing to do with aux devices or DRM
bridge implementation.

Please do not respond to this thread except concerning this fix.

Neil

> 
> 
> 

