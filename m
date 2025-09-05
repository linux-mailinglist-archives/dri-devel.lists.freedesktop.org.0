Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7468B4531D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65A810EB4A;
	Fri,  5 Sep 2025 09:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="B3yaZrUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013025.outbound.protection.outlook.com
 [40.107.162.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D8C10EB4A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U++lWDKJflEhnZkmUeu90JF0+ZCgyf93XHNHRmHswjq3cW/eLPmoUk+CLMEeIGnbVECStY3orav2ovRLIY/IseTi6b4IYtCAunUVW4+ht+tzXxY5Av0+Vwx1h1Q3VKXMdRPRiL/E5uZmX99iTSLrjL5BJAOHQEk+//dsJLzQYr20+LXw6IsXdPcV10bclLYwBG3PAcerwUfe2zrWr17VP61IGIdDCMsmLBqVauNjhFM5jjKQlolcDgTtiNJxfWi+vPlBx81Ay0dvlJCmiAXqlAhgwvH+3hWh3Xo0+Ererk8LeBgea8vcAm6vz5lABW5kMQtAuzhs6w4kGckbY2VDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0gjDP2efuV9BQpUSQHIfnOKTGz37KgEeeRFk41k8j0=;
 b=CHvqVlLWgy4OBVUK+xFBjUXMKELxmbzo7Hh9WFBhviz23l8NApwoy29xhhuqOF/lsjKKEcoz8Mvqpgljp66/wWxHSe22JSY7sPN4kFFJoMvVXwaJfVhBvP2WczJStldRKOQK+DqGnM3sAq7I3gmNQnxtBbrEZPXiLZM5Er8syE/iorpK58VXfuMCo9ZFJ3YagkI/65dwqeorcqX36PWmzSMoQMWOUTiLNvZqseH6zaPPFOWNRusFr3CQ9v2i5Ch10i5KfkvB3FxA+RPtRY7SWx2KqhDj00SQGzS+BmWUYJPtevh2gEYaiacijNPslw5ZiprBs/W1PUUMDgcWX+oqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0gjDP2efuV9BQpUSQHIfnOKTGz37KgEeeRFk41k8j0=;
 b=B3yaZrUNknzqtIgCanNhyK5IVi+lGbG1cnXt0BBRrCA4tAFTTgjgnqGuKBM3ADSTlwIjmkWAlirhCirfJM43DPE2g9WpBUgknqhgT5T5I850CbdRKbRSnCAFBJyWlCENooO/fBugnk5LU8+xh697xofas1OLG0gH968s7PswX05izWXRw21KBM+OTKSHLqt1n+BYYL/gcY3DtYdExiAxEQ59n9/0MdjebsZWcVv8i/x0OdoeerUNNYrudKp81ANL8yXd/zBwUiA8ImuDvRisxUbQfWbmfX49F0VCOIjsfEb5A8vpj3We1mjgT3i1cOVAH7HJlv626v2XFPBX5i9swA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 09:26:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:26:05 +0000
Message-ID: <b9a2d0bf-84ab-4006-ab77-a07a8bb34c94@nxp.com>
Date: Fri, 5 Sep 2025 17:27:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx8qxp-ldb: Remove dummy Runtime PM callback
To: Geert Uytterhoeven <geert+renesas@glider.be>,
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
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <c7436cda28409f0080dca6cd2ca13f142d6dc489.1756999913.git.geert+renesas@glider.be>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <c7436cda28409f0080dca6cd2ca13f142d6dc489.1756999913.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: c526c109-c83c-457d-4e79-08ddec5e3d05
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|7416014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjVzMG44dWdBR3RLWm1CWWV4Q21jUTA4VXo0TDJNei9hUXlqbjhSV1cxamlm?=
 =?utf-8?B?N2FPejRIZ0tJU0lTVzZpSVl2Sm5xelE2NkZsQlJ2amczTUJKTmVicHdvZFpE?=
 =?utf-8?B?YndGckJ0QU5vSUxsMVVWT3NqbXR5ODd2QU84aWp6MW9LaUtLRjlTais2dEkx?=
 =?utf-8?B?eFljdndZRU1BcGt4ODhTVFlsbk83ZDBNdnJ6aDh1S2tzQkJCZzdaZS9FeFlX?=
 =?utf-8?B?SXZXeUpoZHIvWGJ2Mi80NXRqS2o2UFA5Y0c5bjJHdDFBZ0RzVlQycHZ0Tm4r?=
 =?utf-8?B?Y2xxd0M4WXI1Nm11Wm8wZDQ5WGd4MFpoUmVTY0VSM3luV2l6ODBaY1pzcUJ5?=
 =?utf-8?B?V0g2USttRkNmb1ZWaGl1UFppUDVMTzhEY0dHSVA0dlJKa054VjlqbjZKcVB3?=
 =?utf-8?B?cGM2T1FZaFFOWTNMc2pNQ1piVjdieUJBejg3YVRUUkhHOENPSXIvNkZMYXh3?=
 =?utf-8?B?RDhiZHJ0UG5sNTZrN21KWG81WFBkdTZEVWFpYnR3eThZMHl6V2JsUWRncEFD?=
 =?utf-8?B?WGxxdHFSZktQS0xRSi9uMEtCcUcra1o0TTc5NnJRQmlGV3hlQi9QQkdQU3h5?=
 =?utf-8?B?TEVxRkVhRkZ0Nys3WjFjOE5HczU5VjFUcjJYOGI5UU9qbjdLbG1qeGtGYVBm?=
 =?utf-8?B?dmZhbnJVVi8weFVlQ2ozbmlhemttQmFTNVV2VzE3R0FyVlhBa093aUo5cG9t?=
 =?utf-8?B?Si9rT2JpTDdYVkl6R04zYy9RSE9aVnAvWjJqWWdITEhFVTNHMVBzYVFLVVds?=
 =?utf-8?B?RGduc2wzNXQ0eHFLS3FUZ1NaNzYwR2pkODVRR245MDBLQWFCaHZzVmUwNzFX?=
 =?utf-8?B?R0N0S05GcURiY1ZOODk4U1kzM0ZpV0ZzRi90ODVqU3hMNFNKZzZ2SlZoVEVu?=
 =?utf-8?B?QjA4UVVLVkVOTzlEblVHbXFQU3JKZmh6NDNSZitUem9meHVSdVVGZUlRcHFo?=
 =?utf-8?B?NmZ0V01hS2NzMUgxL1BpOHZrN0ltUVF5NWVzK2REek5CeXBaSzNJUlhlcmVY?=
 =?utf-8?B?cVlIQ1ROblpSVGhjd3lRNWxub2hTdFgzUjNaKzBDNU53MDRTcFVJVWlydlRa?=
 =?utf-8?B?c0J6SmtuZ2N1c0QxMHRoUSsvdVBtdVFhNlZGVnNUelF5QWszRTNvNFdsa25F?=
 =?utf-8?B?Y0NraDVoOHNHSEF4WkUxSjB2QW9PeVJabVdndHViTGFSY05uTVhxZlZ6UzRG?=
 =?utf-8?B?QVVIWmc5TEFVV0liWW5wcVp3YktYb09kb1VMdG0rQjNaMGI1SnQ4eFZKT21k?=
 =?utf-8?B?V3FaWEk3eFhqTEd1Mk9reFROK2xYdDY1dWpabnY4OHd6NW1lWkRiM3dTYW0v?=
 =?utf-8?B?amZad3BFTlQ5endSZ1htdVhYblZ5a1VzaG1FWmRLbGRJUzlCTitTL3htRU0r?=
 =?utf-8?B?MUV3YVRDMjIvYkNDMGFwcU10N1FiL2tCRVY4K2tTM0RKbHhKSHErTGZ5amdu?=
 =?utf-8?B?dkhoWDRXbENjemFoZ3Z0TkpEeHZCSWlYL3NIY3BJTEM5S2tXNXBWR2xYQ0pI?=
 =?utf-8?B?YnlSR1NyaHdNdnJhSWw2K0VYQXJDY1c3MXBmbHFOOHA2MW1JYmNpRjFQZENp?=
 =?utf-8?B?OCtzdDYrTm1tT3VzNHV6bldBNW4wanNpQ2pROHQ2SGtwK3FGRG01YVEva0Vk?=
 =?utf-8?B?Nys3L1FBUjBpdms0STB6MWJocDc1U252WGFOeFNtWHdTOGZwNXRZZWc1L3Q1?=
 =?utf-8?B?MDMxTkVTZGhLSlRFcHhWUlFCNDFySHlnMDBDSjQ3a2dtK1Bzdjg4T1FOUVJU?=
 =?utf-8?B?UnQ5cjB6ZnA3bTlIR3dPWjErMG5tT3NXTzRMK0ZpU3Exa0NQYlRmbGNKdkho?=
 =?utf-8?B?cmdjN09SZXV0SEZXSGFqS0ZqYURTalNFOUJXcnQ3aW5STHZRWTlZTmk4VHNt?=
 =?utf-8?B?Tzc2SEFnNHJCY2NFeXFGcStoc0FTM29BWk4vLzhQVEhyNjhHQW10VWRMTGZC?=
 =?utf-8?B?ckdYZmM1aFJCWm0yamlCYlYyeGZpUDRQUHlOc2ZkNXFLdllLeXRFcWFla0VJ?=
 =?utf-8?B?WXpBMVpVaFlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rjlkcm5PWEt5Z29uYi9sbFdiL0xnZHkySEFiNmgwMmNFN2hkQXFrV25zWjBh?=
 =?utf-8?B?alhkNi9ndWo3NHJRNkY4cm10WWdkSGpGemlRL1A3MkJmUHN4d0VEUWhzYnZP?=
 =?utf-8?B?TGN3Y2pNWCt1Z2UyU1dFTkF3UEJOUFlBRjNnNS9yMEVlbmFtUklwSXF1bXpv?=
 =?utf-8?B?NFYyVkhuY2hXcXJJeTVUdjdOTzV0eXF5Vnl6VGlCaGRXNC9YWkx4aVlsZWFy?=
 =?utf-8?B?WUVCRFE4WG1yUGFPY0MrblVkNmRSaU5CS3BZc0FSWEI3a01GZWl2bUt4QVdr?=
 =?utf-8?B?bnV6d25JNFJEWkRKcVZJVktMWWd6ekpXcFh1bm9PWEN3dHphV2ZmYkJJMmI0?=
 =?utf-8?B?RVE4eXJGTUp3T3VrNlFiaGIvR2hSVmk3MDlnYU1qOEk3cGJ3QlU1dk92Q2dH?=
 =?utf-8?B?ODlaZFIvWUpxUjBTSkMxdng5VnNIUGJ5Zm9TUHpXWlRIZGFNbXduNWNzcXNY?=
 =?utf-8?B?TlJYWWo4V3dlbXVTZTBFczRPNk5CWGVWUWI5TENPZzhpU2VPRHd1TjEyTU1K?=
 =?utf-8?B?L0ZGYVhTRmxtc1ZtWVFJbllrRjhOUjhqTUJkWTBzdmFIK1l2cE9XUW9KN01m?=
 =?utf-8?B?UmEwSXlHWHpsaDgxSzRjdzN0UmdEV2JFd1RrSHdHUFZLbzNOSTltNEZ2Z2Jr?=
 =?utf-8?B?b2h5d0I5VlJIWXM5cVpiYWx0QW5PNEZFcU45aG1BMmF4UkVSQW54bzdiSHp6?=
 =?utf-8?B?U3R3a0hQa0tLVFBwa01Xd2RuNzU2YVloNVg5QktZRG42V2gzUGk1RlZaaXpS?=
 =?utf-8?B?RmRxUm0wTlpDR0tWbW9WaWFhNmNYZEhsaDdUblFOSlFBSmxQLzFKMWRCaEht?=
 =?utf-8?B?dUVEdXN1L0dadVRJaG45bHpsYzE2Mm4remphRTlJV09nWFM1QnBHV0JBNmJL?=
 =?utf-8?B?anpocmp5Uk1UMEphdjJPMTQvbExBSFVMTDRyOTBNZ1c2Ymk2OEh3cTcxOUxN?=
 =?utf-8?B?SFF4M28rZUd2RjdvcEhjcEJiOXpqSG1qalB1SDJEVWVENjBkd3B3NG95WS8z?=
 =?utf-8?B?T3JyNUE2dEtEdzdScm42cUxBZGtoYk05TTc5MFQ3ajU0T1UvY2F2d081YWtC?=
 =?utf-8?B?aW0zZUgvRjJiZ05SV2FEdjVlVkwwYiszeHVJMDhwNERmYXo5eVFQOExBWW14?=
 =?utf-8?B?TlpQeWxrbm1sRVlwNHZOTUxXb1E3TWtqdlltaVFLTUF4N0p1ZVRLQlYySVQ1?=
 =?utf-8?B?cVBWN2JleXp6Mkk3Zkk4Z2lWenZYY2xLYy9QQzY4aDljczl4WTNoeVJLc1ZV?=
 =?utf-8?B?cUNpYWNmUlg3WGxBR3hENEdSS0NPNm5UL3E5T3o0NXRFNDZOTVZQdGpPai9O?=
 =?utf-8?B?aVduUFZUS2FpWEZORS8yUlg2S0lqaHlmOEFNZUtoVVV3eHQwR29ub2RuZCt0?=
 =?utf-8?B?dkdFU0I3OEd6OWRyd3VEMlJtU0dQR2Z5NzhETzZDRkt5eDFmc2RESmRNeG5J?=
 =?utf-8?B?UzRsUDZsM04wcUl0OGoyamZNTTBLazJVa1FrcnU0MVBJQjJvY3Z5QkZVQm1p?=
 =?utf-8?B?T09EME9od3Y5d1Y1UXVyeUoxaWtJeVdpYXdwUldEMUlNbU51bTQ1eWlOWEJs?=
 =?utf-8?B?cTJiazhFNU85c2tiLzhDL1kwSUdOQzhXRVQ5ZG1QM0tPeHdwMkNJdko2OWh4?=
 =?utf-8?B?ZnA4OEd3eTdEMXNCTVpON2hhbG9HWExUVVhBK2pyeHdxam5pNG1Sdy9GNGFu?=
 =?utf-8?B?VEJYd1dnYVZ5TGRvSG1EdDF2UHlsK0x4Y1pxL2FhZXNQTDlrM09TUm9mQTVU?=
 =?utf-8?B?MnpaK0VQZHl5RGM4aGcrK1hPMDNLV0VaYTU0Ykc5ZEtYRjN3UkFFT1R0ZHRj?=
 =?utf-8?B?RXlaWlEwZHEvc3pjekQ1bWluWFBtYlZER0dvYXNZZUxCdHdHVFlKSCtRR3Uy?=
 =?utf-8?B?aVc0V3F5SGlxRlBOelRVcHZuMWtRSlJPQmtmOHNqdVdnc2pDRklYYmZ1WHJx?=
 =?utf-8?B?SzkwK2JsSHVFT2ZrNW1qVFFESnZuMTFPelEyQnhSbzB4S0RpdElLSytHWjdj?=
 =?utf-8?B?a2pwU3VCem43bTB1NENpc2RuSFJOYXd1Y0FKR1FzYTNpYlVxNkp4dEhqWGZW?=
 =?utf-8?B?Q1hIeVBOYUxFNE9BNmdUd2syOXdMbThlcDc4MXEvR1V6aC9rQlZxbW1jRGZi?=
 =?utf-8?Q?H8hGQEHErAptLk3I2EmE0cqMN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c526c109-c83c-457d-4e79-08ddec5e3d05
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:26:05.9048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNFFv+a/BXkvAB2+D+BnYuN5RjIhx/sn9JgmXQdc+5MZshCKSVi53ndsFEHLlzvt+AC951zH6eP8Q5mhO3SzPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471
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

On 09/04/2025, Geert Uytterhoeven wrote:
> Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
> ->runtime_suspend|resume callbacks"), unassigned
> .runtime_{suspend,resume}() callbacks are treated the same as dummy
> callbacks that just return zero.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
