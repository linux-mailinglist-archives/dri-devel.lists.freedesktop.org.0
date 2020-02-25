Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690316EC52
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 18:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9436EB5F;
	Tue, 25 Feb 2020 17:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364446EB5E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 17:16:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j20so246711otq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OE6eipVQm4bME6AE3KlIKW+8PF5MdzZLKNm5AdRaXEo=;
 b=BnguZFiKDFgfSbA509iHMpBzPvlwVi0T4/WJcYw4IIGGGiZsofCeKjas0lHZEFUMPo
 VZ2A7b3F12ZBrI7IIcJvHIzAMUdK4bOWDtQnfCNf9Hp6Uyh0DyGFjZFiKFzYygUjCmH5
 qm/UUtIk5TQzZxnyV68dfPl7Panmhu2+/rZrEDRa9+3loBrCJ7PMfgpCGl1MRgcNOBNR
 2Jw8o3wYGgCiPV+7m30w3j5EkueGIu+ksWSPttlFtLoR5Kxv5H2nV5dU2J2lmHv3PY/e
 kZ2puaQ2PYJinssWAZPz4KRzDZV5WaB0xqEXVhs8pi1qdKt5KYBPLs3OS4INlPBWNtsO
 BG/w==
X-Gm-Message-State: APjAAAWWTbCM+FR0fM6JjQRk+uQTu+vkSED8TERH42/ParKCP73gLm+S
 JskzyOltbaTMlGXpwHodcqCHkG8=
X-Google-Smtp-Source: APXvYqwU0mKHqcSecaw+GXPaK947LH2SDNl/9+T8PUAMCjq938LQ4s7sM8N5fIiMZJA8eWGLsGru4g==
X-Received: by 2002:a9d:760d:: with SMTP id k13mr43428788otl.42.1582650975368; 
 Tue, 25 Feb 2020 09:16:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t21sm5863311otr.42.2020.02.25.09.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:16:14 -0800 (PST)
Received: (nullmailer pid 13718 invoked by uid 1000);
 Tue, 25 Feb 2020 17:16:13 -0000
Date: Tue, 25 Feb 2020 11:16:13 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Message-ID: <20200225171613.GA7063@bogus>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207052627.130118-2-drinkcat@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
> 
> v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> v3:
>  - No change
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 4ea6a8789699709..0d93b3981445977 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -17,6 +17,7 @@ properties:
>      items:
>        - enum:
>            - amlogic,meson-g12a-mali
> +          - mediatek,mt8183-mali
>            - realtek,rtd1619-mali
>            - rockchip,px30-mali
>        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -62,6 +63,30 @@ allOf:
>            minItems: 2
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mali
> +    then:
> +      properties:
> +        sram-supply: true
> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt
> +          minItems: 3
> +          maxItems: 3
> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: 2d

AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each 
core group is correct though.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
