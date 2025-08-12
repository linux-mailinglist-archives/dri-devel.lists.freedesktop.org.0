Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E323CB220CA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E91E10E00C;
	Tue, 12 Aug 2025 08:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iebyYS8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013027.outbound.protection.outlook.com
 [52.101.83.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77CB10E00C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvQklmx7pwHHC8WXIRphTH4AxANKwIR4R3W/sRGJRsb+Xyqt5xFC2tKx0B2YHVSabvPN7k1H8i8HwrkC4//cMXoflS3hHyfK6OHBe+ga9z5p7vGPfcdhIQIL54WvQ4CbTSyURPes9O8Ronq4tIGQNkWJuhRC6E26FEd3Iv+hsp0fjYoEWvpyWmzcVgmCKwyE7w56nmb37MJD6lis/b7o67FnIIY92ghHNAmyxAV23oi0I+V924dNvDofR7LgF/hOTo/aEO0Cl0OO1ZxJ1WwvkjkIIr2FTm9W+likaf3yxewzZbR/G6n9ltAaZZiHd4/Fjscg46MDh6plp+mC6LzqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29O+x/JFq+TVl5hbAaKa7l3J81imfujjdiAEbapVB7o=;
 b=zW3kbTtGpdfGqX8tR38xHpfvjJ3Svntapx++klUTaxferPmcpARIidIiXyXdREanqXzjWIpGcHzAiW+cGfCIQN7yLSQPsorGDwjvbIo8Kh+WQ4TIYK7zwRRRkS75cesqgjl4peysBac3FmiHfbmT6P6pcZ/e8XfaxunC/wYUvXmP7zkvT7pEepbHxSJxkg+tnsC4e24Ny2iSDZCnpiJpi81Eg7opCd+aBZUh4i3S3rNwLcHYxw7ChYHT8Rya2pdqm3q2deUPjMmd3ybErJb9aoJhTLyzLPHPpL4LxwsD2MOwjmBFfomTZCoBGJIeiKwY440wMJWbnABrCywLSztiLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29O+x/JFq+TVl5hbAaKa7l3J81imfujjdiAEbapVB7o=;
 b=iebyYS8WIAM92Qf/U0WKY/1blWjyFs0wYP5K331vxlrNzJToB9XVICzwObBDWg+tZPulxPxkiOwsmonPwfUfkF4aCW8pnAA20bxUqbl4CDOtkErEL9OLEOujDSHSv59caVHMD9+HNfSHpW3bYGiYibT9p6DFnpybqSHN3Tq7q8kBpvI5cNNSAYJm9kYDQS0Rv0WuvFu3AyFls0yyTNHoD3McCJK934N5fSc5TPzQKKvZE2/sX+JROLL4iPvH4YX/bX6YJojkIdWxFs6d0Qqpa5VXCVkM2V6fd4p5GBOWtO1obavRe0SEyV2XABI40DxsgzdZ7Css0YJpLFHpm5PaAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Tue, 12 Aug
 2025 08:27:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:27:47 +0000
Message-ID: <10a9b4e1-c777-4e63-86f6-134d6100d70a@nxp.com>
Date: Tue, 12 Aug 2025 16:29:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] drm/imx: dc: Use prefetch engine
From: Liu Ying <victor.liu@nxp.com>
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
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
Content-Language: en-US
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: 55570193-424f-45e7-31c1-08ddd97a1e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVBrOWM5K0lnS21PYlRWVkJTZ0hySXY4RUlqaEluR05RYmRrSUZvUS9yRDdp?=
 =?utf-8?B?NENIVDEzUStIQzloMTJXTWNDbzg0YU1OVXNkVWhpbUduS05CNFBReER4ejJW?=
 =?utf-8?B?UFo3dGVyR21pbXRRb3oxeitUdm1GbFI2YlVEM0w0L0VWQlovN1ZlazFBdWNh?=
 =?utf-8?B?RHl3UXpKRjMwZGZHUEw4Y296VnhNTDdmVUc4UzBMMFM1RlhTdFhGb0xpZTha?=
 =?utf-8?B?UXBGSEpuNWhRWGJ3d0R5STZmRHRmZ3NHVG1ZejNxQzhqUzdyb0FiS25BdG1G?=
 =?utf-8?B?Z3JkUEd5Nnd2ZFRpaUx4Qy8zSHBUVGU0L2lrQkRPUXkyRzU5YUZreElhSWpR?=
 =?utf-8?B?NXFnWnVCZ1hRc2lYUU0zVzdzR0psbWwwUkF6REx6UnA5YnhuODB2dzVKbEl0?=
 =?utf-8?B?Y2xqc2dCSCtnVGx3MFgzbUlpb1FGbkF4NnJNbUxJdWJXVjJhcCtWd1dRSUxI?=
 =?utf-8?B?YmRYRUdsRUEvUkJ4bmJqY2ZEQUZueFgxNnNkcWtINDlOam0yVk5jdWtJajBB?=
 =?utf-8?B?blBqM0d1cUhGVjdoL0pYeGlWWmx2Y3EzaEpCKzVCNnlabE9meHlDcVZlWUVm?=
 =?utf-8?B?TXB4UEVIYkJGYWZiV2tQWnRCTDhFYmJqcDc3Y1FzTHJtSmdjUldOTEtPTXhs?=
 =?utf-8?B?T2xBMFVKZXkvQ1pRWm1FQnpucUkwci8xWWljVmVTZ3BNTy9TNE1ERzRCU25P?=
 =?utf-8?B?TXNFMXNkNXZhS0xaRzk2bGhiTmRDSU1xRVNEMm1lVm1makZLTGp1SDhYRnZ1?=
 =?utf-8?B?U1NERE8vQjk4SXIwV0xoYzNKUEJZZnoxa1BYd3BtMFFVN0J0aHpOd0xnNzFs?=
 =?utf-8?B?dzN2NTE3enNIRVlsWmJQSHJiVzdCVjI2Zloram1RRkpvcDNDMzBqOWxFekpk?=
 =?utf-8?B?K1lOYmI0T0ZxQWNuMUQxMDYyUlEvTnJ2S2J3THNpd3dnWU51M1o0NndSenhh?=
 =?utf-8?B?Qlh2QUtXamVkOWNreWR1cnFIazlHdDNtaEpia1JQMHNtSkY4emZzVXlKZW5M?=
 =?utf-8?B?T3U2Yjk5YnpieG9WQnFCTGQrdjJWeDAzcnMrb01aNzRpOW5LWC9Xb0l1ZWE2?=
 =?utf-8?B?MWFJcjhLRFc5TmkzNTVoczI2SzNCb2ZwanZ1L2lscEJlRzBxc0tENUw0cEE5?=
 =?utf-8?B?aVZuNHBSZkg5dU5aWGZHd2FmTjA5bzFwYU16eHF6RUo5S1VXbVRrbk1uR1do?=
 =?utf-8?B?Q0hzY1VOQm9ycElpKzhmeFVhb082RWRXQUhEd0M1R255M1BINms2SEZmdTlM?=
 =?utf-8?B?VzlqT0M3NDBhZC9XOU43bmkyNUs3d0Ywdjd3QkUxY0s2enNNYXZ6OEpvVUQv?=
 =?utf-8?B?YVlCcGFSR1paWnBZamdWVUZRQWpjNmZYVHJVTHFBaVVTSGE3Z1Q1dzdCU0JD?=
 =?utf-8?B?ZWNWcktJbWFqNThRaCttSVJLSHJkZlRHQkg5RjhvdXJaWVY0ZnkzSWRPOHJK?=
 =?utf-8?B?cjVycWp5Rk80V0l5NHdoOGdQdzBHUlRuZ0pDUXBQY3pCMDkrY0hrd3RyNm5M?=
 =?utf-8?B?SU9Belpvbk9NTDZCVUY2bzhIaURNNkoyREc5VXRhT1ZTS1Nid0d6QTR0bHhx?=
 =?utf-8?B?bEdkTTV3SDA5WWp3bFJ6QnoyT2RrQUZHSWxzMmxpYW96VThhTlBnWDh6bFhS?=
 =?utf-8?B?V2lpU2tCNndwSFgrRjFZQXdNR1hIbHR6dzlhY0FFWDNVbmhtaUVzdDNUVnBm?=
 =?utf-8?B?dCtoVWFjajZWZzNuVDM1ZWh6M3FWOVZVOVFjeEI2TFlqV2tSTldPbmFVV252?=
 =?utf-8?B?Tjl2Wkp0RlFUNTdOVzAvM0RFUk5ramVCdjhlQ2s1VDNwdXFwbExoWFZtQmxD?=
 =?utf-8?B?MFFzVlZQaVd5MlRCYWc5ZXRwOTVxQVc0R2xTSStEVnpqSnNVNTRrbTV1WTVU?=
 =?utf-8?B?a0UzVTlsWWFnQktDZXVZR1JHRUltZHJua09rV2RISDVzY2RJNjVPMW1PUjg5?=
 =?utf-8?B?Si9LYXlsTUgvbGZTRFdFMDQwZkM4NTl1c1pKdzRrYXNWWU5uajN6aEo3ZTRC?=
 =?utf-8?Q?zOWG2xY1n1VwWf1DLfs2+8TxW7ibjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFgvdEFzb1B4NURNcEhIZmxTYlpjMVM1WUt5MndJL0lLYjBpUkFKallNOTk3?=
 =?utf-8?B?MndBL2dFei9MOVlUY3FGaTlKQnhQam1MdWFVOE9WUWk4b095UFpOa3BBSm03?=
 =?utf-8?B?ZThzVU16VU4rSjhYRmZBS2Q4Wnl0V1IwTFJrRDF1ZnpaTjd5dlNUSHI4K3RT?=
 =?utf-8?B?azBvVnNNeVJHZTlZb2d4cmNsRUpZYkVReU5ud2ZGdFg2UnpkQ1V0aVBteEJq?=
 =?utf-8?B?SXBiNEFPcHFFNVRnSnFwSzRCUHgxM1QyUElhWkpIZkxqODRKSEdCREFVKzN4?=
 =?utf-8?B?OXlhS3o1OGh2RTFqb1haSTAxNVFPMFhsdWh4Nk1qQlNuOVdQZHhKZUEzZVlT?=
 =?utf-8?B?ZmJrazZtOXdTc09LTHRWd1JpN2xYQkQ0TW45UmRCWGt5TUFUcUp4ODBrTEpN?=
 =?utf-8?B?R2l5ZzRnc2JIYmh4TG9sU3Y3dzlqK0NNSnhSMExSZ2RVZ0xzeFRRbEtMeWFn?=
 =?utf-8?B?QXpHdjlvelAzaFB3Y2k3ekh6c3N4VUxWaEJGVlpVSTF4QndjWVV1RDFYallC?=
 =?utf-8?B?dkdHNXZTWmhENjloS2dJcGZDVmZDSzNoVUN4Vkptdk9sRUNPdmphQjNzNVMy?=
 =?utf-8?B?UkFBa0Q3aEREcnl0a1pWQnVkTklNYTlvdUd0dnBMZnp3VFVqQWc5UElCT2pE?=
 =?utf-8?B?M09KeVo3ZkhtKzlTMlZybUFaYWUyQUpKOUw5V0liei9rWXo5TmNSU2FSRld0?=
 =?utf-8?B?a0pOS3ZTbVZZVHc1MzJHSFBNdG1laDZiTWJ4cFhoeWlvRDA1ckFkdENtYm01?=
 =?utf-8?B?eVlaZXpQcGJCRUR2ckhHbDN3T01FS21LMTNRZVRJczM2aHNYYzdubUkyei9q?=
 =?utf-8?B?Y1lEcDRKeFRnNjExVTZJUVQwNUJ4VE00YW1SeW4yRnZLTHVmNWlDd3pTeDMr?=
 =?utf-8?B?a0VKN2N3L3oxWjJCYXQ5clowK2ZhTlBRRTVJT2ZuN05uL2hOZ3RvY3Rxa25M?=
 =?utf-8?B?VURpRWxVcHIxQU00VWg1NkxrbTRteVJFZ3BNeER5UEJiTlpMVmp2cCtGNzVn?=
 =?utf-8?B?ZXdUYTdRZDN1anFwWGpjREZSMDQwMVF0cTNIYkNXV3NaVmVGZXdldTFyZmZq?=
 =?utf-8?B?cU0xV2pDMDFhQ1Z4SmNXeDBJRDQydlpQckplaW5BNzZxMmpYMUJ2VWRMSS9F?=
 =?utf-8?B?SS8zSExCUE1PNnBOY1kvWnhUWWNzS1paNTNDYm5GcmZPN3NKRHhKRGRTT0FH?=
 =?utf-8?B?b2ZRM0FGZ1RKQ25Ob0dIbThCM3cyelRUaFRzQVRESWxMMXhvOVFodTN5VjNm?=
 =?utf-8?B?cU44dFA4SGJHTDV5Tisvd2tsSmQxRG0yYVhwSTNIcjRXblI5UzdZWW1lUTVT?=
 =?utf-8?B?UGlGbVE3V1B0VlpMa0hkWjJJaDgyMnBZYk1sR0h6TXl0ckNhMU83OTV1M1NR?=
 =?utf-8?B?SE93NWJjb0RSalRlVk5wNmMrTTkxNnUxdUpMNHhLQjFKYWEzc3ZsOGtUWTFU?=
 =?utf-8?B?SnJYM1ZIVVhWZWcrejV4N3IwUEUxckxsaU1xNnA2ZzU3aFFrVHhoR2xUVm9L?=
 =?utf-8?B?Q0g5SFZ6S3NCU1k5K2pNZDlwMHV6SEFkNjFoeXBlRmJMV3B4djQybk4wUmZk?=
 =?utf-8?B?a2lkQ3R5NEhJZXBqQXorWXM2dEp2MHlSNGNRUE53cUw0enhSemgyUnQzdFE3?=
 =?utf-8?B?d0xJZEtwbDVaNWtDNUxUcEtLSWY5K2lveVREb1BVNnlHdDNnbWdJTHMwZERD?=
 =?utf-8?B?M2hnK0ZWMGhYY2tneCtleTU2eGZBQm1ySXVXMVVHN0N2Tm80OVpVQm5paXBT?=
 =?utf-8?B?YytXNDhiVjZ6Rk9Ic2U4M2QxVjB4TFlSZjV3QzBCYzVwZjZzWlU4VU1DTldz?=
 =?utf-8?B?Qldlc1RZb0I5WGdJTTVURWYzLzhhKzVZYjdvRzVaQWptUFBYTGVLT1FjdE0v?=
 =?utf-8?B?OWF6RVNGQmVRUmtrck1wcW1WTmE3aFVaL2M4aFY4UG9vT0NqYzBNNTRoQVU0?=
 =?utf-8?B?UmI0WjNRNTZnVkJkMFBGZGtUbE91RWp6MW00NjNLV2lDbEVuSHJHaVVGSlN1?=
 =?utf-8?B?N0s4QlV3bzJmRWJiQXM3d2liSUJmRlhOVkhTZ2FLWldHMFcwbE5PLzNmVm5z?=
 =?utf-8?B?a0krRUlOM2xiVnJYNGVSUVVCNkVIZW1wNjBOU0hubGlEQ3FMOGxpL0tRVmtC?=
 =?utf-8?Q?Mrm3LA4h9+ttcahdpIOt0+McG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55570193-424f-45e7-31c1-08ddd97a1e53
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:27:47.9027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diH6t3ahKkq8V85y8qDDevFkvHdYoWuyiTXXcy/bRWLpI9ZuE7YrzIAtEqtJCPCBVYiqS46joH08bDjfkFKiRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892
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

On 07/04/2025, Liu Ying wrote:
> Hi,
> 
> This patch series aims to use prefetch engine in imx8-dc KMS driver.
> 
> One prefetch engine consists of one DPR Channel(DPRC) and one or two
> Display Prefetch Resolve Gaskets(PRGs).  It prefetches data from
> DDR, resolves data in tile formats if needed and outputs the result
> data to FetchUnit(s).  When one PRG is used, a prefetch engine supports
> processing pixel formats with one planar, e.g., RGB formats.  When two
> are used, pixel formats with two planars are supported, e.g., NV12.
> 
> For now, this patch series only supports prefetch engines with one PRG
> because it is enough for XRGB8888 which is the only pixel format
> supported by imx8-dc plane driver.  Two PRGs would be supported by
> future patches.
> 
> Patch 1 and 2 add dt-bindings for DPRC and PRG.  They were reviewed
> by Rob[1][2].  I slightly modified the patches' commit message to use
> imperative mood.
> 
> Patch 3 adds DPRC and PRG dt-binding files to MAINTAINERS.
> 
> Patch 4 fixes FetchUnit dimensions as related to prefetch engine function.
> 
> Patch 5 disables CRTC at boot if needed to support prefetch engine better.
> 
> Patch 6 and 7 add PRG and DPRC drivers.
> 
> Patch 8 to 13 do preparations before using prefetch engine in imx8-dc KMS
> driver.
> 
> Patch 14 uses prefetch engine in imx8-dc KMS driver.
> 
> [1] https://lore.kernel.org/lkml/20201207165945.GA430214@robh.at.kernel.org/
> [2] https://lore.kernel.org/lkml/20201207170206.GA434964@robh.at.kernel.org/
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Liu Ying (14):
>       dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
>       dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
>       MAINTAINERS: Add i.MX8qxp prefetch engine DT binding files
>       drm/imx: dc-fu: Fix dimensions
>       drm/imx: dc-crtc: Disable at boot
>       drm/imx: dc: Add PRG support
>       drm/imx: dc: Add DPR channel support
>       drm/imx: dc: Use TCON operation mode
>       drm/imx: dc-ed: Support getting source selection
>       drm/imx: dc-lb: Support getting secondary input selection
>       drm/imx: dc-ed: Drop initial source selection
>       drm/imx: dc-lb: Drop initial primary and secondary input selections
>       drm/imx: dc-fu: Get DPR channel
>       drm/imx: dc: Use prefetch engine
> 
>  .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++
>  .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 +++
>  MAINTAINERS                                        |   2 +
>  drivers/gpu/drm/imx/dc/Kconfig                     |   1 +
>  drivers/gpu/drm/imx/dc/Makefile                    |   6 +-
>  drivers/gpu/drm/imx/dc/dc-crtc.c                   | 191 +++++++-
>  drivers/gpu/drm/imx/dc/dc-de.h                     |   2 +
>  drivers/gpu/drm/imx/dc/dc-dprc.c                   | 499 +++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-dprc.h                   |  35 ++
>  drivers/gpu/drm/imx/dc/dc-drv.c                    |   7 +
>  drivers/gpu/drm/imx/dc/dc-drv.h                    |   5 +
>  drivers/gpu/drm/imx/dc/dc-ed.c                     |  27 +-
>  drivers/gpu/drm/imx/dc/dc-fl.c                     |   7 +-
>  drivers/gpu/drm/imx/dc/dc-fu.c                     |  49 +-
>  drivers/gpu/drm/imx/dc/dc-fu.h                     |  11 +-
>  drivers/gpu/drm/imx/dc/dc-fw.c                     |   7 +-
>  drivers/gpu/drm/imx/dc/dc-kms.h                    |   7 +
>  drivers/gpu/drm/imx/dc/dc-lb.c                     |  23 +-
>  drivers/gpu/drm/imx/dc/dc-pe.h                     |   2 +
>  drivers/gpu/drm/imx/dc/dc-plane.c                  |  46 +-
>  drivers/gpu/drm/imx/dc/dc-prg.c                    | 335 ++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-prg.h                    |  39 ++
>  drivers/gpu/drm/imx/dc/dc-tc.c                     | 114 ++++-
>  23 files changed, 1545 insertions(+), 30 deletions(-)
> ---
> base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
> change-id: 20250703-imx8-dc-prefetch-028e306591c6
> 
> Best regards,

Gentle ping.

-- 
Regards,
Liu Ying
