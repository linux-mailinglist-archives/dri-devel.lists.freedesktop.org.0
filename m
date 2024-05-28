Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98F8D17F3
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 12:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990591120BF;
	Tue, 28 May 2024 10:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="O6+qf6HJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6D71120BE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 10:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJjtVFPT4RFbnQU9AxSgZzmA2eK2xh3j69Lk0x+z1b6XbXDRkwtqNIm3LtC6RNKoGl+pRAA+7AWEG1oD7diS5eqRP7TG9ierVE3sacE+7/eGZ4B4VrG2DFgneDx1BnkVrthw/x0qNwF97C+0sm4ZUr1eCrRKPaYpFOiwSKqhSJu9qsXZjTZrzhZrO+k0DKXPRA1bxxTv8CgAgNTusBcUXi+xlzfm7xQFq4w0OrIKsN0Y5TXfMGsIr5SHHkmkhhPPDqePo3bHduw4aHJrm8jdnef0M50n3XKljrVcNC05Uq4B+bsT89/xe/XJVwWOiWoYk4vYbVQz10vMHTKHIcMFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InK+MNqQPqrG/8qZYtQQayNIxQO39Nb2grt9RTKwkFI=;
 b=BYn/hVQuwKC9YoM3fLYbSxjjPXSKqs0ZfDLbcbwDH7jW7MOqku+QTVyD1mUtQepQb5WQmovdmVz9e8eqrQs9epSczNosLGxeuIML8hJA2YLOyfmMeBrv1VARNsFnt8X8wc1Twfun12vhoKPD7ZLI1pUumqM+srRdpHSneC/LEgUyo82Cc0+2wdGpWo5xO8GfxbHAXdKNaIVEFLmebsRUceixewGuM217r6VN7/G7lFRkPzXJ4UY6pRGJPfUh7+ppdihNV2M6cElF+s6vfGcH80dILvcQl05/Cacjb9DlcMgmPbLB66kFPVtWRyQgjNTF2a76XhHJo0D8ZuyqvXFrdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InK+MNqQPqrG/8qZYtQQayNIxQO39Nb2grt9RTKwkFI=;
 b=O6+qf6HJENJ8RqzC8QPtku7oOObOaZXA+miXVvo+o385xz0wPIIxBPPHG/MBJfS1cvU2xUU4ezw7209RkuaGa9zPy2WjBbZJx7Vpg2JtqTnbndIoP9/qP5b2b0RwxUsGxhD25BpRLdCZa18+KF6QmQRk49EgXdRarWTMF+Nq9qA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10874.eurprd04.prod.outlook.com (2603:10a6:150:215::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 10:02:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 10:02:13 +0000
Message-ID: <40bc3142-c7be-4dfc-a2ff-6ac209112aa6@nxp.com>
Date: Tue, 28 May 2024 18:02:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240528093922.194684-1-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240528093922.194684-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10874:EE_
X-MS-Office365-Filtering-Correlation-Id: dda5d92f-9318-4957-576b-08dc7efd3f7b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|7416005|366007|376005|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0swZ21uSlJyVUhIWXp5cHJQcXRMTEgvV2NMckhNOVhLaXVZQ0JZYXBSOFN4?=
 =?utf-8?B?TFMwUnU4Z2JidU1OOVc3NlNvNnp2eGtpVGViam1vOHB2UWF0aWg1VytkdFpy?=
 =?utf-8?B?TG1pUmNqSjhnZllNZkVCNWpzK3BCNVJ3SDBMNU9POVExNmxvb1hOL21QQmhn?=
 =?utf-8?B?TTFSczY4S1NONDJOQjhwamVkcGZQS2ZWeTYyQ1BOOTFuV0VFKy9XRXJaSGtH?=
 =?utf-8?B?SzlpajV2VEVOMFZOdzBYbytxZzJFNzc3ZkpTaWNndmdaNC9aOGJzUGt3eVE4?=
 =?utf-8?B?b2VZN2RBdFBUcWZBNmpiQm5IQmNuL0dodGZDdlk2SlFMTERkZkM5Z0Y4VWJO?=
 =?utf-8?B?bE9DUTV2Z0s3Mk1jazFmem5WYXdVSFdyRTU2WW1tZ0RpUEpRdWh0MXlzREh0?=
 =?utf-8?B?Nzhud0dFQUc3YVdSSmlCYU84SUNlSEJHL05FZElxTStiRS9FYW12RUZDVGEv?=
 =?utf-8?B?Q1VkNjZ5MnJ3V0xyTTFpTUk5SVZEb0RjWnh2cTFtM2kvTG1LT05TR0tBMUZN?=
 =?utf-8?B?UFdkRUZMYnZvYXAvMmdocDhpS01scEU2Q3Npd29xekg4L2gyUU1md0thR2xT?=
 =?utf-8?B?RXJCeDVqWFEvdXFPWkl3b1E2YmhlSGtiZkVVWmFqVXY0c3lxVWtuUVVZNk1j?=
 =?utf-8?B?MVZ5ZkgybEp3SU1HVFZwTFp1SkJ5czFUZFNQM3hoR0ZJZlh3L21UeUw3T21n?=
 =?utf-8?B?c3BzWUlqZTZsSFgyWERVTzNqcDNkei9JR1ZWbERCRUczOHNzNnkwVDBsUURP?=
 =?utf-8?B?dUYyN3Z3Mk05ZnFybkJLYUlJSjBudldSZXBwN1hXNmpSdG9QTVRaZ1M4cHdX?=
 =?utf-8?B?OU1KdVlKb3NaajJNb3dKQnlsQnhTUk5yN21DcUhSczZ5ZjNGYUl6ZTB3RFZI?=
 =?utf-8?B?WnlnS3BlR1lEbnVTQUlWRWxKWHZWaytlajNyV2xxY1prejlFeXNJbnBzWER0?=
 =?utf-8?B?MWhuR25PaDRoM2VYWklEbC9aUGZTRXBxcG1yWWJ5RGNvemt4TXkxeS9Ga1Rw?=
 =?utf-8?B?YWFVME5HSVk1MFd3bENKTnU4RTl2czRNdis0clNNRElDc1JlUmM1U09mTllZ?=
 =?utf-8?B?RWo5eGwzbm9TWkFCYU5GbG1jNlp2cG9kVHlUNytNSExoNy9UZFdmZGdkcXZT?=
 =?utf-8?B?bXJhZjI4Tmh0RFpqYzB3ZXN0bTBsbk5QSlkwallBZGxMK3BmaGZJc3N1bkha?=
 =?utf-8?B?eXJCL2c4V1dxT0VFOHF4eU80QkFjNnRYd05xa3NqbjNabWFseENiQkRma0k4?=
 =?utf-8?B?cnpBM2N5UDFPekRMcnZ2RHRCNkJYNWRqUldKWnJ4a3NNQVcyMDJyTWhUTVBl?=
 =?utf-8?B?bzY0UU5qOWtqc2NvZ0lMSms5aXlLUFFrTHFXU0ZKdkNId1pTSjFjeHY4UHhx?=
 =?utf-8?B?OEdNWnFPZ24vN1dXbUpTcDRhOTlNUk5obFlQM2daOHFBY1d3YnNsR2Qvczk4?=
 =?utf-8?B?eFRPT2FJU0tmalk5NmxuWUpEZFFpWDRPb0NFVFV5cXJEUDlxL2ZlWWFJd1BB?=
 =?utf-8?B?WVM2T3hHclduY2YrQ2Uza1g4blRlSzVvQnF6RWZsNFlpKzB5bXp0S2UyUlpZ?=
 =?utf-8?B?SU1sdkErbU00U3RPeUlkSzhxbnhTYmZ4SzViWmpZY2NKclp5YnkxL0ZUMHdT?=
 =?utf-8?B?azNxVGM2ellpUXdOWmE5Ykg3L29oVlZidWd2TVYya3c0RWdCM3l0UnNQcXZo?=
 =?utf-8?B?UDNaMnpOZ3g4cm04OG1PSmoyQzVMTGRqcU5kNEN2U0NUems3bjRXS251TVRt?=
 =?utf-8?Q?5YbSegM5+eRxUnmR2LnQLPxU0m/b5zlvSxeabns?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlJGKzA3enMyZjM2R2tEeFhQZGFFK21PWXlyTHowRVB6OGRBRjUwZW1QcVMv?=
 =?utf-8?B?RWVNL2ZtZWcxLzg3bDRleFQ4YlFDUThsYkZMZ2h0Wk42WTB6SDZLS3RUckdE?=
 =?utf-8?B?ME83WmR0dWMwbkFDSVNrbzBKdHBmaFBnMVM3aHF5YVZpM0xoY3VvU0lrNTFv?=
 =?utf-8?B?ckxsa2FpWGpLTDdMNGJyYkRKcXZvQnA3Uzc5QitYYXJ2c1hOSTZFSVpGbjNn?=
 =?utf-8?B?VEYvaWhMQ0prV0NoQUZaMzV2bW85N3Bta1FqTEtzZGVFZnEyZFZjK3pQYnVy?=
 =?utf-8?B?dmZqSWRSYUEwUmlwdXdvM2RwT3BGRkdFblBmaWFjenB0YlhKaU82cFRhN3Bw?=
 =?utf-8?B?Uzd3L3Z0WUFmNzl0N2Q2SGgzK28yc1NDTXBoeVZybEpSdmgzZnNRaS9xTEIz?=
 =?utf-8?B?eDI4Q1B0d0ptcis0dzU0S2lwdk1vS1hFcGFDODY2SjV1TkJlWnZFWHNnWG54?=
 =?utf-8?B?WGlmOFYwVlpHTjQwRkVYcXJTb0tETVBOSjMxd3BDSklaelN6VjJDVWd3cytw?=
 =?utf-8?B?alQ0NU96NFVLT3pGVjNhSzRNSFdZOTVrbTJ5M2FQY21xMHVGRzVyQTZPQ1ds?=
 =?utf-8?B?enNHZ3lBSGpGQTRvRzE5c3B3Z3B3RjY4UVdKMTVrcGNoczNtNHJnUklWTkZz?=
 =?utf-8?B?a2d6RjBWSGtwYlVtMnBKSmJZT2JEODNjcjRDNnFSWjZiblpvQ0ZyTGNqWGlK?=
 =?utf-8?B?SDFQeHl3Vkp2SWFvaEhTeEYvRy9tUzRzelA5YnlPc01LZm9yNFZpTDgwcy8v?=
 =?utf-8?B?NGczYXZ1OFRmRlpkdGZiWnlVZ0JXTEpRVDhpS1lIRjJTQmJFNzQ2dWxuNnNQ?=
 =?utf-8?B?aGRKOUZKeWhHRGl4ejNra2gxSS94SEMxM1JEVGZDZklKOFdoeUpXcXBkSlNO?=
 =?utf-8?B?VHJTZmxQRGlLeWt5SEdvVXhnYXdhUUZwbVA0QUhCV28yY3pYdFVxQWtqdE9o?=
 =?utf-8?B?ZysySXhQNkdSQXpOcHFyMmVxUzBuV0tLRjJrb211RjMxZ3IyK1p1SnZNUjdr?=
 =?utf-8?B?UmhGQkpHWGh4SER4MEREbmdmVDZFRVMvQzNCR0U2YzkzVWlPV0lPWjhvVWlI?=
 =?utf-8?B?ZVlnN21BU0FUbXQzRDJsOHpPMEhaYXI4dG8zUzhRcTFSTjN3aDZBbzk4Z01D?=
 =?utf-8?B?TUxBODE4UUduY2U4TFViaHJ5WjZkbnhYQVBFOWhrVU0xM1lhRG1tUEZJdWtx?=
 =?utf-8?B?Tmx0NnBwZ3pMOUxNaVRyU29nTzllb01zSHhycW9Wd2I5czNsM0hCVExuZzBQ?=
 =?utf-8?B?aVpaakUrVFZxaFZ6a3pUNHhReVZNajVjMkplOWZxbWRmaEFZSDJhSS9iMkU1?=
 =?utf-8?B?b25zbW05QVdLTHJFSXFYZktnTys1NTZKaWhkSFV6bnk1aEgyak92QzZ5M0pN?=
 =?utf-8?B?dVQ5aTFPN3JMRUVoKys4M1pKbEpLekxtS0FKMHJUSC9pK2lTZGpQQlI4YlJv?=
 =?utf-8?B?ZGo5OGFqam1NQVRvMWZDMmZkYnBGNllObHEyU25TWTFJUGxzNVlTUVVlbW1x?=
 =?utf-8?B?RThoKytnaUNmZ3F2QjQ2d0RzUDdzOUk4bGE3UW5yYk5GMTl4SHViRFhpS0Fp?=
 =?utf-8?B?TFR1WEdKSndJdDV4ZzAvdldBbXo0MmEzNVZYK1BsN3JOYlNacVVpY1cwcnhF?=
 =?utf-8?B?UVdXbFhhWE0rUzFweENCQ3FnMXZ0VGRoMGhzY25kZlFDYUxsU0xsK25NU1la?=
 =?utf-8?B?a2hoaEJWLzNVWE0zRWRxbFpDVGRRb1ErUWZxOGRHZ05nZEVuS1VNV25ZWG56?=
 =?utf-8?B?YTRXUEIrS3I2dTY5ZHQvbkk0Q0NNUHduWS85YUJBSjJxbWRPS0F5cVcrNzFo?=
 =?utf-8?B?emhvamp0N3MvSUh2aXNJZmNoRnBrRS94S0pOMGlDb0lSN0hmZERLSnVvV3E2?=
 =?utf-8?B?dEw5T2tZS0pJTzFPc0tzVzlidlNUOXRCaGpMSnc5N0ttd1FGL0VPZUpkWVFN?=
 =?utf-8?B?M2NXRU1xYTNJemVZajZMbkxGaEdDallsbGY1djRjc2RBdVUxd2E5Y1JIT0RZ?=
 =?utf-8?B?SUVCNng3YS93WWR0QzVBMlRIZlhZVWlJZUdvdnh3dGFNc1BaeWE4SEMxVWRt?=
 =?utf-8?B?alpLeHVsOGEyOXhzTTFuclJaeklFclRxK3NYbTYrcnRqblRvTlRHVXpUcTF1?=
 =?utf-8?Q?dMxPfz5/63qJw2E8dGEAJJmmn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda5d92f-9318-4957-576b-08dc7efd3f7b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 10:02:13.8639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xQC/zyldLimadQH3AAXeQurYcxpQGrq71zluCBIz4wZaWLIfXerJMOuGoRK9ZNus8SIswEq29uKsC22mNcCkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10874
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

On 05/28/2024, Alexander Stein wrote:
> Although very unlike to occur (media_blk_ctrl needs 'syscon' compatible
> removed), it lines up with the other error paths in probe function.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> index 2347f8dd632f9..8331db3b4f054 100644
> --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> @@ -841,11 +841,9 @@ static int imx93_dsi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
> -	if (IS_ERR(dsi->regmap)) {
> -		ret = PTR_ERR(dsi->regmap);
> -		dev_err(dev, "failed to get block ctrl regmap: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(dsi->regmap))
> +		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
> +				     "failed to get block ctrl regmap");

Missing \n.

And, a build warning:
drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c: In function ‘imx93_dsi_probe’:
drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:837:13: warning: unused variable ‘ret’ [-Wunused-variable]
  837 |         int ret;
      |             ^~~

Regards,
Liu Ying

>  
>  	dsi->clk_pixel = devm_clk_get(dev, "pix");
>  	if (IS_ERR(dsi->clk_pixel))

