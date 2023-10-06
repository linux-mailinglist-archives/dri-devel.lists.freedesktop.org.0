Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492347BB230
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E7510E22E;
	Fri,  6 Oct 2023 07:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC76110E238
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:33:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3248e90f032so1771945f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696577594; x=1697182394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:reply-to
 :organization:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igBVYuYeU6Z/6Ww2yei9L3lDx8aWMI/z7rQ7x2JaBS8=;
 b=pKSv4NIFVzR1NrdUYrqtPe0AmxMtZrZXYSaXzLXCjTjJhgG+FKUqPQ+jKtK6RL/azA
 7qgYSa5Gkvx9sDlrDlgES30AZOKgrh01YtVtBj30xHwI3eQx2r8GNBqqx7H5dgLvTzQh
 X0EjT5LhG6VemAlHkTjkWNYAYV/EiAT/wBVxNEF+XS7kKJpNAcPTQ4V46kDN9KIoXWLs
 JnC8NPRbZqG0f/Ap4NiLg7voMTeVqN/dR82U+KdO2Of6tojFhiQL0CBzifPc31eR6wMt
 NRrVDAZTmZJnXF2PEhdRu7WJh8foq5hTFZYoTi9LAYu0QIYsazXjYrz+csOkdyMmZ9UN
 nxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696577594; x=1697182394;
 h=content-transfer-encoding:in-reply-to:autocrypt:reply-to
 :organization:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=igBVYuYeU6Z/6Ww2yei9L3lDx8aWMI/z7rQ7x2JaBS8=;
 b=slHoL4rvqUghJR2Wuy5QQNXplnELef1QievStBhbSFFDWIpqhWg7tfgno29X/d6zqv
 /Wc059zlA9xA2pPGQdUrBAQMFf1F6RnxXThqNaR6uVGzf8meWDmyQj3QPPn+W1SV4KR/
 SW7LHbTSdR/aXw9uDFAceSqMycjGTvJSf/pN+QbZkfFR+wc18fqqUGcriefPKKA/f59+
 R9Mo4Nr+d546//YtPAnDkUtlzV4GyJQqsIiOZUyvNGMAewiO3SJbWVgzQZaRpYHkmbZb
 AUg6Ft9PotOpLmhFLTp7NUv8brz+T1IS/Q63YmVIAyMo1UeGN8M+yhjjloNXR+0ey92l
 CFMw==
X-Gm-Message-State: AOJu0Yy1yNYyVApUA+g0TSXDWotHPGS9ssWBM52WGbkvUyiOhGCgl1fs
 pM6J0EyvXtqhaZNe4MmWhm9Ovw==
X-Google-Smtp-Source: AGHT+IFBaGjdHqQusz+QfpIanXT6nugFKblX9KIqp0YD7q5Pc87iWPJ41fVUct4hYmP6ZqkzVCt+dQ==
X-Received: by 2002:adf:e507:0:b0:324:8536:f582 with SMTP id
 j7-20020adfe507000000b003248536f582mr6709679wrm.27.1696577594172; 
 Fri, 06 Oct 2023 00:33:14 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d4a8e000000b003197b85bad2sm974445wrq.79.2023.10.06.00.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 00:33:13 -0700 (PDT)
Message-ID: <825983dc-9a41-4222-8d9c-cbadf25f54d5@linaro.org>
Date: Fri, 6 Oct 2023 09:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/encoder: register per-encoder debugfs dir
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
 <20230904015338.2941417-2-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
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
In-Reply-To: <20230904015338.2941417-2-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/09/2023 03:53, Dmitry Baryshkov wrote:
> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/drm_encoder.c  |  4 ++++
>   drivers/gpu/drm/drm_internal.h |  9 +++++++++
>   include/drm/drm_encoder.h      | 16 +++++++++++++++-
>   4 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2de43ff3ce0a..cf7f33bdc963 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -603,4 +603,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>   	crtc->debugfs_entry = NULL;
>   }
>   
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +	struct drm_minor *minor = encoder->dev->primary;
> +	struct dentry *root;
> +	char *name;
> +
> +	name = kasprintf(GFP_KERNEL, "encoder-%d", encoder->index);
> +	if (!name)
> +		return;
> +
> +	root = debugfs_create_dir(name, minor->debugfs_root);
> +	kfree(name);
> +
> +	encoder->debugfs_entry = root;
> +
> +	if (encoder->funcs->debugfs_init)
> +		encoder->funcs->debugfs_init(encoder, root);
> +}
> +
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> +{
> +	debugfs_remove_recursive(encoder->debugfs_entry);
> +	encoder->debugfs_entry = NULL;
> +}
> +
>   #endif /* CONFIG_DEBUG_FS */
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 1143bc7f3252..8f2bc6a28482 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -30,6 +30,7 @@
>   #include <drm/drm_print.h>
>   
>   #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
>   
>   /**
>    * DOC: overview
> @@ -74,6 +75,8 @@ int drm_encoder_register_all(struct drm_device *dev)
>   	int ret = 0;
>   
>   	drm_for_each_encoder(encoder, dev) {
> +		drm_debugfs_encoder_add(encoder);
> +
>   		if (encoder->funcs && encoder->funcs->late_register)
>   			ret = encoder->funcs->late_register(encoder);
>   		if (ret)
> @@ -90,6 +93,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>   	drm_for_each_encoder(encoder, dev) {
>   		if (encoder->funcs && encoder->funcs->early_unregister)
>   			encoder->funcs->early_unregister(encoder);
> +		drm_debugfs_encoder_remove(encoder);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index ba12acd55139..173b4d872431 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -189,6 +189,8 @@ void drm_debugfs_connector_remove(struct drm_connector *connector);
>   void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>   void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>   void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder);
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
>   #else
>   static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>   				   struct dentry *root)
> @@ -222,6 +224,13 @@ static inline void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc)
>   {
>   }
>   
> +static inline void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +}
> +static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> +{
> +}
> +
>   #endif
>   
>   drm_ioctl_t drm_version;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 3a09682af685..977a9381c8ba 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -60,7 +60,7 @@ struct drm_encoder_funcs {
>   	 * @late_register:
>   	 *
>   	 * This optional hook can be used to register additional userspace
> -	 * interfaces attached to the encoder like debugfs interfaces.
> +	 * interfaces attached to the encoder.
>   	 * It is called late in the driver load sequence from drm_dev_register().
>   	 * Everything added from this callback should be unregistered in
>   	 * the early_unregister callback.
> @@ -81,6 +81,13 @@ struct drm_encoder_funcs {
>   	 * before data structures are torndown.
>   	 */
>   	void (*early_unregister)(struct drm_encoder *encoder);
> +
> +	/**
> +	 * @debugfs_init:
> +	 *
> +	 * Allows encoders to create encoder-specific debugfs files.
> +	 */
> +	void (*debugfs_init)(struct drm_encoder *encoder, struct dentry *root);
>   };
>   
>   /**
> @@ -184,6 +191,13 @@ struct drm_encoder {
>   
>   	const struct drm_encoder_funcs *funcs;
>   	const struct drm_encoder_helper_funcs *helper_private;
> +
> +	/**
> +	 * @debugfs_entry:
> +	 *
> +	 * Debugfs directory for this CRTC.
> +	 */
> +	struct dentry *debugfs_entry;
>   };
>   
>   #define obj_to_encoder(x) container_of(x, struct drm_encoder, base)

Looks fine:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll need a core ack to apply to drm-misc with patch 2

Neil
