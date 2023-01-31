Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C48682CDB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 13:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70410E32A;
	Tue, 31 Jan 2023 12:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C803D10E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:45:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bk15so41192895ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 04:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8xbu9OSYb70xb94Yeo31t8Oaxtx3TEHDRghlLnFGwEE=;
 b=HOQM9HVcHNtPQArB9zdGc+O47H5Vo84d9V9VhhhQrU/5yzCLU+SMlVuEXnZEe41pPW
 xCHkVMP0gyrDWj5XBdMUjyi6KNx3SI0bCDzcCw//4Q4eJ0BFD31xHLDO1LwVeNj/HU1n
 pn7Yrhd9FC4tgM74wBgvGOolUVNYG7r6SnbaOrdBKMg+Kqu4XwGbYpdeBgJZXgB+tx5W
 JS6wjUKIIWY0euwy/bDqjwp8YBzxeaXhNr7BKPX0CRbvGRHsHRdviH54iPCU6xATZPhd
 0DvpWRLxxdpNcx2zvS58RGKJzBNRgo8/NV9p6BdhTEQOR3YIKSVo0LTqoThKIYQUrkVI
 7IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8xbu9OSYb70xb94Yeo31t8Oaxtx3TEHDRghlLnFGwEE=;
 b=EoOYxZK+YlsQ6DkxGFcQEU97NiWPPmlVZPbRVUE92vaE/xpxQuqUdLmxFbpXCxMRe/
 NmLDn7sp3r5VcrjkP6Mtz9U8CAI7wCi0vmuPPOks0ErNGR4nG8PPqN9YvQIfLPHRII5H
 Q0WM/mP2HdSVVy2q7FSKRwNvqABkERUNXqiBTaaFQO1hZBQqDUYeR2L+L/D8XPgX+kDg
 E4+hkJ7UI3HxzlTwRsBs3np3vhPcnOjU66x/SLjv6W+sjt/hYZx5FXJAYWz5+JZ1KCA+
 jlh/Vhvj83fHcetguD2sdUfI5H93f3Dc44wBf2d7DrrO7GLNkoljotnzwCrUhOrYSDqf
 00GA==
X-Gm-Message-State: AO0yUKVc/vYQ1+rLMSRJD0NGz0AtTEsJRNuZJL7JwN5XLQ2ys1W1EmlJ
 N8H9S4815M4zlIBex3KNop2x5g==
X-Google-Smtp-Source: AK7set+xEX/0VUfgwRIBFa8ZDHADe1V6jD0Mhcsk+kdmw3nw7+rNAJsp1S6XWKh5HOt4IleZY/zvCw==
X-Received: by 2002:a17:907:a0d2:b0:878:7f6e:38a7 with SMTP id
 hw18-20020a170907a0d200b008787f6e38a7mr3298474ejc.44.1675169115144; 
 Tue, 31 Jan 2023 04:45:15 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 hq15-20020a1709073f0f00b00877ff0c2bb0sm8411192ejc.166.2023.01.31.04.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 04:45:14 -0800 (PST)
Message-ID: <7b90ce05-29ac-da1c-ca3c-c52577d131ea@linaro.org>
Date: Tue, 31 Jan 2023 14:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v12 02/14] drm/msm/disp/dpu: get timing engine status from
 intf status register
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-3-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675091494-13988-3-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/01/2023 17:11, Vinod Polimera wrote:
> Recommended way of reading the interface timing gen status is via
> status register. Timing gen status register will give a reliable status
> of the interface especially during ON/OFF transitions. This support was
> added from DPU version 5.0.0.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 +++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    |  8 +++++++-
>   3 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index cf053e8..ce6e9e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -78,9 +78,11 @@
>   
>   #define INTF_SDM845_MASK (0)
>   
> -#define INTF_SC7180_MASK BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE)
> +#define INTF_SC7180_MASK \
> +	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>   
> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
> +#define INTF_SC7280_MASK \
> +	(INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN))

Not necessary anymore.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   
>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index ddab9ca..08cd1a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -213,17 +213,19 @@ enum {
>   
>   /**
>    * INTF sub-blocks
> - * @DPU_INTF_INPUT_CTRL         Supports the setting of pp block from which
> - *                              pixel data arrives to this INTF
> - * @DPU_INTF_TE                 INTF block has TE configuration support
> - * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
> -                                than video timing
> + * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
> + *                                  pixel data arrives to this INTF
> + * @DPU_INTF_TE                     INTF block has TE configuration support
> + * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
> + *                                  than video timing
> + * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>    * @DPU_INTF_MAX
>    */
>   enum {
>   	DPU_INTF_INPUT_CTRL = 0x1,
>   	DPU_INTF_TE,
>   	DPU_DATA_HCTL_EN,
> +	DPU_INTF_STATUS_SUPPORTED,
>   	DPU_INTF_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 7ce66bf..84ee2ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -62,6 +62,7 @@
>   #define   INTF_LINE_COUNT               0x0B0
>   
>   #define   INTF_MUX                      0x25C
> +#define   INTF_STATUS                   0x26C
>   
>   #define INTF_CFG_ACTIVE_H_EN	BIT(29)
>   #define INTF_CFG_ACTIVE_V_EN	BIT(30)
> @@ -297,8 +298,13 @@ static void dpu_hw_intf_get_status(
>   		struct intf_status *s)
>   {
>   	struct dpu_hw_blk_reg_map *c = &intf->hw;
> +	unsigned long cap = intf->cap->features;
> +
> +	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
> +		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
> +	else
> +		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
>   
> -	s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
>   	s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) & BIT(31));
>   	if (s->is_en) {
>   		s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);

-- 
With best wishes
Dmitry

