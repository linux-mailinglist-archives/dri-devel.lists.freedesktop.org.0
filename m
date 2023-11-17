Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE027EF7EF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B22D10E76A;
	Fri, 17 Nov 2023 19:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E0010E08F;
 Fri, 17 Nov 2023 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700250029; x=1731786029;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wG4sw5Zu49yQ87O/h4oAlroF0Rcua8z7A7xZc0avV5Y=;
 b=iGpQOlqmZJBGAtQnFsUuRm8nq9Xx3FzkBJi09f89RJQBkC/fL53GpW/W
 sgKJjpJXBYD2pddMw4W7pBWJVCOTLl1bzkyzEB7QrSNNHal704Vhnkr3A
 VJAm5tdHv6wbZ/4PPE9Ykr2ilFCIu5alX6UefdtfE7cu7bse8lP0/wIET
 qing/ebPF7rgnaOPFiFHx6yxK5QyHHrXijsotNQfzf8X1K3qZ8YDrEliA
 OzMPNGcMt+hkEPGEG7BN4+MNCOM+Cc6IUzh95vGWRjY6PetyICl9qwiNe
 2HPzrbITO3T0WdsLxfQaTUxQgdNtbxLOTrvtbR8kJ9S16DwrZjmFcuo7Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4442723"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4442723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 11:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939236842"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="939236842"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 11:40:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 11:40:25 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 11:40:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 11:40:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 11:40:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASms0yI8ntkbQti2kZETuHO3zVfHEzWjlGpIpM2w5vN7kI2yBC8BdIh8QMuWW6uRbg7xQCidPX+Wfp16jRQVS+EKAnEh0lQe2mUASE3MK/xiDru01hld/FOWf6YwBw9rBzg+5CR30hvlPM2AZnCTksYKU6lxicMKOlwRqKwj/qZayPYeWBJzPRoZokuTqwQEo6Dy4WK4iqDrrRXEDzHgPqJOU4I6REijODR8M0ofeUdQwYVRbhSuGM78gALx/+BsTqpiyA0u2+zhRAgcKVq/vlW0+WRWJ0T7B5J1rThkeGZilqsTBjxcK5+GWRQfrxLVb4NLpvZtvtmIjqKIiVK+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvEe1o4rUV9ZVFAOySdZPMh5SvPVp0MackEya/n3Bsc=;
 b=Y2/bxX86Y6IeIeGAr7a3VDXgkP1E3At43LgMqr14rBUR5RLYCsOeHPQ4l0iXbdhmQMvpiLSHfcxYekyjkB9kNvYMZAKYW96/KpnKh0oQxvGjYjyJkF4T8qfsqekrIFxxTrPLajwEwde+u8dI+tMOJ22V/Nx+MltOtqNRdM3Gx4JfNQUG7NjH1WGjzP5RnhfaQh5RxBYUZ3u95wqRn+ZyUFK/ynYF0adocEM6BWFSZlSnlaO7fNYPgh7TMahPmFou8ws0OdUzMdHc6yO4wdJtgN5gK2y3SEst+Crzg46eiIshCv0brMTEDcZbRJfUBhTsRhEt4kclWKopKxO5CSrvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 19:40:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 19:40:22 +0000
Date: Fri, 17 Nov 2023 14:40:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 02/11] drm/dp_mst: Fix PBN divider
 calculation for UHBR rates
Message-ID: <ZVfBorwAcQ5UFmwG@intel.com>
References: <20231116131841.1588781-3-imre.deak@intel.com>
 <20231117150929.1767227-1-imre.deak@intel.com>
 <ZVeS88sx9U35ITPh@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVeS88sx9U35ITPh@intel.com>
X-ClientProxiedBy: BYAPR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: e788ea92-24fa-4be4-64ed-08dbe7a5098e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MhKgYNqWs1nNi5ysNc6ZxYVWe5Z5xyaH0ziG6qgGBZdoGwrh/bUrtRtf+KFV4VZI6JA3aNH2tSt2AqdMy/nDIV6pQcuPPSn6wRgl5en7ZyZoqCurn3fIPt4JevOVNVE5terpap6/oOxqMNwhVlQpq6vgEc2m07FwwwK+Afqvwql7x0jfMV7Re5C6FIrg8vuKIS1Gtmgq/hNw1fUuT3ysTOtz5LHHb9vy4Zk6KBVF2LXJCH+4cSqiE5oba0oiz/e38jFUTYsfKW5CMisC/fMPhMuZZmUW+n9v+mfNzX/FWPhAraaIi21vyyPQgto7xWayVxbCF02Btot3chz8kgf6yqFT+mXJyKvE/NaZkye+jbLskwisepgulSLgx53nSpw1w2klBWBx2qVPhM7P2rHmPzMJY/8akVKX6Y2x4fvOADycC9Yzb7qNJBqDVl/LZfUY/2V1v5AU7aVUZOPwlSnmJFVcY0r/FHu4WDp+QKmxfEhTriYZvkdS2Pv13VNrqsPFA852B7nrRqnHYd6LTQwOgRuh6QLtIKNJiki7MNW4jsI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(83380400001)(36756003)(6512007)(6506007)(26005)(2616005)(82960400001)(6666004)(478600001)(6486002)(966005)(5660300002)(86362001)(66476007)(41300700001)(66946007)(110136005)(66556008)(316002)(8936002)(4326008)(8676002)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JMC1iObRAi2XYBUONDBekE68IvHDFW4HkZrzPZpn4Ysz6M/QssdFDVwMfJ?=
 =?iso-8859-1?Q?KItQYO8l/8VBe7idFNnIjuQ6+2BrW0XKE+fHqq9GTruSXXMqmVbNU8CiYA?=
 =?iso-8859-1?Q?Y3gIx8UeiyLkztY3467i2ZNXBYpLrsXZqDWjNTW0Nqpjpsr4WGYnKUvn8O?=
 =?iso-8859-1?Q?lYYy9T36PxGBK9eBE0Nn+8jQkpB+l3GWfs71H5vbkUEoQ1BORD19pFft8J?=
 =?iso-8859-1?Q?8hYPZh63sGhYE+TVmWe8WPU/am0txdy/HhOT0zAB9rp4GQuoGjx0JoBbQH?=
 =?iso-8859-1?Q?1OyhHy3CR/EWAtivc4TC67eZYWjSMXiE73Ft7l1KFDetpj/E3I7B6s6eCO?=
 =?iso-8859-1?Q?mxXlZeY+N+Zod1zG5F7LGTbyCqHmIo+kB+ORlh4HFj/b4YrEU1rn8soNfm?=
 =?iso-8859-1?Q?wv738uJHgm/GpVSEBpcYyGn7j8BiKo84aSIUrfal2didJ61kM+6UzK/L2l?=
 =?iso-8859-1?Q?TGOqNHGyY3rEWXN/HSUfDo3Jmjq/oA+vOesbo5mG0OJlm6KnWtbYrBqmph?=
 =?iso-8859-1?Q?nKnuYQHUOdFaFABNsprKJQMjkJoXtH8zSv01wl4LKVsF2CiXe8RI2ZxaQN?=
 =?iso-8859-1?Q?x6XrwDsUjguFktpXRHNAysV+rYXjuO4CLat21e0so3v/DvgRgWopw32Sax?=
 =?iso-8859-1?Q?WQvy9wm1KVKKZDGv/waoBWK9clLngHR9QzETtCjB4+5SohlMgQnlFYtLsn?=
 =?iso-8859-1?Q?jQ5hc6/pIT8pLA/+hv46SPKvOVNyjg02NH/g0B4GR0nP4YZvKWJl0KTFLy?=
 =?iso-8859-1?Q?KQalLejPGTdg6WP2Tk4jxYacpH5tmtGnSS3O+kV8fefBn0Em19hrj5hhmo?=
 =?iso-8859-1?Q?EufVPHQzT5lo+dQ5916dSBVWNbxoqsOPjVpkkxiMeU/fWChqafIFPODicA?=
 =?iso-8859-1?Q?sMol19c8hVqzABrHBYkF8mX6Ug9BdpGshoZ6gC9x6Mp9Jx7U7eFfu6NBT2?=
 =?iso-8859-1?Q?lvQeDpw/v3fSxpnipo8gttw5w50mGH9MDPTzkgPckCHEakaW5O4S6CRt9B?=
 =?iso-8859-1?Q?fO6gzbswSsAYKqbZ9qsIcOp1fzPpfhWNF7IbPpuDFWHPpU2dS7QRlchIKS?=
 =?iso-8859-1?Q?1TpaDHcA8b4Hbh3foHOkLU65poSIYcxr5D/nuKmZAkdRR2UfMkh0mmnNDV?=
 =?iso-8859-1?Q?9DqkqVfdMpES/b9gN8J+UJdLMs/BuljXSNxWSUJ7YL+gSHvHb7Ww+Y7m33?=
 =?iso-8859-1?Q?BpZMrUMAshI6KvQ2dd5j+fMEI5vLRWDlTHsPeHR1XoRIUprlIEjCRyQ4Ai?=
 =?iso-8859-1?Q?j4Jk9Q2UMOb2VO/DCWCGXYG9N0K3mFiXqcAoUQ87hYmzWBg8fUQkdp+Pbz?=
 =?iso-8859-1?Q?Fs8HdhAVGa+VsYnXu8T/YNBpgyPslVPXqowYnr9xkprO8Lt3xTRPjrTqoZ?=
 =?iso-8859-1?Q?IFupw7Hk466oIR2XfQPQIRUHYecrBn+IiKiRYqCbDA/qGATrPPoBrKMpWi?=
 =?iso-8859-1?Q?d8zOZSEA5yF0+i0KkzTFYlvrBSuHeYGzQhYqtoefNYHYnsdyhQ9t0eGmsP?=
 =?iso-8859-1?Q?I81IK6HK6qIMbBnPZAETmegDxcotvSi36FiFjv63TNkAix+ire+s4mX0Mb?=
 =?iso-8859-1?Q?OGC5cK3qLBWNEu9jTO4EokEdMPTIYTOsQI3fhXLNiBWQlrh1/57IOhZita?=
 =?iso-8859-1?Q?kuHyRdSL2MHSTwHjC8ftEOhiEnOcNZPcQ3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e788ea92-24fa-4be4-64ed-08dbe7a5098e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 19:40:22.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KySVPOHx4UHTCWoxKPIc0sgGEidkKV49yS3hzOdCU/C4KaJDnBsG3yfuPG+Di76tbXfZXC9TSEdIf59EGH1MOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
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

On Fri, Nov 17, 2023 at 06:21:07PM +0200, Ville Syrjälä wrote:
> On Fri, Nov 17, 2023 at 05:09:27PM +0200, Imre Deak wrote:
> > The current way of calculating the pbn_div value, the link BW per each
> > MTP slot, worked only for DP 1.4 link rates. Fix things up for UHBR
> > rates calculating with the correct channel coding efficiency based on
> > the link rate.
> > 
> > v2:
> > - Return the fractional pbn_div value from drm_dp_get_vc_payload_bw().
> > v3:
> > - Fix rounding up quotient while calculating req_slots. (Ville)
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> 
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Dave, Sima, it looks like this whole series is ready for getting merged:

https://patchwork.freedesktop.org/series/126526/

But it has these 3 drm/dp_mst here.
Ack to merge them through drm-intel?

> 
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 10 +++++++---
> >  include/drm/display/drm_dp_helper.h           | 13 +++++++++++++
> >  2 files changed, 20 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 000d05e80352a..8ca01a6bf645d 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3585,14 +3585,18 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
> >  fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
> >  				    int link_rate, int link_lane_count)
> >  {
> > +	int ch_coding_efficiency =
> > +		drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(link_rate));
> >  	fixed20_12 ret;
> >  
> >  	if (link_rate == 0 || link_lane_count == 0)
> >  		drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
> >  			    link_rate, link_lane_count);
> >  
> > -	/* See DP v2.0 2.6.4.2, VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
> > -	ret.full = dfixed_const(link_rate * link_lane_count / 54000);
> > +	/* See DP v2.0 2.6.4.2, 2.7.6.3 VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
> > +	ret.full = DIV_ROUND_DOWN_ULL(mul_u32_u32(link_rate * link_lane_count,
> > +						  ch_coding_efficiency),
> > +				      (1000000ULL * 8 * 5400) >> 12);
> >  
> >  	return ret;
> >  }
> > @@ -4342,7 +4346,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
> >  		}
> >  	}
> >  
> > -	req_slots = DIV_ROUND_UP(pbn, dfixed_trunc(topology_state->pbn_div));
> > +	req_slots = DIV_ROUND_UP(dfixed_const(pbn), topology_state->pbn_div.full);
> >  
> >  	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] TU %d -> %d\n",
> >  		       port->connector->base.id, port->connector->name,
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index c5f1079acb3b1..863b2e7add29e 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -252,6 +252,19 @@ drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
> >  	return !!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP);
> >  }
> >  
> > +/**
> > + * drm_dp_is_uhbr_rate - Determine if a link rate is UHBR
> > + * @link_rate: link rate in 10kbits/s units
> > + *
> > + * Determine if the provided link rate is an UHBR rate.
> > + *
> > + * Returns: %True if @link_rate is an UHBR rate.
> > + */
> > +static inline bool drm_dp_is_uhbr_rate(int link_rate)
> > +{
> > +	return link_rate >= 1000000;
> > +}
> > +
> >  /*
> >   * DisplayPort AUX channel
> >   */
> > -- 
> > 2.39.2
> 
> -- 
> Ville Syrjälä
> Intel
