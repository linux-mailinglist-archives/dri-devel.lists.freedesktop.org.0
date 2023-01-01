Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A868265AA14
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 14:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E11310E2AE;
	Sun,  1 Jan 2023 13:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1FB10E2AE
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 13:12:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bq39so30380101lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 05:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QVXOGsSEFWDc/rgEWF6ke2jDVluPykhI1l0rnmmQ59I=;
 b=EG1XyayUuHAYff1qHrxdteoEJ5VmOZrWnUYktFQT7fWaS2YnZq/RF799eQ1wQbuVcB
 9NNju3jejs/sLKhNTFbhL2dQOMJ4piehT+nivj6C/WgFwHrkuLyx/1dcwjsSosHkkpxU
 /n3aLiPiYsGEnX9GKQdoBTd9fsj/Y+GcXMbyGwTpkkBYy8MHjyT0A7at6K1gvztAKyPg
 sJsAxsHU17P9ff1gcZU1/AQldYmUFrAtcPuCAS35o5GfDZKYJT3ro2ejckEjCqWtnCR4
 r4ivMMR0X3y+jPFkSxKbXbVeKC7NFPXUaENU2QNmpf0yreZnwTHvu9UcgyihaErq/A3Z
 z1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QVXOGsSEFWDc/rgEWF6ke2jDVluPykhI1l0rnmmQ59I=;
 b=CfyKMHb0DdG4Kv68xK1YOVk6NTy0CwoPG4pRFYUt254yx+4IXVvt6UK4fxPSqk/qxh
 BUH3vgKfTyZShjHf8C48RbK7IKA09BqgztSTx9OHqTdO7xpRtgiSCR7UikvjL34uZZcC
 zP0CqQu/Xd/OPGIi47IpMxp9RVKBy4yhHwzldULnxq56WxS9sHjZ7ofSCZD9S3JQIXOY
 Q5JklF9CSISmlPEKMEGgtTjaPDwEkPCFLjeCioTjCw9y6r8e0c+FQADuBJUPY+fBtvfZ
 RuInoug5irxkRNOG9lJihB07N7hG/wxemFTVT4n1jZBqgDLESp3hQyeyqVi5xgqPjI40
 wFXg==
X-Gm-Message-State: AFqh2kpxUy629jaKcz5nWBxMjS9SMGxN8mRUtGO/0KjuhiF+Hvuf/drd
 IgYEtnN75iBlps0HpweKcaKjXA==
X-Google-Smtp-Source: AMrXdXved5Y9cZQHX3+CPnnCir6y4RqhhGepHV70Lo3Sb7jV/wJqh46CqOXwCx4ipthbTKPgGMYZUA==
X-Received: by 2002:a05:6512:3d9e:b0:4c0:2b07:e6e7 with SMTP id
 k30-20020a0565123d9e00b004c02b07e6e7mr13892907lfv.58.1672578756438; 
 Sun, 01 Jan 2023 05:12:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a19f518000000b004b5b16c3e8asm4131459lfb.164.2023.01.01.05.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jan 2023 05:12:35 -0800 (PST)
Message-ID: <ccd35acf-15b5-91c7-606a-b327229cb255@linaro.org>
Date: Sun, 1 Jan 2023 15:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 5/7] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221231215006.211860-6-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/12/2022 23:50, Marijn Suijten wrote:
> All SoCs since DPU 5.0.0 (and seemingly up until and including 6.0.0,
> but excluding 7.x.x) have the tear interrupt and control registers moved
> out of the PINGPONG block and into the INTF block.  Wire up the
> necessary interrupts and IRQ masks on all supported hardware.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 78 +++++++++++--------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 12 +++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  3 +
>   5 files changed, 68 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1cfe94494135..b9b9b5b0b615 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -86,6 +86,15 @@
>   
>   #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>   
> +#define IRQ_MSM8998_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_INTR) | \
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF3_INTR) | \
> +			 BIT(MDP_INTF4_INTR))
> +
>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -100,13 +109,15 @@
>   #define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF1_INTR))
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF1_TEAR_INTR))
>   
>   #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>   			 BIT(MDP_INTF0_INTR) | \
> -			 BIT(MDP_INTF1_INTR))
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF1_TEAR_INTR))
>   
>   #define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
> @@ -120,7 +131,9 @@
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>   			 BIT(MDP_INTF0_INTR) | \
>   			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF1_TEAR_INTR) | \
>   			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF2_TEAR_INTR) | \
>   			 BIT(MDP_INTF3_INTR) | \
>   			 BIT(MDP_INTF4_INTR))
>   
> @@ -129,7 +142,9 @@
>   			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>   			  BIT(MDP_INTF0_INTR) | \
>   			  BIT(MDP_INTF1_INTR) | \
> +			  BIT(MDP_INTF1_TEAR_INTR) | \
>   			  BIT(MDP_INTF2_INTR) | \
> +			  BIT(MDP_INTF2_TEAR_INTR) | \
>   			  BIT(MDP_INTF3_INTR) | \
>   			  BIT(MDP_INTF4_INTR) | \
>   			  BIT(MDP_INTF5_INTR) | \
> @@ -1300,63 +1315,64 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>   /*************************************************************
>    * INTF sub blocks config
>    *************************************************************/
> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit, _tear_reg, _tear_rd_ptr_bit) \
>   	{\
>   	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x280, \
> +	.base = _base, .len = _len, \

Please move .len setting to a separate patch, it is not direclty related 
to tear interrupt addition.

>   	.features = _features, \
>   	.type = _type, \
>   	.controller_id = _ctrl_id, \
>   	.prog_fetch_lines_worst_case = _progfetch, \
>   	.intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
>   	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
> +	.intr_tear_rd_ptr = DPU_IRQ_IDX(_tear_reg, _tear_rd_ptr_bit), \

Initially I added separate _reg and _bit settings because reg was common 
to both interrupts. However now as tear interrups use different reg it 
might be better to first move DPU_IRQ_IDX out of this macro () and then 
to add your tear_rd_ptr_intr as a single intr_idx.

>   	}
>   
>   static const struct dpu_intf_cfg msm8998_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x268, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x268, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27, -1, -1),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x268, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29, -1, -1),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x268, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27, -1, -1),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29, -1, -1),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
>   };
>   
>   static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29, MDP_INTF2_TEAR_INTR, 2),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2b8, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF1_TEAR_INTR, 2),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29, MDP_INTF2_TEAR_INTR, 2),
>   	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31, -1, -1),
> +	INTF_BLK("intf_4", INTF_4, 0x6C000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21, -1, -1),
> +	INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23, -1, -1),
>   };
>   
>   static const struct dpu_intf_cfg qcm2290_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0, -1, -1),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27, MDP_INTF2_TEAR_INTR, 2),
>   };
>   
>   /*************************************************************
> @@ -1849,7 +1865,7 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
>   	.vbif = msm8998_vbif,
>   	.reg_dma_count = 0,
>   	.perf = &msm8998_perf_data,
> -	.mdss_irqs = IRQ_SM8250_MASK,
> +	.mdss_irqs = IRQ_MSM8998_MASK,
>   };
>   
>   static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
> @@ -1947,7 +1963,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>   	.reg_dma_count = 1,
>   	.dma_cfg = &sm8150_regdma,
>   	.perf = &sm8150_perf_data,
> -	.mdss_irqs = IRQ_SDM845_MASK,
> +	.mdss_irqs = IRQ_SM8250_MASK,
>   };
>   
>   static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e0e153889ab7..2ea17e4ef3e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -638,8 +638,9 @@ struct dpu_dsc_cfg {
>    * @type:              Interface type(DSI, DP, HDMI)
>    * @controller_id:     Controller Instance ID in case of multiple of intf type
>    * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
> - * @intr_underrun:	index for INTF underrun interrupt
> - * @intr_vsync:	        index for INTF VSYNC interrupt
> + * @intr_underrun:     index for INTF underrun interrupt
> + * @intr_vsync:        index for INTF VSYNC interrupt
> + * @intr_tear_rd_ptr:  index for INTF TEAR_RD_PTR interrupt
>    */
>   struct dpu_intf_cfg  {
>   	DPU_HW_BLK_INFO;
> @@ -648,6 +649,7 @@ struct dpu_intf_cfg  {
>   	u32 prog_fetch_lines_worst_case;
>   	s32 intr_underrun;
>   	s32 intr_vsync;
> +	s32 intr_tear_rd_ptr;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index cf1b6d84c18a..044136a97fac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -24,6 +24,8 @@
>   #define MDP_INTF_3_OFF			0x6B800
>   #define MDP_INTF_4_OFF			0x6C000
>   #define MDP_INTF_5_OFF			0x6C800
> +#define MDP_INTF_1_TEAR_OFF		0x6D800
> +#define MDP_INTF_2_TEAR_OFF		0x6D900
>   #define MDP_AD4_0_OFF			0x7C000
>   #define MDP_AD4_1_OFF			0x7D000
>   #define MDP_AD4_INTR_EN_OFF		0x41c
> @@ -99,6 +101,16 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_5_OFF+INTF_INTR_EN,
>   		MDP_INTF_5_OFF+INTF_INTR_STATUS
>   	},
> +	[MDP_INTF1_TEAR_INTR] = {
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_EN,
> +		MDP_INTF_1_TEAR_OFF+INTF_INTR_TEAR_STATUS
> +	},
> +	[MDP_INTF2_TEAR_INTR] = {
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_CLEAR,
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_EN,
> +		MDP_INTF_2_TEAR_OFF+INTF_INTR_TEAR_STATUS
> +	},
>   	[MDP_AD4_0_INTR] = {
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 46443955443c..b447e4a1d9f4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -23,6 +23,8 @@ enum dpu_hw_intr_reg {
>   	MDP_INTF3_INTR,
>   	MDP_INTF4_INTR,
>   	MDP_INTF5_INTR,
> +	MDP_INTF1_TEAR_INTR,
> +	MDP_INTF2_TEAR_INTR,
>   	MDP_AD4_0_INTR,
>   	MDP_AD4_1_INTR,
>   	MDP_INTF0_7xxx_INTR,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> index c8156ed4b7fb..6bdac515fd54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> @@ -10,6 +10,9 @@
>   /**
>    * MDP TOP block Register and bit fields and defines
>    */
> +#define INTF_INTR_TEAR_EN               0x000
> +#define INTF_INTR_TEAR_STATUS           0x004
> +#define INTF_INTR_TEAR_CLEAR            0x008
>   #define DISP_INTF_SEL                   0x004
>   #define INTR_EN                         0x010
>   #define INTR_STATUS                     0x014

-- 
With best wishes
Dmitry

