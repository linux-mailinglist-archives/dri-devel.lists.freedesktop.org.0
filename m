Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71980DE05
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 23:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C2C10E51F;
	Mon, 11 Dec 2023 22:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E9B10E51B;
 Mon, 11 Dec 2023 22:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702332598; x=1733868598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/ymKimFLSiDeo/NVNz3x/mTKycmLWMpbqiCB7S8EMV4=;
 b=nQ9GdlqSNENy44DXGszQFxQUs3zVsiotGlcV0k6h+71ay2t5CsE26cEt
 fRAt9PbAZmAOMde8Fe08NXnVBaZLtXG4hePV71EeqocplC/QBOhyUilxK
 DjRVrNEZytXXI3MXYPnK8+7Tk7Q/3cmxiEvR9vaQP/so9NOFMCGPH4/7T
 gaaCSEFuIJeXC0DfUPUfGH0Z7CDBmdLZpN2mrb426fgzDM+ZIGvEIFold
 +ibNq/rMAoK/HQWwxpuqPd3R1DyihWUi4VVbALoFjOqrvpGnRuj256aqR
 kxQ5aF2fifaOBnJ5y8Y1J3n7MyH4+BmlAS+tL8uWdOrVrUkhqCejvT2uZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1865670"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1865670"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 14:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="776826861"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="776826861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 14:09:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:09:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 14:09:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 14:09:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ/nY9hnunXtpr8ubuVx9bVJuIi9WawXztpr+5UfYBSZeurAuESDT6c2rz+nFWFiLdCHrG0BJ/spsmiJ+6GP1TPWBQ7k0nMYW424RAJKipEbWThbZLBrL4B4UJ3cW0FBt63tRiTBcxyNNiUXsmHealOaNGBlzS8uLHIHtVzGGvUlK68ruUGU/qStPux8ejSaWa/kiTwteqolBCzZBfbPO3u9Q/PrQ84hOdnKiFeZ12osnHmirIy0fsU8i4Hu7s1UlSlv2uWxtVA+vlVUdVEFrSgmrxFsWTp2uc5vDocqIVVWFJ6VCEb1pijoNNDpJuYq0e1k0pBf3dKC69aZ03RQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIOvHiNhB1GGERAGve4YMpEIaydyZIfnAdB2dNv3AxQ=;
 b=Lf9Sj3f8dl2VJmEGz02T+dHWn9VjQYQfmo8okE8i5yGj51xlYjlXSxRiVlE14QHh1h6lu2giuVGnz/qB88gf/WYtqteZEr3fNeLlNpwgzkfqN8Psjma3xeikV6gapDGQJsuF5FdQLLL8nD7V0gx/dzjxViDFLBMfuU/6VKwweD493zpy2zTXygfUo/W1BJWsXeyZ+r1lVV+pbcmlpUd0sUye9PPMDnDeXqUvBm9hJYCSAeOVjq4JFFwkLDzDfAFqM7cwpQWVfe8qcUEu2E/VDXdpMIcoEGveiKG+0KtdoXciT5R7a1JvlJ0mYxJfoYV9coqt2EmhG0/mJh82Do6xtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 22:09:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 22:09:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] drm/tests: managed: Extract device initialization into
 test init
Date: Mon, 11 Dec 2023 23:09:38 +0100
Message-ID: <20231211220939.215024-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220939.215024-1-michal.winiarski@intel.com>
References: <20231211220939.215024-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: e981944c-6e56-45c4-ff60-08dbfa95e6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7uWAfarzlT3S+r/04m6MoQ2mhzGCFa9SoqfR897pWTdwjfnn8PRYqnLL9knPbqyG9pg6ODbg82osRRuxDtbkcNsghScf70dKIQBrYNjFHibRv7jzkj91TadyjODzuoAriopivLoyDBRR9G9+Rmf1E1FUiEaxh8HsuFVUvE4XON2AliAM1o2N5i1dNoWvSX/Ot9cXqQciJDLKGBbCnv0X91mFYwi8sv/vFQImKYl8rMZR0pirVIBfc38M3kvwRXHznrQd3RuRTWfBBUCwFdH93k2ABRgp0poJ1tM5M79kBSTih+8VbridGA6LBiiXfIkL9UW91vbMXQBBOBiwcrmvg4oSvJqhShbvzHbcygHnof4MyG0IUU3SN3Hq78WZ1Zo2qpJUpBMeJSauNKRRNzmFiV1Ms1/kR6gTGyaiWjKHDQpyFrgB+pb28jJIwn+D34f/V2K8KmGk6EUUQceZsPO64Q3mX0iQSaiTjy5z412dkhVdtZ6SrzAORvHfNXdtJYUrFjuJI4cgKiAJxbY2xw0AB8QWcwP9EkhTh8yPe51Z3JfMv+2mubpcfc1j/DVdsRWd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(1076003)(26005)(83380400001)(2616005)(82960400001)(86362001)(36756003)(38100700002)(5660300002)(316002)(8936002)(8676002)(4326008)(2906002)(7416002)(6666004)(6512007)(6506007)(66476007)(54906003)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTlQRTlncmxWL2RqNFBFNUpvWUpaaldUSG9TT0RzTWN6T0tPK2dyek1SV2Y3?=
 =?utf-8?B?Q2F1eGRFcEprZ05rYmVKSUNKcWZEK0kvS2ZJL1dhbTluQ1ZMTEsxUXVvdzJT?=
 =?utf-8?B?TkhraElpTzd1dExBSDNSODMxYnJiODArRG9YSFV6UUhnV0pNTjE2cVZTYzFw?=
 =?utf-8?B?RzJkenB2R1lwMU1OK0RrNlBXVm9kZytJQlU2TXBRREE5cWpkRlU0U0pndnRr?=
 =?utf-8?B?bjk2eDNzWUlRKzJrTlBCUTBmTUJBdEpqeWZKYlpsQzNOTGcyNEZ6Z2xLTXpS?=
 =?utf-8?B?TEFackhIZ3FvaGhNeHN3TnlTTEYvRzNleW04UUp3clkxUDJhL2hnaFcrRFVO?=
 =?utf-8?B?emtoWTdwV2VVdmYwRlNKbTFPN1BiWHI0b2hvekpIQUpOM3NYQVJ3bUh3Qlp1?=
 =?utf-8?B?TjJIWmtON211aGNxdWl1b0RURkdpVnlKUEZUK2RTd255WmlFdGlOWXMvQUtY?=
 =?utf-8?B?ZmJHMEFBSFQ5RWVyTGJCNGwwMDFJQU02eXlSZGZFc3NuMmZSWk5xQ1FtYlRV?=
 =?utf-8?B?Q0RDa3lNdzJKNEp2UWNkakh1S2NPcHNKZDZyU0hBcDFvOVpqMEM4b2EwMXdn?=
 =?utf-8?B?QWNqQVcyekJIV2o3NjcxTWo5dEpDT2dsZTNBV0dEb0o3YnRUSk5sVUhRQkVj?=
 =?utf-8?B?aFBFaDVNN3B2UFJqdndBZ3RlUlBCa2oxUVhZZi9XYmRwTmxiNUlnV0tJMy94?=
 =?utf-8?B?MDNwME5oUHRzczFTVjJpVE1GWlVmelJRTVBtMkhseGtPeXA0dVdxTDVnTTho?=
 =?utf-8?B?ekovWm03ZitUci84MjlGSWh3aCtncUpIZEVMTGt2SlhQSmFnVk5BNm53TTBk?=
 =?utf-8?B?ZkNEbTlVYkEzdENEN0hzaW1HWTJnc0k1bDV1dkU1aG5ka0o2Vy96K3NoT2R6?=
 =?utf-8?B?RkFWUVVCZkg5WTRxa1ZVR3hwMmc3cGhyM2JLSjQ0Q1ZQTVdvdW05UzhodW0z?=
 =?utf-8?B?Q01ubHBIaVlsVXU2ZnpmdjFKNnNxc1owaDhPTnhhZjVFOEN3Umc0VEs4Sm02?=
 =?utf-8?B?em0rd3JYbnJOZks0YzVZb3JmaGFVeUJPdkw0OGpscTVOMlY2ZUNIL2VNd0dz?=
 =?utf-8?B?M3Q1SmNXdGJuL0xEYkdOUTNVc0hqeEE3d2xJTFdrbHkvV0dhODB5TEtSVisy?=
 =?utf-8?B?aHVDNkxaTDJBa21Eci9KMTY3RVpBeVZQbkRJOUtyVGh6VzdGenNrWFJwU3ZJ?=
 =?utf-8?B?VHNoWGR6aE9aUHEwN20yclp1dmRxSW1pWjF0djFuUHRUSnMvcTJ2RTFFMXYr?=
 =?utf-8?B?Sy9Ub1RheWVET0dRSG02RTF6eENkTG1nZ3dtV3NtUUtTcVhpajkwSTNQYWZL?=
 =?utf-8?B?SGN4dlc1N1h3ampudzFDU29mbUdPbS92amZDUnpnckpGQzJReDkzWURSME5w?=
 =?utf-8?B?aFhPNjh5RkRTdDRTY3J0T0prbTJ2RXhFRzQxemhQbWtlYklFRjhCWGI2cnRl?=
 =?utf-8?B?TlNsUTVEV0lLUlQxZHlPWjUwNGt2UkVvTnpKNFMrNzNvYmY4ZDlJakRUbXhu?=
 =?utf-8?B?Q0Vsak1ySjZJNlFrSGpBQkhEMnp1Tnk0b0ZFYjgvdmkxNDdJcmhZa1V3R091?=
 =?utf-8?B?K2ZZRjRHK2RTNGNWMG9TUlp5UG9UYWM1cjNTQk1XRHpFT3VoakthV09BLzJ5?=
 =?utf-8?B?R0hrWTlqd2M4bTJpbmxzZXVkMllWaE83NWxVaGI3V2plVjRCNHhneHBOVzht?=
 =?utf-8?B?em54RjlHcGF2S0RxUTAvZmx3TzE4ekZaR3hYWXVxSUJHcG5wY0h5U3Q4eWlO?=
 =?utf-8?B?MStwc3VDNThYdnhsZTJXNGdDNjBybmdTd3hwZ3AvNlhmUVk2elR4ZjExbUpL?=
 =?utf-8?B?L3JUNnVEMkVtd2NFNkxQQ245MEFQVTgybUtLM0duSXIySTVHUTFrYnJSQVZ4?=
 =?utf-8?B?cjFaekgvais1QjNOK3AxQnNwN1d1T1l6YmlRQWFRKzJ4S21tbDkxc3cwS3pW?=
 =?utf-8?B?WDg1RkJETUxkbzJ5ZDkvbGkzU3J3eTJsOTduSWNHbHgyamkzck9NbXQwRUl0?=
 =?utf-8?B?U3lkQWFnQ2tDMTVpMWsvY0NsemZHNnhUMHBEcmRiS1FDM1Q3L0p4aHBuSWc1?=
 =?utf-8?B?azVoTC9Tc0ZlZnBGZEp3NEw0ZVptcEJTSE13VjZXdjQ4bjF0WVVWUDRwN3VM?=
 =?utf-8?B?bDBSQlZqNWNoc1A0QkcwWlA3VlMwTXpzNkI5T3UrbzZZVnBWNnZVU1RnUVJ4?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e981944c-6e56-45c4-ff60-08dbfa95e6ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 22:09:53.1685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz27213IHC/FUoaZn7qkFuf1FvZNassZft3qMa/OMmnfuz9I2GU29Zi5BkjFHK1wMzU5JepUjbSI4NOVIgL1uGf64P/2H0voVWqu1r62giE=
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

It simplifies the process of extending the test suite with additional
test cases without unnecessary duplication.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 51 +++++++++++++++++-------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 1652dca11d30c..15bd2474440b5 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -12,6 +12,7 @@
 #define TEST_TIMEOUT_MS	100
 
 struct managed_test_priv {
+	struct drm_device *drm;
 	bool action_done;
 	wait_queue_head_t action_wq;
 };
@@ -24,35 +25,54 @@ static void drm_action(struct drm_device *drm, void *ptr)
 	wake_up_interruptible(&priv->action_wq);
 }
 
+/*
+ * The test verifies that the release action is called automatically when the
+ * device is released.
+ */
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
+	KUNIT_EXPECT_GT_MSG(test, ret, 0, "Release action was not called");
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
-	init_waitqueue_head(&priv->action_wq);
 
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
-	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+	/*
+	 * DRM device can't be embedded in priv, since priv->action_done needs
+	 * to remain allocated beyond both parent device and drm_device
+	 * lifetime.
+	 */
+	priv->drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*priv->drm), 0,
+							DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
-	ret = drmm_add_action_or_reset(drm, drm_action, priv);
-	KUNIT_EXPECT_EQ(test, ret, 0);
-
-	ret = drm_dev_register(drm, 0);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	init_waitqueue_head(&priv->action_wq);
 
-	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, dev);
+	test->priv = priv;
 
-	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
-					       msecs_to_jiffies(TEST_TIMEOUT_MS));
-	KUNIT_EXPECT_GT(test, ret, 0);
+	return 0;
 }
 
 static struct kunit_case drm_managed_tests[] = {
@@ -62,6 +82,7 @@ static struct kunit_case drm_managed_tests[] = {
 
 static struct kunit_suite drm_managed_test_suite = {
 	.name = "drm-test-managed",
+	.init = drm_managed_test_init,
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

