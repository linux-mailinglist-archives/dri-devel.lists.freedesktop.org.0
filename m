Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E56E40B1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC510E399;
	Mon, 17 Apr 2023 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B85810E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:09:42 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94e102534d6so398222466b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681650580; x=1684242580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sNQcR72lxA1AVVNfsXZ77YrtExBj+UGMBGyQjKiT4qs=;
 b=q04H6dBFxTDy3zNnMEYBfZKyTEBySfBSi+bwBrHuR0KQw3QUyqz9Jp/AZ/3w1SemPD
 V06Y00LCI2RRKOueZct0TIpYcH/AQjIdyjP8TuvP6wAd4Z2WBZOYHpBqiecYjX3GlHkO
 Q13pqT/ej3fpLW16eAueTCYVJBKfrlVAOg6xCCIwvtWh3O991AlXT79TCYS8HCinfKDf
 CuYx/Wy4r24oDC/w/NIMUVlt6eHy3BMp6+vxteK0+XiDSrggpT63GTmS5ibeVBeerYy2
 s+8wmyw/oYU/0bmBBFJDs026wOs6RcbefKq1Bhtubm1IAilpttvv4QvHwMoyYD7ZQ1uc
 KqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681650580; x=1684242580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sNQcR72lxA1AVVNfsXZ77YrtExBj+UGMBGyQjKiT4qs=;
 b=RsQ7BM28E74KW9lBA/Gb0MNw1c5qkyb8DWqOwg5R2wbQVuzzgg9II8D1lkAYGRIagM
 swvDeEB472QkAwGx8rRjh7kDDkpma0rYii1Ow9T4QgqEwtA7pWNKNvrL1/ev2qDscq7y
 gmSOqCydZwZhfhDGmwFCmlksOdqVeBK+dyRNnh5ffCXWqAJzFBN39jBesGgrhGOR26+g
 4C64HKW5VZJMSIsNIO2L4+pctsuu3HsPSPq61Bj2n0AEfOb6wbCgtCP0pzx95p//n55j
 mdNpggqsJOU85xZ5G3c3oLQ3ghX3ouJcjGHpLdncuPuB1e7abWIQvgvBv/ZRPqM2LHXR
 8dEg==
X-Gm-Message-State: AAQBX9eXUZU9b7S5FFHvMpLY18kvHYbWtQVT6Ff4v9xqo44k4DkzFelY
 2XQBueXZ/fh74gZ/XVkQvdM=
X-Google-Smtp-Source: AKy350YIaQnWdnA8o0bmnjpipOetmc+37VvK2Sz1+cpIazmoOZme0G2J2ujFouu4WO/7L6+K3Xxt4w==
X-Received: by 2002:aa7:d38e:0:b0:506:70a2:cb9c with SMTP id
 x14-20020aa7d38e000000b0050670a2cb9cmr9952800edq.12.1681650580319; 
 Sun, 16 Apr 2023 06:09:40 -0700 (PDT)
Received: from [192.168.50.244] (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 w17-20020aa7cb51000000b004aeeb476c5bsm4437961edt.24.2023.04.16.06.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 06:09:39 -0700 (PDT)
Message-ID: <8b9438b9-6628-78f8-6de3-aa1f418044ed@gmail.com>
Date: Sun, 16 Apr 2023 15:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0
 LCD panel controller
Content-Language: en-US
To: thierry.reding@gmail.com
References: <20230416130735.30965-1-aweber.kernel@gmail.com>
 <20230416130735.30965-2-aweber.kernel@gmail.com>
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230416130735.30965-2-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2023 15:07, Artur Weber wrote:
> Add bindings for the S6D7AA0 LCD panel controller, including the
> S6D7AA0-LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family
> of tablets.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changed in v2:
>    - Updated commit message
>    - Applied suggestions from Krzysztof Kozlowski
> ---
>   .../display/panel/samsung,s6d7aa0.yaml        | 51 +++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> new file mode 100644
> index 000000000000..969cef7738b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6D7AA0 MIPI-DSI LCD panel controller
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6d7aa0-lsl080al02
> +
> +  reg: true
> +  reset-gpios: true
> +  backlight: true
> +
> +  enable-supply:
> +    description: Enable supply
> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - enable-supply
> +  - backlight
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "samsung,s6d7aa0-lsl080al02";
> +            reg = <0>;
> +            enable-supply = <&lcd_enable_supply>;
> +            reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
> +            backlight = <&backlight>;
> +        };
> +    };
> +
> +...

Wrong patch file, please ignore. Will re-send in a second.
