Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ADCA7DF88
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331CD10E469;
	Mon,  7 Apr 2025 13:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="g5QYR7Sx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010010.outbound.protection.outlook.com
 [52.103.68.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C143610E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aC9Le8BQ+l63vIOCRk6IRayyx04ZAd8p9bDaYG4UQGM54l+Ih46CJyh0bBKdc9DODdG2V7t2azMj/A93hBCY6A+54LgLow6onXgbBiESkgapnU8OvsYE7Hc6gsL26oSUh5LvVEY5UCLPSM3IHwSVqfcwrpqWAnlggb57RRQWH0XZX9n55hT7jtjdfrPWK5nML8PkHsaNGT9+Mfrzmdpx3PqTL6ZshDxoj73kAGEOv4xweqsuNtYXW3H0PdDuNQKNzyAitAS0Q1jx0KdIeQ2S1jB9dyAYFIEjnDpgqKyOgogPnro6s0RGhcRr8MY4evlbDFCIYkWRrJ4ACEX+oNP8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQeZ+h7jk0KS4dpMaymYhL5l8BSaREklpUecC5FBtUI=;
 b=n9VSFm+aBr27xIQ9Q+3+j25KwUt7MXpGKfP2MFyETVYAKNGePReYMyOMUfg/ioDM9cSHSqmFdUfPfvoI9vs98R/qYUS83YS54ixWWeB8s8DVmCIwAtokn3t6IceqMDN8Ce84VkfqhIBobG6VHpkt0N8z++KVD8Qh4NMQO0k/6To4kgUq2Y4PxVog2f3zPdrGTE4n0qoMvdsWfJTtUu8hXa1ziysCWta+kVccoOEy0I1v5hEvqPXQNzqvmjRU1Z3B4df98zGn/10+X2e7hmP9SfTz6A1Y0gZ1Wn0Ir0ER0cqb58KJTGiXdJk6kTt5hZQddjB4XkvSP/ylzcsP/T2SWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQeZ+h7jk0KS4dpMaymYhL5l8BSaREklpUecC5FBtUI=;
 b=g5QYR7Sx3d6R3/LAkEGTdJXHnA246M18bYbnm4Z9lUUwHpnmlarIllZQF6/zKOdHh5vMQK8lFKrSfeo1QGHNOThtR+9t6EqhCnQKUzOs5n4HCJUTu8qMbOrEKWPvhBXynuDZ2o3z0tvnCdn9gWLHnHO9oZW0hqIhwqhz/mqt7YV4buMrNw8kRHJ2ZJGMFKzHBRZ5tTn1Kx8gFiZFy8/mJrhwfdohwKUCvWMXJunF3PPhZ/nzbSFloMeOSm2pnJBDuXMEDt+LamK5BDNbXAPjYW3BB96rr3tBd2LhyE5ke7AlDDAJDEUa3XoGROvzYuQkQbo70zUSpMCfdxf16aBghQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6823.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:94::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 13:37:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 13:37:58 +0000
Message-ID: <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 7 Apr 2025 19:07:54 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/3] drm/appletbdrm: use %p4cl instead of %p4cc
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
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <58537fd7-eb7f-488c-a315-ffab4414ec2b@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 238c263d-d9bb-4553-4fcc-08dd75d968de
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|7092599003|6090799003|5072599009|19110799003|15080799006|461199028|440099028|3412199025|41001999003|12091999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmxraHBKeGtmMmRPSzNiNGZOS051eGVZSndSeWZWeisrTUZsbnBvRDBHZEFV?=
 =?utf-8?B?VHM2SnZ6eGtRQ1lYYlVpWkE2MUtCdEdjdDIzbzFCYlF2eTRXOU1pd1hFM2ZL?=
 =?utf-8?B?RHVqcHBtS1pEMkNIYkRhN1ZxZGYwcmp0NWlidnRReFlUaUpGRFN4Z1NIV2hD?=
 =?utf-8?B?SGp6UXhSaDVWQXZZbHRsRVRhbjRqWVQ5VmphSWRZVld1K2xTZWVOajZnQTBF?=
 =?utf-8?B?c2pZR0d4WFk0WjlFUHoySFJ3amwyUys0OFEyM01CbmNYbzZVS3hBR1ZIUmw3?=
 =?utf-8?B?SnRqT0ZWOTY0U3h1dFF3K1ZCOEVMMVVtb3l5UEEyejRNQmh2WXlaS3ozVUJq?=
 =?utf-8?B?VGlsd0hzL2RjbUFoZDVCTjM5WUxWUFc0TnBQVi8zRk5LM0xnbXhZTVFoTHFI?=
 =?utf-8?B?cjArdUg0cG5XOGpjWFAwT0R6UWoxYWF0cFhiTjU5UnhvMmQvbnpLbmNoWE5T?=
 =?utf-8?B?S0NTVFN2T0hmNFg5aUZzWDRVNVJkU3kwd2R3RWlEUWdLdEpEeDV0aDBZRGpS?=
 =?utf-8?B?amd4d1JiL0paUTZ3eW9QRS83TWpYeVRvL1BaYkJhL0dlbm9uS2o1Y1ZWTmRV?=
 =?utf-8?B?WGhZaXlpMUs4b21PU3BUdFg1WXV3L0x6a1p6dWZ2eG9SUjlXMGZ5am4yOTFR?=
 =?utf-8?B?c1VFR3dyZ0lPV0kyWGxzUzNvQ01tTVBKMHJhSnhTUEp0U3pacHRlZHB5SDQw?=
 =?utf-8?B?SW5EVU43L1BBZ2h4RU56QXlNQ1FsUjRHalV1Y1R2bWY2UGFtRGhobW1pZnRH?=
 =?utf-8?B?ZWZaQWUvRmI3WnJjbVRZaGZpdTkwd0lscDloUE90d1NNOHNqaG8rQk9Gck5X?=
 =?utf-8?B?cHorZmpYRmdOZGdtbXJSN0w0MXQ0YnRpaGprNWVFS3hZeW01ckdTRC9idyty?=
 =?utf-8?B?ZERMRnVpYi9pTkZKRHBqNUNLcFkrNks0bE1VYm4zaDZ0dThhUHhhWktrRTFF?=
 =?utf-8?B?OHkwMzdrTExPLzVDd0pNSVhldTZRY2ladWVpNVFaWjR2c29sU2Q1S2MzSm0r?=
 =?utf-8?B?NjVBaDlkUnoyN01QMnh3UXVTNGZ1ejRmTkxQQjc1ZGVDWG9CdXRQVWtqb2dB?=
 =?utf-8?B?WDdPQzdCNVBXREVLZ1lHOFc5RGF6UDg2VVFuRGdvbEZSZlo0aHcwK1c3VHhQ?=
 =?utf-8?B?dXlHb1JKKytBcGwvMjBnZ3pKUndFSm9sbmtoN2JlK0RhWTExN0VHVit0MnRp?=
 =?utf-8?B?aTNHL21rOHV6UHY4ZU9IK2krQk9uZUliczhFU21Qb0VubUo4dndvQkJ0eGZU?=
 =?utf-8?B?LzhVQVgvSkhHU3BkSFh6ZXF0UW1UVVd0SmpSbFRMU1FENm01MXFYTm9mc3Rx?=
 =?utf-8?B?NkhWcEk4cndWVXVPVGtQMW5CRy9Rc3Yrd0dlVUNQM3VQMkNHSDFOWWFIcjNW?=
 =?utf-8?B?WEx1VG93Umd5YUlTSjNYcFcwU3ZIS3NYd0FCYitVbXpzR2xXNGFvUlVMbDlV?=
 =?utf-8?B?OU9laXdLd2RFQ254ZjcxczBCT3lCaktvL0lNalZPZS9FWmpIQVJVQ3JNeUhq?=
 =?utf-8?B?WC93TXNWdWo3MU1hUElWUWFpc05RbkRrS055K1JkWHVxZ2w3Rlo0WTJRYlJm?=
 =?utf-8?Q?ycQx+0Lb8uT1ao4gBnWVphchl02YlNXReXa3uHQUcHTRI9?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2JMUFJxQWMxK1hyRkZUQ2h0NTNkZC8wMTBaOWRsMlRmR1RtbDkrUlNtVVVh?=
 =?utf-8?B?V3pJOEtHZisvaEc2N1dqZWRibW1ZM2RjdGVaS0lnbzdraVlkWE5idzJON3Mw?=
 =?utf-8?B?S0NjTmhlN25vdjBLQjVYUnpCNXd6ZUg1eDA4OVozRTF5SnBRallWcG91RHFx?=
 =?utf-8?B?Ym5ReXZnVkxFd3lpcWNWT0tVbjU5c2tJekhLQWMwR09UZTJwRWJLS3hqU0l0?=
 =?utf-8?B?TGF3YnI0Q1Y3VDd3OGNqNEhtcGtERlFLK0hES2VMVjllV3d0VFJLTDlsS2s4?=
 =?utf-8?B?eE9UYitlcmdqU3lySDBsMWFIcENUWUlqZ0w2dU9CQWhQREpZeGNlcGNkeVFU?=
 =?utf-8?B?VVRzTG9ZWE1EcHdVYVh3ZDNMdzBhTDdvZ011clRaZjQ5aHZrZ0pYL1U5bXNH?=
 =?utf-8?B?U0k1RkJGR3BxdnRWRVcwbi84cW5KSzFZNVFLMUZzRmpWd0pXbTJWV2dXUlpt?=
 =?utf-8?B?Ynlwd2FjVEo3aG9CZkE4UXUvUHJvbkIxWWVrRG9KVmZRZGNaK3N4NjVXMzF5?=
 =?utf-8?B?SDV1K3RZWWtKM0R4Z0pNcXQycEFiL0hJZWNnRGorVVlNNW1lSFRINGF0UDAx?=
 =?utf-8?B?aEY1Q2xCeVgvRm8zb3gyOVdHc0VCS3R3T1d1VkgxN2NkS0N3YU5oNzNFd2Zx?=
 =?utf-8?B?SXZERE0rOUdPeHliNWhMTllGOTRHVnNjMzBlMGhWYVd4b3ZwczZuaEZEU25t?=
 =?utf-8?B?Y2JjZ3BmM2JVL0htWE1BVU1XTExvWTFGcjhsSXNoTG5ZUENIWklrOVZrWW1X?=
 =?utf-8?B?MFN5dkxDK0xUN25VZ1VtcGNrbjBGMHl6UXhPaElwbnlzMGZHZXc5L2syU2k3?=
 =?utf-8?B?WXNjNEJISTJxVFZad2xXdDVNT0RIV2VXMnBod3Y2NENOb2hjVHMrQ0x2OUN6?=
 =?utf-8?B?STlNUDRpalN2MW1iVFUweUMvK1RXOWRQMm1vSXhGZkY3VGRTZWl3NTdTQnlq?=
 =?utf-8?B?N2tsUy9xZ1ZkV3BTdDdtOUV6MThxSlpac2hJdlBFbXVkUmRKWkpnbzl0cEg0?=
 =?utf-8?B?QkR2VnhqWlZGVDF6ZkwzVys4UHdGU3NYMzR2bnV4eTFQTVAvWGlSR0REYVVE?=
 =?utf-8?B?U0ZMR28vLzIzVDFJNytFeEZ6YnRXc2ZJc1lhdGxZVjlPQW5OWXZuQUk0bTlP?=
 =?utf-8?B?OGRYRC9ZK2Qxa2tPUHozdnpUTy9HN0g1RnpyZEFmRkU0eXN6UVVVZlFBeWcv?=
 =?utf-8?B?ZUtKKzVKemFHU3AvVGg5a1ZjYys2YU1RSnpCNW9uSThVTCt5YzJTVERnZ1dx?=
 =?utf-8?B?RjhmQXI1VnlzQWtxS2FqdHhuc1dSWm9Feno1R1crYkZpdnd0YTRWNW9wUVZG?=
 =?utf-8?B?S0pNUlNYYVA0NktFRHZ2NklUelFKRlNJSlJ2R04wNkVkRlR6Z3ZFN3RGK1Fj?=
 =?utf-8?B?UXRCU3MrbEUxWDEyKytmNVJKVWxLR2VobGdIV1QyVDZyTlVwUmNEWVRNSWtC?=
 =?utf-8?B?U1FIUkxWRGhQVjJlRzRNRjdOT0k2Z0w0NHBzakJ6RVRBZ0pkUzVtSGlpRFIv?=
 =?utf-8?B?T3pyUjh6c0RDKzRadTF3RjhQYjFDV1JFK1VNSC85RWtEMENMMkJ1S1J4WkJk?=
 =?utf-8?B?Uklwdk1jeDVWWTNFYzJlLzQ0SVczT2pNdXE5VFZpSE11eGU2dm5JMGhZVnV0?=
 =?utf-8?B?djdzRDhYWXExZlcxa3dsVG5LckQrWlFLditMZjF5NmY5N3dRbm4yOStNN3VH?=
 =?utf-8?B?aFUwbUlBdmljTmpzK0RsKzk4dU1adDhUM0NjU2JDalUycTQ3TVcwZU1NWXBh?=
 =?utf-8?Q?ra3XNoaaG+7thSb74MQD9V5/WRPOtzpgLHL5ff5?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 238c263d-d9bb-4553-4fcc-08dd75d968de
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:37:58.6267 (UTC)
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

Due to lack of a proper printk format, %p4cc was being used instead of
%p4cl for the purpose of printing FourCCs. But the disadvange was that
they were being printed in a reverse order. %p4cl should correct this
issue.

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

