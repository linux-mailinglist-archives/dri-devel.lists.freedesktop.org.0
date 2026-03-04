Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CESDMOAYqGkVoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:34:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916F1FF0AC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EC910E181;
	Wed,  4 Mar 2026 11:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eC1FyJUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8533710E136
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xktP9cl5J0XXg1e1KeWhc+71zvmCtMQPYGtVxTzxpcFC2lxQuvetmMYjb1W4EsJOKQDQWpP72i8BaYqRYhZ/I4w60kg4tK5OTXOiCkVkDbUzdMm34CPVQkqrmfTVSaJXuooARK5ui9SOpH6y2P+vpPDNnnaQbteiN5CIJ88S8wF3u/s/bKestqKP737nRxpTqjXDqQv1k/9df48owPmsskRFkdjtQ3ZQNx4wfCpK4QJ/0omawUJpwGs9jZSS5icjsADMFNVBOSk9yFQbr2XjOJ+8Yd0C3JIUB3tAEjfJ1Ud8zNpi//JeFUnz/2SbEta07ioT95VVnktt1zQo+RBsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkkMlRHRMa0R1vMZ0wcCMT9hJOHlKA1WbEGTSAhUed4=;
 b=GoirUmK/+gzaCRyyY8sfIN1/fgj8JDr8ytCsQpMUJallhxAWrHajPmlWhOUai0QkcLbXLj6k+8U8mylgDzFGhJk2rU5JzAg1mq53md9KOfhG6ctXmeDD765q5mAevSeJSjgW4VGAZkRiyG3bhx4qG3UueIIjhEz0o14tT3O+knhmI2e0zZR8e4IYuXgjmdFHtVng/X531ApFJr/RVKToAPiIhMCHee+XKEuWD6ReN63jmmcclCct+rHr4LylgiSVUreomEUjaor4TSAvXW2AUIDwsNW0KG2DRx9QBHGuQftW+MAbHmQIn4IbbyyIQolfq8cRjngUH5OtWPq/0wa72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkkMlRHRMa0R1vMZ0wcCMT9hJOHlKA1WbEGTSAhUed4=;
 b=eC1FyJUgiaZBYITC/PaNm+PiXGh+yw8ymm43rIu26N/W5UzvhfF2jPKpvi9sh3GCcT2/fvW6yUK9OjmsqoJRJjCuD4gjig/L/WTgngvhmdDjayeqgJrhJKlgQrvsLHNwTCmYR2i0wRVYRkJipazFj5UpbEog7tJZVJ33InX0oPn+lF9PlTPIsTXSry1AOht/COlrlx5XA15k0ndqeG5L4ZjPBE116PanuGGj2+NKIRYzfo8bfZcXjeNGsI/A3cFoU1hMmXlFSCMIICMjRQOSRQ69oLsj3ctpKhOi40aFZJDJIf3f8DnE/CgFSZTa4tB6ezyCD1VA6KQLQxJgWkknuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:34:46 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:34:46 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Ying Liu <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Wed,  4 Mar 2026 11:34:10 +0000
Message-ID: <20260304-dcif-upstreaming-v8-1-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::18) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 882d20a8-a457-4b18-ac8d-08de79e209ad
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: spyGv88X4MkbLr8Jaaa59NCb4tWm/R88ACd7kUlLSKg20zmdcH9mBNDhSw1bgc/4gX4wxhft9SOa65IzumkdmKQ4p4MGrQJBwyOBAbRFrbJW/yOh/tkcyNzPxxFH+wMq792+KN00vC6DyF3KvedHTr3NXxpOGvnLmOhGnkqSnQo6t1O20wvpI6DX0wOKX7I6CtXKdkFbNWpmPjD7M0qha8SB//0JgGI4WO9ryk7/BterNEpu6bpx8qAkJ6CyZ255boS9in7gGLB41+3LOSOxa+0cRrAKCna4YNXbV5O731VyVmGN6S2wKy+mVa3zH/Y52YihO4Rwvxl2Qnwvae7wSZuZfXs5ERDlPYGRgwBT1g7TXjS1HmIjRNdxau4CTwE7UBt6jJ34JxSR+JN06GNcFaO5lyGivErSf+VjGGOtTp7gUEPUdH/Fu6EjK0s/4wi4t2RBIQ8Y3aKtDXS6cO6JEkc7iBo5dy155SXjrk9MTN80LnzhcFpL4n4CW6dZSPkAEafeQvEnj3m0YKhspjwrcqgk0SToAbalbuY/sBlvDsfGrOX2QBpkI2JRG9GVygz9VWuayYrHJxh56a8d+P5kwxfAesxNXjl54d7IsUI6q6s+PAJw+tp1Exty21LiJtwHMTnszlcg25u95k3c3ktg8A8IWdqDSNpjYgwM/UDcTcy2OrAoN2jvpTwlisRsERtVKThHojRwRM8I4gYR+o79QYuVsMak84PX3WoNdjyklddjd2Z7iqCMIIkXxVyPiNLwidkH0Ycq/POz60l+NHhsHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGRjMmdIMXNUUDU0b2g3SFA5ZFhOYkc3aytKU1Q1bUtsc0lZUmRBR1dYNmNn?=
 =?utf-8?B?RW1tYUlJSlluQzkvQ1NlSXdRMGJkcFFNTkJUTEQzVVV4MExXb2ZSbDB1MEdO?=
 =?utf-8?B?TTQxeDhlcnRJZWFWZjNjWWkvNDdkdisrOEJZRWNYM3BWMmJhOWd0enByZzEy?=
 =?utf-8?B?UFlaTXhUNjV1bHRwZjN0UzBvek4yZC9UZjdGalQ0QStqMWlxL1JZQmJpVk1t?=
 =?utf-8?B?SU93TDV0Y0NlZE1IUlFSNEpxY1NtRjBCYVJVRWo5UWRtNlpSa1NSVzlXOERn?=
 =?utf-8?B?STRHSHV1QnNYbXNhNzB1eTIyVlFZTzZabWFvZXRKMVcxY0hTU2RORzltbW1j?=
 =?utf-8?B?dGxJbFVwOFVyQml0TFpmdEYwWWVXcFV5RlNXOVZJbG8wcjFoUzdEaUVrZnVO?=
 =?utf-8?B?YmFSTE5BYmZyZmppZ0JXK3FvT2JON1hDM0lCb3V4eDliamc2ejdjamlrck1w?=
 =?utf-8?B?T1FXeW9nZDRWb3FaYnk4bVBSOVllOHVIanJScXhocTY2ZDRFaWdIcFZ6cGRH?=
 =?utf-8?B?YWtmdm45QStkWGtPWUlhTVp2NlYyTDRIWjY2Zm5QTWlod0pEYjZqa05VeVp1?=
 =?utf-8?B?L2IvdkRmMjdaZS9NMHdoU2VUQ2NsQWF2YkxMWDlkd2ZRaFozeWkycHFxTWln?=
 =?utf-8?B?eXh6dEFJY2tOMk0xeFNuWDM1ZWkrVjQ2emEweFBlcDhwQUNvVzFLOEVOY2I3?=
 =?utf-8?B?dFlGcnlVbzNycDFNc2JxcTErd0dnVGozVG84Z213U0M1MHFHSWJZV2Q4SEhr?=
 =?utf-8?B?aUZqV0oyMWRhUE9UTng3RFkreXM1UndTNmRzb2xYMHNheGd4ODhpd0M2S1E5?=
 =?utf-8?B?UHhsUDRoV2hTUFdvajN5MnlXQ1QrS3AzWVA4SVFuVWxsOTQ2ZmFyRkVzU1U3?=
 =?utf-8?B?Wnp2dGtZdmpYM1VBWWk1c0Y1U0xCOFcvcVFjVHZXSGR6Y3gvNnpWK2dqNUZL?=
 =?utf-8?B?TGpQemFMSklkNnlpZVRzcFdBNy9Nd1ZxR0pTNm5VZWE0R05keitQMEFyMit4?=
 =?utf-8?B?VlJ3SDd1ZXoxLzhLWHF3K1dQdHRGKzFlNXc4QUdXODVzdlVUeFRWa256V0V6?=
 =?utf-8?B?WHFJZTR6MGYxM0l5NG5tUnlFNlVsLzZPNjNRRzI4UFM0YlA4eWRnMy81RDZO?=
 =?utf-8?B?V0crbHFtYnN0UUQ3SGZnTGJ4Q0tPTGVSVXdObDhEV2wvdkhnVTNxRzFwY0JD?=
 =?utf-8?B?UUZsMndoYmR2NlZibWc5TU5veWhEOE5ZekRScXgrT1ZQUGR6V2dIMG5abU1o?=
 =?utf-8?B?TjV3YXFXMWYwb2RlNndoSUFtVnErNEkwVEVoRGRVODBpZHNZZ2l6bkVMQjd2?=
 =?utf-8?B?TU5aZW5GMTh6bUZPQy9nM1ZWQTVYK0wvVUxPLzYyNGJtc1NOT0VPUWJ2RXFv?=
 =?utf-8?B?RkVXM2k2aXdlRE9QSzN4aSt4Y05LdGVBK0JseEtSaVhSems5YVRxUDJHck9n?=
 =?utf-8?B?QXRwOFlDNTNiUTRIZUsxdU1TREs2ZWdDcjd1bGpxVDNBREdyTzlEeDc5ZVBV?=
 =?utf-8?B?c2xmcjhmRmE0ekFaZ1RDNWRveFJDQVlQc3N3RCtkaHh5WFpaVUh6UFROTlF5?=
 =?utf-8?B?UkFSQ2lJZlpvVWtOT3BGSy9IdEkxVVR6NU5wRVNZUm5lWlBIakVmZm1mRWZk?=
 =?utf-8?B?K01JdVUvODdvSm9reEUrK2xaTXNLcVRqYUNCVG10eVFXdzNpMFBaLzhDZkxK?=
 =?utf-8?B?NzZnZGFkSjZuZThwZVh3WnRmckxqM3djekZsV2FkZHJiOFgwamR1REtZcFYr?=
 =?utf-8?B?YlFGeVErMVlVSjNXYkFGY3YwMlRJQVkvbGEvYkJLQ05LUlFuZitMUnFzaDI3?=
 =?utf-8?B?MU1PSE1xSlljTjZjSktHT3VNY01KTjN3Sm1IeThjdzlVTmg4cXJyM2oyam1p?=
 =?utf-8?B?dTI5bkZNMUtMMWRuTlFITURWMGJlQk9FMkxCd2E4NnpqT1I2Mks3ODVTSkoz?=
 =?utf-8?B?MnJYSE5DbERPeVlrYXNTU2RuTlZKYzczVS9PaDUwSTlaK1E5QmM4UnlQYkN1?=
 =?utf-8?B?a2ZTWEpxVXBBR3YvcFc4L3RpNHRFeUdINTNveUMrczhMNVIwZ2VmNHlXOThL?=
 =?utf-8?B?eEpuNngwMzZNRzJDL2s4OHlZSFNNc2pyMEx4VnA4N0VCRnRvLzRkRU12cDYw?=
 =?utf-8?B?V2RrMXF5eCtjUlltQmpYQzFjRE9QSUhtdmRwY05HbFFabFRnbmIzRk9TMTh1?=
 =?utf-8?B?SzI1ZlFoL0N0bE8wZ0ZXVkhSaGdoTUJ1L1V3MGUvb1h6THlyclI4alpCVkRV?=
 =?utf-8?B?QklXK0F2OERmakVmVHJUa3BHQUdQWDhwVWtrZGtBVzZBWGxaREVhYkJDQU05?=
 =?utf-8?B?aHJ5U3FFTGxQbU92UXp4UlRwSlMxMmFGMGRvdStKVzlTVlg3RGpDUitoZkxX?=
 =?utf-8?Q?UVXpnzuyJ/0ZpKF0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882d20a8-a457-4b18-ac8d-08de79e209ad
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:34:46.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4N9LT9NpN96dAIGYoWj/MiCL0WAgZ75CDudeYzZpni+FIKGiVLHlYiOizn5/sKBvEGELD8IFEV2maJeO3N8lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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
X-Rspamd-Queue-Id: 5916F1FF0AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:marex@denx.de,m:Frank.Li@nxp.com,m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,denx.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,linaro.org:email]
X-Rspamd-Action: no action

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 7f380879fffdf..fb70409161fc0 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -78,6 +79,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:

-- 
2.51.0
