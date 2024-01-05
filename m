Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A20825198
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A8C10E5CE;
	Fri,  5 Jan 2024 10:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666910E5CE;
 Fri,  5 Jan 2024 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449637; x=1735985637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kBoUF9HYOTFjNe2KivFWvaOTPojfkpwp8QWHNhicEKk=;
 b=HcUqTmDQq3Mo8kIaX9FAD2l0+hhW8FtkTHn0IU+DvH+b4ZpOG5Y5ZzxZ
 JNpGI22v+EXYBe+oz+BfPkx+0c524jqExxOxFRLbcrYE/3eWlmKHhxlND
 YExwsL6so1h3dLA21n/bCgf+TzU+hBVfFZXZceHUK03gPRxdHcfv7oO+X
 l7VG2NqIBdyDJOi2JVSdYRlPJvMsUgnUOev5MMGUBvhC8gAsJ5PFGs9cA
 /A2mQiRx3U4FagtXZ63oKQyP1ki9sdrxmPnYQ3qmvmsxGvNEjpaqTpvcJ
 /gS3AynDBhWJOLqo2Lp72ee+Jx1mbL4w/Ganf27GdMhig9RDBgPaKw6lB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="483651641"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="483651641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="730435477"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="730435477"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 02:13:57 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 02:13:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cckap2kZKrRR74mmqOwAg3vJ3ocTDoZUAohhjt1xCGv2kZE5m1cuCpOVf1wxvDYxcTOTGiCxh96lfPDa5O3grOJtg5zBqgzsmej7yNHkdyygyj9+Z48tYgP5lLkE/up25I6jwhSrI6HjyOPy5tafIgBOFPAtC7wQ8gWnM9sPa1+fbwXjI7JLET6VDpPoDStZMPS4kLFCt0rxvudhUskFK7u1bMI+RkuFl/+g7Y+Xy3l5AnhtGm5yAgNKDrG0OLk1UkgOs+5eP2upnzHZBjSpGQB+AtsTwSE+6BhfqHbTmq1OtvfDsPXYURMUZUuhppGCJMMxpoOpcjm4WoOJlZZeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyCAC7LWE14HvBFc2H+TqGWJ5O9b40rs5udZJZAwzPw=;
 b=a5bWX1etx8YXElWd/x7br+YKfb+BLMP+myFYcNBiTfINVq+JrLFUc0Zv4Hyko1cNDimBESJKvv66Nf1bNs9eNmg+KT7bg7PyY8SplfjWB0X0uA1+tn0rFOBZeIboSjeyDVs1TYcYP1R7e0xceGn7mlhNK/D/YdeXcdfAYz5Y6eLIiLyc1hthj7rKK/kxkoxRm/rgz7qk+GKSFKkpKyzrOJHG9U00sWjLDN4a9N+MbME63nsTi3eLOm6NWUDW7cNHsUwTLRiyvqM42xvoxAqg6NxvMspOfJPy1zgfqeqJwn/ZpDMMYTxkavfrdi+RBaHbL9h2d5XLaqgmeFlDBMKKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.17; Fri, 5 Jan 2024 10:13:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:13:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 5/6] drm/tests: managed: Extract device initialization into
 test init
Date: Fri, 5 Jan 2024 11:13:23 +0100
Message-ID: <20240105101324.26811-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105101324.26811-1-michal.winiarski@intel.com>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0044.eurprd03.prod.outlook.com
 (2603:10a6:803:50::15) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2eb0d0-c9ad-4c31-a41e-08dc0dd703dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTF7t0WS3M4UsvM9kA9ynwXKRrG0SipTGfDaHmaEDSPzoWuH8PhHj9GVpogBebo7eCM2UATjeRaSoY4MBSjdd62M/HawHbGhSchEsQ22Lh1ADoWZ4ige4aj2/xy7TUVy6baE2HQ04JNqhKl6JU2MxZnFT3qpkRrm+hRfLdTV8aPDsCGFhGEPuVgjony3yRTBCexA7wwyarIgddsdxlaZSiOVXsLyAriDRJHUuTU4qGT12UZgpOr6xIKPvPHtE/mNIt6LVIIF3MuBWpTiVAMQIGaQEMZ3QLIkxIgARZAE3hEYbH+4jGwlxL6ld+6197A3BkGm0MlP+hMX9YpVT+s5U+dlqdriCvR0VQy+nk6vQeM313zMEXJ57UrsWe4h659XSIRKmc0g/V1Z+mteEL1r7fD/cCf5UgGUxXKb4yic1QF9Fe0BnJ2hC0TUkGPHmjm5Kn67xSVurpYcfuq63Kwu3DAaAGxLDbm5zIYl43wF7F7IYb18ml3g/NKo+BvQSQu4FAnh7m1TV349u91ti1j2SnTLaSrkiX13ciRUH6HzGcqQGhBPh+jPuh4P+fyJeArZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2616005)(26005)(1076003)(6666004)(6506007)(6512007)(86362001)(83380400001)(4326008)(8676002)(8936002)(316002)(54906003)(7416002)(36756003)(2906002)(5660300002)(6486002)(478600001)(66946007)(66476007)(66556008)(38100700002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0Y4ZHZCMzZTT0k4VFM0NDdLUWZxM3ZLRUEwalYxV0c4TUxOQ04yaHN0d1Vs?=
 =?utf-8?B?cDZ1T0tzQ0JJM3NaK00vSWdaeVBWU2EvQUVMYklzTlhXODFUa3NjeEdCUnpV?=
 =?utf-8?B?d3c4WHBXcVp5VnZwdFcrSU5uVlVBb09mSWNCckVMdXplWkZ2ZEs1aTVvVFRC?=
 =?utf-8?B?Ukg3bDlOa0lVRkM5L29SUU5rNGluaW8vTjRLV3ZqN3p2b0trQlpPNytJWjRK?=
 =?utf-8?B?UVMrVkpJN2VvRkZlazFxVHZJREpwREVSYy8wYVI5RzVmeHJrODBNNVZna3U0?=
 =?utf-8?B?a1Y3Q29rUFRBdDk3L1dQSmRtYXpsZldVK1k2TXY1QWdrUnROdjJ3b1V3MFlG?=
 =?utf-8?B?YzBPbDI5ekoyZy8yNTBiN0MwOVYxRWhCNjRkUi9EMkpreGIrL21QUFZVb1Ry?=
 =?utf-8?B?K2NMNVc5SkhzWG83cnJxMkV3KzFKclNSdEZhK25BYVBocWRWMFkyNTExUWdO?=
 =?utf-8?B?VUxveFp5RmsrazRFKzE4VEd1R01tazRVSnF6b0lVQlNoRXZDRnZoa0x0QXhs?=
 =?utf-8?B?NE9Td1JmOEt0aFlUTUpKK1pucXUwWmRHMUZnaHBpNERvWUlvWllFTkwzaUJy?=
 =?utf-8?B?YythTDhWa2Y3WDFvdFBGR0NnMmxtbFArbWc2THJMYUFpVnl4Vms1blNzMGs1?=
 =?utf-8?B?VG1vNGdIbmtwOEh2bDNTTDJKa05QeWVrRmN1WGN4aU9hTWdJdmw0Zng3UWh2?=
 =?utf-8?B?ai9TbVZ2anRNYVlFVXp1RXZHeEp4T1lHKzlQU0JtNXBZYjI0RE9tQitGUFQy?=
 =?utf-8?B?NERHYjlkR1Q0akF3UmtWRUJ4cUh4MFFPelg3QVBlMnp1RnBINGpZNUk1bG9W?=
 =?utf-8?B?TE9yeThoZTlzWFNsbG9IZXZVc0R1U253WFZDUG9XSkNSRnVkQklRV3pLc1lV?=
 =?utf-8?B?c2FuOWtHaUpjWGtuZ0Z1ekNRNFJFSmlLRHlRcHV3d1Rxd0F3SnozalJESG5m?=
 =?utf-8?B?aTlYU1BqdlhpYk5HeHo4VUZuQkN6Ny9QQ1lUNWdGc3JTODVkSGJENEl5UDJv?=
 =?utf-8?B?cEhabnNmRlNlVHVoZU5NK2xyWjU3ek1pa011MGQ5cjFEMWthTStLYmtwenA3?=
 =?utf-8?B?dTV2V0JiRnl1Mm9JZmVlMTdKcG9Fd0dGQ0FOa2N2dG9pdlNYSll2SVJmMWJY?=
 =?utf-8?B?WU5lMzZFdGZ2UFk1SmJJdWYwYzE3STlEeEtnWEUxSXhUMGw2UGhjZ1lUdENz?=
 =?utf-8?B?NXNjZ1ZjNE5uWFFPOVEzWE9iNDQ5clA4aG5vNEgrZWtlK3IxakdueFFkN0pU?=
 =?utf-8?B?Q0R6dlBLMHpVaXUyUXRvVnBnTTdFVWJ6aXVkbW9EbnJVcTVxVDhGcjRySmY3?=
 =?utf-8?B?S2VzZHpDMk8wMVVGZjlEeGF0eE56aDdXWnJwMSt1THc5Tk5ONU5PRkxuUVRs?=
 =?utf-8?B?NkxrTnIxL3RYUG1IVVF4TG92SzlHTVErSU5rUkYybElhYlN0cllIdTQ5bmow?=
 =?utf-8?B?UktLbXV4Nk9wcUVqczlUV1M4VW1lTUJ4Wm9sWmxGRTNXcmI1ZkpDTlVKQmNp?=
 =?utf-8?B?QU1YSm1abGJFZWZ2ZDhqSVpvMjYvU2RFNldsSjVUV2ZUUG9HKzRUUkx5U283?=
 =?utf-8?B?c2NyRERWN1B3N21FaHpkZ01jajJKWkpMNVYxaFpTMGkyNzRORHRrK01JaFdB?=
 =?utf-8?B?amo3cXpOd0xuODVsZVdNRk92TG1zekc1UlI1YWdjejMwWW5xc0tjTWw2aHVi?=
 =?utf-8?B?azAzbTVQSVhibjVrOXFBaTRVS1A5Z2dTWW0rajR4cnZPRkphK28zOWpjbjRp?=
 =?utf-8?B?QjZFZVhmRDRqRFVxNDJ5bWJ3c2xFZDdlSmJONERrR2NqREZzeTUySHBLd2E5?=
 =?utf-8?B?cUIzak5oOEdPK1E1V1NEeWN0eHEwMm1SRTRLNjdrU2tyNm9Yem00U3l6b2NM?=
 =?utf-8?B?Q1FJUUhwSEdkY0plcnl3MnBIUEJ6RDRrR0NUbkk0ZlpzcTlkM2NCY1VWMitV?=
 =?utf-8?B?K1BnSnJmM05BaHIrSmFBdUFvaXNaaFJtbi81OGJ3MVJMV0o4bUsySytvNkU2?=
 =?utf-8?B?d2owWUpnUU9nODhYVUlUamxTZjVnK3lidC9UNURtUnlCbVdZeDByRXRYNFBt?=
 =?utf-8?B?UXN5a1c3V29KTWNUSEVpK1RVVTJrOWFFdklmeVVHYVNrWmw3ODZCdUgrdEtp?=
 =?utf-8?B?RUJZaEhFQy9YbGFvdTBsRURMUjF4cW93YWNtL2VDemJ4QzZSRStMTDlLU1p2?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2eb0d0-c9ad-4c31-a41e-08dc0dd703dd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 10:13:51.8484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fNj23lPpkWrPKipt7YoRe+OZF7iE7yhp9XDN2EfgsDisDzlGqv3jg5jqm5ClP1xa9Xw1KlH+r0QQkqaSpUDZ27a2vxc9ukB9amoGTA9o+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
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

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 37 +++++++++++++++---------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 986a38c9144a5..c1fc1f0aac9b2 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 
 struct managed_test_priv {
+	struct drm_device *drm;
 	bool action_done;
 };
 
@@ -24,11 +25,26 @@ static void drm_action(struct drm_device *drm, void *ptr)
  * device is released.
  */
 static void drm_test_managed_run_action(struct kunit *test)
+{
+	struct managed_test_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_dev_register(priv->drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->drm->dev);
+
+	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not called");
+}
+
+static int drm_managed_test_init(struct kunit *test)
 {
 	struct managed_test_priv *priv;
-	struct drm_device *drm;
 	struct device *dev;
-	int ret;
 
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
@@ -41,19 +57,13 @@ static void drm_test_managed_run_action(struct kunit *test)
 	 * to remain allocated beyond both parent device and drm_device
 	 * lifetime.
 	 */
-	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+	priv->drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*priv->drm), 0,
+							DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
-	ret = drmm_add_action_or_reset(drm, drm_action, priv);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	test->priv = priv;
 
-	ret = drm_dev_register(drm, 0);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, dev);
-
-	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not called");
+	return 0;
 }
 
 static struct kunit_case drm_managed_tests[] = {
@@ -63,6 +73,7 @@ static struct kunit_case drm_managed_tests[] = {
 
 static struct kunit_suite drm_managed_test_suite = {
 	.name = "drm_test_managed",
+	.init = drm_managed_test_init,
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

