Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FA9A6E7D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 17:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483710E075;
	Mon, 21 Oct 2024 15:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GXOLnLyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94B310E075
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 15:43:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37ec4e349f4so2410562f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729525427; x=1730130227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KGA74I+lerUAIhxea5XYBGaEAohmLRQWTRCa+iIScN0=;
 b=GXOLnLyRpe1Q5wQV91eBbJUC9yaUcRr+9QD4zOdskUgqaPVTAqLYd88jksaxRcDxOB
 tJd5sbaHWzRgddJTXZAmuIlA/aSkTWxXD2sh+S3RCdIvmHT4NqR4m9A04Ze49gouv/tY
 r+WwIhrNnNcIj7dknoAJ/oMbqAsC+R0/bM9jaOHv7wZPsl86jUK1Rdb81tygdnI4R33k
 nL/JPT8hOiKgLazRfi9hAhKWCpQEsEl6CXRNClqiBVSweW+Q62kWWozuXqC199LA3ohY
 fDZtzvELfmMe6xJOSJnLAAwmk1lnN8qC+S6afeo/lvH88wJxDeMbDW2ePPf080+JHJoI
 N5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729525427; x=1730130227;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KGA74I+lerUAIhxea5XYBGaEAohmLRQWTRCa+iIScN0=;
 b=KzW3mQrr1k6Iy0cbBq7rLVSshVI9ghg/1PXKw9sDWbC4cyeqpMh2kNGhzpGPZDVx1x
 dEJwZF+ntIyr2o2chMzPAfCubKeQ4vGETSR4RWvxB2vk8ussvN55UC8l9ZyyCMwtaptM
 lLjaxr8KclP1oAvhmtg520Si3AYJJjwfXE5/UKazrtYK8Drwn2r+63Jk2tM42Kmwd1GG
 +dg5FHK8sdsCXYRQrOcx3nVaU4AnxA86XYyG63urkqLCJgbruaiYOCQ+zT5zHrAKEWoq
 u1IuzJY/XFegrNL0K4S31Igd85U6NEVYhFOPu2higSFTgD6j98XbPbAXE3Y67DFH2ky/
 Coug==
X-Gm-Message-State: AOJu0YwC6nJg4I4S80SrpzH/BvJ6OvByBdzyH8saqmWH366FTJFWKKK0
 ov24Bk1unG2ow9x5M2kVsSnAPNU9EFxSWuWFnTY6ll3kks1gcuHHc9FnNzBwl7k=
X-Google-Smtp-Source: AGHT+IEsQ5AxlB9GE6akyS5dKzjRFYX7u8twYPyLIG6YTNGCTtFu0tNbmMGEU3mLEInFyESnDA5wEg==
X-Received: by 2002:adf:b35d:0:b0:37d:4894:6878 with SMTP id
 ffacd0b85a97d-37ea2140245mr6051299f8f.10.1729525427001; 
 Mon, 21 Oct 2024 08:43:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc183sm60983875e9.40.2024.10.21.08.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 08:43:45 -0700 (PDT)
Message-ID: <a252b2e3-14dd-4e76-bce5-d5df511312ee@linaro.org>
Date: Mon, 21 Oct 2024 17:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: s6e3ha8: add static modifier to supply list
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20241021-starqltechn_upstream_integration_panel_fix-v1-1-81776e89052a@gmail.com>
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
In-Reply-To: <20241021-starqltechn_upstream_integration_panel_fix-v1-1-81776e89052a@gmail.com>
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

On 21/10/2024 15:52, Dzmitry Sankouski wrote:
> Add 'static' modifier to panel supply list.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410160810.0jaNgxB2-lkp@intel.com/
> Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Fix kernel robot static analyzer error.
> Rebuild with sparse to be sure.
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 76b5a6ea610d..64c6f7d45bed 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -24,7 +24,7 @@ struct s6e3ha8 {
>   	struct regulator_bulk_data *supplies;
>   };
>   
> -const struct regulator_bulk_data s6e3ha8_supplies[] = {
> +static const struct regulator_bulk_data s6e3ha8_supplies[] = {
>   	{ .supply = "vdd3" },
>   	{ .supply = "vci" },
>   	{ .supply = "vddr" },
> 
> ---
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> change-id: 20241021-starqltechn_upstream_integration_panel_fix-32270575b583
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
