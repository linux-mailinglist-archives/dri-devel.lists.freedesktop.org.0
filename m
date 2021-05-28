Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC8A394141
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D096E3C4;
	Fri, 28 May 2021 10:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17DF6E069
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 10:39:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b12so4669691ljp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=umCDCObrNo1F/car/LRG+W5Mp6aBUz9SOihca14kINU=;
 b=t+lLmqG6vhSL5GOTsD3igXoE9y+U3voqARx5bNC/6yF5ZmO5i7rp29h1AzqqwIPRar
 SJpmSwu7mC8ELldZnVaMgd3M5gJL4ol1TvsbelBxIZiboxUS73LMGHNqRz3/W0I00Y3e
 vbJn/B4JPV8Zplh0wa+Yzbe5yrz0A+4T1kkOpoYFM4FT7eB9QkF0cTHgGRQQcmRQlMLo
 +gx1sdra00IG3CQ+tH6ZPqqEX3TcN3ia/aBYazKqCB8kgasWm6KaIBRZw9ZaOYV8K3QH
 QRm7d+knoS+RrVD0VaAqZQHXiuvdjlVRUjQXlPPQ3XiMtpziwjZ+Glrc+wPmQYnqm8Tl
 iD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=umCDCObrNo1F/car/LRG+W5Mp6aBUz9SOihca14kINU=;
 b=T1WABnZDARGztlAY+5/nCOGaezfFvDNzTbyAf4wwUP5L+OL3OOcqlTs29e8CjyDQMB
 zDqzi4TEWrdFc7qaDf8M4nwMoldCYHE8XcS7I4D1yshEvziH6xbxS26RN5c4mndc61J0
 vf+vD4YS+xHS0gFwrkQAP0uIHEmemSGpTNieWN0G8lYsWtfSzphovDBmZxjAomTqIdN7
 2Cd1BUVvDLk7ksi5zfNnI5Q4U/1Lu229fyOiBtzcydumXWyxVCEHHZN7+u7YHTD9HO5X
 awvtcQ/nMZ+ObfBmMM69QsWhmbxZPCURuqyAAyiHGsgdAIs8TG96uJHvpxRLKHpr618D
 3/Bg==
X-Gm-Message-State: AOAM532Ry00H5HH+P7k4OchBL1Bbynd1Atjcz2UJ/S9KYS5hLYwc5zWA
 61QbTnBKcsNuUFXpOj99TQEv8LT0BoN1NQ==
X-Google-Smtp-Source: ABdhPJwCbJydztxsaJRWMPiKOT4hMuN+hHwbIbtvAvgLZGDGbJ/JN0fwZr30y0hbtQZXIDGZHjnPHA==
X-Received: by 2002:a05:651c:54a:: with SMTP id
 q10mr5930164ljp.420.1622198370217; 
 Fri, 28 May 2021 03:39:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c4sm438895lfc.258.2021.05.28.03.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 03:39:29 -0700 (PDT)
Subject: Re: [RFC PATCH 11/13] drm/msm/disp/dpu1: Add support for DSC in
 topology
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-16-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <06ffdec5-8b12-c077-0c51-6ea9100b96a4@linaro.org>
Date: Fri, 28 May 2021 13:39:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-16-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2021 15:49, Vinod Koul wrote:
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions upto 4k. For more resolutions like 8k this won't
> work.
> 
> Furthermore, we can use 1 DSC encoder in lesser resulutions, but that is
> not power efficient according to Abhinav, so it is recommended to always
> use 2 encoders.

Not power efficient because the second DSC would also be powered on or 
because single DSC enc would consume more power than two DSCs?

> 
> So for now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 18cb1274a8bb..bffb40085c67 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -609,8 +609,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
> +	if (priv && priv->dsc) {
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface
> +		 * this is power optimal and can drive upto (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;
> +	}
> +
>   	return topology;
>   }
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> 


-- 
With best wishes
Dmitry
