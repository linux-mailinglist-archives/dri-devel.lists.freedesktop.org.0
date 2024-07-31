Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580949438CA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 00:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351DE10E220;
	Wed, 31 Jul 2024 22:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeaOTjuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9234C10E052;
 Wed, 31 Jul 2024 22:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722464653; x=1754000653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sc9WzkkVmEp61hzidY6zYJPDP7TkKWmFVjxkwhbVZmQ=;
 b=XeaOTjuYQAkEYG72xxjKMZNgSpwcoooRKC8zaUwz5BaJgBPFd2u1qFkS
 ZcOSlNHvTTiQuPjrzj1sDZ2RsoMC77Uq/a3F2JTWyqSP90aMmJIF7vDfC
 TH22mKh80S7jCCXWa/Tf9XiNwbUt4+JAPqY45ipUpBmSwLi2yEVkFuOjS
 jEfdQGSPQgzirZ9LgiGJ7bpLL4+RtpFcSnnGzJsaq1eqFYVI47By7pFVa
 p+Z3SrHeki4zrYHtwU9CopGfa0rXjXvHZhB+zRiyYwlLlKi2E9NbzxAeK
 c0Zx928aypD1wByvQVX63DSzYs9sqDM56Zs+rAvwtB4EQ40OelAL0xT3C Q==;
X-CSE-ConnectionGUID: xNon5TpfR867KfWqoVHF2Q==
X-CSE-MsgGUID: XKnDCoclRma2d2g31fropQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20517939"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20517939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 15:24:12 -0700
X-CSE-ConnectionGUID: L0Mk3ClKSNOeRFQ5CbqReA==
X-CSE-MsgGUID: 4MBoIMCGQZKsTbaXnAlk4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54518919"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 15:24:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 15:24:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 15:24:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 15:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Em0jESAPAWS/AjT6SpbfgYPAMQl9FFVixAy7n7UyQseOcP/EOZaxAxEzrFmx5av8bD746sbB/MZX0wv6o4nva9JfR3OTMS0tmswUxIfcDEyzGv8R3MlfZBYq8ymouELoFaZQNDpzQlicFkXxbh6qnei7DQva14aatEOHRV9oUONifJv/9KrW778fy8cHyJ4bLEJ8ReYb/CfPtDe1+YSmf6UgNtLC9thvBr42pETMnHQlYSKf2KpUy3cdcheoyum/25z/sNz0AiaYgmFCJbUR40LeXrV1snZkcYUq5XZls9v29m0t6Yyn2NXhkD3lvsmQ+/iGsYdlCcERn92GQXQYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RImc7SBz0ap/eA0Shd8R0r6KeOmF2one8NmYjm0CczI=;
 b=Wlicayeq5ZcrluL6Exu9WnmH+2DyWrcHT/sfKTgarJ/DqXlKCLd7O+f5QcPI9yT6D70b++OJNYaOo2L8NsKN2kfnepO+oEhy3wlZ7LcGdmvMKqu+xhls+k0/luo4yruGjSWWQkAfdRz2AHTwHbrk0d0HmhSGqiEmIsK+bvRZFaC99K2asm+/rR1yGUh8s7LI308yQwIyiSi5uzIOs6V19iYPiybuHQNKY5P/2C9fYt+BDeuzQDpqG0ac2kt/tvxe0cHkmrqA1xllPpw756fHxAhM5bJM9Uz9w4n5E9nrDZYVSO+WVddIFtFsjG/BrjYQgGXOYRR/SieVM0ETBN+/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 22:24:08 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 22:24:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 1/3] drm/xe: Take ref to VM in delayed snapshot
Thread-Topic: [PATCH v4 1/3] drm/xe: Take ref to VM in delayed snapshot
Thread-Index: AQHa45Eg10Qtw7RN10+cpzR8G0gUQLIRaVWA
Date: Wed, 31 Jul 2024 22:24:08 +0000
Message-ID: <CH0PR11MB54449A0FD768C64814B38848E5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-2-matthew.brost@intel.com>
In-Reply-To: <20240731213221.2523989-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: 5cbb9eb1-a7d8-4396-3a4c-08dcb1af7ef9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?al+L7fPwQkIuam+0Ctk0PwqpDPmjcZq3eX56tmEzWCdLxurCxMxr1LR3VWfs?=
 =?us-ascii?Q?PqMRn7YGnrBzVq1y3kBcR1j6/G7RVNgTAjkkRvU5nPI+xPFTrPYlGEtuXft/?=
 =?us-ascii?Q?N/zIfCXroIkPu4BzpwseKhDZfU2ov/o8B9M0tLYuHQt8GlM86yDrEOg2gwXs?=
 =?us-ascii?Q?mnjgrdLGRGlx4BnH0b1TOLkwYY6rPeR34T2kA4PKhRWhReoSv6G4TevIGvZB?=
 =?us-ascii?Q?A4NCpF4i3i0LHsJIA953ArReeUSbP1Y1thvr/UG+dDjsaYLwV4cchbtaV4G5?=
 =?us-ascii?Q?XEjF7z5jWzTrXlv0Oxhbhe4eulegjvU4yTwraavTX6PQFnXA7hnbVrS88gxz?=
 =?us-ascii?Q?1Lr2PbLybLX3xJx+RW9aXK7mdC3fcPChTWefct9y5onW0iq+VSpTeBOgMizP?=
 =?us-ascii?Q?Ip+gPZMPs3R6D0qjwiFB9gfNxqN7dphfsd46Eo+OXyEQnLVZT84tlyBWyNRk?=
 =?us-ascii?Q?znAde8Drlr7Gi0d1IQOx+D8LQNq6m0r2Ft0IzmPufxCUsrOIKMHLEnS5JOfB?=
 =?us-ascii?Q?PcEdnw/jD0ngnbOhoBBt93VnJOB4GsXA7LVpoWSwRTwKo7r/QoZ6ccotDThE?=
 =?us-ascii?Q?oqy8s0DWxfWooi0jbg0KsEjJwsnLrN74P9cjC5ki1tyGcTF0WEpA0NotLTeo?=
 =?us-ascii?Q?+r3CY2bI0OccCcMvQgRQXzqPiogQcw3uaT69Z0BIOM7mZv0B26ansShAbaXR?=
 =?us-ascii?Q?qUPAVUaRH+FIbQ8GbFOzMCIij91P+mM4HitIgD6imIHWVeFhkoalzZHUmeUb?=
 =?us-ascii?Q?xIZ//7ESFYsZc0wxq4ej41kvHUSgF1JhTWypDnVSG0oJHgukVoIjaTjd9ynA?=
 =?us-ascii?Q?Wgo0AUp5Gvc1HAuuzBaUdUulDk18gKLhi486+fYfZ3QTxwd6sJs1IATs4vds?=
 =?us-ascii?Q?+A+gEzmBLAPyUA+je3sPE8j4KOfik5Js5+22cDlaFJFPViCjaqcLLugpWM6i?=
 =?us-ascii?Q?3JpVQ8OSzfFkkfaR/VLav2ZsI80HlPXEDF5k8TwswLcduPymgzP5ennMcvZE?=
 =?us-ascii?Q?HlXpgTVjXucvVCFoQQAO5vmP+OWDfbGB86RW6qLoB0RTY4yVOvrdNw3nU8mj?=
 =?us-ascii?Q?IUOgXD4IgOCatXVjroQUGtp7z24T/iS2k8v9IDSN6BhTzkru1Ab0EbH9roPx?=
 =?us-ascii?Q?PLVa4ROHO6G5kuq645kooovaJs4phLiR1jZwyIo2L2uSl7YaDxlciPTo4rAh?=
 =?us-ascii?Q?5eRwl2rmMe1t3X7yEUmwho+CwS1V+5B0KOJ0c2ErtYjFk71Ii+SwmR8bZvHL?=
 =?us-ascii?Q?EgCo7EbVqPat7VqNaYNWfjPufKz+6gyRxuR1PGgAa+CqrZJMSLrDDfjHPFEE?=
 =?us-ascii?Q?zjlBPKe6KsoGyc3glXNOpVr9WjqF+E6z/Ek12kj7b14F5RAfJqbztl91vNFO?=
 =?us-ascii?Q?nbMVXimQwo1iI0mIkbPqAhg/wnbXZ/6UfqpKPlRqTmstWuDp2g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yt2BRA3loD4DLfEa2MOh+ResLt0j3n3ap73KB35wWkn8ZP2mMhkFV4JGshN5?=
 =?us-ascii?Q?MeNtCB7CZhP8SiF7LFm4rsqLoOcR+4aRLVMCTKJ2i6/NPJWgqAs+EeCLoBn+?=
 =?us-ascii?Q?nCxsRcUTTUSQPyVKTxx3hK+SEYcG9Q0ujix8uxuE6w8Ln9lFHrTesSl4d6CA?=
 =?us-ascii?Q?iKgTjH5qoeuaP0WozsozyXpJZ0qPSZPj3JZ9DpRZgxAu3kg/Q0+oV8+Nko45?=
 =?us-ascii?Q?opK5y+5HdmgdOsHTmdu0BM1rrePYjutoyqL28EPoFrqC+P94tgrjZEl/e86s?=
 =?us-ascii?Q?VYrOKmmQXA2ASe2ag8YANf8ZcHFQp+Ia3pDJxxLlSchIel8BtLcP96lCdJtA?=
 =?us-ascii?Q?T0Qlkau71ch/iU+dUjhpYD5SlD0NKZ241ctVX4hQoUglzwpSw/hR1tvRcr4+?=
 =?us-ascii?Q?3E6fUNd11b3ivzRpS2wZylotbtUb06Ubcjn+7UF4OQ4rVb70rEYlYALFjgX5?=
 =?us-ascii?Q?Y6FGhL59TQWFNtm9VL7EPnLpLe/JKPGMgB7/hJULDWcYUD2O70GvpLOWxajT?=
 =?us-ascii?Q?zjX9W+fZBEgc3EBh7YaAugO3CuL2DaVQJXIAXoPxr2oiHMCC1mpU/+75JSr4?=
 =?us-ascii?Q?fIj/4UQ5p76RbvL2ng5l4ErrBh1aZ89EY59TpEw+i938kTBdCYbcElBpZqf4?=
 =?us-ascii?Q?0rGgMHJUFnBZfz5RozBgJkzRxWFbI3+ZnnhIC8bwJeC3mX1dG2zHpTaEFAk4?=
 =?us-ascii?Q?GoLHDhGyQQ6cWABceHg/lTQJnIbSe2kA4klLtHPIUUwFQY9QmTullWblEkWc?=
 =?us-ascii?Q?h1CyFJXOEoqH8xLsOCoS2DyhBn4A7L1C+5L32+EHqLX07Oj6NhIcGHfvwqsJ?=
 =?us-ascii?Q?jUvwJqEVg8dgajTvG+6VN5rE+JxRz59BF3zo5LgxN9O6hUHHrb6OTIF5zrVY?=
 =?us-ascii?Q?U96+I5/RqJegkD/ebcX1W8nuDre8pVxu+qn5KPRK/J4yjtLgRxi0A1SIIwhI?=
 =?us-ascii?Q?+OaxhqCpaULUaLuI3WlyfmeY4h/RWeEocTBbDJq9bUprADNo7DIa8EBELg7X?=
 =?us-ascii?Q?8GnMlRd/iABp9amV2xv+Q+yNN+p/WVNH3ZgByRI9CMSDXxgVwLDUU5PsH+qH?=
 =?us-ascii?Q?Vp5h32UZw65r512nLhq/hkYfhTQZbaY8VzmVNSQhN6QSpVLdTwSee5b6sotZ?=
 =?us-ascii?Q?zf2r+l0/A4M54YwYBYgg1WLKAV0l/ncdwiilrk0VfJJaenc8/GGmuPLqf8+f?=
 =?us-ascii?Q?jd3fXrmJsmyUwARGoi4mC2Fs5AFXcpm2pPT93nsMQ4jzNBSsHl4b9j6A9d1C?=
 =?us-ascii?Q?heNfCQ0FWIDBYm8G8S5SSR0O1Sx0Lw+OESIUCq2E+D+nV1XYzJcmqN7hPkVJ?=
 =?us-ascii?Q?4ndfFvsiZay9azncIZHD3m2UM7XPi0smdhVMz0AMclsyMh8PNwiBgoZgzR+L?=
 =?us-ascii?Q?GpLG8e9UEjaKQACUSz0LzERztAjM2Lm+p525Ijik6AHH0+X9ZGYNTtDwdJf7?=
 =?us-ascii?Q?qVIOHEfeBA6LnCXIq9W0iZw7rfQDCKI0GcNpWRh953sDtzA415X+m+/yaqtc?=
 =?us-ascii?Q?yK4xO6Nd5/wHbD01xivK52WEQ+QL2vIFb25e6uTmndrqE0NHPCkjsMjvu3ys?=
 =?us-ascii?Q?WYn6zNFQc0Z62QwcHYuAW4kgSdMxksz/6e3fDry9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbb9eb1-a7d8-4396-3a4c-08dcb1af7ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 22:24:08.7213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+qzY5AiAXUoEkKdVWohTfGzs2py+DBV7yFduA8+fFaW56zb0T9nB0O6o5n84v1mxC+YGEQ0OVwgQ0LKorUczyxWnUXcyDdCGjPrUyE1b/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, July 31, 2024 2:32 PM
To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>
Subject: [PATCH v4 1/3] drm/xe: Take ref to VM in delayed snapshot
>=20
> Kernel BO's don't take a ref to the VM, we need to the VM for the
> delayed snapshot, so take a ref to the VM in delayed snapshot.
>=20
> v2:
>  - Check for lrc_bo before taking a VM ref (CI)
>  - Check lrc_bo->vm before taking / dropping a VM ref (CI)
>  - Drop VM in xe_lrc_snapshot_free
>=20
> 47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
> Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

s/need to the VM/need to get the VM
Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 94ff62e1d95e..58121821f081 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1634,6 +1634,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(str=
uct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
> =20
> +	if (lrc->bo && lrc->bo->vm)
> +		xe_vm_get(lrc->bo->vm);
> +
>  	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
>  	snapshot->indirect_context_desc =3D xe_lrc_indirect_ring_ggtt_addr(lrc)=
;
>  	snapshot->head =3D xe_lrc_ring_head(lrc);
> @@ -1653,12 +1656,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(s=
truct xe_lrc *lrc)
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>  {
>  	struct xe_bo *bo;
> +	struct xe_vm *vm;
>  	struct iosys_map src;
> =20
>  	if (!snapshot)
>  		return;
> =20
>  	bo =3D snapshot->lrc_bo;
> +	vm =3D bo->vm;
>  	snapshot->lrc_bo =3D NULL;
> =20
>  	snapshot->lrc_snapshot =3D kvmalloc(snapshot->lrc_size, GFP_KERNEL);
> @@ -1678,6 +1683,8 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_=
snapshot *snapshot)
>  	xe_bo_unlock(bo);
>  put_bo:
>  	xe_bo_put(bo);
> +	if (vm)
> +		xe_vm_put(vm);
>  }
> =20
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_=
printer *p)
> @@ -1727,8 +1734,14 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *=
snapshot)
>  		return;
> =20
>  	kvfree(snapshot->lrc_snapshot);
> -	if (snapshot->lrc_bo)
> +	if (snapshot->lrc_bo) {
> +		struct xe_vm *vm;
> +
> +		vm =3D snapshot->lrc_bo->vm;
>  		xe_bo_put(snapshot->lrc_bo);
> +		if (vm)
> +			xe_vm_put(vm);
> +	}
>  	kfree(snapshot);
>  }
> =20
> --=20
> 2.34.1
>=20
>=20
