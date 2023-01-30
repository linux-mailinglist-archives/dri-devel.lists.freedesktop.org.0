Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B8268179A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 18:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35B810E090;
	Mon, 30 Jan 2023 17:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3D610E064;
 Mon, 30 Jan 2023 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675099835; x=1706635835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HaAry7dFc9CkmQ4c/41JVR4ASck2+Uk7tGXCAeZHFqA=;
 b=LTWjtKv7rNrrPjSMqk6AFXJeWbeK/Vhk0jixRpb3NTok23Kuz8wMQu0h
 WGq/hZTbXF4Lbijo+eiPwfX3e0XAxvodeX6nKJJaN3/VKPR5jd0nJhxTO
 aj9d4ZIEYQUD0q4zC348gXN5A/YprlOxNT9F5Sb3db3Mo7iqZB1ATS1fc
 MHuTwRG2qpQWMvMHbNgJeFXay/MhN2kgOHcm0Eu8Is5ktsRNjZmo95CcT
 tX17dwhSAW+2+2Qn+j3ENZsls9ermmVRKDwOQPHyi0S13tNAsKGrwbP6g
 qQ3ZNn6O3SugJbWJtX7WA01lHzQMQOX8khL/cny2zglal7oLMuRjFF8H5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="413840417"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="413840417"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 09:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="838036811"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="838036811"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 30 Jan 2023 09:30:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 09:30:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 09:30:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 09:30:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 09:30:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KA8cr/WuVa2K9Rp1C3B2u9AGG2PCOi8Y1LhEy9cEAZe9me6/q3HCZdp9WTfDY2/pW8/n8VCfH1JXAp6hnY0zfy4EU9vahZ7TWYxOJ/YcW5dJ5ZOa+xyPZ/vplkXWYTuNCVcIPSEA3Mmc7Xdz7MfxR/Yg26IfssItZ3t5rNU+QM42VAx8d/5cBtDqMFVgRKo6W9Z9NZdOpQdHuYY5wIjWRW3NhxNCfUnWNzIFhmuaoJnjyzXWZ7U5+R4RcV3ZNK1JXjYTAQ89/aoxyT7jYLUUybq6ZGtCpTY5LusV8NCYbyEbIk3SAySQzZtyOxfEJyFmtD0VB2mzwbIDzu3XNaZvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zifz3NFNsTPNR//vxWAwUrvzH2+LcHAuVAeSMYBHYzQ=;
 b=AIVO7k6+y69VjU4wD6mbomzBrhepCQA5C2LKuT+fh329/2J29B7VIhk8yeDbFNu7QgKLaQcBIY3LrzOuFi3P1Is+Fe7UL6GupyoJQf29yCa428cYf0qa+n4MS8X2EM6BRljxQb29Gq/7rVG+vDtZcYKMwSrnfGqH/ijBdmhgfNGU4Eq3lU6cvonMF/ftrRLLKUqlo2+qTBj+14SBZ4rTmNIK8HUQA08nFkgYH947IqSVcXy9XgU4B3UhW8liiJEQm5GetgnAx0Oit4OqXRzirnyZkEjkm4w989P/HseryncuAIblPqYv1bpZIOzBDisucyerzwOv7MQdaTuk6x197Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 17:30:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 17:30:29 +0000
Date: Mon, 30 Jan 2023 12:30:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to
 settle
Message-ID: <Y9f+sGkj2/rJpaMD@intel.com>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
 <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
 <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
 <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
 <Y9eEX95t1i1YRVOk@ashyti-mobl2.lan> <Y9fXFrJp/N0cit18@intel.com>
 <Y9fsgJd7y6aEt/sT@ashyti-mobl2.lan> <Y9fySWFQwTPC1VAM@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y9fySWFQwTPC1VAM@intel.com>
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 816588f7-29d7-4e0f-de83-08db02e7ae1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FxeT4tFkJ9aJkF3e5vgQkR9XDJzcYuH3/VErQE7LQ4d+WiGMNBENz4yxabEGOz0kvo++Zx6K3EVqS9rzl5hBbVLf0HgI6c8JU3lPbtTC2gSoM5jlVthR2hbADKfaAjV7h33ZkS8toHMb1kOPI5bJqRi0bzY53dGhOiPHDeWOayfTkOW5WUWzfQzx6i8vy6hIyyjLLA2O+8wkUA4F/m5bMENhDExfBbp20Mca0qAxphl1igqjqoW9W9nQjKsYTTXL6/vDGTN7Q2rHoTGrfESZgsW0bpsU5bkAwKtpGdqPgOFm6+0F/GL6ykicKyHWtYeaJomGvhNvoQ/utie3GWIi6d1z9kHnpdbzUp6SpJvjCfCozAqbUzyhcdCdNHucB4oTwLnlhIAxDh8B06FWqwvhAtssmpxqqwGjkuh6tJKysctmWEUaDqo7l0zLj0Wwq4av+tOkcrtHMMsu+ya/tX468rIVfv4JIsoQFixErzGD4sek1H2TfoSmnzmQuhHDFsibxfHvjWXdY2MsIrfNf2CMmJ3k5CQjTCRX1fJittJhy7VpBhBFSGZiTsmX7F0PoE94ZlPhJsEnURt1cyYFVZ0BGrAlClxDkZlnUplTHR4wdYorDiWvKIbmxlaXvp1xyj0gKO+lwwzKmOiTOurzxPceYCeL/nhvqb6cUsKxO3ecZSdc2wCxzQfU0DheibvGRP1EJ/evlZLaTdR6I7wSoLcw2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199018)(2906002)(5660300002)(86362001)(44832011)(82960400001)(83380400001)(8936002)(30864003)(41300700001)(36756003)(478600001)(6486002)(26005)(6512007)(6666004)(186003)(6506007)(2616005)(54906003)(4326008)(66476007)(38100700002)(66946007)(8676002)(66556008)(6916009)(316002)(226643001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h/oE1HW1bqgaRLDWB9+ILI3Yi6ck/4D1B5JraYeZVcshdXGJcWCrDbuGNcB+?=
 =?us-ascii?Q?ojoizE806Nv3zoCTrt2nGeol6Tu+dWzArVryjFn/um/guWgOE3MXtFRQRc69?=
 =?us-ascii?Q?jeVJxQWC5K4ak1fq1xz/cQ6n+H6Qatt0/izIQxi7O+caS/SubuBCmtqlLLjd?=
 =?us-ascii?Q?QpdVEIppS99ETOGEHKoDy4G9JOqJUgfyz/11gJbM4dXfe/WPQnuGSW1yI0or?=
 =?us-ascii?Q?McJVFatF97QUWJBv7uBVfR2A5hUSxR3O6PFQzy7q/l8Jf/MXxRVhYcQru8fQ?=
 =?us-ascii?Q?kiizycQMctgqHImCXcawwb+UuXzPSMRheqnroRAiyKIE2053YS4oGMdJRVpt?=
 =?us-ascii?Q?sQjVlJ3ijViz575RPh4j0kNdf9sLinx5N5guTTk5JlkuXXbrg6cMx+cavACQ?=
 =?us-ascii?Q?hwqUVoCurWrLZM6ootepORKpSut4yHzF5BANpfc5zADLdK4NHZb0omU0V++s?=
 =?us-ascii?Q?zuw2JQaQs/YjHBsyEhslro8hSrDNYmLnP8u5uUGaqIREpEcCvs1gqjYf25Y9?=
 =?us-ascii?Q?irJ/9kphgWEDOkLpSNG6+LEUlBuJuMVCoMajhpCCvcGd895/q9K/8d0zh8jG?=
 =?us-ascii?Q?fMdKIQKwj79ck0eAQQGvKrs74hur3NaX+EYLZCqQpqwnwd6hd6po0B0IvB4p?=
 =?us-ascii?Q?RSEhet+b/6Ly5Nv4Qwu8qePiI6v83aLWguZgJ3vqzkSfj+n11wznk7IL8g5E?=
 =?us-ascii?Q?wJjrAtWBqBwr4EIEJzaNPf5ABXaPx2BHCT2sW5m/NJ7t8MuecUE3pIcldTrM?=
 =?us-ascii?Q?ftceksXtR9XQ0Cohl5aVque970m4ic+rBvZVzfVzrryz/7AV/cS0AQHkzdZr?=
 =?us-ascii?Q?u9af5mCVF9f9NKUfivXV9ZiwstJXmxvqa1DEAO8lwdSoG/ROM0H3LloYP8ZQ?=
 =?us-ascii?Q?QjZ9aBUhSWiOmiQrNonNaYO1mN7ay8+hq1X4+iXImKVQoWzfXBGsx+lN02KZ?=
 =?us-ascii?Q?fFnqUIPQn1izi91fx8ZYfDUq5JqxD8Mq7D6WmUkfjxyrtq4pK/icyTXXZ0ob?=
 =?us-ascii?Q?OWmpi8k5JSgkbuzqo71QGHd0/uiI3My7FSQ6qoA3Q5G2tmvRzYjwpC+Dosdo?=
 =?us-ascii?Q?WvejnXzR/LPuZmjZPV5T71b5kB/Nb0w7nQpzOtMv5RlUvHEJ5a4Rx8ph02LW?=
 =?us-ascii?Q?XH1/nceJDmwwh7A+MrDwbbs0Zsi5SHTndJPYmX6MDmNbHm9HpxJrDncU+doh?=
 =?us-ascii?Q?yLypemHV6J4nX6IcmgFXj43rFkT8AyBt1sp0hxxd+rIGEidAunXjiYtv+4qD?=
 =?us-ascii?Q?WkBymbEekZM2OZbG14ObCcA2ikFN3EyxH/bDPiAoEtQHv6eosIrpxxl2Srun?=
 =?us-ascii?Q?0MRCqD3WWRr/iYjvQSnVQtUtoiKcDtQagSjG42wu0C0sC1zjfAPcaWR5vznQ?=
 =?us-ascii?Q?Sea27bCCm5REEijcSPrTDMDvKhH6pyIeszKmnx9p/CMEuh9ubV5vBni0UA4m?=
 =?us-ascii?Q?8uyAZJUyn27H3xXNcIHaE3bFMChFC8iS9Q0nN3OjbA/FovXbQe3QdPUD+DcP?=
 =?us-ascii?Q?BNQmovV+EjAPHpl2h10rIJdudar1tvzKaZQqJG6GVeA9j5Il0s04/xSG9wcp?=
 =?us-ascii?Q?EE8hKwtTMsswhp5HrlOBcx59e9vHiCQGdBZL5kWCSZHVGYqh4TOBelPJFjfV?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 816588f7-29d7-4e0f-de83-08db02e7ae1a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 17:30:28.8816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7hgAhHFDYvJKst9kckK5zj+f5PyYyeg2wc68T17H036rLCLHHEc7A7J1pEi6Mavk1LN6R+Bs6iJuCfP5PRUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
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

On Mon, Jan 30, 2023 at 11:37:29AM -0500, Rodrigo Vivi wrote:
> On Mon, Jan 30, 2023 at 05:12:48PM +0100, Andi Shyti wrote:
> > Hi Rodrigo,
> > 
> > > > > In the call flow invoked by intel_pcode_init(), I've added brief comments
> > > > > where further clarification is needed in this scenario, and a description of
> > > > > the suspicious scenario at the bottom.
> > > > > 
> > > > > -------------------------------------------------------------------------
> > > > > intel_pcode_init()
> > > > >  |
> > > > >  +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
> > > > >                        DG1_UNCORE_GET_INIT_STATUS,
> > > > >                        DG1_UNCORE_INIT_STATUS_COMPLETE,
> > > > >                        DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> > > > >        |
> > > > >        +-> skl_pcode_try_request()
> > > > >              |
> > > > >              +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
> > > > >                                            500, 0, true);
> > > > > 
> > > > > -------------------------------------------------------------------------
> > > > > static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
> > > > > 		          u32 *val, u32 *val1,
> > > > > 			  int fast_timeout_us, int slow_timeout_ms,
> > > > > 			  bool is_read)
> > > > > {
> > > > > ...
> > > > >         /* Before writing a value to the GEN6_PCODE_DATA register,
> > > > >            check if the bit in the GEN6_PCODE_MAILBOX register indicates
> > > > >            BUSY. */
> > > > > 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
> > > > > 		return -EAGAIN;
> > > > 
> > > > what if we fail here because the punit is still initializing and
> > > > will be ready, say, in 10 seconds?
> > > > 
> > > > GG, without going any further, we fail here! The -EAGAIN we
> > > > receive from the test comes from this point. We don't fail with
> > > > -ETIMEDOUT, but with -EAGAIN and the reason is because the punit
> > > > is not ready to perform the very fist communication and we fail
> > > > the probing.
> > > > 
> > > > It doesn't mean, though, that there is anything wrong, we just
> > > > need to wait a bit before "taking drastic decisions"!
> > > > 
> > > > This patch is suggesting to wait up to 10s for the punit to be
> > > > ready and eventually try to probe again... and, indeed, it works!
> > > 
> > > As GG, what I still don't understand is how this extra 10 seconds
> > > wait helps... have you tried to simple add the 10 to the 180 and
> > > make the code 190 sec instead?
> > 
> > maybe I haven't been able to explain the issue properly.
> > 
> > I can even set that timer to 2hrs and a half and nothing changes
> > because we fail before.
> > 
> > Here it's not a matter of how much do I wait but when do I check
> > the pcode readiness (i.e. signalled by the GEN6_PCODE_READY bit
> > in the GEN6_PCODE_MAILBOX register).
> > 
> > During a normal run we are always sure that communicating with
> > the punit works, because we made it sure during the previous
> > transaction.
> > 
> > During probe there is no previous transaction and we start
> > communicating with the punit without making sure that it is
> > ready. And indeed some times it is not, so that we suppress the
> > probing on purpose instead of giving it another chance.
> > 
> > I admit that the commit message is not written properly and
> > rather misleading, but here it's not at all a matter of how much
> > do I wait.
> 
> The commit message was initially confused because it looks like
> we are just adding a wait, without doing anything....
> 
> But looking to the code we can see that it will wait until
> pcode is ready with a timeout of 10 seconds.
> 
> But if pcode is ready in 10 seconds, why pcode is not ready
> in 190 seconds. We are doing absolutely nothing more that could
> make pcode ready in 10 seconds that won't be in 190.
> 
> This is what we are missing here... The code as is doesn't make
> a lot of sense to us and it looks like it is solving the issue
> by the 10 extra seconds and not by some special status checking.

Okay, after an offline talk I am convinced now that we need some
check like this in some place.

But the commit message needs be be fully re-written.

It needs to be clear that underneath, the pcode communication
functions will do a check for ready without any wait, what will
make desired timeout to never really wait for the pcode done
and prematurely return.

at __snb_pcode_rw():

 if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
                return -EAGAIN;

So, for this reason we need to ensure that pcode is really ready
before we wait.

Other options are to handle the EAGAIN return and then wait.
Or even change the __snb_pcode_rw to ensure that it is ready...

Something like:

-       if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
-               return -EAGAIN;
+       if (__intel_wait_for_register_fw(uncore, GEN6_PCODE_MAILBOX,
+                                        GEN6_PCODE_READY, GEN6_PCODE_READY,
+                                        fast_timeout_us,
+                                        slow_timeout_ms,
+                                        NULL))
+               return -ETIMEDOUT;

In the best regular case it will not change anything since the wait
for will return 0 immediatelly... in the worst case we would double
the timeout value, but this would be only in this insane case of
180 seconds anyway and if it goes really really nasty...

But anyway, now the motivation and the source of the issue is pretty
clear, I can add my rv-b there, but I really want a better commit msg
at least...

> 
> > 
> > Thanks, Rodrigo!
> > Andi
> > 
> > > > 
> > > > Andi
> > > > 
> > > > > 
> > > > >         /* write value to GEN6_PCODE_DATA register */
> > > > > 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
> > > > > 
> > > > > 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
> > > > > 
> > > > >         /* In this scenario, the value
> > > > >            "DG1_PCODE_STATUS | GEN6_PCODE_READY"
> > > > >            is written to the GEN6_PCODE_MAILBOX register,
> > > > >            so that the Busy status of the GEN6_PCODE_MAILBOX register
> > > > >            can be checked later.
> > > > >            (When the value of the GEN6_PCODE_READY bit of the
> > > > >             GEN6_PCODE_MAILBOX register changes to 0, the operation can
> > > > >             be considered completed.) */
> > > > > 	intel_uncore_write_fw(uncore,
> > > > > 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
> > > > > 
> > > > >         /* In this scenario, verify that the BUSY status bit in the
> > > > >            GEN6_PCODE_MAILBOX register turns off for up to 500us. */
> > > > > 	if (__intel_wait_for_register_fw(uncore,
> > > > > 					 GEN6_PCODE_MAILBOX,
> > > > > 					 GEN6_PCODE_READY, 0,
> > > > > 					 fast_timeout_us,
> > > > > 					 slow_timeout_ms,
> > > > > 					 &mbox))
> > > > > 		return -ETIMEDOUT;
> > > > >         /* If there is a failure here, it may be considered that the
> > > > >            "DG1_PCODE_STATUS | GEN6_PCODE_READY" operation was not
> > > > >            completed within 500us */
> > > > > ...
> > > > > }
> > > > > 
> > > > > int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
> > > > > 		      u32 reply_mask, u32 reply, int timeout_base_ms)
> > > > > {
> > > > > 	u32 status;
> > > > > 	int ret;
> > > > > 
> > > > > 	mutex_lock(&uncore->i915->sb_lock);
> > > > > 
> > > > > #define COND \
> > > > > 	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)
> > > > > 
> > > > >         /* the first trial for skl_pcode_try_request() can return
> > > > >            -EAGAIN or -ETIMEDOUT. And the code did not check the error
> > > > >            code here, so we don't know how far the __snb_pcode_rw()
> > > > >            function went. It is not known whether the pcode_mailbox
> > > > >            status was busy before writing the value to the
> > > > >            GEN6_PCODE_DATA register or after.*/
> > > > > 	if (COND) {
> > > > > 		ret = 0;
> > > > > 		goto out;
> > > > > 	}
> > > > > 
> > > > >         /* In this scenario, skl_pcode_try_request() is invoked every
> > > > >            10us for 180 seconds. When skl_pcode_try_request() returns
> > > > >            -EAGAIN and -ETIMEDOUT by _wait_for(),
> > > > >            -ETIMEDOUT is returned to a variable ret. */
> > > > > 
> > > > > 	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
> > > > > 
> > > > > 	if (!ret)
> > > > > 		goto out;
> > > > > 
> > > > > 	/*
> > > > > 	 * The above can time out if the number of requests was low (2 in the
> > > > > 	 * worst case) _and_ PCODE was busy for some reason even after a
> > > > > 	 * (queued) request and @timeout_base_ms delay. As a workaround retry
> > > > > 	 * the poll with preemption disabled to maximize the number of
> > > > > 	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
> > > > > 	 * account for interrupts that could reduce the number of these
> > > > > 	 * requests, and for any quirks of the PCODE firmware that delays
> > > > > 	 * the request completion.
> > > > > 	 */
> > > > > 	drm_dbg_kms(&uncore->i915->drm,
> > > > > 		    "PCODE timeout, retrying with preemption disabled\n");
> > > > > 	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
> > > > > 	preempt_disable();
> > > > > 	ret = wait_for_atomic(COND, 50);
> > > > > 
> > > > > 	preempt_enable();
> > > > > 
> > > > > out:
> > > > > 	mutex_unlock(&uncore->i915->sb_lock);
> > > > > 	return status ? status : ret;
> > > > > #undef COND
> > > > > }
> > > > > 
> > > > > ---------------------------------------------------------
> > > > > 
> > > > > If you try skl_pcode_try_request() for 180 seconds in skl_pcode_request(),
> > > > > and the first "intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) &
> > > > > GEN6_PCODE_READY)" call in __snb_pcode_rw() that skl_pcode_try_request()
> > > > > invokes always fails. if then it does not make sense to me why this patch
> > > > > fixes it by just waiting 10 seconds.This is because if it was called with
> > > > > the flow described above, 180 seconds is longer than 10 seconds, so the
> > > > > scenario you mentioned is also covered in the existing code.
> > > > > 
> > > > > To describe in more detail the second scenario I previously commented on:
> > > > > skl_pcode_request() tries skl_pcode_try_request() for 180 seconds
> > > > >  1) In skl_pcode_try_request(), the GEN6_PCODE_MAILBOX register bit is not
> > > > > BUSY, so the value is written to the GEN6_PCODE_DATA1 register.
> > > > >  2) skl_pcode_try_request() returns -ETIMEDOUT value because the operation
> > > > > of 1) does not complete within 500us.
> > > > >  3) Scenario in which the GEN6_PCODE_MAILBOX register bit is checked as BUSY
> > > > > and returns -EAGAIN in the last call of skl_pcode_try_request() invoked by
> > > > > skl_pcode_request()
> > > > > 
> > > > > If the reason why this problem occurred is because of this scenario,
> > > > > shouldn't there be an attempt to increase fast_timeout_us used as an
> > > > > argument of __snb_pcode_rw() to 500us or more when skl_pcode_try_request()
> > > > > returns -ETIMEDOUT?
> > > > > 
> > > > > Br,
> > > > > G.G.
