Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A0AAF8D51
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE96C10E9AA;
	Fri,  4 Jul 2025 09:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="PnkxUtl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADD610E9B4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/ZN2Fo9a4LfPKZFOt9Qco1lawnY1rw9Xl1RK1nwKJoowLujTBa1QTMVUUotiWBZ+S8gJWXlZxCgbzHOnMs8FD5BFXTgh2Ikd/s/Xm+FKDj4+cuef7Si0fy3lAINsair42egvt6LYOpL3uAWZS0zUYGCpXApYupFD+tBNqo7Ck2Bgn8X9PHLu2NYMbX2h4fDZyyonLvEz6IN/s8bPTBVzbrA/s22G5tWlWBz+qHUnN7z8Z3mXldA2zc4aybKo7vN8STj4kIyeThJMFRYNH1uJeWFQOqyFJwDQNyb+yDW6bE0Z5UPIBr6EEi5fFTCaJv1tSzIteEZEYmH/WJeSbZtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEmLwuzcmbIUFGwUYzV6+18dAYZHcikYN/bp9cdlSIo=;
 b=b9PuMBMvt9ul7z61VvZIZ+0uQh6YM/Z5QxFaYvekrJoCll+rEtiv9h9LW4w7DrSOK9U8uk3FncPMSdxbk8NmDRm3LMsvX7EobUkieVthPDbMYMjEVIhweBLIw0Tcaz4mAbnzrP9XaXqzvsDvsUTeEFjtNvA81XOE+iAOxE0ZC49N+Vn/Aibeg8AiHFy0TKdo11ps72pLhixX3491N6/7+gLGEC2vTGhUH4G+36W8AoDc+g9jP+zOufW4lFukftwc19dE4o7dwQpjZ3z0RV3UQ0f4kkjl3x76zSSrUBQZrDQoZyQ9e8pDkjtdOIHDJUPy/gi7Y9U0OmusavAzcJtejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEmLwuzcmbIUFGwUYzV6+18dAYZHcikYN/bp9cdlSIo=;
 b=PnkxUtl/LjgRMPgdStC70FUt1Axas72875mHqpENDVyp8WZzsvCABBV+Je1eQMC1Z1ZqLT2bngSWf4jEMObeylZkWi229sd+v+ViUsKkRy9nH72Ynvb85XRmakD8iGAtQoSUdtr/bnYIVIyIfxlbfu7rEjMTbHwqZCEX359KjBZfszNDnC1yFeFRuOZ54dG3+7j73JN32LWwABcEOtcOmD5erRuLLQWzXfQwXCTgtsiTPXLBkB8eReaRZYI9Cg+i4eNM/jC9EhUKdSOHW8YSr/kR0OXfwXYgcUW0C27HkLkzMNFF9wj61x2R3Z6g/A2GgI3H0l4VQkyF25sSotOIgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:03:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:33 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:54 +0800
Subject: [PATCH 07/14] drm/imx: dc: Add DPR channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-7-784c03fd645f@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 059875ea-0ff2-4b67-2c76-08ddbad9a6ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q25ERCtMYmxtU29ZMjU4dVZYOWdJd1hSMFJjaVlTNk5CVm9yTGt5Z2dOVmps?=
 =?utf-8?B?cER5Mm9CNlN6WGFPdk5Ed3l5RmQyK2dLUU5zMXM3c3BKTGRPUWgrOFpJTndi?=
 =?utf-8?B?amV6TWQvYnhhZ3hJc1ZaNXBTajBvM3RHR1FISzFkSTF6YWR0MytpS24yYVFJ?=
 =?utf-8?B?bENpbWpMZlJ0TVJUQ21Nb2xvS3ZjTW9hQ3oyZUFDd05XNXEvYTNvL2tNMnNO?=
 =?utf-8?B?d3IyOGNjbFkzd29ROENaZkdxV0ZCMUh4WUg5QVlFTTl0dEJjUG9RMU5lOFlj?=
 =?utf-8?B?bDZaZHc2YkVtNUtDNXQyUXpqTDZjMGJVWmlTOGU4Tnl3eXljVSsxbVUxWmdH?=
 =?utf-8?B?UnErNEViZ1pFZU9OYStlbUExbzE0TkdCY0tEM1p6elpwV3hkOHJ3elpvOXA3?=
 =?utf-8?B?K0R6RXg0WExJN1dTaXd1QUhVMlVXQzBYLzhncEhULzhWU1NCTnRzd2ZTN2hy?=
 =?utf-8?B?U2o5NU9BeEp5YTV2WEN0TWhEWFFmQ0hSRCsxQmlmWFVmT0VzVkREdXFvL1hH?=
 =?utf-8?B?T3hxOURTWTdmUkNMUDFQcXJsUTBWMUp4K1Zvc01mWjJqclBPNlRkeWFiLzZQ?=
 =?utf-8?B?MlBzZ1F1V3ZMRjAzREFLNGFzNzhZZWhPdHlWL0s5M2FnbG5aaGFKSXJkRHFG?=
 =?utf-8?B?b0tpdEFGNVVmWW5oNXNBUUcrUkNkdG9jckJtdVc1QVRYakJtUjY0cVVWQjZr?=
 =?utf-8?B?bEhUakhTa0ZLQkF4d3dYRmJZQTdWMHFiWm5xSkdBSmp0OUtaWC9BQTZQV3RG?=
 =?utf-8?B?Zit0cVJWUGVZMTVIUEFiY1FXd0ZrVEFYdG14S08zTGtEazF4OVNtOThsSkpK?=
 =?utf-8?B?VEJZcHpJZ2d3d05rN1g2MkV0K0ZiNXUxWWliWnBSMXVOQVlsdGcxTEtPb3VF?=
 =?utf-8?B?UmJKc0FmSUNjWmZzdjdCc0ZQSzJOcGE0V2p4bUZJMnkyNzZlSTMxSW93cDR5?=
 =?utf-8?B?Tm9NYjNoc015SDRGcnBPNmhlRVpXZEpGZ3hrMlRIVTFUL0xjUDNYTUpld3E3?=
 =?utf-8?B?emVIQlNCRWFjNFdXY1gyMm9TUm8wN25Ed2xrTW1JVU9TbnB4bW16RmhNQ3cy?=
 =?utf-8?B?M2ZOVlN0dVlSbjhhRG5hL0pjaFVucUVIZThqcFljR0J5cVFHc0U5WmpQcnB6?=
 =?utf-8?B?bWpxTFBUM2xiTDRuMXJ0SUh4cHVXbHVCWkRlZGYrRXNlbitKRldTaEprbTJm?=
 =?utf-8?B?YlNpbDBGdVNCTktVWCtsNitKNkVVV0hJempiYVlQWXRLMkJFK05EMDU5Nllp?=
 =?utf-8?B?dDJ0elA1NHNWTjBPNVBQOGZPeTMrZFJvZnNhdG4xU0RRRnVuZnFnNDNGTzNX?=
 =?utf-8?B?SkpEZnUrdzdFTy9Bdk1pSmltMXpyOHZnK0tJOW1OMWcwNUJWb2hOdG9ncXlG?=
 =?utf-8?B?TG9iMXZSNDAyb0lRT3NvTVFBcjVOVk9JMU8wTVJMaGxPekFJVlhjY1U2aTR1?=
 =?utf-8?B?dmR6bi82NjRSSWRTMXVJa1Z5MWpkdTZhSG1SeUdISVJuNnFGWlhIRzNkSTNZ?=
 =?utf-8?B?c1hjMlVieE9VSkZDK3ZpVWFBYkxwTFArYkMrRHVGR3NudXphSnNYYWpRQUZx?=
 =?utf-8?B?WmNqRkQ5TFlSeGNIVUd3OUZpV2h0NnAvLzRhb0NLa2xJdVdrNStCOGxuYjRk?=
 =?utf-8?B?RVl4K2IzbzZVWUMyVXFKUGJhcS9rV3YzV2JndnJpcDVCV3JwS0J0L0lnd0Uv?=
 =?utf-8?B?Z05COHZLNld0TDdNK2VDa0RJWkVwNkZnZ1Vzbi9UMlY4SUxackFKYjk3ZTVV?=
 =?utf-8?B?YUZodVAvNUc3Y3RzYkJQdXp2TzhWS3BGOTQ4YUk1SXFRbERYdXdoc0U4bHJK?=
 =?utf-8?B?d1QvZUk5bi9NKzd2Ky9TOXhJb1J4K1BFSnc4SExSK3dKL05pTmYweWNtN0Vz?=
 =?utf-8?B?T1NaalBGbExDV0tjR3Q2T3pvS3RMdWNPUU1LeXY4TktPSDRCUEVHd25OQVZ6?=
 =?utf-8?B?c0w1eTkxNWNXVFhCSGRFR0lvelowMFh4VklhOHhweUwzcTVRc0RYSm45cWZ3?=
 =?utf-8?Q?YrGEfZMIQmq5c5hgA9pjUG4TIPbyLg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkZHbjdDT2EvN0phczFrWFB3VDgvdFBrdGFvdWhpVEpLQW5ZTFA4UTZXbDBE?=
 =?utf-8?B?RnE2bk9zZmxROElmd0RqRDhFQm9mU3pRS3VTUjhpNjRHVE1lZFNWN2F2RUpF?=
 =?utf-8?B?Mzk4QmdqYlMxVG5SYlRHblVIRU5FSFYxYWRMQmJ3NHFOT2hJSTVlTmh1NERP?=
 =?utf-8?B?VXJkckFwMzU0UzhaUGRwZmZUU3IrS0Rjak1xQnNCOUNqK2JLVk5PYnZyemN6?=
 =?utf-8?B?emJrdnNBWFlZSGR3cG1XcGdxSFpOQU5MNUIzQ0JQUmhJSmdWN1JlN3JSR21w?=
 =?utf-8?B?aTNHNW1XZE5MY2Jtek9qaUF3MEx5WkZPTEZuSWx5Y3BuZ1I1V3Urc1NQN0p0?=
 =?utf-8?B?eUc0bXFoZi9KWk01SkNlNFpXSUdDTCtMZ214OEFDa1VBUFNyRmZjbVlGeTZ3?=
 =?utf-8?B?MW5HM2wvd1h6cmxFN3BoNjlwa1NsWVBWaVB0NmowMzBkWldIa2dsU3hBcytZ?=
 =?utf-8?B?NElJMjNENjliY29MSzZ0d1cvWW9CNnBQdTFnajBadCswTktyL0NwYXZIazkv?=
 =?utf-8?B?T3pMS3FmQkw4YW5MejJ0RHkrMU9WV1VRcmc1R05lZTVRb3gxeDNPaThBMEVw?=
 =?utf-8?B?Nzg3MG41Nyt3QkNXMThNMzdpUXYxWStyMmZCL2REWUo1OWJNVm51SXVCY09O?=
 =?utf-8?B?RDQ1L0hpa1ltVUVhYnJoLzJzL0ltUlczU2wyK3l1dm9rcCt1NjVFRFdWbUQr?=
 =?utf-8?B?bWNIMXU5aHVsdDhlVnIrKy9ZYy9DOWNyQUZUUktza3NTZTZkQURXQkVIbmFL?=
 =?utf-8?B?bTl3cFkzRlhOa3kzNUM3aElsYTNNL3N2cUJQRXdRT2pKMWVTS3c2WG90M3o1?=
 =?utf-8?B?TzNKd01KWWV0SWdJNVhxNjVDVHMzWjhyM0NWUTRvSWtpNm10WkttMWpLVURG?=
 =?utf-8?B?U2o4eG9XWi82NHdLR2hLdUt4OWp0ZWtXN1BoR08wVEI0R1pPUzVCVWVSTnNa?=
 =?utf-8?B?d3hXN1pmU1dRUHI4RERVU1pnYm1td2VkWm91UWFHS081UG5wT3pwZnNSRWFH?=
 =?utf-8?B?Y204eE1ZbUxXZ3EwaDFDemRKQkhKWlZLNnhrZ2VpSDlSV1E3VmVadzgvaXpv?=
 =?utf-8?B?UERVdEpUNjJCUDNZWUdna1FlRUkzZTBGWEMwUm54WW0rUUVYOCtjaUlpNGNr?=
 =?utf-8?B?c0VvclVvWitZMWhwWUFhVGtoTEl4ZGRuSTQ4MGJUZVo1eGhidVhVYVlVZUVW?=
 =?utf-8?B?SWVTcFJ3TGN3RzVsVVFobUhzN043ZWZkU0VvQytWempNb3E4emQ3ai83YzND?=
 =?utf-8?B?cFpzMFhuWElhSFF1Q1IwYlVtbFByT0RXVm9xa1hXSVhHUHRDZFpGOVZBR0ZJ?=
 =?utf-8?B?MjM5WERYbUhjdFBKTllvbUNobVdQRUFFY1U5RWliMzlYSEdhSlJZKytRb0Nu?=
 =?utf-8?B?Z2s1czg5SHNlenIvQ1ZXMnQ3NUdSY2pTNmx2L1cwcm83Ni9TSWJhYjVianp4?=
 =?utf-8?B?UzJuNGpSZ2pRanNpOVZ3eFpaZndEbXBlbzZVN1JzcWdlbTBpYndpUlZ4bXRl?=
 =?utf-8?B?YzVwelhzQ2hSR09IL2VPVkZFZDJ1TU1vaU5NWUZvRVkySlRmbVlZV09tOG9J?=
 =?utf-8?B?Tm5KMVB5aTZLcmdmbm5meFFFS3M1RUxtR1FBVkh1eCs2aEtQK3pqV1VNbG1z?=
 =?utf-8?B?MHNvMzJiN242ak9YU1dNais3L2V1NUxocmpmeithaDhtTHZMREJmeHJjTm5J?=
 =?utf-8?B?VDYvYUF6ejloTDdldmYyZ2Iyd1hDalFnbVhuQzFkREM5WlNGYjY5UUJEM0lM?=
 =?utf-8?B?NFZHaitSQ1pBM3daN21GRkV4RWRJckFLT2xjR2dBM1NiN3gxeGFiRDJMTVJL?=
 =?utf-8?B?cVRwN1dvQUlRMUdNM0U2Z0VBRGRUM1ZMTWhtS1pPVUl4M2IxVDJpcXJ3WUs2?=
 =?utf-8?B?ekcwbjBSQmNwUmdaaEM1emZENWN3bzdZaVQrU3B5MWtTVDBGbDRHaG5kdDl0?=
 =?utf-8?B?aXJJYlJ2Rjd6UTdGWUsvVVpNUm9jUW5UNjNRUWJkVk9mS0hZOXA5a2Fvdi9s?=
 =?utf-8?B?VFd3ZzlSb2FMNy9XbUoyR21uZ0JGc093cmFORHNSS2JHZHk0blFrRGw1c0tT?=
 =?utf-8?B?d2YxSVY4VTlFdHMycUJ3eWhoeHlNdWUxOG9iU1p4bm4vek5sZnp6d0w2UHda?=
 =?utf-8?Q?KKesHwib9DrQmalNa7RON3yWO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059875ea-0ff2-4b67-2c76-08ddbad9a6ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:32.9619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g32ymtankRLtjrdTUrGu5waXJuXVHOxdOpfJozzUYD9AaXBGYRC41/lb8If+wtos4oQEZO0n8c3+z5/lX8TlGw==
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

Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
It fetches display data, transforms it to linear format and stores it
to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
a gasket between the RTRAM controller and a FetchUnit.  Add a platform
driver to support the DPRC.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/Kconfig   |   1 +
 drivers/gpu/drm/imx/dc/Makefile  |   6 +-
 drivers/gpu/drm/imx/dc/dc-dprc.c | 499 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
 drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
 drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
 8 files changed, 556 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 415993207f2e3487f09602050fa9284fd0955cc7..507dc9a92d96be225cd9b10968a037dad286b327 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	depends on IMX_SCU
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf..fd5d62783971d575cf18d3e27d742d91dee7623e 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
-		    dc-plane.o dc-tc.o
+imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-dprc.o dc-drv.o dc-ed.o \
+		    dc-fg.o dc-fl.o dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o \
+		    dc-pe.o dc-prg.o dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.c b/drivers/gpu/drm/imx/dc/dc-dprc.c
new file mode 100644
index 0000000000000000000000000000000000000000..5c0c1032ec1bbb7cc2bbc6484ee15db95fc89bc8
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#include "dc-dprc.h"
+#include "dc-prg.h"
+
+#define SET					0x4
+#define CLR					0x8
+#define TOG					0xc
+
+#define SYSTEM_CTRL0				0x00
+#define  SW_SHADOW_LOAD_SEL			BIT(4)
+#define  SHADOW_LOAD_EN				BIT(3)
+#define  REPEAT_EN				BIT(2)
+#define  SOFT_RESET				BIT(1)
+#define  RUN_EN					BIT(0)	/* self-clearing */
+
+#define IRQ_MASK				0x20
+#define IRQ_MASK_STATUS				0x30
+#define IRQ_NONMASK_STATUS			0x40
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR	BIT(7)
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR	BIT(6)
+#define  DPR2RTR_UV_FIFO_OVFL			BIT(5)
+#define  DPR2RTR_YRGB_FIFO_OVFL			BIT(4)
+#define  IRQ_AXI_READ_ERROR			BIT(3)
+#define  IRQ_DPR_SHADOW_LOADED_MASK		BIT(2)
+#define  IRQ_DPR_RUN				BIT(1)
+#define  IRQ_DPR_CRTL_DONE			BIT(0)
+#define  IRQ_CTRL_MASK				GENMASK(2, 0)
+
+#define MODE_CTRL0				0x50
+#define  A_COMP_SEL(byte)			FIELD_PREP(GENMASK(17, 16), (byte))
+#define  R_COMP_SEL(byte)			FIELD_PREP(GENMASK(15, 14), (byte))
+#define  G_COMP_SEL(byte)			FIELD_PREP(GENMASK(13, 12), (byte))
+#define  B_COMP_SEL(byte)			FIELD_PREP(GENMASK(11, 10), (byte))
+#define  PIX_SIZE_32BIT				FIELD_PREP(GENMASK(7, 6), 0x2)
+#define  LINE4					BIT(1)
+#define  BUF2					0
+
+#define FRAME_CTRL0				0x70
+#define  PITCH(n)				FIELD_PREP(GENMASK(31, 16), (n))
+
+#define FRAME_1P_CTRL0				0x90
+#define FRAME_2P_CTRL0				0xe0
+#define  MAX_BYTES_PREQ_MASK			GENMASK(2, 0)
+#define  BYTE_1K				FIELD_PREP(MAX_BYTES_PREQ_MASK, 0x4)
+
+#define FRAME_1P_PIX_X_CTRL			0xa0
+#define  NUM_X_PIX_WIDE(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_PIX_Y_CTRL			0xb0
+#define  NUM_Y_PIX_HIGH(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_BASE_ADDR_CTRL0		0xc0
+
+#define FRAME_PIX_X_ULC_CTRL			0xf0
+#define  CROP_ULC_X(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_PIX_Y_ULC_CTRL			0x100
+#define  CROP_ULC_Y(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_2P_BASE_ADDR_CTRL0		0x110
+
+#define STATUS_CTRL0				0x130
+#define STATUS_CTRL1				0x140
+
+#define RTRAM_CTRL0				0x200
+#define  THRES_LOW(n)				FIELD_PREP(GENMASK(6, 4), (n))
+#define  THRES_HIGH(n)				FIELD_PREP(GENMASK(3, 1), (n))
+
+#define DPU_DRPC_MAX_STRIDE			0x10000
+#define DPU_DPRC_MAX_RTRAM_WIDTH		2880
+
+struct dc_dprc {
+	struct device *dev;
+	struct regmap *reg;
+	struct clk *clk_apb;
+	struct clk *clk_b;
+	struct clk *clk_rtram;
+	struct imx_sc_ipc *ipc_handle;
+	spinlock_t lock;	/* protect IRQ registers */
+	u32 sc_resource;
+	struct dc_prg *prg;
+};
+
+static const struct regmap_range dc_dprc_regmap_write_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK + TOG),
+	regmap_reg_range(IRQ_NONMASK_STATUS, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL0 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_range dc_dprc_regmap_read_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK_STATUS + TOG),
+	regmap_reg_range(MODE_CTRL0, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL1 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_write_table = {
+	.yes_ranges = dc_dprc_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_write_ranges),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_read_table = {
+	.yes_ranges = dc_dprc_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_read_ranges),
+};
+
+static const struct regmap_config dc_dprc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_dprc_regmap_write_table,
+	.rd_table = &dc_dprc_regmap_read_table,
+	.max_register = RTRAM_CTRL0 + TOG,
+};
+
+static void dc_dprc_set_stream_id(struct dc_dprc *dprc, unsigned int stream_id)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(dprc->ipc_handle, dprc->sc_resource,
+				      IMX_SC_C_KACHUNK_SEL, stream_id);
+	if (ret)
+		dev_err(dprc->dev, "failed to set KACHUNK_SEL: %d\n", ret);
+}
+
+static void dc_dprc_reset(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
+	fsleep(20);
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
+	fsleep(20);
+}
+
+static void dc_dprc_enable(struct dc_dprc *dprc)
+{
+	dc_prg_enable(dprc->prg);
+}
+
+static void dc_dprc_reg_update(struct dc_dprc *dprc)
+{
+	dc_prg_reg_update(dprc->prg);
+}
+
+static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
+{
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
+}
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+	unsigned int bpp = format->cpp[0] * 8;
+	struct device *dev = dprc->dev;
+	unsigned int p1_w, p1_h;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+
+		dc_dprc_set_stream_id(dprc, stream_id);
+	}
+
+	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
+	p1_h = round_up(height, 4);
+
+	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
+	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
+	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
+	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
+	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
+	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
+	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
+
+	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
+
+	val = LINE4 | BUF2;
+	switch (format->format) {
+	case DRM_FORMAT_XRGB8888:
+		/*
+		 * It turns out pixel components are mapped directly
+		 * without position change via DPR processing with
+		 * the following color component configurations.
+		 * Leave the pixel format to be handled by the
+		 * display controllers.
+		 */
+		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
+		       G_COMP_SEL(1) | B_COMP_SEL(0);
+		val |= PIX_SIZE_32BIT;
+		break;
+	default:
+		dev_err(dev, "unsupported format 0x%08x\n", format->format);
+		return;
+	}
+	regmap_write(dprc->reg, MODE_CTRL0, val);
+
+	if (start) {
+		/* software shadow load for the first frame */
+		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+
+		/* and then, run... */
+		val |= RUN_EN | REPEAT_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+	}
+
+	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
+
+	dc_dprc_enable(dprc);
+
+	dc_dprc_reg_update(dprc);
+
+	if (start)
+		dc_dprc_enable_ctrl_done_irq(dprc);
+
+	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
+		width, height, stride, format->format);
+}
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
+	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
+}
+
+void dc_dprc_disable(struct dc_dprc *dprc)
+{
+	dc_prg_disable(dprc->prg);
+
+	pm_runtime_put(dprc->dev);
+
+	dev_dbg(dprc->dev, "disable\n");
+}
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
+{
+	dc_prg_disable_at_boot(dprc->prg);
+
+	clk_disable_unprepare(dprc->clk_rtram);
+	clk_disable_unprepare(dprc->clk_b);
+	clk_disable_unprepare(dprc->clk_apb);
+
+	dev_dbg(dprc->dev, "disable at boot\n");
+}
+
+static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
+
+	dc_prg_shadow_enable(dprc->prg);
+
+	dev_dbg(dprc->dev, "CTRL done handle\n");
+}
+
+static irqreturn_t dc_dprc_wrap_irq_handler(int irq, void *data)
+{
+	struct dc_dprc *dprc = data;
+	struct device *dev = dprc->dev;
+	u32 mask, status;
+
+	scoped_guard(spinlock, &dprc->lock) {
+		/* cache valid IRQ status */
+		regmap_read(dprc->reg, IRQ_MASK, &mask);
+		regmap_read(dprc->reg, IRQ_MASK_STATUS, &status);
+		status &= ~mask;
+
+		/* mask the IRQ(s) being handled */
+		regmap_write(dprc->reg, IRQ_MASK + SET, status);
+
+		/* clear status register */
+		regmap_write(dprc->reg, IRQ_MASK_STATUS, status);
+	}
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load UV buffer ready error\n");
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load YRGB buffer ready error\n");
+
+	if (status & DPR2RTR_UV_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO UV FIFO overflow\n");
+
+	if (status & DPR2RTR_YRGB_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO YRGB FIFO overflow\n");
+
+	if (status & IRQ_AXI_READ_ERROR)
+		dev_err(dev, "AXI read error\n");
+
+	if (status & IRQ_DPR_CRTL_DONE)
+		dc_dprc_ctrl_done_handle(dprc);
+
+	return IRQ_HANDLED;
+}
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width)
+{
+	return width <= DPU_DPRC_MAX_RTRAM_WIDTH;
+}
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+
+	if (stride > DPU_DRPC_MAX_STRIDE)
+		return false;
+
+	if (!dc_prg_stride_supported(dprc->prg, prg_stride, baddr))
+		return false;
+
+	return true;
+}
+
+static int dc_dprc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *res;
+	void __iomem *base;
+	struct dc_dprc *dprc;
+	int ret, wrap_irq;
+
+	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
+	if (!dprc)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&dprc->ipc_handle);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
+	if (IS_ERR(dprc->reg))
+		return PTR_ERR(dprc->reg);
+
+	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
+	if (wrap_irq < 0)
+		return -ENODEV;
+
+	dprc->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(dprc->clk_apb))
+		return dev_err_probe(dev, PTR_ERR(dprc->clk_apb),
+				     "failed to get APB clock\n");
+
+	dprc->clk_b = devm_clk_get(dev, "b");
+	if (IS_ERR(dprc->clk_b))
+		return dev_err_probe(dev, PTR_ERR(dprc->clk_b),
+				     "failed to get B clock\n");
+
+	dprc->clk_rtram = devm_clk_get(dev, "rtram");
+	if (IS_ERR(dprc->clk_rtram))
+		return dev_err_probe(dev, PTR_ERR(dprc->clk_rtram),
+				     "failed to get RTRAM clock\n");
+
+	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
+	if (ret) {
+		dev_err(dev, "failed to get SC resource %d\n", ret);
+		return ret;
+	}
+
+	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
+	if (!dprc->prg)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	dc_prg_set_dprc(dprc->prg, dprc);
+
+	dprc->dev = dev;
+	spin_lock_init(&dprc->lock);
+
+	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
+			       IRQF_SHARED, dev_name(dev), dprc);
+	if (ret < 0) {
+		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
+			wrap_irq, ret);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, dprc);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	return 0;
+}
+
+static int dc_dprc_runtime_suspend(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dprc->clk_rtram);
+	clk_disable_unprepare(dprc->clk_b);
+	clk_disable_unprepare(dprc->clk_apb);
+
+	return 0;
+}
+
+static int dc_dprc_runtime_resume(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(dprc->clk_apb);
+	if (ret) {
+		dev_err(dev, "failed to enable APB clock: %d\n", ret);
+		goto err1;
+	}
+
+	ret = clk_prepare_enable(dprc->clk_b);
+	if (ret) {
+		dev_err(dev, "failed to enable B clock: %d\n", ret);
+		goto err2;
+	}
+
+	ret = clk_prepare_enable(dprc->clk_rtram);
+	if (ret) {
+		dev_err(dev, "failed to enable RTRAM clock: %d\n", ret);
+		goto err3;
+	}
+
+	dc_dprc_reset(dprc);
+
+	/* disable all control IRQs and enable all error IRQs */
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
+
+	return 0;
+err3:
+	clk_disable_unprepare(dprc->clk_b);
+err2:
+	clk_disable_unprepare(dprc->clk_apb);
+err1:
+	return ret;
+}
+
+static const struct dev_pm_ops dc_dprc_pm_ops = {
+	RUNTIME_PM_OPS(dc_dprc_runtime_suspend, dc_dprc_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_dprc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dpr-channel", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_dprc_driver = {
+	.probe = dc_dprc_probe,
+	.driver = {
+		.name = "imx8-dc-dpr-channel",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_dprc_dt_ids,
+		.pm = pm_ptr(&dc_dprc_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.h b/drivers/gpu/drm/imx/dc/dc-dprc.h
new file mode 100644
index 0000000000000000000000000000000000000000..f977858b57fec2f19775a97dc0baf011ca177c0b
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_DPRC_H__
+#define __DC_DPRC_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+struct dc_dprc;
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start);
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc);
+
+void dc_dprc_disable(struct dc_dprc *dprc);
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc);
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width);
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f..17b9c4d0953d46be0a2cd276f06298d848fdcbdd 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -269,6 +269,7 @@ static struct platform_driver dc_driver = {
 static struct platform_driver * const dc_drivers[] = {
 	&dc_cf_driver,
 	&dc_de_driver,
+	&dc_dprc_driver,
 	&dc_ed_driver,
 	&dc_fg_driver,
 	&dc_fl_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 557e7d90e4ea8ca2af59027b3152163cf7f9a618..93a8ce4e7c314770b64ccb631628b7e79648c791 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -74,6 +74,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
 
 extern struct platform_driver dc_cf_driver;
 extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_dprc_driver;
 extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
index 9a1a312c0aeebf47bcf50ffa77971aa3bb431a12..bb6c47133e90f9bc5eb3fb0e30c3f338ec82213b 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.c
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -19,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "dc-dprc.h"
 #include "dc-prg.h"
 
 #define SET			0x4
@@ -63,6 +64,7 @@ struct dc_prg {
 	struct list_head list;
 	struct clk *clk_apb;
 	struct clk *clk_rtram;
+	struct dc_dprc *dprc;
 };
 
 static DEFINE_MUTEX(dc_prg_list_mutex);
@@ -217,6 +219,16 @@ dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
 	return NULL;
 }
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
+{
+	prg->dprc = dprc;
+}
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
+{
+	return prg->dprc;
+}
+
 static int dc_prg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.h
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
 struct dc_prg *
 dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
+
 #endif

-- 
2.34.1

