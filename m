Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD618AA33
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 02:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730D26E1F3;
	Thu, 19 Mar 2020 01:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A206E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 01:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A28l2aEPMYu0JVQmB/s0IlAnIWXnwHwN0Zfpu/+nF9JAdRe2BeDG8dtTjqlLh2oPVN13uUJOPtUcLh2RhZPMEpgkj42gKhWH6lltLmBNrqxVXltXoCZ2JUxm1KLq2XcNE2AowSytj5zXafBVA4gWLBuySoTRUZGArbnn03yz6nw22amd7wg1TBe349F8g2zrCkw77NO5bkWHXXP/m+lWl8oVWYf5zcFIBqWiXh5TDG2dVSCN3n6iobGVHl8EUdFcPDEDMzjUB4XjeBnQWv+d4PC/m03nuKOIb/2Ut2+BPfm+WHpcI0ji8Ch1IHaZrpfu7JfEHso3CB+eCkRuMaZo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+4ootp+aQn3199URbXm9ofeRsOvwhQ5KSP1EzlolKk=;
 b=UDBMtWgBxKNeGzbr/vifVJ5wUEfFgyo/ctTUCsl10edT4Apo1gR8DeoFaSnezxKViKZfr9M4zXzFtsOeaNNOGy7KE1BFs2S7yBahldU83OPqjCuwlHjUZxlIHj7HwxKGb223qbPtN19fXn/M6g9EQGwehlX0sdmnBf0cIArN60Ahj0eEzXiqs2rmDTGhGP4PCBbtP1mMISI3n2/QVeZLaUxHGn69nAp5i2jK26LjJ/dM15vDP9Z4FdIWUS5b1iPJzas3G+nIH0SCKeKT1qSi6/ctEwKiNP2ebM7xGAUakap2YdQ0Qj5yH8kqN927d8SF0B5nZ9+TurZBPgDcLV/W6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+4ootp+aQn3199URbXm9ofeRsOvwhQ5KSP1EzlolKk=;
 b=Nqbx9CdSGS57BygZa9RKEmi1/6W8pm009ayOYVsNl8UAiqamHiKflixaDqyzgNYRh1fDhwfl2rUzCdot+wly5RRwK5IJn+dsyPSxNnOIpq/qyvltFuzRiZar8RVTqgFdepMfXiwYZ1z0JTTjsm4tCPplBt/S7tB3OsWM9qx6YwI=
Received: from SN6PR04CA0102.namprd04.prod.outlook.com (2603:10b6:805:f2::43)
 by BN6PR02MB2500.namprd02.prod.outlook.com (2603:10b6:404:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Thu, 19 Mar
 2020 01:09:08 +0000
Received: from SN1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::74) by SN6PR04CA0102.outlook.office365.com
 (2603:10b6:805:f2::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend
 Transport; Thu, 19 Mar 2020 01:09:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT020.mail.protection.outlook.com (10.152.72.139) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2814.13
 via Frontend Transport; Thu, 19 Mar 2020 01:09:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jEjgJ-0002ln-9V; Wed, 18 Mar 2020 18:09:07 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jEjgE-00081b-6V; Wed, 18 Mar 2020 18:09:02 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02J18wYN020815; 
 Wed, 18 Mar 2020 18:08:58 -0700
Received: from [172.19.2.244] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jEjgA-00080x-0d; Wed, 18 Mar 2020 18:08:58 -0700
Date: Wed, 18 Mar 2020 18:08:57 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v11 1/5] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
Message-ID: <20200319010857.GC27556@smtp.xilinx.com>
References: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
 <20200318153728.25843-2-laurent.pinchart@ideasonboard.com>
 <20200318192651.GA28612@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318192651.GA28612@ravnborg.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(199004)(46966005)(70206006)(70586007)(33656002)(44832011)(54906003)(186003)(426003)(336012)(356004)(966005)(81156014)(316002)(81166006)(47076004)(8676002)(26005)(8936002)(478600001)(4326008)(9786002)(107886003)(1076003)(2906002)(5660300002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2500; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4ad9ff-b8fb-4488-1052-08d7cba22004
X-MS-TrafficTypeDiagnostic: BN6PR02MB2500:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2500579B43EAD553FB043C54D6F40@BN6PR02MB2500.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0347410860
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VUN3eTWjiHsaEMJFXNy34wn1TIi5YNScRIzDYFBv6AJp9/KaH16jCbq0vmku4hIt4W7qwO+ryq1pGU90jLSctUusp7xw9jT3nYpfI4XvtjN8ULSp85dy2Anh55l6IEun7XBKhJNGVk+YD05h6CU6kCSqwYAk3386uLNtQY331p5p0lXhNBhgyxwa8ps+DHgIfJSglQerv3Cs0OvcmOxDdeRvkawcgS4GXInJW2ZqzJx7hcBY8KsFETclTr6DaO7R4gfTLSHIRbG/gBsAjZdYX0FHlMmp5aAm43VkGpG0nzJ1CL4A8ejl0JuttqpCs7AhcDvfPFl+feIsKix+VrJvCT0XC64luG3p6jHwUBvC0H6yw1uwKispFdi310Efa5mKB5unmsKJESAStRufNx7pKFrnXIwDfLdlXo0p8kdtBg+5vfg7uEDCWuJP/IYYTSvvQZ4Vlc0DPhPcQj9/WcddmkBzhBORWeQ5ea1zHZWt6MhIWIEGAwN2saH05Grirt3HQndHE3q+wfwwGoLulKe0q4g+Uweul586GwhaR3aNNGhxCTe1xZGY/kWUoGh87LSc/XvQRqRvOCZdUbnW9piD9Q==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 01:09:07.6670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4ad9ff-b8fb-4488-1052-08d7cba22004
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2500
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Simek <michals@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Wed, 2020-03-18 at 12:26:51 -0700, Sam Ravnborg wrote:
> On Wed, Mar 18, 2020 at 05:37:24PM +0200, Laurent Pinchart wrote:
> > From: Hyun Kwon <hyun.kwon@xilinx.com>
> > 
> > The bindings describe the ZynqMP DP subsystem. They don't support the
> > interface with the programmable logic (FPGA) or audio yet.
> > 
> > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Bikeshedding - examples with indent on 4 spaces to make them easier to
> read.
> 
> Would it be possible to make this binding: (GPL-2.0-only OR BSD-2-Clause)
> This is preferred for new bindings.
> In this case asking Hyun Kwon should be enough?

It should be possible. But to be safer and if needed, I need to check with
corperate policy before I can confirm.

Michal, have you already checked about adding 'OR BSD-2-Clause'? or should I
take it up to Xilinx legal?

Thanks,
-hyun

> 
> With or without the suggestions above:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 
> > ---
> > Changes since v10:
> > 
> > - Update example to new PHY DT bindings without subnodes
> > - Add resets property
> > 
> > Changes since v9:
> > 
> > - Fix constraints on clock-names
> > - Document dp_apb_clk as the APB clock, not the AXI clock
> > 
> > Changes since v8:
> > 
> > - Convert to yaml
> > - Rename aclk to dp_apb_clk
> > ---
> >  .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 174 ++++++++++++++++++
> >  1 file changed, 174 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > new file mode 100644
> > index 000000000000..05e6a14de75c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > @@ -0,0 +1,174 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Xilinx ZynqMP DisplayPort Subsystem
> > +
> > +description: |
> > +  The DisplayPort subsystem of Xilinx ZynqMP (Zynq UltraScale+ MPSoC)
> > +  implements the display and audio pipelines based on the DisplayPort v1.2
> > +  standard. The subsystem includes multiple functional blocks as below:
> > +
> > +               +------------------------------------------------------------+
> > +  +--------+   | +----------------+     +-----------+                       |
> > +  | DPDMA  | --->|                | --> |   Video   | Video +-------------+ |
> > +  | 4x vid |   | |                |     | Rendering | -+--> |             | |   +------+
> > +  | 2x aud |   | |  Audio/Video   | --> | Pipeline  |  |    | DisplayPort |---> | PHY0 |
> > +  +--------+   | | Buffer Manager |     +-----------+  |    |   Source    | |   +------+
> > +               | |    and STC     |     +-----------+  |    | Controller  | |   +------+
> > +  Live Video --->|                | --> |   Audio   | Audio |             |---> | PHY1 |
> > +               | |                |     |   Mixer   | --+-> |             | |   +------+
> > +  Live Audio --->|                | --> |           |  ||   +-------------+ |
> > +               | +----------------+     +-----------+  ||                   |
> > +               +---------------------------------------||-------------------+
> > +                                                       vv
> > +                                                 Blended Video and
> > +                                                 Mixed Audio to PL
> > +
> > +  The Buffer Manager interacts with external interface such as DMA engines or
> > +  live audio/video streams from the programmable logic. The Video Rendering
> > +  Pipeline blends the video and graphics layers and performs colorspace
> > +  conversion. The Audio Mixer mixes the incoming audio streams. The DisplayPort
> > +  Source Controller handles the DisplayPort protocol and connects to external
> > +  PHYs.
> > +
> > +  The subsystem supports 2 video and 2 audio streams, and various pixel formats
> > +  and depths up to 4K@30 resolution.
> > +
> > +  Please refer to "Zynq UltraScale+ Device Technical Reference Manual"
> > +  (https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf)
> > +  for more details.
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: xlnx,zynqmp-dpsub-1.7
> > +
> > +  reg:
> > +    maxItems: 4
> > +  reg-names:
> > +    items:
> > +      - const: dp
> > +      - const: blend
> > +      - const: av_buf
> > +      - const: aud
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      The APB clock and at least one video clock are mandatory, the audio clock
> > +      is optional.
> > +    minItems: 2
> > +    maxItems: 4
> > +    items:
> > +      - description: dp_apb_clk is the APB clock
> > +      - description: dp_aud_clk is the Audio clock
> > +      - description:
> > +          dp_vtc_pixel_clk_in is the non-live video clock (from Processing
> > +          System)
> > +      - description:
> > +          dp_live_video_in_clk is the live video clock (from Programmable
> > +          Logic)
> > +  clock-names:
> > +    oneOf:
> > +      - minItems: 2
> > +        maxItems: 3
> > +        items:
> > +          - const: dp_apb_clk
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +      - minItems: 3
> > +        maxItems: 4
> > +        items:
> > +          - const: dp_apb_clk
> > +          - const: dp_aud_clk
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 4
> > +    items:
> > +      - description: Video layer, plane 0 (RGB or luma)
> > +      - description: Video layer, plane 1 (U/V or U)
> > +      - description: Video layer, plane 2 (V)
> > +      - description: Graphics layer
> > +  dma-names:
> > +    items:
> > +      - const: vid0
> > +      - const: vid1
> > +      - const: vid2
> > +      - const: gfx0
> > +
> > +  phys:
> > +    description: PHYs for the DP data lanes
> > +    minItems: 1
> > +    maxItems: 2
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - const: dp-phy0
> > +      - const: dp-phy1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - dmas
> > +  - dma-names
> > +  - phys
> > +  - phy-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
> > +
> > +    display@fd4a0000 {
> > +      compatible = "xlnx,zynqmp-dpsub-1.7";
> > +      reg = <0x0 0xfd4a0000 0x0 0x1000>,
> > +            <0x0 0xfd4aa000 0x0 0x1000>,
> > +            <0x0 0xfd4ab000 0x0 0x1000>,
> > +            <0x0 0xfd4ac000 0x0 0x1000>;
> > +      reg-names = "dp", "blend", "av_buf", "aud";
> > +      interrupts = <0 119 4>;
> > +      interrupt-parent = <&gic>;
> > +
> > +      clock-names = "dp_apb_clk", "dp_aud_clk", "dp_live_video_in_clk";
> > +      clocks = <&dp_aclk>, <&clkc 17>, <&si570_1>;
> > +
> > +      power-domains = <&pd_dp>;
> > +      resets = <&reset ZYNQMP_RESET_DP>;
> > +
> > +      dma-names = "vid0", "vid1", "vid2", "gfx0";
> > +      dmas = <&xlnx_dpdma 0>,
> > +             <&xlnx_dpdma 1>,
> > +             <&xlnx_dpdma 2>,
> > +             <&xlnx_dpdma 3>;
> > +
> > +      phys = <&psgtr 1 PHY_TYPE_DP 0 3 27000000>,
> > +             <&psgtr 0 PHY_TYPE_DP 1 3 27000000>;
> > +
> > +      phy-names = "dp-phy0", "dp-phy1";
> > +    };
> > +
> > +...
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
