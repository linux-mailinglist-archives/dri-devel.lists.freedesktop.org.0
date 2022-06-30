Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4472561C23
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 15:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6939810E4F9;
	Thu, 30 Jun 2022 13:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099710E4F9;
 Thu, 30 Jun 2022 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656597548; x=1688133548;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BfrIW0RrR/x1cbgBqsgzunpdzv0SMNlJk1QWq/7kaQ0=;
 b=N+XOJKcd0w5OECM3N7W4kh+brK13gBqa6rR4Eztqyl7yHFgwRE0GHsR6
 05dcbEjs+8ZCYmqaYvLBAtg54DGX0DxC2zf7LhAUZ19nfjK39VRZ0WnVo
 Ozo6gGf7OjmUxGHUSLKl58cU6mgqhyvjNdLgmSLncJsPYq9J8XpJynTk7
 0zn+Cu2sZlB/3SPGWZ7+iXzT51zF3SbpFXCL5YbndcTmcUwZx9cTs1Q56
 ZabeakRT5UWNiZ+zUIblvbp4o3KMc0bvYljfsMDCNBn8OZsmyctQb08D5
 zFfHl2Ac9oRTNHfi350MCKP3W2Dpdff2FgC/C2FuvifXEsCA12/69QlQ9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283453055"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="283453055"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 06:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="718226668"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 30 Jun 2022 06:59:06 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 06:59:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 06:59:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 06:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFx38QHe2UyvQPhtF53wm2frfxJc6rqTxXrDkV/vi7h4hUFDKSRjLZuSf7CWUHCldX2x2zfI+4GyojSZTRwYiMRmauq5MNxnI8E0AHYj8F4GAzSi1PrWQTSqj8PcEArPNyQveBHDG77YZdnuT+XqISrBp9M92FNez3XWj3JTP7LBgyAO3K2jPSN27q7LZpm0qzkUdPKl7Oq7iT0i714e6U6pDWRxm6L88+BSUn0DZl8NeYoNgSMxPUjL+A2nx8fPRYph6MzaspG90q6PjdIgiKRI0O0Y8EJJ8FOqD3oNp8dxvkk5c0aZaHCxp9Jh8wwYjxssPfWrXMbTcksY8lzYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IUP6ry6ceNfJl2VF53CxZfwywKAkPsii4oh+qzYt84=;
 b=Q4UyIReM8W2CtXHo05biOAFGk+Nv1pRbp2OLbphbgPBNpZBv/skjipTpiiLPUuf41izbF9FN2oL2bTr8yINUfrUl3BE3BbLcofRQXG1Bx5QrOL8d0C7+6Lht4nwaUbFu6mIW8jvE2FIHgx9aTIEHx4lQ08/n/2CPIosC6+mnopx2Vhjho+YUBp+T7ojtEjf4QgpkzBI5tw4QoyDyMXZjpnoBN12Y9PfJbj521oaxV2tHyv+d048asyPKsTkMRT0f7+K1FHlD1bhD2O6bCEUt+DKCKgCCizRtKRE3EVEAhlgoIDYUcU4RvtCHwzXp2T+I6DG4V/28XDB0TKKWXxdCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB3321.namprd11.prod.outlook.com (2603:10b6:5:8::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 30 Jun 2022 13:59:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%7]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 13:59:05 +0000
Date: Thu, 30 Jun 2022 09:59:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: How to convert drivers/gpu/drm/i915/ to use local workqueue?
Message-ID: <Yr2sJBdZ3TnXZF+s@intel.com>
References: <bdf23a1c-0d89-c395-4a7a-2840ce5f639a@I-love.SAKURA.ne.jp>
 <98c6d61e-0c0f-e385-6100-6b7ebe6874b1@linux.intel.com>
 <c379bbe5-a416-7757-b0e3-1b767bb5a775@I-love.SAKURA.ne.jp>
 <703244a5-f2c9-adfb-892f-dd2353cf384e@linux.intel.com>
 <f15c7336-10fd-cd86-a95f-aec99154319b@I-love.SAKURA.ne.jp>
 <b21d9f1e-65e3-8f2f-a5c3-04bf866823e3@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b21d9f1e-65e3-8f2f-a5c3-04bf866823e3@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8347226d-3883-4261-06dc-08da5aa0b196
X-MS-TrafficTypeDiagnostic: DM6PR11MB3321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pW4yfvU5tmhC14Ii98hLmKNkuQk4rEccpMMDdGk6UCI+zpO3Kt0yFd837jKt1v4yYmgun5+HYGgo8RSJduaiYvMcxVtGtbsuCuILf6dz5t5jl6/iTnFS3Q6PvVMIyed8OKBNCKiDmOgOQpBln0U2k3yt+2WsP/nH6NOKP/FUmDz0g55cgKoqa6rQur79vo35lOrI0Ux9XrkHNAOsMcsqjF4uknY5SpbELNIof11cu9/c25+fOiRip82ZaZByN4JHBlVGvGjGQcP94QXlDlfWUYjOFex92eUz4SRH0uMicqvc7oeNlED7aPsLq9ez8kagFlUflW5NNMj+wsOijUUGcRS5a4GuUIIx95slk0jzv9otfSnVD0PRgSCuIhTYMF37qOhMFB5su6Cc1Zn/opwqUu1L9Bw2mF7qj21Too4cYOwhHIE8xJjdMCwwqEKxUFsHGZnVdcBkXt3VHY+2+N8FErMwPmi34PMz4uEuv19Q+E63m4509rfZgJWEpu6Am2psqHvfE0mFkmdklF/bWqNgE96U43jnlV+h3tdpcZOeonbEK8AQWDGhMjyDw7tj0MiW7s2diphVAYnh/6d6/SXrQzWyPYETHzTqmV9xIad2uII3UMa9j+uD7bmf53TNgaoPZVDaTXfdDm7n5l2drrEDoOiTq94l/d32n0Gz3d7qe4KMBrQNqdxLIlYWHv+NbYxb2z69X8p+o5wBqiK2NFyoYr1lo3TGuNVxktNZ/gpkevnwKfWimacRYCJqnJE+fBiL3M0xQkeoERxW7co7zwm9+AdC6b4D6DKEiNjGNMv41iefZ5mWNk14MgiEii8m4hHBuwuHRv6H9MxgSfpMoEzVMepcQToVrgT1oH9f84/lvvvVgyz6jX1nQec24MZHVT0CvLdRFKJiaoQgPxw+pgPW4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(346002)(136003)(39860400002)(66476007)(66556008)(36756003)(8676002)(4326008)(44832011)(66946007)(38100700002)(8936002)(316002)(54906003)(6916009)(83380400001)(6486002)(5660300002)(966005)(478600001)(6512007)(26005)(2616005)(53546011)(186003)(6506007)(41300700001)(82960400001)(2906002)(6666004)(86362001)(99710200001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zH4LmalSZX+OQUSf75BfMxIfzSip7cW1mOJ+TPZmrLjBAR1lbXNHekho4/eo?=
 =?us-ascii?Q?jbKGTNKO0OpJ5yUgtbUKeWU5utGNMKSY+MuYYeUDUSlDSv1nODXLHrroaJtp?=
 =?us-ascii?Q?6/mA5K8gwKbnpIX+Fgy91FCPmIKiTjvjnjTqh72a/UTIFrmKoiuKyv+E8I/N?=
 =?us-ascii?Q?uAgk5ZJ7rdnAwamezzxIQ5Ur5G+JBfcbr95hRhv3M+dws712Ql5c7aDcI90I?=
 =?us-ascii?Q?nAo4aliTkebVmk4UEEQE4fwTHELGLfv6M7sNJT2FRyKAQ/Vb0hFWAWVSGvI5?=
 =?us-ascii?Q?6XRFHYDVmHEw+t65jOe0NpE4fmjyeZFXEaEZpxw3GtrlSq4ZGvhYOffnxuix?=
 =?us-ascii?Q?FOa8gqiV12yicYNUkKlX4h4WRd35fcKF3m6oPG1v76clRs9rlaHnlp8jw9kS?=
 =?us-ascii?Q?SxgxsgrrWLIzz+xhIe5AMVPklMekvy03QQyjvm/iCjvHXnRwAreE7xN3AoMa?=
 =?us-ascii?Q?gvf7z0g/zCl03wVmwMExDl45gKcWdj1odGXfThEgRh9pvA6uivkja7fQvUs3?=
 =?us-ascii?Q?WQC1u5yB09KaSzXss6iwW7mWTI6P5ZBMgirBxKg6a42D+Y3LqFKocTgXoJMr?=
 =?us-ascii?Q?CuBZoGfZV0MOP0ls6ObUOxy6wwOJuq7YeA6HXuws0YU6ThZXmu9WKjQ3JKBJ?=
 =?us-ascii?Q?Arr+jlliGHht8U6Bf9MEurcwVHlEzPHKsrrrzP1tZ1MTbyaWG3CTtQUTJvZ0?=
 =?us-ascii?Q?9vMm/8sVOhivFPs8+wjKFO6BRz+f+DKQAcc/zvihtUNfEjx8E/Jr6bVyHAUq?=
 =?us-ascii?Q?TY75bTwAq3HmxyOx+AIH6u1LGT8Kj11KDhA5ODxjqYcL7rn1xYRQVw6VZlQC?=
 =?us-ascii?Q?FQ26UXnq/+qHirRi9MNiGM2ZsoNiFYguFyEWglsQ2x+mMc/dzsgrMxmlzrDo?=
 =?us-ascii?Q?80DfDQQ9bQp7ocSXz08IeWTZgi2dYssy3YbfCXMMKM62PufxzxycYEU5sBwk?=
 =?us-ascii?Q?djS4QY6YEUwiv90nVnBAL15UPiJwSTImCa279JgCdlmpEySNdESrMUkS9cea?=
 =?us-ascii?Q?2jAiLOnKtuXUUG3DCB/IMShItOYiheJfochIM7xzO0Y8FSWXAwSs3bGQr2Ps?=
 =?us-ascii?Q?/k53Tx9y7vBRVZ+Eg34y8G+bvH9cwiLm5K/5z4x+f+TVyLUNYM77c4XMjR9i?=
 =?us-ascii?Q?P/j2h+TcCPsvA3xcYzOQ4iTHpHI+N12S+fsW3fq0nf0s1v+SNENxIKOplv5f?=
 =?us-ascii?Q?1YdOynLrPaFT/S50a4jU9FUA0hVI3WI3aNXVb3hPpLLMTm9bh/ToDJ/aA+9B?=
 =?us-ascii?Q?eKpv5m4QBdc7Uri7qHFzRhDozK/8mi4arWc3mmUfv05aUvYnS74X5HDy6Gd9?=
 =?us-ascii?Q?q6+yvnkt2YTyInEJuM99H/6tKo0y4gX9jrNDDuV9mkVts60q2yaTpgUAOmp+?=
 =?us-ascii?Q?zv2Jn0elpRmm/kexGtamVV4f06B4X6Xi0eUwU4Z+kODIjnYgsa2QX/r8BcJr?=
 =?us-ascii?Q?QYPOStOy0Nq169KbKCeEI0CCeGibpSImHY/liq+iY3jgrX8rBWM0jEyk5vFu?=
 =?us-ascii?Q?h80uEPXXZMYRsWGkXgLRwwB9/c3PJtZWO2bFMScHayf3Y2pQ6WoWIBinLRdS?=
 =?us-ascii?Q?qOme2I1i139aK+yNMihOOJNFVe/HkUEwxxJqoe6d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8347226d-3883-4261-06dc-08da5aa0b196
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 13:59:04.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNB0KHU0G3K+t+NpqMkTZXaFG79SrMHiU15SEDWw8Eh35d7QZrfpj9vdqnTd6+Uj/L8eiXPq1B4KR2DMzfmWPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3321
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 02:09:02PM +0100, Tvrtko Ursulin wrote:
> 
> On 30/06/2022 12:19, Tetsuo Handa wrote:
> > On 2022/06/30 19:17, Tvrtko Ursulin wrote:
> > > Could you give more context on reasoning here please? What is the difference
> > > between using the system_wq and flushing it from a random context? Or concern
> > > is about flushing from specific contexts?
> > 
> > Excuse me, but I couldn't catch what you want. Thus, I show three patterns of
> > problems with an example.
> > 
> > Commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a macro") says:
> > 
> >    Tejun Heo commented that it makes no sense at all to call flush_workqueue()
> >    on the shared WQs as the caller has no idea what it's gonna end up waiting for.
> > 
> >    The "Think twice before calling this function! It's very easy to get into trouble
> >    if you don't take great care." warning message does not help avoiding problems.
> > 
> >    Let's change the direction to that developers had better use their local WQs
> >    if flush_scheduled_work()/flush_workqueue(system_*_wq) is inevitable.
> > 
> > Three patterns of problems are:
> > 
> >    (a) Flushing from specific contexts (e.g. GFP_NOFS/GFP_NOIO) can cause deadlock
> >        (circular locking dependency) problem.
> > 
> >    (b) Flushing with specific locks (e.g. module_mutex) held can cause deadlock
> >        (circular locking dependency) problem.
> > 
> >    (c) Even if there is no possibility of deadlock, flushing with specific locks
> >        held can cause khungtaskd to complain.
> > 
> > An example of (a):
> > 
> >    ext4 filesystem called flush_scheduled_work(), which meant to wait for only
> >    work item scheduled by ext4 filesystem, tried to also wait for work item
> >    scheduled by 9p filesystem.
> >    https://syzkaller.appspot.com/bug?extid=bde0f89deacca7c765b8
> > 
> >    Fixed by reverting the problematic patch.
> > 
> > An example of (b):
> > 
> >    It is GFP_KERNEL context when module's __exit function is called. But whether
> >    flush_workqueue() is called from restricted context depends on what locks does
> >    the module's __exit function hold.
> > 
> >    If request_module() is called from some work function using one of system-wide WQs,
> >    and flush_workqueue() is called on that WQ from module's __exit function, the kernel
> >    might deadlock on module_mutex lock. Making sure that flush_workqueue() is not called
> >    on system-wide WQs is the safer choice.
> > 
> >    Commit 1b3ce51dde365296 ("Input: psmouse-smbus - avoid flush_scheduled_work() usage")
> >    is for drivers/input/mouse/psmouse-smbus.c .
> > 
> > An example of (c):
> > 
> >    ath9k driver calls schedule_work() via request_firmware_nowait().
> >    https://syzkaller.appspot.com/bug?id=78a242c8f1f4d15752c8ef4efc22974e2c52c833
> > 
> >    ath6kl driver calls flush_scheduled_work() which needlessly waits for completion
> >    of works scheduled by ath9k driver (i.e. loading firmware used by ath9k driver).
> >    https://syzkaller.appspot.com/bug?id=10a1cba59c42d11e12f897644341156eac9bb7ee
> > 
> >    Commit 4b2b8e748467985c ("ath6kl: avoid flush_scheduled_work() usage") in linux-next.git
> >    might be able to mitigate these problems. (Waiting for next merge window...)
> 
> Okay, from 1b3ce51dde365296:
> 
>  "Flushing system-wide workqueues is dangerous and will be forbidden."
> 
> Thank you, this exactly explains the motivation which is what I was after. I
> certainly agree there is a possibility for lock coupling via the shared wq
> so that is fine by me.
> 
> > > On the i915 specifics, the caller in drivers/gpu/drm/i915/gt/selftest_execlists.c
> > > I am pretty sure can be removed. It is synchronized with the error capture side of
> > > things which is not required for the test to work.
> > > 
> > > I can send a patch for that or you can, as you prefer?
> > 
> > OK. Please send a patch for that, for that patch will go linux-next.git tree via
> > a tree for gpu/drm/i915 driver.
> 
> Patch sent. If I am right the easiest solution was just to remove the flush.
> If I was wrong though I'll need to create a dedicated wq so we will see what
> our automated CI will say.

But besides of flush_scheduled_work() it looks like
we also need to take care of the flush_workqueue() calls, no?!

* i915_gem_drain_workqueue()
* intel_ggtt.c:   flush_workqueue(ggtt->vm.i915->wq);
* i915_gem_pm.c: flush_workqueue(i915->wq);

and the display ones for
dev_priv->modeset_wq
i915->flip_wq

besides the flush_scheduled_work in intel_modeset_driver_remove_noirq

> 
> Regards,
> 
> Tvrtko
