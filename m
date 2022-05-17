Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01552A0E8
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 13:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A470910E37A;
	Tue, 17 May 2022 11:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ED610E37A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 11:59:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id n10so34233470ejk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=We6UnTkt5DfPq+wuwoB7alfZF2Hv9K3HgKR2Inooa2M=;
 b=mJUxow8TJYLd1QWdt4w54y14ncU32yxMoU6rAuy9WcO3jRkd7oe7jKuPrsY2rNm5sv
 1BKYohHd6rUaSdXm5PduVz5YYYj/WNzO1gyqgmznJEr4jwUuuz3xIIfspVy5iZUe5YhQ
 q1l32lRbVlLMCItWsIhV1mU6rnPvfK9fwRKkgflcgf0VpqLAtfHpwQNu1WE3VVurFdsA
 iBr7rfZ/WlcszsTo/UvoSvzdkTYmse0qFb60Qb/YjL/eEzexO99zZrjtWGhYLDrKF3fj
 La5T7bT9WybG4SiMlalfi1G9RI7UsOsibH+sFHt0JGH6m7rWrDkSKzp3bJrnWouYmXzX
 QPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=We6UnTkt5DfPq+wuwoB7alfZF2Hv9K3HgKR2Inooa2M=;
 b=gj7DxwlQj3106cBCp+fUZXiUa00S34pdIM2CrODFDs2WhtEQpBKZz7enHc0QcQOMv2
 a+ZdIG2yBnzrRRIEk4icqR4qnk35lYMYpWxceoKfqySsutyerZXmnSIaZPVd42eEGDwL
 OGh75MwHdr3t6Rj7sQgO3po0MbM00SnBrlwMulpD2TsBSEvwXdqRYnl5W9px+1o5JG6x
 966qqKPuJidvc3FYDJtKK7JBrBrINPdFWDSSGpl7QmA4TC0c1XlzqQ+vcWMe+mO1MzVe
 7sY8am1AtSSBz8JBkOCGJvqGzilB71XITm7C24BjMMGYS6kH7vpvOI9Ic3d2ZlhymISP
 OD7Q==
X-Gm-Message-State: AOAM533Gh61BpI0Qhj//WHp8ZbIn5MRNvZjRoSgT0OJxyPSu5fX/j2nM
 TMgC4fAHXi/eEpdkv/eKdODxSA==
X-Google-Smtp-Source: ABdhPJyvwVUAbJ0QXLt9/CxdM+HPOyaIV1T5I4ZB9Qx0sEtfYLUok+mJqrxKP1RTakPh02MMo1ynRQ==
X-Received: by 2002:a17:907:1c9c:b0:6f4:2918:5672 with SMTP id
 nb28-20020a1709071c9c00b006f429185672mr19312685ejc.439.1652788777021; 
 Tue, 17 May 2022 04:59:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 eg16-20020a056402289000b0042abb914d6asm2074448edb.69.2022.05.17.04.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 04:59:36 -0700 (PDT)
Message-ID: <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
Date: Tue, 17 May 2022 13:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
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
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517082558.3534161-3-neal_liu@aspeedtech.com>
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
> Add USB2.0 device controller(udc) node to device tree
> for AST2600.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 3d5ce9da42c3..5517313eb2b5 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -298,6 +298,16 @@ vhub: usb-vhub@1e6a0000 {
>  			status = "disabled";
>  		};
>  
> +		udc: udc@1e6a2000 {

The same as DTS in bindings - generic node name, please.


Best regards,
Krzysztof
