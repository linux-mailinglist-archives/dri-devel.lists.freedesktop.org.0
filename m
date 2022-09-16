Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34705BAFA6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 16:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6DE10E4A1;
	Fri, 16 Sep 2022 14:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9293D10E48A;
 Fri, 16 Sep 2022 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663340027; x=1694876027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mhX38v7PUxB4AvinUXmw/P6tX+oJlPcDp212OXKnRO4=;
 b=FrUxacpB7IbueCabzbevWB+Sk9nMTf4FK//KAt2WuYOBmL3S272mJptD
 LBruzAfjAECzb8g7Hbu8MRISkstX0yiV8sX72vQY0ui8fajs4lShfUJ0K
 3YHusGddey8QR17SP5u0qV5itnigHOFyM4QmCrTQu+GCgeEwjn4n4TY9t
 vmmkOQmtp7PSTeP3fW/1M/pCP28Bc2w1CQ3f7yVPHkCK0GRpg/FbvujPQ
 Et+U7cEVyjINdriZOzvo21s4zRx46N+uCBwzlve0Zo7BqsxAId8qtMGrm
 K4HESWl2fWEavecaLyyxut8U8XSw8+yjLBWxd6Yc5t8U3PkUxlnbTsJwb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="278735081"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="278735081"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="648285267"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 16 Sep 2022 07:53:46 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 07:53:45 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 07:53:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 07:53:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 07:53:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPf8cV7oXuDNV8jiMDUTO9+GMcwaBoBSj7AzWVfu4U1DcA3EjeOBKuBQYEjj1KfNNgV3wWsNeMmkPuup3mVk5VKoZsezi+hQ0hYI63gZIp+ou88vpk0eUjxwN3y+v7pNQfMFn7Mg5lULMlouAhbMs6kktnYnA8fLwLNuxc8JSF2o7fD/OKjnHQpfoh0bLNH5TMn9IYhE4Bq8InttFY2pdsxZyeW9zSXPQ70qtBqhBmGXCQ5Xpue3iU7ENhI6gGid71BtvzvpdQb3JM7ChWisHkSPEhUKW7YcuS9diIkF2PVXv3HYvkz8/asW2OHfZYus9UauIq1NLnXW6Lyrt4hZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSfpnnWaUA653spvg+Y0QvEcyvBg8kS5RmiRM/sw+CI=;
 b=fNfMxG2dtLwE06odMO8pk6aSbFEIzTgziAQOfmRy/C9RQIzwq7HPFKmLrM3EKtP5tIswwoPCHvPmuyPh8N5h7Q6vFsfK7tznJ3eoEBk+DzYySsOMEN83u1miKyX+Sv3QZWtDBI50DUa9SpnNBQ8xx02Tucni3rWvbH2RJEbpgd8MKOUp3A8ROPufelInSzcnjlTMAYlO+igKwHv3NCJSVLLrqSecZ96ilODcm0eNQatARYBgehnlHmyWon1XU0VD9+djJt85Xx5mjgLQC9iNbjj35q7zgTcnVIEsDgQZ8vUErntCJAsCWa3TuQ7GcJIVxu6r88CCYqf33f0Icf7rZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 14:53:43 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5632.016; Fri, 16 Sep
 2022 14:53:43 +0000
Date: Fri, 16 Sep 2022 07:53:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Split GAM and MSLICE steering
Message-ID: <YySN9FWpDxKPRlld@mdroper-desk1.amr.corp.intel.com>
References: <20220916014345.3317739-1-matthew.d.roper@intel.com>
 <e5e70c4f-93af-a903-9bf0-df283b6e7eb9@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e5e70c4f-93af-a903-9bf0-df283b6e7eb9@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SA2PR11MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 217e60f4-6167-4362-6581-08da97f33f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CR5D1HmvFBu2/FnCCosFfQyXjnau9VsAabVxS18wv0R8ivjTHAgJsMw2gdfvROHqhvEn+YlIFq/ZNGpCZqKALhmUx+Q0idofDKbircWgqHUPvjTLtK4kR3q/N1pptZfS4FoyGWh8PyK9xOItKYsp8iVLPedDR+yZiQN1GFgQkeQorTXRClSdA3n/VZzR0qKPrS60iqD884fax0e3i1QFm3+ZTR/GQEUTB4oGZhoAL7cZ5naHMfo7eyKu2gPugx6m4wsTfyJ+R7fkfB7oDGEQSYtIW/gbJZ//k6KimY7XuNQzcfvqUplapUtWnQPjKHj8uj68Xl3+0la7vdIDebRs/gDx4trx19cNDCWyqC65ApI+uCjQRZ/pZtVC71lP+EU4RHy7VaSyFtj1dtc5wqyXtkt4u4NbzX4r4fv6LXwxARfy+Xapc/jgttFxy42ymyUE7CVeNC1aenXYHrNKoskORnT82aIJdiY+GpTOl8OIhy8VS/PLMro5t5aBCrp6AZkuyWC04YgCYZ39aLDarenI4beaUpebuIaSQLhW4IrCeGCsUfhCqiCQk64MtswzXKiAw1zoZGsYiKN1s6YUcOJoD2lp2ZfghxB+CbDUcMUOtDXUYgpF+feQqyPQOBepRc824iMPMxVPiflNrd9vcLCl//ZWOBQ8aFPP/gSpWJldClX2vP8FQpRYa+cxUAx46T1hiByMlKMFMrc1nrF9lycw2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(6506007)(4326008)(66946007)(8676002)(26005)(83380400001)(66556008)(186003)(66476007)(316002)(2906002)(6486002)(478600001)(41300700001)(5660300002)(53546011)(86362001)(6916009)(8936002)(38100700002)(6512007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nj2EKH7jIT8oSR2jaKBOEqK+ram0kmmTvPzeWDLnjZ9qQ8B1IlVSBAAqC8Ce?=
 =?us-ascii?Q?YjCJIAN+EiWTTLoKXoA/gHNx0Q3WqQ5AmWq6wCNlegoG+t8/z71KY67KQOqo?=
 =?us-ascii?Q?vs06jcDeivpdF3p33Xpc5JPKT77M8pNNhssVYI7keaEFNuTnc2TTGEeD5jzL?=
 =?us-ascii?Q?F7c3z37ZRNPj39Z0IBw3IxlKjiebvGcfx+C9SgcQMmlgujxLNAxzpEk5sbqW?=
 =?us-ascii?Q?5OKWH327BaKQndI6GQ9T8JmjKb184gTXlrDXiv83W/EDBNnwyn8A7p77/I6H?=
 =?us-ascii?Q?tp9fdG3nSFBr+TCNpHNcQWWgBJ3SA3XNmIge/W446oKNFaYtvX81auOFtdRF?=
 =?us-ascii?Q?0VPN6zgOXH34ygOfYstEfHhdPbfaBe1Q6dU+4CyyX1fyR3hMvFhHc4RuyKOR?=
 =?us-ascii?Q?bwD1eY++sCyJ1Bk57Rxva7jUbZvn0apXf34RvERaCP02/iziprIuFZZBhaLK?=
 =?us-ascii?Q?jzNlmQmSnPFZeZAB1YcGa6HymkRRwu1ZaOc59q5dFUEkMzmcBuqhQUNq1PNo?=
 =?us-ascii?Q?IkIpoy5Fg7I3MWazkC+YIQ1u5tHjNS/FApxd4WCd442eGohPDDCv0tPQ3OjK?=
 =?us-ascii?Q?iY0+muoRhKCYGOu2GG2iwvCoEdsv9FttLw1tOU7K8zma4jW9YwbJ/2mqwW2B?=
 =?us-ascii?Q?zpaNLjE3fBth6NAjMDi2fd3ZXnbHtI2Ux3EPLda+NzSIIdv4X6At4828IJ/A?=
 =?us-ascii?Q?lTKcTSzh0qXIggKRcFAOCVX22GyA+nyKINyArN0vFE1LjdLA0FhJr08lp9vR?=
 =?us-ascii?Q?LFWdcgYIHActOK7rup4dU7xwHU+JvbriNwJw0ETBrnqEileJwukkTyGnVe5c?=
 =?us-ascii?Q?3xgiqXL+lmxtOEBICkXbyjD2+V8vU+zJA0BvKG1xdsIvvxwqWa+wfQX0k/MN?=
 =?us-ascii?Q?K683Y9xfz/FJ/+shhgLidaIxERHLqO8n6svjuVpyuh8rZ2XImwY95w/6VlL3?=
 =?us-ascii?Q?CmwG+D90qsxH3S0Oc55EO/e9EeBWs8as0ezEp8UZ4sU5wGdnnj3XUqiUSg6k?=
 =?us-ascii?Q?w6g+UWqtvBrscnKwcoKDH5AphhwGmz6y2DEz7PYtXZnNR1y0XBZgXtCAi3Ks?=
 =?us-ascii?Q?67HzzBmLp+kGz/Cr3anY8uvDMRHr/vWYmKlZDd6AinQ70PQG0cs1IN+u/S+c?=
 =?us-ascii?Q?ylI/xToU3MViRRorSs/5hLHuKDMSRN+cFsGJ8oEsdHw/T3Uoit9taBmoMCZu?=
 =?us-ascii?Q?uXxjtvPrD0FAIbCvo3qdsDJe2Rcu6xyFUH6Ag8NZtXJipGIQljO2oL/h+zsn?=
 =?us-ascii?Q?Dh+i/GO/HWxe9g9B07jGRDn2fA1aCRmKi2De49wwe0GYKB4NfRkRL2+ssw/I?=
 =?us-ascii?Q?kC6P3Baizwi/HoCt1A1uG/JQ63fg1epjnaAlL83ZLKeM2Wjlnh/eerZtZ65W?=
 =?us-ascii?Q?ZP6x06U9uP4K0PKSw5olXWtYKratGVT/s9TKq/k9oftY7HxxDqoGXkNKHenV?=
 =?us-ascii?Q?vU5fPf62nsb086BP15jMBsronKldeLpbI1fV+2EBL6kc3OueURAWhCgC2xfK?=
 =?us-ascii?Q?I/kIc9tg8qLDrUN530PlTZjdK6VNi/4jHD+UC/GbPyOWhjgS0TJy6+klHfBP?=
 =?us-ascii?Q?562vjCAlggmWwNm7NCTGPKSYEs2b6tJnUckcZKS2LLwzC+/vG+EtcGboWsEU?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 217e60f4-6167-4362-6581-08da97f33f92
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 14:53:42.9033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gVVhgFld4YA/QtSsLpoHugFZbx42MHwM6K7yjjMC1A1+sjy1d5RNPC27bUMPlVYe/GP+a+GI5BDdavNxy3DoIvlgJoJQS1IfeQ2PnCUGbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
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

On Fri, Sep 16, 2022 at 10:02:32AM +0100, Tvrtko Ursulin wrote:
> 
> On 16/09/2022 02:43, Matt Roper wrote:
> > Although the bspec lists several MMIO ranges as "MSLICE," it turns out
> > that a subset of these are of a "GAM" subclass that has unique rules and
> > doesn't followed regular mslice steering behavior.
> > 
> >   * Xe_HP SDV:  GAM ranges must always be steered to 0,0.  These
> >     registers share the regular steering control register (0xFDC) with
> >     other steering types
> > 
> >   * DG2:  GAM ranges must always be steered to 1,0.  GAM registers have a
> >     dedicated steering control register (0xFE0) so we can set the value
> >     once at startup and rely on implicit steering.  Technically the
> >     hardware default should already be set to 1,0 properly, but it never
> >     hurts to ensure that in the driver.
> 
> Do you have any data on whether the "technically should" holds in practice?
> What would be the consequences of some platform/machine surprising us here?

The bspec indicates the hardware default value is already the necessary
1,0 value; I'm mostly paranoid about some kind of boot firmware wiping
it to 0,0 by accident.  I don't have any evidence that has ever actually
happened, but explicitly re-programming it to 1,0 in the patch here is a
defensive measure just to be safe.

If we didn't have this patch _and_ some firmware screwed up the GAM
steering target, then presumably we might read back garbage or 0 from
GAM registers in places where we should have received a real value.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Bspec: 66534
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 24 +++++++++++++++++++--
> >   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
> >   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
> >   drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++++++
> >   4 files changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > index e79405a45312..a2047a68ea7a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > @@ -40,6 +40,7 @@ static const char * const intel_steering_types[] = {
> >   	"L3BANK",
> >   	"MSLICE",
> >   	"LNCF",
> > +	"GAM",
> >   	"INSTANCE 0",
> >   };
> > @@ -48,14 +49,23 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
> >   	{},
> >   };
> > +/*
> > + * Although the bspec lists more "MSLICE" ranges than shown here, some of those
> > + * are of a "GAM" subclass that has special rules.  Thus we use a separate
> > + * GAM table farther down for those.
> > + */
> >   static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
> > -	{ 0x004000, 0x004AFF },
> > -	{ 0x00C800, 0x00CFFF },
> >   	{ 0x00DD00, 0x00DDFF },
> >   	{ 0x00E900, 0x00FFFF }, /* 0xEA00 - OxEFFF is unused */
> >   	{},
> >   };
> > +static const struct intel_mmio_range xehpsdv_gam_steering_table[] = {
> > +	{ 0x004000, 0x004AFF },
> > +	{ 0x00C800, 0x00CFFF },
> > +	{},
> > +};
> > +
> >   static const struct intel_mmio_range xehpsdv_lncf_steering_table[] = {
> >   	{ 0x00B000, 0x00B0FF },
> >   	{ 0x00D800, 0x00D8FF },
> > @@ -114,9 +124,15 @@ void intel_gt_mcr_init(struct intel_gt *gt)
> >   	} else if (IS_DG2(i915)) {
> >   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> >   		gt->steering_table[LNCF] = dg2_lncf_steering_table;
> > +		/*
> > +		 * No need to hook up the GAM table since it has a dedicated
> > +		 * steering control register on DG2 and can use implicit
> > +		 * steering.
> > +		 */
> >   	} else if (IS_XEHPSDV(i915)) {
> >   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> >   		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
> > +		gt->steering_table[GAM] = xehpsdv_gam_steering_table;
> >   	} else if (GRAPHICS_VER(i915) >= 11 &&
> >   		   GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
> >   		gt->steering_table[L3BANK] = icl_l3bank_steering_table;
> > @@ -351,6 +367,10 @@ static void get_nonterminated_steering(struct intel_gt *gt,
> >   		*group = __ffs(gt->info.mslice_mask) << 1;
> >   		*instance = 0;	/* unused */
> >   		break;
> > +	case GAM:
> > +		*group = IS_DG2(gt->i915) ? 1 : 0;
> > +		*instance = 0;
> > +		break;
> >   	case INSTANCE0:
> >   		/*
> >   		 * There are a lot of MCR types for which instance (0, 0)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 2275ee47da95..2343b26e0e21 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -42,6 +42,7 @@
> >   #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> >   #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> >   #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> > +#define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> >   #define   GEN8_MCR_SLICE(slice)			(((slice) & 3) << 26)
> >   #define   GEN8_MCR_SLICE_MASK			GEN8_MCR_SLICE(3)
> >   #define   GEN8_MCR_SUBSLICE(subslice)		(((subslice) & 3) << 24)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > index f19c2de77ff6..30003d68fd51 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > @@ -59,6 +59,7 @@ enum intel_steering_type {
> >   	L3BANK,
> >   	MSLICE,
> >   	LNCF,
> > +	GAM,
> >   	/*
> >   	 * On some platforms there are multiple types of MCR registers that
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index 6d2003d598e6..d04652a3b4e5 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -1181,6 +1181,9 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
> >   		gt->steering_table[MSLICE] = NULL;
> >   	}
> > +	if (IS_XEHPSDV(gt->i915) && slice_mask & BIT(0))
> > +		gt->steering_table[GAM] = NULL;
> > +
> >   	slice = __ffs(slice_mask);
> >   	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice) %
> >   		GEN_DSS_PER_GSLICE;
> > @@ -1198,6 +1201,13 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
> >   	 */
> >   	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
> >   	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
> > +
> > +	/*
> > +	 * On DG2, GAM registers have a dedicated steering control register
> > +	 * and must always be programmed to a hardcoded groupid of "1."
> > +	 */
> > +	if (IS_DG2(gt->i915))
> > +		__set_mcr_steering(wal, GAM_MCR_SELECTOR, 1, 0);
> >   }
> >   static void

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
