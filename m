Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55034C39C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 08:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D59189D53;
	Mon, 29 Mar 2021 06:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3AE89CD9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:12:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBKyoVuVtxIhGGhw9z9SAt0xwiC5v//k3dhuxa01qmf9y6g2fb3ljxD6dWCT23tQ5QGdPjzMiufEKMhHsXkQOyuoUsKYr2HQth8YkS7rlv2nVLhrGJ9d3+upsS3kdZu7BuFQjnPz6XHkzVar+8YjMsFTDiPD50B9Pn44BAfVfp8mmMd8Ab9daJhZE87b0CrJPI3yebgDMvDVJCEH1km/Rsq8jqLWk0uwfcJT8NJpdfd5cfJdEUqijxjwjB7rtWIla07ttY+Ig0gyRHvG+GSubsVbA2cxBEJzSiNy5mtcWBl5ojW+QyaSuzLMs491k+vKTsMJWThvf1lesV/6OTNgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1SdpSbeU8nzRUbkekxIqNFm2D4JCyYwdXObiI3Wiik=;
 b=UYvfzN+Np3IAb3FMfzkvW3RO3nFg/hz1dSnDd3MGV38vWfloc6lga7f0Nep+CWcsdhFirREEfcDkxIeeLSAufRVrTFo8wekBLqjHGYfTTzOxdDtWfSR2v81eM3ox3EsQegAiI/6ndapyDoXc/Hx+xYAUeHMGFX2el/ZI4ztiCfWZt9l0UiBuyZqcipMYhUiP01bWFUarefla9IOEfXicQX7ePVL7y0E3bMi8rZyJXcSA04taBIv+ZOaRiyVglG7n+MnDl/Ny3Oz2AJtZcWvNklAon4SXSYV2ZlLPfLrD41ByJdaQr189tfeKVjFli+qLYTPhx11OdZuSe8c5R141qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1SdpSbeU8nzRUbkekxIqNFm2D4JCyYwdXObiI3Wiik=;
 b=rzyru5vnDck2kFnSOjvBN7jNNG8bVAHvMm+e/RzyKEPpLjLmv2aKrY/PkCTNZoZkJh9P41kvWwQ/EN1YQudzAWt79kn1pObf22aPbw2uuFt8z1ggaTU0LwPvzrGhe8MI881WLrOg8NB23kTQI3Tcx1IVALG5MJ0yXeMP9mB/Moc=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4895.eurprd04.prod.outlook.com (2603:10a6:803:56::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Mon, 29 Mar
 2021 06:12:21 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 06:12:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Mon, 29 Mar 2021 13:57:23 +0800
Message-Id: <1616997446-8783-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
References: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 06:12:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92f96654-01ff-4dbe-e6d9-08d8f2799cf7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4895:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4895D0FC89D6E5CB065B9589987E9@VI1PR04MB4895.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8vJ50iWWblGfKaYA8KXnkTTnEUkllghR4D0YHHMVpee/O5/ngvXqAw8v68VdpkxbzJBUCwCgLsIWo42aosKPf9X0wfSvT4VeRgloJyV+oa22/cv6dbIylX2J87K4HDznIXVBx+FHIj2fH5X4AZUC9oyWQAGVr+tFXYE0k7of5lWm+IeVGrjlL3EZV7il8p4bfayiyTHJNbYJsOQYgFntz7C71bXLAFwEh/0DrmyHfetoxHXylXLM3ccWE1/sySZct7IpTsdDMdRiuwro1NdsXw2yDvXGislOu5PJ+OhRBenNrfoRE4Sk81veXF1Dsp9UIivGvDqlNHwyF4Q0tBjmjhN2NCxTjJUmVNuooY99LgCFPCJLsmI9Mj4gx7bezjyI1vDSJmKw0qnOURScRHgU8nSxF++86jX/auyCQxIxvH21bygDwqBeEld75JIIONnIhOgNL0ddlk4IANu91+FMLbwC0Cy2Jr0d/4ezx/IVPtPfidX5gTKeiQNV1SGCP4bpPu3mWew1V7v+763o4w+HOkwRLLaNhnxivxKO3C2IM3NE8229cqwccOSNQr1O9uC3zvXPSRPsw7TCi14Eu24JEi4/QkLNsmYoyMIVVBlP3UFVUb7I3H3bQ3oZStxDfeRvSKBNdfDm3Jmk7pEG1OJOB6SVQFJ73cpqp7MN1iY74VNl+bCevp2xQ4r9ftB8cnNhaTObhnngvbSH6hHkN7xtSsaidNqYN4V3MtyL0KqERdpFjyeeAGIQWYKzwtpXKdcO0j3958+rMWafFE1CYTQ4ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(26005)(36756003)(6666004)(16526019)(186003)(8676002)(8936002)(6512007)(6486002)(83380400001)(52116002)(6506007)(66476007)(66556008)(86362001)(316002)(5660300002)(966005)(2906002)(66946007)(2616005)(478600001)(69590400012)(38100700001)(4326008)(7416002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?B7PbiEUpS+QaY1FnhW5kBoeoo32HFEO60d6nK5ne/5CrACXFeEIesQrCHiEb?=
 =?us-ascii?Q?KqPTpABp7KaKVwCkEHkCG4W5+TudLbpwU5PNzbuXm3F0+u0/IO3JU+ViEmkJ?=
 =?us-ascii?Q?ImBxT/Ovb6Dw0Rwwtc3W4z7C2fnESOSjPQBA+UpbBXUpYR966uBzPcA4XbZ4?=
 =?us-ascii?Q?Onsvj4jNx3mEnO6H8ytIxFeNYhT6Y9HvaZTq7wmDjWtMiTExjwyWoLbpXWDX?=
 =?us-ascii?Q?XFDq0eFLtElF9Q+ekspHNXQ/SyqZN7ST8pNDgea8P6WsQalb7msI7OAehfqG?=
 =?us-ascii?Q?WhDC3gBS3alCQIm0ZpYRCY3hjl+O39ugUkYiNE212psN/kk/+BbumU3e5H/x?=
 =?us-ascii?Q?ylaOBbyVKhqUTYN9noa/6R/Xt0OCGIuDbyHNoA3Ht8+E7HGjVXfgohhuKAal?=
 =?us-ascii?Q?NgQ/pKp+eZXgpSrbTv6V/1Fdudhw5OgynJLM3ZR0JddkqdRij9DLln/A2rpM?=
 =?us-ascii?Q?MhJi+o2tJKXwATD6RXYktGhgM7X+EEP3/c1JW39ClYsXWpwz9zE2pxFCjZu+?=
 =?us-ascii?Q?jatqaJunK8CDO57AXWHRwn9md58w94f3d2CjVIdCAuV/rFOD2LYV9jJB/4JD?=
 =?us-ascii?Q?uJoH680UN1dSrta0uKFPeVaouN5T++YuCofxWx2eHCc18WQeXHde/M5IEDrN?=
 =?us-ascii?Q?kSJvR0IJzZ1wsR81DQOHz+wHoXOLO+UzzJmb2cghDc68sOWRUcpY9ap9emwg?=
 =?us-ascii?Q?IfZp2X3GfwHxM91R+41mzRwDYR4w8gFKVIsESBfiQt4fwYTPRYIp9gWCeMVw?=
 =?us-ascii?Q?O+RWLoG5BUlSLeUeUiSOi9JfgxgYHrI8kuKpYPACqOULYxML3tPrSFSaYOUl?=
 =?us-ascii?Q?/ci7qUr9re6aSKdLRLVCDz0H85NPBAiUAXyv9KRibXVQpE/wm5JLFUO7Lz13?=
 =?us-ascii?Q?+MCbxuI3IQTdNKOhNviZ9Gj6jXd5lMKN7Lep+jgTGTBsbs/+QXuC/hGU9YxT?=
 =?us-ascii?Q?VYmGP7Wp3Dy2iCDmovO1GxnIzljkBF6ygZgpAppDT5nH+Etv7V8CeaFwVGgD?=
 =?us-ascii?Q?VcZhn/Xx7NOslVISc3+KawG6FDxBOCppAqwX52rGzZxMJ5HO7YbbiHtm3+iC?=
 =?us-ascii?Q?0F9eQjKy+iaW2wPLoLpBG3y9nPWDL/k7P3y8e8s9axLSfSc+gdFw2dC+TgpJ?=
 =?us-ascii?Q?bgIsQuAQEOI/zwZgAC8EalcxwTKvc3S5TjNr8WCphmlUlsf5EDhMa7mr8bv8?=
 =?us-ascii?Q?ja0rs9VDIvvM4WKSWwmRzp0VsnXqEOFHQzzeflbW0yVleCXu2/7/To22NcgQ?=
 =?us-ascii?Q?gT2F7vDQrNR7VVXCvu7nukJDdUXYBaIEZoa2ZT6+ydfGwmqRy1msdrzigMVB?=
 =?us-ascii?Q?Mh1iyVGtpN2MXWMl4a92wnlM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f96654-01ff-4dbe-e6d9-08d8f2799cf7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 06:12:21.2941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Uz5R3M9nQsXw+zRM5Cd1TYrpho05TSMR8n9qKPl9L4Z3CjkMWyKHpAS28Wb3kVP+bOpKwfVqzwVjHctwMkCtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4895
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* Reference 'interrupts-extended' schema instead of 'interrupts' to require
  an additional interrupt(r_rtram_stall) because the reference manual does
  mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.
* Drop Rob's R-b tag, as review is needed.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 00000000..bd94254
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
