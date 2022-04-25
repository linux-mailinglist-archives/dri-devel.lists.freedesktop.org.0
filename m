Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A550EB6E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 00:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B61F10ED75;
	Mon, 25 Apr 2022 22:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF72F10ED5A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 22:11:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id w1so28695006lfa.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wNSzXqr9gdAV/1UM9LYsZKhA56gdS5t/rHhHRCuCh9o=;
 b=Hiz+GTMfZU/jt91kJKCco1eBpfOqVPKVZMhV/zyHzpUJa9fxMwVoWkXni0uPP2otu0
 jputn5/iM0C+IFHkKBouHDGxaaUSjcGVmVQSzBARnE3ScQV7/lkhQKbygWxZx6iGnJr9
 hu7s2AHKExVON0O6Ah4Eowky6GyYnyEDNiWd3HUwmT5wnID2LVAGVA+HsUmc7os0MBv6
 fZ8VyzyqeFQ2b1gpKs+xwyPyVZWhvPtb45NweWrXltBzpcFoA/xNvCeO2QN8bJLLZHou
 wpb34eHMRCEkIzq5Ib74y5rfhBAWj2t+9hFioOfJR5tltu+0PCFzrNwmG/xiEbl5Usoz
 THDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wNSzXqr9gdAV/1UM9LYsZKhA56gdS5t/rHhHRCuCh9o=;
 b=IViDN8bk3BVxDCefkH+R+3KMje/ojUjmYNSZsYdeQsPa7DKeCaVK+bm+NljlYL/9hM
 HI1oZSopShowOINIyHfaSbZduJyN31qMFomxYsFzq2fH1PA7dRlk9n8BtlciSZZw1brq
 kXLQGxXh40OjxRkI8mB7ykCVzmrUa2tCqMERVGi9vY0UpNoIzITj5eO07xKRqZVAvGIK
 t0qp/fmUjT0FCYeFIDHKq2ZkrLSbMrfFOERF6/mqbFWHtiDTiP4MvoW1fU9NoymZMLtZ
 qE+1x/8GDKtxANmZ+jbz0aS/7qFyhMkLeehTUC72+0T4vY+XnqKQx2KBqQVzgpfU2hh1
 0eYw==
X-Gm-Message-State: AOAM531PupFOBjtYHLmJN4l6Pn0AgyxDZAXGKvlAmvq2oc8fNi65kqO3
 1SCTx70ckGH3qtnGgeft3bthdg==
X-Google-Smtp-Source: ABdhPJygzyWrtK9unqztvwrqXyM2kAZwTWywvbu94iVNo3ZY5VdXZlRg8gXQR4FdAEqJKb2oRknSyQ==
X-Received: by 2002:a19:ac04:0:b0:471:664f:95df with SMTP id
 g4-20020a19ac04000000b00471664f95dfmr14698796lfc.310.1650924675274; 
 Mon, 25 Apr 2022 15:11:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a2e864d000000b0024f1564ea12sm207876ljj.105.2022.04.25.15.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:11:14 -0700 (PDT)
Message-ID: <94435133-b875-3005-ab23-dc4457ec9002@linaro.org>
Date: Tue, 26 Apr 2022 01:11:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/2] drm/msm/dpu: Issue MDSS reset during initialization
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20220421041550.643964-1-bjorn.andersson@linaro.org>
 <20220421041550.643964-2-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220421041550.643964-2-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2022 07:15, Bjorn Andersson wrote:
> It's typical for the bootloader to bring up the display for showing a
> boot splash or efi framebuffer. But in some cases the kernel driver ends
> up only partially configuring (in particular) the DPU, which might
> result in e.g. that two different data paths attempts to push data to
> the interface - with resulting graphical artifacts.
> 
> Naturally the end goal would be to inherit the bootloader's
> configuration and provide the user with a glitch free handover from the
> boot configuration to a running DPU.
> 
> But as implementing seamless transition from the bootloader
> configuration to the running OS will be a considerable effort, start by
> simply resetting the entire MDSS to its power-on state, to avoid the
> partial configuration.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes since v3:
> - Rebased upon the mdss dpu/mdp restructuring (https://patchwork.freedesktop.org/series/98525/)
> 
>   drivers/gpu/drm/msm/msm_mdss.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index f6f0d0fa5ab2..20f154dda9cf 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -4,11 +4,13 @@
>    */
>   
>   #include <linux/clk.h>
> +#include <linux/delay.h>
>   #include <linux/irq.h>
>   #include <linux/irqchip.h>
>   #include <linux/irqdesc.h>
>   #include <linux/irqchip/chained_irq.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
> @@ -193,6 +195,32 @@ static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
>   	irq_set_chained_handler_and_data(irq, NULL, NULL);
>   }
>   
> +static int msm_mdss_reset(struct device *dev)
> +{
> +	struct reset_control *reset;
> +
> +	reset = reset_control_get_optional_exclusive(dev, NULL);
> +	if (!reset) {
> +		/* Optional reset not specified */
> +		return 0;
> +	} else if (IS_ERR(reset)) {
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to acquire mdss reset\n");
> +	}
> +
> +	reset_control_assert(reset);
> +	/*
> +	 * Tests indicate that reset has to be held for some period of time,
> +	 * make it one frame in a typical system
> +	 */
> +	msleep(20);
> +	reset_control_deassert(reset);
> +
> +	reset_control_put(reset);
> +
> +	return 0;
> +}
> +
>   /*
>    * MDP5 MDSS uses at most three specified clocks.
>    */
> @@ -229,6 +257,10 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
>   	int ret;
>   	int irq;
>   
> +	ret = msm_mdss_reset(&pdev->dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	msm_mdss = devm_kzalloc(&pdev->dev, sizeof(*msm_mdss), GFP_KERNEL);
>   	if (!msm_mdss)
>   		return ERR_PTR(-ENOMEM);


-- 
With best wishes
Dmitry
