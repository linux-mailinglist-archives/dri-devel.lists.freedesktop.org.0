Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A4E510701
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B3710EACF;
	Tue, 26 Apr 2022 18:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4410EACF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:31:21 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id z2so21648784oic.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qgmDW0PWpCTN6QAQccW/HQMdlWsW6QW4exSJtmSe5+o=;
 b=svJX5hLDrBXTLm0l+EZOgi6xdEIJxouWJeaTM3BGqJueZ72P3I9GvuAOy2cl5/DdXE
 rdXaYC51ZUPQe0dyatnOQIHhV0gmrv0Hlb6vTn/lFbKA7mgCnGH/qM+Cw/EyvG8lyQ5C
 E7iJW93fm0F4TcDM8+H2NfRUPzLdEmdeVfoFoHJPp4njgM3/fFUdc/mNS8h9AyY8Tf7S
 a4J7o+EX1tcIIJKVyLY1qqd68b3PXV+tjTaDGXbq8ClGQB3IlDmcnLtsZmJn+/fPD3Hy
 chXHYi6uksKu2qHqJVoikviljxiVQXUmrWk0E0JIpCp3ssZVEA9jYui4wXzjbNij13wI
 SSrg==
X-Gm-Message-State: AOAM531XhUVLoVuT2J76y8wRF07UXxd0RrZBwE/i2tiGERsrfE9c082y
 6bCTvPhZS5xgyqXwEVmjgA==
X-Google-Smtp-Source: ABdhPJzIL1Yhrx2OPNJPgILC3RYcFne6c582YL6nl/ypM4+HqTvmQMy38qg7I2jfWGPUHp/r+AUExA==
X-Received: by 2002:aca:c46:0:b0:323:1b2b:77de with SMTP id
 i6-20020aca0c46000000b003231b2b77demr12069221oiy.113.1650997880448; 
 Tue, 26 Apr 2022 11:31:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s2-20020a05687087c200b000e686d1386asm1079738oam.4.2022.04.26.11.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:31:20 -0700 (PDT)
Received: (nullmailer pid 2314030 invoked by uid 1000);
 Tue, 26 Apr 2022 18:31:18 -0000
Date: Tue, 26 Apr 2022 13:31:18 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: add power and gce
 properties
Message-ID: <Ymg6dn3PotTeWbqF@robh.at.kernel.org>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419033237.23405-2-rex-bc.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 11:32:33AM +0800, Rex-BC Chen wrote:
> From: "jason-jh.lin" <jason-jh.lin@mediatek.com>
> 
> Power:
> 1. Add description for power-domains property.
> 
> GCE:
> 1. Add description for mboxes property.
> 2. Add description for mediatek,gce-client-reg property.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b31d90dc9eb4..6c2c3edcd443 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -41,6 +41,30 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  power-domains:

How many and what are they.

> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.

Drop. Don't need generic descriptions of common properties.

> +
> +  mboxes:

How many?

> +    description:
> +      Using mailbox to communicate with GCE, it should have this

If using?

> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.

Drop

> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type.

> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1

This needs to define exact sizes.

items:
  - items:
      - description: phandle to GCE
      - description: subsy id
      - description: register offset
      - description: register size

> +
>    "#clock-cells":
>      const: 1
>  
> @@ -56,9 +80,16 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +
>      mmsys: syscon@14000000 {
>          compatible = "mediatek,mt8173-mmsys", "syscon";
>          reg = <0x14000000 0x1000>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>          #clock-cells = <1>;
>          #reset-cells = <1>;
> +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>      };
> -- 
> 2.18.0
> 
> 
