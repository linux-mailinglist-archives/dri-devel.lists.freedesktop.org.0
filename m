Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA009BF06F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 15:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D03310E705;
	Wed,  6 Nov 2024 14:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nh6SyQ8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DB810E711;
 Wed,  6 Nov 2024 14:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730903698; x=1762439698;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4LFmpKbVhJdk7+izAcw1I14443FdzQfdqJPXmZ0jQEM=;
 b=Nh6SyQ8Jh783daVUahex9k8D5o3nzW/qmAfnL5qbE72OohNuCWe72WcI
 XsC/1UKhZS+fO1fPG3W+F8nHi5oEXw17/MvIdpvexy1roouiPPsNg3/S5
 s3ky64RxEV8JGG6M527d8Nep2pjt/ym0CY6Z6WJttDinnCVJ1njMClZvY
 Bw9FgIuA3ruXRSHP2NteQ09KTbt+kSIcniJx4YQ8svAF6tCPMEDalCCEP
 WzNSOSTjelDZTIBcVovf4h2Ltc+q6gfbOQx0l8/Xkdmw+lg/VORSkNJNH
 YvEZRv+p8rAds2vRtR2amGOyJ2sJeDNpdm1Zn6d5Cb/J3zZOlNlB6ooau w==;
X-CSE-ConnectionGUID: 7yD4ROegRaKR0kgtCjYaLA==
X-CSE-MsgGUID: XnsA5fpZQLWUNVP/l/C1kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30922118"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="30922118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:34:55 -0800
X-CSE-ConnectionGUID: WNBsZGHpSXK5Ttzo2CdyZQ==
X-CSE-MsgGUID: z/ApAYXEQUyFDCZEvsRGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="122093865"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 06:32:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 06:32:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 06:32:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 06:32:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOvDDgX/E9fh0YNqjZv0V2+pDW0ca0i2vP+VF/hSQegGsITg1n6HkMdPYzYHCtsiJjVDlzOFEqunjyORoXAbnj15aR2pqklp00hGYPXmlCtlaLBTTKovFXDw/ltzA3QvBIsTTjTBXfcgf3vzivqLpNXCrt18aXd+uDW1ud6cZlsmfhZFlRVKXHQ8ieZK2+bRt6UwaRc/bGEXmzN4LFbM2b9Z30WM279Dm0YASrE01d3uTQBKQ4belNswyhqMhLH01FgbPCU2q/rP0phS7RH05FSsf9gNGZSpqT2FH/d7UeOrnxcBbxzufSYIy0cQu2Weh4avzmYLx/X8z0ED31oAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulJtwVlFfmUP+l6lJLIyIduacP3OmoQz/GwUD82t0GY=;
 b=QQCZrClIiqHf7P2svhh/c/acJZQE1+48tKK5eG8nXSntwG0UbpxwjWfgFcniH9x/KEJ8eFlVB0LD+5Ij73qC4FVLrXxN+F/Srh7207K9kqF0ztUeAd2oIFxX3IuscbAVSaig9ej6lhiTAyngTLgQHlp3PFUoz2YWFGkh4XAsph1TYufFC4VjMg0Z7OA8yX2GJmEEHeAQbA4UpH1TqR/aAifbjm8Lzz7aUQu9NNfQQ/sZdL22+1LcLDULiWX2q1Hpmoa1QUXYjx8U+5O3KDw8kQzvBIX0QhaouYLr1DxvD/TQDaId1BO4VmfYb8Qyy5NcZoTeI2FqnB3KcjS09onobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 14:32:28 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Wed, 6 Nov 2024
 14:32:28 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH 1/4] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbL26ABpt6pzKSnk6RpEgj2vj/dbKqSbcAgAAHrlA=
Date: Wed, 6 Nov 2024 14:32:28 +0000
Message-ID: <IA0PR11MB73075C7117AC1F0CF0344C29BA532@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
 <20241105102608.3912133-2-arun.r.murthy@intel.com>
 <Zyt2lLQZca4FzbXo@intel.com>
In-Reply-To: <Zyt2lLQZca4FzbXo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS7PR11MB7888:EE_
x-ms-office365-filtering-correlation-id: 2db9288e-b028-4fa4-df25-08dcfe6fd6eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?FnAb0jVWfYHG/K1oFy9h1Y6FFT3tYjiOSyArF3MLXlWC4/l24FT3/NOBrU?=
 =?iso-8859-1?Q?W4N7PVoFcibM4akUtMAOC3zYadxU74SgxMFCWLW1/XY0qNQiP4aJ0loOp3?=
 =?iso-8859-1?Q?HwZWsyJNjtyPAWXvx+a8TA2VI+yu6f1N8kTG9nU8pgcqYsjQWJFSz1lUXH?=
 =?iso-8859-1?Q?M61ymtbggjXsaCIUxtbgI5a3q+uRrkIsbMRLsiE9vvnk30qjeIGURGb4um?=
 =?iso-8859-1?Q?eu0q0QlTywFnO6tFKEBqTomrWxBeHS6xPgMdKMki4qKpSWFESpGZwFDa4Q?=
 =?iso-8859-1?Q?ipQYenFohCnURsj66fxzV5VIAOpKvcDomrXyd13IzTu0aGID4T7qVMFas8?=
 =?iso-8859-1?Q?UNoD8ah7hT35dYw5gcH7KGiL43i/do0XTdbWTh/Ec9n8JaqEpN2y63g0vU?=
 =?iso-8859-1?Q?NbOP/KPfM7aKZzpZSr+Qb+O6bF+I+WzdZrIdI09oQGqYKpAHtzQKmuyuqy?=
 =?iso-8859-1?Q?XUb821tHMoQKF6EC7tiLHxD3Pf8nhMGnLpR4BlduRwdhtKa8P2kx97S5bw?=
 =?iso-8859-1?Q?RPpLCNoTQuzNxp1xTfrSR/rWq49gFZMCxigkfyXEAC9jlGccu+gFD472gy?=
 =?iso-8859-1?Q?BFzE5d72RIowwZkqJ84iRSZFFjUTK0KJ1yuCyvz/d7PW8256wKZf1FCGml?=
 =?iso-8859-1?Q?W7Kh5ZgYMFei7WhLitsSkuvbPstVrxWu8nniCU583t06OyVwjgrc0pM0HP?=
 =?iso-8859-1?Q?gTyMFhZTltdQIrJRMvZ7K89/eqxzY6mrL4dmHY7MYfW5clr5Nvzh4MYyEI?=
 =?iso-8859-1?Q?sErRCErULoPjOcvv7uYpLcnyzNHA4Ry8gq8i1M1OyKEtAYKh+UijAT1Haa?=
 =?iso-8859-1?Q?/9l+lIfgP5fp9Vai0T7tE7g/+r/tVLBUPU3H5W4Bsja5VqcoO90Z/nPESp?=
 =?iso-8859-1?Q?O4BaFv55OmUEVMnzC2JOd+hNsvblMJQv8j5Xp58EdJIL2b4p1qpl+Iu/gp?=
 =?iso-8859-1?Q?kmvsXaleTI+BXqjTuBhNryvXGxKDdclV7pYI3qADgCH2pUQiqJw3p44cF2?=
 =?iso-8859-1?Q?KrJT1zqIR1J5/bzTcP/wAHpqOmjkWauvNavZZ9jkWQePAQ5YF+eQnrpf8M?=
 =?iso-8859-1?Q?9wT7QSjEam7HctAnTxCcMfwSHPOcp7vEOUhh2vfvbvLy2Zv7a/UJuhFEqE?=
 =?iso-8859-1?Q?hG4Jnz2HB92UXL8xyTNJnvMeTkYsZRQ1C7aEn+/B9FH1f/RuF5/sPLtBB5?=
 =?iso-8859-1?Q?6grg0Ef8th6QywXL007zFDAB+hvc0rtFz/wrA4Z7AafV0H2xFhY3zm7IUC?=
 =?iso-8859-1?Q?31Uft0OIGH7SdJ8rqxzbaAa4PEyhLjbY7J8HQ1KKo2fbHgQ2IctqGdrSDa?=
 =?iso-8859-1?Q?yIJhTAkWXvjw27zUEGJOwUXytCPIj0A3YFEcfADyZdWIZBKWmvM+wBXruQ?=
 =?iso-8859-1?Q?GCBGwfX7+r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kbRQg6ZLirrUFtgL2JHp0VjLvcdm3VRcoZgHASLdpPt0Uub4jSFZWvj+Oo?=
 =?iso-8859-1?Q?nMMyzwkROZZnpeOe/qDl7h4CtIa/l0BRgIGBYS6n7wlw4qMgQD6LtN/a/3?=
 =?iso-8859-1?Q?bdgT+gZD4OfNx6wQELYSRvTE3pyjb2gYzHGiLn5/Yw5umPZzpYBzAyDqge?=
 =?iso-8859-1?Q?22P3gkzG/W+igqlbTzJbGNNotRNwb403hetd8wb0dKNdQ+iB9tHJ2akDOd?=
 =?iso-8859-1?Q?1jplIMf8qBJt1X/xzwOSzxOaJOwEs4HD3W348rWe2xMZ2d1x7V8p5/EDuO?=
 =?iso-8859-1?Q?vQFlB+Bj8fCnnb3QSHgrjTXsha2EqfAq7w/FHpv3QjBpCE7vgL1ojkJOOm?=
 =?iso-8859-1?Q?kCnzb1FvM7aGvDxXU/XAZCv1D0QIQgm8hA3HgCC+32dFXlOEubdb8o4vHl?=
 =?iso-8859-1?Q?C8TW75vgOygakqMuH3QBzRJ7qPvNq+U/RcU1NbsiiDuo+0nkRt3zf+Z6fy?=
 =?iso-8859-1?Q?mG0I/Za+t4if4qtJQTJavS8KcWsSv/GQf2MN+fqcZrADH6BlJsEzcDm0Kf?=
 =?iso-8859-1?Q?j+VFaKeo+eu0qATKNMe6UXbm19dUzsZ/vvBTXqupFvAP5UH+TVfZiR9JCL?=
 =?iso-8859-1?Q?5gk1TuASmREmVh/SZIQ0olWn3W73zTgpKQ3LLAYX+Y/HqxYhgPQLuWjkMp?=
 =?iso-8859-1?Q?n/L/ruYR6XNQCQgPVtQ6bAo6YniC4EgmnN+a8OuzbfgQZ4e9w4y0JkwsoH?=
 =?iso-8859-1?Q?DbGDXkCaLgTElkW3j1yVyEBvwM0oJ60CwBV3cmN3GmHMQ1jWxH3rnTIcld?=
 =?iso-8859-1?Q?6muT+eOfNrUZ/6ivkkAgbFA6q09q1IMVSIx9pNKBjRSX8RV9SlDfjyKO1z?=
 =?iso-8859-1?Q?Z8iz40wrHICScba8N0P8N0F7peM9vun7hiwZ4aMSxCLrNq9pbfcMsk8c9M?=
 =?iso-8859-1?Q?WYxD50lRq1UyIPdUG6uhz8j55StIsIzld4EXo+CK/qcq1OnYReFXn9GTfl?=
 =?iso-8859-1?Q?hPponn5e8ATC86L6TpUEUkTSoVJ15P3l8THCkiqYJILI4Z3xUI1D4Ar4dv?=
 =?iso-8859-1?Q?AsMuOUjStmUuYb3mQQwLJkr5DBKIaD5iSIT5WGYLhniU9WItqE056iHy66?=
 =?iso-8859-1?Q?yM2gYi6gh3IcRauP+3DZQtKlOKhZOROrodVqufu2sRSi47tcRIuD6lVOTZ?=
 =?iso-8859-1?Q?kMuWiHEh1PQmP8SyevYKRHvb+bHRUlwjRDikUN/EJOiioR3fS9/+GPkB6e?=
 =?iso-8859-1?Q?tr1quEQw3HkMHBp/R+5LtNQURdMB4cPprE2z8LIAKXe1Pm6b2v1PFrjLgl?=
 =?iso-8859-1?Q?Pe4RBGQJs6NsLMGVk1Whg6k7dFkU5sb9luTfcQvp8igBlyVO824YVyebdO?=
 =?iso-8859-1?Q?4tIMXy3Afa1qEf67h4fND+HkHzVYKYT3zC86WVlcdf4fet1woGFJScCrdw?=
 =?iso-8859-1?Q?ocOosfqVndni/q2PnB3LKfYcjwglhmdBTMQdoetPex+WLI9IDn2NkBdWid?=
 =?iso-8859-1?Q?+95JSTozzAjAC+v2BYy2+MeHMZTbuPwRd3BBEEXam1l5CbaqZanoQRZVO1?=
 =?iso-8859-1?Q?WZ3EWdw44gyk/VHh5Ykm9is4sM5IqwN7tP6bLfNnffT27JU1UjqSEechxN?=
 =?iso-8859-1?Q?rBWOc6fY2l2iybBQmEH72nacsGjSSwSaanXYIGQO3cSuTxJBNUOCRBsbHH?=
 =?iso-8859-1?Q?EV5++0sch0PLqNOZcRhT2F/vxdegxlU4k8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db9288e-b028-4fa4-df25-08dcfe6fd6eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 14:32:28.0333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YTlgzKA4Ls/LGEjYoTgJVwJimO8XzOHOCFSU3dJVl2RiZlfRCg/LALDjRBFp6jS2mDUKdj1Whplqh23YRVnmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Wednesday, November 6, 2024 7:31 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Subject: Re: [PATCH 1/4] drm/plane: Add new plane property
> IN_FORMATS_ASYNC
>=20
> On Tue, Nov 05, 2024 at 03:56:05PM +0530, Arun R Murthy wrote:
> > There exists a property IN_FORMATS which exposes the plane supported
> > modifiers/formats to the user. In some platforms when asynchronous
> > flips are used all of modifiers/formats mentioned in IN_FORMATS are
> > not supported. This patch adds a new plane property IN_FORMATS_ASYNC
> > to expose the async flips supported modifiers/formats so that user can
> > use this information ahead and done flips with unsupported
> > formats/modifiers. This will save flips failures.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/drm_mode_config.c |  7 +++
> >  drivers/gpu/drm/drm_plane.c       | 73
> +++++++++++++++++++++++++++++++
> >  include/drm/drm_mode_config.h     |  6 +++
> >  include/drm/drm_plane.h           | 10 +++++
> >  4 files changed, 96 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_mode_config.c
> > b/drivers/gpu/drm/drm_mode_config.c
> > index 37d2e0a4ef4b..cff189a2e751 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -379,6 +379,13 @@ static int
> drm_mode_create_standard_properties(struct drm_device *dev)
> >  		return -ENOMEM;
> >  	dev->mode_config.size_hints_property =3D prop;
> >
> > +	prop =3D drm_property_create(dev,
> > +				   DRM_MODE_PROP_IMMUTABLE |
> DRM_MODE_PROP_BLOB,
> > +				   "IN_FORMATS_ASYNC", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	dev->mode_config.async_modifiers_property =3D prop;
> > +
> >  	return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index a28b22fdd7a4..01b8e6932fda 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -141,6 +141,12 @@
> >   *     various bugs in this area with inconsistencies between the capa=
bility
> >   *     flag and per-plane properties.
> >   *
> > + * IN_FORMATS_ASYNC:
> > + *     Blob property which contains the set of buffer format and modif=
ier
> > + *     pairs supported by this plane for asynchronous flips. The blob =
is a struct
> > + *     drm_format_modifier_blob. Without this property the plane doesn=
't
> > + *     support buffers with modifiers. Userspace cannot change this pr=
operty.
> > + *
> >   * SIZE_HINTS:
> >   *     Blob property which contains the set of recommended plane size
> >   *     which can used for simple "cursor like" use cases (eg. no scali=
ng).
> > @@ -249,6 +255,70 @@ static int create_in_format_blob(struct drm_device
> *dev, struct drm_plane *plane
> >  	return 0;
> >  }
> >
> > +static int create_in_format_async_blob(struct drm_device *dev, struct
> > +drm_plane *plane) {
> > +	const struct drm_mode_config *config =3D &dev->mode_config;
> > +	struct drm_property_blob *blob;
> > +	struct drm_format_modifier *async_mod;
> > +	size_t blob_size, async_formats_size, async_modifiers_size;
> > +	struct drm_format_modifier_blob *blob_data;
> > +	unsigned int i, j;
> > +
> > +	async_formats_size =3D sizeof(__u32) * plane->async_format_count;
> > +	if (WARN_ON(!async_formats_size)) {
> > +		/* 0 formats are never expected */
> > +		return 0;
> > +	}
> > +
> > +	async_modifiers_size =3D
> > +		sizeof(struct drm_format_modifier) * plane-
> >async_modifier_count;
> > +
> > +	blob_size =3D sizeof(struct drm_format_modifier_blob);
> > +	/* Modifiers offset is a pointer to a struct with a 64 bit field so i=
t
> > +	 * should be naturally aligned to 8B.
> > +	 */
> > +	BUILD_BUG_ON(sizeof(struct drm_format_modifier_blob) % 8);
> > +	blob_size +=3D ALIGN(async_formats_size, 8);
> > +	blob_size +=3D async_modifiers_size;
> > +
> > +	blob =3D drm_property_create_blob(dev, blob_size, NULL);
> > +	if (IS_ERR(blob))
> > +		return -1;
> > +
> > +	blob_data =3D blob->data;
> > +	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > +	blob_data->count_formats =3D plane->async_format_count;
> > +	blob_data->formats_offset =3D sizeof(struct drm_format_modifier_blob)=
;
> > +	blob_data->count_modifiers =3D plane->async_modifier_count;
> > +
> > +	blob_data->modifiers_offset =3D
> > +		ALIGN(blob_data->formats_offset + async_formats_size, 8);
> > +
> > +	memcpy(formats_ptr(blob_data), plane->async_format_types,
> > +async_formats_size);
> > +
> > +	async_mod =3D modifiers_ptr(blob_data);
> > +	for (i =3D 0; i < plane->async_modifier_count; i++) {
> > +		for (j =3D 0; j < plane->async_format_count; j++) {
> > +			if (!plane->funcs->format_mod_supported ||
> > +			    plane->funcs->format_mod_supported(plane,
> > +							       plane-
> >async_format_types[j],
> > +							       plane-
> >async_modifiers[i])) {
> > +				async_mod->formats |=3D 1ULL << j;
> > +			}
> > +		}
> > +
> > +		async_mod->modifier =3D plane->async_modifiers[i];
> > +		async_mod->offset =3D 0;
> > +		async_mod->pad =3D 0;
> > +		async_mod++;
> > +	}
> > +
> > +	drm_object_attach_property(&plane->base, config-
> >async_modifiers_property,
> > +				   blob->base.id);
> > +
> > +	return 0;
> > +}
>=20
> That is a verbatim copy of the existing code. Please refactor the current=
 code so
> that it can be reused.
>=20
Ok will look into it in the next revision.

> > +
> >  /**
> >   * DOC: hotspot properties
> >   *
> > @@ -472,6 +542,9 @@ static int __drm_universal_plane_init(struct
> drm_device *dev,
> >  	if (format_modifier_count)
> >  		create_in_format_blob(dev, plane);
> >
> > +	if (plane->async_modifier_count)
> > +		create_in_format_async_blob(dev, plane);
> > +
> >  	return 0;
> >  }
> >
> > diff --git a/include/drm/drm_mode_config.h
> > b/include/drm/drm_mode_config.h index 271765e2e9f2..0c116d6dfd27
> > 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -936,6 +936,12 @@ struct drm_mode_config {
> >  	 */
> >  	struct drm_property *modifiers_property;
> >
> > +	/**
> > +	 * @async_modifiers_property: Plane property to list support
> modifier/format
> > +	 * combination for asynchronous flips.
> > +	 */
> > +	struct drm_property *async_modifiers_property;
> > +
> >  	/**
> >  	 * @size_hints_property: Plane SIZE_HINTS property.
> >  	 */
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
> > dd718c62ac31..d9571265251a 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -658,11 +658,21 @@ struct drm_plane {
> >  	 */
> >  	bool format_default;
> >
> > +	/** @format_types: array of formats supported by this plane */
> > +	uint32_t *async_format_types;
> > +	/** @format_count: Size of the array pointed at by @format_types. */
> > +	unsigned int async_format_count;
> > +
> >  	/** @modifiers: array of modifiers supported by this plane */
> >  	uint64_t *modifiers;
> >  	/** @modifier_count: Size of the array pointed at by @modifier_count.
> */
> >  	unsigned int modifier_count;
> >
> > +	/** @modifiers: array of modifiers supported by this plane */
> > +	uint64_t *async_modifiers;
> > +	/** @modifier_count: Size of the array pointed at by @modifier_count.
> */
> > +	unsigned int async_modifier_count;
>=20
> I'm not sure adding any of this is really useful. I think we could just a=
dd a new
> .format_mod_supported_async() hook instead (which could be implemented in
> terms of the current thing + something like
> https://patchwork.freedesktop.org/patch/619047/?series=3D139807&rev=3D3
>=20
> That would also be more flexible since it can allow specific
> format+modifier combinations to be either accepted or rejected.
>=20
This would not serve the purpose. The purpose here is to expose the support=
ed list to the user so that user can have this ahead and check for the modi=
fier/format before sending the flip. This would avoid async flip failures d=
ue to unsupported modifier/format.

This approach has been acknowledged from the userspace which can be located=
 @ https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063

Thanks and Regards,
Arun R Murthy
-------------------
> > +
> >  	/**
> >  	 * @crtc:
> >  	 *
> > --
> > 2.25.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
