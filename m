Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE3803585
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC5410E0F3;
	Mon,  4 Dec 2023 13:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813E710E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:53:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c09d0b045so14444225e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701697988; x=1702302788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=caHOksw5I0x/otbSLvQvnBWXc9OQUPmugqhHhV4G93g=;
 b=fW3iQTDj/VB0EApQ2M11+uR8XrZUp61bibiV959YJZe58hy9DTmvkt/pU0hcmwFGs7
 cmkhPg5fGOpk+b2AdTSA3XPIHC3Xne1I9QPuM4ECl7lCeJiIu9nUPpUmXsghsf8yTnlr
 fb5mhC80yyX5Kz0GevechPAQM9/+N8IUZfadkHP+ovyxmRl7stjcBg1/LOtEx8qTD4I9
 anV6ubgq8Y0BKCYC2jF1x7edeM3/v2hSsF+6oNCJT0Ra75IflAq02Tb9IRtGA8GWKIov
 DiQiRMGMho71+FMkXAn5lO6QdkVNOQtmenaPGkvXm/+uihzgDXTbKVYPbGgrHlFfv5+0
 ErRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701697988; x=1702302788;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=caHOksw5I0x/otbSLvQvnBWXc9OQUPmugqhHhV4G93g=;
 b=ittqVtBAiSc/fysem4IivoK/EuoJ8PNsTxHTNqSltK1jzL3uNySbyjcIdO+cNaXNXO
 2+2aaS2aVfw3QXYtAlz6tDXAjWOSvpLNFAPnLJLARo5Y2RUz/Ai63y7bkmrhK0pR6AyL
 IOm7Imj0Qh9ayD4GSiWFnWc7gbLn246LA1jhSJTZWJn4AeFQDYow4OlHyVqdD4p/sjTB
 2K1dwH336t4UKFsElelirGD34xGHtjXChWWgk1csE9Mxh7PQ6eA3l9NltIrMvsSVyO3Q
 WIk7335mXeH6uqfWow0NhZkFbkvmBU+mTBm/fhU0i9eCxtuZCoylMD7o57RnlsVcDvFl
 dCOA==
X-Gm-Message-State: AOJu0YwXx3OPw30sNEEOp6rIrcPKzItV0S1nUOVdg+kPJmb7NPLDk7+V
 70yQiCYQXi0CG/1CogzmHi/suw==
X-Google-Smtp-Source: AGHT+IHZZ6atFrXFiYIGXh1lMDQZw4HmJbJRHC9P20p593Wf0++RCyxVXc0+Prz/gHfzVPvFoNqyTA==
X-Received: by 2002:a05:600c:d6:b0:40c:909:3642 with SMTP id
 u22-20020a05600c00d600b0040c09093642mr910809wmm.216.1701697987800; 
 Mon, 04 Dec 2023 05:53:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58:12b5:777b:9d17?
 ([2a01:e0a:982:cbb0:58:12b5:777b:9d17])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b0040b561924bbsm16752989wmo.21.2023.12.04.05.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 05:53:07 -0800 (PST)
Message-ID: <75c11af4-3f5e-4909-a3d3-8feea947d4ea@linaro.org>
Date: Mon, 4 Dec 2023 14:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
Content-Language: en-US, fr
To: Dan Carpenter <dan.carpenter@linaro.org>, Sean Paul <seanpaul@chromium.org>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
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
In-Reply-To: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 13:29, Dan Carpenter wrote:
> The i2c_master_send/recv() functions return negative error codes or the
> number of bytes that were able to be sent/received.  This code has
> two problems.  1)  Instead of checking if all the bytes were sent or
> received, it checks that at least one byte was sent or received.
> 2) If there was a partial send/receive then we should return a negative
> error code but this code returns success.
> 
> Fixes: a9fe713d7d45 ("drm/bridge: Add PTN3460 bridge driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This is from static analysis and code review.  It's always a concern
> when you add stricter error handling that something will break.
> 
>   drivers/gpu/drm/bridge/nxp-ptn3460.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index d81920227a8a..9b7eb8c669c1 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -56,13 +56,13 @@ static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
>   	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
>   	if (ret <= 0) {
>   		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
> -		return ret;
> +		return ret ?: -EIO;
>   	}
>   
>   	ret = i2c_master_recv(ptn_bridge->client, buf, len);
> -	if (ret <= 0) {
> +	if (ret != len) {

This is impossible, i2c_transfer_buffer_flags() returns len as-is if no error, so
ret can only be negative or equal to len. The original code is right.

>   		DRM_ERROR("Failed to recv i2c data, ret=%d\n", ret);
> -		return ret;
> +		return ret < 0 ? ret : -EIO;
>   	}
>   
>   	return 0;
> @@ -78,9 +78,9 @@ static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char addr,
>   	buf[1] = val;
>   
>   	ret = i2c_master_send(ptn_bridge->client, buf, ARRAY_SIZE(buf));
> -	if (ret <= 0) {
> +	if (ret != ARRAY_SIZE(buf)) {

Ditto

>   		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
> -		return ret;
> +		return ret < 0 ? ret : -EIO;
>   	}
>   
>   	return 0;

