Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9DA7573F9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 08:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E650D10E2D1;
	Tue, 18 Jul 2023 06:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E8410E2D1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:20:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98de21518fbso733198366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 23:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689661227; x=1692253227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qE7RBDA3NZlKcVon5Sn7qs3jAcqHXcGJIQX6fRCgOgI=;
 b=gkrb8IIGLOZ1trSAa2rM8I8kNug2D1AVRXcrF7/tzm1zR2Vh5psn+spJ1DDYYX8n/Y
 k5T/lmfLW4EsVuC3yDF29+dwYyDiwsGKjFvRDWz/6U6igBkxL+WbEhBhRV6Oy+omdjMC
 Xzzf7o/xNN/qXVtzN7WTQn0kX2DAX5tPkzWOjTFk4wevOJO3cGVYuq/whAyXQq+Op95L
 XrhCkDkMl6NrBUQA5sO/zBlQh+0J0LcrB7Kr9QYUW3jl4RIsqknD/y4vAjGuB6x8mGR8
 oefz/2PC0x8gdbORo+AIifMgeae0C3+h0yy6bMOHTgwcnmNn5nKIWaPybz09QGcff5ff
 a6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689661227; x=1692253227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qE7RBDA3NZlKcVon5Sn7qs3jAcqHXcGJIQX6fRCgOgI=;
 b=C4H7c+eZXvH5v43JycvOKCW3FsT2wgbzfC8/0ErBAnQGlZtopCxHuOreWrhT1vz4g8
 IH1DWniEmdhBdvDUhLthWbHrpl1VUJp5VuLojSGCiLAi4CEGaVDIPSyPdtEd5tkCdlJX
 RygSWMx6QLCMUw7YuXnXqFe6EqpjuomTiMlWcKs3Sf/+geuYDz4UZrhdGtgiR2NMdE9f
 MqWqQr4Fo7xjEnFPKIlMhkv/Bc32yDWIyJallbRtehqkNFJQmP3C1t4+3HzDHN9TUJCL
 xp0ipKwheFPfAh0/WvGVUcqg3jaCAxQpmpzEJ3QINNpMteItKsa+G16TcoakT60fruQu
 AnbQ==
X-Gm-Message-State: ABy/qLapb7JPYMpBvj2RLjscFUsgu7LlPWYz3ZuX+s0wqewJD/tyLd2v
 gVlELk9PxU5EZlQqjJZKDtJlOg==
X-Google-Smtp-Source: APBJJlGcenjxAZECSDTM/FLaAFXuUpTIeakpBcDdR2YZf3kd0vIS9N3EFca1GYo0tw57yfilQ1aEMg==
X-Received: by 2002:a17:906:924b:b0:965:9602:1f07 with SMTP id
 c11-20020a170906924b00b0096596021f07mr1174056ejx.39.1689661227205; 
 Mon, 17 Jul 2023 23:20:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a1709062b8b00b00991bba473e1sm593563ejg.3.2023.07.17.23.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 23:20:26 -0700 (PDT)
Message-ID: <01f0cf88-4e85-0c92-9723-eb9198782d0d@linaro.org>
Date: Tue, 18 Jul 2023 08:20:23 +0200
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
Cc: matthew.brost@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, robh+dt@kernel.org, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, krzysztof.kozlowski+dt@linaro.org,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2023 16:25, Sarah Walker wrote:
> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
> 

...

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu: gpu@fd00000 {
> +        compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
> +        reg = <0x0fd00000 0x20000>;
> +        power-domains = <&some_pds 187>;
> +        clocks = <&k3_clks 187 0>;
> +        clock-names = "core";
> +        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "gpu";

Why does it differ from your DTS?

Best regards,
Krzysztof

