Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341A4C0510
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 00:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6848910E81D;
	Tue, 22 Feb 2022 23:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D45910E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 23:02:37 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id j24so14123288oii.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 15:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d6NMNgjpMH0rJqe9W2px91jdR184ky7Ff9IefMqODMA=;
 b=m8pNn8/ptWfp4PzH5zYcdcBN1GXSF5U18VkxgNgM2PyAL8Fkscc0RdDE/mMn4KiXvn
 +SawJ0ia8I33PDk0jrYtJq5LgiXHntaroyW97AtZ96UXLvf7GwATbJv8s0UpsHIiR4ab
 bu3oS7UnDzKFCRz9nQTJ2nh8yd+r5146zjt6mpJX1lNE27W3kfNreKEzZtDMrDmAyEOv
 WBXwTyDhMHU6ZRxmvf4VyL0GM7j2jgIJtLPhqWZstusyqijJFMcpmftKea/zMHbCM67/
 84lKdrODBePfpUbi5nkb6kEEk//D8sDQiEm3ojacac/ZKVx6uULcJEHmcfMFvgpDdEu6
 W0UQ==
X-Gm-Message-State: AOAM530yMmP+GeuLiL3s6XkDsFQVEnZqXFoWUREndWRtHLbWzCtWWNeW
 xzbVqdVxoVVdXiwT0FY7QA==
X-Google-Smtp-Source: ABdhPJyJ30kZqNC1ZDZBZMmAjEJgXkLFmJ3LtezCgaHxYtAREtjokF4HlGFTwewJeEPi/yZQK0XFEQ==
X-Received: by 2002:aca:502:0:b0:2cd:c24:278f with SMTP id
 2-20020aca0502000000b002cd0c24278fmr3103957oif.150.1645570956534; 
 Tue, 22 Feb 2022 15:02:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s27sm2738598oiw.38.2022.02.22.15.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 15:02:35 -0800 (PST)
Received: (nullmailer pid 3759205 invoked by uid 1000);
 Tue, 22 Feb 2022 23:02:34 -0000
Date: Tue, 22 Feb 2022 17:02:34 -0600
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v10 2/4] Documentation/dt: Add descriptions for loongson
 display controller
Message-ID: <YhVrigEnXTiNgk67@robh.at.kernel.org>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-3-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220220145554.117854-3-15330273260@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 20, 2022 at 10:55:52PM +0800, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>

Follow the conventions of the subsystem for patch subjects. It should be 
evident with 'git log --oneline Documentation/devicetree/bindings/display'.

Something like this:

dt-bindings: display: Add Loongson display controller

> 
> Add DT documentation for loongson display controller found in LS2K1000,
> LS2K0500 and LS7A1000.
> 
> v2: DT binding docs and includes should be a separate patch,
>     fix a warnning because of that.
> 
> v3: split dt-bindings from other changes into a separate patch.
> 
> v4: fix warnings and errors when running make dt_binding_check

What happened in versions 5-10? You've sent 10 versions in 3 weeks. 
That's not a rate that gives people time to review. Also, it looks like 
all the changes you've made are either documented things to do or not do 
or are errors the tools (checkpatch.pl, 'make dt_binding_check') will 
tell you to fix. 

>
> Reported-by: Rob Herring <robh@kernel.org>
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>

What did we report? That's generally for fixes.

> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  .../loongson/loongson,display-controller.yaml | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> new file mode 100644
> index 000000000000..ee1a59b91943
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
> +
> +maintainers:
> +  - Sui Jingfeng <suijingfeng@loongson.cn>
> +
> +description: |+
> +
> +  Loongson display controllers are simple which require scanout buffers
> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
> +  with a dedicated video ram which is 64MB or more.
> +
> +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
> +  located at the DC register space. They are used to emulate two way i2c,
> +  One for DVO0, another for DVO1.
> +
> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
> +
> +  LSDC has two display pipes, each way has a DVO interface which provide
> +  RGB888 signals, vertical & horizontal synchronisations, data enable and
> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
> +
> +  LSDC's display pipeline have several components as below description,
> +
> +  The display controller in LS7A1000:
> +    ___________________                                     _________
> +    |            -------|                                   |         |
> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> +    |  _   _     -------|        ^             ^            |_________|
> +    | | | | |    -------|        |             |
> +    | |_| |_|    | i2c0 <--------+-------------+
> +    |            -------|
> +    |   DC IN LS7A1000  |
> +    |  _   _     -------|
> +    | | | | |    | i2c1 <--------+-------------+
> +    | |_| |_|    -------|        |             |             _________
> +    |            -------|        |             |            |         |
> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> +    |            -------|                                   |_________|
> +    |___________________|
> +
> +  Simple usage of LS7A1000 with LS3A4000 CPU:
> +
> +    +------+            +-----------------------------------+
> +    | DDR4 |            |  +-------------------+            |
> +    +------+            |  | PCIe Root complex |   LS7A1000 |
> +       || MC0           |  +--++---------++----+            |
> +  +----------+  HT 3.0  |     ||         ||                 |
> +  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
> +  +----------+          | +--------+  +-+--+-+    +---------+   +------+

How do you know how much VRAM you have? That's going to need a binding 
for the VRAM.

> +       || MC1           +---------------|--|----------------+
> +    +------+                            |  |
> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
> +                      +-------+                      +------+
> +
> +  The display controller in LS2K1000/LS2K0500:
> +     ___________________                                     _________
> +    |            -------|                                   |         |
> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> +    |  _   _     -------|        ^              ^           |_________|
> +    | | | | |           |        |              |
> +    | |_| |_|           |     +------+          |
> +    |                   <---->| i2c0 |<---------+
> +    |   DC IN LS2K1000  |     +------+
> +    |  _   _            |     +------+
> +    | | | | |           <---->| i2c1 |----------+
> +    | |_| |_|           |     +------+          |            _________
> +    |            -------|        |              |           |         |
> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> +    |            -------|                                   |_________|
> +    |___________________|
> +
> +properties:
> +  $nodename:
> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
> +
> +  compatible:
> +    enum:
> +      - loongson,ls7a1000-dc
> +      - loongson,ls2k1000-dc
> +      - loongson,ls2k0500-dc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    bus {
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        #interrupt-cells = <2>;
> +
> +        lsdc: display-controller@6,1 {
> +            compatible = "loongson,ls7a1000-dc";
> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-parent = <&pic>;

Don't need 'interrupt-parent' in examples.

This certainly looks incomplete given you have 2 outputs you are going 
to need to describe what's connected to them.

> +        };
> +    };
> +...
> -- 
> 2.25.1
> 
> 
