Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D0A937DA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 15:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F3410E037;
	Fri, 18 Apr 2025 13:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e6K+BDil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05FE10E037
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 13:22:41 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so1169687f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744982560; x=1745587360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3nPNAmpQ4uOlcUbj8tZpDHE6nlLkjo04jE6tZHQGka8=;
 b=e6K+BDil/twuwFGHk5yHhffmTSpvrHuL9yds/fiDtwf8cVNhNvwU4DuM01+d8uRDe/
 eYJ41G4+/9U+xfFhmGUpqgsuXr3PG/ovR4hbsBjcJ0U18fRPkCgxZue3q9lXD0sh2v5T
 u7KpyG06gocfYDErOu6+FPXP8nPsqT0Tt6O34nrJq0Y2BDT6BxMXg5726hJEg8m3ZM7E
 yadmrUxS6g6BCap0bhm05d9F+gTMx00Hdauj9YqX+E9Hdevx5M8hY5BbrU0tws+bKx//
 hinWajQYDD0Rqc3i2QYTw3ATTkMRUBvHds0bJAQf6/6kKuRuK63UYiBPRM0eLoJJlJqi
 LQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744982560; x=1745587360;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3nPNAmpQ4uOlcUbj8tZpDHE6nlLkjo04jE6tZHQGka8=;
 b=cExqA8oq5WkF8nEETuc/WXJr7baf0NUtGQO4UONglu/U4C0Hitm4Us94EDWUMM0mic
 RPABLSaiwliC+9APC6wo8CMLcTLdM/d5zEIqTJumVvoLVUlyWzFh+TlsyzpT8ZVYt9hN
 5yUMPqj5l0iueebs5VmYyy7/3Vnc64qp4RFmJ3FhBnVPzOuqWzzLuJKfyk4MGTTi14Mk
 q9ksdI1N0WjNFHwGJXMxrF13B7hKVk8BWjBPocuHrkVKii60kvddSi7iNJUDjZJPI8bz
 lLnn14/QiN4dEK95WUN7p0qztlYFwIhfgeJ2TrJ0crJTogQM8UYgVgAg0ZQk6AS2oZr/
 62DA==
X-Gm-Message-State: AOJu0Yx3n83dAEnwyb/bQ9uTzApMwuAikQA8OXrsDJrgVTgTzJTonCy7
 zij/QdIF8bvHFckHd93kAFf9TS2kiTzdBd+OETJqiHvSPJRrbZ+uiKC4FWKlSfg=
X-Gm-Gg: ASbGncsx+Y1vvlhhM6yUTiHHN58lTtONRRRXlPJliLDZsfKPS3iX6Iw8l/dc5wLmBKt
 HLM+eEkh6WpcUnRh93oP2Zda/7hyjQM6usGLLb5bgu+hlBszYy9TFN90lGbA77R36D5s9nURFg3
 SwTzyLwfYnuI9jZkI2LFqcL9zqxbMiOexrrbS9VTfstJ6OqsDNHBebv+DkNQWY16lpZOd1rauvw
 pTJflnwCkYlHxiv2/ElMovEDAlD9DrQowZBx7/9AqQ+LpdN2Vgax2XsQVcnJbfuOMbeHwbJAWEL
 2HWaAgXx6h8P8J1qB3box9hjbY+PfCMlnfAHsS17obFaiOZOmzdea/iTarvs8PkG8M4jXt1sTXF
 XRTjprukCR09p3GDEkw==
X-Google-Smtp-Source: AGHT+IFNOOW2oODeAWlVCfKeEYLmpeo6ibOMwXQlsAWVEng9c5Elbns2WJGlRXKAds6lbZMvMnC3UA==
X-Received: by 2002:a05:6000:188d:b0:39c:1424:2827 with SMTP id
 ffacd0b85a97d-39efba4657amr2309409f8f.15.1744982560266; 
 Fri, 18 Apr 2025 06:22:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010?
 ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a498csm2697352f8f.85.2025.04.18.06.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 06:22:39 -0700 (PDT)
Message-ID: <107cd28d-bdb4-4b59-83e4-4b85dce97290@linaro.org>
Date: Fri, 18 Apr 2025 15:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/7] drm/panel: make prepare / enable / disable /
 unprepare return void
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
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

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> While it makes sense for panel callbacks to be able to return an error,
> the state-management functions from drm_panel API are usually called
> from atomic callbacks, which can not fails and must return void. Make
> drm_panel_prepare(), drm_panel_enable(), drm_panel_disable() and
> drm_panel_unprepare() follow the same calling convention and return
> void.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (7):
>        drm/bridge: analogix_dp: drop extra calls to analogix_dp_prepare_panel()
>        drm/bridge: analogix_dp: drop unused argument to analogix_dp_prepare_panel()
>        drm/bridge: analogic_dp: drop panel_is_modeset
>        drm/bridge: analogic_dp: drop panel_lock
>        drm/bridge: analogix_dp: inline analogix_dp_prepare_panel()
>        drm/bridge: analogix_dp: ignore return values of drm_panel_* calls
>        drm/panel: make prepare/enable and disable/unprepare calls return void
> 
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 107 ++-------------------
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   3 -
>   drivers/gpu/drm/drm_panel.c                        |  54 ++++-------
>   drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   9 +-
>   include/drm/drm_panel.h                            |   8 +-
>   5 files changed, 33 insertions(+), 148 deletions(-)
> ---
> base-commit: bfb20a655848a9088e3e9ae24b1dcce1bbf016c2
> change-id: 20250401-panel-return-void-d461c71ebd35
> 
> Best regards,

I think you can respin with the warning fix on patch 1 and then apply

Neil
