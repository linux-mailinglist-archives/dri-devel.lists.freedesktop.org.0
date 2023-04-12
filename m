Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC306DF60C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B0D10E7D6;
	Wed, 12 Apr 2023 12:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAC810E7D4;
 Wed, 12 Apr 2023 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681303648; x=1712839648;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k8CTtmTgd1tuOukuXQD5U9SP64IDGSAxFh2QAKhMw2o=;
 b=WmELiDC1r67mVSSnwuQAY17aYH4aTxDchYexSm+fUq3TnRNq0sSKkIBL
 KQaScbv+YcZC5fQwR9lABYoZYqYy7LUzgestCRDHdxjewHUeuN2iSrfQB
 YFVRESgh1FEN1tRboJWtCgmhB3BDBVo+mZazMuW7gLpm4jbfp/hjf55Gx
 kyCUKITuGFXWQ+9uRAaA2jLJ1QNq4qKCY/anASf9FXP/NjeF4QfrcEjYg
 HJeplVbrl5KjVpbmbNopa6pmhWpEpZrLhGVLhUTgx2zYBsm2SEkUG5Jww
 V38WFC/S38edcEOc5nE1IJI417TSLCi/EcdcDunRI0oBxo836BO3yDcLk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430168079"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430168079"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 05:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="812972574"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="812972574"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 05:47:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 05:47:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 05:47:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 05:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfnSDB/dPEB8e8cTUMMnz2ra0swWEOTvuqAQPqgQG8+VBLemTkBZV3ouyZbDdFY4PjkmApbDyYyTvIzG/NWRSBHUu0CwRfEKu3QffcsPHfOzTZRG3Vr8xk0VYcIEUOZ1NCjRN0Ru+v6yRCI1BnvXwMA6j3oJyGVPiSDvqfZKsVBmqYwiwA96Nm1bPHSfjGBl5Riw/gkUtDDPKTPKzkKGPDoTChZugdxmHc8q3sTN67VlfcCh4idwo48rVaPhXFkhCuRNL57wXO7Jz3Dz85GvZG8zIkBJPbTGrM18OXJRYFqKO55KLSsiRYeFwZfBANOoq2HWkVEeXtbQ+Kuemt7hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dJLaGjF0t2COFSVjQBXAuz/SwXEjoEJgTbPa/ux2MM=;
 b=RS4xYB0N6coFaqm2CNjfP/7kHW0eE1CqXafnKoACdnXTV7O9YFJTrybSNhtFYpm6ctPDjC8VS7vxBy65iWRJS64Fp0d4hK+n6pBZwWVsqzHMf2aKogAqY8RdsY6sEln1pnsN+yZ4nudFPYT5dlv9/UGjnft0iBjrAGrTaqJhCpy0d02eoU5J3w+Dgt9LRfSah2jWdTV1KQjJI42M+5KgwhqxrhXA6oWhtToKmO7kb6FoSLO/8YbeJcNBH//e+FEpyWDzZMeg4ihtPG2ru3SJiutuIYqpy/6b6iZnLiY4v5TGQ5K+l3dgYRTGgQ5zLfldpc2vJbsFyoa9gDQfSFWboQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7993.namprd11.prod.outlook.com (2603:10b6:806:2e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 12:47:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 12:47:17 +0000
Date: Wed, 12 Apr 2023 08:47:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>, Rob Clark
 <robdclark@chromium.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, open list
 <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>, Boris Brezillon
 <boris.brezillon@collabora.com>, <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
Message-ID: <ZDaoT44hqnIH4ZX3@intel.com>
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
 <CAF6AEGsE3NOe9TkEzrk5rr-D2PoKaxF5Yn3W8wWew8um6r2EXw@mail.gmail.com>
 <d93f4256-4554-e031-9730-4ca2a7de6aaf@linaro.org>
 <ZDZntP+0wG6+QyHh@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZDZntP+0wG6+QyHh@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 94956e75-031a-4b46-c403-08db3b540c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XCQN7Rts+Dbe7BoqjvAUuSUUuVoQL6k7pRWHNTiaoCh0V1XVTA5Nbp7AGmXFctl8LCyFzixFpo+Nz9/chpAWVX7iexg+6NfXCxD6UxeS/nhRIn47N7FXJMBJJbqd8jY9MvavaI7KH2H6PYsprjrvQwIL5qFV7kJoYXu4mucaPAhMYMICGGw/91TaUHWyeGwal6TlxO/L83E33Fr6ivs0OAflVZuSaJ4htpqRuhVnCBtvT6tbz2hbq81P1Sj5Ru6Zbt8tyXxBJCnr0CIc6fa5vPFilxzVUZp8/TwVW/Rlj8KtDr1JOGQAHduCLbFcawfoRvoE03XTM2mmutYJmoY5Fbgb6zNn+zwmaw0AxOkghrwilCjtN0x1UP7ox99gp9MHjYOv0qhkUIS9c8q7SMrWwggkDmMdyOYq4KajUnD+OnJk3N/CRDXxaU+Y98NHRwmgYPwOJl72MIXNtT1J4F5wfQkuGC4HuVSA6T6K4Ransoia3GI3L36zsl+6OjFPB8zNyPilAL/DMZXnlwsfO4YKJxjE3SDrlbKgeJ6XS7pELQk9g4vCoXp+c8bs4eR7PQFFvbCQjBWjTvmXLZjfE7uAquUCBs65JvcV5wX1N9rdA3AUnL10okGda9tgzqm5sUG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(44832011)(66899021)(82960400001)(7416002)(38100700002)(5660300002)(8936002)(2906002)(53546011)(2616005)(966005)(26005)(6506007)(921005)(110136005)(6512007)(36756003)(41300700001)(86362001)(66946007)(186003)(316002)(66476007)(8676002)(66556008)(478600001)(6486002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SElCS0U1VFptSm5TbFNuRjdRa3ZYU2J3aE5zZmxqbjRpV2QxRHg5b0dXRXIv?=
 =?utf-8?B?bEp2a0djZmkxVFRKSUFFcUdDTkpvR2dqRk90NG1SeTV0cUZUWHljdFJQL2hZ?=
 =?utf-8?B?VFpWQjdaL1hDWGxvQnVtZlA5amNmdi91TlFsNWNqTmMweFhUV0p6RWMxNFBB?=
 =?utf-8?B?QnJCNFgxWVFkVWJubXZIek1nRFBQZDVKZ1RFQTBMemRWVHNZRlZaMStzcEZB?=
 =?utf-8?B?R1VaL0J6RCt3UEt3MFhheDU4U09jRTRZY0VCaDNFNG1KMUg1SzJMTVJISG1p?=
 =?utf-8?B?R0ViRXpsNk53c3dzK0xhdTdlZklTWlBVUUhRWGN0aXNySzVKQ3Z5MjdHTFFS?=
 =?utf-8?B?UkF6ZmpiMDVSL2ZCTTJvcFQ5Y1Vqd2o2WHA0TkR3by9zTG1CK0hWSXNNLzhy?=
 =?utf-8?B?ZGpsZGFHcFFWMzdaMUJkcXpUaERKZ2hTbFdGRit4V2tXUzJqZk53S0JuakQy?=
 =?utf-8?B?YU5HR3htOFdXUEZycWl0UkFETzJ2MG9qVzZ4c2lsbHZjUFhESWF0TVk0eVNT?=
 =?utf-8?B?NnZrWS9kN3R4R2RtNlRKTjVsdG04S2wrQzZTRWFGSmphNnpKaWs2U29mLzJt?=
 =?utf-8?B?SEFiRW05RzBhR0VoMGU5a2doMFBLU25mb0EvcUtxMUdYNjFPb0p0MlNEcUVR?=
 =?utf-8?B?VmNUN2RtekJZaG1PQ0hYdThGZnBTT0Q1QUJhTEVrVHlEUFNWOGJQeC9oRFdV?=
 =?utf-8?B?bjF0RVFiWnd3Z0hoMit1OUhTVTM2WlExeFFETGJnZ09heUx3QXNBUmQ0czR1?=
 =?utf-8?B?UWhtWTRQRWdjYmJhOVVXOWFFWnRPalFrdjhabTdPVTFad09Yb28xUzNlSWJO?=
 =?utf-8?B?Q2Q1OW9ZYy9hWGYvN0QwdnRQaWxyZ3NGV0lkbVVxZ09wc1p0YlYwU2V0OUln?=
 =?utf-8?B?dlJjcjhMV3IzMmpZdFdJdFduWlVYUlQvUFEvUFNRbnpvcng4T3FWMlMyeU1D?=
 =?utf-8?B?Q0Z3clo3MjZjWkJtOHFmNUtRM2RyY3Y2bnFhS2xqRHRLTGZER2VSVDJPWkMw?=
 =?utf-8?B?aTVFZDZFaGJqZDlsUkJOdE9TYUZaRHpIZHR4b0tYSnE2OTRlbFVZYjdQVmdM?=
 =?utf-8?B?Smc0amo5bXBLaWd6TGx1M1FoN0Y3Qy9XZGtkaGR3QmZlc1NDbUZRbDc4eW5L?=
 =?utf-8?B?N1BLYVNDQzZINW9JWEh4amMvWXFBQ2Q4T1BpVHUveWZXN1VXWWlLeW41RXRZ?=
 =?utf-8?B?UWoxYnh2b3d0cnRTWGZuelJDemI1dXV2cGt0YnBBU3pCYVFVQXVPNjNSWHdr?=
 =?utf-8?B?cDFiQzY5WjFBVlh1eVVDSDBOWkZPUmlMNjN1WGJuZmRVV2lZOGFWa2dYNW1m?=
 =?utf-8?B?M05aQlg0eGgvS3NQbG9kZFFsOEM1T0VvSGFXV3FJK1JsbURvWi9ZZUwwenBw?=
 =?utf-8?B?MXJwamFJQ0VuUTFtU2ZPYjFzZjJuckw4OUYxdFRhVUFFM1lHaVBNcE5VMlZP?=
 =?utf-8?B?MW8yWHNxMXhBV0lnR2RoZThic0pwaHdSbnpiWGdNY1QvUGRjWGE4SDQvQWIv?=
 =?utf-8?B?ZmZ2THM3Mll3bktDajNmZnZPWlVSTkdpUk15bXRGSXkySXhHK1lJYUVwYUxH?=
 =?utf-8?B?b2dDVERpczVHQWFVVmhPVHdQaXlHNkllV0dBcVhyd2pLV0treWlCckYwdHcr?=
 =?utf-8?B?OVdta0x5YlhxUjZTOWpnRTNhSit6Y1dhTzJFenYrdEI0VWpuVjU3WGIyNDAw?=
 =?utf-8?B?VDYrVDFneTUyZkZIMUNOczZsRHRJa3RtSlhFdUJUTGo2bEcwSEJEWHZuQ0lm?=
 =?utf-8?B?ZUNjKzhMME8wNnRrMys1YS9SVFpqQUg2OWpPSFhTTVNIUjRwbHA3K1hKU0Fs?=
 =?utf-8?B?cW5Cc1pmcTBhRmllUWxwUnZabEI5QUdScFZiRlRzVTQxdGVwODdZWFVyeDhw?=
 =?utf-8?B?OENVTDhPTmtpZjkrckVZamc5d2NZTEh0eG50cUx2VFVWRnJEVUlWaXV3a3Vp?=
 =?utf-8?B?cmt3eW50VVNMbWRCN3pscGhyU08yNkdXcVRMWmQzVlc0a0NnSVVJd3hOL0py?=
 =?utf-8?B?eDJvWVVYbVU5VnBpVUVWR2pTVXdOTTFmcDQrOW9WOXZnNnExUGlLeHRaM0t0?=
 =?utf-8?B?cG1KWk9JRXd5QmphUno5bkxMcFdjL0N5ZnJTVVBYenBaTmM2T2ZZdTlvWmZT?=
 =?utf-8?Q?M1Bej8CIY5JOQjNcJdfi6nrnY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94956e75-031a-4b46-c403-08db3b540c15
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 12:47:17.3856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X383OXT6asuvVofrJnncuPCPd7UpM8wJeUApPuAOK4QBmz2/YiAy8XaBK0xW+NXPNUZp/gBWMm6Mng5qAiNo1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7993
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 10:11:32AM +0200, Daniel Vetter wrote:
> On Wed, Apr 12, 2023 at 01:36:52AM +0300, Dmitry Baryshkov wrote:
> > On 11/04/2023 21:28, Rob Clark wrote:
> > > On Tue, Apr 11, 2023 at 10:36 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > > 
> > > > On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wrote:
> > > > > 
> > > > > On Tue, Apr 11, 2023 at 9:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > 
> > > > > > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > > > > > > On Mon, Apr 10, 2023 at 2:06 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > > 
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > 
> > > > > > > > Similar motivation to other similar recent attempt[1].  But with an
> > > > > > > > attempt to have some shared code for this.  As well as documentation.
> > > > > > > > 
> > > > > > > > It is probably a bit UMA-centric, I guess devices with VRAM might want
> > > > > > > > some placement stats as well.  But this seems like a reasonable start.
> > > > > > > > 
> > > > > > > > Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> > > > > > > > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> > > > > > > 
> > > > > > > On a related topic, I'm wondering if it would make sense to report
> > > > > > > some more global things (temp, freq, etc) via fdinfo?  Some of this,
> > > > > > > tools like nvtop could get by trawling sysfs or other driver specific
> > > > > > > ways.  But maybe it makes sense to have these sort of things reported
> > > > > > > in a standardized way (even though they aren't really per-drm_file)
> > > > > > 
> > > > > > I think that's a bit much layering violation, we'd essentially have to
> > > > > > reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
> > > > > > be in :-)
> > > > > 
> > > > > I guess this is true for temp (where there are thermal zones with
> > > > > potentially multiple temp sensors.. but I'm still digging my way thru
> > > > > the thermal_cooling_device stuff)
> > > > 
> > > > It is slightly ugly. All thermal zones and cooling devices are virtual
> > > > devices (so, even no connection to the particular tsens device). One
> > > > can either enumerate them by checking
> > > > /sys/class/thermal/thermal_zoneN/type or enumerate them through
> > > > /sys/class/hwmon. For cooling devices again the only enumeration is
> > > > through /sys/class/thermal/cooling_deviceN/type.
> > > > 
> > > > Probably it should be possible to push cooling devices and thermal
> > > > zones under corresponding providers. However I do not know if there is
> > > > a good way to correlate cooling device (ideally a part of GPU) to the
> > > > thermal_zone (which in our case is provided by tsens / temp_alarm
> > > > rather than GPU itself).
> > > > 
> > > > > 
> > > > > But what about freq?  I think, esp for cases where some "fw thing" is
> > > > > controlling the freq we end up needing to use gpu counters to measure
> > > > > the freq.
> > > > 
> > > > For the freq it is slightly easier: /sys/class/devfreq/*, devices are
> > > > registered under proper parent (IOW, GPU). So one can read
> > > > /sys/class/devfreq/3d00000.gpu/cur_freq or
> > > > /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_freq.
> > > > 
> > > > However because of the components usage, there is no link from
> > > > /sys/class/drm/card0
> > > > (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0)
> > > > to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
> > > > 
> > > > Getting all these items together in a platform-independent way would
> > > > be definitely an important but complex topic.
> > > 
> > > But I don't believe any of the pci gpu's use devfreq ;-)
> > > 
> > > And also, you can't expect the CPU to actually know the freq when fw
> > > is the one controlling freq.  We can, currently, have a reasonable
> > > approximation from devfreq but that stops if IFPC is implemented.  And
> > > other GPUs have even less direct control.  So freq is a thing that I
> > > don't think we should try to get from "common frameworks"
> > 
> > I think it might be useful to add another passive devfreq governor type for
> > external frequencies. This way we can use the same interface to export
> > non-CPU-controlled frequencies.
> 
> Yeah this sounds like a decent idea to me too. It might also solve the fun
> of various pci devices having very non-standard freq controls in sysfs
> (looking at least at i915 here ...)

I also like the idea of having some common infrastructure for the GPU freq.

hwmon have a good infrastructure, but they are more focused on individual
monitoring devices and not very welcomed to embedded monitoring and control.
I still want to check the opportunity to see if at least some freq control
could be aligned there.

Another thing that complicates that is that there are multiple frequency
domains and controls with multipliers in Intel GPU that are not very
standard or easy to integrate.

On a quick glace this devfreq seems neat because it aligns with the cpufreq
and governors. But again it would be hard to align with the multiple domains
and controls. But it deserves a look.

I will take a look to both fronts for Xe: hwmon and devfreq. Right now on
Xe we have a lot less controls than i915, but I can imagine soon there
will be requirements to make that to grow and I fear that we end up just
like i915. So I will take a look before that happens.

> 
> I guess it would minimally be a good idea if we could document this, or
> maybe have a reference implementation in nvtop or whatever the cool thing
> is rn.
> -Daniel
> 
> > 
> > > 
> > > BR,
> > > -R
> > > 
> > > > > 
> > > > > > What might be needed is better glue to go from the fd or fdinfo to the
> > > > > > right hw device and then crawl around the hwmon in sysfs automatically. I
> > > > > > would not be surprised at all if we really suck on this, probably more
> > > > > > likely on SoC than pci gpus where at least everything should be under the
> > > > > > main pci sysfs device.
> > > > > 
> > > > > yeah, I *think* userspace would have to look at /proc/device-tree to
> > > > > find the cooling device(s) associated with the gpu.. at least I don't
> > > > > see a straightforward way to figure it out just for sysfs
> > > > > 
> > > > > BR,
> > > > > -R
> > > > > 
> > > > > > -Daniel
> > > > > > 
> > > > > > > 
> > > > > > > BR,
> > > > > > > -R
> > > > > > > 
> > > > > > > 
> > > > > > > > [1] https://patchwork.freedesktop.org/series/112397/
> > > > > > > > 
> > > > > > > > Rob Clark (2):
> > > > > > > >    drm: Add fdinfo memory stats
> > > > > > > >    drm/msm: Add memory stats to fdinfo
> > > > > > > > 
> > > > > > > >   Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > > > > > > >   drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
> > > > > > > >   drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> > > > > > > >   drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > > > > > > >   include/drm/drm_file.h                | 10 ++++
> > > > > > > >   5 files changed, 134 insertions(+), 3 deletions(-)
> > > > > > > > 
> > > > > > > > --
> > > > > > > > 2.39.2
> > > > > > > > 
> > > > > > 
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > > 
> > > > 
> > > > 
> > > > --
> > > > With best wishes
> > > > Dmitry
> > 
> > -- 
> > With best wishes
> > Dmitry
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
