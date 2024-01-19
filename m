Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378683230C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 02:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5439210E08E;
	Fri, 19 Jan 2024 01:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF9B10E02A;
 Fri, 19 Jan 2024 01:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705628411; x=1737164411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sVn24Aj+3ThJA9eYadHcd2201sEIyLm82g1YDjblDBU=;
 b=SXD1pkAear8RomUChlNmWOJMfgBijuoJ5uQRDeZUGtZd4kQCFZvGZYpm
 R0PH0ns1qtixGSM3qKGp0VyyvmnYvxbFKIQXXVObV2nwCnYguA/8LgeIm
 /FCbD7sDJcxyNUNb9apxnB5PV22HhgoyPn4izis++PplAXudKQY9pbJWr
 1nWIbyeBosW6y6W3VPRozIys/sJq3frwyQHuSbipejKdpBpKDvYWHYyyt
 OR/0GX9MqDElCTwHCqTWJzmSYwbg+5uHXchixkKwJbMPiQlpNDfJ5y3Yo
 ZRBd+TyMORVVM/ybTyVYXUSI3WQvqTHV355M9gO05V52DN4PL4UScu/9h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7721335"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7721335"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 17:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="784942649"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="784942649"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 17:39:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 17:39:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 17:39:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 17:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUiJ43QR3X6UshPA143o9lC62S/6VxEP/TmbdHrPQkb+HAT5d2ivvbK6vkuP2GxHfUA2YXPHCJMtt9LAxioyQq/reKdJXZHUn9V1FGmgA34aRfx81WM5lx95ttQpFzN8xHg/K/59MgKuc+Nrno0YGGYR+US2f5unY3PElM/yw4uHg+i0cIe7kGjsveainBR4FkZoIzPbNMePGwZnpDP1/me9+P9MFZ89ti1fB/1FSqaERPDreOCB6PBIBDcOu0S0I25n364NRWKzaylwnPe/3wsy1Dhi+9SyXGrBphjCDT2RP7vsmM661FysQibTYXcgejKdXbdhdOOAeLm5s/W/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ETcsYa12tWkUIbVlxyYROXEqpFLrNEtypmTAKG+VzA=;
 b=XCsIm9+aaBM21i/lpT64yCAx2fnXKJLLeEd9e8cyNAKnaADM+rcZegUUnV6a4VH9tN1DH5mz7lR1Uk++8i4qntzIv0UMh2ZCfpJBpoZSztyiFetd9yn6RUo/9w074M68Q/ASw+euw2/Ih37HQpxcxqzDJdJMraWvzRhWtMVsx2moeIuHYjh9W7hnakdSqsERy+NApk59sD1pGQRH7vBuqoH4IN99cTrgO9Ud8U208hXSaDD2mGJK9aKLg75gM2+/VY8NfIebsuWtuSeloTKW9ol5RExlySXQpsQO87Nvfh5lQULn+LWsulZetsQ5nC9Kkm08FJ7ihoMTbaL1HYGejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6464.namprd11.prod.outlook.com (2603:10b6:930:30::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 01:39:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 01:39:53 +0000
Date: Thu, 18 Jan 2024 17:39:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Wake GT before sending H2G message
Message-ID: <20240119013949.GI5549@mdroper-desk1.amr.corp.intel.com>
References: <20240118231728.3817168-1-vinay.belgaumkar@intel.com>
 <20240118235022.GX45138@mdroper-desk1.amr.corp.intel.com>
 <c1457166-8fa9-49f8-805d-ca4aaa33a9f9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c1457166-8fa9-49f8-805d-ca4aaa33a9f9@intel.com>
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b63575-8f27-4e95-1652-08dc188f8879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x77YOfpqxfotS33VrmzTqXgY6+S1Z7ygnuwJC0lHj5aNCiXnfKFxPwY4Dz3H/auLagGl4ZnZMlcBd0u3rpRLvNvOCUBgd83iJKiwpw31oK+/KORJRZFpKhYq0l1D7lTaZR+uxFhH8tTAuhg9oPUN6K85hBjNUAEx9zqTUk31E5WnHB6IqU4Y2nDlEyqbeuCHhUIjvpPBz/E62dfY181v5ea4DD1lm7lQhXzKRYXD3zquyJjMhQIWi91IKss5rPJ0585DA41jF5uQ6ImhWkK0FKDYpIJH8Xyp1DdZttKzwR9+/GayiGqK+AauY7arpTrjtqJ+Sp/6WK38sfZsK88FRdoU+Yx5iqUxu+jMj1c/HvFCmpqYvXp3U7DVFk1XGRJxNW2Sat5tNmEC96uq5wGW31rTUgxYL3EkSjqqHxNSkOYwCrPtFXscY8Ll0Nvia851w/XHMO83pdd4anarNA87uN5v61U+11QLIEzX8fKfDcClPHEeutGZv/hKGNAF1Mq5Br2ZG3NSJYl9peuCoL0yOB1LwbthkM4clUNh738uGlTlOmT2uU4KpU4setGoN9AK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(26005)(1076003)(83380400001)(41300700001)(478600001)(6666004)(6512007)(6486002)(6506007)(53546011)(8676002)(6862004)(4326008)(5660300002)(82960400001)(86362001)(8936002)(66556008)(66946007)(6636002)(66476007)(316002)(450100002)(2906002)(38100700002)(33656002)(15650500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+7OM4hYO7ZcgyaEIAy3l5c5cxGzKTAH7lkYvcGG64OlKXuk+6MAGU9O2rbQ+?=
 =?us-ascii?Q?c6N2ZV6vxs8xqNv+UoNMljzA7FznWNlQaiQlDrDGFPIIVf+6yQQIi82tgi6p?=
 =?us-ascii?Q?yk7bYe1M3AhyiaG8rkvFS1RPg45Wh9LApmGe6YVqF3Kjm+xjB3A1eH8RBXkg?=
 =?us-ascii?Q?OaVJhwm42IZjBBs9V4KR5GyZO51dmxlpirA19Ifwyrrz909uRy+deibk31Wv?=
 =?us-ascii?Q?76OQ5+biBxIXqlsEeqljYbO0NzMhWzcOX0fHe33oCNMUggStzis2r93whB4Y?=
 =?us-ascii?Q?kJkiUpm6/yK2/ZBQwsSW9CeEqRP6SSiZAanx1HwFqbt0URZcL8elW5rKfZ2P?=
 =?us-ascii?Q?1mwTe1etyUHJP9bsoxDwdeADBvOV+XVXGzEMaEN87mRnZgXcreBS50hcEy0n?=
 =?us-ascii?Q?J75AkV9eQtdj9LIugHHJH3Y/hFKoYxZxSrodliwUZ/Q3p7SWbnEYZ2IeNfZE?=
 =?us-ascii?Q?2J4FPF+VXual/RBsNOt4v1RY14WacL9QK6AqZcot3f7fCo5XHA2IWyds+WBd?=
 =?us-ascii?Q?AwbnnHbUfdnimWUSiCGvZL46fpsIaVjtU5/zUwzM+QgqrOOynmp0ev+/BVpk?=
 =?us-ascii?Q?3NWfreYlcmOwLo+UnSaBPRx2zDX5j4GKYUme8fUFOl46qglWy0pldKIwxfV0?=
 =?us-ascii?Q?M6Lz0hi32WC4iltq1fW4A6uytbIZ2y0Mbq63mmGrJq0NlJpVQfIURFRINnXg?=
 =?us-ascii?Q?PkUbN8IuVtg8fqAiDfZZSsG0bkA4CtxApoWxpk24xCDdZgoIS0BXyv9cAMgp?=
 =?us-ascii?Q?WhArSj6XpKT8/pkbWShYZOR+4GFCipj9JTYcQH59/r48OF5e/3dlDRUcUj+J?=
 =?us-ascii?Q?JIDPFVYj6OZe2MnDB0X7hTXOpWggRkFpSqwmpdEmxiDSz1tQvR/vQevHIHAV?=
 =?us-ascii?Q?fYWc/EnyNOwaDgUG4me+rMqoK9jOsBAL6ji5iXHvpeO3ubnJOLNLYPaGPL2m?=
 =?us-ascii?Q?soyzJWUq9unsv4wTp5p30MFeDGIOgqZKzcdrUJQ+4su6VRMonEdAMYtaD74k?=
 =?us-ascii?Q?J6mqrSgHNEc5yssMvPuWatexuzGqk1olqDLjPILqTSAm4sp4mPGN/Tggvcsf?=
 =?us-ascii?Q?9rJXKmcUWGBYRoKyAJ8bCCRONAt4K7JExo9KJ/MsPHuEqMOBB/ySc5CV4Jhi?=
 =?us-ascii?Q?tqJHkGYO27X7Pzcbr9wLuKLlA0tDi7ZmnMJFAivj0KXoZF/HluazonpgC8aw?=
 =?us-ascii?Q?8E3ur1FkSeCRRtnNPcsLIYn+MpAPuK3TPOo7C/79A3MXQiC75Gz2M7wnEifz?=
 =?us-ascii?Q?VvfjkYuOqRE11mMrWa+Xtfyotzu+6V2/V9GfDx78GZEoR2D5I99mfGBLnqm0?=
 =?us-ascii?Q?l0e91U9eosrDYSdYlm6UmAyFKUd6h+WDveKzZHFSD8N2Mxl50eQZUhIeQ5K/?=
 =?us-ascii?Q?8FYD8yz3eXpTpO1MZPp+7VTufRJ5LTwVITq2sndyUP0yOVhHwWWTx6HQTvDH?=
 =?us-ascii?Q?9idUdCoXjRlpXC2C+fbfgjCDeM/tO+qARN0eO/xad5xQhzrlatrgOMSsNBfM?=
 =?us-ascii?Q?JMGzESvsj3P85WXQ+7NhoGc5r7EHMdo6S+ThVPI7penYeWqkXcAyMigsQAnP?=
 =?us-ascii?Q?DOnmJk7R/++//v8VcidX7/TPhM86hZxr03kvklJ2t5DrTVFisWYhPy5am7Cu?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b63575-8f27-4e95-1652-08dc188f8879
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 01:39:52.9750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qCQvPitQWoqbzmI/92fV6Px4WlfcMBdo2r/KS57aVrOMg1fW9BtTrctNMpcTHUYnGi6VY+hZmUN2A5sn1kd/NccLac4JPryewiNnqowXGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6464
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

On Thu, Jan 18, 2024 at 05:21:23PM -0800, Belgaumkar, Vinay wrote:
> 
> On 1/18/2024 3:50 PM, Matt Roper wrote:
> > On Thu, Jan 18, 2024 at 03:17:28PM -0800, Vinay Belgaumkar wrote:
> > > Instead of waiting until the interrupt reaches GuC, we can grab a
> > > forcewake while triggering the H2G interrupt. GEN11_GUC_HOST_INTERRUPT
> > > is inside an "always on" domain with respect to RC6. However, there
> > A bit of a nitpick, but technically "always on" is a description of GT
> > register ranges that never get powered down.  GEN11_GUC_HOST_INTERRUPT
> > isn't inside the GT at all, but rather is an sgunit register and thus
> > isn't affected by forcewake.  This is just a special case where the
> > sgunit register forwards a message back to the GT's GuC, and the
> > workaround wants us to make sure the GT is awake before that message
> > gets there.
> True, can modify the description to reflect this.
> > 
> > > could be some delays when platform is entering/exiting some higher
> > > level platform sleep states and a H2G is triggered. A forcewake
> > > ensures those sleep states have been fully exited and further
> > > processing occurs as expected.
> > Based on this description, is adding implicit forcewake to this register
> > really enough?  Implicit forcewake powers up before a read/write, but
> > also allows it to power back down as soon as the MMIO operation is
> > complete.  If the GuC is a bit slow to notice the interrupt, then we
> > could wind up with a sequence like
> > 
> >   - Driver grabs forcewake and GT powers up
> >   - Driver writes 0x1901f0 to trigger GuC interrupt
> >   - Driver releases forcewake and GT powers down
> >   - GuC notices interrupt (or maybe fails to notice it because the GT
> >     powered down before it had a chance to process it?)
> > 
> > which I'm guessing isn't actually going to satisfy this workaround.  Do
> > we actually need to keep the GT awake not just through the register
> > operation, but also through the GuC's processing of the interrupt?  If
> > so, then we probably want to do an explicit forcewake get/put to ensure
> > the hardware stays powered up long enough.
> 
> The issue being addressed here is not GT entering C6, but the higher
> platform sleep states. Once we force wake GT while writing to the H2G
> register, that should bring us out of sleep. After clearing the forcewake
> (which would happen after the write for 0x1901f0 goes through), we still
> have C6 hysteresis and the hysteresis counters for the higher platform sleep
> states which should give GuC enough time to process the interrupt before we
> enter C6 and then subsequently these higher sleep states.

Okay, makes sense.  Hopefully the finalize the workaround details and
documentation soon, but this looks reasonable with the information we
have at the moment.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Thanks,
> 
> Vinay.
> 
> > 
> > 
> > Matt
> > 
> > > This will have an official WA soon so adding a FIXME in the comments.
> > > 
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/intel_uncore.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> > > index dfefad5a5fec..121458a31886 100644
> > > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > > @@ -1800,7 +1800,10 @@ static const struct intel_forcewake_range __mtl_fw_ranges[] = {
> > >   	GEN_FW_RANGE(0x24000, 0x2ffff, 0), /*
> > >   		0x24000 - 0x2407f: always on
> > >   		0x24080 - 0x2ffff: reserved */
> > > -	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT)
> > > +	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT),
> > > +	GEN_FW_RANGE(0x40000, 0x1901ec, 0),
> > > +	GEN_FW_RANGE(0x1901f0, 0x1901f0, FORCEWAKE_GT)
> > > +		/* FIXME: WA to wake GT while triggering H2G */
> > >   };
> > >   /*
> > > -- 
> > > 2.38.1
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
