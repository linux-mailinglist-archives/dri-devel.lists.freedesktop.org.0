Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F285B5A88A7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633BE10E4F0;
	Wed, 31 Aug 2022 21:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9505210E3EB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661983071; x=1693519071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E+dBs7Os0eBUZmFKrzgVpGNf3I+JCdvOgT9quBKcN/4=;
 b=a8XIyNn0dVhd54+izLRrLuqCup4G2ATbRkX6iSFQQZbOhdj/SZzKHtCS
 0kjU49jQ5y0S9/cnLQI9RM1X1hWJ6SyfwwhYKdSzMLb9Lz0SZuY3YIZIB
 mk98zDVuAeRZFoipWirfc6gcdEsTx9UAJ0HCTjOJSnPA5N2pvu+OwE9lW
 99nSsci22TDCOba3UzguqAyZLiiOiOv1nrfIUgrAZg8wCCwVli71JSTKx
 SIjFTQ2CRrkCjNgTmPbN2xGEfYSptST8ORIFgeR8VhdDS6DQbKzEy0P39
 zbnyHcXDfSr7FVVodcCH6BaGHJNBlRhpvLbmriYqwesA2j5a7zPi0ucL3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296834424"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="296834424"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="612244974"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2022 14:57:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 14:57:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 31 Aug 2022 14:57:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 31 Aug 2022 14:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xf/zDZeS/UEW6KTxD7KTzAUJ6bqoLfp388wLu7qPChgb/dqsLKuNZWJsAHxQL8Nyup1Zu0B1+0FcbFIQDpRDj6ifAYuo9tmN8aUEJ0k0tEelbd8D458kOa3TY1H3u50Yb8Yy2rwyC/Vqvw79D4OUIg4YQ5woCfQnp4zMmwM0S98rduBhJmE01aN2D4bHtCDj8UQB7R6wBmi49q4qxAaL9+ANp/SpRw3eeUikhb4bNWxKiDYSe+WlMS0tOsRQRSAy6HD1n6X+C8SlvK4/mE0/IaXP5gZf0c67iOg6X6JPzdYtUaD6JlZHu0A+rrZzO7X1Ewga8oMOIar/pPdOMcn6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbPZ1DblDnR4lKACAMonxasiGtyPm8q4iwR//nqOhBQ=;
 b=ZNB+L94XhfQ1SaeEPKO2MuHuXfg+8zacHTmpsv39eAyoiJgv+7lmzMioWSIVzcDAMhIlqAxL0i9FBEnfMe5hMJ7d5ey39UpBYs1eaFo3xydLlklB2gYmD5F0G8gvv5lDEJRfh6m3fTAq8uLv8YOTUhc8jo2JDIl3Hx1Y9GyQJbWZUcEbyZL/ECJVhfLHIsx4QK1grScPJH7d2UU6hG47h7NBkDcSKGoFfHTnqan8xqbMTZvfXKk2g2cdnWgHyVvowSvR2+k+nKd41ulY0VsINNpTQJIEV0gMxwRiDGn6/RutZPXqFdrfMuZxVClWnOCAorGnZEs3nDlAW0CYpmabMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.21; Wed, 31 Aug 2022 21:57:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 21:57:42 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/format: Split into more granular test cases
Date: Wed, 31 Aug 2022 23:56:08 +0200
Message-ID: <20220831215608.349269-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220831215608.349269-1-michal.winiarski@intel.com>
References: <20220831215608.349269-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0ccc402-b0cf-4f1b-fc38-08da8b9bd43d
X-MS-TrafficTypeDiagnostic: DS0PR11MB6349:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1mbGGMthCr2bcghvImSr1PSgtFouxsYDExzzKcLsf2PVnk2Rk6L2DDL65WbpNZx5nmrNpBPNrUh7U3lfWpP3vqP9KfgYHZwX0C1k+Mi2YrFdXjYs3dizRNyKeYRmOQjeTyEV32mQpWhshdTR+6xAF0ZcQTycfCwL0Y1ymggRqxfr4tHw7dG/nohZuoYzrrbFU3Ve9HLzKLelQcN0hgXmMa/m+4gQlglQt5DSMTffuvgQk0VZRgDYBRRQBfOHqar6WgkBBCI95vD537NaZazQkfs8zf3sT6m73JnC+RfgLpsI/KwlRweyalnKKmo2BcOFKCq2VvFoznbff0cbn/XMEFCMwjaDZAfHP8qaW4hqEG1WvrqselZracO3GbX5BdrehqrBz38vV3g5zMkEUYU5H5p/7Cs65BaPzk9Md0pLLZIuPD1txlRHcEDjO0XqvF+2hLjQcimHVjRr9XdAS/V7cVVFB2VDWXpf4PSf+JTgkvSOcvzgxhTiLaT0fkIcnZ5mMQJ8NBeRsRFxSySFok/VGooRbrAQagXuLhGf2FP5hmxhoC6drcyc0TC0MJQvA1BFFr3N0qVOnA0QWSAIUkECRMXgpeW6tiu2uZtmPoHbzL/wrM4JWb8sbfYatQ71RWxpUW8q/bh/wG6Q+N0rYvQldlgA7SxfAqRI6oardi/EXyFlMkzoizJ+kfOtaS44Fuw4I2F5pjQsrrJA+M9ISEYKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(366004)(39860400002)(136003)(5660300002)(66476007)(66556008)(66946007)(107886003)(478600001)(30864003)(8676002)(4326008)(6506007)(8936002)(6666004)(41300700001)(83380400001)(6486002)(86362001)(1076003)(82960400001)(186003)(6512007)(2616005)(26005)(38100700002)(316002)(6916009)(36756003)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VjQTg4cnBzeTU5ZEZNcUVwWDVEcEIxb0lBdE5zbUd0djFkS0xLNnRuT2l4?=
 =?utf-8?B?ck5ORzB0RmtuSllXQ1RyNjVxNTMzNEQ2aHRLVVQveHZaUFQvR2NLLzdzMkhY?=
 =?utf-8?B?SEhSOEo0KzdHMm83ZVBySUQzaVJISTdsU3IxMFozVElXUUtOdERGYW5zWWxa?=
 =?utf-8?B?b253Z25CaEJ5YmI5aENHZmpsSFc2cjlueTluUEh1SmVMRDVtRkM2d1lreS9m?=
 =?utf-8?B?KzNZUUlIRm0rNEIrUFdCOU5RcGFHdlU5Rnl1bXM5ME81UHRSY2dVRGtMUjBN?=
 =?utf-8?B?MzNPcXFmS2ZwRDJZRXZueDFFWlNOcnE5eUJja1NhNnErOEVzMEhMY25INnRI?=
 =?utf-8?B?V1pPU2ttbnVmYXQzcVhDYkJvT0JpL3NVaXhuZnNkK0l1RnRiODNiN3lXbThW?=
 =?utf-8?B?c083UzVOYWRJdklGbkZ4S2JKRFF1NitjZ2s4eW55WVdwOXlXYStwUkg3c2Nt?=
 =?utf-8?B?cnpUSDZhQUNIWEcrcW5zWXZBOEwzVmJ4Q1hyY2ZQNHZIWXhoVm1BSmdMOXFQ?=
 =?utf-8?B?cXpHNk5uVzJaQnFGRktuVk0zdzNPQ1YvVHJUNWNHa0tzSkJxMTludUNwaDZ6?=
 =?utf-8?B?czZwQWhWcmMzTUJmdlR1Nk83MEttcDNsUndPU2g2aUxkdW9BcTBDZi8zT2JX?=
 =?utf-8?B?djlkdnU5Nmt0ZkF1UmpyckJFb2txazJQejVlT0JFdFpDRG1VeXA4aUZhQ2FI?=
 =?utf-8?B?WGdmc2FLYlBRckl3UUFGNlJOVnd4emdJeXNDK1IwR2xSaVg5TmhZSVVISS9R?=
 =?utf-8?B?UDE3R1hwTEl2U3ZhUU0zUWpNdGlBbTkvT09JQnVtSVg3Z0kyMU5ZZjJINFgw?=
 =?utf-8?B?UWtzdWI3NWVFNElReWx4dkRwRW1NSTQwY2RTL0pCQzlTMklzTEx4M2FzeGlU?=
 =?utf-8?B?K1I0VWpzQzZtVkt1ZWRMa1lnZXBOazduMHBBMVVKTTIwc2M3VG1XeHZFdUJl?=
 =?utf-8?B?cjZOU2wzTFJzMEVIT3hxaWk0TnRXbTlTMnJFYWY2R3AzMEdQV29PdXR2K3h0?=
 =?utf-8?B?MDI3cm9ldi9tUG9vQ3hROXZMVnJIeC9aa3ZJMXVvSW56cFdCK1o5NFBXaE53?=
 =?utf-8?B?VVFnMEVPbTlyQ0E1YUdNV25uRTFDNVdHeVp2TlFKd1N1dk9BWktLclJHaHFo?=
 =?utf-8?B?UFJxd2haaWE5WDBTbGpta2FjWlhndUZZenRFUllYSUlXS1ZWU2hFOEdVN2RE?=
 =?utf-8?B?cjhXSUtvdnFOS3BoYTQvSVBZQUl0ajJ1V3l6MmNFNTFaZGhTVmFCbkxjN0dP?=
 =?utf-8?B?Zmw5L1ZJaExPcG1YdTdrVnJTVzdycVVyWlg4STJnQlZTL05JVUxGZlVaMEhH?=
 =?utf-8?B?OW9FWDFnQTdDcFc3WmlZSWpGNkM2ak54RzN0SzhKQmFzeHhqZE14ZFdneVdT?=
 =?utf-8?B?QjNNVTFjVStuOWRSd0VGSGZIZlRubTM2blE5TTBISFRqTGdHVlN2NjJWSlVC?=
 =?utf-8?B?N2ROd3UxNS9kS0VteDVlcU02bE9xQXZEYmRsOGdNYXV1Q0N6Q0NUVkpTOW9E?=
 =?utf-8?B?RE9lRE1PNnZ2R3ZqaldRZVhnTzBBaWNHaEoxc1dLSUhsV1dRVlltVk5BU3h5?=
 =?utf-8?B?LzBnMnluVHY5ZDRkTGNnTnZKdmg3V3UxcjQ0YjR3ZDN1UUg0UFNxME5QeVdu?=
 =?utf-8?B?bDcrY0ptNHVwUytyajh4Zmthdm5SdTV0Wm5USFNlclgwQlhVUmpZdlgzMkpG?=
 =?utf-8?B?aGFYRTNhNmpwRnVIMXZvNGhNMGVKempGNnBEN3MrU2ZFcS8zLzd0dDNZR1JV?=
 =?utf-8?B?WFZueGZUcHljemE2eDBiN1hNcXMwNXpmOGFjV213K205TVd5aENmeTEvN2dQ?=
 =?utf-8?B?MktLSlJmaW5hTnV5Q3lwSU5Ya2pIcnFxenZiZnlOM1dCYm9IL1plcDVuS3lx?=
 =?utf-8?B?QnVYMnJTLzZDRFJaeFkrbzVTQmJ4SlV5MU52Z2N2RC9Qck9LL0Y0Umw1RnlK?=
 =?utf-8?B?cnRWdHFhaHo5Y0thbHZYNW9icGdjbFhDT2hvYTBCZEs2ZlJCVXFrYUR3bnYv?=
 =?utf-8?B?T2N6bVd5eHRKSkRzYzZ6aHdha0R2RGhPKy94enNTN3ZLdjQ1VVE2TUZNZXQx?=
 =?utf-8?B?aXJBc0pJYVFobXhTSUwzZmo1NU9vd05zNkZtbmlWdE1BTnA0ejBWMXFTeGRP?=
 =?utf-8?B?ZEdyTGdoeGozNkJMODBzdUdadVh0RXJYRFJEVjhwcm85cjlMWVNvQllxd1Za?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ccc402-b0cf-4f1b-fc38-08da8b9bd43d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 21:57:42.5414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8I0XkUrTuOqVOeEe4GNY7Ec/h9IjpqhnH+SUOttaZOOKHJULYwdV2Rf2jEmyV3Ek4q1L5K0xoEHWJtHgifF0olj0aY7lBfVeFQXxj0pL7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
X-OriginatorOrg: intel.com
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>, Javier
 Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we have multiple test cases, most of them check multiple
conditions, calling the function that is tested multiple times with
different arguments (with comments that indicate test case boundary).
This usually means that it can be easily converted into multiple test
cases.

Passing output:
============================================================
================= drm_format (18 subtests) =================
[PASSED] drm_format_block_width_invalid
[PASSED] drm_format_block_width_one_plane
[PASSED] drm_format_block_width_two_plane
[PASSED] drm_format_block_width_three_plane
[PASSED] drm_format_block_width_tiled
[PASSED] drm_format_block_height_invalid
[PASSED] drm_format_block_height_one_plane
[PASSED] drm_format_block_height_two_plane
[PASSED] drm_format_block_height_three_plane
[PASSED] drm_format_block_height_tiled
[PASSED] drm_format_min_pitch_invalid
[PASSED] drm_format_min_pitch_one_plane_8bpp
[PASSED] drm_format_min_pitch_one_plane_16bpp
[PASSED] drm_format_min_pitch_one_plane_24bpp
[PASSED] drm_format_min_pitch_one_plane_32bpp
[PASSED] drm_format_min_pitch_two_plane
[PASSED] drm_format_min_pitch_three_plane_8bpp
[PASSED] drm_format_min_pitch_tiled
=================== [PASSED] drm_format ====================
============================================================
Testing complete. Ran 18 tests: passed: 18

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_format_test.c | 156 ++++++++++++++++--------
 1 file changed, 108 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_test.c b/drivers/gpu/drm/tests/drm_format_test.c
index 0efa88bf56a9..1936d2d59908 100644
--- a/drivers/gpu/drm/tests/drm_format_test.c
+++ b/drivers/gpu/drm/tests/drm_format_test.c
@@ -9,100 +9,133 @@
 
 #include <drm/drm_fourcc.h>
 
-static void igt_check_drm_format_block_width(struct kunit *test)
+static void drm_format_block_width_invalid(struct kunit *test)
 {
 	const struct drm_format_info *info = NULL;
 
-	/* Test invalid arguments */
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
+}
+
+static void drm_format_block_width_one_plane(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
 
-	/* Test 1 plane format */
-	info = drm_format_info(DRM_FORMAT_XRGB4444);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
+}
+
+static void drm_format_block_width_two_plane(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
 
-	/* Test 2 planes format */
-	info = drm_format_info(DRM_FORMAT_NV12);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
+}
+
+static void drm_format_block_width_three_plane(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
 
-	/* Test 3 planes format */
-	info = drm_format_info(DRM_FORMAT_YUV422);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 3), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
+}
+
+static void drm_format_block_width_tiled(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L0);
 
-	/* Test a tiled format */
-	info = drm_format_info(DRM_FORMAT_X0L0);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 2);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
 }
 
-static void igt_check_drm_format_block_height(struct kunit *test)
+static void drm_format_block_height_invalid(struct kunit *test)
 {
 	const struct drm_format_info *info = NULL;
 
-	/* Test invalid arguments */
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
+}
+
+static void drm_format_block_height_one_plane(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
 
-	/* Test 1 plane format */
-	info = drm_format_info(DRM_FORMAT_XRGB4444);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
+}
+
+static void drm_format_block_height_two_plane(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
 
-	/* Test 2 planes format */
-	info = drm_format_info(DRM_FORMAT_NV12);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
+}
+
+static void drm_format_block_height_three_plane(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
 
-	/* Test 3 planes format */
-	info = drm_format_info(DRM_FORMAT_YUV422);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 1);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 3), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
+}
+
+static void drm_format_block_height_tiled(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L0);
 
-	/* Test a tiled format */
-	info = drm_format_info(DRM_FORMAT_X0L0);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 2);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
 }
 
-static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
+static void drm_format_min_pitch_invalid(struct kunit *test)
 {
 	const struct drm_format_info *info = NULL;
 
-	/* Test invalid arguments */
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
+}
+
+static void drm_format_min_pitch_one_plane_8bpp(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_RGB332);
 
-	/* Test 1 plane 8 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_RGB332);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
@@ -118,10 +151,14 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 			(uint64_t)UINT_MAX);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
 			(uint64_t)(UINT_MAX - 1));
+}
+
+static void drm_format_min_pitch_one_plane_16bpp(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
 
-	/* Test 1 plane 16 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_XRGB4444);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
@@ -137,10 +174,14 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 			(uint64_t)UINT_MAX * 2);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
 			(uint64_t)(UINT_MAX - 1) * 2);
+}
+
+static void drm_format_min_pitch_one_plane_24bpp(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_RGB888);
 
-	/* Test 1 plane 24 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_RGB888);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
@@ -154,12 +195,16 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2013);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
 			(uint64_t)UINT_MAX * 3);
-	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
 			(uint64_t)(UINT_MAX - 1) * 3);
+}
+
+static void drm_format_min_pitch_one_plane_32bpp(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_ABGR8888);
 
-	/* Test 1 plane 32 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_ABGR8888);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
@@ -173,17 +218,16 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2684);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
 			(uint64_t)UINT_MAX * 4);
-	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
+	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
 			(uint64_t)(UINT_MAX - 1) * 4);
 }
 
-static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
+static void drm_format_min_pitch_two_plane(struct kunit *test)
 {
-	const struct drm_format_info *info = NULL;
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
 
-	/* Test 2 planes format */
-	info = drm_format_info(DRM_FORMAT_NV12);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
@@ -211,10 +255,14 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
 			(uint64_t)(UINT_MAX - 1));
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) /  2),
 			(uint64_t)(UINT_MAX - 1));
+}
+
+static void drm_format_min_pitch_three_plane_8bpp(struct kunit *test)
+{
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
 
-	/* Test 3 planes 8 bits per pixel format */
-	info = drm_format_info(DRM_FORMAT_YUV422);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 0), 0);
@@ -256,13 +304,12 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
 			(uint64_t)(UINT_MAX - 1) / 2);
 }
 
-static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit *test)
+static void drm_format_min_pitch_tiled(struct kunit *test)
 {
-	const struct drm_format_info *info = NULL;
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L2);
 
-	/* Test tiled format */
-	info = drm_format_info(DRM_FORMAT_X0L2);
 	KUNIT_ASSERT_NOT_NULL(test, info);
+
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
 	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
@@ -281,12 +328,25 @@ static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit *test)
 }
 
 static struct kunit_case drm_format_tests[] = {
-	KUNIT_CASE(igt_check_drm_format_block_width),
-	KUNIT_CASE(igt_check_drm_format_block_height),
-	KUNIT_CASE(igt_check_drm_format_min_pitch_for_single_plane),
-	KUNIT_CASE(igt_check_drm_format_min_pitch_for_multi_planar),
-	KUNIT_CASE(igt_check_drm_format_min_pitch_for_tiled_format),
-	{ }
+	KUNIT_CASE(drm_format_block_width_invalid),
+	KUNIT_CASE(drm_format_block_width_one_plane),
+	KUNIT_CASE(drm_format_block_width_two_plane),
+	KUNIT_CASE(drm_format_block_width_three_plane),
+	KUNIT_CASE(drm_format_block_width_tiled),
+	KUNIT_CASE(drm_format_block_height_invalid),
+	KUNIT_CASE(drm_format_block_height_one_plane),
+	KUNIT_CASE(drm_format_block_height_two_plane),
+	KUNIT_CASE(drm_format_block_height_three_plane),
+	KUNIT_CASE(drm_format_block_height_tiled),
+	KUNIT_CASE(drm_format_min_pitch_invalid),
+	KUNIT_CASE(drm_format_min_pitch_one_plane_8bpp),
+	KUNIT_CASE(drm_format_min_pitch_one_plane_16bpp),
+	KUNIT_CASE(drm_format_min_pitch_one_plane_24bpp),
+	KUNIT_CASE(drm_format_min_pitch_one_plane_32bpp),
+	KUNIT_CASE(drm_format_min_pitch_two_plane),
+	KUNIT_CASE(drm_format_min_pitch_three_plane_8bpp),
+	KUNIT_CASE(drm_format_min_pitch_tiled),
+	{}
 };
 
 static struct kunit_suite drm_format_test_suite = {
-- 
2.37.3

