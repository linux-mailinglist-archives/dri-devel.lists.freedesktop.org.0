Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E119893AD7D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A16010E208;
	Wed, 24 Jul 2024 07:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SfR7guEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34410E333
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:53:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-368663d7f80so3538621f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721807595; x=1722412395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=a2KlSahuFArGhX1/nu3nesKMLISwLS8Oj6J8y4N86tg=;
 b=SfR7guEV4OkJWXt/QG1AMJX0v0Xed89glZ6t5/1W5EPY5Z6eOxnmGOACPkocSYjL5n
 z33YN9GhRl0nOwu/7z+bL3K6j4B8jAzlNg0938+kewrZ+WdhZuHni2e3+tjtGXoFpcOG
 PJo83Vb4JCtvD5Sxj6T5dlnhAPKwFiRkPgp4xcebPY8TPaEWLZDFEid1qsIMjRkEdDKw
 5GyIfmS2EAE7WAEcmHqsO42aJ4l0QYOOO1mIUPJZq6ZUSIPzSh0lcn4PwfrePq+d0nCc
 vmhT34RKhsq5xNBk8HXRplXn1Ug+6g0cGlhFVUpvIrY/LVQ1qnPtXy8Tzzn2Fo3CtWDg
 p79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721807595; x=1722412395;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=a2KlSahuFArGhX1/nu3nesKMLISwLS8Oj6J8y4N86tg=;
 b=rVs2vS0Q6ktdtSASZLtW5oY6tLzfbSnRNAOaf/aboXH3ZivkSdEKYhJI+g6Lawp41I
 BG0q00v8GkSRbfAsrxufVhvvuZaWZLSAQvdl8fJfOd4Qdr0XPTbizR4ivlRLAFHh0jkh
 LruLahkdB2Y8Iay5f6/PqYoA+A2Jijek4asz+pG+1j8xQHSiTQUC9Y5ePMZa3deymJEI
 rWFCP2hVDCpSU/IDD8Bed/qUsHgsajqWySF50TisHDoJeXP3vAKuMboCVeTVqWV+LW4l
 vSDoBMDwNnnEqX1i4O8DO66TPoTyg8GL9l1ag9UplWcXZMxpf2M7OYuvpB9/eKZBaiHa
 JYUQ==
X-Gm-Message-State: AOJu0Ywi3NiXrwfvu/VMPjPyD1rcUz6yW5hmflIK1OAuj9ezTEyo6S2W
 sglaQxipzsCkfUydNtIcAZgdMPNdclIqR9QmXL9ggP/nY6VnnGmoQBDsotxmxOU=
X-Google-Smtp-Source: AGHT+IGwVEKmEHSe9k5B2D7ijwxG0vlMth4QsYhxFpbQgy422sw8HIZrxRw/RlhoiJzflOjRUKSsww==
X-Received: by 2002:adf:e6c5:0:b0:367:8909:197b with SMTP id
 ffacd0b85a97d-369f5ba036dmr840211f8f.61.1721807594852; 
 Wed, 24 Jul 2024 00:53:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7?
 ([2a01:e0a:982:cbb0:deff:4fa8:5076:b4c7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cf156sm13691739f8f.70.2024.07.24.00.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:53:14 -0700 (PDT)
Message-ID: <ed6b10f5-f297-4839-a9fa-8c178792ab2d@linaro.org>
Date: Wed, 24 Jul 2024 09:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: boe-bf060y8m-aj0: Enable prepare_prev_first
To: Dang Huynh <danct12@riseup.net>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20240722-bf060y8m-aj0-prepare-prev-v1-1-0e51c0f59d22@riseup.net>
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
In-Reply-To: <20240722-bf060y8m-aj0-prepare-prev-v1-1-0e51c0f59d22@riseup.net>
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

On 22/07/2024 09:07, Dang Huynh wrote:
> Enable prepare_prev_first flag for BF060Y8M-AJ0 panel so that the
> previous controller should be prepared first before the prepare for
> the panel is called.
> 
> This makes sure that the previous controller, likely to be a DSI host
> controller should be initialized to LP-11 before the panel is powered up.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
> This fixes display initialization on some platform/devices such as the
> Fxtec Pro1X.
> ---
>   drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> index e77db8597eb7..7e66db4a88bb 100644
> --- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> +++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> @@ -377,6 +377,8 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
>   	drm_panel_init(&boe->panel, dev, &boe_bf060y8m_aj0_panel_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
>   
> +	boe->panel.prepare_prev_first = true;
> +
>   	boe->panel.backlight = boe_bf060y8m_aj0_create_backlight(dsi);
>   	if (IS_ERR(boe->panel.backlight))
>   		return dev_err_probe(dev, PTR_ERR(boe->panel.backlight),
> 
> ---
> base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
> change-id: 20240722-bf060y8m-aj0-prepare-prev-2db87e7dd996
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
