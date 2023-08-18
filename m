Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58927780C22
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 14:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D617410E05E;
	Fri, 18 Aug 2023 12:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0557C10E05E;
 Fri, 18 Aug 2023 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692363064; x=1723899064;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1PQpz81As/2ujrr2Wi323+Dn7qGsaL0vAcUcw2KTQdM=;
 b=UIwW66n3ZR3FkXb/OxxLejetgjtpQe+yayqAfsdlFODWF/abLWZCAwMb
 fY79wHZQG/Pm1RUN57s0hP4/Mi+xTeLnQAhbDl8amB6ChoMqiFYiIPvVK
 mOJgFaAepHeja9vDY+gab2r/edUF42OSY3gZ0uFaapS/hwlvewX6+3BWv
 axDfZX42ksBdGYu5Yx8A5hz6P3+0hv6BRELP7XZVwTW6RET5SyDyYTAW2
 DdYDnI+O2wZ7+LxhlS5q7WT5hZgDvkageONOBU7gHFIn8uyR2yX5Jb3Bj
 kMYdnNaAhSbXK/DjyEWGZGzvbpfe0P3U7626q95kBI3Lg4bCGJmY3/Aqi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353396104"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353396104"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 05:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="684886559"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="684886559"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 18 Aug 2023 05:50:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 05:50:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 05:50:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 05:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEgP0H1J1C3r70e2uwVveTxNYVy9r3u2FfcgKLgDk7EhrBnJsIhaV3XV/O+EUSlgGtzB5DToUbWU4XKYX6SqWAK0WzeQvdfB9RBL5TCYJQYlKvMG0hRaLj+92KSXRCxhsPzp0mtDnGRSGjWp+8AvfwYNV/v4pha8nmE93E9Amu8Qx3ehnGJXbvCXoE/WGDOY0N4Lksjg6Q2SnHZLWyzlAvZPfP5f9rOW77v6lILZSMR+E7rA3nkUEXEmhWtJLK61RXbwrTEn0F3fGrphX7AuTIpjdbWS95va16deyzu3VPWoFxrzs4Dn26blwFWoEqGvBLZhA/ORdtKQ0dG44mvwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LL9e7A6ZeqT/Hwyyma0pUUw9WlbI8o0wPei/vWRk2k=;
 b=d0du/cSKge4PrPDvTcPxlbzm/YyyIRkUPSzC4njmE3+DLtUMQBYnXN3Hl5hPZx67Dv9LqfkdX6UKeZdcb4NPQQbUxIbCKJq6dX30rFJCMIJLfVvEUxTmqs4qIcI7KvAqcd16AnvOCEWjP/9euOc4t6hGwEL/Z1GkRPTeqYT0g5Q1FyFBHiuPErsJwSYAL6wwTkFeTySG2gqfuTINT6igtGQ/uj+l5+ZegQyaU29JXYKUEkUqz9tyxBe6GR9wkNRCTk+1BSc0DN29NSSH7E24gDr9ZUZVp1FPd4tRka/0mlYJ2xLPiJ5Q7YohfGmp12R2SQLKH/ClIpPXApLQsJcDkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 12:50:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 12:50:52 +0000
Date: Fri, 18 Aug 2023 12:49:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZN9o8paxwsYYQrb+@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ZN7gxBpnZD8OW9ZW@DUT025-TGLU.fm.intel.com>
 <3aa630e6-db3e-c03b-b3c2-aca517170a1c@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3aa630e6-db3e-c03b-b3c2-aca517170a1c@amd.com>
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbe69b4-7de0-4f05-1f24-08db9fe9c179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WytmYPwMe06HRd4PGAquZ2cqICJ7VmZYlkc2pi31/caqfvL6OLrn4tbWiBZ8ZZah3IGHhGylJHW5YQ85rGh3u4f+QTsU+cm3sjthCVSUKDKE8WoidfTTKGiBRt5VMmoERyXTZTPPoA1CKToN3gRRi3TK5Wi0+bVIy9ycjGwUlJ1GMSJWpozyubCny7DxqoUh4hHN3JKGwT6zuaxc0UcWhlvpURdK91gSYPtdfHLzDQbHm7q/SlKk71tC+YPwV8MwvI8ZEtZH2PtVwY4/bVwYeMnmGaxzOAYAAGUkFbySMOt7747D6OUEZVX+nBe2MQe3OtjF9L4xoBDUAV+ogT1lQ7Maq36CGyyISsxAMPjcgJ7vLDL55nYfuYVwVCp/HqcGC3zLpzbMscCMzDR4zgrBSGvURa6EfBI5E4S/Znay3OmHICH/ZLj9VZhKk+CaEvf3PvD+WXQXzJi3akfVKIsrvuoAdRLel80kVJ3u7HwZRY1mRsUl3kwG/Y3j6UDLlCZrXevFdFy4qrIjgAC7iLw9trKQJAyurcU5Ia+WMaiZhCcQzhn2hwYr79qk6CTv5DKL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(1800799009)(451199024)(186009)(83380400001)(66899024)(66476007)(38100700002)(6916009)(316002)(82960400001)(66946007)(66556008)(478600001)(7416002)(44832011)(2906002)(30864003)(41300700001)(8936002)(8676002)(4326008)(5660300002)(53546011)(66574015)(6512007)(6506007)(6486002)(26005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Its0F1k1NoSDiyNh9xjr/ul3vKVYDGEy6XrBVP/gX/wOo2ZUUrpFcx/Q3f?=
 =?iso-8859-1?Q?Jb1kIRSi5e/gXF7Pvl3h4+vDPC9Proq8BvPabrDXxiofGsp6ncAjvGKyix?=
 =?iso-8859-1?Q?q2WRY+kGkxM6gI/t2j9W0Yxb75mVzqqM2ZcZrKnR8u1tOJf9l0gVw5FMbe?=
 =?iso-8859-1?Q?xE6bSVNYBgzGdCWw/G7QjuWfYN5yEk22FNp9AukhBvtRHgsI+IXMKOKZmh?=
 =?iso-8859-1?Q?22e9GP2SR45YyhGT14JLWMvgwqn/f7idExcUHPSJ3Fn0SlRRqgCAZlF0q3?=
 =?iso-8859-1?Q?e4tVRbNpWXo9nW7CAaPtamoaw0b1fsQOWcH5/tHpOSTZjQV/WMBnog4Bx5?=
 =?iso-8859-1?Q?vLr9HgYyLxSEdpevpaBTJkLITrNFEdL1qUIlXFeiSzf7x6DMm56VFg0UqC?=
 =?iso-8859-1?Q?2g8Q4LWlzPb1FJepZJaLnEapTUnEdmO2v98Gcae/YaJGZA384A7P3FLrHc?=
 =?iso-8859-1?Q?xzibiXKPpB1SV3t5KBeJKgGz0t0u+swHM3SlFmHoH2gOVguHgj9M8iY5Yl?=
 =?iso-8859-1?Q?Q2suBNRBN1Q8vOOkt0X6jBU9xfA4efBeZ758m5Po1lDNJaR+a4Dd72d4h3?=
 =?iso-8859-1?Q?NgRFoPDyyeGc5vBfXeAInVyU6YFYmCLLeeAhbEEkZg5NKo6a4SfkUj03vG?=
 =?iso-8859-1?Q?fd/afkOw6b/eflYdpawqiBBfPZ8GObYPOIPBq5X9GivVWNJrnWkZR40How?=
 =?iso-8859-1?Q?hPmtYw5k1Ilac7lgYjpGoQ0PlQ94E4yQy2WGq4u6HE4QFDRe7/qs38uMuG?=
 =?iso-8859-1?Q?VqQ8mHFnnhFDSu9GjK+k3cwpIBWy+nJbIeVvusuSuvPTTwGeIhg5aRqPhi?=
 =?iso-8859-1?Q?N4cYzT7ixBgPmdv1IzlBA7+D8+gqKERhhequNZWnXC8gNNcEblBL96ft1y?=
 =?iso-8859-1?Q?2Nctg+7hff2bNQ83CBa7InpT02hZaEXVv+MTtYtEChwV2PeDhpGJprapUs?=
 =?iso-8859-1?Q?mo4KOKtrP2Vcx9JIGDPg7ia1Z6wn4CI3aS6XLxobf4liCcrivKYV2WSgXG?=
 =?iso-8859-1?Q?yBe+rOJrmXCaWxbKxoUfBuOOc8N3YBtp1jKfwopN8gxPtMgEe7snQXrG25?=
 =?iso-8859-1?Q?Aiww/1rAR+Iijoa9PshQQ4nRG/1TvYUq6lWwNuGenfRGic5BxAbSIHLUNa?=
 =?iso-8859-1?Q?7KUZ3eVmhD6X5GnW5zd9FN757bIqr/q/iA1SJ8paJzUH+WyVt7FRoZrPHs?=
 =?iso-8859-1?Q?dAFoIuC0lKQXsq5CDSJ3UBvJm7m3JLqyApca2fwAFELwokAST6GYFfKr/x?=
 =?iso-8859-1?Q?FDqHMKnAh6BpCfgMz+2HtMYfPd/sMZObPrY8LD0F0+q65nJORle+sXXQth?=
 =?iso-8859-1?Q?UFa8Wp4gRO/srnwV4EbeGGOypX+0MRiaq9H0gdoJeu22wu/59+1rc2EjaF?=
 =?iso-8859-1?Q?8HLhELvvP817T0yJXsEPDfoq8tS12TBfC2CkYBWH6BUNjsMFlXMTAdsctY?=
 =?iso-8859-1?Q?UZi8pYihKuvwcZtZmYsImoxUDPIKY1CNUaIML8xGSQEu6Qbh0ja1ZJvZhL?=
 =?iso-8859-1?Q?nP9Jn4SmmRiyQAMbBG98mc70qevefFVcP1ldpxx1uQPeH4x6dBy8WzEPA7?=
 =?iso-8859-1?Q?rDSNVLT7ap6dth7q29VMM40UUcVmcWQwaIKDAsgQIkb2Udv6u8O6gbdN+c?=
 =?iso-8859-1?Q?Kex1YhCIgTk+nhqKbJbjSvgOE4+ToigxGZv14SMh4WtCRhht0sWjp7JA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe69b4-7de0-4f05-1f24-08db9fe9c179
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:50:52.7075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1HswFkq3IYH4QZkmdxg4KW+5EFm0laa39cxhDLUP/9IkbH0S/YSNHNR0x6/H0z5s8yR1sQD5a5fg1pRMiPmeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 07:40:41AM +0200, Christian König wrote:
> Am 18.08.23 um 05:08 schrieb Matthew Brost:
> > On Thu, Aug 17, 2023 at 01:13:31PM +0200, Danilo Krummrich wrote:
> > > On 8/17/23 07:33, Christian König wrote:
> > > > Am 16.08.23 um 18:33 schrieb Danilo Krummrich:
> > > > > On 8/16/23 16:59, Christian König wrote:
> > > > > > Am 16.08.23 um 14:30 schrieb Danilo Krummrich:
> > > > > > > On 8/16/23 16:05, Christian König wrote:
> > > > > > > > Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
> > > > > > > > > Hi Matt,
> > > > > > > > > 
> > > > > > > > > On 8/11/23 04:31, Matthew Brost wrote:
> > > > > > > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > > > > > > mapping between a drm_gpu_scheduler and
> > > > > > > > > > drm_sched_entity. At first this
> > > > > > > > > > seems a bit odd but let us explain the reasoning below.
> > > > > > > > > > 
> > > > > > > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > > > > > > guaranteed to be the same completion even if
> > > > > > > > > > targeting the same hardware
> > > > > > > > > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > > > > > > > > which allowed to reorder, timeslice, and preempt
> > > > > > > > > > submissions. If a using
> > > > > > > > > > shared drm_gpu_scheduler across multiple
> > > > > > > > > > drm_sched_entity, the TDR falls
> > > > > > > > > > apart as the TDR expects submission order ==
> > > > > > > > > > completion order. Using a
> > > > > > > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> > > > > > > > > > 
> > > > > > > > > > 2. In XE submissions are done via programming a
> > > > > > > > > > ring buffer (circular
> > > > > > > > > > buffer), a drm_gpu_scheduler provides a limit on
> > > > > > > > > > number of jobs, if the
> > > > > > > > > > limit of number jobs is set to RING_SIZE /
> > > > > > > > > > MAX_SIZE_PER_JOB we get flow
> > > > > > > > > > control on the ring for free.
> > > > > > > > > In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
> > > > > > > > > 
> > > > > > > > > In Nouveau we currently do have such a limitation as
> > > > > > > > > well, but it is derived from the RING_SIZE, hence
> > > > > > > > > RING_SIZE / MAX_SIZE_PER_JOB would always be 1.
> > > > > > > > > However, I think most jobs won't actually utilize
> > > > > > > > > the whole ring.
> > > > > > > > Well that should probably rather be RING_SIZE /
> > > > > > > > MAX_SIZE_PER_JOB = hw_submission_limit (or even
> > > > > > > > hw_submission_limit - 1 when the hw can't distinct full
> > > > > > > > vs empty ring buffer).
> > > > > > > Not sure if I get you right, let me try to clarify what I
> > > > > > > was trying to say: I wanted to say that in Nouveau
> > > > > > > MAX_SIZE_PER_JOB isn't really limited by anything other than
> > > > > > > the RING_SIZE and hence we'd never allow more than 1 active
> > > > > > > job.
> > > > > > But that lets the hw run dry between submissions. That is
> > > > > > usually a pretty horrible idea for performance.
> > > > > Correct, that's the reason why I said it seems to be more efficient
> > > > > to base ring flow control on the actual size of each incoming job
> > > > > rather than the maximum size of a job.
> > > > > 
> > > > > > > However, it seems to be more efficient to base ring flow
> > > > > > > control on the actual size of each incoming job rather than
> > > > > > > the worst case, namely the maximum size of a job.
> > > > > > That doesn't sounds like a good idea to me. See we don't limit
> > > > > > the number of submitted jobs based on the ring size, but rather
> > > > > > we calculate the ring size based on the number of submitted
> > > > > > jobs.
> > > > > > 
> > > > > My point isn't really about whether we derive the ring size from the
> > > > > job limit or the other way around. It's more about the job size (or
> > > > > its maximum size) being arbitrary.
> > > > > 
> > > > > As mentioned in my reply to Matt:
> > > > > 
> > > > > "In Nouveau, userspace can submit an arbitrary amount of addresses
> > > > > of indirect bufferes containing the ring instructions. The ring on
> > > > > the kernel side takes the addresses of the indirect buffers rather
> > > > > than the instructions themself. Hence, technically there isn't
> > > > > really a limit on the amount of IBs submitted by a job except for
> > > > > the ring size."
> > > > > 
> > > > > So, my point is that I don't really want to limit the job size
> > > > > artificially just to be able to fit multiple jobs into the ring even
> > > > > if they're submitted at their "artificial" maximum size, but rather
> > > > > track how much of the ring the submitted job actually occupies.
> > > > > 
> > > > > > In other words the hw_submission_limit defines the ring size,
> > > > > > not the other way around. And you usually want the
> > > > > > hw_submission_limit as low as possible for good scheduler
> > > > > > granularity and to avoid extra overhead.
> > > > > I don't think you really mean "as low as possible", do you?
> > > > No, I do mean as low as possible or in other words as few as possible.
> > > > 
> > > > Ideally the scheduler would submit only the minimum amount of work to
> > > > the hardware to keep the hardware busy. >
> > > > The hardware seems to work mostly the same for all vendors, but you
> > > > somehow seem to think that filling the ring is somehow beneficial which
> > > > is really not the case as far as I can see.
> > > I think that's a misunderstanding. I'm not trying to say that it is *always*
> > > beneficial to fill up the ring as much as possible. But I think it is under
> > > certain circumstances, exactly those circumstances I described for Nouveau.
> > > 
> > > As mentioned, in Nouveau the size of a job is only really limited by the
> > > ring size, which means that one job can (but does not necessarily) fill up
> > > the whole ring. We both agree that this is inefficient, because it
> > > potentially results into the HW run dry due to hw_submission_limit == 1.
> > > 
> > > I recognize you said that one should define hw_submission_limit and adjust
> > > the other parts of the equation accordingly, the options I see are:
> > > 
> > > (1) Increase the ring size while keeping the maximum job size.
> > > (2) Decrease the maximum job size while keeping the ring size.
> > > (3) Let the scheduler track the actual job size rather than the maximum job
> > > size.
> > > 
> > > (1) results into potentially wasted ring memory, because we're not always
> > > reaching the maximum job size, but the scheduler assumes so.
> > > 
> > > (2) results into more IOCTLs from userspace for the same amount of IBs and
> > > more jobs result into more memory allocations and more work being submitted
> > > to the workqueue (with Matt's patches).
> > > 
> > > (3) doesn't seem to have any of those draw backs.
> > > 
> > > What would be your take on that?
> > > 
> > > Actually, if none of the other drivers is interested into a more precise way
> > > of keeping track of the ring utilization, I'd be totally fine to do it in a
> > > driver specific way. However, unfortunately I don't see how this would be
> > > possible.
> > > 
> > > My proposal would be to just keep the hw_submission_limit (maybe rename it
> > > to submission_unit_limit) and add a submission_units field to struct
> > > drm_sched_job. By default a jobs submission_units field would be 0 and the
> > > scheduler would behave the exact same way as it does now.
> > > 
> > > Accordingly, jobs with submission_units > 1 would contribute more than one
> > > unit to the submission_unit_limit.
> > > 
> > > What do you think about that?
> > > 
> > This seems reasonible to me and a very minimal change to the scheduler.
> 
> If you have a good use case for this then the approach sounds sane to me as
> well.
> 

Xe does not have a use case as the difference between the minimum size
of a job and the maximum is not all that large (maybe 100-192 bytes is
the range) so the accounting of a unit of 1 per job is just fine for now
even though it may waste space.

In Nouveau it seems like the min / max for size of job can vary wildly
so it needs finer grained units to mke effective use of the ring space.
Updating the scheduler to support this is rather trivial, hence no real
opposition from me. Also I do see this valid use case that other driver
or even perhaps Xe may use someday.

> My question is rather how exactly does Nouveau comes to have this use case?
> Allowing the full ring size in the UAPI sounds a bit questionable.
>

I agree allowing the user completely fill the ring is a bit
questionable, surely there has to be some upper limit. But lets say it
allows 1-64 IB, that still IMO could be used to justify finer grained
accouting in the DRM scheduler as stated above this make the difference
between the min / max job quite large.

Matt

> Christian.
> 
> > 
> > Matt
> > 
> > > Besides all that, you said that filling up the ring just enough to not let
> > > the HW run dry rather than filling it up entirely is desirable. Why do you
> > > think so? I tend to think that in most cases it shouldn't make difference.
> > > 
> > > - Danilo
> > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > Because one really is the minimum if you want to do work at all, but
> > > > > as you mentioned above a job limit of one can let the ring run dry.
> > > > > 
> > > > > In the end my proposal comes down to tracking the actual size of a
> > > > > job rather than just assuming a pre-defined maximum job size, and
> > > > > hence a dynamic job limit.
> > > > > 
> > > > > I don't think this would hurt the scheduler granularity. In fact, it
> > > > > should even contribute to the desire of not letting the ring run dry
> > > > > even better. Especially for sequences of small jobs, where the
> > > > > current implementation might wrongly assume the ring is already full
> > > > > although actually there would still be enough space left.
> > > > > 
> > > > > > Christian.
> > > > > > 
> > > > > > > > Otherwise your scheduler might just overwrite the ring
> > > > > > > > buffer by pushing things to fast.
> > > > > > > > 
> > > > > > > > Christian.
> > > > > > > > 
> > > > > > > > > Given that, it seems like it would be better to let
> > > > > > > > > the scheduler keep track of empty ring "slots"
> > > > > > > > > instead, such that the scheduler can deceide whether
> > > > > > > > > a subsequent job will still fit on the ring and if
> > > > > > > > > not re-evaluate once a previous job finished. Of
> > > > > > > > > course each submitted job would be required to carry
> > > > > > > > > the number of slots it requires on the ring.
> > > > > > > > > 
> > > > > > > > > What to you think of implementing this as
> > > > > > > > > alternative flow control mechanism? Implementation
> > > > > > > > > wise this could be a union with the existing
> > > > > > > > > hw_submission_limit.
> > > > > > > > > 
> > > > > > > > > - Danilo
> > > > > > > > > 
> > > > > > > > > > A problem with this design is currently a drm_gpu_scheduler uses a
> > > > > > > > > > kthread for submission / job cleanup. This doesn't scale if a large
> > > > > > > > > > number of drm_gpu_scheduler are used. To work
> > > > > > > > > > around the scaling issue,
> > > > > > > > > > use a worker rather than kthread for submission / job cleanup.
> > > > > > > > > > 
> > > > > > > > > > v2:
> > > > > > > > > >     - (Rob Clark) Fix msm build
> > > > > > > > > >     - Pass in run work queue
> > > > > > > > > > v3:
> > > > > > > > > >     - (Boris) don't have loop in worker
> > > > > > > > > > v4:
> > > > > > > > > >     - (Tvrtko) break out submit ready, stop,
> > > > > > > > > > start helpers into own patch
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
