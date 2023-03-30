Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF26D04B3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C463A10EDFD;
	Thu, 30 Mar 2023 12:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A39C10EDFD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:29:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id br6so24251254lfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sH+/15LsbOgawXELBUf5vQdjqObcddF1Ko7jUuzxZvc=;
 b=phOj9XOYcMB4LaY4xiDu4qfIm6NODIYYs9FlR0lSlK3zQNPbFzyl9ntWCj4ra40QzE
 aUvcMKu86OwqLEtQYfLK2Hdd6FxObXrQtgnGYyRgHls7K4RDFZiK5L5SawN0+sRQ3EE+
 bw38LMFzdZvL0JM1gtp+rWYzrjV6NqnjGRmnO7zwNSkGxF20NbglN0BavBttuX0rf+Zi
 2Tq+f/93txuxqPKVMYPhvnTeWM02nDZcs/elwc5ABCVIbHwRmX8PbHLI1Stg72SOyWlh
 rlE6t6Udm5MaXvQxGJ2Fl48uqpXiiAzpaer6cxdGdQpHmYm4snKjUwVqLx/tzai9hDag
 vikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sH+/15LsbOgawXELBUf5vQdjqObcddF1Ko7jUuzxZvc=;
 b=DPpGv3MRavyDK5xfOqJsrbCrL4EUKEHMbKTG96nx2mdI1uoz8Xo8kBbFgWRDxdQJAv
 OfVZKMZxFru+9vkS/0Lw8XqTqq++dkLcj9SQQ+8JZKIdDRyf8Qlt2eRZpKzQN0QbKvnj
 djRbDbhlNXU63mtEugnA3dAvfLr6TLBgTPFqjR/MIsT8UAknsRbbtISKlD9GuJCBw1by
 3ruyWFvN0gilNB+lffQOab6Rj5ym22HbKoxkYZqt+2oAR7jev+GT/YkT81UjR4jzLLRS
 Dtlz/RQoJPyNyQF1AsNocA5PVxYZb2daWQIXwN/xhxjvndeSMRkysMyJCnP0AJZACHOa
 KNFg==
X-Gm-Message-State: AAQBX9ehCkXTVfSVyw3zBhIgQ9gu3LQHf5XcmEToVgSxnl1DADXkpcoc
 eAmdevN++J85jb1/FWXzv5tBww==
X-Google-Smtp-Source: AKy350a+by+b1eUxNDL9AVM2SvfTpys/gok8XCOaNuVpBLC5raT5r4Ig7ANjaoVrdGhy+Oh/syE/lg==
X-Received: by 2002:ac2:530d:0:b0:4de:8588:b57c with SMTP id
 c13-20020ac2530d000000b004de8588b57cmr6891896lfh.28.1680179386152; 
 Thu, 30 Mar 2023 05:29:46 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 e4-20020ac25464000000b004d58e782886sm5850384lfn.303.2023.03.30.05.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:29:45 -0700 (PDT)
Message-ID: <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
Date: Thu, 30 Mar 2023 14:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2, 37/50] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Theoretically since sm8150 we should be using a single CTL for the
> source split case, but since we do not support it for now, fallback to
> DPU_CTL_SPLIT_DISPLAY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Hmm.. so is it a software construct? E.g. "pass half of the data to
each of the INTFs and tell them to cooperate"?

Apart from that, since it's temporary, I think it deserves a comment
reminding us to fix it eventually™

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index a3a79d908451..094876b1019b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
