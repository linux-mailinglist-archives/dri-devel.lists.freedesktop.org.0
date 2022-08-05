Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F394F58B0E8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 22:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7E7B3D76;
	Fri,  5 Aug 2022 20:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162AC97227;
 Fri,  5 Aug 2022 20:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659732434; x=1691268434;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=M0ZdS0sDibG6lqsRkEEnOjvlqi6nvFIcwVLYJXaHbO8=;
 b=B2lLMqq/4q+nqSyLCmopMWCijWC+/H8K10/YVx/fgu8xyhG6f6p8Ge6r
 l56pKd12dQwZKAcEOXxyXZaj6lOEyC3Yadx3TnD4a0Zmt+SYxB9QlCb78
 enQ0b48gR/vy8jX/2PfApJPYWxkBSXvyW847/NrbyQzxtr/m9J3cJeMIL
 MP6rJAwaPH81QIt8AN/lg3UjTotv/tVSoPkJcurTA3N0WuLOutrixI6Oo
 TZs8pHi051dmWVbmIDgaUbTbaAu/SoXg8mXNj/nzbeHdvsmFjhPNC26fd
 f2hBCrmpXZQ4yfwAI3gy6+gYkjWT0FL7COAATyr4tGvz6RkLm2SocBwME Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="273335833"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="273335833"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 13:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="603717791"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga002.jf.intel.com with ESMTP; 05 Aug 2022 13:47:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 13:47:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 13:47:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 5 Aug 2022 13:47:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 5 Aug 2022 13:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5XxwJrWx1Q68RsRdTOohMmDmjBcCoF5A8ufNu7qMuyd3X6HYAWcLafHLRVld/1S4ngG3FT1kXz63RGJelejvejHKfa8VbelsadjJHv5uPqaNOkRr1j+DkR9JPWISQU83cXMcfBjJJg+r2lbHsqZ64PSHeguV8YV5B7d5QWMEbQaGgIYjAOYggoPgbKU3F418H7IzEGia3214j5kbnDGKC3DibRF9+MNJKRqATC+ZBdSOpFTvJ2n3kn5sGXP1YZ0MbpCBjyXpxQhRkfM7iMaZFnIYpK3J+tex5gewFKYvlF4fne8FB6DJQOboohmkzFaU1l/EdbaLqdFJHIix8l2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mbboinh0zzg0s9cLu86zDS2zRzZ9t59OR1fFqXFFS+k=;
 b=Fyvz9sV7BCQGhbAAcmOkBBzzGwrWC7xIVAWEpxNHabvemYuR+nySrHjiMk57i6ctCCyWf5pmzQ4MtltU4o0W7dv8M5ScI5SCwFxWdMQf7k/dSsopwUvpo0KDFUp66K2KLuyIwUXY2Cuafztk6kEw0jAXUItB+wxOj/tdh6nFIbJ+/9fC+b8GJnvXMxUv+vYB6N6MEMbFg/hE/xwImkm9Z4H7Wrsmu4XmVhFSA+mnU9OspkrVgaObZdZABJG39ZWXBzOVpr+u/80rO+1rMfzR54UBa1R11vZLW98nI4cbSXHBWpY2kCyPbv00YjP6GsSkaWCBzguC8hJewd+4Zja4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL0PR11MB2884.namprd11.prod.outlook.com (2603:10b6:208:72::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 20:47:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 20:47:04 +0000
Date: Fri, 5 Aug 2022 16:46:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next (updated without the bad commit)
Message-ID: <Yu2Bw966Ii/NfF9L@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 555e571c-e7af-4c6e-3c1e-08da7723a70b
X-MS-TrafficTypeDiagnostic: BL0PR11MB2884:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNfEub0Igxj/Z9/O4uvmJ8Wj5adpqtAaSBAzt5pmB22a6zyRuB06xI5lilCOTgnypRNTAZsqy/FCh1GwFKT7Bgt9n0V2f6iHNgwExk/FreanEyo9IhZMXg5mYMlmLx8PvGqhLL5JWXxkclacU7O3v+qbvBHYvLG40p+7V6z+PMNqawfeTuf5Hd7ASMKhzUxM3x8Fr5EgfVQceW2lrjVm13DhZIzQss7iQQyYOyx4XACWrRbP7WN3pIPoNhVYoXABNCTHQukj40bCc56F2OFvkK5pzKVrSptO7NXRV9ZrnGsNnvYxNw9iPNA6YKxeV9lZJRg4E7ZUwoRCBRQMRyGNHkIUls1Q1khDkHR4iC9Bs9TXc55yU1LezocIla9uzoVkBjFgTcCsf7G250ao2oAhQHCWdX7X+nRAqQr9mpOkInrJ3R6w8WR0WDNDRaZAN1KEGS7j611yG1gtwDShYSwwJrOIxlT0r913J6J+dIt4Rnti0tjc8rSi7K2o52wgbCjNTWspQEeIktiNhdQc2ZRWd7e+30NbXkbRSuwznWZpl6J5r6sc5trrJ4ssyCIjNbmyTVrzTfgRXSmzlkkxTmvtRJHvIhff/f+7X21C+1Eq5Bsvd77/wfqqJDnvjS5h6Cqn4UEhzCYqUGPtKTJa7bIhJGdjTTQMo8UiPIDjbXwI6BE0e6nX3flwoXJuFV3O70XZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(376002)(366004)(39860400002)(346002)(2906002)(15650500001)(83380400001)(82960400001)(38100700002)(6486002)(966005)(110136005)(66574015)(5660300002)(316002)(54906003)(66476007)(66946007)(8676002)(4326008)(66556008)(8936002)(7416002)(6512007)(186003)(44832011)(2616005)(86362001)(41300700001)(6506007)(478600001)(36756003)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aaM/ut2TGXPAXIWcYREc3DTSjKrQouD+DnQte+gIznn2WS40X9EMyi8F+v?=
 =?iso-8859-1?Q?UuPhKWY2/dYef6qi7gbF89eZeHH7sKKKBwdnDwDTtqkUAvWxg3qVp6+ndS?=
 =?iso-8859-1?Q?VyF33YvkDQaA/rjri+rUfckfwuT+izf3UeLHmx6SIYq0PQMyuz0ux/DnKg?=
 =?iso-8859-1?Q?x+MKhKb5YfYDPo/eO/gBzMBvEnGOTeJ+s0FEZaSDsP0MJXxN5pjyGpnQhd?=
 =?iso-8859-1?Q?ZoU9yYjIChBLeVIwV9hiKh1uSafwxVg9BrwbXZd8vdRqQ96dy0WSWd6yOp?=
 =?iso-8859-1?Q?0w80A4sLljnrIRxtOyBrgKkxaN/6wf4iIkBee4m39HK4JSp3AoiGjMgJnf?=
 =?iso-8859-1?Q?mi5hlYCefszJ4gOtMNuQ1iG3YQlqObVz5GPn/S49240QH7Uo82Yv1zBh23?=
 =?iso-8859-1?Q?3dKFGKfZ4j84+kS5frfLja8y2Jhmym0EqomTkzUsmfoUix0+olA7SpbwgO?=
 =?iso-8859-1?Q?ch2OMIJW7sdcdW9sgOKq5iPJ1iTqcfsOJ4sFK8B193S0hgAp33Oc5dE8KV?=
 =?iso-8859-1?Q?f3mHwc56Uo+jAFAQEsIk7oDw0dKmLPEqzYQf51WsnFxP0Y9LQkfTBTfvhF?=
 =?iso-8859-1?Q?B8y6ITlegQPbM0cHHo7HhnoHL4HF/ZAITNPW/56MWYh9JevjPhX+s8MNtx?=
 =?iso-8859-1?Q?49ZF+wZv73mK873e9Lya9THoH1jvaqQ6k7oPDi7YoYyyT+NOPSyF3J779/?=
 =?iso-8859-1?Q?R5nCFSuq6FlWffHxJiXIWZfYAMNPaqzlvwD7D91DnhCMUJiaLgXoHa4nvN?=
 =?iso-8859-1?Q?xfz1EnHPKTiSlt/HaCCSM2wN3aFNWcrijFdNINSWJcYi623yskN/TkFkDe?=
 =?iso-8859-1?Q?NhZvfPNZMamqrzYJqqWd1gSzrFdadgZFC7rggqUx6tgnu8zyax/FYxSwnw?=
 =?iso-8859-1?Q?ZViFk6QcyAUUvegtyBjSTXE3Oh2QcC7VEgrDSzxz33TbSeU7XyJS75q8bo?=
 =?iso-8859-1?Q?Mwq4UoQSIeLfd6ChSrei4M8cAHYUwAsS9eitgdPY+WjUTaiCSuau8ay0ma?=
 =?iso-8859-1?Q?s4VHtndE0HKK6i5lSAyLDmF6igqcpgCjXOR8DhP7+0RYLvcYNfXrREnC2X?=
 =?iso-8859-1?Q?Ucdo6O5CNlq8YnM4f+wfcD6ym7LREgbKs6HOgKL8Eih1lwpE+RUNEqdYPc?=
 =?iso-8859-1?Q?FFZVpruSduxf0/1dnuvcTArY2vyij7/S0hKQnns+fDgmyYwKJf664A1wuv?=
 =?iso-8859-1?Q?YT5ZvSGzO/jwI6tLOkY+/MdhvoFgWZhaQ3guFFQgcH4bNB9aIfgZMMYXqh?=
 =?iso-8859-1?Q?dN1l+WEIQQ9olPwZIaZKn/FYA62M+2hjnfjKLHknfI2oZN5eriWZEbqwLx?=
 =?iso-8859-1?Q?osXnrjpNJE40DAxa/Zsfxyv5Jg6FVuciF7T1Prr+unVvtFKxvcSxrrRdPO?=
 =?iso-8859-1?Q?50rWzx9Rbal7TvZQpi+bDkugziQAAYsxgY0MGVg8rX/zQgnw9g8rTCRASv?=
 =?iso-8859-1?Q?jT5Finlb3kMZagYopzDDGJkTRriDMdHWEeUslojXw+Kkxy5kmGvqiMO6NM?=
 =?iso-8859-1?Q?2z28UUUhs51C2U6qKIc9dP5SbrmwWho7J4Aw8CVzwRTixQwS6Ffn0EyQ0Y?=
 =?iso-8859-1?Q?bE4STgryNX+aayDlChUBfNwJh2LH2mFEgAjjbb/ce59lM5SwiXJfBiieDD?=
 =?iso-8859-1?Q?z4u4OY81YhuAV4E0YaYRJ4jSBLvOTh8lywnVDAFtHjb8TLkr4XKcy4Ng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 555e571c-e7af-4c6e-3c1e-08da7723a70b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 20:47:03.8781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPYNoqukmip28GB1fWW6wkHwYfdnYN8AeFdLD93SoEO28zY7FoaT/kCViPdB2L28fPVyXXsGmUINY9UwWFoEVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2884
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

Please pick this one instead of drm-intel-next-fixes-2022-08-04.

Mauro has pointed out that the commit "drm/i915/gt: Batch TLB invalidations"
was introducing a worst regression in comparison to its intent.
The work is in progress to fix on our -next branches, but we shouldn't
backport it for now.

Sorry for the noise.

And a big thanks to Mauro who noticed and pointed it out before
the propagation.

Here goes drm-intel-next-2022-08-05:
- disable pci resize on 32-bit systems (Nirmoy)
- don't leak the ccs state (Matt)
- TLB invalidation fixes (Chris)
[Excluding the bad commit drm/i915/gt: Batch TLB invalidations \
present on drm-intel-next-fixes-2022-08-04]

Thanks,
Rodrigo.

The following changes since commit 5493ee1919eae4f49d62276cf5986b7f7c7aa8f6:

  Merge tag 'amd-drm-next-5.20-2022-07-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-08-03 14:00:19 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-08-05

for you to fetch changes up to fc30eea1542dd787c6aa46e970014e97e390c5b2:

  Merge drm/drm-next into drm-intel-next (2022-08-04 10:19:24 -0400)

----------------------------------------------------------------
- disable pci resize on 32-bit systems (Nirmoy)
- don't leak the ccs state (Matt)
- TLB invalidation fixes (Chris)
[Excluding the bad commit drm/i915/gt: Batch TLB invalidations \
present on drm-intel-next-fixes-2022-08-04]

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/hdmi: Prune modes that require HDMI2.1 FRL

Anusha Srivatsa (3):
      drm/i915/display: Cleanup intel_phy_is_combo()
      drm/i915: Pass drm_i915_private struct instead of gt for gen11_gu_misc_irq_handler/ack()
      drm/i915/dg2: Add support for DC5 state

Imre Deak (3):
      drm/i915/tgl+: Fix HDMI transcoder clock vs. DDI BUF disabling order
      drm/i915/d12+: Disable DMC handlers during loading/disabling the firmware
      drm/i915/d13: Add Wa_16015201720 disabling clock gating for PIPEDMC-A/B

José Roberto de Souza (2):
      Revert "drm/i915/display: Ensure PSR gets disabled if no encoders in new state"
      drm/i915/psr: Disable PSR before disable pipe

Jouni Högander (1):
      drm/i915/display: Ensure PSR gets disabled if no encoders in new state

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Update DG2 DMC firmware to v2.07

Matt Roper (1):
      drm/i915: Add Wa_14016291713

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Stanislav Lisovskiy (1):
      drm/i915/dg2: Bump up CDCLK for DG2

Swati Sharma (1):
      drm/i915/display: Add debug print for scaler filter

 drivers/gpu/drm/i915/display/intel_cdclk.c         |  4 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  9 ++--
 drivers/gpu/drm/i915/display/intel_ddi.c           |  6 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 14 +++--
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  5 +-
 drivers/gpu/drm/i915/display/intel_display_power.c | 13 ++++-
 drivers/gpu/drm/i915/display/intel_dmc.c           | 60 +++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc.h           |  1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  2 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |  6 +++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  9 ++++
 drivers/gpu/drm/i915/display/intel_psr.c           | 14 ++---
 drivers/gpu/drm/i915/i915_irq.c                    | 16 +++---
 drivers/gpu/drm/i915/i915_reg.h                    |  7 +++
 14 files changed, 126 insertions(+), 40 deletions(-)
