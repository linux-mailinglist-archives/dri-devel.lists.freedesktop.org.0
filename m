Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21784A7F534
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 08:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714E010E5DA;
	Tue,  8 Apr 2025 06:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="qd/AaOhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010008.outbound.protection.outlook.com
 [52.103.68.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4707C10E5DA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 06:47:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmqbyPsrd+LN2hcav401KHDPWO2jppi+b7rbFI2HXBztTNfLotPcEwP7xURgXB9G0/iuW2JNdZMhMFGonBwFOv3qvQDvTBkOwL0v19Fxl4FK80b39KIKQLoGguuyP9ZNR+SWTiVUkCCIQGsn2F770scdOn80cqHwhl/Hr33lA8jhblrf9xeqtKHPUytK25y6J5A98RPpqDIV4/oUnwhG3hamCs5QY8vK6YCZg4lTrZ3TY2RveUks/C55XpQ0CVF2H4QlcLbOInI37FCGlMRp1//3WljF2TdmvZI27yAeX9VFWkjh+gISe9obLfxeNp+hCK5ty9+EmSlwDtpwz1iNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tDbwf+Nkw/iedBdr57HEGcZeBIPMWrMUi33UG8jnTk=;
 b=hKS5kJKnjxBEUG6n+vQ8qKJizErnNiz3BdhRhlYu4fnPj56+irkycLlOuWrG2JDQW9p9gpSXoG5/OfdMG6FYRiQ68q2GmnBwYVm+tuH1tnTNJiOHabPS2M6tC8YOWm6mDqoIMnVF1ouve90ehTDg0yMxE9PcXTZCrJeEr1wcgKpD0lcZ+1y4HoZOAgMuhpsk8r99+OSrIE7i6lF7qCSP/KenH7nLaua7vnpHTTZ2Wg/91398fjCIiWTHR0uzl8NHA5VZ+WLBcNFFxFh4t/29PRMqljsxD5JuoOXH4je2o+Q2r4S0pVYCoaz6c5iozzlLNGZlD0l0+dIPCRpL1LdSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tDbwf+Nkw/iedBdr57HEGcZeBIPMWrMUi33UG8jnTk=;
 b=qd/AaOhy77psxhiIZPNAShyL2qVpBmOPcKFkKcohltVWgX8kQQdF9PJGUngex0figxIUH5VVdZmbrH566hxdN7N7bhBNyvvy+F1pMnF1wFhO1UJFPq6lKyGrwvWskXh1dMCbeXRKDBSb1l1x/kBl3aUgPsafvfZezeMNarJPBgZXVJDanXVWKpkoMGBniCgqvWnmAm2ULJQUXVLFm8zg7kAS2OpoSAEDQXGB4ZL2PgOmIzsGcBISr1zQkyAWgWTXSyWTUBTXgmsiw/F1krthtzSllQWvd6k2hsJJCnr3UvNDX9FJdBGpKH+4FTZ47MQm/rcqCl1kpDorlXBTE2grJQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB9207.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 06:47:18 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 06:47:18 +0000
Message-ID: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 12:17:13 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
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
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v4 0/3] Use proper printk format in appletbdrm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::22) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <ca2cf510-6630-4b64-a14b-6ec8231354c5@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab9f942-11de-473f-9717-08dd7669347e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|8060799006|6090799003|7092599003|5072599009|5062599005|461199028|1602099012|10035399004|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTdVdldwWTdYbkl0aEFPOTFOMFNnb1ZoYlBaTUh5ZEdMYnc1S0hTWnlvaUhH?=
 =?utf-8?B?SHVoa1oybi9ObFFWajRJbTIyc3B5MVBDYlBIbGk5RFNkMk9xVGhTVC9jaE5V?=
 =?utf-8?B?dUdiS3Z4R1gxbkNSRjNIYm9LRXI2UEhET20vK25ZQ1Y2UndyL25sTVJ5REJh?=
 =?utf-8?B?by9nVjNXbGNWdDh2QTlPelJSZHFHeHUwZHZaUHRuNEFxM1Qvd2luTm4zRGFY?=
 =?utf-8?B?MzJPelZMZTR0U0c0Z1FiUlN5Q25pZktGREM3d2pENVlCbmFraVdHajV6bzlJ?=
 =?utf-8?B?VWZRRHJCeHlJdTZNUVJYVHpSZW9ubjdIL1VMMTNCQWtCVktiSjdyWUZoeDVu?=
 =?utf-8?B?MEpJMXNaWVpWTklUWnFYeFh6NFNnajJFOEpieHFFQTlWb1BWVVZ0UW43N2VP?=
 =?utf-8?B?NU1zNkNZWU5MN0ptR1pua0ZUVm01alJzUmYxdnRmTVR6aXdaR2FzY1lYRnlY?=
 =?utf-8?B?NXdlNkZHVzJhRS9aMzBkeit3MVlkdjVDU3pwRk1qODdRUzhRZE5vcUc1UExm?=
 =?utf-8?B?YWVYUDVzVHI3aTIyaVhDWEo0TytlSkppb2czM2FleFkxeVIzZW15Y2dSdVlL?=
 =?utf-8?B?UlNPb2ptOWlHOWtvQWRDVmlQd0ZkYStTNzdmTHRXam5HQ0JWMFpMcUt0b2Zy?=
 =?utf-8?B?d1gwVjFITG5HdERiS2tlcGxJTW1wNVNka0JuOURVcWZ5S21HNzErR3JidFd4?=
 =?utf-8?B?RUs5MnNJVURHOFFNTGdicENjdk15THBTSkxTR3AzU29SVFJkYXpsZWhtY0to?=
 =?utf-8?B?ZkRla1RGWHlxMksya3RrNGZhMURoUlBWMW5vclNnZjBSVVJPZlBBTzlLWk0x?=
 =?utf-8?B?UnNva0U5bDhHWTY2L25GUE5aejBGdW1ka0lxN3ZZZlN0N1BtQ1JraXMwZmRN?=
 =?utf-8?B?NVZGeVJYUUx3SGZmMHloQy9KL25uQ0hKNnliWXlLNFQrRStUVXlPRHhlSVNv?=
 =?utf-8?B?VTl0WWZ2bkVWZDdMcDhYTXUrWlhQZmlGeGhXRWlWNXdRQzZoRHphUWxHV3Ji?=
 =?utf-8?B?TmhiTFhJeXlPWTF3VitlVnBxVXg1UWpmdHU4N3B1cFIrWkYwaGdMNmducVJn?=
 =?utf-8?B?VFIwYnl3ZngrWm9McllCYnZDY1hqekZXM2p1aU1iUndZTTVuU3VRejJHMWRi?=
 =?utf-8?B?RWg5WHVBV2F6TGI1bE96YU83K2JhcVRsWjgvcnJ6Vy9aRXh2Ryt2eVBoS2NP?=
 =?utf-8?B?WEhKQTd4WVpMdlozTW5EN0ljRURhMUtwanhwa0JiMFNZcmpCSTM0NTNsaW5a?=
 =?utf-8?B?bzdBNHNKdFF1eis5YWh2czhGQlhIZDhpKy9uTzg4WTdZV0U0bFZHRytRTGtm?=
 =?utf-8?B?NkVzbTF5WFBIUENJdzFDNGNKbDZYa2k1Z2gzMk02akxNVVFQNzJ1STlHNStv?=
 =?utf-8?B?N1JUL0ZoZGJmZ0ZyV0lRZlZOSktBdXkvenBKNCtWQlEyZ3VEeTFkVEUvKzhr?=
 =?utf-8?B?U21NeEhSZGN3ZVl2OXJuQTVDWkZCRlF2dFA4WXpsczNsakdGME5xMEJ6OWZE?=
 =?utf-8?B?UkFTVEVXNDlreUI2YlZCYzczbWNXcUJTZlJYNEdQUWY4Q1dyNE1OZ1hGOUFo?=
 =?utf-8?B?MUZyMlBDSWRRNlpiMElMeUdac0g1aGlzZEYzREtUcVRESi9rM21QYlhGMGE0?=
 =?utf-8?B?Tm4wWmtESld6bVQzS0tpMm0xL28yUzRoVFZ4MWVVOGxEckg2QXVOSU10SVFU?=
 =?utf-8?B?K0hpT0RvTVczbFc2UWE0a0czWlZkYWF6emVZNlBNOFcrSXNDT3F1L29vNndM?=
 =?utf-8?B?ay9ZZW12bnVxNkNuY3pQSzJaWHdiOFNzTVMyVDJTUGlpSnNCeGdIRVlpSlFM?=
 =?utf-8?B?VHM5OFpBMFVCdWtzdGtGUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVhBTzU2ZXRJVUlhN2V5VmtsVnlkczlCN3gvQjFLK3hCZnZMNmxCcENST0lp?=
 =?utf-8?B?YjF5cTdnNlZWWjNoWGYxdVZSZ0FWUjZpZHY1bEp1b1Q1R1VudVJvbVdnZWgw?=
 =?utf-8?B?MWx3MWZoZkxmL3NoRElsT25JWDd6QVdOblZGZjd5SFd5dmN1ZjFobzhubTJX?=
 =?utf-8?B?Z3Q5WTRJaHVtdTZzZUdLUGhoT3NHOHVRYlZ1cUoxa0thWi9yTEFLU1gxQ1lQ?=
 =?utf-8?B?ejR2dGtFRFBqbEI2ZFNRVHZ4dEV0cHhkbEFZTzlJNk0wbWhuWnQza1NicDk5?=
 =?utf-8?B?ZkF5WFZMTlBYSFc1MHlKMmpXdXEwcEw2QktBN21iQldNVTdVUnNvOVBtRVNQ?=
 =?utf-8?B?UFRRMnFMNWxnVlVzTkEvSW1ta0FrcU50dnN4d0QwSStvcGplRng3Sk9zUmg3?=
 =?utf-8?B?U3hBMm45dm1Jc0ZHZm11Z1JoZjVLTU85UmFzQjhLZWFuRjR3NWQ3QzlvTVRG?=
 =?utf-8?B?RUFLQ3hTTUV1UktJeWxtbWp6Wm9MNzJjaitTRXp6TzRwRFk3U1pzMGRwQThD?=
 =?utf-8?B?VEdKTHZ5dC9nK21RdmlXVHVaZ1o0ODVta25xeC9mQm9qRVBKUnA3Z1hMa0k4?=
 =?utf-8?B?dHdoOG5HSzNwTEErMllCcWhSeGpMRjRienQ4eHRaSy9vYXM3THptTnFrUDhW?=
 =?utf-8?B?cVhqOWtkRzZDWThYdyt4Ty9pRTAvN3ltcnQ5REdZZGlZRVBScmtGVEo3SWFH?=
 =?utf-8?B?Rk5nN0NBYjEvTlBVNlg4L1QzZ2paeS9JMVJRd1JBTWlsdUJUcy9PMGtLQlZo?=
 =?utf-8?B?bEdMdWpheHoxczdLQXlvSWJJNEFkOGd5YWh5UDhsaXJsdWFqc1kyUElWMFlG?=
 =?utf-8?B?YVdyb2VNbmZnR1pjSkRJcWRsS2E3V2hrNHIyelhEejRsQkQ5RHJleVNjaERa?=
 =?utf-8?B?dERjSi9KVUtIYXNkRW1sUFRGYXVmRi9VRDZlV1htWWZ1dlY1cnRTVHlvMWxE?=
 =?utf-8?B?NWJJallxUkhCVVdYYmxGV3BqdmVOQkx6YTRIT01ta1pMTTlqV0RVQXV1djIx?=
 =?utf-8?B?YjM4UnF0TzZBV0VQTjJGd0FxMDZ5ZGhUbHo2WDRMUGpnanR2ZEV0ZTFML2RF?=
 =?utf-8?B?WnNVVVlPcnVtZ0lMMmZBdHFiWVV5ZlBxaUxkTjExWDBJUDFLQUNoY2EyL3Nu?=
 =?utf-8?B?cWlJckFZd1lXR0E5Ky96SWQvZW5oaWJiRXVLaWMzdkJmWEFqN1h4djY1Tk5t?=
 =?utf-8?B?Q1hKQzVHczRWY3l6Z0w3RGNXcnlqYWtjTjZNNWx1RGR5OElWV25EOFRsdTAv?=
 =?utf-8?B?aE1vUmV5M3RORWFjSnhtalc0WXRIYWYweU4yK1hNVE9LS05HZmZtb1VRN0gz?=
 =?utf-8?B?YnF3M0NaaEhJdUtJcnVvNHIzV3dlVHI4cng3T1Nwd0xjSVI0bGFtaWdiTnpO?=
 =?utf-8?B?N0djMFQxMFM3OTdKZzduS2MyRE1yWFZwNFUvdUpHcHN6QzRqQmVUVTBEV2FB?=
 =?utf-8?B?YUF3K3V6MHpEVXVmOEVNV0hScTZ0TWdYbngzNEx2TzhYYkcwT01tc2xaTHdH?=
 =?utf-8?B?TDVpYWVOS0JvQVYyV0NUenhMQy9oYjdsMW9oZVIreURlNnJkTCtUZ24wNzM2?=
 =?utf-8?B?TzJvcm9Pb1EzOFNUb3NtZ09tMGtLQ1g3NlppZ25nTCtMOGhXQzhzeVRkWDJr?=
 =?utf-8?B?OFhuSVdraksxUzZsaG9ScWFRNTUvN2RMRlJOTzN3MU50UGVPTUtqT0Q3QkpW?=
 =?utf-8?B?ODYrQldoeDlTUnp3WkRXY0hEZVE5NEF0SmJFYkFZNFA1cXJRNlVBTUZ2N2dl?=
 =?utf-8?Q?ePf1rC3joNRb/gaZ6jwUuZGvDNrB0CQUuZsJnQW?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab9f942-11de-473f-9717-08dd7669347e
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 06:47:18.3732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB9207
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

The vsprint patch was originally being sent as a seperate patch [1], and
I was waiting it to be taken up. But as suggested by Petr, I'm sending
them via DRM.

v2:
Remove printf tests, will merge later through Kees' tree

v3:
Re-add printf tests, since 6.15-rc1 has the necessary commits merged now.

v4:
Do changes requested by Andy and add Petr's review to printf patch.

Link: https://lore.kernel.org/lkml/1A03A5B4-93AC-4307-AE6A-4A4C4B7E9472@live.com/ [1]

Aditya Garg (2):
  printf: add tests for generic FourCCs
  drm/appletbdrm: use %p4cl instead of %p4cc

Hector Martin (1):
  lib/vsprintf: Add support for generic FourCCs by extending %p4cc

 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
 drivers/gpu/drm/tiny/appletbdrm.c         |  4 +--
 lib/tests/printf_kunit.c                  | 39 +++++++++++++++++++----
 lib/vsprintf.c                            | 35 ++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 5 files changed, 96 insertions(+), 16 deletions(-)

-- 
2.43.0
