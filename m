Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC85ABC7BE
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 21:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFDF10E0DB;
	Mon, 19 May 2025 19:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BrgKI4aG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8983E10E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 19:26:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a0ac853894so4201007f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 12:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747682798; x=1748287598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=RFXXvcbboaJbTNLJTmEOAzlPujyDrBlvP86g22hiZa0=;
 b=BrgKI4aG06VLXhjlREzrrO+P/68WLG95ubrwatwksnkRAgWNNVgexXxhU4ztwgxnuQ
 MU2jp+aDPJC0v6XEGSLhyBOhbufZM9mkiXLrGokFuqPukDV1gtMlU3BiRoneJErcKf/6
 AFNYA0RQsAw/v0gETRW3EBbOV1czIR5z4n8mFCnzlcON7wre8Rl5Dfyjf/JIpbvoeUpd
 ndbbC8XtDVFuh6ZmdQ3PYvKhwGwmzTTCTN2Oykh0EwHca7AdHstXO1Haq3BF2LB2zuli
 C5WqPCSH+unl7SsEPyNZUAcrAi+IudoVyx7CL6vAq+0n/ILPIJ4Y6wySv41e22nDwRHZ
 Pe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747682798; x=1748287598;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RFXXvcbboaJbTNLJTmEOAzlPujyDrBlvP86g22hiZa0=;
 b=hl6UT7WkXtQcmUDG5U3lQZr/pwTObB2c9Ez5r2QY/wAIZFxS8kKx8Q2NJ8R75VQ6mZ
 158kwf//B9VXAtsuwVk5/4P7OoV133H9NjECM/DqkHhYCRmCX5ydX+7uZ2XlYBE524gG
 /49Olj288hZn4r52dwFlk2SY19Uxa30ro58CNw3WaS7mLVXkY+/uJPdpyBGxi7jdSLf8
 UymTZl2RLXT++YzxQacQnDYIH7jHrf4h6ULxAh5djTiS2O1VRHH0qx2S5E7Umc+0UfiS
 ykWeQY8N21XLzaypwtJ7vpnPbNbRRsnsd/4NQlmdkMULMQuYdMmFKXo/HEe3kDfh+69u
 37SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSYoMmC1qBX7Ruw8LeyGUx7h6SX1tIlCXOlo6t9ZJBEAb3VN/OqCEFuYLjn4pWyf/kbUSVdp8ItG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypUTu8Vw0HPFcRmUYIpMaUIpHVdqblEfWRLM+p00GlE6E+q4Wx
 Oz6V/QWmheifluixqnhjOA2XEN+gC+izkwZjSGkqIhS9yA6exwVM1OugvEnMsg7WJzw=
X-Gm-Gg: ASbGncs49BkJlbLtp6SmJCFxi3ul6crzjn4PwoYbTnwRVzZAyU1ATQ35HAFfYVp7uPS
 tYFYtG9Gyr38LuC/2KKjaRZOqAQL1/Wno2bVSG4Q15OxTMw8B+72VexDcEhEPr1MQZFK473rHKN
 LfxSuPuWvqTVaMN8E0ooPKqsoXulR2eu0fEpxrZ2AyDoiUT7WqKwT1pmSB5tD8CcKp2nbvKBOOD
 DVINPaYeZhhVwhkwPkv0I/U1BIgYg4VcYqbey/Q92KcqPsySpp/0FOHluhlk9S0ah9Qk9mJyN18
 XSgIt2Oo5OLRA3mvIKua4HKbU0diq9Y6rWpSIxf3X9RjxjzL0O0Ywc0rbk/+r9PS1xC+lMZmxMB
 a4D3QvjJO5b4xypJb4ZcyhZo4oI9C
X-Google-Smtp-Source: AGHT+IGjldG+V2h53roi6wkz9WwaXLvsrszRGhagPmCy3Brgl9F4PMRvClIni1Lu01HQTQBEJ+avFw==
X-Received: by 2002:a05:6000:420c:b0:3a3:7709:3038 with SMTP id
 ffacd0b85a97d-3a3770931fdmr1873072f8f.38.1747682798298; 
 Mon, 19 May 2025 12:26:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18?
 ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a360b0b766sm13490571f8f.56.2025.05.19.12.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 12:26:37 -0700 (PDT)
Message-ID: <98163164-9639-4b1c-9407-2f0845a4a111@linaro.org>
Date: Mon, 19 May 2025 21:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 01/30] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-1-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-1-6c5e88e31383@oss.qualcomm.com>
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
> As a preparation to further MDSS-revision cleanups stop passing MDSS
> revision to the setup_timing_gen() callback. Instead store a pointer to
> it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
> revision can chance between dpu_hw_intf_init() and
> dpu_encoder_phys_vid_setup_timing_engine().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 8a618841e3ea89acfe4a42d48319a6c54a1b3495..d35d15b60260037c5c0c369cb061e7759243b6fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -309,8 +309,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   
>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>   	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
> -			&timing_params, fmt,
> -			phys_enc->dpu_kms->catalog->mdss_ver);
> +			&timing_params, fmt);
>   	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>   
>   	/* setup which pp blk will connect to this intf */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -98,8 +98,7 @@
>   
>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   		const struct dpu_hw_intf_timing_params *p,
> -		const struct msm_format *fmt,
> -		const struct dpu_mdss_version *mdss_ver)
> +		const struct msm_format *fmt)
>   {
>   	struct dpu_hw_blk_reg_map *c = &intf->hw;
>   	u32 hsync_period, vsync_period;
> @@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   
>   	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
>   	if (p->compression_en && !dp_intf &&
> -	    mdss_ver->core_major_ver >= 7)
> +	    intf->mdss_ver->core_major_ver >= 7)
>   		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>   
>   	hsync_data_start_x = hsync_start_x;
> @@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
>   	c->idx = cfg->id;
>   	c->cap = cfg;
>   
> +	c->mdss_ver = mdss_rev;
> +
>   	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
>   	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
>   	c->ops.get_status = dpu_hw_intf_get_status;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_timing_params *p,
> -			const struct msm_format *fmt,
> -			const struct dpu_mdss_version *mdss_ver);
> +			const struct msm_format *fmt);
>   
>   	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
>   			const struct dpu_hw_intf_prog_fetch *fetch);
> @@ -126,6 +125,8 @@ struct dpu_hw_intf {
>   	enum dpu_intf idx;
>   	const struct dpu_intf_cfg *cap;
>   
> +	const struct dpu_mdss_version *mdss_ver;
> +
>   	/* ops */
>   	struct dpu_hw_intf_ops ops;
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
