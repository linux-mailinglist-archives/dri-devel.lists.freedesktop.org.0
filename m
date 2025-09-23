Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC201B93F27
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254A210E52D;
	Tue, 23 Sep 2025 02:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gTvvGc3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D596B10E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:08:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPxdasKLe3hYUs+QLzufBprgRu4AdF/aedPwuHAMKVJlPMZNV7hppNlTBaLjUlUel4YmAt+3KOxm6s5lBUJ17mqH7BhMtXar/Qqd08dvsfq4HKWQJU7jcMjIjKbcVUUZsM9C5T0DKHIVN+En5CZJQlcowlxSUBasKTMXC1ABwKyqSL9m945WKR1HG5/yqvq5CQxjH5XI9IS6REUZB3qQPCjF/4eYZvFK8L9qzEdmunqI0o3MPIgBNDc9XAHAlE3Iyu+0C+PRdmKK3EtM5ueJKI/I2kW5RCrwSd4JnjU6HP4aXWgddj6WjM/w/HyBPyqdQxvHymdfZSS6L0k09zOfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+RAO++pnFqF/Fjxs4y8+OQKHVnRGNpW+H3u3eirot0=;
 b=l3zvgRPA1PjBi0Gt0HezY+yAjGKMdEKRoP8BfCtJBYdZzPUdGfTGqg4sOgyOOfFGZf2eR+FGHbnYubglthaj7u5NdQ9WfP++lG9GKKLnUilAOLEydN/aSrZuLwiVTUjEmVvb99vumaO4svdon9RB1hmcanf1BKlBXpbbEe4k0V1s8gEwzbB+f+RIDq8kho+YdNlAP4b1szsFUojoU8I5+ix1Heaj7mPUZ1K0Ta1p4szi0sIMvT4YHT1XjUBSPraoqGjgVPTkP1zSt58BqXTlESI7cv9mPUbH1KVBXQhjMcOC6jHyesnxT65ftSvGa22xgUf5u0taLk8EXWMNqd2GyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+RAO++pnFqF/Fjxs4y8+OQKHVnRGNpW+H3u3eirot0=;
 b=gTvvGc3dSRmnat5rINO1WpDl2OPgaciG1wahRAT91m/LUpGzgc2kVDjHaUypp1WsGHU3+0XqhU6/6cX9rTZEyMUfE/9LRWJVGfEbIu65Hdh9Fsq+9iWjc9fOOZHPMnJobM/Pbod2jOtHK8gFGiE60s7immjZl69c6ntETXA/zJCiAAXccgEs0xcD0pSrfJbSLR7h6VkA4A1MMCzgCFFwt5wHpcOVhW3Yzn5+vhw7ff3f6rquGmeYXKwj5EDH74KTdwcyluEX6qpVxy+4L0hbORJTYLSW1iTLeQX0MlcjGxllompzuAnZqim8PmBbArwhpcPbx8Qyv1L/4Rrrh9k+Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:08:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:08:07 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:08:04 +0800
Subject: [PATCH v2 14/14] drm/imx: dc: Use prefetch engine
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-14-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
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
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f05e3c-f2b4-465b-44f8-08ddfa460995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akNjSXptZmF1RFZMQW9GamxYVmdpOWpIL0hoL3RDRk9CTDMvTlJseGlSczNt?=
 =?utf-8?B?WVY0VGFXTnVCZXN6akFuWWgwREVjdUhsV2E3RC9hWjcwdlFLOGNKVENKT01P?=
 =?utf-8?B?WkFZUGhOMHdzYnZpMC9JT3dScGNaSEs3VDFpRyt0TGFaMHVjU2xCVG1DZ3E1?=
 =?utf-8?B?Sit3a0JlWXdIT0VORFFJL2VjdTN6QkhxRGIvZUN2cTVPWmJXUVdMa3ByekxO?=
 =?utf-8?B?T2cvUzdvcHZPaGFmSytkNU9ZMUZsMm9rOGtRNFR4ekw0SkM2ZDFCZFBlTk4w?=
 =?utf-8?B?S2Vla09TdllmbWcxMDdZQ2F3cHh4ZEloemFSR0h1Wm5pQWF2Sm8rMktDZmNW?=
 =?utf-8?B?T3ZRWXNCNHNSK3BWcUJTbW9kVmZwNVoydE4vN3ZGTnJXV2lJSk9rKytGWm9j?=
 =?utf-8?B?WjNjRHJCS3QxZzIxRDkyWEVndEZEMGxPcG5hSTZsVkVqWTRwb2J3dWR4cUdO?=
 =?utf-8?B?UzY2UTNtT1VBaXZSOWNhS1lKcHF3NWRtRUNkSVd2SUxzTVBSNktWNmFwdk5p?=
 =?utf-8?B?ZDI3RnBVZW5IdHAwTmtuZ3pOU00zSEdKUTcwZklIQm4zckgva296cDJOOTFh?=
 =?utf-8?B?d3c4N3RmRmphQ2pNYUo3NFo4SnZtRTdLMmdWY2dYZlJMUWpRY01rWE5GZ0dD?=
 =?utf-8?B?V0VUK3Zna3k0blJHeUdwbVlrL1FNWnBSMUx6dlh1VGo2RkdNREFMS1BqbGV0?=
 =?utf-8?B?TWUzRlV3ZG5oNU5xd3NkZHdDbE54RU05dnNjdzVMalV3cTBmdllVZHhzOVMx?=
 =?utf-8?B?ZkVzZGlsRThMR3pVTndFMHlqajg3dEdlcFJSeHA2NWE1dWc4YTlLam5tcStK?=
 =?utf-8?B?RHg1WXNSb1Z0dXFsWVpITWlwUXI0R3lkZGVaZzNiZ0hwTUZpNkV6bERDdFhl?=
 =?utf-8?B?L3d5ZVRpVWViNENEOTVwdWFtNlo3UVR1V2RyY2tmQWlYM3pPL0N3MVlud3JB?=
 =?utf-8?B?NHpzZmVNdGhQS3RYMWZWdXo2QklYSzVnN3krWnJHNk1mdmpDZjhtNG5EdnVB?=
 =?utf-8?B?R285d0N6K1VxeHV1ZjI4citmMlpsNlM4NThITXMvdHBybWxlTUwyMEl4ejBM?=
 =?utf-8?B?c3lxdDNrNW9BbzBqWTRCTWVuR0ZJa00zREZCRnV1QkhEQkhKdldSbjdTeXIv?=
 =?utf-8?B?TW1CcG5WSWgvbHZzMXFQNUY2Z1cyWE5PWTl3WE01YU1udUFTcTZlM3BmVXRs?=
 =?utf-8?B?UnpuUzgzbUNOd3BHLzl2RXY5aWZJWnVsOUxOdG9jWlVMOVUwK1gwNldtaG05?=
 =?utf-8?B?QzlDQ2MyeTlIamRmT09JNTBodTY4M3RvNnI1QllkSHpTWkJTakhRakIwWXdz?=
 =?utf-8?B?N3grbkdOdm5qUDBOc1JlNktld1JrSjlZOG1GRTNNalNRSnhWSFFacjYwSkRv?=
 =?utf-8?B?clFNeDRlbUN2OS92NmErbjJuT1VmS2xzVkt6K2Y0SlF6RFlWbGtSaVNiZHlk?=
 =?utf-8?B?R3lNVGdZbmRlYk1ndytIR2trS3pmRDBNb1VJWDUwbnRQdmx4eVhFUWZSanJu?=
 =?utf-8?B?c01TdlBhbUZ2OWxpTlZJQ3p5cUJWdExYUjZ3RVNvcUxFRi9tdnN4aUxWVzJG?=
 =?utf-8?B?QjIrNUh1Y05NdVZRNHFOQzhzWmgxQk0zbWRuRkFSK3dEbTJCTG1HMzJpT2tx?=
 =?utf-8?B?QXczcTZKb1REYWliNnlCWHdHdHFmQTVZc3IwaUliTHdzZGd0MU9HYmJFeE9R?=
 =?utf-8?B?R2w5SnIrR0NxNk9Wa2lrUUpMeHhvZWFwckFLOHNwWmVjaUdtZkRGN2wwQjNI?=
 =?utf-8?B?aEZ1S1JQbCt0cC9ya1lhY3FMYXp1d1FHNDlMRGlNTlFRZ3h4NkQwTk1IS1V3?=
 =?utf-8?B?TjNOYnBFOWNUaHJVV2lKN3ZXT210RytGbm1USUVjZG1SREZWZnpyTDhwQ2xa?=
 =?utf-8?B?eTNxLzY4eUZIWmJZS0xWTHpUZUR0RnZZcUNKY2pPTUdOQUpxZHFwMEpOUWRN?=
 =?utf-8?B?dVVsdUJybnh5bEIwSjh1SnJSMTJMa3BFYTVqWDJxRmlpL1FkTTdSU2FGOWd3?=
 =?utf-8?B?SjZWMk1aQmpFcllmNTJwNkVnaitSMzhaWmhWcjJuOVpHaURvU21kSjNCOE9i?=
 =?utf-8?Q?n8qlCC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHhyT010RXE2eDBWeUFiZ3VpTVI3WERCZlNKcGZVZ1FrL2dKMThHR2dSOUMr?=
 =?utf-8?B?bmd4VzZwd2NlWUFkcmF1TitNdFlWZTBkZFlvTmllQTdvSVB6dDJzSHpCUTVp?=
 =?utf-8?B?dy9ibTdmTUNUaStkOHozTDhOM0JYdFJKQUlmc2JsOWFnKzRZeE10cG5CLyt1?=
 =?utf-8?B?MmJrKzB0Q1JzNVVjSGZRNjFzMWhBeWsrT1dOejl3elNmZWM0NFRqTHJ2V0Fu?=
 =?utf-8?B?ME9hMG54SWRHbzdwbGtQY0VDMW44bWVjamR0d0duRU16U1pjLzRhUHdDd2dY?=
 =?utf-8?B?R0RwYjIrMTlZNVZRd2pnTDJxSFo5ZXYrSzZoa014d0VTZW10TnFNbFhwNE1n?=
 =?utf-8?B?dHJlQUpXYnhoMTFqbXJmN0V2YVRWVEZpcFFGT2hJR1J2YjZ1a3pScStPV3J6?=
 =?utf-8?B?TXhBbXhYS2pWVng3V1RjMEZraE1tb3g4UUgwa0oybDFKYmRJM0wzcU1NWDRh?=
 =?utf-8?B?TVd4WWd3QWR2TFBmbXJrdWhQWWsyWVBBYVFpVEszLzNSYjNNekNRRDFEbjYy?=
 =?utf-8?B?SDZFS2gzSTBNRWpnUm90ekpBOUpoWEk1alZsVEFxdDEwLy9oTHpXdysvN2RK?=
 =?utf-8?B?elVoNWR6d1RJdzRJT0JoTU1TK0pGRDVjdjFQemI3NWhPNHZUNG9BbTl2Sm9y?=
 =?utf-8?B?VnFjRGJ4Q2Q2QVRoSzlVUEdXbzVBYXRZSXJmd1E0b1lYMkl1K3hqZ0ZnMDkr?=
 =?utf-8?B?WkszTVdYTUFPaVFEcHlzWktkYVl5dGNHdnlzR0l6ZGtzZWhVeTVRTGlSK3J1?=
 =?utf-8?B?NzFOOEx6am5HWjZ0S1NaTVRMUENMTUZ1ZW9mNWh4cGZPaDFmSUZlNGtNM05k?=
 =?utf-8?B?ZHlOQkZlTkR3UGFBWGNxOGRiNVZGTjMrVkMwY1U1cWIrMXo3d3RJOHZCQTV0?=
 =?utf-8?B?b01oTldhWkZUK3NncXJpeTNFRE1xZXJmYXAvVVlMdlhjdEtQNVRyRlkyeWxt?=
 =?utf-8?B?eXBpMkt6b2tjeitxTjRXenY4akFSQ0VLSGwyNFlZOVhaT2NUMGpOc3poaWVS?=
 =?utf-8?B?NzJzMlNENFJTYTdUdGNiYVVYNjVDbjY0a3VhVTN5WkhCck96QjlmeXorM1Fr?=
 =?utf-8?B?dm42OFFPK2poWFBOeHk2NnhEVW5KUHdFSklDVWtCdXNVRDlrUERHQ1htVWdu?=
 =?utf-8?B?cmpwK3paYnYxOU1qL3hIdTI1R1ZhbC8vbk9wRWJEdUdWcFMxcXJuTVpzZjhK?=
 =?utf-8?B?UEswR05PUVI4blliZUtBbllxOG5SdDEzNGRIUnFQd1RwMUdocTQ1ZXh1cThE?=
 =?utf-8?B?MEl6Z0lpYVNBZnNxeVJ0dDg1R2tHQ1F0cnprUFJRMDRLbUlqSnA4WHZjUFhz?=
 =?utf-8?B?VVZpSkJ0c3BienVELzFFMjgrSitTcFAzdFVMNW1KRmtUUzhzRW1WRm5MZHov?=
 =?utf-8?B?Tkx1K3F4UURWalViSGtITFBJcWdaalhBYVMrUmMzSWxQaXNIdytjd3pXVGV6?=
 =?utf-8?B?d093dHBQcHdETURkSC9OWkdNNEhlb0JsT2dzR2VTUG1jOElIR0JMcWtGOFdx?=
 =?utf-8?B?YXRLSVlhcjdyYUdWVUNmYzMyaUo2cXJJS0labVh2c1ZFbWZVa0RyU004T1Rn?=
 =?utf-8?B?alk5NmRqcVlUb3oybU55U3NSZStsMHpiRVNjQW1KWk1ndlVkcWd2M25wV2Ez?=
 =?utf-8?B?ZW4ySHp2Ri92NmR6aU5kMjRhRnZONHZGcXYwby9sZXJoWVMzRnFCN1RsQmJi?=
 =?utf-8?B?VXdVblFWdkZ3TTdiYjRpSlpBTUkrR0Z0MzNZbTB2a0VaaVc3L0ZvOUJxdmdJ?=
 =?utf-8?B?b0V2YjZDZ2U5UWQxNUVES2w4bVMwM3U4TFdwdEFiNW4vVE9JSHNIZ1ExLy9Z?=
 =?utf-8?B?T3ZlSk0zalZUZ0tzQmtOc1Fwem9keW5NZjRqSCs1UkRkeGtYSSsrU1hxSWlB?=
 =?utf-8?B?ZE5BdHV6elJxczlaekxXZnJXSlpYRXQ2UzZseHRZMEx4a2pDQ2t0QjBvR2lH?=
 =?utf-8?B?Mis2cmJxWVozalJ4TzVHSTgwMEZ3V2p3SVEvdnpWMzNvMDFlUVR0M0p2b2k0?=
 =?utf-8?B?dUM1c2xVZ0huWnVRMzNMRkhVQmtEaTQ5bmtTV0RISkFkc1RWRlBReU1uZURn?=
 =?utf-8?B?bEQwTmFFRktWK0xJeVZkd2RBWmFEdEpSdlhIRTR3SGZocUI3NXcrS05xMy9M?=
 =?utf-8?Q?0s6GgDjQqzcoaXYeocIpgE8HT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f05e3c-f2b4-465b-44f8-08ddfa460995
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:08:07.4563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yppuoOeOj4NEbOvL3uvvvl8UyZ7/eKzytdRY5gfP9eriGTugwduoKb/X7vf/kKXbfO3r29gEJxey2fPYaChA/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
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

One prefetch engine consists of one DPR channel and one or two PRGs.
Each PRG handles one planar in a pixel format.  Every FetchUnit used
by KMS may attach to a PRG and hence use a prefetch engine.  So, to
simplify driver code, always use prefetch engines for FetchUnits in
KMS driver and avoid supporting bypassing them.  Aside from configuring
and disabling a prefetch engine along with a FetchUnit for atomic
commits, properly disable the prefetch engine at boot and adapt burst
size/stride fixup requirements from PRG in FetchUnit driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-crtc.c  | 139 +++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/imx/dc/dc-fu.c    |  27 +++++++-
 drivers/gpu/drm/imx/dc/dc-fu.h    |   2 +-
 drivers/gpu/drm/imx/dc/dc-kms.h   |   5 ++
 drivers/gpu/drm/imx/dc/dc-plane.c |  46 +++++++++++--
 5 files changed, 197 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0..4c7aab360616cb1c84c31c83f16df703b1c2c6d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -25,6 +25,7 @@
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-kms.h"
 #include "dc-pe.h"
@@ -204,7 +205,13 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 				drm_atomic_get_old_crtc_state(state, crtc);
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_plane_state *old_plane_state =
+			drm_atomic_get_old_plane_state(state, crtc->primary);
+	struct drm_plane_state *new_plane_state =
+			drm_atomic_get_new_plane_state(state, crtc->primary);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	bool disabling_plane;
 	int idx;
 
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
@@ -216,13 +223,40 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
 	enable_irq(dc_crtc->irq_ed_cont_shdload);
 
-	/* flush plane update out to display */
-	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	disabling_plane = drm_atomic_plane_disabling(old_plane_state,
+						     new_plane_state);
+
+	if (disabling_plane) {
+		unsigned long flags;
+
+		dc_crtc_dbg(crtc, "disabling plane\n");
+
+		/*
+		 * Don't relinquish CPU until DPRC REPEAT_EN is disabled and
+		 * sync is triggered.
+		 */
+		local_irq_save(flags);
+		preempt_disable();
+
+		DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+		dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+
+		local_irq_restore(flags);
+		preempt_enable();
+	} else {
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	}
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
 
 	disable_irq(dc_crtc->irq_ed_cont_shdload);
 
+	if (disabling_plane)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
 
 	drm_dev_exit(idx);
@@ -320,14 +354,33 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
-static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+static inline void
+__dc_crtc_disable_fg_along_with_dprc_repeat_en(struct drm_crtc *crtc)
 {
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	unsigned long flags;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	/* Don't relinquish CPU until DPRC REPEAT_EN is disabled. */
+	local_irq_save(flags);
+	preempt_disable();
+
+	/*
+	 * Sync to FrameGen frame index moving so that
+	 * FrameGen can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
 	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
+	/*
+	 * There is one frame leftover after FrameGen disablement.
+	 * Sync to FrameGen frame index moving so that DPRC REPEAT_EN
+	 * can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 }
 
 static void
@@ -335,14 +388,29 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_crtc_state *old_crtc_state =
+				drm_atomic_get_old_crtc_state(state, crtc);
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	int idx, ret;
 
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	__dc_crtc_disable_fg(crtc);
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	else
+		dc_fg_disable(dc_crtc->fg);
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -373,7 +441,10 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	enum dc_link_id ed_src, lb_sec;
+	bool disable_dprc = false;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
@@ -383,13 +454,53 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		return;
 	}
 
+	ret = pm_runtime_resume_and_get(dc_drm->pe->dev);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get DC pixel engine RPM: %d\n",
+			    ret);
+		goto out1;
+	}
+
 	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
 		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
-		goto out;
+		goto out2;
+	}
+
+	ret = dc_ed_pec_src_sel_get(dc_crtc->ed_cont, &ed_src);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get content ExtDst's source\n");
+		goto out2;
+	}
+
+	if (ed_src == LINK_ID_CONSTFRAME0 || ed_src == LINK_ID_CONSTFRAME1)
+		goto disable;
+
+	ret = dc_lb_pec_dynamic_sec_sel_get(dc_plane->lb, &lb_sec);
+	if (ret) {
+		dc_crtc_err(crtc,
+			    "failed to get primary plane LayerBlend secondary source\n");
+		goto out2;
 	}
 
-	dc_crtc_dbg(crtc, "disabling at boot\n");
-	__dc_crtc_disable_fg(crtc);
+	disable_dprc = true;
+
+disable:
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc) {
+		dc_crtc_dbg(crtc, "disabling along with DPRC REPEAT_EN at boot\n");
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	} else {
+		dc_crtc_dbg(crtc, "disabling at boot\n");
+		dc_fg_disable(dc_crtc->fg);
+	}
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc)
+		dc_dprc_disable_at_boot(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	if (!dc_drm->pe_clk_axi_disabled) {
@@ -397,7 +508,13 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		dc_drm->pe_clk_axi_disabled = true;
 	}
 
-out:
+out2:
+	ret = pm_runtime_put(dc_drm->pe->dev);
+	if (ret)
+		dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
+			    ret);
+
+out1:
 	ret = pm_runtime_put(dc_crtc->de->dev);
 	if (ret < 0)
 		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 47d436abb65157de7cab74565e44b199be76de52..bc439c3520d45f894c0afab5b3d52f2f3309c2e2 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -124,13 +124,28 @@ static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
 			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
 }
 
-static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+static unsigned int dc_fu_burst_size_fixup(dma_addr_t baddr)
 {
-	unsigned int burst_size, burst_length;
+	unsigned int burst_size;
 
 	burst_size = 1 << __ffs(baddr);
 	burst_size = round_up(burst_size, 8);
 	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_fu_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+{
+	unsigned int burst_size, burst_length;
+
+	burst_size = dc_fu_burst_size_fixup(baddr);
 	burst_length = burst_size / 8;
 
 	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
@@ -150,8 +165,14 @@ void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp)
 }
 
 static void dc_fu_set_src_stride(struct dc_fu *fu, enum dc_fu_frac frac,
-				 unsigned int stride)
+				 unsigned int width, int bpp, dma_addr_t baddr)
 {
+	unsigned int burst_size = dc_fu_burst_size_fixup(baddr);
+	unsigned int stride;
+
+	stride = width * (bpp / 8);
+	stride = dc_fu_stride_fixup(stride, burst_size);
+
 	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
 			  STRIDE_MASK, STRIDE(stride));
 }
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 44b9497e53580589a05bcb180eb2312ea4449da4..09570955a5b92105ef7010f71fa615a1cefc9b7e 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -87,7 +87,7 @@ struct dc_fu_ops {
 	void (*set_baseaddress)(struct dc_fu *fu, enum dc_fu_frac frac,
 				dma_addr_t baddr);
 	void (*set_src_stride)(struct dc_fu *fu, enum dc_fu_frac frac,
-			       unsigned int stride);
+			       unsigned int width, int bpp, dma_addr_t baddr);
 	void (*set_src_buf_dimensions)(struct dc_fu *fu, enum dc_fu_frac frac,
 				       int w, int h);
 	void (*set_fmt)(struct dc_fu *fu, enum dc_fu_frac frac,
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index a25d47eebd28792e4b53b4ecc89907ce00430c2c..8b45b21a6f8a7e6e6ed2563499753200bdd42ebc 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -130,4 +130,9 @@ struct dc_plane {
 	struct dc_ed *ed;
 };
 
+static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct dc_plane, base);
+}
+
 #endif /* __DC_KMS_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de638da2bf4667307f11b06f4e77f5..8ef754492b2dcb5d986a63f516328f8d2512c7b6 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -17,6 +17,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-fu.h"
 #include "dc-kms.h"
@@ -44,11 +45,6 @@ static const struct drm_plane_funcs dc_plane_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
 
-static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
-{
-	return container_of(plane, struct dc_plane, base);
-}
-
 static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 {
 	int src_h = drm_rect_height(&state->src) >> 16;
@@ -88,6 +84,28 @@ static int dc_plane_check_fb(struct drm_plane_state *state)
 	return 0;
 }
 
+static int dc_plane_check_dprc(struct drm_plane_state *state)
+{
+	struct dc_plane *dplane = to_dc_plane(state->plane);
+	struct drm_framebuffer *fb = state->fb;
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	struct dc_dprc *dprc = dplane->fu->dprc;
+	u32 src_w = drm_rect_width(&state->src) >> 16;
+
+	if (!dc_dprc_rtram_width_supported(dprc, src_w)) {
+		dc_plane_dbg(state->plane, "bad RTRAM width for DPRC\n");
+		return -EINVAL;
+	}
+
+	if (!dc_dprc_stride_supported(dprc, fb->pitches[0], src_w, fb->format,
+				      baseaddr)) {
+		dc_plane_dbg(state->plane, "fb bad pitches[0] for DPRC\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int
 dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 {
@@ -123,7 +141,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return dc_plane_check_fb(plane_state);
+	ret = dc_plane_check_fb(plane_state);
+	if (ret)
+		return ret;
+
+	return dc_plane_check_dprc(plane_state);
 }
 
 static void
@@ -131,6 +153,12 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state =
 				drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_state =
+				drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, new_state->crtc);
+	bool needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+	bool prefetch_start = needs_modeset || !old_state->fb;
 	struct dc_plane *dplane = to_dc_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
 	const struct dc_fu_ops *fu_ops;
@@ -152,7 +180,8 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	fu_ops->set_layerblend(fu, lb);
 	fu_ops->set_burstlength(fu, baseaddr);
-	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, fb->pitches[0]);
+	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, src_w,
+			       fb->format->cpp[0] * 8, baseaddr);
 	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
 	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
 	fu_ops->set_framedimensions(fu, src_w, src_h);
@@ -161,6 +190,9 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
 
+	dc_dprc_configure(fu->dprc, new_state->crtc->index, src_w, src_h,
+			  fb->pitches[0], fb->format, baseaddr, prefetch_start);
+
 	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
 	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
 	dc_lb_mode(lb, LB_BLEND);

-- 
2.34.1

