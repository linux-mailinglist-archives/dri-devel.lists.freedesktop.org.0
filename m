Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA265BA33B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 01:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE54810EC1F;
	Thu, 15 Sep 2022 23:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BCD10EC1E;
 Thu, 15 Sep 2022 23:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663284607; x=1694820607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=njNH2QlY0cYm5UM44WEvMwsUbE8BUuKHzlF8RnrQmTc=;
 b=YrUmhRSRhAcGVKo6vnnxD16TgX5tkC/3fzHPx9OcVQRX0fkFEfTHJjUy
 xeHs8v44pTINAcZkKd6ALxRZ/47R/laVtMRREbtp3rpnU3XYUr9aUyXVc
 cwoLW4HGujw711tICw/YH3bAgeJ+Cw6paUGp9Mvxk0/KIv0gTpaPMf3uc
 aImcPsksJHUTe33hSIA0R3GqhxTwJoFPfk5HgVcrJhV7plE12PzKgVYgi
 oK62OW9YJT9l11L44+x3INDMa+mpTevdq8B3QTC5sL0i2KE/O7Nov/skI
 1dGSsj2oVSZtuWSZhFf7kfVseIDclrCB+OvIDiol/iEsC2yPpxIv3fKtp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299689537"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299689537"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="759840736"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2022 16:30:06 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 16:30:05 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 16:30:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 15 Sep 2022 16:30:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 15 Sep 2022 16:30:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JctWdMEZtd9sBuClgQ4+EHAALvoYdtYbuUVWnDam8RtHJLB75C9+LDbAXbTAo/InodY2w99FOqNRCLuUPaeP4qdJyHDJr5xHGcCLcHSR2yQqlHgAOorqlV1khNOpofkDPYlkfgB2tLjlGxfYyOw7RBoACB8hqn/42fVYQYBHlN8USyBUVaFtPNauh0xC6wsBkx7dmp5st19cat256qq3XgDRtYij+I4WZIZQalKxA/psMV+ISdWtTAzv5ZOuMwZcoKBgjkxrq+pDPtUvXVIrtj5JcD/NAIXCuqx+MPJPZDC+oAvVb2pTvWA/EMSSO6fBTYZv02cIIOP/d7Jr1dddiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PAFUfajzmI8DUEvbD07f+dt9FQFxYFUHPVErRh+9cc=;
 b=kWXf/pbtprt11YhXyxkT9D5XMFXHzgFOXnVW7yBV6wpnpviAgpvUgF0hZrdeVmHHYfi5+wSW+0IXNoncpl4GA06BkeA/coAMluWCSUSXfsNy094Y2/bBqaiDLL0xkvOZS3VNU9Uwu5hmU9GkZTfzrUWhYLKsWSgFGggEgei+ddHgA0LpfVSMgpZOgtdgnLL2v0rQmPsV81xVPXyfpMcPXN+DKYgvBTA690TA8Rxy2M4IpX9mcvkLJlWwjSX4u3r82rXtSZtSw345e/o5a76fEFivtTY0Y80LwREMIy3tLPEk/m68T0CHYjSw3jdFfXpgvdFzcErJPJRt52M/L/b6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB6475.namprd11.prod.outlook.com (2603:10b6:510:1f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 23:30:02 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5632.015; Thu, 15 Sep
 2022 23:30:01 +0000
Date: Thu, 15 Sep 2022 16:29:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] Further multi-gt handling
Message-ID: <YyO1d75XvmXRPYgf@mdroper-desk1.amr.corp.intel.com>
References: <20220914220427.3091448-1-matthew.d.roper@intel.com>
 <87czbwsu38.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87czbwsu38.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 05412322-01ee-4244-3b17-08da97723607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: njNuKIlkYnBRVbez5pZediBAsDjOZ32QqhO8plhbvky6XMODt3OlX2tAkrA4+yL6B8UxPLxFB3dpWU4SF7NOXNbNwhke7jClSipRGonspNry46neJsbEofKLbSX42N403YzGf8l5I3NcIly1E2LgE3xcb3E1hi5wbxNM7NpqDtYqlp+ihVqRt8IfgDy1MZxgKqI/GID1llu/dL8IUSQABUaSW35horQPJdBf3LxxABVWocMYFi9V+0XspQ4LHGqyvoXPi7xO21Nx7AOVMabq+Gh1QmUIfxyUq97q8lkTPV8GaL5CtMLI4SYwD/Rc3EtGG4n86zJndxy96fUJB/qTYX1/7SPGmV9199GEx0BG4XipEl5DonxuxTzW/2HnLesPdGFDjXMroY8d3QiejLuXoIFxpm10wDrzZYSXIDDqIZbewQJWRIB9ypzPjGThbKdfHHIBTHS2wnU2nmq+6nZGxeBJtpVhvUPngBVObRT8/zUP30DKoR5zA+X2yRtql+rEZHDkpio7PcQhJJ8IXFsxRjvQrbWL7PsGQloZmycF3w0YjJRpYysshzlvUW9R72/AtDtCIxekLekIarM0u2K0DnEclMs9j8T1sGMqyqwN6Fj5OdJ5vnkm217prY++zVCChvVSCBJOgwEIX6sr0suzDgTPFTShysJJ07OJQ9ZlyZfNykbgal2/o4XOhVJ8QOQ60Ud+N/qhvGAxpy1KV+NCjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(186003)(83380400001)(38100700002)(8676002)(5660300002)(82960400001)(4326008)(26005)(6506007)(478600001)(2906002)(6512007)(41300700001)(316002)(6916009)(6486002)(8936002)(66556008)(66476007)(66946007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qy6giskcJlmLzKPUPjmZM6orKCZCaznyqEF/FTkD+b3fyK+Gac0c0LwIWehm?=
 =?us-ascii?Q?i+CewU6jGiIRH9knE6mcjyoWi+I37E6JSnQmIp7iSmVhl6rr96XZl/dH80eN?=
 =?us-ascii?Q?e53+ylh550a9uJ9TqpepG4AgqdaAkGbJVbl3eIBewMzERHmfZ/flBJpcrkYF?=
 =?us-ascii?Q?d/9Og1Z3ww6iuoKpODNXCYczfZMJmS1Lr/l976nuEKDgF7bNAauylyqdtWK3?=
 =?us-ascii?Q?oY3ly+q57MWk5aimlKTCVP74SsKw7oSZuBmJ21oNo+nDoaSR8q93cePx2mAI?=
 =?us-ascii?Q?gplbhNYPneq+/SsAA8drGYDmWnB3x9tgVaYEPOJfm1Jgj2oOKu69ztbfemIR?=
 =?us-ascii?Q?bA08oU8Quf7CYQ7H+VxQ44adXwBiPeJL6D7mQ7GWcBqtn6H3LbPfMO6rn0AU?=
 =?us-ascii?Q?7tXSkklps+qoFskYq4IgT+aZtaF/8g4T2n8/kn1Tz4cZfGoA0/iVHrusCtZP?=
 =?us-ascii?Q?x5Gp2ufZVHZIw7klsN8/m6r1S7ZQAJtlR1EV5zZsRjjj7LYKKzutPX++0Rp3?=
 =?us-ascii?Q?b0Og989onqD1xiHuqwDu3MxVjoSALsmPT+ZlPkS6kO3efHLP1qiZcFygSlmr?=
 =?us-ascii?Q?UeNrtp43DUSkFgvA8q7arRulzpK/AhGGbDnJ2f/PSXCoLOwRZc1Bvm/xmAu4?=
 =?us-ascii?Q?vap+Aahyc7NbRmfatzNsyoGIWR95cZzewcRhLWOyqcTSWNvZUnI+Em8WW+H3?=
 =?us-ascii?Q?RyC2qmbgKfpyusAyN+FCRNzouA1Kq1NIi7JfHlcFeAf88bf3KBaOkGoUnwr0?=
 =?us-ascii?Q?rz+aN5CixE/IzyeNfeJG/xI1zeOpLBywRHoB8oWR4Xw4nSfYFUZuCTs3aKBf?=
 =?us-ascii?Q?MFFkpExliJhRGCud9bfLcfMd+U+LLOq+sTIfv5JjMZhD8F+Z5ekB7dWI2fUZ?=
 =?us-ascii?Q?RWijFqmiJREMmgRt4/2lNAhAcmRYb6LqslCAB2o/4tjS7HQctNZ2CPHkP9So?=
 =?us-ascii?Q?J/2ulAt9mclBL+QqEj8HwuOmLg04JtlPsW4CGSqTVynFCJs6hffN6VfrUyM3?=
 =?us-ascii?Q?fn3jkwhwpCqQhoX2wlmJ4F+F91JsNWmhwAHLqLw7WlpWyum7Ae5M8Qdou5mA?=
 =?us-ascii?Q?vWSzRoyUTuG3Aq22PV7tZTAvnudOflv4CXeCH/9IE5g5fy/EWN9EgjLj2OEh?=
 =?us-ascii?Q?1w7paCff5TvT2jLDcRQPAgCJU+Rmx6Wxgcu5FVXIDAz86EEiwXnepv3OhG6o?=
 =?us-ascii?Q?D0VSori7orvsdMl+FxkaJ52AJX1dtvDz1GVvpX7ABC4RAxWMq2DuiSmoQPH0?=
 =?us-ascii?Q?2+ysZFpKBnU3hTCSbf8+Q7/nCVRYOQjfuSnzw6OaBFrs6aSN6QI90c6RlHzK?=
 =?us-ascii?Q?H+L3WjyIZURL5x5HQv4dkzh5+4CsNrB07B9fKlf8wGPSMLms/Hpx0YV5ROV9?=
 =?us-ascii?Q?ElF3ETQEHPjdI+RwjSblNrFTdj1FWZ3xi+UidM85GYMyE6j3u8bTBrqj6yEH?=
 =?us-ascii?Q?iRPe0ccCmvoFEpgCwHj3yEPgL9yKnrWnECYqd7eXYohJY7MkBOQ6bdh1uZip?=
 =?us-ascii?Q?46YFSddlcO3ZbrRixHuPnYA1LeWEbynyXaJXH0QvCkURFas0NVyuVX5WRWDn?=
 =?us-ascii?Q?Ln8gpd2dsXhkLwlrDNOC06uZgKaH1UUBTsI8edq+V4Le5DFBbM38xh4SmJru?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05412322-01ee-4244-3b17-08da97723607
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 23:30:01.6574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnJXnfkGhfSt4UPwtJY6PQFcvbgOxax70S7YdGbhY2Sz7Rw7mck1VBTQPfxbjZoqicV5z+r8+4Sb2o00uKrzd0vS9lVOt1a8uR5hJPP88CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6475
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 03:25:15PM +0300, Jani Nikula wrote:
> On Wed, 14 Sep 2022, Matt Roper <matthew.d.roper@intel.com> wrote:
> > Now that MTL is going to start providing two GTs, there are a few more
> > places in the driver that need to iterate over each GT instead of
> > operating directly on gt0.  Also some more deliberate cleanup is needed,
> > in cases where we fail GT/engine initialization after the first GT has
> > been fully setup.
> 
> Hijacking the thread a bit, not to be considered a blocker for this
> series:
> 
> Is there a plan to kzalloc i915->gt[0] too in intel_gt_probe_all() so we
> wouldn't need to have intel_gt gt0 in struct drm_i915_private? And the
> to_gt() inline would return i915->gt[0] instead of &i915->gt0? (And
> maybe i915_drv.h wouldn't need the definition of intel_gt anymore! :o)

Yeah, in the more medium-term I would like to dynamically allocate gt0
(and probably the primary uncore structure too) so that they don't need
to be embedded into dev_priv.  I'll probably wait until most of the
other MTL stuff has landed and we have some CI machines setup to make
sure it doesn't accidentally break anything before doing that though.


Matt

> 
> BR,
> Jani.
> 
> 
> >
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >
> > Chris Wilson (1):
> >   drm/i915/gt: Cleanup partial engine discovery failures
> >
> > Tvrtko Ursulin (3):
> >   drm/i915: Make GEM resume all engines
> >   drm/i915: Make GEM suspend all GTs
> >   drm/i915: Handle all GTs on driver (un)load paths
> >
> >  drivers/gpu/drm/i915/gem/i915_gem_pm.c    | 33 ++++++++++++++--
> >  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 16 ++++++--
> >  drivers/gpu/drm/i915/i915_driver.c        |  3 +-
> >  drivers/gpu/drm/i915/i915_gem.c           | 46 +++++++++++++++++------
> >  4 files changed, 78 insertions(+), 20 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
