Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C366920AD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 15:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE0710ED2B;
	Fri, 10 Feb 2023 14:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A0910ED39
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 14:19:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a2so5219284wrd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1uTFfmvobksvpoGMelQsFMa0FYBiyHzYPIzwFP1iQCw=;
 b=OTFNGu03iKhaysy/pY/1pl3FPBrTNkjUm6x5Sb/3sRJoxAE76OhyP0zP72fc2EtuOd
 XJFePkwrYGy1yhpPYo7IsuNsHrqFTjin4aNNlpKZUIjYlmmI/UY/bJZV2UxN7iUGgLz5
 8sUBB27Z7UZuzcsC4Ff9TyKOL/Lrrmj04YlIISU2RmoEXhJeTvWYAE9Hx3Fgk7K4Af7/
 oOZ06FWW0NIdNCmw5fwGEDjItE1OSgZRAsyGeH2KUAUAnoeODq3E76ajy18qIckAkKsr
 QMkByf81kU5S5vctaL5a5IAqkLmZepYEIedIdC7nPgcdaS75KzwO5STeMF6YlmXxDJ5y
 9B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uTFfmvobksvpoGMelQsFMa0FYBiyHzYPIzwFP1iQCw=;
 b=Py6Gb03bVy6p18MtGupkwXUGTm7rNz+w+75gzfn71QKqBl+LUie/YVhvJkIoYIvJNO
 BGvbJlqVxlNvGfPlA4Ok6wF/LljL/JfGJwAyC3x/2a3TZVOoGJkFzQrpTpv+LUFLcOHI
 1m9fQBUu3dsct2q2gwEIG95pBfLYbxVAYsku8FiwGSo20MAipB0lsWxgfPX4FihnllHB
 dc+hOP1ZPOu9jO/broN7Gul8EgfulKEWdVimFZuVQsgkQRXJBsCpkr2h3oIL9KbYfMS4
 va9mYgsvTPW1g/qqylSqpYTZfDAZ+BHSIg5VF/XUYnAA0x9OcAlBvsHuuLAOs/x283sa
 GkhQ==
X-Gm-Message-State: AO0yUKV2HtZci0R4RRRstCacy9d7O9PFEDn5OPuf/Z2/ld8t8s0UZkaw
 YoTFK+8Bro6pSbGlMO/NQLElWg==
X-Google-Smtp-Source: AK7set8E+f+ZV83w6B4IZTO9iq19ePvcHokwop+CDn+zBqZ/sctxhXM7i0ujcsYzlSt9Utc2g5ywwQ==
X-Received: by 2002:a5d:464b:0:b0:2c3:f8b6:666b with SMTP id
 j11-20020a5d464b000000b002c3f8b6666bmr4591136wrs.26.1676038748717; 
 Fri, 10 Feb 2023 06:19:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027?
 ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b002c54c92e125sm584454wrq.46.2023.02.10.06.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:19:08 -0800 (PST)
Message-ID: <63ea4f1a-a9be-eef7-bfe9-acb5567b4107@linaro.org>
Date: Fri, 10 Feb 2023 15:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 15:15, Dmitry Baryshkov wrote:
> The SC8280XP also has a black hole at the top of MDP_TOP region. Set
> corresponding bit to disable access to that region.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3fa202da62fb..f792275dc48f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -743,7 +743,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
>   	.base = 0x0, .len = 0x494,
> -	.features = 0,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
