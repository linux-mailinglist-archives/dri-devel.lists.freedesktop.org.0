Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A146E4BE8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A406010E033;
	Mon, 17 Apr 2023 14:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382BA10E0ED;
 Mon, 17 Apr 2023 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681743229; x=1713279229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uVRcT4AVm3n4WtN1Gq4dZep9qHgufRTZOvThUsuVLGI=;
 b=oIziMhRRefvxahAfrxRDd0I1FfCxS/vnAooboUROND83oAjROQUSWVSA
 jEzfPlwe1k+aAjCUy15NUeECjBSdvi1warzuFkUnCF4NAL8q2anXRmaMs
 2BaBiNu1b8dYLxx5Ar9GRft6pR8YzvBe2tZlwabB2mO2Stt8o7a6vjH4Z
 CABRy/EEFRAxo5ZBc1q2+0DNZms4Kmu2XP6hrqFf+go7oUAdz8dZD/U02
 eg43c25or2NHx9bxrzk0OirteCG63Pz2RNbdWFI80TXN6/NVboLxjjV3T
 AoItzHqSy8O7yal6ZJLwNEI8rj8diwxG7WYfKW34wa6uP8/5vPp3OGSgx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324533169"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="324533169"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 07:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834451859"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="834451859"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 07:53:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 07:53:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 07:53:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 07:53:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 07:53:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLW0km53Fs82qqTQHfbfvwXXA7YI2GyRJ6FgtjiqR6L1clLT/2Hpmx1r5nBwSGYIiGk8mWJab9e6ZViEbnbZCZYTWiKuCAKAC0L3AChzy9YnwAPXcYGyDVXulCGmzcfkZvBwxgj2sv9iYvCYaTwUFcMfdeSCY8E3rnKQLfQUQjajqU3g5YqPFk64ggGMtfA2oz/zFOqO3ezQ+XD9BobFD3nP0Kf00BA1Buvmqlptizy0uE+U7SBsnTtY6cYPZCXHQdtprhKMWyYM89GNPAUYLQUXQG5DdI8HKXUbksaUCcww7mviz5t6Zgk+JHFrXoylNh6bXicnDjmfSXdT6J6L3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxP/yA9Ae7bKcc4+OPJKYhlIT9TPaFg9CBgjD3gQcpc=;
 b=TS/068Q6N8xJQAchGsZT2xZSll9VXIp6jYhaLwLkBPo8DMW6LkNP3QM6rTwN382s0lw3+45Apf9sU5SBJWKtpWLW+bATV/2KO08lQ6c66xahCehs3fe1fEUJ/k86vWojPc+BnDMfUkuDxJSJ1tVkVSeKhu5rKnORBUZrZvUp7m/uG/NMmXR2A2yYHp9//kzk1+yjzmRePyWD16J1RDwcT2swI0l7ckYVBT7kPvbPMyFDugYkXhMwA61RDq1SEM3clydcyByMOIDJTOa+Xl/OCf6VcekG2TEdiubJhyhJ1yFWM9zKXL//lM2WvePuesDQ301BzKGcqG4WXpaujsiD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:53:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 14:53:35 +0000
Date: Mon, 17 Apr 2023 10:53:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Message-ID: <ZD1daLWcOslJ/wdt@intel.com>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
 <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
 <2177327.1BCLMh4Saa@suse>
 <1b341218-f0e2-a613-2ac6-107064a813ca@linux.intel.com>
 <ZDku5SJhl2Ve51UC@liuzhao-OptiPlex-7080>
 <048d4dba-153f-5d32-75fc-d7e7144d1e9c@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <048d4dba-153f-5d32-75fc-d7e7144d1e9c@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: d888c533-b0e0-4236-b8c7-08db3f5384b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KEbhBh7PSDQIH3zU8fRYEuSQ2qlXSF8IBOV4rrdL27TBzpLs4wkMpapx0lRAq0F9HQMPFAgqsA+QdnTs9eEuXOygiEUVNLwGY7trfLmIa3Dra7qDpafJ/VcTFjzVssyKlozyhxv784dDG0kXpG8ME6woK+CSzfHk8mrJGzrdOr8gx/MiZ3ppoIzcs91FqTWancfidTxOXx+VyAzaS5FceuUOWB3ms3Gt/RourX0qmKyc168XdGD/z36w1RJdUv0V9aTeYuhE9GDQGeG/tgXUJzoTRH2BVbBjdO4Pmo6/Gz1jSG1wB0C9YhxSJDoFFv7J4zUY+uA6WyRNu2bAdqUXUttb9FcQB656nd9ArYhCtGth0nfRAHPivtFD6XrGOMqDx/+zTWaaNHbDpLbaX6RL0OCoRKCJ0u5lkRxYJDJ2sZSl1Ddtryzka7hhz7B0IEOkiG5ihaO40RzRO9T/X5jq1muPRQugX/2VGQHSeLz8xO/8DvnxziPQpHhzHkQCHuQ71HCRH0ocyxyS7cMITMyem9T+0whGusWioYsW6P93XxKc2MFVUXZLwz3EjTjyBoai
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(7416002)(5660300002)(44832011)(2616005)(86362001)(83380400001)(53546011)(186003)(26005)(6506007)(6512007)(82960400001)(38100700002)(8676002)(8936002)(54906003)(478600001)(6666004)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(6916009)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FkpeuuS99DtuExt6wMrEO0ICpVXVmUqqsnHtLEg+V/NQ3RG3qmzBAyztp+lY?=
 =?us-ascii?Q?c4NL2VS0j7jhkla8vIPK7S2rMcG3DhURdXnhUAVqpxNrBxXb2V7d9AzD2DAD?=
 =?us-ascii?Q?/XjTbLUPD67QP3J/CfFUHlC95DHK1TCllSGiEHL/Fm0NFktdixLafv3qbibw?=
 =?us-ascii?Q?uMspxZpYKOKvOMyPrH/88LyDDZG2ljf/w03GOkj7j6KiW78J0h2mFkJGnOUY?=
 =?us-ascii?Q?MJtwbgH0WfgyV0J05mzQXri2TIY8pWIRtKHe6dByFA1Ei/cvSOyNGzwC56B5?=
 =?us-ascii?Q?NQCq7L6Zjfersiec+4LYDisTjB6aIP016AVJ7OZFZQBTvqu8u7cehD07qaPX?=
 =?us-ascii?Q?0W24ui8nq57ePQL4bufqSIIsrsZJzwk8QvE/93dSZZHulBxKoqLE6XOlKvbk?=
 =?us-ascii?Q?sURO+KcLzizawhT/9rrs9zATtU+GvXbWPqvd3+L38qc5bP7KQYG6gFnoiDwJ?=
 =?us-ascii?Q?EHQgCRYNaM2u4mT1PYG2qe9btuWtPygszkuyhTgD9ufnB/wF0r+5Cv2YsqwP?=
 =?us-ascii?Q?y3tI1BgIxUNm9kDilZjcf5MgbrJv/7YzcnywK1y91X7eYY4gnTyB6Wt7tSwA?=
 =?us-ascii?Q?yKv2hi569l1lsBLBraThr5kT8FLk48O0nhgdPla/5uJ4cb/Euncl2sVm4S+P?=
 =?us-ascii?Q?9xjKebqt9eC7+Kz5akKoStj7kMGPocWkU/vYo6ioN3ozaYzBC/adojub+8fM?=
 =?us-ascii?Q?ucrHWsym7EExyyXRnASY3OhpraCBEiaxzsn90nOYpx7HiIon3HsoiFVhgrJY?=
 =?us-ascii?Q?pH7mw/fwVKZZuo7KRDKWTHQzMun5DOqkdDHE1MUub/MpAhsayZLiYjighU/W?=
 =?us-ascii?Q?EIfq3m3fY7UZPo7BqOTfYlwZah9wBpwf7hTCEF4k4tg3BoOJwsqpCrs9KZNk?=
 =?us-ascii?Q?OmT6V81903JU5Ye+vrTI0BIMzLDKGebd1rT+jmGyUe2A/NDH+Us4S2lNDcrO?=
 =?us-ascii?Q?XQXZiY1cEOMkvKgqoRVzdwRftLeTaL5cJuFgSWSK8TBg4dn7xvGNhDivr1QU?=
 =?us-ascii?Q?65s6EUbhl+Y7oMljQPUYd2NHL0vi3d1zzYrNs70d311AC53N0qJvEPIrLaiR?=
 =?us-ascii?Q?iXaZdGBKES2aLsEQIvXqNIzmdst25/FYpVdA6Z45CptB3cxGzw0Ds/JZz9BP?=
 =?us-ascii?Q?/QK18hrqKAKuqxUWmMTut3rpPLVCqJsN2pmG8q7l9pzNzX/5CdlmZncdqhJA?=
 =?us-ascii?Q?nXc3bMJNH9VA2/9CRKXKBBjlRC+8oDL0L/nu+4V6XgX/zbOsUikf8G4eCf4D?=
 =?us-ascii?Q?3M6UxF4fEx2gnC8QbIolRInrNGg9SkI6+LbP/Xo2yuqT+z4PqrzSVoXojDMm?=
 =?us-ascii?Q?Pcl8y4gpl9kEjpvP3wKZ7z97oBWHlAEtVihOTvleNPqBPRrUlDivnrKEbaRn?=
 =?us-ascii?Q?seGhqMWJLcvYjIjv66z5aAXCH54sD/sN0pk/SXmxSYNpgGjo+wUqBuV35ydx?=
 =?us-ascii?Q?DIyzffzqIBYh4fEFMyq31GiEttgZHpeHVCOALM94EGsVfFZVaS2IzJMQt0/J?=
 =?us-ascii?Q?zImKvarQtYApndwSG0w9xmx3S0JTKh0eYUgZda1nbF+DN9eMgJjMCMrWHHYM?=
 =?us-ascii?Q?iUZ1hV7fIA3kOWRfFyfAfjgSqeeiG2UP/6Ke2zDV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d888c533-b0e0-4236-b8c7-08db3f5384b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:53:34.9435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UniaKW6M/9DCt0tshrtXGEigBE17RsZ9v+ZIkynQOHlBcsANiGLp1lAlfej9IMwF6JGJ4ms7Qo02hVFvPzFww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
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
Cc: dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Zhao
 Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 12:24:45PM +0100, Tvrtko Ursulin wrote:
> 
> On 14/04/2023 11:45, Zhao Liu wrote:
> > Hi Tvrtko,
> > 
> > On Wed, Apr 12, 2023 at 04:45:13PM +0100, Tvrtko Ursulin wrote:
> > 
> > [snip]
> > 
> > > > 
> > > > [snip]
> > > > > However I am unsure if disabling pagefaulting is needed or not. Thomas,
> > > > > Matt, being the last to touch this area, perhaps you could have a look?
> > > > > Because I notice we have a fallback iomap path which still uses
> > > > > io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is
> > > > > safe, does the iomap side also needs converting to
> > > > > io_mapping_map_local_wc? Or they have separate requirements?
> > > > 
> > > > AFAIK, the requirements for io_mapping_map_local_wc() are the same as for
> > > > kmap_local_page(): the kernel virtual address is _only_ valid in the caller
> > > > context, and map/unmap nesting must be done in stack-based ordering (LIFO).
> > > > 
> > > > I think a follow up patch could safely switch to io_mapping_map_local_wc() /
> > > > io_mapping_unmap_local_wc since the address is local to context.
> > > > 
> > > > However, not being an expert, reading your note now I suspect that I'm missing
> > > > something. Can I ask why you think that page-faults disabling might be
> > > > necessary?
> > > 
> > > I am not saying it is, was just unsure and wanted some people who worked on this code most recently to take a look and confirm.
> > > 
> > > I guess it will work since the copying is done like this anyway:
> > > 
> > > 		/*
> > > 		 * This is the fast path and we cannot handle a pagefault
> > > 		 * whilst holding the struct mutex lest the user pass in the
> > > 		 * relocations contained within a mmaped bo. For in such a case
> > > 		 * we, the page fault handler would call i915_gem_fault() and
> > > 		 * we would try to acquire the struct mutex again. Obviously
> > > 		 * this is bad and so lockdep complains vehemently.
> > > 		 */
> > > 		pagefault_disable();
> > > 		copied = __copy_from_user_inatomic(r, urelocs, count * sizeof(r[0]));
> > > 		pagefault_enable();
> > > 		if (unlikely(copied)) {
> > > 			remain = -EFAULT;
> > > 			goto out;
> > > 		}
> > > 
> > > Comment is a bit outdated since we don't use that global "struct mutex" any longer, but in any case, if there is a page fault on the mapping where we need to recurse into i915 again to satisfy if, we seem to have code already to handle it. So kmap_local conversion I *think* can't regress anything.
> > 
> > Thanks for your explanation!
> > 
> > > 
> > > Patch to convert the io_mapping_map_atomic_wc can indeed come later.
> > 
> > Okay, I will also look at this.
> > 
> > > 
> > > In terms of logistics - if we landed this series to out branch it would be queued only for 6.5. Would that work for you?
> > 
> > Yeah, it's ok for me. But could I ask, did I miss the 6.4 merge time?
> 
> Yes, but just because we failed to review and merge in time, not because you
> did not provide patches in time.

It is worth mentioning that under drm we close the merge window earlier.
Around -rc5.

So, Linus' merge window for 6.4 didn't happen yet. But our drm-next that
is going to be sent there is already closed.

> 
> Regards,
> 
> Tvrtko
> 
