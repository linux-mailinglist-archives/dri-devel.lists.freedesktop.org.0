Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5480547002
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 01:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6423410EFE1;
	Fri, 10 Jun 2022 23:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9571110E43E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 23:30:43 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id y29so650682ljd.7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sv8K11oZ7Lv4AmiRrISFf7n2mB2iCSpIfL4GspaERss=;
 b=eCYr1lrWDY+g9PwdpzhAXIvVxv5ugWFG3MIQ6r/G3RgHmdBMDW3KVqfsjE3DDe/PqK
 X4XHTXmaztJIMHFgq3lq0rMIHkmLTRNbvrTrCrznepvxo6pIlRBJgwfTmcFexLMcUlhY
 M/0YsMbWPaQ6fOeI5YsWEKqC/Ov831IT/gWDSL0mbN+DIeKW6WfZuzM6s0BVrJGVsf1E
 3dKv9ThqZ3QeZQWEUY77vb6R/e3iapUATovF/px7SmivgLoznSYJiU109MJ+G0QYSmcC
 PtxU+H0QWGlDFibQOgP/npf810d2+kCJdU6ztAeRvPM/gTf67JOUDtX1k3RmA0lElGsH
 SyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sv8K11oZ7Lv4AmiRrISFf7n2mB2iCSpIfL4GspaERss=;
 b=U7yyuRDBWeYE0IkPmHhcVg4aBi6x+jRlWBh0iBotPWEugtBuCwMhZlSr79o+RgxLp7
 zb+4M7wbXKGljzV8CRbnBlezdob3K2ZsHNo1jgZUEgyr4NteTltwX1YoLT7xzyBoYOyQ
 lme53ufeMyTb3hk92DLFBuroH4R+CcvvYCiK29EVBM/G7b1bixe77/crn+cgWkn2AEk8
 hvFtCKewFqIOwUn6yvDIT88ucrInbYhdBVgzTNaKebDwrc9ipY3BULjGI7xio4r3FBbq
 IDXzzwI5+Dg2VOmDR9yxHqJpKCS+/IZHOqmiwnLpwQRIRzglAkqptyDfoFfVLoLJipli
 QG0g==
X-Gm-Message-State: AOAM532XD/rQ9cTlf8wgJF7JEYVQBxGTf4BZWcszkaDC51YMV/zD6iOm
 GR9sI0JPP/NzIYmsHLaW3US1vg==
X-Google-Smtp-Source: ABdhPJyQWfgzv3lGQjgGqamMRcSrJ3LohMrscyux/fTbfyQePC67i0s9ib/Pgwby9VZ76BA7VJ7wgg==
X-Received: by 2002:a05:651c:1581:b0:255:48d1:fdae with SMTP id
 h1-20020a05651c158100b0025548d1fdaemr36354825ljq.286.1654903841934; 
 Fri, 10 Jun 2022 16:30:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c28-20020ac2531c000000b0047889d37464sm35918lfh.196.2022.06.10.16.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 16:30:40 -0700 (PDT)
Message-ID: <68399bf2-4cb7-69e4-0923-6ca8db386de6@linaro.org>
Date: Sat, 11 Jun 2022 02:30:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] drm/msm/mdp5: Add perf data for MDP v1.16
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
References: <20220610225304.267508-1-luca@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220610225304.267508-1-luca@z3ntu.xyz>
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
Cc: James Willcox <jwillcox@squareup.com>,
 Sireesh Kodali <sireeshkodali1@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06/2022 01:53, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the perf data for the mdp found in msm8953.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1bf9ff5dbabc..b17f868ffca8 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -837,6 +837,11 @@ static const struct mdp5_cfg_hw msm8x53_config = {
>   			[2] = INTF_DSI,
>   		},
>   	},
> +	.perf = {
> +		.ab_inefficiency = 100,
> +		.ib_inefficiency = 200,
> +		.clk_inefficiency = 105
> +	},
>   	.max_clk = 400000000,
>   };
>   


-- 
With best wishes
Dmitry
