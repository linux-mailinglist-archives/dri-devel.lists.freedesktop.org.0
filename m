Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CA9A706B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 19:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B030A10E56D;
	Mon, 21 Oct 2024 17:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcbfB6jJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED0110E566;
 Mon, 21 Oct 2024 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729530206; x=1761066206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1zb6tXKgZ5gA6TCPKK43jqhOA9viYhwmGOzvQEsIVrs=;
 b=YcbfB6jJ4Gp55vl+NqdoU30hoNVT6hdExbyblG2MgWFP54qYSgoTGfn9
 IgDqWOE0aVa/iZssUwv7k7K1wiFBgQFHKx98qHLgxfTQ59Ewg61aW6uwk
 0EVzZigFTm8kaAFuPYqkP5Wnx3gszKxUW0IGBlIr0RhMuxM76dSO73yKX
 U6r9Dq7FJ1n7LihHc9v9E9Fe0LuenxyDuQRGy96UVnDN7BrSoRhDIpz6o
 kf+UDK6U06LldUSzQEAJLq3EnU86wmN6ZmbUj4dxjNiXmZrXJgW0+L8zX
 lBnSMfMybEFLGyW8tzkUqyhi1qVblrszw3sG501SCE0HSrjQCcUTIA0nX w==;
X-CSE-ConnectionGUID: Q31m1Q+7Rw6qk3K8eTkSVg==
X-CSE-MsgGUID: /fitBd3TQciC9S5D3mT4ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28903465"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28903465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:03:26 -0700
X-CSE-ConnectionGUID: +0VSxhT9SmyGAp/upQCWkA==
X-CSE-MsgGUID: C1FMksMmTlyZ993ODS1Nyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79583390"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 10:03:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 10:03:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 10:03:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 10:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndBVZr5MFIh/tnITAEHSdi4CftQs7NoUvR8MKDZvkSbRDZx6MtEgDz8QJ7l/Ayw7rjsDZc0H+NNtaaBTawcmblQfzO/nyKAkBvcg42yUWqy0bXHnO3c2H6xqEXi/Kg+Oi/riF9SRdOhZnbKVGpak2Wjw/+vaLfqfUuZZEAsSpTObWEvJExznUT7q15DH10axy78TASDfSh0q0LDvedHYW4V3baHvnRwO8g7hhJ2XS+u+zskuDTMvoPhRsi4WuQa8plcZe5Xu6F4of6KsvjGL38sz7i8QLtQ+bk74Nbv2IHrZd4PEwB+8ILzOWNMmQOtEryMLJmT4UHmAmwr2lk33fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqCvUA51VJo8Ju3dfLA/sHAwst5NbFvWnynj+xTlLjk=;
 b=UHkU03XHMmHcSGJcPV/FzwLdGp/O4WSQneKCM6awTUBSN34bx14C/cXH+kpngCG5rhjN0iRadCYGQ81omt6MaqUiAVi9bc4hF5277ojRypPkmXPmy8ag3MbqV6/eXdH8+j9Tf4shCXjNz6fC3lHEPfM3ulJSmCSx2pKdVa/BG4Uylr2o3t2U6WbPFWA2aktKAMPUmhMIfNoBtufdllJ+zfRLFtDwaN1BELnioiBf/oNMZ8HYstEsT8ZU4KIQcqQvnEze9ewkyHjgtnfyH/QSCNTJKYAMjp+9RYckRVNDGvHvt0phi1nAVVScuPaZBW1lnyKkUWPKn5lrNbj/eFI0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 17:03:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 17:03:21 +0000
Date: Mon, 21 Oct 2024 17:02:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 3/6] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Message-ID: <ZxaJGRmLakKf5+6A@DUT025-TGLU.fm.intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-4-matthew.brost@intel.com>
 <4fc5fd25-dc7a-4e13-a6c1-adec1f20e5fc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4fc5fd25-dc7a-4e13-a6c1-adec1f20e5fc@intel.com>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c18f5b9-3d8a-446f-1715-08dcf1f24432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x169HIXRfmycn9KN9+GUe9jHxwQgvjMCLZCLjLBLXo0IRaik5wD0ulwNeTOk?=
 =?us-ascii?Q?P2LYXdaLZgkX73Beo5oDs3fa1YHI0XkuzyYh8jKx1pSn07u/yNL8tTlhr+BN?=
 =?us-ascii?Q?2jQw83ayowQ0It1aZcQahjffSr/26StrG9joZftfp11dYKUeA0tJwYniEuB9?=
 =?us-ascii?Q?iUOFic2kUXmEuoM2TYuagzQHeODZc0pU1RtW0cRXhUMY4Z+QRxy9gNroWpi6?=
 =?us-ascii?Q?xbOqjWSb6wQV+Ob3rN7/WNpUL287cvCkwoxoRtAdhgUIQSHrGKguBSS1E7Re?=
 =?us-ascii?Q?47fbIHdd6bHxCPvr3qwPNbmvkLV0ImT1rtYd6Q2HwDKNJKfGHCcfEnAbkkEa?=
 =?us-ascii?Q?45yjCkz6r1CqA0/PECZ0MwHCfoJ9KvbZJU3pw91dG5QBPyojixSpyhM6nvll?=
 =?us-ascii?Q?9DkSpJyEXmkgUk9eO/UrYl/DpXKyuObEniXD0H9W+dvWQev04pXA4fYKhpHd?=
 =?us-ascii?Q?hZ4oWQTujbUuCmf/EUh383wu9OkFSbZsXTyfTsRhiEoIGptx2+bJ0pzhZQcA?=
 =?us-ascii?Q?CAN5i6JYVSgnC5AbnGLSO1I7XSNPMDfTeFm8INp+mrRIjeZe+H3ISJoStySi?=
 =?us-ascii?Q?b2nma0zZib8cELgF7pPWRjDEq1zIfmk873070y7BDD7OHswB77t52psRL3h+?=
 =?us-ascii?Q?R8rTUiQ/KxEUZ/mAAcrkd/BevSmOgA5M86v1gf1Ek7zJ0N/GyV+qq5bEt0yv?=
 =?us-ascii?Q?KSex5+YJo6g9cV2LUd6zjY1izYM26+vTRpwFz2AbigSXwvKpQtVLHW+l5rUx?=
 =?us-ascii?Q?iEM05SusoO48dDcnMQQQpQpLMJyyV8gQxMOgTiPJhgzd74Agu7FGxDPrmAiR?=
 =?us-ascii?Q?eYwCqNpfvCWH34TcuJAbmFCcRqK5Pbkxy65WD+Ie9m8mCtVZrIuwkYyBA5Ol?=
 =?us-ascii?Q?7ZSpsrU2Ouu1V5sH+CVgnzRbNplVfV+VXn3LZAL001RGJC+0I1zbHmRqy0j6?=
 =?us-ascii?Q?s6SpFxmkF3eprGBMtLNjMpgltFdJ1cmmdyH1Br3DhxYu7W26qlBdV3U/buM6?=
 =?us-ascii?Q?ifFH8q/5w21ekDmpW0U3FtZd3KoxgM79m2cW4ejJ20WFaN0afvAyJqUPH3TH?=
 =?us-ascii?Q?tDuTTFlIV8632ATynpUerdqqeII7zxsmZCo+zGAd4/yFqv4hxdea5jXBNwdr?=
 =?us-ascii?Q?/GvOXbkbxnG3Xg5Fch3hZmmb5A48zySt8+lsiMJZdDJlL99TbJ6KRoEQdTyI?=
 =?us-ascii?Q?zBwCwjBQoi6vMAMwXiWo+u3C2RK1IB4eRmbrhhBfedJxG/pC2NOpLQ8vmE+b?=
 =?us-ascii?Q?PHDCmq9G8fQtAZEOFScr8Bot+lmg7YHQBu4lHEK/rei0BKAhqKajDQKT5R9I?=
 =?us-ascii?Q?Eck=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZyTshjG+uS2JiTOYTbR8KaaXgZca0LXwaGuXyE+x3EOndnVX/zOjqhl0+6/?=
 =?us-ascii?Q?yejIjZaPAP5x2ay1Bt2upsPxNQ0b+p6ABlnHuL53T5l8roMk7AkkltA8sktm?=
 =?us-ascii?Q?db8sTaUlU2QpriJG5pguCdUwFOUG+yajwhzOkPPTKpwjnK2zk6VztMaoZpEO?=
 =?us-ascii?Q?Onc0sLJsqeuXrwuMJ+2S0F44OH5V1JIGbHEIUia3JhAlUOXmEnvsv+/0xtrP?=
 =?us-ascii?Q?7eQPpIjIVwDuxzHXhkXltgyzucN+6eOadokMwW1Ob9vFsrCyvsXun+UuJcUb?=
 =?us-ascii?Q?dK5UoawZWvftvZHBFPKQRuO0RMtX3e56sycuc4hbsZnuuNq9G4pTgKQR/ci5?=
 =?us-ascii?Q?oLSwS/YduAw57bBd6DcJziMavWf3l7RovCyIeG1YdDUkRffzRZuyD0HRRZ8G?=
 =?us-ascii?Q?JiW3vuXgrl5V15WfwSvNuEXPRNxpUKt9g95qlzp9/j8vO6RZiPyEedD+11/Q?=
 =?us-ascii?Q?syytpfcOWs4Ocv+PN/p5kRnarlwBySsBrqK5L5Lg+eNSewo1ZzN21T/nNDs0?=
 =?us-ascii?Q?Z09OfKFU9ViLSPffeaQW3vj2+Betb3UnnkYI9E6kYZxFwQ4P4ZmM8daTlhSM?=
 =?us-ascii?Q?n9nalTZybX60vv8Bj2VuJoimFzuelZpVS55esfcb8R2+5bfTE69A9UaTMSRe?=
 =?us-ascii?Q?FAxPQS4b2nIa9ljhct5Qg+ZE8Mbcr+9mPE5jJ/caohJWx8ab9VaxLbgpbsly?=
 =?us-ascii?Q?jSZmk0bGLfuLkwECoUdbgjetTR6FsCGBdRz+HnL55uTCyInCZ1iUaxm9zzkY?=
 =?us-ascii?Q?sNgX4OkHH8L0d0Wy+LS6Bpyt64GxrV0IDUavZRAcwKbmi+eHAcmt3dugYZjK?=
 =?us-ascii?Q?87C2PqA0GKxu2ELkEqBPjeKYDSSov6D00CogLyXzwcuEbrdnXb4Lc2VOm4Kv?=
 =?us-ascii?Q?tC3DzTNpCNsAtUpde+6YRUbzykYsEVS//ljnip4XKNwp3+T1FAXMEpmdRI0J?=
 =?us-ascii?Q?8oArol3kVAdNQHx/B1ZSwIMZ2wknWuh0nJDNxMl5eADKFw+2MGTGkceSOQRm?=
 =?us-ascii?Q?jf2hfuQs4f3zazRBBZxYkVnrZIj/Iru9eNAr0zgrJZ67+gfE9JS8Cn/yPWBb?=
 =?us-ascii?Q?Ba3prTlUpbK2Is1CQNJgOUNCm/HBJt9enskOrfm1Gjrulj4ISRZ1RCfR1Bgn?=
 =?us-ascii?Q?ZgkBAsx2H72JAmyyIZKYxAN8BYfLBFjFb1L6eC5SZsxTknWaM9/dAWaZSxL3?=
 =?us-ascii?Q?Ki7kEMhjwRqRvjGWMQdaazLeguEB7jYSVnLGH2iu023rth5b/+JuKbS5kNKH?=
 =?us-ascii?Q?kl+McV1cp98HYR1fefnDe+b+rEw8Zy0dYRgHs+H2LGkQ8/r9n4K7ir/k1IGs?=
 =?us-ascii?Q?kwpVsZIrgr0Ra3CPrDuR9tkMgwtj+sJJRKfEDj85Nz6w8PvaKlBK4cTNplJ5?=
 =?us-ascii?Q?hQ2QlKX0Ke3pM0VoZke9VqM3qOmJHx/H3Oxxh5pAdqcjeDxeI4Hg/W/a8awl?=
 =?us-ascii?Q?oNZZORNvrJLs21TeK3nmDtwt/eOBh0dn40+98LUrNZDM6Bz9T6fGAlYy9Pgh?=
 =?us-ascii?Q?urYyXwmymZEvqralxSUrHK8RlfffxzsKOA7842D16177+OQZL3FN9SEyPvdr?=
 =?us-ascii?Q?eoQipGfobSZFNeoGQj70JUsDQt6Bg40wTaMpHxGJELqdcbSaRusrOFnqSfiQ?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c18f5b9-3d8a-446f-1715-08dcf1f24432
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 17:03:20.9801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mnh2f4ZuaP0xWM7c72b8iXQgzc0AKPXfVPw/Yn7w/D6c4UCSfCkV6e+5H0qE2tjU6CBBp5A2SV/bJUmqaD2ASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

On Mon, Oct 21, 2024 at 11:15:33AM +0100, Matthew Auld wrote:
> On 19/10/2024 20:20, Matthew Brost wrote:
> > Add migrate layer functions to access VRAM and update
> > xe_ttm_access_memory to use for non-visible access.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I guess this needs some IGTs? In i915 I think we have test_ptrace() in
> gem_mmap_offset.c, which could maybe be ported or something similar?
> 

Will need some IGTs for sure. Tested via hacking a kernel locally +
hacked up a dumpable BO error capture test. Unsure if I have bandwidth
to get a proper IGT coded though.

> > ---
> >   drivers/gpu/drm/xe/xe_bo.c      |  18 ++-
> >   drivers/gpu/drm/xe/xe_migrate.c | 267 ++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_migrate.h |   4 +
> >   3 files changed, 285 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 99557af16120..0a7b91df69c2 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1133,13 +1133,22 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> >   	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> >   		return -EIO;
> > -	/* FIXME: Use GPU for non-visible VRAM */
> > -	if (!xe_ttm_resource_visible(ttm_bo->resource))
> > -		return -EIO;
> > -
> >   	if (!xe_pm_runtime_get_if_in_use(xe))
> >   		return -EIO;
> > +	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
> 
> I guess commit message/title should be updated to mention that this also
> used for large accesses?
> 

Yep.

> > +		struct xe_migrate *migrate =
> > +			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
> > +		int err;
> > +
> > +		err = xe_migrate_access_memory(migrate, bo, offset, buf, len,
> > +					       write);
> > +		if (err)
> > +			return err;
> 
> Looks to be leaking the rpm ref here?
>

Yea, noticed this after sending. Have it fixed locally.

Matt
 
> > +
> > +		goto out;
> > +	}
> > +
> >   	vram = res_to_mem_region(ttm_bo->resource);
> >   	xe_res_first(ttm_bo->resource, offset & PAGE_MASK, bo->size, &cursor);
> > @@ -1161,6 +1170,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> >   			xe_res_next(&cursor, PAGE_SIZE);
> >   	} while (bytes_left);
> > +out:
> >   	xe_pm_runtime_put(xe);
> >   	return len;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index cfd31ae49cc1..ccdca1f79bb2 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1542,6 +1542,273 @@ void xe_migrate_wait(struct xe_migrate *m)
> >   		dma_fence_wait(m->fence, false);
> >   }
> > +static u32 pte_update_cmd_size(u64 size)
> > +{
> > +	u32 dword;
> > +	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +
> > +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> > +	/*
> > +	 * MI_STORE_DATA_IMM command is used to update page table. Each
> > +	 * instruction can update maximumly 0x1ff pte entries. To update
> > +	 * n (n <= 0x1ff) pte entries, we need:
> > +	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
> > +	 * 2 dword for the page table's physical location
> > +	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
> > +	 */
> > +	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> > +	dword += entries * 2;
> > +
> > +	return dword;
> > +}
> > +
> > +static void build_pt_update_batch_sram(struct xe_migrate *m,
> > +				       struct xe_bb *bb, u32 pt_offset,
> > +				       dma_addr_t *sram_addr, u32 size)
> > +{
> > +	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > +	u32 ptes;
> > +	int i = 0;
> > +
> > +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +	while (ptes) {
> > +		u32 chunk = min(0x1ffU, ptes);
> > +
> > +		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> > +		bb->cs[bb->len++] = pt_offset;
> > +		bb->cs[bb->len++] = 0;
> > +
> > +		pt_offset += chunk * 8;
> > +		ptes -= chunk;
> > +
> > +		while (chunk--) {
> > +			u64 addr = sram_addr[i++] & PAGE_MASK;
> > +
> > +			xe_tile_assert(m->tile, addr);
> > +			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> > +								 addr, pat_index,
> > +								 0, false, 0);
> > +			bb->cs[bb->len++] = lower_32_bits(addr);
> > +			bb->cs[bb->len++] = upper_32_bits(addr);
> > +		}
> > +	}
> > +}
> > +
> > +enum xe_migrate_copy_dir {
> > +	XE_MIGRATE_COPY_TO_VRAM,
> > +	XE_MIGRATE_COPY_TO_SRAM,
> > +};
> > +
> > +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > +					 unsigned long len,
> > +					 unsigned long sram_offset,
> > +					 dma_addr_t *sram_addr, u64 vram_addr,
> > +					 const enum xe_migrate_copy_dir dir)
> > +{
> > +	struct xe_gt *gt = m->tile->primary_gt;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct dma_fence *fence = NULL;
> > +	u32 batch_size = 2;
> > +	u64 src_L0_ofs, dst_L0_ofs;
> > +	struct xe_sched_job *job;
> > +	struct xe_bb *bb;
> > +	u32 update_idx, pt_slot = 0;
> > +	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> > +	int err;
> > +
> > +	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> > +
> > +	batch_size += pte_update_cmd_size(len);
> > +	batch_size += EMIT_COPY_DW;
> > +
> > +	bb = xe_bb_new(gt, batch_size, true);
> > +	if (IS_ERR(bb)) {
> > +		err = PTR_ERR(bb);
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > +				   sram_addr, len + sram_offset);
> > +
> > +	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > +		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> > +		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> > +
> > +	} else {
> > +		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> > +		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> > +	}
> > +
> > +	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > +	update_idx = bb->len;
> > +
> > +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, XE_PAGE_SIZE);
> > +
> > +	job = xe_bb_create_migration_job(m->q, bb,
> > +					 xe_migrate_batch_base(m, true),
> > +					 update_idx);
> > +	if (IS_ERR(job)) {
> > +		err = PTR_ERR(job);
> > +		goto err;
> > +	}
> > +
> > +	xe_sched_job_add_migrate_flush(job, 0);
> > +
> > +	mutex_lock(&m->job_mutex);
> > +	xe_sched_job_arm(job);
> > +	fence = dma_fence_get(&job->drm.s_fence->finished);
> > +	xe_sched_job_push(job);
> > +
> > +	dma_fence_put(m->fence);
> > +	m->fence = dma_fence_get(fence);
> > +	mutex_unlock(&m->job_mutex);
> > +
> > +	xe_bb_free(bb, fence);
> > +
> > +	return fence;
> > +
> > +err:
> > +	xe_bb_free(bb, NULL);
> > +
> > +	return ERR_PTR(err);
> > +}
> > +
> > +static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
> > +				 int len, int write)
> > +{
> > +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		if (!dma_addr[i])
> > +			continue;
> > +
> > +		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
> > +			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
> > +	}
> > +	kfree(dma_addr);
> > +}
> > +
> > +static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> > +				      void *buf, int len, int write)
> > +{
> > +	dma_addr_t *dma_addr;
> > +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> > +
> > +	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> > +	if (!dma_addr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		dma_addr_t addr;
> > +		struct page *page;
> > +
> > +		if (is_vmalloc_addr(buf))
> > +			page = vmalloc_to_page(buf);
> > +		else
> > +			page = virt_to_page(buf);
> > +
> > +		addr = dma_map_page(xe->drm.dev,
> > +				    page, 0, PAGE_SIZE,
> > +				    write ? DMA_TO_DEVICE :
> > +				    DMA_FROM_DEVICE);
> > +		if (dma_mapping_error(xe->drm.dev, addr))
> > +			goto err_fault;
> > +
> > +		dma_addr[i] = addr;
> > +		buf += PAGE_SIZE;
> > +	}
> > +
> > +	return dma_addr;
> > +
> > +err_fault:
> > +	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> > +	return ERR_PTR(-EFAULT);
> > +}
> > +
> > +/**
> > + * xe_migrate_access_memory - Access memory of a BO via GPU
> > + *
> > + * @m: The migration context.
> > + * @bo: buffer object
> > + * @offset: access offset into buffer object
> > + * @buf: pointer to caller memory to read into or write from
> > + * @len: length of access
> > + * @write: write access
> > + *
> > + * Access memory of a BO via GPU either reading in or writing from a passed in
> > + * pointer. Pointer is dma mapped for GPU access and GPU commands are issued to
> > + * read to or write from pointer.
> > + *
> > + * Returns:
> > + * 0 if successful, negative error code on failure.
> > + */
> > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> > +			     unsigned long offset, void *buf, int len,
> > +			     int write)
> > +{
> > +	struct xe_tile *tile = m->tile;
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct xe_res_cursor cursor;
> > +	struct dma_fence *fence = NULL;
> > +	dma_addr_t *dma_addr;
> > +	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
> > +	int bytes_left = len, current_page = 0;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> > +	if (IS_ERR(dma_addr))
> > +		return PTR_ERR(dma_addr);
> > +
> > +	xe_res_first(bo->ttm.resource, offset, bo->size, &cursor);
> > +
> > +	do {
> > +		struct dma_fence *__fence;
> > +		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
> > +			cursor.start;
> > +		int current_bytes;
> > +
> > +		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
> > +			current_bytes = min_t(int, bytes_left,
> > +					      MAX_PREEMPTDISABLE_TRANSFER);
> > +		else
> > +			current_bytes = min_t(int, bytes_left, cursor.size);
> > +
> > +		if (fence)
> > +			dma_fence_put(fence);
> > +
> > +		__fence = xe_migrate_vram(m, current_bytes,
> > +					  (unsigned long)buf & ~PAGE_MASK,
> > +					  dma_addr + current_page,
> > +					  vram_addr, write ?
> > +					  XE_MIGRATE_COPY_TO_VRAM :
> > +					  XE_MIGRATE_COPY_TO_SRAM);
> > +		if (IS_ERR(__fence)) {
> > +			if (fence)
> > +				dma_fence_wait(fence, false);
> > +			fence = __fence;
> > +			goto out_err;
> > +		}
> > +		fence = __fence;
> > +
> > +		buf += current_bytes;
> > +		offset += current_bytes;
> > +		current_page += DIV_ROUND_UP(current_bytes, PAGE_SIZE);
> > +		bytes_left -= current_bytes;
> > +		if (bytes_left)
> > +			xe_res_next(&cursor, current_bytes);
> > +	} while (bytes_left);
> > +
> > +	dma_fence_wait(fence, false);
> > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> > +
> > +	return 0;
> > +
> > +out_err:
> > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> > +	return PTR_ERR(fence);
> > +}
> > +
> >   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >   #include "tests/xe_migrate.c"
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index 0109866e398a..94197d262178 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -102,6 +102,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >   				  struct ttm_resource *dst,
> >   				  bool copy_only_ccs);
> > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> > +			     unsigned long offset, void *buf, int len,
> > +			     int write);
> > +
> >   #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> >   #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> >   #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
