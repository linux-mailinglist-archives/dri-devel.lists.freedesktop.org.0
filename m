Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F90A4D9E3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EF010E556;
	Tue,  4 Mar 2025 10:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RwFgiDrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC87810E307
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z12R3f7r0AK23Zf7oCseFoM85OQdJaZdI7F6xHj9OX3wQadFHxgayyxihkheQ1aagpN64R3pDAUd+YrZJ/D/RRlr87LP/b5TqNHWUntpwQyCirRjbxwP2k/W3jVVQwWzk4eaZmU1YbBcrlyJGrSZK25FdtKcF4xraqeP16UQ7hObOSlCB/NudcHdfeCBTq+dW/b26OfcvLYqmddC6oIFFWwyaKrB76Wj77ydRPdS9v4wHVI75NfAhwvNWjHlgoXE7W2qnlBqXKzVQaBPocwecV5KDZnWeJy9XKYG/zio58KNvD0TzcWCLR4Dq0Zhx3AQsF772/fPDRVZLoOepTy9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v0ZITrKo6z8WXLWDeWeoamf4UafE45+PqI2xPDJjZg=;
 b=OzF9uwsU2wo3ji3PSDlkbMjqb1qlYmQKEBq9SkGG/+gioVUjmJ8T3xNtFFBqwBkb79R2SL2cjWZ7gZefABLbnYpGGYYHL22v5zGPtbJwX4bLcorA0qLS1Q/26xT1UcLePzfMRtefuVBIJs+Ja9uRYRFyf8z8rQgpL5cN1ASBRHOgdoX47izAdPsUoiQcyx8Cfc6UHJtM42x6UcnwOH45YDXeRl8XpPOBCveUhIbE3HgrmP/gX/aEVZGbUDc+UvV1WWyHQNIeDuxCULIHcEu3Lyqi+in5N9VxiV/ckfBkeeoxPbTX/rQeDNw5tmAFVpbod9fFOk1zx52dr0lhr/A9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v0ZITrKo6z8WXLWDeWeoamf4UafE45+PqI2xPDJjZg=;
 b=RwFgiDrwhQ1n7YBxNMR9qre0MLhg+O/s79ThEBh9OKRozeSDcn1G674d1aGKIaFcc0d7uvXSsfDWqnj9TO6AHeZfarabaYkv/2EXwQy0V2NtNYsyMmjSPWBPhlH3R2rZZ0rZbOlraK8OZqPri1hLk0FE1C6fIYr9x+WlG8Jd3OUa/mJ+K4zpPPHYM/ayDid2vTyG1/mL6KF1BBqIV0JV7a1kNCg+feOSSu2FV8gcbNI6EdLIfCpJizyBLjmCwFnG4v/+me6v+ffrQjetmZnDHXyHu1qzAF1A7wdEgxuxtRMICceumpVJmSLmu8MHvy8ELRnhvCeEU+w+9dfyuAQ/Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9868.eurprd04.prod.outlook.com (2603:10a6:10:4c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:14:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:14:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 1/5] dt-bindings: display: Document DPI color codings
Date: Tue,  4 Mar 2025 18:15:26 +0800
Message-Id: <20250304101530.969920-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304101530.969920-1-victor.liu@nxp.com>
References: <20250304101530.969920-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd56f63-0d1e-498c-8570-08dd5b055edc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YrQkNo6Qvqjp/2tVRRyX4s/RCU2G+Xp2QPc/RVSj+a0ZNCL6Qw6a6/dkgsHR?=
 =?us-ascii?Q?LP8EHfRQ5l6tYnWDdVm1zf77D71e0bWhmkvFcwBAaDv65O/AelPVyes+eJPx?=
 =?us-ascii?Q?b4Ao7i1rDKJ8SLHTxXmLZ5JDd92mPfVUnQY3yUsuz2SXNlT8U/HUROutD0x6?=
 =?us-ascii?Q?9XPbR+mLKEsF5g5tYxm1lSHsLsfqRutlNZyZt0uX02nm0hLIciTPxpL9gSPU?=
 =?us-ascii?Q?fesearVvBaertHz07cltrxC3GBnPr8mu1iVtqGlFG/bTV5z8fT7tUywlmu3I?=
 =?us-ascii?Q?naBwOBhC390iwFJ4/hR9JPM6sGRuT3gSUhxDRPjAIwqYrfUfhY404cZsvcLD?=
 =?us-ascii?Q?wEbQmn8sczLBOuhO7+DtHHa7uK8QfsGQnB4YAdCiKBy11YHJmIXAqov9DFk7?=
 =?us-ascii?Q?LZvRhXA8pg1bfNjfpzkNmCHGee+3CjksyjvglSlgWmpY63QLXstjiP471DGb?=
 =?us-ascii?Q?GmqRzIKFba4d49DIcqpiBq1IG5OherB2fdWZWb3keIxqNSc8zd4PcPlZ4unT?=
 =?us-ascii?Q?5nab4rulVM64ZK+l0w9Syr55rNLc0QBLhoQbP0dEEDdEm0bkjCoojP8+ej4J?=
 =?us-ascii?Q?bYoxRB/BSPlAOnAWBo0KQC7Zr4o00Z19F7DqWm+I/RK3AcL6vHBPiwRpawcI?=
 =?us-ascii?Q?UykpLPR+5PuJYyaSYPxbKzagFbTmCqhdyILcJwjMB0ebHhg4C6FwADcqFOkO?=
 =?us-ascii?Q?B3FFXG8ntPFoaFhFYUl8dIh2LM2SuKhaxM7pPLbO4E6HYJEHpaS1N7CC+Qsy?=
 =?us-ascii?Q?RCAYmqZwh+hJvR9Vt2XbxfvBz4DVyOchR9WGdMKHyX1Hjg/gEd3sKopAQRbF?=
 =?us-ascii?Q?qzE2Q24wizGiyHxg2rAoaZktDMFQC5biJhkZaTMwDnQjKe6mUlVoORgTirXp?=
 =?us-ascii?Q?ZhlvVtYgHWKZiDn7+zNjZLWtitjTOFZSfFucTa1CHfi2/poQmuLH/OWm+jhP?=
 =?us-ascii?Q?JvweH0FyDkFo8zYKtXjEmEItbcwnF/cGMk1Q995N35mF584Ah7Z+9fg0253o?=
 =?us-ascii?Q?Y0zTNANScEcMrYvzExHhXtWr4SPtzZW2Df8Z0cUYZCd4WvK9P6vPhn4v1pNt?=
 =?us-ascii?Q?hleI0KvpQF9jSdsTjXFsV0WDevPQAZs/ttANF5W7VRfeKvfMI7V8S3lYZtWp?=
 =?us-ascii?Q?YIZGf0b1brLCE/NpmjdLek1EA9DHF0PkRhcIksnXfKIabv4yqBYi+oJbMFrL?=
 =?us-ascii?Q?Hnhj1BG8FhG8PJdJ/LGFuALM28fw7/gWUsZPceRW+1UXQMVPP/9Y6WDCuTfH?=
 =?us-ascii?Q?kSG4UMYvOWDv9khYb50u3G0mns3caD9TjtSQNjiybGGebiTPCNycIrYkGtX1?=
 =?us-ascii?Q?0+E9zEBEZI2IBQY3hqxWJN1vpK6/bRihEJlx954hpLp2/IdSaiISlFuKa+UE?=
 =?us-ascii?Q?p8E9drzwK/dAl1Zy1Bj17hbbnBlF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(1800799024)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pjXX/8B/v4xOBikIJ28KoIKns1M7CP6IXySjYVyG/rFBVcuSHK4YkdP0fZNc?=
 =?us-ascii?Q?HlJFiVDBz0MpHRyojfrsstGQD32uqyoUAUZcKHVaumrItFfGcc/ZxPik1zuU?=
 =?us-ascii?Q?2LUcPAKgJdZzBJAp4cUEITF7T434tOIgZW8m4vAVrMD8Y+yv7z7eViZDavbb?=
 =?us-ascii?Q?Z4lDoM6YoJC3tkZKSEEXLCANDsW5J1nvhZySJ7asGdnUhBDVJMjDJuhYXGN/?=
 =?us-ascii?Q?LVNS4o1TfeJG8Q+1Y6qmfN+0rK23GelrhTxCLRjVRHmoe1evG07pO7FyJ/+T?=
 =?us-ascii?Q?qnwj6szDRtycf68tjCcVaVVFuUUVX1+PBKR/0rG6T0CfXp4q3YXnMUIKqu87?=
 =?us-ascii?Q?fd7nVi/S+UP9wfYtFXNsctL1+0M7L2uj2oHQ0f6D708skKybs43YMEPG7OWr?=
 =?us-ascii?Q?ahK/d2hujBA0X5KeJUXlNcFseSsdpvSC1qgzmzdqZLtDPLMhMjx9bqUOzm+z?=
 =?us-ascii?Q?IK+3ZxafqaDbXebJuh18RZdESRyKL7aOlL2zAGzRvxQ8b4UKPi4qbe2XVC7z?=
 =?us-ascii?Q?K8+dI1di9R1lThYO+pQt5deyRyiOYJoIf0M+Dvywj8dOz1xq1gCozNzkj9fI?=
 =?us-ascii?Q?l2tBHXpILj36EVtlPdhjmVvlH98tEt17hQYi6Qd391ePjh43DHqbo2wnLCXB?=
 =?us-ascii?Q?2+ZzcGHcqvlWVESxbe2sbbjfSUn/LjvGBJfueQfj933eM4A+ch1C92EEVCJn?=
 =?us-ascii?Q?RhIDEe6Nz3nuQZHNEnB/M29As1+skwabKSuv5+NuQRhJDYBnXmZkAL9FVdV1?=
 =?us-ascii?Q?VZHxJC+PmrrktiEbeMPEU/ejpOZ8ZtAVvWdNYAVEUfOxSpm78kIzFLVCywR0?=
 =?us-ascii?Q?JssS1ABvyIZbrinI0hxz7xR6ggBo6s8T43RkZNr8fXVXe2Zr/M1gQP8lX3xc?=
 =?us-ascii?Q?otCCzPzscvw+BjrzT2bxqdVK8E284GNG3Zkruch4C2t5Wd4smGIOx7FewxU3?=
 =?us-ascii?Q?s/0cKoGRkevZQ/J5osgqi3hLniTr2Le885n2jK4A26shfOM90IVU+1J9J3cD?=
 =?us-ascii?Q?FkBtqeatWTiQRRMAFT8Ib6jk3MUmBISUPSYMjp94JpH7QsAYDJdwIAYi2vBr?=
 =?us-ascii?Q?G3SqVFgyAtbi+XjK5PEExKf4t8jHGTvxrC3dz7+dncTDTU85tFcswcFpqoXr?=
 =?us-ascii?Q?MAEepDMh2XXBgCNLTTKv+nr47EqHtV1FJlQdDztZ5WZurXtbfm6FRM6pBq3Q?=
 =?us-ascii?Q?+Ep4LnElDJ9XHPNEsLykDgwmwy4zPCMmVGWjftzTSvWMrMnV7qnKCX1p0Pu+?=
 =?us-ascii?Q?JJcuerialyo47AdiwKYmxu1LYLjCbDS3rnNm8T1uin/HXqw+E2tPGtekgZUA?=
 =?us-ascii?Q?Id15kt5snVpiTr9sdwNgo6wwm5tNpO42EJIaaK9zNemn1e8R4iX2SfMeogNN?=
 =?us-ascii?Q?bh9cpzmJyMWJiB+iLKUHx/xNXiQ0iOnhDnVhsDQIxiIUnv1c3R5ne3252igS?=
 =?us-ascii?Q?fJDw9uIpqC5jqp5X+r/eEq22n3OY772uG3ZEQ+HJtB1tKxdNPqq35p+pece5?=
 =?us-ascii?Q?I/fhUHPdcJx4oeZEO1Ie59wPV98NAGSOwEtFpW3a0PIgHhEejlMtY6eQ6qni?=
 =?us-ascii?Q?cG3K+WkbjkmCxmK3sx885OhBu6CNkr8NglplYffa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd56f63-0d1e-498c-8570-08dd5b055edc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:14:38.3230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/tcrJszjzgSDlTRlz2Uig/3q3ftShSi/rAm0CVkhIGiusb5rPBg6oV/bB8f965Or8Ebae5LbS0GuIKjKwm/fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9868
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document DPI color codings according to MIPI Alliance Standard for
Display Pixel Interface(DPI-2) Version 2.00(15 September 2005).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/display/dpi-color-coding.yaml    | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/dpi-color-coding.yaml

diff --git a/Documentation/devicetree/bindings/display/dpi-color-coding.yaml b/Documentation/devicetree/bindings/display/dpi-color-coding.yaml
new file mode 100644
index 000000000000..6430d6f1ddd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/dpi-color-coding.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/dpi-color-coding.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPI DPI Interface Color Coding
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description:
+  MIPI Alliance Standard for Display Pixel Interface(DPI-2) Version 2.00(15
+  September 2005) specifies color codings at the DPI interface.
+
+properties:
+  dpi-color-coding:
+    enum:
+      - 16bit-configuration1
+      - 16bit-configuration2
+      - 16bit-configuration3
+      - 18bit-configuration1
+      - 18bit-configuration2
+      - 24bit
+    description: |
+      This table specifies the mapping of data bits, as components of primary
+      pixel color values red(R), green(G) and blue(B), to signal lines at the
+      interface.
+
+      +--------+--------------------------+-----------------+--------+
+      | Signal |          16-bit          |      18-bit     |        |
+      |        +--------+--------+--------+--------+--------+ 24-bit |
+      | Line   |  cfg1  |  cfg2  |  cfg3  |  cfg1  |  cfg2  |        |
+      +========+========+========+========+========+========+========+
+      |   D23  | unused | unused | unused | unused | unused |   R7   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D22  | unused | unused | unused | unused | unused |   R6   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D21  | unused | unused |   R4   | unused |   R5   |   R5   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D20  | unused |   R4   |   R3   | unused |   R4   |   R4   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D19  | unused |   R3   |   R2   | unused |   R3   |   R3   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D18  | unused |   R2   |   R1   | unused |   R2   |   R2   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D17  | unused |   R1   |   R0   |   R5   |   R1   |   R1   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D16  | unused |   R0   | unused |   R4   |   R0   |   R0   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D15  |   R4   | unused | unused |   R3   | unused |   G7   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D14  |   R3   | unused | unused |   R2   | unused |   G6   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D13  |   R2   |   G5   |   G5   |   R1   |   G5   |   G5   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D12  |   R1   |   G4   |   G4   |   R0   |   G4   |   G4   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D11  |   R0   |   G3   |   G3   |   G5   |   G3   |   G3   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D10  |   G5   |   G2   |   G2   |   G4   |   G2   |   G2   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D9   |   G4   |   G1   |   G1   |   G3   |   G1   |   G1   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D8   |   G3   |   G0   |   G0   |   G2   |   G0   |   G0   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D7   |   G2   | unused | unused |   G1   | unused |   B7   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D6   |   G1   | unused | unused |   G0   | unused |   B6   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D5   |   G0   | unused |   B4   |   B5   |   B5   |   B5   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D4   |   B4   |   B4   |   B3   |   B4   |   B4   |   B4   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D3   |   B3   |   B3   |   B2   |   B3   |   B3   |   B3   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D2   |   B2   |   B2   |   B1   |   B2   |   B2   |   B2   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D1   |   B1   |   B1   |   B0   |   B1   |   B1   |   B1   |
+      +--------+--------+--------+--------+--------+--------+--------+
+      |   D0   |   B0   |   B0   | unused |   B0   |   B0   |   B0   |
+      +--------+--------+--------+--------+--------+--------+--------+
+
+      There are three mappings for 16-bit pixels to data signals, two mappings
+      for 18-bit pixels to data signals, and one mapping for 24-bit pixels to
+      data signals.
+
+additionalProperties: true
+
+...
-- 
2.34.1

