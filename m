Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F82971A62
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911610E3CA;
	Mon,  9 Sep 2024 13:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x1JujasP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9357910E3CA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:09:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42cae102702so20071165e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 06:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725887347; x=1726492147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=2pp8+krOVBN4xiv3btMIYSmkgmn24OFZlDjgzfDJ46U=;
 b=x1JujasPHRjTJm8WAnkoH0rq/JZC2bb6FE0A6McjI1kFrwugXGhm2rz2FxC83bZZlg
 kOY9qVM6NszVw6B8T1vrY4IXS5jA1eKVLyM0UVz3+pAz/XLZoadHWGy1ta7Pa3FxzZTV
 LAer2xNu8xWCCwFWbMZaIxV1sxCBTrZmXnjm38r/A+g1P4xvtf17e+7KLJQFIAt+qD47
 AD0dcHjz01NAkPHD7iU88Mt65cW8I3p8u0x5kCGNLs1Dfj6Po+TMNTAUKiC4fYVLDt1C
 OlxP7Jzs3nvCNTrLloAeQ8d5TJjdPcBT16i8QxI5Y9nWdp6OOL+LK1CKUnJE31ecoq8R
 mGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725887347; x=1726492147;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2pp8+krOVBN4xiv3btMIYSmkgmn24OFZlDjgzfDJ46U=;
 b=sJcTfE1YT5jLmoxAKlzVbgS1ZEiMMyiCIlJrrf+kBLcqtJkgUErpGDeKq1g00Jj6pe
 vHuRVUaEkMUDx4IWk7ECk1G3aTWFdb9rUtdxsPVjTgatfZW86K/RJWn/94OXUR0xBDYp
 RgHg2NdJ4FXKscz6pi3PifzB2mcGNW4FaUAeSYw6qApHfd2fyocpyKFeWYd9OrMekdVF
 RFRkyXM0vPwzASNrajTx5EsCqwupgDASZyzTaSXe01VOmhMfzB/OEzzllIcyOFL26gCA
 lpRAQEgTIPLVUJG7VzJY4jHGMSSyPVDapTCvM3Hj93SWGAiUEkgx9hARjgwPGAnlUk/Z
 xvfw==
X-Gm-Message-State: AOJu0YxToOjCKhPp6SnLsoW7gR5sOAmNbDkkn905TaWzexzZqRB1Qa6o
 XsdkWvk4kIEDixVX87VQgtN1igp7EYAkgdsp2I4rJyF1ji3rfnMg3s9qSRQFqtM=
X-Google-Smtp-Source: AGHT+IHSD1+u3qLHgQQDgLd9KTZj8ktLT+x+NJyEUasmCWPbR1m2BPv58TPiHRNGozX4xwUTGBFGpA==
X-Received: by 2002:a05:600c:3555:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-42cae70f2c4mr59033445e9.10.1725887345788; 
 Mon, 09 Sep 2024 06:09:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850?
 ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d35e5sm6036285f8f.76.2024.09.09.06.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:09:05 -0700 (PDT)
Message-ID: <5d4416f1-d585-44a7-a5db-7fc93c7af4fa@linaro.org>
Date: Mon, 9 Sep 2024 15:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: khadas-ts050: make ts050[v2]_panel_data static
To: Min-Hua Chen <minhuadotchen@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240908133533.112894-1-minhuadotchen@gmail.com>
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
In-Reply-To: <20240908133533.112894-1-minhuadotchen@gmail.com>
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

On 08/09/2024 15:35, Min-Hua Chen wrote:
> make ts050_panel_data and ts050v2_panel_data static because they
> are only used in drivers/gpu/drm/panel/panel-khadas-ts050.c,
> and fix the following sparse warnings:
> 
> drivers/gpu/drm/panel/panel-khadas-ts050.c:620:32:
> sparse: warning: symbol 'ts050_panel_data' was not declared. Should it be static?
> drivers/gpu/drm/panel/panel-khadas-ts050.c:625:32:
> sparse: warning: symbol 'ts050v2_panel_data' was not declared. Should it be static?
> 
> No functional changes intended.
> 
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-khadas-ts050.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> index 14932cb3defc..0e5e8e57bd1e 100644
> --- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
> +++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> @@ -617,12 +617,12 @@ static const struct khadas_ts050_panel_cmd ts050_init_code[] = {
>   	{0xd4, {0x04}, 0x01}, /* RGBMIPICTRL: VSYNC front porch = 4 */
>   };
>   
> -struct khadas_ts050_panel_data ts050_panel_data = {
> +static struct khadas_ts050_panel_data ts050_panel_data = {
>   	.init_code = (struct khadas_ts050_panel_cmd *)ts050_init_code,
>   	.len = ARRAY_SIZE(ts050_init_code)
>   };
>   
> -struct khadas_ts050_panel_data ts050v2_panel_data = {
> +static struct khadas_ts050_panel_data ts050v2_panel_data = {
>   	.init_code = (struct khadas_ts050_panel_cmd *)ts050v2_init_code,
>   	.len = ARRAY_SIZE(ts050v2_init_code)
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
