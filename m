Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC0785456
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 11:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07ED10E06C;
	Wed, 23 Aug 2023 09:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3710E06C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:35:28 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b9f0b7af65so82766261fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692783327; x=1693388127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b2WR3Ie0h6RR/yPxDJeAUQR54bpQnAIUQ5XkLuiEbOw=;
 b=aoWioChoG5AbKY6UZJUCEVsha2OqtkBmtIK2rhxcqENKgskrbeqZGz3LFcAIYYfTty
 aHLYMQb53eg+mEC8Y5jJJ11Ih8Vh0cfkf9SQtS7y52hrNwaQlwZppeJ2NAPjB2nrKSBR
 H9/FlUayI9HpUFJFoZCKw/nW7SG/pJr15Znsfpi71NaTrDbtGC7fsAmVxw3DoKmqizUT
 QifYJO4da/Zr7MxnCGo90kWNu9wRZ+0CqPV655v+IHWg75UQLk+I5ZNL4GDYBtZ9BPdk
 +xuezddiQhdD3E7B421ANvjvFgX/Q6WpaafLA0Ze4T7MqX3wShtyygLpOoGqWuQsU1yy
 oYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692783327; x=1693388127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b2WR3Ie0h6RR/yPxDJeAUQR54bpQnAIUQ5XkLuiEbOw=;
 b=jdrIAVM1bT8ISMmBYsStTQV6mqsZ5W9RvKS809V5Yp73iPqZ9ogpDUOiBH7Qge96tF
 dJ4ckg4wND6eur1fqp0YTiO6jxq9l/CIL11IRV/y6VbSAWyoa8CKGaM3UXb7YCOkhfaW
 CR4iqDWAYwQPZapSpwxdLEuSc8TRZ6FFOkXFCxD/3YYHQHsZ2vGHJYNhh7xgkKwtmHcz
 03KEl800vZ3wWQcs/+HTQA0Ku2mV5i51Q3At3adlgf5IzAyqM/9gRZGtLTkqC+80Ekld
 e1K+PPm3K+/bXezGjnQ5wuDgtnJWmDlWmXgYxEaBa97iiP2NB/iReVlDOLQnQJAHAu4P
 E4FQ==
X-Gm-Message-State: AOJu0Yw3L7y0PTlscOuiOOf5C2XRk8flLCnv6X5sDYibpTR0U/bB+dFA
 eEQTVLg77R/+Xij4xmSd02VUrw==
X-Google-Smtp-Source: AGHT+IGG8ZQMpcasgZT/TlzCMc5uvmu4o8YkKzwHP3aFkVzTO9t2EyjtCSFss5/JI0sVdgKcWAFlFA==
X-Received: by 2002:ac2:4e0c:0:b0:500:7f71:e46b with SMTP id
 e12-20020ac24e0c000000b005007f71e46bmr7780180lfr.1.1692783326608; 
 Wed, 23 Aug 2023 02:35:26 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a056402164a00b0052a3c7c9e8bsm388894edx.56.2023.08.23.02.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 02:35:26 -0700 (PDT)
Message-ID: <61ae58eb-d56c-59c1-81d7-b51322468680@linaro.org>
Date: Wed, 23 Aug 2023 11:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: add common
 dual-display schema
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
 <20230823083427.GB4143@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823083427.GB4143@pendragon.ideasonboard.com>
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
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2023 10:34, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Wed, Aug 23, 2023 at 10:14:58AM +0200, Krzysztof Kozlowski wrote:
>> Add schema with common properties shared among dual display panel ICs.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> v2: https://lore.kernel.org/all/20230502120036.47165-1-krzysztof.kozlowski@linaro.org/
>> v1: https://lore.kernel.org/all/20230416153929.356330-1-krzysztof.kozlowski@linaro.org/
>>
>> Changes since v2:
>> 1. New Patch
>> ---
>>  .../display/panel/panel-common-dual.yaml      | 46 +++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
>> new file mode 100644
>> index 000000000000..83fcd643b5f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/panel-common-dual.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common Properties for Dual-Display Panels
>> +
>> +maintainers:
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> +
>> +description:
>> +  Properties common for Panel IC supporting dual display panels.
> 
> Could you elaborate on what you mean by dual display panels ? From what
> I understand of the patch series, this seems to be what I have called
> dual port panels, that is panels that have two input ports to double the
> bandwidth, but still operate as one display.

Indeed, looks like that. I don't have the datasheets so I am trying to
get some pieces of information. Judging by the usage of these panels -
Qualcomm DSI with qcom,dual-dsi-mode - it indeed is one panel with two
links.

I would need to rephrase it.

Best regards,
Krzysztof

