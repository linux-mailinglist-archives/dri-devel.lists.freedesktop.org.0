Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F349666640
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670C210E2C3;
	Wed, 11 Jan 2023 22:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CED10E2C3;
 Wed, 11 Jan 2023 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673476331; x=1705012331;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3FePywTUFmw/TIkOtbBfB8aATt7Zv9BOeGSWA1SBVOU=;
 b=QwFlWdsGOqAdrLSq+HzNaGg0/nBkkdb/QLFpzqvmzLNIACXsUeM3obQZ
 BIp7pTdoNykIY2EGDgXD6d9q1vMpqzygTQ/18DD2YclOQzypbMhbGfTZo
 1dp+cSiuxjMTnGkyS9J3OHhdpIDO2+NaE3GpVx2GRtld4jst9AaEkSXbG
 E16F7RACRrTO2MUI59T3bMgfNUfxmgin+hlk0rXmY/diWhfqCnbygSfpO
 SW/uRbjOeb1jyA66aQ8UPpnjR3Pcaj3kS89L1rw8Lyw2mlqUD8xVz+p0Z
 MO9JTlAenXrWsAK/8jpAT4XDmHxvmqoUnHh0giFRW/0WNBvl8k3N96u/C Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323616005"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="323616005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 14:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="688107714"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="688107714"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 11 Jan 2023 14:32:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 14:32:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 14:32:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 14:32:05 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 14:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsqG2YwUdlRw8IiX0JuUpVKpXdUuPKtEElqqq1GSBayF0yULmkOANM/jsCHI2oJEt/jL76Z3nkC1Zj0djb5rO7kkQ/fTQ5MfE4sQTmQX+8n7cNuXXA4rmvr2GM6+v5p+BxwsLOjgS1zAJwPq1CPslVXXxMwuKUwx4WTaa3zo+MHMo4El5/DfakkBkFZ17N/I7RmqRNhoVRoj37eFqh1ntwQDOAi/xL/FwH5EsKpHzbcK+jL26ux1qlZk0LOtGdImXcofc26Qsz/m3W1BT8eSB/Puk1fakfqYs94YuZA3OKoxJ1NljCdVZkmtDOty94p0ZeMoJgVv9HopS+bKsWFaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjvIUz2CEtU2G3P6frFHBp4stAhkPeJjLrrvHgm4rPU=;
 b=MHwOl1wa82HYlapZbgfvDs4iNBJvvj9jQyig0WGMARGpuWim8RD7Oq57ns/iC4/9is/wFcOdOIGjDIuIZ1SnLxG5bF+5AsHVrWYAfuuKvg2Ey2IO5l9TZ9KfoJ8wVV9YnY6pPpZmzQGpoqRZoNUQk5dQ+h7A0Sb8MOcqVs6PXp4VQ/QSdkPwDIHZDKT1oTzrTy8emNygy2elNQSxenp6+9jkxsJLIq01LN8ogxn/rYOoIQRy8lDq4DPNe23PF3LQxJ+cBA/XrM5tpWlNiBd50i6UdRWYLFxamMhjsh0MoTwX+zcW+KMA7qwq4Nc67H+TZMLF3VSnH0Q8GpteKL9MWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 22:32:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 22:32:02 +0000
Date: Wed, 11 Jan 2023 22:31:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y7841j8PZ1T9MPEl@DUT025-TGLU.fm.intel.com>
References: <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <CAOFGe957uYdTFccQp36QRJRDkWQZDCB0ztMNDH0=SSf-RTgzLw@mail.gmail.com>
 <705a0b3c-2fe5-0393-0fda-511f288007c7@linux.intel.com>
 <CAOFGe96KQUmy20_h3OmmXGVmuGkEm8iDhnLzgBjM5dnPApqYvQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe96KQUmy20_h3OmmXGVmuGkEm8iDhnLzgBjM5dnPApqYvQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 59060636-8cce-4d30-1d37-08daf423a922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FAIKHbptOvZ64nii8NX2pc2uLuS1GrWTr6NDy+dEtPOWGFR8H8h07Ab0EkmJST0nVeAIBSxrhQSwLtl8qkoQyOQLZ2l3mVCUGrnNG0WgtHIDeifuu5ZUFGH2/FcqPxDIabGN7Gho+gUiqOhP/rPXWYQAvIPMG9SSeT/nePZhiG5peIwqwWMM2P9iz5wk1hKr/JWmblt+8pvUZHij/1tHDYec+EO2OqyL1tz4NT9eFqw9ETb1khwCaMwSvUdVbns+nivlsMK/nMiBl+nYUG9cCaRH5pDRzSpVfYE85hGJ33bk3DXJn3MG3HAmNZEphkH0TvuiFRIZeYiOZOLflyQpj3st8DhT1hbzKtXpPZUEGAXJknNfq0WTd1gt3lgqDPo6GCAXUQVI1ICEgAHd4Gtb/r8pCdJN491frfwmeue7VAdKNrJ9gTR6prG0W4/8JhOBYQYZuwVEFxAOYp5Ae+YZ+HXo1pa6pMBy6YAszYWmJR+IFTSWeBm8naffGgn7uFhlqSdyVIMWy9cVVUCM453fz0BpCYILNkDQO9EyaPeFKNI+53FsyHfsH7xzOiwZtMG9NhEnCyA+jXejAAMSRSO9YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(2906002)(82960400001)(30864003)(8936002)(5660300002)(44832011)(41300700001)(83380400001)(6666004)(66556008)(45080400002)(86362001)(66946007)(66899015)(38100700002)(966005)(6486002)(53546011)(6506007)(8676002)(186003)(478600001)(316002)(26005)(4326008)(6512007)(66476007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3pLU3BKcnN6N05CUDZVWjNQOGVJSDdzWG9iVDg4T09ucHM1Zm9tb0RiVEFi?=
 =?utf-8?B?S1kwdHE2SGhpWFFRRm1DRWZVSVRGQVNLUVA1YjdyaHdKTDBVUjdVZlBLaExz?=
 =?utf-8?B?ajB3YlFpdlpUZS93RndVNWdVVTNDUE8vQldCQjZHK0tjZXErYWlEdG14UjY1?=
 =?utf-8?B?Q1FzTjdRZ2g4TWNZTDVLdkhHaTNoZ1FwNU1RZ2NERlZwQVNJOXgwcTlQQUxE?=
 =?utf-8?B?SXUwQUM3VFhSR1QyQlZDaVE1U09xRnJ2VUdNOEhHc0hqMVdjeE4xWExkU09k?=
 =?utf-8?B?VXBYZVdHaVZOcGVsenBZc3NKbS9MLzJheVNmOXFUSE5iWk5PNnFYaWZuR0gw?=
 =?utf-8?B?Ym16VlJHSWQreXF5ZFdUNG1jdWxnWnBzYWdmYkJzMzRMTW9DK094REE5TDdZ?=
 =?utf-8?B?UXFWcTNSUitlbzRrNkdEeVNqYXZpREVXcUloa2xFYm5qNWdhNlJTV2xIYWlB?=
 =?utf-8?B?N3ZFWHk0VFRtRWhWazk0SVVCMm9KTDAvdWdWZFhNZHR4NVp4cVR3akdVL2Ew?=
 =?utf-8?B?cldreXA4WFE3Sjg2LzZUajVGME0yQWtZc3d0SkxRQlVSdUVaWXJWVENFTVFv?=
 =?utf-8?B?eEdxYXBLNHdrODNkTm9rRnFxZlhST3ZQTlNXK2hxL1JQdTM2K0N1eTcxWkY0?=
 =?utf-8?B?WE5kalZPazBYV0hJWEZoeWk2SWZYU1U1S2VpRHRFL2ZSVDFvc25YQUZkNEVm?=
 =?utf-8?B?cVhJaytTVzRLM0E2bjliWjRwN0ZtSUk2Vnk0aHJUdlFhanBseEZKM0FtRHJU?=
 =?utf-8?B?YTF2Y2g0QWNVQ0FZNFV3VU5RSGNUKzMwYll1UFU3bEFCS3V2RmJpQVM0aWJa?=
 =?utf-8?B?TXZvc1FubUNhNWpjYkw1MmJCOWxnVE9iU211azJCR1l4SWVJakQzUGJwODUy?=
 =?utf-8?B?NEp3NFdtUHV2QjM5RHROQ1oxSjhzYXdZQkFjNmVhejRid2lFaWx1aWdQWlJJ?=
 =?utf-8?B?SlJnR1V1SEkzNUU4LzFsTU1FUFMxZ2FMdW91N2NTNStxZjdseUc4N3d5QnMy?=
 =?utf-8?B?azdmZTVMZGpYKzNKZHNoUWlYek1ubWkvQmNJNTE5dVVPNU41cnhraFd1WFVZ?=
 =?utf-8?B?S2xNTzZuWlRHMjdzd3NnNVlnMzNkbU9kU01tMHlRVHVwMzROZXVlT3hCakFR?=
 =?utf-8?B?T0RkU1ZTSmFmT2FUZ1M5S0xFRTdsaWlkQ2JTTCtOSnJWa3c4ZDMvM1c0S202?=
 =?utf-8?B?cUl2WHFXWDlrRkl2bnNQTmlySVpUOFlFbkVJZnBYNHhFc1NUQ1l2b1VEVVNk?=
 =?utf-8?B?aVVZSE15VjRQY0xTMmI3QmlQSk5RdmUxSkhDdk9GaW1LTDE5YXBZcGgzNXc2?=
 =?utf-8?B?MW5Hamc1Zi9RUWlFTmFCQW0vaWFNUkU3bnhpQWVXMWtMMkIzMmN3VFNub2Vp?=
 =?utf-8?B?NWZ5ajZhY3BVUmExd1NQRGl4cjF5MVpMYmo4OXlpOVlYWi95T2lHeXZWT1Fa?=
 =?utf-8?B?MytDTEFaakV6WTlIMGhjTk55L0dLRWs3akF6blV1a0gxRGN2UU9Ea2lJVnlx?=
 =?utf-8?B?QlJRMkh1aVd0WWFhME5LcHEzZFpWY0l0RnI2TWZXSldoM3lXa3pJeFdXeXR1?=
 =?utf-8?B?dFlKNmw1bm1Wa2VQY1V6bFpGZDFnZUJtVDRHSXVVMmJtdnhUNGhBdSs4Ukl2?=
 =?utf-8?B?Q05ybHM3KzR4R1JnNHp1dVBSMDhZYjFBVFJFVk9JZ1hUbjk3Z25OdldkdlhU?=
 =?utf-8?B?MFZDM0szMmhzbjFNeFJ1TUw1REd0N1MvT0c2d0MrVUtwVFZjL3RJQU5xamgx?=
 =?utf-8?B?d1hqZUU5TjNzdnpvbU04NWd0cis0emZjRHVyT0RCdUNIVFIwalAwYmszdVBh?=
 =?utf-8?B?NG9NcFN4OUViME9JMWlpcDZUL0MyRmxwaW5NV3U4SHFvMUFuSHV2dHd6S1lt?=
 =?utf-8?B?dld2NEkwKzl4b1d5SHgvRkZSUnY3NWlvV1pHWnBRbHAzK04ycDNLY1hCSVpX?=
 =?utf-8?B?Nm5DUjBPNFFNbVAzdE5MKy9ySGM5RWJJY1hIeE1Rd2E1L2NVVXExcG1lejI0?=
 =?utf-8?B?cE9aVjMxSkhwbXhzay84S1dZcDVYQ2l5ZjVYdlc2UjNLOVZrK2J1OUlpM0lZ?=
 =?utf-8?B?NEhUNFZDQ1RZRTJ0bkgvRWMzbHNxaTZyRWxCUW00ckZWVWhaUnpYdlZnYml5?=
 =?utf-8?B?ZTdnUW9pbTB4K1pYZDZTaWkxUTN5VDc4cDdibjM4RExMbjhNMzNtenJHWGRt?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59060636-8cce-4d30-1d37-08daf423a922
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 22:32:02.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQmBSH/JXQqS2jaaK3HLvDfJmNfcyF0apEpN6fWcDZ5oAHgd/StjTbx8LRYUXedqVyBhKzu6uBI3lHBKgsiQFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 04:18:01PM -0600, Jason Ekstrand wrote:
> On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin <
> tvrtko.ursulin@linux.intel.com> wrote:
> 
> >
> > On 10/01/2023 14:08, Jason Ekstrand wrote:
> > > On Tue, Jan 10, 2023 at 5:28 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com <mailto:tvrtko.ursulin@linux.intel.com>>
> >
> > > wrote:
> > >
> > >
> > >
> > >     On 09/01/2023 17:27, Jason Ekstrand wrote:
> > >
> > >     [snip]
> > >
> > >      >      >>> AFAICT it proposes to have 1:1 between *userspace*
> > created
> > >      >     contexts (per
> > >      >      >>> context _and_ engine) and drm_sched. I am not sure
> > avoiding
> > >      >     invasive changes
> > >      >      >>> to the shared code is in the spirit of the overall idea
> > >     and instead
> > >      >      >>> opportunity should be used to look at way to
> > >     refactor/improve
> > >      >     drm_sched.
> > >      >
> > >      >
> > >      > Maybe?  I'm not convinced that what Xe is doing is an abuse at
> > >     all or
> > >      > really needs to drive a re-factor.  (More on that later.)
> > >     There's only
> > >      > one real issue which is that it fires off potentially a lot of
> > >     kthreads.
> > >      > Even that's not that bad given that kthreads are pretty light and
> > >     you're
> > >      > not likely to have more kthreads than userspace threads which are
> > >     much
> > >      > heavier.  Not ideal, but not the end of the world either.
> > >     Definitely
> > >      > something we can/should optimize but if we went through with Xe
> > >     without
> > >      > this patch, it would probably be mostly ok.
> > >      >
> > >      >      >> Yes, it is 1:1 *userspace* engines and drm_sched.
> > >      >      >>
> > >      >      >> I'm not really prepared to make large changes to DRM
> > >     scheduler
> > >      >     at the
> > >      >      >> moment for Xe as they are not really required nor does
> > Boris
> > >      >     seem they
> > >      >      >> will be required for his work either. I am interested to
> > see
> > >      >     what Boris
> > >      >      >> comes up with.
> > >      >      >>
> > >      >      >>> Even on the low level, the idea to replace drm_sched
> > threads
> > >      >     with workers
> > >      >      >>> has a few problems.
> > >      >      >>>
> > >      >      >>> To start with, the pattern of:
> > >      >      >>>
> > >      >      >>>    while (not_stopped) {
> > >      >      >>>     keep picking jobs
> > >      >      >>>    }
> > >      >      >>>
> > >      >      >>> Feels fundamentally in disagreement with workers (while
> > >      >     obviously fits
> > >      >      >>> perfectly with the current kthread design).
> > >      >      >>
> > >      >      >> The while loop breaks and worker exists if no jobs are
> > ready.
> > >      >
> > >      >
> > >      > I'm not very familiar with workqueues. What are you saying would
> > fit
> > >      > better? One scheduling job per work item rather than one big work
> > >     item
> > >      > which handles all available jobs?
> > >
> > >     Yes and no, it indeed IMO does not fit to have a work item which is
> > >     potentially unbound in runtime. But it is a bit moot conceptual
> > >     mismatch
> > >     because it is a worst case / theoretical, and I think due more
> > >     fundamental concerns.
> > >
> > >     If we have to go back to the low level side of things, I've picked
> > this
> > >     random spot to consolidate what I have already mentioned and perhaps
> > >     expand.
> > >
> > >     To start with, let me pull out some thoughts from workqueue.rst:
> > >
> > >     """
> > >     Generally, work items are not expected to hog a CPU and consume many
> > >     cycles. That means maintaining just enough concurrency to prevent
> > work
> > >     processing from stalling should be optimal.
> > >     """
> > >
> > >     For unbound queues:
> > >     """
> > >     The responsibility of regulating concurrency level is on the users.
> > >     """
> > >
> > >     Given the unbound queues will be spawned on demand to service all
> > >     queued
> > >     work items (more interesting when mixing up with the
> > >     system_unbound_wq),
> > >     in the proposed design the number of instantiated worker threads does
> > >     not correspond to the number of user threads (as you have elsewhere
> > >     stated), but pessimistically to the number of active user contexts.
> > >
> > >
> > > Those are pretty much the same in practice.  Rather, user threads is
> > > typically an upper bound on the number of contexts.  Yes, a single user
> > > thread could have a bunch of contexts but basically nothing does that
> > > except IGT.  In real-world usage, it's at most one context per user
> > thread.
> >
> > Typically is the key here. But I am not sure it is good enough. Consider
> > this example - Intel Flex 170:
> >
> >   * Delivers up to 36 streams 1080p60 transcode throughput per card.
> >   * When scaled to 10 cards in a 4U server configuration, it can support
> > up to 360 streams of HEVC/HEVC 1080p60 transcode throughput.
> >
> 
> I had a feeling it was going to be media.... 😅
> 

Yea wondering the media UMD can be rewritten to use less xe_engines, it
is massive rewrite for VM bind + no implicit dependencies so let's just
pile on some more work?

> 
> > One transcode stream from my experience typically is 3-4 GPU contexts
> > (buffer travels from vcs -> rcs -> vcs, maybe vecs) used from a single
> > CPU thread. 4 contexts * 36 streams = 144 active contexts. Multiply by
> > 60fps = 8640 jobs submitted and completed per second.
> >
> > 144 active contexts in the proposed scheme means possibly means 144
> > kernel worker threads spawned (driven by 36 transcode CPU threads). (I
> > don't think the pools would scale down given all are constantly pinged
> > at 60fps.)
> >
> > And then each of 144 threads goes to grab the single GuC CT mutex. First
> > threads are being made schedulable, then put to sleep as mutex
> > contention is hit, then woken again as mutexes are getting released,
> > rinse, repeat.
> >
> 
> Why is every submission grabbing the GuC CT mutex?  I've not read the GuC
> back-end yet but I was under the impression that most run_job() would be
> just shoving another packet into a ring buffer.  If we have to send the GuC
> a message on the control ring every single time we submit a job, that's
> pretty horrible.
>

Run job writes the ring buffer and moves the tail as the first step (no
lock required). Next it needs to tell the GuC the xe_engine LRC tail has
moved, this is done from a single Host to GuC channel which is circular
buffer, the writing of the channel protected by the mutex. There are
little more nuances too but in practice there is always space in the
channel so the time mutex needs to held is really, really small
(check cached credits, write 3 dwords in payload, write 1 dword to move
tail). I also believe mutexes in Linux are hybrid where they spin for a
little bit before sleeping and certainly if there is space in the
channel we shouldn't sleep mutex contention.

As far as this being horrible, well didn't design the GuC and this how
it is implemented for KMD based submission. We also have 256 doorbells
so we wouldn't need a lock but I think are other issues with that design
too which need to be worked out in the Xe2 / Xe3 timeframe.

Also if you see my follow up response Xe is ~33k execs per second with
the current implementation on a 8 core (or maybe 8 thread) TGL which
seems to fine to me.

Matt
 
> --Jason
> 
> 
> (And yes this backend contention is there regardless of 1:1:1, it would
> > require a different re-design to solve that. But it is just a question
> > whether there are 144 contending threads, or just 6 with the thread per
> > engine class scheme.)
> >
> > Then multiply all by 10 for a 4U server use case and you get 1440 worker
> > kthreads, yes 10 more CT locks, but contending on how many CPU cores?
> > Just so they can grab a timeslice and maybe content on a mutex as the
> > next step.
> >
> > This example is where it would hurt on large systems. Imagine only an
> > even wider media transcode card...
> >
> > Second example is only a single engine class used (3d desktop?) but with
> > a bunch of not-runnable jobs queued and waiting on a fence to signal.
> > Implicit or explicit dependencies doesn't matter. Then the fence signals
> > and call backs run. N work items get scheduled, but they all submit to
> > the same HW engine. So we end up with:
> >
> >          /-- wi1 --\
> >         / ..     .. \
> >   cb --+---  wi.. ---+-- rq1 -- .. -- rqN
> >         \ ..    ..  /
> >          \-- wiN --/
> >
> >
> > All that we have achieved is waking up N CPUs to contend on the same
> > lock and effectively insert the job into the same single HW queue. I
> > don't see any positives there.
> >
> > This example I think can particularly hurt small / low power devices
> > because of needless waking up of many cores for no benefit. Granted, I
> > don't have a good feel on how common this pattern is in practice.
> >
> > >
> > >     That
> > >     is the number which drives the maximum number of not-runnable jobs
> > that
> > >     can become runnable at once, and hence spawn that many work items,
> > and
> > >     in turn unbound worker threads.
> > >
> > >     Several problems there.
> > >
> > >     It is fundamentally pointless to have potentially that many more
> > >     threads
> > >     than the number of CPU cores - it simply creates a scheduling storm.
> > >
> > >     Unbound workers have no CPU / cache locality either and no connection
> > >     with the CPU scheduler to optimize scheduling patterns. This may
> > matter
> > >     either on large systems or on small ones. Whereas the current design
> > >     allows for scheduler to notice userspace CPU thread keeps waking up
> > the
> > >     same drm scheduler kernel thread, and so it can keep them on the same
> > >     CPU, the unbound workers lose that ability and so 2nd CPU might be
> > >     getting woken up from low sleep for every submission.
> > >
> > >     Hence, apart from being a bit of a impedance mismatch, the proposal
> > has
> > >     the potential to change performance and power patterns and both large
> > >     and small machines.
> > >
> > >
> > > Ok, thanks for explaining the issue you're seeing in more detail.  Yes,
> > > deferred kwork does appear to mismatch somewhat with what the scheduler
> > > needs or at least how it's worked in the past.  How much impact will
> > > that mismatch have?  Unclear.
> > >
> > >      >      >>> Secondly, it probably demands separate workers (not
> > >     optional),
> > >      >     otherwise
> > >      >      >>> behaviour of shared workqueues has either the potential
> > to
> > >      >     explode number
> > >      >      >>> kernel threads anyway, or add latency.
> > >      >      >>>
> > >      >      >>
> > >      >      >> Right now the system_unbound_wq is used which does have a
> > >     limit
> > >      >     on the
> > >      >      >> number of threads, right? I do have a FIXME to allow a
> > >     worker to be
> > >      >      >> passed in similar to TDR.
> > >      >      >>
> > >      >      >> WRT to latency, the 1:1 ratio could actually have lower
> > >     latency
> > >      >     as 2 GPU
> > >      >      >> schedulers can be pushing jobs into the backend /
> > cleaning up
> > >      >     jobs in
> > >      >      >> parallel.
> > >      >      >>
> > >      >      >
> > >      >      > Thought of one more point here where why in Xe we
> > >     absolutely want
> > >      >     a 1 to
> > >      >      > 1 ratio between entity and scheduler - the way we implement
> > >      >     timeslicing
> > >      >      > for preempt fences.
> > >      >      >
> > >      >      > Let me try to explain.
> > >      >      >
> > >      >      > Preempt fences are implemented via the generic messaging
> > >      >     interface [1]
> > >      >      > with suspend / resume messages. If a suspend messages is
> > >     received to
> > >      >      > soon after calling resume (this is per entity) we simply
> > >     sleep in the
> > >      >      > suspend call thus giving the entity a timeslice. This
> > >     completely
> > >      >     falls
> > >      >      > apart with a many to 1 relationship as now a entity
> > >     waiting for a
> > >      >      > timeslice blocks the other entities. Could we work aroudn
> > >     this,
> > >      >     sure but
> > >      >      > just another bunch of code we'd have to add in Xe. Being to
> > >      >     freely sleep
> > >      >      > in backend without affecting other entities is really,
> > really
> > >      >     nice IMO
> > >      >      > and I bet Xe isn't the only driver that is going to feel
> > >     this way.
> > >      >      >
> > >      >      > Last thing I'll say regardless of how anyone feels about
> > >     Xe using
> > >      >     a 1 to
> > >      >      > 1 relationship this patch IMO makes sense as I hope we can
> > all
> > >      >     agree a
> > >      >      > workqueue scales better than kthreads.
> > >      >
> > >      >     I don't know for sure what will scale better and for what use
> > >     case,
> > >      >     combination of CPU cores vs number of GPU engines to keep
> > >     busy vs other
> > >      >     system activity. But I wager someone is bound to ask for some
> > >      >     numbers to
> > >      >     make sure proposal is not negatively affecting any other
> > drivers.
> > >      >
> > >      >
> > >      > Then let them ask.  Waving your hands vaguely in the direction of
> > >     the
> > >      > rest of DRM and saying "Uh, someone (not me) might object" is
> > >     profoundly
> > >      > unhelpful.  Sure, someone might.  That's why it's on dri-devel.
> > >     If you
> > >      > think there's someone in particular who might have a useful
> > >     opinion on
> > >      > this, throw them in the CC so they don't miss the e-mail thread.
> > >      >
> > >      > Or are you asking for numbers?  If so, what numbers are you
> > >     asking for?
> > >
> > >     It was a heads up to the Xe team in case people weren't appreciating
> > >     how
> > >     the proposed change has the potential influence power and performance
> > >     across the board. And nothing in the follow up discussion made me
> > think
> > >     it was considered so I don't think it was redundant to raise it.
> > >
> > >     In my experience it is typical that such core changes come with some
> > >     numbers. Which is in case of drm scheduler is tricky and probably
> > >     requires explicitly asking everyone to test (rather than count on
> > >     "don't
> > >     miss the email thread"). Real products can fail to ship due ten mW
> > here
> > >     or there. Like suddenly an extra core prevented from getting into
> > deep
> > >     sleep.
> > >
> > >     If that was "profoundly unhelpful" so be it.
> > >
> > >
> > > With your above explanation, it makes more sense what you're asking.
> > > It's still not something Matt is likely to be able to provide on his
> > > own.  We need to tag some other folks and ask them to test it out.  We
> > > could play around a bit with it on Xe but it's not exactly production
> > > grade yet and is going to hit this differently from most.  Likely
> > > candidates are probably AMD and Freedreno.
> >
> > Whoever is setup to check out power and performance would be good to
> > give it a spin, yes.
> >
> > PS. I don't think I was asking Matt to test with other devices. To start
> > with I think Xe is a team effort. I was asking for more background on
> > the design decision since patch 4/20 does not say anything on that
> > angle, nor later in the thread it was IMO sufficiently addressed.
> >
> > >      > Also, If we're talking about a design that might paint us into an
> > >      > Intel-HW-specific hole, that would be one thing.  But we're not.
> > >     We're
> > >      > talking about switching which kernel threading/task mechanism to
> > >     use for
> > >      > what's really a very generic problem.  The core Xe design works
> > >     without
> > >      > this patch (just with more kthreads).  If we land this patch or
> > >      > something like it and get it wrong and it causes a performance
> > >     problem
> > >      > for someone down the line, we can revisit it.
> > >
> > >     For some definition of "it works" - I really wouldn't suggest
> > >     shipping a
> > >     kthread per user context at any point.
> > >
> > >
> > > You have yet to elaborate on why. What resources is it consuming that's
> > > going to be a problem? Are you anticipating CPU affinity problems? Or
> > > does it just seem wasteful?
> >
> > Well I don't know, commit message says the approach does not scale. :)
> >
> > > I think I largely agree that it's probably unnecessary/wasteful but
> > > reducing the number of kthreads seems like a tractable problem to solve
> > > regardless of where we put the gpu_scheduler object.  Is this the right
> > > solution?  Maybe not.  It was also proposed at one point that we could
> > > split the scheduler into two pieces: A scheduler which owns the kthread,
> > > and a back-end which targets some HW ring thing where you can have
> > > multiple back-ends per scheduler.  That's certainly more invasive from a
> > > DRM scheduler internal API PoV but would solve the kthread problem in a
> > > way that's more similar to what we have now.
> > >
> > >      >     In any case that's a low level question caused by the high
> > >     level design
> > >      >     decision. So I'd think first focus on the high level - which
> > >     is the 1:1
> > >      >     mapping of entity to scheduler instance proposal.
> > >      >
> > >      >     Fundamentally it will be up to the DRM maintainers and the
> > >     community to
> > >      >     bless your approach. And it is important to stress 1:1 is
> > about
> > >      >     userspace contexts, so I believe unlike any other current
> > >     scheduler
> > >      >     user. And also important to stress this effectively does not
> > >     make Xe
> > >      >     _really_ use the scheduler that much.
> > >      >
> > >      >
> > >      > I don't think this makes Xe nearly as much of a one-off as you
> > >     think it
> > >      > does.  I've already told the Asahi team working on Apple M1/2
> > >     hardware
> > >      > to do it this way and it seems to be a pretty good mapping for
> > >     them. I
> > >      > believe this is roughly the plan for nouveau as well.  It's not
> > >     the way
> > >      > it currently works for anyone because most other groups aren't
> > >     doing FW
> > >      > scheduling yet.  In the world of FW scheduling and hardware
> > >     designed to
> > >      > support userspace direct-to-FW submit, I think the design makes
> > >     perfect
> > >      > sense (see below) and I expect we'll see more drivers move in this
> > >      > direction as those drivers evolve.  (AMD is doing some customish
> > >     thing
> > >      > for how with gpu_scheduler on the front-end somehow. I've not dug
> > >     into
> > >      > those details.)
> > >      >
> > >      >     I can only offer my opinion, which is that the two options
> > >     mentioned in
> > >      >     this thread (either improve drm scheduler to cope with what is
> > >      >     required,
> > >      >     or split up the code so you can use just the parts of
> > >     drm_sched which
> > >      >     you want - which is frontend dependency tracking) shouldn't
> > be so
> > >      >     readily dismissed, given how I think the idea was for the new
> > >     driver to
> > >      >     work less in a silo and more in the community (not do kludges
> > to
> > >      >     workaround stuff because it is thought to be too hard to
> > >     improve common
> > >      >     code), but fundamentally, "goto previous paragraph" for what
> > I am
> > >      >     concerned.
> > >      >
> > >      >
> > >      > Meta comment:  It appears as if you're falling into the standard
> > >     i915
> > >      > team trap of having an internal discussion about what the
> > community
> > >      > discussion might look like instead of actually having the
> > community
> > >      > discussion.  If you are seriously concerned about interactions
> > with
> > >      > other drivers or whether or setting common direction, the right
> > >     way to
> > >      > do that is to break a patch or two out into a separate RFC series
> > >     and
> > >      > tag a handful of driver maintainers.  Trying to predict the
> > >     questions
> > >      > other people might ask is pointless. Cc them and asking for their
> > >     input
> > >      > instead.
> > >
> > >     I don't follow you here. It's not an internal discussion - I am
> > raising
> > >     my concerns on the design publicly. I am supposed to write a patch to
> > >     show something, but am allowed to comment on a RFC series?
> > >
> > >
> > > I may have misread your tone a bit.  It felt a bit like too many
> > > discussions I've had in the past where people are trying to predict what
> > > others will say instead of just asking them.  Reading it again, I was
> > > probably jumping to conclusions a bit.  Sorry about that.
> >
> > Okay no problem, thanks. In any case we don't have to keep discussing
> > it, since I wrote one or two emails ago it is fundamentally on the
> > maintainers and community to ack the approach. I only felt like RFC did
> > not explain the potential downsides sufficiently so I wanted to probe
> > that area a bit.
> >
> > >     It is "drm/sched: Convert drm scheduler to use a work queue rather
> > than
> > >     kthread" which should have Cc-ed _everyone_ who use drm scheduler.
> > >
> > >
> > > Yeah, it probably should have.  I think that's mostly what I've been
> > > trying to say.
> > >
> > >      >
> > >      >     Regards,
> > >      >
> > >      >     Tvrtko
> > >      >
> > >      >     P.S. And as a related side note, there are more areas where
> > >     drm_sched
> > >      >     could be improved, like for instance priority handling.
> > >      >     Take a look at msm_submitqueue_create /
> > >     msm_gpu_convert_priority /
> > >      >     get_sched_entity to see how msm works around the drm_sched
> > >     hardcoded
> > >      >     limit of available priority levels, in order to avoid having
> > >     to leave a
> > >      >     hw capability unused. I suspect msm would be happier if they
> > >     could have
> > >      >     all priority levels equal in terms of whether they apply only
> > >     at the
> > >      >     frontend level or completely throughout the pipeline.
> > >      >
> > >      >      > [1]
> > >      >
> > >     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> > >     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> > >
> > >      >
> > >       <
> > https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1 <
> > https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>>
> > >      >      >
> > >      >      >>> What would be interesting to learn is whether the option
> > of
> > >      >     refactoring
> > >      >      >>> drm_sched to deal with out of order completion was
> > >     considered
> > >      >     and what were
> > >      >      >>> the conclusions.
> > >      >      >>>
> > >      >      >>
> > >      >      >> I coded this up a while back when trying to convert the
> > >     i915 to
> > >      >     the DRM
> > >      >      >> scheduler it isn't all that hard either. The free flow
> > >     control
> > >      >     on the
> > >      >      >> ring (e.g. set job limit == SIZE OF RING / MAX JOB SIZE)
> > is
> > >      >     really what
> > >      >      >> sold me on the this design.
> > >      >
> > >      >
> > >      > You're not the only one to suggest supporting out-of-order
> > >     completion.
> > >      > However, it's tricky and breaks a lot of internal assumptions of
> > the
> > >      > scheduler. It also reduces functionality a bit because it can no
> > >     longer
> > >      > automatically rate-limit HW/FW queues which are often
> > >     fixed-size.  (Ok,
> > >      > yes, it probably could but it becomes a substantially harder
> > >     problem.)
> > >      >
> > >      > It also seems like a worse mapping to me.  The goal here is to
> > turn
> > >      > submissions on a userspace-facing engine/queue into submissions
> > >     to a FW
> > >      > queue submissions, sorting out any dma_fence dependencies.  Matt's
> > >      > description of saying this is a 1:1 mapping between sched/entity
> > >     doesn't
> > >      > tell the whole story. It's a 1:1:1 mapping between xe_engine,
> > >      > gpu_scheduler, and GuC FW engine.  Why make it a 1:something:1
> > >     mapping?
> > >      > Why is that better?
> > >
> > >     As I have stated before, what I think what would fit well for Xe is
> > one
> > >     drm_scheduler per engine class. In specific terms on our current
> > >     hardware, one drm scheduler instance for render, compute, blitter,
> > >     video
> > >     and video enhance. Userspace contexts remain scheduler entities.
> > >
> > >
> > > And this is where we fairly strongly disagree.  More in a bit.
> > >
> > >     That way you avoid the whole kthread/kworker story and you have it
> > >     actually use the entity picking code in the scheduler, which may be
> > >     useful when the backend is congested.
> > >
> > >
> > > What back-end congestion are you referring to here?  Running out of FW
> > > queue IDs?  Something else?
> >
> > CT channel, number of context ids.
> >
> > >
> > >     Yes you have to solve the out of order problem so in my mind that is
> > >     something to discuss. What the problem actually is (just TDR?), how
> > >     tricky and why etc.
> > >
> > >     And yes you lose the handy LRCA ring buffer size management so you'd
> > >     have to make those entities not runnable in some other way.
> > >
> > >     Regarding the argument you raise below - would any of that make the
> > >     frontend / backend separation worse and why? Do you think it is less
> > >     natural? If neither is true then all remains is that it appears extra
> > >     work to support out of order completion of entities has been
> > discounted
> > >     in favour of an easy but IMO inelegant option.
> > >
> > >
> > > Broadly speaking, the kernel needs to stop thinking about GPU scheduling
> > > in terms of scheduling jobs and start thinking in terms of scheduling
> > > contexts/engines.  There is still some need for scheduling individual
> > > jobs but that is only for the purpose of delaying them as needed to
> > > resolve dma_fence dependencies.  Once dependencies are resolved, they
> > > get shoved onto the context/engine queue and from there the kernel only
> > > really manages whole contexts/engines.  This is a major architectural
> > > shift, entirely different from the way i915 scheduling works.  It's also
> > > different from the historical usage of DRM scheduler which I think is
> > > why this all looks a bit funny.
> > >
> > > To justify this architectural shift, let's look at where we're headed.
> > > In the glorious future...
> > >
> > >   1. Userspace submits directly to firmware queues.  The kernel has no
> > > visibility whatsoever into individual jobs.  At most it can pause/resume
> > > FW contexts as needed to handle eviction and memory management.
> > >
> > >   2. Because of 1, apart from handing out the FW queue IDs at the
> > > beginning, the kernel can't really juggle them that much.  Depending on
> > > FW design, it may be able to pause a client, give its IDs to another,
> > > and then resume it later when IDs free up.  What it's not doing is
> > > juggling IDs on a job-by-job basis like i915 currently is.
> > >
> > >   3. Long-running compute jobs may not complete for days.  This means
> > > that memory management needs to happen in terms of pause/resume of
> > > entire contexts/engines using the memory rather than based on waiting
> > > for individual jobs to complete or pausing individual jobs until the
> > > memory is available.
> > >
> > >   4. Synchronization happens via userspace memory fences (UMF) and the
> > > kernel is mostly unaware of most dependencies and when a context/engine
> > > is or is not runnable.  Instead, it keeps as many of them minimally
> > > active (memory is available, even if it's in system RAM) as possible and
> > > lets the FW sort out dependencies.  (There may need to be some facility
> > > for sleeping a context until a memory change similar to futex() or
> > > poll() for userspace threads.  There are some details TBD.)
> > >
> > > Are there potential problems that will need to be solved here?  Yes.  Is
> > > it a good design?  Well, Microsoft has been living in this future for
> > > half a decade or better and it's working quite well for them.  It's also
> > > the way all modern game consoles work.  It really is just Linux that's
> > > stuck with the same old job model we've had since the monumental shift
> > > to DRI2.
> > >
> > > To that end, one of the core goals of the Xe project was to make the
> > > driver internally behave as close to the above model as possible while
> > > keeping the old-school job model as a very thin layer on top.  As the
> > > broader ecosystem problems (window-system support for UMF, for instance)
> > > are solved, that layer can be peeled back.  The core driver will already
> > > be ready for it.
> > >
> > > To that end, the point of the DRM scheduler in Xe isn't to schedule
> > > jobs.  It's to resolve syncobj and dma-buf implicit sync dependencies
> > > and stuff jobs into their respective context/engine queue once they're
> > > ready.  All the actual scheduling happens in firmware and any scheduling
> > > the kernel does to deal with contention, oversubscriptions, too many
> > > contexts, etc. is between contexts/engines, not individual jobs.  Sure,
> > > the individual job visibility is nice, but if we design around it, we'll
> > > never get to the glorious future.
> > >
> > > I really need to turn the above (with a bit more detail) into a blog
> > > post.... Maybe I'll do that this week.
> > >
> > > In any case, I hope that provides more insight into why Xe is designed
> > > the way it is and why I'm pushing back so hard on trying to make it more
> > > of a "classic" driver as far as scheduling is concerned.  Are there
> > > potential problems here?  Yes, that's why Xe has been labeled a
> > > prototype.  Are such radical changes necessary to get to said glorious
> > > future?  Yes, I think they are.  Will it be worth it?  I believe so.
> >
> > Right, that's all solid I think. My takeaway is that frontend priority
> > sorting and that stuff isn't needed and that is okay. And that there are
> > multiple options to maybe improve drm scheduler, like the fore mentioned
> > making it deal with out of order, or split into functional components,
> > or split frontend/backend what you suggested. For most of them cost vs
> > benefit is more or less not completely clear, neither how much effort
> > was invested to look into them.
> >
> > One thing I missed from this explanation is how drm_scheduler per engine
> > class interferes with the high level concepts. And I did not manage to
> > pick up on what exactly is the TDR problem in that case. Maybe the two
> > are one and the same.
> >
> > Bottom line is I still have the concern that conversion to kworkers has
> > an opportunity to regress. Possibly more opportunity for some Xe use
> > cases than to affect other vendors, since they would still be using per
> > physical engine / queue scheduler instances.
> >
> > And to put my money where my mouth is I will try to put testing Xe
> > inside the full blown ChromeOS environment in my team plans. It would
> > probably also be beneficial if Xe team could take a look at real world
> > behaviour of the extreme transcode use cases too. If the stack is ready
> > for that and all. It would be better to know earlier rather than later
> > if there is a fundamental issue.
> >
> > For the patch at hand, and the cover letter, it certainly feels it would
> > benefit to record the past design discussion had with AMD folks, to
> > explicitly copy other drivers, and to record the theoretical pros and
> > cons of threads vs unbound workers as I have tried to highlight them.
> >
> > Regards,
> >
> > Tvrtko
> >
