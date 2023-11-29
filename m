Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB5D7FD27B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F9D10E196;
	Wed, 29 Nov 2023 09:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9951010E196
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:27:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3331752d2b9so326493f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 01:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701250034; x=1701854834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=wSWOGihLbvWd/HkTOnjJVlcVTUALnSb3Os9ZzOpVteY=;
 b=LU1unYMXTh7uY6wcDe7/IOz4PkYs0moeXiQnbsdAP4ZfzqR7SScVWtPS8l6WKpurt5
 ZMo9wOONKBdKlDunp5YCQ5Ct29lPeVBeu1KY8u3mnX/p3qwa8cYE6DwBALFGYHOzN+TH
 EXa1Ka8vCBc5Vqqc+Yd472oY+aKvwic+uzBTfTpL8WJluZ50XGBTyqjg7JzE9egPaimz
 PWbBXMBzLZDZ0YV+pBVIfs0pSpgWvzgK4sX/MbBIt4qBdqKvIR5Yd4zLJ+bg8fNuQ06K
 6LKxT7C6yKVeBOebWrEtkvFCFBLb0AVzKpSDaQUr1QJkygKLdIIr6/YT2pkoEGIKFdPm
 cHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701250034; x=1701854834;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wSWOGihLbvWd/HkTOnjJVlcVTUALnSb3Os9ZzOpVteY=;
 b=w+RzSzfqOsL0qvZU2n71i0bDiBE5b2tu6eMdCq9J4uz5QKw5kvvaXMysiqKCIDYdxj
 og/mwXXnlpGFjd6Pu3+n8bMvgE7u25SW7OdDpVb2uphrRBMDXBSSV8juQs1w85lDvYai
 IMapwrzgaqpRtVFD76buzh6qb86sxG3S1InDcpwBeYRNPh5RjF36DENI2UNdKFSZqb2y
 it6YX8ef7U2Movrucp8AKKdZHerFqOtl6aiLkZOMFTyzG+ME/WhBxWBEmuRzJPGE7N+R
 KaDTmfJxGIpipAY7wR6dFK4tKwDJfJirJjZRXK0hZjr/98mB2nJSSurgj6pf9Vc825Ng
 iD7Q==
X-Gm-Message-State: AOJu0YyTZKxvGL3vO1DGRPWKHGdnH3MLoo9H0nukKJL/03nIhTId8YXv
 qieMNaTZ1H5KRc2/Ak02tujdyA==
X-Google-Smtp-Source: AGHT+IEvFDFRW8z6E5TlMnajfmGUr1GR7ySAnhV1pJPndQQNOYzuf0vOlVDE22biyX9j9hGxRzwgvQ==
X-Received: by 2002:a5d:6309:0:b0:333:85e:a11c with SMTP id
 i9-20020a5d6309000000b00333085ea11cmr4770557wru.16.1701250033770; 
 Wed, 29 Nov 2023 01:27:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c?
 ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b00332fbc183ebsm9798399wrt.76.2023.11.29.01.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 01:27:13 -0800 (PST)
Message-ID: <e7a2db20-4d6c-4fd0-ba0e-d8a2057cfbfc@linaro.org>
Date: Wed, 29 Nov 2023 10:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] [drm/meson] meson_plane: Add error handling
Content-Language: en-US, fr
To: Haoran Liu <liuhaoran14@163.com>, maarten.lankhorst@linux.intel.com
References: <20231129092113.32630-1-liuhaoran14@163.com>
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
In-Reply-To: <20231129092113.32630-1-liuhaoran14@163.com>
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
Cc: tzimmermann@suse.de, martin.blumenstingl@googlemail.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for your patch!

On 29/11/2023 10:21, Haoran Liu wrote:
> This patch adds robust error handling to the meson_plane_create
> function in drivers/gpu/drm/meson/meson_plane.c. The function
> previously lacked proper handling for potential failure scenarios
> of the drm_universal_plane_init call.
> 
> Signed-off-by: Haoran Liu <liuhaoran14@163.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 815dfe30492b..67b36398f146 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -534,6 +534,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	struct meson_plane *meson_plane;
>   	struct drm_plane *plane;
>   	const uint64_t *format_modifiers = format_modifiers_default;
> +	int ret;
>   
>   	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
> @@ -548,12 +549,16 @@ int meson_plane_create(struct meson_drm *priv)
>   	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
>   		format_modifiers = format_modifiers_afbc_g12a;
>   
> -	drm_universal_plane_init(priv->drm, plane, 0xFF,
> +	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
>   				 &meson_plane_funcs,
>   				 supported_drm_formats,
>   				 ARRAY_SIZE(supported_drm_formats),
>   				 format_modifiers,
>   				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");

Could you re-align those lines aswell ?

> +	if (ret) {
> +		devm_kfree(priv->drm->dev, meson_plane);
> +		return ret;
> +	}
>   
>   	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
>   

Thanks,
Neil
