Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30D5EF12D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD20890B6;
	Thu, 29 Sep 2022 09:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88036890B6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:03:11 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id a8so1239350lff.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ekkQC7GJQ81cuqn7yaJIyO9eK5D2lUXQODNhfljx0EI=;
 b=fNxGAx0KYpQEIJjdm4n8d4KHSovl2yvg1lawgOmCH1yEP2bkcO4mlF7ZAmlB9iuvjR
 vktrPrjflKnBQx2vPEE3Zouv/G9Snpd2uOkiB4mwZRiQ3PNxQNRMETp8erbb/lzpbzn8
 Mo+Wwvhy/OhVJa1935pFBjfc7xgkR05fhPFD/nx5ddAQ1BVXYs86eA0JmcOyPzK2KIWa
 t1nxNtGUPbW7LhuVQYqi8xEYAlFUGGjYW71fTceDy5fFzrbTTpnS3L+26mDQOPrgQ0/q
 ovk9V4dvCqmB7d0CaJVVCEVjpdP/Jes6E2uX7uG5sRbNuc81A7jMFZC1JmCkOGb+4wz0
 Mgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ekkQC7GJQ81cuqn7yaJIyO9eK5D2lUXQODNhfljx0EI=;
 b=brBYHbtmAddwNiONFHVRSc+RAXcmTk21FeTS619gJX+pv/+2XLAs2ByOz3HVbyqmEy
 M64ACzmSVzYsRrwVyDIYE5hWyTBPa/jtlCWpR1UPl/VozmRrsycHVvIVJpLat763pt5W
 aViCHEnkDUh812iXQj5Ih9WhNlIgDsXFMvV4msD23wpGAyYvyatyzXvcQEHr7CpCih/Q
 NC/Z8YIumZajIDavKg0H3J+gRkcoUFIho05xWN9vUTvPz3+SexzNjwkpfZbu1cRODjem
 ua+H/U4rSsSSZgkVdPWW/2AOeqIjK/Q55d5X4RBnxA2pNMlsqIPu/Mj8C92K0qK8y+4J
 1WEA==
X-Gm-Message-State: ACrzQf0yTdf5ffytN54YWZuYBvfwKVC9Unj20XFksSDraSD3kygH8ygt
 tx2XQ9WWhXBmV+bAQmi59LEs0Q==
X-Google-Smtp-Source: AMsMyM6sWJPWobcdhsezk/UkFUJMWSsPWVIRNRtarpZ/N/yPz1yP4zKWe6iDX0IS1NUHjrNfMQbVow==
X-Received: by 2002:ac2:508b:0:b0:4a0:5d6b:ff14 with SMTP id
 f11-20020ac2508b000000b004a05d6bff14mr897827lfm.409.1664442189815; 
 Thu, 29 Sep 2022 02:03:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 e8-20020a05651c038800b0026c5ab1883dsm651010ljp.16.2022.09.29.02.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 02:03:09 -0700 (PDT)
Message-ID: <37c6c5f9-fbdd-3a44-15f7-e28915cbb7c0@linaro.org>
Date: Thu, 29 Sep 2022 11:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20220929014456.30077-1-allen.chen@ite.com.tw>
 <20220929014456.30077-2-allen.chen@ite.com.tw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929014456.30077-2-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2022 03:44, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../devicetree/bindings/display/bridge/ite,it6505.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a..62b9f2192202 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,6 +52,14 @@ properties:
>      maxItems: 1
>      description: extcon specifier for the Power Delivery
>  
> +  data-lanes:
> +    maxItems: 1
> +    description: restrict the dp output data-lanes with value of 1-4

Where is the definition of this property?

> +
> +  max-pixel-clock-khz:
> +    maxItems: 1
> +    description: restrict max pixel clock

This looks wrong. You do not use proper unit suffix
(https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml),
no vendor prefix, no type and weird maxItems like it was array. Is it
coming from any other schema?

Best regards,
Krzysztof

