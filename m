Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1E6F44AE
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD99710E577;
	Tue,  2 May 2023 13:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0509510E562
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 13:08:23 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so761135666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 06:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683032902; x=1685624902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vTdVXb6d4xnv0YmTLdS0Qi0kVGTI9rnff/94Pf5/JNU=;
 b=OTiDWyUjc5vLKmDjfmk7vFBEmIE4CpI9soc/Ksp7mPInOkA3TNy6L2M7frTwl2kzaE
 tHgRxck2zMMwnkrzOBupt0niab9C6KVELTQkYM6fF4egq3bJC5ruaJCdxck/wB+J/Q4J
 rUjVjH/5Ymwx64TrF0ZMxxtL7qfixmlnzy4h0s0zJ0NTqw4VRiojQ0TtdDTmLLbD0dmp
 FQFqu/vlqgPP0kzO6K0gBFpAQ/Irbo6CMQypZzqTo3astF/GdzyFsHWoFwQ5f+hyfeBo
 INll3QaytXjs0N3qnXo180nKkheCRvj3eji1cekBtql1r5j9k3gsP7HM1WAybQNC6hVC
 WQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683032902; x=1685624902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vTdVXb6d4xnv0YmTLdS0Qi0kVGTI9rnff/94Pf5/JNU=;
 b=Vs5JSBugNthNfCtr33Jx5J1G2C65MNc4XmiBEumCaI2u98mqBdOZavxyunQdT6LZs4
 WAGogt9MlYFh9ioOyZeGSpEMO6OOqj6yhu8Fy0UwJarD68y/DSqR48SRvtn4KTg5fbTh
 c4RjL8+FcAapBGiBoJBI/n8sZAdbrrTBd2Up5w95/pXCLJxqgpD/upqjk05B0istMqt/
 yEZn9TEcuU3tR/4nzYaBzzJykiMwd+laqA9PgKtrkLRS4wA4rQvNcK/JsZXd69I3pfsF
 HPCOGU/gwN9glFOLU8Uy09oTDXWa+t8+Rtlq69hscT/D0TgGjd6XdWcRgN0WqnN5adr/
 BhWw==
X-Gm-Message-State: AC+VfDz4xmNu8sWbQ4oeSP+MN4x5Pe1kfs7FSRtGhTxckYC5CipmL7+D
 Cim+mQcbbzxl1OK6g0DaFm7iow==
X-Google-Smtp-Source: ACHHUZ75BXm0BWRSmTJcDouunvHBmhjCdZtr03hxCxdUgu1OaMxH5zZSLU7E9xbmohDbZRVAPPrOjw==
X-Received: by 2002:a17:907:c0d:b0:94f:969e:c52b with SMTP id
 ga13-20020a1709070c0d00b0094f969ec52bmr14376500ejc.74.1683032902382; 
 Tue, 02 May 2023 06:08:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a?
 ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
 by smtp.gmail.com with ESMTPSA id
 lh11-20020a170906f8cb00b0094a789256dcsm16133602ejb.111.2023.05.02.06.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 06:08:20 -0700 (PDT)
Message-ID: <665a0e0e-6320-981f-8675-95f064864837@linaro.org>
Date: Tue, 2 May 2023 15:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] dt-bindings: display: novatek,nt36523: define ports
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>
References: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
 <20230502120036.47165-2-krzysztof.kozlowski@linaro.org>
 <ZFEFwwU9_h36xFvd@Gentoo>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZFEFwwU9_h36xFvd@Gentoo>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2023 14:44, Jianhua Lu wrote:
> On Tue, May 02, 2023 at 02:00:36PM +0200, Krzysztof Kozlowski wrote:
>>      description: regulator that supplies the I/O voltage
> [..]
>>  
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
> Konrad has added a single DSI panel to this bindings, so we should
> drop port@1 to allow it.
> 
> See https://lore.kernel.org/lkml/20230412-topic-lenovopanel-v3-1-bcf9ba4de46f@linaro.org/

Thanks, I'll send a v2 ~tomorrow.

Best regards,
Krzysztof

