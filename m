Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C2A6D31C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 03:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE3410E1F6;
	Mon, 24 Mar 2025 02:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IlpH9IQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012023.outbound.protection.outlook.com [52.101.71.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B632810E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 02:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGHF9iiagdVA1pEgt8dfnTIpC6wvNEUlZuZO/QEEuFipQj1YRxD0IVLmyoVAGwYtXtLd/SaoTwCwy7XAPlJIISZa+uwvBZczlZmx6yH58FZEEMcM+BbLdmJ2LlWHdw1S3JFX7ztMV0EuRzPCQbbdh/DID9LWLUMhzfoG/LyZCes733Q1V3QjAc6VWieMhJP5sKxf84+k90/Y9QT0oV38dIujbudshy/UUX1ll5vT44x2nXISA1sDJiW3rfj3ILzrLBzV44TCpoH4yuJMR11BVL6+2NyNL3NFY7rdert6neg17vJ17zV9/nLamA75T5pQoIOK45OERMOo7ElNh9KmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7co0SibGw9ufvGZV4MLrESstKwiUdoM4q7zsKoXtyhw=;
 b=UnboQaFhSuZZZxm3VA4WuuMUK/kiRiMqyL8ALLRgkod2j7rpNHQwmnymnmQBPGI/pzpy5597cingE6migiNHMjyCiLvaNzeC6nFmJMDLOc3urbNOy1Y8uGYI3hkfHWO+EgqWdH72YUqMS59GJke3W1IglD0kzp4JBXmmo8d898OUfeeVNLF8smoNY3tNDhUHmxMx2Raazgm8mALjcbQ3/ksSVIasdcKcDHNJ7KSr2rwnZvyv2u8XfNE86TOi67cYQsAwx5jeVO7pmvQb7JNMLhFQOd0try7lJZl8eUz17p52Tp6LxuU1NEsEu72/5+uGrHtKj9svnwb6wk4n/P070Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7co0SibGw9ufvGZV4MLrESstKwiUdoM4q7zsKoXtyhw=;
 b=IlpH9IQdeEg2dH4p3A+8dv+WK6iUqK8CQ4zq5f2gL9B78Mj0bcvV0CW1VscUofpcl9hhbyBQzeVxpyvThE4aeB1O9h8849yFjG50MIU87m1J790+6ZpSBMHyMWvFne75f+hMERtpDIQJNSCJwW6SRiIdC13OPgxbNQxxmh0E69Fce/w9jObti0ff+VCjou8zqV+ClB55Rqcd6BhIfAAYHqOxYJwEvhTdeOIF3rhtjcymQyS5kae6ZDaCRHAV/dLuWb8iyYnvtc05vxRGZvWy+oDv5XPPs3zWmZI8gAqH3abxEsWopHTb62LnOsenln/whQXdRwiNyaD2BiSJZcnPqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:39:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:39:53 +0000
Message-ID: <7d46525f-6060-4f1b-934f-abded0a7b791@nxp.com>
Date: Mon, 24 Mar 2025 10:41:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/bridge: fsl-ldb: make warning message more
 informative
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-2-f139d768b92c@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250306-drm-two-ldb-improvements-v1-2-f139d768b92c@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 60232570-fab7-4379-7e38-08dd6a7d284f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUdwSmVsRUg5NWc1WkhheWJ4U3I5VURlNzFOcEQ0dnBUVVRvU1k1RVBVVHRs?=
 =?utf-8?B?SWpGZTR5bE9nY1dtaTR0SWI3SFVqeVE0bUsrSWlMSDFPWG5ObW1YRzd3OE1h?=
 =?utf-8?B?eFVFNzFiQ2ljL3NxTnhVOHRSbkN5anJlTDNaZmRZblJwWXRuOFQvWDNsKzdX?=
 =?utf-8?B?UEl1c1ptczNCM0dXVEtXOWV5SFk3alJDRmtUTzA2YWN5TW9IallqNVl4Q3FB?=
 =?utf-8?B?Rnh6R1RXS01LbzVvc1E3M0hHNm9WMWZ3RC9VdTE0TktFMUxLWmY0ZThPYkti?=
 =?utf-8?B?citxTUx0UklWZUc2RzVYYkxpWlpzREZtaWJsQTNUbVl3dDJlWitoTE95MEtz?=
 =?utf-8?B?UWp2aytxc1JDSWMwSy9LWWpiajQ4ZkpmUGU4a2o3d1FDVEl0YU8zV3hWaFFY?=
 =?utf-8?B?a1N3eTFaZFk0SUNnd3ZlTlZWa3RXQ1pkUDFmZ3QzNklYYldtWXNXSVVpUXJo?=
 =?utf-8?B?Mzl6WHhlSFpoaUs3QTVTekI2SVhmNUgzcFB2K3YxQkFxTU1CK1laTXMrMjBM?=
 =?utf-8?B?c2RFakRwYUhRZkFCanljMnRGbE1HQzBMbUVZdDBPdHNtbTdLV1ErdHdIZkpa?=
 =?utf-8?B?RWtxTGk1VFppb2M5bHZSQ0F5aHcvS1JLdGlubjJaY2UzTWh0cnRWa0RHUm9v?=
 =?utf-8?B?N0x4dWJmWHVFUUJ3cGhLS25jYUZ6OTRwRUQ3R2kybytoNWRaVVZqZmFVcEl6?=
 =?utf-8?B?c0lYVzB0bmE1L2FWaVZ2QWZGQjJneGNnL2t5OXlEZi90b2JCc0JGYzJwVUhX?=
 =?utf-8?B?NjducmdzbC9vSTUxYzA1U1NXa3NnNE5qemlQT0thU2JGenhGQlJZMWRZWml3?=
 =?utf-8?B?MUxlTjdUQlUwQWNsOVM1RkJOMklKWmlkTFA4MXdiYkR1QnBZSXlqSld1dEpV?=
 =?utf-8?B?ZDVBQVcvUVl5TCtYYituZ2RJb0ZhaFVzdmE4Q3RLdjlCVnlrcmhoZ0FoMWJU?=
 =?utf-8?B?cHl1czNMZ0FyMmlOTTNDdEtwNFdCYlAyOHFBcG12bGh4TlZuVHQ1VzlDcUox?=
 =?utf-8?B?bUdXWWZiSXM5TkRTUWd6SkJGcDI0a3YvNlE3NmVtQXBHL3dGeGtrak95Z3lz?=
 =?utf-8?B?R3BHd2Fid1hpSFNhY0ZYK2trRzVFdmtRQWtjTjlRdUlmK2IxZ3NMUDkxRXVS?=
 =?utf-8?B?ZWZYdnlpc2FWcDl6bzlqSGFDUGR4UDZEdVpYVGtLZWJBSXNoQ09HaWt5U1Bl?=
 =?utf-8?B?YS81M2F1SFJEMGkyamtJeEFxNGJJOE9wR0hYS2NQcWZlYm1wRDAxTTRaOHVa?=
 =?utf-8?B?OHRCZk9kUU5WaE95bU41UC81dCsyV28rbTNKUWNLZXBQSjFiY3Q0N0EvRWR3?=
 =?utf-8?B?cEd4eXpwbzc0dmhmREhnWVJ0ZFJYWElYK0FXa1NDZDZFdEFnYnRqY1VxWmlh?=
 =?utf-8?B?OU9Ea2tmZ0IxVGxxcnlrem5HeHNqRkpvMkNML3RTYXFtRjBwVWRZcnFBZE9U?=
 =?utf-8?B?SWNFWkJIbkUxazNndXVJNm45dlBUNlJqK1VNYytLWVdqMi92M2ZxY2U1NFZQ?=
 =?utf-8?B?QXMyNDQ2dldhVUhXSWNXY3MrUVhEMWNSeEROY3B6QmoxeWUzaDhwb1BQN01D?=
 =?utf-8?B?d0I4bWxmU2wwMW9JYzVHUGp6ZHRjSmlrQXBDRkh3RFh2aHdwNUxtUUVpRDJR?=
 =?utf-8?B?ekZvTmxONEc3UUJqVzBXb1NqejFJc1pXSmdpRk8xYkhJTkdkc2VOQUE5MHdF?=
 =?utf-8?B?czBQMFJobWZnazBJR3hPK0lSQ2dGYUpaVldyejIzVnpaRmhiRmMvdEp2Y0V4?=
 =?utf-8?B?UHZaZkxTYVcxbkEya1R4N3ZjM29rSUh1azZtVDhhbUQ4Z1ZNYUxybVdCYTU3?=
 =?utf-8?B?MzBhY3QxWUxTakJhR2ZSVFV1S3FrcU5SdUM5TEVHbk0rVURSZUM2VHhiZ1g5?=
 =?utf-8?B?cmdFSHpNaTlVZnQzUVdkeDZJaEJwWUc5V3puRDErVVVKSEY4Tms5SkNQVEh1?=
 =?utf-8?Q?whhSEoKj+2A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SktjdG1NRFFwT1lZQmgzZllnYklvSEE1Uzh5dXcxcGxOOHIyNVBYRitWZDg2?=
 =?utf-8?B?eTRQc1plais2c2JYZ1Roc25CZkVIUnhlWk5ybEtBR25PakhyQnpuK05KVjZ0?=
 =?utf-8?B?aDU5K0ZSUmZBK3BOQkxKMEVxc0hqVnR5NFZSOWU0bnpDQlRSVHNTNnF4dnlC?=
 =?utf-8?B?K1hKdnNuWkFYVVhZcVJzRWtJV1hLUnpyTlQ2ekwxWUhKNVk4SEJuZWxOZms0?=
 =?utf-8?B?eG9lUGNzcThJckd3aFFRNEJxcGlHMXcrUWgvMWtPWXJhVE9RanpPVzZlWEx2?=
 =?utf-8?B?V3d1ODllczNTd1pVN0xaczVvbUJIYkNWbzRhZGpkSE5TbVBqNnVaNVJlcVll?=
 =?utf-8?B?U1pCS0lydVN3MjJ0YkRXUkcxRms4LzBQZmxvRzJKa1lsVmdFMHlSNGE5UHBz?=
 =?utf-8?B?Y0szbUFLMGYvQzEzZ0tmMEUwMHd2WFNublFJWE9ldEtqNUFBRFlqWnZZaWdM?=
 =?utf-8?B?Z2pkelBMMmkxWHhTeHlMQ2dkWHV4WGNTb00rYVdvTHl5NUc1dUJTYjlkTEJu?=
 =?utf-8?B?aHd6TFg2SW11MVUyYTZOR0l1N3RKcW91TEpQUzJDb0hvT0hBbS9obmQ2ZURN?=
 =?utf-8?B?c1E1M3plRGM3ZzFZUjRjSndmTkhyTGszVlIwNnFmUlRRYTJTcmprVUFzQjFp?=
 =?utf-8?B?a2JJbGJpNDQzZTByQWlKT1hTNm9jWThGRjVtVlhhNzFreXpOU2Q1LzNWNFB3?=
 =?utf-8?B?VGRJVE9UQU1jYWhsWGpOcy9uelNGdXo0K2I3ZDVxbGkwdExBZ1pvbGl0NDFn?=
 =?utf-8?B?YlVhV2tDSmh6VEZNTmxvTFYxOTJwMUNhOFp5aTFRcnpBb0NwcDVRQ21ZTGVi?=
 =?utf-8?B?VHVWSWtoUTdJOGRKU050L2xSVURWMm1BbUplZFlRV21JL2t3NkdhYXgwTFVi?=
 =?utf-8?B?aTVwZHQvZGxmK3pPcnhNV0tqa2ttbVdhWlVobkRyUWNhZGZxK3hWRXRib21s?=
 =?utf-8?B?TU16MmpSdDdobGN3T0pxMHU3N1R2RjNJYksxbC83RzdpUXJZV0J1QzZFcFVN?=
 =?utf-8?B?Zy8vVlVPd1FuaGhZMFpYZi8wWWJzazR1VFNvNGR2OVY4QTZaZi81eTlSQ1Rt?=
 =?utf-8?B?clF0STI4Z0xBL0RZR1Vtd1VrdFRZWlVBd205TWNwSm1vdFRSaXVVUG5hc0I1?=
 =?utf-8?B?S0E4aXVtaWZ2VTNrNW1Wc2hRTUJxK09YWkxaeEd5ajBzQTJyM0xNbEJJa1oy?=
 =?utf-8?B?SGRWbkdHZktuSEplT3BZeGs5OWxBVmh3aEl1eEtickFReEY2dEtHRFBNUWJY?=
 =?utf-8?B?VDF5THNpWWJZNDJrQWhHbkdPNW1sZFo3Z1Nkb1RHUllZVWN2bjcxUHJjdkhF?=
 =?utf-8?B?NjJRQ0NiZmVpN2ZkcUJyZGRxSVBVQ0JvZTVmeGJhY3lYbEhxNVYyWEVXSVZR?=
 =?utf-8?B?VVpDOGpNUDJUb0EwcEVaSFZjOW9ybGZ3ejZDYWZuYnAyRUlRODRJMFFiUnZ4?=
 =?utf-8?B?b2c3MU5QUVgvZGVlY0V6ZkhiZWVLRjg2U0ZIaDd4N0ZVRzgvNUo3OTU2SXpN?=
 =?utf-8?B?YjZMaU9LODFhODZqcjJnaHd2V1JoM3lmREZ2amNDcnNOTFFrMzh2aUtSNlJ2?=
 =?utf-8?B?TG1tWEErSnNJT2dNdFZMRW5la1ppN0RmVTFDUjJwMTk4M2RPQXR4d1l3ZXBL?=
 =?utf-8?B?ZUt6QnRScTRzYUlNSHhweUZtbkZEY2JCTURjV0dPUEN0MytsM0JOZWoxZkFa?=
 =?utf-8?B?N1JiRUthei9mUGFoWnowT3VqMTB1QnBiWVZjY2NBZnhpL1dLOElzL1NRMW1w?=
 =?utf-8?B?TlZuSDA2aGh2STVKV2wyTlFFNlM1ZUdnbm50NmNwc3FiRnlhT215VE85OWxV?=
 =?utf-8?B?TEN3a291VUNIYW0yY2VSMWFDNlk4S1cwOFYwUXkvYWJNdi9EbTdLeTMzMGhW?=
 =?utf-8?B?b09WQXVEQjNOc2ZWMmxyeThvQlZ1Qk0yRWMrbjR4MW1PQTg3YUhuTkJWR3Zm?=
 =?utf-8?B?TnNub1JHWjkyTGlVTDJEcHhnYzZOQVpkaDNlcWpYcVBZNzR3aHc2M2lnR3RQ?=
 =?utf-8?B?UGo0ZldhbVZIT1pQZTA1TlFSL01CTTFVY01DZ29GUUc0SkM5S3Y5YlYwK1Qw?=
 =?utf-8?B?eWtKejVOQUx3MkFoYmdjbzRIZGFvb056Q2tyOFlXeDZUVlZRU1drQnh5bGMr?=
 =?utf-8?Q?KMq//ATaZACwMAIdoU9pj5FKy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60232570-fab7-4379-7e38-08dd6a7d284f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 02:39:53.8885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfovFy4MXBkxtkyo/S5xbnq0mo8n6PIVy0C25k3QmBo8JqiNaS34EEdK8Jt0U5X/ZVZMEBsYimiJbXtKwbSdyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899
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

On 03/07/2025, Luca Ceresoli wrote:
> This warning notifies a clock was set to an inaccurate value. Modify the
> string to also show the clock name.
> 
> While doing that also rewrap the entire function call.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to misc/kernel.git (drm-misc-next).
Thanks!

-- 
Regards,
Liu Ying
