Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84526368F7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 19:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46FA10E5D7;
	Wed, 23 Nov 2022 18:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F59610E226;
 Wed, 23 Nov 2022 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669228458; x=1700764458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j1GePTdNq8Pu2LCywv8gjGleD8cJzww8G7Qebrm4nSA=;
 b=Qd2a7yarwI2yWx8r7l+6u7RbcjTnXNYyLdd7VzeMiGzIMFxEjpx+kVKx
 KTmb/Rzz9cGyOu/V+wS8oVWveySbzJrbHbZ066f3RLT/vES62ZsaOR4v3
 x4mrML4hMl0LOYhia3sr3q6MfHIMYAhHkPRjfbF49e/MjshfhgpJ5R+a+
 HQYjdStrMOs7SL9OxUsnpwcBni11LzByn/nfMx3Nc3rLTK6+IRKSD/ZsN
 gfePIUzZz/FwF2FdAzFYy5GmeKBWdvWeXZJ1PTmqy2gVTYaaUxfj7ZPXa
 zXPxLg/Zb/TBO8uGQKn09ZvdJ5nLO4mEdZpqLUOpwViCCFLIEYmomH1Jm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="311770421"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="311770421"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 10:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="705460277"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="705460277"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2022 10:34:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 10:34:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 23 Nov 2022 10:34:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 23 Nov 2022 10:34:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhhBnfK84pzUXHuuAUwY9UttinEsge+h0Ulnj0LoYEmbk40XeY1FViPITd6nSOsnjRZ/g9Abd3TqNN/ygypol5yt2Kf9OzsF7efeQKTnOa2zuAL3UN4w5M/BI39XYU9bVqJBwXL7f4OpvzvbcJ4/2etQIju1XHAHTkI9QEha9FWH8AdPgOXQ7NPUAO7V0bQYyBYpC91koU3r2j73GQdGgMUEQOLzkRPt7D9W0S1dg+FJ0kw59TqhNUiSqqWxiL8LUtcMNvh/mEsBmHBOxD8D2aV+WsGNCbzygi04ik9cP3xuLYGrvUm9sZk/zodhsZDV49Cu8WmXt+Y0z+nL1Cvcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FLzUot8GEbl6i/8VA9gbgHR692LWFxJgGp3bVKVsAg=;
 b=KnXmNqa27meawMPjNkVFCiKwG2NDzskO5sk6g+ZZGmgNQUtvMDuktM21oWR7FvQ3KeIxC86umOmkIXAchDWHoPrjWjNbxtVO9wgC9j/0jp4xfjp/IIJwpDZFX/lh9GBiYkyzREFSlLU3LKK1NJ4ZVbNpW/FAz9XtqfbSWEFUONZGY06f64UTHg1oRM+WZnDRd9Inu0eXk7RyC/EcKAAxMTr8gC6ugtij3P3E6ZtBss0/22kDvWgJyKdevNJew4JuXr4UuW9RWokJdBY81jUt2GijKCY72pOYrKYCHQThnXNMPQznSShQiaUpwtE9BcfskWrOPng8wrpLn+sI7UppiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 18:34:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Wed, 23 Nov 2022
 18:34:14 +0000
Date: Wed, 23 Nov 2022 13:34:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/6] drm/i915/gsc: Disable GSC engine and
 power well if FW is not selected
Message-ID: <Y35norWsRetkcu9x@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-6-daniele.ceraolospurio@intel.com>
 <Y302hgNHNFN0oElo@intel.com>
 <d5902614-d056-2ccc-67c2-18233dcecb95@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5902614-d056-2ccc-67c2-18233dcecb95@intel.com>
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7aa593-c45a-428b-5099-08dacd815225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWr087MbP1otY32iUoaHWpyS3BPAyi6zzG+Ch4eChzYtuXNPPuZ/teY5iIyf3b/nstyBu+OzWKzCd2dVfizimQzcMI12/h60fpaEwVm3pUeXDcKFV4S+j6TmHgUhclVRCIr20ukFHIdVmfndyLsXX86+bEhS0QkHKpNSRWQ/Pk4nxTcBrsdxiLMvP3U8sAdAaypVO7trhUIlpDwgLXBIyKGyJZpEabfgmQvqFOg+imj/caASfY7X+8bf2kd/07ijh73fNBeY/2tdZyf/hebEvwKbnAq9aXAJpSUEQ19UbqtgRIRVFIH0A5hTtgmL+2v3t8a3MMQHi9m4KZ728pEOCXULQNN98dLd2JHepv28mt2iZYC8/aBwgTZ1fb7R/sX96N034hVUcDptUWPDHiRvSQyeR+z0VnYWjVhf/TWHUnbvmbVG3Q+Z0+b2yAVrdF6ZvOgX1qR3END22AA4082aSJZSCDPrIa4DeGNylbo+qej5knO6q/dVw4yINzRwooN1rhWI2iV1/1QiydiW9wzMohHdUXLhjBVqFXmGnDXYtz9xQdH+4oryohIKRbub0XvzAyVr0m2p5q2xOZkbW9Q8RoYugGRKETw/hgspNI03MOi6Nq/bQCHnGWjEbt3CIaXZTfjaq1j++h6nXKDCWlc4Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(36756003)(83380400001)(86362001)(38100700002)(4326008)(8676002)(8936002)(2906002)(6862004)(82960400001)(37006003)(316002)(450100002)(66476007)(186003)(6636002)(2616005)(6486002)(478600001)(26005)(41300700001)(5660300002)(66946007)(66556008)(44832011)(6506007)(53546011)(6512007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QyEZpb8Bzdm90lT0esHxzPY/OqE3RzBB1YYOoWrrcU/FUsydJirc+2RAs6qq?=
 =?us-ascii?Q?T8tPqnYxuw6g0ttQrxYtRywS37UQ3y38Uz/pEGrL3/qS0G1Fth7UpLDTflPP?=
 =?us-ascii?Q?vPVNAp/fGE7wVlVJO2wAAZS8J8c7yhmb16q7uGnl07MjNzVBmVMgL2H+JShe?=
 =?us-ascii?Q?OFt9MSEVuoa74VN/PFSXs9uRDzvP5awoqhZLNLxUJZ0+pps8rFinCLL+4jEb?=
 =?us-ascii?Q?HWGD6nlnFDIQCXWMN7GrAAx73SzKO7Sme6l+GAlVU9FYzY86K8g937h/TE/B?=
 =?us-ascii?Q?Jmb8kmX55kUiybDf2p254iNF4MrhIsBBu8qyiyOR/CxdlPotF05+/bJRFNWr?=
 =?us-ascii?Q?aj/zSm1jNCgfIUBv7P3ZgkSqmZiM5/ZWhkKouFIkpHA574jqtrzV3tb7FzSc?=
 =?us-ascii?Q?WklRM69QqS9JZYeXyj45rBVX4/oxU22U5I6CmQF8TbrFvr0dgI+zMu/dw70L?=
 =?us-ascii?Q?xIlFvPSAcOQnbEgmwzpM/Ld/J/hlSNBY7JPpp3U6C08B810kt40MNWyJO4jx?=
 =?us-ascii?Q?q9w7kBkNHhnqcS2bLjkjrnSzX06C9NZbuvMwmMgr3BqoD78k5XaImqzc7u9S?=
 =?us-ascii?Q?UdezAITVWkhKZvDljXtjQ/SMgab44h6d9WpGBwnREfaOOgK1hWEJwqfcfA1S?=
 =?us-ascii?Q?u3+3Hzccl32dGwjfWa6PAlAIMBOOAiUbD02wdetK+r8iXgVlCq1W2x7nTZkT?=
 =?us-ascii?Q?pfIpsaIhRyTrUONvwyJIv+Li2g+nFWYQFNSJ4kHwf0/5bRQ4LcMf7KyY5pXP?=
 =?us-ascii?Q?S1DuMiOa/LhlLtB3BpLyV4b1GZy/CgPre0VlkjChMvrB5T/JvUGSb9bs7GlO?=
 =?us-ascii?Q?/SZEaS8nnoeWjiqdq5z/ghqH4Nsewf7nm0OX2DBD7AfTPJV2nf72vVK4yYgm?=
 =?us-ascii?Q?4EivSw5ikgifzzAVS1TcmMvu/0OaE4SDIsMWNmPg9sc1NoMU/7sPIF/ZCAMO?=
 =?us-ascii?Q?JgXDkmgOxcKk3xH3SHD7cUQmcD03BH2D8Uk83m8qvBnI9aKmYHewI/5DnUqh?=
 =?us-ascii?Q?9VFhBEk7UB7oRue2E2GvZboANSsMK4HNcFZVMYh3zK19xZKKAXQQ8zOdlx/r?=
 =?us-ascii?Q?lssr9hX1G7LzQnScsgkRNIvN/lUzHyBUHDNoMvTWUyJQQzCy6GfegdiBtLDx?=
 =?us-ascii?Q?vfl87un+D/GbrIx2Dvhurs0AHyaDVJiUUd9YgaObbfRWDuEZ8QOTxUJ91sAl?=
 =?us-ascii?Q?y154J6rcaV2qLPsAq6Ejsn3F3R5fcCUbRt4JqfkOWM3LzR56CsPDXUL7b93a?=
 =?us-ascii?Q?ks6c2puYo0r4vYvvAo/ZftEoOLFD2lUmJEwqCyat24FwiYsnAj7uTxa99k58?=
 =?us-ascii?Q?z1ejnu4p9/KNn0ZLkXLmnsQogpgyJnKPDpD3fJq/P//36cwoioO41FMH2Iiv?=
 =?us-ascii?Q?YuI7uyqa21SfST6/uYvq09HzLg6MOXAMz9bvzQfm2ShGINLppM2OLaiFh/7Z?=
 =?us-ascii?Q?ce79RjRkUQd6nfHqYGbhpFYVIhQsY1qGUBBdIDk6vWzwKqRvqGadcbpQc9n1?=
 =?us-ascii?Q?3u1g863y7yKroG1ubj1V/cH9XUfSemJ9ZNECh4wBjgexHKhj3nqJhM84RbZa?=
 =?us-ascii?Q?WEonGpSfrWMVdUqDtVr0QIbXlF8nABnA9B0WxfCC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7aa593-c45a-428b-5099-08dacd815225
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 18:34:14.1029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /danfKzOqMb0eT0/IgvYpYwNO51BxbHb+srmd90gTeJ7Jwb1xgW98UqtXBrmAVFQrfiTlbT9cbn5WQoPrRZe+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 02:58:37PM -0800, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 11/22/2022 12:52 PM, Rodrigo Vivi wrote:
> > On Mon, Nov 21, 2022 at 03:16:16PM -0800, Daniele Ceraolo Spurio wrote:
> > > From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > 
> > > The GSC CS is only used for communicating with the GSC FW, so no need to
> > > initialize it if we're not going to use the FW. If we're not using
> > > neither the engine nor the microcontoller, then we can also disable the
> > > power well.
> > > 
> > > IMPORTANT: lack of GSC FW breaks media C6 due to opposing requirements
> > > between CS setup and forcewake idleness. See in-code comment for detail.
> > > 
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: John C Harrison <John.C.Harrison@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 18 ++++++++++++++++++
> > >   drivers/gpu/drm/i915/intel_uncore.c       |  3 +++
> > >   2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > index c33e0d72d670..99c4b866addd 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > @@ -894,6 +894,24 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
> > >   	engine_mask_apply_compute_fuses(gt);
> > >   	engine_mask_apply_copy_fuses(gt);
> > > +	/*
> > > +	 * The only use of the GSC CS is to load and communicate with the GSC
> > > +	 * FW, so we have no use for it if we don't have the FW.
> > > +	 *
> > > +	 * IMPORTANT: in cases where we don't have the GSC FW, we have a
> > > +	 * catch-22 situation that breaks media C6 due to 2 requirements:
> > > +	 * 1) once turned on, the GSC power well will not go to sleep unless the
> > > +	 *    GSC FW is loaded.
> > > +	 * 2) to enable idling (which is required for media C6) we need to
> > > +	 *    initialize the IDLE_MSG register for the GSC CS and do at least 1
> > > +	 *    submission, which will wake up the GSC power well.
> > > +	 */
> > > +	if (__HAS_ENGINE(info->engine_mask, GSC0) && !intel_uc_wants_gsc_uc(&gt->uc)) {
> > > +		drm_notice(&gt->i915->drm,
> > > +			   "No GSC FW selected, disabling GSC CS and media C6\n");
> > > +		info->engine_mask &= ~BIT(GSC0);
> > > +	}
> > > +
> > >   	return info->engine_mask;
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> > > index c1befa33ff59..e63d957b59eb 100644
> > > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > > @@ -2701,6 +2701,9 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
> > >   		if (fw_domains & BIT(domain_id))
> > >   			fw_domain_fini(uncore, domain_id);
> > >   	}
> > > +
> > > +	if ((fw_domains & BIT(FW_DOMAIN_ID_GSC)) && !HAS_ENGINE(gt, GSC0))
> > > +		fw_domain_fini(uncore, FW_DOMAIN_ID_GSC);
> > On a quick glace I was asking "why do you need this since it doesn't have the gsc0?
> > Then I remember that fw_domain got initialized and it will be skipped, right?
> > Then I though about at least have a comment here, but finally I got myself wondering
> > why we don't do this already in the if above, while we are cleaning the engine mask?
> 
> I've followed the existing code flows that we have in place for fused off
> VCS/VECS. Basically the existing code goes like this:
> 
> 1) All FW domains for the platform are initialized
> 2) We read the fuses and adjust the engine mask accordingly
> 3) We go back and prune the FW domains that are not applicable anymore due
> to the updated mask.
> 
> The idea is to have a single gt-level function doing all the mask adjusting
> and an uncore-level one doing all the domain pruning. I'm not against
> changing this approach, but in that case we should update the behavior for
> VCS/VECS as well (which might be complicated, because VCS/VECS engines share
> FW domains, so the pruning logic is ugly).

okay, then let's move with this...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Daniele
> 
> > 
> > >   }
> > >   static void driver_flr(struct intel_uncore *uncore)
> > > -- 
> > > 2.37.3
> > > 
> 
