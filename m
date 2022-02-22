Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F14BFB2C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052D110E818;
	Tue, 22 Feb 2022 14:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AC810E818;
 Tue, 22 Feb 2022 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541484; x=1677077484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r19qf66yrOMC2QK5I+WIFk5Cujmy4szIiBaFKOkhYSI=;
 b=R53Vy325xnMXd3j9akyodnl5WZ+lM6rhE4Yxeq9cqZOHWLNWustJRE31
 Ik8Uf/hQhS4gQBq25TTl6Yv/zj/dyh1wbXZpDxnEvImqns8XhbBhqeagH
 dwDFCD3io0jgDHEzZNZMaHPH9w+vsGi70ItvR40fpj3SPAbcVasdpORsi
 fPP0Q3NBvPSvaRgqaTp0cpMIPEZXAPyNqVTQJ5Hrr2J0gaSFO0o5bZkaq
 aKc9WHcr92B+WGBlluxf6Nn9Zd87gFafVAdcY917cejJPTZ0Wl9Xs754Y
 noKjqLTOyYKxEKojACI96gvQ8foOLubbsxzoDUeHwNPIsEsfeiaUB3iDo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="276320813"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="276320813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:51:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="573453808"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2022 06:51:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 06:51:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 06:51:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOs73EEnBLth2qwWeo+K6wkYg+Gi9Aj+TssbQvBDlLUxS/EOMZ9fHopl+Iihmx+9qKERKNKikTmFypDV72X3L5hSk0oeCqbUBY/uKX7mNZ7aIvBp/uXRzDWuhyn+70lF5hVaENw4ya39rNebXNVxqenPJKMh1I0NuydaWN4P4rRVJfRVGps2CjiYkPVqrrO/B4hiDUGB/OSxe5wGbCtKqMX7ojv5ois9nVj1OznKz1SJ/89Q4cHuwZdxhv4b2m1Qc/esCeLqH8u37BYY9+FLeq8G2g1/NvKLLGfPFB12Xb13zADCWBzAK1mlhSAHNkCK1yyVJ1ey7ufbpS4YtkLyOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbxQnpLY+ob0lV8KZGxdbwuc9uApJSCTLIC9IcsxaHk=;
 b=X4KIyW1K2k73x5OUxwJuqjun+xqishvSn+6DQ1cg+5Q5CiIwA9eDvkIXcknfdht1rb4JUA4+xjnnXnG/ZWPVVuSamkomHXg8HsOR54CTbJiby7t56iVFe08H9KjqOqaHwLA+lrDGi0/jxVUg48IJQKED0GtXVaiH1oygKlfmxLNFELLiO+5NozE1DP2nufafLSEZVl12m0PBTJMyYFIj4s2Zju0FkgrQbJco9EPBNa4YkaX1rggdc5XgV4oaktGXOydLMHYg+EoZVRTCPhZJa9WDikm4hg++XYkX2vxkYbN436KrtpuMlF+M7FBqLXq4Mdy9dds8wriJIc+mNVUjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 22 Feb
 2022 14:51:21 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:51:21 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm: Add drm_memcpy_from_wc() variant which accepts
 destination address
Date: Tue, 22 Feb 2022 20:22:01 +0530
Message-ID: <20220222145206.76118-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::32) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c43e96f-61ec-4e57-63d4-08d9f612ca51
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB56272A2CE8DBA29861FB4BE49F3B9@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HC++DqaV4pU8xzKZ2iSNZtAtahhBmrYAtlPlTiyK2Q2rE5hmm3vkLARJMNYQnwVnpeBcFxuDeAgSetjq2nT0tQoqCeNfrV+rc5xX2gAwGujWMYx2avuBbZaBIHIm4E0369n5iKGgz9AgtSoP7rla2ID4/VlAh0395eIWJV5Gg/RA5IX2dkKyYzJC4GGZXmb9+hVPBxAH9/zcNQDjHqervDanAHU6Ijso7Ts6EbIdX+3DFolNC88m7s9t9oJJK4zya1FpFmFU8IQTP648hzmig9vOdiGlAjAIBPo130yfwbR6Dlxqyis213ypnggTYz/AkNP4Wq7EoI+dYadebfPLqpxQ0Rv/qEU0W0IVdfW55nFlqC8tW5IgUxWcSYS3Dhhhyd8rqgybexgFZGg9Xd5zElJP095XvHmYqQxoRyuBUyjltloBtcSUf7yPwru+0gSnyLGbh28O9jl0+SI1MCxotjjvgAR1HLIS32Hsh/onnrr4BDjRIMogUXH+dzH9CEGhzPDOws8nujFomqqStD0xYx9Xsn2icLy4ARtgaXXbRvKpBT372owqZ4k4FdN0MJvNudJIy7WrXD+Z9FVeL2oUw+VwWMGftN1AaoHNqIyB6yXeXiJ/KMf5q74rlzG7r4KOkJ+6R8f6gf62qxCWkBIQlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(82960400001)(38100700002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(54906003)(8936002)(44832011)(5660300002)(2906002)(2616005)(36756003)(186003)(26005)(1076003)(6666004)(6486002)(508600001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qom4qSpdxmbsQs1g5962LLUYzo/qy0/AUjxKnzhMJY6yB5eTTM1AMmo9itly?=
 =?us-ascii?Q?dBFf67oN9ZGedpY24+qi4Sm2g7ugNATyVcURCJYzb2DJ3OSqEXcSlXPXLnFv?=
 =?us-ascii?Q?KTa+OiBlSdPWRto0Y+eXtc7om67M3YQmjpKFycjt3A6oyWmxYIwk9VIMdOQd?=
 =?us-ascii?Q?DorS76p1V/I9HJN0stYTj4m2bPIllLyG0J1ZVBvQxxhAt5l+GaWbO0NKRtHl?=
 =?us-ascii?Q?5APMmIhIDoQhjMC4MY5z8N1qir/k5d7vSMie9dG6OuNUZ/OvMZ/OPdZ44tGA?=
 =?us-ascii?Q?0Mf8IpirbAtL0TLB8ahO0122CLx0ZVg65wjDygecl0GPsICgu076KimmVDNg?=
 =?us-ascii?Q?VOrNqt6ao5ZpEMMQwI+v+uB7N0ArfnsCdp9UmbRQqDqJvbgmTRNsxxVL/yO9?=
 =?us-ascii?Q?onzhw3UGT6qX9coo3Vvg21XtOWnP5hViDcpHyRiR/OHTyQI5W9778KMneIHP?=
 =?us-ascii?Q?y4CMyHEUv/gBV47uZ3R7DUd6CUAIpgJSKJh/qXi+CG2L0RcYRCWq7ar9p7WT?=
 =?us-ascii?Q?dP1Sn4bn7/GKSIOqRWrd7hKBMgyyC65PFMWw/V3mSaXXXhQxWdUXFK3ebQlv?=
 =?us-ascii?Q?vrl0wjwNlfgd0YJTkDJMKVEHlTmOFC+KnCHltEd+dKGwAg7ICeFLKdOKNnMO?=
 =?us-ascii?Q?DnVYppJCO+K0Js1Hc6a3evSdKVqmav1MlKrkUC2tqvb2E7MFHrFFOQKjW6dz?=
 =?us-ascii?Q?Fj7EpwF7BP3V1GogQpZT30HJ12l7fLClm6AhNwDDt/kWrlLnXvxvlu72Gzzs?=
 =?us-ascii?Q?LkWg2SOhR0w1EGaH2iRidzAXGsJS8iNlkmgFAHjR+TnbHzKS7kR/sPS42q6K?=
 =?us-ascii?Q?F6+1Ja/peH+Fya9FzxBdYC5hSFebpruOlJ0yiDWgx+Rzj/F5XHcQwiR0EW8t?=
 =?us-ascii?Q?3S3jcIszai2Utwiy6KNCG7AnSqDbYfU8rfx0bfYft2RHMwauHp+DfZsZYSdN?=
 =?us-ascii?Q?gzE2InP9yBHztxVGHvW4+f+ph6Uq8wciK8F8u6OzEhG/4KFMkMAzyYV5la7h?=
 =?us-ascii?Q?ta2Vh/IzJY8iONShWEiQ39qnOx0FgLODvGUDdafkN4ihTmnnWjbG3WlNVMaT?=
 =?us-ascii?Q?l19s4r0foBp1CgbQKyoiTzDZkIeKJOvqjPSfO3PhV7b6nbzqcL8ooOefxAo1?=
 =?us-ascii?Q?Xofg5O42MOwRA+KmLUW6RWibvnTk0b/b4w6l9X6B1b6xZcfClaV8uhJRI076?=
 =?us-ascii?Q?qh24G8Al3Y6Q/+RCSbVuQMj5GQLU4U/aVQfWbUTNcwm49LRwsyl1BOjIPPau?=
 =?us-ascii?Q?UsHmHYQUgVtq1gCjQFyC9eStlrhhJIaSN24Aq9KbMQlJNHfeSOuFPVVSWWYw?=
 =?us-ascii?Q?L8gCDBQvSstLosus1mHKAIn5HcC8oy78edblHveKY9B+XfHk5GvU1Zlvdc2i?=
 =?us-ascii?Q?Ur4FjiMj3cu4bYeBJeVPWGee915rGAikBLjqtyQd9l9FK7OLXRsf6ND0XqvU?=
 =?us-ascii?Q?TFr9DYsizkOB2gsHss2E7RXgcyIy7otI5ayBBDERJYEQq8Si0peGbsdC30ZK?=
 =?us-ascii?Q?GCwMCPhQsRnAixNYc3OVZPAXJXXbIRrpDKGpY01Dy60FTsMOGnPUSOvze3Vt?=
 =?us-ascii?Q?eqDTrGW6gO1FhbbaxGZXV9uM/g1Ms/wHnyV2AfeV2P9Q6DDm6ncfrpIRLTtI?=
 =?us-ascii?Q?uHPIL+lJRRfXz4U4dE7qZPgibZT19/Sp6/Dv9pWF7dst/NQcJKdjKHuvph6D?=
 =?us-ascii?Q?ra2n+5yD/+t6pRr8C+M1nMvN3vZ0oAGUTc4phsqComSshi21ZmsAgl6wJdzT?=
 =?us-ascii?Q?9Tlp/QFNfw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c43e96f-61ec-4e57-63d4-08d9f612ca51
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:51:21.4905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBzoAekQVjncggmVcaymA989Ay+TCDEToKu/7Daljl2RhXVVBhRfEQwoXKz7BwecZ3NiZGN52O7FDhIqIik01+rX7YZngo5finMy0KJQDpfCxVXk9fGqz08/CCIqu8OM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, David Airlie <airlied@linux.ie>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com, siva.mullati@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fast copy using non-temporal instructions for x86 currently exists at two
locations. One is implemented in i915 driver at i915/i915_memcpy.c and
another copy at drm_cache.c. The plan is to remove the duplicate
implementation in i915 driver and use the functions from drm_cache.c.

A variant of drm_memcpy_from_wc() is added in drm_cache.c which accepts
address as argument instead of iosys_map for destination. It is a very
common scenario in i915 to copy from a WC memory type, which may be an
io memory or a system memory to a destination address pointing to system
memory. To avoid the overhead of creating iosys_map type for the
destination, new variant is created to accept the address directly.

Also a new function is exported in drm_cache.c to find if the fast copy
is supported by the platform or not. It is required for i915.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 54 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_cache.h     |  3 +++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index a21c1350eb09..eb0bcd33665e 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -358,6 +358,54 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
 }
 EXPORT_SYMBOL(drm_memcpy_from_wc);
 
+/**
+ * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy from a source
+ * that may be WC.
+ * @dst: The destination pointer
+ * @src: The source pointer
+ * @len: The size of the area to transfer in bytes
+ *
+ * Same as drm_memcpy_from_wc except destination is accepted as system memory
+ * address. Useful in situations where passing destination address as iosys_map
+ * is simply an overhead and can be avoided.
+ */
+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
+			      unsigned long len)
+{
+	if (WARN_ON(in_interrupt())) {
+		iosys_map_memcpy_from(dst, src, 0, len);
+		return;
+	}
+
+	if (static_branch_likely(&has_movntdqa)) {
+		__drm_memcpy_from_wc(dst,
+				     src->is_iomem ?
+				     (void const __force *)src->vaddr_iomem :
+				     src->vaddr,
+				     len);
+		return;
+	}
+
+	iosys_map_memcpy_from(dst, src, 0, len);
+}
+EXPORT_SYMBOL(drm_memcpy_from_wc_vaddr);
+
+/*
+ * drm_memcpy_fastcopy_supported - Returns if fast copy using non-temporal
+ * instructions is supported
+ *
+ * Returns true if platform has support for fast copying from wc memory type
+ * using non-temporal instructions. Else false.
+ */
+bool drm_memcpy_fastcopy_supported(void)
+{
+	if (static_branch_likely(&has_movntdqa))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
+
 /*
  * drm_memcpy_init_early - One time initialization of the WC memcpy code
  */
@@ -382,6 +430,12 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
 }
 EXPORT_SYMBOL(drm_memcpy_from_wc);
 
+bool drm_memcpy_fastcopy_supported(void)
+{
+	return false;
+}
+EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
+
 void drm_memcpy_init_early(void)
 {
 }
diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index 22deb216b59c..8f48e4dcd7dc 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -77,4 +77,7 @@ void drm_memcpy_init_early(void);
 void drm_memcpy_from_wc(struct iosys_map *dst,
 			const struct iosys_map *src,
 			unsigned long len);
+bool drm_memcpy_fastcopy_supported(void);
+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
+			      unsigned long len);
 #endif
-- 
2.25.1

