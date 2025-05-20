Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB9ABD11C
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B3110E3EE;
	Tue, 20 May 2025 07:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VaJvnj9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7194B10E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:56:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-442f4a3a4d6so33976135e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727760; x=1748332560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0I2wRodR62pAK0bg8x/QhipVuGL+ClzHWobDCBX3tOg=;
 b=VaJvnj9F1krQwUGgiEILqY5wmmt8UxlJtECKMqHD31oKXLjRO2x3wB88QeOGRtHpVP
 LTm3TY26wwb1RJCFyIq7p72/4sJwlQihYumXZEKnkzrU+3du3DV4hZMasOZMZXCxPuAp
 n8r0rWsmG3HagNBkmORlkfWh1oD16pYHgiQkQUlDMDrZh9y+oJhpJwiQ/xKmAY0k7iAj
 oTXQZtCB2wFJ4iKCzkJ+fycZiL7b/c2EK0pELY4Ql12TkDdj5HnfPJGJb5ES/C/8vTWE
 9A0wLlY+iL+hIHwQJN+74FMCQzholYt+TjCrjrt7zgchCYNT1tupeUYB0wAC7mQ5OTi9
 /sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727760; x=1748332560;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0I2wRodR62pAK0bg8x/QhipVuGL+ClzHWobDCBX3tOg=;
 b=Up5Zbvqy9a53Xb3k1YnCPGGZ3k053Lomt0OMJe0xEZtnB0HnivV8MgNbrhs0amyrv/
 xqKOtxX5Kxcv1JVsewrWiXqmC5MGiumSTVkOGYmv6nZ/ZhRm//NUgXmCTXJyDhxZUqD0
 5PcxUQ2V8IPhv+NRd0PIuuUffPS7LsVaConL4n2z65DfXDvv2TGMuIp1X/HsV+rZ42ps
 Oc8r4c44cxUJMifQzdPG4Exvy+oYU//BS4B6zgpmQ1jvTchzvBfqVLk9MjRehNQTJkjo
 nCE8lb8xeJwLoEly5TxLIvkNAmtI+R6QD5mgT//T+mNTA1x73wVH5HQH8igO1yPeyKNP
 l0cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpFKmX07weFTCe17sFsPJWsXsC6D4tvBU9Z9XEQLaop317zGSsapI/J2xgFQtQvVKUzxO5qfJgNI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl9RTvseoqxaPP/fnsSmyouIK/4YRW0UTuATiMz6J/SSbjd5Ln
 WHSE/js9TDVvqUS5/mfQzgNIXuAloOlXoF+0oOGBv+h/l38uw4bGEE8L4Ygr8+IxxWU=
X-Gm-Gg: ASbGncv33b059A3WYXmjbnpLWHS2Lj18cW/cyZwnwi/XaLg36+rb35Qg5BgK9v9ZQ+d
 8GwLKxs2+AgI5nKkRavAt7DDtbzUPrOfzirGKoaezcdIkQ/oZdACfDWOC/1wHy13pdiUmjrLZou
 bkwv5kt4MkhaA+ogeYBZXJOvvPWNkmb0JRNzacG6W0bHQ950DrjVZxhueU9yk37jEmonKGRHNOc
 Arf6KcBREzDfaft6IeCO3fNDeAiGeDd+Wl8vgQ0QtmIdic7wHX8j2mVMuVoAnuZH0QruPatORFz
 Hz4ZJMvW3JZ/m8+BULfuvxfx+wRBszdEvJkzTKYPQX6fHGTvfDBAc0rs55Y3cx7x5qXvoDiNJjg
 Zq2UyCtC/xvr3by47cKRCnzqkmbZP
X-Google-Smtp-Source: AGHT+IG+UutCJ5uoL03Fe0Oog6nZwJVbFVfmiiIGSvVYk/3U9fDVypCX1g+HKEERIxuujpy61L0fDg==
X-Received: by 2002:a05:600c:46c7:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-442fd93d0a1mr154292465e9.3.1747727759945; 
 Tue, 20 May 2025 00:55:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6f0556bsm20284135e9.12.2025.05.20.00.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:55:59 -0700 (PDT)
Message-ID: <c9ac6caa-2f8c-4b1f-b993-e8f402350df7@linaro.org>
Date: Tue, 20 May 2025 09:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 11/30] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-11-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-11-6c5e88e31383@oss.qualcomm.com>
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
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
> check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -105,8 +105,7 @@
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_VM_CFG) | \
> -	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +	(BIT(DPU_CTL_VM_CFG))
>   
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -133,13 +133,11 @@ enum {
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
>    * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> - * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
>    * @DPU_CTL_MAX
>    */
>   enum {
>   	DPU_CTL_SPLIT_DISPLAY = 0x1,
>   	DPU_CTL_VM_CFG,
> -	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>   	DPU_CTL_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
>   	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
>   	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> -	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +	if (mdss_ver->core_major_ver >= 7)
>   		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
>   	else
>   		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
