Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56DAD3AA6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507B110E596;
	Tue, 10 Jun 2025 14:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xOzxkwqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0FB10E590
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:10:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so66110355e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564607; x=1750169407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=z4OxVv8oJv1GqLYHYzTXE75rIdx5RHpc0k5r0cFg+Cw=;
 b=xOzxkwqsJqEYuC6D5EaICR74vVjTvR/1qAf5xN8koBjEPjYVqfnt/ZDDdvHp6jPH09
 fDLKVjN3W0J0yIMEtb+AtWfMPOR8yYVT6sLx0ixup5tI+fwRM//Bs7TleIQjphixLwPT
 MPGXLds/zyGh79OcunqIQqu+f5npccbNAUyqmIEmHMNR8BQufVj1QiSz0eCD35I2vCf4
 5epx8gBg47bUmnI8oMaJc+xlJ2pVjFUfYJTGxhQv9rt0JKMIDp/8DaKNCstU566OUTHd
 pWge+4yKQyiMVbks7rKpUZ8wKjTSmXU8NOAgkbvMrbiTTYgujJLiefw9CWprdNE056Rc
 cEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564607; x=1750169407;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z4OxVv8oJv1GqLYHYzTXE75rIdx5RHpc0k5r0cFg+Cw=;
 b=Zinvtjl/mgzAIISXFllTSgwvj8dKrRTcU0uSjtN68Nsv3cQBZwTt1kixkxBIr0SwHM
 Y/IT4PhO8AnRNt0F4ASSnZ8DEdNIGDvcf8kov+gMksaDUX8R+scOpukOsfXOZqEY3jyh
 1QW/gv80UmkrYyEHt9rR/18eax2zqNlDhY3IYWmej+MtIlYbtcBfid1kt8vjydcGQzXy
 yXGxSfwYvBcL7WA72DPqKETQE/jrTuJA6hmYVNgYlmQLSbtM2ZBXU56r01TI6PyNd/ED
 veblVeACLcP+iHwH2GF61S4ixU347ayW6UVVmXuiERWB4E6bt6jYe6sanK8r49NLKNwI
 fsjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Jg1ZLl5VD6DybDxLq3OX2aB/mGwbHocOuSJ9ZOk860QfK4F8dCxryQ5J3HPTCOOBr/7429DyESg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxltRgkLIDcStR4MlmeDvSDxk+XAKnxmrcLyHLssd9kOLisEzZ7
 u8L78/G/BX0PCaNCZLAI16CSPET0ZtM8M0itfe3vGzMCEwG0RzHAPKVwc6sAVbL+vIc=
X-Gm-Gg: ASbGncseD8EX1izUDgZTD2xDFUgtF1FolYWXWRnwEZ31VnJvB/n3YWlcnR6PqHplg8D
 3dw3WzaJm8ES1JI85nKgpiVH7svDniPI+FfVrhXYjDWQoPYpx+5aGV97PA9H6ZUxnAgww28EuU8
 32YvbORoN/FD1I/RIKsQxjA7jK+AITexN8VOJ5wK2wiZnEqsTHTJDZfpdfu28xiek4v05IuVCrA
 JFj5Z4ZND5d3ugZvkoPQNPCwj+8yqVmYEJmn/WtlZX+iCf+No1BfMHxWExMzumw348Q8SU25iVg
 R7E1mzLXEObFvnT/WDoZiSX6spBNFC/7/d9LgfGZQQ+GzHpcZ/Oh3HhLH5C570DNBeBCuFBZi+4
 E6zmwUDUSaJBKqAOQgth6JDVCTfCol18wddN8
X-Google-Smtp-Source: AGHT+IEkqCEXSbEGN2qKWC1bgGuh0Dpru4IMLoe0WkTjzMUjiyMf9422e97D4rL4Jdk8panjohDk+w==
X-Received: by 2002:a05:600c:4ecf:b0:450:d61f:dd45 with SMTP id
 5b1f17b1804b1-4520134088bmr172213265e9.4.1749564607020; 
 Tue, 10 Jun 2025 07:10:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14?
 ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b3992sm12497663f8f.35.2025.06.10.07.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:10:06 -0700 (PDT)
Message-ID: <eb9bd4e4-3032-4f36-94e7-b89ff74bf327@linaro.org>
Date: Tue, 10 Jun 2025 16:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
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
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
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

On 10/06/2025 16:05, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..92f6c39eee3dc090bd957239e58793e5b0437548 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -323,8 +323,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   		struct dpu_plane_state *pstate, const struct msm_format *format)
>   {
>   	struct dpu_hw_mixer *lm = mixer->hw_lm;
> -	uint32_t blend_op;
> -	uint32_t fg_alpha, bg_alpha;
> +	u32 blend_op;
> +	u32 fg_alpha, bg_alpha;
>   
>   	fg_alpha = pstate->base.alpha >> 8;
>   	bg_alpha = 0xff - fg_alpha;
> @@ -402,7 +402,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				       struct dpu_hw_stage_cfg *stage_cfg
>   				      )
>   {
> -	uint32_t lm_idx;
> +	u32 lm_idx;
>   	enum dpu_sspp sspp_idx;
>   	struct drm_plane_state *state;
>   
> @@ -442,8 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct dpu_plane_state *pstate = NULL;
>   	const struct msm_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
> -
> -	uint32_t lm_idx;
> +	u32 lm_idx;
>   	bool bg_alpha_enable = false;
>   	DECLARE_BITMAP(active_fetch, SSPP_MAX);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
