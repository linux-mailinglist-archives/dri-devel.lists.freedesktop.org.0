Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C3C73A97
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 12:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0140A10E73D;
	Thu, 20 Nov 2025 11:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="GJWqwJ4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazolkn19013085.outbound.protection.outlook.com
 [52.103.7.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385C410E6D0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sm8M+PIOzw9kd8GU7By6boZD/ziUkgixQ7QK784isQLrv+Rbm9VCLBkeyG8yQvLgyfcy0oFW8oLblpYfHqVyLTQv55/TJEIUpOC/4ov3qzqLV+gtQIw4fw2l7QwrDGUBCK8QpE7NpQrNDLXxQm5HrasQ3sk1L2bgRx5mkXFaBBy6S+8y/f31dLVrNazlSUYAtUlonHRQCS6uVaA2DGkK+kXZ4K2DucYf0FbFfemSRo+/tXH5OdJfyYAQ864IeJrsIXoqyM/S3sESFhm8pPCVbjfJLoypCG/Vg1uK3l+Tqzv0fBzIgfifq+rH5HE8mvrv6tPCNXtvpv8qZcvqurEL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QLP/fPNIS+f01x36qB9vsGfbpeFGOF1IA3wGGjGWyQ=;
 b=hsjiEJogtKbaiA/XNYiB+v+FY7MH5eOawudNvWvR63vNTXvai0J+14mcjK8oLq3uo2NO1EarC4YwyKKL+plkcuD99HZZs1/liO946OBXm64Eiq92i6nYKNR+ailfZ0lr7ZxbYf+KXFvVnplJerA3MjYy9oizVjGqjoNOF/fEWe1BJqDNhE/IlPsMHA58E1yC7S5PZA8qsEXVUVbfIesGNHcQCyNWCoVK0wq+dCgBvKgPePnbBBLo6TZpyz/AYhq+EoA/rGkeGZupNHL1kSK97KCw7XGEV/327jgKxshQQdkdoIF1FPCrTFHQYR1OXltv1CH4SBZOZ/tY+ZIpVRgKKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QLP/fPNIS+f01x36qB9vsGfbpeFGOF1IA3wGGjGWyQ=;
 b=GJWqwJ4JYZnT9uPhq6L1OhygJZeB6iCNIosPGiMDwFxQDDKQdgymOoW6UBt403iZagOiJzT1VNMiRn2DRMZfDhAYDcsKTEAuEoJE25YOkRhSn1pPq68Rf/24pVJujfEyAo4hXeFiK54Gf41hTrbuwDxGSNFI3YxrX+erl91ibyoV0ufTcsI5lRxHKwx7EcULcNOytepihoA6alqeWBXeWuF5JCLdXU68E1jaQn76Kdu3pyx7PK8A4udJHIqDHwwpOIV1GCmMs7/QOouj8CTeQmRLrkYgEshliLefw/vpZhUmSB5crNFjMjyU6pcPkn0CkqSLm9VVubxyBumWuhroGQ==
Received: from PH3PPFAB08B9FD3.namprd19.prod.outlook.com
 (2603:10b6:518:1::c43) by MW4PR19MB5653.namprd19.prod.outlook.com
 (2603:10b6:303:16b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 20 Nov
 2025 02:25:06 +0000
Received: from PH3PPFAB08B9FD3.namprd19.prod.outlook.com
 ([fe80::7a3a:4c04:a3cb:1102]) by PH3PPFAB08B9FD3.namprd19.prod.outlook.com
 ([fe80::7a3a:4c04:a3cb:1102%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 02:25:05 +0000
Message-ID: <PH3PPFAB08B9FD3DE70CD833C0C470243EE99D4A@PH3PPFAB08B9FD3.namprd19.prod.outlook.com>
Date: Wed, 19 Nov 2025 21:25:02 -0500
User-Agent: Mozilla Thunderbird
From: Matt Smith <matthew.j.smith2@outlook.com>
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: osd-osd101t2587-53ts: migrate to
 mipi_dsi_turn_on_peripheral_multi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0057.namprd20.prod.outlook.com
 (2603:10b6:208:235::26) To PH3PPFAB08B9FD3.namprd19.prod.outlook.com
 (2603:10b6:518:1::c43)
X-Microsoft-Original-Message-ID: <e98c265c-7d02-4b2a-89b2-75b5ea428941@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFAB08B9FD3:EE_|MW4PR19MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 0490011e-0143-4bf8-528b-08de27dc0430
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUhM6k1QWx02acDuEqXpbI5H9tct2aeGhqEmlQbgdzZiO6ahHom8EawD+/2t0Z3QUGcm9ehXobjLkDSDHNC1cNWy2/K/nVfDQIQfHa41ElC6OQL7sIJfL5AiI+4VI+zH//PpPhycFiKu/C/z1Nj83kbjhqAgqOUzMhZu8vOGtI96EdCcX8w0i4+maHj9K8fqN4V6I/aIi2U1TMzmRhlWduUaMJ9nch4fn5GYGsMaFyf9ye+P01+Q/xsT9hTuKuaCGAWOJOblNI9yeBIMkWsD90OYpYcasPrNsjCw99jhvE5q9Be/QCwB+EEtGHCpLbKEKIY3HTr3CDhWkJMTheO8MDc3mUMf9u8bArTbVkI1K+OcsZS7ZjAAEWT3d0e+dkV+z+jvzq17gR+piGni1hfZ/seeMN6ar/f6bUJeZWiIpLFblcfhBIzO8mAquHBO5hohIkxKqAhRqb6/Cc5His7Kd+wwB6mDs3P2EiNPhk40J6l4693FIsIMvKaLllJyJstb/biFh1ElSR0RCl0W9V2zLR/OOTnHRPmiP94jfHG1lw+CevIKWC4kcDYkUSQuv6tLbppy4vy8FEeVUQnjWeXygpHfK5hMmN6NXqnZa/6lIk/e4zCNAoNl9q1JOBtmbos2AOEoIG7lNiV1p3a4zW+vv5T447yTECOhZA4XgYMoV8FonxpWXX9lJCy6ZH942zPKROCXQX6sK9Y1A4xlMbjjKOhh0bBNIEL77wukETv8UZgxJHQNpIn2dhFK4B1bPQSy+A=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799012|5072599009|6090799003|8060799015|23021999003|41001999006|39105399006|19110799012|461199028|5062599005|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTl1RzAxMGxvSUIrOGtpRnVCMGk3WTdQNmRpdWppL1A4M05jNEpzNUZKQkE5?=
 =?utf-8?B?cndLMXBmcG5VcXY4OTVyY2l0dVVUSzRBYmx0NTJpeUJ3RThaN0p5NW9oRkE2?=
 =?utf-8?B?czdpZWwzNUtKZkRQUUwvMkMyL3d5V0E0aHRRYWdCVVdTTVQyenI5U0F5ck1h?=
 =?utf-8?B?LzB0and4QUtzRzZ1YlNSakw5cmxLVTVwdFNtS2VPQlF1cWtQMCsvZ3ZXWVJY?=
 =?utf-8?B?UVdhNE5VdW8zbHM4OFRuaUt6WnRGS2hJNzJHcjhIYUFmbjNxMmRBR3h3NFl5?=
 =?utf-8?B?dlhlbGp0bWlkOWJFTUIxcVh0UThibVJEWUVhT0pnY2I2N3JHaEdPcXk0eTRL?=
 =?utf-8?B?d2UzRzZBVktRakVQem1oMXZxOVh6dkdLalgrS0RyUjRnNDllVS9wbHU5aVlR?=
 =?utf-8?B?KzJGbjJkRjBVaEFudklQZ1BMRGt6ZlR2R29rZUVtWVhHa2V0NXBhaXRaa2Rl?=
 =?utf-8?B?bTdkMTd4N0laZU9vRDZXVnphd2FQczZJdnVsQ2Zuc0JuWklFQ0txVWxvdGxh?=
 =?utf-8?B?Vmx1OTdWYW10bzNnMkpUZ2piTitXNGpkV1RvMnUzRHdYd2JhN0VQcUNhbk96?=
 =?utf-8?B?UGw4bXllb2VWR3BCZE03dkFuZ2dGYmpDVmV0QTdnTWZ5TWIvOU0yRHpJbHRU?=
 =?utf-8?B?T3dtRS83M3lzVnRodzFwQStFU3pjV3QzR1JsN1N3VzR2YjkvMjhFdDQvcDJM?=
 =?utf-8?B?NklTTUNkTTdXTzh6THVlS29NTWZrSGIyejhBck5VeHBtZHZoK1RmU3cySEFK?=
 =?utf-8?B?YkFnVjZHZ0VDdldiemVvMkFYcHI5K3hjZzdEaWpJM3R2Rllja3JXUEUxSjhM?=
 =?utf-8?B?cVcwa3h4eVZrUXRCSUVJSmNFdlpKemdsZlNBcksvTlIwSDY4VkxNclpOdkw5?=
 =?utf-8?B?dmJ0NTc4a3BIaCs1U1NGVHlIbTBQRm9uU2p3ZkRFRFJERnk2aXBaQklsdnZK?=
 =?utf-8?B?U1BwT0pBVmVLaEI4NmpDWmJpUnRMYUxDOW5PZm43N1FjdE81ZFdLMXFTQ2Jw?=
 =?utf-8?B?WklIMEY0a0QwMzk0KzNXWHUzK0srS2cxTU1Dc0JabmJnOFA0Z05pNFg1MWZs?=
 =?utf-8?B?akxnWmF2elVTL1M2MEhYcklHakxCOTNONHp0OEVIamJybkFoOXdmNU1mQm9t?=
 =?utf-8?B?UFNkWUZUcXdxTHlONWs0OXViNkRiYmpsSmlhU1pqSEVLczFUNy9Bc1FqaWRz?=
 =?utf-8?B?QXI2c3FKYll6bnRrSFE4V05sWjZzVDJYak1zUlh3TytYditvejVrb3AzN1hH?=
 =?utf-8?B?NlMxejNqL1NyYytxM2g2cFpORVZlYWJxUWFIZmxFY05YdVRwbW9aOHAyZEhy?=
 =?utf-8?B?MUdMVTJvdHNhTWJwc3lxa0FNOFVtdmVxNVd2bC9ianFTSEhOTTNqQjliRGhy?=
 =?utf-8?B?ZlVsZTUycjcwS0lWbkZONmQ0T1FzTzBjdVFOKytEcEVES3poRG5RNXVJeG85?=
 =?utf-8?B?K0pxdFdCUHVSRFBZeGJ1VktIbFY1RnpjUVpTeDhMYTZETFdRaFovaHg0SGtz?=
 =?utf-8?B?UFB6ekdSK2hGM21OSi9TWUhycTVXeXZ2cnJlaXI1anpLMUIweVROWTkwdmow?=
 =?utf-8?B?aTJvL3NTMUdUdVRwK2YxZXZYcEJFeWkzR3Z4eTVSZ08xU2dGVFpPYk9xTUw4?=
 =?utf-8?B?K256UWlIQ2NWcjlHQU0yOGJFQkdmTEtuVFJkME5TY1R0WEI4SGIxRkk0R0lZ?=
 =?utf-8?B?T3BBdTJrNUhvMXZOVXB1N2FjQTZCWlZDL0Vod01Jc0RVZXh4dXhNaW9BPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2RBMHRZdG9hR0daWGdXK1RIenpsRUxpWTJVZG5sL3VOdlF5S1BrK1BHM2I1?=
 =?utf-8?B?N3hFK1pkNWxvdWEzOVNnQTRUUEhhdmFIQVRRWmVsNDJqZnh6YVBPOXgwTElu?=
 =?utf-8?B?aXlYbWtFQTJmMC9SWHY2TG1DM2liMU05QjFpNjVCSVBSOTZjQzdtbnpLUkJI?=
 =?utf-8?B?alQ3R2V3ZktrUktvMXNteWFIdVFnZ2VyUzFKbmZYU082dlVtVzZwbEZ3aWE1?=
 =?utf-8?B?dXJWS0ZxMWpkVWg5T3hQYUhMMWlyb1dRaTFNRm1OOElhcUlJdWoySjdRVi9j?=
 =?utf-8?B?b1preHJwVUJNeWxKYllsL04zdXlnd1Q5UmpPSnJtZURnTE1OMU9UTkdhMTVk?=
 =?utf-8?B?WUZWejJ4L21JclVpOTZrRmE0UEt2NmtmbCtlOUNhUmdlcUZXM2VuekJoWEtz?=
 =?utf-8?B?aWp6THBBejIvZlJXc3pBZ01zQkkramRDUUUrZnVMTXdZRU5CK1h6b0Vwd1hq?=
 =?utf-8?B?bEhrREZGRGxWS3ZNV1RlWE9DSXdhb2dBenR3Ym9XT2JTYkFzcHo5cUJzSHF0?=
 =?utf-8?B?cVV3Wnl1UGdzdTdNbFZJT3daSzAvTnMyb013Y2tnRW90YlN6K0NXazFpWloy?=
 =?utf-8?B?ditiUlFyS3RvVlIyelR4eHI4dHo4Um95a3FxZmp6NXpXNHNaY0dsSFJJK0xY?=
 =?utf-8?B?dWZ0Snc3ZkZXaTltQjR5TkF0MFYxU29BTG1Nem5PRG9UZ09pQlNYVUhoOUc0?=
 =?utf-8?B?bHVpUTJGbm9JZFY3SVhhaTBDTGdGdHZSdnVDQkUvT0RCRlpPcExXRjJlZG4z?=
 =?utf-8?B?Y2FrNVQvNVB6Y0twdTh2TFR4aUNhdytUM1c4c1NqZGtDZ1IvdHJIL0Y4TXZF?=
 =?utf-8?B?QzA5S3JwSytCQ2RxampxWjZGSUxMclFZVzkxK3BydGtFWXJmeSsyUytVci9z?=
 =?utf-8?B?c3I0Q3JnWGJJLzAvUWJPZnZqN2IzdW1Ib0lRSEhyb2xIT1lueXg1M3ZVcnBz?=
 =?utf-8?B?OFRnaXI2eDBhTUYrbHY5TWRYZnN1L0dKdDhzMFBVM25BNHhQRzlnZTUva1Mv?=
 =?utf-8?B?OS9RN2hXc2FXeG1MdWk0dmJUT1FXSDJyTkowazBtTGUyUWZMa1BnaG04Z2s5?=
 =?utf-8?B?bUt1bFNsdFhyTlU0VHJqQms2VmI3RUtnaitzWHlVTGhEaTBhNW1QWVVrbXoz?=
 =?utf-8?B?cG9PcTFVcVQ0K2hHenZWSnRSQ1VlRGxRZ0ZrblI0V2Nmb1IvZTQvNVdzMjMy?=
 =?utf-8?B?ZHdsUFIvZ0lnOHAvS1BEeTVYTExKNkc2bVd2enZtdkJzd2dOWXlHd2ErcTdC?=
 =?utf-8?B?TFVIbWE2V01vZE9yc2V5eVdLSE8vUEhrTjF3ZTQ2anRWWnVwQkRHSWtaUEEz?=
 =?utf-8?B?aFZHM1kzeFJ3TTJ6SzV2ajdacVBJTjhwSlJtOWpKZ2ZIWGIxbnpCRk42Z0tq?=
 =?utf-8?B?VDQzMWxEZm1EZEVzcStDY0JHalBjY0xzUTlIWlpPc2F1M29xRWdIVEx5bFFs?=
 =?utf-8?B?SXZSSVJ5bHg4eDVMVWZkMXJpa3Vlb2kyQWJiZ1RsT2ZXRURTR3BwU2JGQS9H?=
 =?utf-8?B?Y0FpMjViYWhJZ05BVllHYi8zMTZwWnJ2NUlPMjFCVUxlVm4yK09pMU5VU1NY?=
 =?utf-8?B?QUE5N05nZEtwRCs4YXo2Sjc0NWUrc0daaFJybVNsL21FOGtCaVg1SE1jTXlR?=
 =?utf-8?B?eGsvZGtWa0pDQ1RJbkcyNXNzdS91R041WEZMRDJKQnFKU3RLREYxUm0yaDkv?=
 =?utf-8?Q?iaAjyPep0hoyIM6xDuHi?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0490011e-0143-4bf8-528b-08de27dc0430
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFAB08B9FD3.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 02:25:05.3914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5653
X-Mailman-Approved-At: Thu, 20 Nov 2025 11:17:36 +0000
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

Documentation/gpu/todo.rst lists to transition away from using
deprecated methods in drm_mipi_dsi.c, so migrating from
mipi_dsi_turn_on_peripheral to mipi_dsi_turn_on_peripheral_multi.

Used commit e139c0eb22ce ("drm/panel: mantix-mlaf057we51: transition
to mipi_dsi wrapped functions") as a reference.

Signed-off-by: Matt Smith <matthew.j.smith2@outlook.com>
---
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 2334b77f348c..45baf2c238d2 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -58,13 +58,14 @@ static int osd101t2587_panel_prepare(struct drm_panel *panel)
 static int osd101t2587_panel_enable(struct drm_panel *panel)
 {
        struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
-       int ret;

-       ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
-       if (ret)
-               return ret;
+       struct mipi_dsi_multi_context dsi_ctx = {
+               .dsi = osd101t2587->dsi
+       };

-       return ret;
+       mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
+
+       return dsi_ctx.accum_err;
 }

 static const struct drm_display_mode default_mode_osd101t2587 = {
--
2.49.0

