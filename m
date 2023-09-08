Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D40799152
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83EB10E95C;
	Fri,  8 Sep 2023 20:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E75B10E95A;
 Fri,  8 Sep 2023 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694206607; x=1725742607; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/5jUgaSqNmD3zQnPrVcaW3lr1LI2vOK1gW3JuO4qcPU=;
 b=kiGD7v0f35eIM3Qt7JuQdMOO+j9+J7UG+lglzjec4j0qneMX3l28OnCK
 gstAP0Ai9rCSRypqVlvmgM8tsbY1VWgnDd0lh0qw+r+GR3aPgdC4Q5oIM
 Mp/yoiKDF+fg9g7AImxu2dJhdKT0DAgK3Z6GnNxllmAZ9zi+Gzr1AFNFG
 ckTUL7ouP6xBg4QNH8aiqQdIP/pjcmzuSMmrNO7FtkyoBKANO0obuEDp4
 1HsVJQLGUes3r002ZOEvuidape2XCEHog2Ne7yS+uACm+Su093PHsVHvn
 YlhEjybb6UrLu56pNDMX4C1Vj4h5AiHYeg7ShBmuon2G7vLmebVzoe8Xs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357209021"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="357209021"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866229248"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="866229248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:56:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:56:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:56:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:56:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 8 Sep 2023 13:56:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5bWTwQ696n7JOWLfwuv3j5x44Pd010J4wjpdffU/b6xfSQc4I/1LCvpVB6XnV6pMm2RtStDWiwGh0hs7yQ3BFSmfyvA6YN4bvXSP9NIQTCXkhS9jWxfk+fy8Jz3+GHz22gpNf3aWwexQH3o2EBoUsrp/1J6+/QE3z+IZv2bPIjrlO6dS4ije7pcEP7zpz55AENuWPf3DuELZ581YPKKvYxRTpBsEsF687oGSVdUBEer3rtT0rY2DfVKaTmWvawKmMFXwC5SaWTDZwMqFLQl0VcxaP747F8YlFLGA4exZ1AotlFk6fnjEJtAtTi2b3fKO1mTACYMeTTtJf7ZWn1DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t06iw/xx+1MiyXK8K/d7wVLU39rtyzGhaAHDWXvULSQ=;
 b=LoENrNhf1pyaW/xHWVwxK8c9AeXvvsFhfCPjRmIhWzu3ikx55cqQdDmpH1NiIwtXl0oEmIpYkK1D5dsUk6xCFwwfepEHa+fGW8YLJfB3Uqm6SF9QcItCctvntH71W+YQSjg8j9RnKP+3/KSMpIlGzFUEVSW2CtbUxxTM2ZC5+dzXSPdvvwXGQxRb1HwbGL+ucwiVlC76TQCeqY4e3WAUqATrIhaOVEXUnKbAwfSzNWf9+qc5xIxL7kef4eGOFNJlujyiIqsqKB8YOssLcxgEKV8iKuZfavPdZSMpeurULajLXohlvZWh9Q3rYX2HKUpEkzRJKlEjd6ScjMBdmeiGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 20:56:44 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 20:56:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <airlied@linux.ie>,
 <thomas.hellstrom@linux.intel.com>, <matthew.brost@intel.com>,
 <christian.koenig@amd.com>, <lina@asahilina.net>, <dakr@redhat.com>
Subject: [PATCH] drm/doc/rfc: Mark long running workload as complete.
Date: Fri, 8 Sep 2023 16:56:33 -0400
Message-ID: <20230908205633.450321-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0010.namprd21.prod.outlook.com
 (2603:10b6:302:1::23) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: 886cc3b5-4fbf-431d-d0fa-08dbb0ae1b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZoqNhvDfx+R07X/lkAknpY1joJVi/CQn0gQaASNVxw/VnYUwHlVC++MwGw5TC7/cv6hiNWNLNlvD68e+RGTE9K5ERooGWQkNbfbdwqb9GlTXSLLnV7MKZbWOL3Khf2cMeQ81ac50yyVwjge8Y3HjNRNeR9vQ/WP23KI698FfKOUQ3MzFs5zFyOxB0Yp52r83J+RDsYNfddSld2zHd9FpY+f2mKAqxnxmAjjL6P0NB8UzCBThTx29zulgR3+q0UInX/9GMop0BR1pc6PfX7mM6d/fTZrlS9Lx/yXnxo8fiCbJrIfHhTOJXPZXkyGqgFwQlSizkHc6y6X+QnTnqL5YIcz3/pfEGzVYqGinoTuCBSwPgK/A7af2Hwq9fT0IleAm19UACWLJ+yt+AZKzDoszSdnpWSR9S8j9Gf0uEAFfWxFkYJndUraqX51r5nNMiU6OxmHAOI6bCjRrGUVGRSL8IK45ZRxjai4HLVuh1gNRne9zQHOEslUZwbP0kCyPZGUzdzA7jJxqGZUOpXUyZdpAmjCGs/Hq8UqO14JnNqjhDgQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199024)(1800799009)(186009)(86362001)(66899024)(2906002)(8936002)(316002)(41300700001)(8676002)(5660300002)(44832011)(36756003)(6666004)(966005)(478600001)(1076003)(26005)(2616005)(83380400001)(6486002)(6506007)(6512007)(38100700002)(82960400001)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJRrLcLSYbJquVK0TGz2B22Y4SSgBNqsVvmCo572ZP7fFpEP8rFtqBSuaOkn?=
 =?us-ascii?Q?mueWneCUA+atwFiuNwIBps/05KsW/2771TYUdEQjffPYdx3VIOyc8Dk6BgTE?=
 =?us-ascii?Q?NzKro+9qwLy2lnjEcac8SRNIdXhCmxYjyg0sEVzMGz3xP8y8RQeSM0Cj6PJZ?=
 =?us-ascii?Q?+9itITjTN6hvX5wgQiIHcuDe3VuQGvYWXcfOAqYSQhRJ5phzEQbw4GG3btKo?=
 =?us-ascii?Q?W0bQ1ck5yibWZPmlWRQ6pqb4GFgw19spWiHpCFrhq7oZvS//8JWiL7EaBlhD?=
 =?us-ascii?Q?2QL8sbUi5P8yS36M3Kzd5N2ZwBQ2Yz7enC7bZtNGz5dNo+SuIWb+iDti/eFv?=
 =?us-ascii?Q?+ljwe4qJN/hKmoSm7m0DNKWBPerkwPw7p6wCemB6oYVMnr5J8Pz+fYBUqC/v?=
 =?us-ascii?Q?VO+mVIhk4f+vzJI6ky3C9sHAB96gLyuCBGtl/ajTFYRVQle8lvr+viZGJ+DC?=
 =?us-ascii?Q?rkQ1mJNbnAyDknmDSR3MmIzyzMLeucG5bnLVBWDvd24lUiM7877Oz7B7RXoe?=
 =?us-ascii?Q?YTzAt1H1BYMfvnwMkJqsyI+uvFoPZkOLJ1M0SeKxCjP6dUXfBPxahwhzxWnS?=
 =?us-ascii?Q?6oUWFuDQWZqxfmaLVUB4TqaF8jLuhPkDO2Fb4QxYCSeBRHFGe5+9aw+2hrk6?=
 =?us-ascii?Q?AsvEfYb16juQGqWRwbn2fM+dA9If8A7D5CGC89gc4nnP/vJDUPYzH6WMp7gE?=
 =?us-ascii?Q?ld8wrA8My3/nB5CpGn8N5XYTNmoq9ktOyU7SCP5Zb7VOO8nTd8qtV5KuAkZy?=
 =?us-ascii?Q?ACSg+ZizMYBaaYT7esJUexvjARNo3gqsoBIt8kxUMXvXyTC4mZCSqlNcsspy?=
 =?us-ascii?Q?KfZctNMBzz8QecWVZeTFa29bDCOd3BzbSqA5kD+yEneHelOQUlDPb498my9e?=
 =?us-ascii?Q?EJx+cp6ZEEOAJIqlo7O6QBFFJ8PAOn/vPt4UU48K/Go6eJTMRC6lVKGnMUlr?=
 =?us-ascii?Q?9oU4dVarEldFtUQW7nAnr9ZUvNUfWjiDJ3YxyHcCbRIqnH5vJeHM6bgAMU0o?=
 =?us-ascii?Q?wLOs1OEtNc9k+1500gAY223c2n4UbZ4kUGf5n4RP1wM/QIPkDUEqxlWHAQDe?=
 =?us-ascii?Q?nBE7TYXalFP141Ttn+EWr/9cJuju1N2WtKzh3MKvTSvIQmHayRX/b1Dar1rg?=
 =?us-ascii?Q?oYVPcvXHxc3/wX7yXYQsA82m9/NSR8w81iX5WdSM4ZWlVxzfy8VOnpn2f+VA?=
 =?us-ascii?Q?dZEAqBdlX1O/MeXszG7VOqSamep41k7YPlMwXBLjI0IPoCiEX99M1i8lf3OO?=
 =?us-ascii?Q?Ib/fnTEqhOjDOT+S8AZVk42uk25s8tQJgcsJVuZHfWwzOBnevcTDFoFUNPU4?=
 =?us-ascii?Q?n/vS39WEv1jIQIvssa8o2YqvTwFt7+7ByE0F20vORfZ5QIKUMljbT7Ujkex5?=
 =?us-ascii?Q?ZPHJEgCMpD8J3cPLT5hN9zIZ24QiWdfFNAlQHNrAWDc1fy0+5MO4dsXlYKaF?=
 =?us-ascii?Q?9SsRgh6ca5c88ZwEBRQdlsa67Kz2XOw4OWUsToTW4Be2OF77/5K7jDTy3PMr?=
 =?us-ascii?Q?IoNRv1NPas7tNsB2VtrznFBhpeCBrL6V5Rf7J+Ev98AdwbHt3KZf6H3TXFYQ?=
 =?us-ascii?Q?SAjVzQfQGFlUhv9yRMJRd0vn8jfCL1E1K2N9mli6e9rGflILHurOIob0ztvg?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886cc3b5-4fbf-431d-d0fa-08dbb0ae1b98
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:56:43.9714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv+WYF13pZFdrKuSfC25mbfKwX8dPJzUyjw8d/SXLTJcfzSimPEPO1AxtzHFdbm/Nl7xm+rc6UnZ2JUsxA79aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

No DRM scheduler changes required, drivers just return NULL in run_job
vfunc.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---

Christian, Alex, Danilo, Lina, and others I'd like to kindly ask your
attention and probably an ack from you here.

Based on [1] and other discussions that we had around this long-running jobs,
it looks like a rough consensus that we don't need nor want a change in
the drm-scheduler itself.

And that the solution is that for these kind of jobs in the drm-scheduler
the only thing needed is really this NULL return in the run_job v func.
Like Matt had written in the commit message above.

Looking to the AMD code and talking to Alex, I learned that AMD uses
user queue for direct submission for compute cases and there's currently
no plan to use drm-scheduler for that.

Then, the only thing that looked similar on the AMD code was the eviction_fence
that looks similar to Xe's preempt_fence, but both using dma_fences directly
and it doesn't look worth (or good) to introduce a middle layer for that there.

I don't know the plan for the other drivers, but it looks like the solution
currently in use by Xe should be enough.

Do you agree with the above? Or do you believe some work around drm-scheduler
is needed for the long-running workloads?

If no further work is needed/desired, I'd like to move this long-running TODO
item to the 'closed' section below.

Could you please help me to confirm this or either describe what I am possibly
missing in here?

Thanks in advance,
Rodrigo.

[1] https://lore.kernel.org/all/20230404002211.3611376-9-matthew.brost@intel.com/

 Documentation/gpu/rfc/xe.rst | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index b67f8e6a1825..1e1dd6202438 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -127,21 +127,6 @@ Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
 the second driver supporting VM_BIND+userptr appears. Details to be defined when
 the time comes.
 
-Long running compute: minimal data structure/scaffolding
---------------------------------------------------------
-The generic scheduler code needs to include the handling of endless compute
-contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
-drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
-completion fence.
-
-The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
-this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
-drm driver, including Xe, could re-use and add their own individual needs on top
-in a next stage. However, this should not block the initial merge.
-
-This is a non-blocker item since the driver without the support for the long
-running compute enabled is not a showstopper.
-
 Display integration with i915
 -----------------------------
 In order to share the display code with the i915 driver so that there is maximum
@@ -230,3 +215,15 @@ As a key measurable result, Xe needs to be aligned with the GPU VA and working i
 our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
 related patch should be independent and present on dri-devel or acked by
 maintainers to go along with the first Xe pull request towards drm-next.
+
+Long running compute: minimal data structure/scaffolding
+--------------------------------------------------------
+The generic scheduler code needs to include the handling of endless compute
+contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
+drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
+completion fence.
+
+The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
+this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
+drm driver, including Xe, could re-use and add their own individual needs on top
+in a next stage. However, this should not block the initial merge.
-- 
2.41.0

