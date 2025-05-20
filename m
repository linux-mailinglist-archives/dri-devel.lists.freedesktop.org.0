Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45740ABD14C
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2581010E3B8;
	Tue, 20 May 2025 08:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g6p8xHqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBAC10E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:03:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a37a243388so407199f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728230; x=1748333030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fRiRUZVEI5gSVi890ddMliFysSWOPKRi8GLZY0BnzXQ=;
 b=g6p8xHqB21cZ0fuFVsCrfuE1h0hJCXnLoUBwVeAUkT5GrtoTdZUFWRODXGrW/nEdXR
 Q8JO9K4sqIDsquI+2jjvIIl2j5yKu2H8mIe88ZGQfjuS7/9aIDiZhLLReEiisM0uEIuy
 y4qFDaQhy6f6pOeD96TvcUmXCZ3r1CiaYoyDd9nT1/Ik4Nf6x2Yl8uei891bwyTi8Zib
 4AjRXJnedcur9xFY89SLvmIlEblBui1l7QZTNhch8D0Huq8n9kfjmsd1r8UmhCUN5pKC
 kRPqkGHLKsxmTWno1tLxiK0CL8tzTfsS7hjnfoNrh2WdmkDFtLMe+w52vMGuSKmfFNpH
 B5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728230; x=1748333030;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fRiRUZVEI5gSVi890ddMliFysSWOPKRi8GLZY0BnzXQ=;
 b=HJ9VE+ruW+eK3gDiUo75z+ktpOmJ1/Qj/k2tfsP8qcHwaUX9tIobjy5LvYt1Bd6QZA
 sYwThthvl6xaZnWguyDQyhLNBN5Yg2lgu+iUTc1WSR5m5+uuYckmlogB14NJODy2zJoM
 Ki6YZg24L2rNh/UqI6tm/p+eeQipVQYHRVWVZlVL7yEjdYLC+SCUzVKNFZjKfXQh2G6+
 8JWcZqWnY8fCFjSXFBeYArTysB1NbllYpGr7VplU7TFZGh/em803Q3xhbhb7Z987ArFm
 9Vi+I1skCN9gZi2v54qGcycANOAxT1PBmshNgnefZdr2BULwB+Swwd4cqzdHDzR1Lxol
 tzJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2cWpeIrTU6dbaZEGfrkkDER4DI3+Wudm//blrKTriFnL6H5lrKz06+xTLjwOJUwpfTDVPqKqriic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeCcIpdscYYm0DumvVeJ4zlKcDJvQXBlDUa+tunY7c2E3/Hb3n
 C66jsPijp8oFj3IDeSeQYkXcBEFdIBuj/sLxWKTjoTjMwphkzKDbqPm8fdPoyMubiUOjf1Ibc05
 t6Ap2
X-Gm-Gg: ASbGnct1l75TFOjj3Oih05joKFa7WRUuBZxcT0MthJAD5r1+cece8qq9EC4CQGPgBXu
 QMZH/MspygNv1Fr8MyTwUC11iACEOyJdnslTWSrIy4mY/MBcfWFAPdsV8s4tiWQxNsntJA0+W3f
 unuHuqsfKyAqjhBrDUQxnY4+6hR+xYDU4iV0vjXKxNp2+NIZ5Q8fgF5qCJOeL2PcAW+OQjskElk
 Cejy+VUnMlhYBg9vrefyocIszvbgZtK3+Wijy386B1I49s9QMM1oooglG+HtNo2Vhw3wYEck6Ei
 9cTJCHJK3RFvOHjNvw3PEuLNR0KhQmK6trVUDgOZBtiAJB3pIoxo7eGVjqXn3PjiTL2JWyKWVwz
 Mpv38KnF6XYsLdaOPuWyXu7vwL4nP
X-Google-Smtp-Source: AGHT+IGf0PXIOAiHDjY2cAuTVXjbVpD4XwfuT57YbruZDTUyE667S6PA+347JYKqGk6xECjJrLE5MQ==
X-Received: by 2002:a5d:4ec8:0:b0:3a3:62fa:fb85 with SMTP id
 ffacd0b85a97d-3a362fafcb2mr9821068f8f.28.1747728218296; 
 Tue, 20 May 2025 01:03:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a37b0bbd1fsm1094973f8f.100.2025.05.20.01.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:03:37 -0700 (PDT)
Message-ID: <9337b57b-cd86-4f1f-b9f8-9c10d2f16fe2@linaro.org>
Date: Tue, 20 May 2025 10:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 22/30] drm/msm/dpu: get rid of DPU_DIM_LAYER
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-22-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-22-6c5e88e31383@oss.qualcomm.com>
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
> Continue migration to the MDSS-revision based checks and drop the
> DPU_DIM_LAYER feature bit. It is currently unused, but can be replaed
> with the core_major_ver >= 4 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>   24 files changed, 85 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index ae66c338250664f9306a7d431cfa18ca07a916a5..9a8f6043370997cb12414c4132eb68cc73f7030a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -132,7 +132,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -140,7 +140,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -148,7 +148,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -156,7 +156,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -164,14 +164,14 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 72a7257b4d7ba5bfe89ec76bac19550e023a2b50..5cc9f55d542b79bd2859cdd13d7f9640bf385866 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -133,7 +133,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -141,7 +141,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -149,7 +149,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_2,
> @@ -157,7 +157,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> index ce169a610e195cbb6f0fee1362bcaaf05df777cb..0f5e9babdeea837c77546cd60cf9b545434c9746 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> @@ -68,7 +68,7 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -76,7 +76,7 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -84,14 +84,14 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_2,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 23a3a458dd5c260399a42e5f4d4361b3c4e82c4f..8e37c40620b62aacdcb47c7a04bcfce944ab0b4c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -136,7 +136,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -144,7 +144,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -152,7 +152,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -160,7 +160,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -168,14 +168,14 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 75f8f69123a4a6afe8234a9de21ce68b23c11605..a05d2ef8fc9d217898b8c12d4639563b28b4477b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -136,7 +136,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -144,7 +144,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -152,7 +152,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -160,7 +160,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -168,14 +168,14 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 6b895eca2fac53505f7a1d857d30bb8a5d23d4c8..cb0b5687b5239418f50c539447f9cfa56e81fcc6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -109,7 +109,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -117,7 +117,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -125,14 +125,14 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index e2306d314ef8f8b59078a8ca8c529f2e56385c98..8fb926bff36d32fb4ce1036cb69513599dc7b6b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -107,20 +107,17 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_0,
>   		.dspp = DSPP_0,
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_1,
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_2,
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index 62136811a530a6072accbd1ab3e02e7e24220ccb..5c2c8c5f812347970c534769d72f9699e6e7049a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -91,7 +91,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_0,
>   		.dspp = DSPP_0,
> @@ -99,7 +98,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_1,
>   		.dspp = 0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 34f11fb084c02cf994c272196299bb9f7bced4f1..17fa0ef9ac03e4649a218cd837b296211ef4506c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 135b4f8171360493e58a1945105f8722d513d720..f6a0f1a39dcc3c9e82c07889d71905434274cdf9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -84,7 +84,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sc7180_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -92,7 +92,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sc7180_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 1189a5ecb3b7b50430eb275280c2309ee9d90b63..343ff5482382645fbd440d18d7ee46e5b3fc868c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -57,7 +57,6 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &qcm2290_lm_sblk,
>   		.pingpong = PINGPONG_0,
>   		.dspp = DSPP_0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 13ff6bdcc517fd566e7701f7a7cefe5ff19c5421..06bcaf4d8b0db74c349112af6884f7f3139a7ff8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -91,7 +91,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sc7180_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -99,7 +99,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sc7180_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index d4c2d2da91aac0bce46c4d65079f01484a769ae3..47053bf9b0a205302b3937e625fbeca8d17f0c82 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -57,7 +57,6 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &qcm2290_lm_sblk,
>   		.pingpong = PINGPONG_0,
>   		.dspp = DSPP_0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 9135853a0225fa60acb80d17f627153d25c612e6..9c4e8450b67760c880d9bd2528c6a954a0282e08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -58,7 +58,6 @@ static const struct dpu_lm_cfg sm6375_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_QCM2290_MASK,
>   		.sblk = &qcm2290_lm_sblk,
>   		.lm_pair = 0,
>   		.pingpong = PINGPONG_0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 6503f11f65c11806c5b9558a0f9fd05b228340be..e81a2a02e0a6379382058fd89500cf2064a2193f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 202de6f9b0c65c6f2caa9e9d5232f5b92d8bdf01..b0e94ccf7f83e9c3c41f1df363cb6a8c24f1503d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -88,21 +88,21 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sc7180_lm_sblk,
>   		.pingpong = PINGPONG_0,
>   		.dspp = DSPP_0,
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sc7180_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sc7180_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 85778071bc1347008dbe4522aeb9ca4fd21aa097..2cf30234e45da8a7776d61c49c26abd75d070941 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -134,7 +134,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -142,7 +142,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -150,7 +150,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -158,7 +158,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -166,14 +166,14 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index f9676f804f9132296467bc751e11036696afa942..dcef56683224b5715c2608b5472d2d5a0da62010 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 7462cfc4cf8de4a10326c83d3341dbee76e437e8..5f5987d5fc602df29c5eb289823de5dd359df014 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -134,7 +134,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -142,7 +142,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -150,7 +150,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -158,7 +158,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -166,14 +166,14 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x400,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 695ae7581a88b36fa1f28aa3cd0c9166090e940c..6f310216fbccb985308f617db20c1878e622340a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -132,7 +132,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -140,7 +140,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -148,7 +148,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -156,7 +156,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -164,14 +164,14 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 9a25113df5aec527baa514aaa61f2b47c2443d27..ba8a2c5dc5e2b3474b295c86afbbbe8f8d416ccd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -132,7 +132,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -140,7 +140,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -148,7 +148,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -156,7 +156,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -164,14 +164,14 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 54815c613f087454aa7b4befc84462265d8dfc23..77986a7bd62c1b6323482426e596e5974ba40865 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -131,7 +131,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
>   	{
>   		.name = "lm_0", .id = LM_0,
>   		.base = 0x44000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_1,
>   		.pingpong = PINGPONG_0,
> @@ -139,7 +139,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_0,
>   		.pingpong = PINGPONG_1,
> @@ -147,7 +147,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> @@ -155,7 +155,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> @@ -163,14 +163,14 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_5,
>   		.pingpong = PINGPONG_4,
>   	}, {
>   		.name = "lm_5", .id = LM_5,
>   		.base = 0x49000, .len = 0x320,
> -		.features = MIXER_SDM845_MASK,
> +		.features = MIXER_MSM8998_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_4,
>   		.pingpong = PINGPONG_5,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d64ebc729bfb589bf90af89c094181f879d5b1ef..ad0460aa5b5ce5a373dab18c89e4159855da4d2b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -89,12 +89,6 @@
>   #define MIXER_MSM8998_MASK \
>   	(BIT(DPU_MIXER_SOURCESPLIT))
>   
> -#define MIXER_SDM845_MASK \
> -	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
> -
> -#define MIXER_QCM2290_MASK \
> -	(BIT(DPU_DIM_LAYER))
> -
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
>   			 BIT(DPU_WB_YUV_CONFIG) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 5e4608d10c6d4fee387c9a599a73b15661148430..cc17b20a7d4c15b0cd9c5dc8b9a4b78d4cb78315 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -84,14 +84,12 @@ enum {
>    * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
>    * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
>    * @DPU_MIXER_GC              Gamma correction block
> - * @DPU_DIM_LAYER             Layer mixer supports dim layer
>    * @DPU_MIXER_MAX             maximum value
>    */
>   enum {
>   	DPU_MIXER_LAYER = 0x1,
>   	DPU_MIXER_SOURCESPLIT,
>   	DPU_MIXER_GC,
> -	DPU_DIM_LAYER,
>   	DPU_MIXER_MAX
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
