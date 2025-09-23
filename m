Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE54B93F0F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFD710E52A;
	Tue, 23 Sep 2025 02:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HCkJfYUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B3210E530
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NteQn7sE89NSbwTFlYNvDVJfLqmuRxet4B/0GhWJB9dVDUZc5SQFXPnoVl54/FC1oKWHyxWCEFaHM1FyhULqnz/hDEMV7iu4pEi5KFmli0C9wI2fQeIJqV6+daL0Hxt0/rqPLbvsCzBzKd76jG4LRxrsKtpWfN/vVrMhTh/fKWxPqJ78aCQjt60PZidyfh/msYZsejgVYEzO0aHiWNXM5ukpQPB0OzxdoHvMdcABf7hUyyj67900Mca5TklovJqbDMCge/6JJFuroZGpMMWLJU9CbgR/4RhM1jsciJhCH3FtcM4bXhfLkULVcg1O8qSWIfFvNrUWgZc+aHtIMdTlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DxVI1D5LQtYBhjIHZYILJII2FvUKrM1nL4De2Aip9k=;
 b=pEagwnMLV0rgPQVMqW+3KdHBk9VjTlLHGGwkPYs74dW4y5ByGd29DF0yKJaPQZL6Du/bzXSD03OjEMdOVpHlQGvEFW5B5/nCdhT58ZxlANJrzUZmaWra6ysu1QV3ezCMmxtQlBvLLJhF5zh3BVz9TqODoGwFuFiyUJVTPlLL5oQijU8hFtkpGUfXIgtJtkxyGEeuqX22KaWiCyz25UgrTMIeBNRLHQ3q/e10yuIOPGlcr+ukSeeiN1laXc6e44CeuMx8gMlw4T6otxuaqEo12kNewYRCBagmBtRGX+DWuMbe9s+wBv6GuZ/2745+olGO0X2izDc160BDwHFLcSw4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DxVI1D5LQtYBhjIHZYILJII2FvUKrM1nL4De2Aip9k=;
 b=HCkJfYUhgUEWhq5RIDu/C4gAjsEuBCfT7P02Ge87+JmN8avCKED7jFkShuIx+7QzeKHfUTtS8m0pgbj+mQ4QCYC0TWIw6LCPz3P4JnVvXTTcwPMLcORBa9x414xtNRO2gPgNp6+3HdJeMxrN/8rpnhUKigQhd+/LxrUJOoEcSon6DnZ1Mte/gzRyAtzQfVj/hAJWFQqrqHFColGVBEVt7MC7fU1bQATuVGm45Xoo5jMha2USpCmrpgH1F120kkXTSsor+rkXO3Bl1r50DHtkWCxSi3urY+gOP0SlBh1TqwzRvKWo7GFGMff3b9tbzAdYxaaZCyDcrTTSdWOdyEAJHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:44 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:08:00 +0800
Subject: [PATCH v2 10/14] drm/imx: dc-lb: Support getting secondary input
 selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-10-5d69dc9ac8b5@nxp.com>
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
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ceb6fd-458d-41bf-252f-08ddfa45fbc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3p1Z3lmWW92SURKZ0lEajVrdmx3eWJjUjJTblMxUEE1blViSmoxSEtTbFNV?=
 =?utf-8?B?aUlaZnpkRXdLL3dpZEpTajcrekxhdE1KVmFzZkNEZ29QeFRoTlZ2amlqN3N4?=
 =?utf-8?B?aHU3QWEwcTA3UWdTOHhRc2oyV0k2RHREQ1E4K0J6QUFQa2pyRU5uR1FvVm9h?=
 =?utf-8?B?Q0oyenFCd05UZEl1TjNWeVVvQlBIQmgwWk5zWm5xc3NHNGt3R3hvK2NjWkJu?=
 =?utf-8?B?YU1NSEtFMjFhMDhlM2wydDRBeHE1WDRsWEx6aGJCclE5TGpuNGJsaStnMCts?=
 =?utf-8?B?R1BJeW40SUY5T0ZFQW40MFBmY1VMaVlKVFFKeUtVOHkrZy9heTBlempKaUJL?=
 =?utf-8?B?VGVkUXlFaDVWQXVUMDFxSU5OUWpsbEJpbTlqdlV5bzZFQXMyQXNUQWNzeTBH?=
 =?utf-8?B?S2hJYjBrS2owNDJHZWpaR0dyeUc3SW1nMVJnOUcycjA0NHJqSVM3UEc3WUE2?=
 =?utf-8?B?T3RiTkVPelpxSkN1Uy84d0YwMCtqTGtGQ1VtR01FdGU5NFNSTzRBQjZQQ3Va?=
 =?utf-8?B?cVVzS1lXQktlVTNwWjZBSkZJVmM1bCtrb3JmMWNwUmlBeHdIZEZkZCtmT1d6?=
 =?utf-8?B?L3dMQXg4YnNqdHk2SG8yQ1B3YUFzdThKODVWZXFTTnY4OVpYVzFWNE84M3Qy?=
 =?utf-8?B?QkppZkJnRHc3V2dMT2Rvd0xON0o4Q2J0QmtNbUp0KzlKelFjOEI2SlVOdDRV?=
 =?utf-8?B?SUZoY1puOUJiSkhkaFFKdjRvSGFiQUFZbmg0NXJKZGpPc01nb0lydzNQaFN5?=
 =?utf-8?B?WHQwb09XYTU2bkJwMFM0Rk1GZ3BkZzVqTDlyV0FLeFpPZXRZdjNMZSsxdERQ?=
 =?utf-8?B?b3NNT3ZwN1UyQTIrc05WeWxmUnB5ZU9QM3hpNU9oK2srL3RhTnBua3haMFox?=
 =?utf-8?B?cWowSGk3RkVENmJrMXB5YVE5emJsNmozSldFNlFDZGZGWHVtWHpzMDFCbkln?=
 =?utf-8?B?M2w3UHd4NHk3WlVHeGMyYU9TRHFDcE5xLzJLZ3ZSVEFkc0lGb1EwclluZ0dx?=
 =?utf-8?B?ejJRZVFXN2Nra1ZKSEVGZjJvMGcxbjUxaUROUVdmUXRFL0pxTkRFZXQyV2di?=
 =?utf-8?B?cDc3UzNRNlpEQU9teWpUbG1TMDFBN3kralNtYnAySGI2ajhnOFBzVHJpSkN5?=
 =?utf-8?B?L3pRN0o5eXlobHVBYk1yRkZ0dTUrRmhpdDNHMnpLVjNNdkJwazQ4anRBUFBN?=
 =?utf-8?B?MGt3VnJIZmd0c0hFa2NaY2FrRmpZYThHMjA3NVNDM05qUTJaSnlQcnZ2angx?=
 =?utf-8?B?U0I4QWRIR1M5MVozNnZiUjBuMGpKWHN3djRnaExFaTRFRkJoZ2JRTWl0dUtP?=
 =?utf-8?B?c2k1ckdrSC83K0RoSTJodjJJS2c0YmRLcm1hTmZCWW9jRWhCYW9WWUZVODgz?=
 =?utf-8?B?ZlVOeXlOTmZoV2FXS2hlWXAvRmV6aFBFREN5eXo1MzBkUFZlY3p1OGNPcndu?=
 =?utf-8?B?Nm9PQ2xTY0hKUVpKVjIrR2RndlZ4dURsY0xRTzJyOXlaRWt5RGVXZFczNURS?=
 =?utf-8?B?dFJEUUJ5T2pFdHozMDRhUXZCTVhwMFFFMlpPYVo1Z0hhQkVYaGEwdXpnaCtK?=
 =?utf-8?B?UlU4RUFDemRMNVZ6ZEhYcDc0K2psalBWR3ZJUkhiWllLVkN5Ti84a01uUmtp?=
 =?utf-8?B?clZZWjVLTEx3MWFyWEo0bmtGclNYMnM0TkFKazhmcFlQMFFHWjlMQ1ZaVlF6?=
 =?utf-8?B?VzYxQk5oTVRIZEhWM21KNXJRNnRMQVU5OERQQ2VVSERXOFRGTVMvNzNoTW1q?=
 =?utf-8?B?WW5lTGJuS1E5alVjMmRqMUQxdVBDNTUwOG1aZGVxUmhJRlJycExyYlB1cVZK?=
 =?utf-8?B?UXhKTFhRNVVHNW1WQk1kUGkvWjVFdmpXR1RrNDk3aFp4RzdjY29wVm9Qc1dT?=
 =?utf-8?B?MVhqTmZoNGxjckZ0ZGxSWjVuUEdwWmlCQm1VVnR2RGw3eHltMm1melhXUlNu?=
 =?utf-8?B?cGZJS0ZPQ1hBUGtvUHczSGdYTnN3S25VdGRyOHl0QUVSZjRrYkgybzVtUGxX?=
 =?utf-8?Q?7SilxwQMNFJOMDYskiRF1Qa7+KY40Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dElQMjJ6NDRvRTYwU3h0TDdZaE00OTcxenhLcUFSb3ZXWGdrdU5adXlIb0dw?=
 =?utf-8?B?cnMxVkJFSUxPYll1eU1WLzl1ZUNNOGVSK3FjZjVzVEFwU0xoUDhrVlovcDdG?=
 =?utf-8?B?bkVNYzdlQXZtc21iQ3NOYzM2Rzl4eTlCTjArZWsvVVIvSVJEbURYWUhLRC9R?=
 =?utf-8?B?RE1CRkNub1BDZVBiUFBBOEd2dzI2ZHRBQUhNbXJvQlBVU3A1cDZsSXN3V1hX?=
 =?utf-8?B?RXJUR1Z3UUtnSnZiT0ZVamNSelFGVCtLQk1jTkJhcE9mbWY5TEtCRkxBQ1NP?=
 =?utf-8?B?VENKZVdhZEFBcnF0UmJGakN0NDNrRHV6QjlnZ1MzU3hJRk1idVVTa0w5cVE1?=
 =?utf-8?B?UHJxMnN5dXZYOGNuMmdmQit5UmU5RVN6NmlQMmtxdzJwSndmQzdpWVVHaXVy?=
 =?utf-8?B?Qnk0ZUtpOURMb1p1YWM1dkxhM0NHbDhTSnVPTjFvbWFINUlDRFplYlVLU01i?=
 =?utf-8?B?OElUMEN6MXE4ZDU4TUVxUWhVSmFkeDRDMjZGazZuc3dBWXA4TXZ1QXk5RFhm?=
 =?utf-8?B?VHZKZ1VWQWY0YXhORkREZFEvbUhMUWZqRVVRT0o5bFFxOVVLU3BnYXdXOVVy?=
 =?utf-8?B?WVNQdm0zOXdacGxqb2NsU05XMEVzcVVGYzdRMXF0ZkpHbmY5VGVVQmx0c0dG?=
 =?utf-8?B?dGZ3bUZxN0JZZTFvdGJBSE5XM3NVdDZKS2xwdTQzR2FlS08wOEU5eURyMU5w?=
 =?utf-8?B?aUF1RFMrdVh1WUlkK3V0dmtsV1J4aUcxdm4va2Z1TUNYS0tuc0E0MnhKOGNK?=
 =?utf-8?B?MGE0SzdIY1VJaGFWeGtWdjV1OHVra2pWck81RWoxUVdheHMxQlhFVnR1OXRU?=
 =?utf-8?B?VUY0Qk9OQmJ4emVaQXVYRFBjMUpTc0Z1UVJjQVJZcDRUcjZaa1g4akx2cDhX?=
 =?utf-8?B?SXZVa3pxMHpBWVVhRFJsVkk4U2p0ZC9LS3hWTDVua0lNenh1QUgvSjBxSWZY?=
 =?utf-8?B?RU82K1VlNlJKVWpTTkZheFdMNzMyaDRNMWFULzRpVkxaQ0krdVFlbDZSSGhP?=
 =?utf-8?B?OTFobWFwSE5LUFNFbVRud01iS0hUQUtHMkI4N2ZVdE55QWZXRXo2SHVZZTdk?=
 =?utf-8?B?WEg4YXg3VWE2Vk54akUyVWhKenZvZGdKWXpPNlkvWGQ3TjdKclR5bVBIdUFG?=
 =?utf-8?B?cDVvTlY4c3U4MzZhdkRnWm5qa3NDTzRNUFRCZHBSL0phamx5bjRJOW5rN0F1?=
 =?utf-8?B?M21adHk2aGxid051VkJlaEgxOVBrTXlrdWNQSTZ0Z3ZqRks0T0dTeUt0b2to?=
 =?utf-8?B?Y2s4WnhvMElYc0M5WjVrQ1FWRjVTSmdiblFpRkJnSFRmWi9TdGsyYjRrbjQ1?=
 =?utf-8?B?emtXRGluQ1dBQlVKWG0vQzBCZUp0Tk1GNm5UYWVNenFhUW14OXNka2dkRFRs?=
 =?utf-8?B?S2hwZ25uMitvSldGSkZFZG92elF6cnZ4dmFDY3ZNMzYvMG9sVlA3Tm04aHdm?=
 =?utf-8?B?WDU1WHkzV2hZSklJNHU2a3UxSmYzQVptUkROcXVrNk9KdGhpQ3NtWWs5TVpG?=
 =?utf-8?B?NXVsem1GL2I5WHdkd0tRc3M2TUNrZXZ6WWwvM2tVL2lYaytNMHJNcDRkK1c1?=
 =?utf-8?B?eWxzVkpxSEpicDBiUzZrTHFmeGN6RlVMVmNWdklEUEc1Ri9wYnZKNXFReEgr?=
 =?utf-8?B?TnZwWU5hTEo1UlhJTlRQUXFkTmhOS1RuZFFJNWZUaVkxVE0zdHZ2aWJFSmdv?=
 =?utf-8?B?YU0wbmswWE45SGVET0lqYUlodVUwSWlzTmNaV01ReFozd3VuTXFNWkxNQTVv?=
 =?utf-8?B?M2pvZzU2S1o1aDBqSnRFNjgvcmZyRU1XUC9tSEdMTW13MmFGaDQxRDlPVUlk?=
 =?utf-8?B?Rk5ud0ZqZVZKT204TWdPNjBaKzlCRXV6aFNJaWJPN29VR0hqUWtnRHF0dnNU?=
 =?utf-8?B?QTNsY1lZeXdkcVJzWHJLSEd3ZDFmOHRRZnkrWTJtUVMrTEdqUnYrRlB0aktS?=
 =?utf-8?B?QlFrNEFyV0VIeXZOU1pNNlkvVTBMSU9zNU9jQ1Bsei9MbVQreDFCY2Y4NVFD?=
 =?utf-8?B?Ty9RcjZLL1ZtL3hVOTkvZTNzWVcxQUI5WVdraUNuV2ZqZExQUWs5RytCV05m?=
 =?utf-8?B?ajdHSUJmKzRYS1JyQmpIUzBka1l0M3czTi92ZlN4NjgzSlNMakJ5SjFZNmc2?=
 =?utf-8?Q?7AV3oyNt5wqyRn7ONDqJhqDV1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ceb6fd-458d-41bf-252f-08ddfa45fbc3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:44.1292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpWzasPQxFzG/iU0mMbd0KZk8KUX1OGX1ERbzd4c3M3aQAGTkBRrpoGaAySl2RBI4k4/FyNytfGF8K6CVHiwVw==
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

Add a helper to get LayerBlend secondary input selection.  This is
needed by disabling CRTC at boot in an upcoming commit which tries
to get the selection.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 38f966625d382487e45c2e0c202e15c1417f6e65..b0f3fb818799b58597e8ae41d868338c3fd40800 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -23,6 +23,8 @@
 #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
 #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_GET(x)	\
+		FIELD_GET(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
 
 #define STATICCONTROL				0x8
 #define  SHDTOKSEL_MASK				GENMASK(4, 3)
@@ -182,6 +184,25 @@ void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
 	dev_warn(lb->dev, "invalid secondary input selection:%d\n", sec);
 }
 
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec)
+{
+	u32 val;
+
+	regmap_read(lb->reg_pec, PIXENGCFG_DYNAMIC, &val);
+	val = PIXENGCFG_DYNAMIC_SEC_SEL_GET(val);
+
+	switch (val) {
+	case LINK_ID_NONE:
+	case LINK_ID_FETCHWARP2:
+	case LINK_ID_FETCHLAYER0:
+		*sec = val;
+		dev_dbg(lb->dev, "get secondary input selection: 0x%02x\n", val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
 {
 	regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC, CLKEN_MASK,
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 0b81dc6b251c452e7ca72f1cd12af065bafaa198..4e38aead69bce6e9ad4cf2a7cd1fedbaeda60650 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -93,6 +93,7 @@ void dc_ed_init(struct dc_ed *ed);
 enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb);
 void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim);
 void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec);
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec);
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken);
 void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode);
 void dc_lb_position(struct dc_lb *lb, int x, int y);

-- 
2.34.1

