Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE72666173
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB8410E7AA;
	Wed, 11 Jan 2023 17:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E2D10E7A8;
 Wed, 11 Jan 2023 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673457037; x=1704993037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9M+1kgkGJrifnSGap63ZE49nduDtN7MY6KdNPaRENHs=;
 b=FKNRNYvzSe/UBC969XonLoBuWYs89vO7BDRuobFXbznRbDxa/a9BTeSf
 CHolG2nB1FDZXPQBw6k/1fB4+YtebsMNlYwLE0E4psJ4eJM5Rcx7R2l9B
 0Z+rSFJuQpBECZ7OoLxSUHi9ZtyiWKl5ouV8iUqFGPxpZMgrOtAFOZI6O
 ei8dupezHRqYOqTazTGo0wJvQKhS2yi/JrhQotOyw65OUI2+PWyj1F294
 LshkPHMOnilsHfxOkT8bwN9CSx3jpTj1D91t8C+8gFNz5WSWmz0peZ6tu
 AU7+5ALiQMyXeAM7YLsCT4TscUYEG4BazHF1bsYY1Ry/px1Th92z6fxlq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311294757"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="311294757"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 09:06:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="765228965"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="765228965"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2023 09:06:30 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 09:06:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 09:06:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 09:06:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOg/R459jwnJ5N2P0TJV/43EZfftGqy3omcg39JQmg6/MfsgxscNeILIsXho5PBIeXIeOKUlU8YSYWc9NENSDS+zUhgLYI3j9gD3hmmhbx7H6Rh3IfHc0J53VyWp6m+4VUkDsYM4mXGohDdnLzdCy1ouVdny5GqvLIhFT5Od1apOr1f+7cfjjlblJjIeV5MIRE/ZohOirROmF9a1ARDJAmBS4wuY8ukzlLyvPdPyte8U+hRX+FyQf5JMTRJG3VYFIFq1yQafPl3HH+D6zoZWQ/4L3lUFALiARIRZGS5vC9SpMBh8nphLx0yb2ufMSA4xtGxUKX7nznDHegXFduZgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J72nKiNkSY5xgojb691tB2b7Hg6wlsZ6xxIaTJfd+SU=;
 b=C10qSXGNJXJf/QFwn5I14dCBF4dUuWWTwq9catqRROjwl9avQacc6c8VvZcwEsuw234wy7X7uqaHXy/cZgwTypWqL7INE/LP/Fk3KKBPT+E8pTD7MICulivPesdPMLvqoVpj17Lc48WS01bEKU8hVo4wV1OcxNfQnAss0Qzy10H7N+SK/SrP0laJAx48CGOwjwMiZefbyn3416JP3cYSx4a/OwCMIrKou0G/QUOCrScjqA/c6CZ1FMntXuMWJk9gZRXaNX4DKV5g3wZttORG6BblvI2fpaW2M58Th/VzJKbeCvKvpXlNZ/02BdDwpvzAOwuj5xnTnUyiMnopXi1iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 17:06:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 17:06:28 +0000
Date: Wed, 11 Jan 2023 12:06:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to
 settle
Message-ID: <Y77skCsA2rTouT7E@intel.com>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <Y77VBNAgY161+QNM@intel.com> <Y77YOGLaTPiZ4Opr@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y77YOGLaTPiZ4Opr@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d1edc3-a076-412a-e884-08daf3f62da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXcdPZwbppRrXDlLSzyjM4WEv2LMO1fpakHZ0Sh5ZDSIBOB0zkm6q9us7A3vbUnyTfaHMaRENtG8UPqVzzfvrPXNRZVDxr1vauCF5boNnrmx58C+azrxKkLlIH2WC69aPEjBvp8NVIlvOKY+G7toOdSbDsPRdGvRc9ZM7wTkgX/dTnqF6bz/sOR10iCZIk06QEJ9Grib80P9hzdajUipFdXceOiqAvJSZtX92srgS9W8408/A6OSJ5fsohdMid60Wp9SEWwEiROADmMhIPqP0zAMFFM+kr9sNUqKSa49FMDRIZGRGT454/bc4S3I8I1UAh60GLubaplhHsau8927HPUURvtULw30zuQ8+j/XyP9yQzSos/Kv14pTc7Yq2ys2zhNl8/N1qVzAzfVbmCd0EMH2irdv/20O7bLnVxGvpv1nlp233KWS5IHvfhU3E5FV/CLU6iOiIv3wc8+8xti/fyJnr40l/O2vosu3C1aKY1AIeKXOy3oQErIV5Gw9zder71ShqM3rWx3SppHGTTDHCP9u73jBh/xwJYyFo30F/pdzRe7A967mdzTbPbQW3faT4oHhKVB9HO+mXQLWXX/379xy56gtdzS/wIyb1DL7+0/ajaQpEpeJ/A8seXdaTf/28RkCbpX+vuahMBOMOIXxQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(8676002)(44832011)(186003)(316002)(26005)(5660300002)(6512007)(966005)(478600001)(6486002)(86362001)(2616005)(41300700001)(54906003)(66946007)(66556008)(66476007)(6916009)(4326008)(8936002)(83380400001)(36756003)(6666004)(6506007)(38100700002)(82960400001)(2906002)(226643001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pkJn/H15owkVGSM6AZHXPGmgnUTCHXs++9CKgaqWj8OIudgo/0GmnBNekC7c?=
 =?us-ascii?Q?/LBvlh2ciFp0lN/ZFCTj99S+TkDow3Frc0TY7GhqEaPJTlenofEE6NCsKdkX?=
 =?us-ascii?Q?fyZfYkP2KvGMUfGUElqyOJiU/U2YLaUVqSOOuTrWZXt/efMYu6KUoGtrX5EP?=
 =?us-ascii?Q?YNJ193DXgT6sOkD6gSymK+OpQ5bZls+Vv+5kHL13vp+ajcVyihTLZsirsfjx?=
 =?us-ascii?Q?/9cqZx61mZ9/Gg9OCiUiFtdjTQ+VXChT4c4gj/9y2ZB/kAtgL+EuLtY6yn5v?=
 =?us-ascii?Q?Tmn3h7BtLm/8uuAnVeWj+bWRkvBXMurFiHvZARfDvrjMptV7+O0AZrT8eJyi?=
 =?us-ascii?Q?DWL8hnJI8V4bCb4VfU0nBzlq7A1efmBnNXtE/cpxDY2xvIP44qSB4SYfyS0d?=
 =?us-ascii?Q?1F8qhq9Xo4yq0c7vdf8h0MPde0tlFrOG0Nm0Dclc0I2bPhG9olOgz9RS40BX?=
 =?us-ascii?Q?YvaqVxit3OHqotQBCNM2X0G4P15mdCcQJ8dLuJ5tLNiUH3pDAAX+ajcO1JfJ?=
 =?us-ascii?Q?64WJp0ig6DXL5TSM0ziMjq5FGrUX9ccgreOJGqXJx1iummnMrInkjG6h/mDF?=
 =?us-ascii?Q?ihrY0LxMV6U1SN4decOq2YJOb/RITtA3+XLnpcAhvhTexd1Lkzc22obWnC6e?=
 =?us-ascii?Q?dMNRw3BvltKVidC7Wc7KuHKILs+hqP+ShipG2e/vAW2n5uVOYoxvWj1H+E0y?=
 =?us-ascii?Q?lrG8zSDBV5uMeNlowa/d9t7JJtwZQ+ToCBekBXTWpeh56QHZnIEWazmpp3Qp?=
 =?us-ascii?Q?StH8gt2s3TMUXCCxuG64gPji+k7YxUzmtSAE+zv4OESr3ZMZAQp3UwFkHzMu?=
 =?us-ascii?Q?xPqvUxwQzMIoisgQTXYfYAyZyHbYLA5tELyTuXHqkPTzURBRg+pCUAURhMMU?=
 =?us-ascii?Q?HUZzlvg/2x1TUXjneodZtgGNQQvKJretvaSplP/jv1amJ0/D0yeXnh3qtOcB?=
 =?us-ascii?Q?7xvjfQ78zR1Cle6tZr7PKZT4gyiWnotNeQ+Aaqhi5spl41ZDKaGLLpgoS5xY?=
 =?us-ascii?Q?2YHnOlKz5ERUgL2rC912X14KTbZSqjmN148ZBsDjSMRt0EBHlIep27LyC99I?=
 =?us-ascii?Q?9u0g0AxmMLBp4GtQP1mZ2gtlXsVPiIsegxahOEUJuvdBaGxBJpeN8UKdFQK5?=
 =?us-ascii?Q?jFraQ5acxwPKXhXTB2NZTQDJmdidb3Q7PTlKdUACPyOEFVqTjwmDSplx/S3K?=
 =?us-ascii?Q?LZtjqW0pbrP6AyKWfUvkRzkZ52bv84EWla53ZS8QakCfgktZkCxLZu8bzVGG?=
 =?us-ascii?Q?Xzp0vfURwTvQMXiW74lR4bxTPHSlpYvP7JJjqppJFP2EtPm2rLGJVVCT5TAH?=
 =?us-ascii?Q?4xyy6wjNMDS+UweUFTa7v4m2pHE8TgqTTOhaOYxJ+zeJ66xA9Nfj2BsI2LA2?=
 =?us-ascii?Q?v+Wath5AtuOmTwPMYE7rjfcynw05ZHLJWH2O1D7XbWi5U1KpH9HN32k5Ko9f?=
 =?us-ascii?Q?s/lNzM59RbigMj2x7DeD1iTMMHe2e7gmu7ShIoo8rTbRvUbs6XpN/zuXAJ6I?=
 =?us-ascii?Q?ihYH9eoj0HSvgBTbEGr9Bjyfk3Ph0NWhiDXsCRVxQ7kbfkPTfyfqdx57wtb0?=
 =?us-ascii?Q?81U0x6JNzZZEr/DAx5zQWWpNC9dwmF3r6G8u0dsdUeLXX16An4XA1hJW/rRk?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d1edc3-a076-412a-e884-08daf3f62da0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 17:06:28.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lShnFcZHYweywGIjG6rFqxYfKlM0zPFL/14ka+igvq9QoXdFcp3xIkc1GrveCkv/XFADPXgdcTpAt8/Or9n5fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 04:39:36PM +0100, Andi Shyti wrote:
> Hi Rodrigo,
> 
> On Wed, Jan 11, 2023 at 10:25:56AM -0500, Rodrigo Vivi wrote:
> > On Wed, Jan 11, 2023 at 11:44:47AM +0100, Andi Shyti wrote:
> > > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > 
> > > During module load not all the punit transaction have completed
> > > and we might end up timing out, as shown by the following
> > > warning:
> > > 
> > >    i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> > > 
> > > Wait 10 seconds for the punit to settle and complete any
> > > outstanding transactions upon module load.
> > 
> > 10 *SECONDS* ?!
> 
> Don't be alarmed :)
> 
> It's up to 10 seconds, otherwise we would end up waiting up to 3
> minutes.
> 
> And I've seen a version (and you did as well) where those 3
> minutes were raised to 6 (for the PVC particular case).

Oh yeap! and that case is funny! Because the indication from PCODE
is that 10 seconds is enough, but there are some rare cases where
it gets stuck and end up taking a very long time. Then they multiplied
the bad rare case to 3, and no idea why how that become 6.

But anyway, thanks for refreshing my memory. When I first noticed this
patch I thought it was in all the platforms, where this wouldn't make
sense. But on discrete where the pcode needs to bring the memory and
gt up before we can really use it, it makes sense.

And then I noticed that your patch is indeed for dgfx only, so it
would be okay. And 10 seconds is okay.

However I also noticed that you do this before the other pcode_init
check that we were told by pcode folks to use. So, I don't understand
how your patch is helping now... you wait for 10 seconds and then you
will wait more 10 seconds on the pcode_ready... why the pcode_ready
check that we have in case already doesn't cover yours?

And why that return?

> 
> Thanks for checking this,
> Andi
> 
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> > > 
> > > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
> > >  1 file changed, 31 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
> > > index a234d9b4ed14..3db2ba439bb5 100644
> > > --- a/drivers/gpu/drm/i915/intel_pcode.c
> > > +++ b/drivers/gpu/drm/i915/intel_pcode.c
> > > @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
> > >  #undef COND
> > >  }
> > >  
> > > +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
> > > +{
> > > +	if (__intel_wait_for_register_fw(uncore,
> > > +					 GEN6_PCODE_MAILBOX,
> > > +					 GEN6_PCODE_READY, 0,
> > > +					 500, timeout_ms,
> > > +					 NULL))
> > > +		return -EPROBE_DEFER;
> > > +
> > > +	return skl_pcode_request(uncore,
> > > +				 DG1_PCODE_STATUS,
> > > +				 DG1_UNCORE_GET_INIT_STATUS,
> > > +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> > > +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
> > > +}
> > > +
> > >  int intel_pcode_init(struct intel_uncore *uncore)
> > >  {
> > > +	int err;
> > > +
> > >  	if (!IS_DGFX(uncore->i915))
> > >  		return 0;
> > >  
> > > -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
> > > -				 DG1_UNCORE_GET_INIT_STATUS,
> > > -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> > > -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> > > +	/*
> > > +	 * Wait 10 seconds so that the punit to settle and complete
> > > +	 * any outstanding transactions upon module load
> > > +	 */
> > > +	err = pcode_init_wait(uncore, 10000);
> > > +
> > > +	if (err) {
> > > +		drm_notice(&uncore->i915->drm,
> > > +			   "Waiting for HW initialisation...\n");
> > > +		err = pcode_init_wait(uncore, 180000);
> > > +	}
> > > +
> > > +	return err;
> > >  }
> > >  
> > >  int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
> > > -- 
> > > 2.34.1
> > > 
