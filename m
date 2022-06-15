Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1A54C8B3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590EA10E564;
	Wed, 15 Jun 2022 12:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DF310E564
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:38:13 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id d18so13123012ljc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PG7iY0+TDj/chiZdR2cC4heZlo/M9u/ieIAV8vY6Das=;
 b=Xl5eFZCFDCGHw0FdFRNiqoRQonBG4+PXwS7mt/Nx3HTd4Rqk6p368Yz3N1WW3UpJRE
 EYi0KbftvU+NiW2Pw7lhXmfSC8vLoT4PUA8M9rYN3duzV2AfDRWjm0tf2xSPdKOdSwUB
 L+wr6PkiM0iB8r+r1kcHR9W7/in8t1BJcVvF/SE9uCMddHCw5gTKkd6Aw4a4801jlyDT
 RaKKEthFD9hT9c6KWrdAOwYrhGkj+91noCUrWQCFVKShQUaQ93tP9LDnqhI7k1AY9tKa
 6NgNpIK8oDkdop3Z93SLCOlD9Q1+YYK+saeuyTkaHA72RfPI9vMl6IgcRvvGwDr50AJL
 Zphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PG7iY0+TDj/chiZdR2cC4heZlo/M9u/ieIAV8vY6Das=;
 b=AZ57a8myYgZby68yfydbGKwUrCYUaRHl4OXkJuIuDLDORAKANwvhbzlP1sYx+Spq5p
 yWJ9ncHtJdJuNLUnIP2OByW5IOP9SO/9TNUqdedxi4lEB2Na/nAkncWBFbs5k5v0tIEm
 1qreWTdZDxRQ8ZRYGpX3zlOEh30+Tr6pQVtasPOvNyx0crJjpt46W1Ap9MhmHmmVRwc/
 wA6+qEG0xZFibtHydgTZlY2BS2pm1HW5YOPzGp5FZKMEiYxR0S/fBw25WMUPHhYjtK9y
 cIuuJijKXnL75/XvTEvu1pm6IgSjxBtW4g1RdNI+EZydYoF7JizZfnaAaGWUUVMRVUBT
 Mh1A==
X-Gm-Message-State: AJIora+wzy8O1Ihuy3EMy5mWy/CY66k+Z+mrtiOyg8Fruse0NtxM6KxI
 mzD3ndOYUpDu2E+G8BsydECnWA==
X-Google-Smtp-Source: AGRyM1sUs1f5G4JMsBLXngfR3Jru33Odao/UMNaP9hCjTrSPQKkIGqQiFTk6Y/E8eqMspJfzGwGR/A==
X-Received: by 2002:a2e:9143:0:b0:255:6913:2d37 with SMTP id
 q3-20020a2e9143000000b0025569132d37mr5185731ljg.290.1655296692202; 
 Wed, 15 Jun 2022 05:38:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a19ad06000000b004785b0dfba4sm1789476lfc.195.2022.06.15.05.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:38:11 -0700 (PDT)
Message-ID: <dd9b388c-9121-0cdb-e2d1-a8026ce475b3@linaro.org>
Date: Wed, 15 Jun 2022 15:38:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: fix maxlinewidth for writeback block
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <1655235140-16424-2-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655235140-16424-2-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2022 22:32, Abhinav Kumar wrote:
> Writeback block for sm8250 was using the default maxlinewidth
> of 2048. But this is not right as it supports upto 4096.
> 
> This should have no effect on most resolutions as we are
> still limiting upto maxlinewidth of SSPP for adding the modes.
> 
> Fix the maxlinewidth for writeback block on sm8250.
> 
> Fixes: 53324b99bd7b ("add writeback blocks to the sm8250 DPU catalog")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 400ebceb56bb..dd7537e32f88 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1285,7 +1285,7 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
>    * Writeback blocks config
>    *************************************************************/
>   #define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
> -		__xin_id, vbif_id, _reg, _wb_done_bit) \
> +		__xin_id, vbif_id, _reg, _max_linewidth, _wb_done_bit) \
>   	{ \
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = 0x2c8, \
> @@ -1295,13 +1295,13 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
>   	.clk_ctrl = _clk_ctrl, \
>   	.xin_id = __xin_id, \
>   	.vbif_idx = vbif_id, \
> -	.maxlinewidth = DEFAULT_DPU_LINE_WIDTH, \
> +	.maxlinewidth = _max_linewidth, \
>   	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
>   	}
>   
>   static const struct dpu_wb_cfg sm8250_wb[] = {
>   	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> -			VBIF_RT, MDP_SSPP_TOP0_INTR, 4),
> +			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
>   };
>   
>   /*************************************************************


-- 
With best wishes
Dmitry
