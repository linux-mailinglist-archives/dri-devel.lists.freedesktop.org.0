Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714914EE52E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 02:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5207610E462;
	Fri,  1 Apr 2022 00:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08olkn2072.outbound.protection.outlook.com [40.92.46.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3813910E462
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 00:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRaAEds3JO1AvuZtOIlR/N1hxuUtYIH8KaSIX9iK2OCn+LoBtbSo75M1BOjnf+rQZd81E4zSINAU7/uX4f3BpORHjivExtzBZ/ZSLpfx9FAiIdX8jjXhpCfilFjBxvcMNdsa2s/rdEFFSc4OF/cztRtiahfhgkAxKNbehv1+Cbau9DsEwXnfbRO9ROYlurrSohBUi3HXWq+WVPmq4/FNoKV43fnx8N/CGFQaaT/rJr5mRiyV84Y07E2fs6iXQtVWZG3Nz0HmO94fhOvNc7p8yyTsvUadNgXI7f3viYdw1FM2SmgKYuG9xNJw41zZJbbQ9PtxnsL/7z2HNloPw5qwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GbSQFeXz9j5Ceo1yd+F/1Ne6QzvuHas4kLXpgLdvfI=;
 b=SN4DmVDAU7nAwUNWsRRubvQrcp25gTSro/hyryHcrbwo1C9+BcDmKvTeMAs7iQJoJ2p+Cull+7WcvXegR4T4d9Hdi4XSZ8sztsycoIWxbIEKj0gyyZ6lOP0bpXwQYN3FAc5XYhWK5/7mRcTZP7XuGIvp9eldqHUhv3RIziHBJh0mWARLZoGHDxLOgXfoL+7eq2r8eU6SGXxmoYu8i1PCBPNmN5aHNshpl7dEWeYk3sNCqeioGPfSHL1/5cTaMaBTYeB3yvji4K4cuUlO+YMC//zMNUOM9PSdtuBxndQ/HIyq+EIF3KOm/+10xFqrVqQT/Cy2j/vZrxT6F2zpfkozLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by DM6PR02MB4892.namprd02.prod.outlook.com (2603:10b6:5:12::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Fri, 1 Apr
 2022 00:19:03 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6%6]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 00:19:03 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: display: novatek,
 nt36672a: add backlight property
Date: Fri,  1 Apr 2022 05:48:09 +0530
Message-ID: <BY5PR02MB70090BB5D8C7D655BEE0642FD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401001810.81507-1-jo@jsfamily.in>
References: <20220401001810.81507-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [iGoBqo7CKnkzxgaZBwokx9K3iMFofBfIukpUXqzBBM/08Y5v3iJd8CtihpV3hI/G]
X-ClientProxiedBy: BM1PR0101CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::17) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220401001810.81507-3-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff7b62ab-2860-46b1-32b0-08da137539ad
X-MS-TrafficTypeDiagnostic: DM6PR02MB4892:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zsZeIZUmBTceTAvw3Gsz49JESuX/T5qv9GwJiqBZdaxQWCRzX/M0xFtbNmTbHjjiMdKNiMbs1v0xCkH2GQtZ0jSFHqLj6uXwRVnypCHz1NOisQKa0tr4afT+3rj930sPr9rH3CU1MNat9x+ybkcv7np2hVQfxS7lobfE6cdv4bb5JZ3QjGMU5hM9HIO+ZfnDXXbWRQg40hRmNgulkor4evJnVv3ie0sFBKVXKvaRR4SsI5bpyPOtlha1TZ2OfcTn9CdGwa5+QRlDMBDFd5UzLjpcU0TU8czpc90WuJehj07PBOolnQKZIaSTWrGE5qr4xw8mZoSQ8Z2PNB9xLR39x7mhtFoUqBADE1XYOSJpgW7mZMi9UoOeTvNeoWI7SdoZJpwZNbNafzgEV7L29aD0cbh4+j8X0VRTg9wCI8bViZbnyKqcIiy8FM1vml0G6mGrXO5kc2zDoRiR6x5ZvPPbjEcMF8Om6q5CjgQXyb0LyrrWsKOCguDlv7PxGfjoQfWCLOi+O1ME8oOiKGyLe59/MqbaDlirDkSjs7XHrDgOG9sdmaslgauY3baUEaMowV+DUpdxeMbwe6ZPwexpulCnmA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n4eIFa8GQv9YlEpaH3ngCyDRj15Wtu1W+Vw7DVVnuvaTu7HrKx8CoQV9muqN?=
 =?us-ascii?Q?OFI4rKBx2IDXb3MhsRXLf26WyEq+unZTOqEJWuK4f2ZP54cliLVSjYLMCeEH?=
 =?us-ascii?Q?xhZMXCCyvtt1dWTspSQeEmTCMKa6c9m2n+AG0n5f6ZhhpLVhroaAiIBrE1YV?=
 =?us-ascii?Q?2kxofFNZuhdhEt7sqJcXeq+acriVpE4MhlwNewdgaRix1VSYFKsuqpJTW/pe?=
 =?us-ascii?Q?skb8PmF3bCJawRoLhQtO5GoPksn4wngUA+vltcY48P0ammoMT2fC5/8h0FL+?=
 =?us-ascii?Q?hp6fbRkb6agYTSokZz8Ib4jv1Z3jjtPGpVJTgrEVxMtD5A/FBhJmsMgFo994?=
 =?us-ascii?Q?d7VaeILa10VKV7COfcQr7co55Gf1kEOUdWmSpG7wTicqFzbW+fP5bBeY3xml?=
 =?us-ascii?Q?W+cJTunQl0eeCSqzyTJFjl+XTCoESxTC4+HwUjiiT2sytDhYX/tzpTsioznw?=
 =?us-ascii?Q?65UujNIKsoxtU4YssnMC6NGZuDk/uYhpizZLuKwkSCz2KLpyHqrgIejObZPu?=
 =?us-ascii?Q?vSI3lAlZ9HWn+xbfGxwOTBrPd7WiKFguw8bFQrj9x1jFKJKS5YfFQUp8E9ca?=
 =?us-ascii?Q?7BvQFGOaa1dr4GOW5YuqWyTW5ll3D5FHT+9kx/9LMiOMeRDMT+Xwet7Vz+Y1?=
 =?us-ascii?Q?RQrddoC6xck8GA585AcafZ09ZbTmDQEk8IlEisI9fdh5YbkJhbY2nPOeXwzp?=
 =?us-ascii?Q?Cgump+amsptAYqQ+d77CN8CFYp8Pb2SnUqW17Na0E5mxWSJFCSG6gCKpMIsk?=
 =?us-ascii?Q?j6feS2mEYGOr2ZN9DNfxwAagex2eO4+ANwCXtNP/7jKx9aQGjg8D3PlelzhJ?=
 =?us-ascii?Q?1m6FtnlEGqftfof2rKhn6wdX8IrBzf0gfNcmDGzaU2mNFFvK96tezJmi/dj8?=
 =?us-ascii?Q?g6uzM4y8sEzyJ7hJr7+d21q5VmoxRavz+Ln9UoUmDGJe1Pi+qOMdiC5baTit?=
 =?us-ascii?Q?gO06VYSEDZAVAPv96GI0IwnFYawe1CymJWcKaS+w+dHivTl8OZGfBAAZIy2U?=
 =?us-ascii?Q?oYW3y+RQ+iIhp+Vl/6BhEX9OlNS+NIseIKfY11zjLxI5lA0+ZXDz8ZC76UWn?=
 =?us-ascii?Q?Uih5KQeyWrS9tvwMVG9opqpIj8EmUQLVNPuB/l0tgAbsjmBqIYLIDaWFqQMx?=
 =?us-ascii?Q?w6euuiiZOIKTOXJQ/0YYJR1PyoIO/oleo/asxLuhuConwzEaZB4+W2kwGiJU?=
 =?us-ascii?Q?Vm2ZThtZV2agf+gF1/mAhvSmPIQdnjJtyAcQFHGypZMuulFp0ZQj3ifVpcsL?=
 =?us-ascii?Q?j40v4gZ7p0mwagDpjS7gTGI8+HHiGi5eERlTLvsBfnYWqYXk/x7i5cisOYSv?=
 =?us-ascii?Q?qPNlmg0ZKXY8nBBjRAdEbC82qHY5kqBI5Qwl999lN3nzDKtB6omBuCe2xuRr?=
 =?us-ascii?Q?Mn/UfM1xc35pwLMuRTQl+7Emtp0Ah2ekNszzJXlwNQPg07TiW1ZDvcFLVeye?=
 =?us-ascii?Q?MMzp6Rf9NKkz5QKVa0d50GJ/R/ghDtpLAkO9YflfJ/zJNgXDclhj5w=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7b62ab-2860-46b1-32b0-08da137539ad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 00:19:03.1255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4892
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add backlight property and update example to include it.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 563766d283f6..41ee3157a1cd 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -46,6 +46,7 @@ properties:
 
   reg: true
   port: true
+  backlight: true
 
 required:
   - compatible
@@ -73,6 +74,7 @@ examples:
             vddpos-supply = <&lab>;
             vddneg-supply = <&ibb>;
 
+            backlight = <&pmi8998_wled>;
             reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
             port {
-- 
2.35.1

