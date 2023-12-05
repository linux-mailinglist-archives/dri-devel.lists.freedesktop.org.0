Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410598043F4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 02:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0897610E45C;
	Tue,  5 Dec 2023 01:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AB210E459;
 Tue,  5 Dec 2023 01:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701739369; x=1733275369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fjOvoKoE7FoYZU8Y5WeV6FhrhaR4HqmgoZB73ZCk9u0=;
 b=EgIKtLAKZriE4axa4A0aPNuZO7YirsUGmzPAzwO4iLiqraEgh5ps1yaT
 d+J/y62qTLuHKHI8LadRD7nbiYywvaI4+Vy2e9f/KDImriSFgELyuWaNZ
 2jrWUIIs0AuX8mGQJc45hiXii+L55Pc/zxxak2gdShCKOg5ehCKdTV7af
 av69knq0oulZikVvqKYkYzzbQ6t7YQXSq5TASkDFocUa1hayleR+rF7Ab
 vIDsJzDKDk4EaCeFCg3KioVk+afXLVXeYj/9bf3qH8FUJhhJ4HYD2QlFv
 hPbCqXPyFum9Oa+vhCq3T5YyE0kSlZ2m95oEXVtac4rG8xD87Z23e2qkz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7151574"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7151574"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841256618"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="841256618"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:22:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:22:48 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:22:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 17:22:47 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:22:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL/6cWlbCHSBbsAnAPY3+TILqVezCWHwnhSoC+bm9mCaZjdnlBJ5iJAibWdmQMbNuJQpEpmvYObxIHkteXNHhZIZnK5fVfq3YTEWOXz1TMHIYB13K3kbWaIMzpeX5T876v8ccEQ9sEIdCdA4vZ4KDert2Qw+f0+nFZbd/bRDTXbwP9Ilp6LAM6Txe17Xg0mBH0dug8plDPZvd/PkSYqaklDddzTU44OHbv5UHGPY+udVhAkm/zQ2EscHzvGtfkRpPZomQoc/dPSxUhz7jEPLAU0cKSJJCHhvZq8mjEFJ9w3dypcbiIIIUGrMxtfq7vfNtEkRsMXShLICqqZJsiuUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2D/ATJrcGk0fCVN5kw/QrKrkOcarnok80rueSo9RRk=;
 b=nxTWTbVIyi6lH+J3EA+Tesh3JgFLs8JtBYae992uDfyCqydg4AZ3lAaWi1r5V8kTc2zIwGXzW9RVypuXHqpq/QgimXpDCzyTRnoDFD5u+RO6ptPBi/QkQonvPOdNO1hX0FLPoM9NotJOF8Cu+BPMZqOiOqzSmFgnfH9xTinpFqb73cl30btDUZcVmg/i/NSritt92I60PHrL6bi5B0126VcVJq15y0EgIGEgoqkzRo81aINsH3n2i1u31JLPsUJi2TPOkFX8JDc0bPaEPMa/Uex0xjc+bJJPYEI900YCe2h9vVFtPBEczTTpk6sZoydmGlJlBeDX/lPEyJQsPhFwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:22:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:22:45 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] drm/tests: managed: Extract device initialization into
 test init
Date: Tue, 5 Dec 2023 02:22:09 +0100
Message-ID: <20231205012210.1491532-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205012210.1491532-1-michal.winiarski@intel.com>
References: <20231205012210.1491532-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de0bfa0-4a5e-4d13-a688-08dbf530af88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJUE+rlFvwU86Bs8nmF95SHEpB3vBL/EbYUr07wxeikmsbqsozyAszIytO/LAsC1F9L72U0y4naOhqIV6xnADm3lUF4vaNdAj4bAc/hjJIeXb2xkIJbNSdqITpSMEIc4BrTQtQsx5Il7uWNUNyx20ui+ksSebHayb9ms3fplALEbxH7PuMIJUdj6VLOX+O1myQYfvBO6aY5w5L8oXTGRpbpr/l83OoFki3zChRBAdZBrSaDHqi+epoMR/koVt/X1wg7Qdax4RdK/Zi6cbx+s0z2GKaGr4W0Di8gHSpKuq9ftAVCuyTUlLINrhcKN6a7gO/dNnnleycXP6SnYFOrq2vEL8r1/PSsWX+zlMwjhujLntTUdPg8qr4rckPP6CHuv7oZnR/X5uRVPUz+7sieick4atENO7nDq9BRk4ZQjXXhTbCCOFs8BIRzr9eTT/Pm8MWGWlyjYF1qf5dybQm8vmAgJCUubNBS4ZxpVLT7X+e/IYtsel4UUNI40LLZGUjiHQ/ai73zh+oClgCTtfEHtlsQT9S0H79T21NIQjy0yXOTu7wMuNTWnEjKd4mowfebT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(7416002)(41300700001)(6512007)(36756003)(1076003)(6506007)(2616005)(82960400001)(6666004)(83380400001)(6486002)(478600001)(26005)(38100700002)(316002)(54906003)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUIzMFZGaWYvVVBFQmV2ckU0S3RpZnpONmRucWkrcTNTeXI2dlBLc2d6SDN2?=
 =?utf-8?B?cU85NTVhazdpcGFQTkpOL1o3UTRPZjRuYUg4ZzJrNGt5UUo2Z0ExSUh6WVVO?=
 =?utf-8?B?bXZZVlRHNDBjNkExbGZnNFlhb1YxVjVwUjNRQUFheUZKTE95d0FCOExPS3VW?=
 =?utf-8?B?M3MxNDU4cnJqakJYV2twSk5nSk1FVUhySmdkQ1EzNEgyMXUwZldYQjlwMUdK?=
 =?utf-8?B?eWkzYUkranR6cUJpYXYwR2xnNnZhNVFqaDNDWVY4U2xIMVpTejJzY2NUZEtq?=
 =?utf-8?B?S0JNbXNmT1Y4Y0QvR0ZSUFNkVmdJT0d4WjZOUDlTaGs3QzZHYm5UNXNpSHA3?=
 =?utf-8?B?TldoNGFqOFo1YjhnTlpJQnB3c0o2RTNDQWVzSHVHV01UZWN6eGNINmYxdm1x?=
 =?utf-8?B?NGR4TStmRHdSMlFHeUtLSk9OQUFlWi9NZ2pGckhVSWM2TU4rdUNwcUlEMDVH?=
 =?utf-8?B?bFgxT3UwcDZ3d1NranhUMGtwWER5RzZrbDJzNER3L0VmSStEN29BZFplaG5W?=
 =?utf-8?B?aDdNY3MwcW8xcjQwUmF6dWZhSnJ3QjhCcFNhenF4Z25IMlRDeldodmdPRzlO?=
 =?utf-8?B?WEpBVWJ4a2NxcDZUQy9NMlBKM0pRY2ZHQmkvTFNIKzMwR1dOZ2dZQ1lKWUhI?=
 =?utf-8?B?Nk1UTHJzNGFPNWlhamdwdGFCdDVJVEF2RWxObHM0THRkS1B0dGFoSkcybUxk?=
 =?utf-8?B?NFhsSWpORU43dUlza1JCeER3TU82Z1lDYkdQL2svTktDdG9ZL1ZPelJoYXp0?=
 =?utf-8?B?TWdacU9iOHlDT1FXc2xPaGJHbWxiNzFJR0pYVldCaWVwSDNNeHlWKzk4M29v?=
 =?utf-8?B?RWNNSjhYOG1COEttN1grZWlHZCtpK1pIUldjZ3VpVitoTWlvNjY2bTFHZ0Y1?=
 =?utf-8?B?YlZ4UC8xZksya1FCdFZYMVU1VjNtUEV6YTJmNlJmYmlwMW9qdHZZQ0dyeVBu?=
 =?utf-8?B?M0E0bjJERzBITzlLOWQvZUpnR2Z2ejIxVmcwOUVyRDZneDBiRWlBV1diQzhh?=
 =?utf-8?B?VDczWWFNWUJSQ2RkWEsvMzBrejdYWEJrdHFwQVpkRS9rOHZ4SWhtcXRNRlRB?=
 =?utf-8?B?aHJKcVlqODU0ZTZ3WGd2c3VlRkgrWUVWQzhyU0xPZU1nWkVDWWdzVkwvM0J1?=
 =?utf-8?B?dHlpd1lkY3ZpbStMYW1neGw0MyswQjVCZDAzTGdQZHBPTEs2UHNhSzR3ckFH?=
 =?utf-8?B?SXNUVEI3T3NNdEh0cStYZXZWcVVtRktFZzIrUldDdkNRZmRPUkNjTXBnR3JM?=
 =?utf-8?B?dGpiZ0ZucE9TVE92bnJMazZkOWp3S3FCMkt4WVEzZmYzd0FFRlRnODRRaHF4?=
 =?utf-8?B?QUJpRm13T3dMdjRNTE9YYmU4cmxBNTUxTGltbVZ2WlVOZWJYMWl3VXNhNjNy?=
 =?utf-8?B?elhEb3haT1BkbEErYUV3UnkwMXBQa3gxNm5WdXpCdVBnUHV0QkFCQU9HZ0Ju?=
 =?utf-8?B?Z3F6ellHc0N4L0dhNkdneC9XaWFoR1QwYkhpVFBhc254WlY0Y1NYU2RuSEpB?=
 =?utf-8?B?dzhEbWFTekxLUnNOaUFIUDdBU1lXRXpubXVoMllNdHRLcmtaQlpTemxOSjFq?=
 =?utf-8?B?MG1tbEZXZjVWZnV2Tk94bmRVc24xdm9XT3hjQ3hEcmhoaXBiay9MKzkyWC8x?=
 =?utf-8?B?VHcxV3hKS3FlNW1vdlRtUFFzVzl3aGwxNDh2VzBnVDBKR3RGMDk1OGNCeDRU?=
 =?utf-8?B?ZER0djBqbW9JaEFyNjdYWUxkRUk2V2k1N2N0eVRrVGVzVTZPS2lEbTZLai85?=
 =?utf-8?B?RGNSRW5qaTNsRnNiR0I2ekxkVkFNOUc1R1VtZUdjVXYrL0s0WlBvMlRjK09D?=
 =?utf-8?B?cFMveExTMWZxNWRMNHdsamNuU05FRU1BRUdMd3FFSmcwU21HRzlFV3pPSTlS?=
 =?utf-8?B?VG1vQlIxM1pJKzZ6NDAraWFRNGZFS1k2Wks4a3AwcjBUOVN5K0JNS1V5MXhL?=
 =?utf-8?B?UlBkR0hQQUpuSHJOOXhzQWY2UW9QTmJINWFGMDdzUGgvb1NiUmpSZ3NQV1Qx?=
 =?utf-8?B?bmtOYXNmVHN4Wmp2QldEcWNPaDNWMlJ0UHNsQTdvbUJONFFuMkdpKzc3NnVN?=
 =?utf-8?B?elFtT3cvV2VCcm5FTkljWXZZeGpMRjI4N3BLaksxZGh3Zjk4U2d6NFFPdGhQ?=
 =?utf-8?B?Zkp1S3JIelhidjYxMzIvcjF2M0tUc2NTSDBJQ0RhZjNoSERxdmthYURDYWlY?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de0bfa0-4a5e-4d13-a688-08dbf530af88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:22:45.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gH16Y5fcsXL3NE3EBKP1Qdb//yY6cjYY+I84G9XYlD6YcB6QAeaa5dq68K1VOfpqjYA+OfubnG6GO0ib0pFMKo0NvngrCM+IU/WR/7EO+ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It simplifies the process of extending the test suite with additional
test cases without unnecessary duplication.
Additionally, store drm_device inside priv to simplify the lifetime
management by tying priv lifetime with parent struct device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 43 ++++++++++++++----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 1652dca11d30c..cabe6360aef71 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -12,6 +12,7 @@
 #define TEST_TIMEOUT_MS	100
 
 struct managed_test_priv {
+	struct drm_device drm;
 	bool action_done;
 	wait_queue_head_t action_wq;
 };
@@ -26,35 +27,42 @@ static void drm_action(struct drm_device *drm, void *ptr)
 
 static void drm_test_managed_run_action(struct kunit *test)
 {
-	struct managed_test_priv *priv;
-	struct drm_device *drm;
-	struct device *dev;
+	struct managed_test_priv *priv = test->priv;
 	int ret;
 
-	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
-	init_waitqueue_head(&priv->action_wq);
-
-	dev = drm_kunit_helper_alloc_device(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
-
-	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
-
-	ret = drmm_add_action_or_reset(drm, drm_action, priv);
+	ret = drmm_add_action_or_reset(&priv->drm, drm_action, priv);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(&priv->drm, 0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, dev);
+	drm_dev_unregister(&priv->drm);
+	drm_kunit_helper_free_device(test, priv->drm.dev);
 
 	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
 					       msecs_to_jiffies(TEST_TIMEOUT_MS));
 	KUNIT_EXPECT_GT(test, ret, 0);
 }
 
+static int drm_managed_test_init(struct kunit *test)
+{
+	struct managed_test_priv *priv;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev, struct managed_test_priv, drm,
+						 DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	init_waitqueue_head(&priv->action_wq);
+
+	test->priv = priv;
+
+	return 0;
+}
+
 static struct kunit_case drm_managed_tests[] = {
 	KUNIT_CASE(drm_test_managed_run_action),
 	{}
@@ -62,6 +70,7 @@ static struct kunit_case drm_managed_tests[] = {
 
 static struct kunit_suite drm_managed_test_suite = {
 	.name = "drm-test-managed",
+	.init = drm_managed_test_init,
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

