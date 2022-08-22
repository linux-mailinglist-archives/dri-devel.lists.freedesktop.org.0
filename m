Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0659BAF4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769A79AC20;
	Mon, 22 Aug 2022 08:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2EF9AC13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3PrbR9WnXFrtYZ/NbS+kGtMfoMN1k9rekdgPFi1oe+gfCaHWzYRYUx+Ab/5GoedetOOlOqabaIUvG0Ui9rnXBXyyQ+8CVe3C2uThPBHH5gvX7HGfvEBQ8A7/o+jSzqT+bo9uNHN6GtXBwFF2/CQLRcrkED3cPAHF2LIl1IadKaSXbH8qrQwIEkU7bMxuenmy3rK4CFD26onrgxvaveNtvtJK/3yy6cntfAgAxGWkzQtdCZVgrq9qC70xmj3eWTgfMpnbmE0QRA02Q0ADnAk4USaIA7oFFLAmOLsxXX4stRj8zb3YMp3X15qtBuSKFpt6JWOJBTr4Xv6Fr7vtFLVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOg0HA3EPhyiEmTL+M0uC5wpFiI0P56AxXWbm49oj/0=;
 b=LxARDPHeHWbjaiv7b8Vk8vySd0ZZw3OcqpGJ3JDgYn2fiqANzlm2KU055K7mbLuIEpjEJWKh9hx2ldkrEdK/LWCz/nEkKjLBTG+oQbAreN0S0gLO4UOaI1VpOl3LT0WaxlBeVsdogXyLFi/VAUcR+COeYApUirlKnsPzXaBH6foDZozGO7akR8weM76gS9bmx8ptklAlbJBRJ08uJzGd2EmiVFyRZqiqN8OT0OYZV2c2fGtWVGPUQmY+TDQgve6/x4clFw5h08B+NLeSSNvGjibx3zIINN6Hvxeb6oXR4YZ2rv5C9H5iySX3G4S3HUiioDmvVZNvSuqS3COc3cNHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOg0HA3EPhyiEmTL+M0uC5wpFiI0P56AxXWbm49oj/0=;
 b=eSeCETvaoqJtBmZCfd09FgAuc1LAQZuiWXPAMu81ziD0YHFFWCaQGcqpSmwN3/mKFV0TJj4vru1+qc5KVck6iVs0OD6XA5TXfkPDP+1VEnCP9gbjYcX4fNZE6bYeX4KeAX4HUwc/8nRv4SgbA/kT3gHU9xgT6JjQwqhFrTbfw/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB4865.eurprd04.prod.outlook.com (2603:10a6:208:c4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 08:06:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b%6]) with mapi id 15.20.5504.027; Mon, 22 Aug 2022
 08:06:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Mon, 22 Aug 2022 16:07:51 +0800
Message-Id: <20220822080756.37400-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822080756.37400-1-victor.liu@nxp.com>
References: <20220822080756.37400-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12c8721d-e0d0-4c1b-ef67-08da841544a8
X-MS-TrafficTypeDiagnostic: AM0PR04MB4865:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnZGrv9ZX3w2S+orYILqcr13kSJa9tNgEDWR0U0jJ1HD7LgMPKEVySfliyDnGnZQtODX/UcnLFKThPRsrNsdb8vWNJzHa7tnrhWo7MY59MotGtz5C545eq7YiXCzUT0/qVuAJEjPHcS1RjdNaDjRaZ+xzR3+7psNJhDZ7gWuEXNbviJQkuOsYZ8ilZGstM68QIYPlurO8rTbxPLD5XFNOa1leTcKcTd5zN9dg1k4cOCx4l71yXXMnS59F1J9xiZCTRsjlEnUWuSaUcs15C/Ernj4/jj3i+g8jd97QaG/tmw5rVa6Ita8vRmRD0uHSYCJ4ftxhZSHl3UgwGG60ZuxxhOzRijXvN5gKT82O3fxa5zkgRtjZtviN6Omb3cxWWM4VGBPifh+4qnfbtXo7yCC2PO+3bVC/WQqIR3pazgeDe/JATKNa+ND0O/mJhbCRGPoFptQ5mhck41L1y5nlaUKtfCyKksBomHJxrqDKID8V+lwz4LAiJqjL4k11Tlc9dWUlrHJcQr5lczllmt8tXEV7eDFvBaoR0WNmXrll1kqJ7Iu2ofNbSJdQKuOJE5Zh5NIQfLZRRg9TGmMfBs/zLbBw1DFZe8cM9snua9oQbn4cljPP/SKEvdbEZ/hwp1ORi4/dbQJfszL8QLXYuC5h0cOcX7+AC6ASQB1WTa1rOVNBwp2WvrmKVfbEZQ6ChkVEwu1X0tdeGS9EaPSKJNOPQfavTE7CmU/hpQgQbr/Kenpcw80qm2qgAQLa63cN95rXkstPk2D6E5K4lFQGgVqAKTim3h4K0k5DDu0VqE+0CE765+/LWsD03QIYOu0MFa/7jf8+ZR7aHxnHnXUhJ92HdZhAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(6512007)(6506007)(316002)(26005)(52116002)(6486002)(966005)(86362001)(41300700001)(478600001)(38350700002)(38100700002)(2616005)(186003)(1076003)(7416002)(83380400001)(30864003)(66946007)(66556008)(66476007)(8936002)(2906002)(36756003)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDdbh7OzCDf6A6jazJyxUCOyc4SYfTUJn3q1K/uEF7TnRzHIYj3R9j4SMSY2?=
 =?us-ascii?Q?AjRA5Bf6jViXr5UYMdNeIQacSMsRrob6WFDnTXnJPDHwv61JOgYVfQ1e2khr?=
 =?us-ascii?Q?844Uh1zs0elp4pixhhktgIIcSYQDSYQ0wsPMjEk8LXb/j+QuJAGmPWg/7jAk?=
 =?us-ascii?Q?tAiQ5V8YoN8Px5a7wlC4nBZfKFBjVLqIcUn8ylGvN6Fg35Rk14TIVeWFyjsT?=
 =?us-ascii?Q?SCZaoci2BvKcduKbLwc44LAwCgMZFXkLOd/GbwQT61nZYpq96NWLITlB/DeG?=
 =?us-ascii?Q?61GAC/75Rw27RjkYlZZAijzGRGJa/Uv1s90ssayNMqVvnqI0r4lKqH2cDFkx?=
 =?us-ascii?Q?L78L7XZ3zlba5F5vKo70SXSlrDBgQtwAxOIjlsgNImH/0ubtB+w+KSMsE/CU?=
 =?us-ascii?Q?ux/3LCTv0NnWP+nDcPj+hp5P2XdNkLh+jNb9rxZEAvZTmspZyF/lNldPRplB?=
 =?us-ascii?Q?cXfEiQ2vmMJ7FIGt9Be9gtbzxqk59l6121/9E6VWfDxNrfzk6rf4MlMBBC/E?=
 =?us-ascii?Q?TOy2lX3JDeCWc3SMy0RfgRcpTmhqAK3ottozoODYQwVY3HXwJPehtt+aEztD?=
 =?us-ascii?Q?kzKrLMTE8V4GFObL0IQYHLZeH8b1LrmbObrpoR3H2dfDX7FQUBhFTaiiGaHN?=
 =?us-ascii?Q?lAdE/hXg8UO4U6xQpL7sHb1dEtEq4p2HQygFpx4njfhEOaiWWYpjscx52Kw8?=
 =?us-ascii?Q?yTIWjzWXWhxext3GBwjCP6dn6991LhIkLcN+68rg/5lbsFni8WKxGH1atqZn?=
 =?us-ascii?Q?84oVlP1FCgdg4BJAIG27YaaZvwrA+HMF4OqNX7VXCb6wnrjxpBW2SNOWtP+G?=
 =?us-ascii?Q?8gNzgyqhfmVj0FD67UItjMQ3mVly32YZ7XslU4pwXRbE+Rh3wFMaXgje1MeC?=
 =?us-ascii?Q?AM2sjg8wkPZEBbqIvXPPhut4AKqa85ZTztUuNMEuEF9TNNKpZ85tCtgygSNP?=
 =?us-ascii?Q?9fvNapOD3OEtB1xJ/9PueanedgJKJa3SlXoZSpBdG4rSF+6UFEkm7CORdz+E?=
 =?us-ascii?Q?KFT0e9ftAai/8d7RWN0IjLv2vGxG4P5+ibXiEhlgPQbPcuxjYLtK9veiYR4q?=
 =?us-ascii?Q?pfOrnWyk/yq8mFs8W7wlVE0DzY/WM5WCirFpuQeCS+kBqzcaDxfYgF7BA01M?=
 =?us-ascii?Q?MH1fjX33kBklPqrVfzH9BxPoHcVD29KfkRFd/THXWoiDaeDPvRFKUbngnxFs?=
 =?us-ascii?Q?u5PLLCvmCwQpoUJRW/i5nhV0xixR9pJM88a4KeBn/I2x1yab+eCC7pn09XR3?=
 =?us-ascii?Q?sPP38Nnq+gtEMWBeQay8N5f56mz+y3H6Lwozz4LyAjReDgofGdP692PmJYJU?=
 =?us-ascii?Q?0+zGGKXQ2xzDI4gpZLhDbWzMnYBxxa9UBYuFSQ57LSEwND6Q7du5Bbr/kJOg?=
 =?us-ascii?Q?WWPIH/aMBAwzsnlKmWIKJNUg7U7/kMovWpat53scHlDABASQDYbVDV1G/hJ8?=
 =?us-ascii?Q?eqrGkDbd84ipXFWagTpr+T4HWG9aEPFvty2Q1IuaXt8nZSae/hkmqMiJvS5X?=
 =?us-ascii?Q?HJoF7Rop263b2S+I6SgbZZsCGNzxpgU0u0uMY5m3vFQMsn5/9lMkXla9Kk5K?=
 =?us-ascii?Q?SKUc+UbMmRkSrrIQ0lwl71FN7/HU2oKAhFsC7GRS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c8721d-e0d0-4c1b-ef67-08da841544a8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:06:51.1197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: po1y7BSDNa05w64TJcvsFHuEKNbI4c2GiIlJNF9g0V90mQUejCaj/cbN+qdsK833bb/aTytlZitwhhjY9GHQVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4865
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
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v11:
* No change.

v9->v10:
* No change.

v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* Add Rob's R-b tag back.

v5->v6:
* Use graph schema. So, drop Rob's R-b tag as review is needed.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Fix yamllint warnings.
* Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as the
  display controller subsystem spec does say that they exist.
* Use new dt binding way to add clocks in the example.
* Trivial tweaks for the example.

 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml | 387 ++++++++++++++++++
 1 file changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
new file mode 100644
index 000000000000..6b05c586cd9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
@@ -0,0 +1,387 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Processing Unit
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp Display Processing Unit(DPU) is comprised of two
+  main components that include a blit engine for 2D graphics accelerations
+  and a display controller for display output processing, as well as a command
+  sequencer.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpu
+      - fsl,imx8qm-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: |
+          store9 shadow load interrupt(blit engine)
+      - description: |
+          store9 frame complete interrupt(blit engine)
+      - description: |
+          store9 sequence complete interrupt(blit engine)
+      - description: |
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description: |
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description: |
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: |
+          command sequencer error condition interrupt(command sequencer)
+      - description: |
+          common control software interrupt0(common control)
+      - description: |
+          common control software interrupt1(common control)
+      - description: |
+          common control software interrupt2(common control)
+      - description: |
+          common control software interrupt3(common control)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description: |
+          framegen1 synchronization status deactivated interrupt
+          (display controller, content stream 1)
+
+  interrupt-names:
+    items:
+      - const: store9_shdload
+      - const: store9_framecomplete
+      - const: store9_seqcomplete
+      - const: extdst0_shdload
+      - const: extdst0_framecomplete
+      - const: extdst0_seqcomplete
+      - const: extdst4_shdload
+      - const: extdst4_framecomplete
+      - const: extdst4_seqcomplete
+      - const: extdst1_shdload
+      - const: extdst1_framecomplete
+      - const: extdst1_seqcomplete
+      - const: extdst5_shdload
+      - const: extdst5_framecomplete
+      - const: extdst5_seqcomplete
+      - const: disengcfg_shdload0
+      - const: disengcfg_framecomplete0
+      - const: disengcfg_seqcomplete0
+      - const: framegen0_int0
+      - const: framegen0_int1
+      - const: framegen0_int2
+      - const: framegen0_int3
+      - const: sig0_shdload
+      - const: sig0_valid
+      - const: sig0_error
+      - const: disengcfg_shdload1
+      - const: disengcfg_framecomplete1
+      - const: disengcfg_seqcomplete1
+      - const: framegen1_int0
+      - const: framegen1_int1
+      - const: framegen1_int2
+      - const: framegen1_int3
+      - const: sig1_shdload
+      - const: sig1_valid
+      - const: sig1_error
+      - const: cmdseq_error
+      - const: comctrl_sw0
+      - const: comctrl_sw1
+      - const: comctrl_sw2
+      - const: comctrl_sw3
+      - const: framegen0_primsync_on
+      - const: framegen0_primsync_off
+      - const: framegen0_secsync_on
+      - const: framegen0_secsync_off
+      - const: framegen1_primsync_on
+      - const: framegen1_primsync_off
+      - const: framegen1_secsync_on
+      - const: framegen1_secsync_off
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: axi
+      - const: cfg
+      - const: pll0
+      - const: pll1
+      - const: bypass0
+      - const: bypass1
+      - const: disp0
+      - const: disp1
+
+  power-domains:
+    items:
+      - description: DC power-domain
+      - description: PLL0 power-domain
+      - description: PLL1 power-domain
+
+  power-domain-names:
+    items:
+      - const: dc
+      - const: pll0
+      - const: pll1
+
+  fsl,dpr-channels:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to DPR channels associated with
+      this DPU instance.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The DPU output port node from display stream0.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The DPU output port node from display stream1.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - fsl,dpr-channels
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    dpu@56180000 {
+        compatible = "fsl,imx8qxp-dpu";
+        reg = <0x56180000 0x40000>;
+        interrupt-parent = <&dc0_irqsteer>;
+        interrupts = <448>, <449>, <450>,  <64>,
+                      <65>,  <66>,  <67>,  <68>,
+                      <69>,  <70>, <193>, <194>,
+                     <195>, <196>, <197>,  <72>,
+                      <73>,  <74>,  <75>,  <76>,
+                      <77>,  <78>,  <79>,  <80>,
+                      <81>, <199>, <200>, <201>,
+                     <202>, <203>, <204>, <205>,
+                     <206>, <207>, <208>,   <0>,
+                       <1>,   <2>,   <3>,   <4>,
+                      <82>,  <83>,  <84>,  <85>,
+                     <209>, <210>, <211>, <212>;
+        interrupt-names = "store9_shdload",
+                          "store9_framecomplete",
+                          "store9_seqcomplete",
+                          "extdst0_shdload",
+                          "extdst0_framecomplete",
+                          "extdst0_seqcomplete",
+                          "extdst4_shdload",
+                          "extdst4_framecomplete",
+                          "extdst4_seqcomplete",
+                          "extdst1_shdload",
+                          "extdst1_framecomplete",
+                          "extdst1_seqcomplete",
+                          "extdst5_shdload",
+                          "extdst5_framecomplete",
+                          "extdst5_seqcomplete",
+                          "disengcfg_shdload0",
+                          "disengcfg_framecomplete0",
+                          "disengcfg_seqcomplete0",
+                          "framegen0_int0",
+                          "framegen0_int1",
+                          "framegen0_int2",
+                          "framegen0_int3",
+                          "sig0_shdload",
+                          "sig0_valid",
+                          "sig0_error",
+                          "disengcfg_shdload1",
+                          "disengcfg_framecomplete1",
+                          "disengcfg_seqcomplete1",
+                          "framegen1_int0",
+                          "framegen1_int1",
+                          "framegen1_int2",
+                          "framegen1_int3",
+                          "sig1_shdload",
+                          "sig1_valid",
+                          "sig1_error",
+                          "cmdseq_error",
+                          "comctrl_sw0",
+                          "comctrl_sw1",
+                          "comctrl_sw2",
+                          "comctrl_sw3",
+                          "framegen0_primsync_on",
+                          "framegen0_primsync_off",
+                          "framegen0_secsync_on",
+                          "framegen0_secsync_off",
+                          "framegen1_primsync_on",
+                          "framegen1_primsync_off",
+                          "framegen1_secsync_on",
+                          "framegen1_secsync_off";
+        clocks = <&dc0_dpu_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_dpu_lpcg IMX_LPCG_CLK_4>,
+                 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+                 <&clk IMX_SC_R_DC_0_PLL_1 IMX_SC_PM_CLK_PLL>,
+                 <&clk IMX_SC_R_DC_0_VIDEO0 IMX_SC_PM_CLK_BYPASS>,
+                 <&clk IMX_SC_R_DC_0_VIDEO1 IMX_SC_PM_CLK_BYPASS>,
+                 <&dc0_disp_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
+        clock-names = "axi", "cfg",
+                      "pll0", "pll1", "bypass0", "bypass1",
+                      "disp0", "disp1";
+        power-domains = <&pd IMX_SC_R_DC_0>,
+                        <&pd IMX_SC_R_DC_0_PLL_0>,
+                        <&pd IMX_SC_R_DC_0_PLL_1>;
+        power-domain-names = "dc", "pll0", "pll1";
+        fsl,dpr-channels = <&dc0_dpr1_channel1>,
+                           <&dc0_dpr1_channel2>,
+                           <&dc0_dpr1_channel3>,
+                           <&dc0_dpr2_channel1>,
+                           <&dc0_dpr2_channel2>,
+                           <&dc0_dpr2_channel3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu0_disp0_pixel_combiner0_ch0: endpoint {
+                    remote-endpoint = <&pixel_combiner0_ch0_dpu0_disp0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu0_disp1_pixel_combiner0_ch1: endpoint {
+                    remote-endpoint = <&pixel_combiner0_ch1_dpu0_disp1>;
+                };
+            };
+        };
+    };
-- 
2.37.1

