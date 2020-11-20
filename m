Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2472BA027
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 03:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10986E860;
	Fri, 20 Nov 2020 02:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130088.outbound.protection.outlook.com [40.107.13.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F1D6E860
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 02:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6W+dm3Uh3rdFlbyGog5pNj3JdvZkMsqyBIvIM++XKWcgAfXB5Vh3mx7wMfhAFrH04wwiIvDZfjDP8o51DVatDhuKob8vxSXrlUL2IEdeHkmRrS12xDmpZA/KIASU/YJjvOsp5OP7lU9UvPlE0/m1JI67XYnN+zgZZVBBeUau6u/mhdNysh8RPjD10jHY5AirTRjlfmdIGbAIBtioBXmkaIjahIxO9i8+oRqtXGVGA2v9ygJDI0dBepJkGGFMdwMD+NLZ+xHpfWW4xx93HbhqaJ50SkfUHHMFcPWZhwUVXdb6SOnaSww/SYHr9Buu56eyc/ZI6TUdYNbZXGZZeqXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4Kt7V2v4skTE4krkebTYvrnPs+wsr/aW+7+caxNO8A=;
 b=LrY5KRRWGaY+wpx1G8niaW0y1UCAfWP+a6EH+j8wZ1CEOHdvp8LXbSwTU8uueUl6ln2OTnfjItJ+sBAASLetSnbW463tQD0Q4XFCGGfq+EyH0i36DC63CMFGBFAICcGik0XT5JUuZY4PtQiWHxGyei8x+PFmy1YcWPkZwkhkF8HnOYh+/yjFGJQWF5pml70Ch8RkxiMV3xsPO/146s7DohtUcr75GB8Hm+WK0NyobV8PoT77pxsY+ue43tOVjix9ell/N5Z4o5zJRuA0xif26gHYQ7Q8trggFfdfgzw1Zp7VnWEP7yL1ANIfyPpmsGLNAzej7DUhq/9Mp4Jg4sdojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4Kt7V2v4skTE4krkebTYvrnPs+wsr/aW+7+caxNO8A=;
 b=XxOBpX2hgBLW223zaJ0nNvXPKXZs4mB9XeiwsJZsoWTdH9JJxyr+YnYeJjAahvssk/aj79mnBkIO07WAxSq49g432ba5L4tPPTOD83Gml9/yI8uSVClfT1BZAoNFrWzflp9V3IWikwhaOgfykw6gRFtPHQnt5em3jYGLzRAKNQw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5184.eurprd04.prod.outlook.com (2603:10a6:803:5d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Fri, 20 Nov
 2020 02:05:56 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 02:05:56 +0000
Message-ID: <0f7cf14cd7cd57ad4f77d2e655c1f428641ecfc1.camel@nxp.com>
Subject: Re: [PATCH v4] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
From: Liu Ying <victor.liu@nxp.com>
To: Sebastian Reichel <sre@kernel.org>
Date: Fri, 20 Nov 2020 10:04:03 +0800
In-Reply-To: <20201119232000.qipbppfz42sop5sm@earth.universe>
References: <1605577645-32173-1-git-send-email-victor.liu@nxp.com>
 <20201119232000.qipbppfz42sop5sm@earth.universe>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0103.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::29) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR01CA0103.apcprd01.prod.exchangelabs.com (2603:1096:3:15::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 02:05:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e9c04d7-e871-4c6a-afe8-08d88cf8d0bb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5184:
X-Microsoft-Antispam-PRVS: <VI1PR04MB51844316797FB6108797FA7B98FF0@VI1PR04MB5184.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5jVDoSPh03jWTUxDqauVDtYu8LO56FLyU/hEsntwWF1ooDlRKm4q1p3JLTLQbqQdA47nseMSfh5GgI4fdD3YzzLLp7H0UIe+PPZ+LRev36GLOBPpQHTcDpp76iXxAL0AA+kzmSPwKniZiqEYfZavyApAOpROOvlk+ziqwZlqPossWxa1UQkK2n6Q+1A1/cygBrAR0ir7G6CYNjDI3uaIBU0n/O5m4aZOjxQLThQuS3mdP3GaTAXntlscneC+NGn8vhDQeyNaYrhyiqmkx21EbhU8ybSqSEf+rhHU0wIRkA/JyqVhwFHYVlVwzYnvw2KOejXgxi5SyQ3voXpcx7RTQEKv44ZMIr+56hU+npf6V2HzOYfr75Lq59ccXou/cFWXgIklvOersCEloFBISjZ7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(346002)(376002)(396003)(36756003)(66946007)(66476007)(956004)(478600001)(2906002)(8936002)(86362001)(2616005)(54906003)(26005)(966005)(186003)(5660300002)(52116002)(83380400001)(6666004)(8676002)(16526019)(6512007)(6506007)(316002)(66556008)(6916009)(4001150100001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: M1JkCiFlGeXcUIDZnhxz/ZwQtKlRt0EL5zTnxkSUeG2Jb8jidrqupd6Ce0SGQOrylIWKjjFG8iJ+u96YNMBJmFN4YmYb89bnrGqEt7kvJLAx5YoVt6eksYB5l4prxCwJg5BVAm+2VSSTMuWMJAxnOWrxo/lj1+UZh9sAaTH5HapYehjlmG3KuDhUi620PiCpuUoNWbal+7O7CvVCvyh8WzBEKWYb85hC4tSfJeOtp9ClhB2aWTAqPUqymLZic627bPfyLRxwyECEromgE0+lc3z+J4lsC6GMMnY2geleRZRXXqc/m5dinE9r9YpKrFEahMZafrK31kKkoUnOi4RSAMW4zhy20CCLm6AqRBWpyXjQpCvmEahAPn7M0ai4nJZnbafF327jfI4KlpCJ10AHyjblqUu2U8kzP4wv49knXhRnzrYvkz5F72i8/gazlbzjldsYJKIdS7oYYSQwF8YHe+bvkPFiGrRWaIKr2I9a6oNT31SuNInWHGocVjk+fsWyfUiOlX4iBBIq3zWdHqdGj7ngjl/7kG6RS84nQ/najGsPu7R6DIeHWsMZ2kbjsl2vSe6ghkRdHkVLwcQG90rQUWZLPvHk9PeC3Cgnp8oC7S579A7c7EoXmcqJNSVQTQVqds2lAxA/EaPcVmIKYMxmtQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9c04d7-e871-4c6a-afe8-08d88cf8d0bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 02:05:55.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2sYQJS79uJhIWW/npNcWLstBNwwAxazCKjj0Ok/lT2KFMGoZCiuvKc4SidQN8ZEsc/lh+TlqGOp74W1Lfv8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5184
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Fri, 2020-11-20 at 00:20 +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Nov 17, 2020 at 09:47:25AM +0800, Liu Ying wrote:
> > To complement panel-simple.yaml, create panel-simple-lvds-dual-ports.yaml.
> > panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels that
> > have dual LVDS ports and require only a single power-supply.
> > The first port receives odd pixels, and the second port receives even pixels.
> > Optionally, a backlight and an enable GPIO can be specified as properties.
> > 
> > Panels with swapped pixel order, if any, need dedicated bindings.
> > 
> > Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
> > 'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new file.
> > 
> > The objectives with one file for all the simple LVDS panels with dual ports are:
> > - Make it simpler to add bindings for this kind of LVDS panels
> > - Keep the number of bindings file lower
> > - Keep the binding documentation for this kind of LVDS panels more consistent
> > - Make it possible for drivers to get pixel order via
> >   drm_of_lvds_get_dual_link_pixel_order(), as the optional 'ports' property is
> >   allowed
> > 
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> 
> Is this part of a bigger patchset updating the fsl,imx6q-ldb
> binding [0] (and driver), which has the following property?

I don't see such patchset.

But, I will send patches to add generic ldb helper driver and i.MX8qxp
ldb bridge driver(in drivers/gpu/drm/bridge/imx/) which would be able
to get the pixel order.

Then, perhaps, the i.MX6qdl ldb encoder driver can be converted into
something similar with the i.MX8qxp one. And, also update the binding.
That requires a fair amount of work, as the i.MX6qdl IPUv3 DRM driver
needs to create DRM connectors.

> 
>  - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
>    be configured - one input will be distributed on both outputs in dual
>    channel mode
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/imx/ldb.txt
> 
> I have an out of tree platform (HW is still in development, DT will 
> be upstreamed when hardware design is final) using "auo,g190ean01"
> with that panel on i.MX6 and it currently works. It don't mind
> updating the DT (new binding looks cleaner :)), but this patch by
> itself seems to 'break' support for dual channel panels on i.MX6?

Yes, it may 'break' out-of-tree dual channel panels in the migration
set on i.MX6qdl.  And, also the in-tree "innolux,n133hse-ea1" panel
(seems no dt binding though) in imx6q-novena.dts.

The 'port' property was dropped in v3 as Rob suggested.
If we add it back, then no such kind of 'breakage'.
So, I'd like to see suggestions on whether to add it back or not. 

Thanks,
Liu Ying

> 
> -- Sebastian
> 
> > v3->v4:
> > * Add type and descriptions for dual-lvds-{odd,even}-pixels properties.
> >   Also, update descriptions for port@0 and port@1 properties accordingly. (Rob)
> > 
> > v2->v3:
> > * Do not allow 'port' property. (Rob)
> > * Define port number. (Rob)
> > * Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. (Rob)
> > 
> > v1->v2:
> > * Correct pixel order in example LVDS panel node.
> > 
> >  .../panel/panel-simple-lvds-dual-ports.yaml        | 130 +++++++++++++++++++++
> >  .../bindings/display/panel/panel-simple.yaml       |  10 --
> >  2 files changed, 130 insertions(+), 10 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > new file mode 100644
> > index 00000000..38a789b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > @@ -0,0 +1,130 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Simple LVDS panels with one power supply and dual LVDS ports
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +
> > +description: |
> > +  This binding file is a collection of the LVDS panels that
> > +  has dual LVDS ports and requires only a single power-supply.
> > +  The first port receives odd pixels, and the second port receives even pixels.
> > +  There are optionally a backlight and an enable GPIO.
> > +  The panel may use an OF graph binding for the association to the display,
> > +  or it may be a direct child node of the display.
> > +
> > +  If the panel is more advanced a dedicated binding file is required.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
> > +  compatible:
> > +    enum:
> > +    # compatible must be listed in alphabetical order, ordered by compatible.
> > +    # The description in the comment is mandatory for each compatible.
> > +
> > +        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> > +      - auo,g133han01
> > +        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> > +      - auo,g185han01
> > +        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> > +      - auo,g190ean01
> > +        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
> > +      - koe,tx26d202vm0bwa
> > +        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> > +      - nlt,nl192108ac18-02d
> > +
> > +  ports:
> > +    type: object
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description: The first sink port.
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          dual-lvds-odd-pixels:
> > +            type: boolean
> > +            description: The first sink port for odd pixels.
> > +
> > +        required:
> > +          - reg
> > +          - dual-lvds-odd-pixels
> > +
> > +      port@1:
> > +        type: object
> > +        description: The second sink port.
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +          dual-lvds-even-pixels:
> > +            type: boolean
> > +            description: The second sink port for even pixels.
> > +
> > +        required:
> > +          - reg
> > +          - dual-lvds-even-pixels
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> > +
> > +  backlight: true
> > +  enable-gpios: true
> > +  power-supply: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - power-supply
> > +
> > +examples:
> > +  - |
> > +    panel: panel-lvds {
> > +      compatible = "koe,tx26d202vm0bwa";
> > +      power-supply = <&vdd_lcd_reg>;
> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 {
> > +          dual-lvds-odd-pixels;
> > +          reg = <0>;
> > +
> > +          panel_lvds0_in: endpoint {
> > +            remote-endpoint = <&lvds0_out>;
> > +          };
> > +        };
> > +
> > +        port@1 {
> > +          dual-lvds-even-pixels;
> > +          reg = <1>;
> > +
> > +          panel_lvds1_in: endpoint {
> > +            remote-endpoint = <&lvds1_out>;
> > +          };
> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index f9750b0..62618e4 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -57,14 +57,8 @@ properties:
> >        - auo,g104sn02
> >          # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
> >        - auo,g121ean01
> > -        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> > -      - auo,g133han01
> >          # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
> >        - auo,g156xtn01
> > -        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> > -      - auo,g185han01
> > -        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> > -      - auo,g190ean01
> >          # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
> >        - auo,p320hvn03
> >          # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
> > @@ -167,8 +161,6 @@ properties:
> >        - kingdisplay,kd116n21-30nv-a010
> >          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
> >        - koe,tx14d24vm1bpa
> > -        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
> > -      - koe,tx26d202vm0bwa
> >          # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
> >        - koe,tx31d200vm0baa
> >          # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> > @@ -205,8 +197,6 @@ properties:
> >        - neweast,wjfh116008a
> >          # Newhaven Display International 480 x 272 TFT LCD panel
> >        - newhaven,nhd-4.3-480272ef-atxl
> > -        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> > -      - nlt,nl192108ac18-02d
> >          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> >        - nvd,9128
> >          # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
> > -- 
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
