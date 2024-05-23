Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBCA8CCD0C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 09:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0425810E29F;
	Thu, 23 May 2024 07:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ATvrAgM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDF610E316
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 07:30:39 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso11710892a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716449437; x=1717054237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YUckpd3f12M8kYaJMY5HnA/Fu7ehVQRJEnQQrDzdFKA=;
 b=ATvrAgM/iNiWo6m5J3DsbJp2vnDpS0/BI1z0g8U+r+N7uxFTPJBVHHJNRPH4e4osLg
 2pzy0p/UJ+vYSUZ+LS0rgc9OuNj4kYaXqOnMlkzP6VNLw9zZGGMMS0AM8HRjZMrivRO7
 YDWfsioQLCnVuVn/NoMjPOanbLpWcOyHnHYuIoOqoMqvqWFjBEDk5AAkrea5sbQ6o/6p
 mVYO94FzGwbLgLjSsGwr9cQWJv7s58rrcTpzIvcsaqiLO99e0akW8JimBIOsZqq4eFoB
 b7wPkV8fHlwmTs8hyzsVEx0EWZTDgWiJP2bKbfQNTkndUrtoLZbEslPo6VFrw0lzKPYU
 jnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716449437; x=1717054237;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YUckpd3f12M8kYaJMY5HnA/Fu7ehVQRJEnQQrDzdFKA=;
 b=UrNfp1Gl2rNWqOtBuuGYARfo/zLs68uFKdjIUQ5X//WeHcQCyY/uJN125Uu8uXlZhj
 EAfHmtw1gMJEMnT+rCjndizKsCCj83GNdDIPeFKTU/PH2OzVYM22uK4Y3vzBiQ0FcsUk
 hwhvRYX8bFEXBwVAfHZfO2eyH9gy7PJOvDiCUyE10DMCFpjmfbuK599HhzamHJYHzMa9
 EYE2AQbb9ZBNf/dqkS+yRZnq7131HOAFKC23WwuQoTkXyZcIT69+epngbVcy5e+Wn0n9
 kQ0mL2H6YEQB7ekmih8IqS97IV4/a3RPxP4oHSMzbCnIBXB9FENnUI2usqU7EY1R1fHg
 D/TA==
X-Gm-Message-State: AOJu0Yx98bhUi1IwoYSQgzX0AQWfOKeHO8y5cq2fhWtxgUejR1DdcnOi
 78bY7VAYqJfAwjwLM4KI3Q8k0gyyyMk7/J3P6sGNi8MsxhvpTTQEVgdr5xZPK5E=
X-Google-Smtp-Source: AGHT+IEg8yrUmCNlfpPlVHZKKpplSIhv6sL7GTGMIAgYNR9Fx/APKeFhT3bY1HqnCGw2fw6dqJEnqw==
X-Received: by 2002:a17:906:c799:b0:a59:d2ac:3858 with SMTP id
 a640c23a62f3a-a622806b89amr257389966b.11.1716449436803; 
 Thu, 23 May 2024 00:30:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:825d:600a:c16:a973?
 ([2a01:e0a:982:cbb0:825d:600a:c16:a973])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d2dcsm1892573566b.44.2024.05.23.00.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 00:30:36 -0700 (PDT)
Message-ID: <b55df123-4e22-4cba-b36f-41b4cf117e15@linaro.org>
Date: Thu, 23 May 2024 09:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC] drm/panel-edp: add fat warning against adding new
 panel compatibles
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org>
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
In-Reply-To: <20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org>
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

On 23/05/2024 00:07, Dmitry Baryshkov wrote:
> Add a fat warning against adding new panel compatibles to the panel-edp
> driver. All new users of the eDP panels are supposed to use the generic
> "edp-panel" compatible device on the AUX bus. The remaining compatibles
> are either used by the existing DT or were used previously and are
> retained for backwards compatibility.
> 
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> The following compatibles were never used by the devices supported by
> the upstream kernel and are a subject to possible removal:
> 
> - auo,b133han05
> - auo,b140han06
> - ivo,m133nwf4-r0
> - lg,lp097qx1-spa1
> - lg,lp129qe
> - samsung,lsn122dl01-c01
> - samsung,ltn140at29-301
> - sharp,ld-d5116z01b
> - sharp,lq140m1jw46
> - starry,kr122ea0sra
> 
> I'm considering dropping them, unless there is a good reason not to do
> so.
> ---
>   drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 6db277efcbb7..95b25ec67168 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match[] = {
>   	{
>   		/* Must be first */
>   		.compatible = "edp-panel",
> -	}, {
> +	},
> +	/*
> +	 * Do not add panels to the list below unless they cannot be handled by
> +	 * the generic edp-panel compatible.
> +	 *
> +	 * The only two valid reasons are:
> +	 * - because of the panel issues (e.g. broken EDID or broken
> +	 *   identification),
> +	 * - because the platform which uses the panel didn't wire up the AUX
> +	 *   bus properly.
> +	 *
> +	 * In all other cases the platform should use the aux-bus and declare
> +	 * the panel using the 'edp-panel' compatible as a device on the AUX
> +	 * bus. The lack of the aux-bus support is not a valid case. Platforms
> +	 * are urged to be converted to declaring panels in a proper way.
> +	 */
> +	{
>   		.compatible = "auo,b101ean01",
>   		.data = &auo_b101ean01,
>   	}, {
> 
> ---
> base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
> change-id: 20240523-edp-panel-drop-00aa239b3c6b
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
