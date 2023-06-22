Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D373A85B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6014189798;
	Thu, 22 Jun 2023 18:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8131F89226
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 18:37:55 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b4636bb22eso93432851fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687459073; x=1690051073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zzG0tSlyMS8K/jdItFZx7TbNpJmG4rkJCyOPMnx7isY=;
 b=TgCE9NX00+he7J84lVf3ryO+yziXXPFD2lu6icnsb9FN6t9l/KWvEc9q/bp8J5wgg3
 bFa9XvYx53cq6Tduss48e8umwv95cl3BDkELyey6PHbA+Ba478b/EG1hOz+B6AGJfOSk
 minmf6gV0Tess4twbTNTfQWDb4sTMKY8nsv4HzPGXnRMRFf7odQy0b6vFTFTHhs8koO/
 BVWqbbEfqdRlh38Pqc6pWPKnD9lGZt0rvV40fwXBrrtlEDEiYzW7MlWPlIMNibAQ8ww+
 ML24EvUQHi0nGjzJOK9wQAdUZrXhPLUJsHIoBE35yz5ewWSbpcH8zN7nFpPcywK1qQUU
 GuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459073; x=1690051073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zzG0tSlyMS8K/jdItFZx7TbNpJmG4rkJCyOPMnx7isY=;
 b=Onixtko4eKbwlOwOrZd/ps55fBWhZ7NLYS6DncqTgpSCXxLL/l7G5xXVvKtNO5XlYZ
 aikmVThNzXBAJTyVwxwc6T29xfraAuUhUpvYQ3kilAwE8b6MkZjY0LwRylhGh6Dlo/x/
 BXEWp5QQh3Y47e7c0+EVup13bF7UpPP6tS4uUWAgRqHrkBvfs2a7ly7qDig1UKLQFkYv
 vDl9WhL0ukW3+XEhKAKSn4uRkXQ61jKRze4UXSw9+ekvexlyq5EJsLndZrzHeA9jtE2s
 KGYpTAfOANqa0AN37cuNTDEJlEOlZgfU+P31N/kRR7kcV+0wFPZczBxEOfhLEjLQfu1h
 UUWg==
X-Gm-Message-State: AC+VfDwKXYyunF+Dyr/j25BcLyKdwFZXrBLrVs6zMnblpT6UA77ZsMOL
 ufjznwhuyKIu/lLXzNejY438Zg==
X-Google-Smtp-Source: ACHHUZ4nIprKKXRwE+j6F9GvSCFLbOOBMZVjxD93Yhc5YuNKQzARcV07GeW3/1dWJYorso09AReFFQ==
X-Received: by 2002:a2e:b050:0:b0:2b4:734a:35fa with SMTP id
 d16-20020a2eb050000000b002b4734a35famr9582611ljl.42.1687459073220; 
 Thu, 22 Jun 2023 11:37:53 -0700 (PDT)
Received: from [10.2.145.31] ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a2e9dd2000000b002b1edfe817fsm1414109ljj.88.2023.06.22.11.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 11:37:52 -0700 (PDT)
Message-ID: <33390a7a-f6f6-f2c5-1574-970ed1dc3a20@linaro.org>
Date: Thu, 22 Jun 2023 21:37:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/msm/a2xx: Call adreno_gpu_init() earlier
Content-Language: en-GB
To: Fabio Estevam <festevam@gmail.com>, robdclark@gmail.com
References: <20230620232319.991918-1-festevam@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620232319.991918-1-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jonathan@marek.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2023 02:23, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The adreno_is_a20x() and adreno_is_a225() functions rely on the
> GPU revision, but such information is retrieved inside adreno_gpu_init(),
> which is called afterwards.
> 
> Fix this problem by caling adreno_gpu_init() earlier, so that
> the GPU information revision is available when adreno_is_a20x()
> and adreno_is_a225() run.
> 
> Tested on a imx53-qsb board.
> 
> Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Hi,
> 
> This error has been exposed by a recent commit in linux-next:
> 
> cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
> 
> , but the error has been present since the very first a2xx commit.
> 
> Changes since v2:
> - Call adreno_gpu_init() earlier.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)


-- 
With best wishes
Dmitry

