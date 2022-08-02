Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0D5887E3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F6110FFFA;
	Wed,  3 Aug 2022 07:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067F111398D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 09:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKZ30Yxv9kMZrofK0pOWwUgxqDVpuyFlmqLbKm4mnh9z7t1ciHh4L/3BdCQ3O99c/zCzv0SNcQaXv/E3G7Lja8Qqpz4STvEtODXjoHo/3rXA46mlBiYe0TMmtUV7vy5v4+u8UoPSp8Za5wjjfGZLdqKjHLDTgsJ2zIzNbB0ELpXrU+GnsM5Kt95kybYPPcah5YgPOVagHBz0ZGx4Ui1xfT916rg8TF6hiSJq18zjDAv+Z9MrRhMr2q4fRVfqRNWEJt6iQ52SD03C5e8GDLyrcMLMsZoSKhZ/VMjBk5U6tmBCqle1iIewXwIgfV96w8bmyXyMD3CGqTcbdcUI8AUk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4xR/woOXLlHvmkQLuIa5OL1e0+nSDFpkc1bQc3CCzg=;
 b=g0+hv2gWUACAScgCO9Un8zI0dR1QrZo69uQawKKCquVoiifhsWKlEe+iY/mrBUz/O9NPSWiBoIubF6sW9tzmf3JmRVU22gBgpulbWsc95GbIRLHKxsFwSW8l4cDu7KKumKQQCxqJDJFoVBYoB530Z853Rvqp5vmOuAzWCKVJ2viOOE74xr0lqztT2PE62Z13ACSfmoMuNCkK9IfdlNrWGH09qFBxZas4piOlkUkcJiZ/ORMx4JU9ccwi0VXLt/90NTfStYe7gLsT4FnuRIqw2+/F+QxQ252PdopzbDChgT3K/YORMJnmF3tZhDOCvzBBFob4T4OyEA+/cSmKHH2B2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4xR/woOXLlHvmkQLuIa5OL1e0+nSDFpkc1bQc3CCzg=;
 b=gwuI7OBxjXwQZUv+SL8LBuGOhdiHFiLcRp0Zd2MYwf1Wcw+BKQNugIBRyDAeB6+KDsayTA0QWwUUj83EunwcHA1AEs8jhQ4/zX4CiBr/PeqZDkglHsUfwR0xxbTZJJ4yZuN+k7QLVJ9vKrpX2Mt83GOwqhKtNUMEWYFkXKQsqdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 09:58:53 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b%5]) with mapi id 15.20.5482.011; Tue, 2 Aug 2022
 09:58:53 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: reserved-memory: add linaro,secure-heap
Date: Tue,  2 Aug 2022 11:58:42 +0200
Message-Id: <20220802095843.14614-5-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220802095843.14614-1-olivier.masse@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:207:8::31) To AM0PR04MB6737.eurprd04.prod.outlook.com
 (2603:10a6:208:176::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75cdf14a-ff6b-4faf-5a09-08da746d9b6f
X-MS-TrafficTypeDiagnostic: AS8PR04MB8341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ep7FuFEqKt2zJczPpTiJyNMvQFLWQjjHi436wZsUoAzm57Chl1aLtRybYYAdlUy2yw1ImIbvzUYlserI8rPAA/dE49pkho4xnfsgrcxOU2DghrgTrqwzTcoa8/DncU04wONRx9v1wEd534TAX4Kux0GC1KRfCYy/qGernET/5RQo7lMP/BAr/Y09BQFf2u4+lMEpL3Wpz1DI96WEhDni4Wjutxb4mJjo2vHHdHWpauy9LLts/xQijyvAVC6kXfHFN42RKsV9KrsQ3tyUTiMsnqVMNScaoa3WxtlOb/uCLD/A20qwTfhzjvocNzwDRk1JrbbyG59RgqhVy6FnO3BeDQv8h/rUgeXZ4Nv4r+rV9p6UPVk8H2fSLF+AyRedM4G8WLRSXXybC4xGb2feOsNZYYzRhzxe9wVoJ9H04Jk0Z86fBP6IqZVo23bvq7oADjmHa1/JxsLLabvNQZyzKebpPmz7a/FI3PbGp1rCRayn88PaLg+3bdjJUax0pU4kOEcS925UwfJs5HzBzoUwKFaZTIlK3Q4+uMk5pRMK1Eu95oOad93DIyuXtujapQHVltXReclK/7uaoa50O/F5ehV09fj6VwrFcPpkKLDAR9nJPeOlV/7a5hgwk2CiA4onLkrt/4NYx/z2AayK82Xh4TPvQi4moV1hxTz/nLpGJsS37OACm2/lHG696dwiTgvbswtAFeVGMQzkG57eToxxmp+teDfe/sDSJhmxR3CSSELRPIzeNURsIu76snI1XlGCkFHJxDU93cum/K2I1nFyh52qLAfWQvwujLO/5/cCegj8g5OXOiwu8VplNykyVUCYcphztnPckaprE4M2kOKkXNIA+lqgbQvIhRoExwBxYKFIqBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(41300700001)(2906002)(83380400001)(2616005)(86362001)(6666004)(52116002)(6506007)(44832011)(1076003)(36756003)(26005)(6512007)(38100700002)(186003)(38350700002)(6486002)(5660300002)(8676002)(66556008)(66476007)(66946007)(8936002)(478600001)(4326008)(316002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LXxq85t2tpLuzH0dSrDUBcqA3pujmVT7+8H7G1RxgqzcUSWuy0axs3fyv3RM?=
 =?us-ascii?Q?0CAO5OqnY8nrZ2QbR30Sz/BCWbzytSkWkz4YHmxnxldlkGdF6pIW/OfKf0wW?=
 =?us-ascii?Q?dO0Ezh9YJUF4eUWU/dSH/1Sno97JKY0MnRBKnHhcUewBoIMCfKfntdk/i7t8?=
 =?us-ascii?Q?s5lgkljP+rBSv7geCcBtKktYg080ddOpj4d8RAcJ/33/4rBXX45n515ZUlqW?=
 =?us-ascii?Q?DNsatjlarQG3l+lv+Pw7LGuaurE2sgsz3M2THRnRn/mu72yLF2gRNoibQI63?=
 =?us-ascii?Q?kggg5A3mfgoDJUrA0hnoNlb8fLZike0+/ksQAD9JGyg5JTxKeFsymQ3m2MBu?=
 =?us-ascii?Q?cYanqFti248mLYs4bihDdNEtNzjpiSBN0X5UCk5HE3mdbrgIcp10q6zWic/c?=
 =?us-ascii?Q?4K5fNCu7BGJX2bmUztxCxZ1I/OCXrUKZL4+FFJJS5hlI/nXUn3zO1R7oRHcu?=
 =?us-ascii?Q?CDVAXbNfzdrOJ0sK9T11MArjuxQyp2RjRIAfJP+Ojeqe7mq2ahxvl71/GgrJ?=
 =?us-ascii?Q?46tJiKetbxdu6hmy0bfV47TFJ2ICLSF/0dy8RJykWZov/MAiiOjEbbWJuxYM?=
 =?us-ascii?Q?D/raICBbYU3ai4u0EsdMjkbBorpQbYkMbxfKk3qA8vnAllW5dl2/ChzYNTOR?=
 =?us-ascii?Q?EcOjkHjhIwHFtDWs8XyK0+b6+X/7jokdRGC/+pI+lWJK8f5A88qVyrK4djYu?=
 =?us-ascii?Q?XB78W9YtCQGMfN+aV9gehgVD+w0pLjbSncTFg8KVPZTWn09kTYuycQh6L91X?=
 =?us-ascii?Q?agxIWB08X2n/ZmP0IqNRXgZX0GapSpSeBSKJvsUAYUypdzDItQsRf7eCaPoz?=
 =?us-ascii?Q?ByYu2OTUcMwQ+jO3E8+z1uqZbJ3eWWlgJptjOTY16/ygRUSv0mMnqUwC63ih?=
 =?us-ascii?Q?yiBX9hkuK4vfme+CVvbiQfvmhN2KaaUKMgmmSCjWg8fjttURakup+OpQkizC?=
 =?us-ascii?Q?mOAOajmrWmiWJmWo+9G85Rv9VT8f/lIcPTgERvscXU1JZrKIJYLgvbzDBc5D?=
 =?us-ascii?Q?/hnVvAFi33a7LEpmKNVGYh91iWYk+Knptv7gCP8j2G1e7QetnMXq9DvpNQhJ?=
 =?us-ascii?Q?hdoNe78PxFZNsdUPHWSOLFgnK2vKWx40oBvqjqWYOFBJsMAVYBJeTENii7zL?=
 =?us-ascii?Q?KASLl24h6F3s3d3OGUXFMgl+wjcm0T2ZE0+DHJ/V0WEytCNHw9uncH8Mp+8x?=
 =?us-ascii?Q?em28kZwwGClo4kGsT4E+JWKDlOM+DC2DUMZ0Hcsc91IcL2uQf6V1rmsCEhvJ?=
 =?us-ascii?Q?dWV7Nx2lXqZcSxtmQbXF1jkHQOF9d8349XnAi6qH0wWEE9IQcIiIG1me4GBL?=
 =?us-ascii?Q?zLPHfovEL4qYa/n+vWPjxKCGc1k64yNWW1U++gRhDfncbrP0I62YouRc9Eld?=
 =?us-ascii?Q?sY3Lk7JpuFGEIDulS4Qx15jIRUKG5tdwgYgX3g/9LVhD6WVCPvYwZBo0VJFG?=
 =?us-ascii?Q?B87pWZi8rl/BBQkIJNzm7OjvrIh7yDturgPysP5VEBhhbA6k/ZKasX/7qzp8?=
 =?us-ascii?Q?zIJPHpTxiHypI4IG+AK9HiNlmMbZmrfIwIuaX5SueXRjLRdCTE1IOXdlpRSm?=
 =?us-ascii?Q?1YvfxOjvE+v1wzn7qN1XWOWFYM1uZNDz+SunhFnt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cdf14a-ff6b-4faf-5a09-08da746d9b6f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:58:53.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqEHAmRMpZxJXpI403FoUa7gn8OjolFDzYfuLopI1dJqRc5Lxzwx2jjO0mFHe4aNSRkIs7GXsA6Nn9P07WndIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:28 +0000
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DMABUF Reserved memory definition for OP-TEE SDP feaure.

Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
---
 .../reserved-memory/linaro,secure-heap.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,secure-heap.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/linaro,secure-heap.yaml b/Documentation/devicetree/bindings/reserved-memory/linaro,secure-heap.yaml
new file mode 100644
index 000000000000..80522a4e2989
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/linaro,secure-heap.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/linaro,secure-heap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Linaro Secure DMABUF Heap
+
+maintainers:
+  - Olivier Masse <olivier.masse@nxp.com>
+
+description:
+  Linaro OP-TEE firmware needs a reserved memory for the
+  Secure Data Path feature (aka SDP).
+  The purpose is to provide a secure memory heap which allow
+  non-secure OS to allocate/free secure buffers.
+  The TEE is reponsible for protecting the SDP memory buffers.
+  TEE Trusted Application can access secure memory references
+  provided as parameters (DMABUF file descriptor).
+
+allOf:
+  - $ref: "reserved-memory.yaml"
+
+properties:
+  compatible:
+    const: linaro,secure-heap
+
+  reg:
+    description:
+      Region of memory reserved for OP-TEE SDP feature
+
+  no-map:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Avoid creating a virtual mapping of the region as part of the OS'
+      standard mapping of system memory.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+examples:
+  - |
+  reserved-memory {
+    #address-cells = <2>;
+    #size-cells = <2>;
+
+    sdp@3e800000 {
+      compatible = "linaro,secure-heap";
+      no-map;
+      reg = <0 0x3E800000 0 0x00400000>;
+    };
+  };
-- 
2.25.0

