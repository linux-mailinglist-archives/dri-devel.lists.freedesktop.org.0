Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5E9FB99D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 06:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE6D10E47F;
	Tue, 24 Dec 2024 05:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G+t6UcTi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2087.outbound.protection.outlook.com [40.107.103.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2510E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 05:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwv6W+JBzBTs/p2Bgk4AMT2R7kQ7nURd3HWGeOSF23HqUzmNKuuQhFoIxV4SW/ZizepQcSwstCfOmN5QsnFgTU3C+GPvMVzW0ZxlT53TxCGb6AtT868Df5+y8B+I5FCIQ+HBcEUW2HZhYDq9VGhAm/9vtUXDUaNxrOEFhdc2ZLMSNT+Yan4++G2ZU4kEmjxcntf8q67ZWRtFHlq4Q8nR1Cq0FkfivQtmn5ea0h59qkQtwJRia3Ha66+EQCxQFV7esq3w2e3oKOk7+r5BbZR6LzYZFqywsRMmPUvQxiL/Zfd0EnF15ODWfbFCgmFnqxKF+d3QdNdb6qvArloUWZLmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp/tujTHOLWsc06PSjZKANCv+EpNdPlckwhWLGfNCNo=;
 b=X+iesRhgFUdnqa3JBmO5fQ8L3V5UVk0HrhwnbSoRkA7ScYq/C7ChLd8XBST0rP8FL7TcaBO6yZkY34E3sixGdI4RdQHlb3X6H6x0uymmBYR0R1OvWb2605eFxoHLsbFU2Vba0H34xFn1hDaJje/KBvuZ4Qwr3YFxYaERjvT6q+H9dOp6LMyz20NZTtJPLwVsGx2RkKXuYRsFWLC/CWOIXZB/KijRPnuSFjJerEOhkEQZE8wirFHMLIFN/b2h2DoKAEwRcsRsBPiomfP/wiZzMvNo2fZ2BJDxIq14SZPPbQIlQjmL50FJQrPx6xjlQ9ErVx7IrggU14CjbSbG6NhF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp/tujTHOLWsc06PSjZKANCv+EpNdPlckwhWLGfNCNo=;
 b=G+t6UcTiMUf2wz7c/JWkyqyakE6473eGvsv6UHVaYZ3zuJgdY8t6vuVfxqDLr51wNkI0Ww1xKBR+cY24XrL9KOKsFVwiaKmOf1z5yGCDcOKAcMNLwiY2ESl7NWr+xAsZcMxBR0R3rH1TNlQM2qdxg1wyEwS3n11XrsaJMpkudPmu7stw7D3cm6WgMVModZQ+r7FZOiHSQFV9z1FYDZ3YK7+5G1nv6dipsAGaFDqQonz8i9/A3HQMmuRzzMVVhyDPfpawzB56AvA5YWaX6OxP38wGK+FR7f2EMlJsMaOkDv/7YPRg7SDEuZYA8GZUDveDSWe/ocxY8TRuVPdswh/IvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10634.eurprd04.prod.outlook.com (2603:10a6:150:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 05:56:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 05:56:49 +0000
Message-ID: <73c80079-582a-40cb-b9e1-e20fc96fe603@nxp.com>
Date: Tue, 24 Dec 2024 13:57:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-4-victor.liu@nxp.com>
 <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c19b0a-ef91-400d-e1dd-08dd23dfc196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1A5SXNUQUR2YWFPcEV3Qm9CcnY3anA4aE05aEtISTI3YktyUGJ3UVQ5aHg1?=
 =?utf-8?B?YXFmUDN5ampINmVFNWxzdmR6aUJZRVAyUDZEa3g2aFdyMFdvbW9JMzhuSmti?=
 =?utf-8?B?UjVWeW5sMWpBZGtUUjFoYkMvL0U0MVB5U2xWRGpySHQ0cWJpUnM0NDc5cDdK?=
 =?utf-8?B?MHZQRlA5bEVyWFZhY3NodUdDWWF4Snk0Z2VqS0hYbVRpYjQwWmR1elNkR2FC?=
 =?utf-8?B?bE82VGJ1N24zOG4yd2tuazdwQmY0d3QyQnV5N1FKR3ducnNoaXdjMlMwb2RT?=
 =?utf-8?B?QXRvcWt6QmZNbWVJZXJiUHhNc0dRbHc4MXgxWjdsWEZxNjVKU21aWlhjVFNm?=
 =?utf-8?B?ODdCTWFvOUZmUUR2RnFDZGkzc2NkdkhTNmt0MCtJT0hCTkVwUGJOK2hqMEJC?=
 =?utf-8?B?aStHdmd3ZnkzSmNuQURaY2hnMWF3Zy84aEtxc1ZydDMvUGJtRjdOemI3R0FF?=
 =?utf-8?B?SG5NcFZVcTZtZTJWOFdJY2xXOWxsOFdweTl5b0pjdzMrNHFmU211ajRuNGdl?=
 =?utf-8?B?OUNSbEJsT2dmb3dEek4vSVppVUNFb3drRWRtNW9rNi9xUWpmam1wTVRKd2ZL?=
 =?utf-8?B?Zy9pV1djaXZjemdQTVU4WWRISTF0ekVrRFJBVWZleDZMSVYrS2w5L21GZzl6?=
 =?utf-8?B?cnRtS2ZDakhla0JMOUhHYjYrOFUySDkrVUlzTlYvN3FKdVNzcmFFWTdmWG5Z?=
 =?utf-8?B?WnFOTnd4NFlQMVFyamtrS1dFSURlZzNUcHpoR2YwaTFZWWgwbEh6Y0JudWhq?=
 =?utf-8?B?U0RPSUZMVDlxRUtIdGpsTXpYRSt6VG1tRTdNOGg3MkRZQjltbnNTTGFqcW9n?=
 =?utf-8?B?MzV0SDQvY1NLS2Mzclg1ODlYT2J3VmQvUTZhOXlNTUlSUVFueDVjbzYzS2Ru?=
 =?utf-8?B?RndaTHNkdmFLR3VvVzNZaERvakI4Z0U1UWtVSDJyTDNoY3JCYkRRL3NsWS96?=
 =?utf-8?B?ZEsvRDAzYjAvRFRURGhHVDhEWFBrb2kzcDVHU3d1bEVINHZJMWFkNVUrdWw4?=
 =?utf-8?B?TGdLNS9GUGRBM3hHWENBYTBta2Jic2E4c3gyR2R3cVN6ZlJ1aE9MNGc3aFVR?=
 =?utf-8?B?ZTlNRDJkRUJHQ3FvMkNZZkR0bU1EQm9VSU0vQWhrcHllYWduS2VGM2F1TGxu?=
 =?utf-8?B?ZXQ1ZEpteVNsU1Eva0YzZW14RUtNbUx2Z0F3UUJ1dndVRm15MDZSR1BlN2Vm?=
 =?utf-8?B?QWI3RGlDZ3Y3RkZQanhuWDVaWCtkb0ZzM0hpS3JNK0QvMHY3Zll4ZHZTR3Ey?=
 =?utf-8?B?VEhLcVdPbnpRWHpUWGM4UVIvSE1meW9ZYnliWXJNTUxlS1Q2bzk1eWZmNDN2?=
 =?utf-8?B?WWNLdlNHSjAwMHplZjBLOXNtR28wSllEUUtlREN0SFhoTjlIWkN6RnQ5MWZJ?=
 =?utf-8?B?cC85bFVLd1IrNXJRQUJlVDVzMTJjRXYrWWpqN0tNTFNndk5OSXdpNzVlVWQy?=
 =?utf-8?B?ZkM0SDVjYUFRb2hyb2dBcXJXZ3p1NjdqSzNHYnhDZnBra2Mwc25PVjRqQW1W?=
 =?utf-8?B?WTVISUdwR212RjFaZGFHa2tuTTVUR2p3ODBHNDZNQjBBbUFZaGtyQ1FZWWla?=
 =?utf-8?B?NlNMcDFxaERyWVQra3BTVDM0Um9sa2hUNSs3TkQ5NmFLM1AzeXE3djNjNVlo?=
 =?utf-8?B?MktodzRVSXhmam9FK1BLeWhBaHVCMHlnQzdXYWVheXlPSlIzVVRiMmEwSER4?=
 =?utf-8?B?ZkNqeTdrcVdKZk9vRndqd2U0NVRxWGVOWFhjcmhqalU0S1FYODdGNm5lcExz?=
 =?utf-8?B?Q0pHK1lSV2JqVHhFaXE4aEIrMURXNjcrTndhc1NEZGVmQnVrckl6bm54VS9I?=
 =?utf-8?B?MW13MEIvNWxiRkYxT1RMUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFNwejJaZUtwZEtNTHo2eWdBTmhMcURZWnZNcHZkN2VYK3JTcjE2S0JtZVlG?=
 =?utf-8?B?MjR5SzFWNW1weFN1MjVKczNLQ29jSnFKUmJTcnVkVktxNU5EYnhrVXZacE9n?=
 =?utf-8?B?ODgzbEg1b2hvSlJ1ZVRwZXVUNnQwL3A3aW05NXFEZFQ1VG0wK2psRHpqUFJN?=
 =?utf-8?B?eXZiWisxR2FVWjcxbWZzeHpaR0xaYk10UGJuOVRoVnc2VE5WOU9GQW9kZHU1?=
 =?utf-8?B?cUNQdUs1OThtSjFkeVI4L09qUFNsV0JNdkJyc2xKakdzYXRSQ0tZY0VBazhY?=
 =?utf-8?B?UEpVV3VvZWljb09yVHhFeUJaUmN5dEhqeEdjV0tqaTZCQW5HTm9xMDcyTjlO?=
 =?utf-8?B?K3hYRUk4UHF2eU81aGVkOVVJNHJrcjdUbEh5a21ocXB0VmxEcHRudVJacjhU?=
 =?utf-8?B?Rnk0NXhuMkx2VHoreWhMK2RtRDNCSnIvS214QWVhY3Z4bzJ5V2QwZEtlT1ND?=
 =?utf-8?B?Y01mR1Bsb1o3czNYdmhDVUs3R0wxYjNKZmIycGYwWEJkMHJ4dEpVcTNKcVNy?=
 =?utf-8?B?MkZsUHZWL3FkQlFTSkk0dCswQy81QUNNSWl3MEQ5NnFnQjAwQzQ0bU44eitq?=
 =?utf-8?B?a1BudjFZUHlBMGlNOVg3MzdXZWlUMnNHYUxxQ25PdTZQME9nL3J3S2U3b0p3?=
 =?utf-8?B?UVN3OEhJVW16U0JTTEpuNklsN3FTeWR6a0pSSlVVdnp4UGNTWTlPckpMc0pH?=
 =?utf-8?B?VlNKRE5YclZZSTk4K3ZXUU95b1dQRVR0bmkvR3dGK3o0enVXS0VrMFhTc1Ni?=
 =?utf-8?B?ak9yZkZ6RFpoWUJUSWhTd28yMGFkK1ZMZVkyWis4Q0lIVWwxS1RTRmRKVnJV?=
 =?utf-8?B?cWVvVjlNMXVXSmw5eFM2b0htbDVuQ2I3dGs0WGxlQXJHVnhoaEg4VWQ1dGow?=
 =?utf-8?B?R0hJaW0wUSsrcmN1SzZ4RGh2QUpkTVFsS28xVTAwMTgyV2NzWjhZRkhqUDFL?=
 =?utf-8?B?cTNnY0hrMnRPbnpCR3pGZXUwbmY3eTlvVnAzR2RkcHBVYnFFbkV5L1dkUEJ0?=
 =?utf-8?B?aStwUlN2WDJSUFh5eE1aTUFKMkxSLzFIV2UrQ3V1ZDRGd2tBRXVaV2pLSjgw?=
 =?utf-8?B?aWtLVVZ3b1IwK0wrdzJIOVpyaFNIa0hNcXBtZGlNSDdJN0I0RTk0ZHY3NjhK?=
 =?utf-8?B?cWNyTjFqQVlVa3VBOTl5dThLRVV2amlPMjJmWkdSNDNrbHhFY1RNS0lNeTEy?=
 =?utf-8?B?ZHNDellpeU5jYUZsOUJpRkNqQnpuVkJyeDQzaklibU81Vy9acVE1WkhLZkF1?=
 =?utf-8?B?cWM1bHRpeWVaelNCUkVTNmJOZE5rNDFuQzdxZDRURkJmSkJ6cjFNQzNSeUhY?=
 =?utf-8?B?bTFMZUN0Vzk3Y3dsTC9zNDVNUndDNVJEZXdXNU9OY1pUMkJvVHRvWjBUSms5?=
 =?utf-8?B?S0lFNjRRdVdWVXRCQm5JOVJieW1XbFYvRE5IdHRLeTJOT3Fhb2RDdFNFcHF1?=
 =?utf-8?B?VXdGZFp2MnQ2NDJvOTdYb2FEQWI5RFRLK0hicENRdmJwMXhHNUIyL1ROT21U?=
 =?utf-8?B?eHV3ejVHdURWT1EyQkVGWFh1UWVjSGx4cFYwZm9qV294dDRyZE92VE1KU0U5?=
 =?utf-8?B?TDVhTCtmMElEWnlxMXpPYmwra0hTV3pUSHhVSHNoUjNvOEJkR0cxQ0JtR3Q1?=
 =?utf-8?B?YmJLV2NyNndmRXJVNXR5VjJEWGJ6NmRHenYvUlRYbXVKMHVqR1JkcVNGdDlp?=
 =?utf-8?B?OHh2MWpRc3B3YWtlVzJUQTRzeVI0WCtLR1pHNnB3Smxoa1FUK3NpMk0xZnlS?=
 =?utf-8?B?ek1DVEh6anU3aVh6ZEZrSHBZUGw0QnFmV01yUElxeWZ4QmlMdjRVL09yL3hJ?=
 =?utf-8?B?cmptc3c5eFk1cjBaUDBCV3hWcGhCd2taRTYwaWlDT2M0YlAxMlY0WWV5eklr?=
 =?utf-8?B?R21JOStGL0xkaHdySzV4UFBCK3VHaVhYdzFmbURHK3dtZURLdGh3M3RvRDJN?=
 =?utf-8?B?Z2VXMWFNbjhGdUNmclNFdE9hUlZsQTFPMVhjdkpldWRsenA2S2dFQ2dWS3N4?=
 =?utf-8?B?UFRKSXY3K0srMFVQbDlsVUE1bnJzdUg5TVl4UXBSL0s2NDhleVloY256Z1lG?=
 =?utf-8?B?RlNtZmkvcktCZyttd1dkSENOeElWa1hya0pucjhUMEYvMk9ENXhnRnZkNGpm?=
 =?utf-8?Q?AWl7NzsKpLi/GJ19dYjEuB2Si?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c19b0a-ef91-400d-e1dd-08dd23dfc196
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 05:56:49.2230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sI3Rqsf9+ZUOWjUPQCYp3LcsyuF10bMhzrW6+4icY7OLCE2wOubewVC5UPCspzb5JF3tKRd+IX7m4oDSkIUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10634
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

On 12/23/2024, Dmitry Baryshkov wrote:
> On Mon, Dec 23, 2024 at 02:41:31PM +0800, Liu Ying wrote:
>> i.MX8qxp Display Controller display engine consists of all processing units
>> that operate in a display clock domain.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v7:
>> * Drop DT alias documentations and add instance numbers to compatible strings.
>>   (Rob)
>>
>> v6:
>> * No change.
>>
>> v5:
>> * Document aliases.  Drop Rob's previous R-b tag. (Maxime)
>>
>> v4:
>> * Collect Rob's R-b tag.
>>
>> v3:
>> * No change.
>>
>> v2:
>> * Drop fsl,dc-*-id DT properties. (Krzysztof)
>> * Drop port property. (Krzysztof)
>> * Fix register range sizes in example.
>>
>>  .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
>>  1 file changed, 235 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
>> new file mode 100644
>> index 000000000000..60d1e0a4a5dd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
>> @@ -0,0 +1,235 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller Display Engine
>> +
>> +description:
>> +  All Processing Units that operate in a display clock domain. Pixel pipeline
>> +  is driven by a video timing and cannot be stalled. Implements all display
>> +  specific processing.
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - fsl,imx8qxp-dc-display-engine0
>> +      - fsl,imx8qxp-dc-display-engine1
> 
> Is there actual difference between engines 0 and 1? If there is none,
> why are you artificially adding one here?

I think engine 0 and 1 have the same HW implementation, but they connect
to different ExtDsts through FrameGens.  The two compatible strings make
it possible for an operating system to figure out which engine is which
by getting the instance numbers from them.

If the two engines use a same compatible string, then either 1) use
DT aliases to get the instance number(as v5/v6 do) or 2) use OF graph to
describe the connections between FrameGens and ExtDsts.  However, in v6,
Rob doesn't like 1) because it abuses the aliases which contain the display
controller instance number, like "dc0-display-engine0"(i.MX8QM SoC has
two display controllers), and 2) is too complex because all connections
between internal devices need to be documented with OF graph.  So, I choose
to use the two compatible strings, like brcm,bcm2835-pixelvalve0.yaml does.
Thinking about 2) more, maybe the connections between pixel engine and
display engines need to be documented too, which seems to be more or less
duplicating the connections between FrameGens and ExtDsts.

                                           CF0/1/4/5
                           PE               | | | |
                                            V V V V  primary layer cross bar
                          +------------------------------------------+
                          |                                          |
4 FUs + (VS4/5 + HS4/5) =>|               LB0/1/2/3                  |
   secondary layer        |                                          |
   cross bar              +------------------------------------------+
                             |          |              |          |
                             V          V              V          V
                          +-----+    +-----+        +-----+    +-----+
                          | ED0 |    | ED4 |        | ED5 |    | ED1 |
                          +-----+    +-----+        +-----+    +-----+
-----------------------------|----------|--------------|----------|-------------
                          content     safety        safety     content
                          stream0    stream0        stream1    stream1
                             |          |              |          |
                             |  DE0     V              V    DE1   |
                             |       +-----+        +-----+       |
                              ------>| FG0 |        | FG1 |<------
                                     +-----+        +-----+
                                        |              |
                                        V              V
                                       ...            ...

> 
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: top
>> +      - const: cfg
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: shdload
>> +      - const: framecomplete
>> +      - const: seqcomplete
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^dither@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - fsl,imx8qxp-dc-dither0
>> +          - fsl,imx8qxp-dc-dither1
>> +
>> +  "^framegen@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - fsl,imx8qxp-dc-framegen0
>> +          - fsl,imx8qxp-dc-framegen1
>> +
>> +  "^gammacor@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - fsl,imx8qxp-dc-gammacor0
>> +          - fsl,imx8qxp-dc-gammacor1
>> +
>> +  "^matrix@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - fsl,imx8qxp-dc-matrix0
>> +          - fsl,imx8qxp-dc-matrix1
>> +
>> +  "^signature@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - fsl,imx8qxp-dc-signature0
>> +          - fsl,imx8qxp-dc-signature1
>> +
>> +  "^tcon@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - fsl,imx8qxp-dc-tcon0
>> +          - fsl,imx8qxp-dc-tcon1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - power-domains
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: fsl,imx8qxp-dc-display-engine0
>> +    then:
>> +      patternProperties:
>> +        "^dither@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-dither0
>> +
>> +        "^framegen@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-framegen0
>> +
>> +        "^gammacor@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-gammacor0
>> +
>> +        "^matrix@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-matrix0
>> +
>> +        "^signature@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-signature0
>> +
>> +        "^tcon@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-tcon0
>> +    else:
>> +      patternProperties:
>> +        "^dither@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-dither1
>> +
>> +        "^framegen@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-framegen1
>> +
>> +        "^gammacor@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-gammacor1
>> +
>> +        "^matrix@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-matrix1
>> +
>> +        "^signature@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-signature1
>> +
>> +        "^tcon@[0-9a-f]+$":
>> +          properties:
>> +            compatible:
>> +              const: fsl,imx8qxp-dc-tcon1
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8-lpcg.h>
>> +    #include <dt-bindings/firmware/imx/rsrc.h>
>> +
>> +    display-engine@5618b400 {
>> +        compatible = "fsl,imx8qxp-dc-display-engine0";
>> +        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
>> +        reg-names = "top", "cfg";
>> +        interrupt-parent = <&dc0_intc>;
>> +        interrupts = <15>, <16>, <17>;
>> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
>> +        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        framegen@5618b800 {
>> +            compatible = "fsl,imx8qxp-dc-framegen0";
>> +            reg = <0x5618b800 0x98>;
>> +            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
>> +            interrupt-parent = <&dc0_intc>;
>> +            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
>> +            interrupt-names = "int0", "int1", "int2", "int3",
>> +                              "primsync_on", "primsync_off",
>> +                              "secsync_on", "secsync_off";
>> +        };
>> +
>> +        tcon@5618c800 {
>> +            compatible = "fsl,imx8qxp-dc-tcon0";
>> +            reg = <0x5618c800 0x588>;
>> +
>> +            port {
>> +                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
>> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
>> +                };
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying
