Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF3D83BEF7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 11:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED6410F891;
	Thu, 25 Jan 2024 10:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA5210F891
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:34:56 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3367a304091so6673712f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 02:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706178834; x=1706783634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Y2ukDIRI3V7y/4Ke8Kk5KVr6Nwt1dudTZB9y9EbwQpk=;
 b=pSgJrPdD86B3ApGHtZfUTKGi+Dsc7Kjd4GdJQ9pyAqNPQW0FdT6CkoOLQ7GkafG1ab
 28xde4MY64OfElUj9VNrB6+HnWF9kkzQyD75Owd4XPSBORLY4Ay76ld+rD/hGTiX6i/U
 vTbf8YyjHVBrnvCu6B+L1BkAFsmteYwPfZwnCu6vC8znQIIzfD+uu51+k0TaiZUOJiBp
 KV0vgr312db0yjFFMxrjouzofRgKTjdrbn5/vuqwy+zIUIlBCv4B08DKr2UNftCCMHvl
 +t8HEQpRlRvpbsqbfYsGpXzxh0Szf//zqkk8/BkZiArmNOPKcvMNPU1HkCI+tTOeUZDc
 C8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706178834; x=1706783634;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Y2ukDIRI3V7y/4Ke8Kk5KVr6Nwt1dudTZB9y9EbwQpk=;
 b=CuKbYIpJ3MoYqD9q9J0T4vp0U5RSskBq5iaVfRFYXje9k0hbZ04nfxiSFIkvrVadOQ
 fwIdC70wSPHw/IIkZQyD7H4ajLggzW15lANiw2Dc2vQZztVmKCYrLuyLUf6a7VK/7sRB
 fOTDcfMi2RGDMkPRPWbWXO2eoI5z5T90IErQnDbu5ISCw3H0MSC0NWIvHTDQxHgENfri
 5PPb8nemwkOuUYjjAZnL9uXBI2g6Vn48qRUr5TKiOyHn9SwnI8dU9XSBo7NheFD//jeA
 /L0YsvnLT105x4ddH+4GSPmd5+31CaoU6khFxO/faqGJO6m1lk01h9TuX3ihUReaNmNE
 AXCg==
X-Gm-Message-State: AOJu0YzwHUV3O5Is8mzIVr8zwULkgKEupQS9m73ZNRbKLTAY8FmLULQC
 JPDdEBpw1wqV9ctYXC5+Zc6I31AJAMTwnIcEuwpC7Y7STyoZrq93YZJluH8AC2A=
X-Google-Smtp-Source: AGHT+IEUJ52IIL/sfX4VRkSEtL94TlMTbRlUx48ehMejIBMm4N/VpxVE+g7rtHvil7EXLr+pOBhBxw==
X-Received: by 2002:a5d:4810:0:b0:339:58ae:2205 with SMTP id
 l16-20020a5d4810000000b0033958ae2205mr281384wrq.166.1706178834446; 
 Thu, 25 Jan 2024 02:33:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1a7d:7b36:3842:9bc3?
 ([2a01:e0a:982:cbb0:1a7d:7b36:3842:9bc3])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a5d6586000000b0033921f48044sm15202260wru.55.2024.01.25.02.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 02:33:54 -0800 (PST)
Message-ID: <99eeceba-83f0-4bb7-9eda-33325c79aa3a@linaro.org>
Date: Thu, 25 Jan 2024 11:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 01/39] drm/bridge: add ->edid_read hook and
 drm_bridge_edid_read()
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
 <9d08d22eaffcb9c59a2b677e45d7e61fc689bc2f.1706038510.git.jani.nikula@intel.com>
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
In-Reply-To: <9d08d22eaffcb9c59a2b677e45d7e61fc689bc2f.1706038510.git.jani.nikula@intel.com>
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

On 23/01/2024 20:37, Jani Nikula wrote:
> Add new struct drm_edid based ->edid_read hook and
> drm_bridge_edid_read() function to call the hook.
> 
> v2: Include drm/drm_edid.h
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_bridge.c | 46 +++++++++++++++++++++++++++++++++++-
>   include/drm/drm_bridge.h     | 33 ++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index cee3188adf3d..4f6f8c662d3f 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -27,8 +27,9 @@
>   #include <linux/mutex.h>
>   
>   #include <drm/drm_atomic_state_helper.h>
> -#include <drm/drm_debugfs.h>
>   #include <drm/drm_bridge.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_edid.h>
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_of.h>
> @@ -1206,6 +1207,47 @@ int drm_bridge_get_modes(struct drm_bridge *bridge,
>   }
>   EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
>   
> +/**
> + * drm_bridge_edid_read - read the EDID data of the connected display
> + * @bridge: bridge control structure
> + * @connector: the connector to read EDID for
> + *
> + * If the bridge supports output EDID retrieval, as reported by the
> + * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.edid_read to get
> + * the EDID and return it. Otherwise return NULL.
> + *
> + * If &drm_bridge_funcs.edid_read is not set, fall back to using
> + * drm_bridge_get_edid() and wrapping it in struct drm_edid.
> + *
> + * RETURNS:
> + * The retrieved EDID on success, or NULL otherwise.
> + */
> +const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
> +					    struct drm_connector *connector)
> +{
> +	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
> +		return NULL;
> +
> +	/* Transitional: Fall back to ->get_edid. */
> +	if (!bridge->funcs->edid_read) {
> +		const struct drm_edid *drm_edid;
> +		struct edid *edid;
> +
> +		edid = drm_bridge_get_edid(bridge, connector);
> +		if (!edid)
> +			return NULL;
> +
> +		drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
> +
> +		kfree(edid);
> +
> +		return drm_edid;
> +	}
> +
> +	return bridge->funcs->edid_read(bridge, connector);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
> +
>   /**
>    * drm_bridge_get_edid - get the EDID data of the connected display
>    * @bridge: bridge control structure
> @@ -1215,6 +1257,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
>    * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
>    * get the EDID and return it. Otherwise return NULL.
>    *
> + * Deprecated. Prefer using drm_bridge_edid_read().
> + *
>    * RETURNS:
>    * The retrieved EDID on success, or NULL otherwise.
>    */
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index e39da5807ba7..b7aed3ead705 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -557,6 +557,37 @@ struct drm_bridge_funcs {
>   	int (*get_modes)(struct drm_bridge *bridge,
>   			 struct drm_connector *connector);
>   
> +	/**
> +	 * @edid_read:
> +	 *
> +	 * Read the EDID data of the connected display.
> +	 *
> +	 * The @edid_read callback is the preferred way of reporting mode
> +	 * information for a display connected to the bridge output. Bridges
> +	 * that support reading EDID shall implement this callback and leave
> +	 * the @get_modes callback unimplemented.
> +	 *
> +	 * The caller of this operation shall first verify the output
> +	 * connection status and refrain from reading EDID from a disconnected
> +	 * output.
> +	 *
> +	 * This callback is optional. Bridges that implement it shall set the
> +	 * DRM_BRIDGE_OP_EDID flag in their &drm_bridge->ops.
> +	 *
> +	 * The connector parameter shall be used for the sole purpose of EDID
> +	 * retrieval, and shall not be stored internally by bridge drivers for
> +	 * future usage.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An edid structure newly allocated with drm_edid_alloc() or returned
> +	 * from drm_edid_read() family of functions on success, or NULL
> +	 * otherwise. The caller is responsible for freeing the returned edid
> +	 * structure with drm_edid_free().
> +	 */
> +	const struct drm_edid *(*edid_read)(struct drm_bridge *bridge,
> +					    struct drm_connector *connector);
> +
>   	/**
>   	 * @get_edid:
>   	 *
> @@ -888,6 +919,8 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
>   enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
>   int drm_bridge_get_modes(struct drm_bridge *bridge,
>   			 struct drm_connector *connector);
> +const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
> +					    struct drm_connector *connector);
>   struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
>   				 struct drm_connector *connector);
>   void drm_bridge_hpd_enable(struct drm_bridge *bridge,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
