Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F375F75CC9A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 17:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477CD10E6B2;
	Fri, 21 Jul 2023 15:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E2010E6B3;
 Fri, 21 Jul 2023 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689954700; x=1721490700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BlR3z2H7TwcnJBA0DxiA9tHFljcrpWfEb6lHHNPfVOg=;
 b=lCigV5g60GRuqHpubcz3vkEiU/mTE9yFlLTO842G721dr2zZMnL6Jf2Z
 3bUR5ASHvjl7pX6ulTqNcdoePuX4adtywQoQDSIYma2CIYPSIEsUoa6Yh
 Fk5luUgX6vFZG0GNglv1gMWM4ITi5MGB0NhrF0AhFSPvDHvs4/cgTa+0R
 xaVrIbtQhHPWDEQYw94kF+ueLxz/oyLfTCp593/YjIx/QXFKn1ECxNoco
 /Pjr/WSjNW7jt1rRt0AnIWkw9sXzNTOPG+1ZVedV/0DqS8Ar+T5WxV2kJ
 z9Cr4c+9BpRm9bYvUEm8IlFLWEe+sHrGX5qS7ap1zpPSOY5L5j4+6hSi0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453428992"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="453428992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898748840"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="898748840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 21 Jul 2023 08:51:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 08:51:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 08:51:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 08:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+ljoqB8Z93GVEp94gIwIKLR42tMm6c3DjkpVGkSIrhJEx6a+tYMhB2Pi+Z0+D0K+60P15WgrgA+BNdtrdHIAcR8ERdoaplubuXGrdidx2Wlc0PWDpz1KWlPxc58X8s2YPM4sLJqDYalQ94iJ7yFQgjlej6LChNzXEHiOWdNab4hMVwRA5WVHszOP8U95ec2IMb2f0y4PIetouwzFef0LSlox36qVKUniF/JE5MBm4ZFspwOsWI0khE3k3rL9bISDXPdcZ7Yw/vebrsdbfco9ZCLdc9Acc28W01K5I9/X1TbbZJjK7zOnmjUkql30RM+P2BBY8o08YTWNcTLx+Ul1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdn3haKvGApRw/BT6q0GnAA8JiFfO2CPcA4ioDYRUxA=;
 b=cV4zvoXFcfw6wUb1Mwl8HTUuoUn7qbcleIlyMmuurEztcmopiYVAk8G4clHK7DUOouvDv7IApQ7w+wI+BMHFDmF4SPH/tSUNMD6amX/1mmmk45NhmY+N5BypduoDbwzsYkJQIC7k0Zvk5t6rJ1ddLWwKTWw4/+4Ki4MYA3h1l3oD+X+MTkWq8MGM4oSLB0t3lXS0l/Z2bMJ+BD7h9K/gtgjUNlzhcHGKsam2yPBWXeFvYT6uHCm+2xnV1pWe8x5+Gl2BU05VdfbYqgVgHToeNB+USFNYFn16nBw5KBxIpfRHkIZclaRXgHMD3sObnO4wtQQ3KmUg7Wv6kJrXMIdBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Fri, 21 Jul 2023 15:51:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 15:51:37 +0000
Date: Fri, 21 Jul 2023 08:51:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Message-ID: <20230721155134.GZ138014@mdroper-desk1.amr.corp.intel.com>
References: <20230719123730.1094726-1-tvrtko.ursulin@linux.intel.com>
 <20230719223143.GP138014@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567588886FB6EC3F357586B9A3EA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230720002208.GU209733@mdroper-desk1.amr.corp.intel.com>
 <51198371-0943-e4fc-41d8-4c3ac07409cf@linux.intel.com>
 <BYAPR11MB2567836F0A56371CC86111739A3FA@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2567836F0A56371CC86111739A3FA@BYAPR11MB2567.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1aae49-c906-4c18-0c34-08db8a025dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVycLuwXf74OKOQVOrzGIrBgJ3vKX1onvAiFRwxQXzqCcohB9z1CvDFJpHRiZcDVrFWjd3Y+Pav86RRvowcILVX68g2IzKatH2uoDo4c0+i+tWx3JK3O6g0mE/aGpKynnOWaESoj07zNJOijkglkUKSAdTD1cHOyqHZFfNnbX5H4SPdCGAEje0ti/dw0F3JB++5rWvzc0M91ij1OC4zwtSfG1X5wqSJtqOi3gNdwAEijXtuEpYgQ+xi0ghH+XJLEVZRe4rBBDQ/GgThMfzVU/IbpmmkCIBJM7sy2ykU1CLrSrBSBX4bNU55CiDGKAV2mnIRlGmAL+zfZyajB67ImYKJZb5k8gzt/hAANstqCSbr3+l0tnH/QwG5UB7AFGTszbVpYHejbwRTfmtW/VaydxwItpM40hai0n27mDtrSMGD7ThmBODTQaBNhLY+j90GmaFleZu7s/xUovtf7oZeyQR8f0R8tbQpe0h9cwVgSciAYbR7z3NLJsXpALsvyTfeSlFOpSf3R06t+LjpzvpuhAhzbPD8yu9OJrEgTAl6sYC9dtr792eI+xisqnuuwUbdj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(6666004)(54906003)(478600001)(6512007)(6486002)(6506007)(26005)(186003)(1076003)(86362001)(6636002)(66946007)(66556008)(316002)(66476007)(8936002)(4326008)(6862004)(82960400001)(8676002)(38100700002)(5660300002)(2906002)(41300700001)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D053okoVguT0HRgKWbbQklrbAd1jDN0vLRj5TYpKG62NSsxnuJUCjl1TPoJD?=
 =?us-ascii?Q?Jhst40ehF4q2ss4jEsno2QsCBfnjNQ++1M5hjihWZB2Ad428Neb/9SUpMjuq?=
 =?us-ascii?Q?jY12RAQBnlLtb+DOAEclpOiCzF2XgTOmXi5/uuOR7BJxm84oM2VNG513xePH?=
 =?us-ascii?Q?Mgqv0VKwsFKg0cW7yfzJSxIdt8mdXmXMBqLawE1wRoqrq7FD15e9mpiiDhvu?=
 =?us-ascii?Q?KdPhJ/ntAKS3V31hE2gjpKzCmgrpf9u6Xyxwkcj+MvmI/6yJE9o3E3taneUY?=
 =?us-ascii?Q?wPv9WiAgkhuc56teqsYaYm10sIUUAOREHtGo5CgOmDCjprxECkKhH27MrxOc?=
 =?us-ascii?Q?YqnU0swRFf4jE5YPySoNCDa5spHJTgLuDviDi4ZsBuQes11hva5QcUDLwA5t?=
 =?us-ascii?Q?zjwfx8ElfX26MJ7Ylr34c5kYL2tfuCTo0jKa3DaXbL6q7/glc8JDypyqXr+m?=
 =?us-ascii?Q?N0BdnafJJmLjURjUJMss4OYJ9vfcuAezEP2Xh4yc9Ws8sh6D2sXGlM5KrEAM?=
 =?us-ascii?Q?kdOKLlrJ+SzhFjdEi8azgQodOV5iiVsABpWYT3JkS5A2kyxcVhX7XnXK6scH?=
 =?us-ascii?Q?RtOx7bF9xtGpgAS0KpzD+Hbc4HqzkYcj9Yko4wpNlZcYz5XOrobEvDREyKhg?=
 =?us-ascii?Q?d9VsGDxng3AoZcYmmqiGfTHRn1nS3wyknT97zCLnTuXBGxouGEW/9xEi99RF?=
 =?us-ascii?Q?vmdVCYv4ehbw9YR0HiSi8cURjwMffYZ6vPeTtLCyKn9vBreDOj8z7LN9ph3b?=
 =?us-ascii?Q?v+YwhVddyzJG042w1PDm2LdVwS1u4GlW3OxzGTlcr1CVxB3eYe42ykpaKoPr?=
 =?us-ascii?Q?58NzzepJPnGQUFs9DWhguFadahEFL24swN6RE0ZUT2QxIE5LLHFuIR4JZzYY?=
 =?us-ascii?Q?e8PvIYOp9tNHM6d5CAJuJTNlHn7IrHWdwyg/pwvJ/P1fqQyqd8Dnx+uleyV/?=
 =?us-ascii?Q?Rfw6971QMzSzM/CuFYTDQg4+Nw5Co/is1vqyh+75J6Td4DO+8B6KbjrmJMtE?=
 =?us-ascii?Q?x0hD2/4DJDhrYN4OdntK7vrmopNGLoe8EEy0kEeGznNyQc2C0mywiylbC+Vk?=
 =?us-ascii?Q?m0EhRxKBNT+iYnautjXYuk56h+npKtCEQT2Eb5WQ3Lt2DGAfXnBRs01O1+mj?=
 =?us-ascii?Q?uvXw+spj1Y9pp6G9xGYB1ZZmH7KBHFUhchbvnQsmneeJGRRD6FTcE9UmTaJC?=
 =?us-ascii?Q?V9GnKdW1fhgwzMP6/DNMKQbSpIoUV91wyGw16Y30LJREVxpfkxAL0ry8pkpj?=
 =?us-ascii?Q?ZqLzH9HHhJ3hXZ+Eo84gup0uaFvJ7mS2ANBKYoOVfM8R9oEvlAzOIJ9SoSB1?=
 =?us-ascii?Q?ZPLb/FJ+umZWJ8w3mnB++vYN7OYPeEMaWUgG2iF1hdIF3xFSYwUZ9fHFz3Qm?=
 =?us-ascii?Q?RpEONgctcTs+42JX/Xbi5KqxS7WXNH8fv7wQ2znnINmcMyXN1LBRzipAZH0u?=
 =?us-ascii?Q?IQiHieJGG4XXpDjdteZWRmS/cD8cNviU4sG0SpF12AXyWCJgIbhCDxK0oPAa?=
 =?us-ascii?Q?IGOZwvXikTcHmegLVTpfWUlE8/0Ak60CnDJk6X9ofDUu3JL/OlF4jIQSL9xe?=
 =?us-ascii?Q?llO0A7217boqhgNPQpvrH/4iro0WPLg+iw66+KFa84kJHCrj8nuDHnPyzECr?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1aae49-c906-4c18-0c34-08db8a025dde
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 15:51:37.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMps4kYCnt6teWqIaFNeY74n7JPIyP03SbtG3TDjKaVaK1An7fesZv64BQfWpKsePE0VvVp6ShrJP4qJbjOIQY5FhOpTXk/G8E6TBGUsuJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 09:28:56PM -0700, Yang, Fei wrote:
> >>> [snip]
> >>>>> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct
> >>>>> drm_i915_gem_object *obj)
> >>>>
> >>>> The code change here looks accurate, but while we're here, I have a
> >>>> side question about this function in general...it was originally
> >>>> introduced in commit 48004881f693 ("drm/i915: Mark CPU cache as
> >>>> dirty when used for
> >>>> rendering") which states that GPU rendering ends up in the CPU cache
> >>>> (and thus needs a clflush later to make sure it lands in memory).
> >>>> That makes sense to me for LLC platforms, but is it really true for
> >>>> non-LLC snooping platforms (like MTL) as the commit states?
> >>>
> >>> For non-LLC platforms objects can be set to 1-way coherent which
> >>> means GPU rendering ending up in CPU cache as well, so for non-LLC
> >>> platform the logic here should be checking 1-way coherent flag.
> >>
> >> That's the part that I'm questioning (and not just for MTL, but for
> >> all of our other non-LLC platforms too).  Just because there's
> >> coherency doesn't mean that device writes landed in the CPU cache.
> >> Coherency is also achieved if device writes invalidate the contents of the CPU cache.
> >> I thought our non-LLC snooping platforms were coherent due to
> >> write-invalidate rather than write-update, but I can't find it
> >> specifically documented anywhere at the moment.  If write-invalidate
> >> was used, then there shouldn't be a need for a later clflush either.
> >
> > [Trying to consolidate by doing a combined reply to the discussion so far.]
> >
> > On the write-invalidate vs write-update I don't know. If you did not
> > find it in bspec then I doubt I would. I can have a browse still.
> 
> Matt was correct. Quote Ron Silvas from SW ARCH, "MTL GPU doesn't write to
> CPU cache, it simply snoop CPU cache on its way to RAM."

That's good to know.  We probably also want to find out if the same is
true for old snooping platforms (i.e., things like VLV/CHV/BXT) and/or
dgpu's (where I think the behavior is probably defined by the pcie spec,
but I'm not sure where to look for that).

> 
> >>>> My understanding
> >>>> was that snooping platforms just invalidated the CPU cache to
> >>>> prevent future CPU reads from seeing stale data but didn't actually
> >>>> stick any new data in there?  Am I off track or is the original
> >>>> logic of this function not quite right?
> >>>>
> >>>> Anyway, even if the logic of this function is wrong, it's a mistake
> >>>> that would only hurt performance
> >>>
> >>> Yes, this logic will introduce performance impact because it's
> >>> missing the checking for obj->pat_set_by_user. For objects with
> >>> pat_set_by_user==true, even if the object is snooping or 1-way
> >>> coherent, we don't want to enforce a clflush here since the
> >>> coherency is supposed to be handled by user space.
> >
> > What should I add you think to fix it?
> 
> I think the simplest would be
> 
>         if (obj->pat_set_by_user)
>                 return false;
> 
> because even checking for incoherent WB is unnecessary, simply no
> need for the KMD to initiate a flush if PAT is set by user.

I guess one thing we're missing today is a well-documented explanation
of the expectations for i915_gem_set_domain_ioctl behavior when we're
using a user-defined PAT?


Matt

> 
> > Add a check for non-coherent WB in gpu_write_needs_clflush as an additional condition for returning false?
> >
> > And then if Matt is correct write-invalidate is used also !HAS_LLC should just return false?
> >
> >>>> (flushing more often than we truly need to) rather than
> >>>> functionality, so not something we really need to dig into right now
> >>>> as part of this patch.
> >>>>
> >>>>>       if (IS_DGFX(i915))
> >>>>>               return false;
> >>>>>
> >>>>> -    /*
> >>>>> -     * For objects created by userspace through GEM_CREATE with pat_index
> >>>>> -     * set by set_pat extension, i915_gem_object_has_cache_level() will
> >>>>> -     * always return true, because the coherency of such object is managed
> >>>>> -     * by userspace. Othereise the call here would fall back to checking
> >>>>> -     * whether the object is un-cached or write-through.
> >>>>> -     */
> >>>>> -    return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
> >>>>> -             i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
> >>>>> +    return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1 &&
> >>>>> +           i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) != 1;
> >>>>>   }
> >>>
> >>> [snip]
> >>>>> @@ -640,15 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
> >>>>>       if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
> >>>>>               return false;
> >>>>>
> >>>>> -    /*
> >>>>> -     * For objects created by userspace through GEM_CREATE with pat_index
> >>>>> -     * set by set_pat extension, i915_gem_object_has_cache_level() always
> >>>>> -     * return true, otherwise the call would fall back to checking whether
> >>>>> -     * the object is un-cached.
> >>>>> -     */
> >>>>>       return (cache->has_llc ||
> >>>>>               obj->cache_dirty ||
> >>>>> -            !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
> >>>>> +            i915_gem_object_has_cache_mode(obj,
> >>>>> + I915_CACHE_MODE_UC) != 1);
> >>>>
> >>>> Platforms with relocations and platforms with user-specified PAT
> >>>> have no overlap, right?  So a -1 return should be impossible here
> >>>> and this is one case where we could just treat the return value as
> >>>> a boolean, right?
> >>>
> >
> > Hm no, or maybe. My thinking behind tri-state is to allow a safe option
> > for "don't know". In case PAT index to cache mode table is not fully
> > populated on some future platform.
> 
> That would be a problem in the cache mode table. At least max_pat_index
> should have guaranteed the PAT index is sane.
> 
> -Fei

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
