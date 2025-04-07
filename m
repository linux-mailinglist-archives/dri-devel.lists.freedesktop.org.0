Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55F6A7DF6B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139C110E45F;
	Mon,  7 Apr 2025 13:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="qSRltc8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010005.outbound.protection.outlook.com
 [52.103.68.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E9F10E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbA04B8N6/V+hBCh+p9DIvXmSfH/dGW2T+YlXHBjtOsPd4hUcipP1QJU0fPc5wTQcql/CL3P/i01NoI0oYVOM67o0ZLSpwD4yK3E6BGbDJmGmvs7CmbzNJEyv+RYmvdUprYrFPyrLh67SVxhs1WSI4Tj/Hn16I1UsTLd8O1uXiFJNlLutbXPvdo/CiGbu5K7lRpC6+hwUeyfwuWzEcawdvHHlN58BmdbVu3kz7cGiDBz4cIvPsXCnFDgxC+h/arTj/1PQzX5B3hPpzBIRNhKlLazFfbDdWl/1u6YUkRx+GaHvOORq9ADYWMRnHDnOODqjav7qkg49v6EwVDk4/zQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BaK2sIbKkGMx/9FF6qJRdXWycczn6mmYQVjFvZlDi8=;
 b=c7edfXewyXYi1n4iW4sU4EYOS9mU6RLK0s8V/wQwHeXfoszfM/ySTlSizBW3S9QMVI0PC1vlFfyzR928LRMFopJ9En91uLmFYmxSou2Ea+O15b36v02p0kScT05YH7eQzVF4fArhlgxTGtGmOJUbQ7jWAu0YeQzzXnFoO0DSk6rOx+m5BVAn3U+yuvrj+kURul4gVWC0zh5YjbHhy3Drl/Qad2sDXA9xC2KRi/WGlMkx/0eUXex8WaQhsBj+n9D7kkBxoWm86T4lWp+GV873/JxtMoIlBMshpXSvPeSXfblDw2zDM3LjbdECwmw0w8xWH2sK5srO0Lf2H6VBIYHA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BaK2sIbKkGMx/9FF6qJRdXWycczn6mmYQVjFvZlDi8=;
 b=qSRltc8ixX/RcD4QEnduyYPUNm9zWFnuHfamisFY27CTMJupkyZV+9Y8Yt29W2xSwLXiF6LvEWoOgRLsAN2X7c7666eaRv7lHCwd1fbf9U6KFnT4Pg5QSa10T85LJYqUnZi+RpZZcQ2d+21UrEJ7FHmt9WuhOt0hgEBZv46TMRVjFdIzOIz3SXylrhBpwAQhJTCZPxBD0MwHz+OmZdy2W3KVHrQREEZj2knvivd/oPYtcYNwh3md0bdyOqlkz/M9TTWH3QBCgNtpxxI1izkPjP1z5gfDfZrgL48F9Y5xpwBA7IYob5ZcoFPN1cvEZAt/vfAh2p+A+CoxUbwfHSZN2g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6823.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:94::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 13:36:14 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 13:36:14 +0000
Message-ID: <PN3PR01MB9597648B255711A92FB88522B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 7 Apr 2025 19:06:10 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
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
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
Content-Language: en-US
In-Reply-To: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <e1fbed94-50c1-41d0-9eea-4c68fcbe9a7e@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6174f1-33f6-494d-8862-08dd75d92af9
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|7092599003|6090799003|5072599009|19110799003|15080799006|461199028|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FyVlRSN0tWdmJGS0Z3L2JUNTNYZW02alRPM0VEdkFvUlJsamdvM0ZybVdn?=
 =?utf-8?B?cGxTZ3BtVFYydml4aEVhSDYyZ0lMSTMyTmNNZExVOFE2YkRjc3FFQ3FHQWx1?=
 =?utf-8?B?K1Vvc3I4ZUxxMjRkMVpPd1BqUXBKQ29Wc1E0NFFLTWhHSHBoT1YrRnljaGgr?=
 =?utf-8?B?ODVWdEhmcU95RzE2OGNlOHVmaTVNblNXdGFnM29HNjRjZWFNbkFXdnZRcU9h?=
 =?utf-8?B?MmwvMm1WY0ZET08xVkZWRlFhUzF5Z3RPSURpMVFWR0NkSzRycHlUa0ZCcEo4?=
 =?utf-8?B?b0g4SUVnOFJIZmhyUGVuVi9sS1BDd1lkRkc0QXo4ckpSc3htblhnV0gzL3Zq?=
 =?utf-8?B?ZjE2dUJXa2ZJcEw3RjFxdmtGS1JzZUJueWZid2pFOWtNalZ2QnVKVExuSkwx?=
 =?utf-8?B?U1o4R0NvczdpWnNxNFQxTWQwMmJuQ3FaRlZYOWEwN2NJSE5ValVBOW1odXdt?=
 =?utf-8?B?c3ZIb0dlZ0I3NUhiTXZlR1RHUXlOT2R6OVdNR1FqbTFycGVES3RRREN4ZElP?=
 =?utf-8?B?eWk3Y3A3VUZDVTVmYmNyZTdLME5vak9sTURla1N4c3NmN1RVaHliUWhDUnV4?=
 =?utf-8?B?Q1piUHMyZXM4dXNqK0tlQWF2bmlwSlN2NjB5Z3d5Q1VrNTZCNXczenFKR0JC?=
 =?utf-8?B?VGo2WXc3NzhrRTkxZ2hESlBvaDJiUkVXUmRrNzhRcEtqbmh1ZjJUL1FnSWNm?=
 =?utf-8?B?dk9NWVRjaGg3NjlBTDV6cThUcmluR09ndzljWVRjYnM3SEVKa3BTTE1sNHh5?=
 =?utf-8?B?ZTEyQkxpV0lrR1RVSm9DeHkzc1AzaDZxU3Jzc3UwclZhTE1TOWZFN0ozTkNi?=
 =?utf-8?B?V28wWXVvdGFjdDJtdXQ1Y3BRWFN3dUVMNTNvTDAvN0p0ZGN5d3JzK1p1TWJh?=
 =?utf-8?B?Vlh6UzBubkYwSUV4eUdURUJlRXBQcHpXeE5qK3UzNXdSSFVMeTI0SWZINS9H?=
 =?utf-8?B?dzNUL25ZUnU3aFdRMGczRVNLcUhLeGp4WGQ3dXUzZ2JQc2xNZkZrYVZreUJV?=
 =?utf-8?B?OE9pS3pXL0FBd092Y3RxVm5OdFc3bk1JK1BPbGFoYXFMZHNYaWsxZzB0aWp5?=
 =?utf-8?B?YkU2ZC94amhWRFRNTnRRZEVZM3lKWHFrSTJZWHA5NllkbzQvSjRHS1liTThG?=
 =?utf-8?B?UEkyc1JQRmw4d2lJNUQ2MTQvTnVPL09ka0wzQXpCM3FBblo5VzlWM1Iwd3ZD?=
 =?utf-8?B?TjBwNkM4SkVCZmpWamN1VWRZcHUyVldSMisza0ZFSjZkckxOaDRsMGxONFIx?=
 =?utf-8?B?NWxzcGJRSTA3eGZlTWlzME8xQ09CYjR6elI5R0w1UzZXaHJQRnZoaXJrTE5F?=
 =?utf-8?B?c2pVME80NVdRcTZvRmk0SVVtSkYxQnd0UkhmblNhUGhleTFwT29OdXF3Zk1k?=
 =?utf-8?B?VHpPSFloOFlPZzlOZTlZMHFIQTBKZVMvMVg3d3VlRDBpd0txTFRnUGJEZWdo?=
 =?utf-8?B?UjRVZlBFbkE3eUpGK0kxS2MrNFlUUUxwc0x6YVFUSkJ4RTBENzN2MmhIOVVk?=
 =?utf-8?B?bmFKeDJJbzNaTmVtY1F3cHNrNnhkL0lUaUhBOWQwYzFLcTNJZTFsMFF1d1Q5?=
 =?utf-8?Q?4WP02hfU55SHFldYIopA7bNYc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZKNGF4L2g2bWZZdUlYWTA3VVErMmhqNFEwRTA3NDdGK1YyZTFNVm1WQ1h0?=
 =?utf-8?B?NXc4MmdEb1JVM2VQNi9sTmhzcU5kK2RtdUtlYXRBQlg2MDMrV0RSSTBlU0xi?=
 =?utf-8?B?RTljQnVyNmFpT3dnWE9Wa0pFZjFiVjM2RHhoUTZVWlVzY253a1E5ZXBoVU5u?=
 =?utf-8?B?YWRzYVQ3alJOOFlHQzBGZzR6MnNpNDhaNGdRVmJRakdKNkhwRGt5UHp4Rnhu?=
 =?utf-8?B?eWUzQzNwei9GTnUwb2laYlV1NEZ1VFNycTQzM1lRUUxhYXJhSGJmYXB3OHI3?=
 =?utf-8?B?RnJCQUttVmR5cllHb3YzUkxkQUNnMkpqanRscjcvYUJMelJmU3hudzRlaVRq?=
 =?utf-8?B?bmQvNXlPT3c3L3FpRTQvN2k4c2Uxcm1yaHNkZ2l1ayt4aXRNeUxVTGxHd29C?=
 =?utf-8?B?ZkNJNUkvU21pQmJidzNZVDdBdmExVDljNlFTY1lqWUpES0pUV1NuZ0FxSlMx?=
 =?utf-8?B?NkN1b0Y3clVJc0VhK3ZyampjMEZYcHJqdU44Q3IvNGUvallYdFVIa0VYbTFP?=
 =?utf-8?B?Y2U3eTRhQW8zM280Sm5CbjM4RTNsYjVSZkYzVlRGNUFiWnU1aU9wZ2F4Z2lR?=
 =?utf-8?B?ZEk1NGc4cm43Y1lwZEdERFREZWFZR1NmNExNb1pkUWhWL3ZyOHpWUlB4dmgv?=
 =?utf-8?B?ZVh1L2FBaXMxUVFCWEJVdjl0N2paS0M0VEltUFkwN0cxOXRFcE9oRHVGWE15?=
 =?utf-8?B?U0hnQ2h6KzhFRWtjZDdtVThNTWVqNjBkUERpa09OdTdaYTdYU3ArcjJERklB?=
 =?utf-8?B?RlVzSHE4MkNiSG1QTjl6b1pMcThJTHdERXljOUZTRzdGMHdoS01keC81MWRY?=
 =?utf-8?B?d1NRYkRNTGQzalVVeWdtMUJMT3JCYnd1VHZPZGIxcldHNEZmc1dZdXI5YXps?=
 =?utf-8?B?SnJFUGZ6UkVWMUdkR3VheXpEUE1MSWRmNDFvVDRHa0hyYjErNWZBYy9zaXVz?=
 =?utf-8?B?cmlyL2ZXcFZ2V2ZSZzZIbXdjd3dBejVaKzlPTm9KaWdUYSs2T3ZUOHFTWWVF?=
 =?utf-8?B?eGhBRjF5b3JRSVdNWGhvYjdRb0lPbjNWVUN6U2NzODJNWDdBSmlTNVkrNGNx?=
 =?utf-8?B?YS92Ty9vRE03RWpNNWMxclptcnZmcngyQmRUNFlQU1dDaGd3UDhwSmp6Uyt4?=
 =?utf-8?B?ZkNscVR2ZXF0TUVDcDUwRzJGRXdWZytjT0JLbU9DYW5XOFZsRTBuYytsaXht?=
 =?utf-8?B?S1NIaitVZnMzUFIvVDJHOUVvUERKcEovaU83YTFJVDF1Y2VzVVlYZW5ZL2hw?=
 =?utf-8?B?L1dscVNWMk1HWWliZmVCYjdJalpLZ2FxUW4xREkvODNIVlNac3hzY09naStn?=
 =?utf-8?B?L1cyVDJ1dHZaU01WZmN2ZFBYSWYvUEpzbnFkS0VKY1RnbzFtMnE1bzc2VDVU?=
 =?utf-8?B?dittekxlL1lqUTJWVWFMK1JhU29xcU9GWFNNaGF6bExPc1FDMktta0VZZHdn?=
 =?utf-8?B?R2ZwVHZNVkV3STRMNDY1cUQzMVBoQUNjcGgwVUpsdW5sUHQ4U01oano2bGxa?=
 =?utf-8?B?SG5lWHozWkpjbGcxQU5qNVZmMU9zeC84VEFpYWNWZGpBSThGWXExY3pBM1dl?=
 =?utf-8?B?M0c5ZmdhZHRCU2EvZ09KY044aW1KNUVHVVB0RFhjVXUrbjBNN0poSE55R0RI?=
 =?utf-8?B?TFJ5KzRhUmN6cEc0YnY3ejRwKzNCSk5CN3Z6c2pEQXFKSThNdkpENkRBNEVu?=
 =?utf-8?B?VkVVbU13bDFReDRuT1ppQlVnQTBaSXBMQnVoWGthOUJ3clFoWEpvQU1wRE9m?=
 =?utf-8?Q?mM2jt6y0t5xSyFk/txKNwjA3A164DFdwB1YxNd1?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6174f1-33f6-494d-8862-08dd75d92af9
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:36:14.7747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6823
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

From: Hector Martin <marcan@marcan.st>

%p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
it's useful to be able to print generic 4-character codes formatted as
an integer. Extend it to add format specifiers for printing generic
32-bit FourCCs with various endian semantics:

%p4ch	Host byte order
%p4cn	Network byte order
%p4cl	Little-endian
%p4cb	Big-endian

The endianness determines how bytes are interpreted as a u32, and the
FourCC is then always printed MSByte-first (this is the opposite of
V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
allow printing LSByte-first FourCCs stored in host endian order
(other than the hex form being in character order, not the integer
value).

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++++
 lib/vsprintf.c                            | 35 +++++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 4bdc394e8..125fd0397 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -648,6 +648,38 @@ Examples::
 	%p4cc	Y10  little-endian (0x20303159)
 	%p4cc	NV12 big-endian (0xb231564e)
 
+Generic FourCC code
+-------------------
+
+::
+	%p4c[hnlb]	gP00 (0x67503030)
+
+Print a generic FourCC code, as both ASCII characters and its numerical
+value as hexadecimal.
+
+The generic FourCC code is always printed in the big-endian format,
+the most significant byte first. This is the opposite of V4L/DRM FourCCs.
+
+The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
+endianness is used to load the stored bytes. The data might be interpreted
+using the host byte order, network byte order, little-endian, or big-endian.
+
+Passed by reference.
+
+Examples for a little-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	gP00 (0x67503030)
+	%p4cb	00Pg (0x30305067)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+
 Rust
 ----
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 01699852f..6bc64ae52 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1793,27 +1793,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
 	char output[sizeof("0123 little-endian (0x01234567)")];
 	char *p = output;
 	unsigned int i;
+	bool pixel_fmt = false;
 	u32 orig, val;
 
-	if (fmt[1] != 'c' || fmt[2] != 'c')
+	if (fmt[1] != 'c')
 		return error_string(buf, end, "(%p4?)", spec);
 
 	if (check_pointer(&buf, end, fourcc, spec))
 		return buf;
 
 	orig = get_unaligned(fourcc);
-	val = orig & ~BIT(31);
+	switch (fmt[2]) {
+	case 'h':
+		break;
+	case 'n':
+		orig = swab32(orig);
+		break;
+	case 'l':
+		orig = (__force u32)cpu_to_le32(orig);
+		break;
+	case 'b':
+		orig = (__force u32)cpu_to_be32(orig);
+		break;
+	case 'c':
+		/* Pixel formats are printed LSB-first */
+		pixel_fmt = true;
+		break;
+	default:
+		return error_string(buf, end, "(%p4?)", spec);
+	}
+
+	val = pixel_fmt ? swab32(orig & ~BIT(31)) : orig;
 
 	for (i = 0; i < sizeof(u32); i++) {
-		unsigned char c = val >> (i * 8);
+		unsigned char c = val >> ((3 - i) * 8);
 
 		/* Print non-control ASCII characters as-is, dot otherwise */
 		*p++ = isascii(c) && isprint(c) ? c : '.';
 	}
 
-	*p++ = ' ';
-	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
-	p += strlen(p);
+	if (pixel_fmt) {
+		*p++ = ' ';
+		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
+		p += strlen(p);
+	}
 
 	*p++ = ' ';
 	*p++ = '(';
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d22bf863..44e233b6f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6891,7 +6891,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.43.0

