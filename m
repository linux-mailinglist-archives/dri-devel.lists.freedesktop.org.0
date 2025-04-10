Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11BA84BFD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 20:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1F410E0E6;
	Thu, 10 Apr 2025 18:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="ueoHZ4Qa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011024.outbound.protection.outlook.com
 [52.103.68.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2219810E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 18:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvM8uSxnxr8wm08Hn8qLVjwYispRk0aSHdOEHCGXIUhfkIyeuz/VurFOwbQrP5f9H+zjMhvB/pz9zZTW3pjjoWNfLZPUpbjlTgwZEsGI0d9jwPVOGD/+bFrQCCuuTK0F2yi4ScmnziW5GVulvr6Z59LNzcHQfcdR16qlfNd/vvzV+b+q+hvg2BvieEbCyB+JX1/lGrDi1R+GCuzEeoj8pi7qHpAOf06P9jY9e6UVfYtEz5jRhdnTmPwzfiNtVeLS4sbNNl6WGI5ZCDoNJvXwqwU6BwFMI1RFVpfDH9rAIfPnyWaTOF9rLNTnS4+cemqnMjzZUeM0ZSDPL/DwPMNMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiMkLnt6CZ3PoBUqS9xjo4SC+sEp2xBR0I1PPglZtHo=;
 b=WKm9rmfSdegR/jWfxR9UapAxEAt/vvvYG9XTis1ncFvx2Zf4Hfo/+ZruXZZIM8UAkGlDjDGs6oE1o7z8FHrPx/c/oAEs+gzpGxi2OnP1xzBxzzN7OrjuTgldzTxSyjVtRGAHZ+ASAaGIPVGGL2XpmAydfW4Xha+A1zYmKr/mINo02++JCsLLoLYy6Osdn8C9+Fh8IgEvzQee+FvuSNrQ4pm6U/lgHEwsOMCXFYCYKaJ2qp1/2n8oP3TS50wQ8FUCW2pNLig8inef2sJFpH44FuIzpsgI96MqwVrtTU4qHJxPQvTDXjK/XYZnGeOmUPOeNnHoz+uM6f3H1xWENx9DCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiMkLnt6CZ3PoBUqS9xjo4SC+sEp2xBR0I1PPglZtHo=;
 b=ueoHZ4QaLGcgI6Gv1jCoCVEEr8Txpqp4brx7WoqZDqVFq93klNsOIgSZySgBNpAUGRIoCX38EaK4kapcaGSA2g3R3PILQJu3I23Jqju4NTrmSxxkI8boK4fXaUcGYVDHQfIAooXLH0BbL3aRGPCUCXVTjaQP3hD4PQYOSjtHrW81nKWb21oi+XQE25ga6WpLj3kJtWpC+rzJT2WwiagvYO6P2Uq9zk9MMtpo/lrYi82VUQKwRetJ0A4I6CTjo1NK+92+5/4EA23YmZhFF8/GOrV9YD1QbyEWnxwJ5y2/yeNQp9AiVsFWLPWLNWTTmfJZCB94IDmaYVW1uXG8CC3AKw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAYPR01MB10762.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:152::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 18:20:04 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:20:04 +0000
Message-ID: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 10 Apr 2025 23:50:01 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Aun-Ali Zaidi <admin@kodeit.net>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH] drm/appletbdrm: Make appletbdrm depend on X86
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::29) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <eac34bdf-f36a-40a9-8c00-ee6ea0b7f1fa@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAYPR01MB10762:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edeab0d-22b6-40cf-9b6f-08dd785c50d8
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7092599003|6090799003|5072599009|461199028|15080799006|5062599005|8060799006|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2F1bEt1N2Q2Z2cxQ24rTDE4M05JQWh2ZFpTSmxGRTNjTEo0ZXhZUFUraG9X?=
 =?utf-8?B?TjBScU5sV3cxZFE2SmpIZ3BlQzl6azFjY0Z3RTdrenZmeExCR1ZjTDZOaEx3?=
 =?utf-8?B?dFhyakNNTnJBeTZXdXFpS0VkWElQYWltTUpOZTZadnZiMTBVQlpFOVk0bnlL?=
 =?utf-8?B?dm1BSjZBSndKRGhvZkxGRGFYOTEzV1A1aHJBVE03NUZYc1BFcGVDM2V1WXJo?=
 =?utf-8?B?eFJrdTNEeVljSmFXYXFsVU5aQjU0U05rd2lEdWJpdFJWMkdRSVQvTE5rQ0xY?=
 =?utf-8?B?L2VLU0Z5cDA3c24vTWRwOEtsaU1XanJubFRJQWU2WTJLMFhaNlYyNHBGYkV4?=
 =?utf-8?B?QTBDbEtsM01URUZnQlQ3d3dyU0grcGtyWThQN0dHN3ZRRmJjTWx5YmtneUY3?=
 =?utf-8?B?dUNMY3pVSmZrRklCbUZJaHJtLzlsQVFxZWt3bEtVckprUHlNYXA1ejcva1NU?=
 =?utf-8?B?b09RZ09ueEdmRGNSU1dFU01GNHUxRlJ2WE05R2RDNmNVQjJvaGpvNkw4NGE3?=
 =?utf-8?B?bDZSUG9GRUVFSVJ5bTZrL0FrV3lvL3ZuNGV3UU5HQVk5d09Icm1ONHloZGR1?=
 =?utf-8?B?Nlc3aURVRENXUkdzUndhN3NsNXZNaTA3bUFYY0U0VjNvMWVQa0dpbUUxUEFK?=
 =?utf-8?B?dHQrZkpIM3NJVFhRRG96cHJMM1AvQWZWVEcwV2VGc0szdWE1ai85cGdsMDRu?=
 =?utf-8?B?RVZENUJzTFlHYmdUMVRRNXBBRHpKQzZETVZocm0vZHgveGRqeUtCOWtIOUJn?=
 =?utf-8?B?b1h6azJySEt2OEdJbVI5bFEyRy91bUpFY2lCMXlvTXlZeFVRd2tuVjdKRkha?=
 =?utf-8?B?MWcwWHlTTUJYaHlzakthcVArcjl5NUl3RzNLZ20rSmdSYlhROU1uNlpQYnJW?=
 =?utf-8?B?TVYvcFJZOExMbUhtazhWOVFzNEdoZktWSWw3YXFScHVwWnB2UHovM2xxV0dx?=
 =?utf-8?B?bzRvTE5wOWZEMjRueTZnT1NRTXBPL21Hd2t2ZEJ2eTJmVU5Gb2ZTdms0L0dy?=
 =?utf-8?B?YkZtUUZTdkxueDVsTXhyWXFrbFRGcUJrcWRyTm04clB2YVZCZ3hndGF2dzR3?=
 =?utf-8?B?ak91WlpIZE1WUVJhb2lmdnlsVStrY2hDK1EvSjJXNzBiRnQxZGJkNm1wMC9n?=
 =?utf-8?B?ZGk2ZC8zekNrMGNJWWZRWFFzajB4Ym0xK1owaDJvY2djRWxIMjJCemJYallY?=
 =?utf-8?B?MmlHbGk0dEdrRW41bkhrczBuazBBL2FMN0xlckRmSkdXNENUTHhXbmRBVkFH?=
 =?utf-8?B?WWdJUUg3aFVUTjZQN0tualI0eFZjR2ZSS1d0WXJDUFdPQXZrWnhta2hFeGIv?=
 =?utf-8?B?aGFJVkNBdHM1ZE0zQlVBeFhSUnNPQVJuakZDSGV1am5LclpSYkFLZVhQQzJy?=
 =?utf-8?B?ZmRpWlZrYWcxVEh6bTZhSTZYRHNKeHhMNW0vSG4yVDAraTRnNXNEYmFPdFh4?=
 =?utf-8?B?ZmZQdlhIYlRmVXBKeTlOVHlPZDNQKzExTzlGTFgrMmJrWVppa1FYY2VBeGFW?=
 =?utf-8?B?dFZHbWUzdmFOTjdhbzQ4MVNhUTVXLzZhSlNBOTBTYzNyejFMUDcrMUNXZmlz?=
 =?utf-8?Q?zad5VgUhrTA0Uz0MBkFMX0cwA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWVacyt0QUptUXhOSWFnNGh0cU9xeG5BV2ZXaGk2T1NYREl6Y2dPcFJCK3JK?=
 =?utf-8?B?N1g2VVFlVExBckpyK0IyNkhSMlpMeHN2Qm8xU0VHTkVnQUlkU0E0VEhhUXds?=
 =?utf-8?B?Z0lzT1FYeExwYnZtanBCemN2b2NqSGIySWlqOHVYQnhTY24vUURLYU1ZYjNu?=
 =?utf-8?B?K3VzbjJtOGtaVTZodkZpNEtVTlE2UGdCcTFpdnB1aTdlUXZhREpMVWZrWWZP?=
 =?utf-8?B?bGhhUHBTSXN3MmhOMGJwVWU1R2tuQzV5VjlrajVkZWZHOXVZRmRzalkvSHhB?=
 =?utf-8?B?dmc2T0ZxRU1xRUh0K0l3SVpmY2dhdTlNc1pGZ2tGK2hJQ1YxalNtK1oxdUp0?=
 =?utf-8?B?YzY3Smt3a05obml4RzdrWDJRZWhqMFFBY0NIN0F1NGdOWjcwVTlmMmcwdWFn?=
 =?utf-8?B?blRDdHlKYWRQWitzNU9rRU5Sem15cGIvUXYxdElFaHlnRHp6RDZyT3BjZjJz?=
 =?utf-8?B?d1NRd2wxeElJQ2IvYnVzaC9naUE0YmFjSjFUUkV1OE1UR2dKN0tTWEtiWDNX?=
 =?utf-8?B?TmswRE5zZmdBU3ZKeDRsaEZJY1BqaXVWZzcwcElmZ1RiVGVqZkJIMWxwV2M3?=
 =?utf-8?B?UnowMGtSbmFlM28xQkJjcmo3K2JNVDVNS0VFUWZwZ0xuNU5MNDJ6THppL1V2?=
 =?utf-8?B?YWR6bUlZc2N4dGEvVlZjMTM2NjljMWlGa1ZIZU1aZUdZVHBxSlhmbzJPZHZS?=
 =?utf-8?B?a1V1QURlcjQ5bXRTQzJWMTJDK3NEQlBwZlNueDNxSWFYRW82L0lFa1Q4TjFu?=
 =?utf-8?B?c1lTaWt2ZHQyNG5iaXBtaTMyT1pqTUF2OFVqdEdwR3FqVm52ZUlkY0FLc3Uz?=
 =?utf-8?B?ZWw5eDVBZVBSNy9xZ0djUEQySGJ2MkpyZ01HQytIckYyZUd3SE5UQm12T0Y0?=
 =?utf-8?B?N0hTMGI1RE1pR0J3M3crWm41by9RTmZBQmNxRHJCUm1HOWdWckp0OFVVbUpE?=
 =?utf-8?B?SWZlWng4VFdabWRYSGU0RW80bENEY1JlaW4za0ZmemJVWGRXajNJMlE3ZVVu?=
 =?utf-8?B?Y2d0Qm9rZkI1UHdiRjR5QXpTYkJVYW9hcy9ZWSthQ3ZEa2IvQ0FUNGpSWVpB?=
 =?utf-8?B?L2xxSjNudlhybU4wbGx0UUlyTG81TS9OcytGaHd4RnBDd1l1U3EydU9ZMGI5?=
 =?utf-8?B?R2NZOS83MGxUTHJTdHJzT2ZPaDdxNERTRWVTcXRSR2xTMzY2b1BFdmlnUlh0?=
 =?utf-8?B?SGx3dnowZ3pUQWx6ak50Uy9qU2ZDemFYUGZSZURmelIzWkl6VHZuRzNZQURD?=
 =?utf-8?B?alQzbDNFdEV6R1N1YlRBKytXaWpIQnRneTNZVVBiUzMveW9mcllLMEFnZzVn?=
 =?utf-8?B?MStsZVl4aGxsbElmZm11TFYxMndoSFlnMmF3OTV2dGlFd1J2dHVPbGNvMVQy?=
 =?utf-8?B?LzIwNFNtazNnd09Ocld1cUFUVkh6QTZUTU0zbzhYOGE4dml3WkFLN2NkcTFX?=
 =?utf-8?B?azZVd29xMlZCazhTOEZRZUVZbWF4Njc4TWpFUWZtNjd0dUJCYXR1ZzZmbTZl?=
 =?utf-8?B?Y1pBaUQ4RkEyQ0RvYlpLZWdVZlZBTDM5VUQyUDVlbTRrVzFIQlFUdHB5UFhX?=
 =?utf-8?B?L1hPcmtNOVQ5VjQxNWJjWGZyRVQzRjZvMVlFSThxeVhLU25wUFZKWUs3bmMw?=
 =?utf-8?B?UHp0cnJNeXFsYU9xLzRaL3FRWGRONkp6dUFlV2RHZ0w3TE9VYnNtWkpxOWpQ?=
 =?utf-8?B?VWorTVNOSHZMYVZ0ZVpYQVk2V08xaDFJdVovZUZoZU92aVB2QS8vNG9IQTZo?=
 =?utf-8?Q?iJ5j4JnlebdjiiJjK7h3F3dyJT0cQfMD8iMhpqu?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edeab0d-22b6-40cf-9b6f-08dd785c50d8
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:20:04.7154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10762
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

The appletbdrm driver is exclusively for Touch Bars on x86 Intel Macs.
The M1 Macs have a separate driver. So, lets avoid compiling it for
other architectures.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/gpu/drm/tiny/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 95c1457d7..d66681d0e 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -3,6 +3,7 @@
 config DRM_APPLETBDRM
 	tristate "DRM support for Apple Touch Bars"
 	depends on DRM && USB && MMU
+	depends on X86 || COMPILE_TEST
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
-- 
2.49.0

