Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19758ABDB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C899CB1695;
	Fri,  5 Aug 2022 13:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150045.outbound.protection.outlook.com [40.107.15.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28362B248A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 13:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTNShynI/q4YrjuBWxJfPKRRG2TWymDMcESiZCbLC8j1VBKit4OsoquLCaRp72u95oHhrI6kzDPPeB/AHYcvjXiH9Z6/5EILGvcooHAbUUAE+Fw4GyV+YHqvBclbzcgkL7LiIJpk3hCLY9hkh079KoweY7gtwgKQK+r0p0C8JEj3sqItT4w7pVHreo6GkqCqUhbMN8s3KEXd67X4008OMZ7Xwb/SUs02Mu4fg8pcPKZ+zk0HAKvZ4uX3fKke7j5/6ulX8A0FcwhvEp7bo+rzjeOSUPqSUkmLudh1INRj/Jigi8Y1VNs+emgQ3gAkS82grgeAARngv3b/OFBMwb6qZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4xR/woOXLlHvmkQLuIa5OL1e0+nSDFpkc1bQc3CCzg=;
 b=lzN01f9IixsL6GiHEqDcYhcET+rGVvSs8g0OGxDenSR3Csdu30UaD++wirqqjbz4pJiJEkfDoUhYo3Uz+WVlItE1RNWSawgnW+bVL9NIar0ADXuBuIJPrHbkMmMPIfS8Tw+Y4/eAMc7b+2We8frCMx+aTZ6gYNIm4WjlV7paz6/pe5k9qo6r4swq/pqeyvnkHwZmP1Z/7RhwnvtQMRy9AIXAkLhY0FGktEUDpa8CqITYmz17u3mWMvpIYaMesKyUBy17tQUEf6BMCalG7ST7lQFusRNKTivnVeiF9NI7DsjVJf7iOwrTcVXEhqzV/JcVBhNq9lq+vvtbHrKr3gb1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4xR/woOXLlHvmkQLuIa5OL1e0+nSDFpkc1bQc3CCzg=;
 b=KoXFUXT+rPdCTULZ08GNrQw5hhrKJRK2ks4rRXlXcpOFdaPUSZbM/3efIivP4s04TIIBfYLJaUuEflY2YNwZRyOJEVvsjhIlyKOD18Pxqi34+66WMGO7C9+Bdz4zsXWykQS1XMRRK+xIVlNx1mLkKeUKZ9lAxRZsuJtWKWszjh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM6PR04MB5861.eurprd04.prod.outlook.com (2603:10a6:20b:a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 13:53:41 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532%3]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 13:53:40 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: reserved-memory: add linaro,secure-heap
Date: Fri,  5 Aug 2022 15:53:29 +0200
Message-Id: <20220805135330.970-3-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220805135330.970-1-olivier.masse@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::7) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53fddcfc-80a7-4a3e-0002-08da76e9e728
X-MS-TrafficTypeDiagnostic: AM6PR04MB5861:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMDescU2qePPWhKeHeoUkFCB2F5ACn8/sCgacSOQwnqvbql9zZ/GJCmhWdZMTFkFLY7m++DnXoNXVEdyIlLVICmuFzwd3WS3STXLktfut2gr8NcU9/Oi8Sk74Bdbi+wm9zkdWIhB1cwBTAhpzvZ9EpIWlE2E+ODO/0oOVZMuzsgl/tCoBvJA748A3hUkq+y9xjNESVaUwniDjpsmKfJ1oK8idikp0HKVg3ZtfA7Z/6lR0cWLuzUPFFiJQsYpRr2I5yjaHWrz5oUJl1qm6n/Q5OhH2tkZtBbZGoyHSgKhauIPzPbuldQ6q52DcDf5RCqur66xvJ++Q69JW52PG/47g3J2QRpvIla4lq/yu3Usq5EwaRV1ib2IczVGjnot1id7Fk/1LtX/3ZJR00ytoxaakYt+aIBJ98hvw7541aR+XS66wAJo8Gum7fLapnGAhDLmZSOEGOc9/eOHKBred2eijzCe57KAXIRICiQBbj8o9JZB+2wT0fyEDxusaNf9/NKlRd97YJ9Ad5J9422yqZ8sxniMr+98inNd20gN6/dsAMXKbgSRPPhMIVa6ehZlhxzUVI45ZpY+fx1EpDTmZNUgvdCdM+B/ypZC0VYtD0Jpa09poHF5YtZ7p5bb6UEDdGlXpFlSssoI5LrgKI3bQIzSypUG/OIGNNJPK70SReYYc4ntEm1+XY/pOeui4cL86blOdt2O3/GSr5nm5hQqwq2I0YgYfrcYGcbGfKwC7qjJcWu/BL/zAJD8ZNetF27hMWBUfcSDNa+vTLqbP9n10xpMxVcJG9J51nkQF/pVwkQ1p0kHOUVKZuVvft8iJWvQGsWJGphhmS9Jqz//xfcL5coB9cRKbe8C6Ybg7JJdFlE6BbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(86362001)(36756003)(38350700002)(38100700002)(6506007)(6666004)(6512007)(55236004)(83380400001)(2616005)(26005)(41300700001)(1076003)(186003)(478600001)(52116002)(66556008)(316002)(4326008)(966005)(66946007)(6486002)(8676002)(66476007)(5660300002)(44832011)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0pD0GyWrB4Vvot3JdkUdeAuivRISxMSh4NrP7wTDkfeX5nZBwRaso9QSDcNY?=
 =?us-ascii?Q?KTytN0WW2ALvN6FnE7BBCE4nyjEf9idXwVdLtvKTscdWL2t9hJBzWievRfzF?=
 =?us-ascii?Q?Nhvrk2A7kx+5jyZyQQkB9vpRgzYs0Ryt4pqLVZNgNwb4NIuTLwkHvtAt2e9l?=
 =?us-ascii?Q?Iebhyl+euZwEEis+e0LXnLytJz91YspB0HZnWEGutkbh9+t3ApZFvBrMO3CV?=
 =?us-ascii?Q?jw5QjQg5QT5yBSNIbLrSFZ5GKGlVRdd8L1+24k+Q4wM/FlE+Ylyn7wd3i9wk?=
 =?us-ascii?Q?d2CbEcQWag0DWtz7eMrNkkAT9t4mxRb2jFBKoAOhXRt1Kffx7YHqSpwpbQrp?=
 =?us-ascii?Q?9ehBElTNGEwqm6flAD/5tPQpTzqbJUPSqSU+Yr2RSg+jGe9HKfgq6glW/WiP?=
 =?us-ascii?Q?v0g0nTa9vi+73r3VaKmddGaXZotJlEXulHBlrNRvIvBKcY7PfVMLB2Xy8gh9?=
 =?us-ascii?Q?Mq+sE0iV0AS+NjisrJjIzH4gGT746ti11tU2PRu/PY7Wv7BHGOhtp+YnOiS+?=
 =?us-ascii?Q?u/60gueEVUhWrK0+QAp0bK+sC1zvQ7oPKoLGekHV7i1OMjw1/Fn/tMfQxrf1?=
 =?us-ascii?Q?pPF53JvR9uRNmt8RlLwALX1cudYdLE8HB6/dV2diTBQn7C0KE/BsqOioE0SK?=
 =?us-ascii?Q?oUVsNF27hHOXSeTDg0Q8KlHUvwEEmoeNxsod4eI2tW7DCCuyo1tr5rfK7c6V?=
 =?us-ascii?Q?wewixPLo4nYyRXKd2ML4aBISkQh5lmEz4KTu2Pdzm1h9BngmIY6kQqQYrVdR?=
 =?us-ascii?Q?eSYmdJkmOJEdf9TWIZtHI815n+JIlm6wPO9W85NtNLdst6lLYnyEsX06+nVt?=
 =?us-ascii?Q?DhOlc+e3uEStJrUHlLd6IM0cN6h7EQMQhtFCOnVChiMT1JfR5EcsW5FphBxx?=
 =?us-ascii?Q?veAdjRnMV5NlanYsqASUNRV6IqJsf4Xt9PufoL0wtZjpX6v5sssYvex5YbYN?=
 =?us-ascii?Q?2Gy0Zt23+Eb5yvUweWcPZLwIunoGUVF5BTrbQWsMDWRYV81jceiKbakyCMcm?=
 =?us-ascii?Q?lzS/OWiRZUXtDU0DmkYyYtdzj6D9E9+gUF8LR1mQ8Kz0zHMF7CpJ9Zqm5S4V?=
 =?us-ascii?Q?O4Y6VBRe3Gk23DpkIotwC239VpdIQXZOLHybkG4crakRgy3XUXpqfK25h0WX?=
 =?us-ascii?Q?w/vpNi88qnR03E3b8gNZf6pYOB+POWFmv4e+ACp2EYnRJyM8z3XISMzqScs6?=
 =?us-ascii?Q?HrSN1xgtn76ElvozxjXBEdAkfCvCStG4qmMSekTJCymhreESjfYglcOL/uct?=
 =?us-ascii?Q?ndccoc1eiK6Ri5oRhKJm/xgO0nORMbuNjecf3LtULwpsuAUsHLGxM8w3c8mF?=
 =?us-ascii?Q?am3tEpDYEFgADPfEO7E2ZU33VZzotP4tlumN+Mzt3b5W9l3OyP7JrYV2QFAn?=
 =?us-ascii?Q?oQfzVDkoP44wmOFmbCa4c8u9j3pYQZOpnOERrwszk4kvQec/XBmXB8F01pIc?=
 =?us-ascii?Q?hKqQ4lGB+EpvQRWK2GuezzfMFaSGW1w/tk9dVSrBo+DnLPC7wlW/2ow5JxUH?=
 =?us-ascii?Q?RV3uPhXHVnKTlSl3kuuMl/pz+xNEs6fyTdSSsDpz6OmLGSfIOKxDgumg8dS1?=
 =?us-ascii?Q?bFN/bnlOutbdxT5pv790FOykwQ8fiz3I3Wo9DL9/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fddcfc-80a7-4a3e-0002-08da76e9e728
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 13:53:40.6774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paGb1PKGj+Q5RW0zRh/BRhInTweKEVP+/Vdjth9GwoCBzBbW+0bNZkkJUNFZdGrKZ+Y+L1DYVH1xlbGBoaQ/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5861
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

