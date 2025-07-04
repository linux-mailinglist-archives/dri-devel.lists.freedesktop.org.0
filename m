Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B5AF8D5D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5110E9BB;
	Fri,  4 Jul 2025 09:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Qa8LQLWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CA710E9BF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tiafi1zR1XUmHPOLDj4N67cF5drHeyUauFpNp0ke6MOV6zPnZRbDjufkp5cCNUyerXxCP9TuOKBnjSuzmaxioZefNnA5tOogaHD7Z/Q5rv+myT47SmDa8hFK0Ulm1Gak996mtsqrXq5ZM0Ru1KJ+vwVtSytR3tI05P0P6iGRCWQH9L3ASPDPy9h4hKF2rhrrbNpZUyX8eofnZCGiA5sFeoRtODKSyIxIi59TLvKrNlcOa1cMjSFjM1ZAHVFIn7jZfIYyK+7QsMdE06xRxvFWReoTMchrP5mboK2mLwZe8RH83qbhjzjwtceviWDKe3oYhy23lbpSh3xvqXM1kqlgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTTU6utz2rZuxngrgqPrFhEKGKy5fGe//ddLMILYZOQ=;
 b=BeBwP+SiCZzBwt7UyagzGyEtoHngWl8QlVGftWrDu85zXaUwR2nPwvJwhCSOnSOLY02TXLDQCDV96/euyMNIu33CEHVLp7CDoUmy7SdN7cx+ZdWI+OiZGJ3EhkO6phr/DerGN8J/Bd9OTFArOeX116V6zb/KjQmzEte0YTDrR04RURBuNoCKVMCPmkqyqMvtw5nQFHtp5wR1ls/DNRoIckP/xKGzlKwGyxzNIGn//TktKaK+h76djYzC8VUV3dXjEcpAy3D39Xw9yQVwtar+71IvMnLmG2zD9BE0F2zOaxPOVAEoP9hLym6vhPd86dKWiBYNl75gwl/mkZcXDky5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTTU6utz2rZuxngrgqPrFhEKGKy5fGe//ddLMILYZOQ=;
 b=Qa8LQLWeZ+qODCNHLhbYF/WNxbkjqftAKC+a9o0n+v9FAGGXxPjP5wMsoslUghz6kUZjDNPKrASxEEohI75LBk5tSQ5h6sSJlSbbfXC0QaBmg3gGCxCdWdtiHMkgQAb39momxgiU17UfMytsFSb+Yo7k/cCqUyW+XrKUswf94cNAyNmo89NVmorDPYg+sv8XimZFwR1PMUVbeG6d+s5NUM5Gl7/EplK4dZ2oOeQYkpO4hl5vwVH32/xKtHHnegATGZp9/nY3dR5XcAyMmGY/F1TAmFXq/GIQtj13aWNsUsqrgRJ8t/zjPzSzzrurauEZY8hATHSwOiTC348bRU1BdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:04:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:04:07 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:04:00 +0800
Subject: [PATCH 13/14] drm/imx: dc-fu: Get DPR channel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-13-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c377a7-93d5-4b2d-1106-08ddbad9bb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkRXWFlmRHBkbVMrUlZnS0x1WnJOZ3BSa2VTeDdwdXU1NDJ4eVdYZUorOFNp?=
 =?utf-8?B?VkloV1VYaE5hL2FZRlpSSi9GbktBUUVmZkN0OHVDRXZMZ2tXMTNNaHBWQ1RP?=
 =?utf-8?B?UVdFbGtueEhZaXptSkE5NTlIOWkrK3dwMmFnOG9ocHhTVEtIU0pDK1FQUzZi?=
 =?utf-8?B?d0JPb2NSaHJLUXNUem5VeVRBbms2VGFSOXZsVHhUT0RTdFQxNXRBWDBhS0Zs?=
 =?utf-8?B?OXE2M3hEUDZvdVVIWEw1R054ejhhcDU5d21KeVAvdCs3WGFWdnVlVkZaeXEz?=
 =?utf-8?B?clVUUmVTZ0NVaDloTTFqdXE3MVhZZmxtVUIvM0dVWWR2T3Naa1FHMmY0VWtw?=
 =?utf-8?B?c0J2ZXpRRTVQTXgwNEJyV3kyYjBhcTQ0cVFiRC9NT3ZlMXd6WURVWWlNN1FG?=
 =?utf-8?B?bTVNemVHYXNVQzQ2TE5RZlhPVlNBTEdCM3ZZVlEvU1Bxem9ISEd2aHlFOUw0?=
 =?utf-8?B?SzhacEhxc1ZwL2RDSXd3ZFIrMWVKbHZVZExhcTdqRjVaZ2gzZm9SK3RHbmln?=
 =?utf-8?B?RnF0NWRKbXZacFpzNFkyM2tKSXkyTUtpNVRiRGhKMFRiWlBtNFRCOHQ2WEtY?=
 =?utf-8?B?SklCbkFLcVFKODhtR2N6QTlZcnlTQXhZSEFHNDc5TnoyVU9sMXhnTDJDV3hl?=
 =?utf-8?B?YnpvOS9ibis5eHRobXVNWWI3b2JxcW54ODlXTml1QXM2RFJkdWdWbjFiQXA2?=
 =?utf-8?B?aW1MK3BWSE1Obk1nTDI0L3RpWmpGRnQyZHRYU3JNS1RCTWt5V1U3amRSN3BD?=
 =?utf-8?B?VEk4bEtTL2dSZkRla0g3QjNtMDBINGJEdDlSMTlCUk9hcjEzeUJiQWc5MWly?=
 =?utf-8?B?cFd2eXFBU0NFWmRLRFB3QUtKVXVuSnpqYWo2NzBRckpNYW14dE93amxrTHRX?=
 =?utf-8?B?Qm85TXZFYXdMWXcvOFZMVDRlcjdiZEtndWZrOFVYVmZOV3BrUFRKUlhqSnNN?=
 =?utf-8?B?M21xb0NwUEZHWnZJQ1lCTThrZGo2L21yUklKMmFFQm1TNDNCbEkzTTZXVzhK?=
 =?utf-8?B?aXFvdyt6cytLbHFkOWErUmhueUVyQTBRUjEvVjUrYXJ3djEydzZ3OFZYTFhC?=
 =?utf-8?B?MXZSMXR4SGZNelNpclFHeDJkZFoySm85VlY4WU8zWHpaeXRlZFlxeFMxelNL?=
 =?utf-8?B?clVKMk1LNFcxME1JMS9VUFlxWnM2YVhRS1AyVk04NU9rRVRxbFdWcEkxUGpx?=
 =?utf-8?B?VFUxbGdzZVU5QnNGdTIxaGtnM2trK1RaZ0pDWHluVkJuSnQyOHBxcGpqcThU?=
 =?utf-8?B?L0hydWNnVXprWUNkTnJqcUJDL1pnUTFLTmtQcUpxVlQ2WmRJWEg0c2NkMVNz?=
 =?utf-8?B?Tkp0dVpBY2Ivb2h2ZThIY2RjZEc0YW9zcVVQeS85YWRVaWcyNzgrS1VFZnRO?=
 =?utf-8?B?N0F6em96bjZjVWhHR0xPVytxUkVNdm14SkM1REVERkw3TndQMUQvUmpRZTlz?=
 =?utf-8?B?cXdkcStVN2dGSnZVVHpDaUxMVTFabERmNXFUZUlHQURNeU1ORjVaY2dCdGNE?=
 =?utf-8?B?cG9weHZ4MHhwb0Rvb1RLc2xwdFVXaHVQdll2TTlBOTRsZzZ2MVBUUE1pNDVa?=
 =?utf-8?B?eDFZNEZHNEZxeHlGck9KVk1KR0JZbjJIRW81Mlo1U1VZWDVSZFlGazVURC9x?=
 =?utf-8?B?Z0lRUVpRNmp2RG9VMWZLbTIyOStSREZzUlEya21WK1UrY3dWeFJHRG9sYXlM?=
 =?utf-8?B?SlJSZkhRb2MvUHM1OUdzUW1yc2MxS21nYlUyK1h2VUM4RVhkNzNMbEwxWVRK?=
 =?utf-8?B?VEFuVjBiNUlkT29KNkFSQSthai9LUGlSTlZrWHV6MHVIVnFveWVHSE9Ibk8r?=
 =?utf-8?B?SXZNbEIxNitScUo4b1RmRkVEUm00eHZabmdEK3FWeENaa2NtdUxIb1lSdU9C?=
 =?utf-8?B?alcvQTU2dnppV1c4WUIvYXZ2TzI1RXk2LzhoTGc5SmdiNEc5TlNwZ05jenVX?=
 =?utf-8?B?SnFPcDhLMFJHUVQzbVpJY2lJNVQ1YzUzMTRqYWd6TVIrWlpISE1qaFpTK2tl?=
 =?utf-8?Q?MZBqURYabdo5wJUvk3v2gurnaD4BYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTZ3aHAxdjZaUTZPOFRUNFdDN21NdWhKYmpiZWNqU1VsWjJtUTNkOEhOT1l1?=
 =?utf-8?B?OWpWR0xVOVdLci9obDVPMXlkeTlZcnFpeGZmU2twakVzNmFnZ2d2Y1ZGeGFi?=
 =?utf-8?B?akVaSDhUdnFjZy8raWNhbWxsN1pRUGp0Kzd4SzUyRE5RQlZrZnJLZ3E4cEhE?=
 =?utf-8?B?OVFXaVllUjg1ZzhpN1haS2paZTBXTFhHdVYyTUxQZ0RxclRBOERFNG9ZWmNR?=
 =?utf-8?B?RWJFd1JUTm9BdHh3aGFlYzRMYjhaOTR6NkhRMHVXdGZ3dllkeU1pVWtwbTdq?=
 =?utf-8?B?L3RxRi83V1prY3RPT2ZwSVZkNmsrTU9jYnFybVV6TTN0RzJDQUw4MFdoa29D?=
 =?utf-8?B?SGJkdUpTTzUxQXVaUll5aU5mQ0R6SHdGZE44bWNhSStmckZBS1hWVFFSdTFw?=
 =?utf-8?B?d2drZzZnQ3FnY093TTNCR0ZXcTdTdS9ZTWJVVVFpc1NwWnRmc3N2SndOMWtq?=
 =?utf-8?B?d3c5dHh6d2paSGNUUjZ3RmVESmVuaFg0WnBBNEdtL0p2S3RFSm8xQlZqR1dS?=
 =?utf-8?B?ZGdUcE9VQWp4dVNBYmRaaGdvS2N2ZG9FTlhnVjFKYzBrTzhqakRVc2tUZGVi?=
 =?utf-8?B?blJXbUlSeVZyd1hTL29CeDd5WWtEQVVWQkNHTUZNcys0U2dXdXJ1QlFrYkpn?=
 =?utf-8?B?ZUtRUGM5WGRmNHdQZUhGdmZjSmQrRTVVQWFLbDhFM1R3dmI3US9QV2xlWHlH?=
 =?utf-8?B?ZjJOak1SZmZ2Z3FiSjFOYVpoZnRZN3F4Q3FYLzVtcUlENVVzV3lmU0pSMUs2?=
 =?utf-8?B?SURlWVhSY2pIK2gzOTZHdDNyUFpLY3JSeVRZRWpsR3pMVXpFOFhOVFBTVVA0?=
 =?utf-8?B?ak1DRGhlVTVUeG9jZFdTT0R3Z20yYnUrbmpBN2xCdHl1d0d0c0x0RDM5bG9B?=
 =?utf-8?B?OHRIdUVRdFA2cHVrNmtGTi95NGhNWGh0bU1oUGVWTFA2NGVFK2hZaDFGMWRJ?=
 =?utf-8?B?cWlzN0NpZ0kyUUZ3OGJWeW9zQXAva1loRkdNZk9adW1UbEI5WmhlWlgxVUlu?=
 =?utf-8?B?L2N4M0lnaC8zRmpzTUYyRUZJZ1Jkd0dYeHZQRm4rUVBtQXVqdXRrcVp4a2xa?=
 =?utf-8?B?SVpnMDl3TVFNeUM2ZTB5MHhHVkZraHFsZ2huaU1CYkErQytWbmN5bGl5dWpV?=
 =?utf-8?B?WDBEK09FaTRtWk1NZzhoZmtlc3pIT29hbC9qWXRldU83dEluV0ZTdmw3VXVU?=
 =?utf-8?B?QTlDd1lpSmU1UkVMMnJ1c2JMNDJWN3pzSXBUdXRTSmVER1BnZjZNL2NhSDZG?=
 =?utf-8?B?SlZnaEpCekU1S2hJR3BGTkY1YjlSOE5VRmE2ZWc3ZnRKVVFiN1REaitrVXZN?=
 =?utf-8?B?MndmWmpsbnJvLzZjZ2tBVXg3aU0rRkloRzBodHpEUnA3R2R6WGVMazU2elpE?=
 =?utf-8?B?Vm5PNEQ5V1RFZTZLcWNQZEpudGh1VEtkdFI2UU4ybVZPdXJ0WTFzdklVV1lB?=
 =?utf-8?B?ZnozWjhNZzRlc1Z0TGtlTGpnVEkzNHN4eGlhd3NXelg3V0IycVZUcUxrRlZY?=
 =?utf-8?B?dVZDUjBmQTU3cG1JclhZd2htQTBkZFNWMytnNHZjV2E2aTZ4dm93Vko2WDFC?=
 =?utf-8?B?aEtpL0VESVc0QlcwRktkWHFQVVhsZ3FtQjBaeW54LzQwSWpCaDNUQ2ZKY3hz?=
 =?utf-8?B?THhLMHJFWlJNTnBzVEtsbGN6UUlEL2xPcUFHUjlYcWV3V0ZLYURSSW5nMXox?=
 =?utf-8?B?UzcyVzh1L0x0SEdBc0FhK2c2N2l0bHZpcEtQK2c0MHJGRWpkUTQ3V1c5K3NP?=
 =?utf-8?B?Vzk5bllwZDRhZE1UM1RpS3EwWVhvZlNHRXZIb2hHR1QwMldOYzFpQ0FHeTc0?=
 =?utf-8?B?OEgvenh0RFlURUY0RkJhZU1xUlpNbFRvTnAwbUhLUTI0ZXl1dGNYdFBBNlNT?=
 =?utf-8?B?Nmh5bkgwSjZTVGxWdFdDamRaaTBoN0xZNTlEZy9NeDJybzRSeG5ja1Z3TjF1?=
 =?utf-8?B?U0JVc1RTL003bFdyUTdJWVd0VkpVczBidVhaeE9uMTZJeENSWnNlMWtEODR1?=
 =?utf-8?B?MkdianJLcTlCbkE3WmM5UGZRYW8wakx1RUc1L29jYllpdFZJQ0F6d1pMRkt0?=
 =?utf-8?B?V0gzSG9reVpJTmFjMWl2RTZYc28rRk9jL3pyV0FhUDRNcUtiQm5XUTNqMjVu?=
 =?utf-8?Q?yCSNlPrqq8Lm46u/xaBEwBWhy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c377a7-93d5-4b2d-1106-08ddbad9bb7b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:04:07.6488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIZwEPTVo1w40tWOqfxekbT+oPoN3SO/AMm0fsJzMZaqUOsSBjoRraVSh8k2ZcTslG1pEcjuuBjSmsewJaBdtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
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

Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
And, call it from dc_{fl,fw)_bind() to get DPR channels for
FetchLayer and FetchWarp.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-fl.c |  7 ++++++-
 drivers/gpu/drm/imx/dc/dc-fu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h |  5 +++++
 drivers/gpu/drm/imx/dc/dc-fw.c |  7 ++++++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13e8aa150c0152a5a1ea3d0fa90b7e..a1835f43da0dc5cf0c83d93f16658b485011e285 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -101,13 +101,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fl *fl;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
 
 	fu = &fl->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index b36d3034b8d5962eaab212b6b65ebbb5c29f978c..47d436abb65157de7cab74565e44b199be76de52 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -10,6 +10,7 @@
 
 #include "dc-fu.h"
 #include "dc-pe.h"
+#include "dc-prg.h"
 
 /* STATICCONTROL */
 #define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
@@ -256,3 +257,20 @@ void dc_fu_common_hw_init(struct dc_fu *fu)
 		dc_fu_set_pixel_blend_mode(fu, i);
 	}
 }
+
+int dc_fu_get_dprc(struct dc_fu *fu)
+{
+	struct dc_prg *prg;
+
+	prg = dc_prg_lookup_by_phandle(fu->dev, "fsl,prg", 0);
+	if (!prg)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	fu->dprc = dc_prg_get_dprc(prg);
+	if (!fu->dprc)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to get DPR channel\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 518d1af49f5ae9d4f67da5e6c2e80abd7e962120..44b9497e53580589a05bcb180eb2312ea4449da4 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -8,11 +8,13 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
 #include <drm/drm_fourcc.h>
 
+#include "dc-dprc.h"
 #include "dc-pe.h"
 
 #define FRAC_OFFSET			0x28
@@ -99,6 +101,7 @@ struct dc_fu_ops {
 };
 
 struct dc_fu {
+	struct device *dev;
 	struct regmap *reg_pec;
 	struct regmap *reg_cfg;
 	char name[21];
@@ -114,6 +117,7 @@ struct dc_fu {
 	enum dc_link_id link_id;
 	struct dc_fu_ops ops;
 	struct dc_lb *lb;
+	struct dc_dprc *dprc;
 };
 
 extern const struct dc_fu_ops dc_fu_common_ops;
@@ -123,6 +127,7 @@ void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
 void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
 void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
 void dc_fu_common_hw_init(struct dc_fu *fu);
+int dc_fu_get_dprc(struct dc_fu *fu);
 
 const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ecd6d36dbab050f25b560d9ec9aba5..c2e60741bc871c6976ead53f132b60f19352aab3 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -131,13 +131,18 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fw *fw;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw)
 		return -ENOMEM;
 
 	fu = &fw->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
 	if (IS_ERR(base_pec))

-- 
2.34.1

