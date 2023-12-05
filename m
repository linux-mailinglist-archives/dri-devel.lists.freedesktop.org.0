Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC208043F6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 02:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E7410E45D;
	Tue,  5 Dec 2023 01:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BD010E45E;
 Tue,  5 Dec 2023 01:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701739373; x=1733275373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aRifm0Me2U9O34n/oQ6CPrUSgbLhIJcV5MtRX1vCz74=;
 b=T7wkc/5kmGCc1QZDsbX2CqPnTvpnCaYpRviC+K1A5a5S1d++py1WGXpt
 s29i0QWd4zrUbpQv5A5gA2+3QjcPMi05jxe/E2q5EO7zf1f0DQuaHx8Iv
 rX320gyKfgG5idChgFWRiy+h+N09DNOZklQ13vL/aXW7Ro9T3mYGkYOXN
 XOcSjY+O3byLMMPoUETfuj7YcffOzf0VWJNDMwSVRcCgrHyVyVdMjZzSb
 t3E3bpwiOva2V+Z28c77PvC922q0HBp+pWGTYg8+efWEa1pBNlGKJ7hl0
 c7iLHyJVizhjFkFtxLsXhnS8YsUvj6hIKEpS2zPjjYZhR+WTxCj5HmNfL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458146050"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="458146050"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018040896"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1018040896"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:22:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:22:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:22:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:22:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:22:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1mrqQTcMWCbgqEsGrMI4XeId8fBDo9oaFaGbc48kE+FBArWwh7VQwpegft8+tgB2BJHaabNTPV33X4Lzc+H/qntTakLGC3hDKs8WOmkbgmN/YXzVrOTk6meMiQ1ybsvyaItGAck9iXZ9N0PXFBdiuxRXdQtCuklbrjrRRhEcxbZBzZVIOcvSeodJUwuat4u3hS4V/mfaycRedWtaFiWqlRWNPO5AnDULWaJm/K7S+3ithtIVJFo047FmXuDurvmq1InntHPD8d4cRJFcU320XS14/O81uFsHBbF+NDF+cROMwB42oX9PFWl4aFAKl8Q2Xr/u/LJpEvA/Wctjs1hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1D1n6oGDS7l5jbHFt+IJ4EQ8qlpb/zPM56IAVknpNU=;
 b=hABGpGVg9DIAkPVwVFAIxrCPhb80WDoL3EGY6gc6R1Iu0sq9IYkj1NlTN8222utlI1bCZnBRM60PqcINlHpWulCK6gJAJQg6tKrdm6aE7IiPIOVhFfXPocVjpkUa4+tdMT5rrvr0aFQfaT1TZ7vBH01Rtw1L+TM0yjjImahwTH2cAb9NqrAdv2qz/U5ZIpHK6Aw9GlRs/MpmqUgbGDejCs1qIRjsuGfZb0D9qvBe5B/hKqvp1QyOtLAuSf3Z39y66gSfvec1E7Ex8T4wLycjHCWyZ5a9KN12trtf/pbhS3qT38+BUt1Gimh9T8t6hItTruHLxD8u3xac5YSLTmCImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:22:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:22:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] drm/tests: managed: Add a simple test for
 drmm_managed_release
Date: Tue, 5 Dec 2023 02:22:10 +0100
Message-ID: <20231205012210.1491532-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205012210.1491532-1-michal.winiarski@intel.com>
References: <20231205012210.1491532-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c54863-bea7-426b-e709-08dbf530b186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2q5ZPRgVk3sq4iNySsObK5bgo4ettvskfnyrQIi0EknTYI4d5ZnPSRkEkU+0A0yXDdrtUEIvhi+kSOIKhTQrzSw8A2VELvDE3ApuxQXPFAYPQ6nheVYGmwlg4qzUT+D6iid10rEhoM67+2aCiDT/4EYHizuRworW8nhVriFuvnoB/J/x7Xq98G4EbxlCKYKtJ/UAXH7j3F9EPAl13UiBvcH52tiL0Q+BHVtyiFDa37IKFysz4Q61bFpNICuoTgYtWh4DEO7azzYNYW2OY7IMMmv+At/ARJmxPjp4ne357a7Pkjsqj1ueUO2p54pPu22oVd01uCn3oplLlh4bmZTSq4RW1Bm9CaRV7dEMksYoEiA9utbUI4YGlrHN/cbyaVkLC0HC6oZbGc8IsYqrEjjVMTHWJZcboRKRSI8rIsn7zccAHGx7lKW35/fcRUFep/KKSSnSHS9uPOGI70KOu7faMjW7jMzrpUGn2TAQSqUnqfogaxTodl1pMppMgi+iCvCyONjJPd2l89m3gOCt/OXtUIdV42CVw2Q0Li7hVK11WzhRZrKy6snHRXdUPuCo5wZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(7416002)(41300700001)(6512007)(36756003)(1076003)(6506007)(2616005)(82960400001)(6666004)(6486002)(478600001)(26005)(38100700002)(316002)(54906003)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUYzMkxURStxM3R0RUhhcGFXUXFOZE5LMXV2bG1Hc1pUY1lHeDJtREt0Qkkr?=
 =?utf-8?B?bUprS3poMGx5ODN2Z1ZnbmpBbGpXYklUR0d2TWxPcjc2WWtsWUlacG9ub0RS?=
 =?utf-8?B?T2JKKzFYOE9FRDd0ckw1ZTlXYXF2TzFzQXFWUGxiWG1SYW9DQ0U0QUFubVky?=
 =?utf-8?B?dVlwZFVRdm5aV2RwNWRQdWJESXNPWWZlaWxYandpck1lRGI5ZWN2OExVSHZM?=
 =?utf-8?B?NzIrcEgxRy8zKzBkcDFVVU9NNnVnSTlCRHlNWi9ldU1mYmMreE5YcUJNYnB2?=
 =?utf-8?B?NG1vOGM3eG9YSEVmS3hBWGNJQTJrRE5NRWM4YzgyVjBHNTBYeEJoemFwNVJH?=
 =?utf-8?B?bWlFcUJCWlZkTUxlVFBwSlh5TVorZkJYZmxOYmdiNDRsVVZ4bXpzVHdiMWQw?=
 =?utf-8?B?am93QnUvZStiblBFUjVXQjJZU0xWNjJ1dGhhQlNudVgweEgwWGpXNWlvQkls?=
 =?utf-8?B?MktQamRrdkdmNnA4SjFneW1ZZW84bkVWOVBzRXBQUjRJcXNWWHNVR0E5Znlw?=
 =?utf-8?B?dHc1T0cvaDlMakowYTVSN09GcmVjQ3pFTE5ScWtTVHNENC9SYjdJYzVmQnEx?=
 =?utf-8?B?ZnpxZjVkVFFLR1I0cmNxTGlVWU1HWmI0QW91RlR4OGMvdVgyeEpxbXE5bGwz?=
 =?utf-8?B?dVRhTnUyN3FuNnFhSmx6WDBzL3lGSGZqa2ZwaG9rQ3hKK2RuMWlzOWZkcWxZ?=
 =?utf-8?B?UHhNUGJmT1BqNENydURwbFVnTEtxa2dIekRBM1lCSFdSWFZ0dHJEM252cXBy?=
 =?utf-8?B?blgyWUg2c05wYWlSS0pPWGc5c0Q4UU1sclowUWJRbXJYNXJZWXBQQmhoNlA1?=
 =?utf-8?B?RXBGVFd2V2IvZ3JDRDRWaWlTVVdYNHExWVU0Z20ycDdESGRVMEErY0o2M1lE?=
 =?utf-8?B?RkRDdnE1V1ZZaSsrRGJxd0ZHMm14MG9PT3RzUnZCQU5sS0txbkwzV21vTnVW?=
 =?utf-8?B?L25GZUphMmN3bWlYeEFwQkc3MEpQamxVRHdQYy82NDFSMHBsRVE1ZHBSbXRT?=
 =?utf-8?B?VFNSWTJTR1ZZRGxXZmdFTE11YStwWEF5MEpCcS9mbERNSjJOOFdVK2EvbjdD?=
 =?utf-8?B?YjlyOFhuNDdnRTFtNFhlVXN6b1pWKzFHNzZTVzV0SjJ5VkpJSGxwQUxOeERh?=
 =?utf-8?B?SlJKM3RsRUVWZUNIUkJDenoxNUdRWXRVTTNGcEZzN1pSWHowd1U5cEtBQWFs?=
 =?utf-8?B?TERPUEt3QjU2d0xwdXgrZGJGK2RIM1VJSXRXbnlkSit6SXkyLzl5c0J6bUs0?=
 =?utf-8?B?TEVVbnFMdkFLN1pNRFd6eTdsOTk3djZ3RzZRTFgxa2xXb0NvTkZlc2pXckN4?=
 =?utf-8?B?WTFNNXQ3RVVvcUl5Sisyc3hXaC81aW5ORnBmT0ZYeEZRZnRoN0VLTWd5YU5o?=
 =?utf-8?B?ZnNIQzdDakdQeFp6VkdTYWNlTElYa1oyejlCM0JyVXJ3YzBUcEZKeEY0ZE9M?=
 =?utf-8?B?WGRYRmdsRFFDVm1SbG5XTkZ4dnBXdFMxcVpXdVV3dDlDb21JcTVFR3Jyak9Q?=
 =?utf-8?B?K1BaMmFyVDgzTU52SXk0K2JuSExHUlQ5d2Z4N0dFdjQvMklGYVpIR0tlVmI5?=
 =?utf-8?B?cHRnc2ZUNm84b1dTbUhzMFF5bjNLTGI3bnFpM2VNS2l2UmNyNUhIMlNiaGgw?=
 =?utf-8?B?dFlQdEErTTRQcklQdUFLWkl3ODlaUXdvcjR2RlFlc1FibWdqdTk4Q0hFMXdZ?=
 =?utf-8?B?dGpmV2xNVFhQeWkwdUZtZHc0NzUvT0YzUlRYZmFTdGpxdk5oNUMyT1F2VG0r?=
 =?utf-8?B?eVF4TXgxd3pldlduVlY5bkNoQS9IU1BmcURsWlR2UFZKUjVpV0dvdGQ3enpH?=
 =?utf-8?B?ZmtUM1M4VUJMdngvVDV6SjRnZVRZaGRWY3kvdmlzRHNKVEthZjVvYWI4RUxl?=
 =?utf-8?B?aHZXMUxuVXlFTy9wdk1Gbnp1bCtJNlF0WnNuMnVhZS9ybEprMmdtVURLTysz?=
 =?utf-8?B?VlhtODlUa1RvTlMxQ25kbVgrcFpmRS9zYXFuTFozeWkyTlJQSnlWRE1YSGJK?=
 =?utf-8?B?ZHQ0ZE1HNDAwRFFXV01OUFRxUDJteUVkWEN6UEhLdkJuSmhKMXcvRmc3ZHdq?=
 =?utf-8?B?ck81Sll3RGVSLzNwM25NeVBVTFp4NlNRK1RhTmw1QnJkWS9hZkc4cnJDL3ph?=
 =?utf-8?B?RVFpWkYvUXFnenFOMHNqTXdEOVltcnJ1UG5wdlZCUTZZQ2h3UzZjd3lLelJS?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c54863-bea7-426b-e709-08dbf530b186
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:22:49.0966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPnLs9LdKvrfZ8a4qa0Ub3JCNZ3PyW6Gq1ZiXntJlrCMXZA+VIR9FlOrwIBYF8cAeOgTiEXCoWKhbuG04LaoZF4zSxeWHyyB1frvIdc3HVQ=
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

Add a simple test that checks whether the action is indeed called right
away and that it is not called on the final drm_dev_put().

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index cabe6360aef71..8dfbea21c35c5 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -44,6 +44,29 @@ static void drm_test_managed_run_action(struct kunit *test)
 	KUNIT_EXPECT_GT(test, ret, 0);
 }
 
+static void drm_test_managed_release_action(struct kunit *test)
+{
+	struct managed_test_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_add_action_or_reset(&priv->drm, drm_action, priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_dev_register(&priv->drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drmm_release_action(&priv->drm, drm_action, priv);
+	KUNIT_EXPECT_TRUE(test, priv->action_done);
+	priv->action_done = false;
+
+	drm_dev_unregister(&priv->drm);
+	drm_kunit_helper_free_device(test, priv->drm.dev);
+
+	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
+					       msecs_to_jiffies(TEST_TIMEOUT_MS));
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
 static int drm_managed_test_init(struct kunit *test)
 {
 	struct managed_test_priv *priv;
@@ -65,6 +88,7 @@ static int drm_managed_test_init(struct kunit *test)
 
 static struct kunit_case drm_managed_tests[] = {
 	KUNIT_CASE(drm_test_managed_run_action),
+	KUNIT_CASE(drm_test_managed_release_action),
 	{}
 };
 
-- 
2.43.0

