Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF785F43F0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 15:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D1010E299;
	Tue,  4 Oct 2022 13:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA8310E299
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 13:10:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o7so13786325lfk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1Zs5AYtIbgN30Vpk1RFYyv899QtIhQ6er/wUtO6Qq6E=;
 b=BecqeHF+CHlOOFHthq4vfzkmI7poaVVdECpaRivrcOemqlWxzb24h+kIOJX2iOX0Hp
 WW4+ssamQk98jtcWnNmizmosI12yw1xQE5HvLbXpnZa74zZRkf6adOfRaVCnrv1hWL3d
 AEfQPwN67DM7h1yQVICeLRdYb17MaQcqlzEwmEZ6s2FRhrh+VQtvL9XL2UDxIC+mF5di
 etCZsBWCgV90NT980vVfEvHXI923IPqffBfXq8QYED0B+ABU12EsbNno+r/eYDbskRP5
 8GxTcRh+r6BMcClCDB6CUG12ZtTsjL/JpXfVKwdRASM19NHJCgpZcnZnqGucQ3TcMcnO
 dhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1Zs5AYtIbgN30Vpk1RFYyv899QtIhQ6er/wUtO6Qq6E=;
 b=ag0N9gDZeXNrtp5Zw6GLsd0+OaKHQnyPBVyzTkKdzjB5LDMKwwVLyHAAkmatPmnYtX
 sZ6ocXmIWA5pPnICNaqNAhpc7R4a9JgfLuQl2x6wqb3ReZ8z8xBXMZf5I22SOjjUIUDG
 mU+6qS5ZLyZ1dODVqNfKJGUSo/GJymUMg5mbGg9FbbPFefYZBs9GoKO9OrnmhplAJpT7
 4xy7oemgnnXUNQbuBTJmVtpeGIdgAQ95yxcthMxtxRjsD9NadwnltR9YmKKBsLFg4wIP
 fPMz1VtysHcvpmJyt4swHjCQNo5O93MlUZYrJMXhrJ18dsZcR97wFGFEBjmmm4wRRftD
 v2cA==
X-Gm-Message-State: ACrzQf0HyRzJNylwscjrTOddZfmqeB54N7fz7yHwXo27xg3iPerAQcJc
 Vfln4WIvBuIJMj4+Pb35Ig45GQ==
X-Google-Smtp-Source: AMsMyM4g1VTiHI/xh6oQYaaI0i8Df44upYXlbUFk6fAawopFjhjHB4pKoEXsPqf2xp+ZlX8j7NPn/Q==
X-Received: by 2002:ac2:4c48:0:b0:4a2:5937:6f5e with SMTP id
 o8-20020ac24c48000000b004a259376f5emr680892lfk.677.1664889031960; 
 Tue, 04 Oct 2022 06:10:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h13-20020a2ea48d000000b0026bdb7ad643sm1231743lji.50.2022.10.04.06.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 06:10:31 -0700 (PDT)
Message-ID: <64a355f2-e9a1-dcca-cb86-48805acae8d5@linaro.org>
Date: Tue, 4 Oct 2022 15:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: display: panel: use spi-peripheral-props.yaml
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221004120907.72767-1-krzysztof.kozlowski@linaro.org>
 <YzwvDEKAzbqjSYjT@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YzwvDEKAzbqjSYjT@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Mack <daniel@zonque.org>, Markuss Broks <markuss.broks@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/10/2022 15:03, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Tue, Oct 04, 2022 at 02:09:07PM +0200, Krzysztof Kozlowski wrote:
>> For devices connectable by SPI bus (e.g. already using
>> "spi-max-frequency" property), reference the "spi-peripheral-props.yaml"
>> schema to allow using all SPI device properties, even these which device
>> bindings author did not tried yet.
> 
> Isn't this done implicitly by spi-controller.yaml ? SPI devices that are
> children of an SPI controller should match the patternProperties
> "^.*@[0-9a-f]+$" in that file, which has a $ref: spi-peripheral-props.yaml.
> Is there something I'm missing ?
> 

You are correct about one side of this - SPI controller bindings.
However these schemas here have clear: additional/unevaluatedProperties:
false, thus when they find DTS like:
panel@xxx {
  compatible = "one of these spi panels";
  ...
  spi-cs-high;
  spi-rx-delay-us = <50>;
  ... and some more from specific controllers
}

you will get errors, because the panel schema does not allow them.

The bindings were done (some time ago) in such way, that they require
that both SPI controller and SPI device reference spi-props.

Best regards,
Krzysztof

