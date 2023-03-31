Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF86D1A9C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28D010F125;
	Fri, 31 Mar 2023 08:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAFE10F125
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:42:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y20so27984754lfj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680252162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IevZS0joNS82IencNXfsPkazLIzoG9/Vmz0nPvH8I7o=;
 b=Xo+gy/WFFx+pso6hhAElvme+rTjYErlFrqUfcvfcHEGUbdxYDrCWKZLg2zFcvofh0w
 9fB+/LSYS+ZACFMc7N/hvE2/fk3+Kc5SC5StkOBuZq3Mib2fGyxN4WbF4mgYwydTkMPt
 pe9YGt0e5+r1L9sHyvS8S27nRgowintaETXkWsaE6rP032hN2XqeP8zA2eCVEutjrOaH
 85JJ5ZO2pYxreEaW2oCas/8BvQE5JZv7AT0e7ch1nFEOSfP/6Q2khH9JW86uypMdj1wh
 LyHBblU0wnWzkDdgujKgT9J/MVvoBzTlUrVdxKP40aCZWSCdXQuP0meRvvDccOZpSLGI
 Y7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IevZS0joNS82IencNXfsPkazLIzoG9/Vmz0nPvH8I7o=;
 b=ak7Fe3gkji4DyGMNKB0YHT/SX7A1OpQDTzgt9rdh/p6jiKg65R7Dij2gmRdylqhiTo
 ES13rqdm4GWtVVca6ykLBRk6pfAIJw0tqYzm3TCU/40eloBFLIxZSI8eGfR/gsP73PmC
 jxOjJHcnc3eLgD1/wIP8WYfL3Xp6LgStnYCzR6wNi598gcrjOpLh6bLjEEVz0K9q41my
 PcZ1kOj133UQIbXl0xJO03Q2eM/SrMU4LnufiMamnrjPbkaAwVtJr7q/dhERrfKSF/sJ
 oUKhpYkYaaIrjXGiR0yAn2ffatrH8J7xJWjQeVUQ6rDc9boDtuXFZGKXKGwPcuEAmAhr
 gRJg==
X-Gm-Message-State: AAQBX9ct3mOHNCI899L/P1HlCWSFFO55QafY6xpvKWNZltz8KffWmrKU
 pEA+rRGeihmooRVUDbWoeo6kvcmwJ7VlZPRMpYI=
X-Google-Smtp-Source: AKy350ZG/K6wcHdsuRA1BnkFGsAXfMWNfwKAVZ6IoMpIC2JXLzIFxyS/w3Hpu85ByVgXWbR3W3P0Yw==
X-Received: by 2002:ac2:5287:0:b0:4cc:a107:82f4 with SMTP id
 q7-20020ac25287000000b004cca10782f4mr7866348lfm.64.1680252162059; 
 Fri, 31 Mar 2023 01:42:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s10-20020a19ad4a000000b004eb15952669sm289570lfd.141.2023.03.31.01.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:42:41 -0700 (PDT)
Message-ID: <ff88e5d3-4c31-7698-b8d1-8a03b9fea643@linaro.org>
Date: Fri, 31 Mar 2023 10:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 2/6] dt-bindings: display: bridge: toshiba,tc358768:
 Add TC9594
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-3-francesco@dolcini.it>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330095941.428122-3-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 11:59, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add TC9594, from the software point of view this is identical to
> TC358768 with the main difference being automotive qualified.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> index d6dac186ac59..8f22093b61ae 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -4,19 +4,20 @@
>  $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Toshiba TC358768/TC358778 Parallel RGB to MIPI DSI bridge
> +title: Toshiba TC358768/TC358778/TC9594 Parallel RGB to MIPI DSI bridge
>  
>  maintainers:
>    - Peter Ujfalusi <peter.ujfalusi@ti.com>
>  
>  description: |
> -  The TC358768/TC358778 is bridge device which converts RGB to DSI.
> +  The TC358768/TC358778/TC9594 is bridge device which converts RGB to DSI.
>  
>  properties:
>    compatible:
>      enum:
>        - toshiba,tc358768
>        - toshiba,tc358778
> +      - toshiba,tc9594

If it is the same, why they are not compatible? I got only three patches
out of six, thus I cannot check by myself. Please explain.

Best regards,
Krzysztof

