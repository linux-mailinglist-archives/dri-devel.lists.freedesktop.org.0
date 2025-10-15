Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1FFBDCDDC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED20C10E725;
	Wed, 15 Oct 2025 07:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gJyJMo1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83A710E269
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcZo8MCHUq6ptYqKnOaPvwA88GKL0RvyQxd5iKrE5Z0Ia3g2HQnN1lUSwEt1xcAsraMfvHMN5yIuYHhLJxcSjhFv+PfBSoBhhJbOSVkluzTPfwdnRSrGjcVwnFhTxjj41PGXQKmxjAFzqwQL7OI5AellMP1h8nvD5U+KoRCCnndq//PN/1RSPwOdk1KEBZ7tK4VI0RLFmUgQPMOlf1btlU15TukWUH33tfLrH/xDb4Mcjv5bixBa7N2Z4VHvJjOsq5Ac1jM0851MRwBET/6S8LDDmwcgB1dyAqnKFyae1szO8h/4vsvnXJjTZCXnAg0X+KjE8SsSJXPHnX0Bft1S1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9AMbvVJmLKZH8ijV5xariPbL8c6T/RcSMj/PCh+qNQ=;
 b=jsAu+pXXdSg8DVbAK3AlYMI5W0JHZXam3NuJiqKvk3KU4Nrpu/MxR5QYlAOkfPOosDPqBseRhPFNXYEGV9vJThGPF2ZbeBclRnXmvHSAgAlhOpcrMPezTEJhQMSGDYgJHluXjLdeN1jcYttEV0utFLajwpet7uJN203uN32zdaiTYjnTQFpCPNJlOUJYCCFGEcrmDeegut3I3yK/nNKwoiqE3Hygi2SAWNc87lEpKgzfk8b6uWVhO+hXtuiL1DqLNLbz3O40WbsEiwSLZ1NbvTKJwOTTFGiX9qw0IwCaa5hfDQuWLi9Xus3idBQ3hbENInv6hMbzG3kNjUc2M8mrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9AMbvVJmLKZH8ijV5xariPbL8c6T/RcSMj/PCh+qNQ=;
 b=gJyJMo1DuvDAUqaMHcHr8cxmKanUdR5F5VdSKvlsajouiIvtBGTIlLX6PMJfIxK4eBf5yEYuWThn3HV55gQIWC0W1mYqm2pUVPUBIlc5GqNN/qJvga830gi/82SO32gCH+QtjDshvqMTNLWTfZMhD+TzcqfyYFG83YKZ2T9yrv5VLQx1npqvz2IwmWL0pVWr3nGkX3aYmVHzoDNwAipXdCHxskzeG5LwsV9L6u5kObu+fkij1EA4Enw3Vk8As9hp2op+aGOzeeFULWdafsMWp0sOIYZ0TCOxEh+6I0+XmCOAHed1msp/ehhgTM04Nm1W5H3E3o4jKpgpcCVYxEtUfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10932.eurprd04.prod.outlook.com (2603:10a6:800:279::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 07:17:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 07:17:08 +0000
Message-ID: <7ce054ac-09b8-4051-a10a-5d41b66be02c@nxp.com>
Date: Wed, 15 Oct 2025 15:17:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: dc: Sort bits and bitfields in descending order
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251014114148.43922-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251014114148.43922-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10932:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f4a497-2693-453b-3329-08de0bbad986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWN3Z2lFaUtmSVNUMGpFYlBYNnNhdUhSOVc2V0pieWM4TWJRcUFBVk5oOFdr?=
 =?utf-8?B?KzZ6czBHSkRmQnJxaXBCeXg1U1lEKzczbXE5U2FUM2FaWkxhVmRjS3pHcTcr?=
 =?utf-8?B?Nm5nMENrQWVSV1hFbWpxdlhBUHBwTzhpLzVUaHJFSWtJTU5hN3JwWTY1Q0dr?=
 =?utf-8?B?SUMzbG0vbWlhOGJBRzJDRkNNTlBIckJ0Y1RScnEzRWFXMnVZK0R2Vi9QaWpQ?=
 =?utf-8?B?dlZpeU91OW1hV0Q2Mm9yNG13Q095VTBPV21hNkFLT25iOXZIajM5aElNWWdU?=
 =?utf-8?B?UENORVZTaEtYMlRwOFZ4U1F5YXJseGp6eEZheGNmZGE0WjB4WG0zVWdFdXVt?=
 =?utf-8?B?SmdKcTJOaDRuSit0YXp0UllyVG5DOUpnSi9sY00zbDVvVkpwR205a3QvV2V2?=
 =?utf-8?B?ZTR3NWFXTlk1TTF4Y2NQSzV1Z1hmamJiZXNKdUk0S05iWXhUdFBkQ0hXYVNE?=
 =?utf-8?B?SWQzN3ZiT0JSaDFzam9WVDJLMWsxbWFIdmFZTS9vcXJzTHI5R0hrWFdXOWFn?=
 =?utf-8?B?b2Z4RlhSQTd1YWdNYUNLME1YYWtMNDJwNnIvZzQ1UlBJMmZRTmZZdWVhZXVO?=
 =?utf-8?B?dVIrUERJVDJIWXFxM0R0TUtLWEZBWURlR1dWUW9UUzh2L0FVNXZvUzBMUU1r?=
 =?utf-8?B?NFVxUFdTcVJvU0RZYVhBWjZCSlBwSlNTbkJIb3pjRzRUVWhqMkFqVjRRT2k4?=
 =?utf-8?B?YUlEVGZnc2lkVVZVVUdSVFp0WDBVWGJmOU52YzdGU1Fva1FGKzljZVM1UFc0?=
 =?utf-8?B?U2taWlZsQlFaWnNTbFF3ci9VRjNYQnJXRkxObFBXSnV1QTBBRVdySktBSUFv?=
 =?utf-8?B?YUdOQlVYMnVZMUIwYjV3UkZIdDBER1dZNFg3VldYN2lDYWhMenljRHk3d2JB?=
 =?utf-8?B?aHRHSmtPQzhUK21YLzVHMDNFaThMNzhqYVBDYTdtNVd0MnZpTkZyUkkxVEZ4?=
 =?utf-8?B?c3lieXkxZk1WUnQxcktCSWhsNVNncWwxTkVLcVlJdVJWZTRLUzdUYXFKODA2?=
 =?utf-8?B?ajFvcnF3YmdrSlZkQWhRQlpDb0UwRHlOSUx6ZHVZRXRiTDFGY3NuR3RZYm1v?=
 =?utf-8?B?Q3V5cjlOVzJDekY3NTkra3F5MnQvOUp6OUVBQTQ5QUdDbTVoL25oS3N6a1lm?=
 =?utf-8?B?YTlYS241cjZQN0cvdnJsa1RFZDFXQm5LdEpISitZcmxwK3NGQWprTXBQRVFX?=
 =?utf-8?B?K0xMTnR6SUViSWpZa3dKME5zdWdUU2hjRWN1NEdJQ2M2eloyY05DeUxaVDRm?=
 =?utf-8?B?VEJYR0hKaXdScGkxTUdtbGFuUEoyR2RUUVJtSUVSa3cwSDNyME92aEZ0ZkJH?=
 =?utf-8?B?TllYVDZ2bjRiNC8xQXIvMUx1d0FCdDBEbjBIRCtoRFBUak0wRzFsMll1WDli?=
 =?utf-8?B?Z3BnL25NRHV2ZVhzc3lzNDhWQWd1M0FPNVRPMG5wRURERHpGL2JNMzVDSEp6?=
 =?utf-8?B?MUZhN2FSdGgyTmZ6MXQrcWl6VTB1N1lqZEZZMDFFWUhXTkduMkJJczhnc05B?=
 =?utf-8?B?VGZUY1EvS1lTeEMxSmtaNUJubWFNTGl4SWVkL0RpdUY3S3J5R1NqUnZMcGFJ?=
 =?utf-8?B?MWVpdktza3JhVUd1ZC93NHh1TXNUd05wb2lwQy9jVUd5UDJ2Um5kekVTRnN4?=
 =?utf-8?B?dmQ3UGhFMWNUWXNTUXBpSG10bCtsWFRWSHRFQUpMME9WU1NUem9HQ1ZNMDY5?=
 =?utf-8?B?b1hsM1RwNGVPMG9RM25KM0NqVnFzTTFvV1RCY0Y3b2pHYmE2MjREcjRDb25U?=
 =?utf-8?B?YitkU0Mxd1RoUzZhbTdSaW9mS3RlWWpFaDZKZmtaNEdUU2VPNlBCMWJqMTdS?=
 =?utf-8?B?enFoMjlLaFZtWGNOc05JOFFZeHZkREZWYW95ZzV4YjNKaFMwNDF3RGFHNkFW?=
 =?utf-8?B?aHZ2cjVkZUwvVmtsOEluMmpSRElNOWpMbUV4NzFlc2kvaGxMb3A3czAra0k1?=
 =?utf-8?Q?A2B5+SiHkKllHIBbBH2veCiyd0JNeu2u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UC9maU1qZ1FLWU5DcSs0bVkxNHpMbTFsREhBTTFPVVhZMTdFU29OUjVBQ1p0?=
 =?utf-8?B?QWNxOE5UbTl2cUVrYi8ydUdzVDE1Q2NjRXU4QU96b29MZjNVeE02R3hidGh5?=
 =?utf-8?B?Rm5jS2JaT05wS2taK2hwckJtOE5qWGMzbHd3bDl2cmZ2a0VGRjVMSFFPRDdH?=
 =?utf-8?B?Y21KTjBVL0l0c3VyeWlXWUkybDB1UkJrR3FMUzdYY3F1a1VUVDZENms5VCsr?=
 =?utf-8?B?RUlka0p4UW1qQmFQTFY3NWNZL3ZTdXJuR1loMlFEb0k1S3dKQm5sWHRXT2NW?=
 =?utf-8?B?cS9walJ3bkZuTEZhcDlzMUMrWEpOWjhJK1BValhVdFZtMFBPK0NLdy9wK096?=
 =?utf-8?B?SjNVK2MrU0lOaTBYQ3p2a1NXVnBxTlRpMFNSNVpLMzV6d25wQTgrOXA0b1h6?=
 =?utf-8?B?d2dDZTVvNDlzRWdlTmxwQ2w5WUtna2pGZ2hlOEdxRlE2UFRJd0t4Z3ZlQWtO?=
 =?utf-8?B?S0FUbDhWckVzTmVCRzdnZG42azFGMG04NlcrZ05DM0IwQUJtRVUwM2tDdE44?=
 =?utf-8?B?OVhTOXd5SG85a3pGYm5XTUFSeUhjY0h4ZUZYRk8xWDdRNUhRREZVc2xSNVVV?=
 =?utf-8?B?OU5CMlZKTnNFZEtFRmdGZnZPNWdlZ0FjSDdmemp3aEF4UXhiSko0VkN3N2pt?=
 =?utf-8?B?dHI5Mk5iL016VjFuN0tuV0NKWFlSc3pWMXduNVprR08xYm00TmptaWp4b2c5?=
 =?utf-8?B?ZFZ5TnR5dVJRZ2FuV2hBWkVFS29hM284WVZlbGJuL3k5dWVSRUtMekl5QXZQ?=
 =?utf-8?B?ZjIvUFVxZmpJeVhHYXhtbTJlU2RYcGRvMFcyWGRYSllWUXZoZ1lxSHluZk9h?=
 =?utf-8?B?cW54UFVTSGticzRBR3ZWZ28wQmNSVWdDNi9NZytJOU1McDRjZEY2WHBQNDk1?=
 =?utf-8?B?RHEzK3RSbjVRMjlDdnVudUdCYmtIekZ0Q2FvdEFMVXB6WmlMVG9qWHBmWEl1?=
 =?utf-8?B?cnV6TmY1VU5LWjVvUkRPOUpBcXNCNHNsc0tPYmNSRFlGbFVyVFh5MFVTMkF2?=
 =?utf-8?B?YitlZ0l6N0dZS3dmYk41MXZxd2t6QjVEOHBoRlJNUWRWeFRaUXZIOFhtTTdi?=
 =?utf-8?B?QmRPU1Q4dnpIYkl4V2ZnclZXeW1LL2NiY1F1bGhKa1pvM1dEYWY4eThhVUho?=
 =?utf-8?B?MlJQaml1S1gzSjZJejBoRTM3RU5tUTJvRG1OTE1Tem95QlNCdDlSNjVpREJX?=
 =?utf-8?B?Wk5PSnRKOE1pQmp3NWg0L3d2WHB3aUNDcHNaajVaVkZQQUd5ZGNnU05ySmo3?=
 =?utf-8?B?TGlkdGlNcXNjdzVVNW5CL0lBZUJCR3BEREN0eGt6SUZNMVZES0h0ODNZaGxB?=
 =?utf-8?B?bjBvQWkyS2d2Qmw1K1kxcmdHT08yb0Z3TkNxNWRCSmQ4RHkwUWtDSW41ZW9x?=
 =?utf-8?B?ZkxJSVRUZlJKYkllQVZWd21EaUtQbGhHZnJuOFdIWlBmMFFkU3U1a3NrMUZs?=
 =?utf-8?B?K1Z2eDFJYTQ1QXRJck5sZDMrTkF3bUMrWWFSYTZNaVZSaktrcEJuRGxJeVdK?=
 =?utf-8?B?Z3dyZ2JiWGtJQW1xVFVsNVhtTU84cUpiN0ZabGpmdlU0aGVuaHJQbkxuT3Jr?=
 =?utf-8?B?ZG5JSHZOTUpBUE42NkdZbXZDRitsZDZVRkNCWmd1ZUY2TEJ2QWtPRFRyOW1V?=
 =?utf-8?B?YlZROGRyZjhSaFZDTDNNdk8xbHVBR2NQVkh2b29MSmc4ZHg0T2l5RHVXcUh5?=
 =?utf-8?B?MFRnTGxmcTJ0YldRNlQ5V3B5T3E5OWhGL0FzbWNvOEg3V1puWkxHSEF6ZTNv?=
 =?utf-8?B?MUpVQ0NqWmR0akFHSzIzS3NPejVQemZOOTVOcDNYN29PanBXWUtoODZwbWxw?=
 =?utf-8?B?dzdjSjZGMGVzVXA1TEY5dXdhL3Nhb1J5Mm5ONnl3R09XWDF2dEZiS0E0ZHVv?=
 =?utf-8?B?eDFwQjF1Y29BREZqSHZFNWc3Zko2QnJyYlZjN3RUbzJ6M2RQVXhzNFdhaW1W?=
 =?utf-8?B?enhSVURObGtRQ29NenhjekNjMmlQRmxWZ0p4dGJVcEJCRmpWV2EvYlVocHA0?=
 =?utf-8?B?aDMxY0xTUkQ0RERJZ3NFME11NDQxc3FOUFJrQ0ZReWhOK1Ezem9EVEVWUUlQ?=
 =?utf-8?B?bUNsem5kT2xLb2Z1T3A4MUl5ZTh1V0NxL3pHeE5mSU5CcnY4TjlUbFNTdzlq?=
 =?utf-8?Q?HjwZQBaff50m6cIOzqDUZSgGb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f4a497-2693-453b-3329-08de0bbad986
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 07:17:08.1205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lgpog1s/ET0PHkY594XY4bm92c2BSU+7zybFNtvLFwzV9x6aPDE2KxUECMoydON8MZZlnc7By9Ofig2pf3Foqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10932
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

On 10/14/2025, Marek Vasut wrote:
> Consistently sort bits and bitfields from highest to lowest bits.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-ed.c |  8 ++++----
>  drivers/gpu/drm/imx/dc/dc-fg.c |  4 ++--
>  drivers/gpu/drm/imx/dc/dc-fu.c | 10 +++++-----
>  drivers/gpu/drm/imx/dc/dc-fu.h |  4 ++--
>  drivers/gpu/drm/imx/dc/dc-lb.c | 28 ++++++++++++++--------------
>  5 files changed, 27 insertions(+), 27 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
