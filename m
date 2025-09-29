Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE36BA7D2F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D7510E1FE;
	Mon, 29 Sep 2025 02:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eFZOijPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013019.outbound.protection.outlook.com
 [40.107.162.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF6910E1FE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLV3Ez61FeeY+3+pWnMCrieRmFV5SF9cMyHFKiBtmDYPQdTLC8UGLNjg76buOiBaHSIydAPF3p86a51aiJkgjaJN0x342rqGeMoaCa+FcKRejajuwVV2taCJTSW7iRzXKCErYwKn93Xrz6LQ02D+dZ8t1qdLYL1Eezl0PnvkueReDSU9Zo3zaOkmy0UczpXupzsFvIEV1nkIq57BATVkiwdRQD1JfRDhxDMYN66aQbbJExAXqw0wgX5261OsdZABMYjXMludb0UzGHjNe5ADeor31BZWXhi0hZLCg6AiW7aiTZ4L6HktyaIbkRxi82PQt3NtwBTGJPDOspBuQ8NJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DxVI1D5LQtYBhjIHZYILJII2FvUKrM1nL4De2Aip9k=;
 b=vCu9/4exWXBDYiXP29FerEfOp+bJ9YU/Z/E+RBdI6sQbuZnLzf7qyY4EF7mTrUuXRLubMfLvlNNPkZkBNDPTL8DQaNteKy1sE7mqYZexq1u8ZP5T7AxCTmIgLbGgX+McLKc9x1ILLIW9IrCkvJBfsnfSTJB+RtkMU5ljwbeiImjyZxA96RbXHO7oc1Dv95URlONoTvQNJtJSgPF7j5S7eSkXJ8FXE1OmOOZW0LMEklyx9VjUapjsj+iUKb+M2nC32kJTsjH8QSY8JONR62nTVrhBElt2/DKeJwttAy3Lvpk7KhHtxBTYm/zDOQZVgiL89z3mNlyTReg3GBD2MnDRMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DxVI1D5LQtYBhjIHZYILJII2FvUKrM1nL4De2Aip9k=;
 b=eFZOijPj8zRE8LCaSzTEZinPxBKJYVRPCfceNhsja6XYwzHYX8bWFu0bLhXFRBHuj5hKfn7LagPNRm0hhRzdBD+Wqk6HYqqjJY60WO2Bwka0Jr1vm+uubjhn4fXAHZVJ53HP/1giwDQhQeuQ2EkG1de3vJZVDguJ7CoOSEHBGKLmyX6fH9UrpdOYdGWK3/kXsT5U2ELCpBFTC2M4ifKeJBbw9wPAUVwTzQE9jzPXXwpWXXrafqtqFUiDbolDw7aXum/b+Mc7acuGnmd18PYUjEnbjqwR6448485RCFXvC/i6k7uKLM0kFBMIDxYic5QmJAa/WCVkmbjqaZvTMKkxeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:41:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:41:26 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:45 +0800
Subject: [PATCH v3 10/14] drm/imx: dc-lb: Support getting secondary input
 selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-10-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
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
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 15fb3f05-8c94-4b5f-1fac-08ddff01af91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm1RNVdNMS9ReHhITGxrUFNZWW1PKytvOTcyNGJYSUhPWjhhTDA3bjlVTnBX?=
 =?utf-8?B?OEFSZFhtWFFld0poYmd0dVE2SS9JM1o0UVR4Y29VN0lSZDE3S2dUMmpkZHlV?=
 =?utf-8?B?Q3l2QmdWVmk2YXRHcTRaMkpVZW5uUVJxYnRXQjUxQUNXZUpiRGJDZW85bU13?=
 =?utf-8?B?Snl6ckVuWG1CWFZFVWZJOHJaMEFmUUVFNWVLdzExYTd1djZHSkllQkJBeFRN?=
 =?utf-8?B?RStNV0NaVHRTYmJKeDZ5RnpFQTh6bThXcFBxajJjRmFvRjY2V1B0L0l1dXF5?=
 =?utf-8?B?dzlnemFVWm94TkJMeGsvZmYvY2lQTTlYNzE3clVGWHcrcnQvRGU4NDJPRncz?=
 =?utf-8?B?bGh6WjRiRHlOR1lIdVhvYkNrL3U4eUppTlNkUDNDRCtIcHg3cnlqQVBIenV5?=
 =?utf-8?B?K0ZxWTFLeS9MTTFNKzdHV2JhdlNQNEZPSFM3SEpPcE1yUFlyYkF0SEhFUDRl?=
 =?utf-8?B?Q0hQMXRNcG9oMC8wNVRNWU1HdXZTclB0eEMxc0pUQTVuY1BwM1hjWENSU1NV?=
 =?utf-8?B?UldPL1lLYzhqM3c1akZXV1RtUXN0aFlKS1UyN2paR3JEcWhWSFBYNW42UzI0?=
 =?utf-8?B?d0dDajFrL1J6RVJRMlR3RFNWY3JaYUEwNGhXMnFIWXlLUlFRY0lpR3NlejJ2?=
 =?utf-8?B?WmV6ZXBHWXFmNXZyY2hIL2NJbkdLdlpQazErY3FxbjFIamZsMXhCYzBvUHdS?=
 =?utf-8?B?RWliYWFTVDhpRHA2U0tJcnNHbDBNdE5TRHcvaHZ6V0Q3M0xLZDRWNVhDbzlO?=
 =?utf-8?B?aWZlaWtGeDlwZVUvRzZ6MTgwMTRxNWhZYTI3aTFzUEFhZndkUWUxeVlLQjVE?=
 =?utf-8?B?bE9SdDFrdE5DblQ0MEgyVEpJRHRUZk9QQ2xKVzhmbE81RDdCY2tBZ3kvQkJp?=
 =?utf-8?B?RWFPbzJZTTNuMlAyMVRUWURHaVhQRStVSkErUkl3WVViZXhJRzJuL0NQbnRG?=
 =?utf-8?B?eHhCSUpaMjZzZ25iUWdWVEpNWHczMjFZTDVPcWc0UVFxSnJWYUQwcmNoaE5t?=
 =?utf-8?B?VEk3Wkg2RTFvOXJpcDA4cTcwc0F3V1ZLZmZkbU1uYUZDS2Z4LytuUHBLbTk2?=
 =?utf-8?B?ZTYxd0loWG9wSHEvVWNWR1J1TDR0eW1MOUxWQlhxSGJ5akppQVA2ekdCc0c0?=
 =?utf-8?B?NTl0d01aY1NnVHNjdmFGQUVkWm9QTmpVeWhmYlZxOEl4R2FKQWRvalRaQ0NN?=
 =?utf-8?B?ZGlMN2JBa1VCa1paQlRCbS8xTU4rZmw1Mm16ZTVqT0R6ZGlqcEZOUnYwazla?=
 =?utf-8?B?YVZscUx3QjAwaFo5N0JVVVJTR3hUcE5scVMzL0VjeG9YWWIySERlM0p2Yk1F?=
 =?utf-8?B?bERrNDkzRkVlQUNUMk9SeTh6aUFzN1p5c1VFc0Q0dlNZcVU5U3dBckNudy9K?=
 =?utf-8?B?V3ZlMElWQ0pJeC9Nb1VWSU53WGRTc0dVdWt3V2IrVEIzOXloNkVRNVl0dVQ0?=
 =?utf-8?B?aGdraFpITklWNzg3RnUyN2l6dFA1N3hqUUJraitRWDRRWTlNdmg5QWJPSkVv?=
 =?utf-8?B?YkFsZFdQZVlibCtUZ2YrRXBYVzhsd3A2eDE2a0FKMWt6aGN3SDMzOWJGMEEw?=
 =?utf-8?B?Y3ZFYS9xWnVFb2lXT1lyd3U0U1BGcXZwVHZDY0FoUDNaRGlEVjlrc0h2Z3Vz?=
 =?utf-8?B?c0xGdHlmNzVOVkE4OXdBZUcwSDJpODlxL092d3d6UFBCMmV4RUlNenBVSzBP?=
 =?utf-8?B?SC90OXpvL0FXSEhjamUxTHJ6MldIeDNNS00vOGx0Mm1meFBrUDNORmVJRnpj?=
 =?utf-8?B?VzZ5bzVmbEQ5Y0ducytxY0VMNnVvc2ViZDU0WlhmcVRidWNhbXFQV3RBdTk4?=
 =?utf-8?B?anFtUlJPdlVkMTVBSGVWWTZTSEJLNzA1OERkcThFZFdaN2E1Y3ZheUExbEx4?=
 =?utf-8?B?bko3bzdZekpvN3NVWVZoRWRYaTdlN3BKaHBaTGVNc1c0NXlXdE1RVjdidVhZ?=
 =?utf-8?B?cHV5WlZSOEZnWFFhZFhLckFtanZRcVlYVVVYNThBaWNuc2NiS002ZVZZMCtP?=
 =?utf-8?B?cnQyNzBkZUdNeVBjMGdWclZHc3p0RGJ6QWMxOGFqSlZub2FSZ0pxd3ovYlpX?=
 =?utf-8?B?OEcrR2tpUXM3OExRODhycnBYaE4xcXIrbW5Zdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkduWWU3dlY5dU40akM2Rlp5ZzcyOHByK2NNMTFOOVZiM0ZGcEx4Tmp2TEJr?=
 =?utf-8?B?dEhRSXdmZXNkUkFLbDNmVVJMZlZhOVVhRm43cXFJUW51TGpnaVpFNmV2K3N1?=
 =?utf-8?B?Z0UxOTZiWldreWJlaDh3V1I2SXgwZk9pY204S2c4TFpqK1Y5V3RlalAvbUdI?=
 =?utf-8?B?c3NuYi9rZE5aNDBEK1lvdFhFb25lZVJTOEtKTmJ3dDVQWFlwNC9iMGl5Z0kr?=
 =?utf-8?B?bGY3bFhLVEJIWStLbisvVE5LOS95SlZJZ05HWktLbE5XYkdreGdpUmNacExu?=
 =?utf-8?B?aU9lT1FUN1VZd0xTRUtxTGRsY3o2enlmY0MrYU1ZTHdScENlTGYrLzI4K2wv?=
 =?utf-8?B?eDhVbVZZbjZQL1E4UEdTNm5OQ1FwNFVRTXl3VGpzNTBrOEwvT2ZvQmtFUTdq?=
 =?utf-8?B?d21NZitUUHdwc3dSUEEzT0UrTXhVeWxGWjlwNjU0NEVXK1A1L2t5anJWTHhO?=
 =?utf-8?B?aVpxcGU3bUJCZTF4dlBmRlV1MlFxY090akl4YS9KVmRkQzFVUmRSV2psU2w3?=
 =?utf-8?B?SW4wNUlWeG91ZWxhdUdMbFV1TmZTOVhHeEJHTDA2WFR3VXlHdEdsa1ZUZW1X?=
 =?utf-8?B?VERMZUZQTHRHTzdhRXRrc0xQK0QvcmtWc1VYTnpNN2pyTlBBVjl4RUR5dGRq?=
 =?utf-8?B?Nm8va3QvekQvVjkySUNnTk5lNnIzbS83WEozWCtDc3krQmpycks4RlY3aTA5?=
 =?utf-8?B?T3JHRnZ1WUVQTjhLMUg2Y1BlMVo4VlFySVpZb2NGc2FsUTh5WlpxTzB5SWdX?=
 =?utf-8?B?aVA3NWhlc0w1czVUYTE2Y3FDaTNOME5HSzdZZC9ncnRGYmk0a0pJOVVJeDNO?=
 =?utf-8?B?OUo5MzNXSnN4QnhqK3ZTNkZHMk9WNzJZR2ZCL0YvSVAybm1EaW9iRWpRSnl4?=
 =?utf-8?B?cVpXa2VtN1BVSHBLMFgxNEdQZlVHN2JEajdMNkRPK2w3Y1VUaW5FT0lxZFNF?=
 =?utf-8?B?bFl4SURLeGJUNVl3akdiQ1lMTktUYTk4WCtmZHhFN1dqb3ExaWNzS3M1TTZt?=
 =?utf-8?B?U3k3U3BYM1JodStpYkNqRG1yTGRaSjk4dGw3Tk00VHVEeWhEd2FpbUduR2xr?=
 =?utf-8?B?U2FzVCtVNldTSm5hcVBqa2tVZmVXVFV3eHZ0MXp0NHVUZHZVUTNrUXFkd01m?=
 =?utf-8?B?eFNBbm04bk1wZyttU1ljeUhwS21Ha1YzYkI0ZGZ0Uzg4WjcvYU9nWXBwNWRp?=
 =?utf-8?B?ZGc4MWxBRHNZYVM4UEtwRUlCbE96bEh0d3BmMVR0bXhpMHZoaDhKRmd6NHQx?=
 =?utf-8?B?NlNPL09OU1dnWEtjVjhOeDZyb2l3K25uOVFIaXBlall3a2hVVGtBRTN0VW4y?=
 =?utf-8?B?VlVlWkVQaGtNaTFJdDhMNEdUUDEwRHQ0dUkvVzgycllaNUI5ZXFIK1VTQnov?=
 =?utf-8?B?bFNOVGxGcWpmL2VKQkJoeTh5MllyWHhuSmZQa0RjNHJOdGFWb2dJdmh0NCtx?=
 =?utf-8?B?aXgySXBGWGlQOXl2WUxjSld3RVUwNmQ5NlVyOUFxZUtJK2dEWVNUWHFmUm56?=
 =?utf-8?B?a253S2x0RzJIVS9DTHVVOHhhVjE0R0VXL2FacjBYN3o5ZzUvNjMvTmZGYVBR?=
 =?utf-8?B?Rm8vWStIRURSbWVOUDV6RWZ6bHc1NVpOS2greno5NzY4UHlrKy9sSWdPUmRM?=
 =?utf-8?B?TUN0SFRBbERFWHBJd0RMaGNDdnBzdEJYVjhYT2xwVEFNNnA5OFBMV3RFUnpu?=
 =?utf-8?B?eFN4dFlhRElPOHJaZEErdzk0VytBR3ZvbzdpSzlsTDRsQmFWaDZVL3FDWklw?=
 =?utf-8?B?RFA3OC9LZDdSb1ZNejNrSVcxMmxEQ3JuYVM1SExMa3lxNnB0RzhYREwrR0x5?=
 =?utf-8?B?ejgzQnU5bzN5ZXZxL3JhUGRQdklmV2RBTEs5WnhZb0oxM1A3UTl1dk1mMXpQ?=
 =?utf-8?B?WHRIZ0wyYjRsbzBpc1p1MEhudEJnUHZzNkN4M1M0dEhrMDZQVEhiREM0QStP?=
 =?utf-8?B?Y0YxbzV2UldZNGhWNGtLSXNoT0dVM2JBNEdwM0ZmamNTd1QrZll1TU9JLzVa?=
 =?utf-8?B?NGZmSllBOFBUd0xDc3RZcXhCc2VLVTBLQTMzT1krMWtqWGVscUZzZkV1cU5D?=
 =?utf-8?B?djRZRHYrZTIzMm1QUWRRNEh0V3QwZ3lHa1N0OTdkRmlCTUpacHM4MUNwTWE2?=
 =?utf-8?Q?DnueUKWwZv8Oa/4ElNGhShJds?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fb3f05-8c94-4b5f-1fac-08ddff01af91
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:41:26.3312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ6JcAv4PBLh1eEJSMTa2ZZnqaSSPBntv/h31Pyi+DV22vUpJihhZHCVsf85+vL6SkPE8shEq4suWGgw/RXmhg==
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

