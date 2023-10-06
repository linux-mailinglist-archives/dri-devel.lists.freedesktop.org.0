Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5137BB673
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 13:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11EB10E1E1;
	Fri,  6 Oct 2023 11:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE6E10E1F0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 11:31:32 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c135cf2459so23792971fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696591890; x=1697196690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5KXF1BPtCc4Qnp06IeKWmuYEI/cvy2qSDqKPkYcCjtk=;
 b=jjdAgI/n0v1c6lUmxLp5H2USIFlxEgYHqBHgjxIzO4kyRJbYVH+xSSu9FP20pDDdST
 9/0XSiRLKt5vzwOF+ypj30B5aOIys2ksjfe2lEDHO9qgxNApBtE1HFPJLD4S/ZzzfgYp
 gUtCGlaobQcnzhMWIbjmXvmTelphB6+W4A63opNHOPvw+iJMVpzb+eu0Ju6WjvIEf+Pm
 pVclJ8I1kmlK8TGEWZENooS0dSte/KXvr7bDRwvVW55mgvKz7xssCOgvuC5COgGDFP68
 AIT6i96DYkWanjQ98ipxWEi7H+E3cm/WQzOSWbE3+LYCs8vig1IwwQGCk/UsfxA+llHc
 uwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696591890; x=1697196690;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5KXF1BPtCc4Qnp06IeKWmuYEI/cvy2qSDqKPkYcCjtk=;
 b=t/P3HRWwPOkKtcSN1xX7JashTRCegiqRQN4HLh0EYBptKVqbI5Gg8TQaWltWZiMqla
 8qk45t3R9aCHVaGuRqp3pcudyAjMdDs4JNlK/lcihIjoNc3aoRyJkmE0l83q5l/huHfI
 2UHlnV+Tnqf9tSObc+aM8+heo+GUtjGcazAoCRq5Lu689HPCos25hdYP0SIJNNJKIEeS
 rMAlvffP9DvtsPRxI2UZiUDgrVzWv9I5mOtoVtcKf8P6PyI4XILS9aWl6f36cTsHm0j4
 mzU8+hV0X8H69aUeokrinKV+g35akceddiCqFrJfzyabiNZEeRUmau1GAdLB+/oN3FB7
 BrWg==
X-Gm-Message-State: AOJu0Yxw0sDHql/HLOo4Rpa4mhbdyvtyIertIftFZ7+BX/8IFkZoSnJg
 vwTcW/Uj7KDfaAjMmydcztQ9DOtmUErTCygn0Ks=
X-Google-Smtp-Source: AGHT+IFnb4SzgNnqN1744K1drSFI1lxMxH0rmjdh00B4/aRtrjljwPbT5PoXIyoAxOYKsWxiAGDzgA==
X-Received: by 2002:a2e:96c6:0:b0:2bc:ce85:2de2 with SMTP id
 d6-20020a2e96c6000000b002bcce852de2mr7283181ljj.37.1696591889169; 
 Fri, 06 Oct 2023 04:31:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a2e9946000000b002bce3123639sm743777ljj.98.2023.10.06.04.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 04:31:28 -0700 (PDT)
Message-ID: <f9a97fe6-89d1-40d7-8e13-c756f341bf39@linaro.org>
Date: Fri, 6 Oct 2023 14:31:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] drm/msm/dp: tie dp_display_irq_handler() with dp
 driver
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1696436821-14261-1-git-send-email-quic_khsieh@quicinc.com>
 <1696436821-14261-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696436821-14261-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/10/2023 19:26, Kuogee Hsieh wrote:
> Currently the dp_display_request_irq() is executed at msm_dp_modeset_init()
> which ties irq registering to the DPU device's life cycle, while depending on
> resources that are released as the DP device is torn down. Move register DP
> driver irq handler to dp_display_probe() to have dp_display_irq_handler()
> IRQ tied with DP device. In addition, use platform_get_irq() to retrieve irq
> number from platform device directly.
> 
> Changes in v5:
> -- reworded commit text as review comments at change #4
> -- tear down component if failed at dp_display_request_irq()
> 
> Changes in v4:
> -- delete dp->irq check at dp_display_request_irq()
> 
> Changes in v3:
> -- move calling dp_display_irq_handler() to probe
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 32 +++++++++++++-------------------
>   drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>   2 files changed, 13 insertions(+), 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

