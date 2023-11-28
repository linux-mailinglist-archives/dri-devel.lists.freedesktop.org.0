Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78687FB401
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27BF10E100;
	Tue, 28 Nov 2023 08:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1425C10E446
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:24:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b4746ae3bso10791765e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 00:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701159858; x=1701764658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=k1e94yCRn7c94vk5lMUhPb5cFN0Hvus7Nz3SJzHr3dY=;
 b=wluxwvxVfwpFRZRaiKuzal0qxY+2HX80W48KH3IdAXWjPUObhLvzGoP9ln0ZZ/hOEe
 w4H1XUKemdKMcXCYjlubLNinAemUGVkv33hqOeSdjIIVFKremJzSANUPEnuZQ8QO+ZnA
 mXyHS1LFANjhfGKNUBibExix4B1W4RKb0v7rwNat1wmfHJZL872FdoV/Gls659cxUnBB
 zsGCMH70CUsvHQ8pvauid0SUEXGioIhiuEJ6dHkjInvO3pl3qBU4XoLInw0jiMyzl/e9
 pJZtNPKHBzRQZuMBhjMpANWN8qOIW9VnSySOTpfyUuiIU/tTD22tDe2acjtK4qp2Ju+d
 fqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701159858; x=1701764658;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=k1e94yCRn7c94vk5lMUhPb5cFN0Hvus7Nz3SJzHr3dY=;
 b=uQEkhxkpxMMTnCXvQC3GXA0a6A+KIcWFTjoto1jFez7NKxuQxtnJLI2jqPBEpeiKLD
 Qr199q7qmN+8wMNigacfPkGpBfN12eCjO2oz250ISuYl73yQpoYLctV0tMR/7fD9sJxS
 evu0+bvBzLquBcUT0SYn0gQYUHOgrd1LSk7QQQPn1z1eDmEGpWg6BCcAet83rmQTj+8z
 afjWBBKX/9v8PVwXt6XkOuw48eA6kLL6rOt38r5Rmfoe+su6nSfvy/Ms353USOFPSMU2
 zYzwume73H/yy7r8/Otwiv7NBTtpe/16NN5ujgs9rMFvePjkI3Z7IOnq9V1GjBhjL4yA
 Ip2g==
X-Gm-Message-State: AOJu0Yw6EGxh1fs1Uhbo9xGSRHInMf8ANIVHLGB/FiM2KPUVUfKl6OLw
 JpsMpSZwYsoHoAh/dT2cuF8pbw==
X-Google-Smtp-Source: AGHT+IF4jzEY+4anphsz6a8Sg0UvyxyQmZboBVunI0rP5xeovVCKmfjApOQshEMsHWXQI/rtZxmoCA==
X-Received: by 2002:a05:600c:470f:b0:40b:369b:2c53 with SMTP id
 v15-20020a05600c470f00b0040b369b2c53mr10657836wmo.22.1701159858363; 
 Tue, 28 Nov 2023 00:24:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00405959469afsm16730777wms.3.2023.11.28.00.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 00:24:17 -0800 (PST)
Message-ID: <95016bb1-64de-4963-9a5e-7201923a5ae2@linaro.org>
Date: Tue, 28 Nov 2023 09:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] Revert "driver core: Export device_is_dependent() to
 modules"
Content-Language: en-US, fr
To: Linus Walleij <linus.walleij@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231128-revert-panel-fix-v1-1-69bb05048dae@linaro.org>
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
In-Reply-To: <20231128-revert-panel-fix-v1-1-69bb05048dae@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/11/2023 00:10, Linus Walleij wrote:
> This reverts commit 1d5e8f4bf06da86b71cc9169110d1a0e1e7af337.
> 
> Greg says: "why exactly is this needed?  Nothing outside of
> the driver core should be needing this function, it shouldn't
> be public at all (I missed that before.)
> 
> So please, revert it for now, let's figure out why DRM thinks
> this is needed for it's devices, and yet no other bus/subsystem
> does."
> 
> Link: https://lore.kernel.org/dri-devel/2023112739-willing-sighing-6bdd@gregkh/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/base/core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bfd2bf0364b7..67ba592afc77 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -328,7 +328,6 @@ int device_is_dependent(struct device *dev, void *target)
>   	}
>   	return ret;
>   }
> -EXPORT_SYMBOL_GPL(device_is_dependent);
>   
>   static void device_link_init_status(struct device_link *link,
>   				    struct device *consumer,
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
