Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102361FC00
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AA610E8A2;
	Mon,  7 Nov 2022 17:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB58010E88B;
 Mon,  7 Nov 2022 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667843575; x=1699379575;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MHfDR8BPHJietLjj5Y13SHRasLhmLLedKLhZnl3DFSg=;
 b=JWcsuTw6QzJRJ8FlRx5qLiUkt3/ruO9c6E003MzHdN9KqfwltJh93Rf7
 HzrgDeY09RnwXpnHAxLHkRTmQK7DaLgMP5ateAHNz0vuctAnoJoHH3IlO
 MZGpMjunjZTaMP+wZItQphdJHVb6UssWkXX03P1OiH6X+Y2e48eKyRo5W
 MNHTa78+NgQLEhmrAlS+9EZjbt0epqKD7sxdADG3j5m0sL0VcANXlEXQQ
 MuP/vQFeRZ6DxXhYwuwsVkkA6XW1KcvXPW1BYGgf/gjWVgPtrgXaKnYVK
 GBZHk9uuKYRxzoa8J3on5T54jJBRLKRauUDYYlGFcYQCUBGWy1Iue69K4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290867840"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="290867840"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="881172994"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="881172994"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2022 09:52:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 09:52:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 09:52:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 09:52:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a58+NTmHj/ntXVfd6kNuhEUIiNRUkKtPOzCj3c1QcdKI4Kmki69fjMuGHcKUUG3PdE4IzNxbb+7pzKJjm25sQ/QHASZ8T9ctRwD0Krpss12OKEGc/WHkE6TdhQTrzuQvEHjTzh1ZxPItJYXtu88pIo6d8hD7XSCaF3xN0LCZ74SQbG2bMfUEVMNLsKxxslIyF7zLoTunTOgVQr7y6l4OTkl4qJSB6QCOt+/y++FQG/mzxTLS9V4fVO2Of0SRs/nM9o0Ezq+/8u3HGPZB19zF/R+00aPdOQ4QEft19vr1o/1MeXt5CafpXZklFcwxTsIizZ56KU9Cqp3eleAIj4LmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xRi36Dz/B1gTNGwSqhhqbYvbgkomSCuC5iSno0qj1w=;
 b=UTv6usFPHGqmSEJ3DB2t+pbDX/HLp5NX/s3LojCtq/I+orK+7eziwtDqTN0OjhVlwy3nvZ1bAvSwVyYiv0NfIXnqZPJRL5ezKXf7eR85PBHhYugvwS3LXk33uonYueJFZAYM8bxqNZO35BERBzw2yKWzAD+Z1pNAlMuAdeCdQ4btClTgRsnbp6iRSpRupcebMbTnBw72Eath55kwCrEJnT61axde3KxSm+OAaDrijYe0mCe8ti4U4B2bU2xZThWLvXTncDe9DSxiAWJewX63Om4nO+cM6tbXmQm69oVa9HY8GYEn64GtB9NIuwucKeNKuYYIuBv8prixJFpMpZJh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB5784.namprd11.prod.outlook.com (2603:10b6:510:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 17:52:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::22c6:b7ab:a8ec:a6d8]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::22c6:b7ab:a8ec:a6d8%5]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 17:52:52 +0000
Date: Mon, 7 Nov 2022 18:52:48 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v5 1/3] drm: Use XArray instead of IDR for minors
Message-ID: <20221107175248.np7ptcuzwdkc6vbf@nostramo>
References: <20220911211443.581481-1-michal.winiarski@intel.com>
 <20220911211443.581481-2-michal.winiarski@intel.com>
 <CAFCwf11=hKGm93oF1A5PLhdvdo2ujYJWyt4qAqK-KQQqe6ngDA@mail.gmail.com>
 <CAFCwf12+piEABvv=nxFJCzUU4XdZw5Pu=r=i3aKQGZrBeraFqw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf12+piEABvv=nxFJCzUU4XdZw5Pu=r=i3aKQGZrBeraFqw@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::32) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 275366f1-716d-433b-3db4-08dac0e8e42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSDd7e/Zz6/PN2YzQ0pgRJO/WZwNT1sujmty2Zhua/3MfX0I1pD0t+EnaTt6jLi9GOnd2wlGd0iARtMfzJdT/QKBT1YtSaxwjwjj4sEUzWSNFS5St0ckgMTL2VG+hqCIzem4KOeCTi0mhcBkTJBsuw+GBQoQe2vr3pSCxbM3KxzetcaI/O2oquAlkLTOgFTGRhW7A4dnymatfGHOGnHi4oqj+0YtbD0Fm2dUDoA3sFTt0+vSRc1VfWRElrkphuIT0anmwnpy4H252pvM49zZ3ihkHRLHssXStWJYwPHFhHu9R0a2O58xx8WyuDFs7BSU1Gz8xSqbQ0rE6dHqf+N2ZiNDSCp4GLCAwDuDii/ruboEzwsVrld+Pa5A+MVp1Y/WhMOK1D6vD/XO6iFDjc7DkkZOVjAuEVp7Y4Fei1JTQzQWkDzN4nTcOlrv/v8B5kKu+HT1n6FVMMrQBfyepcORFAq8YzfkQh9u9sxA1YOVwaXS/DqNihOecesOr1E1ouF5wWgxDI4DyHoXlNAQd0fRtml0IJwbnn4X8ddANaflZFm+L5XGY4i5vl+zm6RcGTLI3amaUTmz3BA2M/PS7sRU7xfLFXBycQ9ws6RUen5ENYmC23NqCZc22twjm6Ti+SS0vUT/cJmUPfemlCkU2ed3vKeys0hfEN8achVPC1o03K7USC+lm9hFp5AhSKiSDFpTZwbVg0gyYupLGUfk8ZSqdjKG5Z1IsxxbbDRm9I6zLTkOnET5qnSbloIODXa9RmL2/EsRj8frRPoLP6lJ+Qh1kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199015)(1076003)(53546011)(186003)(6512007)(26005)(6666004)(6506007)(9686003)(38100700002)(83380400001)(5660300002)(7416002)(6916009)(2906002)(33716001)(8936002)(6486002)(41300700001)(966005)(4326008)(478600001)(8676002)(66946007)(316002)(66556008)(66476007)(54906003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnExWFZUbFBSVCswSTlmQXBYTGRKRktGUEV5d2hxSWwzTWhpOWNXT2h0Mk5v?=
 =?utf-8?B?N1pHZDF1dDZmUnIzVkIwaXFVeE5VK3NmMFlzVUdKRVdpaGNqYWdYcVBWZVNn?=
 =?utf-8?B?bTY5UGFrc3FzYlhrTnJjT3l5QlluTWxOYVFZa2hTNDNBblRybnhkTmhaeW5T?=
 =?utf-8?B?aGFUS3UwOXpoM2h2RnZyTDE2elBzRXU1YWlRdzZabDdxRVdKM2ZHQXhNL3Qy?=
 =?utf-8?B?SFAxMDZlbW5TTityZ3Y2b3NtaDVHMlRtNWxOa2gzZDU2MVFXK0o3SUQzcWtm?=
 =?utf-8?B?dE1rajE1MjNzdFozK0UxMHMxeGx2ZCttSWtlZnBtVllET20wa0Ryd0poR1Fl?=
 =?utf-8?B?dFhzVUNWa2JDbndkNS8rdmV5QVpoSURPTnJaSm8ycjJaWGJzT2hjT1dFaTBa?=
 =?utf-8?B?SW5MUEZLdjJndkdWQk45TEpnV2ZVckF4b014Z0U5amcxenFCajJWeDRsV0Vh?=
 =?utf-8?B?NU0xYS9DV1RuSnNwdFdkVlBZV1M4MS9GaTZBSUMyRTlUY3FyMXM4QWlLVHM2?=
 =?utf-8?B?dlBYUTczZ29SRWJZcVIzNnR2VXR6NjVZVVVIVWIyTXp1QnRDM0k1c1ovc29I?=
 =?utf-8?B?TitUNi9idnVOY3VERTc1WVpZdkN4S0xlVW1BYXVBUFpIQVJoVkhmS0hXL3d3?=
 =?utf-8?B?UDdaSFpuUERjYmtIcnFralVleEYvV05KTlc1Rm9OZnZkeEQ5Rlo5ejczMGhx?=
 =?utf-8?B?VDR1a3d2S3hPUFlZTncxNXpJVldUWkc1UzJsRW9lWnlOMmROWGdna01sWloy?=
 =?utf-8?B?c3g4RWlCUk5DL0VlK0Z1QjNLS1lpbi9GM2YrbUJRVjZDdnY4Rno5S1FlbUNo?=
 =?utf-8?B?dkFmNU9EMnd4Q1Q1cTlBYUMxQTBrVUpLYXRtWWE3c0wrUXZtQXNmN1pTa0pI?=
 =?utf-8?B?cnp4YnJmejVMWVBrZXFiVjEzMGs5YmpGMWE5VU1xSFc1cnZtelVOcVNYUHFr?=
 =?utf-8?B?ci9rVWpWc1J0TXNXTWpmTlkxd1pIZXdGQnVCWURvOWxEUmZsUFoyLzdNNEVS?=
 =?utf-8?B?V3Uyam9ZOFRSVnRYVHBrQkRhaW1sZFVBK0kycFc1VnJVNkUzZ1NhVEJ6eVE4?=
 =?utf-8?B?ZUZlZmRvandsdnl0bDNZdVl0R3QzZjgzalFGandlaXAxaFk1TDllNFcyVk16?=
 =?utf-8?B?dlpNR2pGRmRCY0Q1YjVtMXJiRG45MjNJNHBidWJzUWU3VVhhdWRNQ3FuU2xH?=
 =?utf-8?B?UFAvNy9KTk9jQmxOamQydFhQQWdqOUl4NU9rYkhzOEVpNFBnVHBzYVl6b1d0?=
 =?utf-8?B?RDNocnJ3cWU2ZkxYckFTNHlUSDhoYVZxSGNBc1VFREdKOXA2dkNueFFwWEZP?=
 =?utf-8?B?NnBNRUJzdStmUUMxVGp6eVZBa25xVmhVaExrSFk1WVJJS2hvM3d5ZGZ5QjhE?=
 =?utf-8?B?cU55cjJrVW5CdWdZZXhsZzhSTjMvUVg5eFFnMGtzUGRJQzVDcVA3enNCamtx?=
 =?utf-8?B?VEIyY1p1YmwvTXV5RVpKMkRoTHBwdGR0ZHNTNjRjYURLc2RpVEl4MkV2NjUw?=
 =?utf-8?B?ZnBBenZpL3BleE1Bd0RYUkl2SW1UeWE1OXVxSVNaeXpSYVNPVlFoUEk2Ukc3?=
 =?utf-8?B?ejk1d1JBMDVpSURGVzlIdVRSRUdJUzZkQ014MXpUKzc0MEZaTWJyQUxrOXJP?=
 =?utf-8?B?Skw5cnVoNUFSMDhlZFovOFc5OW9MVklwM3hIZ2RxQUcrL21KckRnK1hrT1Bn?=
 =?utf-8?B?WjhXZi8xYXQ2bjZLWm85dVM5MU9aem13cnhjaVM5dW82T1Z1U01mR3lvZXh1?=
 =?utf-8?B?Q3B1dW40dGMwb2VrZmVNQ3g0N0dHc0RyVzl1WXAyeHprdlBSTmRSVFpVdGV2?=
 =?utf-8?B?bUVoUFl4RGxFYzlkV0VMN3A0NHBEODNnV0tJV0VyTHgvWmtxMUQ0WEh6OXdx?=
 =?utf-8?B?N0xNcDBodGxRSUFBQ0Z4b0dZQ2FBNk5PTDRlK1Q4Tmp5OHRFWG9qNk52aXBk?=
 =?utf-8?B?bWk0V2ZqdG9LSC9Ha2s5akt1cjE1bVdzaDBSZXdTbW9BK2QyNDJ1WDRSMk0r?=
 =?utf-8?B?TnpMNjVHUkZBZE4zeWZncE5GMnpQN2VlTXZkTXJTTjhaWlVkMnh5SlZkaGhj?=
 =?utf-8?B?LzdhSE5MdnQ1Njc1TExlNGs3dnZpN28wWWo1R3JVMW83eG5sNkpWaUJtLzRG?=
 =?utf-8?B?Z20yZk1aRmVWWFpHQUlJZW9FTWxpcUtSUFJTdFhLTVA2d0s5ak5SK29WZWRa?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 275366f1-716d-433b-3db4-08dac0e8e42c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 17:52:52.1583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+rWe+SzECQVj1+fyp4YSe8RYTt//RUeXjYeYSlKQG0q03t4I28IA3I78MQ73GvqzZm0Nd5nLPtBpzK9YvLfirr+VZOPTEVoSQXTihOxQGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5784
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 06, 2022 at 04:51:39PM +0200, Oded Gabbay wrote:
> On Wed, Nov 2, 2022 at 4:23 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > On Mon, Sep 12, 2022 at 12:17 AM Michał Winiarski
> > <michal.winiarski@intel.com> wrote:
> > >
> > > IDR is deprecated, and since XArray manages its own state with internal
> > > locking, it simplifies the locking on DRM side.
> > > Additionally, don't use the IRQ-safe variant, since operating on drm
> > > minor is not done in IRQ context.
> > >
> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > > ---
> > >  drivers/gpu/drm/drm_drv.c | 51 ++++++++++++++-------------------------
> > >  1 file changed, 18 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 8214a0b1ab7f..61d24cdcd0f8 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -34,6 +34,7 @@
> > >  #include <linux/pseudo_fs.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/srcu.h>
> > > +#include <linux/xarray.h>
> > >
> > >  #include <drm/drm_cache.h>
> > >  #include <drm/drm_client.h>
> > > @@ -53,8 +54,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
> > >  MODULE_DESCRIPTION("DRM shared core routines");
> > >  MODULE_LICENSE("GPL and additional rights");
> > >
> > > -static DEFINE_SPINLOCK(drm_minor_lock);
> > > -static struct idr drm_minors_idr;
> > > +static DEFINE_XARRAY_ALLOC(drm_minors_xa);
> > >
> > >  /*
> > >   * If the drm core fails to init for whatever reason,
> > > @@ -98,21 +98,19 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
> > >  static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> > >  {
> > >         struct drm_minor *minor = data;
> > > -       unsigned long flags;
> > >
> > >         WARN_ON(dev != minor->dev);
> > >
> > >         put_device(minor->kdev);
> > >
> > > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > > -       idr_remove(&drm_minors_idr, minor->index);
> > > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +       xa_erase(&drm_minors_xa, minor->index);
> > >  }
> > >
> > > +#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
> > > +
> > >  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> > >  {
> > >         struct drm_minor *minor;
> > > -       unsigned long flags;
> > >         int r;
> > >
> > >         minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
> > > @@ -122,21 +120,10 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> > >         minor->type = type;
> > >         minor->dev = dev;
> > >
> > > -       idr_preload(GFP_KERNEL);
> > > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > > -       r = idr_alloc(&drm_minors_idr,
> > > -                     NULL,
> > > -                     64 * type,
> > > -                     64 * (type + 1),
> > > -                     GFP_NOWAIT);
> > > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > -       idr_preload_end();
> > > -
> > > +       r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
> This was GFP_NOWAIT in the original code.

Because we were using spinlock and idr_preload.
We're actually fine with GFP_KERNEL (and we could just use mutex with
idr):
https://lore.kernel.org/dri-devel/20220823210612.296922-3-michal.winiarski@intel.com/

> 
> > >         if (r < 0)
> > >                 return r;
> > >
> > > -       minor->index = r;
> > > -
> > >         r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
> > >         if (r)
> > >                 return r;
> > > @@ -152,7 +139,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> > >  static int drm_minor_register(struct drm_device *dev, unsigned int type)
> > >  {
> > >         struct drm_minor *minor;
> > > -       unsigned long flags;
> > > +       void *entry;
> > >         int ret;
> > >
> > >         DRM_DEBUG("\n");
> > > @@ -172,9 +159,12 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
> > >                 goto err_debugfs;
> > >
> > >         /* replace NULL with @minor so lookups will succeed from now on */
> > > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > > -       idr_replace(&drm_minors_idr, minor, minor->index);
> > > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +       entry = xa_cmpxchg(&drm_minors_xa, minor->index, NULL, &minor, GFP_KERNEL);
> > I believe we should pass in "minor", without the &, as &minor will
> > give you the address of the local pointer.
> >
> > Oded
> >
> > > +       if (xa_is_err(entry)) {
> > > +               ret = xa_err(entry);
> > > +               goto err_debugfs;
> > > +       }
> > > +       WARN_ON(entry);
> > >
> > >         DRM_DEBUG("new minor registered %d\n", minor->index);
> > >         return 0;
> > > @@ -187,16 +177,13 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
> > >  static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
> > >  {
> > >         struct drm_minor *minor;
> > > -       unsigned long flags;
> > >
> > >         minor = *drm_minor_get_slot(dev, type);
> > >         if (!minor || !device_is_registered(minor->kdev))
> > >                 return;
> > >
> > >         /* replace @minor with NULL so lookups will fail from now on */
> > > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > > -       idr_replace(&drm_minors_idr, NULL, minor->index);
> > > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +       xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
> > >
> > >         device_del(minor->kdev);
> > >         dev_set_drvdata(minor->kdev, NULL); /* safety belt */
> > > @@ -215,13 +202,12 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
> > >  struct drm_minor *drm_minor_acquire(unsigned int minor_id)
> > >  {
> > >         struct drm_minor *minor;
> > > -       unsigned long flags;
> > >
> > > -       spin_lock_irqsave(&drm_minor_lock, flags);
> > > -       minor = idr_find(&drm_minors_idr, minor_id);
> > > +       xa_lock(&drm_minors_xa);
> > > +       minor = xa_load(&drm_minors_xa, minor_id);
> Did you check this part ? Because this always gives me NULL...
> 
> I tried executing the following code in a dummy driver I wrote:
> 
> static DEFINE_XARRAY_ALLOC(xa_dummy);
> void check_xa(void *pdev)
> {
>   void *entry;
>   int ret, index;
> 
>   ret = xa_alloc(&xa_dummy, &index, NULL, XA_LIMIT(0, 63), GFP_NOWAIT);
>   if (ret < 0)
>       return ret;
> 
>   entry = xa_cmpxchg(&xa_dummy, index, NULL, pdev, GFP_KERNEL);
>   if (xa_is_err(entry))
>        return;
> 
>   xa_lock(&xa_dummy);
>   xa_dev = xa_load(&xa_dummy, index);
>   xa_unlock(&xa_dummy);
> }
> 
> And to my surprise xa_dev is always NULL, when it should be pdev.
> I believe that because we first allocate the entry with NULL, it is
> considered a "zero" entry in the XA.
> And when we replace it, this attribute doesn't change so when we do
> xa_load, the xa code thinks the entry is a "zero" entry and returns
> NULL.
> If that's correct, you need to either fix xarray code or change the
> flow of allocating this in drm.
> 
> If I send a real pointer (just a dummy object I allocated) instead of
> NULL in xa_alloc, and then do xa_cmpxchg with pdev, xa_load returns
> pdev successfully.
> That points to the NULL being problematic in allocating an entry.

Yeah, this was just using xa_store in previous revision.
https://lore.kernel.org/dri-devel/20220906201629.419160-2-michal.winiarski@intel.com/
And I didn't notice the CI failures:
https://patchwork.freedesktop.org/series/108206/
since I was originally hoping for comments on extending DRM minor limit,
XArray conversion was a bit of an extra.
Sorry about that - I just sent a next version using xa_store as a
separate patch (without extending DRM device limit).

Thanks!
-Michał

> 
> Oded
> 
> 
> > >         if (minor)
> > >                 drm_dev_get(minor->dev);
> > > -       spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +       xa_unlock(&drm_minors_xa);
> > >
> > >         if (!minor) {
> > >                 return ERR_PTR(-ENODEV);
> > > @@ -1037,7 +1023,7 @@ static void drm_core_exit(void)
> > >         unregister_chrdev(DRM_MAJOR, "drm");
> > >         debugfs_remove(drm_debugfs_root);
> > >         drm_sysfs_destroy();
> > > -       idr_destroy(&drm_minors_idr);
> > > +       WARN_ON(!xa_empty(&drm_minors_xa));
> > >         drm_connector_ida_destroy();
> > >  }
> > >
> > > @@ -1046,7 +1032,6 @@ static int __init drm_core_init(void)
> > >         int ret;
> > >
> > >         drm_connector_ida_init();
> > > -       idr_init(&drm_minors_idr);
> > >         drm_memcpy_init_early();
> > >
> > >         ret = drm_sysfs_init();
> > > --
> > > 2.37.3
> > >
