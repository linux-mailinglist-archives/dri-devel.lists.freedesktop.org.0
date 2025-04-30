Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DFDAA4DD8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809A410E750;
	Wed, 30 Apr 2025 13:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="I+mqYdfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010007.outbound.protection.outlook.com [52.103.67.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA4910E750
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDP8d/znBX/sh0L6WNTu47Q5nKR0ze00m1+958DaH+I3eMZuNceggGsnNFT1PqJwv/4TdBJB/syyKShTlj8qTlYN7jmQahlufATsKY2DClN5P+ursoBWJGNFLmv03DLz2L8uaSB4Ybr1WuGwbFSWcU+j8ysqs0BO544tcu9XP9iR0ZMD0mhu1LMXcApdRvT7RgZOh90DejikLmO3U9TCr4I0DIatPQQX4Vbfglr3L6LadbIwluFv9dtgj/CKHz6hGhTaArer5mRlqvpgPHHmZt/jWKov/HKhs+ZTMkVnECGc0GFsSaMJAj0AA6JsARh8ntUxGxeGlOjVcnbpzNvVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQmywkyZpSKK3o4C2QvdTL43/zCMcp8rZJLXS/1lM6U=;
 b=NUKLOkXS+uFH5oKrGG4FE1BI+rcVJLEPUh2h0VmzBPm1t1ifTRk4mKIOvUYsvflawj7Ld2E0TVWxMt623Ik2vdeQIXloLUodZhX1OqY/VGw51Qb+jvdliNjC+01876EkQ4aTitQbQY4IAsQvLjjf4nfYgy1Y19qIi86BtxxBLbwfrD6SJayRss83UB6FIX9hzVf9otcPntfl8yPfnEJif0oJFic0k4bKREVWw5PmwQuTvZp+0vflRfs+KR7wNznvwJZQK3qO2dSFIMmUQfti2bWGeshmGLNttiZE2p/SwYJ2T45S5im5NA49R1Lap65nRkcZqSx3UmQpXBtnA6LuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQmywkyZpSKK3o4C2QvdTL43/zCMcp8rZJLXS/1lM6U=;
 b=I+mqYdfXyzjW5H59+VhEc/Zj/vYXbcDDpMAqFTB9HgIxWSOwew1lTKGycYelllOlajYh5MWRqwrZj/q/NvEr+Wtx27WENXTBn5bo9zOh79Ds2LRbYJ+k4UCr7zQxlo/Mi+ndnFU2h82kKXdC25r8uRrgEtmshB44hyzG3zsiYFJbwoiRyboLTl7th5gCfLwrAJvIotBNT/BhDQ4TmFF4BSET1A7nGU4RRD16pU3+s/2UgqutF4XoxF25Jrmbr3eTS0TVtCeVfL/H0jwy5kPSuzUuM4Yaf6ZSKTJjYR3EIL8AF0jtIEjbuOHZQlfy+Ihf9QmVKD4Ead97YYK3Jhg8hw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN1PPF3C75D558E.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::40e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 13:49:12 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 13:49:12 +0000
Message-ID: <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 30 Apr 2025 19:19:08 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3] checkpatch: remove %p4cn
To: pmladek@suse.com
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org,
 alyssa@rosenzweig.io, andriy.shevchenko@linux.intel.com, apw@canonical.com,
 asahi@lists.linux.dev, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 dwaipayanray1@gmail.com, geert@linux-m68k.org, joe@perches.com,
 kees@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st,
 mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::6) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <5cbfbbb2-3bb5-4edc-ac1d-51655a9da0ec@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN1PPF3C75D558E:EE_
X-MS-Office365-Filtering-Correlation-Id: cd32337b-cef1-48a9-0814-08dd87edca31
X-MS-Exchange-SLBlob-MailProps: bHQ38DpbEWCos0A2Q6z4vr+EGiiqRFMXmuzFuHFIZL5s8B2bvhAQlwieWYQFOif4tQel1we0hoGD8sG01CkGRKqr7kqN8s6sPGMtsJBPt2KkUyLC3eDOsv/AG+CuJT7ZELXcKKD5VYznSRKV5MzCylwuhTVAvQ5SwWI8haCQvQZbsf8edjxUi8GLQs9R+VAH62PBt1rus8C/ZFB1dN9OvcCGAxwaNpentg6M26DsR7W9n/xNO9cUVz8v3YUVE0axTBzisAMcI3mbFkOH+PUr+1U+e3K4fqFPlUh8mEW0AUJw3gBLhV8Lb45+ObdN84g4MMw2dU1i+ZVfvh6hnZjEdOymzxSdcuiwn3G5tNmcBuT/9NYb05aePzyJJ3nvdp8RzGfjo/xJZhQMSErBAn/PR7PrKqde0YXV/KHtols/bQiRjMxmB/g1F/baqNNyJWi51MX2/GcAbAGr+l81blxADlvSd+blq6UI8TTNVFrE+mKNarwHI9LVQBFYOr820tJ5IZgurqDexujdAuAqkofOfXjY2l7ppgohC41GjLG5ZJBMVg4hepdJnLGB5pLgrzhUzh/rn0FD3XiW9ilj5DjQzacBvC4uy78kqFndHxSekaaLCaKP7Uq93qPpraDJH6B0ZfrCXZ4U5F4C8KuuAyivyOUc+XJhp8cCfACE2eAPKSSynOdVr37IeA==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799003|461199028|6090799003|8060799006|7092599003|5072599009|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFUvaEhZS1luQkZNVnVONlE4UVU0MnBTcWtDL1I4dUlBSlIxVU8yT3V4SDRs?=
 =?utf-8?B?Y2ZoK24vNmRCRG4zTWw3S2NtelcrRU5qSTROaVlVU1NXSWpQYmFpOWJ2MGpt?=
 =?utf-8?B?NFdubmMxeUFlZXlCaTFPcTBrZDB0ZzJWZ3N6N0dvN0pjR1VrMEh6c3NzSlZn?=
 =?utf-8?B?ZEhodnF0VlpseWZQc2dHMi92ZWNQclpkeDR3RlpVV3E1REVUbDRSRWRjSG5S?=
 =?utf-8?B?b2NBTUtpM3Q0U0Yxb3oyUFp0NSs3WTJRMHNoRGJraDhDUGtnM1J4U0lCc1Zz?=
 =?utf-8?B?QkFBSWwvNGJMTS9WcDZtZXB0d2JmOVFRcHo5Vkg0Z1VJZHYwZWIxSmRqVDJX?=
 =?utf-8?B?Y2NwRVJDYk50bTNWNUh3Sm1mYzZrRjFZTVZCNFBBKytJTHh3TzBMVTBhVHJa?=
 =?utf-8?B?ZDBEbkw5T1JiajJlQXAwdW5KNytRcXBGNGFOWjhadDdyalBvcGlQMTVYUzJq?=
 =?utf-8?B?ak93YkdxbXByQU5CVm5RcXVpeElodkxjbmR5U0RGb2FaMXpoaEtKN1RlNVhk?=
 =?utf-8?B?N1d2ZUZjTW8zRDRzZ3RndnBlWWZYanExbHh4QlB2UE5ZZWdvMEdTNlJIZjlV?=
 =?utf-8?B?Z25QYVFubGR3UEFZd2FJTlVUZS9oU0hMa0FNeGdVSHl1dGQ5RUxuZUx5Qklq?=
 =?utf-8?B?aHlsWVhPUDR4VUxQWHpIQkYyRVBMM3o5N1FSN3FJN1VBQ0JrTk5oNjkzNFM5?=
 =?utf-8?B?akF6YWRXbGhidDFlR3JPZ0RQckUyUncwZTBxWFBDYWNKYXJBSktzQXI1dDJX?=
 =?utf-8?B?aXBmRVEybW9IV0REN293Vm02MWNsOC9VZzBnUDZaSVJ2aHRud2VCVXVJc2FC?=
 =?utf-8?B?clh6ZnBVVjRDb20yU3JrR1ovZ2ZaZjBvWUtkZWZad3IrczhJdDlBckZ0VWJR?=
 =?utf-8?B?TGYzTmdkV1Nsb1V6WGQyczU5NVEzeWVNTFV1dVIvNndTTWdDZWNKRTM4SWI1?=
 =?utf-8?B?YUFPUERXcE1tUHFSMXZjUUlndGMrV05JT0JsMXVVdXZyRlVwSEt4SXF3eWc4?=
 =?utf-8?B?OGRpVURsZzQ4NnJ5d21ORVdpR1k0ODVZSmtnTzZnL0xSTjBhdzN0OHhuSlBa?=
 =?utf-8?B?ZkpkOGVrMXpBalVUVTRMWldqRlF3bUJSazZOMW5uekRxMmFxR3FUd20vS2tV?=
 =?utf-8?B?cjFaV2hpcEVrSDB0RFFUVVJ1Vkp5TjRPRXFYOTkyMGZQOVVhMndZQmZJK0Vy?=
 =?utf-8?B?U0VvL0FYb2EyK2lHdFNZZDJVYlI5TXFrUENobkcrYjVvamxNWENueCsyamE0?=
 =?utf-8?B?RERZaTBjdUFyQWpSMTdjaldObjluQ3NZRGdhVkdhRW4vbXZzRXBQc3ZZVS9L?=
 =?utf-8?B?V1VRaG40TXJwUkdPMi8rTWhrbExrR1VzbVovMVBWL2hGQmRCd2hRck44Nmh4?=
 =?utf-8?B?b2VpOU11bE52RStYaU9yOTdUcWkyTERTSloyQlkrV1psUmI5WWUzR3VsMm9p?=
 =?utf-8?B?Tmw4ZHZwS25YS3YvODE1MHQwUjRLYmcxUnB2WlVGUFdRMUpYUXQrRGIxbGNC?=
 =?utf-8?B?UVFGYzJ2Y2hBYy9aZUFDNkIwcFFTS2tsa0VnSHVnTTk0cXdhNm5Gam1uN3d5?=
 =?utf-8?B?Q3IvUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUFkUW9ySTJ1Q0tkQVBaOEViaUxrK0tmRlI3ZW5pLzFYMXhYbTFMeG9ZeFVq?=
 =?utf-8?B?eUExRHE5NmRGZkJTUGxPVDc1VklXT3dMZStFTUxCOEp6Y2pJRlBZOGlvMjlp?=
 =?utf-8?B?TEFVWnRJM1hVaXdZTFNKUWpOa0J1TjlpSW1DeGNObFhiQTFER2xNY1ZUcVhS?=
 =?utf-8?B?NVE2dERpRUl4Yng3bVlwVkNMRVR0NDhWNWh4ekdMY1RnMjBoU2RoTldjd3Nu?=
 =?utf-8?B?dkJ3dEd1MzBVT2NIWkhoM0VkNFljdWorSlU3YjNCdC84NGNJSjhicUFkTVAv?=
 =?utf-8?B?Q2dRbUxKbmZ0aG1CVTR3L3FvdDBnVDN5UnFCLzd4MlY4aUUwTEN2aGVZYVEz?=
 =?utf-8?B?YklVOFRFRGV2TGxCMWh6M3N2aWljVE9NZ29hKzhtUnVwdE1JVWxmcERJT3lp?=
 =?utf-8?B?YmFEWHlKOSs1VTFLeXQ1RWFhbDArSzZxaVZseDdXMHB0UWE1UVpqazQ4dEg4?=
 =?utf-8?B?d0JxdjFVRmZOZGloTytvdTNZUEduMTdldUs5RUVSNy9LNm55b0U2Z1RCS2tk?=
 =?utf-8?B?Tk9CaXZMVUNQQUpPZm0wWlBER3kvMHlFZ2FtdSttTFNhK3Q0SHdsQTFobWJt?=
 =?utf-8?B?SS90TkNYcmVhYnVlUzVBWWxiU1B6Z1Nueld2TWFxc2gwSWZPMnozckRnbC9q?=
 =?utf-8?B?VzRQdDUzS2pmQnRaTFVScnUyaFE4YzhJUElDdzJrRi9DcE94clpwQVpnaW1N?=
 =?utf-8?B?U29RQUdqYkhIYXFKVHRkdCtwL1diUEs5ampla1BtdmJuOEtmakhKdTkvaGlo?=
 =?utf-8?B?MHErTGxoOExzdnZ1YzF6U0Yrb0oxUE9oVGFrR0l6WURyOEZxYlcxcWFsR2Fs?=
 =?utf-8?B?L3pVcXBqeDhiNk1FZ0Z2Qk1BSTZ2WUIzcitRTVdPMjdoMkgwMDFRcVl4bDha?=
 =?utf-8?B?SEZPU0RVVXMvdHhTMCtYWTZqdWwvUG1KRHI2OE9RVlpteWRkMERqeU92V3Rm?=
 =?utf-8?B?bTFERGxVZ2tWQXF1WXB4ZXZOZmt5dWJIMUlmc1MyOVJoaHJwYWhYU1RYL3FT?=
 =?utf-8?B?d1RQcEZHS0RXTHlvZWw2YTZTMVRzbFFGMzArbFRJbzN5UzMwQ01KQXcvaFR1?=
 =?utf-8?B?NDlLNTRLWW4wRkZhZ1FPTjArME5GMTFVZWs1RTJUMWdsUGRsY2JJcHp0Z3FT?=
 =?utf-8?B?c3NBSFVSenRGbnVZbUxyUGtvQ3VwNlkzL29wTzdBcTFjZ283T1FaRWd4cUdC?=
 =?utf-8?B?STB2aHI4bGZWeEl3aWdBbE5jUjJ4YVdjcWg5MStXK2M0RTJYeGlpR2FJNVBw?=
 =?utf-8?B?aHhGVmdNZnNGVnNERVRCWHRmaHFQTnNyRHpqSy9BQlBsa0ROd0JwQlA0c3hW?=
 =?utf-8?B?TW1SYmhEZ2JyU1NPWlNHYnkrancyTHR1NnQwd0hyQzdyZkpEbVhXME4zTHBR?=
 =?utf-8?B?V2hyRDhHRDFjUkRyaUhaelV4SWhnOXdGSzNvZGxGc2tKdE1ER1IxRDdnWHpU?=
 =?utf-8?B?b2J5b0VaNlB1bVRsNS8yTjk3enpvS1BKTG9XVHFDRUZpYXVpUEF4WC9nT1Fj?=
 =?utf-8?B?NjFta3poVUtldVFQVlE3K0FzQitkYm93QlJwN0hWOVl0M1AvTU9wUENlNGdO?=
 =?utf-8?B?VXRHSHhYMU5HU0VDaXlPa1ludFZQYnhtZ0crdVhoOEdjYkhVU0pnSFBldjk1?=
 =?utf-8?B?RHJkVzdndW9VUFdBMzFDWkpBa3RQWjl3anBOQ3IvcXZ5c2lnSUV3U3NVdFoy?=
 =?utf-8?B?dUtlT2V4dkV4c1FodDdVMWd0aktncU9UODZYSFlaZktRS3ZWc1dlamtNTEUr?=
 =?utf-8?Q?UGPa+nD9FpNvqhe0P0=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cd32337b-cef1-48a9-0814-08dd87edca31
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 13:49:12.7976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PPF3C75D558E
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

%p4cn was recently removed and replaced by %p4chR in vsprintf. So,
remove the check for %p4cn from checkpatch.pl.

Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
v2: Add specific check for %p4chR as suggested by Joe Perches.
v3: Remove blank lines from the tag block.

 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 44e233b6f..d5bde8322 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6891,7 +6891,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
+					     defined $qualifier && $qualifier !~ /^c(?:[hlbc]|hR)$/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.49.0

