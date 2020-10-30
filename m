Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF42A0002
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978326ED0B;
	Fri, 30 Oct 2020 08:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF046ED09
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:31:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w14so5467991wrs.9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p6idzH1GDSIwNc19rxcBjwiL/wzEJM61Nw+DAXZCuyM=;
 b=XWSKf2wGDcVVizIAeuthNkkGeQDT9bRr3fsi4ncu/2v+OqQZOufcKjbEgSIpl/uqkM
 k9H5wQBuiFjLyEro2EtHS40o9tn4UIVMPV8LEYe8sOGwhJXvF2q7oxpOeJCmtmqN8Ouw
 xeoZ7+NiZUqrxRFpHu/hiuqrgN4AEpeFT28bDcq+48Dtfir9jLeRnG4/1sSqQCoJWeE7
 GVJ3JgjC10I6vLZ5woq6P7WVvkqbHTTpMtOGXKUInAZxqISQMfY8GXKFJHezZydL7lc8
 XNQdspimk/unNCOXyaDlhUuHcpJ8pA3X5Ecr1/EgEnuEqxrYOdIMLoYUo2Ynawf2I3bw
 CDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=p6idzH1GDSIwNc19rxcBjwiL/wzEJM61Nw+DAXZCuyM=;
 b=Qak6r8RaSj05zGOV1CEJ/bZHcMHi70JUQy2NzFMY5zZad7NqmdwxhXpfjp0H1u3L3L
 EJgfsjUEFHiYv7mui/OPDOUExPCJ8GGRdWV0BsYNfZVZGO3j802EouZfjk9SI2joEkah
 tNkfIbtaunhN0+GAHqxuccJmbq6nrnmkWpQEFDqz2jRZYBkbTUDhlkBMfA3HWKZpBYHd
 oMfF1PTz+9nOLSSQfE8jYT2veCX5885CX4ZBBWlbCIhsIECHM9IxBsmNmrJoegq7C/bo
 9L9br7uXQ5JZP8uL3prBMVa7atUJvtM6diw3rYTpOWKwVBLr65PlDDzT6Gg8SlQBOq64
 4cBQ==
X-Gm-Message-State: AOAM530EnhI3t3IyO9+/uw0094rKKQFWsUVUmk9sMexY6HBx1unQhwP9
 qUxmlStTNZWry1cu6f6RrxsAdJHSYTn0uA==
X-Google-Smtp-Source: ABdhPJza6CJ+11+lJxaBm/qDhuVwhUYSU8OJjo35xrzKbutjD+HbVfl01m4qTHUk9UPpsdND//zTqA==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr1590024wrc.1.1604046698103;
 Fri, 30 Oct 2020 01:31:38 -0700 (PDT)
Received: from [172.20.10.7] ([37.166.148.232])
 by smtp.gmail.com with ESMTPSA id m14sm9700864wro.43.2020.10.30.01.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 01:31:37 -0700 (PDT)
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
To: Sam Ravnborg <sam@ravnborg.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222046.GA904738@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <b30439f7-b77e-9ca8-57e9-16cf417da0cf@baylibre.com>
Date: Fri, 30 Oct 2020 09:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029222046.GA904738@ravnborg.org>
Content-Language: en-US
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 29/10/2020 23:20, Sam Ravnborg wrote:
> Hi Anitha.
> 
> On Thu, Oct 29, 2020 at 02:27:52PM -0700, Anitha Chrisanthus wrote:
>> This patch adds bindings for Intel KeemBay Display
>>
>> v2: review changes from Rob Herring
>> v3: review changes from Sam Ravnborg (removed mipi dsi entries, and
>>     encoder entry, connect port to dsi)
>>     MSSCAM is part of the display submodule and its used to reset LCD
>>     and MIPI DSI clocks, so its best to be on this device tree.
>>
>> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> Looks good - and the split betwwen the display and the mipi<->dsi parts
> matches the understanding of the HW I have developed.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
>> ---
>>  .../bindings/display/intel,keembay-display.yaml    | 75 ++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>> new file mode 100644
>> index 0000000..8a8effe
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Devicetree bindings for Intel Keem Bay display controller
>> +
>> +maintainers:
>> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>> +  - Edmond J Dea <edmund.j.dea@intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,keembay-display
>> +
>> +  reg:
>> +    items:
>> +      - description: LCD registers range
>> +      - description: Msscam registers range
>> +

Indeed the split is much better, but as you replied on http://lore.kernel.org/r/BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com
the msscam seems to be shared with the camera subsystem block, if this is the case it should be handled.

If it's a shared register block, it could be defined as a "syscon" used by both subsystems.

Neil


>> +  reg-names:
>> +    items:
>> +      - const: lcd
>> +      - const: msscam
>> +
>> +  clocks:
>> +    items:
>> +      - description: LCD controller clock
>> +      - description: pll0 clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: clk_lcd
>> +      - const: clk_pll0
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  port:
>> +    type: object
>> +    description: Display output node to DSI.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    display@20930000 {
>> +        compatible = "intel,keembay-display";
>> +        reg = <0x20930000 0x3000>,
>> +              <0x20910000 0x30>;
>> +        reg-names = "lcd", "msscam";
>> +        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&scmi_clk 0x83>,
>> +                 <&scmi_clk 0x0>;
>> +        clock-names = "clk_lcd", "clk_pll0";
>> +
>> +        port {
>> +            disp_out: endpoint {
>> +                remote-endpoint = <&dsi_in>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.7.4
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
