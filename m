Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084545AF464
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C7710EA54;
	Tue,  6 Sep 2022 19:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797D010EA54;
 Tue,  6 Sep 2022 19:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662492436; x=1694028436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NoHBfycTkgZ+1FAO4p62Xt+eicOFR0VPXmSoFnmRwNw=;
 b=RqTtf58HeD5FllCnBOt1fvMbNV+Q0aw+m+JKISGh3q7qL9DVCxjnACI+
 xEf3Uw09xyHo7CFGX3/7oKOrHg2m0utR5EuKcuokhvtIl2DwcP8ezkCAZ
 coAbbUyQ6Pbr1BIvB7Xq1GkciltkZDfYtDlpvuIHUMzTvS1G5YWDhU4U8
 m6mJWads7BsF+EcLVD9JshJK3qv+9zlt+8ja2Sa6X/lNLHyrJf+YpYwuz
 neEts8dT/R2siT4imOFDMHNlguuiJTE+5AKPHl4khV7gpz1fQvP9X4yM8
 HgT20FVc5zPyTjtlrYPn2VW9v9Iu0RQwlDa/hqYu7StagH6dPYqEJBI78 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="297999973"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="297999973"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 12:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="610061426"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 06 Sep 2022 12:27:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 12:27:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 12:27:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 12:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW8iK2tvCmljxZE3dpHE1Td8a777CKeL2briFoK/jSJJpyN1nN8nRLSoawpIAbOcL0iKUfqzb4Fuc6lkRQtH+UCnRs9EQp3sboojxxGyNRucH5XK2aqZZbh/QkhyZnsr2isPorNpimGnNd9U2qXXv9IsqiOR7WyFioA3bnTilKYnd4ILhYqEL8IQoHWl59mFU6tnOD4XiTPxSFancfKwZ0AoeAhwg5SobNLsvxkQ1g2CGqo865dFWi+YZ+ViIdVlQhEF+SEloP4Dcf+t04pCn9+5znnC2l207tCsAyR0aEFROdGIXq7jIxdqFk9b/Troa5nr1J+xaUlQTBtrkMdxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghw3K1hRaXsXwPj0u24TajD9i54pIeHLlxgeCPSsSys=;
 b=GTJYjSWfnzrKFtrI7c63vRJMzxNsEq/OwZL6usPq4iJ5JJ9ahBzO0PupVcP873R398FSK99L+zQIbBjC5utpoIlSvsLhq3WO+efGcmIixXtflzzELX9L4ghtHdJ9GnLH9fVfi82SEoD+MVeLNqyxc48xaKORplJgWWvofU6lierhBWrOmjdyQfveTTDhD/qCv2B4zBMUA6ySZRNL81GqIo66JogRR0gF6pcMXs2lUQzuXh65V/kJ/vjj4MQzGWIDj7fmfeRQnS5C//zLaIoBC5h9ajdpAUoj6dXEonPV9sVeZGvv/6XEnpJmXbJw4nQMI1pkwnaMFuHVWSLJwyoDXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CH2PR11MB4357.namprd11.prod.outlook.com (2603:10b6:610:3d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 19:26:59 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Tue, 6 Sep 2022
 19:26:59 +0000
Date: Tue, 6 Sep 2022 12:26:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/12] drm/i915/uncore: Add GSI offset to
 uncore
Message-ID: <YxefAQR6EN5VT3Ur@mdroper-desk1.amr.corp.intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
 <20220902233257.3088492-10-matthew.d.roper@intel.com>
 <678e32f7-e4e6-3f75-09f9-9d61675cb3ba@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <678e32f7-e4e6-3f75-09f9-9d61675cb3ba@intel.com>
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35e03121-6413-4cbf-a222-08da903dc495
X-MS-TrafficTypeDiagnostic: CH2PR11MB4357:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9iZIzH3SlY8nTPEDpzDQfH/8BQBUx/aDJ0U/b4KRQMxVOWilFmjWaG2pLvvmgyo1LdjBHy5FS0+a92p4QFUWzdJ8P7OtfYWorbYKQedSuEPH6UBCBVVZ5ovHTGPPh/3BdBEyWXCSe4X8ZruSdl95Uei/na+N6P+GfXYefCsk4Vgl80h6BvD0JZpEvTM9GbzC6lij+ezGXCzeyB5PmZGt/kNXVKXJwAOPt/mISVVsD+3NO/Wg/9k8UfB0le94ZeiImylX2uiJyHhIf3pW61XNxOeOQHaUIOVU0lyEbaOdtBb8oBGLlNQN5IW31VVlEDzENXgaWxrkgY+KdKvFzIXWrtD9tVEkuxxPWsnbFtGe+F4n5E236XrkjHSVRBzjSEtiH283Kmso9d2joMNOcEgEO/ldGGF4y7FHFb7Hk0YpjIb0rnDcEJ53zwTheAxmUKgP4+xGSCzsf0Blpr9t9TrMFUMoK+Uu46QSPsuoKksaW+BZMtTyWpHIP5VPoJRxeq6XsT/IAvn+BGcy0jAd2i2QKIPZJBGEKUF1PI2R/HmuSfoN2l6TQRFxN+Qn68GhInD9f2nPpbDdVD+nFTmgF6N0kKlfnweXlSgiAtkH3IV0palCu2wlBB3MGUJd1LfvKj51duzRTF02oF4UDVLSVdeqQxb4dwSjUPwXAb0U89qtt7qVwkLcsOw/So5yq3nQrV7isX9Y4GAhKLqrpaWwhpuj9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(366004)(346002)(376002)(136003)(41300700001)(478600001)(316002)(6636002)(450100002)(82960400001)(186003)(6486002)(83380400001)(38100700002)(53546011)(6506007)(26005)(6512007)(86362001)(5660300002)(8676002)(2906002)(66556008)(66946007)(6862004)(66476007)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UD8LwkqVlgmSFFc3GBUvdYp1aqath77J/Hgh2bi+n9DcgoAdn6UqBudEIr8G?=
 =?us-ascii?Q?uMxXPgPj8S58TkHUc9gaOvlp4wrcl2h2wPpIEnoaq2S5dJ7JljbpQcMy5RkN?=
 =?us-ascii?Q?7MAJMMwqNz2IaNOAnqhqif/oJzKbchp8BJECqBONnUxMAqefObjAPycUxMG4?=
 =?us-ascii?Q?8VF8W5T1384AnRtkQNBLk5+f8jyX2z4REI+xJCf5sI2Nn4256ZYTDLVuAlnx?=
 =?us-ascii?Q?u9lipJ6X5JIOqHq+6hV6zVDW31CccqzjQd6XE3XgnYbSMKSH5txSj2lKNxDD?=
 =?us-ascii?Q?9CosvPSmVzv1JgROlIsgXDdIqdqFh1GNZYCfuaYP66x3hKQXg6F/dBCJmxeM?=
 =?us-ascii?Q?yGwYEfoVf1K1+xqlIXq9sMc7KZzMEWwVX9jWaPm4DqmTF4kjThbiJ05lAkXk?=
 =?us-ascii?Q?PPD1PGoIEK61d4kcmwXZlq89bat7kme3F/pzfYHfkT8sC+anl3IcIZsXsjEe?=
 =?us-ascii?Q?tBit5t6cxtJ6NT92SEhqaZvlDdQVE2dQZcNAElxS4FoAjG9pSu+jql1w/ZoX?=
 =?us-ascii?Q?LTmncbh5NW64K0HJ70j6cVZg5L9/zpM7AwyTLrxaZHgiOT8yMk+TM5RLY1/3?=
 =?us-ascii?Q?bULEa/k4Epde7jnl7L2Bkc6LbXk2TVNTbixjhgwxqHKIJq0Pxc479r3s55Vz?=
 =?us-ascii?Q?DfZW0lRFVZ1d8kTkcQ0Vw2ihF/nUF4yS9RAo6Mr9HQoH1SDxDTHkLmAUkCI1?=
 =?us-ascii?Q?umXYlNB224PmiZOuTEKbpMi3QxEQ1KkjDFhicJ3RJexPuHQw9A4hWLo02JYd?=
 =?us-ascii?Q?7opEbShU9spgFu+EmnptWR2/pHyqUHCzYD28mVUzTZHGosExFsSrezROtpLi?=
 =?us-ascii?Q?ePzyXtWoxG6u+1d1F9np1Wt0JvdFxKqDaKBYKFOAKjePHHR9F9fl2ludxkPi?=
 =?us-ascii?Q?YR7o8PQPzk6xTLQ1nDxCRV8a6Wcvg7qCY1tF36SbPsh8XkF8HFdQFBakMEGP?=
 =?us-ascii?Q?CuS1o0EYRYtjwjNQlpmcMKfv+E9r7lsDvSxTastI5aMqeYaOvIs6/Wf9IqpB?=
 =?us-ascii?Q?4mRPPjuf3rNGdEx1y5VXi2BEUxZ4gmaYZ25Rz8PDJtMlDx29kPK/MWIqJH7c?=
 =?us-ascii?Q?T9sgD5Ls1qic4XA3N8IP0miQgOvYDV8azwtn8ICbLja3MR41/iYCEnxKjFdu?=
 =?us-ascii?Q?pkLhjQE8SoGutpMhmxk15T/o0tcuw5EBBMdFRGRlR+ecsL9Pl6Q0fM+byRPu?=
 =?us-ascii?Q?uxndxsK3G8tzPbXrr7DgfaVy7IxFNQbQDPgdmyGsEaFrDrZ9E3MilHmFqlrM?=
 =?us-ascii?Q?0/Q0EUm9zjk0mJN2zCivOnkd3RtHkClRhLjaAqpNtTuySej0p0QuKPZbiqeY?=
 =?us-ascii?Q?CJ3XezDN5GouSh1XALnCm8XoS+q9cW3d3CHtkEEKWJu2qTEw22YZyi99JDY0?=
 =?us-ascii?Q?AAQcGxj5O0XfKcuw/LrFleH/2kHJFHtvd5zON/7k8N9kAplb6n5EE44pjCcf?=
 =?us-ascii?Q?wPLou2z/73c8arj1+xRtmYuOyT4LRNeDoKKwKwHpoBo/u9NfB5QFhl8WuYwN?=
 =?us-ascii?Q?g/aU+ZufG/pwwT6EpleaLEmYmHAW0c/6uW9C++GLxBBaaNm+utUZOvFyy8Wc?=
 =?us-ascii?Q?eVKN4jOxQOZV2yGB02WNAZ73ujpmYOxfMC1jQdN9d2NQIkGbS6R4iujV6zfd?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e03121-6413-4cbf-a222-08da903dc495
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 19:26:59.3610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdFH3mK7a+9Zc1y3wz9raAYTvtWwPFJcjId1/nnYs0AjOQFV0cmF9zdTWuBFcR103HT3IXeZFSgXqGjljWKVh6NzswGXW6O9BnLilJ0MxeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4357
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

On Tue, Sep 06, 2022 at 04:14:21PM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 03-09-2022 05:02, Matt Roper wrote:
> > GT non-engine registers (referred to as "GSI" registers by the spec)
> > have the same relative offsets on standalone media as they do on the
> > primary GT, just with an additional "GSI offset" added to their MMIO
> > address.  If we store this GSI offset in the standalone media's
> > intel_uncore structure, it can be automatically applied to all GSI reg
> > reads/writes that happen on that GT, allowing us to re-use our existing
> > GT code with minimal changes.
> > 
> > Forcewake and shadowed register tables for the media GT (which will be
> > added in a future patch) are listed as final addresses that already
> > include the GSI offset, so we also need to add the GSI offset before
> > doing lookups of registers in one of those tables.
> > 
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt.c       | 17 ++++++++++++++---
> >  drivers/gpu/drm/i915/intel_device_info.h |  4 +++-
> >  drivers/gpu/drm/i915/intel_uncore.c      | 10 ++++++++--
> >  drivers/gpu/drm/i915/intel_uncore.h      | 22 ++++++++++++++++++++--
> >  4 files changed, 45 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index fbb5e32979a4..a6ed11b933eb 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -776,10 +776,20 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
> >  	}
> >  }
> >  
> > -static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
> > +/*
> > + * Note: the gsi_offset parameter here isn't used, but we want to keep the
> > + * function signature equivalent to gtdef->setup() so that it can be plugged
> > + * in when we enabled remote tiles in the future.
> > + */
> > +static int intel_gt_tile_setup(struct intel_gt *gt,
> > +			       phys_addr_t phys_addr,
> > +			       u32 gsi_offset)
> >  {
> >  	int ret;
> >  
> > +	/* GSI offset is only applicable for media GTs */
> > +	drm_WARN_ON(&gt->i915->drm, gsi_offset);
> > +
> >  	if (!gt_is_root(gt)) {
> >  		struct intel_uncore *uncore;
> >  
> > @@ -832,7 +842,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
> >  	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
> >  
> >  	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
> > -	ret = intel_gt_tile_setup(gt, phys_addr);
> > +	ret = intel_gt_tile_setup(gt, phys_addr, 0);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -865,7 +875,8 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
> >  			goto err;
> >  		}
> >  
> > -		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base);
> > +		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base,
> > +				   gtdef->gsi_offset);
> >  		if (ret)
> >  			goto err;
> >  
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> > index b408ce384cd7..85e0ef0e91b1 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -254,8 +254,10 @@ struct intel_gt_definition {
> >  	enum intel_gt_type type;
> >  	char *name;
> >  	int (*setup)(struct intel_gt *gt,
> > -		     phys_addr_t phys_addr);
> > +		     phys_addr_t phys_addr,
> > +		     u32 gsi_offset);
> >  	u32 mapping_base;
> > +	u32 gsi_offset;
> >  	intel_engine_mask_t engine_mask;
> >  };
> >  
> > diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> > index 33bdcbc77ab2..ecb02421502d 100644
> > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > @@ -927,6 +927,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
> >  {
> >  	const struct intel_forcewake_range *entry;
> >  
> > +	if (IS_GSI_REG(offset))
> > +		offset += uncore->gsi_offset;
> > +
> >  	entry = BSEARCH(offset,
> >  			uncore->fw_domains_table,
> >  			uncore->fw_domains_table_entries,
> > @@ -1142,6 +1145,9 @@ static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
> >  	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
> >  		return false;
> >  
> > +	if (IS_GSI_REG(offset))
> > +		offset += uncore->gsi_offset;
> > +
> >  	return BSEARCH(offset,
> >  		       uncore->shadowed_reg_table,
> >  		       uncore->shadowed_reg_table_entries,
> > @@ -1994,8 +2000,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
> >  
> >  	d->uncore = uncore;
> >  	d->wake_count = 0;
> > -	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set);
> > -	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack);
> > +	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set) + uncore->gsi_offset;
> > +	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack) + uncore->gsi_offset;
> >  
> >  	d->id = domain_id;
> >  
> > diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> > index 4acb78a03233..7f1d7903a8f3 100644
> > --- a/drivers/gpu/drm/i915/intel_uncore.h
> > +++ b/drivers/gpu/drm/i915/intel_uncore.h
> > @@ -136,6 +136,16 @@ struct intel_uncore {
> >  
> >  	spinlock_t lock; /** lock is also taken in irq contexts. */
> >  
> > +	/*
> > +	 * Do we need to apply an additional offset to reach the beginning
> > +	 * of the basic non-engine GT registers (referred to as "GSI" on
> > +	 * newer platforms, or "GT block" on older platforms)?  If so, we'll
> > +	 * track that here and apply it transparently to registers in the
> > +	 * appropriate range to maintain compatibility with our existing
> > +	 * register definitions and GT code.
> > +	 */
> > +	u32 gsi_offset;
> > +
> >  	unsigned int flags;
> >  #define UNCORE_HAS_FORCEWAKE		BIT(0)
> >  #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> > @@ -294,19 +304,27 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
> >  					    2, timeout_ms, NULL);
> >  }
> >  
> > +#define IS_GSI_REG(reg) ((reg) < 0x40000)
> > +
> >  /* register access functions */
> >  #define __raw_read(x__, s__) \
> >  static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
> >  					    i915_reg_t reg) \
> >  { \
> > -	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
> > +	u32 offset = i915_mmio_reg_offset(reg); \
> > +	if (IS_GSI_REG(offset)) \
> > +		offset += uncore->gsi_offset; \
> > +	return read##s__(uncore->regs + offset); \
> >  }
> >  
> >  #define __raw_write(x__, s__) \
> >  static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
> >  					   i915_reg_t reg, u##x__ val) \
> >  { \
> > -	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
> > +	u32 offset = i915_mmio_reg_offset(reg); \
> > +	if (IS_GSI_REG(offset)) \
> > +		offset += uncore->gsi_offset; \
> > +	write##s__(val, uncore->regs + offset); \
> >  }
> >  __raw_read(8, b)
> >  __raw_read(16, w)
> 
> Looks like the gsi_offset shall be added in gen12_emit_flush_xcs for
> aux_inv case as well.

Good catch.  I'll address that in the next version, but I think I'll do
so as a separate patch with a dedicated commit message.


Matt

> 
> Thanks,
> Aravind.

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
