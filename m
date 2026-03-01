Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGB4OEKMpGlfkAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3ED1D1248
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 19:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A4010E3F4;
	Sun,  1 Mar 2026 18:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BsRH9fv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB83510E05E;
 Sun,  1 Mar 2026 18:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElntEJjFouR8pf2Ho5dPYOBivmGbLqXz7FR02nHE2fTiw60DmjHmqUNi1hweAK9ElOaCNgY8hGo/sk2yHNsT0EF9CLwedctF7QEWhoME8GtSAtrBSJzim5+I9kMNjLKwgnjD/UdbhX8unmH8OL3786RqwNxCcieLvNOd00BEGLup99a/sGp/5XSqZQKBAl0mYJaCxcJB3cMqbo828nMdMZUuSyKSa0f7Z6SKcitUNeOn2Tk4pE4ao4IyUaiEuL1SGaZ7MXavZ50RD2o/x77RiIOtuBt8doSuNRCRJUdX/7Eaq7JA4QFDlpb+0QP1h+d63iKXjUvvfCk/PpyjYTzmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XP9OIa48IDitfz8Xj4Ab2grFfbqaWNM9yBEvtRQ3Js=;
 b=PEZvC7OO8ohLNfpg477cEIBO8QgkAcoEXgRHm9t/dyvvEjsITwouP+9pXWp0PTFIwFrs4O2p6pgK1QQ7h7eid2RVGPuuNMaAp8f3yBpS1IhhXagq3VqSph1SwuT5SxzGXGqutcdQr6aplT+tqhtA7mAG0bx25M2K+SsCi5iQwqgO1t8v/og3iqPfb7ylGrrfykS8h25tELEbCs8xmZ/Qi2dQjjESybXZBPaTiZm/8irJCqUxhf4ZAQMGtuUYp/MLF+J0xPfiPRYAYo+hZSNfU1+pCmHBmsXTB0n/O2hhRCAQK8PhVUKXUGzgi1DJnuZb5Ckxp2EUjmZxUz3BKRsHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XP9OIa48IDitfz8Xj4Ab2grFfbqaWNM9yBEvtRQ3Js=;
 b=BsRH9fv9UTjGCWXA+oRVyaXBJ37Wp/rKJR/T9oJKbMbN/900UV/iklLMYupvfuiyyV0A2ypxE3zOi+MCQeO853UbSznt8E5zrWnVgb/LUdof4U6FwmWo4ZYTRVHULW2o3HM+1jTFN2UdpwwOCv3gDG8z4/2YE4ryFT0XmS/77JgyEljfGuLBwR3/7n3adQLXgmpmmNaQeasqpJtL9DM7pYIO2/wqUYXcK2QvRT5rKCzFTV5pKa2GhHmao3+YJki5QWR0jcZJDTaSDMSsFze/aUIR0+RHGpNka3uRE5xXH0klSLOEjFIIxQIQ6MTvqSsorB9WUYjPfzheWmgFf8ftxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 18:58:01 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 18:58:01 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: patches@lists.linux.dev
Subject: [PATCH 5/5] dma-buf: Remove the old selftest
Date: Sun,  1 Mar 2026 14:57:57 -0400
Message-ID: <5-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
In-Reply-To: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
References: 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:208:32f::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb53637-ecf2-4891-7d54-08de77c47545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: O1jHGJ+clVSgHBPxRjBcbqu82PAd7yqz6hdvnDi9ZAHA9sBrvx73/Km6EZx6Z5EJ6Ld/Xw7vLonS4pi9ZA8rr4X3fBJxwJv9XF3U2zY7BLds/IsaUTmHcvVJwJII17GqRGnAtU1k6eb+Hd/1/vM3QlJOlbZT2UXWcX24E/IsZUwjZMab9y1ziL19UaiVqEkPKEEvIOKEDCN96jRCWrBkqyl4iG8J3gfPbcdnGe62wq7uwKg+IxU+rXNAQSoZbIbU9cnMcZjg70B521GSAlkk7kp8fVRZ0HvIobAXdr0GKrwcR4PkWPub6HDAmLhbgRs3361nKZ6Z0t9jBwXPjeSI6YT3oAtR3qDJHzhOzdk5xqP65hQXCzk2+s0h/K+m5EUCqz3CmqH8u0Bz7IijP5c+LS+hgFHjKicKNKQg9meR6UaVfMWghUTCWfTazt3nCGTVZRUT2MF5n8B+u1o0ep6pS2rGFzJupkqxhKsG8Nit12KgPZUNBaq9XeVu+8779JRLXx8tq0Hw+LpFdaAb0+ZA6aCpmvrEA2AluigZo6iSae9EPYxmrtG1+/I/LiSu3tOyIY1HFVrYfiiOcLJPSPApc3El49tqVqOil+eabLFouJomnnu0HJz3Kq60841i7nYxfT46vIdiuAjLhdJnIjdgSnCReDf4bFue4/WGoUktrkxVJzVLsZxWUTzMIXH5g7eVt4KbVy3GN+x6X4n17T3yfRblaQ43cmN6hVaYa0AsHfiy8MH/FVwIvcgtFQ7h6gLSNwZiJNl/lvUaZpVxOa7bcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmtKYjdBMHh6TUNSenJrUkJXNlNqMFU1MTBod2ZmOE1TRCtXb00vYVdWZ0ow?=
 =?utf-8?B?ei82QUZjaC96TFFrZmdiYWtRb0Z2cHFQZXd3ZHJrdDkyUUk1b21qMTlUNzha?=
 =?utf-8?B?K0N3WjB2Qkd2U3oraVJKUEQ5WnRieFY4bUdnN0Nmanl1YUcvQjdYNWxubWo3?=
 =?utf-8?B?emR1bEVzcnh4ck03UkllNGpiTEEwY3lOK05JcWROQm1JWEtKZnV0WTRqYVBt?=
 =?utf-8?B?TFlIU2hsTmlYNHlKVnRHd2hPcUZ1OHRCNFA5ODRzT3VIMk0rYThFWHdZak5T?=
 =?utf-8?B?Q2NnNHdQSm1PUnVsUnppcmtHL0ZhbXEyWjdGQlVjaU1NVUUzSUQ2SldiYlBX?=
 =?utf-8?B?VjJUVXBNZ2s0UERJbDFRZzhYREMyanNWRmZXRCtRZDhJMXZ0MWhub3VUTlRQ?=
 =?utf-8?B?N2lHL1QyK3VLaTBUNTdYOGFSOUh3THhFblY3cGdpSytwQ0pod2pZNG1ISVBO?=
 =?utf-8?B?NHRIYVU5ZWZJMDd1N1N1YzJYMXllRCs5UjdpKys3L3QxRzlHWTNBalpIRzhj?=
 =?utf-8?B?cWdqRnQyNWwwRCtFSHhwRjJaRDZsWEJQQ01SNENCbTVML283eVg3V01XU3py?=
 =?utf-8?B?ZnEwMEorck1scEdQSjVNa0M2bmVpNzVQUVVYd3d0NHV2MTlTYkFjRzB3WmFs?=
 =?utf-8?B?VHFMSlhXa0E0WncybGZCVytzT2hRdDk1L0F5b3oxZXRCR3o4aEZRekJUUk1V?=
 =?utf-8?B?MjBRUjJ5eG9MMXBJcExyMWp3aFZlZmMveFF3ZXpkRVVEQUNtRFdmWkhOK2No?=
 =?utf-8?B?OWo2T0ZQQWZqQlR3dWhWQVFxTkJGejRPbEl5RGF6Y2ZXa0wrVktQdVJkc1RM?=
 =?utf-8?B?T1Q1OUdOTHhhcEJ5aEVlVVpaVTllSkcxNEZUL3YwaUFKTHVraDhHbHNyY0hU?=
 =?utf-8?B?enB6QldyM3ZSaWkvOGhWaExVWFIvOHhlbmQ3R3FycENFMzY0cEwxWGhiejRK?=
 =?utf-8?B?OEZIa0xHcEhKdjNGVElmNXdHZUNSK1hHdktEVHFNRmo1elJXZDVwWVVOUGZJ?=
 =?utf-8?B?VFVjWEUzRDFGaUtoMFB6d1FFdEYrcWZyWXphb0RFTUttM00wWjI0clZzdkl0?=
 =?utf-8?B?RGIrbmlOQzY5RENaTWlUbFk2Q0htc04xL3JKK284elhRZjdqQ3ZvRnJ4Uy9z?=
 =?utf-8?B?anpEV0lhL2pNcVRUZ2lpSVNpYlVhajNWOGJyMlZUdWs1UFVwMmg2MTVqYXNy?=
 =?utf-8?B?VGFrS2pzZytQQVVvY3hxYkhSWDVnOThBVFl2MW9UTC9XQnpwdjlUZFplMDha?=
 =?utf-8?B?d09lajE3QUpqN3NPTVBYdUsxQUQ2SkgycmpJTEFjMjd1L1lFMkFZcTdTVDcw?=
 =?utf-8?B?bURsR2xkb1hPRDJrQmZxVEVkNHZyQzJxdC9XUHN0RjZiU0dCamFQdHMxNmpr?=
 =?utf-8?B?RlB5Qk9IN1NiUU5NT3dKazlpMC8rdjZJTzgvWThEYitwRHJEK3RyWUYvclBI?=
 =?utf-8?B?UVh2RDluQXBwZllySjE2OGJqVmI1N08vQUxDOHFaakQ0NTg0YmcxRFRRT3hB?=
 =?utf-8?B?N1BValY3ZnRScnk4bFY0ZytSRW9RUWVvem9iTlE4NUhYQ3FKUVo2bnQwVW5V?=
 =?utf-8?B?KzdtVTNKVmczaHdTaUVJVFZjVUFTVTdFcUNldFNYek1rTG5yWkNvdlovS051?=
 =?utf-8?B?eUIrUzIxWVgyVFpHbGFHTE80Vm1Xa0tjV2pvc0NydUhqNHpKZ21GZHdQaXc1?=
 =?utf-8?B?dUwvNVlIOWFRZ05VSzBabXl4U3ladHJqM253R3FHdllHVmhNMnlzb3ZJUHE5?=
 =?utf-8?B?NlpuSjZGR0JJVzhDU0RJeE02UXNFS0NiZjBZbWtQRmlnZXNRQkxpdWxIM3ph?=
 =?utf-8?B?dHBzYU5vbGtGQ2N2amNPaEk2V3o0eUpwbk9hMnFFMVA3VHljbXB5OTNUMCtr?=
 =?utf-8?B?Y0VQalM2elBPQ2tYY0hOU29JV2NQS3JHZ0FiRDN6RlBuZXRodTB4d3UrNG94?=
 =?utf-8?B?c0dpdlYrb3FNcjFXWkdnNEtNblpuaVFYdHN5SUlWUnJqL2Jpc0E2Q1dhM1Iw?=
 =?utf-8?B?T1JObm1DY1ZNRkJHL0tnMllTYlhKN3J3cnNJQkVQRWN1ZitlVElwbk55SnJo?=
 =?utf-8?B?THY3N2UyZmV6NUlrYkFoSDBCbVVYZEFab3g1c3RWQnZQQVg5bCthc3pWUTdn?=
 =?utf-8?B?bnBlb1BsclB0bit2N0NwbmVUeXRDWkQrMFB6bndMc2g4ZTFEbUF0dmE0bnBD?=
 =?utf-8?B?WkhVR3owYmZ0Rlo4bXNMbEpSVE12Q0V2bHNtVEhGTm9aTEtsZ1dSYnpDTzNH?=
 =?utf-8?B?bXNwM01pQy9IYXAyTWtiMmN2alAyOTJQQkRCK2R1NWI4eFZLMlpIMnVnOVEr?=
 =?utf-8?B?ZFE5cUF6M21KSk5pY3NockxFRG5odmJSY05idHNKOUVMT3JqVmRLdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb53637-ecf2-4891-7d54-08de77c47545
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 18:58:00.3551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl/QVyRyHGeCk1cOUn2H9wlU/DHyjrduYF74PF2rU47cQEHs85iJY3fUVcWnBU2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7D3ED1D1248
X-Rspamd-Action: no action

Nothing uses this framework anymore, remove it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/Kconfig            |   5 -
 drivers/dma-buf/Makefile           |   5 -
 drivers/dma-buf/selftest.c         | 167 -----------------------------
 drivers/dma-buf/selftest.h         |  30 ------
 drivers/dma-buf/selftests.h        |  12 ---
 drivers/gpu/drm/i915/Kconfig.debug |   2 +-
 6 files changed, 1 insertion(+), 220 deletions(-)
 delete mode 100644 drivers/dma-buf/selftest.c
 delete mode 100644 drivers/dma-buf/selftest.h
 delete mode 100644 drivers/dma-buf/selftests.h

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 7d13c8f4484dd3..7efc0f0d07126c 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -49,11 +49,6 @@ config DMABUF_DEBUG
 	  exporters. Specifically it validates that importers do not peek at the
 	  underlying struct page when they import a buffer.
 
-config DMABUF_SELFTESTS
-	tristate "Selftests for the dma-buf interfaces"
-	default n
-	depends on DMA_SHARED_BUFFER
-
 config DMABUF_KUNIT_TEST
 	tristate "KUnit tests for DMA-BUF" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index c97ab2d01a7e68..b25d7550bacfd5 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -7,11 +7,6 @@ obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
 obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
 
-dmabuf_selftests-y := \
-	selftest.o
-
-obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
-
 dmabuf_kunit-y := \
 	st-dma-fence.o \
 	st-dma-fence-chain.o \
diff --git a/drivers/dma-buf/selftest.c b/drivers/dma-buf/selftest.c
deleted file mode 100644
index c60b6944b4bd18..00000000000000
--- a/drivers/dma-buf/selftest.c
+++ /dev/null
@@ -1,167 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#include <linux/compiler.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/sched/signal.h>
-#include <linux/slab.h>
-
-#include "selftest.h"
-
-enum {
-#define selftest(n, func) __idx_##n,
-#include "selftests.h"
-#undef selftest
-};
-
-#define selftest(n, f) [__idx_##n] = { .name = #n, .func = f },
-static struct selftest {
-	bool enabled;
-	const char *name;
-	int (*func)(void);
-} selftests[] = {
-#include "selftests.h"
-};
-#undef selftest
-
-/* Embed the line number into the parameter name so that we can order tests */
-#define param(n) __PASTE(igt__, __PASTE(__PASTE(__LINE__, __), n))
-#define selftest_0(n, func, id) \
-module_param_named(id, selftests[__idx_##n].enabled, bool, 0400);
-#define selftest(n, func) selftest_0(n, func, param(n))
-#include "selftests.h"
-#undef selftest
-
-int __sanitycheck__(void)
-{
-	pr_debug("Hello World!\n");
-	return 0;
-}
-
-static char *__st_filter;
-
-static bool apply_subtest_filter(const char *caller, const char *name)
-{
-	char *filter, *sep, *tok;
-	bool result = true;
-
-	filter = kstrdup(__st_filter, GFP_KERNEL);
-	for (sep = filter; (tok = strsep(&sep, ","));) {
-		bool allow = true;
-		char *sl;
-
-		if (*tok == '!') {
-			allow = false;
-			tok++;
-		}
-
-		if (*tok == '\0')
-			continue;
-
-		sl = strchr(tok, '/');
-		if (sl) {
-			*sl++ = '\0';
-			if (strcmp(tok, caller)) {
-				if (allow)
-					result = false;
-				continue;
-			}
-			tok = sl;
-		}
-
-		if (strcmp(tok, name)) {
-			if (allow)
-				result = false;
-			continue;
-		}
-
-		result = allow;
-		break;
-	}
-	kfree(filter);
-
-	return result;
-}
-
-int
-__subtests(const char *caller, const struct subtest *st, int count, void *data)
-{
-	int err;
-
-	for (; count--; st++) {
-		cond_resched();
-		if (signal_pending(current))
-			return -EINTR;
-
-		if (!apply_subtest_filter(caller, st->name))
-			continue;
-
-		pr_info("dma-buf: Running %s/%s\n", caller, st->name);
-
-		err = st->func(data);
-		if (err && err != -EINTR) {
-			pr_err("dma-buf/%s: %s failed with error %d\n",
-			       caller, st->name, err);
-			return err;
-		}
-	}
-
-	return 0;
-}
-
-static void set_default_test_all(struct selftest *st, unsigned long count)
-{
-	unsigned long i;
-
-	for (i = 0; i < count; i++)
-		if (st[i].enabled)
-			return;
-
-	for (i = 0; i < count; i++)
-		st[i].enabled = true;
-}
-
-static int run_selftests(struct selftest *st, unsigned long count)
-{
-	int err = 0;
-
-	set_default_test_all(st, count);
-
-	/* Tests are listed in natural order in selftests.h */
-	for (; count--; st++) {
-		if (!st->enabled)
-			continue;
-
-		pr_info("dma-buf: Running %s\n", st->name);
-		err = st->func();
-		if (err)
-			break;
-	}
-
-	if (WARN(err > 0 || err == -ENOTTY,
-		 "%s returned %d, conflicting with selftest's magic values!\n",
-		 st->name, err))
-		err = -1;
-
-	return err;
-}
-
-static int __init st_init(void)
-{
-	return run_selftests(selftests, ARRAY_SIZE(selftests));
-}
-
-static void __exit st_exit(void)
-{
-}
-
-module_param_named(st_filter, __st_filter, charp, 0400);
-module_init(st_init);
-module_exit(st_exit);
-
-MODULE_DESCRIPTION("Self-test harness for dma-buf");
-MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/dma-buf/selftest.h b/drivers/dma-buf/selftest.h
deleted file mode 100644
index 45793aff61425a..00000000000000
--- a/drivers/dma-buf/selftest.h
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: MIT
-
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef __SELFTEST_H__
-#define __SELFTEST_H__
-
-#include <linux/compiler.h>
-
-#define selftest(name, func) int func(void);
-#include "selftests.h"
-#undef selftest
-
-struct subtest {
-	int (*func)(void *data);
-	const char *name;
-};
-
-int __subtests(const char *caller,
-	       const struct subtest *st,
-	       int count,
-	       void *data);
-#define subtests(T, data) \
-	__subtests(__func__, T, ARRAY_SIZE(T), data)
-
-#define SUBTEST(x) { x, #x }
-
-#endif /* __SELFTEST_H__ */
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
deleted file mode 100644
index 37b7251841278e..00000000000000
--- a/drivers/dma-buf/selftests.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/* List each unit test as selftest(name, function)
- *
- * The name is used as both an enum and expanded as subtest__name to create
- * a module parameter. It must be unique and legal for a C identifier.
- *
- * The function should be of type int function(void). It may be conditionally
- * compiled using #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST).
- *
- * Tests are executed in order by igt/dmabuf_selftest
- */
-selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 3562a02ef7adca..52a3a59b4ba2c3 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -51,7 +51,7 @@ config DRM_I915_DEBUG
 	select DRM_DEBUG_MM if DRM=y
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_KUNIT_TEST if KUNIT
-	select DMABUF_SELFTESTS
+	select DMABUF_KUNIT_TEST if KUNIT
 	select SW_SYNC # signaling validation framework (igt/syncobj*)
 	select DRM_I915_WERROR
 	select DRM_I915_DEBUG_GEM
-- 
2.43.0

