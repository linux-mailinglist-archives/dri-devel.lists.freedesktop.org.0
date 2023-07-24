Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C566E7600F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA64A10E35B;
	Mon, 24 Jul 2023 21:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1B810E35B;
 Mon, 24 Jul 2023 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690233321; x=1721769321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rhtNiYYVteziVFqrrQ6PoJGiyXUfob6EsfrQkEYBa3E=;
 b=T8DJ9B/fxGw3I3Xo79SGcJCcd4FKqv+N5Ef4hlncm56r+2VXX5PUkW1e
 RjOTwO+v7xuoCw5waHQINBdQNQokOqShnC2aHp0bmss2eId1TrCWCYu33
 SGvC4QBmjbSRFfJsOFp+ZOJqwzDqmu3IUqg55afSKBQSZ3Utdi62+jt1T
 vr6MQaRs7EQ7Ni2FlJ1gQYriXlKNEw7BInBlaMjYRMHEdqoj0TW9MKEQi
 Gyl3ZJx+EhveCv6Q5Ywx6BPLjvSIb+3+GtwrOdmMrIS6klQ3qPiR0qvAE
 P51zFnzDLdEtSSlJYPqIv1MehseyTDtz8VChrlb1c+P0qU339QkHsqGJ8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="453931075"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="453931075"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 14:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="1056569339"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="1056569339"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2023 14:15:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 14:15:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBUlf3hSNxW3ay3fAuKJMln/8y3mrAYst5TdgkurJCpom7Su0xBCcCC7KZCAw/SDjr+IpqW0NBV9AbBH98wcBtb2qo/ry2oT8/Djty+hY0hSGsy6GRBsqKT5U8CVBZb5g1Co6K+zXOz4ZxEFKpMFWNbScYL0O5XOaOhJiYUpPF5cD/J7KNL/JUkY6/LxlGvu4X0XjmFRy0BT2pv3NLtOWadYXMiONT4/d+XgDhLkQ41cMqXY4Tqso+XLsQ28mBv28/1e3jaCmukh8fff4yp3lQ2PxfLNg24WV+96tFbkGbST9XyOvCeBY/TCXQlu2ubz2SZ+DZRbNZvdhT2Vf3VwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAQjAU/oQDuqdibu8w6peKc1dtCBsSy6GPLMGiJD/a0=;
 b=QKGSoKo6Zb5+5BVuJU6Ch4wUcwf4e6T+jYDnpM2boWfbei2IXRR6JZpXyWblIKtofPzxombIncuQ/bFP4CpaPxDeGEm5r5kFvZ6S62p4/RgsczuBGIm7UpR7tcAL3SvaWoVc+vXuZB/LPOBk7+aiDYld0fnvSKUi/XX/4SX1KYERGofMqiZU07A3Q4hYgX3UcvgdQTTmjLhvGOt05AUhOosgySQtfmzO+CxtsvVyJc7112VY0/PLWLhtswscOzjkrBCWln0XJvUCWCjQSGvfnGSWodRQ99larSrjoe825MVQunE7+XMLgTGJ/ZKEZ6xlbNJSOErQywgy70bIIgZFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 21:15:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 21:15:16 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 1/4] drm: Use XArray instead of IDR for minors
Date: Mon, 24 Jul 2023 23:14:25 +0200
Message-ID: <20230724211428.3831636-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724211428.3831636-1-michal.winiarski@intel.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3ff2a9-ff21-4954-cbdc-08db8c8b13b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulmgBOlYXeBgg4WDtpKRrg69uU5vqhsZXE4SvzpBdnnamJPxtgdCwTzC/nd8v6a5fCC1ABCrYPBZcWkQs/g99tTNYWoxhfItvRNz1Up4Lq9t1d1JdhIrpjUQ4f//enjacbZmEKcWikuKSEaeMwtu77kPyhdZ9FqNGrimHiea/LGblJdxFQmD6V0gmLlT9WGnjh2Tp8i+Myrg8h0m++jqzOZu7N/QAuMFzD31gKko/aYThC8vLpWwgOj/XEd28Nnnr74UrBqvA+i+Ji8Hh3Y1Z5yoYoCBJDg4ykHyqwGKVSKMg1sCWAWdvlO5OPuUPlE3MhYXji/trL1gpcYrYdfV/NnI2GES/WYomDy/E9reHlF2InzyzN3DOUmwESUbo5HZopAa32H0gYi4oFEGAyLQsr3Q5PjaNEsmb/h23LnYBJAa5GJ73eSFH496kcvCDovFwMnf+wACntyqFs5roCNPuU8VQ3HsWRn+/x5Kf/uBQ6FKNS6G9BD19fh+KbOgkjreZLatf9E4l/Otl/efWY46fu4pMWbh/6HSuNP4DPd1vUO7H8AUGu87flmB5j3hPiP4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(38100700002)(36756003)(82960400001)(86362001)(54906003)(2906002)(186003)(6506007)(1076003)(26005)(6666004)(6512007)(6486002)(8936002)(5660300002)(8676002)(7416002)(478600001)(316002)(41300700001)(66476007)(66946007)(66556008)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNKS1VldHYwU1dnaExhUFZ6SEF3d01vdXdvMkRzLzBIZmorWVRyRVM4Sk9m?=
 =?utf-8?B?RVRjQTdJRUtCQ21GcWRicnFIdE9idEtQWWFlbDFLRStXaDhPY3NtZ3JoZWti?=
 =?utf-8?B?c1pTVFpJald1VDc0d0d1YVMzVmIvMTdjL2RUMU5ESVk4NFV4MjkwaVNFTWFm?=
 =?utf-8?B?QWRXL2o2Zno1RExaQ2FPY1BUV1UxN2cvMlpvbjBaWGZESmxUdmFKeFcwUWpy?=
 =?utf-8?B?RkI1Mk82TVcyRm5JeU9IZUdDeXlmc296NzIyem9OcUIzeVg5K1dUdGdTSkNM?=
 =?utf-8?B?bU1JamgwSmluR01wOFRVTlBhOEl3Ry9HMVdpamV1dnVZdWtidm1meWJOY2tE?=
 =?utf-8?B?QTBNbkZRMThEUGF3eWM0ZzJaQnNraFNodFllU2NXUExSQk5LUDNaWTlxMGtu?=
 =?utf-8?B?UFZNaVhhTEtYZXNHZDdJNW5XTmI1SmpaeFpPSFFMM3BLeU1udkZOM0o1YnVs?=
 =?utf-8?B?bHQ3UEN2UUUyU2grdkRDWmZKeHJRN3h0UFluVlpBaTYwZnJUY2dNWGptZGMy?=
 =?utf-8?B?TC9WNFYwd1NmZmt6RTEyRFBLSHF1VHI0SDBMcUJmMU9zTWtLRFBSK2VtMElh?=
 =?utf-8?B?NUwyMVgyUmdIcWE2VmNFZk5QWlFXWnhFbWZTNmRWeVVEb25EOTU5V1VqL0pk?=
 =?utf-8?B?TzBrQnROWldZUzlJaXBTd0pjRkhJcGlCQTdJTlVWZ1pwcElYckJjY3ZzK1lV?=
 =?utf-8?B?NGM3bC96TkFQdEo5OFJGcHdmMGJ6MWF5ejNKeHl3eGR4ZVkxdllLTDV3QVgr?=
 =?utf-8?B?RVJ4N01qSzhRNEJ4TDJPMm0wRFZRK2FQcllLT3NOOHA3NmJwamowTGNPZWNl?=
 =?utf-8?B?ZnVqTG15WUg3Z0c2TzhDOHV0M1FhUElCRWtvNjlic21QRDBVdVhRaWw1ZWsz?=
 =?utf-8?B?R1M5ZE1TWlphWnJ3TmtKd0c5WVFFdUFQbzVlUHZuMFVXdUlTVzZ6Y29TMVp1?=
 =?utf-8?B?QVR5aTJwaXR1d0NhZytvZ2VNUUY1UnZtVE9NR01yVmxVNUNWYmk3U3RhTHFM?=
 =?utf-8?B?MGZVd3BacWZGUUg4ZGtQVGN3RHFuVVBxcDEzYmc5MnM4TXlYQ3Fxc290QnRs?=
 =?utf-8?B?SGQwWWdCdkJZSmxSVFo4WGszSmc5ZmVsS3JxMTQzaGgwRXF2V25ld0Q1M2xN?=
 =?utf-8?B?bExVNUd3OW5tclBaeFlEaVdIYlo0MFJzdEtwYjZSYzQ3dDE1UnVYK1B3Q21x?=
 =?utf-8?B?L3FIZVd5eWRzc3k3SER2Nk9yR2hMQ0hUM3FOcHdqYWlRbmtvL3lFTExaMkpG?=
 =?utf-8?B?U3dMWnovRmZ2QmJQMTl6c3pPeVN0TXFFczI2SlhuZko2MnJNdGJTZ1JBVWRr?=
 =?utf-8?B?MW5OaXBSVFUySzRhZE4zb2pzV25NR1dqZ3BHMXNtd296UW0rbGtFWGVDYWw0?=
 =?utf-8?B?QUp2SkxLVTRHd1VTRUUrU1RPdDR4dnpiaURqbitvRzcrNDJUL243Q3Z6Zkkr?=
 =?utf-8?B?YXcvZ01KeHdJZldtc0hyNnJhcldONWFEQWVqckZFdUk0SEd3Qzd1SnJxNkc2?=
 =?utf-8?B?M0FjUUJnS0hpdHNPeUx0WDRGaXlhUHpRTnpyL0FVanlLbDRkK1dXL0g5RWNG?=
 =?utf-8?B?Rll0TndjczRWK1JNSk91WE9NRjI3cUxJLzlHUCtoeWJkQ2JtMWtMMDdtamRY?=
 =?utf-8?B?eVc0YllKRXJJN3FNNFp5Y04xU3pMQVJsbjJGS29HUmNuQ09FRjhlZzJsaVlY?=
 =?utf-8?B?V24vWUU1V2ZpZ1ZSMmc3UlpYdHhrelFjdExoYnQrb05qMlQ4Q295YjEvZjN2?=
 =?utf-8?B?QXhOblFXQW5xS29jc2dURTI2L2ZKK1lKVDNNbGtNL2RwTUhsclhHdkdoYXh2?=
 =?utf-8?B?KzZ5amxSRE9tdDJCTkVVNmhSSXFTaFUxTkJQNVVWaXV3dzJENGlqN2IwZmNt?=
 =?utf-8?B?ZncxeXBPVG5HdXEvZXFtaGJtNDBQOU5Ka2tsZ1dReUhLK1kvVlZya1JzL3h6?=
 =?utf-8?B?ZStZZGhwSm1ZRzFzd0IwZmpnaWhuV3VBZytqa1JGcEliRElJOG9pV054S1Fi?=
 =?utf-8?B?dWpGa2ZKLy9BRFRYSEVpSTFSRXVOcDZLNmgwYngwdlhTMnpIVDMreldyK3Za?=
 =?utf-8?B?MGF3T3FDa2VCZVBPMm40ZFBSQTJ5YkFORTVSSS84aFpCSG9PMHhwM205ZDRO?=
 =?utf-8?B?cnAwbjMxRG5XVlc1dUJkZEd4SnFxVnUvNGtQTUoyMVYxQmhDZzhob0hmRDR0?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3ff2a9-ff21-4954-cbdc-08db8c8b13b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 21:15:16.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgjCtM807tkgDF2zkSAgfGuONWUFBOmXosXi3Zb2gtPPDhFCO6hvUwIW5SxnIxHwPG2HCLryySPIxt+ntjT0pi3yPWgeasljxW89pEWGP2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IDR is deprecated, and since XArray manages its own state with internal
locking, it simplifies the locking on DRM side.
Additionally, don't use the IRQ-safe variant, since operating on drm
minor is not done in IRQ context.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Suggested-by: Matthew Wilcox <willy@infradead.org>
---
 drivers/gpu/drm/drm_drv.c | 63 ++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3eda026ffac6..3faecb01186f 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pseudo_fs.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_accel.h>
 #include <drm/drm_cache.h>
@@ -54,8 +55,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_SPINLOCK(drm_minor_lock);
-static struct idr drm_minors_idr;
+static DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
 /*
  * If the drm core fails to init for whatever reason,
@@ -101,26 +101,23 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor->dev);
 
 	put_device(minor->kdev);
 
-	if (minor->type == DRM_MINOR_ACCEL) {
+	if (minor->type == DRM_MINOR_ACCEL)
 		accel_minor_remove(minor->index);
-	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		idr_remove(&drm_minors_idr, minor->index);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
-	}
+	else
+		xa_erase(&drm_minors_xa, minor->index);
 }
 
+#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
-	int r;
+	int index, r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -129,24 +126,17 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 	minor->type = type;
 	minor->dev = dev;
 
-	idr_preload(GFP_KERNEL);
 	if (type == DRM_MINOR_ACCEL) {
 		r = accel_minor_alloc();
+		index = r;
 	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		r = idr_alloc(&drm_minors_idr,
-			NULL,
-			64 * type,
-			64 * (type + 1),
-			GFP_NOWAIT);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
+		r = xa_alloc(&drm_minors_xa, &index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	}
-	idr_preload_end();
 
 	if (r < 0)
 		return r;
 
-	minor->index = r;
+	minor->index = index;
 
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
@@ -163,7 +153,7 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
+	void *entry;
 	int ret;
 
 	DRM_DEBUG("\n");
@@ -190,9 +180,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 	if (minor->type == DRM_MINOR_ACCEL) {
 		accel_minor_replace(minor, minor->index);
 	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		idr_replace(&drm_minors_idr, minor, minor->index);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
+		entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
+		if (xa_is_err(entry)) {
+			ret = xa_err(entry);
+			goto err_debugfs;
+		}
+		WARN_ON(entry);
 	}
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
@@ -206,20 +199,16 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
 	minor = *drm_minor_get_slot(dev, type);
 	if (!minor || !device_is_registered(minor->kdev))
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	if (minor->type == DRM_MINOR_ACCEL) {
+	if (minor->type == DRM_MINOR_ACCEL)
 		accel_minor_replace(NULL, minor->index);
-	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		idr_replace(&drm_minors_idr, NULL, minor->index);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
-	}
+	else
+		xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -238,13 +227,12 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	minor = idr_find(&drm_minors_idr, minor_id);
+	xa_lock(&drm_minors_xa);
+	minor = xa_load(&drm_minors_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_unlock(&drm_minors_xa);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
-	idr_destroy(&drm_minors_idr);
+	WARN_ON(!xa_empty(&drm_minors_xa));
 	drm_connector_ida_destroy();
 }
 
@@ -1076,7 +1064,6 @@ static int __init drm_core_init(void)
 	int ret;
 
 	drm_connector_ida_init();
-	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
 
 	ret = drm_sysfs_init();
-- 
2.41.0

