Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C59681687
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 17:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B82510E0F8;
	Mon, 30 Jan 2023 16:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7519510E0F8;
 Mon, 30 Jan 2023 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675096659; x=1706632659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6zlj6RR9tjWDFgW5zHWje0/3QkzQz2FRU7f2O5RXuDE=;
 b=D4cad29UhCwhwAbz6xaiJeedMc59Elr0SzXyAb7QTlwf48TN+dNU618W
 Ph6bFxdQiXN0FoSaqHqKffRQfAAQ7SJYZcz6yOGjGTxTIUmS2YYVal0To
 dJJWEAF9JsjwwxczRVW6/uof2fu00aJM5tj8OH9VtJzjzc7zbMMCrNi8C
 y4Ze7dskVg9dK8TGIwmw98iTlpkTaVvPWOH4mt1WJfxOqvrGaFENZJ5qi
 5+ZWQO9GOw7EDY2zg6Ia7xrF+8WrXoiacwu3UOR8CBeMPL1HMj8EFn8Fh
 ppnBeutvKuB8jl3eX5gDzq8YHEAfVFRBHpLTkbft5e9bZSCeHrS4iYBhw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="328882224"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="328882224"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="657523258"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="657523258"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2023 08:37:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 08:37:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 08:37:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 08:37:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 08:37:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/ckMYXIXQVDXX3xsTnvEsStQDZE9gRaumSbkDoBwbVuwTArF9+/NkzEenajeAxycZKFeJSz6vxjOS3U7VPNEKfOzGIcr4iIZhGN4qkxWJ6DkulUuX9vFEqwVRQTWZOkcUOUW5GFckgL2kbyNhOsdIZ62b7RacbJnfbZ4ZgMMHf/le2cR9kDoVyxDwvam4e/quOuUH2rLcqLwhBbLIA9s+d7Q4Fo5RlpOrC7b92m+3O7dXywwbWXwiVmy5JhMX64Qh+BKFdNU349CeLan1D25m6b7Yfheo+YUTWFa3y701KciZ9setqaFQnnATXKVdiOZA1htYiD2A8j1nDcp7w2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+e2ypEnuWOcy7ZjvZ4EVp7zBYOC0gfdjEbKFX1i13c=;
 b=oWG3/f0yORtZ47Mc10EA3nv+iGmwyY3JV7sTgb+lPdP30GCdWGdkCMeupxIYfG9QIFl72NpxYUpWdk+XJX+S+MxJAmYx7xuCovZjfLAHRE3Llbmr9p3NAk86jxzmS90a3OXp5c+orrg/y5BUiRqyXcVN0qQtT8LhSmfnKZ+bMY5KggxqlP20/62OfoI5zd8D8MN4uuRtigFIFTWhf5OHjTTQ+Dzzmp2U4wwed/xVMCXWfTqTxrs6R630EeKplcsw1wBPfifjWUkXqbGeq6dr3ispe1She3VrI0eD0SgOUdFy1l2IQEJtJc8HvzE+QgNVS2wIQxQvgcVCN2eMfbvPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 16:37:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 16:37:34 +0000
Date: Mon, 30 Jan 2023 11:37:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to
 settle
Message-ID: <Y9fySWFQwTPC1VAM@intel.com>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
 <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
 <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
 <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
 <Y9eEX95t1i1YRVOk@ashyti-mobl2.lan> <Y9fXFrJp/N0cit18@intel.com>
 <Y9fsgJd7y6aEt/sT@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y9fsgJd7y6aEt/sT@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: d118bf3e-a1a6-4d0f-5bb0-08db02e049cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2rSRURKcChsypaTWTvwqCpmnwxUkuPbfpkbl4tU2hMXFoPIZKPZpELpIbOGszuxCyNCqe9KNNkiLsKT+rUo2MvuqIOclAGyYr5Jj3QnETumj+mhGgXa0y4jdx9K7zb1Pa/Ae7YvXRKBqMPy3obihMC24mRHjYy6gSAM04qLyRPv9svz15csMb+s0/yhBDAaeTfUYkcWXU5gwYCTQJ8yCyQYQML6GT/0YAvpxYg03X/+0KhCiNQL1SWWUb67fsj9OU2xmaoC25POytJAJHuLmOvtzIdOc42tqamLbaZbvVBdPvwENg+vqzDYyUMPAlDC/cKyRe5aOvIAa9P0eW3KxDuVK0irL7WiK73EtLRa0VDduJIGSRiv/Pt9AqrWdlwAx1AmcAwPzltcHsCyIO+d6e6GQRxWoUUCPh7wuOkfYGMglI8Xh+4pvfzbu0ruh4NssXCvVJkd/zMhBvULHe1j7iUdzjy/5N2p6y9XnZ+C3OqyGBfgQhDLWVA34KOhw/EpWElAXbBozHAN8WGcDQk/Vj3IPuhPGlENH3UvhPpOSROWH88hdZChMtafHDYpzW/VorGo+Bca5zmPcxEXpqIr/oXasW8EyL2LbP2q0aGjDteoM15klt7wE8Kw6zb7zdr1ZQgLJw+8hd6LmX8ykdFEIQvcpx6qiuSap7GfH28OWOa+pd30opu7cGi/K0o01AduZEmhQmVtiSd+e3/Pyyw8Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199018)(86362001)(82960400001)(38100700002)(36756003)(8936002)(316002)(5660300002)(54906003)(66476007)(66946007)(4326008)(8676002)(66556008)(6916009)(2906002)(44832011)(83380400001)(2616005)(6486002)(478600001)(41300700001)(6506007)(6512007)(26005)(186003)(6666004)(226643001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5tK+YW7pEaRabmfV1hxPnYOGVhG5fID3PFWexSyy9LTR3nBUyPwcQqekYUXy?=
 =?us-ascii?Q?sG9qb7AWcn3AOfC2y9PPuCNlNqoLjb/qWLP6lVZXt982yTUwLBi1sRJpBqzT?=
 =?us-ascii?Q?SvfvvpkTcqOK5fHqmUW9UqlZpiqS9OVUws5umv14u+3r86MKMO5GYWOjxzQG?=
 =?us-ascii?Q?X5uArdceSxsbgLBI5w9UqjWWk4lEmz/mTTm9VisBLmVPWsE4likbWjxA9uFp?=
 =?us-ascii?Q?ka3qcQsem3x/EJSo2e/dzN/x5QVFVoKv2dfDMDoL1i97ptrLrcVgH0lD0OZx?=
 =?us-ascii?Q?5YfAcUxds4XR9BAmELU9SSb2yghIXVSFBQkuf3HdNB4v5WM8EzlhFWb0tlCT?=
 =?us-ascii?Q?MVXOazTWRG1W6tdVozcHk7CQUAkUanC+2UCRcCFytJmUXvESlYMA1APYa9dN?=
 =?us-ascii?Q?VeHDKKg/YGvhYm0nLKrk15zhyLQOvesKcoYHCS4y+jmWFwuJyrcg3/eSisqu?=
 =?us-ascii?Q?6rfHBevNRoQ0sgmjgjnTm0sqDzEbPKboObu1Q5ovY+j+PflwYk5ifjFOLd/4?=
 =?us-ascii?Q?j7z00I+wE/LMFhFEbDuvw7dG2aJvbYwK0TgYWBP7rkLZ/rr/nnEQoYpQFWtj?=
 =?us-ascii?Q?Ib5sTKv6YBxDZ0l42fU9YE8PTksli6dCSogKOtReRedAnEB6T5/svBxB5Rum?=
 =?us-ascii?Q?7pZsHTmO438gnMq3mKsavK3MjWJ+yD6BOwD8Lt1a2T5PnuQLTcNAii84lX1n?=
 =?us-ascii?Q?fvEE/OrkqAgSnZSxVQPoB6hDsHZgLgnof4jT9wyVxg23/nygZXEytJagpnvc?=
 =?us-ascii?Q?4bUTFiR80e/nPZhK1Vz8HXPQ+v+mnGeG+hMH85gBFLOK3YHTZRvuY+qcx6VK?=
 =?us-ascii?Q?i+hgxkB6qMegvRUmuVxhMmQRNEiGvUa5Af/ZOvQfvbD5a3GwCF8MyLBGKlH7?=
 =?us-ascii?Q?UaivY4Bw2oqYmEVTOEt+69VTHvL6d75Rr7ctBwgzc0tcx3MGv/Avx6wOmcck?=
 =?us-ascii?Q?KnXjDbPi/T4sNWvLr11eILE1pgeOzVNszs1FhCBa8kRyz/r3AHbWIr4ZCyOX?=
 =?us-ascii?Q?tnDnkCtdpO1HaY33sRCWoM1h3uOoHDs3sa9Ehptdb0exkKnoWKVR1hhZQcJC?=
 =?us-ascii?Q?asjNaxhPNnrE4JhS2CnkojCP5XEH4owy8FP8ZZXBExQxXkyFPc/9W/bnmXBA?=
 =?us-ascii?Q?ZPtg7sOmTSFWZui7UUxGo2WzjT+M+JQG1IfnuKdEBVlk5KRhuXkR/EdALweo?=
 =?us-ascii?Q?Hu5qJMp0ljZ84W13p+sLdYolaBFULx+Nu9s4vmw6hJ4fz6JwcKw1L/wizPtt?=
 =?us-ascii?Q?BHtMGJHsOgt4VwNHbX8RFsoX3U1OqFxJufAvVAXmK9G9JWy2jaZeXf2ysek3?=
 =?us-ascii?Q?Hnr19J8JVuiYl2uZVEQ1w7qXwMj0eNPPHeBuNXiYz8WUeYrYbMoq+0VINKea?=
 =?us-ascii?Q?dhVjd3PtnQHa5peb2NqXE6ewr9COGi1Y+CCwYps2ES2rfMC/d4GxOlVOd2O2?=
 =?us-ascii?Q?REvz2+vemhbudI0voqxLQpJaITDVAe8GIyNIqWKTYCejWw1n5JVRhAQKoYl+?=
 =?us-ascii?Q?XaAxECvZNgrEfbpUf5MAZV7sDyPna33Y/YdFtWvj2BgoNY69f06fGF4rfJuO?=
 =?us-ascii?Q?6VIVJRJK2rqvhQmXou8E2FnCfUtNFC3eZqe93E4VaCQl6kQskc5UML+eRJoy?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d118bf3e-a1a6-4d0f-5bb0-08db02e049cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:37:34.0487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuI2jFhCnZ1Y7pMcGVgMt1a2Pw9eNdehXF0SM4kyITTqopSEFFmx+bwfRZyZuP3VlCpDgoFs1njMsJnwJ9gKqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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

On Mon, Jan 30, 2023 at 05:12:48PM +0100, Andi Shyti wrote:
> Hi Rodrigo,
> 
> > > > In the call flow invoked by intel_pcode_init(), I've added brief comments
> > > > where further clarification is needed in this scenario, and a description of
> > > > the suspicious scenario at the bottom.
> > > > 
> > > > -------------------------------------------------------------------------
> > > > intel_pcode_init()
> > > >  |
> > > >  +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
> > > >                        DG1_UNCORE_GET_INIT_STATUS,
> > > >                        DG1_UNCORE_INIT_STATUS_COMPLETE,
> > > >                        DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> > > >        |
> > > >        +-> skl_pcode_try_request()
> > > >              |
> > > >              +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
> > > >                                            500, 0, true);
> > > > 
> > > > -------------------------------------------------------------------------
> > > > static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
> > > > 		          u32 *val, u32 *val1,
> > > > 			  int fast_timeout_us, int slow_timeout_ms,
> > > > 			  bool is_read)
> > > > {
> > > > ...
> > > >         /* Before writing a value to the GEN6_PCODE_DATA register,
> > > >            check if the bit in the GEN6_PCODE_MAILBOX register indicates
> > > >            BUSY. */
> > > > 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
> > > > 		return -EAGAIN;
> > > 
> > > what if we fail here because the punit is still initializing and
> > > will be ready, say, in 10 seconds?
> > > 
> > > GG, without going any further, we fail here! The -EAGAIN we
> > > receive from the test comes from this point. We don't fail with
> > > -ETIMEDOUT, but with -EAGAIN and the reason is because the punit
> > > is not ready to perform the very fist communication and we fail
> > > the probing.
> > > 
> > > It doesn't mean, though, that there is anything wrong, we just
> > > need to wait a bit before "taking drastic decisions"!
> > > 
> > > This patch is suggesting to wait up to 10s for the punit to be
> > > ready and eventually try to probe again... and, indeed, it works!
> > 
> > As GG, what I still don't understand is how this extra 10 seconds
> > wait helps... have you tried to simple add the 10 to the 180 and
> > make the code 190 sec instead?
> 
> maybe I haven't been able to explain the issue properly.
> 
> I can even set that timer to 2hrs and a half and nothing changes
> because we fail before.
> 
> Here it's not a matter of how much do I wait but when do I check
> the pcode readiness (i.e. signalled by the GEN6_PCODE_READY bit
> in the GEN6_PCODE_MAILBOX register).
> 
> During a normal run we are always sure that communicating with
> the punit works, because we made it sure during the previous
> transaction.
> 
> During probe there is no previous transaction and we start
> communicating with the punit without making sure that it is
> ready. And indeed some times it is not, so that we suppress the
> probing on purpose instead of giving it another chance.
> 
> I admit that the commit message is not written properly and
> rather misleading, but here it's not at all a matter of how much
> do I wait.

The commit message was initially confused because it looks like
we are just adding a wait, without doing anything....

But looking to the code we can see that it will wait until
pcode is ready with a timeout of 10 seconds.

But if pcode is ready in 10 seconds, why pcode is not ready
in 190 seconds. We are doing absolutely nothing more that could
make pcode ready in 10 seconds that won't be in 190.

This is what we are missing here... The code as is doesn't make
a lot of sense to us and it looks like it is solving the issue
by the 10 extra seconds and not by some special status checking.

> 
> Thanks, Rodrigo!
> Andi
> 
> > > 
> > > Andi
> > > 
> > > > 
> > > >         /* write value to GEN6_PCODE_DATA register */
> > > > 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
> > > > 
> > > > 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
> > > > 
> > > >         /* In this scenario, the value
> > > >            "DG1_PCODE_STATUS | GEN6_PCODE_READY"
> > > >            is written to the GEN6_PCODE_MAILBOX register,
> > > >            so that the Busy status of the GEN6_PCODE_MAILBOX register
> > > >            can be checked later.
> > > >            (When the value of the GEN6_PCODE_READY bit of the
> > > >             GEN6_PCODE_MAILBOX register changes to 0, the operation can
> > > >             be considered completed.) */
> > > > 	intel_uncore_write_fw(uncore,
> > > > 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
> > > > 
> > > >         /* In this scenario, verify that the BUSY status bit in the
> > > >            GEN6_PCODE_MAILBOX register turns off for up to 500us. */
> > > > 	if (__intel_wait_for_register_fw(uncore,
> > > > 					 GEN6_PCODE_MAILBOX,
> > > > 					 GEN6_PCODE_READY, 0,
> > > > 					 fast_timeout_us,
> > > > 					 slow_timeout_ms,
> > > > 					 &mbox))
> > > > 		return -ETIMEDOUT;
> > > >         /* If there is a failure here, it may be considered that the
> > > >            "DG1_PCODE_STATUS | GEN6_PCODE_READY" operation was not
> > > >            completed within 500us */
> > > > ...
> > > > }
> > > > 
> > > > int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
> > > > 		      u32 reply_mask, u32 reply, int timeout_base_ms)
> > > > {
> > > > 	u32 status;
> > > > 	int ret;
> > > > 
> > > > 	mutex_lock(&uncore->i915->sb_lock);
> > > > 
> > > > #define COND \
> > > > 	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)
> > > > 
> > > >         /* the first trial for skl_pcode_try_request() can return
> > > >            -EAGAIN or -ETIMEDOUT. And the code did not check the error
> > > >            code here, so we don't know how far the __snb_pcode_rw()
> > > >            function went. It is not known whether the pcode_mailbox
> > > >            status was busy before writing the value to the
> > > >            GEN6_PCODE_DATA register or after.*/
> > > > 	if (COND) {
> > > > 		ret = 0;
> > > > 		goto out;
> > > > 	}
> > > > 
> > > >         /* In this scenario, skl_pcode_try_request() is invoked every
> > > >            10us for 180 seconds. When skl_pcode_try_request() returns
> > > >            -EAGAIN and -ETIMEDOUT by _wait_for(),
> > > >            -ETIMEDOUT is returned to a variable ret. */
> > > > 
> > > > 	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
> > > > 
> > > > 	if (!ret)
> > > > 		goto out;
> > > > 
> > > > 	/*
> > > > 	 * The above can time out if the number of requests was low (2 in the
> > > > 	 * worst case) _and_ PCODE was busy for some reason even after a
> > > > 	 * (queued) request and @timeout_base_ms delay. As a workaround retry
> > > > 	 * the poll with preemption disabled to maximize the number of
> > > > 	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
> > > > 	 * account for interrupts that could reduce the number of these
> > > > 	 * requests, and for any quirks of the PCODE firmware that delays
> > > > 	 * the request completion.
> > > > 	 */
> > > > 	drm_dbg_kms(&uncore->i915->drm,
> > > > 		    "PCODE timeout, retrying with preemption disabled\n");
> > > > 	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
> > > > 	preempt_disable();
> > > > 	ret = wait_for_atomic(COND, 50);
> > > > 
> > > > 	preempt_enable();
> > > > 
> > > > out:
> > > > 	mutex_unlock(&uncore->i915->sb_lock);
> > > > 	return status ? status : ret;
> > > > #undef COND
> > > > }
> > > > 
> > > > ---------------------------------------------------------
> > > > 
> > > > If you try skl_pcode_try_request() for 180 seconds in skl_pcode_request(),
> > > > and the first "intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) &
> > > > GEN6_PCODE_READY)" call in __snb_pcode_rw() that skl_pcode_try_request()
> > > > invokes always fails. if then it does not make sense to me why this patch
> > > > fixes it by just waiting 10 seconds.This is because if it was called with
> > > > the flow described above, 180 seconds is longer than 10 seconds, so the
> > > > scenario you mentioned is also covered in the existing code.
> > > > 
> > > > To describe in more detail the second scenario I previously commented on:
> > > > skl_pcode_request() tries skl_pcode_try_request() for 180 seconds
> > > >  1) In skl_pcode_try_request(), the GEN6_PCODE_MAILBOX register bit is not
> > > > BUSY, so the value is written to the GEN6_PCODE_DATA1 register.
> > > >  2) skl_pcode_try_request() returns -ETIMEDOUT value because the operation
> > > > of 1) does not complete within 500us.
> > > >  3) Scenario in which the GEN6_PCODE_MAILBOX register bit is checked as BUSY
> > > > and returns -EAGAIN in the last call of skl_pcode_try_request() invoked by
> > > > skl_pcode_request()
> > > > 
> > > > If the reason why this problem occurred is because of this scenario,
> > > > shouldn't there be an attempt to increase fast_timeout_us used as an
> > > > argument of __snb_pcode_rw() to 500us or more when skl_pcode_try_request()
> > > > returns -ETIMEDOUT?
> > > > 
> > > > Br,
> > > > G.G.
