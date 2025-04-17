Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC13A91EC9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C900D10EB1E;
	Thu, 17 Apr 2025 13:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="gq8kjB7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011031.outbound.protection.outlook.com
 [52.103.67.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E0910EB1E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpQrlIKDG7S8mBK9U+vNj1qN3K8eLLVHofL4pBpLgEqYSVS5yyyTQ2F1qDEFiKu6oHcSK06v79WvInvArd2u7TH5hIyDV8zJClKgu2vfjw5zItNo6YvhouyMc9zUNHnut/esGezTe7HGMOmppZjA35jL2sZA2c/qpk3h7pw8GTXAdqJKJ8splQ4Eizf5XSXw6VmET7p78HYAvxJTDASGUsYkh4hsINEMN0OGTc8fE8clw6P+mq0x9pi95emM0oc+nFuYxYgq81bkKg3BHjY6bI+7s4zL/79Y4p2PBmIVuIn1pgxoMtl3G7Whs5Wdk07Rt5ZwTwOshEXhZ7GjgqasLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LEnAgQJuvKUFiLLMCrN6FVU4qYHyIpXSU8RxZLp/Ow=;
 b=rln04w3qmCivz0gF1gXSdrEzgNfB5jx/n5kHwZEkTIfR6Jnz5G88lUqbRLHHJ+4xbx1OyS7SSy7o0MpKj3j1nzbHSYNa1MhpO8yS69P7M7nfklhiE2WuDwEtKQbeXMz9MiPC1tRYbplUsGE7qWPTvDiabL0JXEjqFK4BTOYCg6hnFAmLpnwrKztosXKu48vnK300O8whuQBU6WMWBLZSGQjzzdXR6DnSAVet3IArc6ocsbbRzGF/R+CNa+ZrhmcnZJy1kQIsROT2RKMduI82eQ2kZOQ/YjYpq6c2k4cOW9HfterPGoULK/0e7lj35cqfgM34kWHLZfsfcIkCaXfc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LEnAgQJuvKUFiLLMCrN6FVU4qYHyIpXSU8RxZLp/Ow=;
 b=gq8kjB7m95GwhiWwUfYBhaz78coh4mVh2mO2ILla0KxAllMspk4CTw+SSVz9GoMVIDQa4oO18bwulo7W8WibGPp1MC/X2KyJL7SQid+ENTaIkpliAuGOmfLTMfbk7CoVNfLzT8tTVKwo+v2/rnNfEhlKV96FljtMh0o42JVVCNB+JH3+PNNJDmsw8cR7cTeOWgJtdDAA+1e/f0tjQjxqYC9VasHYIeW8iYTTkiVquGyC557ifjQ8SzMcucZU7ByEQN48WvjX7Vivk13gh8beB9v3M4x/c7J1jTwL7HipbmCCxBe9m22+S+Tnm/WYjcP9+YpQW1XEcPAURIFzDq9x8g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB7214.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:52::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 13:53:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 13:53:35 +0000
Message-ID: <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 17 Apr 2025 19:23:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
From: Aditya Garg <gargaditya08@live.com>
To: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0121.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::8) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <c68243cf-8d30-4069-a33b-52a1fbf5c3d0@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f3785c-1c66-4d04-6e5f-08dd7db73f79
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|15080799006|5072599009|461199028|7092599003|6090799003|440099028|1602099012|10035399004|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R21HZlc3Tm5RVGhBaVpIbE5sZy8wcnNYSmR3WEpvVWNZNDJtMDU2bmlUY2N6?=
 =?utf-8?B?dlpIQ0ZQVTJldFBUalByaEs2aXZNbXd4V1ZIbXllR2REZ2ZCeEwyejVhbmRE?=
 =?utf-8?B?aUk4RmxnSys4ZXh1YW1IN1FMUnJJalNsZzRxc2hRTVcxZE8xbkxZNEFtMDlI?=
 =?utf-8?B?TlBGRkF0eDlUY2haa1RuVEpRSGZqUEdaenR1Z1dVVkdmRndCWDM0Q1cvbTVj?=
 =?utf-8?B?ODl6MzdZekk4ZTk4OXpVamp6eldKVWdJeG1jaitESFFZSlMybUlkN043NkpL?=
 =?utf-8?B?b2hPUVhQVmdkSnZ0ZmJ4OExWaWMvYkczdTZHaCtKWSsvMjV1THNndUNYOU1V?=
 =?utf-8?B?SkUzK083eTVJbGhQSWpVdGk1ekp2NlFFc0pETVdEbGFhYjlZTWlmMExMd3dN?=
 =?utf-8?B?YUE3ZUpDRkx5M29pOHZodlRKVmN5SnNIU0R0Smc2MGQ1RU1rREdPdkxiTWhD?=
 =?utf-8?B?RzFQQXVyMUhHUytsL1A4eE5LWDVQNlp5L0dlbTY0NkhDblpHdXdnZVNtVkll?=
 =?utf-8?B?U3c2QUlNeWlORHJvYWpkaVdyZG40YWcyZ0ZJbnZaMW9TeVlNaWZkaUxTNnor?=
 =?utf-8?B?ZE1Oa2RqanlERktneDBBWGc4UTJMcjJEOStXNVRnQWFLb0lWOWxPTk9ZWExO?=
 =?utf-8?B?M25aTGtjbUFhN2FmcDBCZkJ3QzNPNWVxK2kzR3RnSnd6R1FlQ0RUTmdEd3Zu?=
 =?utf-8?B?bzQvQk9heHBhOVQ0djFQcE9PUXVlMDBTVnJ2dmRKTFpYNlUyOHFuMnVjbkhh?=
 =?utf-8?B?MjJKZk5rVUxackpLNVZ2Y1FjcW1xVzBreEFvMUZOM1k0UEdJbVBRa04xZHRt?=
 =?utf-8?B?VEZoLzVTQnVDTUhrekY5cHFNdEhWZXQxOC9yVjlJaWVzb2NhWEdvZHhBYkIw?=
 =?utf-8?B?VkNXK2pHN1RCNVRiSlZUWEVuaFZuWnZCZ09hVU1mR2VtL1YwOWkxU2F0azJT?=
 =?utf-8?B?OVY2WFZHa1pRYmpZdkFmN3YrbFk4OUpESW1hQWlkMVUrZ2pYS1ltZnNNK2Z2?=
 =?utf-8?B?VlQwRGhQUVpuakhOVmI4SHNUWmxEQWhtZnhDcjZ6em1ybUZ1K2ttTWY0NnM0?=
 =?utf-8?B?ZWlpZTJZdElla2x3bm5mVUN6dTI2cjFEa0trdmZtOW5MdDRibGgrWFNkZWUz?=
 =?utf-8?B?cGxOSCsvc0ZLeE9YTXJUajBOWVV3NWh2Y1lTTldWbWVtSnVmbzFBd1c0OGNS?=
 =?utf-8?B?RlE1aVR6RUU5bnkyTWMvUnQyUXpIaENqcmJjVjFpSHY3UWt3a0dmUkZHcEdM?=
 =?utf-8?B?UmZWT2oxbUNQL0x4UTZQU3VKcjVzUjhpNldhYWNaVjdnakRrYkNETXdlSUNk?=
 =?utf-8?B?ZzFyT2oyOFlVU2d6ZGtqZkdiaGpscjI3ako3TjdkU24zTUZLVWE3SnZqVUF2?=
 =?utf-8?B?UHBhRUQwYmdwMkNWY3pmQVExaXhoakw1eEk0S2hMSDd6TkU5Qm51NmlRN2k1?=
 =?utf-8?B?ckNmNEVOczh2TXZ0Yy9LcTFLVUYxYlJzL1FXTDdwekNFYzUzV3hjODlNalRn?=
 =?utf-8?B?eXFQVmRpanM2QnU3K1I2Q0duVzd5OUxmWG9PTEFTempUVklDVndIVUM4TjlH?=
 =?utf-8?B?ZURhVS9oTE83dDBvOGUxRVh0OHl3bkFqNkJpN25kbUpoWDRia3RWaEFDYUQ4?=
 =?utf-8?B?R0Z3NGI4WHlTSGE1b3lyTVh6ZFpiTEJYRHM1Q0ZEUmJrSzJESTI2c243UXlF?=
 =?utf-8?B?bDJnc0JaWHBGOVh6bVpVdVpQTkpVWFJIYzExMVJ6TzJJc1A3dFVRRGVKNGV3?=
 =?utf-8?Q?3mHiTzwxq1A3lQz37I=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE9HSk5SaWV2THkrdG0rVUpnMGN1TjFNbTdlMjNQKzJ6bEdCb3UyNVo2R3E4?=
 =?utf-8?B?ZjBNb2tKSlZMdEJrZWVKN1RnYlBHNUJFRjhmd1dMTDQrOVgyL1pCVi9xOE9C?=
 =?utf-8?B?c3BnOWR3VUhkSTdtaW1oczdYQWRNVklaTnpKT1VZWEs0VDRScDFZb2dOY2Rw?=
 =?utf-8?B?WTBEcWVZTjVyeUhpUDdlTzhoODJyT1BFcExMcDFHVHIrWVVaUTNvdzM3c3hp?=
 =?utf-8?B?SWk4V2tXZGJWYUFDVVNIMlhKaHBXbEkvMkpTTGd6R29hTW5Ca09yV1lEUlhM?=
 =?utf-8?B?VDZ2TmRaUnZMVVVoSUROYmFwUEJEbzhocGhvb1hLQ1JueUhjR0tOTnZhRW1M?=
 =?utf-8?B?WlVQRXU4ZkRDRUVFVW1KTFVtQ1l1Si9TUjRLbDhlRFZkNEM3dmR2bnQ2dUh6?=
 =?utf-8?B?TTBESHZoRXZMRFRjVFFtY2NMaXM1SCtjNUE2Q3cxNnQvckVOczhOMXo5V1ht?=
 =?utf-8?B?Y1p5Nkg5VkNCbnZmL0NNS3VpOUhEVVc2dnZxVVdpek81SnVPOEFDVXZFTk1x?=
 =?utf-8?B?aHRFK241WDJMR1VlcTI1WW1pVit1Sjg0d0FFaDR4QlQzTHVwTVdnamtSWk1w?=
 =?utf-8?B?T2VZMW1yMGJ4R1VONlNBQlpWNXFyWUtybWN6ZjJuMHVaVFdweU5VaHpXcU9n?=
 =?utf-8?B?WVNoekpMeW1SZXJBdW9GT1RhRitYcGpxUDA2WG1DNFNCVWFaSHkxdWxxRnUx?=
 =?utf-8?B?c29lN1FlUDVWS05OZVJlVThRQVBsN1d2OWgxUmRFcHo2emc3aHB6TEdhMm5t?=
 =?utf-8?B?bHZUS1lnRi9HQmhnOUNDVHQwTnJEMUtIa2F6VXljeW1TL1ZlN0dWZHl3Q0w3?=
 =?utf-8?B?UWlncUlBeFlTSGxSNXhFOUNnaDZtNG5SVGtRT1pEc1hITm95UTVYb0U1VUFz?=
 =?utf-8?B?SVY2UHQyTmpGRkMrZmE3cnhiWHdtYnRNREYvR0U3TkZPcG1CVHQrd2FvSnVW?=
 =?utf-8?B?NVJVNVpXbWl4RSsvajZROFFtd1NMRkZCOTd2aDJhTHQzZUhiRVZ0NHZSR0RN?=
 =?utf-8?B?dlBEa1hDL283SUQ2dktBRFk0WFB3SkpnSjcyd1prL0NUbXFsWjZHeWNuRzQ3?=
 =?utf-8?B?SmlkdzQ0NWxDWVJwbFBlNjBxcERzR05xRDFQaHlpM1I1QjF3c3d1WFA4R2Yw?=
 =?utf-8?B?ZlkrS2hwaFUvSTRFU0J5N1p0cVNYUG0zb295UW1TZ1h6cFRXRyt1WW1Td0p0?=
 =?utf-8?B?Wlc5ZzExRys3K3dQL3BleTVYQzNRaWVRSnlaTXduMUVvd0pyVnVvOEVDb2gz?=
 =?utf-8?B?eTBCZlZHQkZqcnBPcWtBTmpsMndFNXFJN3pFLzFvTnVlTkxXWEtUbFZGeUF5?=
 =?utf-8?B?UmJmQ2pqMGp2R2M2VlNUY1B1bzFRVE1BcXh6ZTk3dGlFTzArQk1GMzlHOWtl?=
 =?utf-8?B?NFJCZ3lrRlgveE93QUdLczNnbldwaWhiUVV1dVM4UUs2Wkwya3RLMzFpc3V1?=
 =?utf-8?B?UHd1cU40MkFLR3AzRDRDeVlNMkxCcDJ2c1VCU1NrVnpNd3M1aTNTOTNZWC8v?=
 =?utf-8?B?WU9GR0hVdTVMN1R6YWwyT21tQ0NVc2UxVEs3N1JpWVpnaDZid2pFU2oxdzB5?=
 =?utf-8?B?TDJWL3lqUWI3WlRWQjN4QldrWXhJQ2RFU2swR2R4OUg5cHlJYUJrMCtqdFdw?=
 =?utf-8?B?VFZTK25QTStIZjdwcDY0SWhOZzBVckVMQ2pvUjduSUdyN29TM21xUUcwVDZX?=
 =?utf-8?B?WDRTUGM1UWFSWTNuNFU0bVltZVlTM1R4TWxCTjZSNWRQaXFXN0cxMDYwQlZm?=
 =?utf-8?Q?d2CTomo957vFPv4WOrwVsAPOGnUncfRt65Uhhmy?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f3785c-1c66-4d04-6e5f-08dd7db73f79
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:53:35.7207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7214
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


Hi

On 08-04-2025 12:17 pm, Aditya Garg wrote:
> The vsprint patch was originally being sent as a seperate patch [1], and
> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> them via DRM.
> 
> v2:
> Remove printf tests, will merge later through Kees' tree
> 
> v3:
> Re-add printf tests, since 6.15-rc1 has the necessary commits merged now.
> 
> v4:
> Do changes requested by Andy and add Petr's review to printf patch.
> 
> Link: https://lore.kernel.org/lkml/1A03A5B4-93AC-4307-AE6A-4A4C4B7E9472@live.com/ [1]
> 
> Aditya Garg (2):
>   printf: add tests for generic FourCCs
>   drm/appletbdrm: use %p4cl instead of %p4cc
> 
> Hector Martin (1):
>   lib/vsprintf: Add support for generic FourCCs by extending %p4cc
> 
>  Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
>  drivers/gpu/drm/tiny/appletbdrm.c         |  4 +--
>  lib/tests/printf_kunit.c                  | 39 +++++++++++++++++++----
>  lib/vsprintf.c                            | 35 ++++++++++++++++----
>  scripts/checkpatch.pl                     |  2 +-
>  5 files changed, 96 insertions(+), 16 deletions(-)
> 

Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.

Thanks
Aditya
