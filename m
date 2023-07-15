Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FBF75459D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 02:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B24910E12D;
	Sat, 15 Jul 2023 00:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3C110E12D;
 Sat, 15 Jul 2023 00:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689380432; x=1720916432;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wKU6EW/7hex5DrRA/Dqy2MVsuOUBTDZEkGoMyOvZhvc=;
 b=UUNS8dIoXCuuneV3JK2v5pz391kAoSoYKQ/J/zQ7BYC6Hd0kFOhIwzGl
 6eE87qSnRYwRwf8fRCuorVGTjpCs7CvUVLaIO1UIe2j+e9thq3LUdjkXp
 j2MjjNZIa/qT1BzY2aHWtKYtBQrsfoP+wz578nccmPXuPTUHRjwhjUHdT
 q8gGVhUo0OyiZM0f9Yo8nMthTg+nqC+KzB9ztE9zBjrs1PZtrYnBvGadJ
 MmaglZSspy3exkmfojyjbu70rP/mGSO50JfULOpwrTkTkqYrsWflvrXUN
 cQCAg7AnWa73VwtPH0gVFV0RnzXLeBOWg4zYQP+pVG5ZUuVyCJTNrreKJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345921402"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; d="scan'208";a="345921402"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 17:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="836216654"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; d="scan'208";a="836216654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2023 17:20:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 17:20:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 17:20:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 17:20:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJb5Pbtmx/J5p6MXRfprGgBqvGe7KLMIW9xV1yM4amLZTtfuGni1zLJ7FMUzIhR6UpwfkJy7g2hi4VBv50YiIVeNExOZOuZfKpah9cJHSuhe7jJHkc+XSn1vVI+4yY2CLgLDxXyeIfS+HsxWgMaSbtj27LQ/s8paQ10NUFMhdUmhRE3/l9MEMKT0Ex32YSolFCrtVdc/cYhs6xCZNp+Q5NbSeP5AjjT6k5ZtV/dBNaEINsYAfrBMBiI5lNSzwWtGvCdLHFTAUwCd0nnchz8kOuMnal+N1lSaTgMzcOXL7UymnSbXK6KYg6CO3MKkxigmOcuPRzp2Xn541aPmlVvX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6PAJcYYuIuCRaUwNaZvOkwudpA/pMxYko0/mO+gW+4=;
 b=JSSdGeX/QguH35Xs2/LJs8FGoec7CYiomVwXomzFVUT3Jq3aPfYnWUJwScQp6owTwv0imt3lRoUbfYIsRnBawYkdsTP5cSTmcxPO2p17AUqNshHdpxBRL3f2ebfc9flPaWf/rnuiowHoATYPWU/v/iFDrnL2uTaATsvSP/EqSgtBGMEe4krhubfqfpEVm5OMabH0g67OjnhhJgbQY7RfrXHW3x2a5P3AuuVaZ6rkRmEF/6L0CD/wuKo0+W4thm8/GatBokVPR34/+oMpbPzME/miNZaR7ektt86p8+nEYbOg3zC5HW/qOGlLeGv/n/SUBKXWEtKm4DAa7CVnAItdUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Sat, 15 Jul
 2023 00:20:28 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8%7]) with mapi id 15.20.6588.028; Sat, 15 Jul 2023
 00:20:28 +0000
Date: Fri, 14 Jul 2023 17:20:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Message-ID: <20230715002023.GA138014@mdroper-desk1.amr.corp.intel.com>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
 <20230713152718.645488-2-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB25673D3525AF7C5A5FFB44129A34A@BYAPR11MB2567.namprd11.prod.outlook.com>
 <999114a1-e334-5de9-065e-9a5d3801e23e@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <999114a1-e334-5de9-065e-9a5d3801e23e@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: c995f359-e060-48d2-af20-08db84c949ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UuJXuWUFgyr/PqawWsjpcyuypmkdbewWyeMMcjt6f/1cza9diIGHXJ2VrKxDVX7J6pZz9zX2CXgTcA+PFtd80TRsKe2lVRH/B32nOPF/ik9lDlaqdmxA7eVwd/mCpkT2gtcp769KPveDiqSAPA3SPSFDqlosp5XeoYCQQMNcsqcdKWqqGUC1jFVxMgXdyIknYSo7MlrgvPopp0prm6IIPjWgEDAoLuvP7tG1EzpOXfXOb4Hw/16T2t6K8lbQMRp2K5cJj+ExBjdRe+PgVavGTYgkS1J4wY0h+44f1/lwQ1hvkLLThWDO+d9LMhz9UTVs/BdTRIROJ4pSnTbVKF72TDkvkF+zSc621lRKKrtFOYX2NUA6HJ3O2ZdWRm4R2GwBWAlPhU1HeHotqRL/7Vh1OhpyLAHPQe1CLczRxlat7XosYMgSqYF8Q0C92gfJHx9QIVJ3zeD47WzdhnoespV4fdMlnWFZ5N3HlcsaMIFbt9OW5TeKRnKNQ6+VBd/RWrfZ7Z7Sbfjs648N2TFe7hladPQkA5Kq0uTyHUOzKuocw1pB5qLmTQn+8W/fNoqKKa3y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(2906002)(83380400001)(38100700002)(82960400001)(41300700001)(6486002)(6916009)(4326008)(66476007)(66556008)(316002)(66946007)(6512007)(8936002)(8676002)(86362001)(33656002)(478600001)(6666004)(54906003)(186003)(5660300002)(53546011)(6506007)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p1JVB1qXV+wuKNa5Ob/rmsgy8AZ9EveidscIzCt4UlMbYWXKvrQLguZHf9zy?=
 =?us-ascii?Q?vS/sryzuBhTqu1qloraOLTMbn4/wr/l2WsxRmSqeQrkuQLG+vlmHQ77vXYpW?=
 =?us-ascii?Q?v/A1XuMIJa7wNVtuK2o7iVe3RMOK1xDzudA/UfA6kTGjVTrp6aKQvCgBn1NK?=
 =?us-ascii?Q?DUkPczC+gM189MtihA8OkvvzWogpoLWhC1bo4or7l/MNXOCNSH7Ti31d3nU0?=
 =?us-ascii?Q?lOZGA/JXcLuOvL8usX06Un0kMYx3PXdKedpAczAXPodyVxcw3cVdDuq5Pxh7?=
 =?us-ascii?Q?j7qi0BGq4mdMVKThv/MjJuW16QbSwTFHlL0slOee/8yQymhAvEN4Z0CDi/C9?=
 =?us-ascii?Q?4QAteMpDrZ9aKWbeMFFuT2+oXV97T+Fu1wk0qsRpz6A9+EwZMSAi91qebJNZ?=
 =?us-ascii?Q?s+mVPH5rxWYkWd+VyPC6HC9PBC9lHhHJqih+9BZJi+IK4wRYfHl8o/ZcAb62?=
 =?us-ascii?Q?AxGKguCm1HGz58PqWTKmVs5eTaMqYzl+2rPEFdTS83miXf0//GHTpLacBGyu?=
 =?us-ascii?Q?UCSibx5T2zGsfg8X9yftG7lul+Ybda9QKOLAhHwDZVIhzq39e8RqMn8LiFSU?=
 =?us-ascii?Q?uUAYubLelV4LCYkXz5NUcsgt5wdn+l3c7C81QbJgDZPGzBF/S9HY9wXT1o6z?=
 =?us-ascii?Q?eEyksE/3Avj1Zhb4YgjbchosXKKoMtjz6L7JdY/mAUY3PH6HZ1s5dcgLocW5?=
 =?us-ascii?Q?u6CUQ8Gee63jU8fWsbrOcKHZIg+S2V9b992ADaFWjqAqB9coE+u9j2OGSTTw?=
 =?us-ascii?Q?Zv6Gghg+8TedbWbQCPR67IA3VNgKNAoKzohjNwCdbimkbeRZWtorOKF9GSL6?=
 =?us-ascii?Q?196jHBVPkMD2AxFKYHg2jRT4UmiUjs+qmzOVkpmrPMfhpgepsCMjVTVJfsa0?=
 =?us-ascii?Q?U896xRtYtmzfmyYfEHxNucq8yeXptwdvFU3rQtDjl3X9rsnQ0uBdj2jw9wCd?=
 =?us-ascii?Q?qSI176h/hB9WHXRXtodT9wzF3/Zt6X1sENBY7q1cUxX9eTOp3MgDZw35quV4?=
 =?us-ascii?Q?enlF8HaKkPNVE0HFl0c6i0kL0Je8rFJd+zi4RJUS9QO4vcvhSP+HzPj+lbAR?=
 =?us-ascii?Q?mOC8gOl9AUqzNh1/2yXHiT546qpk7ipSlgmGrDxy+QlMtbCKeig+q8bCoUut?=
 =?us-ascii?Q?fV4Cl0c9xofu3uEZErtlt+sn41OjNJXC/cOqL9vdYgVE9K8CX3QAO6TXiL8f?=
 =?us-ascii?Q?oFCB4wUj7TB5zue2l1ZvnxbWl/Q2/AkqT7855hBBy/c7u20o6hIvxKhdQttb?=
 =?us-ascii?Q?ed+P7p18LKfAKaDSqVthbnXSF/hUImsMX1vcfwnp7/ex9sFpnyg8Frl5K+Nx?=
 =?us-ascii?Q?Vr064x+n4iSQk9l+luzyI7qqMMmiqLZd7hkIhdKsyvwRhremRkG3Uta9ItTt?=
 =?us-ascii?Q?5exoRddMGTYo8yJXwrHexwk6gbBnhuabDGGAaAz/+Ev/XhsyJHmdsFfrce+c?=
 =?us-ascii?Q?0x9UHSgwid67z9vaQYZDDBAgohzVHlhO9LcJ39uMmZYVpBfb57P+eI90AUWH?=
 =?us-ascii?Q?g1WymTlvDATIJEWBhpXfzFMCg3ioNS43ItlBp0jdGVVho+hx8Vvw2z7DBP9k?=
 =?us-ascii?Q?XBc5LqZMU1CFDO5WjaQ5CaHnEx+ANjqZlcQiIGVLE9DO69vWuTXWs+MzXlGU?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c995f359-e060-48d2-af20-08db84c949ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2023 00:20:27.3299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KF7+n7s4LsumeJjuH1zNYXnoIClujQQMCXDeZtsTDClVHvuuMoAcXbT/w6b6gV1fC7wzihKx/zXcBemgBFUmNwBZi+PE4kGVo2gPqx8z4XA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
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
Cc: "Yang, Fei" <fei.yang@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 11:11:30AM +0100, Tvrtko Ursulin wrote:
> 
> On 14/07/2023 06:43, Yang, Fei wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > According to the comment in i915_gem_object_can_bypass_llc the
> > > purpose of the function is to return false if the platform/object
> > > has a caching mode where GPU can bypass the LLC.
> > > 
> > > So far the only platforms which allegedly can do this are Jasperlake
> > > and Elkhartlake, and that via MOCS (not PAT).
> > > 
> > > Instead of blindly assuming that objects where userspace has set the
> > > PAT index can (bypass the LLC), question is is there a such PAT index
> > > on a platform. Probably starting with Meteorlake since that one is the
> > > only one where set PAT extension can be currently used. Or if there is
> > > a MOCS entry which can achieve the same thing on Meteorlake.
> > > 
> > > If there is such PAT, now that i915 can be made to understand them
> > > better, we can make the check more fine grained. Or if there is a MOCS
> > > entry then we probably should apply the blanket IS_METEORLAKE condition.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > Cc: Fei Yang <fei.yang@intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > index 33a1e97d18b3..1e34171c4162 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > @@ -229,12 +229,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
> > >        if (!(obj->flags & I915_BO_ALLOC_USER))
> > >                return false;
> > > 
> > > -     /*
> > > -      * Always flush cache for UMD objects at creation time.
> > > -      */
> > > -     if (obj->pat_set_by_user)
> > 
> > I'm afraid this is going to break MESA. Can we run MESA tests with this patch?
> 
> I can't, but question is why it would break Mesa which would need a nice
> comment here?
> 
> For instance should the check be IS_METEORLAKE?
> 
> Or should it be "is wb" && "not has 1-way coherent"?
> 
> Or both?
> 
> Or, given how Meteorlake does not have LLC, how can anything bypass it
> there? Or is it about snooping on Meteorlake and how?

I think the "LLC" in the function name is a bit misleading since this is
really all just about the ability to avoid coherency (which might come
from an LLC on some platforms or from snooping on others).

The concern is that the CPU writes to the buffer and those writes sit in
a CPU cache without making it to RAM immediately.  If the GPU then
reads the object with any of the non-coherent PAT settings that were
introduced in Xe_LPG, it will not snoop the CPU cache and will read old,
stale data from RAM.

So I think we'd want a condition like ("Xe_LPG or later" && "any non
coherent PAT").  The WB/WT/UC status of the GPU behavior shouldn't
matter here, just the coherency setting.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > >        /*
> > >         * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
> > >         * possible for userspace to bypass the GTT caching bits set by the
> > > --
> > > 2.39.2

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
