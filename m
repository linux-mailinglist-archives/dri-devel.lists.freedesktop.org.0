Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D750BA6CA7
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 11:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6724010E07C;
	Sun, 28 Sep 2025 09:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M1MKa6fM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013024.outbound.protection.outlook.com
 [52.101.83.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFDB10E07C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 09:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b213ATpB2K1ujI4pWW+FoM8nWq99CDTm4SuVfLxEGzOWOi0yKm5QJmB9HDm5JS/BGjESQJrV2rSYEx96pg2gQMWuCjH0HgF9if4nW5AvKtL/rRqSkHZBkT1Db1QjSfqnGaNi0F+o4Np2ElO3ghbHU2Ef4+adsxSDVDufTFBQxYij28/GmWHTBHriFOlXsuymcI5vYewgWL2yY53luwMdqNc+Uh0zm0cxT3OlvuViC4EdUYgGGT/LHPZmYzYu1X1Gqb5N3C7N7D13laOFUirgUT4UF55EyopFJcLex4AfHGiz6RT+Ji/aXaUfAULMT4kPo9boIDGxpxrqFfDToYDJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jH9+Di2izL1ut7Oo3ixjvCUpdwnnRFkHubm9mjFd8ko=;
 b=pIcFWLYVC+iUoBL9k1YBawcm3dYu9QL6VDBl3/31GXFh8cwtyJMSg4wtEQW+I32XQsGD8TiWwiEM/WGsNBsRvObhrC5W5D4m7KVP1HExZg5Ju4DJJl8gTLM6WuTxm0p+IEcixK96ERp6HECwTXY5B990kI/CpruTBuSjG2M/QswfNCKFepSdk1PJwuQnjWzZ7rP6dVCOuUILXbFTC/+lKzpKZdyP0S4TWNgxC/TnfUmI2R9uFP7YRnL9tXrlzbMyPtp2WeBmgXiUDrZMxsm3NybvWpkrF0J9VPnaJS/ZO8Sl2NqwSTdrOlAasTQBQm1kH/3Vn3UbZOo3eoGyjPnerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH9+Di2izL1ut7Oo3ixjvCUpdwnnRFkHubm9mjFd8ko=;
 b=M1MKa6fMbEA+MRI20vta0a6ieBVjs1XklTOcwPxxPwTmW1KXRLn1f2K7Jp98ZHnjVPMdVSBbfY+tk/CE35x6lvJ1WqsbJd5wWn946Tt4CRmHenMblu/DYVaBa4YSny4zN+2D1bu0M8l2i1rKAQCFvW2yvePGqaO+fS/vMH4QFrVUz9ypQCjZP92g+a2GO4p4gm9Umn8JSkbNbEAdmzlam253iBYWC/uvu4vi8IydxlqLEXpUGu5oEt0gtj/F8zQv45i2tfhhr5pHjxhpTQj6wiCPqspmlXt0ITqQ04ntmEGoCj/3ncAlYVV3bGRe9sxZ1chMCZvQvCQ+bPf3LIAo2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by GV2PR04MB11302.eurprd04.prod.outlook.com (2603:10a6:150:2ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 09:03:38 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9160.013; Sun, 28 Sep 2025
 09:03:38 +0000
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.co, simona@ffwll.ch, marek.vasut@mailbox.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Rain Yang <jiyu.yang@nxp.com>
Subject: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall: make mali-supply
 optional
Date: Sun, 28 Sep 2025 17:03:33 +0800
Message-Id: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|GV2PR04MB11302:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d5dc9b-7970-40a0-2798-08ddfe6de98b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|19092799006|366016|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IElttny3xSV8tkHEo617X14Lyjh2YSx9d1bk2en+KdlWuEM+ePqggSiooJT7?=
 =?us-ascii?Q?+2JVuYGe6smLczltlqawtm6ou62OzMbULkNQIWzD7c8Ya0NFF3ZErz4wmRNL?=
 =?us-ascii?Q?G8o9T1AIklEoH7UWC8v612vYGZcmIOm9dtKGQpi+Q6LGlkYeChrkpovuv+Eu?=
 =?us-ascii?Q?NrzzCllMF4H0ICANc6LT+zcI+mya3YopFeD56Ru8m9aaokPudfMqg0GjZMib?=
 =?us-ascii?Q?CggY+tkd1HQBbUWp9fa7JAq9eJGXcau/GOPMPHvgK06T1rAQa7xKDMQXjE7F?=
 =?us-ascii?Q?QG4zZHaNgmrbNhvY4Qb+kOy/5r9D6IIYkQbf0pWtMKHR8cTxK06dsUk6rUIB?=
 =?us-ascii?Q?LyYRlbQ59e1bVV2kdmSpzVTeHdbncFYN1lVXN7nlF9s4PlgQbAz1puhc+uh6?=
 =?us-ascii?Q?3rWFeFHg4KIix0OyEayCB9RHVKjdW3/ZJToCSRQ9q1aIga/urrj/sok+suYD?=
 =?us-ascii?Q?0CK+VHfDSBl4NaKKcGFPChGfh9umWdgcZdVxhpeMuyeA/rNfgNv9TlK966Ed?=
 =?us-ascii?Q?6HSxHi6Nzx9cfXLnyKWr4R+yLaQaC1XDuLDcGeWUAX3N4bX0Y/DrJg83O9a6?=
 =?us-ascii?Q?S+v7xuBUwRnAJlaM0acetQ81/FrfkInrEtIUtXDBvHr4gFqrNHKWdoXmxtXv?=
 =?us-ascii?Q?UeZ7ni0WO0qniMC7tUjYtNEynK6wpF2Z0BzQwrkJQN4ZcF9yCE87DA8pcfUt?=
 =?us-ascii?Q?BTjZHwd1pA06KdY8F04SEq4vLw72IG2s03xJtHtFg8K8ERaE9NJlsb2UYaMe?=
 =?us-ascii?Q?JZjTg3z/pxOKvtozUJEtNeKSZaOlmO8MskxqmhmM+7Xbqi0AdhEnthMUzVlt?=
 =?us-ascii?Q?3hFSFQZTQBmKxrDb8J2DTg28KH2kD6KJ6fNTWJMHrEfOHsJYYhcYSfRbDtn/?=
 =?us-ascii?Q?TEyqQ7i8fl3s0LEs7UXo2X65R0theCbSBzFIjbmRL3o7QMYIWsOgoAwTKj/2?=
 =?us-ascii?Q?9iTBrHcZnmlceIhtL85umaakdRZfkT4dxQkA94Cam/EOrVPSBX+MckWDeO61?=
 =?us-ascii?Q?NfgmYrQ7O4zZrvDbLGn58STo9rGxTH8ldcdkZzRflM7gJ0ZEiReq7y8VXBhS?=
 =?us-ascii?Q?gaVe8YXZsW3CmlHpnfz1yrSxQWsYQDXGk0xBtfp5SklclDOemLEvu/ggrQa9?=
 =?us-ascii?Q?ZXxs0ayJ49e/jKjkJ3v/eMt0Dsw1KcWs8R03uI3HgSzjcWr+XGBSJ05XoHmv?=
 =?us-ascii?Q?mdzFDB4zdFq4rX8sstUnw8y8ODm+wKuT6voAbZm62ieREp9MkUzeMqWREh8J?=
 =?us-ascii?Q?Pg30WmCVxwJyWuOaELEshufhxmg0ts8cebtAWmL7c3pYpe1quLgjRc3+N3kd?=
 =?us-ascii?Q?F2kdp/3jKraV+GHql2ThWvTT1XKUww1vPHQJ0uG7nj0Nlv/Gv/2Tldq28brW?=
 =?us-ascii?Q?/mzixg+fKmFSRNj5DAVK9Yh7aa2Xjc2NBr9ZYOCdHo293PgMrcx5cbSPlpNm?=
 =?us-ascii?Q?OfA/Rm4EAsSMmBzYKF0aB0BicV1Can7U6j84uwEN6voH2HCvL9Xy3q11myzr?=
 =?us-ascii?Q?7hoxrSCgMMDLSBPOHplPqnXRl6T1qy0/QXFI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(19092799006)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GQYl7EDiTz7OfZ6txXrxrZMDFyF/xO+sgZZl/hEiFuqdnMjlmNF6tWuYJsJA?=
 =?us-ascii?Q?OFyk2nld0rf5ZacteM2PjRGgQ+DR67YfVUCb7Uk4h5akIEN8P5OvdYuFHCPA?=
 =?us-ascii?Q?PkNJCSWSfwRxWXxyNjkKClq3KsJcbs8N6pR1oTVua+TO529M8uBIk8NenoQY?=
 =?us-ascii?Q?eoCTcmwP2gDfC7iWB5deSywb82tsmq9D65xyEtpPsFCfwtr2BPu4de40MQf9?=
 =?us-ascii?Q?zGtv/4/KkTtcTz/6BbllvmH1A/JyfBPCeNFdnd43OGbapwXnuNK9rttEjhOL?=
 =?us-ascii?Q?v8z38vghdQZ8MAdpNYTpqLMmI32IHY7IdjTdG982bM9q/thJNX3/mZDvmhZ+?=
 =?us-ascii?Q?zLN/K5asjA/ra5jUTlKGfmsAopBww1+Bqb4feoLjhuMqK1EzOQ5gUJ40YT1m?=
 =?us-ascii?Q?aSqKSJ9jXmpHZfKAqGqRL0lYy/Qu9BfvtiwV0lBajAv14uzWo8vRqfcOqRUC?=
 =?us-ascii?Q?S5cSKWGh6VYIC55v96ewBCJj/c0JMAqla5d8bp7Ro+HIkevK3YeWWYcTSTtJ?=
 =?us-ascii?Q?F98XZQ+RFYlCD54Ii6MOgGRgyj0cIGj0uKa0HrYPDLXOgY1uPtkrNGrHiqHs?=
 =?us-ascii?Q?RzChLVj5sd7K+wNaEw0Q03NlPkcQdKZdOvNqA2mWjn+07zGG6Ql9BR68lSlI?=
 =?us-ascii?Q?U5tTKx9tKr7UJlp2zZuyS21OwORT7SsWNlz/d9OGvfZTqtPyF86Ez4V6f5Ah?=
 =?us-ascii?Q?I4GZvaiJHdu65F05MAjz6EW53fi3tRgbMtjwMCGnrD+DgYCy1uNa6o9l1/5E?=
 =?us-ascii?Q?MYC+B2HkRwnHDgQQnWmciilqXSeDlyLnY6t8zSFgcjDBSwsW12qX945QmdKI?=
 =?us-ascii?Q?IJxAZPEZEIIQfH/d7Wif5AUtHeoKvt0AWzZRx+KkY4fY9NV4goIDVH7VjDVk?=
 =?us-ascii?Q?VWlYJVSf1YhSle0RLslBp/4hvD4IdvGInrDFJD/jQxPWYFTMTXYmHH1IHnog?=
 =?us-ascii?Q?n0GU8To3LP69iblgmVRBmCzWH9lyddCJSRUT6VTpMhNSy0jBgG92y2OsYibt?=
 =?us-ascii?Q?LdSrAQerKMwAcoIntshyPZRmdtJgoNrpcX4WMRt2bYhU/mFprOm7jE626iAK?=
 =?us-ascii?Q?fusBDo4P5Hqd+OM3ZYORMsCOuaNiEzKCPYJdPbq9lIp7CM2L15YO5rdlFU/f?=
 =?us-ascii?Q?gFg5gGjXDzeI4c1021451ltaFmXA/hi4E7RKHd0QP5XkG4QkUjnJXleIj1j2?=
 =?us-ascii?Q?o1Me6kquEeJf1kNSZkJKj23ExNZvKTU25Kq2Nm5dPXimwpS2WbPS/V1dImjg?=
 =?us-ascii?Q?NmPfoqXbN1Hzt4uq0Ptw1h9CdvlsMr94k4lLRQLH5wJbGb1qlN1etsB4q1qb?=
 =?us-ascii?Q?9A1m3SbLJmBVe2yDsTtTNxKiXitDLkR7bMtWNsgTdw/IX2RxzymNA0QPDsyN?=
 =?us-ascii?Q?4ZHa3C3+K7FlbyHvbey3cp6IBKDFoqybslUActFD3ILLYRq4q14CJtdK/eoV?=
 =?us-ascii?Q?KCsRTwuCvZt+xkDZ9cQY24x7cB6U2PJQnev8QGr7W6lvLSMvwWO8AMOE4zFZ?=
 =?us-ascii?Q?dxQhP79SuGJgAp1p+5bAYxtpuprIVgc6SjRXPSGd5nFW7VqbtkB9j3CQfwuR?=
 =?us-ascii?Q?y+oTKCyCJUXIuq3O1T4DLITYGJ07weBtn76IHw70?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d5dc9b-7970-40a0-2798-08ddfe6de98b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 09:03:38.3755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lBX7GZNYsHt969fXsTD5maIR307tdJugavv99nEIMsfxekjLun7aVwMsleNsl3oGWoY1DmwDaYM3ymqEajQHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11302
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

From: Rain Yang <jiyu.yang@nxp.com>

Not all platforms require the mali-supply regulator. This change removes
it from the required list in the binding schema, and make mali-supply
required for rk3588 only.

Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
---
 .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index b220cbd5362f..ef9791d8ed95 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -92,7 +92,6 @@ required:
   - interrupts
   - interrupt-names
   - clocks
-  - mali-supply
 
 additionalProperties: false
 
@@ -109,6 +108,8 @@ allOf:
         power-domains:
           maxItems: 1
         power-domain-names: false
+      required:
+        - mali-supply
 
 examples:
   - |
-- 
2.39.5

