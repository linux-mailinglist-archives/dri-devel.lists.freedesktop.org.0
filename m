Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C0755CE3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EB410E1E0;
	Mon, 17 Jul 2023 07:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78D110E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 07:29:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9928abc11deso595757166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689578991; x=1692170991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rReCVFYee/yGUM7XZ3iRLWyfw7FhCzkdqRLH9Zjfw6U=;
 b=PeDIBzoG3C5s0UUNsV9m0040W7pLbmCU1FqLL2czoylDiej5CQypZ+liZSFcaPKm/o
 2HlsEO+8XBGpAW9vNlAgHhi/NdD+IUqlb5vpON7eifVnAwMBxInWvQPingBGEnyBC3yK
 QdGbWAFlduX+nUsazjCZ41pJfOKq4oTSbwtBHMQK4Roryv1uxOGDdJ+iW3lPUrzDCXRG
 sBK/Ylcnpt32q12NdFhD8ptDlDS6I7hji+9yhkMWTukCk88sn1ApkccD7tQFjQ87UeOg
 cgbZLmm2i4rGJ8vtrZArkAYQoWYWvGsDABPBBjmUjR1QCZec43TY2Jh8/NpiGy2jSPI3
 uKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689578991; x=1692170991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rReCVFYee/yGUM7XZ3iRLWyfw7FhCzkdqRLH9Zjfw6U=;
 b=EPFD8fe5AGxuSjhL04Ec8UWGGfBASUs0f1EoItIYtFBxQ26Wq8oVQotxgmJEiqHVo3
 XWqk3oNLrZGxyevV8yK7D9RYFC4JlmhNZ/O8fTIL14R5OeKBur+eXLXEzSXdjgLIXd5O
 a1GqoqExrPGVnDxED0k5zwMalUnbU/5Vuc0SwFvHSr9qIyEZxdwSiOmmVnuxAcXD/b3q
 bS2iu72XmMTFSMMJBUzhHooIKF1HvjBofy90Cp39J6kjd4uY/S0Vt8/F6iL+UutHhr1h
 guFJhcCEEPv6JYnL6gw2XdxcC9vjKfZyOTmGYo3q89CITfXUdxCarELNE9XnUMEK3Rsx
 wEBw==
X-Gm-Message-State: ABy/qLbqS8gJ0ycvQ+vhR747Lv9J2W+XfEbdC12HMw8PiWVaP0o29YxX
 FrycZjMxD2pgQoRhLeGwdQXoxdBmI0aYRHi0MTRbQw==
X-Google-Smtp-Source: APBJJlGqpg7l7AYEFoORxE7kx/O7QvzrLx1fhEfmx+uK+tDkEMYYRhUr4kegL7+LH4+QJ58h1Zwd+A==
X-Received: by 2002:a17:906:b04:b0:992:d013:1135 with SMTP id
 u4-20020a1709060b0400b00992d0131135mr10072944ejg.63.1689578991547; 
 Mon, 17 Jul 2023 00:29:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a1709064e5200b009930042510csm8830347ejw.222.2023.07.17.00.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 00:29:51 -0700 (PDT)
Message-ID: <19a7dae4-a9bd-187f-49f8-fe9c47f44eff@linaro.org>
Date: Mon, 17 Jul 2023 09:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714142526.111569-1-sarah.walker@imgtec.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, conor+dt@kernel.org,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 afd@ti.com, robh+dt@kernel.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, hns@goldelico.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2023 16:25, Sarah Walker wrote:
> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
> 

...

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: mem
> +      - const: sys
> +    minItems: 1

Why clocks for this device vary? That's really unusual to have a SoC IP
block which can have a clock physically disconnected, depending on the
board (not SoC!).


Best regards,
Krzysztof

