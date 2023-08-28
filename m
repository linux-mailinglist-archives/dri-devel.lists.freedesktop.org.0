Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B82378B9F5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 23:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C7A10E35C;
	Mon, 28 Aug 2023 21:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5F10E35C;
 Mon, 28 Aug 2023 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693256895; x=1724792895;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lcM+LHvOkmo6sWMHKJ+9zskTuvt7dSJAudcoXRMm8xw=;
 b=TBjasLexas9MmE8HVnjzi6kenqEwIXxU+AxmTu0A1q0eUHqSreqdD8MI
 suK4UGFh5w/MB3mfX98kYo2lFSWxizxvZHNb/WUYvaslw/g7we/isjSLa
 05K29I9zZFWsW15pWl07dkGWzBmw4W6DXBjo7j4AXKIKb7thnzPYiucIx
 iL5ZUKRO7QVtryfZ6g1WWQjI/Qpf1vSVToLBfgbIxHRQEbUrVHMkA3mYT
 6hOlK+fn4sG5mTrC+85uqDmGkL8+oh6ZVyxWVDyD6R4LXBzLB4O1OGEw6
 xs+AsQuDgGFlLaeNaMMo001frcfV84JBgrt3p7sheAw5ZtslBxObFJ7LH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="406202298"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="406202298"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 14:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="767823763"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="767823763"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 28 Aug 2023 14:08:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 14:08:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 14:08:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 14:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeXrE/yT90Wf6g9LtvVe2yNkFLeiRMZp8a/nClzSITu051KIl13JM7L4EN+UebOGui0+5621lzbOxpU96nu87PswXkqREYHbVk3Yh+J8eAp0rJ2ZVoC2RHyY7IFBzDwTHEl3hStPRz14FeB7j9ZZSbfeYYFnyP4CxnnPSH6758Xbh+DQK+RNnb+EQQWqvyA8ZR41/rAKkn6/GKv7f/pWxenSfyIS+3ZVKuADFLWp+mAZ7tuVb2HjIi2ZAwdirv/ZNOCsm0tNtQLxyiTyUhhXG4W5GddtxTBFkYkoglpRjws9pUR8gVuVgQfBtxdUxDU2HoMC9BFki8RVi71US1Dviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cnSTUi0LVcVbtJz2JbtNQ5Gq7jlOpQikx+T+aG4Pqg=;
 b=WkKkc3TQ0n/dGn0vN/+EdZ2yYe9lF1pZLX1erwpdqxyVAh3+9O213utNv7I3Ih4PsZ1L10w45652nAUpKjEeYGHCN/ak+wGNd1W0bR7wdx+qneVgmjW4/zyanzuOmaHcTXer7uZnsfdNSeUslmFgaP+7u0socptKgcVOuWgpUpIqkKwX8Xwjy0XgUIwvEiRpCWheue1dp0eoZTssOCFLU/mrfxop3a6p0IT6noU5HpM/pYYm8FAP+V8d/i43ZnjWHeCcHOy7HRYk9VDRMlETZTNrAaFp3U1D1blSft8OreX92VTWpBuNI/+JaZECq2CixIVCZqCA/z6TIf7HDyWj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 21:08:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 21:08:08 +0000
Date: Mon, 28 Aug 2023 23:08:04 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: James Zhu <jamesz@amd.com>
Subject: Re: [PATCH v6 1/4] drm: Use XArray instead of IDR for minors
Message-ID: <6qcxpntlr36itieyoyebsncwdv4vadr5ac7imgl4rdemoyedvp@a3m7l32pkcnf>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-2-michal.winiarski@intel.com>
 <10bb9689-9226-d47c-4cf1-7bf9d599456c@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10bb9689-9226-d47c-4cf1-7bf9d599456c@amd.com>
X-ClientProxiedBy: BE1P281CA0281.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c283668-428e-46fe-4bba-08dba80ae0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yf4Fw3lAmjGvFua30OG4s8sHOD6s2eO3vTxsSoS+jHjyX58T6ekCzaRl0s6DKR7/pIYuQrpb+BnvM2/kiEffsnVQ6qaxI+S4fB/MTtZkLWgxj7AFljWtLwvL0kT4t0uQZcM181wy9mNYXa30Y4W7t41J8MS32M8zOh5t4XyDhnzBBHZs0W2MgaH3MZrS2D8cxD4wj7vpUvkrXXo0hOXWxGNxvEaG/oKoy7f9F0RBsGJz+MisYGN1CdzmU6k0e4Rdk1KZVTn4o/QESTqamgnAudw/kSsiKmqbXgoxzQkIlOR0VbXgtW0a2Uh1zjLtnkpVBR5lSmvaDvB5qje4Wv1Z33DZaU7LQZ9klPEqxtvqD/7UGWJaDfTCxuDUsNtIJMRKg4TN1MfwkpogAk8lvgM9nh2m9ZycNLb0AFvw9r4feRSi0HQLGi9LbTi008v59KE1Wr5kL5vY4zJAfBK50faYxvpnKdv5C6X4cuGAP5k0PUyHul80Thce17Q9MGdZGJ8RLFKQg0ZpKpeiEP/KNo0QJY2p1cWC3sbKwGudTaQjdJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(136003)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(478600001)(83380400001)(966005)(26005)(6486002)(9686003)(53546011)(6506007)(6512007)(6666004)(86362001)(82960400001)(2906002)(7416002)(316002)(66476007)(38100700002)(8676002)(4326008)(6916009)(33716001)(5660300002)(41300700001)(54906003)(8936002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlhScXlyYldiWTc1cWc3U1VMUWFqeU4rMmcxbHBQYlRVY3Bsb0RtWGdnQWN2?=
 =?utf-8?B?cSthUE1vVnF6UVhpd0RZeUhFK2gzbWo3YUxMUTV3S1NQTFRDSE1kbU1zUnFU?=
 =?utf-8?B?RWVITVoyV1l0NEV3Ty9pd1FxVUprRnFpMjE1ZEZFQnMvT1h2TFdIbFJIaUN4?=
 =?utf-8?B?RUxxU3hRamhXMzRrNlRGVGJ5cytjektRdVJOdm5pNHIvN1d0Q01ZQjRYekNG?=
 =?utf-8?B?YWY4N0p2dCtpbU5KQytPQ3lOUEFzekpVMzU3S1Uxak9PUUJINUdQaXlHZlQ5?=
 =?utf-8?B?YWpSVUhoa2V3Umxqa1JTK3ZrZXFpckFTNjREdlRDRE41RUNEcW9vei93MDUv?=
 =?utf-8?B?QUJYUHgrMnRjd0tJMm02b2J3ZU9jbEkxbXEzVGtwb1REWHRUdUE1VDRHaGQ4?=
 =?utf-8?B?OUNqTDAxWnVlY1lTUndzYkw1eUtMQkI0a1BHMnMyOG1lTjVMSDh2ejIzbkta?=
 =?utf-8?B?R3FKbW5mL01CQmIrSm5rdXNOWHpwYTNPYk9WTkFXSWtybCttZCtzME1NdlJ4?=
 =?utf-8?B?bU1BSldHRitIcFNadTZQcDUrclpBVzRyRnk4aXlGV1MvMW83djlqemtmVkRk?=
 =?utf-8?B?eUNCQkY5bmRmVFNrRkh5RDJkNnQxSmUwc2lkdElsTkZkUnd5OEk5aU0xT2dt?=
 =?utf-8?B?ZnBKZ0pyK2FOZ1cxLzVDQ1hQSUY3MDNUbkViQ3FMYmY2RTY5SVhKUHpzYW5J?=
 =?utf-8?B?Zk9nM0JNTGM3ZGhRcFhwN0d0cFY3T2tPR1BtcXA5c1dxdjdDeTYyVWNGUmdG?=
 =?utf-8?B?NmNqZHZQbFZlTWtCZFB1RTMwbTN4QlZrbEhPSS92alZwblBuWFJwakJPQ21C?=
 =?utf-8?B?aHA1RU1OblE2NGMveWdlRWRjMytXT0hkb0J5WlhkTXcwMlUra0ZWa25yZmtR?=
 =?utf-8?B?V2p0eWhWdFJNYUM5bElKTno4V0hKU01qcnBRdysrdkpMN0psZGZ5b0J6czBU?=
 =?utf-8?B?bWo2NFdZYUlhSDRkVURPTTJZOTlNWjZBNnVkQ2Ftb2hRNTVDUVkvb20vdnAv?=
 =?utf-8?B?aFpkMFFBMjZCUjAxajBiZlpoMUlQWXRHMXNRQTNHTnYrUVFKVGpWSjI4ZWp6?=
 =?utf-8?B?ZjFzT1RodmhMeHN6Y09hbTM4NGsrTGVLWXA4QXZPU2c3b2VXRWZBWmZHemRQ?=
 =?utf-8?B?SU1yT0dlQytDMUptRXkvTml2Uk14ZzlkS25FN2FVbktteG1DZGE5MHZGTzQ2?=
 =?utf-8?B?RTVFSU5MT2hxZzU4NVhnVUZCZ2NXbURaY1llNUYzZjcrZThmM0N0K20rVzZz?=
 =?utf-8?B?T05pQzAyRUlEM2dCSmFQeWJTVmR4SkNJd2kwdmdEbGlNTjBUbitGZWpMaDFJ?=
 =?utf-8?B?ZG4xUTR6UGR2dnV0RVpvaHU0bzJVWjg1c2M2bmlUcENGOGx0azIzRlFMajF0?=
 =?utf-8?B?aEt5Mm4rZmhxQnZ1ZWc0eHo0cEJZc1F0VUhEb09VUUtHQkJsaEMwVjVMYjVo?=
 =?utf-8?B?TklWMEkvOElPYWNYVkwyQ3c0b1VEMGxnWlFwZDVRNkFjOVo1RVZjU3AyUm41?=
 =?utf-8?B?eklpV3d4WlQ2dnN0bVFwVmtpS01aQ0w0WW1ZL1A2czlsSVBtZmJxQjNLeXpB?=
 =?utf-8?B?cmpzVmlNNTNma1ZaUThWdHNnMHpSbTI3TzdHSldZR1BYRkFYdnQ5OStPbTBE?=
 =?utf-8?B?aFZVaFJwMGdHZURPL1BucFNqWG1TWmQ3M0VWaERiVGl3Z3l4eElOSERQaFFT?=
 =?utf-8?B?UzdVUFd2RURyUGJBMWdURXQzZzI5cUQ5d0lvelRjNmFoOUxxaStKNUNwZlRK?=
 =?utf-8?B?dnlqU2R2YjdIb3g2R3VIMndsSHJEVHNXSVZRNDUwWVp2UTE0Tmp3TkcxUnhC?=
 =?utf-8?B?a2JmQUI2dFB6Wm9uYWt6aEJlMUxsOTlYb3krWXcyUUF2Rm1xdWhYdUZkOEJQ?=
 =?utf-8?B?bThQbGNPeWQ0WFZIM0RydUtQWnU4akcwMkxKbnFDQ1BuQVU2VWZOaHlNRWh0?=
 =?utf-8?B?d1JlaHBJTmxXbkUyaTBXUHFPWE5PL0Y4TEVEakk3SWowUlA3S01OL3RzM3o1?=
 =?utf-8?B?WlJoZFZPQ2ZDWW80Ymw2Qi9oUm82dlYzL091Ui95KzdvQlpNV25yNVEwRXdE?=
 =?utf-8?B?QnV6TzZNMjlhSUpHYTJCbktZQnlzbmYvSlFHY2FUUmU5WkRnVXBkMHU0T0Js?=
 =?utf-8?B?M29MNXE1d21CZG1CVCt0NmVQb2pVVGc5NVZUL0drM1FHZGozdFE1amliaVJK?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c283668-428e-46fe-4bba-08dba80ae0c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 21:08:07.9178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIAqV/k/ZB3UABKT+L5/Lr5JujvU55ZwfJsv+yIbM6uSKb/FrNS0XSKaFz6BxjQKi5sHlu62UbjBBbhfDUgpww30yHhDUZq1PtVrOlZNfxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Emil
 Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 James Zhu <James.Zhu@amd.com>, Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 12:59:26PM -0400, James Zhu wrote:
> 
> On 2023-07-24 17:14, Michał Winiarski wrote:
> > IDR is deprecated, and since XArray manages its own state with internal
> > locking, it simplifies the locking on DRM side.
> > Additionally, don't use the IRQ-safe variant, since operating on drm
> > minor is not done in IRQ context.
> > 
> > Signed-off-by: Michał Winiarski<michal.winiarski@intel.com>
> > Suggested-by: Matthew Wilcox<willy@infradead.org>
> > ---
> >   drivers/gpu/drm/drm_drv.c | 63 ++++++++++++++++-----------------------
> >   1 file changed, 25 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 3eda026ffac6..3faecb01186f 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -34,6 +34,7 @@
> >   #include <linux/pseudo_fs.h>
> >   #include <linux/slab.h>
> >   #include <linux/srcu.h>
> > +#include <linux/xarray.h>
> >   #include <drm/drm_accel.h>
> >   #include <drm/drm_cache.h>
> > @@ -54,8 +55,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
> >   MODULE_DESCRIPTION("DRM shared core routines");
> >   MODULE_LICENSE("GPL and additional rights");
> > -static DEFINE_SPINLOCK(drm_minor_lock);
> > -static struct idr drm_minors_idr;
> > +static DEFINE_XARRAY_ALLOC(drm_minors_xa);
> >   /*
> >    * If the drm core fails to init for whatever reason,
> > @@ -101,26 +101,23 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
> >   static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> >   {
> >   	struct drm_minor *minor = data;
> > -	unsigned long flags;
> >   	WARN_ON(dev != minor->dev);
> >   	put_device(minor->kdev);
> > -	if (minor->type == DRM_MINOR_ACCEL) {
> > +	if (minor->type == DRM_MINOR_ACCEL)
> >   		accel_minor_remove(minor->index);
> > -	} else {
> > -		spin_lock_irqsave(&drm_minor_lock, flags);
> > -		idr_remove(&drm_minors_idr, minor->index);
> > -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> > -	}
> > +	else
> > +		xa_erase(&drm_minors_xa, minor->index);
> >   }
> > +#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
> > +
> >   static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
> >   {
> >   	struct drm_minor *minor;
> > -	unsigned long flags;
> > -	int r;
> > +	int index, r;
> >   	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
> >   	if (!minor)
> > @@ -129,24 +126,17 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
> >   	minor->type = type;
> >   	minor->dev = dev;
> > -	idr_preload(GFP_KERNEL);
> >   	if (type == DRM_MINOR_ACCEL) {
> >   		r = accel_minor_alloc();
> > +		index = r;
> >   	} else {
> > -		spin_lock_irqsave(&drm_minor_lock, flags);
> > -		r = idr_alloc(&drm_minors_idr,
> > -			NULL,
> > -			64 * type,
> > -			64 * (type + 1),
> > -			GFP_NOWAIT);
> > -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +		r = xa_alloc(&drm_minors_xa, &index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
> >   	}
> > -	idr_preload_end();
> >   	if (r < 0)
> >   		return r;
> > -	minor->index = r;
> > +	minor->index = index;
> >   	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
> >   	if (r)
> > @@ -163,7 +153,7 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
> >   static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
> >   {
> >   	struct drm_minor *minor;
> > -	unsigned long flags;
> > +	void *entry;
> >   	int ret;
> >   	DRM_DEBUG("\n");
> > @@ -190,9 +180,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
> >   	if (minor->type == DRM_MINOR_ACCEL) {
> >   		accel_minor_replace(minor, minor->index);
> >   	} else {
> > -		spin_lock_irqsave(&drm_minor_lock, flags);
> > -		idr_replace(&drm_minors_idr, minor, minor->index);
> > -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +		entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
> > +		if (xa_is_err(entry)) {
> > +			ret = xa_err(entry);
> > +			goto err_debugfs;
> > +		}
> > +		WARN_ON(entry);
> [JZ] would WARN_ON(entry != minor)be better?

We expect NULL here.
The same one that was previously stored here ⌄⌄⌄
r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_EXTENDED_MINOR_LIMIT, GFP_KERNEL);
in drm_minor_alloc.

> >   	}
> >   	DRM_DEBUG("new minor registered %d\n", minor->index);
> > @@ -206,20 +199,16 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
> >   static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
> >   {
> >   	struct drm_minor *minor;
> > -	unsigned long flags;
> >   	minor = *drm_minor_get_slot(dev, type);
> >   	if (!minor || !device_is_registered(minor->kdev))
> >   		return;
> >   	/* replace @minor with NULL so lookups will fail from now on */
> > -	if (minor->type == DRM_MINOR_ACCEL) {
> > +	if (minor->type == DRM_MINOR_ACCEL)
> >   		accel_minor_replace(NULL, minor->index);
> > -	} else {
> > -		spin_lock_irqsave(&drm_minor_lock, flags);
> > -		idr_replace(&drm_minors_idr, NULL, minor->index);
> > -		spin_unlock_irqrestore(&drm_minor_lock, flags);
> > -	}
> > +	else
> > +		xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
> >   	device_del(minor->kdev);
> >   	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
> > @@ -238,13 +227,12 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
> >   struct drm_minor *drm_minor_acquire(unsigned int minor_id)
> >   {
> >   	struct drm_minor *minor;
> > -	unsigned long flags;
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	minor = idr_find(&drm_minors_idr, minor_id);
> > +	xa_lock(&drm_minors_xa);
> > +	minor = xa_load(&drm_minors_xa, minor_id);
> >   	if (minor)
> >   		drm_dev_get(minor->dev);
> [JZ] why minor->dev need ca_lock here?

We're relying on the ordering for acquire/release (previously
guaranteed by the drm_minor_lock, now by internal XArray locking).
xa_load doesn't take xa_lock internally:
https://docs.kernel.org/core-api/xarray.html#locking

> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +	xa_unlock(&drm_minors_xa);
> >   	if (!minor) {
> >   		return ERR_PTR(-ENODEV);
> > @@ -1067,7 +1055,7 @@ static void drm_core_exit(void)
> >   	unregister_chrdev(DRM_MAJOR, "drm");
> >   	debugfs_remove(drm_debugfs_root);
> >   	drm_sysfs_destroy();
> > -	idr_destroy(&drm_minors_idr);
> [JZ] Should we call xa_destroy instead here?

We could, if we expect the xarray to potentially not be empty.
From what I understand - all minors should be released at this point.

Thanks,
-Michał

> > +	WARN_ON(!xa_empty(&drm_minors_xa));
> >   	drm_connector_ida_destroy();
> >   }
> > @@ -1076,7 +1064,6 @@ static int __init drm_core_init(void)
> >   	int ret;
> >   	drm_connector_ida_init();
> > -	idr_init(&drm_minors_idr);
> >   	drm_memcpy_init_early();
> >   	ret = drm_sysfs_init();
