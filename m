Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066046EFC10
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FE910E112;
	Wed, 26 Apr 2023 20:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1678610E204;
 Wed, 26 Apr 2023 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542695; x=1714078695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9urFVFwcrbkRy/csRlWufYoJUZ+wVRCNLcwJEVoN39A=;
 b=jPQpPNlw8IFlQD1lPHnEUyHHW3cl7qH1YLcT2Lluv43mXIXp3OrkZY/c
 cQkGOXWIZ1U+nJxozPSoS2LNtl3gFIFLyshf+tq0h+hQrGU/uSMHCy4BF
 PDrQMoRuuqhzXxrPGYelQjFkfFNXcqP7OhFP4QA9A4Hz2jPBxY5cX3I0R
 j/hDd7sYpLfLHJu76GQWsdGkF5/dDIhmjAq8gK9JTfUpTClUbE3XS6ibV
 Nje+2SX3fJ5Mr6nPi77SV3Mm/Wzp5KTAHrWHXW9xXcyws/JR8ZD1EuTCu
 T3qEoR/rJrwJu+R6pmF264fE3F57QdZDBwG7vjWHuFVrKUakiVAuYsc02 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375203778"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375203778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688105318"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="688105318"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 13:58:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:58:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5lP+BjtZp3gfjm9MmjX+lzU1GptaTQewdve84VyS/10Bp3/74C0pMGwZ1fRcR0uLvda/76UJMeawmEqx+Xt03b464ly8e5hcP/8A1j4kFwnANsp6wdbz+3ixErg4lN0RClNXro531q0L2JfTUfqhZxsImPhm5r2BAwBiburUwekCorMiwjlKtyfqCTkFccwsaOM+g4HADbaJSVWNCDfzHb8rqzvgJKSSh8eUK55G6TXQqtQCBDXF0usswKLBig/Bfpk4AqY9Wlv/LbOslOaRREOaXVy6Gd9+qtP9S14EKV2Mo52Ne+Mn95bdSTos0+5bNQO+8B1N+NihwLNJTC1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcjhiJUn26yIQtu8SHVVNuBzp6f//+ibJl4dn0VVZzY=;
 b=VTtejAvcfD0Y9Gez5+2XbybedFJCgKnogwgnP/khYxSGhYDFhJh17emCKeqq01kDmLBnyyLpvti+jtnkWDno6vOCb55Pjxvkr8/WuyfAbf7oDV8oOJq6NktrQYrflG2plDCAyaKbUxBY5BH3oCt0DEH4+UijbDJSs+jBYPXTvdrWKxb1OJTlhbqbboDwi0BjXoU3YjKldQgl01tONJPM4GSTrB5U7jQCNUif9Y54GytPgqzbRCvzmdVskvSltOKCfI/tSoqVVLgCByEGSnyRFJclK5hEMUtXnm9FCyEBCmrt8o5vG+pzcOTdn+nJBoum1iS8CC+FVU9FTUlW6y994Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:58:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:58:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 12/14] drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to
 itself.
Date: Wed, 26 Apr 2023 16:57:11 -0400
Message-ID: <20230426205713.512695-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 975cad1b-ecd9-4684-17d3-08db4698edd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eg586XwlHaVSqZAZ4V8oaua/Za8SNNTkLolOx7VPcSL+RgA9N7DNkf+MSUZ+aVVj0KzAYUy4qvUqa/6Wa8r+5QkoqCel9S5U5Qa0tRVJN0yg6EOgq+vhF2v786S3geCJ5inUsEMEDjFsCrwn5Tuubu1mG4mxVdYqmPE5/WxpWQl/CAlPOuMcaJK2qaBtHVZ9aUgN5s+Ie2x8MijdR6NyampOnXOWOH0LNTdVnStd2589HErykIG5yWmsdebRMDLwx1Tr2tfwFsD3O7pcE/Ktz2Uvsku3dRL4mZLDVuGePBhrtc9ZyfqW/O3REMRgZMpPn35h1k4OqUOIjAS/PxmDLljmebwESOUjepTAE52KK/3CmW9kyhbInPsi5qnVAc67Ybzy+rZVU502s7/QxdRnCg1l9qf8uGssNJCna3Pv0sFbY3i0jhfCT4xITYe+3MTvxrXw1xLRuxq+VjxtEl7ZUvGWiiRa4a7obwGLQ8G8qrIplJrNCwboBiTt0XnNc2Az1PgSf7s8s+bE2iTnsPsh/WtXapQKW3TYfKRfdW0CeSAThgI2oyhDQ4pYFf53DFaK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FhX1Scevdjlm4mNXfaDnYZ2+quA6BJuzmCEbuZ0H73br8eZYyRZVT1gP+dtd?=
 =?us-ascii?Q?ZW4r0cspPcwZuz3Ss70+xm6hGMQPVYZqG5NVH27a9XVERX0je4LwKHx/RThW?=
 =?us-ascii?Q?1Kd6We1vAeYvglCMiL2s3Vwr9jo2MSuSoFl3Zmc5tNwV03ZUXapCQhW5BF+v?=
 =?us-ascii?Q?KgJdDpxORsb73t++mhs59BmJUEgUZemdaRJKAFamldyLiIyrYl7l86yLiBws?=
 =?us-ascii?Q?PrhnILFRzOSc/okBBP78R9tMciPyNEOKlauqz1ocU8hDPTt73F+PrndkeCea?=
 =?us-ascii?Q?Uu3WBPPDU+PqwP8zfpkKN2uJJXysPqCI1mvUzACkiezza+Y2uHTJTcbHcykt?=
 =?us-ascii?Q?DDsj+i40WgNBbh+8mZLpL1DmhDJNZG4UBVLJEezP9GTbs9PUOyJt9bD/KyNd?=
 =?us-ascii?Q?m/us2UWTwPpClw5HBMMc+oaHe17kdiiTBXkvxxNnfU0NWhgrkPnHL5dtBPEd?=
 =?us-ascii?Q?HR+cgLGu/jIXgf9jFw9XcJrlZppLfQXKzsfh2agLNK6t/UeMckZZBJ9rwLao?=
 =?us-ascii?Q?rYmaICGcO5rHxJWJAgy8NuE3Ib5FiFLF+LF7wEq6XJpHWa+PjMdN6RH3kC5z?=
 =?us-ascii?Q?KQgPgPK0du+LFOprc0HeflKhvUeEZx5SzFq4L/9SQ3lFX88ECMAK6jI7ECA0?=
 =?us-ascii?Q?5pO+0QeH5nSR3R0Zc2Tbg/uyGL6OokF8TyCKTicjGYUG0wvWV6Ssg4/VfEgS?=
 =?us-ascii?Q?Vklm0K238MvcVRhOGtcjzjyPzwk18gxkW+kzemA95musS5ASBVdvSOrDJprH?=
 =?us-ascii?Q?pl78r38zpIsIObHDbmpFpElLupDSfeq0y+FhQpJCABq4oAhNE56eGxAID/+Z?=
 =?us-ascii?Q?FL1EIyKtGaWor+8lM97k6K6HZ8sgDEMFWSMWOPSokmd1PksIolNkDM7f8qkj?=
 =?us-ascii?Q?aScCkElQD0mI5nZTo2boOa/aRYjc3VOiaFu+DnlnIXJLo1CL33RcB6b1qVdy?=
 =?us-ascii?Q?G1EK1iW+1dsc/zNbYaHQ10DFOZN6JFJaEEi4GPfrMMvuMW/mXk4iwMbfFBgY?=
 =?us-ascii?Q?Ysgn31jpmDMpMryhiyN0n+pzIfUNh/vLzU6WM0AvAD3yfPxX31Doh/q5w58I?=
 =?us-ascii?Q?wJ6iofDgZPpjcGjNfKUnaVhT8f+YKtqYHFRcszwAWYSgw4sbRJ/IaM2jxq3B?=
 =?us-ascii?Q?4af8qhesBywoWrrlk6hsY5sS4uv5HaCmwzu0D9iqmP2vw2NPUrMTE8zf31lt?=
 =?us-ascii?Q?VuJSuO5TVg9cXsJorcMGe1CtSoLlEryUi1uazfBZ7EMf7GQsz52seQyUeBWB?=
 =?us-ascii?Q?PAF3uaHOXNSNEhnDgMuyHtJFL6ywqGTCQ4jKhOI3Du4PPVcwQw57J/RYp4uC?=
 =?us-ascii?Q?ECThn3b0ri22e71AgscH1Y44eP3pDg3+Cwq/x0UUVhafbYeyEbc9m3VDLg38?=
 =?us-ascii?Q?yyGBdIlztrJjRtxIuuKPI9ie0wKQYJWCN0KExhRabYRBV3WCunhPYPXvfXHm?=
 =?us-ascii?Q?e7cOfC4jBmkkDQFYYgGpzXUkTCyOpiWYMbwyWzQo8rEEIfX8Ci+ogw0Of/QS?=
 =?us-ascii?Q?tmfL80jxtEB9zihVbuWAUww1H0SZRujwiwVnwqsTSw5Qh+nhaJO5KVmtdB4K?=
 =?us-ascii?Q?5gKu6mMBE5Ws+/7v1OiESJ42MsI52zJARWgSis+ncaKAqdQ15uK7PaP9FTig?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 975cad1b-ecd9-4684-17d3-08db4698edd8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:58:04.4978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJTlb7iZJdxG8AmeH5nLvx1UcLfSo2IWmElmrkvRjxAkBXQKWYRTiJbV0pf0J5JFJ8CCj1Ifv5T8QiaYeQKBIw==
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

There are multiple kind of config prints and with the upcoming
devcoredump there will be another layer. Let's limit the config
to the top level functions and leave the clean-up work for the
compilers so we don't create a spider-web of configs.

No functional change. Just a preparation for the devcoredump.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bdf82d34eb66..4cffdb84680a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3369,7 +3369,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 {
 	struct rb_node *node;
@@ -3405,9 +3404,3 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
-#else
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
-{
-	return 0;
-}
-#endif
-- 
2.39.2

