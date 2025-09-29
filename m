Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53188BA7CF3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4457910E1F5;
	Mon, 29 Sep 2025 02:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dgzh+Bbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524C810E050
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYv2UPZKFDNB1Yrqjc2f7mv8wvPL2ph6WAN6xXsc0Sp+PSSYHtpeLQpnkgAkI2r/by6OEu+yoiyoiFEoTxu97tVZJ3tu4c3rA0dE3qirppDk6NGrLN0gzdgNWoEkGFU/Ot3f4HE34jl57MffGbj9rQ3ViUIatKykXo33BaRQcUOH5Gt98XIEIFSbzz8Ds0PrhKvoKd11nnsHPxobcr0G8Y3E/34D0B+64DTAbXMk6GlO3ojr7R3oGWw+d6S933oDX+vjlJG7RtHNFEPLBuWIdRirvcIg7I1nZRopzrGMNRpguPBa4FWJhTX1ZIoviY0Gw4ExOCWKpKgGO/H3oaRVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfxArsHO9YhDQ05V5jRxtD/k5cWTK+aPwYSyStvMOXY=;
 b=URLv2R35MLfJuyKYKPDHWABgt6pOg6R8V2rgS6qoznPy2EqXMer2oXpCSAe9nGR3Ev2o8vOJssEiJEIFzOIOXKzCFLXgEpFui7zAeI2wcP4H4XrxjjHtRtMRMNhJJtMLvm+ey+4vxcWqqlAU0EAqIWf4bkmOjF4CCXiTusxg/Kv1bF2FwNk32nB26RDqtftxO3TecRnP7FqC0CHRmoN35nMPf6ZtnUNTkpRlKNBeQ0aeCCTM7ya8sw9LeMsTqORvIlWeNusVb6u1OOBH6DDizK8fU1Pn233XQ3ldJzp8Pvm64NOX+NR9to32q/Xr8A7KDs96gEPvxYxA3M7N5dQyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfxArsHO9YhDQ05V5jRxtD/k5cWTK+aPwYSyStvMOXY=;
 b=dgzh+BbjNSZlvPTBFJ7qgWYGoC+9Vy6XOzl2zkXThLfRtM78I+GB0QBSmAUXHgjda4RjbJRqKFx9T/2QyTUsg16Zh/qg42XXkV+FFufExU+AIP82T2i18Zp/I6pLiqAsO1zRVoxZCJlxF6Cys/j4OjQLYpj8InwuUYAKbUvU2v1akRnPBVIhyVtHj5K991yLX6nhxq6wteDrmh7uOCzyEkWuoKliMIjmQlXGv9k5y+T9+jq6xuF3aTdmM4UN3/12Ag3rqAFB5ya3vNPjC6lVzDadPKYekIY7tPmOSdxGyGkutlI6iE/U/OGbezE0IsWg05A6q0Cv3bcLVs6QC8UgTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:40:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:40:26 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 00/14] drm/imx: dc: Use prefetch engine
Date: Mon, 29 Sep 2025 10:41:35 +0800
Message-Id: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/x2WgC/22OwQ6DIAxAf8X0vC4IgrDT/mPZwRWcHKYGDHEx/
 vvQZPGwHV+b99oFogveRbgUCwSXfPRDn0GcCqCu6Z8Ovc0MnHHJaibQv2aNlnAMrnUTdci4doI
 paUpSkLVt4ec9ebtn7nychvDeL6Rym35j1W8slciw1hUx0VpVyfbaz+OZhhdsqcQP3fA/vySed
 WmVsWQa0g956Ou6fgAed36D7QAAAA==
X-Change-ID: 20250703-imx8-dc-prefetch-028e306591c6
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c76acc9-1880-44b7-511a-08ddff018bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L09pekh2ZC9ZeG9rRUQxcjEvWWRZUzFDQ243QTJ6enZ2Vnk5dDNuWVNXaUpl?=
 =?utf-8?B?R0pTbEwvRFJucGVrYVFNZXFBbDB2eTlVZTNkb2E0a1k3VWJOekN6WWV1TVRF?=
 =?utf-8?B?c1RXYzR6U1NOSkQwNzRuQUc0dnFMQkYwak1qSHQzdW9VZVVHdUhsc0dVQThz?=
 =?utf-8?B?aFdLcXdrUC85WDlmcnNWYjBtMTkxYjhBUENGT0RsYVRaRVNxWGRzREE5a3hJ?=
 =?utf-8?B?UVNUSUpNeFZPaFQ1djNSeGFSNHZ1dTExc1ZJdjRsczREVEVwbEJBejdNdjJr?=
 =?utf-8?B?Nkc5d0JaNHo0RVNqbUErdkxuUGRSTk5GSklJSUFIUDhUWjkydHJGL2pqOW5z?=
 =?utf-8?B?cnRNc1BxU3pZMFNtM0VXZHcxYXF0dmlSMnNwWmorV0RvUmtmdCtnZWtYM040?=
 =?utf-8?B?N01LVzRQY09wbGlIT3RRTTRVUzNqaGFPZUNacnRQR1JLeE9hZUFxNXFNaWlV?=
 =?utf-8?B?MWNDdUU0OVdIRVYrK2FsZVBTSm4vYlNDWXdoMEM4a0NxallSOEhJMU5seXZa?=
 =?utf-8?B?bS9MMlZhK1ZFNW5oNngxL0VpUU9SVGk0UzhmNFVScVI3c1lmNHlRU2NtUU9C?=
 =?utf-8?B?c0JtRkFKaElNcWZUQUQ0ZWtsMmNJek04bmhaclJMdGFJbnZOcDlqQWttdkZj?=
 =?utf-8?B?emJMZWRQVzY2ZmRPbWlOU1oxemtmTDRucEYvWStrOUF3YXNFOUxCRGlWeWZx?=
 =?utf-8?B?SDVQSjdDWWJmelFoZUlPSzhtb0JsdkFKZGZlK3laREllbkN5ckh4UzMxYVpZ?=
 =?utf-8?B?VTg4UHZnOG93M1p6aTVwTTBZWnRlT25hazBRSkRyZjErMXpqR3dJS2xxZHRK?=
 =?utf-8?B?MG5hazd6UCs4aElpcW5mZitNdXlJb1hUR0hwNkxTdXVLem1pQXBYcDBNVTJt?=
 =?utf-8?B?b2JBQ2ZZRTZIUWNtQUdSRzF5bmlqenhoL3FkRkIxQUJMTXB2SXEwY3NiVG5B?=
 =?utf-8?B?VzY1RS8yVG1PV0dsN09OU1ArSWEyRmdpek8rRDIvb0ZMSE9TbnZuU3NsN0I4?=
 =?utf-8?B?UEYyMDZWYXNFWGhHV094NUhNUTVaMnpWVDhMUW1lc0RPOFpMMDB5S3BNZDkx?=
 =?utf-8?B?ZDNKYXAwOURJY1F5aStILzA1QW1oNW1wTUpZU1dJYmRNS0pUS2swRnJBRVEv?=
 =?utf-8?B?TkZhcWt2Sy9XbUJaTkpPOUNVa0tzRHAzOVhFS3ZUWmloQmdlZllTa01pcG80?=
 =?utf-8?B?OUlLYjZVdzdYcG53RGpGUTZlVXdLZnI3eXdJcUdGVUM1WkxoWnp2OEFzWUIr?=
 =?utf-8?B?aDNSQkZDdEdDQWZ2dXowV1RqUUNEdkR0a1pESXZkOEdlVjRpUjRaTlBYQ2hj?=
 =?utf-8?B?RERDd1RBZUZGNTZ6bHpUbGtTTzdEQzZDQVJWeXp2UEhERU93UVQ2YXB5QWdQ?=
 =?utf-8?B?QkxmRTJEa0N5Vmh6bVIvZXBQcnpQU2tmZFVXWHdaYWZMK241bDlyai81VXR0?=
 =?utf-8?B?ek0yOUlzZC9MYlZUT0NZWExGTC84UzBKY1NuRGNnd1FxSmxhUERWRTF2Ymg2?=
 =?utf-8?B?enNqUkFEaENFVG9VY3loc1pZTHVraDExK0w3dkFlVEFObDRwTThyOU9Gd1ds?=
 =?utf-8?B?ZC9EMHRsdFpUajhtK0FNS25wU0pCLytrMzRpVGREdUVNOHErQ29TcGpaVXB2?=
 =?utf-8?B?ODIvc3pyK1ZET2p4S1ZVMzRHV3FlUGQzaGp4cDBEZkNKSDZ5Y2hiS1NrYmRy?=
 =?utf-8?B?aGtzeTJJUy85N2pyMDZhZDM3MFRocnNrWXFwQm0wa05GaDNIdmMxelI2TUZa?=
 =?utf-8?B?WGFrY1RHVTVTVHFKMUJWdk9yYmp1TVF0UWxHT0JOb1YrOXlrZjluZWJyZkhX?=
 =?utf-8?B?Q1RocnorQnBsT29LYXZOWDZBTjRnMldRWUpvMXpKMlBVMUJaNWc5Y2FEZ2E0?=
 =?utf-8?B?V2Z3TGhKeFU1Zkc4dlVaR0JVeUc1OXV4Z2wvTTVYYUFiYktIcXdSdUYvM1lN?=
 =?utf-8?B?OVd5RTYxc1k1SnRHNWZhSFYyR3lxa1JOUUZOc2hZQ1BPZnh5aERQbkF1N3dL?=
 =?utf-8?Q?G52C2kpbxEIzkI9u2AzO9reybTCAZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjJ2ZkNyUnJZZHEwaDdiSEtvZHZnL2s5VFkvS3R5d1Z3bHU0Z1dIWTZWUFUr?=
 =?utf-8?B?cVEyNUtVOEdMeWtHZlNLN3dKWG1mYmtiU2JnbDlkbGFIcnhBOUFHR25KN1Ax?=
 =?utf-8?B?M25iQWJnWDZuOHRMSzRJMzZiaVdMNTM1aEIxRmhsbjFnLy9rbDRSREMyTDZ4?=
 =?utf-8?B?WHlDR2c2alFLMnp0OG9NYUpjdXh1SGNaZzhHNHhvaE1UenRzUnBSYldydXF3?=
 =?utf-8?B?TjgrbDhXVlJId2hsUW9CSWswMmFkblA2VVVkVVY1b2pEanRLd3JlRlFFM1dZ?=
 =?utf-8?B?RnVYLzNFRUszOU12Ly9nb1g3RjEyZ21Oa280cFJuZ2tvek1HUUFoSE5nVzJG?=
 =?utf-8?B?NXB3VmxNUXk1UkZKTmcvdzQ2UDdFQ0t1b1hJaFJnWDhGdXBTNFhXdnoyUTFC?=
 =?utf-8?B?Y1JOOVhWVEJQc2dGYmROTlBhd2dVQlY0Qk5xdlRQNFRjQzU5Y2NhczVZWkEz?=
 =?utf-8?B?ZFpaUFVsaHY5SXRvRFNXQi9xVVV6eGRXN0RnUk01TmtrLzRubzlZZXZjR3lj?=
 =?utf-8?B?S3FsYlhwL3QzcnU5Z3RuYlR2eStEOFlSY2RUV0hFclo4L0xoR2tEdU1TVGJT?=
 =?utf-8?B?TXFsMUpSbmVkYzUzb3dBNnVYSmR4WXhJR2FDUE9ZcytZQ0dPR2NIQ3kyMUVM?=
 =?utf-8?B?bDlyTXVjSkptSVdSaWZlTmNla01zNmQ3WEZHRk9HMjdkSG1wbW5EV2VCYnNK?=
 =?utf-8?B?Uy9UUkoxekFvVE94WUZqNzArbjRGc1NMc0FyMzlLN3hIVjJNaGFaeEtFSEE2?=
 =?utf-8?B?dXg3dS9UUTdRMFRObFhML1pnaEw1OFFvanhiUEIxdXNFRnFFYlJjMG4rV3hX?=
 =?utf-8?B?aUcxb1I0cWd3eXlpUWR4enZ6b0VLeFU0OWJIeG5BQ2hsRFJmdU1LOHhnRWU1?=
 =?utf-8?B?VlBjNEdWYlJyVG1ITFpFTVdGZ1BaeUhZemhBZ3RZZlp3MU9PeFpmc0JMR3NZ?=
 =?utf-8?B?V2g0VE42WnBqMER4engzQ2dCeVl4dUxrcHZSWk1jdmNGaWp4K3BhL3liSFls?=
 =?utf-8?B?bmRORFdnd0tqRDBTT1ZvWkk4MldxN3lmOVF3djd3SUJHcmZyRytJWG9uWlgz?=
 =?utf-8?B?VWtCWHZpNXpMREx1bTM3UkRIMzQ1V0ppRGRROXVOcGRwSmpwNzkvNkVBT3lz?=
 =?utf-8?B?RXNhM1VTWHRJb2NuMWllMnFsSmN1SEhTRGU0VlhJczZsbmFnUzhKTVFQNUU5?=
 =?utf-8?B?V1NnOUFFNk96SjRjZXN1VHdieVlJam5odzJVMkY3alFNUXZCZnRFbFMvYXg1?=
 =?utf-8?B?dSt5aGVtTkRaYmx5MHRWM1hBL0t3NytvSGVKek9jZkljQytETGdSV2ljV01L?=
 =?utf-8?B?ZHZJVkkxL2szSU8yeGZ6SWZWYzZhMmpiTE1KMFVUMnI0SkZPaUIxZDROUXAw?=
 =?utf-8?B?Q296TU5jaU04TXdmQ3BwV1NHbldnaWVWMkhQVjZTa21zOEJvcXV6Y0MxV2JQ?=
 =?utf-8?B?SmpXZXpNaElmTUordUx0UzRFSHRFZEQ2NE9SY09ySklCK0wwdk5oNDdzV1Jx?=
 =?utf-8?B?aG14TlZEMVRyT0pGTnNVelFXVzRhUDNCVVNMbFBNdjhvZnZzUlpTL3lEQks5?=
 =?utf-8?B?NmNReWlVOS9DZGFObVBnRDl5V1FvakZaeGJSNm9QVDZ0Z280bHgzUUlXbWx6?=
 =?utf-8?B?NFRxdkRWUGVQQmhCS0E3cDloNkZpdll1NjBqRTJQblpDWlZIY1Nmb2dDaUpt?=
 =?utf-8?B?cW1qN3lOUlhNWUJyQ3FUSUJjVDBGanJ1RUJ6c0w2WlNxcW5OU2UwcGxhcmVM?=
 =?utf-8?B?NkE4SzhiYjlFL2ZxR3FORlBGcWNVRVZONHFBczVqcGZkUzNEU1NaYWhoUGdZ?=
 =?utf-8?B?TE4xMDNJVW43Mmg0cTZyaG1kems5WEZmTFF5Ym1wcW56Y04wclQ4KzJOcTZT?=
 =?utf-8?B?bjZlQU1uRWdvK1QvUEpnZ2JmMURCQVh1MlJmd1FQc2FrWjl0R3NCc3QycVVC?=
 =?utf-8?B?d3VHTHdONjhERVJWc0NiQk12MWJ5YVpPNnFTdkVydUZOVWR3TUFodmFOQnFW?=
 =?utf-8?B?ZmR0bGw3eG8zRHBiejJCdWhSRG5sTFN2SzdndGlxQTBNaFFRMnFxb3NxQjNq?=
 =?utf-8?B?cS8rOUxpVzVIWlM1cmo1WU9vSnR0MThiYlFxN0ZsaHVBTEsrN1dEbVdLZ3lW?=
 =?utf-8?Q?O2BZfs2Ha/I7MbFIyE8Crknld?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c76acc9-1880-44b7-511a-08ddff018bcb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:40:26.3137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhmZNDBlEfulOxz175sGIO347VmRmR2GY9E0p7EoZJfpdPa+7a6s9V+JW7Rqqt4Zfg0z3SSqn6mMDlgeD7ss9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

Hi,

This patch series aims to use prefetch engine in imx8-dc KMS driver.

One prefetch engine consists of one DPR Channel(DPRC) and one or two
Display Prefetch Resolve Gaskets(PRGs).  It prefetches data from
DDR, resolves data in tile formats if needed and outputs the result
data to FetchUnit(s).  When one PRG is used, a prefetch engine supports
processing pixel formats with one planar, e.g., RGB formats.  When two
are used, pixel formats with two planars are supported, e.g., NV12.

For now, this patch series only supports prefetch engines with one PRG
because it is enough for XRGB8888 which is the only pixel format
supported by imx8-dc plane driver.  Two PRGs would be supported by
future patches.

Patch 1 and 2 add dt-bindings for DPRC and PRG.  They were reviewed
by Rob[1][2].  I slightly modified the patches' commit message to use
imperative mood.

Patch 3 adds DPRC and PRG dt-binding files to MAINTAINERS.

Patch 4 fixes FetchUnit dimensions as related to prefetch engine function.

Patch 5 disables CRTC at boot if needed to support prefetch engine better.

Patch 6 and 7 add PRG and DPRC drivers.

Patch 8 to 13 do preparations before using prefetch engine in imx8-dc KMS
driver.

Patch 14 uses prefetch engine in imx8-dc KMS driver.

[1] https://lore.kernel.org/lkml/20201207165945.GA430214@robh.at.kernel.org/
[2] https://lore.kernel.org/lkml/20201207170206.GA434964@robh.at.kernel.org/

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v3:
- Call dc_dprc_enable() only when start == true in patch 7.  (Frank)
- Collect Frank's R-b tags.
- Link to v2: https://lore.kernel.org/r/20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com

Changes in v2:
- Rebase the patch series onto next-20250922.
- Collect Alexander's and Frank's R-b tags.
- Manage PRG's and DPRC's clocks with bulk interfaces in patch 6&7.  (Frank)
- Sort variables in probe function in reverse Christmas tree fashion in patch 7.  (Frank)
- Link to v1: https://lore.kernel.org/r/20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com

---
Liu Ying (14):
      dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
      dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
      MAINTAINERS: Add i.MX8qxp prefetch engine DT binding files
      drm/imx: dc-fu: Fix dimensions
      drm/imx: dc-crtc: Disable at boot
      drm/imx: dc: Add PRG support
      drm/imx: dc: Add DPR channel support
      drm/imx: dc: Use TCON operation mode
      drm/imx: dc-ed: Support getting source selection
      drm/imx: dc-lb: Support getting secondary input selection
      drm/imx: dc-ed: Drop initial source selection
      drm/imx: dc-lb: Drop initial primary and secondary input selections
      drm/imx: dc-fu: Get DPR channel
      drm/imx: dc: Use prefetch engine

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 +++
 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/imx/dc/Kconfig                     |   1 +
 drivers/gpu/drm/imx/dc/Makefile                    |   6 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c                   | 191 ++++++++-
 drivers/gpu/drm/imx/dc/dc-de.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-dprc.c                   | 466 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h                   |  35 ++
 drivers/gpu/drm/imx/dc/dc-drv.c                    |   7 +
 drivers/gpu/drm/imx/dc/dc-drv.h                    |   5 +
 drivers/gpu/drm/imx/dc/dc-ed.c                     |  27 +-
 drivers/gpu/drm/imx/dc/dc-fl.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-fu.c                     |  49 ++-
 drivers/gpu/drm/imx/dc/dc-fu.h                     |  11 +-
 drivers/gpu/drm/imx/dc/dc-fw.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-kms.h                    |   7 +
 drivers/gpu/drm/imx/dc/dc-lb.c                     |  23 +-
 drivers/gpu/drm/imx/dc/dc-pe.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-plane.c                  |  46 +-
 drivers/gpu/drm/imx/dc/dc-prg.c                    | 320 ++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h                    |  39 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                     | 114 ++++-
 23 files changed, 1497 insertions(+), 30 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250703-imx8-dc-prefetch-028e306591c6

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

