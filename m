Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL5YM/YYqGkVoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:35:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C641FF114
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A17610E9C7;
	Wed,  4 Mar 2026 11:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fRiHstob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B97310E9C8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tau1vEG3+a/A8Yq71O5YbQmGwp/wNjoE+t2whLXfNVCPQesMZZkzequQFrrioBY44gHbrdCwa44RyXn8SCKdkqDx1yzLrRMYWGIWsNGaPXTekRMnF5e4WPTkDdx9F8iVaJV45cG58v0kx2Bm24WyvsGpuL/n6EO4/pIrtBOVtQJoj/PNW1tOfk4G2kfnVNJV0wJxBMyAOngYhe69GW7qnH8LUYDTf/nWn9g0XZFrh2qX3/3FJ1rumPzET4AseDy9PsA9hNT7TGtAHoO+WgnhH4/jUNSVFngUdBOmjk2ZtQLtk3/gta16h6N+s4ybsPnoi3mj+ezxykficnpumA5Czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhGDEx9o9rS2Au9SfGJRzMNdjhwZX8RTiMlAGU49gZM=;
 b=rT3T8CnVNFrjf/XkO3mkg1gj6+sBzzX0U4qJN5My1d8G3wo14pvuSwxtVshOEBNF0caIrBxDjykkTnxvfb0eSoudEcDNgRCGkB07z8evJrfUTBBudLLJABwVYMKLyeVr3NQDxi1qSE799sWGEQrckSOjFGcuB6sUDtf68tqLs1xQpt9rSfv/KZnKAESgfEc77DHVlghsw3Lt3jsF/4OYxYjpHXnN3QwACj/6gRUL62G8VrZBUvqhU5A4UhoHiUqxAXmanOeJ9VtAMCjMlondwff4UEVc7JQ9Q9vJsbxZM6lt31tyiwKDzLdi5qdYtqh1juh43mFrOS4oTyureRbykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhGDEx9o9rS2Au9SfGJRzMNdjhwZX8RTiMlAGU49gZM=;
 b=fRiHstobs340ZSMIaDiu7iaa0sE92wHoSvZyoqkaUfFxlzT5We8CFyR2nK/cPYKcZE2/lBDjiabVsuTSY39vV5V6d71tKwsIlC+6k99YxNLFwnDMK/p3GhCpB2FIB1uUy9v6d+YIgRcY61qhEAlLAbAW3ZQhpxSZrVy6dH8PDd8w1oZSz4/cOGQwUw5RFI288o2FBeu3vDOhu6sP0L3bgRsbSJOD47OrfIPtpilVunciLER5KAw8kkuJaeX/0e2MdGQsoQEizCrBTIwxnX4hsWdi9K7sCZ2rU4h1oHtyCxU/l126bmgb3tWbhVqjedaW4Z8pixLGBo1bnhIf2BE7kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:35:11 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:35:11 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Ying Liu <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 9/9] MAINTAINERS: Add entry for i.MX94 DCIF driver
Date: Wed,  4 Mar 2026 11:34:18 +0000
Message-ID: <20260304-dcif-upstreaming-v8-9-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::10) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c0d9cb-67ea-435e-94f2-08de79e21870
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: dqQlm6bvaXN9DqSyA04MNJGMsqMKL3ijkMlWhSGaiG4uo0w5o0xaxDYQzXC3xTsvH1b/yFgaZPEOFAfe3u3sqboByatLlzYvzJH8XVsgSpsPQxCKgaub0EwOS3f6FrX1lZL3c+KacKfVincg3dZPE2nXd3p08uIukbnx1/U5y431kiRYfm0NQnBBhkLu3aMzM5fKhtd+ePlASj9lObBHqPrQ5aMdtSAmWvVqpOGPjloHvXDQEefs+JE9XK42usVaDnTOHXeZTpmRoX7x2y7WGS9pzRsaFy0g38CorHjM6kX+lKG++MqOCADL0oRCc29UlzgKf6I17Td7Wou9X137omnU31M41wfOGmDrH2pCoW3QE9lSHMj7SSooWZ+L392l36r9cwc/FWIRgRUI024blSEl1Q9KoBFj3/N/x51x5YfQxLWtMZ0l22wKVfrPLLcPBwTuKJkZDoUSWja+p6lVtXCzXvcn5+ewBtK/5FzzEpfznpXTQzHo0LrVq/OdEZocfpsyaQ4G+1Cw/5LCLoov6F3lHM35SPxx3gqcUQ1Oew1RnlQ18WrSRit8xfkflb9MxyQ6Aftyc+E5WCq4nQrKUn2ERu5vJsveNGxd2AIeqveTjy13etZ8z2bggSCw4vn/3HCwNl1lyyHGY2kfCLCM3di81WLKO+mD7ZO2DsOHLCSQl0HebRzkDpOOnyLjoMco
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFGWHBDbUw3aXV4QjFvNzR3RHlxb0ZZVkFqQ01FMVZwSjlUVERPQlR2UUE0?=
 =?utf-8?B?NFlONDd4RmJ6NUNUR1hhQlVlbjdkSExRVEFsanNWR0UrV01MVTRYRTZZeGY5?=
 =?utf-8?B?cXp6WCtFbWVRVFVuWjhjMlBvSzVST2hwdzJJY2sxRitOMHZ2OEl2ckpHWXpu?=
 =?utf-8?B?ZTZDMC94QTlKdUdxMEV2dC9LMXZ6NCsxcVpKMkNKdHpLTDV2R0tnQ1lQOTQy?=
 =?utf-8?B?QlhnT240S240TDdjSUhHbDBWcm1pTkFvS0ZiNzBsT2dPaEtJTEEzUGxmSUY5?=
 =?utf-8?B?dGZ3Z2tPNmFGcnhGenlzNVo0eEU5YTVjSnFXRStJUkIxbHhKdlVySmlkYVVE?=
 =?utf-8?B?NWIwQ0pUOWFsZDU4clFid21wRUhuM3VTWUFDYzlRRGpwSnZVUVNqNklOcmNE?=
 =?utf-8?B?RFZUYkoxVGxURHBFNjFKVVV4N1JjTy9LM1B0ZTJKU3FMODJpWkt4enljbCtU?=
 =?utf-8?B?UlFGSW1qMnU1MTlhSzRTY2kxU2J6OEpPYU8vYmJCZWVOUW1tTWZKS1hjZmZx?=
 =?utf-8?B?bFZxTHo3c2NzdVJnLzRaMFNQR1hOL2sxZXg0aEwxaDQweE1qdTlyUEFyMkUr?=
 =?utf-8?B?bjk5KytESUYyZ0ljWGRMbXpWVGo4WHpxSzlCaHdkMUFuQVBMSzIwUEdQWS9F?=
 =?utf-8?B?b25UYWRLKzRMaW1yOEIyaUlZZEkvNDFPWm81QkJJL085ZW1IM05nZ2NsbllL?=
 =?utf-8?B?Y29TWnU4RkJNTG1aVkFDN0U4TzJKdXQxRi9sa2J1OXI4QllqT2FsWklKQWR5?=
 =?utf-8?B?Qm43R2Q0RTVjQkl1RmFKSEcramVmOHZsc3lGRjB1bzlXUGltOTZlWFFFWTZE?=
 =?utf-8?B?VC9RdWUwY3BrS2J0STBwR0xxeHYzUzZuUkpubkVtdUdvZ3RwUmlyQ2lMMVVi?=
 =?utf-8?B?VkFKTDllbzU3VE5RY1c0N2ZqS0F2cmVtQStLTWZvaWo0M3orL1dYTnAvS1gz?=
 =?utf-8?B?TksweDMvOFZSSWgvM28wZk5HNDlNUHMyTUNhZDR3N0N5Yit5ZkEwWmZIZnds?=
 =?utf-8?B?bDQ4SmFldUZYTVh4TGdIYWlHWVdDYW9PZ2pLLzBBTFlqZytMaWYzbzBKUFU0?=
 =?utf-8?B?aFpWalZuVU9VVXVXbUxSai9CVEFPRzFSTGJlS3FRNTJNUGg5Z2ZBOTE3N0h3?=
 =?utf-8?B?d0tvMnNlU2FpM013MWQrUXdZTkFWYVJOdDR6M2Z0U2Ivdjd1YXhiNFZWbnVp?=
 =?utf-8?B?TUtyYnFyS3lZcmFXUi91KzFvMzlKUFRKWVIwai9zV3dSdys2bVJEakhMUllQ?=
 =?utf-8?B?TTU0UGlLRGg5QU5mT1ZxZ3NrZTdBRGJ0OGxNelpRdkVkdUt0dUJWMWMxSU5Y?=
 =?utf-8?B?RGhhOEVwRnNxYWxvN0JVemN0MERXZXIxTnhxVEtvVktpWmxVRzdtSCt2NWlS?=
 =?utf-8?B?N05LTWFGRU9QUG9rUWRsQ2ZEcGtzYWtaRklublloZUt5b0I2ejgvOEc0Q2d3?=
 =?utf-8?B?M0FyVEo0eWt2OXlkSGlRSWg2ZnFGb2tCWVJFNG90Y2pHT2JjenozQldRSUU5?=
 =?utf-8?B?VXU0WFZycHJlM0tBU1o0M2pHZzE0MzdwMFF1WDJIaFh5U01nWXQ4aGRQL2hq?=
 =?utf-8?B?SEZGL28ramR5STE0Mi94N2cvclBjRmlwY1FlUi9IK1lVdkE4aDlEaWQzdWo0?=
 =?utf-8?B?NDF3dDFuSmVERWtFZkh0L2d0dHBEcWluNnNLSTl3UDNkb0RnV2Q2WVlIallG?=
 =?utf-8?B?QTNvUzhpbDN3Ymtvako5SWp3c3l6cldvUmZhZ1ptUVlBcEQ3YTUwOGRrWG1q?=
 =?utf-8?B?NmtsWGdweERPUWVodVdtSWZSWWhrZXZSb0I3Mnlsdnc1eDkyQytPMlcwZWVq?=
 =?utf-8?B?cGt4aXlNWVBrYlVTUHR5eU5ERUp6NUxGNHFrLzh4dlFEa1hNZWdoYVhTOUZS?=
 =?utf-8?B?YXBBUUt6dDAzR0RJVDVoTklEbXNOWU5VcWpHYzJINjIzeHFUSDY5cjh5VHFx?=
 =?utf-8?B?UXhNUGZCblZBcDU5NitHcDZEeWN2VjluNDhOQUZYT1dtU2M0ajgvc1pIK2ZH?=
 =?utf-8?B?eWY4ZFdiQ2c3TjA5TkRQd0kxNG1md2dHaS8vcWh6R2dtTm5TWFNCdDF6WDVY?=
 =?utf-8?B?bHZmRGNaY3BMbDg1SFk2THNOMUNEUStKUkxoVjN3UUJyMm4rMVUwS1o5K1lw?=
 =?utf-8?B?bHJWYnJOZUd0T3dXRHVMdWc3dm5sMjBJUEZlQWZjcmlMRzdQdWNPWkxveHdZ?=
 =?utf-8?B?ZlBnUlgzTlAvSjlVOFdMMkxna0xOZHUxa0NydVlON1pjRnd5SXA1WXFmMzNI?=
 =?utf-8?B?UGREOEtZU1lMRDNHSnlieDlGTHJXZVoyL0tRTFdQVEtlSGY0RFI5V1JoWExY?=
 =?utf-8?B?a3Zja0NFeWU2OGQxalFhS29aakp1cDlTb3diaWp6N2dlY3MxQTM3bXdDRno5?=
 =?utf-8?Q?Cbjwc8aBRWkLwilg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c0d9cb-67ea-435e-94f2-08de79e21870
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:35:11.3943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApS9QisiDce3HllU6SJNS055wfAVZeEy3ZK52Ko3hYMQS1CqPqFBz0WI9GmBA8E4iooSBwhJJiq9RvizrO4hog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
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
X-Rspamd-Queue-Id: 46C641FF114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email,i.mx:url,NXP1.onmicrosoft.com:dkim,lists.freedesktop.org:email]
X-Rspamd-Action: no action

The driver is part of DRM subsystem and is located in
drivers/gpu/drm/imx/dcif.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 364f0bec87489..306e04d6885ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19117,6 +19117,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 94 DCIF DRIVER
+M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
+F:	drivers/gpu/drm/imx/dcif/
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>

-- 
2.51.0
