Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AAA82D535
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7EE10E220;
	Mon, 15 Jan 2024 08:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6A610E220
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:43:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e80046275so270525e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 00:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705308214; x=1705913014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=v7trEMMexp/L0cRP5nniRYAU6VEcRUVKr6Xlvoj7OOQ=;
 b=ckuQ795NrJ7DEIWQPoyQ77APiE/OrdTR9owUw+21rc1rCtnK8ep7RMP6KD5ELxQzOg
 DKVUYXq2TWm1E5L7x3kb8No0maWtmEAkDQOTzdHZwKU/xJCjaYbq1Mlox0aHY3HJC9KR
 p1PYZgG1a0uje6D3YzOTd7scRm1YWUBEZf8JXTlqgH1wlilMYJyTuSCGoMb5nFdpG/yK
 8J2/Yq3LwrRLjHHJYa60BlHZzuGMnc+pwmTsMzDAYg1clK8344ZN8Me7bdUt9M78eSTr
 NedL3WFrcMoW5SZSXuVThTErhy29kBfgBPOzIV/YV/13pa+d0L79TMyCepxRAD0/TAoP
 Ch2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705308214; x=1705913014;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v7trEMMexp/L0cRP5nniRYAU6VEcRUVKr6Xlvoj7OOQ=;
 b=f9HCpWex+kYM1GnOwuIL8ElUSqy6GxPokYrlAoWlYLWp56ArfSwd0aU2xvDNhgFvFV
 s4r++/BHm+aKIuzER5iwWN3vE1VbYTYHT9oClszJY42beFB/HS5dm60ja25NsWslKQ6+
 5YIH0MsJaq8Wk60jEeligFWz4XlKdPegdL2oa+BusuZpZP8LqoDKtrXfGiS1R7vlGhm9
 wGTOYWy1PDCQvonoDitwFqwvwrRs1otQaQTGS95cz7/RVVqsPlecraYcsusTmemEJYpI
 TmVBnifayHeWOiA0jU74MH3PdperyLK7FP4TyPFT0CBM3gRA6LrSOOaXtPbx6o149Add
 pMGA==
X-Gm-Message-State: AOJu0YzqKRtZKcBG8nWxcpBCKlkbPFNzW1d4+joN7z4/f+iUxuNxCPL5
 DQuFcVg5+Q80p59YbIUUGZRlBm+ua1umhA==
X-Google-Smtp-Source: AGHT+IH3YQraSdCl5E7fmni/nnmbQn6D7xvQbHJ4xwymZ9rctQpsSlaYCsbqYXIp3W6UjPUKaCNQtg==
X-Received: by 2002:a05:600c:314b:b0:40e:6ee6:6fb with SMTP id
 h11-20020a05600c314b00b0040e6ee606fbmr1864869wmo.120.1705308213780; 
 Mon, 15 Jan 2024 00:43:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:af6f:bcbb:3c88:33c2?
 ([2a01:e0a:982:cbb0:af6f:bcbb:3c88:33c2])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a7bca5a000000b0040e54381a85sm14669897wml.26.2024.01.15.00.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 00:43:33 -0800 (PST)
Message-ID: <b1da07f9-7e15-4d83-bef3-d0ce157654bc@linaro.org>
Date: Mon, 15 Jan 2024 09:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
Content-Language: en-US, fr
To: Luca Weiss <luca.weiss@fairphone.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
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
In-Reply-To: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luca,

On 11/01/2024 13:38, Luca Weiss wrote:
> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> bridge/panel.o to drm_kms_helper object, we need to select
> DRM_KMS_HELPER to make sure the file is actually getting built.
> 
> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
> be properly available:
> 
>    aarch64-linux-gnu-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.o: in function `qmp_combo_bridge_attach':
>    drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3204:(.text+0x8f4): undefined reference to `devm_drm_of_get_bridge'
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> I can see "depends on DRM_KMS_HELPER" was removed with commit
> 3c3384050d68 ("drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS")
> 
> I'm not too familiar with Kconfig but it feels more correct if
> PHY_QCOM_QMP_COMBO selects DRM_PANEL_BRIDGE that that's enough; and it
> doesn't also has to explicitly select DRM_KMS_HELPER because of how the
> objects are built in the Makefile.
> 
> Alternatively solution to this patch could be adjusting this line in
> include/drm/drm_bridge.h:
> 
>    -#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
>    +#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE) && defined(CONFIG_DRM_KMS_HELPER)
>     struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
>                                              u32 port, u32 endpoint);
> 
> .. and then selecting DRM_KMS_HELPER for PHY_QCOM_QMP_COMBO.
> 
> But I think the solution in this patch is better. Let me know what you
> think.

I think this is no more the case after on linux-next:
35921910bbd0 phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE

But could you still check ?

Neil

> ---
>   drivers/gpu/drm/bridge/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index ac9ec5073619..ae782b427829 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -8,6 +8,7 @@ config DRM_BRIDGE
>   config DRM_PANEL_BRIDGE
>   	def_bool y
>   	depends on DRM_BRIDGE
> +	select DRM_KMS_HELPER
>   	select DRM_PANEL
>   	help
>   	  DRM bridge wrapper of DRM panels
> 
> ---
> base-commit: b9c3a1fa6fb324e691a03cf124b79f4842e65d76
> change-id: 20240111-drm-panel-bridge-fixup-5c2977fb969f
> 
> Best regards,

