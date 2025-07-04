Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801CAF8D41
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEA410E9AF;
	Fri,  4 Jul 2025 09:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="feyuxpce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB6D10E9A9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQUZRhIUhUWvvZfECt9zQywNzh1l3rFF1G/ErbCBVX9AcNRuRC+TXNo53Kl6OGYyFq6m3L0jLAz7nD6MJ36k4FL/k1HzM+0w5Z05VKbrIhPZU1rFcVfTF5M5JBtlxYCU6XkKZ5CM+9b86KNqwF+b0iuVQO4Yn7Hdz59GbOImx8BHL/cLln0oYyyYmJ0IC3Nkkf9CdtDxW/XRwDGjdwRt7nTQehr4uigrSolKzRn5S6j4sCX5iicE3AjTyGwbnohIlbHOHn3W/4dSI92ry6604bv8QcnMzTOCj865aTTYdL16qjlojMe/Lf/zinRAfJf4YYuG+30PeGQT29s8oH2k2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qikb9xYU/lKAnU+JC6+OhPlgOv7cRPRrnlB9qhEjMM=;
 b=Sc0ujIvPpaYD2c9sVQpG4qxTHG9iadTWJpIg7ur0Hv1/v91K2OrQdB/1EcfoWTo5aveavO0fgBo21UXjfxjFvIkVH9dVxLJvpVe1azeH1TyeBFErO9bx3wwgUr335M5b89gJcIf2galQOfl9wpwnAQNuK3hccf3Png7XUXqwXPHC2BJJuR2r6SFYDeft6osXw9ENYcpxbgPYbaRd2nxuSBEZxOLtIuucwn6NgaLGWx5sZUvko0L+AQTVaoa11m6Jv5bq0c4kLlx9WFv7qCYpwI3Dk3/0JnZtJpeSUkiFPp7kBSgUDZzjHdz7RXzAKIfesrI8AV9igQ7uaIDkfLesuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qikb9xYU/lKAnU+JC6+OhPlgOv7cRPRrnlB9qhEjMM=;
 b=feyuxpceNEPfTKsLazU+KMJDyNRc7rrivLnzlYtF12OexTQwmybYkObYEFBYAzXThiHSiO/puOZEmNREjy9Q87MEMbn1nBUciuv2bBFnILVOVY1VD4w42ClL2kVqXcRJeEIJdLxlGsRleTO5wVn60/AsSQ7YNALVLIFFFLl0cMyARGxxrQG/sFIrKSlL433L5d/yuT9nC57G3JDMnqcI6QclahY12T5AFFWGWJBFwDufJXo0jMwAig8vYcXiBrRHhjaJor9O69kE642AhcPJ4qgESg5F3GbU+R3uCCObsZ63XLNiWk+vQxmRajwz3WgVHoLqzjz24UealtE1/pxQlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:02:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:02:52 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 00/14] drm/imx: dc: Use prefetch engine
Date: Fri, 04 Jul 2025 17:03:47 +0800
Message-Id: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOYZ2gC/x2MSQqAMAwAvyI5G4gtrl8RD5JGzcGFVqQg/t3qc
 RhmbgjiVQJ02Q1eLg26bwmKPANexm0WVJcYDJmSarKoa2zQMR5eJjl5QTKNWKrKtuAKUvYJjf+
 yH57nBbmzDB9iAAAA
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a1c1ce-08b9-4e7c-8585-08ddbad98eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0YreUszLzJKTG4vMmduOFZUTER3M280Vkt4ME5zVnpCR0FpNE1qY1VNSkpO?=
 =?utf-8?B?ZDNLeFk0R3lwQmJFbjFIWm1kOGJtcDJUajArRWdKNzhIaTVMcDBrK2c3NjNP?=
 =?utf-8?B?N2hLNi9sTVV5WVZXVms4WnJJQUVSY0JIUWM5L3FZRTYxMmd2Z3NQM0s0emZS?=
 =?utf-8?B?bEowZ3NqZElCTUk3QzZtdG9EaE14ZG1lRDdkYXZSdGVSYUNuUURKdm1GSGlH?=
 =?utf-8?B?Qkh1SXp0Qy8vdE93YWxiSmpPblFYMjJxMVVvMnpKWkdoTGRTdkMwN29FUHN3?=
 =?utf-8?B?V2wwc3pZMUFMRmExWlFIN0hmYURDR3RYdVlIRUFKZWVVUnN2UmpFcEhCN0tE?=
 =?utf-8?B?dzhIdXJsdyswbkVhS09WR1JiZjMxWjA0OTE0SDRoVW90UDNhaGVDYXRYbDcz?=
 =?utf-8?B?WnJyS25VbUpGT1VHWkxRcFRiVXBsTW40ZVlMbitSNExZdS96SzN3dXR3SG95?=
 =?utf-8?B?MTRGS1d4ZkI0aUlUNlIrRjJCcUxqNGxuZHAyZy8zblkwN0dZNUdFZ0lrUUFy?=
 =?utf-8?B?Vm9BMTBDKzhZYThDQ2tMbktJRjJ1dGNtRWhzdXFxU2dkRkMyZHNuQy9CWDQ4?=
 =?utf-8?B?ZWNObXBMU1Nvc0RndExGNWVqMUdtT0FhL0NoVkN5K1ZmbzhVK2ZpOXlHT3Ro?=
 =?utf-8?B?TEF4YXV1L1ZwVFBIZnRQYjNBcWdsSHJONG16WTBNRmFYbk1vNjQwU1J0TW1i?=
 =?utf-8?B?VUZZWm1HR3BDYUJPL2MyLzJIaHJxMFFDUkxwN0pzNkZOQjlCRk1vbitITE5h?=
 =?utf-8?B?REpGMDI1UDQ3SW1HRGJFOHhzYjY4a2krZ1l5RWNuazVEWENoeVFNTS95RTV0?=
 =?utf-8?B?WmMzYkxqdU16VnpacGlxWGs5bzBkNWJHRVRVMFlvTTRpQXhvR0ZpYU1VQXUy?=
 =?utf-8?B?OW5VZWNPUmhhelAwb2xvelI3ZVI5azBaVWRrQkZ1L0RMdlNkSGxtZS9NMFFQ?=
 =?utf-8?B?dTJFU3ZKV3RVdEFFQlFYd0d5Wm1KSmtzSjc5UWNxaTNUb0FOQTRvN3FSZndw?=
 =?utf-8?B?Z0kwSDZrNi81RnluOGU3VkltaVUyVTlDOTNpcnZ5UW5CRlA5VmVmUnU0eVNI?=
 =?utf-8?B?bDZyMnQrTVJBeU52YllJd2Fpa1J3OGFxekt3LzFXNWxuSzZscnNZRjQ5N3kw?=
 =?utf-8?B?OE9aUlNBS3BnZ09EaG1QYlVUNGlsZ3paNWRNSnZPekpzdlV1diszTG1MVlFV?=
 =?utf-8?B?WUV3ckZwd2tvQ0lSK1FQUFBKdHhvWHEwVWRQZW9wbUtORWx4M3h3SmpxTXNS?=
 =?utf-8?B?MkczMTNMYXVwUkhYWHJSWWljNTBCa0dRLys0RDY2cHpqMlhZZVVEU1UvVElY?=
 =?utf-8?B?U1BSaEd2QWpBQm16bUtnK2FmdUxLWmkzQnFuaXZ0WjlqckZYTGZvbFE2ZERt?=
 =?utf-8?B?K2xGZHVYeXdRd3ZUQUFabVNLTEk1MSs5NlZBQlBEcm1ZK0taVEM5b2F5dnA2?=
 =?utf-8?B?Y3VDMVoxUmRBKzR5K1UwME1yUzdCWjRxQzl2REhXNjAxQzdPREVwSEN0TE01?=
 =?utf-8?B?ZS9VMHFIcDZvSEV4cWdLNy9PYkMrR0NqYU16TnJIZkYybXZKdFRaQWhVc2ln?=
 =?utf-8?B?Q1BLR2J5S3EwSDUwTEJYclAxTUZjKy9xODIxZDRwUGpvQ1RhdEdCMUM3TU9N?=
 =?utf-8?B?djVzVXc1T3VCV0VYQWpDczJ0UEF4VmxLRjRFYnYrb2FwSXRORmkrY2h1YzN3?=
 =?utf-8?B?NkFzUTFPaDBjeWNWaENKcjVrUk0yamM2SjVtU0xvZXJSbXdXekltZkFzMnZl?=
 =?utf-8?B?NXVCd1VOWkxzSEthSldhQ0pTWmtTRWxRMDBrMWpCRElQa3J3USsrVEdPaWg3?=
 =?utf-8?B?U05DMFQ0Wjh5Q1R4Y1dWSm5seDZTQ1hJVG4veVJFbGdOL09hOXZhZ1pud2tn?=
 =?utf-8?B?T1FVWnYvWEo0QUM4dldXY0gyak9hTlgzNDA5Vmd5TUw4S1UxeGFjT094QW5D?=
 =?utf-8?B?VjVtKzVHYzA4Rk5DV2liaDl5WWlnYno5S3JQQi9xbUNQL21TcUo3dkxPeGJu?=
 =?utf-8?B?dXdzQ1dGMlNSWVl0OUVwaTlkd3NPc0FkYVJnYlArZVRRRE9sZXRkMWp4SWJO?=
 =?utf-8?Q?X6R8zQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWh2VXNjZUlRMm9aN2xYMjlreHcyRXM1THA5bHBYWWNpc0p0elp6YUhIcjcw?=
 =?utf-8?B?MVJVMFpldzdMNVI5cXJsK1M5WkY5dXM2MFFTRElsRkJLVVhNM1hZWGxzbmlH?=
 =?utf-8?B?RjNZWklkc1VRakt5OTRlRWloSWc2dWpPT3pNcVYrRXJLM3g1a0g1d2JDSUgz?=
 =?utf-8?B?ZFJCc0RnQml2dkhsYjdlelZjb0lCYTlEQ2FTWi9sSDE2b01oOXJCS3ZQY3Jz?=
 =?utf-8?B?a0VYSjE5MjBWay9teXVQaWczUXRCb05wK09WY3lQR3B5OFJKd3NEUzQvVXB6?=
 =?utf-8?B?Z253b3JFREZneXR6bmZ4SE1rdmx3VU5YcXBlYmNuSlFuQXh5bVZuN2RIaWtv?=
 =?utf-8?B?Q2lLWjNGNjBDUGlCS2RGai85SS9QOVJDaDM1eEdmTmNYeXlkb1BTaWt0c2xp?=
 =?utf-8?B?WWpQSTA3a3NGbUJLNXlENXM1bWszeDRWYnI1YUxjL3BORXdpZjFKNU45bXlK?=
 =?utf-8?B?RTgrd1ZHRHlheEFMa1RzeEZiZ1ZuKzBXWEF4eDYzV0d5VENvTzUzOXVaSEN0?=
 =?utf-8?B?MTlSWkdPc0x2THRJL2ZtcGl1V2pBSTlFa0RKNU9xcitkTGxMTXcwYWRjcWRQ?=
 =?utf-8?B?Zngwd3lnaWVZUkxoa2NseHpQY1I2NCtKOGt2bWlsNWFjZFZsclBIWGZoOGRl?=
 =?utf-8?B?amFWNzJlMUtkdkw2QlNuNWNQWGhGb3djM0doRWpmUnp1REwxRHJKQWk3cmVW?=
 =?utf-8?B?UWp2cENTdlFFRDRYbkRPQ21aOFBleHNSSXZpOU9OZm5NSkFOUkRJdEk2M3p4?=
 =?utf-8?B?ZmY0V1E0SlhuWlMvRkhtQk56OUtUVDFtZVNFcm95b1hqQVZBOUk5ZkMwREo2?=
 =?utf-8?B?U2pxcld5eE5pN1Jma0tLaTJhc01NbFpLUnJEbFNVMU5zQTk1UlhNWEJJdHFZ?=
 =?utf-8?B?UkxCbnJaS0c1YU41My9CKzZrM0R3RWh5NmNXUk1SSFVTRjhDbUhXaHdUVDIw?=
 =?utf-8?B?T1FyNlFLSWpRSzZ3TnlDWCs0ak1LOGsycVlDNTd2QTBKTGdhdFdTMnpVd1pD?=
 =?utf-8?B?U1ExRUM1Rm9ncVg0bU5nZFZZVllBNGREREVKZldUc3lSYnh4Qk1KYnBRMWMw?=
 =?utf-8?B?RUwyTnovWW1KUnp3RTZxOW1qVUpyZ1h5ellwamE1V2hpMTlreGdKb0ZqWlNs?=
 =?utf-8?B?eTVycllyWlNhajFxV1VIaU9oaC9QblB1YmthM0lhK1d5dGh6c2RNaWs4RCt5?=
 =?utf-8?B?dzNJVFFVMEZ2L0E3STROMHFVSmRSYzhNTVlrVDExZ0JTMzZzNDA0cXUvSnRq?=
 =?utf-8?B?ZWtRcWVxSVV0K1MzWXN6RHBzeHBPMVJSd01nQkRtUW1wWThobmRQOWRpVU9l?=
 =?utf-8?B?RE5FTXZvOXBXMG5uZEN4RS9IbEpXM3QvMWt4UFcxR2t3aHpLZVRsdWlhQjVv?=
 =?utf-8?B?emFqdXpjSzdoY2R1emZXemM4QjJrTDdMNWx0ZkZVVUFtQnRDYmZSMk5PSXJH?=
 =?utf-8?B?MDJ4c3k0cTVGOHVrdUdlckpRTW54bzZiY1BqdkNvUnc3eTJZL01WWjExdkhN?=
 =?utf-8?B?R041RzNIUVhobjBteEowaWpSWTJESExYaWdVL09iMFJYb0hxYnNOeWVoWCtK?=
 =?utf-8?B?Sm42R2c3amhPRitFZkQrdGdPam1BTDA3Um5hdmVtRDB1YVlXa21WRHIwQnN0?=
 =?utf-8?B?S1Q0ZTNZd1djMTJWekNWUTdabnVqYXN6aFdCQTZLdE9pTndXMjNJSzFuUkZw?=
 =?utf-8?B?VlVGbGp6aDdvRTB5ZGRzV3JhUWR5Q2pSanJNdVZMMmZBbk0wM05BQk1DYkE3?=
 =?utf-8?B?Z3NPTzJsSGRkZzl5OUJEVzA3V2N2aG9IdWk1MlZvYXAzR3FuOVdMRGtsNUNY?=
 =?utf-8?B?MWw1UUJEYTNxeFlNL2ExM0x6R011VlBqVGFyZTRhcHIvS1hKMUlnTHJKbStk?=
 =?utf-8?B?QjVJSGU5TGlDTk0yeWtva00vTS96V1lLdjl5cGwwbGtla0l6aENNbUIzSCt2?=
 =?utf-8?B?QlRESU5nUVhsSXV4RXk1akV4MWRBTmxWOE83Qm94VERtR3RXOTUrbjJlY0dP?=
 =?utf-8?B?MCttbm1TSk5ZMWttRUtvMzR4NENnU3JuSm9WTVM2YktPNXpWQndyQ1YrZWlB?=
 =?utf-8?B?dWtQUHlkeGV3dnl0K3ovNXlaZmMyTWkzNkZtZ2tWelkyczlSZkQzRW1PV0k1?=
 =?utf-8?Q?0jiFw9iz1sx0W9VSkV0oJO9Gt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a1c1ce-08b9-4e7c-8585-08ddbad98eef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:02:52.7789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjPJe2pQAGqlUYz9L65/iBWA8GeyAFIOXYA61fXf/qmffT0ebFcvJV7Hk833K6ngV7limTb4sy6W9CDcHatxHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289
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
 drivers/gpu/drm/imx/dc/dc-crtc.c                   | 191 +++++++-
 drivers/gpu/drm/imx/dc/dc-de.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-dprc.c                   | 499 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h                   |  35 ++
 drivers/gpu/drm/imx/dc/dc-drv.c                    |   7 +
 drivers/gpu/drm/imx/dc/dc-drv.h                    |   5 +
 drivers/gpu/drm/imx/dc/dc-ed.c                     |  27 +-
 drivers/gpu/drm/imx/dc/dc-fl.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-fu.c                     |  49 +-
 drivers/gpu/drm/imx/dc/dc-fu.h                     |  11 +-
 drivers/gpu/drm/imx/dc/dc-fw.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-kms.h                    |   7 +
 drivers/gpu/drm/imx/dc/dc-lb.c                     |  23 +-
 drivers/gpu/drm/imx/dc/dc-pe.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-plane.c                  |  46 +-
 drivers/gpu/drm/imx/dc/dc-prg.c                    | 335 ++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h                    |  39 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                     | 114 ++++-
 23 files changed, 1545 insertions(+), 30 deletions(-)
---
base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
change-id: 20250703-imx8-dc-prefetch-028e306591c6

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

