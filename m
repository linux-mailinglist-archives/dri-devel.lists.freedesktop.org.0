Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2164D1DAC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA7910E6FC;
	Tue,  8 Mar 2022 16:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CB510E6FC;
 Tue,  8 Mar 2022 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757979; x=1678293979;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=9M9vjc7rB1I6hxgAZv6fsi1VaqNAwEdF5vxLR+j2ddo=;
 b=P+pHQRch1D+plLbQiBzfZ/qcDDaa6ly2yBquCt2efjA/RsBmOiRMn8YN
 jGX2vmQEERII6UgjAm9n4dyT02XfuKfoOZsB8V6hDUnfuo/GhspfQbSca
 s4pbcjMLjSK38gFTEzV/nQbIyXnijrOnfV68nKbkHuSnh4IBz6RluT8hx
 ydI+Yc7+KsSK3Xw2p+78GpR21Kz9GRGK5Y6JhOSBtsNpA0aGxUMNHf+tI
 tbHbKZhG2ZTKerlgbzSyyI4uwnlIUN7egAqy2n8MfTq375/8q672GlTCw
 3JoRdrds72d0TZZ6vsz6NHgBGpVWuUcDxif1wDOZItw9L/Jb0hXQqpe9A A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="253567451"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="253567451"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="641813984"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2022 08:46:16 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 08:46:15 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 08:46:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 08:46:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 08:46:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCJ55DkRdEBA5ojtiEquVz9ykST5Mn4gFiyVHS6d7yh6NqelezzllVpNkvZlb9V5QtbnflRYte8dExuAXdHeFMY/GvFoKMUtNgXa1+wI0GvThbm6ewYjZH7tbigYEW6XhEhTHkZEHBTNvpyC2DDJZRsvOTktgvA1HCmpWODslimDoeaKL1JKdE4yeXZGbisREJIEzeplSGJC6Y2KDvCDofUr9BAu19Ftnu5wtN1PPomJohjeip3SirioJKrz3iLxq5Vz5R9Uo9S2VtQl8PIo/fkcvjl+3bGR+Rmah8nzsLrYsrIYWQu/yZ6DScXOzv/vf+LVLf8d8AanwFQa1YmgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pA7+mjCJ9HLSJDwN7sOWZXrM5cynfw22GdOuy+cxUyk=;
 b=D/FyjqtVBdPgWYFzxQI6BqmWUcc/mt3PxKANzjOa0Ul/LzrXFz0Wi67ApJGkmmtk7Gwp/bnVMHXAMWtsfUmhQcH5H6W6WRDipkjeAhcU124fE5MZaPrSA3o2cu53h7JyoTTphWN2fvONS6QmNSfpAzOLibDrzU9q9WxM6LghF9ZYknMstRjshqEYJ+E36uFhzhKmfLvG+hJKTzwn379hj3PPf1vlWr1mGmTrNGdigW3RY2GLUgR4lfX7kcnp49MNqFOSdDslOkLLSmZVUaiZnR/xlKG91TCZOwrlrNAMkk7op2iPN8PkZNm0ypOfgCz5yQ9l40VVIj1tUneFQFsupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.23; Tue, 8 Mar
 2022 16:46:12 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:46:12 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/guc: Use iosys_map interface to update lrc_desc
Date: Tue, 8 Mar 2022 22:17:42 +0530
Message-ID: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b3bcbc3-814d-4761-4c06-08da0123276d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB3493693B233B3DE87116468E9F099@BYAPR11MB3493.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fQiG8MTsd4puLUg7AL0UpeLgoR6oLpdAw/iQCKZjGFUoOADN5ob/KmspbsRnQjsrbUjMz4YYWwYCxsM0q2dJKNr89QS3xl8bagEzJ/M/QaHgkXFJnyfjgKWtqgitotPxXwyK5X5aN0Vb0TchEV0IdE8d5ZzFQ2gJJLjQ+aOFju3l6RRUL8baT4MI2bvSZNiIptGM6gdW4EfdgxCM1K0IiufrpiOxGrGB8es6o/KDCc+5xP/i2oAaqeCWR251/holwisDDzn0vbx3l1PWxyeTfYNBs4P2/arqAgLMfC0FMG91OLyGwLneSQ8hcuXyzxXFuiSk7vB1y2UD6rCkW4Q0BS+X+utfPs54M3nZWMrYaXtKBS3w4AAUvNNmQip5357v4ep9Hr0+6WA8dqKAdHiNOv4DL+52RJdFZn4rEx6P1gMnvikaKg1GTqxckyY5aMMkJIu9l3fuipn+RswWl3nVxd1W0HLdZd9Zcu77Dbu9RpsxWxrMtId6M4LBR83OQYInqyK5nmayJw/EJYwScd/Z8+tG84e5fQxgmWMuUC3D5fB6KXDp+PSGFs9kWiuAfFFrnPfWm4qHYFvhvmptI0x8YN17TheGtYajQLKdcntFPOHrogDxEmDi+6Y1To7V3MKI+BbR9T/W3QTfASW0t9zMLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(2616005)(44832011)(6666004)(6486002)(6512007)(36756003)(6506007)(83380400001)(5660300002)(508600001)(966005)(54906003)(26005)(8936002)(186003)(107886003)(86362001)(2906002)(38100700002)(8676002)(66476007)(66556008)(66946007)(316002)(1076003)(4326008)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5rJGGh5k8/GFyXQYrLYsjPiMAbjY1uV/OlxHlucC4HJmIGv16AYeuEJQolAM?=
 =?us-ascii?Q?qqnQpNt8TVps/2kuUL9rklWqULBWiyP2kUZg34mZvuVEKFCh/AqcWyViLg5k?=
 =?us-ascii?Q?YVtevK1PvkKIeK14jO7oFsUdlm9x6OQ5gYY65oTxsooFTNHORmE8hFE3Xo7r?=
 =?us-ascii?Q?/3g9hzwm3vXO8nhGe1dh/17XjWjRx3F5x2rVzwARhUTQQyVKrto/5kkxC8Zg?=
 =?us-ascii?Q?Z+6JgKAMgyIz77HiVlWjtQpUXox6GvIiPobFLUqx3xxEsuO/2eqihXjQ4dbT?=
 =?us-ascii?Q?WEE4QveHBpi3/Alm7Ki6WZzB9+BhQmPWmV4vKva8Ec1epeweetAFe72QNqp2?=
 =?us-ascii?Q?vBnPDszs3KOSHFUhPwaGzBRllvfdAFOD7TfriQAtezvQbcVUEAZtK7N4S76t?=
 =?us-ascii?Q?qoQ9ECLlWqioVszGYRfV8elEPVddFnCPohdzOrtsA+Rf+sl+IThW0+o7byTk?=
 =?us-ascii?Q?yhZ12Z4bwRnmsX/OR+DdiuNd7CTPiMQHkeQTwJ5hGUmxM+CzuqfTzk4ArIOS?=
 =?us-ascii?Q?uTJkIBjZh911lKNc5yH1H1BghtsMHxa5h+hLuGABGJAUhQIou1mYksxmFIqF?=
 =?us-ascii?Q?rjfdyNbRfVP0M72sWAgIOlv5Ma764pG1ci0Sa5ctNSiuC4UjUKw6EQgOO70N?=
 =?us-ascii?Q?aJNort7Q3DKEXyiCOQebKO7+gt7rre5pfaOEqpuKplDbkFvNJGq+v3D0tldt?=
 =?us-ascii?Q?TcxFWymJNLe17N/tvkA9Gn0PO6mt6Fp25UuDMZtu3GupmJ1sMFcbtOr+TkQk?=
 =?us-ascii?Q?TJU1tQUadx3hlutu7qlibBIJP1H7woCAI5OHgI0bJbxFR76THh6hf/sUHTTC?=
 =?us-ascii?Q?I8AuC4rrLS/W7KsCLQVhDByC4g0LEkqUOYlv3YnWbJlgCM6ZAAYsoykCILHd?=
 =?us-ascii?Q?gAG0lYxuioQ5Ny0ubmwGvMMdOhM2td997YG5Rz5N85qHpwFZG5xOFWBaNB6e?=
 =?us-ascii?Q?ddMDPOidJvQLbhCqRj07OWG8QpKi6K1zFzgUH5yWhU8pgktsr/pXH8SHjHdG?=
 =?us-ascii?Q?LsomXyUKVlWwx9fkyComJL7DN0QJQWz2GOfpaNYNQ/rGxEmFtrKTu+LE0jPJ?=
 =?us-ascii?Q?YAOIJQQr8asOjpWCM54/jf0IyXgdnu5yxhMDZFYSRI12GK02HGf3HwyxrC3/?=
 =?us-ascii?Q?DlghsfArOZk8L7QedCNYmAqZxlIMf2jkxdiPhdgTmKVx7nZI6bPsJisyopsj?=
 =?us-ascii?Q?h9KKbo5zZpjTUblJAfCO+utsL2wlNwOg7M+G7oXOEMZsjKMRPkDyrvduDEv3?=
 =?us-ascii?Q?vfLaB1r1eyFDHRfuFi0dB+j+94wJsKx0YkZVe6TyuIaydb/LNTI0rqF22DEP?=
 =?us-ascii?Q?RlurmhBOUHC5Xh/9T9dbN6W1DP11T6Pfks4xCnGufypTJqBXIDZL9uX0iIh4?=
 =?us-ascii?Q?4FBEdfz2WSO5nmPc1RfGTgTxZQkpCeVZHjlFsqFa9Amigmk30ug023Vuo0yl?=
 =?us-ascii?Q?2TM4Mk47pn6qqU1oLe8sBAxL5VfjQfWNE7mG3VhEZBn4jXHaEaDNDfHPh2Z8?=
 =?us-ascii?Q?45PqGM5eUKgV4BkicGYCZ2Ah3Af5kE2VU96Nn/d1Wa0tWlKdMc0QYVJgMpZL?=
 =?us-ascii?Q?E3uzcPeNO1WAKnn5OIGuYmZSPtiw0ZrZT7hezuDQp/mjnZOvr3eWTmtUk+7y?=
 =?us-ascii?Q?9KVjDMCF4JrZcjDZUpZC85KpKQflB8CSuDyFSrNwd+37lgrjLGbK/ylFw53W?=
 =?us-ascii?Q?QOBAGip/Mp48uAtn9GY4GRXBqnOX/rihCX83vCsbp5yvNtUUp+Rlmtc7Je3N?=
 =?us-ascii?Q?TJcFtPtE3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3bcbc3-814d-4761-4c06-08da0123276d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:46:12.5166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkK2/F8TH6OIERxr8ZQcniyCxJAQuexWVxNezlV34k4VPUDDtdPpjOlLYi27sv+Jb4TcbaOWhOgy8bVJ8h37s4HGm1HdorKv4OSzobdCYCHdTqWGGOjTBBo1I0ml0BQw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3493
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
Cc: Matthew Brost <matthew.brost@intel.com>, michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, siva.mullati@intel.com,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is continuation of the effort to move all pointers in i915,
which at any point may be pointing to device memory or system memory, to
iosys_map interface.
More details about the need of this change is explained in the patch
series which initiated this task
https://patchwork.freedesktop.org/series/99711/

This patch converts all access to the lrc_desc through iosys_map
interfaces.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 68 ++++++++++++-------
 2 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index e439e6c1ac8b..cbbc24dbaf0f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -168,7 +168,7 @@ struct intel_guc {
 	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
 	struct i915_vma *lrc_desc_pool;
 	/** @lrc_desc_pool_vaddr: contents of the GuC LRC descriptor pool */
-	void *lrc_desc_pool_vaddr;
+	struct iosys_map lrc_desc_pool_vaddr;
 
 	/**
 	 * @context_lookup: used to resolve intel_context from guc_id, if a
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9ec03234d2c2..84b17ded886a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -467,13 +467,14 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
 	return &__get_parent_scratch(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
 }
 
-static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
+static void __write_lrc_desc(struct intel_guc *guc, u32 index,
+			     struct guc_lrc_desc *desc)
 {
-	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
+	unsigned int size = sizeof(struct guc_lrc_desc);
 
 	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
 
-	return &base[index];
+	iosys_map_memcpy_to(&guc->lrc_desc_pool_vaddr, index * size, desc, size);
 }
 
 static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
@@ -489,20 +490,28 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
 {
 	u32 size;
 	int ret;
+	void *addr;
 
 	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
 			  GUC_MAX_CONTEXT_ID);
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
-					     (void **)&guc->lrc_desc_pool_vaddr);
+					     &addr);
+
 	if (ret)
 		return ret;
 
+	if (i915_gem_object_is_lmem(guc->lrc_desc_pool->obj))
+		iosys_map_set_vaddr_iomem(&guc->lrc_desc_pool_vaddr,
+					  (void __iomem *)addr);
+	else
+		iosys_map_set_vaddr(&guc->lrc_desc_pool_vaddr, addr);
+
 	return 0;
 }
 
 static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 {
-	guc->lrc_desc_pool_vaddr = NULL;
+	iosys_map_clear(&guc->lrc_desc_pool_vaddr);
 	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
 }
 
@@ -513,9 +522,11 @@ static inline bool guc_submission_initialized(struct intel_guc *guc)
 
 static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
 {
-	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
+	unsigned int size = sizeof(struct guc_lrc_desc);
 
-	memset(desc, 0, sizeof(*desc));
+	GEM_BUG_ON(id >= GUC_MAX_CONTEXT_ID);
+
+	iosys_map_memset(&guc->lrc_desc_pool_vaddr, id * size, 0, size);
 }
 
 static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
@@ -2233,7 +2244,7 @@ static void prepare_context_registration_info(struct intel_context *ce)
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 ctx_id = ce->guc_id.id;
-	struct guc_lrc_desc *desc;
+	struct guc_lrc_desc desc;
 	struct intel_context *child;
 
 	GEM_BUG_ON(!engine->mask);
@@ -2245,13 +2256,13 @@ static void prepare_context_registration_info(struct intel_context *ce)
 	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
 
-	desc = __get_lrc_desc(guc, ctx_id);
-	desc->engine_class = engine_class_to_guc_class(engine->class);
-	desc->engine_submit_mask = engine->logical_mask;
-	desc->hw_context_desc = ce->lrc.lrca;
-	desc->priority = ce->guc_state.prio;
-	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
-	guc_context_policy_init(engine, desc);
+	memset(&desc, 0, sizeof(desc));
+	desc.engine_class = engine_class_to_guc_class(engine->class);
+	desc.engine_submit_mask = engine->logical_mask;
+	desc.hw_context_desc = ce->lrc.lrca;
+	desc.priority = ce->guc_state.prio;
+	desc.context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
+	guc_context_policy_init(engine, &desc);
 
 	/*
 	 * If context is a parent, we need to register a process descriptor
@@ -2259,36 +2270,41 @@ static void prepare_context_registration_info(struct intel_context *ce)
 	 */
 	if (intel_context_is_parent(ce)) {
 		struct guc_process_desc *pdesc;
+		struct guc_lrc_desc child_desc;
 
 		ce->parallel.guc.wqi_tail = 0;
 		ce->parallel.guc.wqi_head = 0;
 
-		desc->process_desc = i915_ggtt_offset(ce->state) +
+		desc.process_desc = i915_ggtt_offset(ce->state) +
 			__get_parent_scratch_offset(ce);
-		desc->wq_addr = i915_ggtt_offset(ce->state) +
+		desc.wq_addr = i915_ggtt_offset(ce->state) +
 			__get_wq_offset(ce);
-		desc->wq_size = WQ_SIZE;
+		desc.wq_size = WQ_SIZE;
 
 		pdesc = __get_process_desc(ce);
 		memset(pdesc, 0, sizeof(*(pdesc)));
 		pdesc->stage_id = ce->guc_id.id;
-		pdesc->wq_base_addr = desc->wq_addr;
-		pdesc->wq_size_bytes = desc->wq_size;
+		pdesc->wq_base_addr = desc.wq_addr;
+		pdesc->wq_size_bytes = desc.wq_size;
 		pdesc->wq_status = WQ_STATUS_ACTIVE;
 
 		for_each_child(ce, child) {
-			desc = __get_lrc_desc(guc, child->guc_id.id);
+			memset(&child_desc, 0, sizeof(child_desc));
 
-			desc->engine_class =
+			child_desc.engine_class =
 				engine_class_to_guc_class(engine->class);
-			desc->hw_context_desc = child->lrc.lrca;
-			desc->priority = ce->guc_state.prio;
-			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
-			guc_context_policy_init(engine, desc);
+			child_desc.hw_context_desc = child->lrc.lrca;
+			child_desc.priority = ce->guc_state.prio;
+			child_desc.context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
+			guc_context_policy_init(engine, &child_desc);
+
+			__write_lrc_desc(guc, child->guc_id.id, &child_desc);
 		}
 
 		clear_children_join_go_memory(ce);
 	}
+
+	__write_lrc_desc(guc, ctx_id, &desc);
 }
 
 static int try_context_registration(struct intel_context *ce, bool loop)
-- 
2.25.1

