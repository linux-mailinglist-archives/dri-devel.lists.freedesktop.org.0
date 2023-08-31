Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2078F496
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 23:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590EA10E0AE;
	Thu, 31 Aug 2023 21:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09A10E09C;
 Thu, 31 Aug 2023 21:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693517344; x=1725053344;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/m54jLkD6dfBVp0PS6DIabp2jFZ7LWfYqYE54+/Bnd8=;
 b=Y9rv5LogpL+ElZyLbsNkYhiTP0aaPqFYA9blk03GYZAwGRxd/7lvgqoI
 Ka0B0Re0lalKyBl6QBRhejlY9v4BRA3yrH4TwLFDaRMvrE0RKIqY4dsIx
 BepH+1X/qHlgJNNRg/hlHhwQdhCYVEaBXV4rfqjv44sSN5xXjgV9w4MMB
 YD4opaqdmMD4wCuAEMeC8IF0bZKR207bYCU12Xt//m0Nxna+6N3iPd36k
 ai8kydTbrjGaHWQJ9D+o08XcMTwE8IvqY0FiHhVFrnWCMBJJaV4dQdNyz
 uti6w6DYVZc7271TibUvGdOojrtedirItNGMXxqnB3oLmpfqTyJA5RUqp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361091726"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="361091726"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 14:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774739412"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="774739412"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 14:29:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 14:29:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 14:29:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 14:29:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 14:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igUlvDWU68K/sVGogeaZBwj0UFzHfxeifUOXNFbYpbwwa6pFKxIvBgKYrLkzHEg6TF7gDCbTrFuJuwaD3VKI1hlhjW2vsZ4OGZ3f+IRYfGq/uU2PXxRzZgxLZhf5YmShYWfiT1Q5NITaLL3haAe/7moREOXPugIOgViHeoEjIryi3qmnOLXh7iKfTXivd3GIa+n0G7Gw0RLIY5JCwHIm1r3gVIeTPJuaWfOcVzE1a/Q8iwMxKwGp0VermPmg6o21jvcPWqcrnCbBPQVQJ5aJSC3OnmE9TlXgj3mrrDVojLcCE+nQXJ72gmuFFpTQudoMGYJJ1s5Q6iZQmtsKa891fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lcd0zr83+PbRIxrKKNz6ReqPZ6n6A+7kM/B0/EJVKc=;
 b=hjjjATycuEc2KvyFIueKEIK7MZmkiFg4PIEJTRA1hbsHNU0vfcFZZsWso3Mg+n0GtW/MQPh+NSGzUAMiy6VBPA8lJlMXG++dK4FBjXL4ff0mmEjcUFHT+7lwnwCeCu6DhAIpioWfyfHu0BBKtsFT87gEZQNMp39NafYq6XWQJFIe2YfDzFRduAJqEbYAM4wkg+Xy5Ywso4oIK9nk1Ab0i3Zemc3bI5OZ6aqsI2xKdZmC+CE//u6QJ5M/gubcnxiWutAWqdX0Nr1waqI6LlvKyKFKp0h0nRMj35PP1sOJfk9khkZPLDxqmwEf0IHI7V8zCKZHBIF9hipgOSN61zpNUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 21:28:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 21:28:54 +0000
Date: Thu, 31 Aug 2023 17:28:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZPEGEeP2EwCtx9hM@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: d71fa3a6-208b-4e70-b5c2-08dbaa6946e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TowhRUyIke+o6PbrqW46yXUTeZiUg47VK2PHUcG3Zz1Xql6t6wgOJqS7x2qIPzMhM1Ss1Id+uNN+N1yToDwde4CyIHo8FgMAfLnVWzls4S/RbEwUkqI2cLQaiFFp40I/r9aVw2YEuTwtG58CtyF3I0Ky7PhOK1l9OQ9jEanLuewjIDhrC/dGsKSqRecR/PQv4H440F0o9a0gy06I5k4fUOgcKq/2057ZvEArtA+RzHFWG5Ml+3Nq5mHLOhhY4UfLtWW3t6YHrDoEcgumAGIVWTYUNwE6t36gXd8cSjbOcOojfJOcH7mkChG/oT5XnI/R8v0Ar65c8/+ritqc/zsWVAA/QTvP4AxGqZZGu39a95s28lLRyuuf6nzXHLPzx9ejOKMdHukVGy9FIvKkwWN3tBqYFbDAWLdroVlPVGyFr3SwazVLYkGKk68XGslboyzmQIOozmxSxtPONz0aoTKyz3Q1l6zhgaMm8O2zDOi52DkYuM0tlbBF9v0EfTQ7FsHK2d6pGRHno8G1E85NusLQ+qtO1BYp8pztdrNI6hWDMNydY8Qezr7sEOT9ke+b7HgQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(186009)(1800799009)(451199024)(7416002)(66556008)(66946007)(66476007)(316002)(2906002)(82960400001)(110136005)(38100700002)(478600001)(54906003)(2616005)(41300700001)(86362001)(44832011)(6506007)(8936002)(5660300002)(4326008)(8676002)(6512007)(83380400001)(6666004)(6486002)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zoEVsnBGX4l5gSUpKXMP/WCLtiQiN/ipnYc74ab+qmZZZ9Yg3SGz0LLJ3jW8?=
 =?us-ascii?Q?pEzbVxYPTRbytJV8k/vT23GTHQcmp1AC8bAOevUt3xq85n4V8Cxcg/ZKBlt2?=
 =?us-ascii?Q?Pgo8bT9VZg90eBPJQi3JNXx2tmofm1ntS49VsM4qVEIFCID/xDyaTCCpVMZZ?=
 =?us-ascii?Q?NRzCSkwd4QUX/a3raRt3JY311BcRfZENkxh0xyUGXY+ezZTlpgIpB03w86yL?=
 =?us-ascii?Q?n6qBnmdOCSOwMSLQrU+jqHxgsCKm/aN2/qF/4np7PYXTJqCG6mWoNYZZ+cSE?=
 =?us-ascii?Q?F6kPODPeaGxwbsh2x4WZeiHXjqwCmtyYQQyDZ+t+GYy5Vn4GW2AkP08+p8ha?=
 =?us-ascii?Q?zPRKJOjUcIuTVMy9FAKu1PdBGQRQUEvHscjmk3fYE5dmzxuT0iyWpXOhCdM4?=
 =?us-ascii?Q?1BTsADvynv/BMaxgA5Ef54NUCWUAiue7JZhy8cfranqP6Py6K2Qf/g1n5gVv?=
 =?us-ascii?Q?RMUQva9VSunN+F+yrdLV6hnGCZDFu9mjjOxVomqPOhuYdkbHHUibxt6G2y4m?=
 =?us-ascii?Q?wGMmTkjjmmQ29Qs6ASweP7yKV5JlfnBrgsqbJvHa33dKheuIgBgmcnaWeVt+?=
 =?us-ascii?Q?jNosVY/aKizhlLNlBZaHdtziVRvL1ZNvzghhixCG5rhC/rWGEATiujH5tPId?=
 =?us-ascii?Q?GMJLp5FjhH6AiFbcZtwWr3yD9O+N+x8EpV45BLVkePvT3NXiDaTcYfI9fHQr?=
 =?us-ascii?Q?7DUhIwUIhKEql4PxZ9+aC2LET53C0rboSSW6uOL2EVpmRupon/NomVLoZkcb?=
 =?us-ascii?Q?OYde6guQRnt7X+tdfCDfAQyHCI0+V6ACXcWTi5YNMTOo+oym/USfYMDAtAqm?=
 =?us-ascii?Q?m9j+74DoAY3T4G4scc4wj3snls5q4jm9y8QPa45fw9/1dBx9KhKPpyYSRB+t?=
 =?us-ascii?Q?etv10l9isXtCaulxODdyxCb5juDmKOmH05JVv8CPqkCWVBSNo5ONpwPEyCIC?=
 =?us-ascii?Q?ogbRprUg0Y2AB0e9qZP+JxXA450+sFaIKqJKXYNnnYrcFevGiPTjBUlgss5f?=
 =?us-ascii?Q?1tmITLBWy3R5ecl2Zp+O2emeweHRMp0G4lACs1bhN1pgDRx8HHl2pRdtYsw9?=
 =?us-ascii?Q?f9PyaVUvx9MxgFenzoPpQj9xdiClHf5ApdnbRVGOf1Y4mkcUN/55/piHAhha?=
 =?us-ascii?Q?xT7xrZu+qa9wnfjpXRRrYuUfcO6bn6pmJPpfSuukd7WLuYPkeAtXCup5+hzp?=
 =?us-ascii?Q?G8G2/+vHLC3b7rfGvKooN0oVJ4dnClQ7nutEMYf/PwnJRpLPLxm9Myw3JTRC?=
 =?us-ascii?Q?SXbgVCpEhmBdbPHQoaEY7Nr4RaqWZMEt6wuE0u4jsrL4RZctBnPgeseqLY7M?=
 =?us-ascii?Q?cGTLKuYHm69Zz2KH8NcuHwf4AAFgxOhN7ELTnoiGPZjf3wNzClCDvQicMjMg?=
 =?us-ascii?Q?fqUe0XJTO5drcRq796ogoi+No+2I3NaeK+c09S25JtwYrnBZhQartNAqMFpa?=
 =?us-ascii?Q?sWA24RKeiEMtReLAOR5S1hSEZWXLCIweiwO//dEbEuE/sXgqe3ywaLCJIqK5?=
 =?us-ascii?Q?s2gpaPfXhQJVfzrDWp5x2kmLiiSO+CifBDZPJe/zwd2X84fzCeaZ9QroEviG?=
 =?us-ascii?Q?iUbsO3Z8UAoiuHDesE5C8zJFycxn8bQ5azdd6XUbbbmX2ywLLIqiuoc6wXbs?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d71fa3a6-208b-4e70-b5c2-08dbaa6946e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 21:28:54.3322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hc1SLlrJMMi1KneQ6dZR0cQbLxarVXO6qxKguB04Khh/x72T68pinXoLmu8cQRj4bIsrJFHNc5t/dAjIUb5vgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Only a single patch towards -rc1.
I noticed that you already sent this week's PR, but sending
this just in case. Otherwise I believe it could wait for the
regular fixes cycle.

Here goes drm-intel-next-fixes-2023-08-31:

- Mark requests for GuC virtual engines to avoid use-after-free (Andrzej).

Thanks,
Rodrigo.

The following changes since commit 3698a75f5a98d0a6599e2878ab25d30a82dd836a:

  Merge tag 'drm-intel-next-fixes-2023-08-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-25 12:55:55 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-08-31

for you to fetch changes up to 5eefc5307c983b59344a4cb89009819f580c84fa:

  drm/i915: mark requests for GuC virtual engines to avoid use-after-free (2023-08-30 11:32:48 -0400)

----------------------------------------------------------------
- Mark requests for GuC virtual engines to avoid use-after-free (Andrzej).

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915: mark requests for GuC virtual engines to avoid use-after-free

 drivers/gpu/drm/i915/gt/intel_engine_types.h      | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
 drivers/gpu/drm/i915/i915_request.c               | 7 ++-----
 3 files changed, 6 insertions(+), 5 deletions(-)
