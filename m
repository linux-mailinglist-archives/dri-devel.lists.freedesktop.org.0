Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B4573F15
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39ACC9BDD2;
	Wed, 13 Jul 2022 21:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DA69BDD2;
 Wed, 13 Jul 2022 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657748433; x=1689284433;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=ac6XtWNeRFS2d9qal5X2EYV6dvj1QIOdK+/Pn1S2OWk=;
 b=T++fzQ3dZOA0YlceEZ9DmxR77C7ybuw6EfnQNmltIMONsG94vFpk+Y4G
 PQ2Ur3DCQoSKGk4z1w8uba4oaq7aTKdqvOnzFW+AppIavYD0Zwn28n1SM
 rukL+DaPOM3/RxunHXcBS18JWMd2xJ7LZr5Kd3BDQkXee4ZdWiKm3b6mq
 eb2Ulqtw8vpXzgPNgZyUnF0as5HE8OgkB651ye8GsIRrqj6YGwkIkGMbi
 DqSxePuwiKhdoKIeoR5B7F93AYCScwDRB5cLxHRhg0TVgw1VpDmJ+XHum
 IwKHXFgVHFGIAsfePeQOvlLHbW42/MNN/DZLfPfQM1q7G7yV6xC/hr/ge A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="310997044"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="310997044"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 14:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="841917697"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2022 14:40:32 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 14:40:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 14:40:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 14:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xok6i1r08GQTDxwxM54uvS1JThnhRtMRUtrk7RWl5PCHU9y6QGPhCk7ZaVqprbicKy0m+Usbt1NjbH6Qc3696H6JP397EMkDMvJlwbATfGTw63XlQHEEDKUqSttKKRUyp2KdzzoeUfqhO3FHyLKoze9dnJ+TAGY7+/2ZCsJb5X6bD7RrjhltLuFbT2GNoFAZd/g1JQ/8bL7Q2LMoMhvZUX97MdgFocJBxzQK2MaRW0T3E7JKCwFTnh3ZssoxKqynt7TKz0Y4MxvhofLCpI0hje7mz0xyYsX/jE65+WqehKyt9L7bk8bJJ1dDtmpVSjVw29A+P8ihmerDNSPY26p9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yod8JAtHe2tL4dFPkBe96+sOl3XFZhc967P6MZfOjfU=;
 b=mZlTTugrQjVBw+enZp6KZISgYCqe2ZuVBu8JphSQTHojr1TuBjDy26b9tvGewctJWgLeOnCOhftFCkKhGLCuKD3PYc1L8QuDKZmGKuRaS2eWNBDHKFikBmi7Iujyz/Tm0pz/9XUEmP1ln3aDLz9KV8Kz6nCRLW13cor6AwN4DTMcOEE7dhRlj0TPXo+PidWvfBsjnOkjPIxNje5lJJSxMcKOUBIwGkf/enEL0iAMNJEsFhHxFDqZBryJ1q8wpMINTygK684K6zf5K6vxNXNAaxABXHtnrDqrnZfUBPhqi4aHH5SaRa9hZQWQp0a8LsTyjpAPBWX+TPxyyG4t2xAPMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6693.namprd11.prod.outlook.com (2603:10b6:a03:44b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:40:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 21:40:30 +0000
Date: Wed, 13 Jul 2022 17:40:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Ys87yMujcG2sJC1R@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa01acc7-75d6-4ac1-24d8-08da65184ec3
X-MS-TrafficTypeDiagnostic: SJ0PR11MB6693:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iNuTRBSf/GnN2IAy161gZxNMM5lJeqEOINh3Z9obfGAhFr9rdJoeHG/A9Hg59gq8wiS5QgjPuDwdhKuNzgsaNHBUXfkhpnD509MBTtetpLVqiFK32YqVlXkUiHL9tVn4tIoj0YpH0p+plVKfxISlVo2j0BCEYfWv98daJNZTDI2313G+BB2PqaEjzysz7PqdEtkQuOroeNfmHh/sG3MafWgy5p2V95CA1eKYoZxHDke/Ili8stkUQonk0QO5uPQXrUPXEHgHM9yi3Yx4hky/3VJv6XdxgKc34TngD8V2cRHJ6Ic7PywVZFkZxGVrCfrjr6rzFOTxRYWFlL7XMsFmPrCrk8FlxEQLWWYqbSPrmIhAAbmnba5Y84pT+UF2FCgxmm/fih6+tpF2QWGCNe6jYPvM6pj/IxZQlieSc1F3MCR8tAey+n7cHE0Tk3tIFaVEnxe39zoKPrQ1VNcd5s9bXZwOYYSWo3dlyMLI9p6CORX/WygdrRRzK2c9Rzb0c7HrLH1dQ1q4DXUWPfYHW/2TvXlRtD7XD6aPPHLx5uKJCJIvderuVHI+mca6rOzHqYlmLO0eWMOWIaaUZKvHVVvkbr/28SOOnGTpKzF5JfczVPYo9oQBpeDdaj6P/4gv6DeyKeyp1yYxkGNwyIDan1Ydy6GnQmwIh6ABqXu901vBnfG4PQD5EtLIWRS5IAa/soKslIT8k/HdAwP+USJzQk3d0NpxAj+OrbIhUeR/sxsxaii/1lKuFv1gOL8dpys5qCFqd8SBBQ2vb0x3PFPX3M5o2qfHsPmDwhcxrnbpgJrPtAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(346002)(39860400002)(396003)(966005)(2906002)(4326008)(2616005)(66946007)(66476007)(6486002)(86362001)(8676002)(38100700002)(8936002)(478600001)(316002)(6512007)(5660300002)(44832011)(7416002)(66574015)(41300700001)(26005)(6666004)(6506007)(83380400001)(66556008)(82960400001)(36756003)(54906003)(186003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4Ey+Iqqa+if/knnBZfGDn7HdjMAC6s5TcLvvtGCR2qIW6wfdswTsyBwmKZ?=
 =?iso-8859-1?Q?TNGjJZJPRI0oPT2hQTX/Ko+Cac9PfAM9GLxypzFS8h5PiVJjNhNF75YKPq?=
 =?iso-8859-1?Q?LD/yxMmZOcP25HRSiQuyOdsnEDVFNXhuo4N73zu3j7aDAWJ99QXEabruMt?=
 =?iso-8859-1?Q?R8sfDOZj7xhnW1L9+Su4rvEWue/NdBpgVGfA2Yxqo2WRQF86u4F3OJbC5w?=
 =?iso-8859-1?Q?suYFzyE/ore43ytT0cPtAFAOWc5OoyWoVxnsbaT9Aa2di8rww6GtvPGA9O?=
 =?iso-8859-1?Q?YmVPreWv/YDm8Wv3fl8s7DwUynazIaejwwvPM6NtPvYJQk06H9X99EvDDK?=
 =?iso-8859-1?Q?zS/qp0uFlXc8AvtBmlleJX8lNPNV1G2s4+mappbjg4ewqpeJm9OMGrD0QN?=
 =?iso-8859-1?Q?NLHXZZyx2cbaDn6SdW4eD32G3VVYXG3ORXQBHWK21MKqZZRcVxd+Dr8l86?=
 =?iso-8859-1?Q?R5O/oMqeUn1HSD3I6dARJvA/QVoUxfvZKuI7g2X/p/Gc9V++nepEgnW/Sb?=
 =?iso-8859-1?Q?Sr5FxSwwUlUstnzeWZsadf3eIbCwPTQaBTCi68vI/bMie3V+fyCHCxBA21?=
 =?iso-8859-1?Q?5thEucpHwPuBi5eoPqiv3L1PMomtTfJW054hgLhNYPWJYQ/bUR2BETwm1b?=
 =?iso-8859-1?Q?T5kVim9sQGe5RSncYIWj2Zzfe+1ml0v4XsX4nGmmFJA5DWYhhFG/hZmgz8?=
 =?iso-8859-1?Q?kwM6ZVDTnzrYXn0HCmF/dfRziiAihtjbE1/Cz44bUqj7dmv9QuHya9PN9q?=
 =?iso-8859-1?Q?ox/jMVkDi9SSG4SKtrbFbq6brNo0XQmlpE0Swf/2z9uMlJ/9eTRukGFxQZ?=
 =?iso-8859-1?Q?ycDDFq7RX8xQKJw3YpzIOfjb+Z43IpoC/N/HfC+FtBbirTGB9jU5gjbHoz?=
 =?iso-8859-1?Q?LdmmKz1jaLPUc1K7Ojqohh7rDLWZxzYl9OA9xpdBdO5KxkBkLbMK5uyg6Q?=
 =?iso-8859-1?Q?1rE8MZgmv/Td5VbKiHxjnylZbbjlJO6ojuGeJzklXfGtAuQWFGHQ7VaiGA?=
 =?iso-8859-1?Q?WjE77hK7WWorl5Ey2yYzJPc1i6VLZoguhxZzx+KxvcDp2A5oufymT3N+GD?=
 =?iso-8859-1?Q?1Ux5IcFZrypdh6TMWEkYYxJvHvGNWJ+NV69zHC303g9bfJZAEmUkJTeg7h?=
 =?iso-8859-1?Q?L1u8bUDP91409oSN/0OaG1f5qlpbyQDb6fohscwmWAr2ycuLWiZG+KMtyv?=
 =?iso-8859-1?Q?cp/65B2fxr+ku4r7zSqmYUMw0n+xoqxRDeH37+5wvWeDVbqLFIRrlF12TK?=
 =?iso-8859-1?Q?GDDpmjGaINnettDxQ8CiuwOsQMM9qjck2RReAyt3S5tpN7mPMQlwy+GRgM?=
 =?iso-8859-1?Q?ibBs5qtulC9bjbj3XaFmkk0hTCNTxNWefLI7AsQE56wnCcoDoywHbSI1Zf?=
 =?iso-8859-1?Q?QM45L7TbQCuMR+Zqd/gpuJMYqFrwQRE+a/GW5tWk9e5YA1CYPaH/+Mx8cJ?=
 =?iso-8859-1?Q?ZXcemaiYtmj2rSSJKorUI4L+6eEPwbUYy2gJb3YBZmNBeMwgH0hMnBq6T4?=
 =?iso-8859-1?Q?0vfjGoMTxO9AfLDLOliZyWwtY+C7Gm7m/fUtNi/0GXJlHTcwc+bCrhGhxo?=
 =?iso-8859-1?Q?bn0dWc0jbLpOL8bvWPAlEmz4rzkueZmJz7aETY6KQdWVtopJSBHvVtvei7?=
 =?iso-8859-1?Q?mmQ3liLAmhzqTAPu2eNzBgDw6rqVtAyhJRAqVl6k26Vz576YvAdbY2qw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa01acc7-75d6-4ac1-24d8-08da65184ec3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:40:30.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrZ5O2LUw0k/7S9tDVR9ocDA6J18NPonAgi2AXMG4xSpvzQFQeeylHjbitbAxLFRWoxSlaAywi2VuBd/No9H4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
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

On behalf of Jani, here goes the drm-intel-fixes targeting
5.19-rc7.

Please notice that this also includes the patches you already
pulled last week. But for some reason they are not in the
5.19-rc6 yet.

Well, we always use the official -rc as the base, but if it
gets easier for you to use the drm/drm-fixes this round just
let me know that I can force-push and generate another one
tomorrow.

But I hope the official dim flow works.

Thanks,
Rodrigo.

drm-intel-fixes-2022-07-13:
- Selftest fix (Andrzej)
- TTM fix sg_table construction (Matt Auld)
- Error return fixes (Dan)
- Fix a performance regression related to waitboost (Chri\
s)
- Fix GT resets (Chris)
- Fix a possible refcount leak in DP MST connector (Hangy\
u)
- Fix on loading guc on ADL-N (Daniele)
- Fix vm use-after-free in vma destruction (Thomas)

Thanks,
Rodrigo.

The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-07-13

for you to fetch changes up to 333991c4e66b3d4b5613315f18016da80344f659:

  drm/i915/selftests: fix subtraction overflow bug (2022-07-12 18:21:58 -0400)

----------------------------------------------------------------
- Selftest fix (Andrzej)
- TTM fix sg_table construction (Matt Auld)
- Error return fixes (Dan)
- Fix a performance regression related to waitboost (Chri\
s)
- Fix GT resets (Chris)
- Fix a possible refcount leak in DP MST connector (Hangy\
u)
- Fix on loading guc on ADL-N (Daniele)
- Fix vm use-after-free in vma destruction (Thomas)

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915/selftests: fix subtraction overflow bug

Chris Wilson (3):
      drm/i915/gt: Serialize GRDOM access between multiple engine resets
      drm/i915/gt: Serialize TLB invalidates with GT resets
      drm/i915/gem: Look for waitboosting across the whole object prior to individual waits

Dan Carpenter (2):
      drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist()
      drm/i915/selftests: fix a couple IS_ERR() vs NULL tests

Daniele Ceraolo Spurio (1):
      drm/i915/guc: ADL-N should use the same GuC FW as ADL-S

Hangyu Hua (1):
      drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector()

Matthew Auld (1):
      drm/i915/ttm: fix sg_table construction

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2022-07-11' of https://github.com/intel/gvt-linux into drm-intel-fixes

Thomas Hellström (1):
      drm/i915: Fix vm use-after-free in vma destruction

 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 11 +++++--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           | 34 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.c                 | 15 ++++++++-
 drivers/gpu/drm/i915/gt/intel_reset.c              | 37 ++++++++++++++++------
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  8 ++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  9 ++++++
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |  6 ++--
 drivers/gpu/drm/i915/i915_scatterlist.c            | 19 ++++++++---
 drivers/gpu/drm/i915/i915_scatterlist.h            |  6 ++--
 drivers/gpu/drm/i915/i915_vma.c                    | 12 ++++---
 drivers/gpu/drm/i915/intel_region_ttm.c            | 10 ++++--
 drivers/gpu/drm/i915/intel_region_ttm.h            |  3 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |  2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   | 21 ++++++++++--
 drivers/gpu/drm/i915/selftests/mock_region.c       |  3 +-
 16 files changed, 160 insertions(+), 37 deletions(-)
