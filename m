Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0335CA7DF78
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465A410E466;
	Mon,  7 Apr 2025 13:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="SgWvmS8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010000.outbound.protection.outlook.com
 [52.103.68.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB1310E468
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:37:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X84+/YWvKjgoa+xm3vINYidqpavE7o73eYcDBsikR1aMvag+/UkBIj7+Ck5r27QTpZm1u99FdnewhAEq6oVE4JXway127OoPGlu9cxs8sayUWtf/sfJW8ggaa8S8rSOBBIge00utk9+CTmJvZ3XPMKSccDQJXz+uAWVTxd5uO4ksGe/sQXwL+DKeTUrvwjkomfvSb8pXrfTuOwjbUyqeK9j6YtbyuEE9VbPf7O5bb451/lVicGI8DH6El947XSOBrKWb5tJYJ4GxgMUsmlYPDoTXGnFbwZ8aNwdpNrUz4sbrM/BSmC9ID+dQghnkTwkKY7jxBKGJcz7D9POFqChGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfNeWfrMMaGwq416VG2bniGNOJIbQQt7ZtmJ1bM4fIc=;
 b=q8yG/uhL7hxlgf5T7Bvdm9rsIh3ErTPgLy2AsfK3oAOd+5EpJvTXgPRbQj5wKwz10TM6Hvp8o4f3teXz3WyFu5f8BfEt7RoOXvehFM+HlwD5tdGkevs6aHP9P1FGR0XDQgkFuNGof7iQe0QvQAbk62aOYzyQVDGzfVWXyBazJ8AFXEyJIokRPSkbvtaPM8ka67ZSkzGni0R8Gnpwc/WTcIxwhB7DMI2hQPegEG115OXKbIAGvM3sYjX7suYzVtlS2Uez8aqc3xw5iJCSkweky9Si8KkihhyaYFc6nRsCr8BKki1Hz9z/zOPf7P4U3/FZzNAmvGzx7tP+IxNu4CqiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfNeWfrMMaGwq416VG2bniGNOJIbQQt7ZtmJ1bM4fIc=;
 b=SgWvmS8w5qFM8zmPefMIBNBmJGqivQRVllaVRBlcDn4RaX9JeZ+wwlP8WWMaIpqI9RbRGBvVDkAR7dsfSWf597LC+MTcXjVHOlXspm0KEmOEcFctKVmFZ4EqwdeQtxGJOqoFxdAcIk4L/yMxgP2OGJ8VsnbwpY8Ratk8YyZ7T7BlNZXkm2XXoGD9T5Hff7+SNyo215CpJXZRkTjycQwWjkwLCcbkchgdaKMFI3srW07ddHq02TLmeW9vL5sK/MqRAcwAyUP9giHjdkIHPE2ir6GU57s6K/4jOIH8tLkvDL97x3ZEFg8fIIwzVDogmsM/p1sifKb0w2xdVEVqsv4z4Q==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6823.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:94::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 13:37:10 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 13:37:10 +0000
Message-ID: <PN3PR01MB9597E8833F0DCE0C7C360135B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 7 Apr 2025 19:07:06 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/3] printf: add tests for generic FourCCs
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
X-ClientProxiedBy: PN3PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::14) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <618b20cf-1418-4c5d-9b9a-544d97a76401@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d97ebba-4192-42dd-3ef4-08dd75d94c3b
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|7092599003|6090799003|5072599009|19110799003|15080799006|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3pwSlJ2OC9IckVmNE8yUVBFYmY3bE96QXpGZ3Uzd3hmK3BGMDBPczdqMjZl?=
 =?utf-8?B?azVsN0tuY0pWTmlsSElTOTZNb0UxVmRWNEdrRWV1R2VyM1hieDdtYlRYZ0o1?=
 =?utf-8?B?aHh0cmNrak0zTythWWI5NktEckNKVkFFZDYwV1p2eTkvL3AxRUpRZFlyNlJN?=
 =?utf-8?B?bWNRclRtZURkcEJpc3VnSW9PMEZBRjdheWFTeGRIVnEvc2Y1SXkrMVRMUE1m?=
 =?utf-8?B?SWZSYUdBRWVXbkd3b1QxVWNiVG8yYTRxZ0pnYno0UTR4eTUvUWZ3RGpmQnpS?=
 =?utf-8?B?N2N5aWx0TkN2bDBnckdzVTZCVGIwWEJqQ3ZnYm1saWhESmNsMWtIU0JROVhU?=
 =?utf-8?B?OCsvbnJYQUVIZGEvb3NVTzFEcmtZeVVwT0VLKzVycTZ5QUFnditUUzMzdzRW?=
 =?utf-8?B?SVV1TnI0WU5TbURSSG14R0FhRFY3dk11WFptNk55dmlieG1OMVpub3JFbU9S?=
 =?utf-8?B?UU5xS2NnTEZVVDVWRVpqUEVWRnRZV0lLRDAraUhmNEl0dGJueE1nODFrdkwv?=
 =?utf-8?B?SkpJUVJoR2FCZzFWOHNSeUJWSXhUbkxvKzAvdjFNalpmbG5mUWIrMGFWOURB?=
 =?utf-8?B?dlhQUEllZW1FUkdJTlVIbEtxcklKRGk1cWlOK1BUQi91c3NWZk10Vi9YYTdu?=
 =?utf-8?B?Y3JDdTROeGNUL01rWk1ZUXVHNTRadUFUUFRjdDdYdzVPMlovNWUzL3ByWFNq?=
 =?utf-8?B?NkhrUW5VVHFqQVMvWjVmV2JKbnNXT3ZuOFFPMTNXYkNmVmZJcHB3N1FTMXV1?=
 =?utf-8?B?REsrT2pRU1BVenRGNTlIWVpZZndqY0t5VFlXNWNwZEo5aDZ2alg4cWIvRWxS?=
 =?utf-8?B?eHJRTFVGVWd6bTJCN1JVWGRJaktwV2tyS21VcEptZTVCT1QxZ3c3bzBGOEc1?=
 =?utf-8?B?U2lnUnZKb3NEVmVXWFF4eXg1Wmd6VUh4T1JyVUlyN2Z4djh1OTNaQ25zYnFY?=
 =?utf-8?B?Sy9oU0h0UlZqSy9lNjAvMWw3aTVxMVdNc3JxQWJjMmpLZm1HZmpvSWFnWXdm?=
 =?utf-8?B?ZzhlNmdwZzdWQSs5ZzRPSjVsZWN6U2NsdS8rQkllaVhBTUN4R1F5MG11Rzgr?=
 =?utf-8?B?c29Qdi9QOGpSaGpOUFNNUllFb0lwL3J5TEI1VXVUamYyWmhZNVhPZnhLNTNx?=
 =?utf-8?B?bEJibDBlZ0ppcFdCczh0RVR5ejlMNEs1dngxNE9NQU4vV0ovVDF3UXBrNTlr?=
 =?utf-8?B?YmtjOTg3OExzWElIWEo3TTRMT3UwcHplUFg2Skt5c1lSRk9OaW5TUUVVZmRV?=
 =?utf-8?B?TmhxZXlUcTdDeWh2SVJyOE9mZ2wwMVpiUExOQyt0VFFRdnR5V2t0WTJVMTdU?=
 =?utf-8?B?a0JRUitWQkNlTE9tQ0E1amJobjEvaEJ5RDlESkVWN0ZJaFQwMFk2eTJ1N1NI?=
 =?utf-8?B?Rk1ZQ1JNbyt0ZmN5N3p1U1RISWl6YVVPd1VSOUt1SUF3KzZJUWxJR1B2NGU5?=
 =?utf-8?B?UkVjQTN2UUEzRGkxZDBJanpOeWJZMmlrT3phZCtKODJqeVcxU1k4bjVleDBI?=
 =?utf-8?Q?qvcdAyxSa+ZWK1vZ3d9FOh+0OtD?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWhMVVZHSklmRkZBaFJUYVJWWXBxVUhUUWl3eXVvQXVZMDg2L3QrYUVmSjZD?=
 =?utf-8?B?SzdpVDhlWWFoSmNPSkgxekhVdlc5czFFeFpLTXdaTjlzdHB5cWZGTnRDRjF3?=
 =?utf-8?B?bkIwWTJudGFRRG04V05vdm1RY0hpY1BBR29KOW95dzF3dkdwbThUZGplbHhH?=
 =?utf-8?B?V2kvWnE1akRHZUtvVGk3QWNWZ0ZGZGJCdzBtTTZETWVRT1NNSWVXeUo5Y3I3?=
 =?utf-8?B?M1ZDQjhsUmk0TzlXQjhTTUFDSkZhZnlkRFc4b2tCMko1K2FvVXg0Sk1vc2hY?=
 =?utf-8?B?Y1FQOW13MTQwTmRSbXBBeFdMQlJwRURXOFoyRG85YmI3VDV2WTI0aEw2Yjgx?=
 =?utf-8?B?b0FPMVBndWUxYk1nVjlTOVpJMUtiS2h6MHFPUkU0T090bVRPb1F0QzhNVTZn?=
 =?utf-8?B?Nys0NWYxNW5oZEhyenN5S0t5Rk5vbDErN1JIUmk2ZmtsS1RLTWx6ajZ0aU1N?=
 =?utf-8?B?QjliZlpMNGcxa2JLbitJZGhyRkdTVmpiQ0hZL2dOZzlFTm9lT1VCc2JOZ1pJ?=
 =?utf-8?B?V1JPdGYxVFJqOHNuRDBpTVRkRlRHNk5hVGk2WGpIam1xY2I5QVVmNzZiUFdJ?=
 =?utf-8?B?Q2JTSXBqVTRWQXhnbTJUaUFpeHIwR29zYWxBZ0dSNkJxdnNyQlgwVE04aDdF?=
 =?utf-8?B?TmJUeERTZ3cwNGNESlNXRjc5NTdJa0dOdDBuVk5vbWhHNW85U3F6bG8vNnZ4?=
 =?utf-8?B?b3h3UDZ2WldtK09CWDBWOWRITVk5NzRNdHB3WnpUaTVPQlZhajhNbCtKdXNB?=
 =?utf-8?B?aDZXVGR5Q1FISVdHZkJhSWZGWUFiT0ZmY2NnYlFqMVZSb1lQbW9EeEpGcm11?=
 =?utf-8?B?N1BUWWhCS0E2TU5IQUpqbVU3a3JvOE5FMVlJTTZvMmhIbFVObkVuU2ZLclhk?=
 =?utf-8?B?Q3czQjhYKzdhc1pmczZJbTBmQkJxY0JVczlWSTAvU3BKbGllR3dGL2ZtRVE4?=
 =?utf-8?B?eGlGUURHbmlobUozRlZSODQ5QlIraXlGajEyYk5xTWtUU3FkbUlzaVJrSktj?=
 =?utf-8?B?SHl3VzI1ZkFNYnh5M2NiWklFN2ZNbzZCaTk4V3ZRZ3ZQRmdBRnQ2WmFnRDF6?=
 =?utf-8?B?RXM3Tk9RZnc3cm8zMnRVVUtIV2xxK1BjMFdqZjdRY0x2YXA1aU5vUFFFUWRP?=
 =?utf-8?B?NkxWdXpGdmNiOHNERmx5ZVd1UkZ3bUZ5b2VRK0R4aGljWXJ2MTlFSVBXZyth?=
 =?utf-8?B?VGVWSWc1M1U4WGVjNTN6ZGRsR1NzM1FRb0o1VCtiRUpkeGxleDF4bWpqSEIy?=
 =?utf-8?B?RDF3SzJuSnJTZjE1dmp5YUdZZ1dUUWJwU1pyRkFpRWFnU1UvRkRxaDBZejBU?=
 =?utf-8?B?aXQ1bHZmMjlmOTNsamJxeHFKNDdjWlV1cnRDbi9leStQWjEwZGR2ZEV1V29D?=
 =?utf-8?B?WTU5NjVJZUxGMHU0cWtOREE5aThoWVJpTk9qMEFqQXV1SG05Q1lxb0Z4YTYz?=
 =?utf-8?B?RGNubEJiM0JMdURudXZRaGFzR1RsN2h1TWtrVUltWXpuZ3MxNkVRMXdiYUtx?=
 =?utf-8?B?UnQ1KzdUVko0bWRoaHE1Y0NISzIrWi9vSjRGTXNIRGZuUkFwdG1KUkF6VXli?=
 =?utf-8?B?MHhqb0VvOTRDeXFubXhVWHJmcXNKRGpTcHJOZTRMVEFEMHZZT3lyV0c1UmNH?=
 =?utf-8?B?amN4VlVXY2hINjhITlE2WGZzL2VGRnhNeVJnVUs0QzB1TUtsdVdoaEVFRXdC?=
 =?utf-8?B?SlpTNGNFQWYySDNWeHNHR004UWJZZFBTSDcyYmliV1duc0IxZEVTeEtIanJw?=
 =?utf-8?Q?Y1WHt2XTw3E/XY0lsyLe8ceiDS5Q6wBTh0VMhln?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d97ebba-4192-42dd-3ef4-08dd75d94c3b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:37:10.5635 (UTC)
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

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for kunit tests of generic 32-bit FourCCs added to
vsprintf.

Acked-by: Tamir Duberstein <tamird@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 lib/tests/printf_kunit.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index 2c9f6170b..b1fa0dcea 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -701,21 +701,46 @@ static void fwnode_pointer(struct kunit *kunittest)
 	software_node_unregister_node_group(group);
 }
 
+struct fourcc_struct {
+	u32 code;
+	const char *str;
+};
+
+static void fourcc_pointer_test(struct kunit *kunittest, const struct fourcc_struct *fc,
+				size_t n, const char *fmt)
+{
+	size_t i;
+
+	for (i = 0; i < n; i++)
+		test(fc[i].str, fmt, &fc[i].code);
+}
+
 static void fourcc_pointer(struct kunit *kunittest)
 {
-	struct {
-		u32 code;
-		char *str;
-	} const try[] = {
+	static const struct fourcc_struct try_cc[] = {
 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
 		{ 0x10111213, ".... little-endian (0x10111213)", },
 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
 	};
-	unsigned int i;
+	static const struct fourcc_struct try_ch[] = {
+		{ 0x41424344, "ABCD (0x41424344)", },
+	};
+	static const struct fourcc_struct try_cn[] = {
+		{ 0x41424344, "DCBA (0x44434241)", },
+	};
+	static const struct fourcc_struct try_cl[] = {
+		{ (__force u32)cpu_to_le32(0x41424344), "ABCD (0x41424344)", },
+	};
+	static const struct fourcc_struct try_cb[] = {
+		{ (__force u32)cpu_to_be32(0x41424344), "ABCD (0x41424344)", },
+	};
 
-	for (i = 0; i < ARRAY_SIZE(try); i++)
-		test(try[i].str, "%p4cc", &try[i].code);
+	fourcc_pointer_test(kunittest, try_cc, ARRAY_SIZE(try_cc), "%p4cc");
+	fourcc_pointer_test(kunittest, try_ch, ARRAY_SIZE(try_ch), "%p4ch");
+	fourcc_pointer_test(kunittest, try_cn, ARRAY_SIZE(try_cn), "%p4cn");
+	fourcc_pointer_test(kunittest, try_cl, ARRAY_SIZE(try_cl), "%p4cl");
+	fourcc_pointer_test(kunittest, try_cb, ARRAY_SIZE(try_cb), "%p4cb");
 }
 
 static void
-- 
2.43.0

