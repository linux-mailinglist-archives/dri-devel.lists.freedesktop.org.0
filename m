Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892A65F4EA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 21:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B360510E499;
	Thu,  5 Jan 2023 20:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322BA10E499;
 Thu,  5 Jan 2023 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672948949; x=1704484949;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=aD+hWuNF+sRsN4Do2tLIU7wwjM/kliug5pUJV9OlcVk=;
 b=fieypL0osJK7CtNTraNCMZ2T5/QguviyF4pPx3sNCCyWjf41a8kQwh4C
 Qp5KivvuiMGiqMXNeY3tgdE82tDtIfbHf8xldV12MroqpUsnxs4m+QokB
 dzL2xOcZTuhTBdVfbLGC1gIcai1/bFRwad0y9ipqruldj44P24jMFTYeI
 cIoAAoXOtP1FciS+siI9IFDDmJxYzPqCJVgFTrMfo+3TEGWxJP+G393uq
 LJSVm9hS/b1l4PJQGn9GAlKvgQi5crpJWz2mkBAOhHzBYEevxqaBUU650
 lTalipWxl68VZwZqlpf7JMC3KXzFYo0lqBBFO9ikSLdVvjAMboKMGGbsh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="386764546"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="386764546"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 12:02:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="657656373"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="657656373"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2023 12:02:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 12:02:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 12:02:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 5 Jan 2023 12:02:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 5 Jan 2023 12:02:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyH1GRjMK50V9Fjti8504VdyDMYmqTfgZQXv7HLiVAWMQ55YbgYq4aFUt9dwywXj1sNk9Wywv7T+JJKfS/pbfFUMS0SODZUGAJNQ82xNlNUEVNrcAvY0l8tZ4DGRBQp41mc9peE0JIaNjjJK7jQt6sGph98SSCi3cZcY8vHEI6K/aCSnlFC34sxW2tC0FoqPdk6SMuRv3z8oFA9NmM5lrp796x+BJYgQ0D/zyHeiYssURlFw4TI98t41Dh8AQZPAurNoaNeTdcNHru5ikFDw3zqGHt4HD/4V3tKDTDmf1PAHbGLwqYBspnxtqA5cQ3TohB0cR78NS3qBtFnRl6HthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mU0LvekstwVdPfV6FGYoJJPrxB0CecXglsQ4DtmlRs=;
 b=P/rxvGRdQa4JnYk4kNxR8psZvgueOTOVxhGpWHTflA4OCPWYSUDkgmE44B7OYaDLbYvX9FMCUc4HYg5RjGhCxYK1UHQXpYujWckyXAPVolmOivXU0rhGtkt/SJHVr9REqsTTaTQBtcUOrxV6PYOdlQP6ljXzRvNR/kfXxBjuhruqPyoyfSzfsM92elAiUPaxqlmjTdYQgFwh/YRDWVw5kHYkOBw5g7V22rgvfduDiXo1wikDDb9fz5J1fIQ/Xxv5RooDq3S9i5gFPY1zMlrM2pzNT/5hob4BkOtgenDg9sIko2ykwb8R7LxXQ6L7J2U5wasJwgal/ItitS9vPExVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 20:02:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%8]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 20:02:25 +0000
Date: Thu, 5 Jan 2023 15:02:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y7cszBkLRvAy6uao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2c4881-8ddb-44e7-7906-08daef57c3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S10xBcqLRJimyu+N7cNGSAs+/eDHrItIpE1d9KRphmjIWoFT/do9sv5C7g7EJkd/euEKffZeIEwYIk/eWFxeBTdMSsjhaCL/0vw/VIcl9yiP5LU1CG6XAQTYEb6CQSjbmr5ZsBsfciSTeGA4X4wY6k6PlMBXIhd2SgQabIkYStC2diocCv0iGy2v3eMtlZkTarTW3ny7Z+v1qWOwFEaQqmEZ6xThCjUftua5W/9xU022SwfPVZmgJSeW4/iX2Q7s2ZnB6k0/DYKl4+25rtS0sjyMQDyQpsAd2YKSGEzWBlWapPKYmtvTqp9At7UMnb4cZ+nwsYCP7vx/9Pn2MYIhX7XqC50Ii9KSVUomm8CfW7FSpDJOr4DYgfCVvU163mIJuTsY32/M8n8SXuf/g6IaB0J9u1ieDurfcFN5FCeVcoe6djWpbaMOcT23f7FCsddRddy4TQsEzWzM9DL0Kwimncru8ds0MTvlHQglr5lubNZhkpfzWxwBNy1Ee5V1Qgdj7FWVfv1jyfkYkqSIVnqmSDgPIRmCFp1k1knVyCU5wOSna6NaaHdzqbhb05pKObEclre0ONlZ3z64tI26FgFLv5uuEPfactOUuozk6Wnh1df4e3rSnyIynQXF9P8vQzF3WYdKImxOCO6WWN/rN+l+TxBDQJHn/17xy3PMkypdaO6GnvlSb7D+WHmbvbZy+ki/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199015)(6512007)(54906003)(6666004)(316002)(26005)(110136005)(186003)(478600001)(2616005)(66476007)(66556008)(8676002)(4326008)(66946007)(38100700002)(966005)(6486002)(6506007)(41300700001)(2906002)(83380400001)(5660300002)(8936002)(7416002)(44832011)(86362001)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y+zZSfRQ87fvDYHr+ZQeor1LTzh9tjiojDsD/S+xpSgfS5O/SibBB4H6ooxC?=
 =?us-ascii?Q?xMXMGVDzv073ryq/SQ+PYf7w7EJmfO9zl4vi9Y8WidLRP7gAt23WcQQhQz77?=
 =?us-ascii?Q?eZMcd3bedMvRFJkb8HUzbChQqmzgtrZWKduG5W2VG5mKMTqaAxCgRfyInzkI?=
 =?us-ascii?Q?V6wUCfDPsxL5yZpFKQnHO9js0NzG6s5b8hFOLmQ0sXyO+mKeF4IrI61q6ITx?=
 =?us-ascii?Q?dG1xgtMv3dU+8Nk4cGMK5j/ijr3A6WmValvEYyFsmpX9YX59X9ocMx4dGxEz?=
 =?us-ascii?Q?NzT5etJaTbKp8Cl9KacXfvNIiyI3P7iefLu9/w2vix33/Slrcw/jwfaB26IC?=
 =?us-ascii?Q?++UWNlaXol7sSHZtRflsh4RJtLK1UxulCK8uIROa1DvR3NIKbek27SmDM3qw?=
 =?us-ascii?Q?51G5ILmOsZxe4RgKINSQmAogNeGjasoNAFcwXt6wudtKkZvDY6cWg7fPwijS?=
 =?us-ascii?Q?zZ8glGhErwzEpn+khBzhhwhUt8/NIlcyiT7GAsW+qL1qKhMHBofz/qsIopzi?=
 =?us-ascii?Q?7Y07QqACzJPTYKRFfaKIe1Rr8chsAoet/VX1jfef//1A0ucC+jgdEw6LKv8k?=
 =?us-ascii?Q?ogBgTw2mA+gtTkiqvGhb56RJnL3/oximfcn9fpyZNVIFoy6f6i2I9Aizw97k?=
 =?us-ascii?Q?Rb6uv9S7Vpi7epQEsTV4EmA5ZIBmttZuKkEl0Hu3jprTooi3OsDySN0ietXw?=
 =?us-ascii?Q?bdNaVbBgdDXNKyeHo29dD1MhaqWcTeSM1pzmeks/RiLk1oGjJ5XUrscOfM4b?=
 =?us-ascii?Q?EH0eVq/lB+vfNuHpvWyDTLbqNg0oAufuxuUlC5ClSPZ0k6UkpjdoJiSRq9q6?=
 =?us-ascii?Q?YlketGeDST9e8ngWbXSEKjbXdc2A/9Y9K2ohi1004HjPnTQzTkE5oeGnNaMk?=
 =?us-ascii?Q?wl28UmbE202Rw6f19lfPXhp1Hlp1F8wMhOOoEDVM+QiUWqWPBP4xvgl83dBz?=
 =?us-ascii?Q?eIyra+T996qfyeFaLczUWst24whqTLnugopEKhPPLePGu8VF1k5ZtDCltask?=
 =?us-ascii?Q?io6EqphL0h9dgBeeDM4267hSH3uif+dkUXkOkXYRfMa/phoTOwamUTQoFuMC?=
 =?us-ascii?Q?LAz8DH8vSvI2FhZYtcMfdYXpiKkdbyAWmYNfZ6/syEaCTx/+ml0bpIo0Cg1W?=
 =?us-ascii?Q?2cBNSC/B8EErbZSPZVPQGBhL40VTQSx53bTMueZhyBcyWgojGDEBg6wuT9rc?=
 =?us-ascii?Q?ROVlgnwhfX6itdj1GSTR0tat9uhyl4VHp5x9mJaorXmjqpkunk72pfkG+wFr?=
 =?us-ascii?Q?KegUpP2yrgxwO2Htirz2mvYXkUPBHGctsVUwO0LRMxWu8zdJpOxhtZ8E5cyJ?=
 =?us-ascii?Q?PVwKpTW6Qr+P0Sjz6af1lLoCxX0EdJGBPutMsMZXOklk0BqMAb8SzLnpV4QP?=
 =?us-ascii?Q?colE2Ug5AfZOdnEGsxO9gj4ax50DdYbJ6zDXR89K85JiFb2BSyA/ZXgr8p9D?=
 =?us-ascii?Q?kkuD7X7AAN/c/jYJiIazDcHhlpO0z4DDpD3ISijF/V13SR4YHwzKd7VrGfcu?=
 =?us-ascii?Q?LVCG4EzJgAHosAnDAPBxVTDPMq0gAfQx6NUZOywDfpjxL2eXTHqyzYxpMiAG?=
 =?us-ascii?Q?X2Ij4jjM76Qa/5B+o39p9lD2B8pKEaPmITeOMkUUWqf1eoC3XIOESkLkUFK6?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2c4881-8ddb-44e7-7906-08daef57c3fe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 20:02:25.8911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w+tor0+jEC7lk1qeGWtKzJjJBZFGmI3unbpp9iRcUfI8KKgttnOEW+rLJzVpNOCUIg+znbcfq5zoK5AH9b9Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7864
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

Only GVT related fixes for this round.

I have another fix queued for i915_vma_unbind_async from Nirmoy that will
target stable 5.18, but I figured it out late so I didn't run CI on that yet.
So I'm holding this for now. Maybe and extra PR tomorrow or it will
wait for the next week.

Here goes drm-intel-fixes-2023-01-05:

Only gvt-fixes:
     - debugfs fixes (Zhenyu)
     - fix up for vgpu status (Zhi)
     - double free fix in split_2MB_gtt_entry (Zheng)

Thanks,
Rodrigo.

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-01-05

for you to fetch changes up to 87809d3196c2a7a015ab80ca1cb8c19b659bc5f6:

  Merge tag 'gvt-fixes-2023-01-05' of https://github.com/intel/gvt-linux into drm-intel-fixes (2023-01-05 08:03:38 -0500)

----------------------------------------------------------------
Only gvt-fixes:
     - debugfs fixes (Zhenyu)
     - fix up for vgpu status (Zhi)
     - double free fix in split_2MB_gtt_entry (Zheng)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2023-01-05' of https://github.com/intel/gvt-linux into drm-intel-fixes

Zheng Wang (1):
      drm/i915/gvt: fix double free bug in split_2MB_gtt_entry

Zhenyu Wang (2):
      drm/i915/gvt: fix gvt debugfs destroy
      drm/i915/gvt: fix vgpu debugfs clean in remove

Zhi Wang (1):
      drm/i915/gvt: use atomic operations to change the vGPU status

 drivers/gpu/drm/i915/gvt/debugfs.c   | 36 +++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/i915/gvt/dmabuf.c    |  3 ++-
 drivers/gpu/drm/i915/gvt/gtt.c       | 21 +++++++++++++++------
 drivers/gpu/drm/i915/gvt/gvt.h       | 15 ++++++++++-----
 drivers/gpu/drm/i915/gvt/interrupt.c |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 35 +++++++++++++----------------------
 drivers/gpu/drm/i915/gvt/scheduler.c |  4 +++-
 drivers/gpu/drm/i915/gvt/vgpu.c      | 12 +++++-------
 8 files changed, 80 insertions(+), 48 deletions(-)
