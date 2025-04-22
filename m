Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6BCA964B6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 11:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCEB10E552;
	Tue, 22 Apr 2025 09:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Ie9hT3DN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010003.outbound.protection.outlook.com [52.103.67.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7344610E552
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUZAL+e+pYAtwGp4gk5cU1muZHRySM2q+j015f4XGiVQzdPUhifJ7iKPc4IfhDorwiNCB9HPyZ1Aty3636E2cFsGVIzZWh4/5G5QA4YWGyCYsW/gV5eKLHAdF8DRFQyPtmb2vNLNzX/EFKztBgVvUU5jA+MF+55YYjW2nwPd6VsxBolc/S7uhFd8CcNBk6K62kIzNTphZwZ+7uJtOZAlo4MKLnkY1+r3aw5B0+mlSVAhmYLkWonlsWevBT0HZtxvwc+JH/4GbCESMvrDCukzFa19RGkD1/tHVYWKd2PcXi8lcVlHxEfQdZ1W3depAvxdOKKa+FUfXgKTfquOW/EKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WgLkCcvrmsLz68Yl6o2DmT9ZAh53KP5K+/4Dt7jj5U=;
 b=mreB6Kj68bQp43GASlVSStjYIwvjj/z4DZ5ZJb5f6iq9b+x7pqkPlPVA8EDD5g0Hc78B1BSVZz+uW0Y/1cbgEZH86+yr0wdjS9RiSTIR+WrSbxLNBKhY23/vSffCfgNrZrtU3NR9or4PxBM8uECw/GT9xouh0j2jHXgyuvZjIqBVqCoEJ12JRNZ14ljnkseb3/K/GXFUaOWnyHZdSFxxbTr4FwpuwIjd8YAONa1rBY//sJV6lzeNoqGS8B85dHBmPbe5qICnpewVCe9V1RQd1gZqBlQE+ED/kkCvsYpOHWIN4llLYs0HkzxKMzXr8svgAONdgQCv5orIfHwgPWmKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WgLkCcvrmsLz68Yl6o2DmT9ZAh53KP5K+/4Dt7jj5U=;
 b=Ie9hT3DNfLAVGRII8dZWYOVkevwJcpakKe+VtFJriTU7UTg20Okb+t6aXj+jonY+doHyHmbRoEMjzm8uipL0rK2fDpuXw/Iy8VHqZmk1DJ2vHrxJiWufB+aULoNNa7awnJDoi/PvHR+24vmWuwjZfI2qe7ulqq7Lc95sdkOtJ+ZlexE7c9xEfv96c2Hl1wL5sh7m2mb4ijlGRCC+ZLValD9V38uk1WOuMI8C/AEUMEIC0Wsa3atJTXFeTgSCBaPrLlMAop3unRHbKHu+tYxUr2Bs58hqJdsvxbyxTyg9oSZy9rgSiFhtiPra5WDJK9DwSrjZBYGP57I8pmrGq7Ef8Q==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9229.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 09:41:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 09:41:39 +0000
Message-ID: <PN3PR01MB95971C60303914361CECEB06B8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 22 Apr 2025 15:11:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io,
 Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <f8de5cdc-edca-4a63-9794-207fe91a3edb@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de0a7c1-56a9-4cfc-ffbf-08dd8181e15b
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|5072599009|8060799006|15080799006|7092599003|461199028|19110799003|3412199025|440099028|12091999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlNQUC8zMyswblBwTlFKRGEvalZQUUdwRng1eFMvaE84REptMzVDcTNvU0xC?=
 =?utf-8?B?dDJYbkp5V2JmZDJLa0o4bFhrVFJsQzl0V0FmcDIxS3dNTklPK1JhZ1J0WEdX?=
 =?utf-8?B?ZmhIbHBJQkxiUzJEYkpnSTgzc1Fib1o5WmdnRzhFbGVRVGlqbkZlTE1LYjQ0?=
 =?utf-8?B?VERJTjhWZlN3RDd2eXIzeGQvSFBFb1BTUytmK2pHWE1BK3VOQXF6SU82WE1Y?=
 =?utf-8?B?WGtITTRKYVBlaHRDNHZmUm5wZVNIWThCUUZvZ1kwSnRQbXJFekxENkhaekJV?=
 =?utf-8?B?Uk1rbVNuMDYwWFVYRG5JdFQ3QXM4d0pxZ0o1bWx6andCdHBFRVMvTXp3QThz?=
 =?utf-8?B?aHMvZ3RXNkFSQzVyQUhmalY4WGl3bndSbnplWldzZ3hOMVl3VmMyQ1g0M281?=
 =?utf-8?B?cmRFYm1BcGtraTNoSHdIMExCdFl2VEdRV3pUU2tkRnVCMDBNazYxSGJxdXVj?=
 =?utf-8?B?ekZIUFJSUGorSEZ5MklXWTFibnFkNjlhMzhYZTFEVWpVcVdWSk5jUzdqRnYr?=
 =?utf-8?B?U1ZaV0V2ZFdkWkdiTjQxa2R2OXlZRUUvUzFrRDV0UXovNFVlSDIzOUZCSDFW?=
 =?utf-8?B?R3VlT1ByeGNYakdDNWFTb0d1ZjRuSHV3UTAyQTVscTZFaDVNRmZJS2dZNTYy?=
 =?utf-8?B?dWhicFhzM20wYU5TR3ZqdnlURmZ0K2xTdkVub3g4d3lwYWNRRVZ3eUpqell5?=
 =?utf-8?B?eEUveVYweWNJNjByN0xaTXp2UzA1QzRkUkordHJveTZwS0FZWW05WVYwUmg2?=
 =?utf-8?B?RkVHNk8wYnZFUHp5MUpCZmxsb3Z6VHE1OGZCdUE3Q1pEWmdxcUpIWG1kQ1Yy?=
 =?utf-8?B?U2ZOQ3RKOGNIbHV5dmtqbFlrMFk5c1JCS0prTkNUSWo5QXV3MHpwRmpqc1pD?=
 =?utf-8?B?QSt5M0RNUWE4U1pkVlM2aEJxcm9qckErYzhOclQrWEVQd29iVkNDUmhQZUwr?=
 =?utf-8?B?cnpxM2tub2VXcWdaUytpT2ttVTJvWVdzeWNIb2xvMGRRSTQ0UUpzeGxrVk1a?=
 =?utf-8?B?TW9FaWhIbXpybkR0bHd2cHJxbVZIVzJCT2g2RGdscXZRbk9Ca1k3QWtOUVc3?=
 =?utf-8?B?R01lY1JYVDNjSkhZbEQxU09RUStlektwTkFkS3lhQnEwcVJSdGdmMHlPSDNt?=
 =?utf-8?B?TWF2UFhTaU5lUVNWejcxRUJLN21QdWlxaUtDSXZnMENjWmxMcWFhcW9PNysv?=
 =?utf-8?B?bVRENFNTS091N3BXMnU4dG9OQnJBRklXb21qMWhQZ21mbGtwSkN3dEdVd1Jh?=
 =?utf-8?B?Z3liWnNicE42RVRNZGhuSjlNc1p2aFdudGNQckIyMzMzNnU0RXpRUGlkUVJ4?=
 =?utf-8?B?TkwzUmpnZkpWS1dFSHB5bGFtTFA5NE9NWGNRVUNEcy9sN0NUZnpYRmk5MnBJ?=
 =?utf-8?B?c0l1bG1HQjM5TCtmMGkvSGFMRUt4MTArY1lic0VqQkdidVB0U0Y4TGhtUENB?=
 =?utf-8?B?eG1hWmZ6UmhwWHlGQUlDN1VRR2cvd0RnOGtiYWQ2L3FQdlN5N1RlWjNOZHEy?=
 =?utf-8?B?eFFsc0hjQW1jbVZsVTRlaWc4TDA4ZVZMS2xtOG5XREd0bFpIbGlGdXNTbkQw?=
 =?utf-8?Q?3riNgA+WSwTJ0MqI8AjCs5DhQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU5XKzc4dGgwYzR3aHU4Q3BUVzQwT1V1R0FJWVJ1S01iSWkrbzkyU2xWSEJu?=
 =?utf-8?B?YUJSNklJTnBhLzZLNHN5NVlTbWg3ZFg0V3AzRnB0SGczZU5MMmhzVXZlWUhu?=
 =?utf-8?B?eTI5QjdwNi9iakxZMENYNTFscnBiNS9kOGd3MnJmM0hTMTRRaGF1Q2o3YXBU?=
 =?utf-8?B?YWFqMkRRL2ZxTER6Sktud25HLzA1WDlheWRHQWRvU3B2NWwreCtUUEtRMnps?=
 =?utf-8?B?YnhBTTd5c3BDNFJFYTFLdEFWYXlxMk56SUEzZGUwTWJkR1Z4WFFLZWZoS2o3?=
 =?utf-8?B?SktNZVhERktFbFlMRnpUVmd6Z3ZjTDhuU0dzQ2REZEF1SDhqcm9NUVpWclp6?=
 =?utf-8?B?dE9FTzVTUHZub3g1Qzl3c1QxUmFnLzJ4N3V3QzFYMkwzdTBzdDFBbW45L3R3?=
 =?utf-8?B?RXBQVWlVWFlxYTNNUEV2amRRNG0rd3Q2NkV3MXoyQTBkNitIYjZEdFl2dXhB?=
 =?utf-8?B?Tjh6Z1dDM2VwWU5JTVpTWkpXTjBRUjBjTHQxMnlpdDBkblVEZnoyOVY0NUVl?=
 =?utf-8?B?cGVWaXZodVJxMnQ5eXJxb2ZXSlNLaXNSaDUzejVDalFPT2prV0lXaUdHL0tQ?=
 =?utf-8?B?ajVYUitJaXFVTmMzT210dGxzb2x2djVNMythSU9tT3BnUXdLczN6cldUSnQ5?=
 =?utf-8?B?d25uck10Yy92WUpuMEZ2cElwZTVrY2txaFBzSzFnQ2l1aW1hSDVtVWdmQkVZ?=
 =?utf-8?B?cnlwdHZ0UjBERTFHanFDMHJWQy9lY0JzeExrMEowaTRQOFRjZEU2ZlhIYThC?=
 =?utf-8?B?NFY2MmM4RkppbzF3TDFYZWpjOUhxWS8za0d3WU5nRkk3VW9QNEE1cEUxdmJz?=
 =?utf-8?B?VUloSllaSWpqVU9Xd3hwdVhnd3hJU1pYZkZpNHIydndDRi9sZXkwZWswT0JP?=
 =?utf-8?B?MWhjWWJVamFEUGtyeEk0UHpwL2pDNms5bXFoQXYxQ2Uycm5GYldwTlNDNlk2?=
 =?utf-8?B?KzRKT01kbTBPWVlFZWRyVVJxNkswTittZDVIU1haZ2xNdDQ0YTY4UDhGb3o4?=
 =?utf-8?B?cUVTT1BsOTNlNWUwU0JzeGFVSUJ3eHVPNnNiSTdPZTU1NTViRTdsdkxXMXN6?=
 =?utf-8?B?YmpENE9UdExDTThjSkRsdi91M0J6TnhXclNNc0hvUENCSXRGbmN3cU03b0cw?=
 =?utf-8?B?L0RsSUl6Q1d4YUNkcjV3L09IbW9mTU5tamN5M1RxN2MvZjBHT0FYR0d0NW9j?=
 =?utf-8?B?MmJOWnJwM0ZNN0FRYVBkcHUvR2h3U1p0d1ROeGRTWDVlMG52NHlWbHFLWTRq?=
 =?utf-8?B?cTV3a1pDMng0YllJRUtSMXZmNmhqR21PWldnSnpzZlA5clVGVWpGRHo4NTZP?=
 =?utf-8?B?TFUyZnRNcUpRZGVhRUNCVlVORE1ReU5wTldsZk56ZHVmVWJZVXhha3hwbFdL?=
 =?utf-8?B?d0R2blNQb1lqTTVvQWlYdm00K1h6djdHSWs5V2IraEdZV0JGbzE5ZHQrVjMv?=
 =?utf-8?B?ZGFZMlVBY2o3QlNNZjIzc2dtYWM0V0UzL1ZOd2pZYnFCa3N3ekVLT3BvZVQv?=
 =?utf-8?B?ZU94MS9SY3ZKYUdPMmlMV1BuQysvbE5pVVpZMEVvSnRkS2lzZTFIUWpLcWhH?=
 =?utf-8?B?VkhYaEp4Q1BHay9RZlhXVWpIUkNsMWdJdnc3ZVp0alN5RGFzTVJNWXdXWitV?=
 =?utf-8?B?dEtIWXEvTVM3QWFlUWJVcGJCWGZzUG5ML2Y4bit3Ymd2WFNybjJYV012TzJu?=
 =?utf-8?Q?Cy3lFykaTTk9P0mDfEpA?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de0a7c1-56a9-4cfc-ffbf-08dd8181e15b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:41:39.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9229
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



On 22-04-2025 02:13 pm, Geert Uytterhoeven wrote:
> Hi Aditya,
> 
> CC netdev
> 
> On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
>> On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
>>> On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>>>> From: Hector Martin <marcan@marcan.st>
>>>>
>>>> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
>>>> it's useful to be able to print generic 4-character codes formatted as
>>>> an integer. Extend it to add format specifiers for printing generic
>>>> 32-bit FourCCs with various endian semantics:
>>>>
>>>> %p4ch   Host byte order
>>>> %p4cn   Network byte order
>>>> %p4cl   Little-endian
>>>> %p4cb   Big-endian
>>>>
>>>> The endianness determines how bytes are interpreted as a u32, and the
>>>> FourCC is then always printed MSByte-first (this is the opposite of
>>>> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
>>>> allow printing LSByte-first FourCCs stored in host endian order
>>>> (other than the hex form being in character order, not the integer
>>>> value).
>>>>
>>>> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Reviewed-by: Petr Mladek <pmladek@suse.com>
>>>> Tested-by: Petr Mladek <pmladek@suse.com>
>>>> Signed-off-by: Hector Martin <marcan@marcan.st>
>>>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>>>
>>> Thanks for your patch, which is now commit 1938479b2720ebc0
>>> ("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
>>> in drm-misc-next/
>>>
>>>> --- a/Documentation/core-api/printk-formats.rst
>>>> +++ b/Documentation/core-api/printk-formats.rst
>>>> @@ -648,6 +648,38 @@ Examples::
>>>>         %p4cc   Y10  little-endian (0x20303159)
>>>>         %p4cc   NV12 big-endian (0xb231564e)
>>>>
>>>> +Generic FourCC code
>>>> +-------------------
>>>> +
>>>> +::
>>>> +       %p4c[hnlb]      gP00 (0x67503030)
>>>> +
>>>> +Print a generic FourCC code, as both ASCII characters and its numerical
>>>> +value as hexadecimal.
>>>> +
>>>> +The generic FourCC code is always printed in the big-endian format,
>>>> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
>>>> +
>>>> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
>>>> +endianness is used to load the stored bytes. The data might be interpreted
>>>> +using the host byte order, network byte order, little-endian, or big-endian.
>>>> +
>>>> +Passed by reference.
>>>> +
>>>> +Examples for a little-endian machine, given &(u32)0x67503030::
>>>> +
>>>> +       %p4ch   gP00 (0x67503030)
>>>> +       %p4cn   00Pg (0x30305067)
>>>> +       %p4cl   gP00 (0x67503030)
>>>> +       %p4cb   00Pg (0x30305067)
>>>> +
>>>> +Examples for a big-endian machine, given &(u32)0x67503030::
>>>> +
>>>> +       %p4ch   gP00 (0x67503030)
>>>> +       %p4cn   00Pg (0x30305067)
>>>
>>> This doesn't look right to me, as network byte order is big endian?
>>> Note that I didn't check the code.
>>
>> Originally, it was %p4cr (reverse-endian), but on the request of the maintainers, it was changed to %p4cn.
> 
> Ah, I found it[1]:
> 
> | so, it needs more information that this mimics htonl() / ntohl() for
> networking.
> 
> IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
> while %p4ch and %p4cl yield different results on big-endian.
> 
>> So here network means reverse of host, not strictly big-endian.
> 
> Please don't call it "network byte order" if that does not have the same
> meaning as in the network subsystem.
> 
> Personally, I like "%p4r" (reverse) more...

I share the same view about this. But, we have to respect the maintainers request as well xD.

Still, feel free to send a patch if you want to make this change.

Cheers
Aditya

