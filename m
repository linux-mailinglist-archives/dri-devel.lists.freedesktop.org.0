Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211034CC4CE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E510EC25;
	Thu,  3 Mar 2022 18:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E106510EC0F;
 Thu,  3 Mar 2022 18:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331157; x=1677867157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k44Zz0rNLLGAVejdbFfcGGKZFjPcheZGPvHClmpQl38=;
 b=eqRSK1r2r6o9VeNS19zfQEV8Q0Wgf2vkYAbWcGKU7mq8puYsE3POXXzm
 kc5F74YhmmKsVi9dfubLLkd06iPQ44BkjGY/Lp4wjDL7AlEcJ+OXyttyd
 7OjKExE0bCy6B8tS1q1+VrhVDI5pqqH4sAUQJ2IIMcIa81bJx8fW6w+F+
 hGxuH1C2kw6Jp1gQrPYk60pSBHHp3OCWHK4NBU2GQZG+UG7T35STtrEgW
 g09/OvW1bGK5SIuB247R6aH2JX74Z67E0K29U/kTUTez22UYFIw0o19dF
 UbeYzmVWk1vhwy+LrkdHlmsQJE5XIPMva4QfQ35eyAR3jeZkg9cJUJ2eY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="278447164"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="278447164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="551850086"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 03 Mar 2022 09:59:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:13 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:59:13 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmiPEIiRLBBqusFI/TWpne5u1e6EqFbrNtxgstGlCDaJFLUyxtAQJ3iuXUnEriJeciUhWpErnso7MLWS83Fc1y6oR9ewx3a7WxzD0DbzzoxL3IYILKQWx3Ul0jLrpGQtuMS7MGReoFc47fN9t3nhiOVs3oMWLu9QU5a/VUIxnzDO6TYhMEiGcdU7q8G6mSjN7gql1C5jgaQIkojFqJVPvWnjKO9hT9yyqTCPjgRqegqQeltGxcC5eUuaQjnwxHktIP/OHrGV6vEYj7+G1acNqXGoNhdXaYGiITrhvoY+DJagIpePg7rRGEpSGlj3oQFFgKMbZxu87ajwEtkdvzrLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIxxalF7hTJJNgdw5hxmFyXqt7Mwi2zQK88J5Qg8iwk=;
 b=Vq0GQWCmM/xot0VTk3Zstg4sBfWY47gRh501CIeIND4HKM22SzaZaL9wZR6fxgOEHIKex0IfPs1VApjDBgm6yDDehMlEDTVd46r25b64zKQGAP3VtCTIAAd81YK8rMthGpkiQ41YwZpoTn1wOrmogbpqDjrvgd/9FSWPuRX82Xcqt8p6x9aORPb7pGgC8yH4r3Vci9BVya124KeXvhiLtGPEuALA3aKrwg4RwjLOOxqwzGMT00Vk0/duFDIxveN8e4FAwm1hwfHmDEl4/xwEkfyhkWMIYPzxYTPh+k3Y/u/+vMfshYeDsjXSapAgKjSrll87A4qiQSdZOIzXjWFHSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 17:59:08 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:59:08 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/7] drm: Add drm_memcpy_from_wc() variant which accepts
 destination address
Date: Thu, 3 Mar 2022 23:30:08 +0530
Message-ID: <20220303180013.512219-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de16d000-62e5-4c41-6644-08d9fd3f83c9
X-MS-TrafficTypeDiagnostic: DM5PR11MB1244:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB1244F80C60D62FF305E36E8F9F049@DM5PR11MB1244.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /04qteacWYSclglWKEmtoYrkqm9l6AAVXDH/mG5s72qDxaP04RnHBf77vh7tZrp95Kh40j9L5XjGwqSo+3VZEubDagHTswmuDMWOVFdgh+OEPpXZK4vETdgpt2C7DQKPUtDo7+SD4fS0YGSNw5fmbXiZyXd1Fkdr6mdS3NMQ3mSud/iPn1jd/LkgLwQ0wEO4rN+kHQxVLHkoOuD2IkA8ZCO2kl/B+C2lIndU0z+SaNw/60XtD3AkHlRxX0o/A/rDXC5OZqhVSYW8M/N4SeKanHsxXeHCMLHo61wZ/wZH0xmQX5Pma7gusoXksBKBPBHhGVxAQ8LkRv07VbAcMuq42Lh+ZROTPtSMIfwAFuCboifh9XCfFUVZObsEJJHv6Bf+fiOzm59mpfqRb/cAKdG43gn7x1u7JhTUtAwuszySBEbpCwDmsSZA1huoQc5Eq0x0fKVgHvTsXXp3g/+Tu475VI7/LknkosJ8S/TQCnc78wVFs3852uFDKq/YGPiQtX/hVeF4GTIk6fyoMIGdZPfmMo3HWjkRUFksXJrCHmbwiwFf3nI5kGXl1Mf41xNPyM/yJRT+2dEb1Yq9Jzq8rpRfPKGhlYDssnqHeBAba5gcmFanbCM0227hC/gYFdRwwoq4jM45HBz2C3kivnn5CW4cww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(38100700002)(66946007)(66556008)(66476007)(8676002)(82960400001)(86362001)(4326008)(54906003)(36756003)(6506007)(1076003)(2616005)(5660300002)(2906002)(6512007)(44832011)(186003)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iPMbHSds3YF/Gv5TuJdqZduaJUWCMwA3FcXqLt2GpQ9xgPCxwMXbAa1wq2jY?=
 =?us-ascii?Q?oUmTM96/jPzCI4I26WLKTRTYvUyfIQ1J+WoNI5F/LFj/gbFsNq3474pAR+ZW?=
 =?us-ascii?Q?d8T40TAQgT1Z8QABfA/TngEw0EaZGJS4jOjyQdlZj3FjCDe5259QALTNtOio?=
 =?us-ascii?Q?qYckcXfl83EpaM60fzgl1eWhQl7Uq00assMWW1+ehDzESNQkLOXn0pdoOaR5?=
 =?us-ascii?Q?MItFQySHaXGiEdetq/KqpNMjmVObYve6vdxehTMYvOMPZ9xiQwTm1KUbZMh+?=
 =?us-ascii?Q?DRJNfHk4lOGCQhfer/bXlOSjqYy/5pEJV6zJzbqrhbgFBkWaTIL+r6rQkQX2?=
 =?us-ascii?Q?vYcgb7mEJWtDfOPJxni5OEwyktatMpKnYlNVEprWwDfK5X80q4BD/S9Pgeq7?=
 =?us-ascii?Q?2LIupKYdpW88A5QcvsSf1Eqv3HvVWucYu0/1WaCb/4pn09q4P7Ow68bdZDzy?=
 =?us-ascii?Q?o/3rkuVI4eLmuUw3lg6BkGNhJxvdHtwnjxGSmpIvWx0nTvosHaSA0KOxiQdW?=
 =?us-ascii?Q?C52ErnxmwXN5ZmX0HnaDIoGeql4/b5U+RjRKcxLIjql/FDhEkks5ZXTXO9WC?=
 =?us-ascii?Q?2IRGXyJU0/Wat8OhrpGPod1v4/oIAtTR18A8L+7GU6bzcB2aKlvU2t4G5Z/k?=
 =?us-ascii?Q?amFtxNhmGdV/4hgUSoLE//NiRWZmGB3oA0ZAy6g5nDps9hxQrGaK1Mq22CFk?=
 =?us-ascii?Q?nvdVuIxV13of0VRqrQa3DcOEkNapGt5DNkCpdOi/cUqh+MpxeFUICc4M8LLk?=
 =?us-ascii?Q?/KgQWYSxGR9a7Ni2R1147Y9JYZP7hxafi5rjgJfYHVrAAQKJy3u4+kzR7Qmd?=
 =?us-ascii?Q?t9pgPlXInxOoSEbj7yLSojQH7xKSOP+Bzxnrf9yf2yAv+t07z3USWnM+KAdC?=
 =?us-ascii?Q?DJO/HYtEYaHJ6kSHwjIkVhrfoRiwi7nzw1+kTIYZJiQfswwbv3qB7Qb30dhq?=
 =?us-ascii?Q?LeGcqLXqqwl44bhCFA1AbXQM2Tcs3+bYQTz5cxM1fC/FTMtTiXmhMkv7GfJJ?=
 =?us-ascii?Q?EhD8vHdRwI2OTdBMjvDsr1JkQtR4nuiUruEyE0MebPMTMaFLEAUfG49tf2Q8?=
 =?us-ascii?Q?HMNWUzCn0kVgSnUiULPTHPyT/EKY4EWnR5CN6bB/n5lWO2EGbM9YqwTRzPbB?=
 =?us-ascii?Q?1pFnj7KqHr8mScrEB0oOe2XKD1Y/9aBgjZtHgjEj4H9g4HLj34aWeCWgOmeh?=
 =?us-ascii?Q?w53HJAlXN3XckZ2Gfi+LXvEOhpoKf9tvTHvi8Ef27LJLrOEHu1z4yik97//i?=
 =?us-ascii?Q?/IYQNxhfoKVu3k2psg7IdRVzgKKC6XOaVHYbGKL4L0gjMDAjCM1E+Na2iG50?=
 =?us-ascii?Q?XpmKzKhgwXoARd/VDzWRKkuyCV81oAwmnvH8BSVaJC21rTaQwiLy4RXcqZTo?=
 =?us-ascii?Q?nImmoBiKOPuNfc/n7wcVsu5+oihy+VM/rz+rCMrM5758ovGjr2R93uKTi2Ny?=
 =?us-ascii?Q?geUoYurY1jkuPHNivrVeMSN8fEeIu4n7U6ct9bTQmHEIRFBacdts4A4Dqn9o?=
 =?us-ascii?Q?2sggXYwBBw4RK0EVPju0KSiROwBpUeOzXCH9dJCl67aBuUwQvOF2iVu3n8xa?=
 =?us-ascii?Q?f4RdAI8uyEdM0Uqi7EAnX0if1sJcAqD4md28I+tXAedN2hRN5s/on/vH3W+K?=
 =?us-ascii?Q?HV5zs1sl6wxLD7628YRfOfI1u5gguTjtf0MN9JnJBH5tgXBxdaOOP0aQtCVi?=
 =?us-ascii?Q?93+PmoBgXHvjTB8tT/MmY5j7gfUEFKZB0/rSnAu6DyvhnTlC4YCimbk/jHiB?=
 =?us-ascii?Q?URr6fcNsbg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de16d000-62e5-4c41-6644-08d9fd3f83c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:59:08.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOHFkZF6gK8teeAMQ/mkqyw7wVq2cCjNVQITTrzu38wYF6lqGYZ5f6Lzi1MY2ZB33GkSARRJIQyfrkj3U5EWTgjUjitpuVrhcoRlbTb0kGpvGbqPKJadWSROHuHIsKMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1244
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 54 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_cache.h     |  3 +++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index a21c1350eb09..97959eecc300 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -358,6 +358,54 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
 }
 EXPORT_SYMBOL(drm_memcpy_from_wc);
 
+/**
+ * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy from a source
+ * that may be WC to a destination in system memory.
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

