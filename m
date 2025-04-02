Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7597A7911E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA29895CA;
	Wed,  2 Apr 2025 14:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MlsXL9DH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C765E895CA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 14:24:14 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39c14016868so3219166f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743603853; x=1744208653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xyARiLNtATS5AzswjM8CCyE8YJ8HDHxhY7Aa8WTCbG8=;
 b=MlsXL9DH5jmXbTW62AZnUnX6sRIV4/4MLNfsuI0D0WK/xeY4op6tZV/vtWjw9sY7oW
 opqK05Ua55KS/SqIcvGCGMmfPlFwXDOYrcHkBjHuMd8FRx1jO67+tNP4D+1vc1bmwPsg
 m7eulvEyaSDEwIV4yT/6/PFSxMBBvwRYNBIxN0IygszNwVxjXwS1ISiVGi9rKrzFJ7RI
 B4zNqGEqkBDywsuSNsUzOzuB3/RFLpPbIqv8K8kvCm7dkTdZR4YAOeis+fJsawywNCNU
 xvPBLfKBiv8Ws9viYvH1S1XKoP2vJf7hjqQQXg9ROMpXPl13O9qCQzT7jN1RjKMkn5ww
 oDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743603853; x=1744208653;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xyARiLNtATS5AzswjM8CCyE8YJ8HDHxhY7Aa8WTCbG8=;
 b=JAQm+1yu3QitAWmhmlwSjRSgIJEHJqfMYOEqXdWN/bZV6gMJK7vpyK8D56k9fbkvex
 fFwHnwMpA8LmckKS1ni+mRDigIh36W+LbRiCzhgjxTI1dhJm92kv/26VIXoLkjsSOnwf
 xkkXl9mtXcklEH3+P+XxTikKlLEZcehmRKAUrRJ9kx0+ohf3KQ09JswVC5X7Q5Ywm/R3
 n+k4Gkb+8ml+Ly/ChQtfwHyNJAlK5A8m7c/T8ekJOextIbVNUzSL56btVOUNkhBitT49
 EEMAiPd8uOZDLP49nG2p2TZgz0E/k9LCGb18SQyxzYXvodOYs5rnUODh0XPi+Wp7jrYK
 wBWw==
X-Gm-Message-State: AOJu0YytvkzbjHxO1vOo8eATHnaHMV2s6Nxa95RlLoJ+XewhDvcv2xuS
 JfY1Ue/VvQEqUsuBiVxgKlB4Yr7cz+EpV9ECsmHJQoqd7/O2NZPyR6zWdCKLBhM=
X-Gm-Gg: ASbGnctUkk7CP5s0UJl5TPngG4yhKxqGoo6oYzv+ox7+561Sz9AiL96WdL5l4ywUfah
 G59ZOEQirhPvGB+g45rF4OXhI88MSmt3aGANJZJArNSaqW4XGsCDStJ6fYQtJlpTYCcCNLHGO9F
 XfaS+k5zvWnH3msJM+Zp02f/baBNg4i2TTaebAUYYjhigyz7lq0HwoAmZXNPrUrD0wA8DgwBdUg
 815HBJQQEAwKWhqdxqQleiHMtidwbpo8RCUULovIb0dIIkx9z8a26S8hm0noKwXbotwNN10n+Uo
 gp81TgjSkKdylcvu9XgDKhHD3hGz8fP21Vx6qyaG+Uj9A7urlltXB5DXJ5m22rJM1YggHJ62J6I
 Cv7aECzl6kgkzifsBs7BSXg==
X-Google-Smtp-Source: AGHT+IFsRGX2wdB2iepKQDGuzp9DMis4YZNIE0+wJscPdfYLg84AN2qt5xXeU/OvBzroap0cGm76eA==
X-Received: by 2002:a05:6000:2281:b0:39c:2688:612b with SMTP id
 ffacd0b85a97d-39c2688622amr5478938f8f.7.1743603853259; 
 Wed, 02 Apr 2025 07:24:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca59:43e0:210c:afcf?
 ([2a01:e0a:3d9:2080:ca59:43e0:210c:afcf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a41c0sm16808220f8f.88.2025.04.02.07.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:24:12 -0700 (PDT)
Message-ID: <74718ea9-30e5-4d85-9f19-e597ab41af6e@linaro.org>
Date: Wed, 2 Apr 2025 16:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/10] drm/panel: Use refcounted allocation in place of
 devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
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
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
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

On 01/04/2025 18:03, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> This series addresses only 10 drivers. There are 98 more to go. Sending this
> series to mostly get feedback. if any change is required, it will be
> incorporated in the next version and in the next series that will
> address the remaining drivers.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Anusha Srivatsa (10):
>        panel/abt-y030xx067a: Use the refcounted allocation in place of devm_kzalloc()
>        panel/arm-versatile:  Use the refcounted allocation in place of devm_kzalloc()
>        panel/z00t-tm5p5-n35596: Use refcounted allocation in place of devm_kzalloc()
>        panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()
>        panel/bf060y8m-aj0: Use refcounted allocation in place of devm_kzalloc()
>        panel/th101mb31ig002-28a: Use refcounted allocation in place of devm_kzalloc()
>        panel/boe-tv101wum-ll2: Use refcounted allocation in place of devm_kzalloc()
>        panel/dsi-cm: Use refcounted allocation in place of devm_kzalloc()
>        panel/ebbg-ft8719: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-edp: Use refcounted allocation in place of devm_kzalloc()
> 
>   drivers/gpu/drm/panel/panel-abt-y030xx067a.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-arm-versatile.c          | 11 +++++------
>   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 11 +++++------
>   drivers/gpu/drm/panel/panel-auo-a030jtn01.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c       | 11 +++++------
>   drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
>   drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c       | 10 +++++-----
>   drivers/gpu/drm/panel/panel-dsi-cm.c                 | 10 ++++------
>   drivers/gpu/drm/panel/panel-ebbg-ft8719.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-edp.c                    |  9 ++++-----
>   10 files changed, 46 insertions(+), 58 deletions(-)
> ---
> base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> change-id: 20250401-b4-drm-panel-mass-driver-convert-ddca32e95d16
> 
> Best regards,

Looks good to me

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
