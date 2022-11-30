Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461E563D9BF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4FA10E48D;
	Wed, 30 Nov 2022 15:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2261210E48D;
 Wed, 30 Nov 2022 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669823135; x=1701359135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PwrgPROzGjshqOgycyoHpWQvs5KynMXrPT0T2YBMWgo=;
 b=Ome57uPzO2Y6FQ37VMIylMk/LV0H8umTaziZj1BucRPGG7nIoFbyr1mF
 CWCR8LOXNbRYPsQp5aKGF2XmokPRbEr9vH/+rgXj0JAd+nTVoWMOIjuTC
 NcuRDwQQQak5sSHeBRmtg4gFJdOMvPCn9ksgCXJPbv1kf0yTLwWFgB/Ei
 8ZydXMmD6SY/5+c28pU9p3Hc80XRN3zwnN4ygBAj5JulU0FK614BgbHaY
 ZHHumsfnNOom+Jvue0FHlvzI+AQJv0kpKtjE82yNnq7ncBjJuHFQ0q4LL
 GC6QLzlAFEwcR0fz0T1kM03qsFpMUXENK/Li0OTVYhj8zAnwpmJbpWoKM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="314122531"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="314122531"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 07:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="733027421"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="733027421"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2022 07:45:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 07:45:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 07:45:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 07:45:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFxrbTmVZKMbetRdlYtrjjlTvOwGC6n5WrSZ6Ex/Bp998+8AznuCMAHnNYYoBzPkQOWlSVdz/lZTzNZlJwdRxvatkXnAWOWFwadi3bWl7p8HbE8ZyTf3xFzNyu/5TydtEQOcm2J/dHZxiHyYdPGXCJr0LFMwlLBYSlsiqTIyiQ+15aZkzUY/L9L6UtG3DQclbgl7utQtyzR1J3XJpg5R7nvdxu3jUYuVVkzL1SKmIWiDAf/cDcD/tpyfzfRnV1ZnjCDD+2HXxUfxyAi2FJEwkPFPNwDsCtHDos/CgGiKuF5WKmaIHzGlPtIiV4K0w8jnI/dWxoY6YW8EPEwOcD3Xag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhrneQTw4QVJZmoum0WQWVe6UaHEHEUWn0RkaYBxY+M=;
 b=ilzGCIo4OeR2FwT5KGzem7EA9wdlKEcRBDmQdUzBIJz0I7SochXKphKa1EYiBT51zIboFaN4ZuN5wCwQrVzkPdv9QXMj1HJB74m/rr0TnRFn7QvMl+57clMZT46cWGW25JHALgE1bmqoCD+k4VxjBEgFPF7JWgR09QSq06s88+5y2hc/9csRzNCkLMaHw//UWkru5fpf2cFQzk1D3nVRzRWPDLHhQ422sEI5DNyLc4+7MK/jS78VUMVKug9aAUNuZfC1Ycd05PgtTFyIqiiTShr6I5SoROc3hxJjrRMYzcBp1c0ACVO6jRovcrtouOiE5geQDiXOlVN8Qv35TL7FRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 15:45:31 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb%3]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 15:45:31 +0000
Date: Wed, 30 Nov 2022 21:15:21 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/5] drm/i915/gt: Add dedicated MCR lock
Message-ID: <Y4d6kYEPxEyaa787@bala-ubuntu>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221128233014.4000136-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::14) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 60df0d3a-27ea-426d-a6ba-08dad2e9e951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzkQdrD0/nUL9GCa5QdOtf2Lsm/0XPBB6fSfIVWEDzQMGmrJd20wmjrwthcqrZVYOgfxL2y4MCwR1wYdxD8yhe7QtwuZE62OQ60w28fbvxTVz2yw7EizC1WFh+t+r8RqGh46GRNtmDaJA0tNvj7jxofSHOsD76hYiphz55U4jqc1mYcV5RumDfzuSdrcxIE8ckn42F1kOoyNpIgowEMGdbI8/6cfi+2csgRuUL003U1dfhfZQkX4J/SzVwIcmDy2y5135Wd+Dj+pPFA98QDCZZ2UQZrgzjev0wziGRI2DhNmBkdgy7OHsjnoBgfZl8W7wJhM0yIbzPAQ4ZZIKVy/uDiyFTaeiW/oFW/Y3y8ugj/DSvck1Xzfj+cI7ilI6o1De8iddfkGkB5F7pMxOfKHtH3UxIgrDc/WHShb+SFmKl6H5/jYsooYMloQC9T9TEfap9F3Spz8YdRwr/viByav6x/yv/eOChuJwF3RnRNHNAClpH1uGlSUMsINUkR0oN6asl6sTrKjy9rofELCT9meKepkJaASf6o+7dosCI8rYgr89D96O1HvFgwyJXAPlfOR24zcqf5Qv5fJqnEL4qi/4k2tJxqp3QIEYiNj66er59LdLJiRRhjXyo8g8yW3lWFQa89FvNnf+9ScFdgGtOG3sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(186003)(2906002)(83380400001)(6506007)(38100700002)(9686003)(6666004)(33716001)(66946007)(8676002)(66476007)(41300700001)(82960400001)(53546011)(66556008)(478600001)(26005)(6486002)(5660300002)(8936002)(6512007)(4326008)(86362001)(30864003)(54906003)(316002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1Kc216TGl3NHM2TmtxMUxkVU5Wbm9PNzJzWUlmYWR6NXg3aGdSd2dSU1Z6?=
 =?utf-8?B?bGl6bG1tYnRoUEdGSjZKOEY2bFVkQVowMWVEak5VTXZtRGhDZXN2ZEhVQkNZ?=
 =?utf-8?B?QjFvQzRJY29iZVNSTHNJZWpBNkpReU5DWHZFL05neXIxekV6UFIxQmJSTXRx?=
 =?utf-8?B?WTRnb0NGb3d0dTZmRzhIc3FFN2h1VUJTd1NFQlovcXNQeVZhcVRzNFFPemZl?=
 =?utf-8?B?cktITWZuYUhzMDluN2trZzBmZ1llTmphSkpabUxaNjlCcTZNOTEzUTUxS01n?=
 =?utf-8?B?YzBZTVZSUk1kc015MGNvdVJhNkFtb21yODNYbUFFZEdtdWJUNGtobmpuSWZK?=
 =?utf-8?B?VkY2SktyamUxZldRbExoTFN1SDVPWEY1M1ZUbHBDS1lScktIMUtTT05ja1dI?=
 =?utf-8?B?eVFoNTdOT0hmMC9GN1hpdmc0ZmEyc2grekpBY3BDeUZsdEdnTGd5VjkzSCtF?=
 =?utf-8?B?Vmw5eFFCelpuVnJyekIwSjQ4MUlza0NvaW5GMUJWenFFMVF1VWFxbTAwVVJp?=
 =?utf-8?B?MHlYVzJlckdxOWpFMGFJM2p1VXBjM3JqWEp4ZnNTVktXS21VT2ZRbEhNaWxR?=
 =?utf-8?B?MEdHMjBTMHN5TEFSZ2tNYUhuay8vMHJlWmh1TXRyUzVCc0YyWjN4b0k0Ykg5?=
 =?utf-8?B?Mzk1M1ZzbFVBd2ZNdzNlYmdwV0pHUkx6SnpqYnZKQis3cDluTDdBY2dCNElT?=
 =?utf-8?B?RmRWb1RZKzFqeXplVkZXcGxmOFg0d28yeUd3UXNvOE93T3Z5bUR0VGdjVnYy?=
 =?utf-8?B?NHlsdW9ITCs3Y0M0K0xJcU9ieXB6RGk0c0o2a01yODNkeVErMEU1N0p2RHVj?=
 =?utf-8?B?R2xldjA5RmcrT3lNTytnNHpCYnd6b1VnUmg5by9xN05EdFZ0YVJVUjFiZlhH?=
 =?utf-8?B?dHd4OHJNSTVvMS8yR2ZBaCs0MVlCc0xweUI5am1WRDJLTkRlby8vTldnTEZh?=
 =?utf-8?B?UXBGL2ErTXV4b3NDaUpvWVVXUGx2VGNLRFdIdjg2QmJxOG5IMXJ6NEQ1V0x2?=
 =?utf-8?B?b3RuUXZESXBxM1d5MExXa2I0NkNYbE5rb3RyVmM5NmxrVWxMS2tSdkV5SjBQ?=
 =?utf-8?B?UStUNDRseEY2Q2pQTVlydHBLZWlySzMxMFNHTUNVc3BCOVhVODR6ZFkwR2hI?=
 =?utf-8?B?WGo5VUZiTmJ3Rjk2OHNoZ1RFalJCZi9kaHpUbG1nL3VqUGpSNTlRYmFhenZ3?=
 =?utf-8?B?d2k0TzdvcEUrWlc3M2lXMHBtWFlXSHQwOE9WMnZiVmpLWTIwL1RzUjZneVNh?=
 =?utf-8?B?ZE1BQmdDbGZXZXEvaTZCUHFEb1BWV3BOQ2VBWm1hVEFka1I5ZlFHNTJ0R25K?=
 =?utf-8?B?ZFRlM1l4Uy8rVHhYakEwM2pPU2ljdlk2TERPRU10RjFzekI0K3BnQlpZaHlB?=
 =?utf-8?B?ZjdCcDdobjRUVENoZGwzQzhnQmo2RENtTlhxTEhlOFFReUE0dWREWkV5Um94?=
 =?utf-8?B?MnhEb1ZKaVZLTGZNb1YrY2U1MFZVUm5DazhwaW01WWw2MlRzK3RLejlBOXRZ?=
 =?utf-8?B?cGdQa1Q3a1RBUmdkcVN0eFBIMDBVeStITmZzK2h3U2xRZjhmVmVoM25jQndW?=
 =?utf-8?B?MzNvaDN1T0tyUnJCR2k1eG1HS1FEVUlsdWhORnhmTjN6elhJVWJ3bTFPcVJW?=
 =?utf-8?B?R051VGkra21pMG9SOGhmdjRKeUZpQlFPUlpQM1V4Nk5wUzNZZUE5ditiblRP?=
 =?utf-8?B?Y1RrNjY5S2k4cFh2clZKRVZvRFozVXNMalhMOUpBelFTS21Rc1g3Vi9LQnkw?=
 =?utf-8?B?a1JuLzFpZzRXeUkrOHZiaGthRjQwNjBFdmkzT2ZXN3ZtNVdFR3hWMHVwRDYx?=
 =?utf-8?B?TzBUWTBOUG96TTdIVzA5SmJJY1ViaHhrWEFtTG0zazF1TDAzaTlWTGZGOXhB?=
 =?utf-8?B?K1JBZ1I2dndMRnhEZFoveUxQSi8xTGc1UUJzYUtzcm91ZElZdEs2SlBRQVJi?=
 =?utf-8?B?Um81YzVzV3pVU1JHM3NITXdpVTZrc1hTU2M3cE9TVWFod0ZUd2d2NVQxcG8w?=
 =?utf-8?B?SEFGRXVFQVlYREdpV3NEa0szamszeUxLZDlyR2VQa2ZBbFphVFNMdFNXQXdp?=
 =?utf-8?B?T1dJOFdqclRZL0lsdlVZdXdiQ1NzU0dYZmlyM1hpQS9xUVgwaTJ1VU4xMHh6?=
 =?utf-8?B?ZFJEcUJsK004NkpzODBHTVRxdmxWekVoUWtFOVFqTHZiS055MG9oUEI2djN3?=
 =?utf-8?Q?tWgDmZTXG/XOtxz18asVxGc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60df0d3a-27ea-426d-a6ba-08dad2e9e951
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 15:45:31.1720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyB3emvwttN/4HfXXRGmaZO7Wau0HWwP5w/x+cj2+cZoo7K9t8aV/ThH+IC9grrrS/xu2dC5UR9t3ZTYXqR5KA9P8FjKHbz+fhtqKjjqpruix1uQtcfrKpDVSZa2bv55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.11.2022 15:30, Matt Roper wrote:
> We've been overloading uncore->lock to protect access to the MCR
> steering register.  That's not really what uncore->lock is intended for,
> and it would be better if we didn't need to hold such a high-traffic
> spinlock for the whole sequence of (apply steering, access MCR register,
> restore steering).  Let's create a dedicated MCR lock to protect the
> steering control register over this critical section and stop relying on
> the high-traffic uncore->lock.
> 
> For now the new lock is a software lock.  However some platforms (MTL
> and beyond) have a hardware-provided locking mechanism that can be used
> to serialize not only software accesses, but also hardware/firmware
> accesses as well; support for that hardware level lock will be added in
> a future patch.
> 
> v2:
>  - Use irqsave/irqrestore spinlock calls; platforms using execlist
>    submission rather than GuC submission can perform MCR accesses in
>    interrupt context because reset -> errordump happens in a tasklet.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c          |  7 +-
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 79 +++++++++++++++++++--
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h      |  2 +
>  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  8 +++
>  drivers/gpu/drm/i915/gt/intel_mocs.c        |  3 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 ++--
>  6 files changed, 101 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7ef0edb2e37c..6847f3bd2b03 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1079,6 +1079,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	enum intel_engine_id id;
>  	const i915_reg_t *regs;
>  	unsigned int num = 0;
> +	unsigned long flags;
>  
>  	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>  		regs = NULL;
> @@ -1099,7 +1100,8 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>  
> -	spin_lock_irq(&uncore->lock); /* serialise invalidate with GT reset */
> +	intel_gt_mcr_lock(gt, &flags);
> +	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
>  
>  	awake = 0;
>  	for_each_engine(engine, gt, id) {
> @@ -1133,7 +1135,8 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	     IS_ALDERLAKE_P(i915)))
>  		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
>  
> -	spin_unlock_irq(&uncore->lock);
> +	spin_unlock(&uncore->lock);
> +	intel_gt_mcr_unlock(gt, flags);
>  
>  	for_each_engine_masked(engine, gt, awake, tmp) {
>  		struct reg_and_bit rb;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index f4484bb18ec9..aa070ae57f11 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -143,6 +143,8 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>  	unsigned long fuse;
>  	int i;
>  
> +	spin_lock_init(&gt->mcr_lock);
> +
>  	/*
>  	 * An mslice is unavailable only if both the meml3 for the slice is
>  	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
> @@ -228,6 +230,7 @@ static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
>   * @instance: instance number (documented as "subsliceid" on older platforms)
>   * @value: register value to be written (ignored for read)
>   *
> + * Context: The caller must hold the MCR lock
>   * Return: 0 for write access. register value for read access.
>   *
>   * Caller needs to make sure the relevant forcewake wells are up.
> @@ -239,7 +242,7 @@ static u32 rw_with_mcr_steering_fw(struct intel_gt *gt,
>  	struct intel_uncore *uncore = gt->uncore;
>  	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
>  
> -	lockdep_assert_held(&uncore->lock);
> +	lockdep_assert_held(&gt->mcr_lock);
>  
>  	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
>  		/*
> @@ -316,6 +319,7 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
>  {
>  	struct intel_uncore *uncore = gt->uncore;
>  	enum forcewake_domains fw_domains;
> +	unsigned long flags;
>  	u32 val;
>  
>  	fw_domains = intel_uncore_forcewake_for_reg(uncore, mcr_reg_cast(reg),
> @@ -324,17 +328,59 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
>  						     GEN8_MCR_SELECTOR,
>  						     FW_REG_READ | FW_REG_WRITE);
>  
> -	spin_lock_irq(&uncore->lock);
> +	intel_gt_mcr_lock(gt, &flags);
> +	spin_lock(&uncore->lock);
>  	intel_uncore_forcewake_get__locked(uncore, fw_domains);
>  
>  	val = rw_with_mcr_steering_fw(gt, reg, rw_flag, group, instance, value);
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw_domains);
> -	spin_unlock_irq(&uncore->lock);
> +	spin_unlock(&uncore->lock);
> +	intel_gt_mcr_unlock(gt, flags);
>  
>  	return val;
>  }
>  
> +/**
> + * intel_gt_mcr_lock - Acquire MCR steering lock
> + * @gt: GT structure
> + * @flags: storage to save IRQ flags to
> + *
> + * Performs locking to protect the steering for the duration of an MCR
> + * operation.  Depending on the platform, this may be a software lock
> + * (gt->mcr_lock) or a hardware lock (i.e., a register that synchronizes
> + * access not only for the driver, but also for external hardware and
> + * firmware agents).
> + *
> + * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
> + *          function is called, although it may be acquired after this
> + *          function call.
> + */
> +void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> +{
> +	unsigned long __flags;
> +
> +	lockdep_assert_not_held(&gt->uncore->lock);
> +
> +	spin_lock_irqsave(&gt->mcr_lock, __flags);
> +
> +	*flags = __flags;
> +}
> +
> +/**
> + * intel_gt_mcr_unlock - Release MCR steering lock
> + * @gt: GT structure
> + * @flags: IRQ flags to restore
> + *
> + * Releases the lock acquired by intel_gt_mcr_lock().
> + *
> + * Context: Releases gt->mcr_lock
> + */
> +void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
> +{
> +	spin_unlock_irqrestore(&gt->mcr_lock, flags);
> +}
> +
>  /**
>   * intel_gt_mcr_read - read a specific instance of an MCR register
>   * @gt: GT structure
> @@ -342,6 +388,8 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
>   * @group: the MCR group
>   * @instance: the MCR instance
>   *
> + * Context: Takes and releases gt->mcr_lock
> + *
>   * Returns the value read from an MCR register after steering toward a specific
>   * group/instance.
>   */
> @@ -362,6 +410,8 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
>   *
>   * Write an MCR register in unicast mode after steering toward a specific
>   * group/instance.
> + *
> + * Context: Calls a function that takes and releases gt->mcr_lock
>   */
>  void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value,
>  				int group, int instance)
> @@ -376,10 +426,16 @@ void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 val
>   * @value: value to write
>   *
>   * Write an MCR register in multicast mode to update all instances.
> + *
> + * Context: Takes and releases gt->mcr_lock
>   */
>  void intel_gt_mcr_multicast_write(struct intel_gt *gt,
>  				  i915_mcr_reg_t reg, u32 value)
>  {
> +	unsigned long flags;
> +
> +	intel_gt_mcr_lock(gt, &flags);
> +
>  	/*
>  	 * Ensure we have multicast behavior, just in case some non-i915 agent
>  	 * left the hardware in unicast mode.
> @@ -388,6 +444,8 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
>  		intel_uncore_write_fw(gt->uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
>  
>  	intel_uncore_write(gt->uncore, mcr_reg_cast(reg), value);
> +
> +	intel_gt_mcr_unlock(gt, flags);
>  }
>  
>  /**
> @@ -400,9 +458,13 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
>   * function assumes the caller is already holding any necessary forcewake
>   * domains; use intel_gt_mcr_multicast_write() in cases where forcewake should
>   * be obtained automatically.
> + *
> + * Context: The caller must hold gt->mcr_lock.
>   */
>  void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value)
>  {
> +	lockdep_assert_held(&gt->mcr_lock);
> +
>  	/*
>  	 * Ensure we have multicast behavior, just in case some non-i915 agent
>  	 * left the hardware in unicast mode.
> @@ -429,6 +491,8 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u3
>   * domains; use intel_gt_mcr_multicast_rmw() in cases where forcewake should
>   * be obtained automatically.
>   *
> + * Context: Calls functions that take and release gt->mcr_lock
> + *
>   * Returns the old (unmodified) value read.
>   */
>  u32 intel_gt_mcr_multicast_rmw(struct intel_gt *gt, i915_mcr_reg_t reg,
> @@ -580,6 +644,8 @@ void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
>   * domains; use intel_gt_mcr_read_any() in cases where forcewake should be
>   * obtained automatically.
>   *
> + * Context: The caller must hold gt->mcr_lock.
> + *
>   * Returns the value from a non-terminated instance of @reg.
>   */
>  u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
> @@ -587,6 +653,8 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
>  	int type;
>  	u8 group, instance;
>  
> +	lockdep_assert_held(&gt->mcr_lock);
> +
>  	for (type = 0; type < NUM_STEERING_TYPES; type++) {
>  		if (reg_needs_read_steering(gt, reg, type)) {
>  			get_nonterminated_steering(gt, type, &group, &instance);
> @@ -607,6 +675,8 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
>   * Reads a GT MCR register.  The read will be steered to a non-terminated
>   * instance (i.e., one that isn't fused off or powered down by power gating).
>   *
> + * Context: Calls a function that takes and releases gt->mcr_lock.
> + *
>   * Returns the value from a non-terminated instance of @reg.
>   */
>  u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg)
> @@ -730,6 +800,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
>   * Note that this routine assumes the caller holds forcewake asserted, it is
>   * not suitable for very long waits.
>   *
> + * Context: Calls a function that takes and releases gt->mcr_lock
>   * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
>   */
>  int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
> @@ -741,7 +812,7 @@ int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
>  {
>  	int ret;
>  
> -	lockdep_assert_not_held(&gt->uncore->lock);
> +	lockdep_assert_not_held(&gt->mcr_lock);
>  
>  #define done ((intel_gt_mcr_read_any(gt, reg) & mask) == value)
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> index ae93b20e1c17..41684495b7da 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> @@ -9,6 +9,8 @@
>  #include "intel_gt_types.h"
>  
>  void intel_gt_mcr_init(struct intel_gt *gt);
> +void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
> +void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
>  
>  u32 intel_gt_mcr_read(struct intel_gt *gt,
>  		      i915_mcr_reg_t reg,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index c1d9cd255e06..76c34c4af867 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -233,6 +233,14 @@ struct intel_gt {
>  		u8 instanceid;
>  	} default_steering;
>  
> +	/**
> +	 * @mcr_lock: Protects the MCR steering register
> +	 *
> +	 * Protects the MCR steering register (e.g., GEN8_MCR_SELECTOR).
> +	 * Should be taken before uncore->lock in cases where both are desired.
> +	 */
> +	spinlock_t mcr_lock;
> +
>  	/*
>  	 * Base of per-tile GTTMMADR where we can derive the MMIO and the GGTT.
>  	 */
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index 49fdd509527a..69b489e8dfed 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -613,14 +613,17 @@ static u32 l3cc_combine(u16 low, u16 high)
>  static void init_l3cc_table(struct intel_gt *gt,
>  			    const struct drm_i915_mocs_table *table)
>  {
> +	unsigned long flags;
>  	unsigned int i;
>  	u32 l3cc;
>  
> +	intel_gt_mcr_lock(gt, &flags);
>  	for_each_l3cc(l3cc, table, i)
>  		if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
>  			intel_gt_mcr_multicast_write_fw(gt, XEHP_LNCFCMOCS(i), l3cc);
>  		else
>  			intel_uncore_write_fw(gt->uncore, GEN9_LNCFCMOCS(i), l3cc);
> +	intel_gt_mcr_unlock(gt, flags);
>  }
>  
>  void intel_mocs_init_engine(struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 1b0e40e68a9d..3e35facac2b4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1760,7 +1760,8 @@ static void wa_list_apply(const struct i915_wa_list *wal)
>  
>  	fw = wal_get_fw_for_rmw(uncore, wal);
>  
> -	spin_lock_irqsave(&uncore->lock, flags);
> +	intel_gt_mcr_lock(gt, &flags);
> +	spin_lock(&uncore->lock);
>  	intel_uncore_forcewake_get__locked(uncore, fw);
>  
>  	for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
> @@ -1789,7 +1790,8 @@ static void wa_list_apply(const struct i915_wa_list *wal)
>  	}
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw);
> -	spin_unlock_irqrestore(&uncore->lock, flags);
> +	spin_unlock(&uncore->lock);
> +	intel_gt_mcr_unlock(gt, flags);
>  }
>  
>  void intel_gt_apply_workarounds(struct intel_gt *gt)
> @@ -1810,7 +1812,8 @@ static bool wa_list_verify(struct intel_gt *gt,
>  
>  	fw = wal_get_fw_for_rmw(uncore, wal);
>  
> -	spin_lock_irqsave(&uncore->lock, flags);
> +	intel_gt_mcr_lock(gt, &flags);
> +	spin_lock(&uncore->lock);
>  	intel_uncore_forcewake_get__locked(uncore, fw);
>  
>  	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
> @@ -1820,7 +1823,8 @@ static bool wa_list_verify(struct intel_gt *gt,
>  				wal->name, from);
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw);
> -	spin_unlock_irqrestore(&uncore->lock, flags);
> +	spin_unlock(&uncore->lock);
> +	intel_gt_mcr_unlock(gt, flags);
>  
>  	return ok;
>  }
> -- 
> 2.38.1
> 
