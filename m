Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478030380C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619786E42C;
	Tue, 26 Jan 2021 08:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCC389BB3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 06:26:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDGVJoP8b5vnVbx0mxkKeHQemzXwDbXRkiywIUvuioFdT+Ls0MSjY0jHWASySRGkUCSXhIVXXTFFHvfMhz80PC8Z+nrEIdCikMdor7AnyV67Uii98V8TNKABxeLbfpgw1FWzx0+c5muyGHoh/yx+6l07440qMjBU+v5AtdR9Xs/y49dvIaCj/SMlWAeMh2sY9TxttH0SBpCguhJ0HY4h0QYBc04nkXUCubPB22k9asaY3+hKG8hUjdnApxxz+W6xLDjULMJ7cQi52wqpPs9NH0nxODecTogSe4GiIvcyblwBDZe7eqRLW9iCGBRnKBt9c9sCDB6zLDJVhGsf/Fbe2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsyqfRbp7aqYQ3tQWxH+X688LPdbc6mqJPtdGcKVuR4=;
 b=A1v0hxjOVkFHAzPi/h23aXGA9PjvlZsEmKhVdjs+bjPqqeufIYCkIKQEgXcrN4aYJPeXa0t3b+ZQlMoElG0WdwvD8mtunJ7R1aE0LZ3CplY//yXurd0KFubhOnqw49Ya2nTsz7eErb1PZ+UEzT1XCGknLHY/deJSa//PNYsVeo7wylXYI05g9Cp70HREqiLWEEDmd1v8uN+S00oCosBMml4Tk3wjFGE+D3FHC8xyrwbjS/TcxaK4zUOqOslmwURdvEqpO8IgbMxfQGsF2EeYpoROMIALHH9V9Hf38giafA2Txj9hxAsiTRf05bVDaPdD6I5SGv24wLlKhgtBgs5PdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsyqfRbp7aqYQ3tQWxH+X688LPdbc6mqJPtdGcKVuR4=;
 b=ip8gySohy7r5y2IcvAmuglAIw9RtWjRUzZU1Z8baD5flo3heKZlxi+/73n0FNAovBo9hd0FB5hbSaa8YwJ5LgGi5npV2IVO43HFyInREg4247Ay/Y+pXNFXipoRZdtxjXNnC1RthXOwY8nV1zS8ojP/L93OZ7O5HP8n25FzFkmI=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 06:26:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 06:26:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Tue, 26 Jan 2021 14:14:51 +0800
Message-Id: <1611641691-17554-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
References: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR03CA0108.apcprd03.prod.outlook.com (2603:1096:4:7c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 06:26:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2ef89146-69fc-4e68-2a29-08d8c1c34423
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2973DE5B43FFC208717C861198BC0@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJ+rCvFF6gRWbP/6cB4lOMONv39o9KUZpGcRzXyGnFvPG/bxODarJlj3C+0C/tXQMfd676hM5QjyQKajHi9lT3eBNpMkTQK2Sh0kEoHn3IrDWMPRURtTLwrclt02CtcFu9n9frmOOxFB9GqL5/MjoXtCxqpTjc/AhfjbwG1NOw/QsntxTJgPPUDE7ubW4y3pVJRn5OlmIKRV4VFYNCbRCWhnYdwNSv/98nURFa1JGF7QxWhxCKuc4rxnXtr0HDVEImoFQQXwGtONBDe0ZXnekVArwatAypzXrtr+2V/A7dQvmBxqXxKxHmGLZCb4ICSLFPlMLq72zsiRTKLHlc26wgL9nqENaN8qbZSONRRWhLRry+FKSmNYN1g8Abq9H6sSPtHj2A6H/70nz5ujqq9HWPPQLXBv0JAs7JIAJIrC8STmZ/h8ywSLQ1LLkklCqhBwD7rdV09QMVwIe5GnKKQp6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(36756003)(8676002)(69590400011)(5660300002)(316002)(7416002)(6486002)(66556008)(8936002)(6666004)(66476007)(66946007)(478600001)(52116002)(4326008)(6512007)(6506007)(86362001)(2906002)(26005)(16526019)(186003)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1c9sGCKy8I90h/52yP/85FhJqYBy1+sTjl54ufP3guoOl4V3jQj8+fNN32Jh?=
 =?us-ascii?Q?4fqde7nZ2PtOp/1F8PQS4W7wTAp15F56VwU75SnJ5+2oUXExybBYTx45PvQr?=
 =?us-ascii?Q?27PbKgn616ZodukaS09vIGauesR3iLl67uKZxDEwWSohGS2gr+Dlbxkqg/TB?=
 =?us-ascii?Q?GlvVrFU8w+zknPQq/yJG9NNTKqRt5P5389KoS9E2Zs3NeazwwDDmIkZycS9g?=
 =?us-ascii?Q?BVVJ3yyeYqJSFXmPDifAwzFkWtEN07vm3mVwR2SdzYFkIOzdEwkGic8SAOPk?=
 =?us-ascii?Q?zaXbbl2n/hO2lXdldnrMkGHFV6zPJG7jxFqmeAmxJjoxQ9dQOa33L7YHJYU/?=
 =?us-ascii?Q?yEZLd0ZhHiixkLq58+S9gYLQXk0ktxXT+so6l3pRCRMuUKdwd8RbTJrgR/jP?=
 =?us-ascii?Q?lUAXJhRprULaFrj3QIQa6XKJudnoE/33RiQkjYC472mE5jgxzBIB+PpeujMr?=
 =?us-ascii?Q?96u6t8UJIDNfKPLIaOKU+TRI+ZaQ7f1m/ji8/AbmCuCI12XbDd7WuuncjiHp?=
 =?us-ascii?Q?WABUK/NK4SP3VpsX6HQ6CRttiBnA4MydGt3qf7Ic/zPrRNOt7SnVrNjHRtRI?=
 =?us-ascii?Q?j6atUV/6oXM1Ngeyd3FNdjsk3Z+8Wvvwku4eyTYHT1iDYVw23p/J/wPqvxnV?=
 =?us-ascii?Q?lVgTXD0P/bKxx9hqEKY1AGAbPNYAH2H3uUbtRz+8+NczUJ8qtYv3tGbDeCdd?=
 =?us-ascii?Q?3Xru6oDMeaRqGw9jdJmFAUNcIEcqovEk5gjadF6/Z1l8RWcqDi+zBoSilFoE?=
 =?us-ascii?Q?NNffDE2NKHineSF6WP/ZugGlkyDP3GD7Si73vCizqSxJrViqkxNudrdQstOM?=
 =?us-ascii?Q?O8/cBaNAVASo9KrW/k3v8Zu12zvEKu1KehGxskyAQi8AKDqvG4+VuszNjTEY?=
 =?us-ascii?Q?7b++5MM20FwyrMxrDfRc3tsW5rVXFl2fvURas+QKGjdy0lFOLjToG5RyYEJi?=
 =?us-ascii?Q?VoOcVVRJaNnxP8uZh/rQQJMWUilp2+cCLT77JZLzSyVyba1R5tViAvjDT4i0?=
 =?us-ascii?Q?uWmg/ONIoraDThKmEaCiEqKB+CTjxM4zFAvtOKwlvXtjI0uj1M5mZtKmH+CP?=
 =?us-ascii?Q?i1MT28Ba?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef89146-69fc-4e68-2a29-08d8c1c34423
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 06:26:08.2201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLtLYnnZQhBJ9JYm1vy8NN2XQyvkc4KSzo+vGDzJgWKqw7300e7zFxqqUPukdstmaCFre25hiLf4M/ild8uE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d241b8..0fe4f0cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5892,6 +5892,15 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
