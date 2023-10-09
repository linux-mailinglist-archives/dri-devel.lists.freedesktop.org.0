Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1487BD5E5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D16A10E0E8;
	Mon,  9 Oct 2023 08:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D7110E0E1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:56:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-325e9cd483eso4087266f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696841777; x=1697446577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ueES/8yBzYqCwOAJln/R5/6edxFgxoHrnNrLI+a2X2k=;
 b=W1VoT2GI+kASC7BzJpeb+lndDvlhDGvCVxqXkdQXF60PZWfiRP38vbFcG0N16QwZiq
 Jna8uTSj96ohVwU9zFR1/QEwcZ+Fqfukk1dPBxxAymy1sM10aT2YIhu9IHFEBsOc80R+
 RVwBpOFrZE2uG4axjMdc9mm+/BpxChqi6+5j+oQPBGBS4a9J4n2mmK9pki6FzrJ3he60
 IstUGJFvKEiZj14tnCaB7XNret8JCd7Z1+yuwyYKQEG/khWVD44PNvr0+eu4zrD6clrx
 rV0K/od8LOYTJU/moPI9PlFBTlA3UCXE1Au8eAXjnbTs/Jt42nRm/M1EqJRAgQn77xIs
 UxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696841777; x=1697446577;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ueES/8yBzYqCwOAJln/R5/6edxFgxoHrnNrLI+a2X2k=;
 b=sT6JmEjReqrcp92QqHy9uQp/8EosRDxnmMgefqPMbhfExnfyOfi5BsxfDbkJ5W9ZoO
 KlFnF/rvs96IrqOo7Ap2u0enfdgKD6+1GhG2K7zUNBwdTBTCS9PND1Sb858LBW2NCk8v
 WcMcI2xnNvaiD2OXsOG7ACPdB3tKb3L9ioA/beoiqDBsRC4p6f3IitZ89m2o95Quqzif
 MTwhEjzUx7b5RBVTyUKn01Yc0HZQHduLMrUAJ7lRFhwy4Vnm51EzMNJbqh7lWok/auQu
 YYXfoqSPgj2S/9LRRY1buKa0GpWe37bjHsx23B0RyIUblsBpLjjqHOqpDoB52F9gatJ3
 Kn8Q==
X-Gm-Message-State: AOJu0YzQ4uAIAJDE2AQzSCocLiOeM87/d4G9oi2QHpmOUd62uEV7+VPT
 00K2dXZ6KHF60CA3TY8BapGUPQ==
X-Google-Smtp-Source: AGHT+IFKl1Du09bcDEqIqN0Dx2j1ILGNurHoolKTWXzQ/hnHVeJLeVvEMzSxrr++xZO03RYyGjt2Og==
X-Received: by 2002:a5d:630c:0:b0:31f:fa6a:936e with SMTP id
 i12-20020a5d630c000000b0031ffa6a936emr13100829wru.17.1696841777144; 
 Mon, 09 Oct 2023 01:56:17 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b00323330edbc7sm8974100wrt.20.2023.10.09.01.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 01:56:16 -0700 (PDT)
Message-ID: <1b9b0c61-1f28-4e5b-96bf-65c3d3896a0a@linaro.org>
Date: Mon, 9 Oct 2023 10:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel/panel-tpo-tpg110: fix a possible null pointer
 dereference
Content-Language: en-US, fr
To: Ma Ke <make_ruc2021@163.com>, linus.walleij@linaro.org, sam@ravnborg.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20231007030318.3996798-1-make_ruc2021@163.com>
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
In-Reply-To: <20231007030318.3996798-1-make_ruc2021@163.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2023 05:03, Ma Ke wrote:
> In radeon_fp_native_mode(), the return value of drm_mode_duplicate()

Wrong function, it should be tpg110_get_modes()

Thanks,
Neil

> is assigned to mode, which will lead to a NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>   drivers/gpu/drm/panel/panel-tpo-tpg110.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> index 845304435e23..f6a212e542cb 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> @@ -379,6 +379,8 @@ static int tpg110_get_modes(struct drm_panel *panel,
>   	connector->display_info.bus_flags = tpg->panel_mode->bus_flags;
>   
>   	mode = drm_mode_duplicate(connector->dev, &tpg->panel_mode->mode);
> +	if (!mode)
> +		return -ENOMEM;
>   	drm_mode_set_name(mode);
>   	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>   

