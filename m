Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2AF6EFC0C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7810EA2B;
	Wed, 26 Apr 2023 20:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDD410EA29;
 Wed, 26 Apr 2023 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542680; x=1714078680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QanyT/V+pEzk6badVSca0N+rzQTBnXQbm6iEqrMGTEU=;
 b=SZZlNZwgNAJE0rnz7VNB6NGUMuE42Go9pBPPWYcdglblRHzjtQ+edgOC
 RrJUjqP+9KSpibYJI3Mc3Yc/fMWgo+tH3To1b/DiZ+r4ofDDEdBlq2l2O
 BGxGO2POX6v4zjaAHs6uE+RYOSHzHSbm+ZF6juEOupC7i1QcgNT/7SMY+
 6v/s51N6N8G8Dpx79JakrCIQmodPbXYBQRvHEktT+pB6uXVe+ynN06y10
 ayTt21yvx71wnx+XhXVROWAHoPA1Akdf5ndM9H1sUcdheq6vYGcpUMBRd
 Y+BZI++4B9Sh/ejp/DFPHACO5IVEjem52a4HMyClShTh6tLb9ctWPPvpE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336158364"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="336158364"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="838081090"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="838081090"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2023 13:57:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtZj8dAl+fnDGmWkUryIUAL1TYn8/HjnmR+Acvsm30vZz7u4hTwjHEeAqFv1Xful6YmQyYPzXXwjdXxw/dQDSBvvHm2+PG0xDx5UGFzuqDGkRcd2EWA+z0z2bmNDDGISORuCHxYBOZBiARgFdnkrAbWQ+XSRjsuDrIRFWWu+8MlYzc9sj0KrbnUKsg8yw5vkE2vcWK5hVJot70eJZf7w5pcwgmJmDRzGTzBRrajqWr6R+riysTwY/Wju2boS9XQcdD4hnV0MGI2EVprh2MvSL39r9QBpsBryT3N5NAVPtaHddIpG/KgATlVluTLcVw9rCX+zEyiFZeCjgS2fwW8pGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bdkP6fgym5olj+TOS/vN2swGMIOzQRv0q5J+2bQykc=;
 b=iquC1GPIjHqk8YXJg6MhqeLtCFs68xCDUs8qntkpkEQuz808Xdm+Z4FyCM9cf0mRKMU7uZ/JVszv04Mo6G29Q25CpL4jqceE85qyeqeEXqDXS/8TBYw54/6iGidCwXXsOkLphmBgdtlio806cS7OE+ORl0hRjgTnnq0SGWcHuO4/4Evv1/CLSWIGxXJbAvFpOdoA+Rk1FsW+R0cb11q8Mrw4p5AGsYmtIVLrGEErDes7p+K3e7zjlyboGqiivGUcNuC/wlQ0RTSIKrRZa6nFh9Dut2fTL2dLYmNk2WITrMcmVYIG3uzCif7Qs4epcWqxF+vvThU31rBAm+6LV0q9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:57:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 10/14] drm/xe: Convert Xe HW Engine print to snapshot capture
 and print.
Date: Wed, 26 Apr 2023 16:57:09 -0400
Message-ID: <20230426205713.512695-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:a03:167::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 463c0165-35ee-4168-e627-08db4698e940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/w3h992pXKvvux6EfFRzrqZWypmh2B+K9F5dh+GnMqdkzlhdu0xKjoD7991/9CoHUw147T/aOrMIQupQdLJH8a9ZXB///OnSI1lLPVJXMstjp/8fddobhiF9kAB/0BTasZpeM37fsXZyrlRpEmLzcrVeW+sJSLCdn2yzgnY0dSL0v+DWFarVfn/9Et9OXMFm7rdtHdYoAg4VlGXQXqFj3ITM2KqsPFRmXLre7o0DisdRiFeL5q+JYSDHunsCwE34wkit8rDtaKfjZmrI7/qwNtPMWmWlo+6S3hn4o3AQ4Eh7X1vJTzXVWK1nNYLHNYZ+TA5gcJZqr506BGne6J7//hofpDRYCsrrXafEqY04f0sTzlGBNi/hmNhppRvqNPIMSvZF50n6Ab8fKONNxUlY+6MxyveqFLETFlw82UvePWGKTjNNAu4j+rpT5GTNrKZvzZJmHqO3sTog7mU2EDlmWfowArTkzuQh0jfP+h8wACTxX8n/JRKAhaVnnsrucwL1A54SIxCQH63jghuoHnkwafBiu3dFG+yRhRz0CeOPZ9PnYvCXTeJ7AncfS2Qr15j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(30864003)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4qdlmDDShp6YiK5svhxGoXympZGcRXsTgIFSRjZmrU7qZmi4s4fSNypIWo/O?=
 =?us-ascii?Q?nYt6k7vjJe21+irnKHeBdtMCZSkOYa2D8p0F8O8iY69GpXOFx/0caPeWOiiQ?=
 =?us-ascii?Q?4qRd2AV7Bdv4x8+alUr1N/y8cBaL3wVXl3irauWW1u2FoyCkgcgy+DyMA2C1?=
 =?us-ascii?Q?IcgrdYSITtA93EGQqzLQ5lqd1x07SCvpP7zPEEo0fEPBQRH3/Mx9hFR0gC1f?=
 =?us-ascii?Q?ZfmZ8X7ncfsEMeM4Ahif8WiDbsDoLgKx298Qjw75zcnb0v7jhYD+JZC/Hxq3?=
 =?us-ascii?Q?a5Q4D7PglYkCjqK0MnYHBwjPKtJg+ATtlkDd2yJ6A4kDJGtAI1nuErdF27CH?=
 =?us-ascii?Q?7xKaMF+OHwX7ubxZlD3noM82xo+3K+fFstEEav3Ewol0M6ESOQyqz9GBAhlr?=
 =?us-ascii?Q?hH83P8ZqDDAFObiZyT/6UeUar4KybOyJw7W79ISmy5+9Ee/ZwkKMHsMgzCTQ?=
 =?us-ascii?Q?lIHS99kOS1UY770WsnmAZpp8CwfY2Z2efwBFj0kB/Q5cssFTzFP+N6f7sdyf?=
 =?us-ascii?Q?jXEy6LwiCq3kTJHegRAKxcGQ7/mn473R4zhLhFclyx1vUq63pyz0XE5CvG4X?=
 =?us-ascii?Q?tyZlPnfHBaFtu48MNQ+qhcGFe//eX5r+Lj0pubLXc+jmewEtiU1PKj9MVrxl?=
 =?us-ascii?Q?LTN0lExVwEETxSo3B56jQ99mS3IZLj1lYNmJw0Fe/FeOzM9huRkDFzcqAKvO?=
 =?us-ascii?Q?4cOzpmWFC+WpoXQ7ZDUHqCv4P/JmBHJewTWehiOZKa5gp0Z37wbRErRQqIsZ?=
 =?us-ascii?Q?7vdRYw/fIyEYijaz3UlMiCQPUuJTUG9oUpdaSUMmkqZlac15lFvcSG4g8O3U?=
 =?us-ascii?Q?qcUIF883ubX4o8m+GemG/OLnnUKqsSknJdiYM+71u7kFj2qfaY1TzVPQ0RL+?=
 =?us-ascii?Q?9/qY9DGEyXv7X10htZysItC8nqcZafNEO9nYF+hdAaEP0XpyyqGcOp/h34wE?=
 =?us-ascii?Q?iq4gQnh/6c6qwafwvfJehOSi3DrYDcGbClpne9TilomQE8ai/KIOSJ2gasw0?=
 =?us-ascii?Q?vWSq39wqbCtXO5eH+S4w3oh3/yY6V6hqLDlPGWIvszK4U3MGOyWhTpE8+Zjq?=
 =?us-ascii?Q?dHAb2L+DwLjylILLfFfwfDqxfFE47CK9SJlsXsq0JumYbHSbjzHrpG+A0EMR?=
 =?us-ascii?Q?3CH3pJ2xk2LmMQEp7tsxjJiGP10SiTlpVyDRi0d/Li+KEBdpls6Pco3uNk2Z?=
 =?us-ascii?Q?Mlvf4UPEmxd5Px8b/4ZmRm8z6wJLia32sm4W6iyxO3K39sOH7zMFptUsScat?=
 =?us-ascii?Q?OLUqNv/Ni+DuQJrKk8+1Uq/D0vNIbRtK+w4JoZayEY4b+dksFFsanI2fxhUq?=
 =?us-ascii?Q?xd2PV1Z+CH0mZtFPBeufT88LYZz2V4ITFhGSE44QbIBGIqq8t+7OSVGX+LQj?=
 =?us-ascii?Q?ek3sY3OA64FfJPCRWusAhBtjKeWBZ3CHw+5lFbz0Tv2lEr/nX2coaE6SCloW?=
 =?us-ascii?Q?gZa5t8SYhd6/ZpJ/CgYG+xe+IbcXmoyDmmABoau+y9vDbfK++Vex6Pz2IyGX?=
 =?us-ascii?Q?nwajrXbxZfvbFV39zQI6j2seHfqq4jdfKqnnfuDqpbWSsFConO+cAHUddcUQ?=
 =?us-ascii?Q?s1/RpUeqB44kw90xzJ9SF0jJhqGfR0NzJC3N8ER22MztmiFtOUAD0XLyQSIH?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 463c0165-35ee-4168-e627-08db4698e940
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:56.8485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNpViTjx7GOFUdNSMcjfp5tfTi/yhPV1CXoXUlRmlK/GGae+uqqKrSkPkLzTe3XkhpvAgFzm38UuxhAkQAcubQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       | 210 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_hw_engine.h       |   8 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 +++++++++
 5 files changed, 241 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c45486c2015a..8bf441e850a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
 	}
 
 	for_each_hw_engine(hwe, gt, id)
-		xe_hw_engine_print_state(hwe, &p);
+		xe_hw_engine_print(hwe, &p);
 
 	xe_device_mem_access_put(xe);
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c06411f857f..74659d0a69b3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -751,7 +751,7 @@ static void simple_error_capture(struct xe_engine *e)
 			if (hwe->class != e->hwe->class ||
 			    !(BIT(hwe->logical_instance) & adj_logical_mask))
 				continue;
-			xe_hw_engine_print_state(hwe, &p);
+			xe_hw_engine_print(hwe, &p);
 		}
 		xe_analyze_vm(&p, e->vm, e->gt->info.id);
 		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 23b9f120c258..eda0666bfa2f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -505,77 +505,175 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
+/**
+ * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe HW Engine snapshot object that must be freed by the
+ * 	    caller, using `xe_hw_engine_snapshot_free`.
+ */
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
+	struct xe_hw_engine_snapshot *snapshot;
+	int len;
+
 	if (!xe_hw_engine_is_valid(hwe))
-		return;
+		return NULL;
+
+	snapshot = kzalloc(sizeof(struct xe_hw_engine_snapshot), GFP_ATOMIC);
+
+	len = strlen(hwe->name) + 1;
+	snapshot->name = kzalloc(len, GFP_ATOMIC);
+	strscpy(snapshot->name, hwe->name, len);
+	snapshot->class = hwe->class;
+	snapshot->logical_instance = hwe->logical_instance;
+	snapshot->forcewake.domain = hwe->domain;
+	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
+						    hwe->domain);
+	snapshot->mmio_base = hwe->mmio_base;
+
+	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe,
+							  RING_HWSTAM(0).reg);
+	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
+							   RING_HWS_PGA(0).reg);
+	snapshot->reg.ring_execlist_status_lo =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg);
+	snapshot->reg.ring_execlist_status_hi =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg);
+	snapshot->reg.ring_execlist_sq_contents_lo =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_LO(0).reg);
+	snapshot->reg.ring_execlist_sq_contents_hi =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_HI(0).reg);
+	snapshot->reg.ring_execlist_control =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg);
+	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe,
+							 RING_START(0).reg);
+	snapshot->reg.ring_head =
+		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR;
+	snapshot->reg.ring_tail =
+		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR;
+	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0).reg);
+	snapshot->reg.ring_mi_mode =
+		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
+	snapshot->reg.ring_mode_gen7 =
+		hw_engine_mmio_read32(hwe, RING_MODE_GEN7(0).reg);
+	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0).reg);
+	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0).reg);
+	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0).reg);
+	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0).reg);
+	snapshot->reg.ring_acthd_udw =
+		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg);
+	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe,
+							 RING_ACTHD(0).reg);
+	snapshot->reg.ring_bbaddr_udw =
+		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg);
+	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0).reg);
+	snapshot->reg.ring_dma_fadd_udw =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
+	snapshot->reg.ring_dma_fadd =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg);
+	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0).reg);
+	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0).reg);
 
-	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
-		hwe->logical_instance);
-	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		hwe->domain,
-		xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
-	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt,
+							GEN12_RCU_MODE.reg);
 
-	drm_printf(p, "\tHWSTAM: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWSTAM(0).reg));
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWS_PGA(0).reg));
+	return snapshot;
+}
 
+/**
+ * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given Xe HW Engine snapshot object.
+ */
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p)
+{
+	if (!snapshot)
+		return;
+
+	drm_printf(p, "%s (physical), logical instance=%d\n", snapshot->name,
+		snapshot->logical_instance);
+	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
+		snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tMMIO base: 0x%08x\n", snapshot->mmio_base);
+	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
+	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg));
+		   snapshot->reg.ring_execlist_status_lo);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
+		   snapshot->reg.ring_execlist_status_hi);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
+		   snapshot->reg.ring_execlist_sq_contents_lo);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
+		   snapshot->reg.ring_execlist_sq_contents_hi);
 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
-
-	drm_printf(p, "\tRING_START: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_START(0).reg));
-	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR);
-	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR);
-	drm_printf(p, "\tRING_CTL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_CTL(0).reg));
-	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg));
+		   snapshot->reg.ring_execlist_control);
+	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
+	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
+	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
+	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
+	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
 	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MODE_GEN7(0).reg));
-
-	drm_printf(p, "\tRING_IMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_IMR(0).reg));
-	drm_printf(p, "\tRING_ESR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ESR(0).reg));
-	drm_printf(p, "\tRING_EMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EMR(0).reg));
-	drm_printf(p, "\tRING_EIR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EIR(0).reg));
-
-        drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_ACTHD(0).reg));
-        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_BBADDR(0).reg));
+		   snapshot->reg.ring_mode_gen7);
+	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
+	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
+	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
+	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
+        drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
+		   snapshot->reg.ring_acthd);
+        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
+		   snapshot->reg.ring_bbaddr);
         drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg));
+		   snapshot->reg.ring_dma_fadd_udw,
+		   snapshot->reg.ring_dma_fadd);
+	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
+	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
 
-	drm_printf(p, "\tIPEIR: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, IPEIR(0).reg));
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
-		hw_engine_mmio_read32(hwe, IPEHR(0).reg));
-
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tGEN12_RCU_MODE: 0x%08x\n",
-			xe_mmio_read32(hwe->gt, GEN12_RCU_MODE.reg));
+			   snapshot->reg.rcu_mode);
+}
+
+/**
+ * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	kfree(snapshot->name);
+	kfree(snapshot);
+}
+
+/**
+ * xe_hw_engine_print - Xe HW Engine Print.
+ * @hwe: Hardware Engine.
+ * @p: drm_printer.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
+{
+	struct xe_hw_engine_snapshot *snapshot;
 
+	snapshot = xe_hw_engine_snapshot_capture(hwe);
+	xe_hw_engine_snapshot_print(snapshot, p);
+	xe_hw_engine_snapshot_free(snapshot);
 }
 
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index ceab65397256..a0514bf859c6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -14,10 +14,16 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
 
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p);
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
+
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 2c40384957da..c15d6c671fbb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -109,4 +109,82 @@ struct xe_hw_engine {
 	enum xe_hw_engine_id engine_id;
 };
 
+/**
+ * struct xe_hw_engine_snapshot - Hardware engine snapshot
+ *
+ * Contains the snapshot of usefull hardware engine info and registers.
+ */
+struct xe_hw_engine_snapshot {
+	/** @name: name of the hw engine */
+	char *name;
+	/** @class: class of this hw engine */
+	enum xe_engine_class class;
+	/** @logical_instance: logical instance of this hw engine */
+	u16 logical_instance;
+	/** @forcewake: Force Wake information snapshot */
+	struct {
+		/** @domain: force wake domain of this hw engine */
+		enum xe_force_wake_domains domain;
+		/** @ref: Forcewake ref for the above domain */
+		int ref;
+	} forcewake;
+	/** @reg: Useful MMIO register snapshot */
+	/** @mmio_base: MMIO base address of this hw engine*/
+	u32 mmio_base;
+	struct {
+		/** @ring_hwstam: RING_HWSTAM */
+		u32 ring_hwstam;
+		/** @ring_hws_pga: RING_HWS_PGA */
+		u32 ring_hws_pga;
+		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
+		u32 ring_execlist_status_lo;
+		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
+		u32 ring_execlist_status_hi;
+		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
+		u32 ring_execlist_sq_contents_lo;
+		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
+		u32 ring_execlist_sq_contents_hi;
+		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
+		u32 ring_execlist_control;
+		/** @ring_start: RING_START */
+		u32 ring_start;
+		/** @ring_head: RING_HEAD */
+		u32 ring_head;
+		/** @ring_tail: RING_TAIL */
+		u32 ring_tail;
+		/** @ring_ctl: RING_CTL */
+		u32 ring_ctl;
+		/** @ring_mi_mode: RING_MI_MODE */
+		u32 ring_mi_mode;
+		/** @ring_mode_gen7: RING_MODE_GEN7 */
+		u32 ring_mode_gen7;
+		/** @ring_imr: RING_IMR */
+		u32 ring_imr;
+		/** @ring_esr: RING_ESR */
+		u32 ring_esr;
+		/** @ring_emr: RING_EMR */
+		u32 ring_emr;
+		/** @ring_eir: RING_EIR */
+		u32 ring_eir;
+		/** @ring_acthd_udw: RING_ACTHD_UDW */
+		u32 ring_acthd_udw;
+		/** @ring_acthd: RING_ACTHD */
+		u32 ring_acthd;
+		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
+		u32 ring_bbaddr_udw;
+		/** @ring_bbaddr: RING_BBADDR */
+		u32 ring_bbaddr;
+		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
+		u32 ring_dma_fadd_udw;
+		/** @ring_dma_fadd: RING_DMA_FADD */
+		u32 ring_dma_fadd;
+		/** @ipeir: IPEIR */
+		u32 ipeir;
+		/** @ipehr: IPEHR */
+		u32 ipehr;
+		/** @rcu_mode: GEN12_RCU_MODE */
+		u32 rcu_mode;
+	} reg;
+};
+
 #endif
-- 
2.39.2

