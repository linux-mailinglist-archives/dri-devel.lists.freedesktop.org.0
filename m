Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D38374F1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 22:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5070210EF88;
	Mon, 22 Jan 2024 21:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C3A10EF2F;
 Mon, 22 Jan 2024 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705957792; x=1737493792;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eAHMgmldK//W7pLjqm9hwCxLCPrzn8ImnMaB0tAz+7E=;
 b=cR1j/6UNzQ0DWqsvycDat2HuqEb8+wLD5AiMSGSh1DtmtMki4THKsGS9
 V2wvUa+DSq67uxu7bUoNLguFxqHUuuvwIPJ/zGkWMiorr5j0DVcNUmyFH
 M9NedXINJFqbFLemQWemFxF0g8p/zBgphH366Tnjlgos/nzsyfQv+tKl4
 NsJfdrGgxkeGiF2IMQM0HmZV2bCHZMP4rsbRxkSn33ynebmO1VOZT+tKb
 IDVmgpPAu1cvhaxk4PXeb+6YrE25sUjTUAmatPdngAZ+PvEegbL1c8W6N
 LVQOSzXy5vwHDdgq3Yk9i5AAGPdL1XgkYRwYOxnbScVlm8WHYVLSYy6EM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1214960"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1214960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929107292"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="929107292"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 13:09:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:09:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 13:09:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 13:09:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnpVEr7UeDd/dKkRh1ty1YnrP5kXi9nzez2QleXA0pU+7n8elKKoxjrfkN91k7jQql/OkrM8F+esmK+wfMMee7+tUBY845odT/s0X3NhHcTRAcjy/Dqb7F4nnxLhR+gqTbRKk+4m6ziipdP6rYkw+KERhufzmILmTibfMgfRxiE+CSXLRBlLE+59e0x7eS6gPRaT+IqUqcl8m7LjfdMAK4EfNl1X6mtxUeEvWfJhoxapsmFtXPaPw7mIu16D547OKOC6tJYflyRprsCoy1z3e1INCqDYMT3ZRAZt35rNQ+VG7QA/EG2cO+xkO3m8sTDTzeqxU3V4Xf2o3NKR1cYwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFjkVMTAUSjYCZNgp3NUL3fimgAiedNYYq8ft0tGtxo=;
 b=NrCHz8mqGfI/z7Bt0ZR/O3yyE2eqGAohgisepcMeqDayIF0w1aPZ72zN03Lc1Tav/OhtF6rPKP7H94TS/3WErVPXsCt2zbF4dHHeTLN9j6mYtItf5jart6h93XIcv5j4GTt5IVcPDTiUK6p8GsLnjnBGuIeqJwxnusmEWE7BEPSi36nWMDa+n92AXFNq+UB+zRDL6TPcIacbDkU83srfLms8tsW1rNkllxT8n17iucMQy6hBfwLbPU+oTMoMU4dl4p7Ku862f+K9BcFfiIRL+MC2E399XGm5o+qFPaMXuuLgaOFE0n2zxcYQs6+urMGSi2UtjAbKr4myOV7EbqCLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 21:09:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 21:09:43 +0000
Date: Mon, 22 Jan 2024 16:09:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v4 1/3] drm/i915/vma: Fix UAF on destroy against retire
 race
Message-ID: <Za7Zkn2-jYEvz8Vo@intel.com>
References: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
 <20240122141007.401490-6-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122141007.401490-6-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b3d4a0-7a6d-4de5-ee19-08dc1b8e7436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVwu5pZXj9t8HjOLgt0vpdcjFqqqP63H6DoZv0CwsXaKPcjcQLq6uny3rzqVrD5xZNynJO2yiQAVKIWphd6/rhqWMIalCrnsqLdIpaiDF3kuoegMOQpdCs1MMbuAfSYLIdfCuxlI/xlRSFwQXfgEJ+mdSfGEkPHyTGbDrT5NP795WcpQRK3HxzDmWC9mQb2nm96cNnIGAJ1Ib5y8RVhdH24HsTiRfi/voRtL8+NmqzTkQcrjAwOo6AWGhFot9k0toqw14fy96QhJSymsW3DtSxAf0/NTDZZ9VrbtyUgHBFLh+bzZJFM3osVXDvbvZQeg61DLTqyqaY7KUnENEduJ6fPEN1HrLp9yV0g6WK82sDsMBgoaaTynSUHF0V1Uj0FVcbdCAINmrXPUnCvwjzFutjmuJi9FDVLM8sRxaRlCgfXtmYNE+3jvuKE41j3mbUDOArnKDiDoNiwIt4DHIbWCOkU8NWoCbjVt6QoidxlggLAulW6HCDir67A3nuYkKZr8bYvedLpV0QpTuVPg4U8AsopHYPf15f1g3eoXzjb8/pnc0aPMiW73zUrRptUEPB3jyO667feUZbPTUPpwlHVyJZVyhBh5FRtfB9QBSls/pM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(4326008)(966005)(6486002)(8676002)(83380400001)(44832011)(8936002)(6506007)(6512007)(6916009)(316002)(6666004)(66556008)(54906003)(2616005)(66476007)(478600001)(66946007)(66574015)(26005)(82960400001)(38100700002)(7416002)(2906002)(86362001)(36756003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fR+XAdRKcSTjysneUnUa2zdcEF7D/jX2Kb1iaaSdJuK0EL17XvsAy8WUZz?=
 =?iso-8859-1?Q?Fq7+NXcxdXEyFxkhbuEVSdA1vm512RjZql+d4vsVr7+MvdnyjLeBbnfmFr?=
 =?iso-8859-1?Q?CJzIxKNSayw68toAUMpHdCpB6/cSsZajfUDjdg+1tEj1ReJhxUrZn4Mxo9?=
 =?iso-8859-1?Q?76BV7ny7wCxNaoP5QzsNwKyu/ry5M+c9lVLbgjuHCpiSog090MiH5OlUXN?=
 =?iso-8859-1?Q?kX8UZDyKrMzOynvkLBTdT5021WsJtTyw0eEfN4DJS1wKIUqADeMr0MoA4Y?=
 =?iso-8859-1?Q?Uik5EPBWZ3FcX/C44c56qv6xOT60unCpBRSLTFhhdlBYvPVC5SRx24EZB0?=
 =?iso-8859-1?Q?7ixzkyo4PrJVWt++SfPgfWDIa0YMJYBToLnUEBfNC7raraY0MMkZw0WehS?=
 =?iso-8859-1?Q?7CX5sMfCWEwl2N//IC0v0QwuPl1iBNkUgSLfaQr+6kAHrtq4ZACmutsOGs?=
 =?iso-8859-1?Q?zbJJcO46b04s62hYZkC2e6LZS9MkBC6xF3ZU6tauU8zwB6RBMkRnEDTboR?=
 =?iso-8859-1?Q?QhRUtDlhcRAJGGs3Z1FwYU5N3TPSl3HQi10X1hUkserNogmKASr95vRz5Z?=
 =?iso-8859-1?Q?q6OsilJ/IIdzEdMsxKFFjpn7asa9Vgspt0lOPZnaXZZSzSSKAQUxDnHKBx?=
 =?iso-8859-1?Q?oTvtwciZ4k1S5Daa5m98k0vn7rlEJ7ijS2s0/goNxhkobmg2ysjazCJM6O?=
 =?iso-8859-1?Q?a5Rbv1rl2CYsC5HX4+FAEDiJCFUNz/KNNUo3FLNXeUO3NJlslH2gLoIOj8?=
 =?iso-8859-1?Q?TJG9uwcG3AGYiGJcoaK4K3ID17V7bqUM6I1nwP/IiMzBoyPKLzSvyeMZbL?=
 =?iso-8859-1?Q?ZkeI4hvo67Viv2w9OxunPsBRzV9gIRoUjwYwWqDAaqMoltCx1nV4MOtSzd?=
 =?iso-8859-1?Q?jr4Hu3V+Tk3lVW0RJlcCuW1/2HJUJss4TU7Xy6KlsYt7XNOuKl/VIlUiEt?=
 =?iso-8859-1?Q?Yi0ttJDBj/GpZVDn/A0hWWKvr5m9PE4updKe/MR9Y2M7ksbC01muJMeYdT?=
 =?iso-8859-1?Q?u9MhCoEgw+mBt15qNmsUya8WmFthlZe3L+Ao8DK3eJWpL968NZtTEnYxz+?=
 =?iso-8859-1?Q?YMrvhTiSVq1ELouHs2fMTzrk/bRn/xchJJO2ou0I4i4BeCNbgua1/jZjGa?=
 =?iso-8859-1?Q?al6jg0yQk4Xse59Oj7m80GuYTGMteOY2YOj4VvFLkco2Oi5adTGovgex89?=
 =?iso-8859-1?Q?p4NyJRsRX2/phclQorT5IOtsOQ7nI+Lv4yU4bX8k9ChTJujx/Ch4hwFy2b?=
 =?iso-8859-1?Q?PQOMg2EYTdic6UQl73dwkpAqpyK+zsy/4oH5g1czqtXxijOqetM8Tkvk65?=
 =?iso-8859-1?Q?iMxLO90o3eamxTc2bMx/KRDMzySJ8eOBByncXT94jvuM8IpH6Xeu/3HRpJ?=
 =?iso-8859-1?Q?XUuDZkUuItA1iJdZdv8SBW6WfFOFS46RRSWtQawSwUQokrt/3wQaYW0BsA?=
 =?iso-8859-1?Q?+MbTrcc8OML8qmbcabNLz7YTHPZxN2rcVyGFmBxrujhHIlETJH7p09EGBZ?=
 =?iso-8859-1?Q?88gih5Gdjs7hS9tyxu0jpxvU4KWiaPD2ZQd3a8QiaazvpjU+PHZh1pRddA?=
 =?iso-8859-1?Q?xZc+gd1BE05HXg/oThuTEXpG73/3QUX4ZoWc3GJ9JEXxEOwxOzVJLsC86j?=
 =?iso-8859-1?Q?tDMPC1pjMVJB6PMSccRWl3JMv91mZ+CqG5qguFmruju6IiLj3Qoj81JA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b3d4a0-7a6d-4de5-ee19-08dc1b8e7436
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 21:09:43.0981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78FtSpB2Xc0wMLAQkbnRmjlfZaeBwrMtqH+Y00yL34aOYR/QcQQuSrw+IoQ/YxF11b8Ulg3w6HjmpqF+e+N2Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 03:04:42PM +0100, Janusz Krzysztofik wrote:
> Object debugging tools were sporadically reporting illegal attempts to
> free a still active i915 VMA object when parking a GPU tile believed to be
> idle.
> 
> [161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
> [161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_print_object+0x80/0xb0
> ...
> [161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-CI_DRM_13375-g003f860e5577+ #1
> [161.360314] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
> [161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
> [161.360592] RIP: 0010:debug_print_object+0x80/0xb0
> ...
> [161.361347] debug_object_free+0xeb/0x110
> [161.361362] i915_active_fini+0x14/0x130 [i915]
> [161.361866] release_references+0xfe/0x1f0 [i915]
> [161.362543] i915_vma_parked+0x1db/0x380 [i915]
> [161.363129] __gt_park+0x121/0x230 [i915]
> [161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]
> 
> That has been tracked down to be happening when another thread is
> deactivating the VMA inside __active_retire() helper, after the VMA's
> active counter has been already decremented to 0, but before deactivation
> of the VMA's object is reported to the object debugging tool.
> 
> We could prevent from that race by serializing i915_active_fini() with
> __active_retire() via ref->tree_lock, but that wouldn't stop the VMA from
> being used, e.g. from __i915_vma_retire() called at the end of
> __active_retire(), after that VMA has been already freed by a concurrent
> i915_vma_destroy() on return from the i915_active_fini().  Then, we should
> rather fix the issue at the VMA level, not in i915_active.
> 
> Since __i915_vma_parked() is called from __gt_park() on last put of the
> GT's wakeref, the issue could be addressed by holding the GT wakeref long
> enough for __active_retire() to complete before that wakeref is released
> and the GT parked.
> 
> A VMA associated with a request doesn't acquire a GT wakeref by itself.
> Instead, it depends on a wakeref held directly by the request's active
> intel_context for a GT associated with its VM, and indirectly on that
> intel_context's engine wakeref if the engine belongs to the same GT as the
> VMA's VM.  In case of single-tile platforms, at least one of those
> wakerefs is usually held long enough for the request's VMA to be
> deactivated on time, before it is destroyed on last put of its VM GT
> wakeref.  However, on multi-tile platforms, a request may use a VMA from a
> tile other than the one that hosts the request's engine, then it is
> protected only with the intel_context's VM GT wakeref.
> 
> There was an attempt to fix this issue on 2-tile Meteor Lake by acquiring

please do not confuse the terminology here. MTL is 1-tile platform,
with multiple GTs (1 for Render/Compute and 1 for Media).

Also you could probably avoid mentioning the other case here when
you are actively trying to resolve the RKL's single GT case.

> an extra wakeref for a Primary GT from i915_gem_do_execbuffer() -- see
> commit f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").
> However, it occurred insufficient -- the issue was still reported by CI.
> That wakeref was released on exit from i915_gem_do_execbuffer(), then
> potentially before completion of the request and deactivation of its
> associated VMAs.
> 
> OTOH, CI reports indicate that single-tile platforms also suffer
> sporadically from the same race.
> 
> I believe the issue was introduced by commit d93939730347 ("drm/i915:
> Remove the vma refcount") which moved a call to i915_active_fini() from
> a dropped i915_vma_release(), called on last put of the removed VMA kref,
> to i915_vma_parked() processing path called on last put of a GT wakeref.
> However, its visibility to the object debugging tool was suppressed by a
> bug in i915_active that was fixed two weeks later with commit e92eb246feb9
> ("drm/i915/active: Fix missing debug object activation").
> 
> Fix the issue by getting a wakeref for the VMA's tile when activating it,
> and putting that wakeref only after the VMA is deactivated.  However,
> exclude global GTT from that processing path, otherwise the GPU never goes
> idle.  Since __i915_vma_retire() may be called from atomic contexts, use
> async variant of wakeref put.

okay, this explains the first block of the patch below, but I'm afraid
that it doesn't explain why:

-     if (flags & PIN_GLOBAL)

> 
> v4: Refresh on top of commit 5e4e06e4087e ("drm/i915: Track gt pm
>     wakerefs") (Andi),
>   - for more easy backporting, split out removal of former insufficient
>     workarounds and move them to separate patches (Nirmoy).
>   - clean up commit message and description a bit.
> v3: Identify root cause more precisely, and a commit to blame,
>   - identify and drop former workarounds,
>   - update commit message and description.
> v2: Get the wakeref before VM mutex to avoid circular locking dependency,
>   - drop questionable Fixes: tag.
> 
> Fixes: d93939730347 ("drm/i915: Remove the vma refcount")
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.19+
> ---
>  drivers/gpu/drm/i915/i915_vma.c       | 26 +++++++++++++++++++-------
>  drivers/gpu/drm/i915/i915_vma_types.h |  1 +
>  2 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index d09aad34ba37f..604d420b9e1fd 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -34,6 +34,7 @@
>  #include "gt/intel_engine.h"
>  #include "gt/intel_engine_heartbeat.h"
>  #include "gt/intel_gt.h"
> +#include "gt/intel_gt_pm.h"
>  #include "gt/intel_gt_requests.h"
>  #include "gt/intel_tlb.h"
>  
> @@ -103,12 +104,25 @@ static inline struct i915_vma *active_to_vma(struct i915_active *ref)
>  
>  static int __i915_vma_active(struct i915_active *ref)
>  {
> -	return i915_vma_tryget(active_to_vma(ref)) ? 0 : -ENOENT;
> +	struct i915_vma *vma = active_to_vma(ref);
> +
> +	if (!i915_vma_tryget(vma))
> +		return -ENOENT;
> +
> +	if (!i915_vma_is_ggtt(vma))
> +		vma->wakeref = intel_gt_pm_get(vma->vm->gt);
> +
> +	return 0;
>  }
>  
>  static void __i915_vma_retire(struct i915_active *ref)
>  {
> -	i915_vma_put(active_to_vma(ref));
> +	struct i915_vma *vma = active_to_vma(ref);
> +
> +	if (!i915_vma_is_ggtt(vma))
> +		intel_gt_pm_put_async(vma->vm->gt, vma->wakeref);
> +
> +	i915_vma_put(vma);
>  }
>  
>  static struct i915_vma *
> @@ -1404,7 +1418,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	struct i915_vma_work *work = NULL;
>  	struct dma_fence *moving = NULL;
>  	struct i915_vma_resource *vma_res = NULL;
> -	intel_wakeref_t wakeref = 0;
> +	intel_wakeref_t wakeref;
>  	unsigned int bound;
>  	int err;
>  
> @@ -1424,8 +1438,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	if (err)
>  		return err;
>  
> -	if (flags & PIN_GLOBAL)
> -		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
> +	wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>  
>  	if (flags & vma->vm->bind_async_flags) {
>  		/* lock VM */
> @@ -1561,8 +1574,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	if (work)
>  		dma_fence_work_commit_imm(&work->base);
>  err_rpm:
> -	if (wakeref)
> -		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
> +	intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>  
>  	if (moving)
>  		dma_fence_put(moving);
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index 64472b7f0e770..f0086fadff4d3 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -264,6 +264,7 @@ struct i915_vma {
>  #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
>  
>  	struct i915_active active;
> +	intel_wakeref_t wakeref;
>  
>  #define I915_VMA_PAGES_BIAS 24
>  #define I915_VMA_PAGES_ACTIVE (BIT(24) | 1)
> -- 
> 2.43.0
> 
