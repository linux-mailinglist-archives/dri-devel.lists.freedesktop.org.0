Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A778AA5648F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75810E0FB;
	Fri,  7 Mar 2025 10:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OwweIbHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2054510E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 10:03:34 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-391211ea598so1082840f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 02:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741341811; x=1741946611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5coBjYAR+KkcY316sSLQxCrPrRJBZlHcoLTLt78E9VI=;
 b=OwweIbHebwTalaZu+7AsQghHiQKuHhMIDTt7ZZ3Px91nR71OE8EfRrBapbBoIPCXmJ
 1f/bpFwZ3/Jwr+u2QxhU3pcTJeqAP6WY9+6Uj1uynVJ3fDIwH6d5ZGW7jp+WhcLcZsmM
 iFEQAR6I5baKZvuYqqY+x3otJ9W6XgbZw0vmCqo/mghNyINVM+5+/nk++1bTLvWj0K3i
 L7eg/TlCBLz0LMwoKDsbDgt+9Vy5tGnug5KKkqaY6gX/eWhNDHb208LWfrGm15f4y20s
 p/qH1sLJM3YE+/h5IenSPHLHjH5BGfKB+QFvL/B3sv4RkJuECE/JV0ypO20CEUkLbUzD
 5CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741341811; x=1741946611;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5coBjYAR+KkcY316sSLQxCrPrRJBZlHcoLTLt78E9VI=;
 b=Sg9ZvoxRlZt5keH5bUhNjYHjoVL90EjCvIFnM5oZtfNvFeJ1Ty8TK1BSXsxa2lwz2J
 tRXmyNJhsdo+cdb8FxJlDw2A2ymx/mdfjFL3rZwOI8TNrbzgr+PsztEh+0I0wi4QA4Pc
 C824JG6h5NMpeknjbuM5ZPNNJ8dqGwAD+ipo5UnAdmqEtTbcEokm+/bbzVgFR/nPktss
 bJd8KRAnWPq7kECsPuMe/EcAFBbK2CJMpYIxSiouaXKjqw1mSt1u0Ib43lIKjAwOQ2ye
 VcUjUqHtI6m+EzyEElaA+/odEkmobjsR44Iv19hgca7xcVhLYBpcpjPcZ3kEGyFvLr+4
 EeAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY7fbgnM5MkIQ5iALRcI2ls2N/IPxuERe/Yq6nRSVeuoVcrZ1vSEoQslWcUYF61l1MvjQjEwD4K2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6Ov3+dO+tDuct0MPwARQSq5O7gWvY7E3dsFlONjJCQ0XcnkgB
 rcz/jTd/YWaIdm6L7mZ/Urcm1MHFueU4tq3Nh9edV++l4r5Dgw0ztPfBc2COwGKZFZlH5kApP4m
 a
X-Gm-Gg: ASbGncsG5hJ93gZ51BYUI90b6MgGHz0VwVi1qrLTYDTnttBLQFWl8mSCBWwiiHXP9rZ
 T50AMXKMhfZ1K6+vkrsXTDTsReM5Fvyg/Du3YQdP+xumn2IS8O+z66zbiXSXANnHK0I5Jylhtmr
 UXB6JUfRMC86+wqdbd2Dtm8kJA79TTNXB74g58DeGo2BNmdODaR0XGtifUml4acrgc6YzhcMLx2
 YiZJLRVlAZmcKwLNDxUQl2tyYGRIK2vbT/AgCJVcWl+oVGaqtVv+X/Y2EXHxsLpTrp0sKYyogLk
 W8HHP8ahU7utWpf9Jr8d9iQqlukrV3Swu5kOAqfNsyC0SfKNFLcvXqkNzPQ6CMQkMSBIMPcdQkZ
 83AggEH/6qlW4I5iMK+yv7Q==
X-Google-Smtp-Source: AGHT+IGo5lIfayWuQKBOZu/tc6K26BU8mCl+TXqRzocjAtATUAyaGx0M3aWMwY8mYe+1quyVtarCZA==
X-Received: by 2002:a05:6000:1fa1:b0:390:fb37:1ca with SMTP id
 ffacd0b85a97d-39132dbb25amr1401061f8f.53.1741341810940; 
 Fri, 07 Mar 2025 02:03:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1ea4:9158:5668:7977?
 ([2a01:e0a:982:cbb0:1ea4:9158:5668:7977])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfbb4sm4953874f8f.30.2025.03.07.02.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 02:03:30 -0800 (PST)
Message-ID: <4bdeab38-d884-4864-8654-c6a70ef06288@linaro.org>
Date: Fri, 7 Mar 2025 11:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: Add mipi_dsi_dual_msleep
To: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lujianhua000@gmail.com
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com
References: <20250307091519.245889-1-tejasvipin76@gmail.com>
 <20250307091519.245889-2-tejasvipin76@gmail.com>
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
In-Reply-To: <20250307091519.245889-2-tejasvipin76@gmail.com>
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

On 07/03/2025 10:15, Tejas Vipin wrote:
> Introduces mipi_dsi_dual_msleep to make it easier to use msleep in the
> case of a double-DSI panel.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   include/drm/drm_mipi_dsi.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index bd40a443385c..d9bc0d79dd82 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -306,6 +306,12 @@ ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>   			usleep_range(min, max);	\
>   	} while (0)
>   
> +#define mipi_dsi_dual_msleep(ctx1, ctx2, delay)				\
> +	do {								\
> +		if ((!(ctx1)->accum_err) || (!(ctx2)->accum_err))	\
> +			msleep(delay);					\
> +	} while (0)
> +
>   /**
>    * enum mipi_dsi_dcs_tear_mode - Tearing Effect Output Line mode
>    * @MIPI_DSI_DCS_TEAR_MODE_VBLANK: the TE output line consists of V-Blanking

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
