Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768BE9169FC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86B810E667;
	Tue, 25 Jun 2024 14:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cfoMPuRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E408910E667
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:16:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-421cd1e5f93so42207705e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719324981; x=1719929781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/XbwCezfhWbmSEC4HDR62w3HCK7ee4grHDBBWM8UBvM=;
 b=cfoMPuRiiqhvknt3X72eqy5qW6csWPtl81LSwnbikimWcjfEekVIkci0zDWEJQytjD
 4xLNI9k+gUEy7t5lEjfUk3OzyPWOI8jqou5wKE4OSwDQ/+5DXiT6OOFy1U8Ogd9+BHOr
 fK9fKSADIjp0qKHB1yYX4LxlMk+iTILa6LrkbY15WMVhIqEJRJkBYmKyfQQjrzVwVCI1
 KGLXNtRbV/qithl49hIYZPdDwS0sWK5INHXjCBdK4Pjvs8oIeWF+omVAQu5NfU13Sjuo
 KJyOeMc4FvLx4c4DM+I6jygDgcmGJdKWS02hJjdmzH1xpzGUF3pxYA+aPphYloN6XvB5
 H90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719324981; x=1719929781;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/XbwCezfhWbmSEC4HDR62w3HCK7ee4grHDBBWM8UBvM=;
 b=elF4KhaPJkUaMi4i00HZKULCwDqz9Amc5jhIzumY1ggamB/wD1od8X52M22CTVsK3d
 sokBnDnWoNunWwupeYK+cGN81yFGLM6c4/sfBYm3m+c30cRB5hqIcALhajLZPZOFG42h
 qHX2Rxz+igb4+TEw5MnXRQEqfJymLF/e7GQJ/Cqzj6mJCiM9dWq08GAHLYv3DZVVp8q2
 vNi8+YJL/JghBaCz8FFI9eCklRefflVTnMUnQAsqRS4QdGO43MECW8Y7LyKv5VaknLal
 n1CwM5bG3LnsMH/I30ImUMvgrSExLupidd65ym5L7og15/D3uBK7RjJbZx9806im7mwE
 W/Gg==
X-Gm-Message-State: AOJu0YxhfIifLRJ6e9DiHR+iAiwg376JbiEE3YkI69/hpBtqllB3WM83
 Tn3hzTwpvXvO0M1lqjQIFrHnEWfM3E0LIXWYfYdj9FSsOybTMHUgAUsdyBEBmgE=
X-Google-Smtp-Source: AGHT+IEDwR3R+Yc2zndJ2m2H9HBzMvQCVx6dbHj7Y+/+ZwJjUOOAdQw1yOvr/BHHrG5A7T3tsUhPPQ==
X-Received: by 2002:a05:600c:4658:b0:420:66e:4c31 with SMTP id
 5b1f17b1804b1-4248cc6693fmr67042985e9.34.1719324980468; 
 Tue, 25 Jun 2024 07:16:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a?
 ([2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c54e4sm217625085e9.23.2024.06.25.07.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:16:20 -0700 (PDT)
Message-ID: <1de36429-a27a-4244-8e39-4cb0b09b2689@linaro.org>
Date: Tue, 25 Jun 2024 16:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: display-connector: Fix
 atomic_get_input_bus_fmt hook
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Jai Luthra <j-luthra@ti.com>
References: <20240625095049.328461-1-a-bhatia1@ti.com>
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
In-Reply-To: <20240625095049.328461-1-a-bhatia1@ti.com>
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

On 25/06/2024 11:50, Aradhya Bhatia wrote:
> The display-connector acts as a pass-through bridge. To truly reflect
> that, this bridge should accept the same input format, as it expects to
> output. That in turn should be the same as what the preceding bridge has
> to output.
> 
> While the get_output_fmt hook does exactly that by calling the same hook
> of the previous bridge, the get_input_fmt hook should simply propagate
> the expected output format as its required input format.
> 
> Let's say bridge(n) converts YUV bus format to RGB before transmitting
> the video signals. B is supposed to be RGB and A is YUV. The
> get_input_fmt hook of bridge(n) should receive RGB as its expected
> output format for it to select YUV as its required input format.
> 
> Moreover, since the display-connector is a pass-through bridge, X and Y
> should both be RGB as well.
> 
>      +-------------+            +-------------+
> A   |             |   B    X   |             |   Y
> --->|  Bridge(n)  +--->    --->| Display     +--->
>      |             |            | Connector   |
>      |             |            |             |
>      +-------------+            +-------------+
> 
> But that's not what's happening at the moment.
> 
> The core will call get_output_fmt hook of display-connector, which will
> call the same hook of bridge(n). Y will get set to RGB because B is RGB.
> 
> Now the core will call get_input_fmt hook of display-connector with Y =
> RGB as its expected output format. This hook will in turn call the
> get_input_fmt hook of bridge(n), with expected output as RGB. This hook
> will then return YUV as its required input format, which will set X =
> YUV.
> 
> This is where things get off the track. The core will then call
> bridge(n)'s get_input_fmt hook but this time the expected output will
> have changed to X = YUV, instead of what ideally should have been X =
> RGB. We don't know how bridge(n)'s input format requirement will change
> now that its expected output format isn't RGB but YUV.
> 
> Ideally, formats Y, X, B need to be the same and the get_input_fmt hook
> for bridge(n) should be called with these as its expected output format.
> Calling that hook twice can potentially change the expected output
> format - which can then change the required input format again, or it
> might just throw an -ENOTSUPP error.
> 
> While many bridges don't utilize these APIs, or in a lot of cases A and
> B are same anyway, it is not the biggest problem, but one that should be
> fixed anyway.
> 
> Fix this.
> 
> Fixes: 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks")
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/bridge/display-connector.c | 40 +---------------------
>   1 file changed, 1 insertion(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index ab8e00baf3f1..eebf1fbcdd23 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -131,50 +131,12 @@ static u32 *display_connector_get_output_bus_fmts(struct drm_bridge *bridge,
>   							      num_output_fmts);
>   }
>   
> -/*
> - * Since this bridge is tied to the connector, it acts like a passthrough,
> - * so concerning the input bus formats, either pass the bus formats from the
> - * previous bridge or MEDIA_BUS_FMT_FIXED (like select_bus_fmt_recursive())
> - * when atomic_get_input_bus_fmts is not supported.
> - * This supports negotiation if the bridge chain has all bits in place.
> - */
> -static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
> -					struct drm_bridge_state *bridge_state,
> -					struct drm_crtc_state *crtc_state,
> -					struct drm_connector_state *conn_state,
> -					u32 output_fmt,
> -					unsigned int *num_input_fmts)
> -{
> -	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
> -	struct drm_bridge_state *prev_bridge_state;
> -
> -	if (!prev_bridge || !prev_bridge->funcs->atomic_get_input_bus_fmts) {
> -		u32 *in_bus_fmts;
> -
> -		*num_input_fmts = 1;
> -		in_bus_fmts = kmalloc(sizeof(*in_bus_fmts), GFP_KERNEL);
> -		if (!in_bus_fmts)
> -			return NULL;
> -
> -		in_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> -
> -		return in_bus_fmts;
> -	}
> -
> -	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> -							    prev_bridge);
> -
> -	return prev_bridge->funcs->atomic_get_input_bus_fmts(prev_bridge, prev_bridge_state,
> -							     crtc_state, conn_state, output_fmt,
> -							     num_input_fmts);
> -}
> -
>   static const struct drm_bridge_funcs display_connector_bridge_funcs = {
>   	.attach = display_connector_attach,
>   	.detect = display_connector_detect,
>   	.edid_read = display_connector_edid_read,
>   	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
> -	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
> +	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
> 
> base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371

This will break dw-hdmi YUV output negociation because returning output_format
it won't even try to select something else than the connector output_fmt.

This is limitation of the bus_fmt negociation, it negociates in backwards, but
if the last one uses bridge_propagate_bus_fmt, and a bridge before depends on the
display support, it will be constrained by the first output_fmt.

Neil

