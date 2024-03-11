Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16CC877BAD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7716D10EBD6;
	Mon, 11 Mar 2024 08:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FjzyfUCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240DD10E8D2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:28:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33e959d8bc0so707796f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710145687; x=1710750487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=eQZyryN683D1UORfEZL6ek1zynUu6qJYsZX7VCDYtD0=;
 b=FjzyfUCyQTkFcEV0U+wW1/bHDpEAvdYrGp9EGW1cSP7tYi8dvj/FFNnBv9hIkAVNZH
 mOrXdKsmZBvfvWv32bBvt3sk4X5BYeygEd9ajL0qQQvKXhU+e6LUp7EecOawIcL7TWXq
 D/oQCFM25csErfYmhjxnFBjtUnSLQDsg26spg1FtBAQiuUHgh7we9nGqLlBQJJtwJsx3
 NtppcK8c8+NvLOi6auhG4liFmhyOsstLy3KiEFImdOeQRuh4YS0xcyBrZX3o1mZhV6lI
 v3T48gG76nWeb/qtBuzW0MZa+dEUvhIiq11K4uvgasIhDAARSOcWaQAvJWka75ziAF6+
 KInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710145687; x=1710750487;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eQZyryN683D1UORfEZL6ek1zynUu6qJYsZX7VCDYtD0=;
 b=nFfE/wKvW8HvwQyvbEeXCzDOZMN6PgSsWw9uThy4EMLJ8BsBPBCOhlF7sux6j+6wqf
 PclyvsRAg362QTDLvdiMFEZZ/iqCA6y6S7fYsFcc6EEo2rA9xZE0YFCJGul9i2guAWU1
 Bn8Tueue078Gllcq64fYLPan4prLEKuRpk80c5aPVpJTdM2p2cRZ+yRFm1qkmSjYatg4
 eWHfpbv8khGDVhEa6FSkaoee8dfEg0er5OKOL7NC92xhz0ANn29Hmh8Af6lnNbQfDjhg
 TkvfucSEZK6dcbT2jJfB83jJFt+kw8s/Ms+BoJAhqilYQ0h53IeQ8ycjScpKgD2aCi4K
 sefg==
X-Gm-Message-State: AOJu0Yys4vojjaoLOSDOWAOF4Ziv8pJ4faBhR97oI4sW5BZeziKOQnC6
 bGpaeHhel1M2j/wdW9Q8asfERZAdLsL7ZYxScAbj0tTOM2qKRC3Pb8U1lCppb+4=
X-Google-Smtp-Source: AGHT+IHbINzanyldEvlkSmneibzkSqU3a6J2oI5FuF7IR6+MnKCfeZNBOEClLGNdmRT/njkWXqrDlg==
X-Received: by 2002:adf:efc9:0:b0:33d:d96b:2614 with SMTP id
 i9-20020adfefc9000000b0033dd96b2614mr3432292wrp.54.1710145687199; 
 Mon, 11 Mar 2024 01:28:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48be:feb9:192b:f402?
 ([2a01:e0a:982:cbb0:48be:feb9:192b:f402])
 by smtp.gmail.com with ESMTPSA id
 bx27-20020a5d5b1b000000b0033e7eba040dsm2892975wrb.97.2024.03.11.01.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 01:28:06 -0700 (PDT)
Message-ID: <e06f2792-d8d9-436e-980b-43fb2b27dda2@linaro.org>
Date: Mon, 11 Mar 2024 09:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: correct DRM_BRIDGE_OP_EDID documentation
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org
References: <20240310-drm-bridge-fix-docs-v1-1-70d3d741cb7a@linaro.org>
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
In-Reply-To: <20240310-drm-bridge-fix-docs-v1-1-70d3d741cb7a@linaro.org>
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

On 10/03/2024 00:38, Dmitry Baryshkov wrote:
> While the commit d807ad80d811 ("drm/bridge: add ->edid_read hook and
> drm_bridge_edid_read()") and the commit 27b8f91c08d9 ("drm/bridge:
> remove ->get_edid callback") replaced ->get_edid() callback with the
> ->edid_read(), they failed to update documentation. Fix the drm_bridge
> docs to point to edid_read().
> 
> Fixes: 27b8f91c08d9 ("drm/bridge: remove ->get_edid callback")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   include/drm/drm_bridge.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 3606e1a7f965..4baca0d9107b 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -541,7 +541,7 @@ struct drm_bridge_funcs {
>   	 * The @get_modes callback is mostly intended to support non-probeable
>   	 * displays such as many fixed panels. Bridges that support reading
>   	 * EDID shall leave @get_modes unimplemented and implement the
> -	 * &drm_bridge_funcs->get_edid callback instead.
> +	 * &drm_bridge_funcs->edid_read callback instead.
>   	 *
>   	 * This callback is optional. Bridges that implement it shall set the
>   	 * DRM_BRIDGE_OP_MODES flag in their &drm_bridge->ops.
> @@ -687,7 +687,7 @@ enum drm_bridge_ops {
>   	/**
>   	 * @DRM_BRIDGE_OP_EDID: The bridge can retrieve the EDID of the display
>   	 * connected to its output. Bridges that set this flag shall implement
> -	 * the &drm_bridge_funcs->get_edid callback.
> +	 * the &drm_bridge_funcs->edid_read callback.
>   	 */
>   	DRM_BRIDGE_OP_EDID = BIT(1),
>   	/**
> 
> ---
> base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
> change-id: 20240310-drm-bridge-fix-docs-0fd12bc6a041
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
