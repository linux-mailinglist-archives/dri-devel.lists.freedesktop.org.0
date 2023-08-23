Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EEC7854A7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 11:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A74810E405;
	Wed, 23 Aug 2023 09:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C780D10E407
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:53:59 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9a18a4136a9so467329466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692784438; x=1693389238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=snyW6QooaPXxRKq026Bpqwbivey9Dhp9wOAD4tTxaMM=;
 b=JhXVDWs3XswyJo84RMqihcUmZtWcGYewSOz3Ew/Leb8e0w/FeAsxS/y8N1HLPvHRLd
 gNnfUE9ZoiBmpfHTIWdqAlZpGoxIIp9D+XgrtFc865nMWes3h7XWvYDvBKvW82qdRGvo
 E0u6bt45VhUdzCe4nZ0gZbTxQkO5ScaE84EJP8V38xGOcqYEUgqqR2zm5h0zvkV8XcNi
 ly2HHZbHq2Y+Ae89nPuUnqu0gNRXVzHmJZaX6y/jfw4bLubPo9FN+th2jjddDI03ogzF
 572jIhTTpKB/dUQzBTY3Nd5M1TTI+Ceulg0tpSGTmY8uKwaOrF9AqnwjCLjMBfGFNfLA
 rr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692784438; x=1693389238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=snyW6QooaPXxRKq026Bpqwbivey9Dhp9wOAD4tTxaMM=;
 b=cUiPOJ8QCv9Ic+MUcJVZ8TjrWPJYxA+q9OvRCh8+gwsrpLkORtJ6582OJcOFeOa8Jy
 aUo8M07rlJAcGminVxaQ3Qt7uTx8ohf9i/kth7D+kyHkcEh2/VeGbwccARiV7LqmtUz+
 6i9tbvZD+TPAj80f8djopVzVSdhb8WuudTC36lwnX8prQ5fnzgqVOlkvdU3DlixrxEpL
 MFejNDfioUezJAISOu8MyU+J4gIDkAzOqUcev9SGHAN9q9nbQ6kqqNSlE3ubamnIYztY
 MPxiksV7K2Eb77oFhdF8KScNHM819AZ2RsOFSxEqBaXuFvcirms2oHRRHCuEt/br5BP3
 1DZg==
X-Gm-Message-State: AOJu0Ywhn+8u1lTGTSsNjAf+3n0be5a7HQG+Mm7ImQjNazIE3sxDemU4
 gJxJSAZ46RsaOHKJV1LZlXpQ6Q==
X-Google-Smtp-Source: AGHT+IFD76c4FCTBYsFBDjJ4/evxGKRAuH6eb0Ylbul3hf6RYEUkGvi2jH6NKTEN/9TGRqlQYHdctQ==
X-Received: by 2002:a17:906:2d0:b0:9a1:cb3c:ba5c with SMTP id
 16-20020a17090602d000b009a1cb3cba5cmr2244200ejk.68.1692784438286; 
 Wed, 23 Aug 2023 02:53:58 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a170906b19400b0098f33157e7dsm9562610ejy.82.2023.08.23.02.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 02:53:57 -0700 (PDT)
Message-ID: <32667691-ec7f-0dd3-b3ba-fdcd40f1fbca@linaro.org>
Date: Wed, 23 Aug 2023 11:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/3] dt-bindings: display: novatek,nt35950: define ports
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
 <20230823081500.84005-2-krzysztof.kozlowski@linaro.org>
 <169278171739.1524810.6441506448861500441.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <169278171739.1524810.6441506448861500441.robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Jianhua Lu <lujianhua000@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2023 11:08, Rob Herring wrote:
> 
> On Wed, 23 Aug 2023 10:14:59 +0200, Krzysztof Kozlowski wrote:
>> The panel-common schema does not define what "ports" property is, so
>> bring the definition by referencing the panel-common-dual.yaml. Panels
>> can be single- or dual-link, thus require only one port@0.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes since v2:
>> 1. Use panel-common-dual
>>
>> Changes since v1:
>> 1. Rework to add ports to device schema, not to panel-common.
>> ---
>>  .../devicetree/bindings/display/panel/novatek,nt35950.yaml     | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:

Previous patch seems to be missing in Patchwork, thus this error.

https://patchwork.ozlabs.org/project/devicetree-bindings/list/?submitter=83726&archive=both&state=*

Best regards,
Krzysztof

