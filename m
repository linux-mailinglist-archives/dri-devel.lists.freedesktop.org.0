Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F62D4CC4CA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEC410EB93;
	Thu,  3 Mar 2022 18:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F37F10EB52;
 Thu,  3 Mar 2022 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331135; x=1677867135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+Cqvcrt+7ZGWgAjTjYItm/a3MJn4HSleurlJZTP2PhM=;
 b=Q6Fzoa2rk6cVKC5qRpPqw/pIrMzl2OrlxyAP/y+cPrxQA0ges3fkRZ8n
 kC6erqbBfAExZq+16f38NPF3tYjn2tK0d+Lp+LboZbSyoEuiTkh9ycKn4
 XFxSSA4Lc6g4AqfLeyGWbCwansZBpl35B+Yw+8KyNFmDSbGW5vGWCeMlQ
 yv19Ui3kUu7W30aWMdZ6MS3N9puKMNNja8iThkPTWgyWBM/4GEVRyfJSl
 WVYFtPQGhjdlhxv4ocHG2rsQhTpSSmKJ0dW6s/HAEC4WfIPID9zBASqN3
 on+l2nn7kVXq4IBHW6U0dR6PmaII5ENCBnc9E+0fo7tLiETn37auvhBK2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="340194553"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="340194553"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="545949951"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2022 09:59:07 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:59:06 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDw5Pja21fKfnIrzZ5ZK/1A5j76PfS7KkKuvibzqx/fecm3uT6GzjPvaDWziwuvlWDEM5rFqDVtX5V9Wqj3KtR7ogW1sdVGXcLREgcYe8BzqnBcIIEF4JbRnH67m6IWHTGn0Px6mPx5QrW+2fTSHmrSm/TgRNeYghUnMgTwStIVpAWRd7a0GJ3Nkc3/5j2kgd0qpWsa3qxIAiAgfSskqjlufaWYFjyZC7Xf1zR+3PN9OGNvNw3LPW1KjmtB7JBs5rgm1cU9zMYPIbfIr0F8NY5oc1+6IInxeTG3afqCrcLcS/eJ5P6XfU4FJP/uJglydlyAwa3kpdJue+FPiLJlxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etaYbe21Gya6kddhOekT9NIWbqUfpfaSDcPSi6FLwK8=;
 b=AsQj8DsR1m+vHhIB5/Asicv74l3mtY95rBJFFCGNuDvaTg3/Md1NDq+q5flc44xWLxbQStlhcZ647Lo5/oynPdbNz72tMouMxYQdWSvALGsVLkWAQsbY2pgYRiMsSpkMMKZXglxyJFrPuei0u7rqkadcAMTny14UL31aElbjfmRd3/HK7xdbX5CuUR+lWxx/TS2ZXBOC9T7P6b4tkwqnwfSxYt+HU/V1n+XtSL/96mnnGelkzHrnajJVohmvxKbMxFIX5Ertts6I8EGm7ObjeNoeOl1LwuJqORijotRlZOzOY/xYCWsbQbOdbAQqUwWkEioHHmRuogKMqvFgDk3A2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 17:59:01 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:59:01 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/7] drm: Relax alignment constraint for destination address
Date: Thu, 3 Mar 2022 23:30:07 +0530
Message-ID: <20220303180013.512219-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22)
 To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 628be4f2-ea26-4a2a-faa0-08d9fd3f7faf
X-MS-TrafficTypeDiagnostic: DM5PR11MB1244:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB12444F91CDDD5AA2A7CEDD0F9F049@DM5PR11MB1244.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hyoe31A3jQzuXu6dotY6R5R/QU3T8kuoxmFBkMoYUJjVO6uIf7gpIVH9d5Lcybih4+xG3gjoyf/40nt26eLrs7c+yPLWRw0IWFfjNb4yPZWB8fZyAHzPRSDyI5bkzLCbHWFH9MZZMdQ5RWoOuDhiy6N4Tb78naxpV32et3+3Dv8Slo//ZM9wcwoljt4yoq0ZNujBGd17TodgCMc+Vnj2cb+313lgZ57oEY2dDFJvtuB5PzsMR6oZ4PO9P2yJCU2/j2FYM97z85CRod9GhNax/aozSipeqzAMD9kwdewkJAMWNjl3R9nEIUt8sbtLtl1p1KgYjcojKC2Cjb4cRLJl7H6IqUnqKumiOCjTHDxpko5xzTo0XV3QesPXS/pugLlISrKut9ZoV6TXIedwHPbfbQlXS5G0VFvO/k7l6+R6rcNxrTzwXhSWKec64qFrc57egi0BrGl5rsNrsHEr/nF+r6c9ShAGFf7b5bppmGEiqpf8UOsKCLEz7+Ly2dsOz4Nuyn1looXqAZL+bjQk7dj0iFtKsLIzqDmGifdO72/6JNG8PJqSb8/hoEzC6pwIDVqCKs/e/RxnTVk4achSz02IkKpR7I8dWZXmjV/54hMlUjGJTv8RwEGz1SxdPmP5Fr9rJBIa0Jei/GATqpAY1xPTuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(38100700002)(66946007)(66556008)(66476007)(8676002)(82960400001)(86362001)(4326008)(54906003)(83380400001)(36756003)(6506007)(1076003)(2616005)(5660300002)(2906002)(6512007)(44832011)(186003)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6vDScvOCAv7gz7m+sTEUJNZlx2CycfPNzHPr5haES7XJ0alTYKgLhHxEK0e1?=
 =?us-ascii?Q?xunx2Ld9tMWaGokyiLr72hi/oYHOwETu9AfcOLJMcFKXQA7q6yTUXsn1YuK/?=
 =?us-ascii?Q?HirvvWyZme5rTh/QN2dALKWDqREpOwdSU8k/6kJJfWWkdE47vSGiJhcn01iN?=
 =?us-ascii?Q?VVxXFggOEuWgxp0tcodEY6YspEU8ND/dtsjF+2gPWeBurMn6am3pgbb3LeiN?=
 =?us-ascii?Q?PKHxZgxyhWNXYdhFY5ia0w/SrT2esbDabmqOSZy5Rj5pMjY/j2NIWMSlB+M1?=
 =?us-ascii?Q?Dtye3KR4S7qVVqkJaHkbpS87jEP/RpMHaVxepMAuLzBjy7sETNxYYyYjpzQh?=
 =?us-ascii?Q?FNXtoPnzrQDjlmHQrBb2TQ0Cfsi5Q4gGrHVffig+j6u/A1xSq/q//JWdGuya?=
 =?us-ascii?Q?lz+ZB8vSr001Prra6b6khk5yVsdnOwKzSsV253tecArvIS1z1G8HSDPdkanX?=
 =?us-ascii?Q?rvZ9c675Eo1OMvOaCUSJ9WtDz6WJtP2fMHoImJQN/Z45LIyKZNiQzVto1gyk?=
 =?us-ascii?Q?RE6JogViKBDQJMozp0b9a5B9EiUc9GOxUUxRmOv851+sAcC7c+Y7AYO25H4a?=
 =?us-ascii?Q?Wq3tu99GRhOaa5VLglvOl1vysEfQLqTCV8i6fcOVs4gUfzVFPCZOUYCn0o+d?=
 =?us-ascii?Q?RP8S7TPSU4MH7mewI6xu64r2Yu1HfA7hGN50ZcTQ0HBq+DutlJgV8kfqGZhw?=
 =?us-ascii?Q?qDHEwOy2TYEBScJJCKbi74kRGnkC0o+ehVIen7UOTce7/hgW95cYgO5XKihS?=
 =?us-ascii?Q?oyxd9Oc6SYygGgAhJsQxxWoKwKiH4uaGDTcVH11F3tNswtCuFiyYv6FgTtLm?=
 =?us-ascii?Q?NnUj3lpyEUcBFqeTrVL+dNyKfu+MDFUNEzaFD6CfhfzMluQqMfnEA9/v1uHd?=
 =?us-ascii?Q?QLuB5Spsl5uzX8puIIICUrGxTT5Y/kwHi3w9FUv4A9LHIzmEEycwCJ0miASG?=
 =?us-ascii?Q?/mgYXAF5tmlUEbx5ru/w93HTbZk6d/AvqcpeVsWppASVAXrEAM3IYvJJi1Pk?=
 =?us-ascii?Q?RQlpHr1tPt1cJhwzeGDGEcLPw+ab4XNTBQEwe0pp2SGMCoO6SYBeO44VIsUd?=
 =?us-ascii?Q?0RLiczT5mh7Q2iFoJ6noyNqAdOaMhi2Jw6yprw4HeSq4zUNpWv84geG++far?=
 =?us-ascii?Q?uUadjEq4KBydfBjJvPK5SSJ1y8dPGIbfivAMHT8H76aOjhCoG6S5LA39KwDs?=
 =?us-ascii?Q?Rjz6Yx5Cu2fm5UzEmThg15Yd0m0hz+QBhDVKCeFYI4AooEZKRERnIYnhfw8I?=
 =?us-ascii?Q?lkFz5uP0rOnoIcJK0pWDxI2ppmFZgMc+xRtbLqcAkWNf6leYQTdyz/e6F4MC?=
 =?us-ascii?Q?Rp8ZKs7ddsQ+jZw10MchzBZ9yd9GuGSPQLDtivCh4VbPF9M2zX8tYXlq2cSn?=
 =?us-ascii?Q?4knsAJvgZfPC75yzdhHHwYv8GMEdHSEwse1WZOzDpnWpLLzXg9cbQ3CUf3i/?=
 =?us-ascii?Q?x34qGVRhkJ7P/NaZ31/riTbRID7AoFsf1PO32ppCQ/1a9M327TUeeXWQ1xAf?=
 =?us-ascii?Q?SIhR/2qUdQVXaxIj4nnyXaKaXbXtIMt28Zcjec6KB5NT3ypeB+sjt0CzM0+d?=
 =?us-ascii?Q?cpaVvZPnuKauBQkaMc1gP3DX+RgwLicEOhJ1bLWRHkU1BScZyrjzKtbgr/wy?=
 =?us-ascii?Q?Pn89AC/MnJs42lVe8P6MhMdq2kCbgX236uomBLVlTQ1fyclsAMAHege/atR6?=
 =?us-ascii?Q?JYSI4NLIKLMB88B/10Q6G4hTlWn63SIom9jF6hV28hPCf8by3vn4XKsJhzsG?=
 =?us-ascii?Q?5ZHHQVwOCA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 628be4f2-ea26-4a2a-faa0-08d9fd3f7faf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:59:01.8360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVEjumH+775RRbZQb5VdkxMNe8qiWpwxKwGiCXJm7g/EaHFv+yA5SOqymziz6uHZ1sQfZBix6/kdOfq9xouD72teDGkRUwNkbJ2WY/Ik0CZkpz89u9D7eQnH+CMbXfU2
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
Cc: michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, David Airlie <airlied@linux.ie>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com, siva.mullati@intel.com,
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need for the destination address to be aligned to 16 byte
boundary to be able to use the non-temporal instructions while copying.
Non-temporal instructions are used only for loading from the source
address which has alignment constraints.
We only need to take care of using the right instructions, based on
whether destination address is aligned or not, while storing the data to
the destination address.

__memcpy_ntdqu is copied from i915/i915_memcpy.c

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris.p.wilson@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 44 ++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index c3e6e615bf09..a21c1350eb09 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -278,18 +278,50 @@ static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
 	kernel_fpu_end();
 }
 
+static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
+{
+	kernel_fpu_begin();
+
+	while (len >= 4) {
+		asm("movntdqa   (%0), %%xmm0\n"
+		    "movntdqa 16(%0), %%xmm1\n"
+		    "movntdqa 32(%0), %%xmm2\n"
+		    "movntdqa 48(%0), %%xmm3\n"
+		    "movups %%xmm0,   (%1)\n"
+		    "movups %%xmm1, 16(%1)\n"
+		    "movups %%xmm2, 32(%1)\n"
+		    "movups %%xmm3, 48(%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 64;
+		dst += 64;
+		len -= 4;
+	}
+	while (len--) {
+		asm("movntdqa (%0), %%xmm0\n"
+		    "movups %%xmm0, (%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 16;
+		dst += 16;
+	}
+
+	kernel_fpu_end();
+}
+
 /*
  * __drm_memcpy_from_wc copies @len bytes from @src to @dst using
- * non-temporal instructions where available. Note that all arguments
- * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
- * of 16.
+ * non-temporal instructions where available. Note that @src must be aligned to
+ * 16 bytes and @len must be a multiple of 16.
  */
 static void __drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 {
-	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
+	if (unlikely(((unsigned long)src | len) & 15)) {
 		memcpy(dst, src, len);
-	else if (likely(len))
-		__memcpy_ntdqa(dst, src, len >> 4);
+	} else if (likely(len)) {
+		if (IS_ALIGNED((unsigned long)dst, 16))
+			__memcpy_ntdqa(dst, src, len >> 4);
+		else
+			__memcpy_ntdqu(dst, src, len >> 4);
+	}
 }
 
 /**
-- 
2.25.1

