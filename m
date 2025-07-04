Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA43AF8D62
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A356210E9BA;
	Fri,  4 Jul 2025 09:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kmQQHa1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A7B10E9BD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHmTasG9ZqDt+8HnGeACnsHbdjQ8/0gesUKODIfFlq3WIPNPh/cvU+9uOv/uDAYa9YE6qh0X2TsAPmLMAZRar+ROMSCb5myGabAAzT2Q67AlD2LVuk3mLJOYYo6OpDVj6C6NYfT03115Dr4bYF7ftKJ3L1T51HwFvgMRGwm6qQEJdowmXiteG/JMgsv36hL9v6PMv/qpyqie283wq9y45+9W/h2Qz1jUz1NAQYprfZvQ5OL0tWEk6R5zQ61wYI/54DrMvYzXrlfZRKx19Y57qTKWerQ0FFEoyWWKmqF9USacNs8NEqafW89BlAOncdgr2SWYVHMjhgSIwUH2JI5jWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+RAO++pnFqF/Fjxs4y8+OQKHVnRGNpW+H3u3eirot0=;
 b=U5P551iMM+vso3f+Il2u5p8z1hJnafnyN5jglhTdbuPSg8Vix2x9EGeE5Au9L4AQn3c8xgI4yXbT27htCQrEtWxpb8J8yrsyK07j2WE11CipzaJYCB+zMhvuIdeMuU9N9XOM6KDBDhjL+EpeEjvE22UCKS28GHoX5YLrvRL1d56jCC8HYGP0+YFl5SStPjAzbreoDjnjnreFvqggMxeslhZQ61l+7eWoKekEbqChcK2MG9uLMfjqguctyDwsxDr9ybMCHhf2Vd8OrWW9TTkoFHKN6Dk2e9E9Zxa2429LlbJjVCLyWl+fWRzwmMBNYKB4l8tnDvo4gWu+J01Y7Ql1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+RAO++pnFqF/Fjxs4y8+OQKHVnRGNpW+H3u3eirot0=;
 b=kmQQHa1tIRQj8S/h+gHh4Y6RrDx035AlYrEn1glGgByy0Ji5D7hx0hdGr4b35iF1osP3ffZ9JzGS8L+4okGyGAmMzvuABov9dekKCje4h4gJbiLa2rHgyZLbPcWrSWRIVQU2m9EIMGFSVy8VisPI8hts5a/QC6U2NBueED7UU72hgLF2kwvWizgMLWK2Xl7+GQ6vYfYrLNsE9w0DL40EsZZ4cVhB5YNmtSg7UHAKEZosss4ZqCo/Euaj7fui8QP5KFTc71Di+ftHBUn06Ml3bolD1dMzuwWjb7yoEWv6AD5tTTRGjUk0XcEOMNcpFIfT9l2SH7992JtgBuQZcI8KJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:04:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:04:13 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:04:01 +0800
Subject: [PATCH 14/14] drm/imx: dc: Use prefetch engine
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-14-784c03fd645f@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e394e2cf-8531-46d5-0a3f-08ddbad9bf08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXN5WCtzV2plK3hWRjFEeHk0bklBVlhyNlM5UXJjRXZkeFJxMXhPemluOFFk?=
 =?utf-8?B?Y0U1QWdENCt2UDRkaHNNTDhCM0lhN3BSN1VnYjIveHJ3N1U2UGNhckFGODFB?=
 =?utf-8?B?cS95eUpxSTkrcEIzdVU4TXJMck5ha3FkeFNtbFNUMlVvTXdObFh5NTUxNzlL?=
 =?utf-8?B?bzBsRHh1QkRRZEtLOEQvWlFYWTZYNFBtcVRtMm5Na1lLeEZVVzk2aU8zT3Fj?=
 =?utf-8?B?cDZBaFVtVndUQ0FjVGJsMnowbDJMVW13bWtkSkVXMUdLRVZYZldlb1JmbTQy?=
 =?utf-8?B?OEJSVmpxdjVabjU1UWN0RE5MRVhselBMb0JiRTduOGE2SWJIU2NIdTNwdnZC?=
 =?utf-8?B?bWFFQ3NnNGlJUU1kQm10MUxWZnJWdjVSc3gvcjh3TUI1MEFOTVM4ekpaWFUy?=
 =?utf-8?B?WGNTNmZkeG14dWFPWFRtejNwellERjBZc2RHUk9XM21wNk13WnJUM1o3eUNV?=
 =?utf-8?B?dkw2eENYQUw3RUFaQnowWDBNQ09xc0hQSG96RDJyRTR0UGlZVkV6M3pUcFZB?=
 =?utf-8?B?b2hNNDA4UkVFemt0SCtTaUUvK0Zlc1JtWkZHdFd1YitpZDFieXJLSFJhdks2?=
 =?utf-8?B?NFdKQ1UxVVkvN2RYTjI1cGdDbTFYdnlaN0hYOVZ3YWVXU01ySkVlbHlrazgy?=
 =?utf-8?B?L1RBSXpqcHhJUE5VOForNlRUclJFejZkVlVvbkdGQXdOTHRxSUZoemc0TUlF?=
 =?utf-8?B?Mys0anNDZURDVS9rM3ArSnVaZGJBZGdiSk5rMW9nTVV6bkMzQ0FXSTZhdUNq?=
 =?utf-8?B?TWxnMjg5ZXFXTTdpTnJKeUg1b2svNHhyekZDRUIycFF0VFVaMXlZM1VUT2ZJ?=
 =?utf-8?B?cXI1TnpDT0JLdjVDam8vVjhnN0JseUp1R2U5MndtSVVkclo0d293cGwxRWxS?=
 =?utf-8?B?aVBNRjcyUVBVcldUWHJUeTdmRDJkTzJvVElnUTJ4Y3g5Z25jNzhFYTBHRytB?=
 =?utf-8?B?VDR4STZHQWZ6cTRmbTRuZVBrTmRnN1pIMFRwbDZiUk5GTmU5TWxYN01RL0d4?=
 =?utf-8?B?RU5scUdCT2NzRmRiYjNVbnhwNitDa2pVR3NkV2MxZERTSGN0UndYbnJtaDZQ?=
 =?utf-8?B?Z241NGZObFRnTVh2YmpNcCs0STBoQnM5RjR0MWl4NzM2c21aKzM3TllxbEpi?=
 =?utf-8?B?NHprUElOVTAzeUc2WG1zWFNwNTNBK1M0bjFwYmM1dGRnMlJ3V1d5NFVzeWE0?=
 =?utf-8?B?dUx1Q0xvRm1aWGQxRFZVL04zT1pFQVkzSjQ5d2hRWFVTNXIxUC9kaWF5TUZQ?=
 =?utf-8?B?TUhOSDZtQVpsRGxmbDlnaXpudlB3OURKZ2dWSXRVYnpvYTJMcThkaURqZDJS?=
 =?utf-8?B?VmJOQzZ3YlpKanMreUxaWEZZVXlKT0xDcWNqSVhsamxNS0lrd2xnTkRXZDlU?=
 =?utf-8?B?VFU2bXpTUFZWVWJiU1VEa3U3TElOVG9aRktJZVd2U2dUZ1RvUkl1M1ZYRTZk?=
 =?utf-8?B?VDFuaDVqeE9WU29PMzJSZVBZMktHR3FlQ2Yyc1Q3SUh5dTRiK1FpT2RXVW01?=
 =?utf-8?B?YnloNk9aU3N1WXdKejBtanozcTNTRWYwT21ncmNwMk9TUk5mUkk0OHBjcklM?=
 =?utf-8?B?KzBKMUVReUFXLzYya1ljQWhrdy8zNGE5Y253QmdpQ0s3aFNlaks5dUJQcjl6?=
 =?utf-8?B?SXB5NVZrM2ZRSjVOcEs2Tm8zTjNqT2pQYWJ5ZlRUdWg2Q1RwaUJyYXlMeWpu?=
 =?utf-8?B?NGtBSDR3WEgrTDZmN3NDVEJZWWVlMFA5bU1ZMFRYL1JKR1dGNDJ0UGxHNmZT?=
 =?utf-8?B?TlRNQ1Eyc1JPL2hsblhnOC83aUZWeU9Vam5uKzJ0a0UwMW1BRDF5bHlPWkFO?=
 =?utf-8?B?dUEwWmZqWXVRbysyUFdVRHkyZkJ0djNnVUdjaDFYM3RreHVJUFh2MjBOU0x0?=
 =?utf-8?B?TTFtUHJrK1V3V2pZalF6VXRiSm4zQVVnUEFTNFVxL25BUWtTS2lGcStKSmV6?=
 =?utf-8?B?dU5BUno1YVVBeXpvejVFRmVOa2Frb2JYTkh4ck9XZnJSV1VYSjVQVFQwcS91?=
 =?utf-8?Q?xMeO67skvebiRT+o4xiTVgwWrf93gg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGhyNzlmSTY0eVp4Y1diVmo1RUZYYkR4MXpNUTBFbXRGN0lhcUtuMzhIWjZT?=
 =?utf-8?B?cHhoL2ZNMGkwYUVqbWNOK1dOR1k1NlJ1N3VYaHJoTG9qakQzZ1Y1TjZxeW5y?=
 =?utf-8?B?Y3ZBeFQ5cjgxTXZqb01Wa2crOHdXVnhFK3JSVFFvaWttbmpzcU81UFg5bno4?=
 =?utf-8?B?eE9ucUo2V1FvTlp1ajlMM1NTb0M5U3BYNmlXN0JERjViaHpHdzc0VnhyaHlY?=
 =?utf-8?B?Njdkc1QwallMN3ZxR05CNmFiNmw5eWhLWW5jSUs1RXNGSm5vUkdSTy9reFdu?=
 =?utf-8?B?dnJTcE8zQTVOT2dYaEhPYXpkZzNsTVFOcFNZTkNMWlhwMytZQnAzMUsxOHdQ?=
 =?utf-8?B?clI5bjVXYmpadTEwbVBVc3dXWGl4SlVrblNmaG8veGhKMUJFdmJ0WExTRWp2?=
 =?utf-8?B?c3FMYnMrbHFIZDJqMXVNWUlYMVFJazlOcEJHY0xMaDY4c2RiaFViSURkVHdO?=
 =?utf-8?B?VHBEOVNBVmpqeWxERzlJalRFMjgyQ1VjRHV3TlQxbWpYR1JuZHQxUVZxbkVy?=
 =?utf-8?B?VzdSOXhsdmpERGFEOFF2bWorK0V0R21SVU56OTVLV2FOVzZtclRPdVpJL0Y2?=
 =?utf-8?B?RzVScGlqR2E4UVhTQ0EwN283NkhLYVdDdGFmaWdra0JSNm1ZZjFVaVNDbXVi?=
 =?utf-8?B?dEo1cUpHT3l3Y2VOcW1acGVqRU5BVExIMTlhWHBxdGlRUzJlL25oclNaVmVt?=
 =?utf-8?B?OGlJVWNab1J5WmZ2cllMdmJ6NXh3c0R6cVVvL1JWS3Flc09rYWRubXFQYzFm?=
 =?utf-8?B?VUlpR3A2VTFGd2ZYSjV1SlFmb01ENEdybHRhNk5TNVhsVzQwMVh3aitNSmIz?=
 =?utf-8?B?eTRQU1V4YmxMb3V0VzJ0WFFpUjI3cXFpUjZWdzlHZS9KQXJDajJqc3B5N05u?=
 =?utf-8?B?VmZ1S1hlVHFLYVBXbnVWeWZtVzhFSVVETTRsMUx3YWs1bnNSMUhJN1MvNXAy?=
 =?utf-8?B?amV6eHlSVTRFNkhxYk5QdGlHK0t4T1JUWS9zOUx1OFplS01aRTlXRW4wRExT?=
 =?utf-8?B?OGZhQnFXdkJDakEzNk5IbWtBTVJ3dEtDMTRoajRTRkVvbGExbmJhd2tlZThT?=
 =?utf-8?B?dS9QU1I3azBJNUlpTVRxL0hFeVpWN2lEdFYyM0MrYjA3bkpyZGxtR08xc0lB?=
 =?utf-8?B?czBLaUwyZ2lZYzVpVDh2ZHpyb1ZXaUp6dHh6dndBRklsMnRScVQ3K3NXVCtu?=
 =?utf-8?B?UkFmWmtYSTd2SUZTdlFWd0UvdGE3NC9QdGtvbHBFbXRZTFIvZm5BcHUzTlRj?=
 =?utf-8?B?T1hUVWorbjF1dWI1aUZkMlRjZVkxMnV3TjgyRXNxaThLODJ2N0F1YzltWisx?=
 =?utf-8?B?YXBiLzhmSEdTaitlMVp3dGQ3NHhFeHJXT2dWbHVxWjllN1VkSUhWdU1BczJw?=
 =?utf-8?B?cmExaGZTcGc1bSs3cERLUktVckdGQ1BjaHBoU1VELzFxdFdJNzhLL09hQ3p1?=
 =?utf-8?B?dzhoenZBTXRDMmVKcEFlN08zV0huYTR4NFl5T3kwRUE0azExL3pUSnpMaTlQ?=
 =?utf-8?B?clZJMUxzbDV5ZjRhNFBDcm9WZDcwWFk0M1ZRaHJOY094SDF5VWpucGs3RUF6?=
 =?utf-8?B?bEVkd1R2NW9jQ2piQWhaWVZCVE1SN3lqcU1ad1ljbEUremJ3ZnpBcEQ2S3Rj?=
 =?utf-8?B?VWtOSmlsSjgzaVN3bENQTVNsY0ZaMmVYbjNELzM5eklMV0ZTNlZTaitJZjBX?=
 =?utf-8?B?YmVaZUFrZ1lhbUlOT1dKbEkzMWdHdzJKT3FNVjNFWjVsMXhWa3hsN3RsMXR1?=
 =?utf-8?B?dWNGM2RtYklQQXdMUWVGUFEyVE1MSGYxUmxjWmlYM213OHR1Q1JnVlM4OWRt?=
 =?utf-8?B?UngwZ0dIbnJJZGVnRFhqRWhkMDBvbjlEZTNYY1BDSXBwU295Z3VXN3F3UEpJ?=
 =?utf-8?B?U1pzeFRUSXVmOTJaTW4zTFFPcCtJYlBMS3JHSUk3VG9CRHVwL1M4aGhaUVhB?=
 =?utf-8?B?azI1Myt4azVhSDdoN0Y2RUdTL2x2Q0UyaFVsVEhiQ1RyTVpmVFFqQWNFa2Jl?=
 =?utf-8?B?QmNuSWV0WlZpZjMvb2hVdkdVc2hncGwxU0hyWHU3SXJkYVVNci96alRGQUpN?=
 =?utf-8?B?T1g3a3BMRWgxSGtVR3dybmllMnFzM05icVlHUlFuY3NaN0tCOVNOMFdvRjF0?=
 =?utf-8?Q?xItD6U4fQyXRALo6YRmowS+BU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e394e2cf-8531-46d5-0a3f-08ddbad9bf08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:04:13.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zlEVUBRIKjGHOmvc9Es//Ml++ApSqhEUrXW2rUK6EF16TKtO+kBAdDx3SjKtf7/s9u/jL+TkXVI890m3ktyNw==
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

