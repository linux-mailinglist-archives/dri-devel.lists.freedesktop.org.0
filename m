Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF567432E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0B710E9E1;
	Thu, 19 Jan 2023 19:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A616A10E23E;
 Thu, 19 Jan 2023 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674158056; x=1705694056;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=cn+qY0gmiOEq/jYugVHBy7vLHf7EOEdYG0F35GmVmEE=;
 b=PGCEg3B9kAGpz5ItagRt4AOWev632quGRdlfavn07RINcrnk/oRU/rII
 GAzS/h8a092YNVzjW1G93+qTMAEBctmlJFWNhbxWZsakt/+cGB+EzFlzH
 yE1eFtxmuvT2FMR7enUMZm5I02+sT1xmD+rGfvPXCguPqOB2cH0Qak0/N
 GKkknhU3ckRDBmjRdnIbHMfimuWyvO7844Ur34C1GzSuL7hIfsLJbtZZM
 aZ1aiBJggro58FWdHmrpXtMYsQQb/+8FoWzF2N4vpnBgfrxOZui+tD6z/
 OzC8rH7R6MnEKpd5NSTNrKRFgE15mBP77tl98uRmftyu8HgKIx80PA76m A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305771049"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305771049"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:54:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905673234"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="905673234"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2023 11:54:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:54:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:54:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:54:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRNzW302OuSaiIIC6GHMZZ2eres9n2Yzo8y2B25docT8IbkX+f1SEY6KSBLq5oEQhuLOH0GgD8fPMFG0ZKYJOzTXr760tV3urQvVyPUG7mufvsEicRnYdNZiUpbmU6lf2+nAjA0xdJtJRKhN4PoGSH36LIl9aM7gXgVTzsVtR24RE8j6MxwPuubGRvdRKHiTGndkyyw8riir6RqA7IGsM8CZVuSqfMPRtoMl6ZtSPi2+ZD0pNQ1Z6pTT/+5m2JdepStU/OjtIKoGwCBZShg5CG9cgBnRoVaoELYDBDkXvJkO+DyDppteof62LcMgh8ZnqKKIYmZmV9QWXBySfiKXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrSX+02J+PAW/l1fPFczyRDroF/LeayaZPeNTKIOoEc=;
 b=UBBG0Gnu/59oF64RdYacPSudRy2TdpLBb//glCfSrqgDNdgtoTNlIEwJWr4Xz6jjQS3fOjPrCdEL3cbUjyqpVbcNJfyrH6z/BLrAbJuFRTrJJOAt9uu1e7EY6Xd8FHfdV82GV/rQea9kEf5MtXJzYMWX+OhagiFBy0RT+X/WDCftpdXeKvB2tQNbru10spztstjjkTjrFuQK8cx5Nk9YlOhWW+iirfQxfEJg9JSeS7cCVBVO3d6QBU6r/NbyTgx7QMtbMpMRSvUeSzf4rPRCKA9whBNZEcTB6N9NDcCs4bLwx81upI/ev7CjsZRpHfB4kcGzrWnkQG7VpOdZ8LoWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 19:54:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 19:54:12 +0000
Date: Thu, 19 Jan 2023 14:54:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y8mf3/ANNWctpc7R@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4bbe0d-01b9-41e3-e983-08dafa56ef94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: riKIDS8rC+1C8T5RhCWL62DeZJreFh0le7kT7dad5rzYIcVr2g91l4+HrO6G3P6eZ/XxBLFXxiXhTROnZ75dF5xOLFpbaKjjIow6fTnZqofaPAYMaiBoIqU6Scg5S39Tv9XPJdiXC4GfYndFm6iyOLmyuHhyL4SYDSI5YjgIB8csF2JYVQadCuUp/8x2ImQY2CE8Mjt7TuV6iHWnmh1CgRKE4nd4lmirUAyjC/VdD7CsW48jncq6clOOinoZosD8EpWAz+TncLa/McN5X0x6Gs2dd8ZjCgfgFywrVDi4W46xL1VbMMwAuDt8tJyKidYOlfnm0TBkGD48crlgTrsIm4rtMVFeXF0xMJ4X1p/qAbBDPs++kNmdhqiu2tRAaxMZKFgRRMG3+6kbq7z7h5mVUxuAP5R9FiU59arVoA2IawHo5hKoRSTEn3r9dq/G6bUUZuL511BRi1yg8U6osEwDRk9xd8pF4woBiDp1htzl0Got9Njf40q8txaFdrtu0At1oIsFiQNLHhpqoc/o/bjHpTm5ezCXGKi3vE9PPZOiTmOhno7g6d1x1IKTWFuY07XTldRjwSYZQ1oJTvOY1pB/FaL8sMix4heUJRvcQV66ZzFtFS6nepW3M6/jdRz/8l842nwyvr69ZvoyK0xjHyzWJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(7416002)(5660300002)(8936002)(66476007)(8676002)(66946007)(86362001)(6512007)(4326008)(66556008)(186003)(26005)(41300700001)(36756003)(54906003)(110136005)(316002)(478600001)(6486002)(2906002)(44832011)(6506007)(6666004)(2616005)(83380400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5uZWVQ6BzfJLyWR13L2PGVdCdGelC8Wi6tJ0CUDD0q4P/5/0l73QNbeDZjN2?=
 =?us-ascii?Q?W/5NSXCmmppHPCcw9r7sxf4o+XfKCUapkcBT6cSw0zwoM5jQYpzFvIfB+o0M?=
 =?us-ascii?Q?+l26BgxmD5uM2uexzk76THRY2iUCtPTC14u0Pgmz4UezksnH28QzDqVJrzy2?=
 =?us-ascii?Q?drvgYBdD6CrVVyaTuU0VD8czZWp+PYS9BEREzuBbSvYouVRrZCkwaCBvyLzx?=
 =?us-ascii?Q?U57/rmoL3PBzfG85LdM2f0aqzwKuo1mzES8nd32GuJ0K60NopMFK4GptZ13v?=
 =?us-ascii?Q?hUJ0XJ9VODaIucTcSdb6VJPRSHTNSomuT6y3QLw1thGHPW/7YgADIpgcsSN/?=
 =?us-ascii?Q?ThyRXlzGaP74FoBh7gUeYD5+H9zGZwvEXoNWKvyGC1x/+TnD2kRvJxhUgDBw?=
 =?us-ascii?Q?hwQ85lJTRVh2Wpvl9GTTbVGw9Hu3farerb/K1WpkCms1zN9147KLknsSmfPr?=
 =?us-ascii?Q?iozNLCn+LJICTJQaVJ9Q4xuZMUGXuURoxuvmleXzZrf4OHWMrenkPTMZXZMT?=
 =?us-ascii?Q?YPvWjQZirbH38y65yKF6MlAIr42B34jPbhGI+LycvkOeXIV6tEh97mUsuN/f?=
 =?us-ascii?Q?21R58KnjeYb2NQE2RnJZBiJ3hxOffsSCxTUoPDO3J0VqdtB8FWDJNMuRfDsu?=
 =?us-ascii?Q?yshKE8wh68XhFPigwTrdD2ykhwfynNsNs/vTJUg1mr6Boqp/C0ZkrxTYogUQ?=
 =?us-ascii?Q?3swZd7yuwvlo2J6GoAtM++h3U5jXu1lokufyX40D1JZL8AZGi12cFwcFdIXM?=
 =?us-ascii?Q?Lt2Yj7TyeM30FrOuk3W981aXcBpdi4wtW5lzVZx/qR01hlXgNrueyY39bTmS?=
 =?us-ascii?Q?pt/iqmEwU07L8DYloXlWGp+DOQ+ZUMzKyJDEVLRVHhtwQ2GakYxoipGY1InJ?=
 =?us-ascii?Q?LXkuKJ1ku4Sl9g5SZ4gL6BGEd3D8Lun28n4FQhc+Ulo/Xu5EyZtPsDDz4KUg?=
 =?us-ascii?Q?sACNKoUlrRLc16QBh44Twd1kQePzjSbduy2tH0bvZaLgzMiCRaY5twM9SVjD?=
 =?us-ascii?Q?aCNfjAhrTf9pGwd5idCjI/UD5tqC3z/C2jfdyE196wMsJwJRqxFtIwftYsWQ?=
 =?us-ascii?Q?sYsLTIx4kloSgjux+eygyxY7ZeZqKr8gH7IKeuyt394Dw7gjRy93sDhXKVcg?=
 =?us-ascii?Q?9Bfxx55SEEWRUKh67fzHfa/aLW4NgS2VcPwak/sueEdgI4tCzOSFSHKa660Y?=
 =?us-ascii?Q?Eov1OXGnUV1QM1mLndtS3nbq7zwShQMLnsQCw+KNdhyh/mpsvaM4O2sukEOt?=
 =?us-ascii?Q?/cF9XW5X1wiFpEPREdT9jeWXyCqVSSOJ4WQFlJ3/MGkfnTX40a4+PuvsHpR8?=
 =?us-ascii?Q?lwAtcakha8FBViaaAb4xwigL340hDvhkFwxEHANieoXZU2KptFrdOSbnWXGD?=
 =?us-ascii?Q?wfIt1syo7qeQX/S7/77/QXf/i2UiZPS5PMtW3RWywxYPeF3MyQtcY8V1+dZr?=
 =?us-ascii?Q?B1BZelVS//JNXkhmVpPcNLO9Y91sEQaLEMN5uEs/nwgBVy//6CFpQKewDFiM?=
 =?us-ascii?Q?MzxUmDIQezVdnOcquuqhlReIenyS0QHaM/p922tFCTLrRiXSAVOdwxuNNdxd?=
 =?us-ascii?Q?YuUzp88F5Z1/8uj4OKNNAEuUEPPFlgcjiYEwuQ+VZp6ll/DUF4r1+P4qO7q4?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4bbe0d-01b9-41e3-e983-08dafa56ef94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:54:12.2647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DiGCBHyVx4mReAypBD+FizanmRz42cbvOTr16D3kfjCn1GlPdlWp0nkxN1/8bTuXadzVk7lW6Qiq8LuOX8R1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
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

Couple patches targeting stable, couple DG2 w/a,
and a selftest fix.

There was a drm-tip conflict but very trivial where
keeping the new mtl function as in drm-intel-gt-next is
the right resolution.

Here goes drm-intel-fixes-2023-01-19:
- Reject display plane with height == 0 (Drew)
- re-disable RC6p on Sandy Bridge (Sasa)
- Fix hugepages' selftest (Chris)
- DG2 hw workarounds (Matt Atwood)

Thanks,
Rodrigo.

The following changes since commit 5dc4c995db9eb45f6373a956eb1f69460e69e6d4:

  Linux 6.2-rc4 (2023-01-15 09:22:43 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-01-19

for you to fetch changes up to afdecb232740ae40b9384fa0ac8ed799d6546516:

  drm/i915/dg2: Introduce Wa_18019271663 (2023-01-18 11:56:54 -0500)

----------------------------------------------------------------
- Reject display plane with height == 0 (Drew)
- re-disable RC6p on Sandy Bridge (Sasa)
- Fix hugepages' selftest (Chris)
- DG2 hw workarounds (Matt Atwood)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/selftests: Unwind hugepages to drop wakeref on error

Drew Davenport (1):
      drm/i915/display: Check source height is > 0

Matt Atwood (2):
      drm/i915/dg2: Introduce Wa_18018764978
      drm/i915/dg2: Introduce Wa_18019271663

Sasa Dragic (1):
      drm/i915: re-disable RC6p on Sandy Bridge

 drivers/gpu/drm/i915/display/skl_universal_plane.c |  2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            | 10 +++++++---
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 10 +++++++++-
 drivers/gpu/drm/i915/i915_pci.c                    |  3 ++-
 5 files changed, 23 insertions(+), 10 deletions(-)
