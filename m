Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D44664BDC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 20:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A3D10E639;
	Tue, 10 Jan 2023 19:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2DB10E1FF;
 Tue, 10 Jan 2023 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673377324; x=1704913324;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JcKJJoVZn3iXmB/NmBGcYowhSV4MeR7j1SPqhmT2ZCk=;
 b=Ij9EqSmhp/B5rYZwwPMXkJoanXtOYKtmgnjbhtZIkZvRagTqIAsyFtsF
 K5tevgwmtZ9zRDA9vGexv2Z9JPWlYBuNKxHJ4jskr3ljxp2T9IONfcagK
 RQswosAA5UKM9OTTYNTuY+XNCupyGpn8HAgtg3DH+gbICmc4fj/HgbNDg
 z3B09aDIjL+8IDKLUGZ/KhDRCc9pZ0v/GQ0rwR/yIOuXWV3E+AKlOFQ29
 Puia8JVLSGicT3YexPoroFwHueQjXJ6CZdU6tXe9s1Kmm0/bTOxawSuj1
 3F3sMF2aImghmGnXOPQ/0hlD7iIygcniCrf8C9vSueYmSfzHePI1POHXA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="302934149"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="302934149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 11:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="985878146"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="985878146"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2023 11:02:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 11:02:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 11:02:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 11:02:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 10 Jan 2023 11:02:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tn76Ip1kZ26k4af4z5SxFjdH/xLXygcoHI8HV/2+TJznhxV7PjxdkI0igwKQTKbXXVXVcJ5rrKCeooaa6QUiWF4W7qWt5YwBPrhIDRYWBFTvI5MTW48WVw9au64ByzuELEv9sB4G79t0bsKR6fdvlxmkpaisSF8U4OueM3yNI5+OpNc7z/8o8DDVmCPS9Ed1ZPArDQKq3J7bfDzLfNdKT56dusKNrrICCRrfJTT+doHDIdFxX//hO3W7lsxQ4do97/LDhfOknRLe1n2oB5a9fR/LYsAubu8OszW73p/RieDK0unqftcRBHFjjMR7due2wk2ar1ZQ2LR8pMUDEuERIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkff4nylN+7+dFjSeE+/+6OZDD09SHSJ7XlnVoWD4PM=;
 b=UqrIUDf2QxowQbjwSdkTcFWqCO/fss2s/u8evtwg+1yoRICiEiyL1gxJtEVqWnPHc53Ss5rsxC+8M/qhgI1Z8EL9owtdp8kfLalaoyYRSkelo5nmywhQG4kGWoIVRV4wHTAUKC8Gv9awps3aYGIidQlBKVBgTiMp3bp8cjBMabjz0WBodFD8bQU3Hf8+3u3e26jWsrPIa+bX7ZKvQQBVXDJGrW4ib9NK4q8Cmz3ucDBxheLBJEGxTJMgLkh7Q/Z47/uhwqkRhnHQdUkFY9QcInkk5ZyRyh+fg4NSI7HHPVjzsF67Kj8JpqnXO5F9/EAvY7LfWS5udZU/+bajWt1N5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 19:02:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 19:02:00 +0000
Date: Tue, 10 Jan 2023 19:01:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y722HdwGKB8swy0B@DUT025-TGLU.fm.intel.com>
References: <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
 <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
 <b3225349-85fa-b30a-319c-604334e2f7e2@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3225349-85fa-b30a-319c-604334e2f7e2@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca9bfaa-be40-4f41-288b-08daf33d2767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rAHgck+oP3ivmWn1Tb52hO5raTu6OAtQC+RfJgaxqCybAV+xPaMexUfzR8Q0vozyBt6Qe9uNXqPQr9wDX9zktgll36Lebxvzl1qQjXvCPSQ1a6UX+witasdfr8tUV4KA4mpF7YaTrTmp5bcLry0T4nCPCuGerNKv5gIrvEpNs015qnuPt+AgwREqAuKpYPiMlPnEj6DRGcCoplMw6ElHtUP+2SUflAK6VMg//Ew6rWFt5o4c8ud8Alwl9UZGqfhBruBhay/hIuTrCrkJmwnQminDp1iEw97+HeZBadhWz5oBTyzN2Z+RXK8zTf/tDbE0cz1uYVaO8Tj+w4WSCH9+b5IdtXL/J4w2ItFEotgwMuoaqMVBa8yV0KyZi7a4AyLzOvTu0ZRX5TCpo81tKBI2YTacPMrBwm4nyBT4ueMRFOEOQtaJsihBobNVoH+DIr09Sp+YT25T/rLL9mbc17kyniaESOIY13ZhKHXwcE8j8SGBbmEFquf2fPh+PbUSInIOWRhW69B40KD2JU/BmMQRKFTlovhPucuw9bYF9ZyWeRrGg9DHaaria5xIL5BL8Qe+cv7Du6t1nz0O4VD9UTtGmKdiL1JXzhl+SAUito6V7UIAVeBoHbRxzFGURiVU/JNAsPbIvdXx5tRWoVTgnxYHvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(66899015)(8936002)(186003)(2906002)(41300700001)(5660300002)(4326008)(6916009)(66476007)(8676002)(66556008)(66946007)(316002)(44832011)(38100700002)(26005)(6512007)(83380400001)(86362001)(478600001)(82960400001)(53546011)(6666004)(6486002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Bi/p3KE3vQzUtKXij4350AYaa1axumHt/gnnM6BJaUOoO9vAUPsH4UK4iW?=
 =?iso-8859-1?Q?73Y+WaMCSC63My7F5GtXZvFvaPVsM/Sgpa8gwYmEDPYMhqrOgX9VWFG6jc?=
 =?iso-8859-1?Q?i/bOBjyXXJcib/YxzI5Pg4XhMmDMNEdQCWqmrhpQfF4kKn97LzkHXKEktH?=
 =?iso-8859-1?Q?SDrcOq9Oh0XTh2vMwmp0rS3jlTNYC4GPEQJu0lTLbmUEs8yXh0uVSZTlQS?=
 =?iso-8859-1?Q?vBCyXxqVzK8cM6quxedptNEG9MZp3a5/KLeWBKRpB06lX0kgJaHyB+ERGy?=
 =?iso-8859-1?Q?mSi4MZ+5WHfDeYIkPVWVSvpUaaotZspCJteX55MZK1geWCaH1WYpkJjn2q?=
 =?iso-8859-1?Q?MICXwLEhW1V+UMG9TF9hO8NTHYFoTVeIbAHyFrmyY0D7Q1supcRo9K+VDx?=
 =?iso-8859-1?Q?VEq0659X/PuvQViUG7fUXNTl91JT4tzE4yK7pR6N41fxzBtzGruQ0P9EQb?=
 =?iso-8859-1?Q?yOROJBCDLf+V27c2QKRU24ZgbEEcxfGf+N79QgELUNHht/eCDK3vUauBuh?=
 =?iso-8859-1?Q?o4dzc8BfwX8aRb5IKfj0dqDx4pyfI9XHmNTYGfNeAEcLabM2akyEVzVxXX?=
 =?iso-8859-1?Q?QJbNHUZEFGuUElZP1I6GD/gcS/jWeOynjvx3zbViUarDYFjlLiH+LTlhXV?=
 =?iso-8859-1?Q?0SgobsXga6Vwxr3r2vtUscSL2TGUJoUYS5pj4lOcT/uE7Q6dmwuoaTijjE?=
 =?iso-8859-1?Q?EnEZdp0MLZ2daeFW+gYyBCrXF47XImLy5ThWWk/z54RsB8boWNTskes2GL?=
 =?iso-8859-1?Q?Hz6iFwtc4NUf3WQ8ZC7yzL3FbATLsA/LxGw99Fyeqvt89NYXI5qWe1rgU4?=
 =?iso-8859-1?Q?htdbG0Yt/9cpkecUPkpswQk93pe6xwL/hzSpuoYBwJCUsdvtDXoTZQQQVL?=
 =?iso-8859-1?Q?nBa7UmW31r55Fahwktm4GUDKdzF93/EXFQddnLrefqVNQtK+kGCTPV37w4?=
 =?iso-8859-1?Q?xXpFo+d6cLA8XE+7PxTJtAj9h7/YosNQK1+XhENerRXZLJv8p/dtdNNV3y?=
 =?iso-8859-1?Q?/rF2nnEXCsukeg6+s2hkOHfHWLC9fZRfXtCzM+qdNX8SZaf6EssHPNZwbe?=
 =?iso-8859-1?Q?i6/HmlfubQ4fhIBU1Ksm7FlpWxqlrcq/n5HSrJ6BmhxPf244v/ezC16Fzt?=
 =?iso-8859-1?Q?uV4OwGPPEBPdO18s9oEBH74ndDwhjhP3SycCAps/TST4wfOaL7uvXmUPTO?=
 =?iso-8859-1?Q?KJaLaeJX8DL1epzop2nALPgrRq62AZblKhtn4cCN8NZDw5isO8DD8D/O7C?=
 =?iso-8859-1?Q?x51rvw0udlmOZh2AgnEaQyxzpbjMV8kQz8SmEQ8Nzn9R+kS0cSggrZb1Bs?=
 =?iso-8859-1?Q?m7TRVhLY8SYQFcWxToqk72PRkzem4zis2gBqLhlPdkNKN97A0q8WfYOXJa?=
 =?iso-8859-1?Q?64FYvb2VWJDtaE6MotH9c06nEn0Xb5g9m3gy4BK398afU7BrYELGxv4ISz?=
 =?iso-8859-1?Q?Pv36hoLxYn/ugRJliCbUsAB2OcseD2AYwkltyF/wQrmpMCU7nOCD1xduww?=
 =?iso-8859-1?Q?Pw08nbZ2WVcLKsqhmU13L7BTqMpGIW928U+LL9k0B55YhLErL+qkCCIb5f?=
 =?iso-8859-1?Q?51w5mxAjELlubsALvHOKFGakQfvfPGjdcE7uQUt0WfTRUkZeT/oF5D+n+9?=
 =?iso-8859-1?Q?vHUyMd3anpipIgf+5JkBwovzQjRWza5j3+DwspYmf1rwyyzRR+Bumu2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca9bfaa-be40-4f41-288b-08daf33d2767
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 19:02:00.7535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiKFNfvmfuUaQma9gSN+l8Kk3Qj0Vz8QT5dmLX8WeNnHqv6HxjXBaBpcBB2cmWmFAoGzeI6ORN0CqC/RW40iDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5587
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 04:50:55PM +0000, Tvrtko Ursulin wrote:
> 
> On 10/01/2023 15:55, Matthew Brost wrote:
> > On Tue, Jan 10, 2023 at 12:19:35PM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 10/01/2023 11:28, Tvrtko Ursulin wrote:
> > > > 
> > > > 
> > > > On 09/01/2023 17:27, Jason Ekstrand wrote:
> > > > 
> > > > [snip]
> > > > 
> > > > >       >>> AFAICT it proposes to have 1:1 between *userspace* created
> > > > >      contexts (per
> > > > >       >>> context _and_ engine) and drm_sched. I am not sure avoiding
> > > > >      invasive changes
> > > > >       >>> to the shared code is in the spirit of the overall idea and
> > > > > instead
> > > > >       >>> opportunity should be used to look at way to refactor/improve
> > > > >      drm_sched.
> > > > > 
> > > > > 
> > > > > Maybe?  I'm not convinced that what Xe is doing is an abuse at all
> > > > > or really needs to drive a re-factor.  (More on that later.)
> > > > > There's only one real issue which is that it fires off potentially a
> > > > > lot of kthreads. Even that's not that bad given that kthreads are
> > > > > pretty light and you're not likely to have more kthreads than
> > > > > userspace threads which are much heavier.  Not ideal, but not the
> > > > > end of the world either.  Definitely something we can/should
> > > > > optimize but if we went through with Xe without this patch, it would
> > > > > probably be mostly ok.
> > > > > 
> > > > >       >> Yes, it is 1:1 *userspace* engines and drm_sched.
> > > > >       >>
> > > > >       >> I'm not really prepared to make large changes to DRM scheduler
> > > > >      at the
> > > > >       >> moment for Xe as they are not really required nor does Boris
> > > > >      seem they
> > > > >       >> will be required for his work either. I am interested to see
> > > > >      what Boris
> > > > >       >> comes up with.
> > > > >       >>
> > > > >       >>> Even on the low level, the idea to replace drm_sched threads
> > > > >      with workers
> > > > >       >>> has a few problems.
> > > > >       >>>
> > > > >       >>> To start with, the pattern of:
> > > > >       >>>
> > > > >       >>>    while (not_stopped) {
> > > > >       >>>     keep picking jobs
> > > > >       >>>    }
> > > > >       >>>
> > > > >       >>> Feels fundamentally in disagreement with workers (while
> > > > >      obviously fits
> > > > >       >>> perfectly with the current kthread design).
> > > > >       >>
> > > > >       >> The while loop breaks and worker exists if no jobs are ready.
> > > > > 
> > > > > 
> > > > > I'm not very familiar with workqueues. What are you saying would fit
> > > > > better? One scheduling job per work item rather than one big work
> > > > > item which handles all available jobs?
> > > > 
> > > > Yes and no, it indeed IMO does not fit to have a work item which is
> > > > potentially unbound in runtime. But it is a bit moot conceptual mismatch
> > > > because it is a worst case / theoretical, and I think due more
> > > > fundamental concerns.
> > > > 
> > > > If we have to go back to the low level side of things, I've picked this
> > > > random spot to consolidate what I have already mentioned and perhaps
> > > > expand.
> > > > 
> > > > To start with, let me pull out some thoughts from workqueue.rst:
> > > > 
> > > > """
> > > > Generally, work items are not expected to hog a CPU and consume many
> > > > cycles. That means maintaining just enough concurrency to prevent work
> > > > processing from stalling should be optimal.
> > > > """
> > > > 
> > > > For unbound queues:
> > > > """
> > > > The responsibility of regulating concurrency level is on the users.
> > > > """
> > > > 
> > > > Given the unbound queues will be spawned on demand to service all queued
> > > > work items (more interesting when mixing up with the system_unbound_wq),
> > > > in the proposed design the number of instantiated worker threads does
> > > > not correspond to the number of user threads (as you have elsewhere
> > > > stated), but pessimistically to the number of active user contexts. That
> > > > is the number which drives the maximum number of not-runnable jobs that
> > > > can become runnable at once, and hence spawn that many work items, and
> > > > in turn unbound worker threads.
> > > > 
> > > > Several problems there.
> > > > 
> > > > It is fundamentally pointless to have potentially that many more threads
> > > > than the number of CPU cores - it simply creates a scheduling storm.
> > > 
> > > To make matters worse, if I follow the code correctly, all these per user
> > > context worker thread / work items end up contending on the same lock or
> > > circular buffer, both are one instance per GPU:
> > > 
> > > guc_engine_run_job
> > >   -> submit_engine
> > >      a) wq_item_append
> > >          -> wq_wait_for_space
> > >            -> msleep
> > 
> > a) is dedicated per xe_engine
> 
> Hah true, what its for then? I thought throttling the LRCA ring is done via:
> 

This is a per guc_id 'work queue' which is used for parallel submission
(e.g. multiple LRC tail values need to written atomically by the GuC).
Again in practice there should always be space.

>   drm_sched_init(&ge->sched, &drm_sched_ops,
> 		 e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> 
> Is there something more to throttle other than the ring? It is throttling
> something using msleeps..
> 
> > Also you missed the step of programming the ring which is dedicated per xe_engine
> 
> I was trying to quickly find places which serialize on something in the
> backend, ringbuffer emission did not seem to do that but maybe I missed
> something.
>

xe_ring_ops vfunc emit_job is called to write the ring.
 
> > 
> > >      b) xe_guc_ct_send
> > >          -> guc_ct_send
> > >            -> mutex_lock(&ct->lock);
> > >            -> later a potential msleep in h2g_has_room
> > 
> > Techincally there is 1 instance per GT not GPU, yes this is shared but
> > in practice there will always be space in the CT channel so contention
> > on the lock should be rare.
> 
> Yeah I used the term GPU to be more understandable to outside audience.
> 
> I am somewhat disappointed that the Xe opportunity hasn't been used to
> improve upon the CT communication bottlenecks. I mean those backoff sleeps
> and lock contention. I wish there would be a single thread in charge of the
> CT channel and internal users (other parts of the driver) would be able to
> send their requests to it in a more efficient manner, with less lock
> contention and centralized backoff.
>

Well the CT backend was more or less a complete rewrite. Mutexes
actually work rather well to ensure fairness compared to the spin locks
used in the i915. This code was pretty heavily reviewed by Daniel and
both of us landed a big mutex for all of the CT code compared to the 3
or 4 spin locks used in the i915.
 
> > I haven't read your rather long reply yet, but also FWIW using a
> > workqueue has suggested by AMD (original authors of the DRM scheduler)
> > when we ran this design by them.
> 
> Commit message says nothing about that. ;)
>

Yea I missed that, will fix in the next rev. Just dug through my emails
and Christian suggested a work queue and Andrey also gave some input on
the DRM scheduler design.

Also in the next will likely update the run_wq to be passed in by the
user.

Matt

> Regards,
> 
> Tvrtko
