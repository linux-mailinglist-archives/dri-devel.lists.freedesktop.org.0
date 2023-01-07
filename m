Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0AB660AC6
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 01:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E76010E2D7;
	Sat,  7 Jan 2023 00:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A3A10E17B;
 Sat,  7 Jan 2023 00:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673051401; x=1704587401;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y/uJaYUick1i5C6LsplHwOwaMHfPz6hlEdzy8/8M0tM=;
 b=jjbIsRLFazpMuje949+DIKhukPvovWoK6zAKOt4ks9QtfbX8meqdWP1j
 hxYyxieyroPV6Jbg8lPUn4aM4oVsCKLD2Hypp/r1U6eafwOKpZ+v7VEMB
 0Bv0Gkwb1O9ZkWna1BhrqBcYuy7Rq+GhO8LkKvHxcQkIPk53ykuUKSnU2
 1XwG/wwI76tTiMhr1dtwKrB26US0sJiPFHCcbMeaZw9zPP3xaD5yq1S+B
 Qs1K10Oz15P2xpEli0zkXTy0kEKluzOWeP9qB9BVE7Pd+dTBBjBbe4l2L
 YJhRMvoz9Ghula9/Wimpnc6MuwlL91EcFtqhqxL8RLNNUKe69yErxC7j6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="302291140"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="302291140"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 16:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="780136462"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="780136462"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 06 Jan 2023 16:30:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 16:30:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 16:29:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 16:29:59 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 6 Jan 2023 16:29:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvU/zQzmzdoAp5pVmIficgTn/8oUVUq9AbtqhYUxrdlL+CvERwzADW2a6TmcOWlKTPYb6p8xSqXyVNqcqSfZkk7w4N3hj5xDH9GDuj6qUCT8AISUj45qLy6IysIdkJEz2yyJAJkQQ+mZem2IBG0N8/i+A5SsD2llgsLnYp438V4GwRGXThpGVylbJKDMIweuSJukKFFca1ffRt+5wuser/wLV6RUwQ5akWPYGcDU4fPT8sDKC40hkKSbYm/AnvvVJGfa6Rzi1Tz/7xbKUCff9Tr8qHYb3i2Q2W/9ZAxCe6lqmEGr2T+xBhij1pRyNsYnk+ySmYZiavmqTLKgSRp4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9bXTip3gvQNwHqdCiuAb9baqnMzrauYMXBQpGPsVk0=;
 b=QGNF//+wf6v2fecQOzpSojsqh/BkesYIMCCfErUI/LyriD5Nf/CK5euq+L1O7F5+zm9KTcL5gvf0UFwQ/TDi9Yj6qBckauUsfd17zfZHHbFLP8Q8lJgxG04LdxkIQLTF3ROtZya2oY2QqZ4UeKsz9RikhrCqFVbn/OxFU+NbvRMXcoyJv4GdgoFQMDSPkwCusa+YRiureJWBlcVy+11n8f0ztX0YELGHmomxJibx0EuA2Y7q+54AQBoWcUeB2+Y3ZyUG8gzKDkSH1ONzH7AchL8CwHS6LXkx5FiZLtJ/or6SccnJHWdklsrpLSkx4ta54lAvBFp2xk5i54kd4YAsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Sat, 7 Jan 2023 00:29:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%8]) with mapi id 15.20.5944.019; Sat, 7 Jan 2023
 00:29:52 +0000
Date: Fri, 6 Jan 2023 16:29:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gt: Remove platform comments from workarounds
Message-ID: <Y7i8/VH4d2Risa6G@mdroper-desk1.amr.corp.intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
 <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
 <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
 <2641f51d-8b79-0d47-90f5-b60e9f6edf33@linux.intel.com>
 <Y7XUvMUDYEHwX17+@mdroper-desk1.amr.corp.intel.com>
 <3a5eefc2-aad7-f22e-e54e-6f9af00edb48@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a5eefc2-aad7-f22e-e54e-6f9af00edb48@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cbb425-fe46-4262-6258-08daf0464b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPVZlmw8M6CVmmpyiblkbVc1C4LB0/RpXjosu+Npf5HTcNA7htyzZZPCbnb6ybcFrU7Hug7ntcjDT1YW+rRiz7GGaK8saDmAVZe1H/xeea4CPUfbQDOcuOBEeCDnHeE3U+M5JVVQo6aMFIRMLiDin7uXjsnGtjilPdyNy16SJw42AmT18qfOB+CKwgXLaymy/vZiYrv+qpKEIPdYbVCCUH/TzYGu6iWKwlk7xDAT6OtbTepRMq7Z4WI+C5pEvAfFYmBBkhHxTqkQ/+l1/NaUljagIDskXFMIskMQ3LIanpeSMQ3Gx+7PEeztwlZaQqE0P1gn9MEXiKLOFqrzMEt9SX+tLgR6NkHYxElltcCvMia4JcPxThjPhAtR2jqcWGFtfAg9sxBmVOWvxj6VOptzmUo0ecRu4faa3NSPOq1V+gWEWD5WWYOoWVI4WwUOfEDsu8M4mCl5iW/3ZZkI3HOHmQZRGuenu6kYb1AN0MLR2KEFtBAiFu1NOjUrPQRk1Yl4mW3gbod1iaCGoPqUyNsZjn7UUhci34WsEG4swZRfbPoIWHq6wuIv3SQT2tLvuxcSR62qc/+4TPBdtLGLOxzWLY3pHqfSWQeU6nvhRG/1DR4OMomr4qYjIEB3Wzpxqo8I4iHzV5SGKlC6m6N2uoNS6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(82960400001)(38100700002)(53546011)(41300700001)(8676002)(66946007)(86362001)(4326008)(66556008)(6916009)(54906003)(66476007)(316002)(5660300002)(2906002)(66574015)(30864003)(8936002)(83380400001)(478600001)(966005)(6512007)(6506007)(26005)(6486002)(6666004)(186003)(66899015)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mYh2L0glA1SWmFC+4fHAwP35vOzbL73Ovfx14BC0bWiGHLQlYTghnFPNNq?=
 =?iso-8859-1?Q?1H50rUlQsEs+CYryQBKTKdOkfk0KwKMcDO4eGhf27LGbVWcpiuixnS/75c?=
 =?iso-8859-1?Q?ruWfQ0MEcbMzfZSin9b1Pk8TUad1CDclWNZW2Fa+KPeEMb27XMIBpwo1RL?=
 =?iso-8859-1?Q?R1wAxlJk8pZbWKkZR76AxJtu/3EzPS8b9KSPf3VPWB9Nh4W9IPpTNWIY0k?=
 =?iso-8859-1?Q?AZjjXFCQGzhTRuhcSCVMUSSr2jrgNz/ooW7c2KC4zAQJSR02oy3KiouZ/g?=
 =?iso-8859-1?Q?aN3W7WaVpjiSqzpHTlDLtNo/PC+1Qknh56K8ihGpEQUw7wm9/YQYDKeflW?=
 =?iso-8859-1?Q?2hTBKRVm/Lj9ZRjs5AO3fFszItd5jxLnGB5jGd0dRE/MXyzJgFedk5JLEw?=
 =?iso-8859-1?Q?PvZ3p8GnuFzcCvtGzz6wCY6vosRkml2V+NLRLMmGJLis/vjE9iqYughtUw?=
 =?iso-8859-1?Q?bC5oN/aUk3iCzpdTTrTaneViISGycaqqqzWQ2aQD45MbBHYSUWwfOV6kA6?=
 =?iso-8859-1?Q?YpAF4owooOLlZrXIBV9f8a2g0nI1r1p9mYuy4OZzX1y8HX6IPr6U8xrdyy?=
 =?iso-8859-1?Q?+9srJ5IfomUuMmqb/eJz11DbunYozQVVeoDQSsjcR+zEXvWgUJrkm2iLe5?=
 =?iso-8859-1?Q?lyyucern63PVTLeNAsa9z6+rTGFu/+3KWoh6UCtpAD8dWo+pVyawhL6Ipo?=
 =?iso-8859-1?Q?YNeahNO0vuyWYA7gtjQ7RM1elpHpfEwhRQwsqUjpfo9oluB6tCqYVb2x74?=
 =?iso-8859-1?Q?wYr52f3ol3t5VODmqIyDJQRDDvkZCXqTA39t7Ua1/1pSZg1Vv6xEdsy/FT?=
 =?iso-8859-1?Q?hhQTYYiNniNAS7q1MUoj7aRVUt/7hrhpnA2WNFnFGWy+n14bQ3KGHEhdO9?=
 =?iso-8859-1?Q?vV7cSXJtzG6vxQ3Hp7jXOXh26y4fock0YVtNNHyUt3O3JhpQ825RrzCPx8?=
 =?iso-8859-1?Q?Xp5jRO4xaKZfIXEzBjRG415wRJrWlQIjV77Xq+x85o88o9NrRTdS6jVMpb?=
 =?iso-8859-1?Q?WrnOBsW0YdjfrmzIc2aw1G+qK1b0nSg/cxVWf0pNhRAqKEMMGThynAZEEU?=
 =?iso-8859-1?Q?F4SSU/1LphbQyH0ULQ1Jauqqu//T3a+dpkdf+NhKPSZYHlrmaQ+1zz9qv5?=
 =?iso-8859-1?Q?/7pBWH99cPc0tfm63WSuurY0IwC0VBlEOOR/ZVYq8wWYqnEcPDCxnIOerY?=
 =?iso-8859-1?Q?cPrhhUMAFebboB+nafhSiZ5kNVWVogohRNA3EwzmZEMNAJTmH4vdPiB7e+?=
 =?iso-8859-1?Q?XUOlzpB5d1Z1eawPDLSCNSxNXS6QfPo6fcubSiN+PZZDZ0F/BdpRSngCgm?=
 =?iso-8859-1?Q?yxWvALE5bjWAFJ19WqkVZ21gApoY70KLOXxuQcYkjyLklcshl8WWDBU2L7?=
 =?iso-8859-1?Q?v3tvzDOEGS/DAW3JGBv5ubBU6o3Yg/yjt2QNKdUERgPCAfYRip0aaB5WW7?=
 =?iso-8859-1?Q?ZPDe7+xvD16LWdPmY4I7QAKaVLbu7PI4gr8DLwiGBPmBjqVWy/OTgRLx4n?=
 =?iso-8859-1?Q?3RZBsBQygl3j7SLarxFWI2vyMYXhcrQ+7ysIGv15wsR17joA4oOtx5pg3Y?=
 =?iso-8859-1?Q?aDzpJ8mbDRDC6lQXG/BLXoqBrD5M231ftMfPSCWKyJc9k0pQGIDUwbzvvh?=
 =?iso-8859-1?Q?Y4wwcYPDMJl6pla/nLitgF9qBDQyuCXILMQqKFA+8HPRHWe0kwCKLYJw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cbb425-fe46-4262-6258-08daf0464b29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2023 00:29:52.7602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAEyJuAgKGKxVpnG5UHwqwyT48OQ8BEX0etR0juPjNj46vYJzt3AwFuX8abLzlVl4aC9SYfPnpuRnZb0mdk2V4Lb0fTCPu55pDn/xtTl1yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 01:35:52PM +0000, Tvrtko Ursulin wrote:
> 
> Okay to sum it up below with some final notes..
> 
> On 04/01/2023 19:34, Matt Roper wrote:
> > On Wed, Jan 04, 2023 at 09:58:13AM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 23/12/2022 18:28, Lucas De Marchi wrote:
> > > > On Fri, Dec 23, 2022 at 09:02:35AM +0000, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 22/12/2022 15:55, Lucas De Marchi wrote:
> > > > > > On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
> > > > > > > 
> > > > > > > On 22/12/2022 08:25, Lucas De Marchi wrote:
> > > > > > > > The comments are redundant to the checks being done to apply the
> > > > > > > > workarounds and very often get outdated as workarounds need to be
> > > > > > > > extended to new platforms or steppings.  Remove them altogether with
> > > > > > > > the following matches (platforms extracted from intel_workarounds.c):
> > > > > > > > 
> > > > > > > >      find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> > > > > > > > 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
> > > > > > > >      find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> > > > > > > > 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
> > > > > > > > 
> > > > > > > > Same things was executed in the gem directory, omitted
> > > > > > > > here for brevity.
> > > > > > > 
> > > > > > > > There were a few false positives that included the workaround
> > > > > > > > description. Those were manually patched.
> > > > > > > 
> > > > > > > sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
> > > > > > 
> > > > > > then there are false negatives. We have Was in the form
> > > > > > "Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
> > > > > > we simply don't see. After running that in gt/:
> > > > > > 
> > > > > > $ git grep ": mtl" -- drivers/gpu/drm/i915/
> > > > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > > > drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * Wa_14017073508: mtl
> > > > > > drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
> > > > > > 
> > > > > > I was going with the platform names to avoid the false
> > > > > > negatives and because I was entertaining the idea of only doing this for
> > > > > > latest platforms where we do have the "Wa_[[:number:]]" form
> > > > > > 
> > > > > > > 
> > > > > > > Maybe..
> > > > > > > 
> > > > > > > Matt recently said he has this worked planned, but more
> > > > > > > importantly - I gather then that the WA lookup tool
> > > > > > > definitely does not output these strings?
> > > > > > 
> > > > > > Whatever it does it's true only at the time it's called. It
> > > > > > simply tells what
> > > > > > are the platforms and steppings the Wa applies to. We can change the
> > > > > > output to whatever we want, but that is not the point.
> > > > > > Those comments get stale and bring no real value as they match 1:1
> > > > > > what the code is supposed to be doing. Several times a patch has to
> > > > > > update just that comment to "extend a workaround" to a next platform.
> > > > > > This is not always done, so we get a comment that doesn't match what is
> > > > > > supposed to be there.
> > > > > 
> > > > > Tl;dr; version - lets park this until January and discuss once
> > > > > everyone is back.
> > > > 
> > > > I'll leave my comment here since I will be out until mid January.
> > > > 
> > > > > 
> > > > > Longer version. I've been trying to get us talking about this a
> > > > > couple times before and I'd really like to close with an explicit
> > > > > consensus, discussion points addressed instead of skipped and just
> > > > > moving ahead with patches.
> > > > > 
> > > > > References:
> > > > >   3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
> > > > >   Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com
> > > > > 
> > > > > So point I wanted to discuss is whether these comments are truly
> > > > > useless or maybe they can help during review. If the tool can
> > > > > actually output them then I am leaning towards that they can be.
> > > > 
> > > > I consider "can the tool output xyz?" asking the wrong question.
> > > > "The tool", which is our own small python script querying a database can
> > > > output anything like that if we want to. The database has information of
> > > > what are the platforms/steppings for each the WA is known to be applied
> > > > *today*. And that can change and do change often, particularly for early
> > > > steppings and recent platforms.
> > > > 
> > > > > Thought is, when a patch comes for review adding a new platform,
> > > > > stepping, whatever, to an existing if condition, if it contains the
> > > > > comments reviewer can more easily spot a hyphotetical logic
> > > > > inversion error or similar. It is also trivial to check that both
> > > > > condition and comment have been updated. (So lets not be rash and
> > > > > remove something maybe useful just because it can go stale *only if*
> > > > > reviewers are not giving sufficient attention that changes are made
> > > > > in tandem.)
> > > > 
> > > > I can argue to the other side too. We don't have comments in the kernel
> > > > like
> > > > 
> > > >       /* Add 1 to i */
> > > >       i += 1;
> > > > 
> > > > This is exactly what these comments are doing. And they are misleading
> > > 
> > > I'll file this under "Reductio ad absurdum", kind of. :)
> > > 
> > > > and may introduce bugs rather than helping reviewing:
> > > > 
> > > >       Wa_12345:tgl[a0,c0)
> > > >       if (IS_TGL_GRAPHICS_STEP(STEP_A0, STEP_B0)
> > > > 
> > > > One might read the comment, skipping over the condition and thinking
> > > > "ok, we already extended this WA to B* steppings, which doesn't match
> > > > the code.
> > > 
> > > That would be reviewer error to assume B0 is the last B stepping, without
> > > actually checking. Equally as reviewer error would be to assume any WA
> > > adding patch is adding the correct conditions, again, without actually
> > > checking. Which leads me to ...
> > > 
> > > > >  From a slightly different angle - do we expect anyone reviewing
> > > > > workaround patches will cross-check against the tool? Would it be
> > > > > simpler and more efficient that they could just cross-check against
> > > > > the comment output from the tool and put into the patch by the
> > > > > author?
> > 
> > I think this is the source of the confusion; the comment lines in i915
> > are not something the 'wa' tool outputs directly; the comments are
> > written manually by the developer at the same time the code is written;
> > the wa tool is just a quick python script I wrote one day to dump
> > database information from the command line and avoid needing to fire up
> > a web browser and click through a series of slow website links.  Also,
> > since the wa tool queries internal databases, it spits out a bunch of
> > Intel-internal terminology that doesn't match the terminology used in
> > i915 code, and it also includes a bunch of garbage data that needs to be
> > filtered out (duplicated records, mangled/incomplete records, etc.).
> > Exactly how things are expressed (platform name like "DG2" or IP name
> > like "Xe_HPG" also varies from platform to platform according to how the
> > hardware guys decided to categorize things).
> 
> Right, I was going with what AFAIR Lucas wrote earlier in the thread, to
> paraprhase "tool can be made to output anything we want". Maybe wasn't
> confusion but misleading would be more obvious. :)
> 
> > Since the code and the comments are both something written by hand by
> > the developer, there's no reason to believe the comments will be more
> > accurate than the code.  They'll likely be far less accurate since they
> > can't be tested like the code is, and because the existing codebase is
> > wildly inconsistent with how we even format/represent them.
> > 
> > > > 
> > > > see above. Someone cross-checking the comment is cross-checking the
> > > > wrong thing. As I said, it happens more on early enabling of a platform.
> > > 
> > > ... my point which seems to have been missed by both, well question really,
> > > do you expect every reviewer to cross-check against the WA database when
> > > reviewing WA changes? I don't see that was answered.
> > > 
> > > I guarantee that it won't happen and people will rubber stamp. So my
> > > argument was that we could make it both easier for reviewers *and* decrease
> > > the likelyhood of misses, if we kept platforms designators in comments.
> > 
> > Yes, reviewers are absolutely supposed to be checking the stepping
> > bounds of every workarounds change they review.  That's one of the most
> > important parts of reviewing a workaround and it should be very quick
> > and easy to do.  If people are giving rubber stamps without doing that,
> > then they're not really doing a full review.  But I'm also not aware of
> > any cases where we're getting rubber stamps; most of the non-comment
> > review misses we have seem to either come from misunderstanding the
> > semantics of platforms (especially cases like DG2 where different
> > G10/G11/G12 variants have different stepping schemes) or technical
> > misunderstanding of the implementation details (register reset
> > characteristics, masked vs non-masked registers, context membership,
> > etc.).
> > 
> > > 
> > > Yeah it is much easier to rip them out that to find and fix the ones which
> > > went out of sync but that shouldn't be high on the list of criteria.
> > > 
> > > Argument that it is easy to overlook during review that comments and code do
> > > not match I don't think holds. That describes a very sloppy review. And if
> > > review is assumed to be that sloppy, do you really trust review to check
> > > against the WA database?
> > 
> > It's the same reason people who write prose can't find their own
> > spelling/grammer mistakes.  The mistakes are "obvious," but since their
> > brain already knows what it's "supposed" to say, they just can't see the
> > error themselves.  Once you've reviewed the code, it just gets really
> > hard to see where the comment doesn't align, especially for the
> > workarounds that apply to a bunch of platforms.
> 
> To be pedantic here - that's a writer's handicap - shouldn't be reviewers.
> But anyway, carrying on.
> 
> > For example, if I'm reviewing a patch that adds:
> > 
> >      /* Wa_12345:tgl,dg1[a0],rkl,adls,dg2_g10,dg2_g12[a0..c0) */
> >      if (IS_TIGERLAKE(i915) || IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
> >          IS_ALDERLAKE_P(i915) || IS_DG2_G10(i915) ||
> >          IS_DG2_GRAPHICS_STEP(i915, G12, STEP_A0, STEP_C0))
> > 
> > I'm always looking at the code first and comparing that to the
> > workaround database.  If I then review the comment second, I'm much less
> > likely to catch the subtle errors (there are two of them in this example
> > where the code and comment don't match!) because I mentally already know
> > what the bounds are "supposed" to be and the comment all just kind of
> > blends together.
> > 
> > > 
> > > So my argument is that it is trivial for reviewers to spot comments and code
> > > do not match. Trivial and fast. And it's trivial (I hope) for the WA tool to
> > > output the right format for pasting in comments.
> > 
> > Given how much terminology mismatch there is between the internal
> > database and how we refer to things in i915 code, it's not trivial.
> > It's also not super easy to even figure out which platforms to include
> > in the list.  The workaround database is going to include platforms for
> > which there is no i915 support (e.g., LKF) stuff like CNL (support
> > already removed from i915), and future/potential platforms we can't talk
> > about yet, etc.  Finally, when there are duplicated/conflicting records
> > (because the people inputting the information are just human too), it
> > takes a bit of human intelligence to read between the lines and figure
> > out what the reality is supposed to be.
> > 
> > Sure, these problems could probably all be solved with enough effort,
> > but given how often the internal formatting and behavior of the database
> > itself changes, it would be painful to keep it always working properly.
> > 
> > > 
> > > Those are the points I would like to have explicitly discounted before
> > > proceeding. Maybe to be even clearer the workflow would be like this:
> > > 
> > > Patch author:
> > > 
> > > 1. Runs the WA tool for a WA number. Tool outputs text.
> > > 2. Pastes text verbatim in the comment.
> > 
> > This one isn't correct today (and as noted above, not terribly easy to
> > accomplish).  It's
> > 
> >     2.  Developer manually writes code comment based on interpreting wa's
> >         output.
> 
> Given everything above lets say we concluded it is too costly to make the
> tool output the exact format wanted by i915 and we decide to proceed
> removing the platform designations. Two final questions.
> 
> Question 1)
> 
> Is everyone okay to remove from _all_, including old legacy platforms? ROI
> vs churn considerations? And yes it wouldn't be ideal either to have
> separate rules with some cutover point like Gen8 maybe.

I think we should definitely remove them from anything that has a
workaround number.  For the really old, pre-number workarounds
("Wa_SomeCamelCaseName") I don't have a strong feeling either way.
Since those aren't part of the modern workaround database, they're also
never going to be updated to add new platforms so if people want to just
leave them be that's fine with me.  We can see which way Lucas is
leaning when he gets back.

> 
> Question 2)
> 
> For Xe you still intend to have it a manual process and not have the tool
> output the macro section which could be directly pasted in the code? Would
> ROI of extending the tool be any better with the data-driven design like
> there?

The full workaround implementation (register offset, register bits,
etc.) definitely can't be auto-generated by a tool since the workaround
database itself is just free-form text written by some hardware
engineer.  There's no standard format they write those in; sometimes
they give an offset/bit number, sometimes they give a register name and
we have to look up the offset ourselves, sometimes they just give a
hyperlink to the bspec page.

Generating the platforms/steppings part of a workaround definition is
theoretically possible in the same way it would be theoretically
possible to generate code comments.  But given the realities of the
internal database (which is something the hardware people control and
like to frequently refactor) it would be a non-trivial amount of work to
get to exactly the behavior we want, and our tool would need frequent
updates to keep up with the kinds of changes the hardware people tend to
make.  It's something we can consider, but it isn't something we'll be
able to just whip up in an afternoon like the current tool was.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > 
> > Matt
> > 
> > > 3. Adjusts code to match.
> > > 
> > > Reviewer:
> > > 
> > > 1. Verifies both code and comment were changed.
> > > 2. Verifies code matches the comment.
> > > 
> > > If the counter proposal is, patch author:
> > > 
> > > 1. Runs the WA tool for a WA number. Tool outputs text.
> > > 2. Adjusts code to match.
> > > 
> > > Reviewer:
> > > 
> > > 1. Runs the WA tool. Tool outputs text.
> > > 2. Checks patch matchs the WA tool output.
> > > 
> > > I will accept it but I strongly believe skipping of step 2 will happen and
> > > it will be impossible to know. Rubber stamping with the options of
> > > comments+code at least leaves a trace of comment and code being out of sync.
> > > 
> > > > > And point here to stress out is that accidental logic errors (missed
> > > > > workarounds) can be super expensive to debug in the field. Sometimes
> > > > > it can literally take _months_ for sporadic and hard to reproduce
> > > > > issues to get debugged, handed over between the teams, etc. So any
> > > > > way in which we can influence the likelyhood of that happening is
> > > > > something to weigh carefully.
> > > > 
> > > > yes, that's why I want to remove the comments: from my experience they
> > > > are more a source of bugs rather than helping.
> > > > 
> > > > > Secondary but also important - if i915 is end of line then an extra
> > > > > why we want to rip out this for ancient platforms. Is the
> > > > > cost/benefit positive there?
> > > > 
> > > > yep, here I agree and was my argument about using the platform names
> > > > rather than a more "catch all" regex. I think doing this only for tgl+
> > > > platforms or even dg2+ would be ok.
> > > 
> > > Okay this is something to have as a 2nd option indeed. DG2 is out of force
> > > probe so maybe try with MTL. Although different rules for different
> > > platforms I don't know if will work in practice. Could be justt too
> > > complicated to be practical.
> > > 
> > > > > As a side note, and going back to the question of what the tool can
> > > > > output. Long time ago I had an idea where we could improve all this
> > > > > by making it completely data-driven. Have the WA database inspecting
> > > > > tool output a table which could be directly pasted into code and
> > > > > interpreted by i915.
> > > > > 
> > > > > For reference look at intel_workarounds_table.h in
> > > > > https://patchwork.freedesktop.org/patch/399377/?series=83580&rev=3
> > > > > and see what you thing. That was just a sketch of the idea, not
> > > > > complete, and yes, i915 end of life point makes it moot.
> > > > 
> > > > now that xe is announced I can talk about this part... this was more
> > > > or less what I implemented in xe: it's a table with
> > > > "register + condition + action". There are the most common condition
> > > > checks builtin + a function hook for the more advanced ones. During
> > > > binding the driver walks the table and coalesces the entries creating
> > > > a per-register value that can be used at the proper times, depending if
> > > > they are gt, engine, context workarounds.
> > > 
> > > Cool, I support that high level approach.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
