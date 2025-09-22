Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4FB8ED68
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 05:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4626210E394;
	Mon, 22 Sep 2025 03:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="g9L8dlsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011029.outbound.protection.outlook.com
 [40.107.130.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAC610E394
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/9W32kVY+ANeNWKGTY/jPnqIURpZtS/Mx8lJ1UPEVoSikmn5y8PqC1SVsSz5EHLl62C/VYJP2jI3O7qMJQcRFxpcrs3moDUELRNZ7un2PpJmqlKobrRwc+9T6p3kcYbA57kHJcBuVapfhwFC1V+FMf8Uj7WQP90SVMoGVaiOYokrx4YMs2VqasDhzBLUVFxZl3wwuCVqMitE/0lGTHmQRpRHo9Itt1bjHWJ4kkt16Kdyg+vg1RPo/xC8QLTKlJHOL4cmOvE6TGQqfeInFLuGZjhleO+VIvMLUIAOcPnm8f76t8nlzxURWxlaPBhoUDgzHqwNBC7a8QsNGK70j8FQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuqAQpfJdFKTrx5XgEW5Kh+/GVcrv99UnfIxlifog3g=;
 b=jmu8/8UX/SyKAic7T/amJUf4XUNp97N1Hfg+npGo0PcrepZSsMlQbrdU+VEMeVGX6oLJGS2BhBp369CvqmQyAVAtEgQNilvdI+2KWT2sZrwQBuH61tu2QDr+wbXZuIpNkrQqj9ZNtNLkJqtqnUIDqoE19CjMbjPLa6Vhf/4o0cNziuqNgdtFdprkAjaYzHqKLpps6OMR0sZw6kr1sWbzjiltU/N4uA7A1C26I9eNq3KiOmolJo+YOfFqtz0jW/B7KDOZOPqd9cftRJ4+FKYZL4oP8j6OWRYGr9ixBSfkU/1b1XfIEKPMOfNECjoeB5fy1AWU5bVyU0lrTgtBmFOCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuqAQpfJdFKTrx5XgEW5Kh+/GVcrv99UnfIxlifog3g=;
 b=g9L8dlskBYCdYVpgdgEz1hMxom4oqRamnThEKhKdb3g1DZA3NF4VUk0DKptbZV9s3baQRfvABrgZNTuKyCFi7gaXIIZ/FPPbJzed+2hJ+KO+vLcjHMJHHHVw5DZZVx+nUJtixEkMpNVcHsobjJV8QFEisyfVA9VvTySYeBuSMDo7sj8ZhxIEqIRfj2dAQwI+eOqYlz85yfb0e9A0R7eYN03v9zxQeadQznAe/JhF69GuWvrbolp1Q6eu0g6E8N7e9F/a9M6WxS1cQxznYOEw4l7Ru2PsNwDS/GD0cQThLrVLI6nA2qdPxS0qCdzN5klEGZ37UdQNlcCBpRm62dhIoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7881.eurprd04.prod.outlook.com (2603:10a6:10:1ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 03:01:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 03:01:09 +0000
Message-ID: <97288c51-954a-48a9-92b9-e165ce480707@nxp.com>
Date: Mon, 22 Sep 2025 11:02:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 dianders@chromium.org, cristian.ciocaltea@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat>
 <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1423da-3270-4241-ed6f-08ddf9844781
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlJOL052R3YzL3hhVjh3ZUxxUUFtUkcrZExlYUR2Y2U5QW5GRXJBMTZ1eUFH?=
 =?utf-8?B?OFdMYWhlWUQ2b0ZrZXhJbXR0WjEwMEl0aUZ1RDBac083RVR6cFhYbndyb0hO?=
 =?utf-8?B?QjdwTXAwbTV3cElEeCtZYVc0ZW9mQ0J3MHhnYUlxZWhnc2NxZXpIdENERWRE?=
 =?utf-8?B?Q3NKS3piUGxZcGZtUC9mOVoxcnBySkdVMkZSSHJFVXJlUnovQkU5QyszUHNV?=
 =?utf-8?B?L1dBZ2hnL3NBVXlpZnJhMHJ6STQxb3NUNzhWVU9yV0ZGZjlpNzhqZVRSK1BS?=
 =?utf-8?B?TCtCVnhENzl4dkE5TmI4bjlPQ3lVa2tQakJiOUl4V3RhM1B3amFlY1JoaDNI?=
 =?utf-8?B?eW13ZTJyMlR6Wi80RGp1aTc5MjU1UlZzVkhnZDhVSXRMYzVqMnc1ZEV2Zm4r?=
 =?utf-8?B?YzR3MXhta2ZzZ29Pa2xrVHN4VGFxaERqNHNLTXI2OEF4VitQWE13eGordHhQ?=
 =?utf-8?B?UGQ3MlZPd0JIY1d0K2ZRRTdBUnBpRUhJV1pJRUxZdkRZMkRKV0dpQmtSY3pR?=
 =?utf-8?B?dWYxUlBXcE9ScFhVSklEK3ZLU0VZcVVuWndOajNzNEYyMGpZZHlkUU5oWHpR?=
 =?utf-8?B?NzRNcWVFT2g0cVNaM1ZRZ0tLUEVWRVNlY3lnZ1NyZFM4eWM4Y3pZVmFNclJL?=
 =?utf-8?B?bEZySjdUZ0Iwa3NwcForQ3dweW5kVklnY0V4SXhRMnY5Ung5bWw2ek9wVXRy?=
 =?utf-8?B?V2l3aWJBK21YcHc0Znk2cE85YkNpVE15MG95TVpYSjVZOWU2RDQvUDZqSUJ4?=
 =?utf-8?B?RHl0bFBVY2dTUjZFYjlyN0xPajkvUXA4M0ZnanNMY0wrbUJLQVhEU2tvRzFW?=
 =?utf-8?B?Y3BVY0NIaDFtMTF6NUtlcGRWR1BNWE5aMXZWTXRvSGk4Ty8raSt6aGlpZEFU?=
 =?utf-8?B?TWwweG5zZE95dTZYRjRGSEZvaDdHN1VjRVUrTzFheUU1djlLOEpoa2RnUGxU?=
 =?utf-8?B?aVZtSSs5NnFZWWFGeXgyd1hPZ3UvdjNqQ2pxS2gvMlRwMFpnTWVIN2V0b1Er?=
 =?utf-8?B?Y293dkZ3M3hUNnRzUzc1ZXVVaDNUNmFKV1ovRlhZK1dMTmVGQTJGZ0pIQVpw?=
 =?utf-8?B?aTNjYW83aE1vSStTMnJ2OVpadkRNNUdPS1l2bTFVODZJUlIxQlQ4L2dUT05J?=
 =?utf-8?B?S3pMajBqbk1wTzYyaEJBOEpHTzJQRGNmYVNqdmhpYWdjNTA0MjlJa3diUHFD?=
 =?utf-8?B?QzJrQTYvYXNmcURabVlpSlcraFdjR3pMN3RPY3dLbm04cnBiK0p2OVV0L2w5?=
 =?utf-8?B?ckdUOThJaFg5d1RGRlAzeG1HM1ZseFNOSnlCUEIxL0ppVGYvMVYvbm9HSW95?=
 =?utf-8?B?NUo3S3NZY1p2dnlZZzdENDlITHJEWkhObWJMR241UzRiYWhHTDAwNnV2K2Fs?=
 =?utf-8?B?a2ZKdmhXYlBBcXEyQm9aN1cwbUk0VS9iRlFIckJGbEJ0dHQxbkE2dDVxWk9v?=
 =?utf-8?B?Zlp2Mm9vTzVsaElYWTNUbEs1NldSZTlmVTl2RFVacElxZkpxTDVOWTl3dWZw?=
 =?utf-8?B?RzI4RWJwWVBsaHZPT2lPdlY3aEdmMFdaTFllcVJ4UG1MYUlXZWN5MVlxUkN6?=
 =?utf-8?B?cDJWZXhhbUl0amh2aGVIeTlWcHlSdHdxcWw3QVhkeWNXMWVKRlBZUVI0N0s0?=
 =?utf-8?B?ck9MWXNBNXVSU2dyL3plc2hlOUxRaE9tNUhaRkMrS2g5Yi9WV2plUUhIRnZQ?=
 =?utf-8?B?UWpsc1hiUVdrN0gvUDNwSVdtR1NtWjFLL1p5SHVVUHA5OGtvWmdMTktWRWcz?=
 =?utf-8?B?Z2NhaTc5Y3FyMzQ4bWd6WTJLa1FiNW1FeU1yVE5GTTU0d2ZiaXg1elFGQWg3?=
 =?utf-8?B?a0lpazYvek5NaG5oUmlVdGtTVWZUb1BEYkxRVXhPV1lZbFpFNmg3bFM4cFNF?=
 =?utf-8?B?ZVhCbzBqKzlhZE1UL1NvaXBiZytDSlVPYmkvRHRsOElLNkhGMDd5MER6RHlo?=
 =?utf-8?Q?pO18QJuiJtE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFkxb3BMTlR0ck1CUDN6TEZ2T3ZrYWgvenB2ZndvaGlhRkthOVQwYTJJRG1M?=
 =?utf-8?B?ZFI5ZisvdTRJcTNKbkhpZ3Bva1JVckpwL0ZBdURBaTQvejVTeFNJZURRUEhW?=
 =?utf-8?B?bzBOT3R5Ym9IMTMwTThmamJ2aG5Mci95akJGRlR0Nm9mcWRRMFd6SzZRTGxM?=
 =?utf-8?B?UVZxOVlzK2xZbkJKWVQxQllUV1ZhUTlsQkpIVjgvTXk1dWJQUUtLa3FyeHVV?=
 =?utf-8?B?c2ljOVNHVmJ3NlhMeDRvZkZiRVptNER6d3MyQ3ErRUVQVkVOdUtiWXlOVVcr?=
 =?utf-8?B?OFFFbTNsWEdKN1N6cXR0dys0M2lkRStXNlNucG9WQnJXcUxkWVdSVGJFMWx5?=
 =?utf-8?B?NjUydVJ6SkhaV3dDYlVyUUM0bnFUbTVjK3d4ajZOSmVMRUI0cnA1QnNNaEFV?=
 =?utf-8?B?Um5HNHJBRlUwVVJKS1lJR0NaSTJCc3J3TnZlNTRKU2w2Sm8xNGQ4OWVNdVlZ?=
 =?utf-8?B?NGpWenVscC9GVWh4bndqRkdVZ0VsUDB3TzZYTldSNVpUQ2xqSUp5QVR4Y3E0?=
 =?utf-8?B?c2pUYnFteWUwV29OOFlUNExYWUkxVWo3cEdsZll0Uk5mT3VYV2txNmNMZDBP?=
 =?utf-8?B?TWk5bFErUkU4WSs3QzkyTlNJUTZZc3JCUnRZdDIxZWJudlYybXlPRXRXSWx1?=
 =?utf-8?B?bUlaZFNZMHVNcmEzZWg1dFJUMUdLeVYvWk16UUpSdGdsN3IxNWVYVEZ3RVlC?=
 =?utf-8?B?OEJnNy9WWVoyRFAwVkY0VFRaU2l3SG5NMXk2Q2RMM1NDUVc3a2RJR3ZWUE1i?=
 =?utf-8?B?dFQvMTZYOCtsN3U3QzBlbFE4Um1xcXF6Q2NmOWFGSTcvUCtML0JjZnJ0L056?=
 =?utf-8?B?cmY5MTJ5SUFvNTh4L3lTUHdjWWM3SDZveGJURS93RUhZbkhGQVhUUkxSOVRH?=
 =?utf-8?B?R1ZaNE1BR2YySWxlVnNPUENSZVNRSkxnU1pRRFpDRjlnbEVHcm5RSXZiK05B?=
 =?utf-8?B?VEJPU251WGpoeVprV0lWd0lXZXo2L05hRnhodmljZVJPZUg2VzlRSFBZNk5m?=
 =?utf-8?B?TE9oR1RYQmtQNHFyU0RKWFg2NFI4Unk0bEtZWE5jVUFHZit6Nzl1Ykd2Y0dE?=
 =?utf-8?B?cHJrN1RjSUQrZmlYdlA4NitWa2F3RFVuNFFFU2tsL2Vqa2E0dlFjT0xuend6?=
 =?utf-8?B?MzdtVCtnRUc5VW1wTVZPd1JaMlV3bmk1VWpwd0x3SDhYeElWUkYzYUxXNGR5?=
 =?utf-8?B?TWN3SEIrSzRjcHVGSDdzcTBVczE0ZW5LOVpoOThrOE1CWnlGbURNNUw1bHJh?=
 =?utf-8?B?RDg4cm1JSkpQYk9FOEVuNkpIWnh2ZCtrbjNLYktydXJ4dkVrQ3B2czJ6M2hq?=
 =?utf-8?B?Y1drdFdFMmgvNVpYTHBIQkFaL2d2a1RtSkFxSjd5MTlNbS9KMUUwN1RFSWEr?=
 =?utf-8?B?STZGNDJlb2NNdW1aOFQ4cDlVV1NGbXBlVlVKWVR4RmlPQ3ZGN3JwQVdVU3pV?=
 =?utf-8?B?NTNvdEFUTDR1Z0VER0hMbitxOXZHSUI5S1JHVjZNYlBhQTVpc24vTFoxR2pC?=
 =?utf-8?B?c3NTSHdkWUwweVBHS2grbG1NS1dHZnd2WTV5Rm82YzhobVU4YmhrNkpFaUlS?=
 =?utf-8?B?cHFUV1JRY0NTYUg1cWZMMTV6NGdvdEgrUmVjb2tiN01qRTVMcjRPVWxxUmMz?=
 =?utf-8?B?ajJyYXFxNnl3elZ1ZmRyTllCTVlObVVWUHk3dVl0Y0FrRU13cVl6aXNwOFkw?=
 =?utf-8?B?cUhBNjVxbmptY2J3Q21lMHlLYUhDR3pxU0Z0TUF0Tld4ZHhEZVFDYzVMY3NN?=
 =?utf-8?B?R0xnMGVVUGRRZEFFdTZpZjhLdktpWDR2b0ZwZEV4TG1KRDM3WVJwS245Znd1?=
 =?utf-8?B?cEdzb0h4dXRqSzJHQkdxVlVSMU84eXg2MnJuR0NkRFdjdHA5aUhhKzhEa3JQ?=
 =?utf-8?B?Q2ZOVHpTWGxjcVErNDhjNFNab3FTeENSNDJTVStvekNJNC8xZ3FxUU9MV2pF?=
 =?utf-8?B?SnpPY0lFbEtPNUJ5aWNYMldWTlQrTGdVeVdvZGJDVzQ1dCszTXlTZ0hNNnVx?=
 =?utf-8?B?NnZyTzBWZ0JQSUNiTE5qYUpqVmx1YjBhQ0ZRU0x3K3FZbUdBR3g0NHF6TjBP?=
 =?utf-8?B?c1VDRmloTHp4alJIUk1JVndCTUR2N1dQbXB6UnhSNWZCZVNsOHJsbWljdmVl?=
 =?utf-8?Q?rT2MUrJfzHqpf4vpfaNW1UCT1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1423da-3270-4241-ed6f-08ddf9844781
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 03:01:09.0057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeY43y8Khv3viyuwManSNn+4Sf/XLJ8PhiP4KDKPYl5Jwhro/KCEIpaf7qNp1WnDqaj2ITbzPDHOOVZfcOS8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7881
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

On 09/10/2025, Shengjiu Wang wrote:
> Hi
> 
> On Tue, Sep 9, 2025 at 2:39 PM Maxime Ripard <mripard@kernel.org> wrote:
>>
>> Hi,
>>
>> On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
>>> On Tue, Sep 2, 2025 at 12:52 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>>>>
>>>> Hello Shengjiu,
>>>>
>>>> On Thu, 21 Aug 2025 15:31:28 +0800
>>>> Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>>>>
>>>>> Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio device
>>>>> driver needs IEC958 information to configure this specific setting.
>>>>>
>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>>> Acked-by: Liu Ying <victor.liu@nxp.com>
>>>>
>>>> [...]
>>>>
>>>>> +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec958)
>>>>> +{
>>>>> +     mutex_lock(&hdmi->audio_mutex);
>>>>> +     hdmi->sample_iec958 = iec958;
>>>>> +     mutex_unlock(&hdmi->audio_mutex);
>>>>> +}
>>>>
>>>> Apologies for jumping in the discussion as late as in v5, but I noticed
>>>> this patch and I was wondering whether this mutex_lock/unlock() is
>>>> really needed, as you're copying an int.
>>>
>>> Thanks for your comments.
>>>
>>> Seems it is not necessary to add mutex here. I just follow the code as
>>> other similar functions.  I will send a new version to update it.
>>
>> Let's not be smart about it. Next thing you know, someone will add
>> another field in there that would absolutely require a mutex and now
>> you're not race free anymore.
>>
>> Unless there's a real concern, the mutex must stay.
>>
> 
> Ok, thanks for comments.  Then Patch v6 need to be dropped.

To properly track the changelog with patchwork, can you send v7 to add
the mutex?

> 
> Is there any other comments for this Patch v5?
> If no, can this series be accepted?
> 
> Best regards
> Shengjiu Wang


-- 
Regards,
Liu Ying
