Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D86EFC04
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3EA10E239;
	Wed, 26 Apr 2023 20:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE9710E1FD;
 Wed, 26 Apr 2023 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542645; x=1714078645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tAQf0FEJlkeNWaMHKHFYIp6l7S0xHpih33tO5eVWotc=;
 b=h2ijdE0rT5gcfih/KuVioJktKv6ZuMQkN/85Ala3J3yvrQqUhf9iQFFx
 96Tw7FbaZlj8yElzuJ+qvMrHAQAdIPUn6DER6NK+W7r7+W8craG0uYAgU
 d9tXsE+xPjMZWdTjdxbgXX+aWW8hCRLjvXyX1VtNlvoKbqQFMz8PiOcsd
 XtQoq50/O86l/RlzzmTzGXT/zkR81aB9oKrxrKQ5gkCElHCwfGsffzAoR
 Jk2QFKVkW3FYRzFuztzYiAKBvitZSoOsAXVwcuSnIx058T4V/KaVwJwDb
 fYvQPKp1UlV7coaphwzXe7AvC5z/9/h9h5pH1gh4ACiAk3UW3x776B/B8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410249414"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="410249414"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868434967"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="868434967"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 13:57:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeejHLXqtofCiSxRlqdI6eZQcjkqm6GqPByTNjXIARGHjoG5HtK6jpXzn2Z9JkTwA0uNZ4upWcym2nAqq3hXDUN/JekJ8PKOhWX6Dr5xjZr60ToaI3a/O2goR31NRnwOue6/Wrizt2GRZgDwVTHIEWncZxIZJ450dIX5ObhuJ30+ARQyIK9QkC1twcCgmWQBH69cTRBH2sZaK3HpXl2MXw39IIqENDetZzeD9wwkD1gPXbPgiWPdxNWijFhd2x6/TtUacmtk3onL0JF/gGQ3JuRbcmY6MnloXe+H5NNetUik1E/BtgXn6lAqc6qcykQQKpt1iL+XrmSFbIIgF/+24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6z8xpPcKBdxwDkLShdRzfohW7IDq6Vp7k3CqLAxspo=;
 b=XFGj/LU0abmpq5e7XLeV0zJn3KrQ3lHCwdyjtzhca2tZKTqUIp31ViO9Pdg03lwFrLguC8La/llYCkU/z+8FKgD/mpKxZTYaluTKDuE+Zr1ieGJXbM4r5To/pIHMqQloFktkRSWqCqDVVWu/aTPNh0Oh7mC4mqvvm3YyLfPpJjHpYlUCH8nVdUN7p5dLLsB7OxaJX/6gyYel6dWRCZmPZDcGi0y7KZWf58ANiWZL2gxULVPqd/TJ3Iqo9uUaX4y1LrByeyhzWXKe7PccmA0AvEpDeryCsGgwa8mS7I5xIOMLJ9YMKO1hsD5FxyzlwPtExvCbOx05ghUGFtJxv0T6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 20:57:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 01/14] drm/xe: Fix print of RING_EXECLIST_SQ_CONTENTS_HI
Date: Wed, 26 Apr 2023 16:57:00 -0400
Message-ID: <20230426205713.512695-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1f7bfe-0de8-4e6c-22f7-08db4698d50c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /jrI6vKMaS+D8G316B1TeACs8dJ26Jlzhhei8dbjA/O4A6rXX+qgcbAslf8WENQZ2+mIV4t3fudmVOavLro5Ixuy00XAYq7tfQwB2NpG5a2LBuWWvGNlMdApLOdADxOerGmtuiFbM3IsjYnHzgHmj9M4vw2oLJBGe6c0NTtQ1mw46JCADwSKsZamzXOSldpUg/xMzSjyQOK0AtvnWbnGnvr4F4SZ+d1P9iUuOL2Gs75LzD/35sXhWrjtE++wHPjxnG4xfD+edaE9T3Y1gXj3TSRI+XLq0y0GhWn4P7JduemMDLBiRsX6DfQQAoDRmW1eUknobUAMPzfs/6EBYOs/mOklc/5kZsiE2oQTv2dql7Y1/nbXLqZSEt0qtK4sIYmCvQ5P2IeN4sZCyYtq3j30c8Uyu9XlHXfkLZzTmjkkOOv4LysJVQ9msRfSn/XSUwxNDIrOw03weBx2E02dG8N/HJu/tGMrv3IE3RTIU5o1Ak/7xfV8XkO6gzxzg37gmKjvsFT0lPpEfmpFsbIlyFhNEV/zsrLzhuhDUpUT0XSwI8PRP5T2mfGgl9NLe3PTecVT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(186003)(1076003)(26005)(6506007)(6512007)(316002)(6916009)(66476007)(86362001)(4326008)(450100002)(38100700002)(82960400001)(66556008)(66946007)(2906002)(44832011)(41300700001)(107886003)(478600001)(5660300002)(36756003)(8676002)(6486002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Vc9jxkUpRtQQxmBhk5FJa9D9cOi/sqmXWJl3wPdOc+CVPmOq0Tz+XuhNLrB?=
 =?us-ascii?Q?UMaCzOZG/fn/Ui/C7aFZILML62x6JCT1SRkK0QfKBVZvg9TnJmbzOJlSi0jy?=
 =?us-ascii?Q?9cLkVxMSfkl3MHt4G6tzMk/n6zbdHCt5HGvrPO9TUZKEEfMBcAMT0hsPDhDu?=
 =?us-ascii?Q?XhW4OCe2oJHdzuhPnU113c9fAhjh/EPlDhLwWEaGae1/rsJ/z5pS7eLeiNfW?=
 =?us-ascii?Q?/vyWdsTpK3a2Wks+Vg+HpoctYuBaWf6cGihFGD2j6ZjbFuJnR23zB5hmxe6i?=
 =?us-ascii?Q?1qq3wyqXyPErYF06B4tOpYo+s0oY/lF/bgzo/8wlT8Iu7R+r0e3U3ILXJz2w?=
 =?us-ascii?Q?TfQbdlZIaWVhUT9TH/mV/JRtQJQCERXdFjuIKJklTPJjyiXdqFSvOqIs7Zez?=
 =?us-ascii?Q?j2/UZ7bECAiDTo2xH1z1vjtLYt+xN6DMi8dw9AqD/Bi1E5NnPaIVYglZc4Ub?=
 =?us-ascii?Q?2z7N0yz5NTg+qnbofnR1ZlEt9+2jvby4zYo1NvuyGt/DFjB+fAT3n4sPpaHJ?=
 =?us-ascii?Q?nR//L4sYpsCaz8hBLNPpgy+LPQgtKA8/gpz1eOwxhotUnPs35EeidnvolWiJ?=
 =?us-ascii?Q?USgDoh467o1h7VIowDAOCOAVFXLcHilK+OpD2rMLv/xAhJTC0kPQM/4rvQF/?=
 =?us-ascii?Q?TuNW94KBVTHulq877ZNgF5VlGHW2t1g9CsIiSub+Vt86+bleYA7zcjCWoOSM?=
 =?us-ascii?Q?xA7ZYh/p7/Q/8GPgjX9KT8tDxl9WQpgnyrVLM25vG8JJAPB0lzoMXQU2ifKT?=
 =?us-ascii?Q?wNCeTH5WmIewxJcuRJIaa//NWpilDlMuZ0n/FeTbMqcu9wy3LNqV+vQxkjC8?=
 =?us-ascii?Q?WeSiuGirpqPwa4oq7uVMvkpEixnm2kxicNH4CeRzUebUkW4MGvoMFQOQsdc9?=
 =?us-ascii?Q?s8/j6OKz7PCFcmpbsMx48060K/BSyyIfx7SZkuCcUHMSXljUr+ZFWeqLQXvg?=
 =?us-ascii?Q?kSTb8+Qq1QwHVDzu3U0/wdsRT/9qBJca4cIK1onoba6TTr/P0lNbSNsRph/N?=
 =?us-ascii?Q?izpNv11Te83ejT9cKwWAg+UBGBbVWgynQDl27cX/9JTgd+RgcIlaJikTQ0FV?=
 =?us-ascii?Q?sYtlF91B06rY6jXWi2Rq987IvjzpfeXzc6wt9SD8J8+QuhtDaDbqE6Aotrrh?=
 =?us-ascii?Q?8AHXQ3fxbLTWS9tf7BxBb7q6+qm1RsJfDQKHpNbPqwVFapddHJQiyQ2QDMm3?=
 =?us-ascii?Q?3E8bvG9u921dhX7nvxJSf38kRbCAUq8pSFsByfDap/k0ZUYLxrwW6IH4a7pC?=
 =?us-ascii?Q?ibzQOzPVZQMH7gCr0uTA91rtYHw3Z1yP8n8RD2J7Zf9LAY3YfV1wAIWZ1U5n?=
 =?us-ascii?Q?DYcmo272QyrmcXosqntAuJXsGSlz3/EHmJR4qfVas0C/m+0qDg6AbzSqtGGc?=
 =?us-ascii?Q?Xo1wgIVBohGRS8JXBGP10KZ8iw7EQ6ksb0e8coPLuTPTwu8iYi9CpO7PkfWl?=
 =?us-ascii?Q?QyrAkKDGttkYOGPj1/QgiBM3WbB/yrO88YNigjhe6FphXUYFLpNhipYf2U4A?=
 =?us-ascii?Q?ofupWk+WuTF7ikaEuamPy7yikjpyrlDPyWRXC49VoGpJIMSLlX9Qqzq+TEsX?=
 =?us-ascii?Q?ivKwl5K5fLNLl31BFdsoFhNNS5Z0Yxlcfyyfi31v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1f7bfe-0de8-4e6c-22f7-08db4698d50c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:22.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMwvCNP//0dpIj/ioU1djNWlrIew0macnWEqzaCSQPdYZaZWEXUJl/dfN8leeVwWOD5DnKy87cbhBXLzB2x07Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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

On xe_hw_engine_print_state we were printing:
value_of(0x510) + 4 instead of
value_of(0x514) as desired.

So, let's properly define a RING_EXECLIST_SQ_CONTENTS_HI
register to fix the issue and also to avoid other issues
like that.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 ++-
 drivers/gpu/drm/xe/xe_execlist.c         | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c        | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 2aa67d001c34..a1e1d1c206fa 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -84,7 +84,8 @@
 						 RING_FORCE_TO_NONPRIV_DENY)
 #define   RING_MAX_NONPRIV_SLOTS  12
 
-#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
+#define RING_EXECLIST_SQ_CONTENTS_LO(base)	_MMIO((base) + 0x510)
+#define RING_EXECLIST_SQ_CONTENTS_HI(base)	_MMIO((base) + 0x510 + 4)
 
 #define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
 #define	  EL_CTRL_LOAD				REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 02021457b1f0..37ac6473195e 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -84,9 +84,9 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	xe_mmio_write32(gt, RING_MODE_GEN7(hwe->mmio_base).reg,
 			_MASKED_BIT_ENABLE(GEN11_GFX_DISABLE_LEGACY_MODE));
 
-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS(hwe->mmio_base).reg + 0,
+	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base).reg,
 			lower_32_bits(lrc_desc));
-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS(hwe->mmio_base).reg + 4,
+	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base).reg,
 			upper_32_bits(lrc_desc));
 	xe_mmio_write32(gt, RING_EXECLIST_CONTROL(hwe->mmio_base).reg,
 			EL_CTRL_LOAD);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4b56c35b988d..23b9f120c258 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -528,10 +528,10 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
 		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
 		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS(0).reg));
+					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
 		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS(0).reg) + 4);
+					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
 		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
 
-- 
2.39.2

