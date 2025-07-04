Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C754EAF8D45
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3128410E9AE;
	Fri,  4 Jul 2025 09:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XqzNxevq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E57D10E9AE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6T68TfY2upryvsXKlba7pT06aycPYRhhbhhu5EPSOBBZQtwOwmLdrcxWX7LoGTqDr1OGfd3VzbuwJZKI7bG4DGwHFgixErCyaDzHYA3NPwH76uFbSBF76kN9pT5+WTsIlAyYRkGRHJqEDVQlaIBs3+43qcYM6+rDGJE2lqsMzWjk4Tyv0O3Ba4RvFRJ3x9wnVJpZ71AaMFoibpyh7VyFGxSy/uWXkghxboNQaifxs39sJf0b62CPA1mESJ9X6O0HofgL0G+aezwVYrzabbesWtpfpA5uiUxx5LhzE1y9SYWXbZRB4dMqcXfOY/J2LPP6xJPWITwKJAbCl5VSlX69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=VglMGTwOa3vnMBeaB8t9hwC5xlkFRvd+NKcy5DzN21Jw36t+wlDUE30xQDLSQJ2rAqxLjmB9iTLH2sz0Ii7AWsSW4x7x9+g4hSgnL4p0jGBFAge9xTHC5DT/WOI/6lTtF+fIMlXDbM654bs6GC2uaiI9liId0GbCE8GEzGBi5lXvxoPf4INOc0o88stSZ4RLp3Aq2m2reJnRzYL45hZ2jY/Pw4mQDVLl0YVu1T4TKf9nFgtKpbyGA2Pe4LGuTv7mvmzA9vmslzwVECdgHBTONZoxYjzfL4LWtpdwDeiA/Ji+4Ew8mtE2G4cZYmjXAONIGAmxRFx2LoPbPnTYI6RPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=XqzNxevqYDT3XfJRSND1wGaQ7JjjqJk4CdC0G489Dv9nxSu1PVEx6bI43VgD/dm5d489ksVyFu3zVIXxM6Te+BHxNEx5lhpmXtwsLjGT2wZEUJqxx0f4rs4bWJQO3zz+QrrWAVjTx+9zooADVkpaVpdu2C44NdHHu7vyFmAro/btWSTGTG6G8eJv18QtBkUFwVo76+GGfIA2v1VL1AANNnBj6lxn2dpYjq+4U4sVg9cOGD+JrBAK/RJLgljadFHUYGu869/93xbobs+rSxke7wGaI+zT1jrJ3+bdtanMriquuWikUcVVGmdiQ5jCNj3pwe6pYjSfKSnCuwl4/tteTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:03:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:04 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:49 +0800
Subject: [PATCH 02/14] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-2-784c03fd645f@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb47165-a09e-41c6-190d-08ddbad995ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDRpRG5SYnYvVGxrZEVYZVhHUFdlVW9jZDR3clVzaEJjbFVkVVdmK2EwMmo4?=
 =?utf-8?B?NlM0TURrN25ONTdVbk1OSFc1b1o1U3pvc09PTS9OU1hsMk84Ti9XZ0xIa3k0?=
 =?utf-8?B?TFNvMXh0aGpnQ00rbFpKUjVBcUJBSW5pWEVXbGwrQTlSaU11VjFnR3ZTdWVm?=
 =?utf-8?B?ZWlaelYxZDlCQU9OSzNKYUppTjY0Y2JvdDhteG9aTVZIU1lMN1VGTTNQbmE4?=
 =?utf-8?B?cEJOKyt4VGhIT3JEeVM3ak0rc0dONk9DdnRxLy9yUkQxcDJLYW1RSzR2MTRt?=
 =?utf-8?B?WVp1MVVXVmVnUGwrSGg4VFRwbGNKRWlJSjhkSW1aem9hM2h2b05IOEUxQlFL?=
 =?utf-8?B?ZGtxQVY0NEF1M0FGaGRLN1ZsMlk3Mkw2aTJXUlBzcXBDSmRSSU0xV1lDbzdE?=
 =?utf-8?B?Yko0NnlGMlF0RndCY1gzd0doMEpNR3lDTFRkdUxkeXpoNTV1Ykw5NWVwLzJW?=
 =?utf-8?B?T1RqazJnb1Q2cW52dG5TSkdyM055Qlp2L1J0enZJbkRaSnhUb2pyQUNFQm8z?=
 =?utf-8?B?VDdLa3R1WnlxbUZZa09WblFpRTIrUDQ0bHBJeTNxKzRGQWY3WkF2aGNGSTAx?=
 =?utf-8?B?QmpmdFBZcVh3ZURaTGRRYTk4V1ZqZ0l4dG1qUUF2YjJEUk81L0pQSmpraUxF?=
 =?utf-8?B?TFZxS1FXTGhkZ0JOL28wRFl2MDB6WnhvNnRaSkVPc2JZOGpGZDNjbHFvYTZQ?=
 =?utf-8?B?OGFhVGc4bmJEc2svZ1Z4RDZ4OUVSYXhYWHdiVnJjNHYwbFZhRjY0WUZ5Tytw?=
 =?utf-8?B?clVScFFhV1hYeTQ5dVlzOXNHVkVCOE1URGpORWZaUXlrVE5ieXZ4U1gxcUpS?=
 =?utf-8?B?WWYrZ2d2bllwK2hHdys0bjZVMDVUNk56V0Z0ajlQbFpBMHViemlaSURoYUwz?=
 =?utf-8?B?MVVIMUNMTG5tSUN4dHFVckRPN2pGK012dXM3QXcrM0NHTDNLV1JEbVBQRDZB?=
 =?utf-8?B?c3hNL2NGTmVKTGR4dHpDK2VWYVVNUVJrTE4xTTZpb3Qzdll4OHAvbUxoczFY?=
 =?utf-8?B?dlBCQzVQUERkVytadkU0UUl5N3k2Y2pJZHIwTVNoWlV4NEE2RkdpRFBKb0s3?=
 =?utf-8?B?d0pSWWxtejNXWXNsalVOclgvWFRob3FxTktsRGJYd0QvZnE2RVA0YkFIRHlG?=
 =?utf-8?B?cDlJdWRaMXA2blFxTDF3a3FGYTRpQkYydFFOdTlUTzBHY0pwRGprQzhoSVRr?=
 =?utf-8?B?Z0R3d1UzeGRSSWVsamxJZmRYTFF0VjRQRVlDeHp4b3VCTitFUDJ2Q1dWU2lW?=
 =?utf-8?B?dUxiWmljMjU4MzRrSmFkSG53YVRnRVN5bFdDQ01EYnV5NW5zZEJzQ3JzQnNB?=
 =?utf-8?B?VThWMjkyaDFLNHByVjhsUWttaXN5TEtNeVJsY0toNUNPcFFXQVQwcG9ycDQx?=
 =?utf-8?B?TS93S0Z1eFA5dUM3UUMvZ1hBSXVQZ3VobURkTzZuOFdxR2NJRVU3U09vbWJB?=
 =?utf-8?B?dVh4WjBKUUpGd3NrZFN3UzZib1VOVGQ5R2lWbEpXMGhtT2JCQVN0Z2JMMHhv?=
 =?utf-8?B?NWNnQzcwdmpzd1JkakYzdnhrRTlZL3FqR3RMY1REcG91NUV5aDkzaU9GSnhT?=
 =?utf-8?B?Mmx5cjRSYXhoMnpHMG15MVVPRmd1c0tnaFRxNThmUmZ6aXQ3SmZGM2E4Uml5?=
 =?utf-8?B?Nzgyd2RZdHNkajNjMFBDLzk3TUF6L2VPamlYbW5rK2ZMMVBGZnRKVjhyWDNi?=
 =?utf-8?B?eTU0NlpxT2cyMDZ1bEo0aExsajg2Y2h1VHBRaVlieEM4QUYrZi9wRnNpaFZQ?=
 =?utf-8?B?SFh4bE42V2dZZnUvQXdZRC9nOUlXL01jc3dnQTgzN0x5TmZxYXVWS1hwZUNR?=
 =?utf-8?B?UFVXWFhiZUFWUm9UVkkzVFVISi9PL0VEODI5QTFrMlJoTGdMSGU1VU5nWFkx?=
 =?utf-8?B?TzRRcVFIU2U2TExYUWczVEJIR01EcmVsUFJiSVJXT2hoSlhmTEVad1JzVFNV?=
 =?utf-8?Q?8M+x7y7AKwcxd7ttjqU16sAQjasTHcQC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azF2bFpDOE55ZCs1ZGhrYlZNVWtlTmRXZjAxeURvTTBBZHVBZ2tVdHdnWEZq?=
 =?utf-8?B?TDFyMURvakJEYTZHR2FFdmdYdW9vQ3ZHcVNrTHJTY1pmbmt2VjZjdks3bkFi?=
 =?utf-8?B?TTdBUXZiV2I0NmU2UG1LazhxcFFJejlmZUM0end5K0ZOdlphWkdPbVRUdW9U?=
 =?utf-8?B?VDZwMGdYUnM1Vk1TaHhGMkNDT0ZrUFcvK1MwTU5vWHphN2ZyTVNPd2p0V0gv?=
 =?utf-8?B?UkpPSGdwOG1zdkdFVGFqdFFGZUdwSUR1Y2RRUi81U3dreHpqS3VURjdxNVJl?=
 =?utf-8?B?M1diS2I1TVBTT21IdU5DcWNxYVhsS0RmQUIyWVJjUDU1ZTNBL3RVZlpsdXBs?=
 =?utf-8?B?elUrcld0aHFTb0xDWjIrbW9pNGhaTGJKTmFncmxGdzJOcWlHdzNraGVrNXhQ?=
 =?utf-8?B?MmFuWjJreDlQT01kejhkdDA4OS9VTVk3QzdPMUNjSVY1TVdEZTk5WXpvdXEz?=
 =?utf-8?B?aHQrdWhWTHJGbS90V29uLzFtOVJNbXVucDY3Wnp6Ykg4Y0o1NGtZS2VCaXg1?=
 =?utf-8?B?ZGhBVUFiOUZkK1JQeGdlYWRjaGdlYk9rS1R2dWt6RUtJUEh1VjdPcG5rTURi?=
 =?utf-8?B?V0xXTEt3eElmZHNJR3YvVTJqTXJndm5PenVrU2l6Sks4U2NkaDl4bDQ3S1dL?=
 =?utf-8?B?VVZaL3EwMEJRWm5OdDQxYk1BRlF5UGJoUDBka2hjbVRJc1R5QlRONXRYdmJJ?=
 =?utf-8?B?YStBNlJtWUpLdmZYRmk5SFZ5S1F5cGZTN3JNRWtMYkJIR3BkbytySXJLK1pX?=
 =?utf-8?B?WlFLYWtMbC9iZEc4dlFhUVRKRmE1a1VaLzZ3aldjcU1CUG9BM29FRndZN2wv?=
 =?utf-8?B?bUVwd1RDelFyRS9SNzg4RTdiNThIRFlMdzRqdE5MeGs1RnZnNG9yNFliYldR?=
 =?utf-8?B?VWNUL1RiSElxakM2bzJoNHluSGlFeVlFT2tLTnZ2cGxiUGhLQkZROVJWcnlt?=
 =?utf-8?B?TmJaWTZjbG9mbHVxL0k2WXVDMklUS0cyd0FSeDNaeFB2ZWtFazB5bUpmZG5N?=
 =?utf-8?B?NWp2Ymw1Z2U5YXRpN3pHWXMrSGtlaHAyVi9jL2NUM2N5Z3duVWo5R0NvaWVR?=
 =?utf-8?B?WVB2bjduYkZrdkYxRDUwaHR5dDg1V1BRU2dKcmZ3UHA1RWV2RjRjekFoT0Z0?=
 =?utf-8?B?dmhDb3dUeFEvTkhWY1VMRGd0Y1VvQ1F3TTZ0cEFjWlFBYUZkOGlQZzg1UzBr?=
 =?utf-8?B?UDJoWU5Mb1F4QkZQWFlEcENKNDhWcGxFRnpvdlVQTXJ5MmhyZWRCV0NsMDdo?=
 =?utf-8?B?eE5IUThlU2s4QklVZFhYUk5lWnlhc3R4WEN0REE5aXd5U3dxNDBURzhod2Zu?=
 =?utf-8?B?TS9qVm81ak5wZlNaWkFpbUJ4SFVEcTl6QXBQT0tmWlo3NkIvY2ZPWTVJVUd5?=
 =?utf-8?B?c2lpNVRZQ2JicG84S2FDSDlpMWJ2SkFoVGl6SjRLTFlad1ZtK1BqRkxjYVlG?=
 =?utf-8?B?bWFLV0tQZE81VW1VWTZRZkpRcEVWUDljVnhmWkl2R2NwK1IzYjA1VTJiZkhI?=
 =?utf-8?B?OGd2dFVGZTREN1JMNVBSYW1HVW8wR1NqU2RzdE92ZDhpV1lkMFVwNHdCc212?=
 =?utf-8?B?SnZFd2Y1VXhGK2hPT2ZZb3dvc1k3MXJKVVhPdDN1SUpEYVp5R1FkTDJSS1BT?=
 =?utf-8?B?NWpEcHAzT1pIa2sxQXlOMHZpU0swaW9GN3ZYQ0ZscnRuUmI2em9Ra3Q1MVRJ?=
 =?utf-8?B?M0lQak5qK2p4Y1BicXRFR2FwN2pFYzdsRjJhNGNNaXBQck1JVG90Mm9ZbHdC?=
 =?utf-8?B?NHZkdzI5a1FoU2pLQVVZTkpldUd4UjluOGpuVDhBRHphNE5MNWVVZEduNlRR?=
 =?utf-8?B?bENpYUFGdzRDNy91UFpHQkxnb1FSMkxVTnlPNlA5V0ZkTWswRDd6SkN4ZnY4?=
 =?utf-8?B?SXRxd09ieWsyRU9JenBzQVdKbDR2UmV2dTd6N0dJeTVZQlNqanpUVkovUG1x?=
 =?utf-8?B?RENJaXhGSzVlZjFZUndTdjRvKzNkSmlNaWQvcXp5Q2NxTHBkcE5OaHFONUhz?=
 =?utf-8?B?K1duRlQ0bUVaTU9kM1B6QzVWRVlBZHEyL1lRMVBmdVgza0dVQnJxZWU2alJl?=
 =?utf-8?B?QVpBUW4ySTZyczQxaEd4MTI1WUZJTC9uWDB2dUxPdWUrbEJIVmF4Q0pWd3N0?=
 =?utf-8?Q?2zy5YRgbKIal7/pMfHnkiUvQQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb47165-a09e-41c6-190d-08ddbad995ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:04.4048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtF37EiaDY02ulSnRuUZjHu9pCnRSgCTn/9KipziNzzYaHefiK0t+jxOTnJEKk7e5hPFyXQT2Q/+WduNpWXHCg==
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bd94254c1288d75f81662ef12b7f79209efb45f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1

