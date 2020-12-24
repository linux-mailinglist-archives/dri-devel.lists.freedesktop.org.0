Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6F2E2B07
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030BC89C6A;
	Fri, 25 Dec 2020 09:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5CFF89FBC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 07:27:00 +0000 (UTC)
X-UUID: dda500f35131466e85b4d15b9edbda0e-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sTA9GxzeiTWZ8Bb1AzVPoBBRf2w9jvzoOgYWkMxjLWk=; 
 b=V2m93C+mJ/lNd3Kma1Ao953qg0XQpgYHzo7sEzco8QIUdo4XBSjRucU+4Q6UKU1T2CXaedQlkUs7LjMxZun8AMXOhfnHclupAxOKzuEeegkiYz+9YfmCnib3bR2fWKdOlQCHft5o2499PfbTT/WdYuCjZv8C0WiC3NEK8r2gzdI=;
X-UUID: dda500f35131466e85b4d15b9edbda0e-20201224
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 268527532; Thu, 24 Dec 2020 15:26:42 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Dec 2020 15:26:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 15:26:38 +0800
Message-ID: <1608794799.7499.2.camel@mhfsdcap03>
Subject: Re: [PATCH v4 01/11] dt-bindings: usb: convert usb-device.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 24 Dec 2020 15:26:39 +0800
In-Reply-To: <20201221190937.GA369845@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201221190937.GA369845@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 74766EA34054B7FEA51C94AAD0ECCBCC07057C7F26AB70431A5FC6B4C07CE5A72000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-21 at 12:09 -0700, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 05:30:02PM +0800, Chunfeng Yun wrote:
> > Convert usb-device.txt to YAML schema usb-device.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4: no changes, update dependent series:
> >     https://patchwork.kernel.org/project/linux-usb/list/?series=399561
> >     [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
[...]
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > new file mode 100644
> > index 000000000000..f31d8a85d3e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/usb-device.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: The device tree bindings for the Generic USB Device
> > +
> > +maintainers:
> > +  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > +
> > +description: |
> > +  Usually, we only use device tree for hard wired USB device.
> > +  The reference binding doc is from:
> > +  http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
> > +
> > +  Four types of device-tree nodes are defined: "host-controller nodes"
> > +  representing USB host controllers, "device nodes" representing USB devices,
> > +  "interface nodes" representing USB interfaces and "combined nodes"
> > +  representing simple USB devices.
> > +
> > +  A combined node shall be used instead of a device node and an interface node
> > +  for devices of class 0 or 9 (hub) with a single configuration and a single
> > +  interface.
> > +
> > +  A "hub node" is a combined node or an interface node that represents a USB
> > +  hub.
> > +
> > +properties:
> > +  compatible:
> > +    pattern: "^usb[0-9a-f]+,[0-9a-f]+$"
> 
> You can refine the length allowed a bit: [0-9a-f]{1,4}
> 
> Same applies elsewhere.
Ok
> 
> > +    description: Device nodes or combined nodes.
> > +      "usbVID,PID", where VID is the vendor id and PID the product id.
> > +      The textual representation of VID and PID shall be in lower case
> > +      hexadecimal with leading zeroes suppressed. The other compatible
> > +      strings from the above standard binding could also be used,
> > +      but a device adhering to this binding may leave out all except
> > +      for "usbVID,PID".
> > +
[...]
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > index 9881ac10380d..5d0c6b5500d6 100755
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -23,6 +23,32 @@ properties:
> >        targeted hosts (non-PC hosts).
> >      type: boolean
> >  
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "@[0-9a-f]+$":
> > +    type: object
> > +    description: The hard wired USB devices
> > +
> > +    properties:
> > +      compatible:
> > +        pattern: "^usb[0-9a-f]+,[0-9a-f]+$"
> > +        $ref: /usb/usb-device.yaml
> 
> This is wrong. It should be up a level.
Ok
>  And no need to define 
> 'compatible' or 'reg' here because those are defined within 
> usb-device.yaml.
will drop it
> 
> > +        description: the string is 'usbVID,PID', where VID is the vendor id
> > +          and PID is the product id
> > +
> > +      reg:
> > +        $ref: /usb/usb-device.yaml
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +
> >  additionalProperties: true
> >  
> >  examples:
> > @@ -30,4 +56,11 @@ examples:
> >      usb {
> >          phys = <&usb2_phy1>, <&usb3_phy1>;
> >          phy-names = "usb";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        hub@1 {
> > +            compatible = "usb5e3,610";
> > +            reg = <1>;
> > +        };
> >      };
> > -- 
> > 2.18.0
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
