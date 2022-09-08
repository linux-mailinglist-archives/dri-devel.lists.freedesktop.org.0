Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795285B294D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 00:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193EF10E77A;
	Thu,  8 Sep 2022 22:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84E810E73A;
 Thu,  8 Sep 2022 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662676206; x=1694212206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jbTcW5FEVadcUBLv5VYODQTxRRVTPFrHHTG0ED70Utk=;
 b=ZcTxUKh79nR5VHddyVy7W6M/HiKU8dsbMPqf0oKV24paphDG0KWSGtfa
 KbWilHaNQQ9+OpUpf6lBUDqn/aabR9Scddq/ITqUe0kkXxxZqG7DssgNf
 VKIoWJpyqI6fmey/EEGpWAXIRLk8ueBlxu27yoMhDMPwtD0WO701TFQMQ
 VWozRRjYwJeJNqT5jSItR8H02Gp8Fsfkn2E4m+k98xPM9a7Gi3ssSlZu3
 hMIHOBCpuo+v4yA892b9Yli/V96M/GqH/P4FbyujP9DUwYl5sbV4w0bxL
 4hkZrbCfQEW6s/hsqIi9+7yiuLKXbfhz4sH88TZoQq0dsyW3ttWwdkdvL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294920648"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294920648"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 15:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="617635103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2022 15:30:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 15:30:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 15:30:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 15:30:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 15:30:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev/F8v3dp8IHs4WBMQG3s3EhgNWlQcIwBwIw44ER3UhAwIRxX9Le84u71xZ3POAxWzAFm7Dx5l75lOMuxnAhG4dty46n+i0q/Nn1T+ovxaMjuloYoy5qUFeUXiSpDnOhaDqr59n0L0zBoWD5SSvPRfqd0CD7hNgIYpVM2b+GBN8ezFALqngm1JX638jt2daosC/QjTm/UoLnzObSV2ilKoVyn/v9CyklyzbVQnFEIlYHQb+72z5PamIEUkWHDjAkiYOBSgqVfHLZKoxhfm44yUx0G2W4OXbCjCLNZpp3cXvmjPoiNqaYVzrz+Cq8PeVJXNLlHrLfCcWgf30ihYCFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClUbkLXhiW2m9xn/zcFXvt5wchIZkfHcMZAZfGDQ02A=;
 b=Mrb6CpOgE6nfO/CNTv2LHzzZ/UawjS96pi1rQ0XF+nfmuw7UfSc+PegovbDNFD5yaupAWrtYiNCRoRD4y5KnkFtVex1btkQt29w8eGzhBUWBy+nPyhXin/irq4yf6KPgu4t6Y7svwSWrPWz5hyl/VbrqxJ0iBevbN7RZTFm6c2GnRYmJr1U44poTlUI/Wrjs0qjPwiQYxQjCoMyYzCZSInx3rZ/iD3Yc2uSRNWWp4eXBaTgAbMULgdLSIJSHn3hS/LfN24NUVkDMER0yWr9NwcOTLxr90E4zIbWMFzYIYKyeKA4hz+n8RR3tDqsbMH3E9JBveGbAE9z7TddwZuzi5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BN0PR11MB5760.namprd11.prod.outlook.com (2603:10b6:408:169::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 22:30:02 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 22:30:02 +0000
Date: Thu, 8 Sep 2022 15:29:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 10/14] drm/i915/uncore: Add GSI offset to uncore
Message-ID: <Yxps582Uvwjk43cA@mdroper-desk1.amr.corp.intel.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-11-matthew.d.roper@intel.com>
 <6c731ec3-562d-d983-cec1-408b2334ed11@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c731ec3-562d-d983-cec1-408b2334ed11@intel.com>
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8882a70f-70b4-4ff8-1d87-08da91e9abc2
X-MS-TrafficTypeDiagnostic: BN0PR11MB5760:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHyPOiiw8VXpgGpiGqswpl7z6qJRktiw+j8AciaPuUTV5fvzi/6a0oI8yQwOQzoMw28cdQ7Kcn0oRBQlsV1z1qLyZzp7ATVZz1KDapbWOYUzaERRXg5/Wn0mGieOY9t9D6lwcH4jxBK+qHoGpdZQXL0NRflnY3V+gtvGIwn86EG4opAF5RcSCmZJr93y0wo+0yMNi+taaC7FrUww+j9jaCKwb23QLIFoGqBR26+dBLIxg1zQg8k/1SAiQUr+UyM56cbS4RPv7f502+/1zQp2RnbzZXR2JFZ23SLg0DrkveIozYNIla9k2dT9P9VW7qdZY4CJc0+r8mpMVcQZxnzUcegHT78IcKznjZSyFYpWzBHay5bm3HxNCwD8nq321wI6UyKmfNTy2l7J7aKpw0wRCYU1JnmBnxhAQvfJfJr1h0YDvUAK9vllSON+MJ4zeSqD+f7KDWL7gLsi9HyVj4CX+sASrlsIBew2snYlEzc8hWRnagbtJTZFIjDI5V42YE7Q6PCIxofJqdL4aaO+QKkAr+2GgzOppLgltZPEmaG3/CGAlP7scL89RetUDk4wJfcgEZ73p0H5mTPC/Gt8hLNt0XQstvJnwEspnA3/BXQCqzOg2+GeaSxdOzbr6C+Ei/cjQrLhHHLYYCVcZnjaIoA42x57yXEmezz1OLydxp+ejdpbWk//CB2/2kFenHGERC5iaukGArpr6uF8ZAz92axtZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(396003)(376002)(39860400002)(366004)(6486002)(478600001)(41300700001)(316002)(6636002)(6506007)(186003)(83380400001)(66946007)(66476007)(66556008)(450100002)(4326008)(38100700002)(5660300002)(6512007)(6666004)(53546011)(8676002)(26005)(6862004)(86362001)(82960400001)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d7FcALTyuA/o4WMuMJJ2fNVLLXGnR5u1eIrLDiFZWpu79bPAeOb4xQL0x/aa?=
 =?us-ascii?Q?hewQ8/1/wctw+7y6ZELbGuSlZf7QCD4ZowYznKUriKcNtbYiKis7lkkpajYl?=
 =?us-ascii?Q?A82frXG1ihilivaub3H/PTJo5FHAFeUX9XyPEMmHDM9C+mvQD+T9ib/xEG4K?=
 =?us-ascii?Q?zhbSWaqfvJ4JkwNrzP9QJND9ZEkBPiLbARsmbLnyjbzsMkjBWQzXe3UEiZKq?=
 =?us-ascii?Q?3uMPRGukbgX4EcvM474H8qV8/fmKiKjV1r7brBj8kJj+XvuTzijXSRXo+lFQ?=
 =?us-ascii?Q?bZtarpvCoQrluc2leXULKtX0Ba/Oq2huyJmzu7mhNt13KYf7ttcjj7b/+T5Q?=
 =?us-ascii?Q?QpirmGc8BoA1FTDmU+U/FFpxFmpxM1KkqUmUMJs+Ar4m27bdyartqOfKOkDR?=
 =?us-ascii?Q?e9iCZkcLgak+7i/QgqhGL7aXq3N/61JlekYXO/2aHUngL1/Dqz8I6XknetSf?=
 =?us-ascii?Q?yv+11GVVzT3BzVbYUZ9/LAAne5AVoSLgHV+YWWTzQR1fbz8TwtCHzbLdZZ9J?=
 =?us-ascii?Q?ohvQkdE7jkezC722AalSOyNZLslAEv1XdVSlUs2mGPIm3a8uOVC6X1wuVb7w?=
 =?us-ascii?Q?gClaemOJ8ReVDBKP6Y8H00w139RuJLOlynIZfPP423XI/4QYXdfJds1Bxz5r?=
 =?us-ascii?Q?9N6AEtDkm3t46EjQKcUoXRuBqx89uEiig00xi2tVtQHGboob7xJQuKWNo7hH?=
 =?us-ascii?Q?WrcdNfzGKZDXylmkrO1E3WZucXwZAsdMMn28NktoKMJEUel9cOX2PkrwH5W6?=
 =?us-ascii?Q?clTCHtl1L2JtpBWdZvuw9UjC58q5FvnobX96fFuDG4BT6t5IgQp01wtevI5H?=
 =?us-ascii?Q?lncqnn9DZmeHFnho5U4BXnkwiKoNVheUPvOzQcOjBolCUdyrWXlsyNomGBwJ?=
 =?us-ascii?Q?Mm4G+tcAu6XbTWfa6AbUmqX6HeBJwMMMSAxO8JC7z7H1A2Si5fcy1I1fIQ/Q?=
 =?us-ascii?Q?J9r7v8mfqTorjdJLqDWI5aEFLgyMNg202cSObK8GU7LX4Y9A+jSJIyVpcwK7?=
 =?us-ascii?Q?UMDn7gyedjZOBnVBaMj3+PBVfVvV1yJ/DewIQGC9K+1A7PmN75svWXv8cQ0O?=
 =?us-ascii?Q?Dpy8PkEuaB8lx+Y2v/zA05NoBKB7d84Ld3sjEpso7VHoyxF1R3En2ieFLT8L?=
 =?us-ascii?Q?MVW3vY/bZjuxql2VuaA9CcjixpHX6myhsdi7tS7G4oZI7Pk2pFzOQ5YFgul7?=
 =?us-ascii?Q?EZP0nP72ot/DVsrLZBShL5+e/5LC13X5h0Wq/oJ2D6dE1/EYtLabjimzIs6c?=
 =?us-ascii?Q?4xc/NEEm+DKjtS02BaRGMkzYiKWV0RacM0DPL+kvqYuPXNDPZ3oiuYQKoo7d?=
 =?us-ascii?Q?WJU26gKtcIwjh6ek+iWHT6nTBorcUGMrS9tRP7AEJdF8LKwOtIon3k3J+Jps?=
 =?us-ascii?Q?Wlq5HREsOHxYdw1ddaKvUMCrHYlPjel+hTnOuCC2vyvHLMHYZ7Q9I3zXF/yD?=
 =?us-ascii?Q?VR7cnqK01QjqT017nmxQCbX40G3AKhL3zIV5hAUgP0YIZppsA4oouDD8kat1?=
 =?us-ascii?Q?J/WNhzeTUU/k8fSOxYYQAPOOaf32pCqPUMLWtnMiZgJKmau/t+aWONhSLDN2?=
 =?us-ascii?Q?DkruPTJV635TGbnPm9rUyOrdZz+GljLes3CXgS+JXs++u0VPeOSxLShE70N+?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8882a70f-70b4-4ff8-1d87-08da91e9abc2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 22:30:02.3254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG+2AHfxwlMwWCBvgsnMhFMPrwXHduI0RdWLwPKcQwbiIn8RlsUd+fCFfvqOd5geYShsCvcOTz9CBhkBp2dwG9/G6QGvvOE9N8CqGpPhdu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5760
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

On Thu, Sep 08, 2022 at 02:16:27PM -0700, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 9/6/2022 4:49 PM, Matt Roper wrote:
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
> >   drivers/gpu/drm/i915/gt/intel_gt_types.h |  1 +
> >   drivers/gpu/drm/i915/intel_uncore.c      | 10 ++++++++--
> >   drivers/gpu/drm/i915/intel_uncore.h      | 22 ++++++++++++++++++++--
> >   3 files changed, 29 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > index 0e139f7d75ed..82dc28643572 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > @@ -274,6 +274,7 @@ struct intel_gt_definition {
> >   	enum intel_gt_type type;
> >   	char *name;
> >   	u32 mapping_base;
> > +	u32 gsi_offset;
> >   	intel_engine_mask_t engine_mask;
> >   };
> > diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> > index 452b3a31e965..5cd423c7b646 100644
> > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > @@ -928,6 +928,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
> >   {
> >   	const struct intel_forcewake_range *entry;
> > +	if (IS_GSI_REG(offset))
> > +		offset += uncore->gsi_offset;
> > +
> >   	entry = BSEARCH(offset,
> >   			uncore->fw_domains_table,
> >   			uncore->fw_domains_table_entries,
> > @@ -1143,6 +1146,9 @@ static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
> >   	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
> >   		return false;
> > +	if (IS_GSI_REG(offset))
> > +		offset += uncore->gsi_offset;
> > +
> >   	return BSEARCH(offset,
> >   		       uncore->shadowed_reg_table,
> >   		       uncore->shadowed_reg_table_entries,
> > @@ -1995,8 +2001,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
> >   	d->uncore = uncore;
> >   	d->wake_count = 0;
> > -	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set);
> > -	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack);
> > +	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set) + uncore->gsi_offset;
> > +	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack) + uncore->gsi_offset;
> >   	d->id = domain_id;
> > diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> > index 4acb78a03233..7f1d7903a8f3 100644
> > --- a/drivers/gpu/drm/i915/intel_uncore.h
> > +++ b/drivers/gpu/drm/i915/intel_uncore.h
> > @@ -136,6 +136,16 @@ struct intel_uncore {
> >   	spinlock_t lock; /** lock is also taken in irq contexts. */
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
> >   	unsigned int flags;
> >   #define UNCORE_HAS_FORCEWAKE		BIT(0)
> >   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> > @@ -294,19 +304,27 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
> >   					    2, timeout_ms, NULL);
> >   }
> > +#define IS_GSI_REG(reg) ((reg) < 0x40000)
> > +
> >   /* register access functions */
> >   #define __raw_read(x__, s__) \
> >   static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
> >   					    i915_reg_t reg) \
> >   { \
> > -	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
> > +	u32 offset = i915_mmio_reg_offset(reg); \
> > +	if (IS_GSI_REG(offset)) \
> > +		offset += uncore->gsi_offset; \
> > +	return read##s__(uncore->regs + offset); \
> >   }
> >   #define __raw_write(x__, s__) \
> >   static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
> >   					   i915_reg_t reg, u##x__ val) \
> >   { \
> > -	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
> > +	u32 offset = i915_mmio_reg_offset(reg); \
> > +	if (IS_GSI_REG(offset)) \
> > +		offset += uncore->gsi_offset; \
> > +	write##s__(val, uncore->regs + offset); \
> >   }
> >   __raw_read(8, b)
> >   __raw_read(16, w)
> 
> 
> Do we also need to update the raw_reg_<read/write> macros at the bottom of
> this file? Those seem to currently only be used for irq regs (which are
> outside the GSI range), so not structly required, but if we decide to not
> update them we should at least add a comment.
> 
> I'm also not sure why those macros exist to begin with as they're basically
> equivalent to __raw_uncore_<read/write>32, with the only difference being
> that uncore->regs is de-referenced outside the macro.

Good point; I forgot those existed.  According to git history, the original
justification when they were introduced was that the compiler wasn't caching
uncore->regs inside a register, so it resulted in unnecessary extra load
instructions in the interrupt handlers.  I'm not sure how important that
micro-optimization is, but I replaced them all as an experiment to see if the
claim still holds true with recent compilers and it seems it does:

	$ ./scripts/bloat-o-meter i915.ko.{orig,new}
	add/remove: 0/0 grow/shrink: 8/3 up/down: 275/-121 (154)
	Function                                     old     new   delta
	gen11_gt_engine_identity                     210     280     +70
	dg1_irq_handler                              279     329     +50
	gen11_irq_handler                            208     247     +39
	gen8_gt_irq_handler                          363     392     +29
	intel_irq_reset                             1225    1252     +27
	gen11_gt_reset_one_iir                       143     170     +27
	gen8_irq_handler                             166     185     +19
	gen11_display_irq_handler                     69      83     +14
	ilk_irq_handler.cold                          72      63      -9
	gen11_gt_irq_handler                         756     736     -20
	ilk_irq_handler                             2663    2571     -92
	Total: Before=2481127, After=2481281, chg +0.01%

So given that these macros are only used in places where we don't expect
to be operating on GSI registers, and the goal was to avoid unnecessary
instructions, I think adding a comment is probably the way to go.  If
there's ever a need to use these on GSI registers in the future, then it
will be the caller's responsibility to take care of adding the GSI
offset to the 'base' parameter.

I'll send an updated version that includes a comment.


Matt

> 
> Daniele
> 
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
