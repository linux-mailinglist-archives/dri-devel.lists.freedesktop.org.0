Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2D694E2E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 18:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63710E205;
	Mon, 13 Feb 2023 17:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842C10E205
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 17:37:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j23so13113542wra.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Lm+nS8Gg8zNsJOeniVA8BF4O8dai6Uu2xhyHNn6AZp4=;
 b=qGq1QCag4qvKIbeV2URGx845jQQNrAsNE7/t8mft4MhTsu9ZbU8ugiTi5lUMDxNYxP
 BqHoGYc633QgSywg7CrslRA1oU0yvhytYL9fsjY0PVSOp6OEnBJSVjQ6HUWlMgrr0g/X
 ygQutKQae7oNQvhWUEyagVI5sBp50cFL+mRMV2PB8wbmpQZMXIHoOChE98bKR7cffw4X
 QK4QcX1V10sJSLy8Fg8OEFiS2gehrh+/kwr3KRzZEYadELRrBYIJcKnHwGh3YTSLy9nW
 6MmE8Ep7dznhB7yLGXWFXmGle6TBeJJ4kD7dZ/NYeU4Oilkq8f0usbyvsqnX1SR06K3L
 azxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lm+nS8Gg8zNsJOeniVA8BF4O8dai6Uu2xhyHNn6AZp4=;
 b=Z4/Ub57YUEdOCsMGY6fTW1sWCsqgfA3+Vrvqa6WoOHmGWPx6o41pOvbYoYhZE49H8n
 sxom0+sPtFaazTO2fNnYAe1Q5mlhN5b9tsd0mE6tFiFSAge//+gxs3UniTgGAVxqA5qh
 HJbkkX7w3do5oYSi6rHyfcrUKxuxRbvVZKkRXEeTGfnu3pCrB6Mc7JOWZOiMwxLgKL6n
 0sD1cC599MC71XeIpeSwMsVkHy2XUdCefENinbVrtGyDlD1mpf4vcmHV58HwkRYgsSXB
 iq+zJlRbJe9Q6eCQvwlwKaRUN9JTlhPrxtdW6cAA5do2JftwLSWF8aHex+7uHEjP22iN
 ThSg==
X-Gm-Message-State: AO0yUKWCp+dw5hrH1B/HvA/VFRDNGT3DxUQXmjf7PeFM2ICk8VNJZ9i7
 mTNb/bFVlH3OqSGmJ2nSSTrUsw==
X-Google-Smtp-Source: AK7set+wfm9Wu6RZwRDIjW5aqZ6Def93fJ8BzWh4HA3WKGaWSH+d4r3QTVYCqzv0sYj4mVyUnNjGNA==
X-Received: by 2002:a5d:4690:0:b0:2c5:4659:3e76 with SMTP id
 u16-20020a5d4690000000b002c546593e76mr8641780wrq.18.1676309871115; 
 Mon, 13 Feb 2023 09:37:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:915c:811a:b081:f099?
 ([2a01:e0a:982:cbb0:915c:811a:b081:f099])
 by smtp.gmail.com with ESMTPSA id
 i14-20020adff30e000000b00241fab5a296sm11084142wro.40.2023.02.13.09.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:37:50 -0800 (PST)
Message-ID: <fd8985d1-4eb6-3d69-230a-485aa8bc66dc@linaro.org>
Date: Mon, 13 Feb 2023 18:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 03/50] drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
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

On 12/02/2023 00:12, Dmitry Baryshkov wrote:
> Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index eea026cf3ac2..e8b12788dc94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1309,7 +1309,7 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>   				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
> -static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
> +static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   
>   static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> @@ -1331,7 +1331,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
>   		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>   	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
> -		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
>   static const struct dpu_sspp_cfg sc7280_sspp[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
