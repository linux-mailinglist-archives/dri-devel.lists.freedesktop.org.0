Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A9E82DE43
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C031810E353;
	Mon, 15 Jan 2024 17:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602EA10E34F;
 Mon, 15 Jan 2024 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705338860; x=1736874860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8Dh8wTx4iSOMWjRrki215AMLxAvFo/rjwYyFI7+uuvg=;
 b=cnWXZbWQWfyNmR7VjGVlbo5nfx344kobaGkH0UyL9Nq1v4N0X7zKIdGk
 22uIrsSbq2rdJRyisT0wsEucE5+c6VntVN7wAB4lmTYy1fVGVEsv5p68m
 P8Y6EVxoqASKn61MtKtNZStHnBFKea0TWv5nz+ofk5diejx+yfZu1asco
 24PkovbH49CllBBmuNj9w32d7A+AowmHKThxv5Q3ciFqmGWY4JaJgfmwp
 eU1WBmUXpy81r26dR5Pp2vXvcgavCAJH17jmoJk0iWp8V+mz1PJPrUmPO
 //ZVHIPa01oH+yhn0c1TAnMuOASFBYCiVz/cwARXFQ9suvXWN3ZP0wFBZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="21139058"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="21139058"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 09:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="854063866"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="854063866"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 09:14:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 09:14:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeoA4CDSHt5/8V7xW/1AZHR7S3OPW1fqhtHppcExyZ118WuBB/THogGqlkCDSJFZgzb5A3PeqzqNbBHoa5fM/+ePA2XNPOFIpDpYM1e7neKHdIYRoCfNuM0C/boIzPHVCV6fvIq05EyaW3vwPU2N3DMeqRYO4xhPRrJg+r87iQFb/mSbqZRVsCVks2c90P3t5kxqym8vena8C2yeXIcH4GCZ2FENh7vKO9gNU4GxJDKFfSHlwI8Jiki8Wcu+QL8yzq2KGSu+TYirwJUaCzZj2pVi/vqyGyjHe3of7QgbJZCbSLtYQvKBku5pgMnO3ZuofjCZXFVpvhGkYNMIYHajgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTT7RD8ggPmqsumV0FqAc1SmuGLprf292fW+WgMvISc=;
 b=G4TikFw5KJUz33L3tmgfSnfvxd9nSfMeqlkC7kG41f6LFtysq5Z0ZXYxGrCZAZIAmzylkUIik3aWb1kXGZ1mKA/68LraCUBuuZm4l48sqijkb7uB1WUk0SS+4sXYbzXDro6Lir+K5lUUzWDumyV/YzFaytcFh3Ea+hEAf6L0FprleKSXOsGKN56tj63GOQLKFw3CznjahhKFfkPJgTTws85p9sRTwguX8ICMbw56C2VF9AiszNqWUPHN6K1XPR+3ekzACT9FuNwAcdNlXQtbVqvgDGuhKvbijj+pqEcyA/XX/Mn3cgvRB41v5pk1q1ZJjrB4yYXJ1tuHYC2lqtSO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Mon, 15 Jan 2024 17:14:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:14:17 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/5] drm/tests: managed: Extract device initialization into
 test init
Date: Mon, 15 Jan 2024 18:13:50 +0100
Message-ID: <20240115171351.504264-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115171351.504264-1-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: e961c0ef-03c0-4849-f8cc-08dc15ed67ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FSZy1hIdnSzpiMI0JI5hfL7PNiRfkoKgbkJHgratIFg6YhwtHvASugSZbBQJENdFoNdTdSFJPG61ALwyRIesJ9YwTEG3NLOZzBHEQORouthVirQ318B4pJU08K8vbS3OyBEF5XaFvmTH/gzcnHQ/qHXvlWFo0DZ8RIbpQ48RJ/Wbn81RXXmqcPlDBJRQBSgVHP0AF0MqbIMxIeWr72Kdi8EBqpLUAohIwgU936WAVB2AYf1s5avpXPXJ+Jy1jTPR5+ET3Tau9r+rLWukM2BVGA4edIM1Mw1zSHiSOig7DiHBFBe+7stjxhDdgMUQf02BVJqfsa0qb+dr4BouzHhx/hzQq0rGcz2flEB7AbHZsbdjBgCrX3yf0GCBrkm16XyvrGb0tf33NILXq3wBbl5zk1o3N0VVwZPTmxo13eCYfBBxzUheoIAafaY8K9MeJKHCGTY2N8/tP5caON20VJoc0D+vgllBh+5ouLfUlXXZw1FdotR4zlxw73AZHjFl9MA3rwxxyBwsZCYn01hCPTo0LgLc7y8TMkudHGgEjdsSC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(6506007)(1076003)(6666004)(2616005)(478600001)(82960400001)(66476007)(86362001)(316002)(6486002)(83380400001)(66556008)(26005)(54906003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(7416002)(38100700002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWx2RmtUeFlKY3NzTzh6YXJpTUZ1YU1nQjZpQUZVaGZjUVpTZGtmOVV3Y1gz?=
 =?utf-8?B?WDVkdGJiZFUrMllXSnpqUFpseHA1WWQzeWZXVFlmZy9VZ1JSM2JFdnU4NW05?=
 =?utf-8?B?byt3czRPQnU0TlgxVUxSY2JGZXlqQ3Y2VzEweXNDdjRPdjhHT3hyaUVmOXhi?=
 =?utf-8?B?WTRZRjFVL2wyYWxKUTNzVTVYeFVrOGsrOVQzN2NWYlhQcG5xSGhXcE02UEtU?=
 =?utf-8?B?dHVDbmNIL2NiUGIyUXM2VWp3RExtM3VocVVMVTg4OGlCRTJjeDNaSVFRZ2l6?=
 =?utf-8?B?SVdhTmFldmNmdkRZVHoxSG8zanFNb2xJbXNvbWpCUzlZQzRpcWpFcjF3dytS?=
 =?utf-8?B?bVRoZmVLR1NTN1RSaGdLOFF0U3JVWk5ab0duQUVIZVZZMGtEVGJLQkdyNVBh?=
 =?utf-8?B?cDc0eTBkMldLcW9HakViWWZxT0FPRzZxTVpOTDhNL0t6VmlLMENubklYUUFC?=
 =?utf-8?B?a0J4RUs4Rm43WmxiS1NsYUVxNnRSTFZ5RlNFMmZPVGlQbWgzN2lCUHk1cEYv?=
 =?utf-8?B?dHZNRUQ2U0hubGU4NUtmM1A4TGN6cFZ3bkE3aUF5bWx6enhYN2NtcFU4K2Ni?=
 =?utf-8?B?OERseTdPQmFENllKNFpOYnVCaFZQYzlyUm1BWEw4UVY5cTZxNzM4YnJkSDJh?=
 =?utf-8?B?WE1mc1hIb25peWcySGlNbW9nTXRtakFOKzlTTk92YXR2WmVjLytxWkQ0K1Jp?=
 =?utf-8?B?anVpa1hvemtwUGRteGhLc2ZwdUJXZHNySksxbHVtOStZNW9SaXFFeXFGL3J4?=
 =?utf-8?B?M0ZURm5wUDlwSk1hZnRaT0NXQ3AyeXQxb2tBNzg4UTVGaWtUNDcxY0VnbnFC?=
 =?utf-8?B?SExvSVdjZzZsZDl1N09DL0d1aXRMREd3L2Q1YStyVkliYlNJQ2phWkdmK3lN?=
 =?utf-8?B?eDAvNDdYbDdPNXRIS1g4clR6OHJFSHI1R25KcXZ3YUNncXJGaEJuTWhYbGVz?=
 =?utf-8?B?Sm0rZlJHbGlWeEI2Q25WQ3FsdnpTZ1pWZGZWSGIzTjQ5SnZxRlJDMUo5Zndn?=
 =?utf-8?B?TFUzbnkvMTlSSHoydEVwNFIzTnVGQlZGSVhzUTcrUmlXV21KUUR2SUtNeFR5?=
 =?utf-8?B?bHZvVWlQdE5xeTg4TWIxMjVyVVcyZlNTZWVaM3YvdWhCUWxia1hMM2orUFRM?=
 =?utf-8?B?L3lib2w3K2VVUGFIOTBCWSs2RWlNMkxqbGtjL01aWk82OXl1N2UwUzFyUGxF?=
 =?utf-8?B?bTlUVUdESHN0amdhK1B0azh2eVM4OUhIM2RNTDV5aDgwWHcxeWJXdmtmKzcw?=
 =?utf-8?B?dWc1ZWhYUnpIN3dBMkpSZUphU2k4dEZibW1XRjJKck1WWW9qalBxZFhCYUJ3?=
 =?utf-8?B?NVpmLzBTOWVoT0VmRFZVWlBBV05ycHFYWExmSWlMem9kZWJKOXdHRjdNQlgx?=
 =?utf-8?B?UTlyeDRBL2xxTlBHKzlLOTJtTnV6Vkp4SXZMZFpIVGNIRTZUWEJjVTFEcFNv?=
 =?utf-8?B?bzdzTVY3RUFvT3JLemhidnFpU1lTQkl6SXdpcDBxZEg2clAzM0d5T0RidHZD?=
 =?utf-8?B?V0tKdWpmMStaa2V2QVhabFphR3VaajJ5allJQjkxbGpEN3ZSNXEyMXlOSmg0?=
 =?utf-8?B?M1EvREFlUHlHQlBpN0lDM2MrbjlKYU04ck5vczV1WVlKVHBBOTZRWXk4cnBx?=
 =?utf-8?B?ZC96Zks0UG9HMEZ6cDhhakY2TWx5Qzg0REdoVEVDeXBKdVBPK3RHM0dNUzFC?=
 =?utf-8?B?VzdacFpHb3JuMFJPdTArR0dWZ0VFOXloZE1ib21zWW9WeVVlMTh4bXo4L0ZN?=
 =?utf-8?B?anFIeGdLQk9aSFdmemEwR21saC9UdTR6UE1iYVVVTi9OWlpJeFdZN2tVSXd0?=
 =?utf-8?B?RSswS0l2dkZZa0dJNHBMYUdHOHExZjhwbWs0NWVsOUFsWWxidkdPZ2FYZEdp?=
 =?utf-8?B?OC9CL3hPbTFSNE1qNFl6bHZYbDBnSGpONkVwTjRDeHR0NHExcE9GSFhxMm1y?=
 =?utf-8?B?WTBkazBMSXYxZ1lEYloydnpPcVVrcWUxQVh2TVlCMFpDVmsvUENWZTllYzhF?=
 =?utf-8?B?OWw1cmw5Qmo3a1oxNFVXcHVtUm1WSkhpbTVLb1dRTzR5K2hscy9WV3M3WTBW?=
 =?utf-8?B?anRKdXlsWUw4d3M0SW1NWnBlYUtLT3hmdm5acU1oZzBhTGNFL052Qy9DbzJV?=
 =?utf-8?B?WEJvbHdXbkF4NTcyaTZRTGtMOGdFcHNSMUhTdTdGTkFpQ1dDMlZDTUtrakk1?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e961c0ef-03c0-4849-f8cc-08dc15ed67ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:14:17.5568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3TPc91/AQ9BU1FRnZuXiiGL7AsVaQ60PYJd9jZbLqVFlH1rBkyptd+CizSmVNzyac5+mH/+gfVyN7+V17WxD18ldfjD3wVCwv/GONcxLnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It simplifies the process of extending the test suite with additional
test cases without unnecessary duplication.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 41 +++++++++++++++---------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index b5cf46d9f5cf8..d936c879a4a30 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -12,6 +12,7 @@
 #define TEST_TIMEOUT_MS	100
 
 struct managed_test_priv {
+	struct drm_device *drm;
 	bool action_done;
 	wait_queue_head_t action_wq;
 };
@@ -29,11 +30,28 @@ static void drm_action(struct drm_device *drm, void *ptr)
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
+	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
+					       msecs_to_jiffies(TEST_TIMEOUT_MS));
+	KUNIT_EXPECT_GT(test, ret, 0);
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
@@ -47,21 +65,13 @@ static void drm_test_managed_run_action(struct kunit *test)
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
-	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
-					       msecs_to_jiffies(TEST_TIMEOUT_MS));
-	KUNIT_EXPECT_GT(test, ret, 0);
+	return 0;
 }
 
 static struct kunit_case drm_managed_tests[] = {
@@ -71,6 +81,7 @@ static struct kunit_case drm_managed_tests[] = {
 
 static struct kunit_suite drm_managed_test_suite = {
 	.name = "drm_managed",
+	.init = drm_managed_test_init,
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

