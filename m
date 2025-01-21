Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262EA17644
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 04:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DB310E15F;
	Tue, 21 Jan 2025 03:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EicXD7Jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7175510E070;
 Tue, 21 Jan 2025 03:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737430471; x=1768966471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8r94yCi+ovmDKpw3NOGzRgD2A2KwvuiAGwBQmfZe7h8=;
 b=EicXD7JzYZVhEOOv8Lmj3PFcyiUizjm0nDEGjWYEs54clMvSdoQ8RsZN
 MzFj6O5G7QVq3q943DqLPs/LVocpjudSVafx1tsSH3GU2WsDnaAnYeEey
 94sIw6CO0xG2yvk6iKwAU9v3+7BJle7TQyu1JLuZrQLyk6EKFlNfNxPUe
 FVQoqw1CzAsuRO2SfKsx4Om2/j1+opOiha+2p4FaOppPFdIlitSuZhXA/
 Y8UG6/25+uG0zrLK3ovlUPB3skGa/hIM9pWbP/Kch6ikC4g1qycFVFy0T
 EpV3qlUM+++EHQvEy/i1A7prECU7G1ShGzgP81WWT2I0/ZM9393VCloDC A==;
X-CSE-ConnectionGUID: Hvhsv9QSRiWawlprpUFRiw==
X-CSE-MsgGUID: CJojqop5Rb20wLzy4MY6kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37703842"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="37703842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 19:34:30 -0800
X-CSE-ConnectionGUID: rwaBUtvaR4q8QMXXJuLl6A==
X-CSE-MsgGUID: TVOiINaPQSSr2UcR6SseMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="106804586"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 19:34:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 19:34:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 19:34:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 19:34:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSlWhV6/pRewHFSsinHzq1CEYvnz/dtG0FlMe1iqbz14h39rF2MHP7Fm/dVW7v71s8T5eTFmRXdf9p+Eq4iCmdPxUwEvFWfM19ReeTgzgxBhahdxmMJ9kxREiET5NzyUHpkmlqPH6imLLUMcKwSt1E1o1nIIHYdxgq1E1W7zBfiz1rA3VD1+b0tUis1tJe3mgKLz25PyrAsMAQ+PtXlQwcUjMMNZ/7ClWOcLrxKCPCDKxUt3ePOFkJrr5Wgg4jTz46KdbKkZ+kfxWDTRUOpKAi8EEapFieppDLRagBz7pMQJ/y2DgQxlaKAbI0g7qaR8uqSKASXdgxeAC9ygm0WpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z9ZqI7b7iHo0YH4iFD65fHk/mkoa8oJfdzPzzvsOek=;
 b=fX5xO7BVIIlLgght6dL6+ONT8O9pQYj6vzuFxVSr8/kDU6+0Eq6OoA3S/EtWLWNNrfUkLa8wHYsmCYuFuUjXLe/UI190fpSrH+JPmTevKOIq6crm7GGTzrDbuqEOaf3X9KCsZYL3+Xy1dI8g8O3fbIZ6obNaTQ31EP5cJv/VJgbllxg0v7DYSlP6PL1MF5qn9xww0lCbMPvCa6X/e8lhbuPo5xfx1UxlSxxJaAhsX9xU1cF6+obiO4FRBR2FvltAxWFvoPAZ3gD5d/esG7dsMIRs1RZ8bvNmB/F4n34EkptLOW5kb+42Fhk7ZyUZqc+JtmVE+Jj0Ui6EqLXiJ3tPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 03:34:20 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 03:34:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 4/5] drm/i915/display: Populate list of async supported
 formats/modifiers
Thread-Topic: [PATCH v3 4/5] drm/i915/display: Populate list of async
 supported formats/modifiers
Thread-Index: AQHbYZGxEzdkM1vnMUOITqjmmXe9CbMgNc6AgABxkFA=
Date: Tue, 21 Jan 2025 03:34:20 +0000
Message-ID: <IA0PR11MB7307C0119A52004DC634EC00BAE62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-4-f4399635eec9@intel.com> <Z462TS-6qRPz7eOb@intel.com>
In-Reply-To: <Z462TS-6qRPz7eOb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA3PR11MB8076:EE_
x-ms-office365-filtering-correlation-id: d9ba05a0-2f27-4e57-282c-08dd39cc7e0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?2ao0uTjaaqiSjsAe/P9pCAzxDDmylMokCETbcZi5+WzkbqTQE7Qj99LRUr?=
 =?iso-8859-1?Q?anNQqLztxv9Vn7UGoeU9qMGMu/AqeKDKhhcAwsMsr5DaVP+sRN78CQgTXv?=
 =?iso-8859-1?Q?EEwtbjzHpVnIP8/Odhnhi4IXYHQTwJwn2oHpQcEAJgNsv7fqqLOxpFu6QF?=
 =?iso-8859-1?Q?QFG7BLug7pFaBnoWiMbDLitiwoBQTUqO++Ekj2SO5IhcgljzGYy3J/rpPz?=
 =?iso-8859-1?Q?ms76NXV8WwHb2IO2cnDLqzXtYW7jdSFwhgTJkszrUuPg+XDaIb09B6y+jm?=
 =?iso-8859-1?Q?P7R7m7yxptk5YT/lraYn+Bg8AyJ11Mk95GIY1mei1RZmG2Mk6jvViSzkTV?=
 =?iso-8859-1?Q?VmTcyacd9V75ZCLqzNiyxLVh+NBg0Mtq50m/li4k7f0/U3xbJ6qhTK4ZE6?=
 =?iso-8859-1?Q?4bz/kb5cL3hDuPaZcjneVCSbbAn9WR2q8k7lmw9o8Cl/Au4L2TRYuw/b7n?=
 =?iso-8859-1?Q?toEkvF4AG9SFTQgts3jF/R7GVWr8ZcJnk+3dAjaoRuq385dKyeqWt408aF?=
 =?iso-8859-1?Q?0VE3/37LsDwfCYUguj+KUU6lvrQL/aiqKGpHOwWPROPrsJj6O5II1mOiPq?=
 =?iso-8859-1?Q?pSZg+rxYO793UPv+Ho8YBdcXxiPaS3ban8O5QVCBqnaITNAMRLEhTtFW/3?=
 =?iso-8859-1?Q?kw9SCbCJq78KMVsipAimouBKOrDB16eiKUtqUkMKCmEVjipJhxrNwxFO7b?=
 =?iso-8859-1?Q?NPZzOjrp3Dt5wBQXSP5VURfVkCDwo2xJqLDGGP5P3h6nwc+cXqOBJJUqUA?=
 =?iso-8859-1?Q?r2lHC9z6rH97ZVnYcJVklYIAJ5ihrooilh+WZPNiSVOEa4yXAj3biewl/2?=
 =?iso-8859-1?Q?VeHXrbgy5OOKC81/soxMBEzyL3GRjBwakdrvhA7KYVSSJV0PcEqagsO93W?=
 =?iso-8859-1?Q?IapuuDvF7UzcMExwM4AtX0nRscxLmmqq4NuRJ1qB0JgCx6vdtGiuLvxyyX?=
 =?iso-8859-1?Q?o1YEF1nbwre8OOfrMjDkj2UKX+jv74nl27Sb6NXhkGoAM6jSTWPJj1EzD3?=
 =?iso-8859-1?Q?VtyRZ895C5Aa2Wh2gZGd++MNEEmmVhMkT+OWwGsswXJSuPclZrbaI0FwTe?=
 =?iso-8859-1?Q?+x+9srHb/BKmYC4y3b60yKE9QV6r4VecTvLGyjvaVgRtoVruJx1pW/j+a3?=
 =?iso-8859-1?Q?e34CwH5V3Nh4sg0zU6fYH0meZp4C/1ibeqNbGIod4SKoATJG4HBdN/WEmg?=
 =?iso-8859-1?Q?MviJi0JuobniX+yKa0V/gVdrcdN8dadn6iY4rG0S5GHMv6uwDt5qj/X7/z?=
 =?iso-8859-1?Q?s/7KZS1vjbMH34B8yI80p3z5myyIlGjygzBax1dprZhqZcLRJkeZjRv2aE?=
 =?iso-8859-1?Q?PAKmOPCyajghoomKgNKVOxkrO3QA6q1nuUBi5ZX1n7sX2cBykuMLdY+grA?=
 =?iso-8859-1?Q?q1RGDaJmNuU9RV73seGY+reoO/jHyT7HmxOARW6Cp42FRvLpvqHA65pLn1?=
 =?iso-8859-1?Q?vMQVCIuktoz2JemFrGXXdZim5pgaIyz86zvilqbW2uJNG7lZqL/YjDz8Mw?=
 =?iso-8859-1?Q?UW8J0R9fEfZDeowdJCu32P?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MPACBUhamZkK5250DFyrgRMWEMTFR8uTkR4IReQhfXD5ssekyV7rkpN0n8?=
 =?iso-8859-1?Q?sYQpxYkJ/11a6IoMcJUlgPEXuPec+n40sHWWwpdhZ3LNC3dbaGtdWfz/gR?=
 =?iso-8859-1?Q?Zjgg6wiWK3slCfIvJ2eS5VCtqksT+Tn0OVSPMLIsOYDIX6GTur/43oC8yy?=
 =?iso-8859-1?Q?iNVXGaP1gMIEk8mNXxJYcDtKencHbuKI1i5+GLJMQumF95ecY+WCFW45+P?=
 =?iso-8859-1?Q?PF1uT+p47hpC9gXCZHBQ1WFbxhXEd6bWLsF4yluPwKL4sc6Ga4YQkEIyRE?=
 =?iso-8859-1?Q?WZdYp9yIIJUdvot4LWseeHnA3fibSbBU38qiw2HDIqgQ1o4oG1X8wJ+aZB?=
 =?iso-8859-1?Q?oIgFme9QhvEwDEEP9lAF6pxFsHBsFLsulvum0PwaOccJh0YNci0Slsx4FC?=
 =?iso-8859-1?Q?KdJvklp0nBZ+y7FRzkXD6WaoTr5q/s4ybYm1kZwxewRDeRV3krp/E7i5XR?=
 =?iso-8859-1?Q?0x4RLrSAjJzYTmTsTshCQ0KzJSBOUBF9CRgg/MLHbXGuD28riZMqbAKuIS?=
 =?iso-8859-1?Q?ot7tBxEkW463tzzmhzqoxLoIGV1ZIDsm8PbNLBmMpUzOn+7YC263iLZDiF?=
 =?iso-8859-1?Q?cs65BjYE3kA16OEjh49p5IOsWKbuS+IVqMY5jgakmEh/zLcEFdDYV3L18U?=
 =?iso-8859-1?Q?4rpjlSu6w65f4MvrlzTAh2r7vnbWuYfoT1j/egJptJH/zFzahgW56eFnBb?=
 =?iso-8859-1?Q?ILC4pzbW/9/VKsaEhJAPr23tGiK8r2N0RkMXvKD2T3erQzXrwa21G66zCd?=
 =?iso-8859-1?Q?p+oRZcGnJ9w16aRm4R+3OcHkLBo7f2brEB8fHDqnr2S3cY8RPnOiov7jZz?=
 =?iso-8859-1?Q?AQYqumtBQVbKi1aQsq8hxwkKMijW7Y1sgAJicT92e2KHWLRAR5G90Uutye?=
 =?iso-8859-1?Q?w7k+XTztWGuUYmL8X/Ggz4RlYl1fTwZDkbtgZLy5Jvwpea9SRUcd5YZMJv?=
 =?iso-8859-1?Q?dCrHOYOkmA+temUUEtz7OslhwGSgEcVaaAhPw2JiPCkyUs+DqTTZ9Q3Veo?=
 =?iso-8859-1?Q?EpKUUAz0NJTL/Dvnt5cqVtvYpuAtj/yqxkAIOxufNNffZlDVFplq7RDUcN?=
 =?iso-8859-1?Q?GF1LfbcpVPnBmP3idVSx4999kgzRTMvOi5yQWHSCzVgwmyvTctgIbKzFQp?=
 =?iso-8859-1?Q?TGpd8APmDLWq5Apf88Myj/mK5pBhieovwsPTRq3GilkeStlk4YAYxgf//n?=
 =?iso-8859-1?Q?pg4JlYCKm1ee4RfDXC2+PDbrATzgKJGnZ7dMytbUOPFqZ6yy89xrJWQ/WX?=
 =?iso-8859-1?Q?uv7NEiUPYkNkef00He1E9vT7n7l53ulebz4aWkxSIcCEQP8RCQ43q7e49w?=
 =?iso-8859-1?Q?CCHGs/5kiu6S56EA1npYsUey7VLUey5IEEAEdr/yiJDwMYVSL3+Id2w//c?=
 =?iso-8859-1?Q?KnturMuWujACt1V8PZBUhhbnd1UxDgSfWEvmTCnC0vZWtkA614yabZk950?=
 =?iso-8859-1?Q?hcvBDVMiXNPEYsMSzKFlEM5Ih+zmCfn1wOuLHaONGZxHHXvzCOhtI80xw3?=
 =?iso-8859-1?Q?vRH/s52NBMPCWy88vEeJeDBtPXoBIzP/wJ77yYCMHi/ZaDVg/q63ZHJta5?=
 =?iso-8859-1?Q?DhMTuv1pNpqruGCu+oNYn+kxpsL1XR5+cd04RuGRrEiUgOMrzeerQu0a6x?=
 =?iso-8859-1?Q?iSfmlNtlRyzkyRlALY+p1PvEgF304AXZnW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ba05a0-2f27-4e57-282c-08dd39cc7e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 03:34:20.6942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYMIosN/n3yYfBSFnvFgsu3pjVvGxGgObRyu1TDryY7YpZ/0WJkWmpQ0uBEhB9XMV7IZQu2CrJ87aUXX/hMFjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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

> On Wed, Jan 08, 2025 at 11:09:02AM +0530, Arun R Murthy wrote:
> > Populate the list of formats/modifiers supported by async flip.
> > Register a async property and expose the same to user through blob.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 51
> > ++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index
> >
> ff9764cac1e71959e56283f61b5192ea261cec7a..e5e47f2219dae62e76cbde2e
> fb40
> > 266b047ab2b2 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -170,6 +170,44 @@ static const u32 icl_hdr_plane_formats[] =3D {
> >  	DRM_FORMAT_XVYU16161616,
> >  };
> >
> > +static u64 tgl_asyn_modifiers[] =3D {
> > +	DRM_FORMAT_MOD_LINEAR,
> > +	I915_FORMAT_MOD_X_TILED,
> > +	I915_FORMAT_MOD_Y_TILED,
> > +	I915_FORMAT_MOD_4_TILED,
> > +	I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > +	I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
> > +	I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
> > +	I915_FORMAT_MOD_4_TILED_BMG_CCS,
> > +	I915_FORMAT_MOD_4_TILED_LNL_CCS,
> > +};
> > +
> > +static u64 icl_async_modifiers[] =3D {
> > +	I915_FORMAT_MOD_X_TILED,
> > +	I915_FORMAT_MOD_Y_TILED,
> > +	I915_FORMAT_MOD_Yf_TILED,
> > +	I915_FORMAT_MOD_Y_TILED_CCS,
> > +	I915_FORMAT_MOD_Yf_TILED_CCS,
> > +};
> > +
> > +static u64 skl_async_modifiers[] =3D {
> > +	I915_FORMAT_MOD_X_TILED,
> > +	I915_FORMAT_MOD_Y_TILED,
> > +	I915_FORMAT_MOD_Yf_TILED,
> > +};
> > +
> > +static u32 intel_async_formats[] =3D {
> > +	DRM_FORMAT_RGB565,
> > +	DRM_FORMAT_XRGB8888,
> > +	DRM_FORMAT_XBGR8888,
> > +	DRM_FORMAT_ARGB8888,
> > +	DRM_FORMAT_ABGR8888,
> > +	DRM_FORMAT_XRGB2101010,
> > +	DRM_FORMAT_XBGR2101010,
> > +	DRM_FORMAT_XRGB16161616F,
> > +	DRM_FORMAT_XBGR16161616F,
> > +};
>=20
> I've just pushed my .can_async_flip() thing. I'm thinking with that all t=
his can
> just disappear and we can have a completely generic implementation. Eg
> something like:
>=20
Thanks, will rebase and push!

Thanks and Regards,
Arun R Murthy
--------------------
> intel_plane_format_mod_supported_async()
> {
> 	// some generic checks here (eg. reject planar formats)
>=20
> 	return plane->format_mod_supported() &&
> 		plane->can_async_flip();
> }
>=20
> > +
> >  int skl_format_to_fourcc(int format, bool rgb_order, bool alpha)  {
> >  	switch (format) {
> > @@ -2613,6 +2651,7 @@ skl_universal_plane_create(struct
> drm_i915_private *dev_priv,
> >  	unsigned int supported_rotations;
> >  	unsigned int supported_csc;
> >  	const u64 *modifiers;
> > +	u64 *async_modifiers;
> >  	const u32 *formats;
> >  	int num_formats;
> >  	int ret;
> > @@ -2715,6 +2754,18 @@ skl_universal_plane_create(struct
> drm_i915_private *dev_priv,
> >  	if (ret)
> >  		goto fail;
> >
> > +	if (DISPLAY_VER(dev_priv) >=3D 12)
> > +		async_modifiers =3D tgl_asyn_modifiers;
> > +	else if (DISPLAY_VER(dev_priv) =3D=3D 11)
> > +		async_modifiers =3D icl_async_modifiers;
> > +	else
> > +		async_modifiers =3D skl_async_modifiers;
> > +
> > +	drm_plane_create_format_blob(&dev_priv->drm, &plane->base,
> > +				     async_modifiers, sizeof(async_modifiers),
> > +				     intel_async_formats,
> > +				     sizeof(intel_async_formats), true);
> > +
> >  	if (DISPLAY_VER(dev_priv) >=3D 13)
> >  		supported_rotations =3D DRM_MODE_ROTATE_0 |
> DRM_MODE_ROTATE_180;
> >  	else
> >
> > --
> > 2.25.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
