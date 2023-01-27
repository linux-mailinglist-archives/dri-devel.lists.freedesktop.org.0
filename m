Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439067DF65
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 09:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F051210E422;
	Fri, 27 Jan 2023 08:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12D710E422
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:41:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id fl24so2912367wmb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 00:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UxnWhrFnVg9VP58IS7ZKzQX3VM2IYjNuKWEuyc1Z10U=;
 b=NQCHspnEctpCE8vljAUa6h3ikw9CPSk1fOcWf9iseJERN2npBiZFIcBJiwlDVQhshA
 s3nOMsVhQJvYM6NgHdqjwftcEEUFrjLMXCRSsSWNxPKV41UH3WYxJQM+3ikN1HQuCcEH
 s9vyRfIQjEL/21h/cAsthPAHg0YWwvtoKN6JQ5B5xKnvVl1mrcuvs33yWEZOcW0F/tUz
 Xj0AQtW6tdq7c/+DE0acUuCH3Oc70HlTPAl4NM1PQu+tEmznQBz4NziJnHAye9iScLq9
 uk4krR9dj6hACvGmgFLDnErk4C8yHOBKV5ZmdKG+te9ZjurwjPVODYLRs0R5OsQD9Doe
 +0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxnWhrFnVg9VP58IS7ZKzQX3VM2IYjNuKWEuyc1Z10U=;
 b=AZbSfhIuIn3wK0p5/S1SKYEY+UNT4abSRo+dU4jPj6VDC/SXLdZADnIsCjN74GKaMq
 YnoxT+JWtK4ZwBq0nhZpC31PvcuuCXw1WfoI8dFPYoiwJO0SdGj9xMTmh6w8X2XHj7C9
 45hwgLHsAl623n7nTHdYXRM9Dp9kdIZVoguaEtk/0/G9u8zrmPCFDWQ76TueviMqBYU7
 TVx31cxnf3HWAkyfK1taU5r1MhMTHLoEFUmiZ4EzrOaPvxPaqnC9F4YFdyqM5AYVlVpB
 zC4C3yRoFumZPKVmseozVwW6IKYpCMqdapoNGQI+Je7kGr6CVQU/90LozrHRCOVD+bA8
 RMuA==
X-Gm-Message-State: AFqh2ko/7Lm/BoXqDB71IAe4OL2VbXvmwZ36aXg9f8sxv52mGIhnzybg
 PgefQ6kmhuNo/TmV8J490TmY4w==
X-Google-Smtp-Source: AMrXdXvTpwGNtr6wPm4vSPwSZLub/71exUFMnbCUGJxPEgkSu5kw1bcyisR+Dnx1LOm6LZ1OCZeeAQ==
X-Received: by 2002:a05:600c:b90:b0:3d8:e0d3:ee24 with SMTP id
 fl16-20020a05600c0b9000b003d8e0d3ee24mr39376985wmb.37.1674808900181; 
 Fri, 27 Jan 2023 00:41:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a7bc444000000b003db03725e86sm3662743wmi.8.2023.01.27.00.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 00:41:39 -0800 (PST)
Message-ID: <492fd43c-ca32-17f0-dcdd-48eee0e7e035@linaro.org>
Date: Fri, 27 Jan 2023 09:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] dt-bindings: display: bridge: tfp410: Add tfp410
 i2c example
Content-Language: en-US
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230125-tfp410_i2c-v2-0-bf22f4dcbcea@criticallink.com>
 <20230125-tfp410_i2c-v2-1-bf22f4dcbcea@criticallink.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125-tfp410_i2c-v2-1-bf22f4dcbcea@criticallink.com>
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
Cc: devicetree@vger.kernel.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/01/2023 23:40, Jonathan Cormier wrote:
> Add a i2c example with HDMI connector
> 
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>  .../bindings/display/bridge/ti,tfp410.yaml         | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> index 4c5dd8ec2951..1f3d29259f22 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> @@ -116,4 +116,34 @@ examples:
>          };
>      };
>  
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tfp410_i2c: encoder@38 {
> +            compatible = "ti,tfp410";
> +            reg = <0x38>;

This differs only by two properties, I don't think it's beneficial to
add it.

Best regards,
Krzysztof

