Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC2E6A774D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 00:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ACB10E271;
	Wed,  1 Mar 2023 23:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BF610E271;
 Wed,  1 Mar 2023 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677711610; x=1709247610;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NMSbFjjj9hLScKvb3fgUZcZb31LZWu2Lczwamh8f0rc=;
 b=MZhltPOVfzheYSloohl9KsovFJuXKCHsluprohj2tu/qQ+wuf1hO/kAP
 8bngjCR169Ty1eYfKm5zocre3ng8ylcFsuj+uuJSQZ6dg6wK3OpnTINqO
 QhELOwdoY8lOXVwCl9KhsRu0hcywpo0ewpLKlHHb7HGYI76MGzp1kAtNI
 V8VOnh61IB9BLRJtGk2WIIm/pFH28+FqiiL9nEddfWm183Y1Mt95m1Tqi
 l9CGy4pVhhO3LbEq5I1aMfsj+Ukaf8H0ol/HqetbWkw1/i+8fVd+5Akp0
 JscFlvMWQSfuXObcXFFR7PjWWmrt+X0DJg7nr0WTxDWBJh3el5rzoNpge A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336042253"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="336042253"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 15:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652185277"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="652185277"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 01 Mar 2023 15:00:09 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 15:00:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 15:00:09 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 15:00:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nsn70evPqf6cAsv6pWn+yqGiln27tvmnUmgBdoNaJsDSGvwfwdkLpcv4CAl3G524hrj6HXXUhYSMMr7e3E9cyAoHHiF5OR9OSB/CiLkiRv2dIFXQW9bsxAab/YQtbYDAro6b6cJqKuocTb1HKmKPasFKS3u4vtPy+W1ExaGpZex4EguslAddwnU3hI4zouV+WPv73Dg3Q7ynlG/t9P6MpnpyOR2C31dLHX8AgOJGyErg/HGyQEZsLWTCKAAGaG+68k0098mWnJqIHxTgN0BzeAiGVpbWP1Zvh2SuwGg+miasbpWxc0pG2eCPMZgGs0ofSPZN5vjHNRcwI/4NK7cb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9bx77SmHmft3t+UZF1adLoDINEueTmkRAkYIglpqoM=;
 b=mbNn31GIPlRCZPef5z6xsIqIOJqGfGe4jMOO1rTeS14Y+mgynzWZJmTu5IU1RwFpvkQE/XNEohHeM6BwFXv9OpT3NXXLJgaE1AR/BQIRrYSY+xbYKfaNvgL5t5jXPI6uVVb1bop5YR/HjnDpaBn3MQno05bAvfIOGk2ozAJVSGoGiK6TnXd9q3OMFGyM/MG/Sdht8oYsG2HiTkcNicTYgaBZTbePPLEMnIWQuwDmvD7RHmMNTaL/8gVGBsTuV1YMadTBpbuHmVsfcN120tZUYHk0suYE2EDlGPezpYZ/amemoQWXJAh4iZpNm+ZrFEX5gOq3MIwEu5Zuzc0GIUGRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 23:00:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6134.027; Wed, 1 Mar 2023
 23:00:06 +0000
Date: Wed, 1 Mar 2023 18:00:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <Y//Y8mKezn8oCejK@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <Y+/o2a21Eym3ee/a@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+/o2a21Eym3ee/a@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: bd232d1b-9b6b-43f6-0af7-08db1aa8b2ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +0H7HjeW5t263XPww2pcSaaB39LVjjvGVLoPTjhRw8BcdxX4/ND/53CMcyjciIRcHKBEmfOfm6IXJbsPnKCJ40ZippiEPqs0eprI/QcuaWyr8w0E+KdWCiLlA6zuU5Xf5KVRNVBMkIXD7v1O1Jko33gpzlKwe33Gpklw2WNtbNehJKBOl4N6XTFKx7IlK6MJZLeoHK9GWD5yiCK+AL74MFzELExlPla+kVyVFnZxzRq38TkxlijLofmx/cltotdoNYpdhm8nRwq8FtdZD7ljp6uWK4rvxWZWvesqKh8Za2RG/6TfUiSuV1kENYYyoNf89K1xEAzYAd5pWbSS8EK8HnYq+RwQsUv8pc1ePuz6Yu7d/IFOpHkMp2w8sWC/41DfqHOwiKFkkiSaANdMhgLW55KbQOQI1v28hKNCrU14DIz7uMil7C5izRa1qBCalRc0nXXT3C3TuoqlRcA2BksvliCbTTlOE4aj6I5pyuR0ZLpn/NIG+KYOo8P09cYebUHQj7fHMKFvAdAZ2a9rfkxfoH/Y1R7guse5Do/V2aASGQCTh/V8T+vyIEYhIFDjYOT1pSzpywGnEsfnT4JG6ktKOdMW3VcXkjsD6aWrmJFRwXvZjIDmT9TwaaeXv5ngX4RC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199018)(36756003)(6666004)(6506007)(6486002)(966005)(2616005)(6512007)(186003)(26005)(316002)(41300700001)(4326008)(6916009)(8676002)(66476007)(66556008)(44832011)(30864003)(2906002)(8936002)(5660300002)(478600001)(82960400001)(38100700002)(86362001)(66946007)(66574015)(83380400001)(66899018);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xegiJGuhAqJ+ymowY6cLYztRazVnP7ThhJWxFWwIBLWukTylo6KDnJ0yEx?=
 =?iso-8859-1?Q?9AC9nfp/eX4lf9J3glVz4asie28l8dtERh1EvF9/cHyJUv0W4TXRXw8pDm?=
 =?iso-8859-1?Q?GQKIjt+VWweMI4sD8LishItQAsaeFYETBQQ/LxCDuE/utE0dN86tqlfvps?=
 =?iso-8859-1?Q?hPswylMufVb0fXWEDHJ/H+yPoLGGpg4kDxeADpJBsgDfNh9kaYm9RpQLJ0?=
 =?iso-8859-1?Q?LcIr9V8dHhvZJrVj+Oi3tHik8Y8PggRUPXHQKpet0SGmrCnZuf1ulWXQNl?=
 =?iso-8859-1?Q?pl9BmGJXNj5fzK01f7+p+ubmzib9lCEMBI18P9c03JKsec857JuEAtlR7X?=
 =?iso-8859-1?Q?pw+angLhlzj/uuxJpU0zVzHzUQtqGlNdeh9zrwPMWQ6VOKT3p3U4WRXtIf?=
 =?iso-8859-1?Q?X5Zkz2VoNoP0ecJYxKR6NkuLqMO1JTZpwcFR/Z326SDD9KUr9+GJaX6OkB?=
 =?iso-8859-1?Q?jNblma1SqhW5bVckeWOGn6sm0mLqaP2jvL+KMwbQzwTYXf/h6p62trVh2M?=
 =?iso-8859-1?Q?pUgDTFa6MAsyA5jtVjhIdEE9h42dTJTkLSBGGkxgURQLWozWZ5M8kNBI+N?=
 =?iso-8859-1?Q?aBYpVbNdtTWhNHD+hJM5lp4jDIF5UCBXQWQl2zkj+9lvP71F9M1GGpWDg5?=
 =?iso-8859-1?Q?sZkVT3KFOGE8h4th+YHDq2r8PF8SNKtxVmM8UCy5Mk9w5KRz0zvxCVrlrS?=
 =?iso-8859-1?Q?K6KOuQTVNM3pDSj1ANxATh6KODj8aXwVAWSOu+hURnpn5cdg+v7kgmkAZi?=
 =?iso-8859-1?Q?zOXM7WehesSBzLvoUTlBhsvnG+Dzf3iu7KA5+Oqn3eqjxlJIocUkxkPGg2?=
 =?iso-8859-1?Q?TzuGZSRHdeGTnd1vPHk6iM4W/t5QnaWnR8EUFF1XL3oqrmkWgx9cN8rorF?=
 =?iso-8859-1?Q?fsHTUotMShqkVMiZ2waq/aLF9NZrc+V7EUZQeqT8kSmmjeZSv2mXd1BK3A?=
 =?iso-8859-1?Q?lkS9uPw2GtddIw+YfD08TyXDeCclCx7+b2aPDEWdb6ofDq8MiaBpMZoqzJ?=
 =?iso-8859-1?Q?2ST/9YtFf40w0wwjp8Rflnt6nooDB17q4E2lohETY2yXhrUb+spL9tkSYL?=
 =?iso-8859-1?Q?lfBQoKKMC2oeZrjOnICtj/48awQTJu2zQjq/Psl1EbZYWLeCT7FIiNjlSo?=
 =?iso-8859-1?Q?9czb2Y/B2WyxW+c3EjniHY5PqRBMddFpJchdDnmvzR2Axk3CHE2bt52IM8?=
 =?iso-8859-1?Q?rib+UVtTHEOZ44cqJ9chjWrmJTTznVZMi2wlq1b4hmqTkifIAcIkuj+yJl?=
 =?iso-8859-1?Q?EkV8KphfZXScKzcyN3YfuQ4ofizTEQ8GwMM/yFoPbCuHV7ySOZI58HfMZh?=
 =?iso-8859-1?Q?v43sMERWVeXpuZwZLdYvZ4OyI48pY5eze9sFaC6dbDBChf8qaHwBF2ydnW?=
 =?iso-8859-1?Q?i2H/Wbvk1zzyH3TYqbcTlQE0P3aLt1LxNNw6TFNo1/dj1bp/eH7DyAF2bb?=
 =?iso-8859-1?Q?Q84oetbmDbkpgf0bC4LunrKekOsx3GB7xHNe8lpPIfTxY5DE7VTdPGRlsF?=
 =?iso-8859-1?Q?ATHNdMz75R270WkyZ3hYrHsrxK4/rguVolnvmuJCJPUHbjO+mqsn/QhBAb?=
 =?iso-8859-1?Q?O22nOuro/+bkoKzaID2PRsjwgwXmorp0c0pABc4pWOAjHpn/MAbXgccfmk?=
 =?iso-8859-1?Q?/9qYEhR1GMqEWwtAd1wUNwTzHw8xnX5Ndu0NqqpShWmmPxmvETBI7bMw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd232d1b-9b6b-43f6-0af7-08db1aa8b2ce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 23:00:06.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gb6d5BazJCtBvq5KlRI9JuIN+qBnNShXJJ149Fps24B4LJ4OMQabVmq+5qJyldpAj1NAu/4I7JT9FFBbp/9btA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 09:51:37PM +0100, Daniel Vetter wrote:
> Hi all,
> 
> [I thought I've sent this out earlier this week, but alas got stuck, kinda
> bad timing now since I'm out next week but oh well]
> 
> So xe is a quite substantial thing, and I think we need a clear plan how to land
> this or it will take forever, and managers will panic. Also I'm not a big fan of
> "Dave/me reviews everything", we defacto had that for amd's dc/dal and it was
> not fun. The idea here is how to get everything reviewed without having two
> people end up somewhat arbitrary as deciders.

Thank you so much for taking time to write it down. We need to get alignment
on the critical topics to see how we can move this forward.

> 
> I've compiled a bunch of topics on what I think the important areas are, first
> code that should be consistent about new-style render drivers that are aimed for
> vk/compute userspace as the primary feature driver:
> 
> - figure out consensus solution for fw scheduler and drm/sched frontend among
>   interested driver parties (probably xe, amdgpu, nouveau, new panfrost)

Yeap. We do need to figure this out. But just to ensure that we are in the same
page here. What I had in mind was that Matt would upstream the 5 or 6 drm_sched
related patches that we have underneath Xe patches on drm-misc with addressing
the community feedback, then we would merge Xe with the current schedule solution
(or modifications based on the modifications of these mentioned patches) and
then we would continue to work with the other drivers to improve the drm sched
frontend while we are already in tree. Possible? or do you want to see
fundamental changes before we can even consider to get in? Like the ones below?

> 
> - for the interface itself it might be good to have the drm_gpu_scheduler as the
>   single per-hw-engine driver api object (but internally a new structure), while
>   renaming the current drm_gpu_scheduler to drm_gpu_sched_internal. That way I
>   think we can address the main critique of the current xe scheduler plan
>   - keep the drm_gpu_sched_internal : drm_sched_entity 1:1 relationship for fw
>     scheduler
>   - keep the driver api relationship of drm_gpu_scheduler : drm_sched_entity
>     1:n, the api functions simply iterate over a mutex protect list of internal
>     schedulers. this should also help drivers with locking mistakes around
>     setup/teardown and gpu reset.
>   - drivers select with a flag or something between the current mode (where the
>     drm_gpu_sched_internal is attached to the drm_gpu_scheduler api object) or
>     the new fw scheduler mode (where drm_gpu_sched_internal is attached to the
>     drm_sched_entity)
>   - overall still no fundamental changes (like the current patches) to drm/sched
>     data structures and algorithms. But unlike the current patches we keep the
>     possibility open for eventual refactoring without having to again refactor
>     all the drivers. Even better, we can delay such refactoring until we have a
>     handful of real-word drivers test-driving this all so we know we actually do
>     the right thing. This should allow us to address all the
>     fairness/efficiency/whatever concerns that have been floating around without
>     having to fix them all up upfront, before we actually know what needs to be
>     fixed.

do you believe this has to be decided and moved towards one of this before we
get merged?

> 
> - the generic scheduler code should also including the handling of endless
>   compute contexts, with the minimal scaffolding for preempt-ctx fences
>   (probably on the drm_sched_entity) and making sure drm/sched can cope with the
>   lack of job completion fence. This is very minimal amounts of code, but it
>   helps a lot for cross-driver review if this works the same (with the same
>   locking and all that) for everyone. Ideally this gets extracted from amdkfd,
>   but as long as it's going to be used by all drivers supporting
>   endless/compute context going forward it's good enough.

On this one I'm a bit clueless to be honest. I thought the biggest problem with
the long running context or even endless were due to the hangcheck premption or
migrations that would end in some pagefaults.
But yeap, it looks that there are opens to get these kind of workloads properly
supported. But with this in mind do you see any real blocker on Xe? or any must-have
thing?

> 
> - I'm assuming this also means Matt Brost will include a patch to add himself as
>   drm/sched reviewer in MAINTAINERS, or at least something like that

+1 on this idea!
This enforces our engagement and commitment with the drm_sched imho.

> 
> - adopt the gem_exec/vma helpers. again we probably want consensus here among
>   the same driver projects. I don't care whether these helpers specify the ioctl
>   structs or not, but they absolutely need to enforce the overall locking scheme
>   for all major structs and list (so vm and vma).

On this front I thought we would need to align on a common drm_vm_bind based on
the common parts of xe vm_bind and nouveau one. And also some engagement that
I thought it would be easier after we are integrated and part of the drm-next.
Do we need to do this earlier? Could you please open it a bit more on what
exactly you want to see before we can be considered to get merged or after?

> 
> - we also should have cross-driver consensus on async vm_bind support. I think
>   everyone added in-syncobj support, the real fun is probably more in/out
>   userspace memory fences (and personally I'm still not sure that's a good idea
>   but ... *eh*). I think cross driver consensus on how this should work (ideally
>   with helper support so people don't get it wrong in all the possible ways)
>   would be best.

Should the consensus API come first? should this block the nouveau implementation
and move us all towards the drm_vm_bind? or can we sync in-tree?

> 
> - this also means some userptr integration and some consensus how userptr should
>   work for vm_bind across drivers. I don't think allowing drivers to reinvent
>   that wheel is a bright idea, there's just a bit too much to get wrong here.

ack. but kind of same question. is it a blocker to align before? or easier to
align in tree?

> 
> - for some of these the consensus might land on more/less shared code than what
>   I sketched out above, the important part really is that we have consensus on
>   these. Kinda similar to how the atomic kms infrastructure move a _lot_ more of
>   the code back into drivers, because they really just needed the flexibility to
>   program the hw correctly. Right now we definitely don't have enough shared
>   code, for sure with i915-gem, but we also need to make sure we're not
>   overcorrecting too badly (a bit of overcorrecting generally doesn't hurt).

+1 on this. We need to work more in the drm layers like display has done successfully!

> 
> All the above will make sure that the driver overall is in concepts and design
> aligned with the overall community direction, but I think it'd still be good if
> someone outside of the intel gpu group reviews the driver code itself. Last time
> we had a huge driver submission (amd's DC/DAL) this fell on Dave&me, but this
> time around I think we have a perfect candidate with Oded:
> 
> - Oded needs/wants to spend some time on ramping up on how drm render drivers
>   work anyway, and xe is probably the best example of a driver that's both
>   supposed to be full-featured, but also doesn't contain an entire display
>   driver on the side.
> 
> - Oded is in Habana, which is legally part of Intel. Bean counter budget
>   shuffling to make this happen should be possible.
> 
> - Habana is still fairly distinct entity within Intel, so that is probably the
>   best approach for some independent review, without making the xe team
>   beholden to some non-Intel people.

+1 on this entire idea here as well.

> 
> The above should yield some pretty clear road towards landing xe, without any
> big review fights with Dave/me like we had with amd's DC/DAL, which took a
> rather long time to land unfortunately :-(

As I wrote already, I really agree with you that we should work more with the
drm and more with the other drivers. But for the logistics of the work and
the rebase pains and to avoid a situation where we have a totally divergent
driver, I believe the fastest way is to solve any blockers and big issues
before, then merge, then work towards more collaboration on the next step.

Specially when with Xe we are not planning to remove the force_probe
flag for a while, what puts us in a "staging" situation.
We could even make use of the CONFIG_STAGING if needed.

Thoughts?
And most than that, any already know big blockers?

> 
> These are just my thoughts, let the bikeshed commence!

:)

> 
> Ideally we put them all into a TODO like we've done for DC/DAL, once we have
> some consensus.

I like the TODO list idea.
And also we need to use more the RFC doc section as well, like
i915-vmbind used.

On the TODO part, where do you recommend to add in the doc?

Again, thank you so much,
Rodrigo.

> 
> Cheers, Daniel
> 
> On Thu, Dec 22, 2022 at 02:21:07PM -0800, Matthew Brost wrote:
> > Hello,
> > 
> > This is a submission for Xe, a new driver for Intel GPUs that supports both
> > integrated and discrete platforms starting with Tiger Lake (first platform with
> > Intel Xe Architecture). The intention of this new driver is to have a fresh base
> > to work from that is unencumbered by older platforms, whilst also taking the
> > opportunity to rearchitect our driver to increase sharing across the drm
> > subsystem, both leveraging and allowing us to contribute more towards other
> > shared components like TTM and drm/scheduler. The memory model is based on VM
> > bind which is similar to the i915 implementation. Likewise the execbuf
> > implementation for Xe is very similar to execbuf3 in the i915 [1].
> > 
> > The code is at a stage where it is already functional and has experimental
> > support for multiple platforms starting from Tiger Lake, with initial support
> > implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
> > as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
> > implementation will be released publicly early next year. We also have a suite
> > of IGTs for XE that will appear on the IGT list shortly.
> > 
> > It has been built with the assumption of supporting multiple architectures from
> > the get-go, right now with tests running both on X86 and ARM hosts. And we
> > intend to continue working on it and improving on it as part of the kernel
> > community upstream.
> > 
> > The new Xe driver leverages a lot from i915 and work on i915 continues as we
> > ready Xe for production throughout 2023.
> > 
> > As for display, the intent is to share the display code with the i915 driver so
> > that there is maximum reuse there. Currently this is being done by compiling the
> > display code twice, but alternatives to that are under consideration and we want
> > to have more discussion on what the best final solution will look like over the
> > next few months. Right now, work is ongoing in refactoring the display codebase
> > to remove as much as possible any unnecessary dependencies on i915 specific data
> > structures there..
> > 
> > We currently have 2 submission backends, execlists and GuC. The execlist is
> > meant mostly for testing and is not fully functional while GuC backend is fully
> > functional. As with the i915 and GuC submission, in Xe the GuC firmware is
> > required and should be placed in /lib/firmware/xe.
> > 
> > The GuC firmware can be found in the below location:
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915
> > 
> > The easiest way to setup firmware is:
> > cp -r /lib/firmware/i915 /lib/firmware/xe
> > 
> > The code has been organized such that we have all patches that touch areas
> > outside of drm/xe first for review, and then the actual new driver in a separate
> > commit. The code which is outside of drm/xe is included in this RFC while
> > drm/xe is not due to the size of the commit. The drm/xe is code is available in
> > a public repo listed below.
> > 
> > Xe driver commit:
> > https://cgit.freedesktop.org/drm/drm-xe/commit/?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7
> > 
> > Xe kernel repo:
> > https://cgit.freedesktop.org/drm/drm-xe/
> > 
> > There's a lot of work still to happen on Xe but we're very excited about it and
> > wanted to share it early and welcome feedback and discussion.
> > 
> > Cheers,
> > Matthew Brost
> > 
> > [1] https://patchwork.freedesktop.org/series/105879/
> > [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418
> > 
> > Maarten Lankhorst (12):
> >   drm/amd: Convert amdgpu to use suballocation helper.
> >   drm/radeon: Use the drm suballocation manager implementation.
> >   drm/i915: Remove gem and overlay frontbuffer tracking
> >   drm/i915/display: Neuter frontbuffer tracking harder
> >   drm/i915/display: Add more macros to remove all direct calls to uncore
> >   drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
> >   drm/i915: Rename find_section to find_bdb_section
> >   drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
> >   drm/i915/display: Fix a use-after-free when intel_edp_init_connector
> >     fails
> >   drm/i915/display: Remaining changes to make xe compile
> >   sound/hda: Allow XE as i915 replacement for sound
> >   mei/hdcp: Also enable for XE
> > 
> > Matthew Brost (5):
> >   drm/sched: Convert drm scheduler to use a work queue rather than
> >     kthread
> >   drm/sched: Add generic scheduler message interface
> >   drm/sched: Start run wq before TDR in drm_sched_start
> >   drm/sched: Submit job before starting TDR
> >   drm/sched: Add helper to set TDR timeout
> > 
> > Thomas Hellström (3):
> >   drm/suballoc: Introduce a generic suballocation manager
> >   drm: Add a gpu page-table walker helper
> >   drm/ttm: Don't print error message if eviction was interrupted
> > 
> >  drivers/gpu/drm/Kconfig                       |   5 +
> >  drivers/gpu/drm/Makefile                      |   4 +
> >  drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  14 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  12 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   5 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  23 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c        | 320 +-----------------
> >  drivers/gpu/drm/drm_pt_walk.c                 | 159 +++++++++
> >  drivers/gpu/drm/drm_suballoc.c                | 301 ++++++++++++++++
> >  drivers/gpu/drm/i915/Makefile                 |   2 +-
> >  drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
> >  drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
> >  .../gpu/drm/i915/display/intel_atomic_plane.c |  25 +-
> >  .../gpu/drm/i915/display/intel_backlight.c    |   2 +-
> >  drivers/gpu/drm/i915/display/intel_bios.c     |  71 ++--
> >  drivers/gpu/drm/i915/display/intel_bw.c       |  36 +-
> >  drivers/gpu/drm/i915/display/intel_cdclk.c    |  68 ++--
> >  drivers/gpu/drm/i915/display/intel_color.c    |   1 +
> >  drivers/gpu/drm/i915/display/intel_crtc.c     |  14 +-
> >  drivers/gpu/drm/i915/display/intel_cursor.c   |  14 +-
> >  drivers/gpu/drm/i915/display/intel_de.h       |  38 +++
> >  drivers/gpu/drm/i915/display/intel_display.c  | 155 +++++++--
> >  drivers/gpu/drm/i915/display/intel_display.h  |   9 +-
> >  .../gpu/drm/i915/display/intel_display_core.h |   5 +-
> >  .../drm/i915/display/intel_display_debugfs.c  |   8 +
> >  .../drm/i915/display/intel_display_power.c    |  40 ++-
> >  .../drm/i915/display/intel_display_power.h    |   6 +
> >  .../i915/display/intel_display_power_map.c    |   7 +
> >  .../i915/display/intel_display_power_well.c   |  24 +-
> >  .../drm/i915/display/intel_display_reg_defs.h |   4 +
> >  .../drm/i915/display/intel_display_trace.h    |   6 +
> >  .../drm/i915/display/intel_display_types.h    |  32 +-
> >  drivers/gpu/drm/i915/display/intel_dmc.c      |  17 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   6 +
> >  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
> >  drivers/gpu/drm/i915/display/intel_dpio_phy.h |  15 +
> >  drivers/gpu/drm/i915/display/intel_dpll.c     |   8 +-
> >  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 +
> >  drivers/gpu/drm/i915/display/intel_drrs.c     |   1 +
> >  drivers/gpu/drm/i915/display/intel_dsb.c      | 124 +++++--
> >  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  26 +-
> >  drivers/gpu/drm/i915/display/intel_fb.c       | 108 ++++--
> >  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 -
> >  drivers/gpu/drm/i915/display/intel_fbc.c      |  49 ++-
> >  drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 +++++-
> >  .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 +-----
> >  .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +---
> >  drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 -
> >  .../gpu/drm/i915/display/intel_lpe_audio.h    |   8 +
> >  .../drm/i915/display/intel_modeset_setup.c    |  11 +-
> >  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
> >  drivers/gpu/drm/i915/display/intel_overlay.c  |  14 -
> >  .../gpu/drm/i915/display/intel_pch_display.h  |  16 +
> >  .../gpu/drm/i915/display/intel_pch_refclk.h   |   8 +
> >  drivers/gpu/drm/i915/display/intel_pipe_crc.c |   1 +
> >  .../drm/i915/display/intel_plane_initial.c    |   3 +-
> >  drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
> >  drivers/gpu/drm/i915/display/intel_sprite.c   |  21 ++
> >  drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
> >  drivers/gpu/drm/i915/display/intel_vga.c      |   5 +
> >  drivers/gpu/drm/i915/display/skl_scaler.c     |   2 +
> >  .../drm/i915/display/skl_universal_plane.c    |  52 ++-
> >  drivers/gpu/drm/i915/display/skl_watermark.c  |  25 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 -
> >  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 -
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 -
> >  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 --
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 --
> >  drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 -
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +-
> >  drivers/gpu/drm/i915/i915_driver.c            |   1 +
> >  drivers/gpu/drm/i915/i915_gem.c               |   8 -
> >  drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 -
> >  drivers/gpu/drm/i915/i915_reg_defs.h          |   8 +
> >  drivers/gpu/drm/i915/i915_vma.c               |  12 -
> >  drivers/gpu/drm/radeon/radeon.h               |  55 +--
> >  drivers/gpu/drm/radeon/radeon_ib.c            |  12 +-
> >  drivers/gpu/drm/radeon/radeon_object.h        |  25 +-
> >  drivers/gpu/drm/radeon/radeon_sa.c            | 314 ++---------------
> >  drivers/gpu/drm/radeon/radeon_semaphore.c     |   6 +-
> >  drivers/gpu/drm/scheduler/sched_main.c        | 182 +++++++---
> >  drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
> >  drivers/misc/mei/hdcp/Kconfig                 |   2 +-
> >  drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
> >  include/drm/drm_pt_walk.h                     | 161 +++++++++
> >  include/drm/drm_suballoc.h                    | 112 ++++++
> >  include/drm/gpu_scheduler.h                   |  41 ++-
> >  sound/hda/hdac_i915.c                         |  17 +-
> >  sound/pci/hda/hda_intel.c                     |  56 +--
> >  sound/soc/intel/avs/core.c                    |  13 +-
> >  sound/soc/sof/intel/hda.c                     |   7 +-
> >  98 files changed, 2076 insertions(+), 1325 deletions(-)
> >  create mode 100644 drivers/gpu/drm/drm_pt_walk.c
> >  create mode 100644 drivers/gpu/drm/drm_suballoc.c
> >  create mode 100644 include/drm/drm_pt_walk.h
> >  create mode 100644 include/drm/drm_suballoc.h
> > 
> > -- 
> > 2.37.3
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
