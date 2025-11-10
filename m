Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B691C455E0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 09:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2AF10E2B1;
	Mon, 10 Nov 2025 08:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="pv8d9WDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023132.outbound.protection.outlook.com
 [52.101.83.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784D810E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRDCUr7w1iPjQJWJN2FML4MUm632NKQQ+pz3c411rYHeXqscBTwcwZ8DCT+4IAY7ikOn8u6MRSUUL4f9+/ZWwzieNeo3I5AMPe6zaY8dL1XqUX3qcIRmgrssHniTEg4SwQnosFcR0yQcX9D/E8GH79u6FzlD48uC3bPLOVdxmlHzhjXQ02SY56lajpRjz24YrsjvuJjhFhK0u5os3s1xIgo51KG5LC0RjlTC/axcPEioldwhh6AZOlf1isuB1bM5qJ7n3XUt74/nJkNp1WLPQHcmM9HsKut0FLxwOmOMqMtuDiKojfp6vWZM7jZgqA5n80z/0suIJw10qPyxRKZEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgdjsAetF3A2UDbpwu2v5u8h2cmeGWymq/nnEdV0T6k=;
 b=vhnyw7pZ8DCUlImkoev7E7o/uMrmQv7lJq/MEjHMTmKVs6XdHZSEPefq7vEt9lo9/gj2SVgA952qSYsglwghVS194otMj8iE+Fgiit/ZqfSLlzmJizQJSTKKg5Q/Vnf6Iw4i/yWb+R+DOJvkOom7pZc/r1NDMvKmtIAL2YZUTF1FE+GZlSBnOn0WgQtB611pclaPg4fedmvCA4Nlh/0/gNvtso3W+lQi4pE8Pi24ZWsAZ/0AucyY3eMsfK9kLwebY8xvH2SGRJ0zByDAJ/AJj14VFkpkUT3QiI4tAyLZLsOGnlcZ/RahBKHofIDQ67q6YDALexelLg3t1wyyfyQowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgdjsAetF3A2UDbpwu2v5u8h2cmeGWymq/nnEdV0T6k=;
 b=pv8d9WDmRGDIDQfOlTQTBx1GpEyRwHWKog1Uod6JBwufqWye/FzsE7PpyBJzOqAYsJONrE9Emp26C+6cHT0bZCiB8cfhR6shElkqxFkifB59Ifi30eYttOnbGEPNiYeLfrOY3lJa+0MT48BxATvIcQVx1m7Bo6eJkx1LlHSM14AVIj+X3ZIpT0PUG8q2mqPtn/Bnf/9oV6p9ABlCjKOtfOxd1umojZZw9Lh1DjkRMizi9pPZ5U5ePRBxzH18Red7R2tpa+TtuA4ZHC2sKWVc2DItOutDwgSxU5yDoLDWFIHnIpPAF+Pv8pHHaeIWzTdrsPffzKi83FMQ1ogpI2aW5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:26:20 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 08:26:20 +0000
Message-ID: <5bb6c1aa-4462-4459-9198-5a85a7b439b0@gocontroll.com>
Date: Mon, 10 Nov 2025 09:25:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlighty
To: Frank Li <Frank.li@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0047.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::24) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a41aaf-daaa-428a-c9a0-08de2032d33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTdsRWRLaFNveUdvQmd4NmFqVXEzTlBJQ2NKdnJEQUh6MU1BT0lYYzdHaUpy?=
 =?utf-8?B?bTQ1bkVpSUZRYjVEMVlYSEpIUCtDT1pFRktXTVpKU3lJd2QrM0EvYXVQWUlw?=
 =?utf-8?B?eUtERlBlZCt1R3NOcFRSTytxcWYyOC84YzBQRnB6ZmJVWFkxbmwxWmtGcCsr?=
 =?utf-8?B?SXU2KzEwMGdCcDA2ZFNhVkI4bUgzU0prUnJuelN1Y09SRUpIVXdLR3NaYVFH?=
 =?utf-8?B?SHVtUE9namdBWEdZb01nZEdIQlZ2UGJEWjc1Sm9kb0RLb2pZN3lTZGpFZjh5?=
 =?utf-8?B?cG5xS2c4Tk5jbzF0N0JxWGdPdnBlcDJDYjNyczNQMUtBV0tOTnZyZjJkR25k?=
 =?utf-8?B?SElWOGhtanF3SnpqeXY4L2JKZnZ1MGE5MkFHRjZncnpKQWNiQVJUeHI4b1lw?=
 =?utf-8?B?OUNWVGpsaGVlblZka0lsV2FSck5hemN1ZUVzWGp3akM4c002WG1rbWtHck9H?=
 =?utf-8?B?NGxDYTRDV0FQYVIxUENzNFhvaXRhZUFaNGhrbFIxUDdyS295MzNKRnl2cFo3?=
 =?utf-8?B?NmNBeklnQlF3RE51YnE0T0lFYjlRUGQraEhCR3hCWGpxMDYrbkZjZGcxVUV6?=
 =?utf-8?B?QzI3bktVandZTE8rWllQejVkbTBUVWJQWFNLQmdMTmd1MDJSVDNja045Ym0w?=
 =?utf-8?B?bFB5Mk1KVDNjUmRqQ2NpUXRuaHBqODF1UXR2aDY5TDZIZEw4NEZCMEtuTWNV?=
 =?utf-8?B?WEgrWUtaUzNqdzR2bXptZW1OVkl1VkQzM25ZN0o3b2Y1aTgvenl5UVdZdG0x?=
 =?utf-8?B?YktaSUhkazJUYURoMEhVc05QRU1CeUtZMzgrTHBSNjgrR0hWVG5VdU5ia2Yr?=
 =?utf-8?B?ZldQc1lpSFAwaFNZNWJqSXhkNVFWaDE5V3h0ckVFQU1KWVd1NlJUZjBiTVFS?=
 =?utf-8?B?TS8xdlRIaThiakkyaXh4dkwxT2hCQU1XUG1PTEs4S3NsTHB4YUtjVmVEakdQ?=
 =?utf-8?B?dENjK3diTUgrTGl1dGFMcVR4Zm5IaTluWTVVZGpFaDk4Y1RocnB1L2xzeC9j?=
 =?utf-8?B?UGRiZEV6RkhYd3NMRzkza0lKMTRhUVRVNTdQUUlsUFhWb25nSm8wRnZPZldw?=
 =?utf-8?B?ak1kS1dQWk5xOUtOdmFXWlRBQ0dYanFZaUtodjdLTjIyZmc3SWw2cFFPSXdR?=
 =?utf-8?B?WU1qZVEzUXhVVEUvWUZadDZOcjJFNm41WGJuL2VZSUgwSFhqbTNGRHp4OXp0?=
 =?utf-8?B?dXRNeERicm00VTMwRHYwYlJVMzhKdERXcHlUekUyWlFpcFN3NkhPNFgvTXB1?=
 =?utf-8?B?ZUNqcGdzQWM5U1pDMlFMNFl4SVBzcmNPWEozaHRhSjA5Z0VhaUNRNVdBZy9D?=
 =?utf-8?B?WUNIY0ZtbC9RK2NKU0pnM29mYnZFdlJmUFJNWkZ1dzY5eFJuV3JiQjF4ek0z?=
 =?utf-8?B?eU5iVDdQQ2ZDa1A1bUlkU3pFeUhKRy9qR0s4ZUxIYXRMNTJ6TDA3OXZMWjRO?=
 =?utf-8?B?RnhKdG5NSXRWN0h6U0xEbmlZSjVlelhDU2UvUjNEdWgwUUJEQnpsK3JKb2RQ?=
 =?utf-8?B?VXZNb3JidWlDWTRGekFnN3REWnYza0ltQTJscERvbzNtUUFKb0MvYjNkZjE0?=
 =?utf-8?B?SzdsbThaN2twaXc5cFF6SmRTYzREUFFIV09KOGVFM3NwUGtiek9xakVISFhE?=
 =?utf-8?B?Zm5rQmJjb2JMaDBGbTVMOUNZc3lIZ0hYZC9na2ROTVhKbXh4YjVTYktHN0Zx?=
 =?utf-8?B?ZmNoTTJISmhXWjBCbnlwN2Q1eWQrQWowNW1LRUFvSnE5RlEwVFk1Z3YxUFNw?=
 =?utf-8?B?WFRvM29nVkh2bFBhdnVHdjRGSDkwWHY0V3dqR29NSElkMmZmenViVGtla1ZF?=
 =?utf-8?B?SWJJcC9EKzc1bEcwTWMxQ0YvTE1PN0F5aUQxUmdVenJEekJDcGxZa29QRnJ2?=
 =?utf-8?B?N1hTSFI2T2UwcWJHOWJzeG1kdVJpdjZQdnFINVU4U2tIcmNmOUd6MGUrVGZE?=
 =?utf-8?Q?MWDaT50PQ7l98C7ULNhmTcficdLgEMcA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVIRWxyK3dWRlpRMWFtYW1KQVhwQmxmcGpnSlpacWltcmNyNkdUaDdaYzBm?=
 =?utf-8?B?SVBFejJCNHNqbXJMTkNtaXJ1ZE0yR2pFRS9EcHltY3VsYXZzdWRUZDBJb3J3?=
 =?utf-8?B?VmVBenRnRTJVMDdSeWZWQTAvVXVwbytmZnh1MWlyY3RXcFhtUmQxZTRKdmJt?=
 =?utf-8?B?UGErcXFRL1JqN2NOWEFJMlpoWkRFbzBRQ0liTnBiM1BLVURoS2hFbDVaMGQ1?=
 =?utf-8?B?Z2p1VlhublBaV0J1SzJTbjh1ZXRteXhtSzBZNnRrdUxpNzFrcUVXcXlJeVhu?=
 =?utf-8?B?MEF5SXJoTFpxek1ZT0V6RDRRTW9qa1dVTFFPeVR4WUpIajc0ZWxRTVc2cTI0?=
 =?utf-8?B?RVM5K2pPMGZ5VHFGbGhZWFdwTWVaTnpIQnJRMVg0UjRqMmg4dFZNNEx3NjRl?=
 =?utf-8?B?T2dyU21NbENZNFZIN0dEZWlEdjZGdkR5MDlsU2h6bGJXTkVsTFdQSFBBeW9E?=
 =?utf-8?B?WFdMZE1OV3NsZUltWlNWTTBvWDNhV0MyUWpBU2oveEVHVFFYaXFEUnhrb05j?=
 =?utf-8?B?NW1FQ1l3b0E0VFh5L20rZDRMRGc0RWp3MDczL3BGaVpCdkRiSWhjZGlEVEtj?=
 =?utf-8?B?U3l0NjNMNkYrTlIraWh6T1RWaXBVWUFWWkV1Y24xb1AvWnoyWE5RTWlzYkFZ?=
 =?utf-8?B?cWFyWEhPWlFIbnlndlpId0RUaXFiZjZRQU54QWkvTWVlUkxDa2E4NXE1dEJJ?=
 =?utf-8?B?Z0ZFK0xUZ1d1YUZRZlk3QUhiOGFFTElaUytlWmYrbEd2TmdsMWZicHJZdEl6?=
 =?utf-8?B?Vk1CRDBLNXF1YlFVRUFpTFdQZFhOV0p0UXhnbUpxcGkwa1lMN3B3Q0MrWGpW?=
 =?utf-8?B?eFZqY0oyK0tFL2psUVpvYUwzU0RWODRGWnFqWjMwQ1NESENNNWtJOTRIVjNZ?=
 =?utf-8?B?blZVeWVxNHpSV3E0MExkTzdhcURSVkJBTkJ3T0JuTW9kYWZVcDhNekY4aEZv?=
 =?utf-8?B?UU5TdmJ6NG05S1ZvekhTckM1U3hVYUxqNTBhN0JQVjFpMUVtVDJ0UVU4REh5?=
 =?utf-8?B?cEZDTVZqNnJpODNhUzl5SFFlUUN4U2NTZjRsUUZzaUEzT3pTMHpxZjd4R0NO?=
 =?utf-8?B?RzBLVmUyRWJTeGRGNVpaS0lEZ3FaaUtSWTBkenJwQ0Y0ZmdwRWxNaFZNWjBI?=
 =?utf-8?B?dVBydTRyZms1YlMxRVpzSENsUkN5aFBUVmJzYkVHTTllWWViOHEwKzFROGdE?=
 =?utf-8?B?cTN2QmdzZVZON0R3REJYYjdxeENoUGJEMEZQVjM2VkU1dSt0QkIwVWpoVmZD?=
 =?utf-8?B?T0NBeXVORlJrNVYyNzlQWmp1aFd5NWE2RW5STnJmRWFoaXNrTmhvQ0hneHhi?=
 =?utf-8?B?bXlISjIyOWNzWElpUm43M3Y4cXRid3o4ZHBDbDgzeUV6bUZObFdKRHZnV3hm?=
 =?utf-8?B?a3YwZUtWWWVEdGU3eFRiL3cyOUlOcnVpR241ejJKZkwzZlFuMmlMQzdMR1Bk?=
 =?utf-8?B?N1M1UkNaUWpBZXhKelV2cWl2R2RtWTZ4RVJJRFRJRWg4cTNCdGNjTDVGdWdR?=
 =?utf-8?B?SllxZ0pwaUFmV1Jpa2hCaG00YTNIR0FLQndGU0d0MzRSQXpEd01PdFo0aW9Z?=
 =?utf-8?B?Y24vWThFWDNCYU9HN1dPSzVUSDBZSzdKU0lZRU9hZno4b1M5dEo5RDRSZVlH?=
 =?utf-8?B?WVVDUzU2d2ZyTkY0RHhpanZPMGh1eDllNnVWZGpiSWlKbkI5SmIzVlArS2Ju?=
 =?utf-8?B?SjVoRk9oRllaK29mdWUwR0owVng0VWlGRm8vb0pIZTZwYUcyQTd1Q0JubnZz?=
 =?utf-8?B?NDkxVEdieFRrRDBIWHNoVW9IRnJCd1BNb2h4QmJXZ2h2dFQ4VjJQNmk3MGlu?=
 =?utf-8?B?aThHY3NYY1BoN25xV2phRUV5SGZ2N0xXRU1YTDNpL1pLSjlSWmsveWxTMXBQ?=
 =?utf-8?B?UEVYL1gwQUlTV0dDNmhiQnZseVlraUJzTjEvYXR4SzZRUktPR0NBMm1nNlBU?=
 =?utf-8?B?U1NwOU10bXZmZG1KenV1QXFQalZWbWI1L1liVk1vdUhmQWVTMCtVZVJuSU82?=
 =?utf-8?B?eklSdm05OXBkSXdxKzlMcEhVM0dHS3lQdHJmeFpSN1ROeTc0ZitDSHlBK2pR?=
 =?utf-8?B?VE5ucUt5TUhiMlpRL2pjRTV1N01JSE5JU1RHNnBhYkZMYklUejRGQ216MHBX?=
 =?utf-8?B?UW1XTlV4ckE3ejFlK2dGSGE0Wk5DSURTWXNwdy9GSXFqVzhtTXAybWtuNFNP?=
 =?utf-8?B?NmllVnYvMGx5eUxXclpRdEJsUXlad25nWnZtNjVEcHZOVWc1UWR3MUhYcC9y?=
 =?utf-8?B?eVRNcDVJR3hrVnIwb2l6TTUrd2VBPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a41aaf-daaa-428a-c9a0-08de2032d33a
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:26:20.0407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ul4Mu7lPJDQudyHZedCy7/YHOQnPb9xt6rBALL48kQFkEzzUTkWS+6tfMKssiZF6PLlJd15z2+AGv92Y1w2dDVVf3P/Bz8GaOObc9hqhxm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630
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

On 11/7/25 16:51, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>>   MAINTAINERS                        |   1 +
>>   drivers/video/backlight/Kconfig    |   7 +
>>   drivers/video/backlight/Makefile   |   1 +
>>   drivers/video/backlight/max25014.c | 409 +++++++++++++++++++++++++++++++++++++
>>   4 files changed, 418 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 606ce086f758..d082d3f8cfae 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15265,6 +15265,7 @@ MAX25014 BACKLIGHT DRIVER
>>   M:	Maud Spierings <maudspierings@gocontroll.com>
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> +F:	drivers/video/backlight/max25014.c
>>
>>   MAX31335 RTC DRIVER
>>   M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index d9374d208cee..d3bb6ccd4185 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
>> @@ -262,6 +262,13 @@ config BACKLIGHT_DA9052
>>   	help
>>   	  Enable the Backlight Driver for DA9052-BC and DA9053-AA/Bx PMICs.
>>
>> +config BACKLIGHT_MAX25014
>> +	tristate "Backlight driver for the Maxim MAX25014 chip"
>> +	depends on I2C
>> +	select REGMAP_I2C
>> +	help
>> +	  If you are using a MAX25014 chip as a backlight driver say Y to enable it.
>> +
>>   config BACKLIGHT_MAX8925
>>   	tristate "Backlight driver for MAX8925"
>>   	depends on MFD_MAX8925
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index dfbb169bf6ea..1170d9ec40b8 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -45,6 +45,7 @@ obj-$(CONFIG_BACKLIGHT_LOCOMO)		+= locomolcd.o
>>   obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
>>   obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
>>   obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
>> +obj-$(CONFIG_BACKLIGHT_MAX25014)	+= max25014.o
>>   obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
>>   obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
>>   obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
>> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
>> new file mode 100644
>> index 000000000000..36bae508697e
>> --- /dev/null
> ...
>> +
>> +struct max25014 {
>> +	struct i2c_client *client;
>> +	struct backlight_device *bl;
>> +	struct regmap *regmap;
>> +	struct gpio_desc *enable;
>> +	struct regulator *vin; /* regulator for boost converter Vin rail */
>> +	uint32_t iset;
>> +	uint8_t strings_mask;
>> +};
>> +
>> +static const struct regmap_config max25014_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = MAX25014_DIAG,
>> +};
>> +
>> +/**
>> + * @brief control the brightness with i2c registers
>> + *
>> + * @param regmap trivial
>> + * @param brt brightness
>> + * @return int
>> + */
>> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
>> +{
>> +	uint32_t reg = TON_STEP * brt;
>> +	int ret;
>> +	/*
>> +	 * 18 bit number lowest, 2 bits in first register,
>> +	 * next lowest 8 in the L register, next 8 in the H register
>> +	 * Seemingly setting the strength of only one string controls all of
>> +	 * them, individual settings don't affect the outcome.
>> +	 */
>> +
>> +	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
>> +	if (ret != 0)
> 
> if (ret), check others regmap_*()
> 
>> +		return ret;
>> +	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
>> +	if (ret != 0)
>> +		return ret;
>> +	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
>> +}
>> +
>> +static int max25014_check_errors(struct max25014 *maxim)
>> +{
>> +	uint8_t i;
>> +	int ret;
>> +	uint32_t val;
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
> 
> uint32 always >= 0
> 
> So
> 	if (val)
> 
>> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	/*
>> +	 * The HW_RST bit always starts at 1 after power up.
>> +	 * It is reset on first read, does not indicate an error.
>> +	 */
>> +	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
>> +		if (val & 0b1)
> 
> BIT(0)
> 
>> +			dev_err(&maxim->client->dev,
>> +				"Overtemperature shutdown\n");
>> +		if (val & 0b10)
>> +			dev_err(&maxim->client->dev,
>> +				 "Chip is getting too hot (>125C)\n");
>> +		if (val & 0b1000)
>> +			dev_err(&maxim->client->dev,
>> +				"Boost converter overvoltage\n");
>> +		if (val & 0b10000)
>> +			dev_err(&maxim->client->dev,
>> +				"Boost converter undervoltage\n");
>> +		if (val & 0b100000)
>> +			dev_err(&maxim->client->dev, "IREF out of range\n");
>> +		return -EIO;
>> +	}
>> +	return 0;
>> +}
>> +
> ...
>> +static int max25014_parse_dt(struct max25014 *maxim,
>> +			     uint32_t *initial_brightness)
>> +{
>> +	struct device *dev = &maxim->client->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct fwnode_handle *child;
>> +	uint32_t strings[4];
>> +	int res, i;
>> +
>> +	if (!node) {
>> +		dev_err(dev, "no platform data\n");
>> +		return -EINVAL;
>> +	}
> 
> call from probe, check other place
> 
> 	return dev_err_probe()
> 
>> +
>> +	child = device_get_next_child_node(dev, NULL);
>> +	if (child) {
>> +		res = fwnode_property_count_u32(child, "led-sources");
>> +		if (res > 0) {
>> +			fwnode_property_read_u32_array(child, "led-sources",
>> +						       strings, res);
>> +
>> +			/* set all strings as disabled, then enable those in led-sources*/
>> +			maxim->strings_mask = 0xf;
>> +			for (i = 0; i < res; i++) {
>> +				if (strings[i] <= 4)
>> +					maxim->strings_mask &= ~BIT(strings[i]);
>> +			}
>> +		}
>> +
>> +		fwnode_property_read_u32(child, "default-brightness",
>> +					 initial_brightness);
>> +
>> +		fwnode_handle_put(child);
>> +	}
>> +
>> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
>> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
>> +
>> +	if (maxim->iset < 0 || maxim->iset > 15) {
>> +		dev_err(dev,
>> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
>> +			maxim->iset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (*initial_brightness < 0 || *initial_brightness > 100) {
>> +		dev_err(dev,
>> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
>> +			*initial_brightness);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int max25014_probe(struct i2c_client *cl)
>> +{
>> +	struct backlight_device *bl;
>> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
>> +	struct max25014 *maxim;
>> +	struct backlight_properties props;
>> +	int ret;
>> +	uint32_t initial_brightness = 50;
> 
> try keep reverise christmas order
> 
>> +
>> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
>> +	if (!maxim)
>> +		return -ENOMEM;
>> +
>> +	maxim->client = cl;
>> +
>> +	ret = max25014_parse_dt(maxim, &initial_brightness);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	maxim->vin = devm_regulator_get_optional(&maxim->client->dev, "power");
>> +	if (IS_ERR(maxim->vin)) {
>> +		if (PTR_ERR(maxim->vin) == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +		maxim->vin = NULL;
>> +	}
>> +
>> +	if (maxim->vin) {
>> +		ret = regulator_enable(maxim->vin);
>> +		if (ret < 0) {
>> +			dev_err(&maxim->client->dev,
>> +				"failed to enable Vin: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
> 
> use devm_regulator_get_enable_optional() to combine devm_regulator_get_optional()
> and regulator_enable() to one call.

This however does not return the regulator and will not allow further 
potential power management, I did look into using that one but decided 
against it. There is no runtime PM implemented right now so it wouldn't 
really matter at this point. If it is desirable I will switch it, and it 
will have to be switched back when PM gets implemented.

>> +
>> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
>> +						GPIOD_ASIS);
>> +	if (IS_ERR(maxim->enable)) {
>> +		ret = PTR_ERR(maxim->enable);
>> +		dev_err(&maxim->client->dev, "failed to get enable gpio: %d\n",
>> +			ret);
>> +		goto disable_vin;
>> +	}
>> +
>> +	if (maxim->enable)
>> +		gpiod_set_value_cansleep(maxim->enable, 1);
> 
> gpiod_set_value_cansleep() tolerate NULL, so needn't if check here
> 
> and if you pass GPIOD_OUT_HIGH at devm_gpiod_get_optional(), needn't call
> this function.

got it, changed.

>> +
>> +	/* Enable can be tied to vin rail wait if either is available */
>> +	if (maxim->enable || maxim->vin) {
>> +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
>> +		usleep_range(2000, 2500);
> 
> now perfer use fsleep()

Ah didn't know of that, thanks!

Other small remarks have also been resolved.

Kind regards,
Maud

>> +	}
>> +
>> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
>> +	if (IS_ERR(maxim->regmap)) {
>> +		ret = PTR_ERR(maxim->regmap);
>> +		dev_err(&maxim->client->dev,
>> +			"failed to initialize the i2c regmap: %d\n", ret);
>> +		goto disable_full;
>> +	}
>> +
>> +	i2c_set_clientdata(cl, maxim);
>> +
>> +	ret = max25014_check_errors(maxim);
>> +	if (ret) { /* error is already reported in the above function */
>> +		goto disable_full;
>> +	}
>> +
>> +	ret = max25014_configure(maxim);
>> +	if (ret) {
>> +		dev_err(&maxim->client->dev, "device config err: %d", ret);
>> +		goto disable_full;
>> +	}
>> +
>> +	memset(&props, 0, sizeof(props));
>> +	props.type = BACKLIGHT_PLATFORM;
>> +	props.max_brightness = MAX_BRIGHTNESS;
>> +	props.brightness = initial_brightness;
>> +	props.scale = BACKLIGHT_SCALE_LINEAR;
>> +
>> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
>> +					    &maxim->client->dev, maxim,
>> +					    &max25014_bl_ops, &props);
>> +	if (IS_ERR(bl))
>> +		return PTR_ERR(bl);
>> +
>> +	maxim->bl = bl;
>> +
>> +	return 0;
>> +
>> +disable_full:
>> +	if (maxim->enable)
>> +		gpiod_set_value_cansleep(maxim->enable, 0);
>> +disable_vin:
>> +	if (maxim->vin)
>> +		regulator_disable(maxim->vin);
>> +	return ret;
>> +}
>> +
>> +static void max25014_remove(struct i2c_client *cl)
>> +{
>> +	struct max25014 *maxim = i2c_get_clientdata(cl);
>> +
>> +	maxim->bl->props.brightness = 0;
>> +	max25014_update_status(maxim->bl);
>> +	if (maxim->enable)
>> +		gpiod_set_value_cansleep(maxim->enable, 0);
>> +	if (maxim->vin)
>> +		regulator_disable(maxim->vin);
>> +}
>> +
>> +static const struct of_device_id max25014_dt_ids[] = {
>> +	{ .compatible = "maxim,max25014", },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, max25014_dt_ids);
>> +
>> +static const struct i2c_device_id max25014_ids[] = {
>> +	{ "max25014" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, max25014_ids);
>> +
>> +static struct i2c_driver max25014_driver = {
>> +	.driver = {
>> +		.name = KBUILD_MODNAME,
>> +		.of_match_table = of_match_ptr(max25014_dt_ids),
>> +	},
>> +	.probe = max25014_probe,
>> +	.remove = max25014_remove,
>> +	.id_table = max25014_ids,
>> +};
>> +module_i2c_driver(max25014_driver);
>> +
>> +MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");
>> +MODULE_AUTHOR("Maud Spierings <maudspierings@gocontroll.com>");
>> +MODULE_LICENSE("GPL");
>>
>> --
>> 2.51.2
>>
>>

