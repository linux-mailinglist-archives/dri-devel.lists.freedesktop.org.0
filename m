Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4B6D98E2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D068910EBDB;
	Thu,  6 Apr 2023 14:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DCF10EBD0;
 Thu,  6 Apr 2023 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680789874; x=1712325874;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=LcN13g+PKP8tId/HQBe5+J64au0gVhzTq3L/ZqAPu2Q=;
 b=YmTxgMjfdG7CAYqJLqZHdWtB9qW6EiUjh4ktIqRYamfi5fN6nfsQ1hsO
 ShKciNRXgUlRwGA3ZO68UJDa6Q1qdVE/qMIry/Z8U81zcc66YA2jfoHKG
 pwBOWB0KZK54VxvglhwrgpTMPwopkMxheIA8/SWTH42RN0zLjNHH2w+Bw
 9lEXFgA+R0nnPIjbhTFUQX/dvB0300lxoB9DW2PIC4P0KkFv9OMJ4DDXc
 45Ca2xGh1+MJlXYy4Ej8QzeemGmOB1XDgJCbVb4O2tyH52aG+BZ59ZfwV
 GPqvbGhAeCbo73nkzFkJb9ZwVM24bF/CEuU9eNRz9dPVs7Q065LRqzPbD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326805993"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="326805993"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861418907"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="861418907"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 06 Apr 2023 07:03:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 07:03:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 07:03:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 07:03:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2jm21UsOPiIyN47vYXyNADbZFaTNsE3j1zBhUercR2stKe5h5X3HmPr7VPWlOYJKCdltoaFMkzqwaNxCXehHLAm7d7687iFf4aZ9gu5AunDp0hOGLKdhDhthE5xIVA1/eltVqrjYptsD4X+yMA2U69jg3AiMd6oiNqf9J9nSqybPrT7I6F/7U87v74Zpd7zS1OEIB6O0KjFyLfhxy7hdhD+d+VDqPSGT3EfqTbWU68ZaSKzOrV/qBElNJNyWw97GPf1lqmXJTG61zSZQE+BzoP1i7tuskrygZhEvPeUewrpv2wv9clajzjLCp2YDBFooo5F1ltcO2xR3/RaUQ+6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLwyeJ5/7tEHJh9xEBqS8zT4T+JD4MWVws5LmgbBWT4=;
 b=JE8ZKwoi87QHr2W8SOsldXy7tKsHHk21MYD+gZbYJFJzx7ogFfSqtexXCKl/9fGv4kZcKzJ5Pt/xQb/xih+rQvuJ6bLiPhPJ62zPD8l/pyKMbcwgfYsPwXteI6wuCuD2JY3xnLBbkCzqXqq0RE1of2S+g8RF0g6ixkWl7CDlP55NhnHNS4/l16m/bVDirqBugMta0IRYsr2h7BMr/U67TUZA+xhcNjog2rkQJ0zqQEPbQwnR//5HhQ0IQPTotgnFypcM9uLqOmZwPFSpEqOAtmeEAJcfRIjgzYR1c6ZZbSwTbxu8dbcRJU+1VCByvpimI6qQvqgQQFhciwkhOestBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 14:03:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 14:03:56 +0000
Date: Thu, 6 Apr 2023 10:03:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <ZC7RR3Laet8ywHRo@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 076d98e7-4632-4846-fe2c-08db36a7c2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IdnB/Spl1fQy0pe1fiITBxA+A8ttrU/p2aX56DlSdUvcJ7SXicoNB2ScpTDc7Oo8tmfB1hkoYarH+DguEGa9OoyLVpvXUFPL0nOuSL31LhokzcLi9SmYcI70eTRp+bVHEaxfvPJnXhtz5hTUSKxfkiNXJIWxxlrftiqjlTxbwDFgZ8HjT+O2N96wulD25Ww/ZcDFBluYwNBKattIvH2eC/uwfk0h4Fr0krNLC5yFQ80mf1p3L4BZfPQRQQ6LG8iBTen/uMPJ0P5G1WFSXpVqO2KAlfmJMMv+qwyPoPd+197rnvE5w5fhwt1Oy/qdlWYkmwbWTplRhUiGyNUpuiGN5KiUJfkvPG3MLdNodOVnpmuNrOcFemTOS8O7PHz7tRsZLGJ7xqLk6L9p2K5UjHRcxDmAXo9wpKVpNQSCCLLuJhdpBZO2PI0fhZLt8hH+KCswmL1BXnLPw762bwHd7bWdum/0i+jfz1n8vUzW0w56ClGg+te1hCffJ8nU2LMRC3mcGO+O014AkBgJzaMzVmpMIsavP+Syix32YZbzRtvP5W9KN8Ssc9+vzRqeFUMKS4eC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(6486002)(66946007)(66556008)(66476007)(8676002)(4326008)(54906003)(478600001)(41300700001)(110136005)(316002)(36756003)(86362001)(83380400001)(66574015)(2616005)(6512007)(6506007)(26005)(6666004)(2906002)(5660300002)(8936002)(7416002)(44832011)(30864003)(82960400001)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zAIcaQHkLx6aGZppVsmfmVBMmuOkj0yeTUmYKmiIJVMmQMfnAGdTOV7HOS?=
 =?iso-8859-1?Q?ERN0kIFNA5cpm9tv5/u7IZpVLYNMpuNkM+CqMvNFDnovnPpHyRJLvNoPTk?=
 =?iso-8859-1?Q?yt9S6J9QVtXSGPJVgGppYRH7iIPF19f9nmvXPc51Kaww0ObqaJKcXTpeHE?=
 =?iso-8859-1?Q?Xzps0eVtnARi9cKggGh4aFPXYLHkDHCOlqm6YFgQ89dxZjDeNSNI7PWTUl?=
 =?iso-8859-1?Q?KzTbd/I7MJgj1o3edoEfwOkyx3fvXYcWbfOQLnnoXT5KNmjQQFZg69WlE4?=
 =?iso-8859-1?Q?4z/J2xLvxN/6o4aXFm3Kd29TktIY1tnJkNC+rraWzboT1RLde2Jf3eH41l?=
 =?iso-8859-1?Q?NHzbW+pOiAZtoXJmVQfN54XRX6gpkk30/kvLvIIH3JzXscCyTkj70hVkSi?=
 =?iso-8859-1?Q?9gEwZHaFozfw9mh7iLYnol/wSqPd7ZyWwsE94v0pUr2ToXZCmY4qkz9NOQ?=
 =?iso-8859-1?Q?ZjdoWFvvoV/zempPTN/+ZzU/R961GHB7EYf0+3XRwv6nz76Tu55RhlW9wp?=
 =?iso-8859-1?Q?89hv6nIU0+YCj4pLXU4FPRnmTdPdgWErEmx2p0AYHVpyKpxc6joWXa0cxb?=
 =?iso-8859-1?Q?kItYcqdBzX+HwUm7NrrjlH8CCp87ELp6V7tRPGaIsZOhaFOKZG33TUZtjb?=
 =?iso-8859-1?Q?/SphEAJ08RosIXfqJduUXmHM3w8l3J2SYKINTIloPgItZ3TIuO0d+vHnlt?=
 =?iso-8859-1?Q?td/6V75xIUoWDoqeNXjj+pbHgCVTR5UFQyxaRICSgVjcbyDqlfeicg46mn?=
 =?iso-8859-1?Q?r4rWuPBD+u5G02LK9EdyPJnyl/pmRq0imDMMqLwSCkvbO2sd5IMP7FGbpn?=
 =?iso-8859-1?Q?gPq+DUGXAAl1nqdIFZIK2dCR2XV8Hkd3NqKJLiXaKPQq+QZdOhYfCYbQcg?=
 =?iso-8859-1?Q?6RJ3K/PdLgD9/C5yP5ga/z5F+nzgF5PTzXjQ0p/+GRoi686Tgvqx4T6Ya1?=
 =?iso-8859-1?Q?p+TOJL+ztDFD9iQMw0TmUkIwAe4RnXNUcnpM7+l4mfv0dBdxgSyLiyo6Y0?=
 =?iso-8859-1?Q?YEH3TrodI+d72lYWM2yAdgCT+s6BO0qJib8tA9Qx+UZRvq9sq9L56HiCH/?=
 =?iso-8859-1?Q?LlEuWVJQi9eJj/yAq3QUtICUc2N8QiNaHTJrhFfxZVaj37tZGbrka2yC2u?=
 =?iso-8859-1?Q?ioAfF8qWkUBvwRYUSPcLjW/r5JUQ/3zr3q9fdWadQwj6BBehbellf4NXSI?=
 =?iso-8859-1?Q?vnCBoz1XfZvRWxNHC6XofCH80+0tqOA0OcY6eT/FqQ1WGo7DqMKI9vv2Zm?=
 =?iso-8859-1?Q?xKFE3a/DLs1yUxKh8cJ+aA7eYu2JF+ccpOXyxIDqnQ51A1ZYYNKUjwR1ej?=
 =?iso-8859-1?Q?+P4xdWueOSJwOxczu3fEesPUPCvOLoCX0V0HMAm5zgSFG5S6DAWAeo1pmQ?=
 =?iso-8859-1?Q?Utvmom8zsNnYz7Of7yiV8FlkTj0FuP1qHY6jmBWB6Q0boNeEdj2GyRQFze?=
 =?iso-8859-1?Q?0rVwlsS37D9vxK+SIi3WOyKrCUuQ6CxBrEXaVN/pBIu+BZkvrT7uDxRzO2?=
 =?iso-8859-1?Q?hvpJAUGUSW90O269cUCML0JkT6vN6ja+QxRNqEjaPv+GSrX+f+H2L6bDvO?=
 =?iso-8859-1?Q?f2158Y4m3V600hsRMo7pwPq78Hkel/EvckN8VhqOrECGSrTRpwRhBiO02W?=
 =?iso-8859-1?Q?K9Xm9aF0gs1+8OroqVN7oNbKfBc4t/V0YP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 076d98e7-4632-4846-fe2c-08db36a7c2e0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 14:03:56.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpS7gCmV1khKhSDuOw3dN3rjsiHOUCer9ELzS8Wxj02gt2+ePD1/6BiMs4mY7xerNoVQThx2La063TnHTA/rtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

Hi Daniel,

Here goes drm-intel-next-2023-04-06:

- Fix DPT+shmem combo and add i915.enable_dpt modparam (Ville)
- i915.enable_sagv module parameter (Ville)
- Correction to QGV related register addresses (Vinod)
- IPS debugfs per-crtc and new file for false_color (Ville)
- More clean-up and reorganization of Display code (Jani)
- DP DSC related fixes and improvements (Stanislav, Ankit, Suraj, Swati)
- Make utility pin asserts more accurate (Ville)
- Meteor Lake enabling (Daniele)
- High refresh rate PSR fixes (Jouni)
- Cursor and Plane chicken register fixes (Ville)
- Align the ADL-P TypeC sequences with hardware specification (Imre)
- Documentation build fixes and improvements to catch bugs earlier (Lee, Jani)
- PL1 power limit hwmon entry changed to use 0 as disabled state (Ashutosh)
- DP aux sync fix and improvements (Ville)
- DP MST fixes and w/a (Stanislav)
- Limit PXP drm-errors or warning on firmware API failures (Alan)

Thanks,
Rodrigo.

The following changes since commit 46f28427f6f824b6cff06fa025a55350b7de454a:

  Merge tag 'drm-rcar-next-20230325' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into drm-next (2023-03-27 18:20:20 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-04-06

for you to fetch changes up to b358793c3bf231c455c55e0173256a86483997a8:

  drm/i915/wakeref: fix kernel-doc comment (2023-04-06 15:39:26 +0300)

----------------------------------------------------------------
- Fix DPT+shmem combo and add i915.enable_dpt modparam (Ville)
- i915.enable_sagv module parameter (Ville)
- Correction to QGV related register addresses (Vinod)
- IPS debugfs per-crtc and new file for false_color (Ville)
- More clean-up and reorganization of Display code (Jani)
- DP DSC related fixes and improvements (Stanislav, Ankit, Suraj, Swati)
- Make utility pin asserts more accurate (Ville)
- Meteor Lake enabling (Daniele)
- High refresh rate PSR fixes (Jouni)
- Cursor and Plane chicken register fixes (Ville)
- Align the ADL-P TypeC sequences with hardware specification (Imre)
- Documentation build fixes and improvements to catch bugs earlier (Lee, Jani)
- PL1 power limit hwmon entry changed to use 0 as disabled state (Ashutosh)
- DP aux sync fix and improvements (Ville)
- DP MST fixes and w/a (Stanislav)
- Limit PXP drm-errors or warning on firmware API failures (Alan)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/pxp: limit drm-errors or warning on firmware API failures

Ankit Nautiyal (2):
      drm/dp_helper: Add helper to check DSC support with given o/p format
      drm/i915/dp: Check if DSC supports the given output_format

Ashutosh Dixit (1):
      drm/i915/hwmon: Use 0 to designate disabled PL1 power limit

Daniele Ceraolo Spurio (1):
      drm/i915/mtl: Fix MTL stolen memory GGTT mapping

Imre Deak (29):
      drm/i915/tc: Group the TC PHY setup/query functions per platform
      drm/i915/tc: Use the adlp prefix for ADLP TC PHY functions
      drm/i915/tc: Rename tc_phy_status_complete() to tc_phy_is_ready()
      drm/i915/tc: Use the tc_phy prefix for all TC PHY functions
      drm/i915/tc: Move TC port fields to a new intel_tc_port struct
      drm/i915/tc: Check for TC PHY explicitly in intel_tc_port_fia_max_lane_count()
      drm/i915/tc: Move the intel_tc_port struct declaration to intel_tc.c
      drm/i915/tc: Add TC PHY hook to get the PHY HPD live status
      drm/i915/tc: Add TC PHY hooks to get the PHY ready/owned state
      drm/i915/tc: Add TC PHY hook to read out the PHY HW state
      drm/i915/tc: Add generic TC PHY connect/disconnect handlers
      drm/i915/tc: Factor out tc_phy_verify_legacy_or_dp_alt_mode()
      drm/i915/tc: Add TC PHY hooks to connect/disconnect the PHY
      drm/i915/tc: Fix up the legacy VBT flag only in disconnected mode
      drm/i915/tc: Check TC mode instead of the VBT legacy flag
      drm/i915/tc: Block/unblock TC-cold in the PHY connect/disconnect hooks
      drm/i915/tc: Remove redundant wakeref=0 check from unblock_tc_cold()
      drm/i915/tc: Drop tc_cold_block()/unblock()'s power domain parameter
      drm/i915/tc: Add TC PHY hook to get the TC-cold blocking power domain
      drm/i915/tc: Add asserts in TC PHY hooks that the required power is on
      drm/i915/tc: Add TC PHY hook to init the PHY
      drm/i915/adlp/tc: Use the DE HPD ISR register for hotplug detection
      drm/i915/tc: Get power ref for reading the HPD live status register
      drm/i915/tc: Don't connect the PHY in intel_tc_port_connected()
      drm/i915/adlp/tc: Align the connect/disconnect PHY sequence with bspec
      drm/i915: Move shared DPLL disabling into CRTC disable hook
      drm/i915: Disable DPLLs before disconnecting the TC PHY
      drm/i915: Remove TC PHY disconnect workaround
      drm/i915: Remove the encoder update_prepare()/complete() hooks

Jani Nikula (14):
      drm/i915: remove unused config DRM_I915_UNSTABLE
      drm/i915/pps: split out PPS regs to a separate file
      drm/i915/tv: split out TV regs to a separate file
      drm/i915/aux: split out DP AUX regs to a separate file
      drm/i915/fdi: split out FDI regs to a separate file
      drm/i915/dsb: split out DSB regs to a separate file
      drm/i915/wm: split out SKL+ watermark regs to a separate file
      drm/i915/psr: split out PSR regs to a separate file
      drm/i915: enable kernel-doc warnings for CONFIG_DRM_I915_WERROR=y
      drm/i915: run kernel-doc on headers as part of HDRTEST
      drm/i915: rename intel_pm.[ch] to intel_clock_gating.[ch]
      drm/i915/clock: mass rename dev_priv to i915
      drm/i915/tc: demote a kernel-doc comment to a regular comment
      drm/i915/wakeref: fix kernel-doc comment

Jouni Högander (6):
      drm/i915/psr: Unify pre/post hooks
      drm/i915/psr: Modify/Fix Wa_16013835468 and prepare for Wa_14015648006
      drm/i915/psr: Implement Wa_14015648006
      drm/i915/psr: Add helpers for block count number handling
      drm/i915/psr: Check that vblank is long enough for psr2
      drm/i915/psr: Implement Display WA #1136

Lee Jones (3):
      drm/i915/display/intel_display_debugfs: Fix incorrect param naming for 'intel_connector'
      drm/i915/display/intel_display_power: Fix incorrectly documented function __intel_display_power_put_async()
      drm/i915/display/intel_wm: Fix a little doc-rot in intel_update_watermarks()

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Stanislav Lisovskiy (2):
      drm/i915: Use compressed bpp when calculating m/n value for DP MST DSC
      drm/i915: Implement UHBR bandwidth check

Suraj Kandpal (4):
      drm/i915/dsc: Adding the new registers for DSC
      drm/i915/dsc: Enable YCbCr420 for VDSC
      drm/i915/dsc: Fill in native_420 field
      drm/i915/vdsc: Check slice design requirement

Swati Sharma (1):
      drm/i915/dsc: Add debugfs entry to validate DSC output formats

Ville Syrjälä (15):
      drm/i915/dpt: Treat the DPT BO as a framebuffer
      drm/i915/dpt: Only do the POT stride remap when using DPT
      drm/i915/dpt: Introduce HAS_DPT()
      drm/i915: Add PLANE_CHICKEN registers
      drm/i915/dpt: Add a modparam to disable DPT via the chicken bit
      drm/i915: Move PLANE_BUG_CFG bit definitions to the correct place
      drm/i915: Add i915.enable_sagv modparam
      drm/i915/ips: Make IPS debugfs per-crtc
      drm/i915/ips: Add i915_ips_false_color debugfs file
      drm/i915: Make utility pin asserts more accurate
      drm/i915: Skip cursor when writing PLANE_CHICKEN
      drm/i915: Document that PLANE_CHICKEN are for tgl+
      drm/i915: Define cursor chicken reg
      drm/i915: Fix fast wake AUX sync len
      drm/i915: Explain the magic numbers for AUX SYNC/precharge length

Vinod Govindapillai (2):
      drm/i915/reg: fix QGV points register access offsets
      drm/i915/reg: use the correct register to access SAGV block time

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |    4 +-
 drivers/gpu/drm/i915/Kconfig                       |    6 -
 drivers/gpu/drm/i915/Kconfig.unstable              |   21 -
 drivers/gpu/drm/i915/Makefile                      |   12 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   73 +-
 drivers/gpu/drm/i915/display/hsw_ips.h             |    3 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    2 -
 drivers/gpu/drm/i915/display/intel_crt.c           |    1 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    4 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.h   |    2 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   71 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   95 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    7 -
 drivers/gpu/drm/i915/display/intel_display_core.h  |    4 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   83 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   10 +-
 .../drm/i915/display/intel_display_power_well.c    |    7 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   21 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   48 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   33 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |   84 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   50 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   27 +
 drivers/gpu/drm/i915/display/intel_dpt.h           |    2 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |    1 +
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |   67 ++
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    1 +
 drivers/gpu/drm/i915/display/intel_fb.c            |   11 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |    1 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |    1 +
 drivers/gpu/drm/i915/display/intel_fdi_regs.h      |  151 +++
 drivers/gpu/drm/i915/display/intel_lvds.c          |    1 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    1 -
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    1 +
 drivers/gpu/drm/i915/display/intel_pps.c           |    1 +
 drivers/gpu/drm/i915/display/intel_pps_regs.h      |   78 ++
 drivers/gpu/drm/i915/display/intel_psr.c           |   91 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  260 ++++
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |  187 ++-
 drivers/gpu/drm/i915/display/intel_qp_tables.h     |    4 +-
 drivers/gpu/drm/i915/display/intel_tc.c            | 1253 +++++++++++++-------
 drivers/gpu/drm/i915/display/intel_tc.h            |    4 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    3 +-
 drivers/gpu/drm/i915/display/intel_tv_regs.h       |  490 ++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  132 ++-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |   28 +
 drivers/gpu/drm/i915/display/intel_wm.c            |    2 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    6 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   11 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |  160 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   15 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |    1 +
 drivers/gpu/drm/i915/gvt/handlers.c                |    5 +
 drivers/gpu/drm/i915/i915_driver.c                 |    8 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    2 +
 drivers/gpu/drm/i915/i915_gem.c                    |    8 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   26 +
 drivers/gpu/drm/i915/i915_irq.c                    |    2 +
 drivers/gpu/drm/i915/i915_params.c                 |    6 +
 drivers/gpu/drm/i915/i915_params.h                 |    2 +
 drivers/gpu/drm/i915/i915_pci.c                    |    3 -
 drivers/gpu/drm/i915/i915_reg.h                    | 1243 +------------------
 drivers/gpu/drm/i915/intel_clock_gating.c          |  888 ++++++++++++++
 drivers/gpu/drm/i915/intel_clock_gating.h          |   14 +
 drivers/gpu/drm/i915/intel_device_info.h           |    1 -
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    4 +
 drivers/gpu/drm/i915/intel_pm.c                    |  885 --------------
 drivers/gpu/drm/i915/intel_pm.h                    |   18 -
 drivers/gpu/drm/i915/intel_wakeref.h               |    2 +-
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |    3 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   77 +-
 drivers/gpu/drm/i915/vlv_suspend.c                 |    4 +-
 include/drm/display/drm_dp_helper.h                |   13 +
 76 files changed, 3965 insertions(+), 2888 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/Kconfig.unstable
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fdi_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pps_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_psr_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_tv_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_watermark_regs.h
 create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.c
 create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.h
 delete mode 100644 drivers/gpu/drm/i915/intel_pm.c
 delete mode 100644 drivers/gpu/drm/i915/intel_pm.h
