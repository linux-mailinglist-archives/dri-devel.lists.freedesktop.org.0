Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B105E4E98E5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2630110E653;
	Mon, 28 Mar 2022 14:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E995F10E6DE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:04:53 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id v75so15708606oie.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wjlC7VI8VSHn4u2U3bNT+2Bp82GXz7t+fQc3WvVU2pE=;
 b=P/O0w4rA/03WmvmdqdEnF4b9q8WhVBrDNmEqBzBtkoA9sukxAP7uzgY7yC5zjVVErU
 NPf9qS2Os5ev0ShbfeoKzI/NI2iVojf+/dSwp5BAH+xTbXJg7fwZmk8neyg0DYrip8kK
 yql+XgBjMERLfJbu8k6+2r103he3qG/QFqUl7KN8wgbPUeUIIGZheAF1oDnw1s5SRJiy
 vVCunG/9qe/GqHgmRD6qqGQ/V10sZ2W7lm9qNCkaNvxgrHhvILnMhmiWWUqRxMobtqXQ
 w9DtlUgQhK5XbX+nB1udtpK/MiBJn1RX7FcOAWwAQ1XD5IJ4jtVzupFiyj8pPh7Oe/ye
 1Pqg==
X-Gm-Message-State: AOAM531sKxVTDa2bB9vHdfuaREMgkU6YZDvnx0mvqK28TbbPUjAZVlFg
 toaOCjRpUMKcIduYJvJwfg==
X-Google-Smtp-Source: ABdhPJyQCpjBt0qShQxXAXo4lmM2Fg8t6lv7Wyal0l065pNkwsGOBGi1w4bgmTgk2R5t9wJiw6//Jg==
X-Received: by 2002:a05:6808:1115:b0:2ec:e103:99c8 with SMTP id
 e21-20020a056808111500b002ece10399c8mr11738255oih.194.1648476292958; 
 Mon, 28 Mar 2022 07:04:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ej35-20020a056870f72300b000d75f1d9b8asm6453003oab.55.2022.03.28.07.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:04:51 -0700 (PDT)
Received: (nullmailer pid 2275748 invoked by uid 1000);
 Mon, 28 Mar 2022 14:04:50 -0000
Date: Mon, 28 Mar 2022 09:04:50 -0500
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v11 5/7] dt-bindings: display: Add Loongson display
 controller
Message-ID: <YkHAgkGvsWQ+2Gbh@robh.at.kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-6-15330273260@189.cn>
 <YjkITWpbnCmhKaX+@robh.at.kernel.org>
 <f7eb61bc-6784-c77a-083f-7408c0a17e05@189.cn>
 <Yjo3umi9bJ0xb2Gl@robh.at.kernel.org>
 <199a2869-cd83-d24e-0ad0-25d15d76fc13@189.cn>
 <YjsamuFslv6qlQMZ@robh.at.kernel.org>
 <ac75aeff-1fca-f46f-1043-8437ef845ff9@189.cn>
 <YjxxhNnmqteTIEOa@robh.at.kernel.org>
 <165597c7-3ac3-9d32-a70f-95214b242e0b@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <165597c7-3ac3-9d32-a70f-95214b242e0b@189.cn>
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
Cc: devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mips@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 26, 2022 at 06:04:46PM +0800, Sui Jingfeng wrote:
> 
> On 2022/3/24 21:26, Rob Herring wrote:
> > On Thu, Mar 24, 2022 at 09:48:19AM +0800, Sui Jingfeng wrote:
> > > On 2022/3/23 21:03, Rob Herring wrote:
> > > > On Wed, Mar 23, 2022 at 11:38:55AM +0800, Sui Jingfeng wrote:
> > > > > On 2022/3/23 04:55, Rob Herring wrote:
> > > > > > On Tue, Mar 22, 2022 at 10:33:45AM +0800, Sui Jingfeng wrote:
> > > > > > > On 2022/3/22 07:20, Rob Herring wrote:
> > > > > > > > On Tue, Mar 22, 2022 at 12:29:14AM +0800, Sui Jingfeng wrote:
> > > > > > > > > From: suijingfeng <suijingfeng@loongson.cn>
> > > > > > > > > 
> > > > > > > > Needs a commit message.
> > > > > > > > 
> > > > > > > > > Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> > > > > > > > > Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> > > > > > > > Same person? Don't need both emails.
> > > > > > > Yes,  suijingfeng@loongson.cn is my company's email. But it can not be used
> > > > > > > to send patches to dri-devel,
> > > > > > > 
> > > > > > > when send patches with this email, the patch will not be shown on patch
> > > > > > > works.
> > > > > > > 
> > > > > > > Emails  are either blocked or got  rejected  by loongson's mail server.  It
> > > > > > > can only receive emails
> > > > > > > 
> > > > > > > from you and other people, but not dri-devel. so have to use my personal
> > > > > > > email(15330273260@189.cn) to send patches.
> > > > > > > 
> > > > > > > > > ---
> > > > > > > > >      .../loongson/loongson,display-controller.yaml | 230 ++++++++++++++++++
> > > > > > > > >      1 file changed, 230 insertions(+)
> > > > > > > > >      create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> > > > > > > > > 
> > > > > > > > > diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000000..7be63346289e
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> > > > > > > > > @@ -0,0 +1,230 @@
> > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > > +%YAML 1.2
> > > > > > > > > +---
> > > > > > > > > +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
> > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > +
> > > > > > > > > +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
> > > > > > > > > +
> > > > > > > > > +maintainers:
> > > > > > > > > +  - Sui Jingfeng <suijingfeng@loongson.cn>
> > > > > > > > > +
> > > > > > > > > +description: |+
> > > > > > > > > +
> > > > > > > > > +  Loongson display controllers are simple which require scanout buffers
> > > > > > > > > +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
> > > > > > > > > +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
> > > > > > > > > +  with a dedicated video RAM which is 64MB or more, precise size can be
> > > > > > > > > +  read from the PCI BAR 2 of the GPU device(0x0014:0x7A15) in the bridge
> > > > > > > > > +  chip.
> > > > > > > > > +
> > > > > > > > > +  LSDC has two display pipes, each way has a DVO interface which provide
> > > > > > > > > +  RGB888 signals, vertical & horizontal synchronisations, data enable and
> > > > > > > > > +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
> > > > > > > > > +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
> > > > > > > > > +
> > > > > > > > > +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
> > > > > > > > > +  located at the DC register space. They are used to emulate two way i2c,
> > > > > > > > > +  One for DVO0, another for DVO1.
> > > > > > > > > +
> > > > > > > > > +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
> > > > > > > > > +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
> > > > > > > > > +
> > > > > > > > > +  LSDC's display pipeline have several components as below description,
> > > > > > > > > +
> > > > > > > > > +  The display controller in LS7A1000:
> > > > > > > > > +     ___________________                                     _________
> > > > > > > > > +    |            -------|                                   |         |
> > > > > > > > > +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> > > > > > > > > +    |  _   _     -------|        ^             ^            |_________|
> > > > > > > > > +    | | | | |    -------|        |             |
> > > > > > > > > +    | |_| |_|    | i2c0 <--------+-------------+
> > > > > > > > > +    |            -------|
> > > > > > > > > +    |   DC IN LS7A1000  |
> > > > > > > > > +    |  _   _     -------|
> > > > > > > > > +    | | | | |    | i2c1 <--------+-------------+
> > > > > > > > > +    | |_| |_|    -------|        |             |             _________
> > > > > > > > > +    |            -------|        |             |            |         |
> > > > > > > > > +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> > > > > > > > > +    |            -------|                                   |_________|
> > > > > > > > > +    |___________________|
> > > > > > > > > +
> > > > > > > > > +  Simple usage of LS7A1000 with LS3A4000 CPU:
> > > > > > > > > +
> > > > > > > > > +    +------+            +-----------------------------------+
> > > > > > > > > +    | DDR4 |            |  +-------------------+            |
> > > > > > > > > +    +------+            |  | PCIe Root complex |   LS7A1000 |
> > > > > > > > > +       || MC0           |  +--++---------++----+            |
> > > > > > > > > +  +----------+  HT 3.0  |     ||         ||                 |
> > > > > > > > > +  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
> > > > > > > > > +  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
> > > > > > > > > +  +----------+          | +--------+  +-+--+-+    +---------+   +------+
> > > > > > > > > +       || MC1           +---------------|--|----------------+
> > > > > > > > > +    +------+                            |  |
> > > > > > > > > +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
> > > > > > > > > +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
> > > > > > > > > +                      +-------+                      +------+
> > > > > > > > > +
> > > > > > > > > +  The display controller in LS2K1000/LS2K0500:
> > > > > > > > > +     ___________________                                     _________
> > > > > > > > > +    |            -------|                                   |         |
> > > > > > > > > +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> > > > > > > > > +    |  _   _     -------|        ^              ^           |_________|
> > > > > > > > > +    | | | | |           |        |              |
> > > > > > > > > +    | |_| |_|           |     +------+          |
> > > > > > > > > +    |                   <---->| i2c0 |<---------+
> > > > > > > > > +    |   DC IN LS2K1000  |     +------+
> > > > > > > > > +    |  _   _            |     +------+
> > > > > > > > > +    | | | | |           <---->| i2c1 |----------+
> > > > > > > > > +    | |_| |_|           |     +------+          |            _________
> > > > > > > > > +    |            -------|        |              |           |         |
> > > > > > > > > +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> > > > > > > > > +    |            -------|                                   |_________|
> > > > > > > > > +    |___________________|
> > > > > > > > > +
> > > > > > > > > +properties:
> > > > > > > > > +  $nodename:
> > > > > > > > > +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
> > > > > > > > > +
> > > > > > > > > +  compatible:
> > > > > > > > > +    oneOf:
> > > > > > > > > +      - items:
> > > > > > > > > +          - enum:
> > > > > > > > > +              - loongson,ls7a1000-dc
> > > > > > > > > +              - loongson,ls2k1000-dc
> > > > > > > > > +              - loongson,ls2k0500-dc
> > > > > > > > > +
> > > > > > > > > +  reg:
> > > > > > > > > +    maxItems: 1
> > > > > > > > > +
> > > > > > > > > +  interrupts:
> > > > > > > > > +    maxItems: 1
> > > > > > > > > +
> > > > > > > > > +  '#address-cells':
> > > > > > > > > +    const: 1
> > > > > > > > > +
> > > > > > > > > +  '#size-cells':
> > > > > > > > > +    const: 0
> > > > > > > > > +
> > > > > > > > > +  i2c-gpio@0:
> > > > > > > > > +    description: |
> > > > > > > > > +      Built-in GPIO emulate i2c exported for external display bridge
> > > > > > > > If you have i2c-gpio, that belongs at the DT top-level, not here.
> > > > > > > > 
> > > > > > > > > +      configuration, onitor detection and edid read back etc, for ls7a1000
> > > > > > > > > +      only. Its compatible must be lsdc,i2c-gpio-0. The reg property can be
> > > > > > > > No, there's a defined i2c-gpio compatible already.
> > > > > > > This is different from the i2c-gpio already defined under drivers/i2c/busses/i2c-gpio.c,
> > > > > > > By design, my i2c-gpio is vendor specific properties, lsdc device driver create the i2c
> > > > > > > adapter at runtime. These are 4 dedicated GPIOs whose control register is located at the
> > > > > > > LSDC register space, not general purpose GPIOs with separate control register resource.
> > > > > > > So i think it is the child node of display-controller@6,1, it belongs to LSDC.
> > > > > > > It seems that put it at the DT top-level break the hierarchy and relationship.
> > > > > > Okay, I see. Then just 'i2c' for the node names. You need a reference to
> > > > > > i2c-controller.yaml for these nodes too.
> > > > > > 
> > > > > > The compatible should not have an index in it.
> > > > > OK, i will fix this at the next version. thanks.
> > > > > > > > > +      used to specify a I2c adapter bus number, if you don't specify one
> > > > > > > > > +      i2c driver core will dynamically assign a bus number. Please specify
> > > > > > > > Bus numbers are a linux detail not relevant to DT binding.
> > > > > > > > 
> > > > > > > > > +      it only when its bus number matters. Bus number greater than 6 is safe
> > > > > > > > > +      because ls7a1000 bridge have 6 hardware I2C controller integrated.
> > > > > > > > > +
> > > > > > > > > +  i2c-gpio@1:
> > > > > > > > > +    description: |
> > > > > > > > > +      Built-in GPIO emulate i2c exported for external display bridge
> > > > > > > > > +      configuration, onitor detection and edid read back etc, for ls7a1000
> > > > > > > > > +      only. Its compatible must be lsdc,i2c-gpio-1.
> > > > > > > > > +
> > > > > > > > > +  ports:
> > > > > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > > > +
> > > > > > > > > +    properties:
> > > > > > > > > +      port@0:
> > > > > > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > > > > +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
> > > > > > > > > +
> > > > > > > > > +      port@1:
> > > > > > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > > > > +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
> > > > > > > > > +
> > > > > > > > > +    required:
> > > > > > > > > +      - port@0
> > > > > > > > > +      - port@1
> > > > > > > > > +
> > > > > > > > > +required:
> > > > > > > > > +  - compatible
> > > > > > > > > +  - reg
> > > > > > > > > +  - interrupts
> > > > > > > > > +  - ports
> > > > > > > > > +
> > > > > > > > > +additionalProperties: false
> > > > > > > > > +
> > > > > > > > > +examples:
> > > > > > > > > +  - |
> > > > > > > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > > > > > > +    bus {
> > > > > > > > > +
> > > > > > > > > +        #address-cells = <3>;
> > > > > > > > > +        #size-cells = <2>;
> > > > > > > > > +        #interrupt-cells = <2>;
> > > > > > > > > +
> > > > > > > > > +        display-controller@6,1 {
> > > > > > > > > +            compatible = "loongson,ls7a1000-dc";
> > > > > > > > > +            reg = <0x3100 0x0 0x0 0x0 0x0>;
> > > > > > > > > +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > > +
> > > > > > > > > +            #address-cells = <1>;
> > > > > > > > > +            #size-cells = <0>;
> > > > > > > > > +
> > > > > > > > > +            i2c-gpio@0 {
> > > > > > > > > +                compatible = "lsdc,i2c-gpio-0";
> > > > > > > > > +                reg = <6>;
> > > > > > 'reg' needs to be documented with some description of what 6 and 7
> > > > > > represent. If they are the control register offset, then make the
> > > > > > address translatable (use 'ranges' and define the size).
> > > > > By design, the reg property is used to specify a I2c adapter bus number,
> > > > > if we don't specify one, i2c driver core will dynamically assign a bus number.
> > > > > then the nr of the i2c adapter will started from 0. I want is start from 6
> > > > > to avoid potential conflict feature hardware I2C driver.
> > > > > 
> > > > > Because LS7A1000 bridge chip have 6 hardware I2C controller integrated,
> > > > > but its driver is not up-streamed yet. By default these hardware I2C controller's
> > > > > nr is started from 0.
> > > > Linux's numbering doesn't belong in DT. So no, you can't use 'reg' in
> > > > that way.
> > > Then,  can i use something like lsdc,nr = <6> ?
> > > > > Even through i2c driver core can dynamically generate a number, i still want it
> > > > > to be fixed and keep consistent and explicit. That is, i2c6 is for display pipe 0,
> > > > > i2c7 is for display pipe 1. This follow the convention and flexible enough.
> > > > You may want that, but that is not how the kernel works. Specific
> > > > numbers are not guaranteed. I'm sure you've seen this for disks, network
> > > > interfaces, etc.
> > > > 
> > > > Rob
> > > 2c_bit_add_numbered_bus() will guarantee it for you as long as If no devices
> > > have pre-been declared for this bus.
> > > 
> > > you can read the comment of 2c_bit_add_numbered_bus() at
> > > drivers/i2c/i2c-core-base.c
> > I didn't say it wasn't possible. It is not best practice. Grep
> > i2c_bit_add_numbered_bus and see how many users there are.
> 
> i2c-gpio.c at drivers/i2c/busses/ just do the same thing.

No, the id for i2c-gpio nodes (any DT node without 'reg') will be -1 
which means dynamically assigned.


> + nvidia,bpmp-bus-id: + $ref: /schemas/types.yaml#/definitions/uint32 +
> description: Indicates the I2C bus number this DT node represents, + as
> defined by the BPMP firmware.

The key difference is the numbering is defined by the BPMP firmware.


> > Even if the kernel allows specifying bus numbers,your Linux bus numbers don't
> > belong in DT.
> 
> Again, Does does devicetree specification prohibit this?

No. The spec is not the last word on what's allowed or not. Lots of 
patterns exist already which we can't change, but that doesn't mean they 
should be copied by new users.

Rob
