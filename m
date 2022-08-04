Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B197589FF8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 19:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8B5A2C7C;
	Thu,  4 Aug 2022 17:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E150A22CE;
 Thu,  4 Aug 2022 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659634411; x=1691170411;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=peatgWtG5QQ2mgDLLVtPQKiTyFXhkb/Rza6lbOBB22Q=;
 b=Ee9KUS8s7xybTH0+DqYRA2ar2IYMa2/NJIcusN1k08vX0sDr1Qyp5TMo
 iHhTBO41QO2yChcpPsoQp2f8id8zYtCAlJcTHYWbOM7J9mUJTPBT1OxC0
 oRY1Y6IlhmZxFiG7VwHJIQ4GdkF5vXDJdDjjOxabEHyIbwu79uE4DfgAA
 laS9TjHc8eZAHGwJcz/ubWv0nvI0jwI6nTlgkkAUE7CykJo7jv8HRYgpn
 pIekhDL+50blFTHT8IQRMdD91ZlH+zTRmoEoW17FKAfCrpK2XR9jr5oR6
 Vqe6xoAhx61Kh+KnQmLc2fqgVYsUhXyT9+5FS0YJgDNLK4AgL6OmSMruT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="270381774"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="270381774"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 10:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="692716754"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2022 10:33:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 10:33:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 10:33:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 4 Aug 2022 10:33:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 4 Aug 2022 10:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmS2cmh2fvXJj4pjsw3lDKgQXPucJWXqqqyyPeaAipLKlBlAY4FeYm9T0YtlwZlSkJ9uLVhjLI5+CRh9FirRNF3clXjPN3xhuoXQZ3Yjj0ARXFmcz+AxzXPw4SVDyRjuRj7tH3v8rnG6hA1g10x9gnHd+OJ2CNRtCkh8AaWAIoxs7v2Vr3owZDuAQN4z5QMYtmJOPP8OibVLIj+Z4SoWK7mdL2Zdm+7tZTWp2byhqko1btgG3hbDrTvz++2m6NRQUeqUfFueMHJLg6M7nVAtO3YlIbZAJugkjXnC46HwDqxQUcNCplbNM8Qu/da+Q/zvuDlYGzfqewXvcoX/8hmzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=illI/1RyfGXnKn+ZoMfdccx7q0dzr3Rcds5jHQ/BuPc=;
 b=M3fUT2OCE4q+HaZNYptmJD4ZjJCJjUthzF53mDKWxhnavmJIkoxJomSPnqfWPJADoafqswF8yOd3kSFHubxUQjJLlMOIXM5/fWdzUuBkOYlGokUUA2ihqO1das4ihyOT3gKbR04VNHGx0m5M+tAUxH8ntGYAMgqpaxY5WyZyevyVoffzLt+HGK/DKwujGn2QtR0NnAFZjs7mDw39i3/8pKLs92KPG23hnHdfrvky/qRbY1ZVvnYNuB0T3aEAF07Fjq9G//Mlu+4blefs7c3aXiBpQNHcGgMOKN19M7bv8sHmfy+I3sP48iGWH4LzE6FpJDa3/xPojsErBAx7iJ7gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MWHPR1101MB2335.namprd11.prod.outlook.com (2603:10b6:300:73::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 17:33:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 17:33:11 +0000
Date: Thu, 4 Aug 2022 13:33:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YuwC0s6khQsun32+@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fae0bfb-2904-4211-7d66-08da763f6718
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmxYyi6o8V1zqLQZKKME4sHgZ6J6aq0h3YpDMkX/KnDw735gMPoK41e6wbMdIDSnJ6RHmF9i3pIgFc3wKjzaUllESilzyWtZz4+lbCvgVl6WyXa8BvIuxpoJJ8aULltQLqzXDOp5tkiqskcuxcrhIpWTpeGGlfrMPA5pDaOXgWIc8FvJkn1g0OFzVUXCeEI4Gul4IaZqOtUGpJWZN8HAdHljP/BN1x7vjNky0wl1emWl9wF6GHxYRNPynktJbR/tXR1wUfwX75HpVMSMpLkVW5Bx8ctGyCk/Qv4V0bWmcDMBum17dDdyOA4oZaW060b1MuWX9dotbBLCL6gj4Ww68ihSihrmvrNn1BXK9WbMcbofZgkAlEf8Sodxospiig/qdTT9CILHhvVFaeDWX3Wf1T7RzLyszVrsDrPtFcUZcSBSU22+94bjRW2fSyFCSr+ne8rmm4MKGKmAPJvZ4DiwrdTbR2wKxiz9U+sJARqatIoJmmn5v6WjqEtTXSqebbwJSJvznq1oQ+VBiZ5I4jJf5UrtkGadxvePI26zIro5nxuE9EGZlmFy0o1yV++u+SbvRtsrnksrm8sXvhmyIs+XfUkwEJJ+2LjfTLMO8CY2bjak7VKPQ+do5p8fe4/a2h9LrzVbMkLbupH9hk6Zw67EnH476DJbefioLDze9/5xx+gngwE3E3TOg6EJTvR/SKAHF0fbhWZa9Nn99xHM5atOtzeJUt73Dtli0sAcPwdfVXkOqr5454FetiJMOMo1qcDl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(346002)(366004)(396003)(38100700002)(2616005)(186003)(86362001)(26005)(6666004)(6506007)(41300700001)(6512007)(36756003)(316002)(110136005)(54906003)(66556008)(66946007)(2906002)(4326008)(83380400001)(8676002)(44832011)(5660300002)(478600001)(6486002)(7416002)(8936002)(82960400001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1uhDkpFX7BhrJBwFsWoBzUsyEDUY8wE4YKpSQkSj6FD/QNGukURmq8AopfuJ?=
 =?us-ascii?Q?NJeNmJYWUUOCyz5R/K2quhBG30pP1XQcw0ngz9NxAdoeEcmqLAVmlvsX8Oi+?=
 =?us-ascii?Q?8RUHmSyKVmjJwX8TKkeWxM8d5Bt9aobT9vnEPvGrgyujkQV2wMzPfMS4Xjqi?=
 =?us-ascii?Q?CjHjxgJswd7+ewrBBpyH4M1snqYBXZL7mRs3Qp+dkexRd5i6DEGo2frPkv3Y?=
 =?us-ascii?Q?Hp+gpvWkN21xNlpRxHfcWR7ztDr4Bo3MhmGwAk2ObcIkEztdg/wv+qrmdBPF?=
 =?us-ascii?Q?Ahco4xcykWGPSbKSjqOcAmSGuyab2cE2ugM0AFHzefMz/I0I/a/P8UJSDTMV?=
 =?us-ascii?Q?O3rpJtpf0/q8ruc8aJ+Iq2D4HUI18RIbKnh8qBC8xYtJB6ocnvbZukvldAe0?=
 =?us-ascii?Q?2ZypDtM6i29iKKG6lJBvsmCVYAu19yRAlVsMFO385jhiwDJWaEtNeA78i14o?=
 =?us-ascii?Q?wIlOxOU+BWN6dXyWMEkyW3gKZVS40aVWrtm5ki3EfeCsju1AK872h27xFH4F?=
 =?us-ascii?Q?9zzLtbKLQZvJH2jlYrHprYpPRxdALgRlLZhA32hNVS6qNftgG40lRWFPS+M/?=
 =?us-ascii?Q?+GuqFshz9CPvkF46+F3hGSnWblYKQ35vXju4+pEpq5gtIZpwui8RaSVZ4SVi?=
 =?us-ascii?Q?AvKKa+l4PcqpsRvH/BKeR/pIngQFhgA536hs3iTiebTy4nIn/FXJVX1IS5UF?=
 =?us-ascii?Q?RJrHA1gixDkfZrsUrjp7LLeXkcyDF0LcwfbkNTXh5ljASmYLVEDY5LQVPV9J?=
 =?us-ascii?Q?pMXZNTPQL3zSnPa2mJMU22T1FWPikabmYBkwlH5af44TIowykLCk49lfXBdb?=
 =?us-ascii?Q?sJQigXeuvpTQ0w2ycBXCtnlOxCWcFcKzjIIg3KeZs5tbB9UgDaJ5G0Iq1+QO?=
 =?us-ascii?Q?tQrIdrTonSs4L0wu2nbrqyNSuKl4LAqwAoXg6Kf22gXe2yk/7cORqAWdBJlk?=
 =?us-ascii?Q?WTZhvBd2prHZWBsqaooDOCEPuTJzodzBCP06A9KL6tPt99Dwiug5IKOlZgl8?=
 =?us-ascii?Q?IiJUhb+O4n9yhumGLqi9bwl/Ledvv0DQlqbNMLVt0SOYySGeXVDFVvNMOZwi?=
 =?us-ascii?Q?puVEBcKAdkjQ62fmiPfxc+wqBZELjIP5d92GX624k/YkRkfAHU6J6k8Bcq6N?=
 =?us-ascii?Q?z3Vw335HA5X+NSqubbvHXORsh8axLvh7sj7Xa+Qonfxb6PE6kwyBSTXe23c9?=
 =?us-ascii?Q?uHfrByuJs55LnxObWBNeyidkVBL9T2WllCK7a0Pk6fvJivLLeY0K8fjdjiBL?=
 =?us-ascii?Q?n3IkSwjgBWr9wnbXnp5JYuw1eBHnVUKHyOkkCOT/x+7psDdwFYot8fe5YtPV?=
 =?us-ascii?Q?8LF8o0b92EaniCWC4DrtubKw895Hd7FbPLSkR69eyctbmc1BhNbr392Ycdbk?=
 =?us-ascii?Q?3QP16RZL1o7so/Te5WJYnTM79rHVfbFGdqBM3gzL1e9HfiKywMz8pUn27LWd?=
 =?us-ascii?Q?zS/0LZHwooLDp7BJRImWS7gTpqquCi+uyIHUwpqW+hHh9tIdyYsm5PLwQuWH?=
 =?us-ascii?Q?j9T1hGS6x3YMNTQ8osQZ87CfCq+sEJDLahAGMtjZPO4bTL+4I+VV2qMZRnmZ?=
 =?us-ascii?Q?K8HjVksIWAYUU2MrBxZau7WDEAPNHHM3DLz8YzPHwLHYNDDof8JJoLpO5BrK?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fae0bfb-2904-4211-7d66-08da763f6718
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 17:33:11.3209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6shOT89u+yy+0VjWvcgh2aqAGvKnh6goWQ5mNLozLqdxOa/x+eeXQcXoydywID3aSMFeQSniVBiNQdr2U7ocgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2335
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-next-fixes-2022-08-04:

- disable pci resize on 32-bit systems (Nirmoy)
- don't leak the ccs state (Matt)
- TLB invalidation fixes (Chris)

Thanks,
Rodrigo.

The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:

  Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-08-04

for you to fetch changes up to e57b9369e0c6f60155027e120fafd4b57e385b71:

  drm/i915/gt: Batch TLB invalidations (2022-08-01 09:48:06 -0400)

----------------------------------------------------------------
- disable pci resize on 32-bit systems (Nirmoy)
- don't leak the ccs state (Matt)
- TLB invalidation fixes (Chris)

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915/gt: Ignore TLB invalidations on idle engines
      drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
      drm/i915/gt: Skip TLB invalidations once wedged
      drm/i915/gt: Batch TLB invalidations

Matthew Auld (1):
      drm/i915/ttm: don't leak the ccs state

Nirmoy Das (1):
      drm/i915: disable pci resize on 32-bit machine

 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c        | 25 +++++---
 drivers/gpu/drm/i915/gt/intel_gt.c               | 77 ++++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gt.h               | 12 +++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h            |  3 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h         | 18 +++++-
 drivers/gpu/drm/i915/gt/intel_migrate.c          | 23 ++++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c            |  8 ++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c      |  4 ++
 drivers/gpu/drm/i915/i915_vma.c                  | 33 +++++++---
 drivers/gpu/drm/i915/i915_vma.h                  |  1 +
 drivers/gpu/drm/i915/i915_vma_resource.c         |  5 +-
 drivers/gpu/drm/i915/i915_vma_resource.h         |  6 +-
 13 files changed, 177 insertions(+), 41 deletions(-)
