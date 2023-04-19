Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E159B6E75CA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5D110E0BA;
	Wed, 19 Apr 2023 08:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C021610E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 08:57:01 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dm2so79810612ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681894617; x=1684486617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFuzy4TuvFqYZVB9yIonpVvfyyHxImCxfwDErPMQgRg=;
 b=H/iMr/DovWLHt2YCjeW6aLfRxx2KGDYSy/hsKKdRIiNQKmpU9pgW72ZIATuskwh2gK
 GPWY+4ijiNsyeM+X4Dbf7/YsVp23JLhKLRC6kcInZXIlj+ZHf+E6rLY8R3slKcoER14e
 oolLGqzzPaJX8IkBrpJpwcP7ZQMMnl5zUgQca6wpzbKSkAPDcyqEDwds585KkzrMAQoO
 Dod9TgyryqBl6bb8iOWLH6zWlaYfhOcMN/q5of2nXEtHI1u52DMhLtJA5CSrFGAcLNy1
 A+DJhj/85CcQFOg9iz3jbKKDywW0wP/I3HBB/u9J3zdFiuzvjTcqRuuxIG1RGNMdwrUJ
 SHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681894617; x=1684486617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFuzy4TuvFqYZVB9yIonpVvfyyHxImCxfwDErPMQgRg=;
 b=LEy+/ggorkIVlsM4XAYGlMebD/TieqchIjoargHk+zvbMIk91DCEstfb/6cUx2DO3e
 os8dVEnvX6tI9VeeysNgMCoPJuPlsZBo3R0XqPSp7oLP8tF8LRTSYDRlb07CuJGbwSji
 Hy6zUD22w3xjVwacbyOnmWWXa93FhIhhytg88MulpJwwIZiEZ0UHI+YOci8XQRjtBYTs
 teKBU9+Bj0mtv/cMVfhN1LrLooHN7zmhix1aBMxCKb/5vTeHkE1gXps957S3c6I2TPDr
 aOA/BJODDbOyjD0XQ90eTURhiaTd9xY00k0JrEriyUdC7afbuHuAi7Fb9MH78kv0xLXQ
 4mlg==
X-Gm-Message-State: AAQBX9fBQHSwHd4FcHzgRXZcyDqNYFQqDBYaVqjNwKFSfzOR94V8HF67
 4aTrT+WCbfvbXz3N1MKu552fEQ==
X-Google-Smtp-Source: AKy350ZHhQqP60s84sOXg5hEoFCicZMMdVpYkZ1g5erVI/+cot6zkgX/52ioHeJ+kkdg+Elklcr+nw==
X-Received: by 2002:a17:907:9805:b0:94f:3cf5:6d7f with SMTP id
 ji5-20020a170907980500b0094f3cf56d7fmr13114320ejc.46.1681894617176; 
 Wed, 19 Apr 2023 01:56:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:62f5:eb43:f726:5fee?
 ([2a02:810d:15c0:828:62f5:eb43:f726:5fee])
 by smtp.gmail.com with ESMTPSA id
 be5-20020a1709070a4500b0094f282fc29asm5844742ejc.207.2023.04.19.01.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 01:56:56 -0700 (PDT)
Message-ID: <77d94fe0-75d2-8f64-19c6-fc19438ba71a@linaro.org>
Date: Wed, 19 Apr 2023 10:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] dt-bindings: display: panel: add common definition of
 ports
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
 <20230418222613.GA2408838-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418222613.GA2408838-robh@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 00:26, Rob Herring wrote:
> On Sun, Apr 16, 2023 at 05:39:29PM +0200, Krzysztof Kozlowski wrote:
>> Few panel bindings for dual-link connections just type "ports: true",
>> which does not enforce any type.  Add common definition of ports, so the
>> type will be fixed.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/panel/panel-common.yaml     | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
>> index 5b38dc89cb21..ad62d34e6fa3 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
>> @@ -70,6 +70,16 @@ properties:
>>    port:
>>      $ref: /schemas/graph.yaml#/properties/port
>>  
>> +  # For dual-link connections
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    patternProperties:
>> +      "^port@[0-9a-f]+$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> 
> This allows any undocumented property.

Yes, which I hope the device schema (using this panel-common) will
narrow with additionalProperties: false.

I can make it explicit: additionalProperties: true.

Otherwise, how do I allow custom properties like:
Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml

> 
>> +
>> +    required:
>> +      - port@0
>> +
> 
> I don't think this should be added here because users must define what 
> each port is. With it here, we're going to validate the nodes twice as 
> well. Same can be said for 'port' though. It can't be extended though.

So you propose to drop entire "ports" here and expect every panel schema
to define it instead?

Best regards,
Krzysztof

