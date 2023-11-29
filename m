Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE507FE2D2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10D410E507;
	Wed, 29 Nov 2023 22:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D8E10E507;
 Wed, 29 Nov 2023 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701296103; x=1732832103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VCUqrEvbOgfljmKuVyn/aVdpbVNBQYXk9viQlZIVKtk=;
 b=T49rXNG8GtSjqcd6kRtJY5Ul9k2wRV1sDaCfajTd9YBlzbxXBVaAuMSr
 0v9CZ+gTPkYBhaVtCwkVA7/sWvN7FdFGpdxfoitcw5YsunPnkJ7DJ3zr4
 fjSLIsQ6k/zavZissfqjcLfdlrZcEdkuXDEij5ovF2dS57pP7AZaFXUw9
 D739IvjcDj2u69dRu28TKNjbTttOLKH6vHDScvfGql2m7kYh2XW+cPHLD
 AAQKyYdnouEfqEx45blABXgayFbNMMZPS8bwtm+owFlDZ1Q5E79Vod7kG
 uU6NPe4hWqKfPXaWqRtE9U3YGOjvyk8p/i7P8bHIR7YHkNpAfePZ2l7U/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11935330"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11935330"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912984157"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="912984157"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:14:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:14:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:14:51 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:14:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7cKDBLg0UIjTB7h7TlPFb4Nu17cxHupNOVD/HXtludY9nc+vMyFEvnhgOLYPuGKrc5xyhwfh9OeKzbHk8oJD1DYwCEoKtnOwDPrxdJfDgY7a+5viXf62bD0eGv6UzyH6N+zEbqUcpnJRzP+sNchGjJgYyLE4TLvLQ9rOdDSF3cpb0blZGs1RT625lUvCeIaQuiWi/ZZQeT7BACLmbvgnWQATMMKt4jAEWGSGDpS6dUkdD3L7j1BCYLv5/LWuP8zKvDMs0SNm2+U56uN7sHVr2G3IxLlCftb3+HcojuzBU/E0dRDjmG0KZ9WkwRi4lEU4ujGf+2jN0BmBC1mIJlcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea9DDKEx/y8I1Qv/Zpuy1E6FoPnW639S31vVs4kxS6s=;
 b=SH/aN2KKadBFG+t9WJ88HA+TSRg9X0o1yl8XynNqFk7+rdDAhCZqRkvrXj3S9Jn2p6dywOt2plNQ+eEncWfpYqk2wCY3y6OT3QMkrEbiMT1rUPKztuyeO8IQrSqjxSi+d9fZAu2QIdrduGOhR6TA0aWGhmGRTBhdU5rQJ5gKB3W34POAtF7YOejykLEyUe9SRIqarJ1W2fTRJaRzEHMHaRRnPaCiNNi7o8dviCIv+t0SKLBvv8xPmzmGgPOjuiUamLYLTj+PyvgaTT5OZdletV7+iMK70Pw9ivNwZ/oLov9+OCo6AExOIqyCCeZyyKEsYOkBdmg8MMSTAcq1WmLOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:14:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:14:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drm/tests: managed: Add a simple test for
 drmm_managed_release
Date: Wed, 29 Nov 2023 23:14:12 +0100
Message-ID: <20231129221412.1180549-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129221412.1180549-1-michal.winiarski@intel.com>
References: <20231129221412.1180549-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PR11MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f13fdd-b885-4ac7-681a-08dbf1289a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tovgHS4uobpecGFlg9wtY3e8RTaFV7s0CTevNFvdbNJQ7KQZz2Bu2DmSGOWe2g05YST+1Rmh5MAnscnWGaBHkzifzvaCMy3mQxomAnDHBW9wbT4M2lH23cyQfhoKoU17XhKddvSqPJjSd5ZGJW6O3/j9w/q1UYyfNm8W1+4N76Y+WzCuZDAOCePp1dgrxds1vmca/Ajxz+sW4KHYRFHWs5j/xy69n5jIUIryud6+yzZciEe/YZmyUQ6+imHH2WRJTJJ7M3y8DWEzz45NmESSHPO6MnsUcx8H6VP62FpsWoYhsS6NHkbtzmYmkX0hxDiEqjlD5/1XH3sGuEcS2QG8/zvj7KuQ4roypcUsyAAi6/2YlAZnato97G6oQKRgAbEqorX4NSgxJcCreOWjD3/sqq8xujU1IZelDCMZTg0XEgWhAr44j9kLKDSM2PIIzhLsZ5iv6xRBBfEiIKR2ci3KN5ePdkGd+PB/2OTkkwNhs97/wvPp4xFy5b1sRPsORgHQ+tHRNtJAB7YMTE3m6Bkq/BmIOxO6Y/1hm+fo0wtv3MemaZ9j4CBtJiMmO+o7AAc1Nt+3YHgh+UxLh3IziLSvD/7OyHLhxseuxX/GNTu6+r/tSalzxsCaxvfZ6VzQ8C0B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(1076003)(26005)(6506007)(2616005)(6512007)(36756003)(6666004)(82960400001)(83380400001)(41300700001)(66476007)(66946007)(66556008)(54906003)(316002)(5660300002)(7416002)(2906002)(202311291699003)(8936002)(86362001)(8676002)(38100700002)(4326008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm13UVR0cE94bDhaZU9SdTNHZEI1WnRYblZkWU9nQXdBUnd6YlhMWWtkYzNH?=
 =?utf-8?B?RTF2UWVMb2o2b0JPZ2xFK01xbTJVZ1ZuK0ZLdjBFSWdMNmdJekY3Uy84bFRU?=
 =?utf-8?B?aFNOVGMxNTg4YTNuN3NSbXloYkVkRFlxbkFLWEpjU2prNUlsZ3ZTY3k3TzU1?=
 =?utf-8?B?endYUEdwZDc4bnMyTFpLdzFjUFU4MklTVmt6MW05R1NralpGYXBGRiszbEFF?=
 =?utf-8?B?RjM4SHdFUmFqcTFHdUF6V3Z4ZlFRVkEvMVFTME5peCtLL3ZnNWp1V2xoTHJv?=
 =?utf-8?B?TjBJeXJXNHVzMWFEcnIxdGRNWVVwams1Q1Jvazl3OE5TRnF6Y3p5SnJ5WDEr?=
 =?utf-8?B?eU9SS011N1BrU0ZtcnNucHlZeHNJazhwVU9TUHFFWHZWWmF3YkVCQkNKK2VC?=
 =?utf-8?B?aTRyU2tJUUJHTFljK1AzZklvYkovU2xVUGlZT21jdGpPZlpoMEtEc2Q2Slhh?=
 =?utf-8?B?bGREaTdibXg4NzFxTEFtTGFoWWZkWnRucEFHeitQQUxBMjdGOUJGRE4xRE0y?=
 =?utf-8?B?QWdIYjh1bmRaaFJLYStzcElpVHRRQlhyeEJOMHlibnk5MktDMm1uRnlHUE1L?=
 =?utf-8?B?OFJ6Z0FRL3F6UFRBbTBncXE5WlRqalc0RDVyd21WQXRlM0xsRFF0R084THFu?=
 =?utf-8?B?MTNXeUdLWGZwZm5RcEJ5NXlQUXp1bGVCcmJZQU82bllkN0ROWDFEM0NOK1dN?=
 =?utf-8?B?VThpeldGdXdIcS9zTW5qN1RGNVRaUi81bE1GQXpUVDlEN1c2MTcwdnp0Ynor?=
 =?utf-8?B?MVdnQkR1QW1tbUZxUTZTRldVR0ZPRmF0S0N6ZFhoQzNsQXZ5Z0s1NFh6d2NQ?=
 =?utf-8?B?aG1nVVZ6TkhRTDRwQWl6bTJ3ODFhREVML1dpbmNsOFQ5OXgxL1ZIZytkRHRt?=
 =?utf-8?B?eC9GNlhIcnNwa1FqOTh6U29CTVlCdDdYdDJwOW1kRkZSM0U2WDNkNG0yb21Y?=
 =?utf-8?B?MTBlL1p0QWpPMmFMSW9UM0FQYW1Jd2tJSm1oUWVvUGQxZmIzVnZ5d2ZqN3hj?=
 =?utf-8?B?YkFMdjB3aFJxa05PaG03YWUvUGczTDhVd2JtbGtVcXkrVFJSd0dncXFyUmRj?=
 =?utf-8?B?bGhNL0lKOE1wMFZMRVp3bk9ZekhMaHdtb2E5N212OUh1SFcxSlh6blFzYTN1?=
 =?utf-8?B?OHJkS3oxZXBhMVI2R3daZ0U5eGFUdXJLbk9DRHFNd1F3cHRvUHhEM0kxQTFO?=
 =?utf-8?B?Z3VPWHJQWUZ3M3VhcWRwRm5mSVl4aVFIM29tTnFPN1NnYWREWWE4VEJZQm9Y?=
 =?utf-8?B?VEs0N0p6RjZiWVd1eTVuYUVUQ1BNY3gxMnRQZ3N3R1c2YlhzYSs4L3gvdklm?=
 =?utf-8?B?dnJlUkk2M3ltakdNVGVZRTJleU90N2VBWXlnQUozTVVCQWNNVlh2YlBURERR?=
 =?utf-8?B?WFNybTZMSXZVb212NHo5R2lCRzJQQ2dteVo5SnlWVExvUHNXdG5yc2N1S1FR?=
 =?utf-8?B?Q2h6UE1wa0dxZlFRT2JKSmhaVWs5YzMvMXBFQUs4Uk5VOHMzR3FtS3JGUy83?=
 =?utf-8?B?a2tGUVF4T1p6RUVpYWR0VHJNNmVENHY3S1JHMlJnUmNQYXNDQkV2eFBnekRB?=
 =?utf-8?B?SWYrMkJKdzZQdTRGbTI3bHZXTGVuYjI5VEthdVVuL0M1TDYxa0h2WjhBei9L?=
 =?utf-8?B?aHQ1STVVMFB1WmV2OGVXeC9OQWNIajFFMFllMlZjaUFIMTF3Z2Jod2lWQXVN?=
 =?utf-8?B?REM4Z3p6Mm9QMHVMQnQrdnVackZ4NDhySUlseEpPWk9xN3NrS05oRFdNQ05V?=
 =?utf-8?B?Z3NINDU5TnVKcmcvc1BhYTF5M3hJeng4VTFlTVdtNDRvcHk1a3IzVUpUbzJN?=
 =?utf-8?B?OGxNT01raUtCaUFCMjhEL282empLTjE3Y2NVem1UVU9ZcWZyQmxZQUtJYXJv?=
 =?utf-8?B?Wm5YeVg1dDdxNHRxbERwN1l1dytJQWJHWG9mSUx0ZVEzRDhBMmZZQkw4TkVX?=
 =?utf-8?B?Y2tIYzZtMFhyMTgxSXdwK256Q3JFaVFhQnVOckQ0Rk1yQ1d3SURNbC9lY2dv?=
 =?utf-8?B?b3JsdE81cFBhRzdSQzRBaW9DTHQxRVM5dGt3VHlVWk90Z3hBM0luNmpRSWdm?=
 =?utf-8?B?b3JWTm4zblFFcER2UkFkb2phb3cyOXRwN0tPQ3VtblFVaERHRzZMVmgzQlRr?=
 =?utf-8?B?cXc5czFxQ2lpK0tYNVBiV3RRTUJVQklTWmdPNEdBQ2RBY241NDZJSGt6MnBl?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f13fdd-b885-4ac7-681a-08dbf1289a95
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:14:49.8485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6q64r6uKTL14MLPGqpNqC857I0Um+6t20RrWNlYS6y67LKNMUGvHHFWNcO837XpSResQPriBodRr+ybWmGt0sKaRCo5TFJj6eusUoPdePA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
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

Add a simple test that checks whether the action is indeed called right
away and that it is not called on the final drm_dev_put().

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 65 ++++++++++++++++++------
 1 file changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 1652dca11d30c..a645ea42aee56 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -12,6 +12,8 @@
 #define TEST_TIMEOUT_MS	100
 
 struct managed_test_priv {
+	struct drm_device *drm;
+	struct device *dev;
 	bool action_done;
 	wait_queue_head_t action_wq;
 };
@@ -26,42 +28,75 @@ static void drm_action(struct drm_device *drm, void *ptr)
 
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
+	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	dev = drm_kunit_helper_alloc_device(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	ret = drm_dev_register(priv->drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->dev);
 
-	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
+					       msecs_to_jiffies(TEST_TIMEOUT_MS));
+	KUNIT_EXPECT_GT(test, ret, 0);
+}
 
-	ret = drmm_add_action_or_reset(drm, drm_action, priv);
+static void drm_test_managed_release_action(struct kunit *test)
+{
+	struct managed_test_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(priv->drm, 0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, dev);
+	drmm_release_action(priv->drm, drm_action, priv);
+	KUNIT_EXPECT_TRUE(test, priv->action_done);
+	priv->action_done = false;
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->dev);
 
 	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
 					       msecs_to_jiffies(TEST_TIMEOUT_MS));
-	KUNIT_EXPECT_GT(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static int drm_managed_test_init(struct kunit *test)
+{
+	struct managed_test_priv *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	init_waitqueue_head(&priv->action_wq);
+
+	priv->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev, sizeof(*priv->drm),
+							0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	test->priv = priv;
+
+	return 0;
 }
 
 static struct kunit_case drm_managed_tests[] = {
 	KUNIT_CASE(drm_test_managed_run_action),
+	KUNIT_CASE(drm_test_managed_release_action),
 	{}
 };
 
 static struct kunit_suite drm_managed_test_suite = {
 	.name = "drm-test-managed",
+	.init = drm_managed_test_init,
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

