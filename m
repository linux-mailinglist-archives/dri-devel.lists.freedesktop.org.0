Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7381E537465
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A853B10EE6B;
	Mon, 30 May 2022 06:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2EA10EE6B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 06:34:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id y13so18889170eje.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6JI8S2sEVNpLFXVCCEM7RQxXwQYpgOWv8/i6hytBxdw=;
 b=zI0PXh8CUyED8Aak6eOmi1pxsLjx5iKfEyhp11LMUldq9XFq2NWH8BDXYIBnH+GXzu
 AJhdwBrl/HQ7z2DFlsk5iIZ9GGMKbdvq7WFOv8XsL3ni9sP5RAMDaUw7GZReXuyf/unq
 t6JshwYWAFLqRkE7demdu8wDwWO13TszkVQyVTORH+qUU6WdRhjCCtgQBd7q2WvLW3Bf
 5kULMLzBV6kXyaXywJzA3k62rdn+HVZoZgW3TUU4k3yYrSThwo38Q5WhoPEG6qIj+Dwx
 mTUc84qbWdXLO50Z4mzpvy2NVjZYNZ1PvNKr1UUdYznfM+cmo2cro+UzgFQ6cJP0rCEa
 mtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6JI8S2sEVNpLFXVCCEM7RQxXwQYpgOWv8/i6hytBxdw=;
 b=Kdx9I1XK6P4gy+6gUqAX/X9k+uPAq2kIGglCRj2dinbGvRgR2K0VToFLF2out12kNE
 EdX4aDDWHfWNZYbDJccy4ZvGvFXnjl6evaP3cRz1KV07k9KaFnZRTW20KrwBqwAwSxrr
 rOu20JIRZ4U6amqQwiJgXBAO7eZZ2elO2C3rv4GyB5yqJ7LrQRplXO5NSUInGPrJRysu
 g3CumEAWz5UJThhs0fueSPa4hultEBi2cs3jQ0SJj/Djm8rZbzoLkb4oBPzuk+6aa5zj
 Ygwclktny/38aggWDdhVXRNXaJPU7yc2g6xq/H5MhuKm5HE/2Vd12st8+cUcgNDg9mRF
 l3qw==
X-Gm-Message-State: AOAM5306gt7qkeC5DIlOGncpqNNfYJKRDzhdpcsWlUvRzYokBaXGGFvv
 ZhDkQHQEBv3QV4ntpOiKmlk2mg==
X-Google-Smtp-Source: ABdhPJzPKJqFPcOz5A+5ihWfyOrl8uqS8EvJFQzv0kmgEA19KzEXCpq17Xg4yZLMD6GQ3DGaOgt0zA==
X-Received: by 2002:a17:906:3a92:b0:6fe:9029:b62c with SMTP id
 y18-20020a1709063a9200b006fe9029b62cmr47653469ejd.569.1653892439407; 
 Sun, 29 May 2022 23:33:59 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w7-20020a170906130700b006f3ef214dfesm3680224ejb.100.2022.05.29.23.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 23:33:58 -0700 (PDT)
Message-ID: <0c08eb44-285d-975d-ac6a-f55ccfb34420@linaro.org>
Date: Mon, 30 May 2022 08:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220523030134.2977116-1-neal_liu@aspeedtech.com>
 <20220523030134.2977116-3-neal_liu@aspeedtech.com>
 <TY2PR06MB32135A0DAA9F152E2498CD1C80DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TY2PR06MB32135A0DAA9F152E2498CD1C80DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2022 03:27, Neal Liu wrote:
> Gentle ping on this path, thanks.

It's a merge window, so now not much might happen. Please resend in a week.

> 
>> -----Original Message-----
>> From: Neal Liu <neal_liu@aspeedtech.com>
>> Sent: Monday, May 23, 2022 11:02 AM
>> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring

(...)

>>
>> Add USB2.0 device controller(udc) node to device tree for AST2600.
>>
>> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>

You don't need my ack here, but anyway FWIW:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
