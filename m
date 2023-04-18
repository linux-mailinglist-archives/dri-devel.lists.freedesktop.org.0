Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD736E69B5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 18:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4DC10E338;
	Tue, 18 Apr 2023 16:39:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA39410E048;
 Tue, 18 Apr 2023 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681835937; x=1713371937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nANAdNIZ+HeLYeefw43jNAczsK13EoILJSOMzy92Ql8=;
 b=bjwTdMjBOp/9qiNYw6rkZ1Sn2a+Srn2Mtnkvk5XSRjgw3T6Nix1NSbL1
 kWZuTeJFx3bgfwMXVNEx/VzfGxjiDAdgjWUcORRzLV1DguIhFH2diSVpA
 Wisq4KuyNG4hJHihhXhTTcSVBjze+Qip9P+pk0vP9cNXe7O9lCkvjXii1
 AKBXAQmG82IxE6FiAbt4z8Er6w9rJIKVwS7FfzYsMa+gHBp9mtWBTbHlf
 BIPt0RqEWLROH1d3Bpm0R8XF+LQEkXLh/Zr3gwkOWz4NkWHGWD2IuhhrM
 SPmooUIxhRXxDTsQXkmpdk7IQ2swwPUpBa4Lw/V7sWzTCfHLjIw920LzQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345221477"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="345221477"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 09:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815270908"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="815270908"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 09:38:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 09:38:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 09:38:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 09:38:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 09:38:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLV8R303F9Qte3EaLGC1JmeNlQP/6QUYTfVvzCuLTvjWEDj35AHbU8NA4/IZMXr8SAWDI8baqD9UhT4utoCUi+/pIqz2/FamXtZU90b5LkeZDycAXay2cEUOMrrgMOUl+ofv3RQCKB8GLedCTH5q6InVzjoY7hMtjFVSlMno21Rrp9WSTptjPg4mI4Tjn3bQcLu7nwSkAKTQxHVWVecp/ltDZIpAlRl2PCWNWUQxJ00VSh9du3GInNX+kggyP9/Gj5YhaH2i5YdmwF0/YH4WljcPx8EtF6etIYsO2Z7KW2vz7AjZ+xSUH3W4LezVvkb9JYs0bk/JK0ug/7pQ8VqLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9ynZkJzRju6ePeoyNJet13U8zlYLylHWOyx9R29D6s=;
 b=N7+d1zYeI4ovutPnNqzV4Z3D4dj5fcMV9QE5DVtYtIjdp6KikDL65EE4RIcWQUtrfVfup5eiKy0ecGrJyu6fSLbQjhVxbYHodOtKsRGntJ7dolzayT0rT+oniAPNJLkrKz7PiFCdYvA4PXUPuVN3+YNKvrSYmBnjjAf17iGCo2yzZnZpIOMI1r8Jw9YFrfPEya6VGFnI3jOj9hr9QcMaOJqDJjVpMyd9Ue9KW0u2B50TIoMJZPzGb0XhSucWuTr3DfyAZ9cA0gmsWVaQchZEJ/ne1dbnSnDX2ZOryMvWSYubZ34gsBiGnZnQDBqaPJV+/t3znEXrxC+UZ+fyZlJk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 16:38:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 16:38:51 +0000
Date: Tue, 18 Apr 2023 12:38:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 0/2] Add support for dumping error captures
 via kernel logging
Message-ID: <ZD7Hl3ubfmZD1H9J@intel.com>
References: <20230410192523.2020049-1-John.C.Harrison@Intel.com>
 <ZDVxocPZR1Ad2QLa@intel.com>
 <f4c5dfbf-6dc2-52cb-c31d-c6e78646bcac@intel.com>
 <ZDWP7TRexJRphUNQ@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZDWP7TRexJRphUNQ@phenom.ffwll.local>
X-ClientProxiedBy: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 398e3f33-3d79-4d3c-8ac0-08db402b641c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j8OCeE1pmeMPxM+gJi6jylH4BsvnIbvjB5ESPoDftLqxHZCJyOpAEjv5CYsYNVIXAWT5tfvoZay9wfLQU0baew9RjpbSLVoRJ/RHdSG5VV2KWgPsVIqSEFyq7GtfCc+oVyFRmPaJI1siID3jh4j8Idn3z2d/+xfq3QAiHk074ZUQUWsNOlJPi4ZuVVLsxTlYGuJ1PQUVQKmBe1q3fa65X2n/eiT6deFquB8/UWpA2+BikdDWxzIWuSzdLf/PdkSy5dbtpMPd1Gzr4GzanBajrx7LPKvpvwNQWWAgNFg3qVPw6oUHA2d7BtEXre+iXR9MdxXQrfu7DtVn4Fjjf8zRjXTneaWCfU/wQT4nZrmsqL8bHzBgSVTv02evNcfxIFu2AFI4QFqdGge6L2eqb+dh5wxtvh7QRlXXt3XAregNZruqq+xEWrlfxZXnv8sdOUayCQHzpyftvi6J+6wjQW7I9wxQRA5ZNnKL0HkanuINDC7dCk9jz30ySkrKLbSM6aAE6/asV+8Pf+1X2TqQmg5tcs6UEkCcXOPrnuznh5kz+aQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(83380400001)(38100700002)(2616005)(6512007)(6506007)(26005)(53546011)(478600001)(966005)(6486002)(6666004)(66946007)(6916009)(4326008)(66476007)(66556008)(316002)(44832011)(86362001)(186003)(36756003)(41300700001)(8936002)(5660300002)(8676002)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxeMaAhqi+nOtk3df4ruu2/Pwkr+ePAEN2l1PamkX+C3y5cTISy7klfNyYl+?=
 =?us-ascii?Q?fLA27MF3ycdl6GIpRJDCf4XDdIY+OQxBUPm2x9WHJ6xSyoPgCdZIfK9nR6Yg?=
 =?us-ascii?Q?7j4Sjre1azWYJGS+Pz89bnBz7ReH8dRPRKm+Exqs4cliVvDokKpVxkM4jNxB?=
 =?us-ascii?Q?+WkNEbB9UDk8+nKo9/ut+NbsKw9IO1nZdg/Gq7sHUr2VcaH1WFWG2GB0us+V?=
 =?us-ascii?Q?9qzAZFQD7ewr46tFM/gZ1ywJkGIDRUtaasMkon5rv0TGu7/3vfBcUjZor5ZU?=
 =?us-ascii?Q?agMIG4Ne43pXGTy0zIAHDK22LOGQ7iuU4dIG/XX3V17sCl6jkh61mdkNpAmQ?=
 =?us-ascii?Q?+OK+1VzWbaIBROFDYfMGeWcg9PEmr/AQ71gisb4GqPAmrNqAFY4QdHfFVYCw?=
 =?us-ascii?Q?Vm6lg3GaVoCKXCdCi5kLQKOfhGfskn1hqAekK3nAtG/H9hMLvDxoH5IM9wir?=
 =?us-ascii?Q?TMFqEvre1mJYftrC24VtaACOHJT3XFrT69B6lVXCwDS78jC6A9CT0R/Blayk?=
 =?us-ascii?Q?/LdRVgEQxT+gRCVVD378tKGUeuhFl0TTD1kniPr1ldSzGiNwfO7ImWVZXDR8?=
 =?us-ascii?Q?yjd3TEP4LUmahdq0+6vkUNxlsHdOLynmniZOlvGnxTl8O9ahfPyxpARLRaU9?=
 =?us-ascii?Q?MXokWf3uJ3XTB+hXwXc9e+PqQUWQaAu1FxG9JausoZjVL29fyzaOVx89xsbI?=
 =?us-ascii?Q?ejKZ0i8MNmIaF7vFSjQsQkY8F/yNR7Y3n3SYyj8kXPPlBFzVnF/RVV4kKDQ7?=
 =?us-ascii?Q?GmFhEY45KusIzaReY6QaHRlVRhkqBmQJQElu52DLmDpVZ1JpGw8Sd1Zn3w00?=
 =?us-ascii?Q?I2uVc0fekvsqJTA90Z9xLbtmaeDchnB0yXYkyezIW7w9s2JX8S4KLeCIil2A?=
 =?us-ascii?Q?vQn9zY/vLaPUaLQ1FRd0R++60WevGAbgM6B/9xVWDgpxuQgMUqbqBttJ/3d7?=
 =?us-ascii?Q?5zxrDesWHHRUluYIP68VOcj44ciEZqXAgVil5oA4tjoyhpB5blG75hTzlqsQ?=
 =?us-ascii?Q?vJZqa5O/XAUmdYl7YpppElNuSYTWKIhdz9DLojQseBoTGxT/3WiE+l9bJcL5?=
 =?us-ascii?Q?hqSPAm5IxhEFMWpNR3ieLAmgivABOP+cBxnKIFGb5xDb1lYniBm7up4w90RD?=
 =?us-ascii?Q?VNU+Dp4iLwPxevMp0zda3KZtgMLdgDzwooFpedcz1A4Wi5TtzuJ8vZrVq2M2?=
 =?us-ascii?Q?Q3FuIECcqRGYNqrnA5NqemhT0KbyqnBxOdgvvh6NyWNzzDJ6ugLSNoh0+Kxw?=
 =?us-ascii?Q?rjY8ZPdoCyTXF0woml4DbrVULUF6PIO4PTwDzefH3zLT8HmFMbFvHjXWpJTH?=
 =?us-ascii?Q?MK+BG39J0Cw917oJgPAueAI1UXfEqoxdqU89D2CYKgQxJjdiw7xd3DZ5iPA3?=
 =?us-ascii?Q?EKe3x22Yv5Zz6YpSPo0ZFQVQOypwJlaggOJVeerV47zFBXmzTLVyGdMMBK3f?=
 =?us-ascii?Q?NPdtx0boT/NR9zz4sVpRGzPYqJltYZJkE7gD5cAbD/ZbKTC1y4B6Qied8e5X?=
 =?us-ascii?Q?xmybkRVq2YFp3Qjax/PIBNlQFn2m+8YDT1RbHATgvwUz4Gb9G8hbmO9+p+d6?=
 =?us-ascii?Q?XW7lGsa4xPHu3b1g/PdojK90QCtbG4it4ZrWfh6ejYtW2MIR4Zl0DU4O+DBF?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 398e3f33-3d79-4d3c-8ac0-08db402b641c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:38:51.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJ0X9bBbtAgE3/LtPZ9U6FTB68L5xD7ZZ9YCtk3wpWRiXIqpNjO0BQWmUTmn5BcqoJ3Wqbczq+3Gy+ar+vUH/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 06:50:53PM +0200, Daniel Vetter wrote:
> On Tue, Apr 11, 2023 at 09:41:04AM -0700, John Harrison wrote:
> > On 4/11/2023 07:41, Rodrigo Vivi wrote:
> > > On Mon, Apr 10, 2023 at 12:25:21PM -0700, John.C.Harrison@Intel.com wrote:
> > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > 
> > > > Sometimes, the only effective way to debug an issue is to dump all the
> > > > interesting information at the point of failure. So add support for
> > > > doing that.
> > > No! Please no!
> > > We have some of this on Xe and I'm hating it. I'm going to try to remove
> > > from there soon. It is horrible when you lost the hability to use dmesg
> > > directly because it goes over the number of lines it saves... or even
> > > with dmesg -w it goes over the number of lines of your terminal...
> > > or the ssh and serial slowness when printing a bunch of information.
> > > 
> > > We probably want to be able to capture multiple error states and be
> > > able to cross them with a kernel timeline, but definitely not overflood
> > > our log terminals.
> > I think you are missing the point.
> > 
> > This is the emergency backup plan for when nothing else works. It is not on
> > by default. It should never happen on an end user system unless we
> > specifically request them to run with a patched kernel to enable a dump at a
> > specific point.
> > 
> > But there are (many) times when nothing else works. In those instances, it
> > is extremely useful to be able to dump the system state in this manner.
> > 
> > It is code we have been using internally for some time and it has helped
> > resolve a number of different difficult to debug bugs. As our Xe generation
> > platforms are now out in the wild and no longer just internal, it is also
> > proving important to have this facility available in upstream trees as well.
> > And having it merged rather than floating around as random patches passed
> > from person to person is far easier to manage and would also help reduce the
> > internal tree burden.

Okay then. As long as it depends on some DEBUG config which depends on EXPERT
I believe we have a good reason.

I see the second patch is indeed protected by CONFIG_DRM_I915_DEBUG_GUC.
It would be good to do something similar on the patch 1?

> 
> Note that Xe needs to move over to devcoredump infrastructure, so if you
> need dumping straight to dmesg that would be a patch for that subsystem in
> the future.

devcoredump is a nice thing and it does deserves a bit of improvements
to be able to catch snapshots and all, but for this case here I believe
that the current devcoredump infrastructure would already be enough.

It would be only a matter of doing an immediate print to the dmesg at
the moment that devcoredump is created and this is inside the driver.

But yeap, that would need to be protected by debug/expert kconfig.

> 
> Not sure how much you want to add fun here in the i915-gem deadend, I'll
> leave that up to i915 maintainers.
> 
> Just figured this is a good place to drop this aside :-)
> -Daniel
> 
> > 
> > John.
> > 
> > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > 
> > > > 
> > > > John Harrison (2):
> > > >    drm/i915: Dump error capture to kernel log
> > > >    drm/i915/guc: Dump error capture to dmesg on CTB error
> > > > 
> > > >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  53 +++++++++
> > > >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |   6 +
> > > >   drivers/gpu/drm/i915/i915_gpu_error.c     | 130 ++++++++++++++++++++++
> > > >   drivers/gpu/drm/i915/i915_gpu_error.h     |   8 ++
> > > >   4 files changed, 197 insertions(+)
> > > > 
> > > > -- 
> > > > 2.39.1
> > > > 
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
