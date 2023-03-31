Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760976D1CE1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E815710F133;
	Fri, 31 Mar 2023 09:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EDD10F133
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:47:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q16so28116535lfe.10
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680256040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hnzWIFD7E+b4S3TZGTfN6jfs1uPbhSQEaRByhI1df+M=;
 b=HB+TVMnkqvB7O0R3MzfOeH12788Pp02xIqytld9w5q6ehalIpUQ4NIGCs4FoPNwGtw
 KjINmDIkY//lZWKGXkAW/6HxoxXWdC32DM4f1uzIesFTa8YPI+RAC1d3WOQUbqGx7nDV
 lTespHeb2N2brtIIpdtHFxWZN2OOzGN+9/NRxQ+6sQoqnIOdTwI1GHdLu/mnJvAKyz/E
 RohbWhLih537gFmaFLGYdHiPsS3Jb5lI2sbUbhvksGpoVbf/QRJvjloZzTcOf2OT99fP
 OS0ixUMKhOi6tHVFED7+FBbzZG3nbCGdfiqHc8K+fc+DtV1WkjcoGRqILKWRvhz9pV62
 ZRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680256040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hnzWIFD7E+b4S3TZGTfN6jfs1uPbhSQEaRByhI1df+M=;
 b=MDr1B1Dt/Ze+nDIDe9E3tblJ9vWVZLvQoBCEPZkboG+mEyAdnTnXrlmov59aE1oqWp
 VhedgwwtlmfJnhMBCy7+RwILFOoF0xPauhQmJN9O3oUWv2VWAZPC6zjqaBYxiVL1inBr
 kYsJXeFNEL+sBHXv8BMZqdoYWYrBy5trcsqDVovvZSrnk8gcjfTuBQm/40qYZpsblJyp
 ihkDuSIZhfDERv56bhZmegXLOAexxWvw6tVb7iV++aW1mbVy/HbBBOsWm1vZyTS+pdy1
 T2B94021U8S3Y+yeTujK+i77qeYT5GXadHiZZmPrlfWGeDGRYcamGghEYuU+JAYia9xE
 18Og==
X-Gm-Message-State: AAQBX9eO2tUS2ho/ScqbTERhdTEH7LJV1ReljJ9m2aN/8KBl01xUlxx/
 ZM8QGFEcOjFzo+NQwFaXU+78Mw==
X-Google-Smtp-Source: AKy350axKhA1sEScCS2IqTPlAy7H3rF+ckndonIj5tM6RWPZCy4EAumflMTPJ5hdVeFx1W2N/KcT/A==
X-Received: by 2002:ac2:46e4:0:b0:4dd:995b:feaa with SMTP id
 q4-20020ac246e4000000b004dd995bfeaamr7880350lfo.24.1680256040470; 
 Fri, 31 Mar 2023 02:47:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac244b9000000b004e9c983a007sm309559lfm.289.2023.03.31.02.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 02:47:20 -0700 (PDT)
Message-ID: <304ce3f0-81df-327c-8b42-2471a3a51e43@linaro.org>
Date: Fri, 31 Mar 2023 11:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: maxim,max98371: Convert to DT schema
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Morishita?= <andremorishita@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331020527.482991-1-andremorishita@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331020527.482991-1-andremorishita@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: mairacanal@riseup.net, daniel.baluta@nxp.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 04:05, André Morishita wrote:
> Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.
> 
> Signed-off-by: André Morishita <andremorishita@gmail.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        max98371: max98371@31 {

Generic node names, so: codec

And drop label (max98371:)

> +            compatible = "maxim,max98371";
> +            reg = <0x31>;

#sound-dai-cells = <0>;

> +        };
> +    };

Best regards,
Krzysztof

