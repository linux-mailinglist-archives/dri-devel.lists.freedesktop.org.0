Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A09F3324
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E32410E6A4;
	Mon, 16 Dec 2024 14:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I7KQBxPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8295910E6A4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:25:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so2159421f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734359158; x=1734963958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=+uwMQ5mbp5Vrk2ULZzXAw8C9yBa8vGhTvRK+y8BuBwU=;
 b=I7KQBxPjbHKSpaV2EGLZKnQoChdaH9N+dvxQFucOcfDnCqfpQLErNROkSBSO5Xg+f4
 k/T4bWoqTt3MNE9bhPZn3/mjxhEmCwksf2qgAQQe3sKVIFMwx/B1hoPLVUSuYw2kWkDr
 GFUdCU/FvefLf5+fVICQ/ngukW88TIVHNwTWeac5XprSdCSlJrAoZoZQ+QGpcBb7Wkqb
 KIiXN1y9B1iIp1OLFlf0V5pfzXDL8nu03xAJ8U8vyF2e571/wcv+ETuFrfvYNNTElS6K
 0U1nM6m607pHDyxDCdA6PswJijRsFKTHlIYrfcKnL44Wy8rIWgLhVJf2lh63rAb3kCaC
 2HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734359158; x=1734963958;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+uwMQ5mbp5Vrk2ULZzXAw8C9yBa8vGhTvRK+y8BuBwU=;
 b=KcRjNbyok4EREeU4LJVllA8qEr8R5aogFSshQUuAEM7cmwtif3IY1aYFn7MjzKQDDt
 uX+5sj3lKPJE0MBmbRQV10rqAit9UiFKNFiTyQb2VIFXLT5latCrzanYCTyyhM1kQD9L
 jbFG6UE1HmgdOukGqb3d5UUq6BeS8CMQFnncCAKm1/AnbMrfwOAMpav6tESSQZ9i067k
 b87qRBowCT9++mtvMf/+804KYCw4nv0PUAtXsHK0aKIIygG7eWAgO0V4sPcjZU0nlz6+
 Q1YEOpmHyDlE1FUzY+tgVDslMC4KBXnbuuEPt61eqtDXmfemGii1BmluOh5UssVvhWhf
 xddw==
X-Gm-Message-State: AOJu0YyaRvHRjNOCWGsA28+Jzh2mXMWS3Eq+wADUbf0Vzk0wu8RFNpe8
 lcWYP51vX2uEoQdPadYHLSC6T9AqSOC2AaEwSk2sri+pAcnT2uEqL5q2JqNo1I0=
X-Gm-Gg: ASbGncvPWq9AQGpuU2n9VMjfRhoLbkbelTQgPmEpgfaA0vniLz2pZG5qlk9+bg9wxzr
 dW3ZE/KLVI1R66tKhWWB5BWdCQvsFxJKIhtCqEj+qv45IjA0OoWrJbx/fnhAncpFVL2UcmwIka+
 oMZSXUxrY8Coplx+P+WXIbocWDZneYtV9HA6S+MnyemRc8KxaqeC4+U26TCQQXGgLYeBvk4P1RE
 n3tCUjPjKImw2XZSnN5/ynkTD414ZDJ3VK3Du4nIIgEPg7+hXDIjalmzwOsH/Wr+7vpzvbd/PvK
 iaOKLWF2k+gv2d02VQUexS6BBauKut/NTw==
X-Google-Smtp-Source: AGHT+IHncGpnEBPdWrRT8m/ctY4+LOKeYS4Qn3fkd057u76waPa7jto9zmZUD9m0rc1xQzsMNlU6Ww==
X-Received: by 2002:a5d:4ccf:0:b0:388:c790:1dff with SMTP id
 ffacd0b85a97d-388c7901e0cmr6992301f8f.47.1734359156703; 
 Mon, 16 Dec 2024 06:25:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b75:a430:7bc1:919b?
 ([2a01:e0a:982:cbb0:8b75:a430:7bc1:919b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c806086dsm8227296f8f.91.2024.12.16.06.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:25:56 -0800 (PST)
Message-ID: <ee8d65db-5f17-4a6a-bb5d-46784edde3e6@linaro.org>
Date: Mon, 16 Dec 2024 15:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/bridge: synopsys: Fix Copyright Writing Style of
 dw-hdmi-qp
To: Andy Yan <andyshrk@163.com>, mripard@kernel.org,
 cristian.ciocaltea@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
References: <20241216101015.3726517-1-andyshrk@163.com>
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
In-Reply-To: <20241216101015.3726517-1-andyshrk@163.com>
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

On 16/12/2024 11:10, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The standard writing style should be: Co., Ltd.
> This fix the mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Use uppercase (C) part for consistency.
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
> index 2115b8ef0bd6..72987e6c4689 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * Copyright (C) Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>    * Author:
>    *      Algea Cao <algea.cao@rock-chips.com>
>    */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
