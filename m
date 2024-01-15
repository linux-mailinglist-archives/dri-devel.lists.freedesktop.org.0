Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57C82DE42
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D110E056;
	Mon, 15 Jan 2024 17:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E613110E056;
 Mon, 15 Jan 2024 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705338858; x=1736874858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l5jgVpTX7BgM1wV0yfftev5dmoEkscpbjIvJLex704s=;
 b=gBlkkAi0WCvhkAWMenE674IE7ZRv9tznp9tZ7aOwjTOZ+WWf7CnVoMnj
 /7q6ajcc3N3ditJz3K6hdxEtLThn43/uHQ6A0AclEHzn+yF3uEwWe/Un6
 w5OxcnIz44sI5XGYwyn8w0akAKN98IJrlcdSW6TLEXTtFNnvcqs90uPo9
 YFFh2skmTx8jow5E8YZRwEXjo+uGLzqaiBLKNy3MxCWJ1nms1I5NtXIOQ
 La7vPRi9ua6CCKLobNs3BLly3jqZZqdrfz49U7pbtwmWHxJyDjLmRZ5f2
 2tukDJSAXUhBYgHV10ALpg9jpcjsjZpfZmk6Ht24h2c8Af/317MTXY1ZV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="21139050"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="21139050"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 09:14:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="854063853"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="854063853"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 09:14:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 09:14:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3SAmul7HmyKTzpnDG0mWEI9tmoxyxM9TzoII0ltO3IVk5TyOWk+Ijus0HwwmifJsLH893LZO+LSQHMSwUd0HpPbKkGMk0tUiyuyej3CEvauraTdEEOAQZsEeTgI+mS89Y2x4VQNtIRASB5++s/nDlagKaA+AwZRYuELcd3IUWuYDhascrgYzv7YW6m/+FRWcdsgiK1629DOfk2WZ5aao30CxD5Dhw2x2BJg4YL54/wcV0AKc/S/Tz9VBAfY23Mlsp5To1fr3nX/LGrWsWvYjysx2K6jeQN6Vf8+T796+WFZI5/MeB8FLCLpu8DeQ0ONA/ur8HqChcSSDFKTmbuqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKmUpEHsTAA5LmPQv0vhb4Dg/mkUpxJtyPu13qA2vcs=;
 b=QMKAPeiNVQ8a1mjuR3vjGx9YzH+ciWano6VcywvBJA69s7zu8LbXecndsz+A9rGwr1o12nltaODalUsWrk4lHrBAnF0l/fgfkt/NSo7wKdcSSgskkergrbLVh5Fwq3lxaqCVxxZOOA/U1PcAjolOyTUJgh3wmjINNhOuNtAYV2d/eJayBr4DQ57QDbMO/P7s4leHb7U3EuQyZEswofOLmlF6FoAI/3wCKEVmYuzt/s6jO82M3+JbzXgTKe9ssCGm47wn9WV12RC/u9JmTEm46DKSPu6nlM9RMAOvFVcGS6B26j7jbJofpsEulC2RRFTmVyEtmiEFhzqbaIHl4kj9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Mon, 15 Jan 2024 17:14:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:14:14 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/5] drm/tests: managed: Add comments about test intent
Date: Mon, 15 Jan 2024 18:13:49 +0100
Message-ID: <20240115171351.504264-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115171351.504264-1-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9afb84-5494-468e-d523-08dc15ed6630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bsagvStO+ebbMnoPwyEnj96TDRiNFHNRZgOiDltMQbw20m1cGOb4tP0c5aV4TSG7+mRMCsCSHTIwHaxUFCHINSj44ejr/+l4pMtqOTABrbKEvv9af94uQDn+GkAMDEUNzhn7XhLdYjrzhKL5C1Ly2BNI4AB5NasfPhoDdvHV6g+iYYBjgFAIw2CFUhZ/+4QzRkIJuEC68uhM4Kn/oVYnuxr431qr9Ktn0qFkEIT0rLAXJ+AaVwlshm+if9cIbHOVg189Jm6INKD6oiSmoydBNADmUhQwj85Z8RdHCIdeGoiRxBJfOjSUDp0U2hUwWxYod+AVHdFIrvUP0J2ZeZt2DT4HjBaVJ9Yhn+ZV8WlmGgbJVgyYGj83nxxE7kLAdL+tnbPgNxpJ4KIjh5O4oYaHurfLAOnFwshtqzJ5ykcfkavRDKqNbJF6PXSYmUbAPf98qlaryJk+cS5kFiP3tTq9eZ7XHax2Vg2ji8vz+VSLPRBXhjbhKYJODA7VfJOd+vnz0/YztTjrUKTJprkfnnAlDbIGj/PQ1pyuEGJypKgqOr/5uz8HXKw0RVmVOM7BwKdR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(6506007)(1076003)(6666004)(2616005)(478600001)(82960400001)(66476007)(86362001)(316002)(6486002)(66556008)(26005)(54906003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(7416002)(38100700002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTdiZEQ0UFdlV1dzR010QTF0VHVjY3VjVXV3c2tIS2k2VkxFbzBEVTRFT2xv?=
 =?utf-8?B?L3pXcVJsazZBYWM4Z1NFeFFzZy9qL3lwTGxBYmVoWjNRMlZ0S1NiYjhKNDBx?=
 =?utf-8?B?UkpoL0w3Z1B4YU8za0FkaGxtcVJ4VXA5Zzc3NW0yNDJUb3pRT2xUMnd2Sjdw?=
 =?utf-8?B?cnQ5TENGU01Qa3JvcFVDMzUxd2MxcE9oN1lEMjNocitEWlFVbytLdE5QVUh0?=
 =?utf-8?B?WmFuWW8yanZHSFZxUVRRSnFUTFpCQzhISHErMmMvS1h1NGZYaHRkVVdpaS9s?=
 =?utf-8?B?WkYwZml4N240dkhsbnJNa2JGbHo4RXFUdjJmOUpSdlgrOUJrclFtcnR5U28y?=
 =?utf-8?B?L1VrUWdvOEc0UG9lTkZPbHFNU0FGU1ExdllONG41NVNVNzZFdlFhV2RvNXgy?=
 =?utf-8?B?RkZnMndFenNpaWphSG80ZEFJK0FFVHArc0VjYmZyNDZHQWFhdTBmU3d4MS9m?=
 =?utf-8?B?TkVmdlNDMEtxZEZvMDczbkprRlg1WUlzMWkzcDV2U0c5Y0p2YXNmTG9mbjBn?=
 =?utf-8?B?VHJsUW9qenpNUnY3OGdVVFl6cUhWN05RUkNUS0w1aklELzBseXYrRktJZ3Av?=
 =?utf-8?B?cjk1ZFc3eHZkQ1AxbWxmOGNyME1hc1hGZkdLZnYxUGVyK3g3OXBBSmJhYTRs?=
 =?utf-8?B?UE5PRzJyWHNnd1ppNXVJK0kwNUNnMWlNZ01UR3l1dzBtSGZjM1dZU1Vvck1B?=
 =?utf-8?B?NlovUUtTL2FXMnpRbmdudnN4azAvUFNpeTZGNkk1bG9YWXY3UUlDUlNnQzlM?=
 =?utf-8?B?bndoclVWWGgyY0VBNmY4U0dMTFpsWUNXUGlwZGFwck11ZDFybzE4YkVMWDF1?=
 =?utf-8?B?NnB0em5rTzZsSElFSlFBT0R2cENyL2tRN3ZGQkZpVXhCa1U0UEJpczJOTzBX?=
 =?utf-8?B?QzVBOXphR3ZHNTUxK2ZJRnlLUnd1dFZteFRPRW9kWjQ0NVRPa0lsUzJYVGxa?=
 =?utf-8?B?ckFlRUc3Nzg0bk1TZmcvUEVFL2poZHVlRWx5QjJnNlRtVmJ6YnFJbWZURFpt?=
 =?utf-8?B?Q2orZm5BUUtpZXdVeDMvcGNBbWlGS2JscDJCVXltMWc0eTBrcDFMNW5qVEJa?=
 =?utf-8?B?Sm5YamdqN2wyeVJ6Ukd3SUVkcmtkZktrSnVEVENqOVZnR0pWZ1hrZmdIWmlK?=
 =?utf-8?B?czh3WGtKbi9LQkJOU0UyUmROd0RsUkdmcmhXdHB2OHZHUlpEKzd0RnpGNy9s?=
 =?utf-8?B?MzFWcmlUaDdzZnV1OUYwZExoRVRERDlabEhLSWtkRTBJeXpOcTRYRFdtdDJQ?=
 =?utf-8?B?d0d0dmZ0eEFMV0J3Z2VVWU5WOWhuZHc5S2F5R1NySE4zYjVHM0dPUFlpUmxJ?=
 =?utf-8?B?QlF2SmkweERrcVU3dDNqbFFNY0RBaTIzSXErRVExQ2txT0tUZHloSkEvNXhJ?=
 =?utf-8?B?VSswbVFYMzVxd3JTVWQzVUs2U2x6a1gxaVhHUVRSWGc1UXZnZ1FoMFE4ckNR?=
 =?utf-8?B?aGF2QnJMNVpoVFpOY0hlNnVRSzlBa2pwc3R4djVOeDB5ODVWTi9TVEFZb1gz?=
 =?utf-8?B?Q2ZBMlkwNUhnRng5a3BJcVd0UVBrakx6OVJpdmZwK3pWQzNiUWlXc1Jkb21C?=
 =?utf-8?B?N09EVHc5UllGU0Z2WldSMjMrdDBwN0dhalk4K3BJc3dHSytud3FsdDU4dTdW?=
 =?utf-8?B?U3pvK0FML0lPOWZpQkd5TThnM1FTaW8zd1dYWHRWQkJZQkQwMmlHQkZuZ2xn?=
 =?utf-8?B?ekZGcW5heWdrVVBlanZRYmowYmJWZ1FaazFUM2doZlJ1czMwTlF2YWlnakdq?=
 =?utf-8?B?bWZhZEhSSnN0d2xZdzRIaXdnM0tkbmYzS3F4bUN3ZVdkbjZIb3pmMjhGOVN5?=
 =?utf-8?B?eXdVcWlNY2pmdS9mUmpyaWRpdGd6RWlHVDN4ZmR3ZTRRTWhwZVcxQTlnbEt2?=
 =?utf-8?B?VHZrU2poRjl2c1hxbnZreTJ0WVdoRVNsaC9xZmNrNDQvcUhrenNjTkRPemFG?=
 =?utf-8?B?cTI2OHhrdk9GQU1QSHRrK3JSMU83blQ4N0NRM241THY0dm13eXNyNFd1Q3NZ?=
 =?utf-8?B?WlNwL0F0TEpwdURrbnFJZ1VmUXNpS0dEeHZQcXB3cXdyNW05bVFMYnYxclJJ?=
 =?utf-8?B?dFBHNjlydFVpYWhvZU1HaTBUNndYNFVoQXgxb2ZBRVFGVERmWHp3a2lPYjc5?=
 =?utf-8?B?S2RQRmkwR2xXakZVckV0QUQ3c3RidFd5TFByMEprR2loTDFsU2RaTGxBMjBB?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9afb84-5494-468e-d523-08dc15ed6630
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:14:14.6721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7+5XYVt1wlySRf5RpGAJUcmoWB+5Wxqg7LjPPqAO3AKSDu79/7ncg2Aw8yeEDf7OEcDIYt/rALN5mzUYvwkNFdjj6Htz5yiVmMSWA+VCCM=
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

Add comments explaining the intention behind the test and certain
implementation details related to device lifetime.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index f85dada4de0a9..b5cf46d9f5cf8 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -24,6 +24,10 @@ static void drm_action(struct drm_device *drm, void *ptr)
 	wake_up_interruptible(&priv->action_wq);
 }
 
+/*
+ * The test verifies that the release action is called automatically when the
+ * device is released.
+ */
 static void drm_test_managed_run_action(struct kunit *test)
 {
 	struct managed_test_priv *priv;
@@ -38,6 +42,11 @@ static void drm_test_managed_run_action(struct kunit *test)
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
+	/*
+	 * DRM device can't be embedded in priv, since priv->action_done needs
+	 * to remain allocated beyond both parent device and drm_device
+	 * lifetime.
+	 */
 	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
 
-- 
2.43.0

