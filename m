Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511B5EE408
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF3110E401;
	Wed, 28 Sep 2022 18:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C14E10E401
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 18:14:16 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a10so15294809ljq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BrOXUUfC0kL59Y1UmzHzsftxixuWlRc4zXH9J/eo0gI=;
 b=VSPtJ1HnP3Jbl6tzHhrBtDVbSdlieIY7u6ddlkpRFMKUCCOcw7HGIDaUAmIXWou/3c
 YnOj4LVd3/rs+a5y4HRmun7sL5tyZhXB5UeE7+rJCTMiKzTsvx5kU1h32YSeYx7FyOfO
 G3dxhtCZjn9twCnqQpatdGB/n5chgqUuzQA4FzDx+G/OcrlhKSk9MdjysQr12gl0GGUu
 XiaaAZTFJvoJfG4SC+4RWn0Nd/KQ/1aOU7mKQA7vTcQI6unS3Awx2RPk94o6EIr5EF59
 jkrvj3dzNbA97EavqLlKCl/aAveyHXtX9B5yEgRt6AnqvtPjsqu3QQjbx4mILY3gvIa3
 ZIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BrOXUUfC0kL59Y1UmzHzsftxixuWlRc4zXH9J/eo0gI=;
 b=7WyfpFrPQecNpTWSAd1lduMsyHqS8BcgfKIPtbiORBDCtRhg4zSbJnIfQ00jBc5V1C
 Tha34dopDpFldTgzC3zjfWoo42cmLm2kcAsoLrPDqup7cmrk6PasLq55euz4Sqjg2DkS
 hL9I5HBgejMRt79sP61aw4BlLjWN8eOOUK5ZUK7V9IBaDdUVNRpQUC89pQPv8RTaFokP
 KobwMyTwH5pemir31k20Mxm8AYOdg075xHMH4Pa2pQEWvZPUwLpNssI86kDXs+TLz6K2
 xuhzlMXGyNzQiiH7ske2xhnkZ457tzu6euWNftePZdEaBIcGffSTUTf9OfPFLUgGJW+W
 nCxQ==
X-Gm-Message-State: ACrzQf07K+fL/c6dJzjYYnp1QrqfbcUQ1vP1SNLF6iePnkB95K8B7hLJ
 kc3xVVi4tJjqPHoCop4LesIDqA==
X-Google-Smtp-Source: AMsMyM6FIcW8vQl/oHQx5+DSxLH/9IFwShQrmQwd207vM7vZlH9NsAILtgDsuEYjcARwnUiwtRx+XA==
X-Received: by 2002:a2e:998b:0:b0:26c:1767:43c with SMTP id
 w11-20020a2e998b000000b0026c1767043cmr11584534lji.342.1664388854336; 
 Wed, 28 Sep 2022 11:14:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t6-20020a19ad06000000b00498f32ae907sm539511lfc.95.2022.09.28.11.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 11:14:13 -0700 (PDT)
Message-ID: <bab96626-3296-70aa-90c6-bb639d3c6ad4@linaro.org>
Date: Wed, 28 Sep 2022 20:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH v5 2/6] dt-bindings: display: ti: am65x-dss: Add new
 port for am625-dss
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
 <20220928175223.15225-3-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928175223.15225-3-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 19:52, Aradhya Bhatia wrote:
> Add 3rd "port" property for am625-dss.
> This port represents the output from the 2nd OLDI TX (OLDI TX 1) latched
> onto the first video port (VP0) from the DSS controller on AM625 SOC.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml      | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 6bbce921479d..99576c6ec108 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -82,13 +82,18 @@ properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          The DSS OLDI output port node form video port 1
> +          The DSS OLDI output port node form video port 1 (OLDI TX 0).
>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
>            The DSS DPI output port node from video port 2
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          The DSS OLDI output port node form video port 1 (OLDI TX 1).
> +
>    ti,am65x-oldi-io-ctrl:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description:
> @@ -104,6 +109,17 @@ properties:
>        Input memory (from main memory to dispc) bandwidth limit in
>        bytes per second
>  
> +if:

Entire if: block is usually put under allOf:, so when the list of
conditions grow, you do not need to change indentation.

With the change:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

