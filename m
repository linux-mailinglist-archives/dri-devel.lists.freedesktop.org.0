Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12334A54CCD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF07610E9BC;
	Thu,  6 Mar 2025 14:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yx3jNbHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B510E9A8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:01:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43bc4b16135so4230325e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741269693; x=1741874493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4u+yD+L8SkoBuycxt7wpDjWCkCg00Nv1+CGnM5syVQo=;
 b=yx3jNbHaqgkS4YVVkMkrI2Y8Nc+D5yrF19TctqKsxim2jWOcnQ21dEu0yybfSUxgyD
 KuAwO0a7TN7lzGVyhfVWIIzrIQsk+eQgEweQmtbu0iGZBJRNT0kJUe5IyLRqHqXbzx/e
 3iHzbRrhS9aLk+D0578dI4GXlqLiB8CckEG3Z8wzko+6KAhNOnvMm27A9oukCskjBhn4
 bsBLREH1aLsyPDFTQ3Azet30zR5ObuzVR1AF3gsVD8S+LTgd8nJvqwW7Cnm8PSPek5K/
 tPI48KwBfIMwt9r6lzbjvnXePSYfrNGmE+Wl9cvOERUoJHaSs4ykwzerL/K5E+Re3Uh3
 kGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269693; x=1741874493;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4u+yD+L8SkoBuycxt7wpDjWCkCg00Nv1+CGnM5syVQo=;
 b=RmPG4TgiXdFf4NUINiRYXEo1KZ4D3/O2qonC4rK6IXHdrBBbzstnUviGaH9pFHqOjC
 4YPFSe/ApVWfOQaR5NJQ8w949FqayHLTGt60kPn33p9/qt/kX5AGUZQ0ZUbJECSSFlzL
 ZXjLrkNJk4NgR4XbF95gz3BgdU7IH1URmaQ8ZqRNqrBQDywpBJmdDmWalfHYPr62yAWl
 fNLa302BtKSI5IO9PYUmzTCylQfqluMfGk2+EZ0UnFga6/ZTNLKIuGrn0pWd5VMy78RQ
 ETuhY8Y62eWdtBHadcDUEgKfs9tWTrGyBFUu4Y2GSaAoXR4hI5FGEKQgBxRaprhRIWnm
 21CA==
X-Gm-Message-State: AOJu0YyHvmZNeCp8tUEORKOSdXLyT+AydzWi0PGUz/wl7pAp1EW1gl7L
 Sq6kyn45KB/L8dPHt5i8hEO3rGHF31UvbXB1rUA3+tUL/fEPs7a5GTOFQETvglM=
X-Gm-Gg: ASbGncv5qFSEh+QBDKgBwK93Sz5eTUQcP8ZvsKNsRJ711a/WbBKAHcHR/wef9S210rs
 s9mHsAL9jE4iCraApuRe4OZCmoelMu+pa0eNPD6OBzCxDBsqT1y7Wh8kxLKyD3d/28F6x/o1AeX
 bkBumckGjU+gOZnQUelfGbBv2ltO8uc1Q+NzHMYFiD/ZOsTXNcfCfSC/xH1qhDDTkb4LUyVl81v
 LHWNuPJMebgiAxWKQFBWWgUUE0LlDoWR0VFUz/YZOo584Y1EsAgEd8shSOtO2GaorP+kuCRY1U8
 mW+lxZpouVAHJCieSdXKhCq1joDIfcolRZYkZwia59RCDEcNH210K6clRDiFEOhAfPB0dk7RKc0
 94+4roYq2CL2mc9i80Uo=
X-Google-Smtp-Source: AGHT+IFO4rfzomCLNmADCAKVmM3ka5dd5/nPpW1p4/Cl3JYo+9BNI7+poWnrhRYHc3uKC6SQbkscOQ==
X-Received: by 2002:a05:600c:1c9f:b0:43b:c0fa:f9c5 with SMTP id
 5b1f17b1804b1-43bd2aed752mr48353045e9.21.1741269692653; 
 Thu, 06 Mar 2025 06:01:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d77f:d3a:3ea1:f8c9?
 ([2a01:e0a:982:cbb0:d77f:d3a:3ea1:f8c9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8c28f5sm20931555e9.9.2025.03.06.06.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:01:32 -0800 (PST)
Message-ID: <afe1589b-81dc-488e-95ee-ce617213cbd1@linaro.org>
Date: Thu, 6 Mar 2025 15:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: dw-hdmi-cec: fix inconsistent indenting
 warning
To: Charles Han <hanchunchao@inspur.com>, andrzej.hajda@intel.com,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 festevam@denx.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250305103541.3207-1-hanchunchao@inspur.com>
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
In-Reply-To: <20250305103541.3207-1-hanchunchao@inspur.com>
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

On 05/03/2025 11:35, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:336 dw_hdmi_cec_suspend() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 9549dabde941..9d5bded54e8b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -333,9 +333,9 @@ static int dw_hdmi_cec_suspend(struct device *dev)
>   	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
>   
>   	/* store interrupt status/mask registers */
> -	 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> -	 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
> -	 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
> +	cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> +	cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
> +	cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
>   
>   	return 0;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
