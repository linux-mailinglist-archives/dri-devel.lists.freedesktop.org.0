Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B070C122
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99A910E33C;
	Mon, 22 May 2023 14:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4632510E33C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:30:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3093a778089so4004283f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684765818; x=1687357818;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hFK421sZXWsImy57dELQxYVenyACa8ZOpTwTIi+yNIw=;
 b=u/r/NVvXme3cZ7Ea4cG1CU5o9nQKccOyY+/BXGX/1woSBPRIOj70AJxpnWHSbw+4K6
 71yOuzdutGLLuF2sB7wbxkjBToHAmCW1yHqNQEHn0xEGvxbgEaMJ0eDQ+UFAZcIa2zeo
 bLL9o9V669iRdjKuecLzMCskR7pdjoRAuzIEHiXQCvtkKeFNxkLrYvF9cwc04GE7+iSp
 fq1kCID/SEM4o2bU4upBtKlPabQjVPX8eLNh0b8S8uRnelfXiJ92yKlD8ZFcwstt0pkz
 QcZfgBtzkfnDneDnARpGQlHfY8X3C8ZJ19mC30pADHtA20T7B0lMFEoBJ0OblJDPsImG
 bJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684765818; x=1687357818;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFK421sZXWsImy57dELQxYVenyACa8ZOpTwTIi+yNIw=;
 b=idfIDTGne9mMhjFulu4sa1gAPXnz+6uQhaSm2TK21AsQ3Beac2cjXuG387zQ/7g+WX
 ND9W3834xGjzy/NjDoyPEeak6at1B2wm/jrvAejIjfxwGna75tk7J9Qfguk/lY/ow8g8
 dSBRVauSXiyakEsiIiGBf8w0tUxx/PLNvyHaXkEQoFmlCpe8FzP2KjTk/SEvrFu5UWhK
 5V4jzjhvNeu5LU3zpML+utyo81SmQ6/mT5FoIg99VJRDoVVvqD19hRLanbNKBFubus4p
 16q3ElHVeNXWZZFjAF4qPKtzuukqP2zDwMghLWJp1FKBsPnzU0UgUHbf6pIILJRfMz81
 aygQ==
X-Gm-Message-State: AC+VfDzwOPo82Tnvl85NlpIyCjmtggAlw2dDOFVRHHN7EP5KrmzzBgkM
 53voe4clODsxU869TtUiW41k7A==
X-Google-Smtp-Source: ACHHUZ6jp7pFJGLKkM0oSfQH+CsPG3CtmrXSNeF0MsvLuYbEaTX0c1jMICvmjd29Uk6I/zOgD2bqhw==
X-Received: by 2002:a5d:4ace:0:b0:2f5:3fa1:6226 with SMTP id
 y14-20020a5d4ace000000b002f53fa16226mr8094109wrs.14.1684765818439; 
 Mon, 22 May 2023 07:30:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df?
 ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adfe445000000b003079986fd71sm7900536wrm.88.2023.05.22.07.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:30:18 -0700 (PDT)
Message-ID: <ba804b7e-1ad4-1898-337e-487dd6c92b0d@linaro.org>
Date: Mon, 22 May 2023 16:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/6] drm/msm/dpu: inline __intr_offset
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-3-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522004227.134501-3-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 02:42, Dmitry Baryshkov wrote:
> Inline __intr_offset(), there is no point in having a separate oneline
> function for setting base block address.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 5e2d68ebb113..0776b0f6df4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>   	return intr_status;
>   }
>   
> -static void __intr_offset(const struct dpu_mdss_cfg *m,
> -		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
> -{
> -	hw->blk_addr = addr + m->mdp[0].base;
> -}
> -
>   struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>   		const struct dpu_mdss_cfg *m)
>   {
> @@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>   	if (!intr)
>   		return ERR_PTR(-ENOMEM);
>   
> -	__intr_offset(m, addr, &intr->hw);
> +	intr->hw.blk_addr = addr + m->mdp[0].base;
>   
>   	intr->total_irqs = nirq;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
