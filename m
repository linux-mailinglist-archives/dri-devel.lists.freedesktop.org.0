Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469AB9EB49F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 16:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE4B10E124;
	Tue, 10 Dec 2024 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="LduowSd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2104.outbound.protection.outlook.com [40.107.249.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E85310E124
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUfntFzKMJKJRYw/W5myFUnnOHeOQw/hyjY1jRwCHAX4y5bQ5NmW5vt8Gyk8tSIIAMCuz0psOM0OuTU7O44NdEGRArzugzrj7r/bD9WPBQHavfeK9d4e0U4JdtHP1SPKiBuPZRRhSi1Mmhp5hZ45MBFGoCsoSCMxHUwGiM7clqMSKFykPdrylsVD6IlH2UM/uieoIGDG+Np9BwCKT0umSrpJOIVXSqaPl7Bqjiy1UDAhScousruRn6VwPsB+saurtmZXD1m+pl0ZHxdOnwPQe4wFKE0HlbuU1tSRZP3l+TGrcYaXA6QF6+3Pd3rXs1YUQXbXmbnYd4AlGVUAU+FJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTHmssGO1ueKZWSkV2LPA/kHO0/LMIR6hu2nJcqyeR0=;
 b=RvmOsshStj4IcXf4YUz3R9X2/XrPlxnHE1kxuj9+ZT6fOn9V65ByrRBVBoH+sT6zKpM5x2uwcfd4fAg7Z4uHdW6zwTpK94uGLvvZsMJ1EqWydzKSKrD7cUtEbjFDC8lESBOBzW437dAKypCPaZwOIbWqe3kiFpdBwXEU/mlKgvk3hSRfDIEwrDaJdfJCYIzoeSIyFEfGW7VOsiL4ksopnDYKvVQY0ljNLC1b2A8w+Dh7DE+ka3WYnOJ91DotPY2n5Nq8tqaUJsHNx0bgqd7bYzft6DlHu3q1wbS/C1s7rBKIQPPZKnLCUQ+LrQV/spBegaDMHqHlkzasPaelmiOyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTHmssGO1ueKZWSkV2LPA/kHO0/LMIR6hu2nJcqyeR0=;
 b=LduowSd/oVUY0dCq4I6INT+FRGf+1a1JglAXP73B9CXu4KKiJHOEO4nkPzafuVO4hVzKPI09wANV6/H1zP5t5PxAKmWm9L65NfbMXDov7zxEOnc1abFhL0q+5sZnyVZx0A0Pn/Em/PZm/ftnXu7061AcuuxpSAM/jpIc3Lxc3bI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PA2PR10MB8512.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:419::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.12; Tue, 10 Dec
 2024 15:21:10 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%5]) with mapi id 15.20.8251.008; Tue, 10 Dec 2024
 15:21:10 +0000
Message-ID: <26b95b57-05b6-40c8-b64c-2cb1ae5e8454@kontron.de>
Date: Tue, 10 Dec 2024 16:21:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: adv7533: Reset DSI receiver logic
To: Stefan Ekenberg <stefan.ekenberg@axis.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@axis.com, Biju Das <biju.das.jz@bp.renesas.com>
References: <20241119-adv7533-dsi-reset-v2-1-e12cce42e25a@axis.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241119-adv7533-dsi-reset-v2-1-e12cce42e25a@axis.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PA2PR10MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f7e063-5b95-4298-6e57-08dd192e46de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0MrZ2VRNVVnS3NRRXpmSnNJYUh4Sms2TnZCdmFYUkhIQktxYmF2R0w1bWcv?=
 =?utf-8?B?akhVTDZhK0JsVHo5ZzRqWWZmdmpxbVFnZ1NEdS9NV213ZG9xZlJwdUx3Zjda?=
 =?utf-8?B?bUZBTHF5cnVCVWJJRUVudzZwZ1NaZm5YNVU5STg4MzVIbjZZYXJSWncwVS9Y?=
 =?utf-8?B?Ky9RdnY1bVlBVVIrNkZmUFptN3pxN3BZNGRSU29xWTZHMFp0SG5jemx6NVQ4?=
 =?utf-8?B?R1M5alJzV2dhNmk5cUNseXdnYTVEUWZTZ0c3VXZreVFJelZZWW8vSEZJKysx?=
 =?utf-8?B?dFZSU3E2OUYzM21TTVQxMksrNFZlWHhQR2ZjdExwWUxTTVk5OFFJRUxESXdK?=
 =?utf-8?B?ZzNGQnhlbGdzUkgzN3lrV2dPSWJPTXF4aHRnYTJMalFnQUF2RDNZcTlZZU1U?=
 =?utf-8?B?TzNON0FxMk9GK0xxYjJlYWluL2EyWDV4cG5oakhmYXpjaUNubjU2ajVzcW1R?=
 =?utf-8?B?emQwQXI2VnNpeWNqeS9WM3hIRER2dlFManZaakw1OTh3TllaNk1yMHlEK1hF?=
 =?utf-8?B?UFE5Tk04UUtId0N0MlZ4WWFQRjlHY3FzbStFalhIeHBTVjl4RnlpWHM0alM5?=
 =?utf-8?B?OGNqaFJjUHEwbkxsemhoUWpRWktQV1kwZDVWK2pPMEl0dlJ2TE12dkVUb09K?=
 =?utf-8?B?SnBkL3c5dU5HWlJzK3hFU1dNYysrYVhZbCticW52TDBIYm14cndldkRpQ1dt?=
 =?utf-8?B?TnVWdTZDOUFtMlhnc3V6cW9ZRjNQYnE0WEtETjV0dExvcjBZdWo4N0NpdDFP?=
 =?utf-8?B?Yjh5S2RoZG8vS3R5S0V5UXRCTDBKMjA1YmNlL3dYaWNkOG83cDlUODloOVB1?=
 =?utf-8?B?UWpwOTJQZmRTZnVDcFUya2hURzJGaGFhdkcyS1ZJbmpLVmhPMmdKeGpsbTlF?=
 =?utf-8?B?UEpsdE40MWJkSTMrOGZnOHFab3hlbnNTTnZnRHhrQThJYTRRRU53MjduMEpG?=
 =?utf-8?B?OHM5Q3l6Q1ZRT1BYU1QzeUQrQ2p6Tk14Y2JUbG1mYm9UeWVibkUyUWg0QUJX?=
 =?utf-8?B?d29vdk9uMmgrZDNkYUVSbUZWMWdaK29jODNZdU5yOE8xU2x4MzM0NW1aZDYx?=
 =?utf-8?B?Q01pSjUxa2oyQ3B5S1VFeXByQ0o3blJFNDFnd1ZOWEJldERwYnZuU3l5Yk52?=
 =?utf-8?B?eS9zTzRrbEFWNFBMNEdPODY2Z0xuTld5Kytld0tBQWtrMVhuWWxoNUNWa2hW?=
 =?utf-8?B?dTZLRTEzSk9vaE9CR2NzdGk4eCs0dnJTM0pTZWZic3lZQldZRW1oV25sMjFu?=
 =?utf-8?B?RDBVbExKTk04SUYxcUxvVE5FRFZQYktQQ2E0T2RXZEMvcUNPUW5hdkFlYlds?=
 =?utf-8?B?U1ozUnh6bHNsU0NSNW16V0tkNHR2NkJrL0pxWm40Z05TZ1NtWVFic3d3UW1U?=
 =?utf-8?B?QUtLRlAxcWJmWWVVQlREeUNpTVRsTmZNUUZkZlNaMW5XVkw0eFRJTjNubHRy?=
 =?utf-8?B?REhtRTNua2hybzkzWHkvZXplTTZGQkxReWpLSzFrWGhqOUFHWG5tWVBYcyt4?=
 =?utf-8?B?N3Y3ZkV6VzFEQXEvZmVyZENpVFR5RFlqc1NXNlRwSmVKUFh6TitWMW1mRG0x?=
 =?utf-8?B?MDBqUExRSmQ3a0JQa200LzRaMTlFZHk1RmN1TlZvQUxIdTVrK2tnbGwxNEtl?=
 =?utf-8?B?WjloWXcwS29WdVF3WnpabGt6VzVjRkFOekZmaG9QQUwySVJTMWdOcnEwZGl4?=
 =?utf-8?B?RjRMVFRUMEhDVExpZ1FGdFdvUXp2T1VMdlFSeDZqc0NPd1VKV2xWeGRUU1FF?=
 =?utf-8?B?SVZJcXprbU53SVhGalQxQlk1enZ0dXgvbUZkdEJSWnV5eWt0L2hQa2JrdXpK?=
 =?utf-8?B?WHV1UXpFdUZOVnFtSnhwL2hpWTQ0MzBwdDF4WTBJM1loeHRiNGx1S3duakdx?=
 =?utf-8?B?K04zdGtRblZUd2tOSStvSXRQOS95UmdNTzI4dnA5KzBnOGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUpabUcybkR1b1AzSnRTRHhveU41VlllNGJ3V1NPenFnTVFRRkhWQVVaNDdQ?=
 =?utf-8?B?MTA5NzVBWWZ3K1hYZWJ3dS9WUHBpNTEvNmVSd3BkZnNuZmdyaHF3QzJvcUs0?=
 =?utf-8?B?d2x2dHFvMFlJZkV5T2t4VTVUTHNvay9sbk9yeGVod0w1ZFFQaUdQR2RhdWhv?=
 =?utf-8?B?aFNkV1VSdk54Z2ZQZFhoTFFscC9yVU5tVTl6UUk4QTQ2dWNxNCt6RkV6Z21Z?=
 =?utf-8?B?UWNReEJmdldINnNQQ2dTMGhMQmcySnpKOXQ1aFBrYTZHSmNBbHozTlB0SmFG?=
 =?utf-8?B?bG0rOFBHRThPbGtvclpjb3NVQ0R0dFFyblhONnN1SmtoYnl2VEJLNFNFZmdD?=
 =?utf-8?B?UkgzNXFSN1AyeHFHNTYvMGpaQ2NWY0gzSjJDVkkxWlpvZjkvSmdQQ3kxOWQ5?=
 =?utf-8?B?MTNFaGx0TGlPU1JUVExHYmh5QVF0V2NLT0ZYNVBIRDc5aVpiMGFUd2V5UEVL?=
 =?utf-8?B?eTVwWS9KYjE5QTBHWjVlcmw5NTI0NUFkZEVPU3R0bXJ5NmNPWHFMMXNzKzZ4?=
 =?utf-8?B?emxaTUIxMHl2STcvcDJtUGJwOTVZMjg2OG84RDI3U05rdDRWb3hEelFSTDEv?=
 =?utf-8?B?S1dOeHpQWnpJS09CbC9FaXlTdEczY1h5SmFBYU9wQVQ4aFFMcHFPL3ErSEVw?=
 =?utf-8?B?RmJ6Y0dxbUQ3bHJBRGZkTVB4RDQ5QkpOeFRMbXB4dUFPbDkxdG11ek5XRjRE?=
 =?utf-8?B?UkJJYTBXcUN4eW9vZm5lakt4UE5WQVE1MlhvRUFDc2RBSForR3UwL3owRFBp?=
 =?utf-8?B?TXJyVVJCUzRvS0FLSU81SHJ5TE5DODA0bGlrMitGT0FWV3JvTERodkwyazNu?=
 =?utf-8?B?aU5TTC80T3hvSUF1Q010WWx1Wjlnd09BMi9UUWhQREJrSGl0VlBNL2p0RVly?=
 =?utf-8?B?aktHV3N3UUVVTGRLZWdDM0VaankwYUlsa2V2Ujk1dnU3UUFhWWZpK0QyaGl0?=
 =?utf-8?B?RGNYaVNUdGtRT2REU1gxWE9zNjJNaEMxUWYrNi9Eb1NLUHVHLzFlYS9TeHp6?=
 =?utf-8?B?bTNFbmlXbkxncUpPdW02VGxFZnBQNm1pZzdaRUtuVnNoS09Vdno0clRaT0VT?=
 =?utf-8?B?ZEp1VVA1aDN0VmZPS3hYTDlvc1pVMVFsRkZaaXMvcXh3RGM4dGRXVVFobDRH?=
 =?utf-8?B?bk5iU3EvYzhTMmpFUUdPREY3NTVNK3AyRThSa0dPSlhMclZ1QmdTdStxME9M?=
 =?utf-8?B?aFNYK2h3MU1XRzd6TjgxMWEzS3Zhc3BuYXIzVkFOemx2Y1ZCVlB0VGNRQUVR?=
 =?utf-8?B?MmJsY01zTUUxaTBUeXI1dFpEcGE5VjA4WXpBbi9ZQnNxRTczeXhuUi8vVjl4?=
 =?utf-8?B?SGxMWXhGMzVXUVBnTkZSVFphMzZBekFRL3hSNmxtR3FrbDBqSkpmV3hRS0c1?=
 =?utf-8?B?bjVwb3I2M2k4T2oydUVNdGxvUzFjTWVRaE5rbk9WT3l3R0ZJN3ZrOVJ2ZGVr?=
 =?utf-8?B?Sm9PLzlsWEdSOStBOHVxQnV3RUROQ3RlbDR0MVJ2aFlFNHNiTjhJT09wT0J4?=
 =?utf-8?B?ck1xdk5iaVNlcDdHZHExRFpoNnUwUXdQZ1NKZ1BIN1lJVmVLT0VURkdyL3kr?=
 =?utf-8?B?WUNvdG90ZmR6M3lFR0FvZjZaOGhlTXV4bHdUSGQ2cXpUeW9nVWVzdnN2OTlt?=
 =?utf-8?B?U0R2TnBFVVUwQjVESHd1TWlXMUZTWVdFQlllQ1NaeDB4Qmg3TWdqT3J6MEN0?=
 =?utf-8?B?RDFFZkNqeGxSMU5paHBZbW0xckJvVXpWTklIMklwU2x1Q2VSeHc5bENSQ3dl?=
 =?utf-8?B?TENWbGhHMDF3S3R2R01RbG1uVE4rWEFVdjJYQ0xKcVR1NGh3MXFhaXJrSDNl?=
 =?utf-8?B?WnRKc2ZVU0gycjVocFQvc1FaaWtRZGc0TENjZld4SWYybXoxbVl0UWJYc1py?=
 =?utf-8?B?cGljV1I3a283eTFubndMaWVOZjVvUzlseksvazIrQ3lVRlN3L2cveDlmZGZr?=
 =?utf-8?B?cWRuejNXMFp4NmdtblJCaytWOFJ4Yy9NT2JQdjB4YnZROTFsZXpmbVBkVFJB?=
 =?utf-8?B?dkhsNFZWejFnTEl4T2FUWDhQTkhFSzE1eUIzL1JFcmhtRElVWERDV2NNczNx?=
 =?utf-8?B?bnNFVTZ6SUY3M3VSdWxGS21IR3ZBZy8xOGc0eGRicHhlUmZmVHBXOGFFbnVU?=
 =?utf-8?B?SlNzTC9VWGFqdVJKRDVxb1dMWjlKRzBnNTViZ211YnduNDdSajErRXRFUVlU?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f7e063-5b95-4298-6e57-08dd192e46de
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 15:21:10.6119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrkDGd7CSu9e7lWw8BID74z60YxsijWX408+pyZkUZtOZESjyZtZQUmlphcamVDsKhmJCwBlGzJu+vrXfZIjTH6oTUDzTJBezAxnVsmXetU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8512
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

On 19.11.24 8:42 AM, Stefan Ekenberg wrote:
> Reset DSI receiver logic during power on. The need for this change was
> discovered when investigating issue with ADV7535. The symptom of the
> problem was that ADV7535 continuously outputs a black image. This
> happened for about 10% of the times that ADV7535 was powered on. The
> rest of the times the image was as expected.
> 
> The solution in this patch (placement of reset and sleep time of 200ms)
> is implemented as outlined by the Analog Devices support team.
> 
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>

If this is a generic issue for this chip, it would be great if we could
add a Fixes tag here to get this backported. Depending on the scope
(ADV7533 + ADV7535 or only ADV7535), candidates would be:

  * 2437e7cd88e87 ("drm/bridge: adv7533: Initial support for ADV7533")
  * 8501fe4b14a35 ("drm: bridge: adv7511: Add support for ADV7535")

Thanks!

> ---
> Changes in v2:
> - Add Tested-by tag
> - Link to v1: https://lore.kernel.org/r/20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 4481489aaf5ebf164313c86cbf3447d2d7914ab9..93085c2b872ed98f4ee394236dc66c568c0e5ccf 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -67,6 +67,15 @@ void adv7533_dsi_power_on(struct adv7511 *adv)
>  {
>  	struct mipi_dsi_device *dsi = adv->dsi;
>  
> +	/*
> +	 * Reset DSI receiver block logic to avoid ADV7535 startup problem.
> +	 * Without this reset it sometimes continuously fails to receive
> +	 * incoming DSI packets and outputs black image.
> +	 */
> +	regmap_write(adv->regmap_cec, 0x26, 0x18);
> +	msleep(200);
> +	regmap_write(adv->regmap_cec, 0x26, 0x38);
> +
>  	if (adv->use_timing_gen)
>  		adv7511_dsi_config_timing_gen(adv);
>  
> 
> ---
> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
> change-id: 20241108-adv7533-dsi-reset-488c6fbb5e42
> 
> Best regards,

