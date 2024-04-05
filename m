Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB2289A2BB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 18:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567CB113C8D;
	Fri,  5 Apr 2024 16:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dofWnlZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7197489343;
 Fri,  5 Apr 2024 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712335340; x=1743871340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lDVwBjLB6qqNO0+K1rypVIfx/yRIm6rp5+puNkMHXQU=;
 b=dofWnlZbgCUvllKqTVa1IUTCZfO71pi+VG3SeTUIPnMCB6vNqkcbp2dh
 IhztvDxDmrwOxFCWwVKnmZ6gUigVl+a9/eFPWxntTzIeJ7aeRDh5zEQKk
 NBNUMkhAxS6mXFdrDkdZ7ggYi56WIKRshvaUlAWyhfF+mTYsVgigvP8EY
 1f/fZEa5mmZn5+d4w2KuATqu1ibwsmxA8Ndl+sbgy3g6tOwn0xelC5UR9
 kDYf3jXqiMM0fjStZN2PDg/ne8emoAEF6troqCyaAmtVdrJqdXQTfVDa+
 svumykQd00rkFxowPEDAfcSqp9sK8bAKlOSYcOhO6d82GyuiV906LM/xz Q==;
X-CSE-ConnectionGUID: GqsQ5J0bSUe0WswyOSgJSA==
X-CSE-MsgGUID: KI6f+ofTQiOfdGmsLkWJrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18813558"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="18813558"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 09:42:19 -0700
X-CSE-ConnectionGUID: AnESZd7HQwK/IRRBKtZ5/w==
X-CSE-MsgGUID: Ha1mgakQTRaUPnjrU4E92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19771385"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 09:42:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 09:42:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 09:42:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 09:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4OD8sQH48z51fPIzoqFFMIXHVNhiRvtlu/hcQJpHjqy1w51KBzX2ve1Yqr6FBoZ/0QsNaQUlAXdRHGNvC6nsMS8qd0z3/KUp68Q1tfXX37Uc2yjgJdlm7R9r28dKf9rWkl5HOJOgZHJkiL1bo4wBgA2el/NNmTRQJLzXxv6lgK4kozzrUq8aeuoh7NrS6457SHmbHM0nD14gRz8HE7tXxExEvD4alRYIEu63pkd2YJcrNik+MecL1b4F5cGqVGoRjNWuHMISF4Ks4PfDZFr7y1THU6PPJWjMCNFeDVOydEu8BUmp/zNRLLyB+rPvkxHhpMfDnzXAyx2XdlZ+/2G1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsNfr7ouvIWsDl8cspFYpS6qjfidsWbrBq9eYeKbqJU=;
 b=RUHs0xop8tQVuPUgdRfz+bcpsDyE0Wz5TSSAAIBRBxo4jLyFJFHNPVtZGa4OuSthbOWYB4UexygnCac1Kf7sANiw3YRmPjOuCAk2mX8OHyGSNPaDLIsMgJiKNxUmS60wpZiemJXKHC3Ss3JRyoNOqmKMqVLv9QaoWVtwsRRdJwE47U6BvoXV+5OphfIw3R3dQD7DYxbwrLkBGzCCMB6r/YRoQ+O3ZgfDSOBKzji8KHtkv7KIadc28VUBYo8+HtvWU7Fb+CxRUaF9/ZUx1kIYrWPE4GCHAAP8ZrGjztEZP5q0eJHbbxBqh37P3lTmZsi/K5NaVvW7wHOl9Cqv3e5oOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 16:42:15 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 5 Apr 2024
 16:42:14 +0000
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
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fCAALG4gIAAI09Q
Date: Fri, 5 Apr 2024 16:42:14 +0000
Message-ID: <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
In-Reply-To: <20240405123725.GD5383@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS0PR11MB8134:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q8DElSmoNDSPpIIQqAK97Fge1Z9OkPwjHajRczxWZqXAIzzeII2kHQil+XzgKf4H3vhfRmXP+58JSDwrVZ2FSwdAHJQSTIrXh0VJBhEFEt7TUsz18hZ+ApYmh57aJWjkKHGqyXLUR3Nu6NOm29P0Jn1iawOE/7Uek18o7KGTEMtiQHKHGqi1rl7dgj4wZxRDs14d9oPvJ/qakh+jUciti0aX++A2B+SgD6nnI9EvBbGrnTjZzL9Nb8ffkXOlrLqb+yr3xfPdAp0t3JgzD+OUtMg3VQOE3W+mGMee0VzxiZejQpKKcRiAaG13aO8rjBGwFy71xZ7OLbPUa0Vb/SOUGQFfSOHCZ08/ArBz2H1Nnj0vqaZ2xWzP8noDMZT9O6f7SZIwRofengK9xftKq2pn5eZlETk/uMvZc4A3DIkey0Nt+K0vxQSMQQ9vWvCoFJtACgFW719RNw6H/Pyme2CSPc+gDFCJPJJLlm7bwjhruaU05w20uloRsS7n9L7INyyrdT+PG8d1lQGUiGusratOoM3HYahYFhbHRQSRIpT3K5EaZ+dz9WRvDTUSsqh9QqCyhi7iitdCeQZ+jIJGC52uTRVWE+udGonoQofubxzuNg0AGSS66jRrdxRu7lRswL1N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UaRJigVn+ivt7oipGBurjELXSdDU69qYxDwaJG9gRbfbaZ3bzBHShjlSUgAU?=
 =?us-ascii?Q?SalmVWIybZcuuPRiCIaz4+gbj3PaC/M73rlR1UrasCMnwah2JZVEtEmurl1p?=
 =?us-ascii?Q?bPNmIu1aSYk0A3OmgaQc+GfZE/K5cU4qzo5VU+3k/ZMgzX2NWsl8jR+E3PTU?=
 =?us-ascii?Q?+DloFnq51l3YsfHnWYt4TIf81uLVh7Cg9sg8SwubZlT8aTJPF8QeByDF/UwU?=
 =?us-ascii?Q?NWKnAEvvQKaAYOqbWUigDpc7VgoGBNsyc/UhAghDxqwgbV/onpZbqQ7Iaqwa?=
 =?us-ascii?Q?frLukVSq7z2KmrWU83TQnhoG+PfpED9WfF9manznzu6YNsaWjV2c+fc6i7ai?=
 =?us-ascii?Q?4PVl/g5KQyErRFLedxFs+1ww8VEyAaTdf4ufd4rXL+8u/HD1uOwWVgQhesUo?=
 =?us-ascii?Q?RA5IibOh8NNeQytXq+dj80tjG/fYNGzuwX/dPWFS/NK6BYaN20u5gS1khZRW?=
 =?us-ascii?Q?+SXPom5hBpfHRMCQGtm7fglofhZy9whAoYuAlwIVWJ8MEtuZ6CS3McGxOBpp?=
 =?us-ascii?Q?5VAk/CxT4ZAym+4kCVwcAYLS1/L0gTE2BPa9jkK8rJJsU1Uw020/F8FWLiGf?=
 =?us-ascii?Q?2AkPkEn5FhkgQpCjSCzfjxLUoXtdPPnEsr7lZep+uG5to+Xj+K24So2EgFpQ?=
 =?us-ascii?Q?8B7bD70uoDlwYRfF5MKMHKhUULkuFTBmM1maE2MaLi12AUWlZE9qeRTp8Ae4?=
 =?us-ascii?Q?CTH2b9GE/E/ID9X93u/TH6Ob2nPvF0nPHVrIzzBuCnG4A7JQ0t8hH1EdUG7n?=
 =?us-ascii?Q?w9yHmXyV8LKY0BGZZkkvLj7g+LXtIOr+Pd8racuIeMp349oTMAXCTmOzvDZV?=
 =?us-ascii?Q?SZG9NcvoBCGbOENeftQbG/8DKyo7UBzrSxegNKMCCgjIk2ZC5S6gJrYUaeda?=
 =?us-ascii?Q?yMwzP4dCw6wtZeGAfgMsPivDZ5SgJRZIbLs5nzI08WqWN8mrdRKY9Jm2dyhz?=
 =?us-ascii?Q?3huCqacMiyCy6ajJr2V9YhxUZYbK2kUfrHSx3oX0QxN0eYBN8k7UpTnZj16M?=
 =?us-ascii?Q?E54uZykNGqA4/OuuK5GOx8y0O1HjBRHhwYdSIAHBT0TEK1kS1HF0x6TQzCeF?=
 =?us-ascii?Q?5qBfnx9S08EOl3zT+O4ZL1jTAi4FECwa4q89mMFO8Qc73f5fKDz4G1EYDTko?=
 =?us-ascii?Q?R8SH5YNctm6Tm/3aook0hLHe2zYXUYbPRzi4bORuCI41AbCf3evnhUoW6T1F?=
 =?us-ascii?Q?n1P1FLDV2Cu3RP6y3K5AKzSQxb3EZOAdgHgTzj6x4UPq2ilzYLU0U3ylh4Cz?=
 =?us-ascii?Q?zEal+GXFMDsS8EemEfNap+yWeeR6gUtpybyWyOc1irKwFyP8gE5jOYQUMivK?=
 =?us-ascii?Q?dpAXn8AlD4nvOpuGyLWHp5r5zz3x27W9nQnb2pRumMlT1b+LgSMmefQ/Psj/?=
 =?us-ascii?Q?KnLGB3lrSsvsKuM2zBV5pn9NDfZtPbdP4X9gi/iAyXwuuiMol+ssI53B+190?=
 =?us-ascii?Q?L9FU7/tLDFtNpmZQGazUD5nTv7TsW5mSynspXGzVYywjqJI0dfeZ6GDhC5hS?=
 =?us-ascii?Q?QpavAIoinPPVx8JKbQNhiZuPMreeZyML8oz31XI+hUcgefPHghW5TBbov6iL?=
 =?us-ascii?Q?oGBflkZHf93kA9tSeNw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5ef286-86e6-48f0-a44c-08dc558f596f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 16:42:14.8348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQC75PtWO+CRpV01isP/aWwbamC5oOSbzUhMzVTpot23ecYq6zkHKGdmV2RO5k0+jJZdrDTTuBbhSCDqV03+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ja=
son
> Gunthorpe
> Sent: Friday, April 5, 2024 8:37 AM
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
> On Fri, Apr 05, 2024 at 03:33:10AM +0000, Zeng, Oak wrote:
> > >
> > > I didn't look at this series a lot but I wanted to make a few
> > > remarks.. This I don't like quite a lot. Yes, the DMA API interaction
> > > with hmm_range_fault is pretty bad, but it should not be hacked
> > > around like this. Leon is working on a series to improve it:
> > >
> > > https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.o=
rg/
> >
> >
> > I completely agree above codes are really ugly. We definitely want
> > to adapt to a better way. I will spend some time on above series.
> >
> > >
> > > Please participate there too. In the mean time you should just call
> > > dma_map_page for every single page like ODP does.
> >
> > Above codes deal with a case where dma map is not needed. As I
> > understand it, whether we need a dma map depends on the devices
> > topology. For example, when device access host memory or another
> > device's memory through pcie, we need dma mapping; if the connection
> > b/t devices is xelink (similar to nvidia's nvlink), all device's
> > memory can be in same address space, so no dma mapping is needed.
>=20
> Then you call dma_map_page to do your DMA side and you avoid it for
> the DEVICE_PRIVATE side. SG list doesn't help this anyhow.

When dma map is needed, we used dma_map_sgtable, a different flavor of the =
dma-map-page function.

The reason we also used (mis-used) sg list for non-dma-map cases, is becaus=
e we want to re-use some data structure. Our goal here is, for a hmm_range,=
 build a list of device physical address (can be dma-mapped or not), which =
will be used later on to program the device page table. We re-used the sg l=
ist structure for the non-dma-map cases so those two cases can share the sa=
me page table programming codes. Since sg list was originally designed for =
dma-map, it does look like this is mis-used here.

Need to mention, even for some DEVICE_PRIVATE memory, we also need dma-mapp=
ing. For example, if you have two devices connected to each other through P=
CIe, both devices memory are registered as DEVICE_PRIVATE to hmm. I believe=
 we need a dma-map when one device access another device's memory. Two devi=
ces' memory doesn't belong to same address space in this case. For modern G=
PU with xeLink/nvLink/XGMI, this is not needed.


>=20
> > > Also, I tried to follow the large discussion in the end but it was
> > > quite hard to read the text in Lore for some reason.
> >
> > Did you mean this discussion: https://lore.kernel.org/dri-
> devel/?q=3DMaking+drm_gpuvm+work+across+gpu+devices? This link works good
> for me with chrome browser.
>=20
> That is the one I am referring to
>=20
> > > I would just opine some general points on how I see hmm_range_fault
> > > being used by drivers.
> > >
> > > First of all, the device should have a private page table. At least
> > > one, but ideally many. Obviously it should work, so I found it a bit
> > > puzzling the talk about problems with virtualization. Either the
> > > private page table works virtualized, including faults, or it should
> > > not be available..
> >
> > To be very honest, I was also very confused. In this series, I had
> > one very fundamental assumption that with hmm any valid cpu virtual
> > address is also a valid gpu virtual address. But Christian had a
> > very strong opinion that the gpu va can have an offset to cpu va. He
> > mentioned a failed use case with amdkfd and claimed an offset can
> > solve their problem.
>=20
> Offset is something different, I said the VM's view of the page table
> should fully work. You shouldn't get into a weird situation where the
> VM is populating the page table and can't handle faults or something.
>=20

We don't have such weird situation. There are two layers of translations wh=
en run under virtualized environment. From guest VM's perspective, the firs=
t level page table is in the guest device physical address space. It is not=
hing different from bare-metal situation. Our driver doesn't need to know i=
t runs under virtualized or bare-metal for first level page table programmi=
ng and page fault handling.=20

> If the VMM has a weird design where there is only one page table and
> it needs to partition space based on slicing it into regions then
> fine, but the delegated region to the guest OS should still work
> fully.

Agree.

>=20
> > > Or it is a selective mirror where it copies part of the mm page table
> > > into a "vma" of a possibly shared device page table. The
> > > hmm_range_fault bit would exclusively own it's bit of VMA.
> >
> > Can you explain what is "hmm_range_fault bit"?
>=20
> I mean if you setup a mirror VMA in a device private page table then that
> range of VA will be owned by the hmm_range_fault code and will mirror
> a subset of a mm into that VMA. This is the offset you mention
> above. The MM's VA and the device private page table VA do not have to
> be the same (eg we implement this option in RDMA's ODP)

Ok, it is great to hear a use case where cpu va !=3D gpu va

>=20
> A 1:1 SVA mapping is a special case of this where there is a single
> GPU VMA that spans the entire process address space with a 1:1 VA (no
> offset).

From implementation perspective, we can have one device page table for one =
process for such 1:1 va mapping, but it is not necessary to have a single g=
pu vma. We can have many gpu vma each cover a segment of this address space=
. We have this structure before this svm/system allocator work. This is als=
o true for core mm vma. But as said, we are also open/exploring a single gi=
gantic gpu vma to cover the whole address space.

>=20
> > Do you think register a huge mmu notifier to cover the whole address
> > space would be good? I don't know here but there would be much more
> > unnecessary callbacks from mmu to device driver.
>=20
> Yes. IMHO you should try to optimize the invalidations away in driver
> logic not through dynamic mmu notifiers. Installing and removing a
> notifier is very expensive.

Ok, we will compare the performance of those two methods.

>=20
> > Similarly, we create range only the fly for those range that is
> > accessed by gpu. But we have some idea to keep one gigantic
> > range/VMA representing the whole address space while creating only
> > some "gpu page table state range" on the fly. This idea requires
> > some refactor to our xe driver and we will evaluate it more to
> > decide whether we want to go this way.
>=20
> This is a better direction.
>=20
> > > I also agree with the general spirit of the remarks that there should
> > > not be a process binding or any kind of "global" character
> > > device.
> >
> > Even though a global pseudo device looks bad, it does come with some
> > benefit. For example, if you want to set a memory attributes to a
> > shared virtual address range b/t all devices, you can set such
> > attributes through a ioctl of the global device. We have agreed to
> > remove our global character device and we will repeat the memory
> > attributes setting on all devices one by one.
>=20
> That implies you have a global shared device private page table which
> is sort of impossible because of how the DMA API works.

In the case of multiple devices on one machine, we don't have a shared glob=
al device page table. Each device can still have its own page table, even t=
hough page tables of all device mirror the same address space (ie., same vi=
rtual address pointing to same physical location in cpu page table and all =
device page tables).

The reason we had the global device is mainly for setting vma memory attrib=
utes purpose, for example, for one vma, user can set the preferred backing =
store placement to be on specific device. Without  a global pseudo device, =
we would have to perform such settings on each devices through each device'=
s ioctl, and we would not be able to tell device 0 that the preferred place=
ment is on device 1, because device 0 even doesn't know the existing of dev=
ice 1...

Anyway let's continue multiple devices discussion under thread "Cross-devic=
e and cross-driver HMM support"

Oak

>=20
> Having the kernel iterate over all the private page tables vs having
> the userspace iterate over all the private page tables doesn't seem
> like a worthwile difference to justify a global cdev.
>=20
> > Is /dev/nvidia-uvm a global character device for uvm purpose?
>=20
> No idea, I wouldn't assume anything the nvidia drivers do is aligned
> with what upstream expects.
>=20
> Jason
