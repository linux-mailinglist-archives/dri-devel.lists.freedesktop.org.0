Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC6FABD135
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5F410E4CF;
	Tue, 20 May 2025 07:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X0jhjrUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC010E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:58:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a361b8a66cso2266009f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727926; x=1748332726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=oo0/tdevSaG7ElMyXzN5kWb1dc7pDpkxqWGhmvLy1sA=;
 b=X0jhjrUzk6go0M+i8pt32DFnaa9gTEpaYanPjTD28ZHK1kZGx96GgU9QGrWqon51Zo
 pccikaC4k9mp1bj1sgoXkEvP5pl702YfT9Td/MwTJsiR+Yiz2OsUrxma/3JW0c8dhPyJ
 UoxLrw4Sqwybwwi1zoO03jnhnn/O860dY+7srMDgIvzacuuEuDbmFGI4d2NDfqEuXZuS
 jiBjtEs6oS+SNPhCq0Hm30qLvLzDYIfap/a3qE/4i2T2b9GrZuTJ69ZMWYGjaUOAP2YF
 oHG7RoPKrhZdMNrYTHNhk+SzlZUgtqZrCKLsqDLdMw/oj57XbhSKL4FXbOEL1jYpPH9h
 +lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727926; x=1748332726;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oo0/tdevSaG7ElMyXzN5kWb1dc7pDpkxqWGhmvLy1sA=;
 b=GJjlsyHvzXF241CslPDqYiFTbWzN4UhhFNGXQLp8ZWLBCUuBBD4jf6S5DhXqFBlgPN
 lrSpXKqz8YMN4dG3lg5v+FdDdt0wgxa2ns0UEGAAyWjf1BsfcoqFhGMllgvRcyajSWhK
 ismvNb8vGOoJreRF8VXC71ccvdAqIthnkoL+3XlvkkimkPPUO6BCwDUnEouDSuz9NtzT
 DCMhrYFp6vynJwmJUciugY1ER8IWSnojxA0XA1KSvV25WfWZNLRX7dqAIVZWz+WsqX96
 2I8JK32GBPC5bbdKQ/EiHWtvt40xcToEsxWsF6MoZpNIW5x5xqLhivVquXW47gGjmFqb
 Odfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/rS5ZHk2QKiTs1+nqjbVz+WwIbJeVhlEJ3xzZOei8PzhKwHQno8A7+O/bmKenoa0oHlN6jnA3Ms0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkhE6iIid0FL0QqN5aNm72yAbfO52B8AwwA0Qn2ve3q6bQ7ULv
 tdpAEJ4OSveD4AgLG5yRuf+wbuhyPK2fkZsCAA3kqXlvyUg+VoaFdP+rMRUd89B6t9E=
X-Gm-Gg: ASbGncsBTMpdlWZayW8jXUL4CZBR5Sv2cq+AKMrI6kEwcy5HPQPP0ZwrcmlCq8mrgRT
 Y8A56CzryXx905BYQj+8fiDJo9TAMH7nkvPPAmGgn4p8ZQAxzOSaJWJdFb3yqrAL1pe5MtBcjWJ
 kcHy3GB5cpZwrzygjAskSf9s+P7WYNL9FbzaGlrhLJgGJAhhHYSzRbwu7l0rbE+WCiYBGGEWqSN
 9UyzSuyotvoWnAmlxb07/TxyeiYkErhtqmZW1jNOhTV6IFTWUIKGaiUYe8rGh/aIa/7CRjvDBBo
 EBgYrfNV6g2886lBm0QQ+UwzYif/GdNUykxnnukU7BVValoqtfb8royqRaAuI1gXgu9vwuRVAIu
 3UWj8Xe6yMipF9BfLE84jVKkf1omS
X-Google-Smtp-Source: AGHT+IFCFBQUc2T7aE15/7qoiKLEOsTNzdjjQB7Bt1UC1UIFDiRVUhj/6u/Dr9+31dg/KRb6wY9wxQ==
X-Received: by 2002:a05:6000:1449:b0:3a3:7638:d754 with SMTP id
 ffacd0b85a97d-3a37638d82bmr3475599f8f.21.1747727925905; 
 Tue, 20 May 2025 00:58:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88941sm15684159f8f.61.2025.05.20.00.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:58:45 -0700 (PDT)
Message-ID: <8eebc659-b5c7-4c49-b2cb-e0b20dd30f8a@linaro.org>
Date: Tue, 20 May 2025 09:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 06/30] drm/msm/dpu: inline _setup_mixer_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Inline the _setup_mixer_ops() function, it makes it easier to handle
> different conditions involving LM configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
>   	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
>   }
>   
> -static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
> -		unsigned long features)
> -{
> -	ops->setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
> -		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
> -	else
> -		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
> -	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
> -	ops->setup_border_color = dpu_hw_lm_setup_border_color;
> -	ops->setup_misr = dpu_hw_lm_setup_misr;
> -	ops->collect_misr = dpu_hw_lm_collect_misr;
> -}
> -
>   /**
>    * dpu_hw_lm_init() - Initializes the mixer hw driver object.
>    * should be called once before accessing every mixer.
> @@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>   	/* Assign ops */
>   	c->idx = cfg->id;
>   	c->cap = cfg;
> -	_setup_mixer_ops(&c->ops, c->cap->features);
> +	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
> +	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
> +	else
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
> +	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> +	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	c->ops.setup_misr = dpu_hw_lm_setup_misr;
> +	c->ops.collect_misr = dpu_hw_lm_collect_misr;
>   
>   	return c;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
