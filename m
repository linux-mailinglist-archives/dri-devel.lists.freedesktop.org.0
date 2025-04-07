Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6818AA7DF67
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FE410E46F;
	Mon,  7 Apr 2025 13:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="ZimtoX1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010009.outbound.protection.outlook.com
 [52.103.68.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037F410E1B0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTaQFqwq3qQ5l+/keqQMrnaki+y6rE33Wv+4duI4XadZzG6YZ4GuUcMEj9jSbTTH7bSBk2mzTf0p/nqvpN888NMeXTJ2QIWXodkA+DfhQi32771Cp7lPoZQ4OQOMj35sjsNPVBpMH1IaAaOV7c+pvOUlvrJMiH13yZkiEyd4ZVcLtNCtOsKdvc4FxtrgyBN0N0OxkloR/NgoxFhkA/Lx4CZyeCNMrGJwRJpgLyP17C1VHYXGoQcK3PDHa7uxVanZv2PhJkMVMmjjRg/4a5qj8q9hhUVs2SvtVF+KAH0n+RFWrkQljOZRXxlrI2HYOKFVm4nKQTby5SxU3ios42z2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn5Hkq9DpY4CPJ1wVetCS/X94XfeAa3DvU0Eb77IQHY=;
 b=bRM2Fb+vw2TKyq7fdTEZol1V9O5id8ffPFbm8nXXDU23RVG5gmyyu2sj2BpJQj0x2XLuO7YHtCVqDsA5r/jR2yn8L1SEsgAfRKEQSqkKDSxTvRmzJcAX/DGYGoEkKb+xYJOeg7WOXqFkOX4ou4qPUcUSScbLKswrHc9l+exc3LzhaOefNoVE/8fW5/E1Lzt/cjpfo9fX9T9+YkhnNVOnkBg/n9jPKwPUtv6R6URiTBp//I7rCbBuGL1a9fprXzHHPSXKfM5kAeCHyB0t+1++i+vPJCCQ0aGMDfeGja/X5UPEJaJt7ibriKwenSqqr5rF3t8gL3PbFPD7p2RpTC3qAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn5Hkq9DpY4CPJ1wVetCS/X94XfeAa3DvU0Eb77IQHY=;
 b=ZimtoX1S5w40TQml0OegFkrcU2d8Vy+cmzKISHox/O4F/LgE+4tQv5/MobmQzVYI368WjPkhB01r3Z6zoJimTq5l0EWsHg5euQ72SUCrV4/+iLqGsvT/5oSIactKQH/VPE1mHypZckE+2NnD7OOq4EfHNUXhIXOZYd6Xb6jp6Ru+BwHGVQmKuJDrdgBq472L9jEAMUuUJRMzbGzJhZxJ5muac4oehNtxqg1Lx54hX9shQEZz/7Gyos7R0JaKbDscj+mK8EOHi7IeUi26aiA7iEoEN9IiaEA9pHnj+i+isqsjVpuRUlHioj6/WywyLeem5IF09Gqs9QC1DxpwukcdYA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6823.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:94::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 13:35:17 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 13:35:17 +0000
Message-ID: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 7 Apr 2025 19:05:13 +0530
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
Subject: [PATCH v3 0/3] Use proper printk format in appletbdrm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::19) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 652ab8e2-dec1-4f5a-0ca6-08dd75d908d3
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|7092599003|6090799003|5072599009|19110799003|5062599005|15080799006|461199028|1602099012|10035399004|4302099013|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2h2eHU5ejd4WXpDRzRlQmVMYm9xUzdsSzM4UmZDQUJqR2tCTDFETVpMTWdG?=
 =?utf-8?B?dXB0bENCMWNlUTdtbUN2ZDRVVmlEeG8ybWdXamNSNjNydTRRM2pHYjlxNVhm?=
 =?utf-8?B?Wk90dGdmcnJ0V0VBcHpVZ2JWNG5CYjZRbFVxUWZReGdxQis0czcrNFdIUWcy?=
 =?utf-8?B?WCtvRGx0SzFqeDMvQWFlM2J3RXh5eXRiaTcwWUErRWNMQXhaS3FRKzNIY1Jp?=
 =?utf-8?B?b3kvbjRldzNERGxXTFg5MzgyYjUyZ3JPaGZjSWF3K2FJN0xpNWRERXg2b0FU?=
 =?utf-8?B?bU1JcGNHN051cTZyMUxQdU9XUVNoSVI5SGVoa2FsQVZDOWg5WVFuNktlUlc3?=
 =?utf-8?B?UzI2bFVQYzRKL2gyVERQMWtzZnltdlg4STdvYTBGb0hOcEszblhac3lDaGhp?=
 =?utf-8?B?bUdEU0NaQmxWVnVKc3ViTWZqbERLczRXdFVCOVBhNmtTQzFDUkw3L09LbHZl?=
 =?utf-8?B?dFhpTFJ6V1huNHRVbm92amZNWm9oeWNwZXc3NHVKRmdZN1VsM0M5Mmtwb2c5?=
 =?utf-8?B?WUMyT1FRR1ZSYXhIZUxFbUZRbk55SFNHazhpUW4vck15ZnhDRjRSMlpyR0c0?=
 =?utf-8?B?bzJwdU8wWkllWDRxd2FJU0RTSWRFRVRVQ3N1dE5Ka3RkKzRJNm5XeXhtUlRw?=
 =?utf-8?B?K282aldHL0w2d3JaNTlqZGN1WU5lT0pXbVVrTWpqSzRRUXd2TlRGK1JiaU84?=
 =?utf-8?B?L2dYQU91bVI1ZkhiUEduYTNzRlRNc0dkWm9pQ0xMQkxmdGM0bkx0MXFmWWhm?=
 =?utf-8?B?VkZlbnFIaWMvdGhmUFNua1ZvcWRYQnJLdjdTUG5RTU5ndHNrSnF2dWZjUEtl?=
 =?utf-8?B?RVJsa1FqdG9nN2ZyN3Y0WHRrSGdZWkxCc0xxNENUcFN0bk5QQ2FXbEpiU0N1?=
 =?utf-8?B?NkEzNUNSd1BqQk9wZVFNajBEc2g1UlRISWZBcU9acnlSUWh5aVpmYU52SE1K?=
 =?utf-8?B?ajVpRlFzYlY2UW0zT1RZeEpWUytUM2M2aGlHbEJWeVFJMW9vMEdmaHRsdHdp?=
 =?utf-8?B?TFJ4cEFSMUt2TmpiNkkyUXArUDdCOVBBYkwvcnRXTXpubXhUTGV2NGMrTi9h?=
 =?utf-8?B?aXVsbnNCV0VFR0g1dnIzdUFjNUVaZGZUdHA3djFFODRFamYrcUZTdVgxaWFi?=
 =?utf-8?B?NVRIM2d5VjYxOXVyeVI1RXlyRlkyNElpRnczNVlOUHRyZk1TRlZNOENieHpE?=
 =?utf-8?B?ZWFNTk5XVGsxcHVRM3hqeEJwK3dGcjZZa2lvYk9IR2h3UXVIVW1pSEU4ZmIz?=
 =?utf-8?B?b2tuam11MnZta29PRktVOWlJcFJmeGE2SHBoYTFVbWlZUGlYNENySXFCZFg4?=
 =?utf-8?B?U25TUkJKMFlnbythTU5ZMWI0cEh2M1g2MmprTFVNdFZqNEhMbDFBeWNpanFG?=
 =?utf-8?B?TTdSV1YzUmRXTUpSU2d0UzdPNFB2MTlHV3BHUGcyKzBHT2NCdDg4TkdRbUtw?=
 =?utf-8?B?QThrYVJEeVRJZ2xveUwrQkgvL1J5c09iSWtBcHNLVDZ2TG5wdWtHdDlxaFRD?=
 =?utf-8?B?d3Y1cFNyb0NCZDE2ckdyalpReDJoMERtTGd0eDVwZVJDa3ZkS0JVZnBnTWRq?=
 =?utf-8?B?U3Fma3UvQytrNERBVWQrOTNVTkJPN2E2OWs3RGRCbEc2NGh6WjRmaHVxWkVq?=
 =?utf-8?B?b3hmckRNdXBReHRCZnplMmNZRXBpMU9VbU9GMzhxQnNLTDkvSVdyKzZLQWkr?=
 =?utf-8?B?WXdkRXFLYlEyemkzQVRKVnJSV2J5YmZoRXRESVdpTlhNVUFHeUI1VGg5dUVU?=
 =?utf-8?B?WlR3Z2hER1ZHOEJMcXZLQU1HNzJpbU43RGZtNmdsTzVLMEl3ZnZXWXJtQzA2?=
 =?utf-8?B?bmFJVnBHOEpzeVVINGZtQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBCUit2d1BTR2h6bW11UE92U29pcGFMbW1lWmdWSDN1Nkt4alJPekQ0UkM0?=
 =?utf-8?B?SGpYSDM0NXlLSUROL25pdVI5ZWQ0b1JWZ0FYamMxTnhZeVNaQTF6K01UYm1Z?=
 =?utf-8?B?Ymw2UFFqZEJ5Z2FtWXQ5Y0ZHc2VDZTZVU3VOS2tFMy9PVnN0STZKKzA3TEVl?=
 =?utf-8?B?SWFLSlpDYTNwRjNxTEhCbmNxWHN5SXFyRnVHaE1ibml0UURLcUFrTHpwMmNI?=
 =?utf-8?B?OXZqczBwU0NDa2NuWDVmeHd6N0RRZ1J1NWQ4WHlqTjI2YjZRT0wrenMrckdQ?=
 =?utf-8?B?R2NjeVhTZWhUN1lLL2c3TEJReHB4bStOWjlpZVhMc28vNDAzWHRJWUFVaEZa?=
 =?utf-8?B?OXJhQ0tuYWYwelVPUGZsNGk1OGZjdG5USHJvNXFPUWZ5OERpa0oxYytjMlNO?=
 =?utf-8?B?RE1PR0o1Ynp4QWxMSDczTlJVU3R2N0NTbU5VeGZaQ2ppY2FBVVp2MHdyR2FZ?=
 =?utf-8?B?WDIxQjVpNXhQaFNXOEtTcFJJWVE0UnNBN1VJWDBYL2pvdWNCZmx6Wm9tQ0Zs?=
 =?utf-8?B?bHFLTURHOE5tUk5VYVhiZGhsTmhKYW4xR0doa2lFenh0S080RUJVcFQ1MTJz?=
 =?utf-8?B?TWp1MCtCMytZWi9nTTJmQ0VjQ29mSER2QzAvRjhzUi9EU3k0VHhBS21ZeHBX?=
 =?utf-8?B?ZFk0Mk9FaTExWE9HZ1l6WFpweVJLaU1PblEwazVTaWtPV3U4S1JqbFc5VHZq?=
 =?utf-8?B?UTBscnlnYmdEbDRJN0h1eWNGSFlwTVNFQ21pSlptTURCOG4rMkM3QndDVWVq?=
 =?utf-8?B?NCtyK0ZSZUVvSDl6dTYxRXZWVlZzMmY2cVJ1Q1RkaFR5cHFGZC9UNWRQUWJF?=
 =?utf-8?B?YjZkbytNNHk0UlluRDhtdlNER1VsWmlKRnFiVlhUVW1oVWhpd1cvcmFYNjNv?=
 =?utf-8?B?aThBd0dnemZDcGNTTWgwWEp6bDdvWWt4aGRXOFFxWjg3RXlGb1NscUJaYmRM?=
 =?utf-8?B?c2p3Ykl1QzFTeFJsQk1LU2N1ZTVyYllBMnkzTjlSUlJQUDMydkRRVmhBRVRK?=
 =?utf-8?B?UzNneVRPUnVLQ0d4Skdtc3pIY3l6U2hqR29xZXpwUlkya3hSTEJPbmpyajJ4?=
 =?utf-8?B?S0w1NW9XTlFiSUNXcHZrWEpUVHY0SnlXYVU1VTA2ZGlrMUZlb0k0blVCRWJp?=
 =?utf-8?B?SVBtWmNpNHJZMFBUQzhWQWs5UHRSdG1Rb2d5OERWSnR5eHpRZ0M5KzJ1L3I3?=
 =?utf-8?B?T0RGWlZ3aXlJRklVT3d1YlpsbUhYbTNaRGJYdkYzNUl3YVlXZW81YlVyYUV6?=
 =?utf-8?B?VGdlZmFzRGxkUmVQeko0Ulk0dFR4d0ZiTGI1K3BEeFF4V041dHFaZnRVK2d3?=
 =?utf-8?B?NEpxdklGbk83bGxPVzNCVExYUitNa29SZmc5L1FmYWtNSjNyNnZvN0lHVmpj?=
 =?utf-8?B?bkt4TXZobXArd3ZDeVdCMWJtRlJOUlVsaFFpdWlFTkZMcFY1WEN3bFFpbEth?=
 =?utf-8?B?bi85d0RWcG9qU2Rjd2JHQU1EVGVheG93WW5XN2xOWUpUN0lNdCt0SS9Wekdv?=
 =?utf-8?B?eXBjUitwRjZ3N0c1SWhOcDljUHNlbk9aam55d2ZvdFNBMGtIaXVUcHVaamgx?=
 =?utf-8?B?bUtaQXR1U1V2MTZoK1VvUkN1VURTUVpyVDFEV0g0OGZjQmJoN3NHZC8xQTBB?=
 =?utf-8?B?VytIWVhPSCtTVXNzZWRramR6OWRPQnZ2dklDdnZ6N3NDeXFtaFdRSjRvSTc5?=
 =?utf-8?B?YW5wNjhTQ3VZMU1kRk5ZMXBLRTdPNmUrSkZydE1xWEtyL0FxdFcySHR1Wkt2?=
 =?utf-8?Q?AEASpf4ukfOLiOMJmaxdvObI1TdACOlNWclNdI+?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 652ab8e2-dec1-4f5a-0ca6-08dd75d908d3
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:35:17.4907 (UTC)
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

The vsprint patch was originally being sent as a seperate patch [1], and
I was waiting it to be taken up. But as suggested by Petr, I'm sending
them via DRM.

v2:
Remove printf tests, will merge later through Kees' tree

v3:
Re-add printf tests, since 6.15-rc1 has the necessary commits merged now.

[1]: https://lore.kernel.org/lkml/1A03A5B4-93AC-4307-AE6A-4A4C4B7E9472@live.com/

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
