Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D93622AA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA7E6EBED;
	Fri, 16 Apr 2021 14:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191CF6EBFD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:41:10 +0000 (UTC)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lXPee-00006m-NZ
 for dri-devel@lists.freedesktop.org; Fri, 16 Apr 2021 14:41:08 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 f15-20020a170906738fb029037c94426fffso2095290ejl.22
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b25TSBS6UiWWLc/aOExDgRNzZidx4yrWBstLaTFqS8Y=;
 b=ZmDhkdIJ/O9uClX4jpvywrGgOhM2vENDvNdbxbDIkmvq1DamD9FUGJK0LQTAJ34Rdp
 bQPcRhMcibcjbSWJrDzyd5JhHBiRrMJ+I8paKKacRPH3t5XxlPodUidJ5am/i/Qv21BE
 PjoGBxfFNvn3FosNF0Rjl7k2FcIGpQIzqgAJJGQYnwTRw/RUTjpuqq/JmaMCAvGIBlJQ
 ojpFuvaxig5RgDCAVgn9JczGo72j5wAR8M5JraHqBado3IUUFLximyDbCrQaZExUO4Po
 n0ADQqnvtGWQQCJ5s8X7ogRjtpUE6LoWaQFVK1T8R0ckdpO2C9LgqzGZPkplboThHZji
 S9vg==
X-Gm-Message-State: AOAM531FP7HKOP54yZl9X1zygDWbvnjcc8D2KA1yTlCjorC/z9viAmyD
 ru3IK1Ps7yLe1mpzGpuV1XEamclx4gdjumZ+cieGFvBqFET0WksMWVP19lOI/8le9YS6cJIcu/Q
 2LvuBvwiaGFNsERX1HzYKa1H3nS0D3mXwOCFov/o2urtLUg==
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr10408446edq.219.1618584068507; 
 Fri, 16 Apr 2021 07:41:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlc2f00RlqR/ykNACjQsXBZXVvhiN61LyMrfeRQGlPwDyvhCSQPMZ1jgI6EptuQv5bwl2/qQ==
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr10408420edq.219.1618584068345; 
 Fri, 16 Apr 2021 07:41:08 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id y7sm5629666edq.88.2021.04.16.07.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 07:41:07 -0700 (PDT)
Subject: Re: [PATCH 36/40] drm/exynos/exynos7_drm_decon: Realign function name
 with its header
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-37-lee.jones@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9b6753f4-a448-514d-85b0-2f3ab3049f1c@canonical.com>
Date: Fri, 16 Apr 2021 16:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-37-lee.jones@linaro.org>
Content-Language: en-US
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Akshu Agarwal <akshua@gmail.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2021 16:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c:355: warning: expecting prototype for shadow_protect_win(). Prototype was for decon_shadow_protect_win() instead
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Akshu Agarwal <akshua@gmail.com>
> Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
