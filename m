Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD4A7F542
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 08:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B9F10E1F7;
	Tue,  8 Apr 2025 06:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="gb7eDIw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010009.outbound.protection.outlook.com
 [52.103.68.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8596310E1F7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 06:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkFOpcQnQDhyJTsFzsNBCw62aJNt67cqROleDh+jfABeXFU90UqGhlkvtGVmns7zRM+0nMFldombHq2sdljeXVv9cCX8s6hUDrfcKWS8CZFIyAGbZfogefX0qGIdlOTGr8UFsippeM4RQ0vrdb3wCaAQRVOdsJ98s/9Km9yJ8mWMkFZ9uqD+6ksyBt12NdKRgGDBpRxsE+HzlR4xf471hG8mwhjDfTFqQwEs++U1wIEyjmJCf39biJ+RT9aUHpULpytX7DWG0831+cP8npyWgzc37VqnhrIMbx7uF9v+Ho+qPC5UQbOWG/2+lblKnk1znttHI9omyYJ+nmWZH3T/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxCbrftVY4dmEBHU29MzLWAFfws2qVVZjTjU3bOQ4yU=;
 b=xcqpFyeNf2lwjz0k7D+xL78XTzFtNyXItM+QhZF5uP6Zzo2WK8LmekwW/LwX4YH2VB/fTjKliG8lVgTBmBDnSXvltaCvuO8vi7OPwSOE3lwfLihGrF5xvwYXlMdbU3mJyb1vEKgsqAbmb4bVn8p0tINfB31bzdgqoflZDefgaZSDqmlG1pcWmzmFD/KiLvfreySBI8QBJmQOydzVwV14dbTyT5umgyYcvvyMKoxkXUbp84NRK8LsLL3kkMsr0Vi0MA/sOpf7RiKm+OXfCgKZn4E2crWvUoUV/07W4nSjoZdjiBAAaOhjWMku/tGV65tOYDoBnRIYIIOUBylUrr1EqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxCbrftVY4dmEBHU29MzLWAFfws2qVVZjTjU3bOQ4yU=;
 b=gb7eDIw4660Qh2CSzcoYWnxqfkFX+2AtAtT2hpqgEeIlAVl+GmVgWi3faWUOGS8HP8O4pg30M3BEkV8RzU+NCzoTlCT88kRT8nMXNMEjrtV6N6Du02+Uvm2DUvo1xdZoUGL8bbB9Fne3wSsXMU8w3IckvW9CikDkdJ+DUdALQA1hArEAyXSXOyvxKfWQDkEj8ABigqtR7cg+PdcGaHPPCC9bElmZWg1ey92Cz9ZABH5IPHEO1AUcSBF8tsQ77GUI5SNvT+OGgNw0a74/y/eLnHDMgmfhqCkBwF11+pASuJfrOs0pqJIzhG/Gea1fzq+o9gcM81b7rm0ATzCS/UfMcQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:5e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 06:49:16 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 06:49:16 +0000
Message-ID: <PN3PR01MB959783DC6377C4CAB203D7ADB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 12:19:11 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/3] drm/appletbdrm: use %p4cl instead of %p4cc
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
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <cc6f812e-f1ac-4b0f-995c-f353bc444baa@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da374a2-c1a5-48e3-9464-08dd76697aba
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|5072599009|15080799006|7092599003|8060799006|19110799003|461199028|440099028|3412199025|41001999003|12091999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDNPMnlSRHBKQytybkRBd2VxU2NEdVpUdENVQW02SjZOVVAxeC9OTU54ZGpX?=
 =?utf-8?B?c0RpTEFpMCtkOW02eUVLMDhlbDlya3djUGpub2lBV0c5elpQWWpyRzg4M1dl?=
 =?utf-8?B?T1dzcmZPMXUzMUlXZy9EYkpMYjBucmZiek80NTJsa0d4TW8zSWtndng2R1lP?=
 =?utf-8?B?SkQybWt0cXZDa0picGh0c3BCNFc0aDR3WVpESm40ZU9rYTl0VXo4cWlKZ0VD?=
 =?utf-8?B?MmlHM3JkbkJDelVEMnF2VUdmZmtvakVKZHhrcEVDVUZnVUM1bzhRQ1dER1FW?=
 =?utf-8?B?NUxDaTh3YkxsMXJFS0lpdTluUGpVbTE4Ryt3bVUyT3A2QTRUT1hlTkYxcmls?=
 =?utf-8?B?U2ExMGxkU242akF2dHd4cmdGRFFrWWRmVjhuYUVDemJzV3V0Z1hCV1psUlZB?=
 =?utf-8?B?MUxHcm1BWUoyZFd4SkNTS0pheUxZbjg3ejVEY1lNdzBxWWRjNWF5MUVDRlpJ?=
 =?utf-8?B?TU9MMVFwbWdEYmkydTZhRFF1U0E5VytCa3VMZWV0OEg4QU5DNWdmZnpoTThL?=
 =?utf-8?B?WjgreVhLbEdpMjlyL0xvNVplWHRaRUxNSWErek9iYWQ4VVBKcko3YTc3VVhC?=
 =?utf-8?B?ZldJR0htN3FuU0lSYkJHWjJmc2dIcll3TjhTZE94NktlRWZQWW5nWktIYW1X?=
 =?utf-8?B?TXZVRXR4M3kxZVNVdTlJdW41MHZUQ05YSW13bXk1OW1zdHN2cXZSODhBb0ZR?=
 =?utf-8?B?dXRsdUFDOTdEc09TdlFKVDJXVEVnajROWlhwOC84Ukk1M1UrNmRmdDE5WEgx?=
 =?utf-8?B?NEJ4SVJxMzUxczJqOHh3TjRMblBpaUFURVcyUW5hUFBPZ3hFMTdEak5EZVdD?=
 =?utf-8?B?bHhuMmhRR1M4STlwZ0oxTEhXR2ZHZHREUHdqWVcyK1JRQ2plNzhuYzA4bU9Y?=
 =?utf-8?B?ZG0vck1LajVrdmwrc0lhM1JLTmRJMzJwamRBUEVqNmp4eHI3b2toY09WNGlK?=
 =?utf-8?B?RXlUTnBWeHB5aWxDRDBHbEJjUmVWaEdjL1BsekU0UGxSZTRWYmFUNmpPQ3Rm?=
 =?utf-8?B?NlNnMnV5b2pQRU5NYnYzTjZIR3cyenQrV3Exd3NQaUpSR0MxNnlmeDFFbnZz?=
 =?utf-8?B?U2xYKzhVcWhsaUVIUjBmWWtmU28vdjVqUTRMU00xRmZMSWpRb1YxU3IyTW9D?=
 =?utf-8?B?TzhmTjRoUUZDZjZ3aXBxNExrZ0tqdXVsSzFEWDFRNjZ3U2NVd1dESFEyR01S?=
 =?utf-8?B?bHJqaTkwQTd4TWtwRko1MUtMOU5DSGZHSGZtTXlHQWhZWUJPbm5pWEI4SnhD?=
 =?utf-8?B?YjlIbHRnYTRtMFpaTXNOUCtmY1ptZVMrMWxOYjZYMkJIcTFVbFRnYzZ4WkEv?=
 =?utf-8?B?dXZMdnY4dlhGQjlGS01Xemh2Nklac2x2eStiMVE4ckJTNWtrbEFCcjVWanlM?=
 =?utf-8?B?Y0FCV1Q5ZTVKT1NocWY5NDh2OTAydVNXaVR4RWFaS1U2NFBkM1oyMW81OGgz?=
 =?utf-8?B?T1JoTFNqYmllWTFiY3gva25NcFFxT2RuMXdYVWJwa1Axd2lZd005Tk0vcGxo?=
 =?utf-8?B?TlVOeHNSeEpRQnNsMk5wSUVHbGZZL1BxdmFPM0RTdCtua3A0NHA2YTFhYTdy?=
 =?utf-8?Q?hfuaaQObCmF0jf2cAnDH0PvZkVCIln7JlP/GSvV7Yfne9G?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE9CdDNWV1BRMDBqZlJtU3REU09yU0IvaDliekJZZ0doRFZUcHhDd2VVVUwy?=
 =?utf-8?B?MjVVRHArZTNadU5GbzNUb2k1eHdMeExmZThFaUxPNHA2R2pQekFvaUZMZVJl?=
 =?utf-8?B?V2o3YUNiRmVRc2pIWlFGdms4S0MxaiswZFBiUmNvKzIwZXNudDdlYUZ5cGNO?=
 =?utf-8?B?eVhvTm9xVllSWU80TmNCZ0prcEpYK2EzcXA1OVZmRG9haUZCYldYMjVNM3hx?=
 =?utf-8?B?c2o5TGNmUml6SkNpZ2YyRU12YXFOdmM4QWpEMlp2cFowZWsya041ZjRXREFM?=
 =?utf-8?B?aFovYVdGZFFIZmhZdlVtdEc5b3B6VVEreTF0NUQvVWxzZTNlbEhNRzJZQlNP?=
 =?utf-8?B?bmFvZzZnUmpHRkdDTFlOV1lwc1pvV1pDZHhzL1F3c0NPMG1CckFjWGxEN0JE?=
 =?utf-8?B?WGVxUU5pTWYzOW5LQUw1b29FL0xLWmF0OVp0ZmlqMWJJY0tDQ042RDFMUWdZ?=
 =?utf-8?B?ZlFlUVVzcXZyTGxYVndPSXZrZklIbm5zbnUrdWlaMG5zd3BRQlUzZU1TODdG?=
 =?utf-8?B?L1Z6cUNIUVJpN0lsUFEwdnZhRWdoNXVuQkZuVDRvVk9xLzIwbUlNMzBiK0x6?=
 =?utf-8?B?MmwxME82QmllaDJwTnpJcVY3NXY4cTROREpxQ1RkdURlZ1FQMnNGZDBXdi9j?=
 =?utf-8?B?SjdMc1ErZ1VDTjdKQU5qZzdYTHRzM3dTQ1I4Vk5RTlIvQWtiNVNLQjZMNlZs?=
 =?utf-8?B?RzZMMDdwaDRyRmZ1MUp0Wk9JT0hwcVk2MkhSMnBPNEhyU2Y2UGZxZUVnWEVF?=
 =?utf-8?B?Yk11Vis4Y2tqSjVEdVhZU1pVNWpCSTRaS2JoaWJUK0MyVUU1ME9qTkRQUHVp?=
 =?utf-8?B?bXVCb3ArVGxsNGVKV091RVBsdk9RUityem02SmVENGUyeXMyb1c4Uk0raGJw?=
 =?utf-8?B?VThmZVJvUTlGeldGbExSbjUrSjQzQ3FzdDQvdlU4bnh4QUxsUDQwa25tdDNR?=
 =?utf-8?B?TnFWdE95VXRNUkpwbVd1RERlb0l3akJ0WndhRysxMlV4OHMybDBuSHN1dnJN?=
 =?utf-8?B?ek52WWVvNGtweU1PenBOeGQxeFYyUGVaNG5DZ2pycXd4SjIxY2Y0ckFNR2c5?=
 =?utf-8?B?NllYVHp5WXZwZ0UzdDhxRXpLa1BXMHhQWFQ1bFJJdVZacjhDMzRwd2grS0sx?=
 =?utf-8?B?SEFvcEloMDd3R0hGWTZWbUpUakV0VUg0NjJtSE84ajAxUTdPdGNXWmc2MTdm?=
 =?utf-8?B?c1RFMFB1RWVtNU5XWEFLbUZuSTM4aVdKckhDYTlSdTBXTHQyd0haNjM4bG01?=
 =?utf-8?B?c2FlSkMvbGYxbGJya3ltL1hsZ09VODcwaTdjV3lZU25wMFpsTFE3ZEpISUtJ?=
 =?utf-8?B?dTNtaVlqalU5ZU1VZUxkRFNzMlVGMkxheVJQbXUySHR3UnIxOURGN2JNbUxx?=
 =?utf-8?B?b3prR2lyOHJ5bzFsMVNoVkpNclVxdU9Jdmo1UWZyZUNaMVZBdGgvbkNlUkUw?=
 =?utf-8?B?dFlhVUo1U2Vnb3I5aFN5SDJiWW53MC80bzliUXFJTFU0bTZJMXgvWGM3enZv?=
 =?utf-8?B?R3hkWlF6UHU5SytEcWxOL0UvVXdVZVV2d2JUSm1Fd2duMmV4NWNWTDQ4end1?=
 =?utf-8?B?SFo2cWZkYmdXZXdzU0k1RXVBcUpTTDlNUTR5QXc2LzBUamZhbXVQL3hqZ29X?=
 =?utf-8?B?VUVGeFFuUE84SmcvUm9ITDVRSUJydzdyQ0JoS0xCVVBLU1J2YThhOFRYZlR5?=
 =?utf-8?B?Q3ZaRWp3bWhONVZQYnp3S3YrSkwydTBsaWl4MTA1NElVZy90OUlJa095N2dl?=
 =?utf-8?Q?XPnImQg51oXkGQnFaGLPgpTovgrMYD6Z4ARIyiE?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da374a2-c1a5-48e3-9464-08dd76697aba
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 06:49:16.1201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7052
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

Due to lack of a proper format specifier, %p4cc was being used instead
of %p4cl for the purpose of printing FourCCs. But the disadvange was
that they were being printed in a reverse order. %p4cl should correct
this issue.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index 703b9a41a..751b05753 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -212,7 +212,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
 	}
 
 	if (response->msg != expected_response) {
-		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4cc)\n",
+		drm_err(drm, "Unexpected response from device (expected %p4cl found %p4cl)\n",
 			&expected_response, &response->msg);
 		return -EIO;
 	}
@@ -286,7 +286,7 @@ static int appletbdrm_get_information(struct appletbdrm_device *adev)
 	}
 
 	if (pixel_format != APPLETBDRM_PIXEL_FORMAT) {
-		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format);
+		drm_err(drm, "Encountered unknown pixel format (%p4cl)\n", &pixel_format);
 		ret = -EINVAL;
 		goto free_info;
 	}
-- 
2.43.0

