Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD0D51047C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A5D10E8BD;
	Tue, 26 Apr 2022 16:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA2B10E880;
 Tue, 26 Apr 2022 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991789; x=1682527789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=50NIus0lsSqURxp0ldGuh9zEUcuec71GhInzszKlL0I=;
 b=FjTrlhd+orzsGE4C7G+RaIrbTRHKOFt6w/XTX2mNObQfl0iuoT0ci5eq
 C6X0ggwHHDiD+wehVJ+0qV90RD5sqkl7LeJwmGf9WGHgxPGeQaWOYao+U
 j6JNdBrY7lvTJ7JsIFFsQ63BCb9sQYIlfW7PsIceTSYOvfUCrlJvgYRWo
 Dixw59mJz9NqCnCdkRWTZ7PdzLH4Xc/4w5dKRVpzXGfPcwx6iT72PHI+K
 EPGrnbTy2xG9wruFvmPkWQVv95niMPxWA6VOyigw6b9tg1IGPXk/h859P
 i0E5SNU/e2lds2Ol36QZyaN99/4OR8MQloVFXFsi0MpFf7ybBLPFBa3Nn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290797434"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="290797434"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513249798"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 09:49:44 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:44 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:49:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5/r/WxB0P8fMeDB0jzf9gmE35Q35cs/ESqGfo7djBGIiTEKj92GMBvgxS+xxrFJb9dW65m8XCvnJWsLJyfg78JQAZNVdr+AZZoCTjNfTQ7VgtJ0k/a1kxcO6tEzO7BrIs6sKqokDvOSdaqlwMD48y2AaRSt9gr7P8IjYPxP9F4BFLpLNSlPDul56gBlEVLpDIEci8Tr6AaD+/dyCZdzLpZnw0Qfc+moArO8ZvN7Z9CJjwXDjM1qGWgmkZupd3Zo1V+BKzdTQzf61yNASwDeLD6bQlI52rrjqceOFUXOthH4rqS6Oci+LJ7TuCIAremnKsstmkiiJlWCxnd0GdT68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp4dnkAmbul+wKoDZZOdS7H3ue3jNW/HqHTY1jK/1jw=;
 b=CtinAkxDwrZzz69RUqTMtqYivN9M+vYkbfM8fU5dC/lIK59onwK7fZS/dHr4i7//BQ4gebkeMLZqiXZ6HWT2zk1vWPw72Wz5oyspeUTr3YgjEUpfzz5SKi7XuevxWylg/Zk0+6Xm334pWZuesuNkgzOxCWl1XS4KCq0WEAVDunzTbztNatl68EOAtewcmBTx79o5Po3S7dUxVhq3LrMD3jIVwJZsJNNBgM0qMc6+U5YaaSMURzKPTNHCpp6SEtopSo4oo7ddr0xp0fr+ec388lnak6vtegIcXMVaxbaolJINuKc++Z9uXnKryPc8Dmv6OVErFe/DA+XrmlXjD8aLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by MN2PR11MB4366.namprd11.prod.outlook.com (2603:10b6:208:190::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:49:40 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:49:40 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 2/7] drm: Add drm_memcpy_from_wc() variant which accepts
 destination address
Date: Tue, 26 Apr 2022 22:21:43 +0530
Message-ID: <20220426165148.1784-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cadacff5-030e-4320-0f51-08da27a4c1d6
X-MS-TrafficTypeDiagnostic: MN2PR11MB4366:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB43667694075F14FDCE1BD3109FFB9@MN2PR11MB4366.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BE/CH7Seq/fx0WPrqvq81pYzMDHogdIpAXEvqjPGWd+yR9iKfFYqgD6qBXTx/thJN8/VDhBCVZjsuvHrCW24Y9jyP/mrNT00txEkFTumV3YUiIZ15Nmca8YQqIMiLnLoxaHDSexE95zs/xgRUv5IMEompgOOC0Sdt9v0SIpow7keWdE7DhZiPWdYayZfH2vP6bfSjXEXaWWCZnfxocGJIJh2rpmbmtJJymXlPb6uH1gVhx10Oc2Na5WnQQYo3KT24RY8+0mNBJ6wiVzoMrnXvkoABxkTw2UhA/gOjJb4HX1vtyUhwJq888B/dT4j2EGfG0pomTycLTKg+PAV9SbXlnqfOy9m1SJYpAMLp+PAAsX5V9LlwKz963RWXF1QGWjZxmuqqHDDb1Q7mOnL/Sgcu0bewbKar8d1DUtREvnerwOvbiIf8a/z+8RlSmuBIVYGTdzgR4DICa79waOxrRH9wH30SyA3KRZ3lXNQjUVVAyBHx4G8qQgP6xj5V9d54UZDHW3inpvktbiG+bHXSdT+g0GCp9ClCEN6+zlB9KaEFqvt1J84Pzeu4VEcuHk+rgX+A02wid5fWijaUFhiowe2Ous8HdB6G6LQsHiSACbRAFX5KFo2WD+n9W10NkaRmYBw4t8v2vwY8o/wpAQIT3w2sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(66946007)(6512007)(5660300002)(82960400001)(26005)(8936002)(66556008)(54906003)(316002)(86362001)(2906002)(1076003)(38100700002)(44832011)(6486002)(508600001)(4326008)(8676002)(66476007)(186003)(6506007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?knJfWzQu06mI+Yr5JkHZjzrk1YokhhtJeUAzJwr6QwtF/hd/jNIfY94zAC04?=
 =?us-ascii?Q?9PC5iUgjAiv10xivFPTpPMgekCBvQswCjzfrRVIT8y3cjPR49AU7s/Oz8aMy?=
 =?us-ascii?Q?nlXbkLrUAjeI1WtzLDv7R2MbpSwmNXOeQe0xraGUmB/qPFt3xnBFlkaQO0s3?=
 =?us-ascii?Q?kHCXrPH7EhKFRQI9MWFCJOBIjQRDDxmrc+bWziNmzmfxRL0zVBd6YKCAj64D?=
 =?us-ascii?Q?EBclMkDXdJSBzZou2dnnR3ChtCa8Ps/jK62phpK6uXnO2D/cCiBUirA8dHPf?=
 =?us-ascii?Q?6I0P9vvo0bDuQeg/O4lhq3lA+e3i5BCzfNO9YIg0Lh2209Ml9JNLHVswVmCM?=
 =?us-ascii?Q?h1oiKDaOad/HpXRLiw1zQCejAEhnTLsbJUkTXeixDwrPZfGUZg8HrNqSVwTy?=
 =?us-ascii?Q?qBexGWj8kSShrEowLwFfHjLrZypEFt43RQZ9Oe+66AZBrBnt9p2vHcW+DtAy?=
 =?us-ascii?Q?XT4DJ2p6ieJNcLJNlZG/gsjq8dwvlc3ojhsn34Q0imkHI48fNJ3FNzT49hrf?=
 =?us-ascii?Q?+v5rQUMSH6wjyNfogogp2RD0GXsZRven7SP2kBeD24U1hOjqZ6dGgpwrlPo2?=
 =?us-ascii?Q?9Tsft0qaFjTgxIPSCeufwnE+xoZTIQJm1E7R1AJI4o5dKuOz0Eaflk8k62iN?=
 =?us-ascii?Q?/LxzhwhaiDZwgMrgoqhBQtaReFc9BPkJrMa/59xYfc/Z1e4q1v/+2Yvvv1QM?=
 =?us-ascii?Q?eGLNsPuvPSWZAc/CagrhUksC5uF7NwbQKB2NxI33SEqzs0ZtLHeqh9+rpQ4F?=
 =?us-ascii?Q?3jGHUGu2hpoK6V+wsJLA1WzJgxrNobrySGRDyHFzEqLYiM3lHu6UTbVa6UKV?=
 =?us-ascii?Q?X46T2I8vFaOM9OwXbGRSjOdHyfKK0hnzVlFYcYnt6wh54Wynocc6+pjPwz8h?=
 =?us-ascii?Q?9YTzc3bua+M0bg7dSVnBIdYH6vDLn7ph0UP7XMs0qwfyzOsWfUjvSebp08uR?=
 =?us-ascii?Q?ZjWTMVempcBN8FDUQQgXrGs44lOQMjZOsbAdiDV6BlWxiN/XBGgy+ak+l/IY?=
 =?us-ascii?Q?tKOtpY9HmynPTFrUni9Kg77kPUZRgw199wwys6/r57urWj4IWP3LR/MGhaaK?=
 =?us-ascii?Q?G36nlmqxDZp2PPJ02oM/2IsMUBMGxhWiSfAXY0NhR87pKxyCDTvWklIYQO1d?=
 =?us-ascii?Q?slzCeyefR+nNsirADZyhNGuAWvKDOKKNKOYXMkr2MJUFWKJyUYjBJwdbbRru?=
 =?us-ascii?Q?ZKj6PgyQtw19TueBjdcyAqiJKAXyTKjgH/ybEJSuVv9Tf6YHuoXnagiJJ4bJ?=
 =?us-ascii?Q?7WdhQKDUOYzbqoQpG0umkRm3dygxPlcB4UN6g/aYFwUWHwbaO0y085A6M17Q?=
 =?us-ascii?Q?K5rEc4ldYRxGIQf5OnzmdT+Ool+XWlT1F7iM5TfWxDXgd0sOf0HykcEFrNRP?=
 =?us-ascii?Q?HyLpT4Nw/dmU0Xw5R+Y044cKwJNVSrGeoO5OccB81C6CgZPIjOFNcaxbJvUT?=
 =?us-ascii?Q?mtwzNegu0+rMFFCKQOZP6pHzZvRWskhwKCa6L9xM268jTisBX0NhHZ5B3KkI?=
 =?us-ascii?Q?luyu5hcCmKNIegJCexIGLn3yF5aqD3MsOrDmUnucxQHkG2ClviEq68MPHrWF?=
 =?us-ascii?Q?jhWC5ZXst9zs6mhYKHhcPDH69DW62F9/57+einAyRjmgnJxI5hhB9Q2aoLLU?=
 =?us-ascii?Q?EUcte2yAdG32hPUcr6dM+RMq161BgBCeVyFVnOsuB8LdmhEs83glFVDx5GH6?=
 =?us-ascii?Q?in9c4L596thBt7mVqLaz90O8QeURb3KVWmy9g2LfaO2/avt38JcT/XINvKn6?=
 =?us-ascii?Q?uFt8LGtB7U8i692X6V3kEh212Xw9ytpFU3DuTmbgJDq65Xl7liqO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cadacff5-030e-4320-0f51-08da27a4c1d6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:49:40.7745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTfaag89zWrBxkcY7rBqjMrfyb2GhJ0TtSurSCNvieRk4LqqENiNmnJpL8uzT0CKHom8aGOEIb7NlvjCnsJIEvQkevvuy6AvvXyXy8WCqZLsSmpYrgXP+kp2BE6S7DVb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4366
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
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 David Airlie <airlied@linux.ie>, lucas.demarchi@intel.com,
 siva.mullati@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.das@intel.com>
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

v2: Added a new argument to drm_memcpy_from_wc_vaddr() which provides
the offset into the src address to start copy from.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 55 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_cache.h     |  3 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 2e2545df3310..8c7af755f7bc 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -358,6 +358,55 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
 }
 EXPORT_SYMBOL(drm_memcpy_from_wc);
 
+/**
+ * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy from a source
+ * that may be WC to a destination in system memory.
+ * @dst: The destination pointer
+ * @src: The source pointer
+ * @src_offset: The offset from which to copy
+ * @len: The size of the area to transfer in bytes
+ *
+ * Same as drm_memcpy_from_wc except destination is accepted as system memory
+ * address. Useful in situations where passing destination address as iosys_map
+ * is simply an overhead and can be avoided.
+ */
+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
+			      size_t src_offset, unsigned long len)
+{
+	const void *src_addr = src->is_iomem ?
+				(void const __force *)src->vaddr_iomem :
+				src->vaddr;
+
+	if (WARN_ON(in_interrupt())) {
+		iosys_map_memcpy_from(dst, src, src_offset, len);
+		return;
+	}
+
+	if (static_branch_likely(&has_movntdqa)) {
+		__drm_memcpy_from_wc(dst, src_addr + src_offset, len);
+		return;
+	}
+
+	iosys_map_memcpy_from(dst, src, src_offset, len);
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
@@ -382,6 +431,12 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
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
index 22deb216b59c..d1b57c84a659 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -77,4 +77,7 @@ void drm_memcpy_init_early(void);
 void drm_memcpy_from_wc(struct iosys_map *dst,
 			const struct iosys_map *src,
 			unsigned long len);
+bool drm_memcpy_fastcopy_supported(void);
+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
+			      size_t src_offset, unsigned long len);
 #endif
-- 
2.25.1

