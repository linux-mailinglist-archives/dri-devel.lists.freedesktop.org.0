Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29E69430D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 11:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0846510E53E;
	Mon, 13 Feb 2023 10:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4DF10E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 10:41:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10950598wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 02:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=OgjcS7+KeP4Hkyc+aaJK85YSDYhCssexy5B+rXr3Pyg=;
 b=urZnPrpzZoz6Ic1MunYYoiruDUhQqVZw5En4oGtoHOCitOwD6ocINtqUohxHPZY5AH
 bcCdGQ+4Toei25OE1J8MEKcCDgnw4bGa4sz5cmt6Kp+eYnG7OJyL6I9qrhWPwFyoJtr6
 OW+7Ycn5FzPFsSHpTjONynkTSuO3cYv5ggpm18MkH3ZmA1Qg6W/4y/6qxlUO0ELj9nPu
 eTXTP8Mpn/RICzKb/ArfNnbeSaZDA/tzt6ONeHjnFJ/LAWBwxG+gKb2BBjAw0dh+NxNz
 8gTKj/etLOWWyJCf/6cFFSkUxBWxk2W/19EY+8SbuQuc5s2REtmCmP7AYPQt0wtrOiYu
 k84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OgjcS7+KeP4Hkyc+aaJK85YSDYhCssexy5B+rXr3Pyg=;
 b=pm8VM69akEX7/A6af5TI+D1Szb9k673jSJ6wHXV2XS7j70ApWsV1K17Bp5PtD7bV6K
 LyyQyr50u4m5TGTDiKoXQV+vrXSKkS9ORNNyw/n0mWAdiLzc8qUl3QPpr67aYl4hn9sq
 kBVcTRyXp1B++WWAixdPIawGjY6F1/zt6qIhuV418lFtIejPCT/hqacXdG+TyPRxhdkh
 iRrmW1thrYHpXq9kKYuXDgdc7ExLDwVfOhjF11IrRqddw9MMh1geDVHcvVtR6hIKGUn+
 Lc5fYA31HxqYk3m/zJnU9pm+U1qL28+1QcKgin6oaFlqYU8A5jElQgSR0ZXQcwQ4Vgka
 HZAQ==
X-Gm-Message-State: AO0yUKVM9QD1PlPkqlG+YVMzXWcgIrymz8MWEm38S5sCzXMj2G4Lhbec
 InUob5JMdRnumDazkAbGUm8QjA==
X-Google-Smtp-Source: AK7set9rA8mQHgq6wuA2iP/x+pm5F6nO5RKTtN9bnsMKERYPqrD+b7wr3e1UiZlS/Wh3AR99cFOATQ==
X-Received: by 2002:a05:600c:a692:b0:3df:d86d:797a with SMTP id
 ip18-20020a05600ca69200b003dfd86d797amr21049235wmb.25.1676284915858; 
 Mon, 13 Feb 2023 02:41:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8?
 ([2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003de8a1b06c0sm16565396wml.7.2023.02.13.02.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 02:41:55 -0800 (PST)
Message-ID: <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
Date: Mon, 13 Feb 2023 11:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
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
> QSEED4 is a newer variant of QSEED3LITE, which should be used on
> sm8550. Fix the DPU caps structure and used feature masks.

I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
		qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
		qcom,sde-qseed-scalar-version = <0x3002>;

Neil
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 192fff9238f9..c4e45c472685 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -458,7 +458,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>   static const struct dpu_caps sm8550_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>   	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>   	.ubwc_version = DPU_HW_UBWC_VER_40,
>   	.has_src_split = true,
> @@ -1301,13 +1301,13 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>   };
>   
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
> -				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
> -				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
> -				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
> -				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   

