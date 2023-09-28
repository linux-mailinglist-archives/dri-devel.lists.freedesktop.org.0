Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29127B1F65
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 16:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2518E10E66D;
	Thu, 28 Sep 2023 14:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE4710E665;
 Thu, 28 Sep 2023 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695910957; x=1727446957;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2PLu6NuRaPnJTj3V36+s8MBf+ySyLG6v7HbukGaiKTM=;
 b=MiAZjglyE4/aFE5PzIg5Q8Tm8AiE42xbtvCX1CV63aCBqnpPGOUgKQum
 qlBU3VcmEv54xEYAGONwOJidho4/IaFHvl9642Tq6ZqyE3YAX8cJw7UQn
 az57CfUbDxJ1fTtWJQRAveggd4L0yl2xl/D+DZ1IFHQKji/BP6tGJvic2
 s8a62tENV3phMlfz/s6T3es8ahhRW7W32MsoprIjEOjdjEFnnJGIBvdiN
 FxNEskVK0Iny8BI0reVGUPdS3CYWNBKUHVLHLmgopEhWn8Ep4dPVI6P+9
 5GlO8uW0Fm0UCBhTa550d6xT045MWdGdqr9JZw53uD20QEQYwwgBL3QCt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372433697"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="372433697"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 07:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749608105"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="749608105"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 07:22:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 07:22:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 07:22:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 07:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AM3o5W9hd+C9rLWQ4jH+1u3lY5lN3B+nN14BqLiv1YG0iwyLcvMCGWuCDUYdgX9bi26JPOfIvY7xSwu/GcfJI1+hquqyS9s6CIefyImOWeQtUgqkBbb2W0DYVhHRFVc3Pg526qm2NhW0CjCUlZFqg9Aj1rPCcyXbSAgaE7IrlaCR8dRgUveGjM4GVRkZHuyUREb03nOjkfRYVK+6egr7zhS6VlsUcN3J630rtSkpBaFJSlH2qJn8eOARQgV2BnbglXNWF1o0KOtlVQr4cw1a027LsNXtkq5mMslwgPTEmwalfjwp4UrLWJYnQmU7GuNy0xem28lWZSqxMJqMMzBFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOPqk32UhVNG1yQ88f0blQF5lJp+BS1wAqZ7uG5VZhQ=;
 b=Z7O9KtNPRDnEm0+FSGqqTuJf3AqMsK1fbOA2xfALQKsAHL71tnMQjYfx7naYZlxeDKnUKxaer1Xz71ftNc/q6Du843GiDVrCtzBgu8SH3vLwGYCNkAnieHOVPd8O9QgUpiwA3UNj7pnhsDWNB/6BtZZCjgltrdHD4otZNx9MEDkHIUgAwohrnXrV15U6gI5ehy9rZKht97JFA82as9w2ApWZg8Sfiz4avfdveg5atd0H5KmqVKcKCkx4XGVo1Yp+k0e3wU65Yt/sKZdgkqwKiTjtyysBmYZ8acLD2/97LdRdr3JwmeDmeTqhNV5ptEeAh844K0MfeZPmvLivq5y3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4948.namprd11.prod.outlook.com (2603:10b6:303:9b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 28 Sep
 2023 14:22:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 14:22:32 +0000
Date: Thu, 28 Sep 2023 10:22:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZRWMI1HmUYPGGylp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db0e39c-b75e-4c9a-fd01-08dbc02e5a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9GDksvISaVGADuhEl4AMrqR/qfoHrlAsKjqCb/bcHZH8xTLIqcHCMFA0dn1mF0y9XKhs8JEmakc6z4uwQx1fa3ahfwx3N2aSW/OhX0ZpL4NoloXOTzon4iC3uC0MERo6bdj5EgYyFF2JE9tO+QRf/UEWY2DXIRYG1h7PhHkCfeAKroKxZnVoJ/ELJorJNl2JUcYNqCDGzY8YoN/oB+Nrz0hRAqXAIJwoARi+tNscC33JYW8laUEM03LmydKhdTenaMW2GbHOzXI/GNcXwGfH8okZ5PggImH04mhsTIqu4cGPfFRYMxOM9pX1DtFouF/hKDkksNVzimYDJx/nruRFrbRIWCvsjEELz02n1qeprbst9USQg5fUexT727tbwVeDhN0p8TJTE5Qxd9/9wJJgnM+B7WPyffhyLHDbOzsutv0C4chrh16rRa5Hzv4YE0deCiUCeJUC1fCUQ+AU7nXRzYFDjZUywm7b/FMFoRTTdFXVCyoW3qtjsKgxdDd1blz7rovj+tEH/Nj6mAu/kR2M21sK6p3wfFsKABx3TwoIRdLjQ3W5Ls/QG+jmuHvDRMJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(54906003)(316002)(36756003)(66476007)(5660300002)(41300700001)(2616005)(478600001)(83380400001)(6506007)(6486002)(6512007)(6666004)(86362001)(38100700002)(82960400001)(110136005)(26005)(66556008)(66946007)(2906002)(7416002)(8676002)(8936002)(44832011)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iqZwEocNMIBhVulZCqYtuf1gJzPll0i15dn0jQg5/SfGx3nb3gT5x5SVbYfb?=
 =?us-ascii?Q?gBZF9Jz8GHO9BJT8OtASV84Yaaehzlzpae2zGO6p2rYq7MbF90UyDOSfVmhf?=
 =?us-ascii?Q?+U6+R9M7hEoExLkCoBoru5vkS+PC6XZrN3lYBZgySSZz8ykD1VjKtmntZZBy?=
 =?us-ascii?Q?wjonnlhgzcenhPzrn1kkf4oTTZGbENFq+d0Da0pewFV4B+/kLZvchmf0on9W?=
 =?us-ascii?Q?DJ8XKILmH7pwlmvAW0ZCy0IP6UuBBjr86x5yilw9fTBCjmbRdNDrPU46EV64?=
 =?us-ascii?Q?4DCZuuQEpAi/lUQIwV3QJml/AEc5qRiypAz0gfQJ2ZBDs4+V3NodW2UWUvZ3?=
 =?us-ascii?Q?a2sNPgq8TX2pIH2lLn3lP16ppAkThqeoe9WLNYJ2fT73FSz6uJn2KU1Aah63?=
 =?us-ascii?Q?GAWv9fPX6wh9fBgg9h5ZEnRWju1i42tJ2pWs53+SR1YK2aI5PV8o+eGv0GOw?=
 =?us-ascii?Q?ZH5PMTXIW0FRWfISjqP3RSvVi8ir9dnKQpnnvHd5eaYs12CcVICyraktBB/U?=
 =?us-ascii?Q?4SSmeDPtn0n8bOSb4MuUqA6h7XAc7wjZljEZnjp2IYpfSSN/By+UN2c4bwfP?=
 =?us-ascii?Q?kocOwLyDmUO78cPUe3SHbABIOoMxYw5D+B/dpZUxGF/ghNhJgLghKlPRGNOI?=
 =?us-ascii?Q?u5Pe8hv/Nn6ixVBM1OOwKdcjGRzsAYJEUPxl9Du18FoHw0XkKYWW0KsRNg+o?=
 =?us-ascii?Q?Z8qI4WSbu/Pme0IVzSYd0aLvxdXsUardlQt8ZQ28BSrRCrH6IowiXCVZkZO9?=
 =?us-ascii?Q?b1si/CB3RFpNEcCv8/7QYhPt/7mUj5/Ic72EVKZrOJyprEYiQQ4blMjfXmzT?=
 =?us-ascii?Q?qtDl/6ZVX8uTOL3f6ItAg6jEqSMNIAFlbAHQxIP6fai41wKdhJhj9/qF67DC?=
 =?us-ascii?Q?T8cS/kNd8FEo+HkozTczpqxM0k8SjQNT3vpQuKiv+Y+Af+GYMaRYKPU18MoU?=
 =?us-ascii?Q?HtXfv3GKqsIYuvqSA4hq4yGNyA3a4l9wqw49UpEQJ8BCi2XgWHslQvp05wIv?=
 =?us-ascii?Q?YLT+wMv12w+z36WC1qmbvTojG74NZGHBWGLqyhbfYrFOpSwIexlTea8UeeAS?=
 =?us-ascii?Q?3wUOORebaBf03Z0UUXrthO4A4F5IHP5IL/DLBLHM+ZSC4541qoQvb0iqlqfs?=
 =?us-ascii?Q?nu9nsOcJQyBq9sbwvVjVUl7kmhtpBzvkrvUkFi+OjzN50CaPnIHDErK5+BcR?=
 =?us-ascii?Q?EkDDHDNAcY5jxDLRyw2/OJlAnQ/jlWsvx3K+9sYy47G7qDZYDG/vPK5XbKFP?=
 =?us-ascii?Q?kr91vE3eSCocPE3kVvGQQ0SPMRZ4DFAACTHxhCqd7eqma93XEAQYD4HVSZuU?=
 =?us-ascii?Q?jKfzSNApzSgVPvMxZGFp5ekLbHke5Sdk2AoxcBPx4w3UwOXcj5dNvvoVPZID?=
 =?us-ascii?Q?EtMo8dAp2Ro1MHVTUXRlXCu+tsQG/8jIT7yuaGRYeu7X8I4rXAbgDdt9209n?=
 =?us-ascii?Q?pbw4InkTunel7QBFjvKcyH4wBe7tY3PEYkLOYmeOjId4amWVmPSoRrPfQhg0?=
 =?us-ascii?Q?cYI8osGiqg9IlrZB5+NFeAb58V47zyfO2IGqB8BgZrerLmFbkTzICoOo6Gzd?=
 =?us-ascii?Q?LmWPCVhCru1p9QD7607reKqvT/C2H8tl/r/mN2gC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db0e39c-b75e-4c9a-fd01-08dbc02e5a28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 14:22:32.0234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ehkdfo1tMteWlzqUcxWkxeFTT3X4whUUn8SOSRi8pSOnwJ9S/b3wyluM/ZCyux+0D2H4i0nBJ63HEos5ORJRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4948
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

Here goes drm-intel-fixes-2023-09-28:

- Fix a panic regression on gen8_ggtt_insert_entries (Matthew Wilcox)
- Fix load issue due to reservation address in ggtt_reserve_guc_top (Javier Pello)
- Fix a possible deadlock with guc busyness worker (Umesh)

Thanks,
Rodrigo.

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-09-28

for you to fetch changes up to 907ef0398c938be8232b77c61cfcf50fbfd95554:

  i915/guc: Get runtime pm in busyness worker only if already active (2023-09-26 13:58:16 -0400)

----------------------------------------------------------------
- Fix a panic regression on gen8_ggtt_insert_entries (Matthew Wilcox)
- Fix load issue due to reservation address in ggtt_reserve_guc_top (Javier Pello)
- Fix a possible deadlock with guc busyness worker (Umesh)

----------------------------------------------------------------
Javier Pello (1):
      drm/i915/gt: Fix reservation address in ggtt_reserve_guc_top

Matthew Wilcox (Oracle) (1):
      i915: Limit the length of an sg list to the requested length

Umesh Nerlige Ramappa (1):
      i915/guc: Get runtime pm in busyness worker only if already active

 drivers/gpu/drm/i915/gem/i915_gem_shmem.c         | 11 ++++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c              | 23 ++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 38 +++++++++++++++++++++--
 3 files changed, 59 insertions(+), 13 deletions(-)
