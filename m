Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B26699CB7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 19:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C3910E35A;
	Thu, 16 Feb 2023 18:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3C610E358;
 Thu, 16 Feb 2023 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676573839; x=1708109839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jg2h8rHaCcZ6N0CO0wB7ROIiR4e7OK4W58hnHI9Sk/A=;
 b=ImjjtoDvJ/WUHgjq4h7NueRX82proq2tWUA+Q2qfOGEAuSw51xHCM5mY
 GLgzPrz2kE5lUybCSneh0nlIW0TZniCXtS1M5k/V3XICW1RfvN6A1LiSV
 Y35yw+fKrsDdPjLhPrGKqFoQ5BM5yWlkEEnOcV+yDPtcN0L1A6XxZfRDv
 jGWquehtBoshVZeTxOeLjNQKDT26MLJK0yX/y6IOJ80DYh8YZ6yAORayx
 DUHTcf6Sr2DlNA/Jj0zcmDnO+lTMZbXZJa2Yy/7xUjPWf4u2qvDQY+rYE
 vytRXr1I158wtKcllDWbVgIm9NpWluwiVENRo0n59CyOzwrqqKC/5R5tK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331807009"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="331807009"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 10:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="620117026"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="620117026"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 16 Feb 2023 10:57:18 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:57:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:57:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 10:57:17 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 10:57:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jatvjpx1nhA83MXt/g1Y30ytdnGpwHRowCARS/Sz567Be0NlxbBYQ7DjY3bCzr/TLH9QnHekuqKTPeHjpZmnhLMgD4XLLCUp9TbnmX+eQqyn4XeiMRYMijYssuhMPOiVMaHVLSNNYcd55SMQRfl6XCICEXP8JkRoMmL1SyqqP3JrkTwg2N+d+pMCzBkh31cOYbiAYirJuEiluc5n4y2hpPjQyEctqQqvf3dY1iaz/jLUzgfv3FZloFlbGPN42cxudwVEG+l0ox67cveKkS4jfYqwQ1l0qAP6xk6T9l01Z1UCIOgJgnVXLmP+O+rn/qwC24lullUhwAcGiWZ8+QrbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkhSq3mENazZDaMJvqzpkK2InZ2Y6c4MH07arSvxIHI=;
 b=X7YRHfwCnPiFAJlrUTmSMskNcGlA5QaWNReXZXzaw1gWI6luM8b95l9rNMf54cYvL9kHwyOraZKZ8BCUdBQUAkDS9re7M8BusqvE+olKYZKfdk2z25pBoPOWBrC6ZMEs3TDczWNkAdSze7fCbOJZusvgqSalDAUobT+sh4hYE9/OhfHBUpbwNyM4SmoAw7x9YqT828sjE61jwXYUPLXEDwTkxbkpJm7ou6Yw7B2ILXWkgsyXC0FQ+XAEy4vxihwSvxQT2rXzRwiBenx8Uz74JeM49zEtwCJYRHIrRrlnSpj8lilg6TouyiGdFAYH+bVEfqz9zEe9R5gSzKUitYthcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 18:57:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 18:57:15 +0000
Date: Thu, 16 Feb 2023 13:57:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Expose power1_max_enable
Message-ID: <Y+58hLJYJYVQ5KyP@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
 <20230214053342.1952226-4-ashutosh.dixit@intel.com>
 <f7a7e280-804f-b397-a8c5-c4dae0451111@roeck-us.net>
 <87sff7tygb.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87sff7tygb.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f09b73-d137-47bf-6057-08db104f9e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0REb/qpE2/orPMf9yxumQZFMGF2hoa/N+A1x7Yra5zYSl1AQQwwNkXXjsVTBfidH9D6WGhk5eUyAKNoXR6yZXBYtbuhMOxgMq+lgLPPdbeP2iWT1jOpqRrfB5jfXjS11Iy5/NF/HQ/LpU8PQNxf1DW5UkOgLzeemFhqz+dSwuS1g2ErlLPbcfWuQ/x2AYa1shKbllSq6l4QY1iN9ixlKIAoFP1C9jPkyiVz2XrY3xnChUdsGSy4JXPbn/WftPVO5y12US0+1gBQaP59IuBCdsaYSrvkA0xCjxwNzsCZprdwcmP3oClRf6sOOCjHRtlOFLU4/cBGtSAN+YeOMfuhG1j+FDZ/mVJry+BAa+SELsl2KOY9rPupgtQDz+Ud/sNk3xkSEq+TbSj2y3KMPf/aeHVlgXiIxB+DzbvEI4j/0KXIIUzhsoKnvDBJKuqWMQ3s459H8yY3nmDApfCZVva5jlLQ3wl6pumyEvngvCwbFtf1fGCX7XO+Y7sOkXLVWHFF/yHOA8FM+KabFaWJv0UXN2roszc5vTAFhgq/XWLLIb1ykxLikT7tLdVL9OF3fcyCnEsTs8cwmBOequ9Q8QR8UtSby++p8ePDrMq2lqx0fjfv0Ex6jiAoK/c4+iW66OhP57GT8G4iHB8fUZeldbLIYcEhGjKivRsdoiQEj7yc+S1BYtCBxdrQ2QtZztXkrPAf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199018)(66899018)(82960400001)(36756003)(44832011)(2906002)(6636002)(54906003)(6862004)(5660300002)(8936002)(66946007)(37006003)(66476007)(316002)(66556008)(4326008)(478600001)(41300700001)(8676002)(6486002)(86362001)(186003)(6512007)(26005)(966005)(53546011)(6666004)(6506007)(38100700002)(83380400001)(2616005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RHRPzUzn3d/lZp9vLpk+IOeiAOw49SQ1WJZMQx0MMjIwOh81jrBFlEl18NbO?=
 =?us-ascii?Q?Ef+5z74Ad6qPSBCAQSd8BU3hYzzob5R2gQ8SGpQzyGlwGw7oFZt7svMvvGrF?=
 =?us-ascii?Q?1SuPNAYjFlmh0LC/jGUIMa2rW2jGez6FZjDbatnvUaBiWR41RetSeXMi1Q74?=
 =?us-ascii?Q?TWUcc9agInGebJtpX8vBMe9XIaxiEPfgywhVhCwdYVTHSjIczL8mPJeiZ9YK?=
 =?us-ascii?Q?017OEOh+CyeabzfqPCKNhsnFOIZgStVkl/vTTLbCHQAdn4RABVUfPiqPEGPp?=
 =?us-ascii?Q?fi8G4QpwKLtaNwZJV0yls8KCOYZNBwt5dRKD+pg29XDQedvoUUK9htLlKR4n?=
 =?us-ascii?Q?y9t4N09pK1uBYnT7xlb3JaXixyq67Zbolgf6qMeM8zltM/Z28kHfZLC0ShNQ?=
 =?us-ascii?Q?nDEKSSWGE8dq485QavfnMC35ObZPcmDd8YwionC6bnmNRHMWVKjHpwxT7zqQ?=
 =?us-ascii?Q?f/A29d4iVusO3khWH7TFhgh7MaSBeJVBn2YA/ubXhyt+NRieoklhhO1lfObG?=
 =?us-ascii?Q?1CGetu6gulHEpb9VsadASdJ70KDfe/qrxs40FNQ8Uq3vgtMP3ALyjwcDOIOu?=
 =?us-ascii?Q?+BdbZo7uHuz1gcMudtjsUjq4l8yPIJXSmuKBYpTT0ZQ4EjDY0GactXgD/up0?=
 =?us-ascii?Q?HFn2krPvUlutFiBNwdYkeCKWVIlyifGSswNh+M6YIJPEFMwuNvQNNCdcge/x?=
 =?us-ascii?Q?PLfSnbxsrBL/+E4d+LMt1QW4Ws5Ie+NCdsvR8Xvo33IG82TjSI7kMqfcA+5C?=
 =?us-ascii?Q?OONI3nKfEZla89mGfnZZIE9Xg3fafIgGHQbKDmaQ/UceGapAyH4hfM8e0h+h?=
 =?us-ascii?Q?dg8msyBd0KLY4ryF0ZPXI627+pFhuqc4hxajW8NkDuFB6In0dhRQzGXtDZ5l?=
 =?us-ascii?Q?AuSoxkHS0MiJnejAq6jIYlvTB+HDfQq4kMwVIpd6ClVZjuNco1uaQt7csca0?=
 =?us-ascii?Q?lG4L8wPH6Q/CQPUoWGJU7zeO4YoarODTdvu8N5u7CrRawJbkL9YSgYnD10ft?=
 =?us-ascii?Q?GAMCsFqvG8n1v0xZp9Eo9licVw0IvIF4OKLPu7LU6+94e+8tCVyLdGJBves1?=
 =?us-ascii?Q?aeanz/x10LlXBPA2M+4aBywb2917T2zGhpYWRxaARNhFwiRWnWSI/97prdi8?=
 =?us-ascii?Q?0Fbc8pozxy1rpabhD7RBqBRAhXK+x6dmQztUhT0+825HxATmuShz2S5ehl2Y?=
 =?us-ascii?Q?5Xpy7uGp0NQ6Nf2697fYfp2e+eornRwvqvZO5rhPdXpJ+j0S/yLduAI4wrFa?=
 =?us-ascii?Q?9jQOjetmlsK3u6ZYqbf2KNCb/8qdM3fWfkOFo3hgJqJZv4KxHDTzU74Y/GU4?=
 =?us-ascii?Q?ebtprpwVdnvAT6DY/bjUn0AfUDmXY7AiOY4HvD68sDPW84EzkCwPBPWL1wKc?=
 =?us-ascii?Q?jTGvkUv0Tl0Pn6IHrao+5YFW/+6mFqK1hk8ImcLmewOuz2WCMcKdlJB/euwu?=
 =?us-ascii?Q?lVENXydrEWWV6FxUO2fJBdiq+gvlBrZbYbAVPMnvCVfbwUozfpHt4h4WXANa?=
 =?us-ascii?Q?rnrJChvREIdGjFKSVrFoiGoIAXCrZfU9vqNIVfnS8jbqvY3RvU4WdoPmiN/E?=
 =?us-ascii?Q?HIhBq83ZVQn9muZQQhbSrnojyLHeQbV6FyotTl977Mo4WbjLqUW4m+JNc6L5?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f09b73-d137-47bf-6057-08db104f9e37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 18:57:14.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdC/crg9cXdhNmSxtXszTCNrB4DOvc/sZIKSv125z67fWyfyUsRnSecZNmaQ3x+Ys7xEWcn2qDQFvw94ASjQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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
Cc: linux-hwmon@vger.kernel.org, Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 gwan-gyeong.mun@intel.com, Guenter Roeck <linux@roeck-us.net>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 07:11:16PM -0800, Dixit, Ashutosh wrote:
> On Mon, 13 Feb 2023 22:16:44 -0800, Guenter Roeck wrote:
> >
> 
> Hi Guenter,
> 
> > On 2/13/23 21:33, Ashutosh Dixit wrote:
> > > On ATSM the PL1 power limit is disabled at power up. The previous uapi
> > > assumed that the PL1 limit is always enabled and therefore did not have a
> > > notion of a disabled PL1 limit. This results in erroneous PL1 limit values
> > > when PL1 limit is disabled. For example at power up, the disabled ATSM PL1
> > > limit is shown as 0 which means a low PL1 limit whereas the limit being
> > > disabled actually implies a high effective PL1 limit value.
> > >
> > > To get round this problem, expose power1_max_enable as a custom hwmon
> > > attribute. power1_max_enable can be used in conjunction with power1_max to
> > > interpret power1_max (PL1 limit) values correctly. It can also be used to
> > > enable/disable the PL1 power limit.
> > >
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
> > >   drivers/gpu/drm/i915/i915_hwmon.c             | 48 +++++++++++++++++--
> > >   2 files changed, 51 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > index 2d6a472eef885..edd94a44b4570 100644
> > > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > @@ -18,6 +18,13 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> > >			Only supported for particular Intel i915 graphics
> > > platforms.
> > >   +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_enable
> >
> > This is not a standard hwmon attribute. The standard attribute would be
> > power1_enable.
> >
> > So from hwmon perspective this is a NACK.
> 
> Thanks for the feedback. I did consider power1_enable but decided to go
> with the power1_max_enable custom attribute. Documentation for
> power1_enable says it is to "Enable or disable the sensors" but in our case
> we are not enabling/disabling sensors (which we don't have any ability to,
> neither do we expose any power measurements, only energy from which power
> can be derived) but enabling/disabling a "power limit" (a limit beyond
> which HW takes steps to limit power).

Hi Guenter,

are you okay with this explanation to release the previous 'nack'?

For me it looks like this case really doesn't fit in the standard ones.

But also this made me wonder what are the rules for non-standard cases?

I couldn't find any clear guidelines in here:
https://docs.kernel.org/hwmon/hwmon-kernel-api.html#driver-provided-sysfs-attributes

We are seeing drivers around to freely use non-standard hwmon.
Are we free to add non standard ones as long if doesn't fit in the defined
standards, or should we really limit the use and do our own thing on our own?

I mean, for the new Xe driver I was considering to standardize everything
related to freq and power on top of the hwmon instead of separated sysfs
files. But this would mean a lot of non-standard stuff on top of a few
standard hwmon stuff. But I will hold this plan if you tell me that we
should avoid and limit the non-standard cases.

> 
> As mentioned in the commit message, power1_max_enable is exposed to avoid
> possible misinterpretations in measured energy in response to the set power
> limit (something specific to our HW). We may have multiple such limits in
> the future with similar issues and multiplexing enabling/disabling these
> power limits via a single power1_enable file will not provide sufficient
> granularity for our purposes.
> 
> Also, I had previously posted this patch:
> 
> https://patchwork.freedesktop.org/patch/522612/?series=113972&rev=1
> 
> which avoids the power1_max_enable file and instead uses a power1_max value
> of -1 to indicate that the power1_max limit is disabled.
> 
> So in summary we have the following options:
> 
> 1. Go with power1_max_enable (preferred, works well for us)
> 2. Go with -1 to indicate that the power1_max limit is disabled
>    (non-intuitive and also a little ugly)
> 3. Go with power1_enable (possible but confusing because multiple power
>    limits/entities are multiplexed via a single file)
> 
> If you still think we should not use power1_max_enable I think I might drop
> this patch for now (I am trying to preempt future issues but in this case
> it's better to wait till people actually complain rather than expose a
> non-ideal uapi).
> 
> Even if drop we this patch now, it would be good to know your preference in
> case we need to revisit this issue later.
> 
> Thanks and also sorry for the rather long winded email.
> 
> Ashutosh
> 
> > Guenter
> >
> > > +Date:		May 2023
> > > +KernelVersion:	6.3
> > > +Contact:	intel-gfx@lists.freedesktop.org
> > > +Description:	RW. Enable/disable the PL1 power limit (power1_max).
> > > +
> > > +		Only supported for particular Intel i915 graphics platforms.
> > >   What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> > >   Date:		February 2023
> > >   KernelVersion:	6.2
> > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > index 7c20a6f47b92e..5665869d8602b 100644
> > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > @@ -230,13 +230,52 @@ hwm_power1_max_interval_store(struct device *dev,
> > >					    PKG_PWR_LIM_1_TIME, rxy);
> > >	return count;
> > >   }
> > > +static SENSOR_DEVICE_ATTR_RW(power1_max_interval, hwm_power1_max_interval, 0);
> > >   -static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> > > -			  hwm_power1_max_interval_show,
> > > -			  hwm_power1_max_interval_store, 0);
> > > +static ssize_t
> > > +hwm_power1_max_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
> > > +{
> > > +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> > > +	intel_wakeref_t wakeref;
> > > +	u32 r;
> > > +
> > > +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > > +		r = intel_uncore_read(ddat->uncore, ddat->hwmon->rg.pkg_rapl_limit);
> > > +
> > > +	return sysfs_emit(buf, "%u\n", !!(r & PKG_PWR_LIM_1_EN));
> > > +}
> > > +
> > > +static ssize_t
> > > +hwm_power1_max_enable_store(struct device *dev, struct device_attribute *attr,
> > > +			    const char *buf, size_t count)
> > > +{
> > > +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> > > +	intel_wakeref_t wakeref;
> > > +	u32 en, r;
> > > +	bool _en;
> > > +	int ret;
> > > +
> > > +	ret = kstrtobool(buf, &_en);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	en = REG_FIELD_PREP(PKG_PWR_LIM_1_EN, _en);
> > > +	hwm_locked_with_pm_intel_uncore_rmw(ddat, ddat->hwmon->rg.pkg_rapl_limit,
> > > +					    PKG_PWR_LIM_1_EN, en);
> > > +
> > > +	/* Verify, because PL1 limit cannot be disabled on all platforms */
> > > +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > > +		r = intel_uncore_read(ddat->uncore, ddat->hwmon->rg.pkg_rapl_limit);
> > > +	if ((r & PKG_PWR_LIM_1_EN) != en)
> > > +		return -EPERM;
> > > +
> > > +	return count;
> > > +}
> > > +static SENSOR_DEVICE_ATTR_RW(power1_max_enable, hwm_power1_max_enable, 0);
> > >     static struct attribute *hwm_attributes[] = {
> > >	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> > > +	&sensor_dev_attr_power1_max_enable.dev_attr.attr,
> > >	NULL
> > >   };
> > >   @@ -247,7 +286,8 @@ static umode_t hwm_attributes_visible(struct
> > > kobject *kobj,
> > >	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> > >	struct i915_hwmon *hwmon = ddat->hwmon;
> > >   -	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> > > +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr ||
> > > +	    attr == &sensor_dev_attr_power1_max_enable.dev_attr.attr)
> > >		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
> > >		return 0;
> >
