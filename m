Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5462FFE4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 23:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C9C10E7E3;
	Fri, 18 Nov 2022 22:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2B10E7E1;
 Fri, 18 Nov 2022 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668809757; x=1700345757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m/FVZPqDWr18x8uXt/l2Yd5+5eYNvRSl9dsxwpRoOU0=;
 b=D9RsQpiDF0zylnv8eYCHdI3j6JvhDAiQF8P0sQnqOKHDhUx1eCtrzGle
 62WoGCHp0UpSvCrWU3/r5VnV+fCWIvC0Ar5LL30lAE2JUD3XEjXiyWwXU
 URfEswqBAu8lxNMiq+8Z5t1jPwkDHfc5Dmu/lnBAr2X0j+QWh2UzMopi4
 zUjwaxg+L0CTX9FLFXOb0x91jddPCRLl2ZUfOWsDFFLc88qKeJoOwlgKu
 jxtV/wI9577wHeCWeWHg5sjF8I5v/1Hn02c372Srgt7MwTUuXnxkG733g
 4XPWRy5Vf9yVtYgMzP3ETKhPulzW1uSU33QwVKJt1XcTO5Ad2abJQ61Zm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="293635995"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="293635995"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 14:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="642673338"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="642673338"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 18 Nov 2022 14:15:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 14:15:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 14:15:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 14:15:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 14:15:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQo/0DTjUS7dwOvLfiINgjbjNQf7NGPYcXt8imNp/gKpuZS5HghUbQWeWV05L/7VWq7yNwC2pZEfIhfOYUedaYuJ8LxXU3G2PrcDZ8BFOC62j+cRMyfKU1v6U3XUPHmUgnZKtdxGHykEBen5IKsPoijHIIb26+3n9XoV1jyLl4oVp2jGeUiOsqNMadA1EDEg0vuQ3qb/bRJ0Cc5wdDtQAaO4XVj9LX1JcJSROJioIJEpZTxH5svhdRo/tIlp6QdH0L7ZF/CTgJ68hQRBJWkCYOH0C3IOza3Q5KzcO6oL46Oaw8ia3GoVq1SBdRtmAFe3cEuzXg7IxUZfq0Yukqd7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUk3OXW2yyLlUSbqVNWNzIUUg7H3iUJtyN6xyBgfJD8=;
 b=kG2plG2KIh9y0mk7jvTI+sJ89iP5wFxjYrIJ5CWseUotBD3K3I30/yT3qCBsNdsLP8v1BGcYWvNDMzdDhIi6b70kbfIU25sdtV4W/6xtEA/QSwt5O9eFZsZlLdZnTZZZAmn5YkcUhINgHFpEjp3JKOm2zyfIyhy1DhVhPEuHhoSuWtT/OrHuNZ2oZwN3g/E45JeiL3lYougt5JbKcQrx2X7DQ42MMnwHMXeQUfG67Hw7RDpbseSVtRjaM09PNPb0Er9SJMgj79SrlizRaXVPCNXQUkmEBAWhL2KcSc+0RvRgPV8ZAdZSMrs8I6xibzx2/nQnQ+WoqZkkDYYjvYXJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 22:15:54 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 22:15:54 +0000
Date: Fri, 18 Nov 2022 14:15:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Manage uncore->lock while
 waiting on MCR register
Message-ID: <Y3gEFg09mw8X7tBR@mdroper-desk1.amr.corp.intel.com>
References: <20221117173358.1980230-1-matthew.d.roper@intel.com>
 <20221118212045.ayn2d2vgd4l5uzvw@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221118212045.ayn2d2vgd4l5uzvw@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: f72c483e-46dc-40f9-de51-08dac9b274e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uB2iZ0G5NeEkgTWYdUkny9u6OB1N2GPV6t69Xd8y5lkEE+pjCvaVKC63ZdKt7TfvXarHFNbI6Z2k/ZxF9jESXdPYkYXGKxrxpoUWVZqjTrtyEdvyZU2YudxkLcQPCD8F88fgr4rX2thvQFr0ax7XQiD3JP3FZjJBWH8iTHwk2LQ8dU0Bwh1jhdWqVC83aA3DHLO2SxeMJvhPzuAvk8gvFg6DExgtXED8HWu5LtZ0Ok5SqGW7/PKZrgXag8dE/TmEmpPo6uUmVFJGGlbdVTbbGkp5w3RllYnhN5AHo1Pzi/zzj+2u+BFtX8+Wz5MJ0Lnto4ZErQEaysWWxAOzb9+tAQhLxDgSNGyZOjp2fDWNU+elfo8StKnDcKV8NhRmQZsuLCYMxxH3jFBSCwFrjviz7bmYnA9ciLI0pnIWW0WiAucxuWyJQV8g+ZSluSMHTJuXUyQrFhlQgNiCOZEihEzgMhRbDLeFDXfFnFeHq5GJp/OulCHiDn0hQOVA2QmIipswf+1E492XoKO4GZi3a0u3N1Mv4b2PKp9q7ua63tACBWD2xXeBrJyRgYryRYUXlFvRYu9c8T9HF5AU4oz2mku1OCh8vEkPYfLW61ALqjNgF14Pt4DTDIJ9KT8a4SpDpr7Bdlylf2RYEU/alJ6t0Rk2lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(38100700002)(82960400001)(86362001)(6512007)(6666004)(450100002)(66946007)(26005)(6636002)(6506007)(316002)(478600001)(2906002)(5660300002)(83380400001)(186003)(41300700001)(8676002)(66476007)(6486002)(66556008)(4326008)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ceQxqR9fOirIjF3fh76SaTZARz+aO5H4HSLayuVMwgUa3zJ4OCoSXIm2HVy?=
 =?us-ascii?Q?3wx3hGyyLm14Esx/ZZPJ0MEhtmm6kpGvWb2iDV2Ry6NDJPhx+RU2FRQG99ZQ?=
 =?us-ascii?Q?kt4lh3AijNJtVAv0wY2MK1oJMG0EdYjot2DYkEaXvb4oQDVwYRrzg3vt+Wxv?=
 =?us-ascii?Q?BDP2c8YE9igboqBND/nTbETp2XmyzqtRCv3qYYO0CDnHovFK0bMbFZiRrHTt?=
 =?us-ascii?Q?HvTVIH/yyDRGEr6fO+7G/kL+jMCygI7OT8FHUR1rQBDZRUm2NagyBX1uhXSt?=
 =?us-ascii?Q?k4tPUlLPEBSEXbRJY7ky2Rgu/ooGfnMFNj7E0BSOP0j5zIPcsO2V69dZN5D/?=
 =?us-ascii?Q?1/B/kTWvM5nEql51MUU0hwK9SElnT7YhXpqm5BZpXKt1pwFB2A+MFdd6izJc?=
 =?us-ascii?Q?ekigsx9WE6vpV6L+pi6scgw00VCyU8mCAG5Mm3GGEMB8y++O+QIByAlyedqs?=
 =?us-ascii?Q?zPqC2uc6n6CALy44pSiQVhXeEDuft1wpdXMjIfCAAgB8yy20q2Hj3g3dBYBQ?=
 =?us-ascii?Q?4KYVPLFv7emSWn/tQYp215ZdzsnWmZHBq8Ku1Ek9zJuoEqRxz++emc1KexSv?=
 =?us-ascii?Q?TfPHOlxBP22tG6GI1RSo8BDW2SbQE1aYcr59pKtM/IjJwcr5vphUCiiA4nE9?=
 =?us-ascii?Q?O2bkELqovgwt9n4RZgez0oJys0Z/SUb3iXqcVX+btxpdKOb7qw59XNxUW1Vq?=
 =?us-ascii?Q?oEm7WZRxATSxPHlozFvyVZPeiObMey1RdX9hjBsAJvCBaCOzRM9andIYiKcb?=
 =?us-ascii?Q?LZ2R93jeL8372bVXJ4bksvLpyXKZOWYV9BF1Rf97yPp3cXRRdLSuTV9rMB0I?=
 =?us-ascii?Q?Viyq9H8TT/BEc+WH7sa6LUvo8/2R3Z0wAnkB4xUZMlw2+uooe2LQ6GoD7JyG?=
 =?us-ascii?Q?yb8k5SIXs6EkIUZTdCMqraBOoxpgSlS/PNvdcE69+l7Kd6BwDImaArTTCuzf?=
 =?us-ascii?Q?muY/3WLhGKQZwzkuwQgJNJ+6z0st4t45Xqkf6JXUKlBYjcgIeu0IWmkmYeb/?=
 =?us-ascii?Q?AVuMWQhGuM1CnAaSAASVGA/b/ZoYZ/Aztzm2lH+Iw0e97YLnYu95Nw3VHzgx?=
 =?us-ascii?Q?h8xRC4rpJndVLfgaZNpqH5Rd6pePwjWt8k+qYwzFlczGVwl4bnvTU0qQc9cI?=
 =?us-ascii?Q?7dgkeIfC3U4Tzeekax20jfVPzNBlKJY8nla9DTTCp0q9NO06GNQSWEtv9CEx?=
 =?us-ascii?Q?dC4xoxgfZjo310745hmVJYTXaQzoBEkq4kLRjFc2YOqHgTgd5G7UcTYYZ4pM?=
 =?us-ascii?Q?lfV/IeYOzYLS8ZKvNCNhUDyZ8qiyvzURNe/dCmKyhMFgDhPIgb5fWYeU/Kj/?=
 =?us-ascii?Q?8W+VSTIM1iUih1INk29IKzBjtR9/R/fjYlgaiiKz4tngcyqSdOLKXgX6FnQu?=
 =?us-ascii?Q?PSRdQuCgHTnrqxaYiYWfIAFiduCtytpnzJshLhD1ErtjrGkLHOYbreE+Rpci?=
 =?us-ascii?Q?DL9Xnl7yHy8ZyjBLpnralUZs87UJfI2Xb8vdsz5QaMGuCQ7agh/my/jTQdH2?=
 =?us-ascii?Q?r2EKeridLwlKWnO4qwCjnnaEytphqJ0jKAKd8D0onc+mET5ovFDOrVR9unPR?=
 =?us-ascii?Q?/0C9eq9VHo8zlk28FmHGDLA908rxEMPQ4Ts9uGrENK/Uqb2d/pMylZCE/d+f?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f72c483e-46dc-40f9-de51-08dac9b274e3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 22:15:54.7703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AcltPgEtnWeH+y6wSiLOIoE2SCEfznViJkAZbMVQFEYUn8sEhOFoQrBbyMCeyO63v3zvUJVTKK4bgImNvQd/mqag+QrWUPZyCKheC3nyGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
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

On Fri, Nov 18, 2022 at 01:20:45PM -0800, Lucas De Marchi wrote:
> On Thu, Nov 17, 2022 at 09:33:58AM -0800, Matt Roper wrote:
> > The GT MCR code currently relies on uncore->lock to avoid race
> > conditions on the steering control register during MCR operations.  The
> > *_fw() versions of MCR operations expect the caller to already hold
> > uncore->lock, while the non-fw variants manage the lock internally.
> > However the sole callsite of intel_gt_mcr_wait_for_reg_fw() does not
> > currently obtain the forcewake lock, allowing a potential race condition
> > (and triggering an assertion on lockdep builds).  Furthermore, since
> > 'wait for register value' requests may not return immediately, it is
> > undesirable to hold a fundamental lock like uncore->lock for the entire
> > wait and block all other MMIO for the duration; rather the lock is only
> > needed around the MCR read operations and can be released during the
> > delays.
> > 
> > Convert intel_gt_mcr_wait_for_reg_fw() to a non-fw variant that will
> > manage uncore->lock internally.  This does have the side effect of
> > causing an unnecessary lookup in the forcewake table on each read
> > operation, but since the caller is still holding the relevant forcewake
> > domain, this will ultimately just incremenent the reference count and
> > won't actually cause any additional MMIO traffic.
> > 
> > In the future we plan to switch to a dedicated MCR lock to protect the
> > steering critical section rather than using the overloaded and
> > high-traffic uncore->lock; on MTL and beyond the new lock can be
> > implemented on top of the hardware-provided synchonization mechanism for
> > steering.
> > 
> > Fixes: 3068bec83eea ("drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()")
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Applied to drm-intel-gt-next.  Thanks for the review.


Matt

> 
> thanks
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
