Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F16E1248
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C3010E0DA;
	Thu, 13 Apr 2023 16:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3466410E747;
 Thu, 13 Apr 2023 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681403373; x=1712939373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6+jJw25mhSaB6eyaHwP/TebwDpJpR+4l+DyUicjGsd0=;
 b=FjPC0ZYJnhKfbKvZhAmeSb/DFRWXGiX/Zalu3TNt1VEBqEad7PQdTd8f
 aFREATv9B40cAVaTmN5qys7137ijnzych7ZRey2jdtZLWeRnvDXplexeo
 V2Sk1+BW3RyZGzcY+pwusogbYpmeSH2pX0h2466u0oKjWpuDJvBjFqWfX
 8JHQYREmggmJoKXPP9zBFptebXPASi57kbBOsHHHe7c43o28ECXZ7MqlE
 oUpvyOvFqlADZ3/1A6KuiGdI/O9o2wWcFcpvF30ehmGqJPwUhHSpw0L3d
 PA+hdNEAupqG8YNBHq7lvELGFp73PzNtH01WRN40eP6jOLf7dkXYDDTKS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324586349"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="324586349"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="666837100"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="666837100"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 13 Apr 2023 09:29:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 09:29:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 09:29:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 09:29:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 09:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gu2+TVgUNE8330NZzuKO2a3r+Z6/DlSM0FBsPzd58j0dfnIT5MILIVjl4a8lhgNkrk1oy6bAmTUs5VE4Ac7YiqadLINV94EHJ2weBbulL7dyq7YBbyJyN9MrjuaqHc2vMHo+lzNa+Leh/fz8lp0nMSOjmKi8/YXiL1NkxMS5yABMV5p1kJDJt7G630Wxu5V2JkhVDdZNszjfx17XuxKqZ3s8NlzHbNpuy9fNp/eVaS+LjtKop+PfMx3ln3J9+uUVdMqi/lOP13xpJaLAJcpkbYw5VtvPJn8qb9KQi+Z+9eJ9k0jdCNH/4P9oZMNS19zsuT8Hs7osqRHIlnDkeGYTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1+FqXH3q5eqdCYnVh75ePTK8Bujb72sfWSKN8o1H/g=;
 b=GQGRGNL9d78tGZYE8a//9qZhaRT9c1xdbE0vr3a5Ih95vqN2hqBePusdN9Id5OCUe82ewHXjU697WnA5UJmUqi/NxDdk4ET/dZ17GdpYRaozd1Oej7K4HzH8P+EBT1EpMmdXr2gOysJ0BzssNQukjeaCKRTZHF2WZu7M+BL2yYFoY8RAS+OjV6V4RVGNcC+iKXoD6cOW2lf10i9HpVSTn1MrPctNfF7vALszOxNjeSJL5CB7BU0kBm2pcKHRGWAQcECxhped48DgUUQxfV/Jf50MciFHMbkblOBpx8KeJIfAKIaq3e+PKz2Sb5xTYgQHMZXDnmNO5pOIr3SEr/rylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Thu, 13 Apr 2023 16:29:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:29:29 +0000
Date: Thu, 13 Apr 2023 09:29:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Message-ID: <20230413162925.GI4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
 <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
 <20230413155210.GH4085390@mdroper-desk1.amr.corp.intel.com>
 <8279ae61-f24e-b7f9-464d-86a29562122f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8279ae61-f24e-b7f9-464d-86a29562122f@intel.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8f278a-c7ca-4ea4-bc39-08db3c3c40ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XuD3tadgPdwrqLUVKYAZ5w1vfHoNd51TdX5dGb28PBlJuH4xWF8plpyYvCrYrFpRAhndU3aiMRUY7gx5HxU7+ChouPMLgW1+yeTJQUaD4uSzhkwjF3gYuQOT22V7m8mWHWxFF63B7j/zOabNiyBd3exHgQb5QGs++ZTLO37iWFcANyYmKf7qxmYGJwQc69+QvJzU9QebrUWnJpHWk5Qh/Ermekp4c8SQFOn6tOfezTvQZ7mOCnL2b3jTKehhyvnS/KAFKOt/UnjI8I7vi4nbDfvfvHJuBVasLOXfli/jHGOZyoOqgVlvq+m+S5fG0q5yW8C1E3dbrXG5WYgFaOQqVK8PmtFlju90IPpdSJvt82kSj+UoSbDFtitjW/D6jy28lUIY2vA0G5NmhaBqqWEsBzf2i73JxJSWF3Gl+StsFlk/MVLzu5iDHRFhSu43D92DXVbboMk2dgqAbht3/I3OKbUfvzaT0ZyL8dtTrNCcpT1P4oHzCXoXLXLXk3/5WLAenvInHQ/xQauaavXETw9sinfQpdFExz5CfN9zHxtxg0lsT91nEzNKmOA3iRezk1hI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(6666004)(6486002)(66476007)(66556008)(66946007)(4326008)(2906002)(86362001)(41300700001)(82960400001)(33656002)(5660300002)(8676002)(8936002)(6862004)(316002)(38100700002)(478600001)(54906003)(6636002)(53546011)(6512007)(6506007)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHtSVB3VCXwLFVBbDKhiToSueiu+MEpui73Z6NYIs8Sl3xYYEUNDDY1WCBdb?=
 =?us-ascii?Q?DIcWt+w0F/AES/Ml3jhKtUBzDhmzE4a4agPIXFEdss8bTjRU6NGPI84+h406?=
 =?us-ascii?Q?5rLZRVGu+9RdmfqEpkCvUUc7pQBY5F0KL6i36tuwmlOUgjAuuU5UkMoBrhYq?=
 =?us-ascii?Q?SkJSMQH7bg1pGb5U3io+R8Xaz1veAL9lqnmTlnF4GEhHfNB8d4n3HWse1gF2?=
 =?us-ascii?Q?GZXpee4zEpvghCvSGM6n8tL16Uml6sEzru/KT36AkbqnCHg1HHvx8J4UVIiQ?=
 =?us-ascii?Q?lce1CH5LVkwVe+Oc2PBID4C6gzM9CP9+u8SbYcCcxi4taxOKXoCWvdnrsET2?=
 =?us-ascii?Q?oOUso0hIdrohd7seIJunuaLnW+rM3H0Q5QiX/AATynp9aJpDlu2gpq6GEdXv?=
 =?us-ascii?Q?22X9QxOvqL/Ju6LbHsLfW7DVwWLN1Bk1sNFIvWioIsetb12zU68SxVASrb2o?=
 =?us-ascii?Q?ngC6/5l3tqxKsk1VvRPwU2yb3vin+oCGvAkeCfn8Sj3p47gZwK1cbDf5vqFd?=
 =?us-ascii?Q?GsfK2qmpTdU7/mA/O6u7RyUBeg8QtkZCfL36p5wtKbpEy7qEFW0j5IjucAxC?=
 =?us-ascii?Q?5dkqfh23qjf6AeOGo/bWiF6+bSmYpp/M0CXcWwZqtBpq40Re7hG48lW7KnKK?=
 =?us-ascii?Q?FPtZKbdsdJdX9GX6+Bd5ewFIHv6jWqjm/IcahXUEh0Mv7W8utHPKHQ9/TAKd?=
 =?us-ascii?Q?E2xbIUydtypjGyjDsL5yGc8hMpeWK01RV7Yra56bsLtDEvRLMvZyDsb6aMX6?=
 =?us-ascii?Q?gUHF9JgNC7kqMyd8392ghqT/rrKuVZki6l86zh9ipc2+cjg6KyHdSFwu1suk?=
 =?us-ascii?Q?GVKCYG/CqQW9I8Mp/eyszcgT/Hagw3cDrOLAaWi5TyoUj+MbCKk9KuxdNqt3?=
 =?us-ascii?Q?N8SntBQofmtfaMKGW6rpjC7u5QC92ly3tozfstpQiOkIieMRHazNYmZ3NjAJ?=
 =?us-ascii?Q?EZnAAGMpeU4yjjqCKxUjEh4AtZVLqXIOnIHApNN8nMQOYJqYawbl6kxUubCb?=
 =?us-ascii?Q?t3SJEmgC/ekFvBBGDCUtpc5LsguWF7vm0d6T0tEmfoC4cXyrDvhPLR3WQOpN?=
 =?us-ascii?Q?Aa3+JJ2QjnTKAKBHlwrNEmx49W9AkGjfhLLonhTeGPrndZgcoFf3Mt8vXHDF?=
 =?us-ascii?Q?Za+6Oz/tYvlGvBTockxMwkGoePK47vqoE7NCvyE3FTR4HZp6QQZA2mWLbigY?=
 =?us-ascii?Q?Op8uKEpG9i6Jn5TgDTgy/0sicJWdyyoQQ32c/RIJsHhp/sNbyJGLDfkn52eD?=
 =?us-ascii?Q?dFr8OsVGLQx+HwYph+gzc01OejYr62aJWgP73SuPtRVcC7kJvMwWWuYhxWf+?=
 =?us-ascii?Q?yatZkJbCjPLABdAfyKol489SZ9cEf/+RFW3dygWDOi7x2kG1TOoatLbWm31+?=
 =?us-ascii?Q?anBvSZRmkT3x7ae1AJ5pkT8vRS/+DnugZkkbV2YxDHxRtmjklA9cRW7cm4LO?=
 =?us-ascii?Q?i0BYcA3je7XdM1K02l9G5jYj26V66C9N7Xk3aQD5YhOy9OQooq6iPn8/ubqj?=
 =?us-ascii?Q?qX1V/J6Pm85QjshbalH881DnC/BMumZAx87hCLHEUnYsjY0O+XNm6gpucHFp?=
 =?us-ascii?Q?x6C+eVxsjmd/v9L6TwQoDfv4vyRH7NOFfA7riLGf6bHBViO3osAsgWyvykfE?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8f278a-c7ca-4ea4-bc39-08db3c3c40ee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:29:29.1670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: si5fLtQJ6Ys+dVyAJM291Ydll9vpP+FUvyWdMkV7A5Cfe6OT5dF2IkPrnOVYbviGc/Hcr7tOjQsdvykjTz05MDVSQvru7X92pXD0IMAxQDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 09:03:29AM -0700, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 4/13/2023 8:52 AM, Matt Roper wrote:
> > On Thu, Apr 13, 2023 at 03:56:21PM +0200, Andi Shyti wrote:
> > > Hi Tvrtko,
> > > 
> > > (I forgot to CC Daniele)
> > > 
> > > On Thu, Apr 13, 2023 at 11:41:28AM +0100, Tvrtko Ursulin wrote:
> > > > On 13/04/2023 10:20, Andi Shyti wrote:
> > > > > From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > > 
> > > > > In multitile systems IRQ need to be reset and enabled per GT.
> > > > > 
> > > > > Although in MTL the GUnit misc interrupts register set are
> > > > > available only in GT-0, we need to loop through all the GT's
> > > > > in order to initialize the media engine which lies on a different
> > > > > GT.
> > > > > 
> > > > > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > > ---
> > > > > Hi,
> > > > > 
> > > > > proposing again this patch, apparently GuC needs this patch to
> > > > > initialize the media GT.
> > > > What is the resolution for Matt's concern that this is wrong for MTL?
> > > There are two explanations, one easy and one less easy.
> > > 
> > > The easy one: without this patch i915 doesn't boot on MTL!(*)
> > > 
> > > The second explanation is that in MTL the media engine has it's
> > > own set of misc irq's registers and those are on a different GT
> > > (Daniele pointed this out).
> > Assuming you're talking about MTL_GUC_MGUC_INTR_MASK, that's not true;
> > it's just a single sgunit register (0x1900e8) that has different
> > bitfields for the primary GuC and the media GuC.  So I still think we
> > should avoid looping over GTs; it's actually much simpler to handle
> > things in a single pass since we can just determine the single register
> > value once (all fields) and write it directly, instead of doing two
> > separate RMW updates to the same register to try to avoid clobbering
> > the other GuC's settings.
> > 
> > For pre-MTL platforms, it's the same register, except that the bitfield
> > now devoted to the media GuC was previously used for something else
> > (scatter/gather).
> 
> It's not just the GuC, the VCS/VECS engine programming is also tied to the
> media GT (via the HAS_ENGINE checks). It looks like we unconditionally
> program VCS 0 and 2, so it'll still work for MTL, but if we get a device
> with more VCS engines it'll break. Maybe we can add a MTL version of the
> function that just programs everything unconditionally? Going forward it
> should be ok to program things for engines that don't exist, but I'm not
> sure we can do that for older platforms that came before the extra engines
> were ever defined in HW.

Right, so I think the engine handling is already correct for MTL today;
the main concern would be how it might need to change for other future
platforms if more media engines show back up on a media GT.  I think we
can wait and cross that bridge if/when we get to it.  With focus moving
over to the Xe KMD, we might be on a completely different driver by the
time the hardware adds back in more media engines that aren't already
covered unconditionally.


Matt

> 
> Daniele
> 
> > 
> > 
> > Matt
> > 
> > > I sent this patch not to bypass any review, but to restart the
> > > discussion as this patch was just dropped.
> > > 
> > > Thanks,
> > > Andi
> > > 
> > > 
> > > (*)
> > > [drm] *ERROR* GT1: GUC: CT: No response for request 0x550a (fence 7)
> > > [drm] *ERROR* GT1: GUC: CT: Sending action 0x550a failed (-ETIMEDOUT) status=0X0
> > > [drm] *ERROR* GT1: GUC: Failed to enable usage stats: -ETIMEDOUT
> > > [drm] *ERROR* GT1: GuC initialization failed -ETIMEDOUT
> > > [drm] *ERROR* GT1: Enabling uc failed (-5)
> > > [drm] *ERROR* GT1: Failed to initialize GPU, declaring it wedged!
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
