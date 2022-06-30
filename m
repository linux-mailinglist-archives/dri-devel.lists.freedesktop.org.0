Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B9561F29
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 17:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831B010FD7E;
	Thu, 30 Jun 2022 15:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A3810FC13;
 Thu, 30 Jun 2022 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656602728; x=1688138728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sBMChuLMSF8Q8sGznwWeotfltJdQouHuRn4L4s1Zans=;
 b=dTw1NbGIqkK3T2bRIqphCLVPsC6ySegDBIs6sX7hVznGvNfRE0iHAYsq
 N/JqQdo20QaqfW40Uxv9QUn/cS2di1LouIqC3g6OjUkGnmJf0zq/aHF/F
 fCqRtIFrgakqdUqtmSMUJR+pQW3h6+etMF1o8yCuxiH3gK2Vd+dJDFpV2
 t5uYvk7C9GWkUxpDPJV33VozkEx3emHRyxvaUyPgIwMJI8O+HeeIU0/nq
 6oDrGWAU74DFS98AplqoRik9de3PE1zuS9NpYlDwmx8tXgp4AxMwitV1z
 r1pXLuM6G8uqz4ybkrTMdowQF194PYmO9469A4Wgscvm1jSY7RPcuujjc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283112750"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="283112750"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 08:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="623768074"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga001.jf.intel.com with ESMTP; 30 Jun 2022 08:25:27 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 08:25:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 08:25:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 08:25:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 08:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2uoyrP4eLOYkFwafdE2/pO9WYZQlWEIJxPy3H2ZzI2twV2VEcS8/5TwHUQjcmuUHw5yLhkssmqUPX42X8k16XRB+kYcDXT1h2Th2wrEiJwHCWv906sFFWJ7WUvqo61rRBIiHv4lM6csX5MoWLrxIsCoMh+KGwvNXrFsVf94Nytd4rw0LxKhudmrFo9nW4bGFfzcFjGFq0UkRHNikT0Uvhb2/oV1F2F21Z6p6Sbb4n25RL5+jacmPIfFETpG2/nhq5S6phxrhu+e1j33FqMhOwHOJ+IIZCqoSPhFKyN3QK353wRcgOoUbNTqWbl+832DvbZUGZG03Zz2DjeP2cZH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glLSgqXROnj6SPYuYH3QDy76AXrmWdBkl3ty1y/xa3w=;
 b=FN/x22TUIpUHDp+ZOfOrLPy7cN96gw5IjE6vc+R63Ik4B4bymDWYMn9PMGWrehmHt28RrEucHpLVOy0F6OgBQTpU/aZAN1QXdVJWcUymHSkC1v5+gGDgqvQjdgJj2pXxKivin5OXcnquC0u29nelj3S7EmucagCDHlkLL+VtBMDZFJP5ghsEFJv+LoQix4CIvgSrD41xHD1nObbPfLhViLHUpON3k40hWogcUE5bKPm+HtPIaAJ6/cdbeHp3Kxv0GjFSkSmUuI6RlHskl27gm4v4CyxI9N/GbOQUc28jHRRRD6Gsi1yO41fTSjm36zm3LSEtcuG+TZUaOa/oxl2aJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB1699.namprd11.prod.outlook.com (2603:10b6:404:3c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 15:25:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%7]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 15:25:25 +0000
Date: Thu, 30 Jun 2022 11:25:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: How to convert drivers/gpu/drm/i915/ to use local workqueue?
Message-ID: <Yr3AYICeIr56B095@intel.com>
References: <bdf23a1c-0d89-c395-4a7a-2840ce5f639a@I-love.SAKURA.ne.jp>
 <98c6d61e-0c0f-e385-6100-6b7ebe6874b1@linux.intel.com>
 <c379bbe5-a416-7757-b0e3-1b767bb5a775@I-love.SAKURA.ne.jp>
 <703244a5-f2c9-adfb-892f-dd2353cf384e@linux.intel.com>
 <f15c7336-10fd-cd86-a95f-aec99154319b@I-love.SAKURA.ne.jp>
 <b21d9f1e-65e3-8f2f-a5c3-04bf866823e3@linux.intel.com>
 <Yr2sJBdZ3TnXZF+s@intel.com> <87wncynrtd.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wncynrtd.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7be1677-a2f0-4d3e-c3c7-08da5aacc115
X-MS-TrafficTypeDiagnostic: BN6PR11MB1699:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BjqO264AyhQY2HenESWcH9Eo9QnaQoNyZV5jvfFUmJhn6oM4kAtX9ACYVpinKT3IpvQycFqpG4h90BdTRKPUDpCTJWt6w7ppwUpE4i+3b73bjzyrLT/m7lEZuhSvbYfxr+Qe+I3jzNZfbyVUNclW9pyxSfmIg9uFhMKYw6uLekT/2uljYqnIMzwgDcKmrAdyJ7++dOEcU20CgDebKS85fPmVz8jTIYfJh/wCICoH0lNr44W+3uygIHzLXlojXEvWSC9ppls1tOdLwUU6/6D+W0wjVMUV2P2H8Hao7qUJaRrKEwaCuArfK+c8U/9vquY8xhblaK9haRaPr2g/qAI88OhBW9I2ZN2A5BGjn9V0HO009K6U0vZF7Mqb5eFTS9/70MZVuPIP4a5IFzg4ebzkUll1UcgdMu9PuW0QTVP2pQ+hnrb0UQ8GBDLfEg9uqqUwz8SzBXX2QH12ZjsBzKJgIyFm3mYRFaAN/Y5Qa/9j1eFyHgT359Tezvcet2ID1EUlxBqUvGAmNhA3wAIGfoCnC5nS/e9DIJT5PZmHThgvp3DX18UVGeasEMDei2d9ZX7XLh5hz0iz24HkV4YGiUR4CrFdp5s7vofUb0hlK36KIJUJ51xqD7Fu4thxly5hPqLE5g3ZQI5Rj9OMI9jfAebfASZsYk6k4Ffpmww7P2DBjL86YYKwSr8nzvzeohTJgj6kMjFsUlGPgZTjVJqhbdPZV7wV6sb/ZaDITI8ra8rgtptxzUgdPl/zejUDgDpVM0PmFepWFsFYo2FHy+KAZ+YNuump6dBSaxVg8BXRr/QSyTshSK437y8YhOIW+O4YtzcU5+JQcW4VXvUAImhSdrhdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(66556008)(8676002)(4326008)(66476007)(5660300002)(8936002)(66946007)(44832011)(2906002)(6666004)(2616005)(26005)(38100700002)(86362001)(6486002)(41300700001)(82960400001)(316002)(83380400001)(966005)(478600001)(6916009)(54906003)(186003)(53546011)(6506007)(36756003)(6512007)(99710200001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?It8oOgXLOnnEQdJd1bmG/21vevUm3Jz3IDuKoeAmfYWE/ufIgH2PMoOAvPVj?=
 =?us-ascii?Q?1sktmt1/0vV2/r4MDt1zTZD1pa8ZrODT7Lici079H2O+FTuDCoOnF5SViO2A?=
 =?us-ascii?Q?/v/OFx5evI4nIPQW9DsgExUedNrt95xthHu7cbsL9DMqWnUiXa60f8zbFgF1?=
 =?us-ascii?Q?X2uzQhGhIejUgOTPNLsYeK7NLlo25PrOOT8lfTURjWwvg2D1K1dirLE+FJfM?=
 =?us-ascii?Q?Kk9nRV6vgndMGt4+ebW5jyDkoLXROrBdzJtwFMjVV6wAUGwg4yIXvcJTxbEo?=
 =?us-ascii?Q?Wkv/y3l74vxN6FGxrxuROAd6ROkcISpN7pMVwNbUp+kQcGSDHHH2QyAeTcVC?=
 =?us-ascii?Q?xK+wkzaaIGP2lZ46Dz0fyf6EzWzuW/ST3GQxUE3s0tsm5KR5BNht0HBPZK6I?=
 =?us-ascii?Q?+7gZhp35Mb2ebA4/0j379HfnDaN8r8+NTKlE0c3209GP+Iu+uf3UURErYpn+?=
 =?us-ascii?Q?XudWwY79b2naIpEW04aVIyR/f/7shq+c1dwXKYdtL+UGRQy8Xu+PdDXvYhqh?=
 =?us-ascii?Q?ww1E3CxoH9niMpTqcRpX2T42IFfIK8/kJQPqvZpr9bbFX9IOwXEeGoUKlrut?=
 =?us-ascii?Q?t41Vjk0LqFpeeoCivKs4C58jfT3jxkb+sj5rr980WNCkCUdz+qk67jPKj5WT?=
 =?us-ascii?Q?DeNcEU9zCnJkAkDm1gZr1nNRZOCqvg3HSg+dJ3C8kupZF2GetrsGQzBx2xXi?=
 =?us-ascii?Q?7N2hFaHtJ+XgWBxPSxlZyJEdDM3Kg065mGkFKPpCVVIwLjkDOtADyltKmdlw?=
 =?us-ascii?Q?bPMQf93mUy9USWgl2TOdKYx8U3EO+oJARmzOdny7Wcd12tU3L5wS6juPutSP?=
 =?us-ascii?Q?ECB6DiFBTVyVyyLAI4YZe6MDGu16KdS+UruIOwQ1TWtwBgCZLnVOakF9+oyH?=
 =?us-ascii?Q?YWOAX0BLwUcnYs0PKNTWExQLNbtUVKYMDYjx0v7QLeas8Ut1eHZ7gY6vpFEg?=
 =?us-ascii?Q?7pyKf6uyehh2S2r5deoYWlnH5Htak2cuy6MniXJrCAeDce6LAKZiX0CmG/Jb?=
 =?us-ascii?Q?lMcZdvbUov0fMf8pYT9nF4tym4igAvQJL9xr1YJY6+9qUk8gmqCzJ0h6cP48?=
 =?us-ascii?Q?m6HivxeVEmtOfPrOVkrb1j4xUKqvuyisFBSLoSvHO8tFv+C/f/DGKIbAlk8y?=
 =?us-ascii?Q?NPfHtKf+emaYJ5bRaTGwUgu1bJg5oBbRks/DYLmuWcZV8AZoFdM2/4GGSRPf?=
 =?us-ascii?Q?gMlHagpOelhQuhRillujdWqvW6YNM67moZozYmJjKlCiPIqhu7MApfXrP6Vb?=
 =?us-ascii?Q?mPSGpFLA5uG3YxC/CB+xT+4wL8rHUc2onw/Ogauaj34X6TlZ7igRv2t5FqkW?=
 =?us-ascii?Q?Yj2wkzQ54QEHopenvuvgUHAwhhfQyCUn9gAYd+JtLbbTivdgCVj6FlAXcjrp?=
 =?us-ascii?Q?TDjaNqkob9Cf1qin/xhiWkaC0sBA09nOg4PvRmjh9n/ZR+lad73g8ey2oAva?=
 =?us-ascii?Q?Epri6ZV8yjbd3Jdu7D1a9GBC1cSvwEdGHOJxdveIFJbE/cjBfF4A4fvoei3w?=
 =?us-ascii?Q?wv0gDA06dxMpDQ5S+LcH3fqvIrNRQHug8yJaM6PqU4hP145mFUxOsLERiHXf?=
 =?us-ascii?Q?kYRxJK9hD5n43ese0YqRnzaTLsXFHbsIcgG8P4zcU/llGRFI08wn29knsCfi?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7be1677-a2f0-4d3e-c3c7-08da5aacc115
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 15:25:24.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glP/shqHx2Db7zmXUM5a/4JivAuzh5VDRWuy0zTYO5LwVIZMMEKrZ8NE3IiC7rFWwAXMhUfA4nZC5FJGwUQ1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1699
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 05:34:22PM +0300, Jani Nikula wrote:
> On Thu, 30 Jun 2022, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Thu, Jun 30, 2022 at 02:09:02PM +0100, Tvrtko Ursulin wrote:
> >> 
> >> On 30/06/2022 12:19, Tetsuo Handa wrote:
> >> > On 2022/06/30 19:17, Tvrtko Ursulin wrote:
> >> > > Could you give more context on reasoning here please? What is the difference
> >> > > between using the system_wq and flushing it from a random context? Or concern
> >> > > is about flushing from specific contexts?
> >> > 
> >> > Excuse me, but I couldn't catch what you want. Thus, I show three patterns of
> >> > problems with an example.
> >> > 
> >> > Commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a macro") says:
> >> > 
> >> >    Tejun Heo commented that it makes no sense at all to call flush_workqueue()
> >> >    on the shared WQs as the caller has no idea what it's gonna end up waiting for.
> >> > 
> >> >    The "Think twice before calling this function! It's very easy to get into trouble
> >> >    if you don't take great care." warning message does not help avoiding problems.
> >> > 
> >> >    Let's change the direction to that developers had better use their local WQs
> >> >    if flush_scheduled_work()/flush_workqueue(system_*_wq) is inevitable.
> >> > 
> >> > Three patterns of problems are:
> >> > 
> >> >    (a) Flushing from specific contexts (e.g. GFP_NOFS/GFP_NOIO) can cause deadlock
> >> >        (circular locking dependency) problem.
> >> > 
> >> >    (b) Flushing with specific locks (e.g. module_mutex) held can cause deadlock
> >> >        (circular locking dependency) problem.
> >> > 
> >> >    (c) Even if there is no possibility of deadlock, flushing with specific locks
> >> >        held can cause khungtaskd to complain.
> >> > 
> >> > An example of (a):
> >> > 
> >> >    ext4 filesystem called flush_scheduled_work(), which meant to wait for only
> >> >    work item scheduled by ext4 filesystem, tried to also wait for work item
> >> >    scheduled by 9p filesystem.
> >> >    https://syzkaller.appspot.com/bug?extid=bde0f89deacca7c765b8
> >> > 
> >> >    Fixed by reverting the problematic patch.
> >> > 
> >> > An example of (b):
> >> > 
> >> >    It is GFP_KERNEL context when module's __exit function is called. But whether
> >> >    flush_workqueue() is called from restricted context depends on what locks does
> >> >    the module's __exit function hold.
> >> > 
> >> >    If request_module() is called from some work function using one of system-wide WQs,
> >> >    and flush_workqueue() is called on that WQ from module's __exit function, the kernel
> >> >    might deadlock on module_mutex lock. Making sure that flush_workqueue() is not called
> >> >    on system-wide WQs is the safer choice.
> >> > 
> >> >    Commit 1b3ce51dde365296 ("Input: psmouse-smbus - avoid flush_scheduled_work() usage")
> >> >    is for drivers/input/mouse/psmouse-smbus.c .
> >> > 
> >> > An example of (c):
> >> > 
> >> >    ath9k driver calls schedule_work() via request_firmware_nowait().
> >> >    https://syzkaller.appspot.com/bug?id=78a242c8f1f4d15752c8ef4efc22974e2c52c833
> >> > 
> >> >    ath6kl driver calls flush_scheduled_work() which needlessly waits for completion
> >> >    of works scheduled by ath9k driver (i.e. loading firmware used by ath9k driver).
> >> >    https://syzkaller.appspot.com/bug?id=10a1cba59c42d11e12f897644341156eac9bb7ee
> >> > 
> >> >    Commit 4b2b8e748467985c ("ath6kl: avoid flush_scheduled_work() usage") in linux-next.git
> >> >    might be able to mitigate these problems. (Waiting for next merge window...)
> >> 
> >> Okay, from 1b3ce51dde365296:
> >> 
> >>  "Flushing system-wide workqueues is dangerous and will be forbidden."
> >> 
> >> Thank you, this exactly explains the motivation which is what I was after. I
> >> certainly agree there is a possibility for lock coupling via the shared wq
> >> so that is fine by me.
> >> 
> >> > > On the i915 specifics, the caller in drivers/gpu/drm/i915/gt/selftest_execlists.c
> >> > > I am pretty sure can be removed. It is synchronized with the error capture side of
> >> > > things which is not required for the test to work.
> >> > > 
> >> > > I can send a patch for that or you can, as you prefer?
> >> > 
> >> > OK. Please send a patch for that, for that patch will go linux-next.git tree via
> >> > a tree for gpu/drm/i915 driver.
> >> 
> >> Patch sent. If I am right the easiest solution was just to remove the flush.
> >> If I was wrong though I'll need to create a dedicated wq so we will see what
> >> our automated CI will say.
> >
> > But besides of flush_scheduled_work() it looks like
> > we also need to take care of the flush_workqueue() calls, no?!
> >
> > * i915_gem_drain_workqueue()
> > * intel_ggtt.c:   flush_workqueue(ggtt->vm.i915->wq);
> > * i915_gem_pm.c: flush_workqueue(i915->wq);
> >
> > and the display ones for
> > dev_priv->modeset_wq
> > i915->flip_wq
> >
> > besides the flush_scheduled_work in intel_modeset_driver_remove_noirq
> 
> I thought the problem was flushing the system-wide workqueues. The above
> calls flush our own.

oh, indeed, sorry for the noise.
I had ignored the if for the new __warn_flushing...

> 
> As to removing flush_scheduled_work() from
>intel_modeset_driver_remove_noirq(),

yeap, this is the only real one...

> I think we'll need to account for
> all the work and delayed work we've scheduled on the system workqueue,
> i.e. we need to cancel or flush each of them individually, as
> necessary. Some of them we do already, but some others, not really.
> 
> For example we never cancel the fbc underrun work on the driver remove
> path AFAICT. And it's not even as simple as just adding the
> cancel_work_sync(&fbc->underrun_work) call in intel_fbc_cleanup(),
> because intel_fbc_cleanup() is called *after*
> intel_mode_config_cleanup(), i.e. the work function might get called
> after the crtc it accesses has been destroyed. So we're going to need to
> change the cleanup order too.
> 
> Things have changed considerably since the flush was added in
> 1630fe754c83 ("drm/i915: Perform intel_enable_fbc() from a delayed
> task").
> 
> I suppose the alternative is to have a local i915 display workqueue,
> schedule all the random display works and delayed works on that, and
> then flush that wq instead of the system wq in
> intel_modeset_driver_remove_noirq().
> 
> IIUC, anyway.
> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
