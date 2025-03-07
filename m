Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20856A560E8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ACA10E0A8;
	Fri,  7 Mar 2025 06:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HT77r8Yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0F10E0A8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 06:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGNK1oz6CA/Y3hHFNRw08PkrR0dAPT+x4DDi52pquiiUm3FgfIYJx16XCpSwMt5U4mZINoh5f1LhdYC31alVtRQyD5jy17Yo6/7CRj7TAFHez91UYLMG7moZxu6txFJgJX14dmKmLc4okgaGq7egHFN12tgeb3BitWZhQAwuT7Kc5r3cxWHQDmF32Ttj8V4P+PT1uKY85aPn2FpqwNmYAv2NEEjg2sJzb9RqolwfkMyUlanHS4UD3BVJKR+z2diDopRR2ZhkWo5rJcx5RI7RHPl2CLp++Nv0bZhGmED68ge4BFIC2aAjVvLzi9C50Lxn7bmC8vvf2K8i3I2BHqCGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/E8mim6nrECFgpb1jn5jC5h1Nau+pzpgDfPanxCz5c=;
 b=yescgmvQpYGkttE7T7YMozQ2d9JCL05YZi/yeNbv0teErpThWqXrGkYT8c7mszImVP4VO69gxpVwijeoydJJs9Rossg4urh5iSQAQlWBuhhi4M27K3l1EDxqNPJjWcrrUc1VZ7tVwdllr0ahqYMfsdsHOBWyorVv3WJ9N+jyULsNazu4x9mxI2/TU097mpGCrCYDEPemK3azAP43aR8UfrS/fniS+PRXmWRfNJFw/hxx68v9o3Ugxjn4dvHkYN3J4BYwcInSPoHVhL9OUZ05LxkuCEaCC/bLBforP4qk6USuWHNTf0UJvyRqmnHHvzCXdCLd55vC28ePYj9UV7edvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/E8mim6nrECFgpb1jn5jC5h1Nau+pzpgDfPanxCz5c=;
 b=HT77r8YggPxJwiheElSSLIvsej6IJ+YF1zBEOUw7v8zh+N1MLLCuIrq3D5yyfpZZHvxVYPiicM8tj7mpR+YEiQtym8Vi2qK/3S/4teOZcuwZfPDsY/lKpbMHYFYne+5nkrdqFez/m2sd6iIFCwR84SHfv3OhpMD0hZxbu7moieRv/Sw9n+uK/9B6Fu1cZ3tscJO2mscuATMomiFPZjqWTQEbxskUvH68zbAGm2Vjn5mBODHNIG/MPKdhDBTs4hqtv9DhxfPKaDt+V2lFWguj/i/ytfuu5zKmK5wjO+6cd7XieD1+mwmQLtq0xrzFSyNlt57hIfN4awPa4guwk0eKTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9972.eurprd04.prod.outlook.com (2603:10a6:20b:682::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 06:33:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 06:33:52 +0000
Message-ID: <5cf48c2a-40b2-470f-aadb-0710acd37084@nxp.com>
Date: Fri, 7 Mar 2025 14:35:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/bridge: fsl-ldb: make warning message more
 informative
To: Frank Li <Frank.li@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-2-f139d768b92c@bootlin.com>
 <Z8nizEsd0QbYgsI/@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <Z8nizEsd0QbYgsI/@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9972:EE_
X-MS-Office365-Filtering-Correlation-Id: 342c8bf5-3a8e-4ad1-212e-08dd5d4206d8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejlleFN1bTNSMENyb3ErMFF0RkJ3WVI2M1cxUDhwTTdoR3ZJanpwZHl3S3ZJ?=
 =?utf-8?B?cHpZZTN5aVkxbVAyREt3MXZ4Qnh0b2R3WSsrVzZzeHg4cTlOclZZeGtsNmo2?=
 =?utf-8?B?UEZwdFFwUzBGb2NyaEt3a3NaUVVGaVJiSkxBSTlvVG45RHdjSVlFR3E5ZnN3?=
 =?utf-8?B?STdFVm92eko1TmZOWWFZdTQ4VVRWK1d5RHRDNEZVKzZDS3pUZlJiYmxrQnRu?=
 =?utf-8?B?bkhXQ2o3NHYyNkVaTCtzRHE2TTQvOE4rbDZEVHJ2TnRQZFkvV2RHWjZPRWRG?=
 =?utf-8?B?ZWEySXVxRmY3LzhtaVR4Z1k1TU1jeGg4UjAwRnZMRUQ2UU5jNm5kZ0J3S3NQ?=
 =?utf-8?B?UlczbUt5RzRKNGh5OWtTZUVEV2srcXhqYVlBVFJRREZORUwyelRJR1FDTVZZ?=
 =?utf-8?B?U3c2UTc3bk1SYUd5bUtXb2tSdkNtVWRRUGg4S3ROcTBYOUcrKzU0a0Uyb3B4?=
 =?utf-8?B?NFg5ZVZBWTloVkZLeUtqL1djaXVyV3g0Y282aEdPMHAvdEo3RnJacWpGaS96?=
 =?utf-8?B?ejZJMjZEa053UnRmaSs4TnM1UGI0MkZta0M2MXZqZElaaHJsNVVYRkRLNXRH?=
 =?utf-8?B?UjlWb05GQnBkKzM0dXphdkxKZWx6eHRrLzlScSs3TitRVkhNRXBySEJCQ0hS?=
 =?utf-8?B?aFFzVDhXVTdXR0pXOE9DRkx0MG5GSVV2MzlVbXQ4VTlRc1V2MjMrZkNRSXYz?=
 =?utf-8?B?UHhOOCt6c3NKdWp2Lzc5MDkyMGYzMzFKNGlWSkh4VVduL2EvZTh1U2pZSlJP?=
 =?utf-8?B?TUFoWHlxOFdVc1RZWlZDY2ZNL21BQ2xOZTJqc2QwNE5aWUM2clFPb1RKMHg1?=
 =?utf-8?B?TDhnVW5xR2JHbkE4R3ZDRkYwTThsaEtFNzNLSWk0d25LZ3BtZVhQOG1uTTlY?=
 =?utf-8?B?c2ZnT0FydnJxVWpZakszLzNDQXBVdjZIdnJOVVlKU0hKaWNsMFNEdUF4OU9o?=
 =?utf-8?B?ZUdxRU8vRWMxTTJwcXV6ZDAzdVMwMnk2UkQ0aFVTUnE1SXB3YTlVVGNkb3JL?=
 =?utf-8?B?Qnc3WVdNd25LSVhabnNLZHlyV2VkT0pLc1dOWElTTkRzYVVXb1hWTmMxS3A5?=
 =?utf-8?B?UGJDQTNhNGZaNWVIRTBKT25lRlVYOUFkUm14K1VlN2VNam8vc0grYUQ1RnZh?=
 =?utf-8?B?RXdjMkxtb2dlV240cVVCa2ErNmN6RGc4ZDBkOWRKZlFmYjgvbHZ5a3Vrcml5?=
 =?utf-8?B?b0FtaVJSMmNidlRZYm5IQTQxdjFyMFN5ZUNWZHNWYnlTbDVaWlRvRnpmN2FR?=
 =?utf-8?B?SlFUeHlINE4veWY0VkFya25SSzJ1MHZPSURLUVdsS3lJRkdnMnBITTk4VDA1?=
 =?utf-8?B?bFNiOS9SVFE0N2ZqR3RHNGk1dk1Cb2UrUXY3OTVINXhiazlRNGczdDV1VW03?=
 =?utf-8?B?MXV1UUJmVU1rcEp1eVh5M0cvRkJBdVNwN3NEOVo3bmQ3VU1aZ2tGS3gxT3Fw?=
 =?utf-8?B?ZmVPc1hiVWVxcmdqeTJ2WEZTTDgyaTkwRkMxczdDVjZ2a3V1cW9vLzRkbENP?=
 =?utf-8?B?T3dlc2VmcU1uL1U5cnBTS0VDaXZoaHo5UHRKeFYwNTduMEdnSDhJdklMc1V6?=
 =?utf-8?B?eXB0aTVyMHZjMUdNUEdVSEpyUkJkYjRRTjdVV2NDYlRTRmpxamdOcTdDQ3JS?=
 =?utf-8?B?SjlPbmkzamFUTk5KSlJHNEE4dm1YQTZZZ0tWMUtjRlB0THdmamwxWTVVSVQy?=
 =?utf-8?B?MW5sN3haRGFRM0htakJ2a1RxNHo3UjdYcW9PTW1UTUFTZmtvUEtuaTdlVVR0?=
 =?utf-8?B?TkNnZjQrQlZHeWlqekR0UUtXUnpkeE9sb203bFN4YTRhekhZaEJIc1ZnWVhB?=
 =?utf-8?B?K21SRDBUb2loYWNGdGFCVzBzamVXc01xcmZhUmtqRTVGdzVoYWtHaG03MmFr?=
 =?utf-8?Q?gkzjGTotBiDLg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1hiSFNubEllazJkbnl2bFhGekk0ZzY1cUpBWkZnT0xFUERPNlZiQVhYTmhZ?=
 =?utf-8?B?UnprcmZsRUxGbUdZdVlmcmEwRjZyQkxITXhiemw4bytmWDZQWUpkSkdaSlRU?=
 =?utf-8?B?clNuZW9SSEtBWXgwZWVWSVJkRXNxMW5iNW1kRnY3YzJpazN6aTQ5ck5JcW1Z?=
 =?utf-8?B?TFU0ekpCSG1MQlFNUDluZXViU2FYNHBBMnRiRU5UMmxnYm5XSU1HNVNEY3pE?=
 =?utf-8?B?SzNadHlOaVpoU1Y4ajcwZlZyT2czZVphdmFWSUhSbE5yVFdIQU9MSDdHejJm?=
 =?utf-8?B?Qm11dVZJczhlRWpQUHpzcVdreGlyZjRFOVNkTm10SzIrYmxsUENSWWt0SEc4?=
 =?utf-8?B?S2lGOHd3QTNFYzRLa0RDNmxHaS9OcHNHdzlUdFdDVDZaK0JyV1grU2pvcmRy?=
 =?utf-8?B?bXJGNDlYeEhFYVArZ2F0dVVvdHQwVnJVWndHNFFmVURESjRzeG81bHE0N09Z?=
 =?utf-8?B?L2U4MW13Z3g5R04wbmJmNytoREovWldWMWlTV3BFVkM2djQ1SkpGRmRhVWgz?=
 =?utf-8?B?enpDYnd3N2xWZDV3QThIQzVSWU5SV1JpbVA4Q002MCs4VXowREJrNEdlWTkw?=
 =?utf-8?B?M2tFeHhpWnJrQjNPNk1TcVpVQndrbnQ4ZGtTL2plN09QaDRnZjhCMEU2c21q?=
 =?utf-8?B?RG8rVXg0cXBzMVo5Y2JVWTEycUhGa05kcFA5RERtSXVoSUFnOWZNZG4zQmJT?=
 =?utf-8?B?bWVOWFp4YTVNcm1RbU1FUEt1ZGZyUXhPbGpoUVpocTlIZUw0M3hPUE5FZllr?=
 =?utf-8?B?TDhJZXBPL0NTRnZLbXFlR0RoK0xyTUhiZmJocXc5aS8rWjhhQ0RBSFVDMTlv?=
 =?utf-8?B?Q3FVd0ZoY1VldktPb3ZXWDlVT2lxME0wT1hnQWF1eGd4Qi9oa3Vac2VlSmNO?=
 =?utf-8?B?WEZsY1ZxN2JKNmpSWnowTjZNUFlTVHhUcmx1c1Q3ZzZPbGlvc0JrREZjWEJy?=
 =?utf-8?B?ZERXTWkwYzdic2l2KzMxdGlkVUlaUnkrcEk4aGhuVkQ2V05xT0FIb3AxcHZR?=
 =?utf-8?B?dGtEK0NITnRoY2p0TWFBK2pWdUFNUENEbHBkMnhaNitDbmF4QXBydlJPd1hU?=
 =?utf-8?B?SmRmeXNBemhRY0w5OTNxQWpoNDQxSCtaMHN1UjZiS3A4OVVhM1dwWlhVcUMw?=
 =?utf-8?B?Uy9pU0ZwV2QvcFNmUG5xREVmd3g2UjJjV0FORHgvYlNHRjU5K2ZrYkNPemZt?=
 =?utf-8?B?eHB0aytRZVJvRUI0TlFqVzlCcTkybEhxc0pWNG9jd0lDVDFrcXZkclpJOUpF?=
 =?utf-8?B?SUZOSVY0UG5SdldPczBld2F5bkgweUdEcUd3RkZxMGNCZzd3VnlTdFpqTVcz?=
 =?utf-8?B?elU4bVR0czIyZ250bDBCR1Q2N21zQ1dCeHJabmo4bmxRK3NVUHVTaW9yTmZP?=
 =?utf-8?B?RXF2bnNnRjlQVXlpNkRsMjY0TE1Cbks0MlA0SXB3eURtRUprN3JGTVBPNFJL?=
 =?utf-8?B?TVEzVDg5RCtibHFqeFJ2NFhReDV4S1dVbUp1WVAzTVRZMlZmYndvUEFuSEJQ?=
 =?utf-8?B?dlk2ZGlZL3d5MWRvZHJ3U1FidnFteVVkc01hcDhWS2lUNDlsanU3emxZS1hU?=
 =?utf-8?B?ZTlycmVYZlNTTXJya1NsbmpnSjc2NjBpR3VJbkQ3RzNwWlRoTkE2c0p4b3FE?=
 =?utf-8?B?by9TMTY4aGZzekZZZ1oyVFJwT041WjAzQy9xR0JGR3AyR1pEWUhFNUZhNXN3?=
 =?utf-8?B?TXVIT3o1d3F6K3RScm1abktQVnpudzJpMmQyS3Ntc1VsVG05RjY2QlprdnVN?=
 =?utf-8?B?NXAxb1BiOUpHYzhRVUNaQnA5aE9KdGRZV1B1UUNWUEpxN2VUZUxPRGQzQ3hF?=
 =?utf-8?B?dmhRSWdycWowYXUwMVNmbkFxcjNCNFBNdE9LV0g4S0t3Ym1oTWI0UE8wMlNB?=
 =?utf-8?B?Y2QxUTA2ampEVjdqN3JaZk5leTR5R3RsbFZ2Q1JtVUJ5WlhwWURoajJWeEht?=
 =?utf-8?B?WFVFUDVieGo1cVZmeGsxR0ZmNGVrQmRkYWFwZVhEUTBzUjhlTytVL3d0MWMw?=
 =?utf-8?B?MlRDZUZubUdrZDlTWmFOTTJNSGh5QnR0bnNQQ0NCMkNkSEg0SE8yOXluTFZF?=
 =?utf-8?B?WHo1UElscENrd3RTR1dJajRWUXIzZ1VybGkwSHRaTS9ZMlRsb25lSXRMZ1ZT?=
 =?utf-8?Q?VCrLt53w4TxHGEYAwd+rDiCtY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342c8bf5-3a8e-4ad1-212e-08dd5d4206d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 06:33:52.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFza2WX67BrUOHPEieXVUeK6gYT6CH43YLgLWhdUqKaeZiPC2UIrcDwVOdGa290XHqbFf1OmLSw6p4FAlN1fXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9972
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

On 03/07/2025, Frank Li wrote:
> On Thu, Mar 06, 2025 at 06:28:41PM +0100, Luca Ceresoli wrote:
>> This warning notifies a clock was set to an inaccurate value. Modify the
>> string to also show the clock name.
>>
>> While doing that also rewrap the entire function call.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/bridge/fsl-ldb.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>> index 0fc8a14fd80062248a43b8b93272101a7ca6158a..c7c899a9644bb827845fb3fe96a9695d79a91474 100644
>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -181,9 +181,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>>
>>  	configured_link_freq = clk_get_rate(fsl_ldb->clk);
>>  	if (configured_link_freq != requested_link_freq)
>> -		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
>> -			 configured_link_freq,
>> -			 requested_link_freq);
>> +		dev_warn(fsl_ldb->dev,
>> +			 "Configured %pC clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
>> +			 fsl_ldb->clk, configured_link_freq, requested_link_freq);
> 
> commit message said show clock name, but %p is for pointer value. Are sure
> it show clock name?

%pC prints clock name.  Please see Documentation/core-api/printk-formats.rst.

> 
> Frank
> 
>>
>>  	clk_prepare_enable(fsl_ldb->clk);
>>
>>
>> --
>> 2.48.1
>>

-- 
Regards,
Liu Ying
