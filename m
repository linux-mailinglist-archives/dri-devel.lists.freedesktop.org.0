Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CDB9872E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 08:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B50510E056;
	Wed, 24 Sep 2025 06:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BfhAmWWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F7710E056
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyWVb8DMQrzi9Dx3tj8pbTH4A9xa+lrb7Dc7cO9zQ5HQ+Oz6df7TkCrX3d0DdmRRfTbWa3yk6l2Tkr7a5Bfw1UYGZ0twCcsJsrAWWobWA0MG0i1qQL5Bh3EFpgn+pqlKBIDDCAvX1uq3uBM5wSmKc0sppIMqDuBYjdADlEVj+ViyWloD0N0HmFkK72YeMFfExEJYgSGz55y2NonX8Mp2F8RPiY0KK1/hVa0K78jI9dTYJmQZlX+XFPe3I6yw6Z4ypjd42n3MwTdGPAif6ZpPN0gTybkcMNXT3BC3GGUkw6oMdQl8JJEFlm7afoGqkgmDeg2lzwjOFwPHnxJN6c9aMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BARwdJ4WVYVY0Pn9yGJOOBLB+D7jhv8k8JpJqUJRu7c=;
 b=XC8LsI40m98kiZ442iutrWNMgM/zjZM9WLnul9YCSU/mEOXVmJSR219w2tJr8ioRpzP6phCOFAmMir3bRC8u5yxnJuP/Bwxq5kDpSshm6mehT+ey9ePtGRse+7CqqZxfIwn9bUEucsdBM0+7MYLLAgY12FkC4ywJGClyhLUDNKdvCo6kTGp2U37pwUrpPbDel/VxGde5OGiY4bJVKn726rMuALFYmFxeXeg2julNGok5oz6PIC4YeqFjL23W3xY4d2nVSmPqFxGS+kE//wSdbDpVL556VGNpbbcuBIGEQ6BZBqaTeWT5O8cdKg1w7QyMRpSGs533zGk+Yd36XvpqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BARwdJ4WVYVY0Pn9yGJOOBLB+D7jhv8k8JpJqUJRu7c=;
 b=BfhAmWWUFd7KAHiaDsZI7SQ0vp4OKF31SYQa3K3SroyRQoDxgCh97b3G/IVefXhGLypERf3uu9V431kiI1yLY6p8IgAOT+4ALASxWJDBk+QMe1YqnyglJyY+FVRiZ1Fm/bueF5gnG8oduVy5cZuVhVbK3IENe5AEIJUtGD+hhOXIWlfLEpDHSrAjil4L94TUUtB0MjyzHy0UJzT6IVq1HcA/zfaQUP+rIHe7yFzf8m+WqyVtbQWVTyBbDrVN1NwmjQDcuagIusn9qakJcsVpRTipKYA7TpiwppPV9L5qynqy4ax0ovyCUAG2VAmyLFQ3XGqtKYXT1ohAPyA/h9orOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 06:58:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 06:58:23 +0000
Message-ID: <41bd1647-2bff-479c-9994-984d7fae5dc4@nxp.com>
Date: Wed, 24 Sep 2025 14:59:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
 <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 84fa7271-ff2a-45ce-9541-08ddfb37c0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjJGWW1IWG9pdStyZkVXbWZzSkdvZm1mMzl5aWdIVThDVjRJSmpHK2F5eUNF?=
 =?utf-8?B?QjB3emJvVHlTQm1veWYxa1E3MDczNDdXL3F5NDd5V3NTTlY3SkczSS9qMHlZ?=
 =?utf-8?B?NVRDN2lKVjFKUjF6ZlkxVmF0L1dUQk1rb2wrc2hlZ1dIMHF5T0huVXd5Zmdw?=
 =?utf-8?B?eXg5MFFHK0xxL1FNU2thNHBZRU1oNy83K0RteGIxUTAxSTN0Um5RVHhEcmp6?=
 =?utf-8?B?REdJTGxiWnNqelRMWFBIL0hML2hRcE1PUGZZVDRoekNUY1Q1SSt3VXhoanFR?=
 =?utf-8?B?U3MwU3Y5NjRRekNQU3labzFZaDRGNHF4M3pndGlDa0lqdUYvVDUxYkR5MDlw?=
 =?utf-8?B?UVY3TlpKSllEODdsaXJaYk9wM0xERU1vQmwzdWpkZEcvNlZhT3cxVE9ZZXRI?=
 =?utf-8?B?WVdXQk9remsxREtocGRSQlFOaFB2eUIyc2t3NUIzNEFwdWZ2bHpoUnp3cDRy?=
 =?utf-8?B?R0RqNjFUdFFwRnBsUjZoVmtvUDQvQ29PRnd3ME44UHZlR0IvMktjVmMzcGQ5?=
 =?utf-8?B?SDNIUld4QmJVWjg3NlloV3RtajFIc3AvQXpEb1FCeXc3QXZWTndZV2hFZ09T?=
 =?utf-8?B?SjkzYTRYSFZxbExVUVhoQmVoejlnT2xpYjA1MzVJWW9sQ2xGRUUzQUJPdHU4?=
 =?utf-8?B?QmpMTTQ1anFwUzd5Vm1GQVpPYVIxOEdWUTBBWlorK0YxdVUwcnNaTjA1Z282?=
 =?utf-8?B?b1pzaGJ2NWdFK2t2SVluSWgyVm8zRjJidmk1OGdsQ0dsTlhkZG1Ib2g1REps?=
 =?utf-8?B?M3pKaHdPaDc0SVcyQVdJVXFTUkFYb2ZnWUhRM2xJY1RoVkpIcjk2SHpVbzl4?=
 =?utf-8?B?VzE3Y2NCYkFqaTczbzVnM2lKbFovUXNmL1M0aVhVMmhtb2F5V1FNU213VUZz?=
 =?utf-8?B?aWVuR1dud2ZEVENxdE0yRTBtOTk5dGdubnVJbENiOEFOeUZtWlhEV2xIanZa?=
 =?utf-8?B?aE5qUkhYbXQwZmdYL09xSVQ5YVd0RURsLy9EK3JDNXQ3d2hISnZaYnBZMllW?=
 =?utf-8?B?YWF2NGdOQmV0OGs1dnMyWE96OVorTm1JcEVhR0JBNnZRa3E2dGx0Uy9lU2hp?=
 =?utf-8?B?cG1PU2YwNDlwbC9SWnNpeXZxUzJKOGk3SjV5ZTRsdTZuWUYyL29ta1pkSlVT?=
 =?utf-8?B?Mk1RZVJTNS9DVjVDdHV1RGFjdXpwTjlsQnhKaHZaUG5CazlnNlllU0ljNXhy?=
 =?utf-8?B?OEw1ck9rbXJOQnlyM1Vab1Fsc1NkMmpTb1NiSnNSMHBUYndTUzZ5Ymt0bUc5?=
 =?utf-8?B?QTE3bmhvUWdueE1zVE94SzQvOTBhN2VmZXJhTk5Pc2twUW1Ya2ZWUTFTeVpD?=
 =?utf-8?B?NEVIV09yY0x2NEY1TFNoZ3MvOUxtS2wwb3VJRStJWmN4Qkd2QjZ6SmdrNGU5?=
 =?utf-8?B?SjhkWFp3NzdWbWJXSEI4TnBSNFpzdmtHOXRpYjlyK0JleEZ6M3pvQWV0SXNP?=
 =?utf-8?B?bFJsbXFJbEF1R0J5OWxoUHF6dEV5aWJabUo5S0dnUWFvS2lJT2xPTzhOaGhz?=
 =?utf-8?B?MkhuVG81MU1rYWJXZEdyRnVtZHBvdHR2VmhqZStVWWtkY21mTmw3OGp6U3Qz?=
 =?utf-8?B?VjA3L2RuVm5EL3NaSlJCM3dvR1lhcGJvZnVzdWZwSHBsWE9OZ0EzUGFEbWlv?=
 =?utf-8?B?VVR2eXRuNzdsRlZNdlhudjBDaFJlbUtkdjdGOEkwbUFWa29DTkdJSmxPSk01?=
 =?utf-8?B?ZWpib3dOdHhSVnRQWWtiakMrdEo2NTRoSk83MXZOUkVncVMvSjZvUmtoR3Ey?=
 =?utf-8?B?TU1yMjE1OCtPWDNodnd6YlJZVWsxdkdIYTh6Tkd2NGxoQWFsaFRxa0gyQXVW?=
 =?utf-8?B?dmdVQXJLWGdraE02d0NXdlN1RGpZalBLbGtNVjB0OFZyUVFPa0xQUGlIZXls?=
 =?utf-8?B?SmVlcFFmQmxUanVUZFN4UG1wRmpNOHJLYkpBL041YlJhVzNNWllsemdRRzdu?=
 =?utf-8?Q?t1JctCHZYn8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWNRQS9yYlVMYmd6UmUvMSt6Yi9Bem9mbzhveXVCZzl0cVo5VzdJdmVtc1p6?=
 =?utf-8?B?ZXVOV3JWMjlXR2pkR3ZWOHVOYzcrUWI3MlREUHRac1RWWEtqMks0dGx5eFlT?=
 =?utf-8?B?c0JOd2hNWDl3K0NmVkxRR0dQL3VnYUtNZVdmTkRNL2RlL0ZhYldhYVdBazVV?=
 =?utf-8?B?ZFlhRHlGVERtSTRISEx6RjFLeTcxY0xycTBkdU9uQ1loR0ZvMUExeUpCdlRD?=
 =?utf-8?B?VkNQK2ZITGpualJYVlVmZmpBdUV0aUhvTm5DU09RVjJTRWxjTVlHUDNLanBQ?=
 =?utf-8?B?VnErWlljbXJCOThDZDNxTVMrSHpyUVFpbGYyaVc2Y1BPUGlSOE5FQlFJSGdY?=
 =?utf-8?B?OHE3c3liTENJSHRTZisrbTROb1RHa1VhczhldEtuNG9Rc2FIRXFGQjRxNm9Q?=
 =?utf-8?B?SFZqUFF2RVVvOENoOFpsSmtPWkgxdk5GQ0NUc0hiVUc2Wmg4TGxEMExwMmRF?=
 =?utf-8?B?S0hMWmsrdk1WempNWEl0cjR5ZHExZjRYOGZlYW5qNXNSbE1UTWV6K0lHU2xR?=
 =?utf-8?B?V0ROejh0MGpuWmREMzZVM0NsK2o3bGQyS01RQjFqVnc2SEtUYUhmZU1WOGxB?=
 =?utf-8?B?MndVcWxhMnByUzR1ZWFHUTZKTW9QNlZRS0NDN1JSMlpUMUo0bTRlMGEwYWpK?=
 =?utf-8?B?eVNVUnYrWWNlaXBoRytxaXRqRmNweVdkRndoN01LM21qM3dXU3JmMWtaMktm?=
 =?utf-8?B?T0NSMjFHbFBqbU9qOHd4dU14K2dBd2pHN3FUUXFDOUx6cStGM25oQmM3Y2tI?=
 =?utf-8?B?NjF5OWFTeGE4M3Q0cDRISS9aL0hodjRmZ1h0UTFHQlFoQkd1MnJFSkZJOWR0?=
 =?utf-8?B?b3hXaDhBeE1rWmU0djc2bGkxUHIveFNtbTlBekxJMmxORGc4SEdPdkhURHZx?=
 =?utf-8?B?di8ySTBjamlzY2JHamFQSSt5T2dJQWZRL2tLbDBLRHB0cE9CSUpReEJ1Nmds?=
 =?utf-8?B?d0lqakx4SlhNUXB6Z003S00wcGcvUDZ0TnJLMCs1WmJTWTRodmxEUHRJWjlL?=
 =?utf-8?B?ZCtlaUFJZFJsbDIwQTRJckM1cG44d2Zrc0l2ZEpOMCtrakVSeVR1U2o4bnBD?=
 =?utf-8?B?c2VpQ29HKy9LS1JFY0YzQXg3OTRWcmppa0x1d1R3MVdvSDFXMHZmSy9lNjVs?=
 =?utf-8?B?NnlUWjlCaHFHeUVjc05sWGRVWlM4ZEdPdllCYUUxZkovV2llbWFmdTBuYjF0?=
 =?utf-8?B?ck8rZHk2S2R2ZUtNbzVENWJKZ3RLZC9iWHNrVHpuVWtUTUZuaEZvZHI4M052?=
 =?utf-8?B?Z1kxTUtBN1FLNVZyOGE3c1kreTF6TUJaeEhEVUJWSTF1Z0oyTDZ0UzF5RVov?=
 =?utf-8?B?eDR3dlZ5QkRtM3ZxbEkvc2RwRC9jbFkvY2ppeWEvbmRqbStTQ0N4WnFJK1c3?=
 =?utf-8?B?S0ptYngwdzcrNnNkbkR6Nkk3WVVabHFCZkh2aFk4MHZRM2dGZ3g2UTFBWTV4?=
 =?utf-8?B?emh3VWRBTHl6aEpTTE9ISzhpUm0yUWl6aGZEbnYzNEVQRnFPbEduTnBWZVZZ?=
 =?utf-8?B?YW9XSUM3TTQ5VU82Y3l2Z3laZXhKWFdPdmpUbElrWVduajZnNElaSVNHbDlm?=
 =?utf-8?B?eTF0cy9vZVQvUTBGeHBFWlV6NGFDSXBCRjgxQnI4c3BUQTV1aW1JVmxYbThu?=
 =?utf-8?B?NHZkMHcrbUROTFMrblhPc0w2a01RT2VZZG1YbWFoeGJGNjJES2ZIbnJWdytL?=
 =?utf-8?B?YnVobmlXcFR0MlhXS2E2SmpLRGxEczBhREFMYy9SWlF5MlpIQ1lNYk5RdzBB?=
 =?utf-8?B?Mm5xMHhnVzBZdXZOZWNaanpYTklReHZoejZUMTZCaTcwZEdSU3REa2pVeFYz?=
 =?utf-8?B?dlB2R3VtTUtualVFV3VDYXR4S1JVRFFOUVJtT2kyUFpPTUNISFdHVjEraFZN?=
 =?utf-8?B?WGprbkpLaDJJSVppRElwek1nRmdRZEh2WkN1bzlFVWw3ZWFpWUJJaG8zL0ZQ?=
 =?utf-8?B?emJlRjlqeU5mL3pFV2hRQmtUS01jaHA3cS9xdVFQdWw2MjhrN0pPMUVNU2lF?=
 =?utf-8?B?Qnh4ZEJCMXl2Qld5YmZNWmlGb21jaENpN1NiMmRCSFRzTzdNMklCdVVnWXZq?=
 =?utf-8?B?Z2JPK2E3K3FuTERMaXlpMzlCRWVESG9KM2ZBNnRsQ0l3amhqdEQ0ZjhJMjRD?=
 =?utf-8?Q?oXAYXpZS3ccSlOKGzKzd/fnQk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fa7271-ff2a-45ce-9541-08ddfb37c0fb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 06:58:23.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJ/hdxYb+43KIsNOoV0vZ7VUa5sZEKIqiIVaFyQwDJVN3bs155u2IwjM+QDd6t2G3kdIxbsaAJQrFAi1NX6ZWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917
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

On 09/23/2025, Frank Li wrote:
> On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:

[...]

>> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
>> +{
>> +	dc_prg_disable_at_boot(dprc->prg);
>> +
>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
>> +
> 
> you have runtime functions dc_dprc_runtime_suspend()
> 
> If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().

The problem is that once drm_dev_unplug() is called from dc_drm_unbind()
due to imx8_dc_drm module removal, the RPM status of DC, DPRC and PRG is
"unsupported", which doesn't reflect the fact that the display controller
is running if it is before the removal.  When the module is installed
again, these clocks need to be disabled out of the RPM management to
avoid clock enable/prepare count leaks if necessary.

See kerneldoc in drm_drv.c:
/*
 * DOC: driver instance overview

...

 * Drivers that want to support device unplugging (USB, DT overlay unload) should
 * use drm_dev_unplug() instead of drm_dev_unregister(). The driver must protect
 * regions that is accessing device resources to prevent use after they're
 * released. This is done using drm_dev_enter() and drm_dev_exit(). There is one
 * shortcoming however, drm_dev_unplug() marks the drm_device as unplugged before
 * drm_atomic_helper_shutdown() is called. This means that if the disable code
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * paths are protected, they will not run on regular driver module unload,
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * possibly leaving the hardware enabled.
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

> 
> Look like call pm_runtime_put() here to let runtime pm management clks.
> 
> otherwise, runtime pm state will not match clock enable/disable state.
> 
>> +	dev_dbg(dprc->dev, "disable at boot\n");
>> +}


-- 
Regards,
Liu Ying
