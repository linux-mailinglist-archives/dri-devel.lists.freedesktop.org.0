Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7626A8B026A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEFF11386D;
	Wed, 24 Apr 2024 06:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K+Ho7SGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6818A11386D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:49:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41aa15ae26dso15987075e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941355; x=1714546155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PvCwxRhS/eR197YJbXLGg46cxnilzgsJ6QWRiuu3i7g=;
 b=K+Ho7SGCSouTL5QtRbeAYjAyz1wgh/QFguHJFBJiWujZ2T7vA+HXkpzqzj7iOQ/fQN
 /xiND+j0CvBiKttF9iEtM59qu4F3qJjz9laSQ901n+qTEpRnwLVEaxb304wC4RTlkWco
 ab3BfipCChJuc0CdbCXq477T7+WyvRV+jw+EbFXdCNhe7UQ2ur23pZJ4cHs78azbjqNe
 aLM/bGb6dPk6TPXjzhlOABv861zkGfoJ8M+fPmxAUxZMTHCmcxlN9QgWKG19DNMPmO5X
 zstMBAufnqJJFh5OTkw6tPv2I7/+Wb6HdIUvIRx3GQwqVkE4OoqYHgPUL8ClPk3EjK5n
 kEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941355; x=1714546155;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PvCwxRhS/eR197YJbXLGg46cxnilzgsJ6QWRiuu3i7g=;
 b=EHy7Ceu6nNi83oGEDE8KhRTB0Ne6gwWv7ZRMT0RKNzWD3Byk6cTukDew/cYtiFoR07
 udjRyG/ydQUXOS31IPuRzo3bDP1qs0o4t0av2Tn5XuONa+BQIrIa72awMD2yhe7CkNH9
 8ZPqvqvdOSG5YcDefDbW5EFZFRNccGSXHjG+sGemcFexNH//P+d9mzRjAcoOC7p9JUN0
 dQa8e3op45lxUDGWAIqmbgKOq6l2TbruGlC7rGPC53bBMmR6iPyVD1xfUKUOXKV5fcrN
 cKRelIZIKfIaCYpa+iiXMCP2LvA3c9Qn5xaVHZDICl241tHaauA5GDxxcmoRt4ewmujd
 Ax/A==
X-Gm-Message-State: AOJu0Yw11dd3t7TqtmAMUCckmKELLDgJkG59a+PdehqT31pCC5SKaWsn
 kCntfZFQxrQt+8Yinr13XcbObnSFszK3onMz/EuqVC9Gqc3dr2xXasA4riUrvKQ=
X-Google-Smtp-Source: AGHT+IGwzfnWMHjRPXLIr1spmLqk3BurHQRsBsQkAFk8meM71ufsN6U4PqTPZkiWUevzjH2F9qM8Xw==
X-Received: by 2002:a05:600c:4ecb:b0:418:969a:b316 with SMTP id
 g11-20020a05600c4ecb00b00418969ab316mr1171308wmq.1.1713941354412; 
 Tue, 23 Apr 2024 23:49:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7?
 ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b00418244d459esm22832137wmo.4.2024.04.23.23.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:49:13 -0700 (PDT)
Message-ID: <22f0023d-d8dd-476a-bb3a-6f993e1f32e3@linaro.org>
Date: Wed, 24 Apr 2024 08:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: adv7511: make it honour next bridge in DT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org>
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
In-Reply-To: <20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org>
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

On 09/03/2024 16:33, Dmitry Baryshkov wrote:
> DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
> present at the port@1. This allows board DT to add e.g. HDMI connector
> nodes or any other next chained bridge. Make adv7511 driver discover
> that bridge and attach it to the chain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 39c9ece373b0..ea271f62b214 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -356,6 +356,7 @@ struct adv7511 {
>   	enum drm_connector_status status;
>   	bool powered;
>   
> +	struct drm_bridge *next_bridge;
>   	struct drm_display_mode curr_mode;
>   
>   	unsigned int f_tmds;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index b5518ff97165..4eea9e8fb603 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -946,6 +947,10 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>   	struct adv7511 *adv = bridge_to_adv7511(bridge);
>   	int ret = 0;
>   
> +	ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
> +	if (ret)
> +		return ret;
> +
>   	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>   		ret = adv7511_connector_init(adv);
>   		if (ret < 0)
> @@ -1216,6 +1221,11 @@ static int adv7511_probe(struct i2c_client *i2c)
>   
>   	memset(&link_config, 0, sizeof(link_config));
>   
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
> +					  &adv7511->next_bridge);
> +	if (ret)
> +		return ret;
> +
>   	if (adv7511->info->link_config)
>   		ret = adv7511_parse_dt(dev->of_node, &link_config);
>   	else
> 
> ---
> base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
> change-id: 20240309-adv7511-next-bridge-10d8bbe0544e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Looks fine, I check most of the DT using this bridge and the port@1 seems correctly defined.

LGTM.

Neil
