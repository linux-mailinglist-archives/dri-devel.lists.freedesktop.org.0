Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F989E0B5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 18:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7556610E61F;
	Tue,  9 Apr 2024 16:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XITC52J3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6894112E17;
 Tue,  9 Apr 2024 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712681127; x=1744217127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dNmPCwcZRmBUibE/WG4P/ZEFwUTqrWj6HD7X69r+1Ao=;
 b=XITC52J3A58BTkCZCyo4ErJS+R3Axad8eYmcXMNDsp/hA3l9wnIWR2OL
 H9AgwN4xgFvqJt6o0v0dT/zJUdnA+KiG79rBJgA/Bs/xMvqJOHHjzcGaI
 II7RTSt24fCAzH6iLnlXata7xX4Jmm09EPwqyHi8arRys4D7cJB42DQQg
 PYqQ5wh2bbptCKibIExCqi+eDofaIUHJfEZQRDaRf62zaYbpvj3a46Aar
 AeYSnSEqpCbh13OEW2pdE05H+CDp4LL0uOA30AkLMJO9UP8zAwnVMal4P
 An+9PmLh6X9VR5ScCfp7WtUTnfYJKU+rb98Lp7N0AtP/FAdHUV4Yh+voz g==;
X-CSE-ConnectionGUID: 9Yvo/MEzR1eeaTqpK7wCGQ==
X-CSE-MsgGUID: bvUSS0mWQ+yZMervuIm/XQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30493173"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="30493173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 09:45:26 -0700
X-CSE-ConnectionGUID: Br/0HDN9RoyxJNRffGz57g==
X-CSE-MsgGUID: hc3t45n/SRyz5HUdjxB1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20750211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 09:45:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 09:45:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 09:45:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 09:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBPq45DIt9fD8HiUWMXtjniAANjfznOJv0qvYgOH1SDtp/Y400qpS/5/hkNORyNclVWFs314klb/lNC3DTMinFxUIvtpw+J0QvbfGNsuV8LcdpuDOq5n+ZW9xXr45F4PZJFpqkpV8YLOaWruEtEayAfdJwwgydDfA3n63zuLkfBLM1fWxIuOU00tspru5M2eOYFR+5u09U2tNZY85X1RAg6YSlyLRcKi4nnqgsOPNPhBRuMmLLYFrHWRqy5/28FDeN0dx8lkSTxxS8i2Mags+c9jH8J71cBSOjps/iyPkGbBvsRDYh0X/VfoJMQxs6W6RgEGkgY4llor2UboaXTZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNmPCwcZRmBUibE/WG4P/ZEFwUTqrWj6HD7X69r+1Ao=;
 b=B8hlEtenPnO6uxr7jkWTGkVSc0mXMAeEtwZXFk51r02xp3JRzL1aNPdBUEyq6kOmqygAeB3cYBQJgL8F+7wOdCyRRpeZno3NpXCFG6whibBaC0gcd2T4EQDUE6rMnev8sEbXwqR/kanmVnBI7DX9Bd83C40UxN33tjNMc1hePN30+MFkBqcQ8wcqjhw1ZXcnCj6e+UZLoB+8VrTdYBLr6I89nmt+Jkn9PfDMFrdho4gx0IgBLi6pteZmstNDLwgV4GiAWna607KKboaFpuqMMRSiNscRd8keT2WFp7eFLEjFxONOeEjDooUQCISTH4m7EDFGtaj5hWv44/ZzGVcxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 16:45:22 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 9 Apr 2024
 16:45:22 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Topic: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fCAALG4gIAAI09QgAA3bwCABhSRIA==
Date: Tue, 9 Apr 2024 16:45:22 +0000
Message-ID: <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
In-Reply-To: <20240405180212.GG5383@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MN2PR11MB4726:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lNdEJMrH24NK0wnICtgwBBElKpfrCYDl4sFID59tXq8A6x1yTY6Ocgbl2F4mbuKY552G/AsuMliiO3U10kZzjoM6lUsrWaJZYn7d0cC1RyFYPH63jUO/WWJBE+0Qvw5jtpwcitOLptNYVLdezrpN05/N5RSdV0mm4qRgK28sj2gKbYmSmG13dE87wXr3GjAHUhtUdOI5sBD757ZMF02ozxk+bHWF1q/3a0Hh5poxvCbWYkVbmLRol8ZhfcyXkQOkBS/8X4CLYMvnA9uYOi8C2KJONgV1Ik+vZ1TMCTpXzC37LRQPkGHkXqmLPV9TV+M7wc0WCW2JnzdW+GAPxXUjqSviBFgrgwGTNVBQErgCRNXSJntGxBzmItYa0VVQcq+tupI3FCA3ItMuL7AhPhoPChT/q1lSchiJZphLqjaAOOuvGJXRvvqi/b7Kc5WXjITkHlgHN87tcQjVXvn6+UdWtanOsA7cAZqNQeFP6c7sV97QRT1PSYDVM4G1+tgHJ5T7eExxI7+xY8TaGr0EPeA3qxzalU9YSi1FFHGkd6arvCOEeEVhYG/T3ty+Xuke37rBuaIilj94FK2YuJ2+tYRRwC6qVKrcqDawBjcOyYduouL/JhJQ5DpRS31NY3CarJXTyvq/qeHIp7z1PFNauMp4rpFm/DWrn0zOqsJW1c8fR8g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?URoeASF+J+IC/XL+0bP5Ss1HJmQnPu5f7DmvlKaxGsE/rEymvS5Q8VZSclrs?=
 =?us-ascii?Q?YsFnB4p+dXaL1NQVLkgWZM3mVSuxUv0u/IrVTyJOq5jSnCvq3LyN5o/FBnUy?=
 =?us-ascii?Q?xcCd0lewkDJD6XSjK10TE3602JbMw2Ca8K24mjepIN3pydlcRpbbUMP+SOtc?=
 =?us-ascii?Q?2H9kBL+zGeeOIj7zwVLDD0pXeSinkkNNzQYvAaNPjuaeIvyZva2yPXMrXFF3?=
 =?us-ascii?Q?FAlLMxSJgpQf2DHeY3R7lUg+sueFpvRscyNz7oQUz3l2B/gaJEGSmvEW/i9i?=
 =?us-ascii?Q?HjgBNKV9Og1NJao4NQ9MqwLNev1yopOx3Im6toAPwTm2F2zhmL2GOMggjoWo?=
 =?us-ascii?Q?h7DRS6lrZIOnC1TxOgq5/bOtB/5d1GBroGiVlsj0+gCkDwxKHYNgKs31pryg?=
 =?us-ascii?Q?AZeM0eoDZjtG6YT/jTKIl9KOwHn3ZqjOC/6liqyEW59HdoLahxLUK5WvgUCg?=
 =?us-ascii?Q?2Nvm5TLVOC/E9tC7p12ogvHs5TwEOJE5MAZzCis14l8MdDibp4X96SS3CKge?=
 =?us-ascii?Q?zV7xM/vq8MmViCKsQQ7/eTUN79rsW9e0ym4t0gkd9ZF191u1LLgsF8d/Ichv?=
 =?us-ascii?Q?9uR85y6iCnXWFeqXwxSmSxpgm8EVOK/Gcqus9vWC/NReFIpY07CqITooufM0?=
 =?us-ascii?Q?9p3yPd0FqFrjoYoVHq6BSpmZA4T9+AgSkXrzDE6aDFZCNAMddBysLRFv7jxy?=
 =?us-ascii?Q?sYA97rhwxBgFhhXrzHAeN0f22qQFqTm58rHWADAsdpXn4R4yFHYwLT1fK4LI?=
 =?us-ascii?Q?22av/NDY9Utum2rTBwnY1jcVOSsMxFdyAz7Qff/zxjgGpnGSsHzTj2jcIZha?=
 =?us-ascii?Q?HfKuut1L2rKimLP/RiYfIY8esLhGpmUkd/DuEG0So126B1EQAnr407fgzjSt?=
 =?us-ascii?Q?UppkBhqPdF5EPpAlHGHnEt9I9G/xAkvLClczCUkVmSC7BWrbabbOGHio62H8?=
 =?us-ascii?Q?z4gcuC+nA7Ri61XcjYZk5/YY9tc2h0NWru1Hk33nriKfyA/+/l54V4LaE6NC?=
 =?us-ascii?Q?xu7+oHeh21PBeezyc5wBxgJ9MviIsWholQUQVQ2doVTZWstYsPho0nMoIxju?=
 =?us-ascii?Q?9b7aD9D01FKC960k7pRVpjPyYc2a+hu4gacz7fUP94HtkmNonKLPumDLsn0p?=
 =?us-ascii?Q?qYDYk7w7LYGF3PGdDNwzclyvT/Fuit5QKxrJaMgTJkmEDDTJx+TzlVRpEb82?=
 =?us-ascii?Q?SwVm1137K9rBCKIFm3sD4LqRaevOXXs/LvB4uqznXB+biEUCkihSw80oShIR?=
 =?us-ascii?Q?iK9W0mipQORbB1u6NAUbJQe4C1+LcVQXnYD5L5P9O1hk1iTR7ZXzuLnDXogU?=
 =?us-ascii?Q?qHxuQPjWQKsLaGUlMoKluUBLjVG/MYRcEpQgsDZcQYQD1IXl6yjfxRq85uQv?=
 =?us-ascii?Q?jaBuY5HmNacYSo1qN1skFCgwhImv/6PZwtXpp7qugNamkj2i2f2LSP/8AHli?=
 =?us-ascii?Q?xVh+p0gyVE7T8NKpgj3645JrCpIeSvh6ijGGlULsBAu4UdkQLE6MVRzWZTY8?=
 =?us-ascii?Q?WrxpBHF8YB0MULcW+ce32LQF4Oe9Sj+v61uUUUUqS+SzcxEWjYPex8ePVYOd?=
 =?us-ascii?Q?ZPP5Z66JGKfmuEzu1qs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12327935-8518-4d18-776a-08dc58b4730b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 16:45:22.6876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTsnOG0yfTC7RgECEsYMZIwj1g9LmgnS04n6ZESv9nFibXWVivzwLcC5t39dcyfqFmR60v8HA2CITDwmyX7aGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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

Hi Jason

We are re-spinning this series based on the previous community feedback. I =
will send out a v2 soon. There were big changes compared to v1. So we would=
 better to discuss this work with v2.=20

See some reply inline.

> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, April 5, 2024 2:02 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Bros=
t,
> Matthew <matthew.brost@intel.com>; Thomas.Hellstrom@linux.intel.com;
> Welty, Brian <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Leon Romanovsky <leon@kernel.org>
> Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg tab=
le from
> hmm range
>=20
> On Fri, Apr 05, 2024 at 04:42:14PM +0000, Zeng, Oak wrote:
> > > > Above codes deal with a case where dma map is not needed. As I
> > > > understand it, whether we need a dma map depends on the devices
> > > > topology. For example, when device access host memory or another
> > > > device's memory through pcie, we need dma mapping; if the connectio=
n
> > > > b/t devices is xelink (similar to nvidia's nvlink), all device's
> > > > memory can be in same address space, so no dma mapping is needed.
> > >
> > > Then you call dma_map_page to do your DMA side and you avoid it for
> > > the DEVICE_PRIVATE side. SG list doesn't help this anyhow.
> >
> > When dma map is needed, we used dma_map_sgtable, a different flavor
> > of the dma-map-page function.
>=20
> I saw, I am saying this should not be done. You cannot unmap bits of
> a sgl mapping if an invalidation comes in.

You are right, if we register a huge mmu interval notifier to cover the who=
le address space, then we should use dma map/unmap pages to map bits of the=
 address space. We will explore this approach.

Right now, in xe driver, mmu interval notifier is dynamically registered wi=
th small address range. We map/unmap the whole small address ranges each ti=
me. So functionally it still works. But it might not be as performant as th=
e method you said. This is existing logic for our userptr codes. Our system=
 allocator inherit this logic automatically as our system allocator design =
is built on top of userptr (will send out v2 soon ).We plan to make things =
work in the first stage then do some performance improvement like you sugge=
sted here.

>=20
> > The reason we also used (mis-used) sg list for non-dma-map cases, is
> > because we want to re-use some data structure. Our goal here is, for
> > a hmm_range, build a list of device physical address (can be
> > dma-mapped or not), which will be used later on to program the
> > device page table. We re-used the sg list structure for the
> > non-dma-map cases so those two cases can share the same page table
> > programming codes. Since sg list was originally designed for
> > dma-map, it does look like this is mis-used here.
>=20
> Please don't use sg list at all for this.

As explained, we use sg list for device private pages so we can re-used the=
 gpu page table update codes. The input of the gpu page table update codes =
in this case is a list of dma address (in case of system memory) or device =
physical address (in case of device private pages). The gpu page table upda=
te codes in xe driver is pretty complicated, so re-use that codes is a pref=
erable thing for us. If we introduce different data structure we would have=
 to re-write part of the gpu page table update codes.

I don't see an obvious problem of this approach. But if you see this a prob=
lem, I am open to change it.

>=20
> > Need to mention, even for some DEVICE_PRIVATE memory, we also need
> > dma-mapping. For example, if you have two devices connected to each
> > other through PCIe, both devices memory are registered as
> > DEVICE_PRIVATE to hmm.
>=20
> Yes, but you don't ever dma map DEVICE_PRIVATE.
>=20
> > I believe we need a dma-map when one device access another device's
> > memory. Two devices' memory doesn't belong to same address space in
> > this case. For modern GPU with xeLink/nvLink/XGMI, this is not
> > needed.
>=20
> Review my emails here:
>=20
> https://lore.kernel.org/dri-devel/20240403125712.GA1744080@nvidia.com/
>=20
> Which explain how it should work.

You are right. Dma map is not needed for device private

>=20
> > > A 1:1 SVA mapping is a special case of this where there is a single
> > > GPU VMA that spans the entire process address space with a 1:1 VA (no
> > > offset).
> >
> > From implementation perspective, we can have one device page table
> > for one process for such 1:1 va mapping, but it is not necessary to
> > have a single gpu vma. We can have many gpu vma each cover a segment
> > of this address space.
>=20
> This is not what I'm talking about. The GPU VMA is bound to a specific
> MM VA, it should not be created on demand.

Today we have two places where we create gpu vma: 1) create gpu vma during =
a vm_bind ioctl 2) create gpu vma during a page fault of the system allocat=
or range (this will be in v2 of this series).

So for case 2), we do create gpu vma on demand. We also plan to explore doi=
ng this differently, such as only keep a gigantic gpu vma covering the whol=
e address space for system allocator while only create some gpu page table =
state during page fault handling. This is planned for stage 2.

>=20
> If you want the full 1:1 SVA case to optimize invalidations you don't
> need something like a VMA,=20

A gpu vma (xe_vma struct in xe driver codes) is a very fundamental concept =
in our driver. Leveraging vma can re-use a lot of existing driver codes suc=
h as page table update.

But you are right, strictly speaking we don't need a vma. Actually in this =
v1 version I sent out, we don't have a gpu vma concept for system allocator=
. But we do have a svm range concept. We created a temporary vma for page t=
able update purpose. Again this design will be obsolete in v2 - in v2 syste=
m allocator leverage userptr codes which incorporate with gpu vma.=20


a simple bitmap reducing the address space
> into 1024 faulted in chunks or something would be much cheaper than
> some dynamic VMA ranges.


I suspect something dynamic is still necessary, either a vma or a page tabl=
e state (1 vma but many page table state created dynamically, as planned in=
 our stage 2). The reason is, we still need some gpu corresponding structur=
e to match the cpu vm_area_struct. For example, when gpu page fault happens=
, you look up the cpu vm_area_struct for the fault address and create a cor=
responding state/struct. And people can have as many cpu vm_area_struct as =
they want.

Oak =20

>=20
> Jason
