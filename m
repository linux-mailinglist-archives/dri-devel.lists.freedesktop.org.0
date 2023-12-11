Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512DF80DE06
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 23:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FC810E520;
	Mon, 11 Dec 2023 22:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1644910E50F;
 Mon, 11 Dec 2023 22:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702332605; x=1733868605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8ZHJfGEvNOqDHN3zqfd4GyNmg1YXYB9tnrENzdLCu9o=;
 b=HOYa+DEHmMjinbIYSMpoJa8uMdVo2arL+D859de0o+Tn+jNNESXibrqb
 ARSoIR04ARxnSyGZOzOZoasLPbrSBm6/K2JJT2z++wSB7U8WMyUXjxYQd
 wTrTFViKQbC4lvS5Sccw+RXV2pBRXXrV4QTRV19MVjPms5kaHsLoQ+G6D
 NFHdPewXP4IkUf2DfvlpylFfnae0DkxcEuYrFK3XSMyc4LSNYxMp0oifF
 /gcRM6b8hdUoEDQpHQgUHYaX0wyyLS+EN9wUWlrDRRPapYuw4RMjWn2eJ
 1lEb7XpWcKK4aiRA2CLEjKoUIcNGh4DCA5AKE2cPk2KXRbSNoxGvUOO9K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8079369"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="8079369"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 14:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104642672"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104642672"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 14:10:02 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:10:02 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:10:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 14:10:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 14:10:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPsibF39lMCwRCtwAocpYNrh+qV4pC3SExCrNmZxptRdytsFwtZeJspidv71c+uaTOAj2G625UApK3rFqjktSD9uu/CFodw+KaEek3Ym+B+HbEbL6J1fpYai6x7qMWxFKg+wUozAyBKo/9rPhMkHCF/4ZYmhmKNcpl65VXDdFmid1FN6ssqcfhCBi3tFTl5KcAkL8YVvQWi7TPmDLSBOOmf815mBZp4q4nK8HMQ7S3P56yxP9jvv/OZDvpvSVjNCEMceuCkOQ9JTYxRe+j9R/rCcHhlNxkexW3+5u2UHk6FZ1Pq88KFEM9UPGcJptvsIw2MgFxHTyxb6XZrFscmgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ryXkAWZ5wXCE84ofb91OXLyBorFS2gEbNPixt8PWlM=;
 b=mol2mwwiREFt92m4KgK8HBFuybQ/YJzBKeLWXa7+v4f+9N1ZZrfA8vo42uadgkaLcc2YFK5GovFqtdK4qt8DHzwOp6yh8Nwv3s8mRZ3zUWPsKGFIq7O8D3VRsMEXFKYPQnYWsranZLL9r23gLMTWdf5+cikNCGoCPyi/FrKIxwrsT4up6+rbLAPj6/GJqOq8wfABAIY5w8VVpuG3zKGTp5pIKqKUOnm/vFdBlsnCm+y3PL//ApC9jOG6AqMvb8K2pCOEcg82wuLFWP1uXD5Yz2wQtTYg97ATzdAm5KHHzkOxE+n5oAi9LHIvINEXreAXArRVJw/7Z4ZiNR+v3G/1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 22:09:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 22:09:56 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] drm/tests: managed: Add a simple test for
 drmm_managed_release
Date: Mon, 11 Dec 2023 23:09:39 +0100
Message-ID: <20231211220939.215024-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220939.215024-1-michal.winiarski@intel.com>
References: <20231211220939.215024-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2368c8-8bc4-47df-d741-08dbfa95e8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYJDLA8jm1krYJJ4qZjrCJMHsHYLA5m9Dbnyod+SibcXSUyJ2+85CwhbdG8/bneef7x9xnKblek1i01lo57SVEuLGHRCFZqo2ds5lPlbfQ9EvGfWtHU3brtGM2EDqZDay+NAc4T5Rde89cPgo1kHcjj3qVTeZCGWncgUnVeJr6+NysNB1lsmJJybNGFdlKOqE7pKGgvQfs3izj8kLBzcLfzc6aMKZp6UJ59gHsgVV0bMMOZKhA+6iO+Syn9qkVXc+f7iAnLjEuWn1b2d/RS4DogeaBBh7RYjCZsepJM8HGTEKQOt1UB7aGsnqRSUXKqRCwp7Yf+iq2b3TX9Ga7MDwb2Tu3jyWaPTKrpFF0v4iJ4iZR+IoajLLPpaXY81RjpPbBosnaOsojEScHyizcP8vDpEDmEquQYrKPGhz2xZO9SsJVtYQaXT8VnowMaoQCRa2dpb02ghGHZHxcF+Nnu39RVAiezeg82wRdxpV9OLedp24oWAN8EauS8BYDy1xScjBrgamui7zYkfU82Dkeh+FLIp0x3WjVTZJb0dzlrdgL6hiN9WlgN2yz3FrcN40H5A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(1076003)(26005)(83380400001)(2616005)(82960400001)(86362001)(36756003)(38100700002)(5660300002)(316002)(8936002)(8676002)(4326008)(2906002)(7416002)(6666004)(6512007)(6506007)(66476007)(54906003)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9RaGRJQ28va3hwNjhRZTROVGdrRFcrM2ZENWhtdUsrTjBkWEFPYTFLdVVs?=
 =?utf-8?B?TkFJTVFINkh3dXVRYWRqZ214ZEUySm9JNlJkV2ZZYXVDSHdqN3RmUWM3TGhF?=
 =?utf-8?B?UGpoeWM1cjF4a0FKeFMya3d4TDJ4aUFoN1hpaFVxdm9nR2ZzRXFYa2lZRWZK?=
 =?utf-8?B?eXlxTVJUWmdHN3U5MEhEaVRld2pldG1kdStoL21veUhKeUpXNW94Vi91amha?=
 =?utf-8?B?OTVmM0RYc2ZYTU9Ia3V1S2hvVUlpOWF6V2Z6VmtuMDhnWWNBb0RjZUZWMWlu?=
 =?utf-8?B?TURwaFMxTUUrZUdmdGhtS2RBTzRmZHFGV3I3WGV2WFpiY0JkTFhvcFN6UXVU?=
 =?utf-8?B?MzlCWm13Q2hYeC9DNngwZlhJSThwdUt3Z3BjUG1tZVhKN04vTjBkRUlnN2Fn?=
 =?utf-8?B?UGNWMjJMNDd2Vjh5RlkvbkYvK2dkeWlRaVFUZjF6eXFFdVRvcjFkSjVaUmNp?=
 =?utf-8?B?MkJ3VlR0ZmFid1paaDJ1bUJyZFdsTGRIanJVbVI2M21pQnhhVlo2N21LZFhs?=
 =?utf-8?B?MzE3TW81UnJLeFR0Yjl6NE52OHpBSmo1V1V5UEl3TXdjbUZ5OU53bENmVldL?=
 =?utf-8?B?NjAwOXBMNjVYM1pndTZGYWR0MlBCeGpaNHppQTdnQzN0ZHdhemIyNXp0Wmxa?=
 =?utf-8?B?VEVZSklSSFVJdWRHQ2tpMWx6R0VyWVVSM2Rxb2lpN0FQN2hhMitDa3IxL0pP?=
 =?utf-8?B?V2Z0UjllM0ZyVWNzQUw5ZUNWZTdXeGFyTUl1MGpTVDgrNUYzaXM5TTNlN0N3?=
 =?utf-8?B?Vlg4Uit1dXBUVS9CYVVqdHhCajU2MEJ1RmNkYzdzczg3NUpiSUxjaUxQazZV?=
 =?utf-8?B?Z0RVREdJWlVzeWYxRlRZVGRZKy9IWGJNTXExUjBxTmNJTW52NlZyZ2tQc0Vi?=
 =?utf-8?B?T0pmNzg4cDBlQXNmSHMyT0VIZGl0YzVvNG5UeHJUTDU0WnphQ0xtMXZpc2g5?=
 =?utf-8?B?UFl3cjRTbFRFRGxzYVUwSnRvaDFVUEhiUkg3M3NkRGZWbHdUTmJnYTZjdDVQ?=
 =?utf-8?B?QlJtaHZPUTVqTTgxZG1IbFJxOENYZ0trTDc5MTl3QXA1UXRJcVBkQ2hXZUxq?=
 =?utf-8?B?czcrSDRSSmhnMGdHWGdJSkU0a1lqbnVUbyt6M3BqOGYxcXNEcDYxRzZsM0Vo?=
 =?utf-8?B?dDQxYzQ5bmFtaUxmdnBza3ZGK2xtbUtyemhuQ0piWlFWVnlubm94TkZ6dk9n?=
 =?utf-8?B?MVF3WVUxdjFRRTIwdEVNUmxFY1pKSUZQTEl2V3VCeXJPQURjTEJiMkFBTGdr?=
 =?utf-8?B?cGthSFMyWWRVVmhSeGIxUWs1ajVPNkUwUUx6anVTSDBhUzFQdThiTHU5WmUz?=
 =?utf-8?B?NDFYTWFmdm9YL3VkR1VaS2Y2RHBLMUJZQUJBcVE1SHk3dnhSVXlqa0k2OEZG?=
 =?utf-8?B?RkpvWUh1U1dyZmJyTnBqT29ETDNPUmtNUlh3TkZ6K0s0b0hzRVEzOXNlN2NY?=
 =?utf-8?B?cFhSK3JoN3djZ0pla3BCekFqMHFUQ0xiT0QyeUVVOTF2cHA0UWgyVTNQZVJ2?=
 =?utf-8?B?dXA4QXo1aUlHRDJyK0VTS2xMQWxOdTJPZkZyZWdNemRZUGo4Q0V5em92c1FH?=
 =?utf-8?B?SW9UOVp4RjRvNSszVW9qbVdJckJJTkw1cU9zTGs2bHNTdzRrYWxzbExURkhi?=
 =?utf-8?B?TTEzdlpUWFVFZmxLOXo1N2x1VDJJZkFGMzErd1B0YzlXVHJSdS9hcitkeFdF?=
 =?utf-8?B?VUpuNHBzWEtOWmlJcmh0QnYrSTBCNG1SbkdqTUEwWGhlUTVEWDJXMmNoTm9G?=
 =?utf-8?B?dXNHS2tPWVNTZWlWaXdRZ0lkZ0ZqdHpkRGMvK0VlYVJsZ1hpWU90SUZ4M2cx?=
 =?utf-8?B?aEVnZ201by9QUnE1L1NhRUQvb1pPZys3VE1EQjZlRXQxL3F0MFV1MU9IeGRk?=
 =?utf-8?B?dnZBcWtPbndsbmZocHRvYVd2Q05XdFlSaGRxVVJDTkdvSlBpZTc1ejg0MXo4?=
 =?utf-8?B?bmtzUGZXY3ZEQlpndWREMWlxYUtyM0xOeiswOFNZQnBPSndiYXhmQjkyYWN3?=
 =?utf-8?B?cW8wWGFUK295RmowRStncHYrQ2RWc2oyWkRhN0tDMXFRZlVlYndESXJ0c2dl?=
 =?utf-8?B?R08xVlcxaTBESnNxbGR0Z2EraUI4SkM1alF3TS8vbDc4ZEE3RytpNkxxbm5G?=
 =?utf-8?B?dlNNZThYRlpUaHFucVRLYTFGbHRrb0NZNGx1ZFBvYkZyMHNrSlNCSTVXRkRJ?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2368c8-8bc4-47df-d741-08dbfa95e8c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 22:09:56.6894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahbY00DytmGXK8nVU1RGxBMvjK8uoztiHm2PSRipO560a8g8/LWzjlW9TdWYAZ8EIXIWzGhf5QOKXx+O/8wVGiuTbn+QslZebnnzwLKD6ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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
 drivers/gpu/drm/tests/drm_managed_test.c | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 15bd2474440b5..ef5e784afbc6d 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -48,6 +48,34 @@ static void drm_test_managed_run_action(struct kunit *test)
 	KUNIT_EXPECT_GT_MSG(test, ret, 0, "Release action was not called");
 }
 
+/*
+ * The test verifies that the release action is called immediately when
+ * drmm_release_action is called and that it is not called for a second time
+ * when the device is released.
+ */
+static void drm_test_managed_release_action(struct kunit *test)
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
+	drmm_release_action(priv->drm, drm_action, priv);
+	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not called");
+	priv->action_done = false;
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->drm->dev);
+
+	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
+					       msecs_to_jiffies(TEST_TIMEOUT_MS));
+	KUNIT_EXPECT_EQ_MSG(test, ret, 0, "Unexpected release action call during cleanup");
+}
+
 static int drm_managed_test_init(struct kunit *test)
 {
 	struct managed_test_priv *priv;
@@ -76,6 +104,7 @@ static int drm_managed_test_init(struct kunit *test)
 }
 
 static struct kunit_case drm_managed_tests[] = {
+	KUNIT_CASE(drm_test_managed_release_action),
 	KUNIT_CASE(drm_test_managed_run_action),
 	{}
 };
-- 
2.43.0

