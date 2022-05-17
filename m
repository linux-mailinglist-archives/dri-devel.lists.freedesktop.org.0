Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A652A11B
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 14:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742CB10E0AE;
	Tue, 17 May 2022 12:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B6E10E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 12:03:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s3so6926099edr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yZJ549tkUDyfMnj4pDgFXOPxERt74iwRgdcSUgywI0w=;
 b=SLdIpuHsPZOQVlDGwOot7xRTXin9VuhUJWDszbnsNjoGeWE8iBiJ3ukO3F3Z5GZteq
 1cp1K5zu4cgXjLKSEfKvXBjOHbGusbTRY3yPCiSX6aYgQntnubVrjqXBIOjABmNpiKXA
 cP6tVRvsLW4So4q8qv2MUGoSR4JBKO+99YHGO8c58Mccs75L0RDc4CaWqBjoA3fJGxID
 Jo3c20vSluxtLkg3zJt1FPzOAIVrGXZnS32smWQehkwlE3LH5AKrwKGAmwlyCUzgjWmg
 aztEWXc+ige5+ey6GRtLavKzVNZUV74JmNGmBsJI2Mje1F8DfO5sQtnMpAWUMWuUEcYK
 q/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZJ549tkUDyfMnj4pDgFXOPxERt74iwRgdcSUgywI0w=;
 b=hnSUnx6Wx+QeltePWqKkNnnQRq6uuOUgLA5CjyCNFdIYHnkEWIbtFqPWDZAa70Yi1m
 ysw+hjoYWXOH70y7POn6INfyHSEoDRlF1yK8tM1Ir2gUYnNA6LUWOF72IyIbAMWZBIgB
 LL/oRpUJbA6DwszVYIzNoObH9cbG/NbphlPMHm22N33wEbSM7pr3I0Ca0Wq8uP2zsHB3
 WP1Wo/YvgfMrxqPxU3klp0LlJc1N2tDH9T3GnR25bgemEVBRjzvvHbCzdbSGLsaw0lBA
 SjBszTL2yCTYtSTKkg7sDBtEv+c8zbd5IBsI1OZRLAey+66SeLt4rskU+zffK6hkm15i
 8bqw==
X-Gm-Message-State: AOAM530o9m1yyg53/olzU/G6aVwVfecz/roneGE15vtQWeneVRBdatDR
 35lGCp23yqfMPYzjjQzuM7Vagw==
X-Google-Smtp-Source: ABdhPJzS034eaTCysoZRyeY2Rmi287sAazLAVLGC7BRgRqcCeUbhtN10ECZckeoh/xWSE6rloRIXtw==
X-Received: by 2002:a05:6402:2815:b0:420:c32e:ebe2 with SMTP id
 h21-20020a056402281500b00420c32eebe2mr18820072ede.1.1652789020781; 
 Tue, 17 May 2022 05:03:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u12-20020aa7d88c000000b0042ac13e232csm1645442edq.39.2022.05.17.05.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 05:03:40 -0700 (PDT)
Message-ID: <414d09f8-328a-4bf4-c20e-f8ce4a6ddfc7@linaro.org>
Date: Tue, 17 May 2022 14:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-4-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517082558.3534161-4-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 10:25, Neal Liu wrote:
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    usb: usb@1e6a2000 {
> +            compatible = "aspeed,ast2600-udc";

Sorry for not noticing it earlier - slipped through the cracks. You use
here unusual indentation (not matching the rest of the example - above
is 4 spaces, here is 7 or 8).

Just keep 4 spaces for DTS example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
