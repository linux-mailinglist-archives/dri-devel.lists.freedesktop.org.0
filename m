Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF4A18E48
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57A010E2FA;
	Wed, 22 Jan 2025 09:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1vx7nHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EBF10E2FD;
 Wed, 22 Jan 2025 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737538104; x=1769074104;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2b/I1o0sLbWWR372f8qnpvEopM4bAIlpo+LQFhs4Ik8=;
 b=D1vx7nHIsYkKBW0jqXfTOeshIF3GswtZDNsYe3UAN+1Dmh/W9TDTviRw
 g2+JNFgLK01lYqk2EX4xKgeYJT5ohV98rZdG6E9N8qTdiSrAap6WbH/er
 oPcKO9C4wajLLuEEQ+BcmlL2VdMoidH+H+i3rQtOV8dR2eEACH3Iff33N
 uylCGHi27B+svFoTzzUobdlAlUYBJBf3HRFoMQPlF2Mssu789/auto9zF
 C/MM3abacZ9RPa5xgE2Vjwhsp4FYEW9JROF0HZx4DCoWeg67105aQFc4z
 hkEuFcN2hgjg5EHX1rEZ9BsnYUJU+EK/RA1Kxm1soxb2kQiCh9h6X8qGy A==;
X-CSE-ConnectionGUID: qff7yRKrSxqfhuxZARHPkg==
X-CSE-MsgGUID: EP60JPz0S9yj3P2AawR63A==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37682777"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="37682777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 01:28:22 -0800
X-CSE-ConnectionGUID: w3X/XdSCQ1uFfaoXORtN7w==
X-CSE-MsgGUID: iga37SWqT2GcGxeNEP0KUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130388733"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 01:28:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 01:28:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 01:28:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 01:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTVaui0uRqzr7/z09C0MQH1pmvA80qbyjIQcESLyNQ8hK+pTBxOvkgEYVUgHPiTTBNVNEar/6lG0mOSEewT0iduB7Ow8nr9FEeG7fORAb6/Rzbc1aGWGUnEHGQBPitZ8yqcY8wV562PRurWzkdJVU17kgdNxl2TuTjvXQi1zrqLe29eOhw7Rp/m8bxS+effX2VWW9j7Q1grefbp7Qm0T7bW6mFEUE2S6ZjnrvvUcId7XvyfWhdUd2Xyz8oJmepAUyFQ9nZ0EQbf6qmNkxfdCIQ11r6AIrQ9Zu6G40KdCDAQvdBxcg5EB9cU/NKQTzthfYPU1IT0O9qYvvz7YiTeAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz6cR82BMPslLoOek4pQIrD6bDukZpEcE/sVO8qqlNQ=;
 b=spBAcPTu9cmLKGoA67TsiLSrSVrk9P46DIk+F50EjnbYfuL4yfcLcvIeMUFsgiFJD9dOdNGy3pmqoV3pKXgxVCEjV/YpSGFZniZ/fI5vDZbl7QxIZPgZMzjbvnWbJP7ytDL8cXdBJ33NOUTfTN8xA5vuUNmwiQFr+LErkrkt5sa3aQQsWw99Fg994E1Re+yensGFKhklqSH8Fa7qoDyYdD3RO1Ez/CfA5DtY4tBeXP5S6F/VNHMjA3JJ4oKo/CORkkI1LBo3zzq2IhlskrG6n/RAMOnEv6tozZKQc43U6Iz9iALqyR3pKIOI+c2pltQaplLf0VO6wBeAV5QJELq4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 09:27:49 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 09:27:49 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzhgFMA5eT/kS28E0OXJhdlLMgNIsAgAJivbA=
Date: Wed, 22 Jan 2025 09:27:49 +0000
Message-ID: <IA0PR11MB7307EF2ABEFEF5FE2F0D58B9BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com> <Z461PqtBPu2z9GPh@intel.com>
In-Reply-To: <Z461PqtBPu2z9GPh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA2PR11MB5051:EE_
x-ms-office365-filtering-correlation-id: 0c6a4a8f-0973-4eb4-1cb2-08dd3ac709d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?QNR0SY+Ho3xzk+P+eWUnVPd1UY43Mzro4OjTSJn6nfwt8TkYMd7mQbDc2w?=
 =?iso-8859-1?Q?XuSkbHlu7GEpi1EdkPsZqfGYRba3VcrTi1c3E3KGNs8N88c6YNwYZQoqTV?=
 =?iso-8859-1?Q?dntmm/sJ5lyNQE7OEdvgyCxWgImcIii95huWkISy/7Ps17Pw6hAahxdPLX?=
 =?iso-8859-1?Q?HIuE9lIxP17j17bHe5X8uxS/c/gq/SdbNSwC1OKIhPVKpFBjk+X5pq8PAD?=
 =?iso-8859-1?Q?cAGkH64X1i02FlyZFTFNV78sYOUAU0dNd7cgYHQAQf411E+e7WeF/Qa/Bw?=
 =?iso-8859-1?Q?bhtY753A125dG9Oz5ArUbig290uZKvbKUS2xbFvszOxTTvOtTqZfVsXVRV?=
 =?iso-8859-1?Q?KxAB5q7QX0KCv5aPUrrVJ58IB+v2YofoRlDDxVU30NeFafRek6z/CuQUpo?=
 =?iso-8859-1?Q?fFUwjhknG9wHws78UDfJr85qPXSIZ92HR4Tfcbeuvz+OiTVZilj5myKTWs?=
 =?iso-8859-1?Q?gqnP2zocp+SPFQHHwiHa3FTUUGYW4vtOGvgBXTHUGK0O0NyJoLmkt/vlNh?=
 =?iso-8859-1?Q?oGKK8Ci1eNIsCh8Q5mWx12WcZb+zvaOIkCoDoQkNdYlufiCdhRhisrVTxx?=
 =?iso-8859-1?Q?wkWrEKnfS7lArVKnbjZH+hA/g2HBONAx4M8jUFSSXv+tW9LM2aZn2611pL?=
 =?iso-8859-1?Q?PihO27Oi8LvqNN0fQ6OrjHhyiJbcTmsPv5LYSCNV6z7461tYpQQVG9qOa/?=
 =?iso-8859-1?Q?ta61XNy4uGtYcXA4b19r0wOQ/5v9wl7SkgwanqP42dgiXnov/xtZzBzgyW?=
 =?iso-8859-1?Q?eNF2VjslNXP9lvt17nF4NrcIzDzbB797TUYsE1k8x6SOkLJLIl3QF0o08g?=
 =?iso-8859-1?Q?m0O1XXi2T6unVwXhHj66EENDdkArYLZJfVktBUhr4vKt2tc+Uqm2gD3Oc0?=
 =?iso-8859-1?Q?wiVs3CcKGB5JzgTY4UuT5RTkvGo35OVuTyIO+ieTDBrnz+a9wy8m7QM17h?=
 =?iso-8859-1?Q?wlnEJ52VzyTKMJ64L0mxQKOXctjqDcTe6KmcAIdmdXugJIP2Dz64VOtHDb?=
 =?iso-8859-1?Q?19gLapE0Gb4CV0Nz0H3zva/byx8G7oSlThcUVxTEeoEHQSm0CX+uXvMRt2?=
 =?iso-8859-1?Q?jxNyZBtQB8NJT/r634+beDGa9ONKXqKxywwZ7u3RvbNauvGcJ5KonaEsEB?=
 =?iso-8859-1?Q?i4gsls2Xw83AfpcRUFFREWIW94vi/1ESlYf+zAncwK4R/CIpfwZBV11cvN?=
 =?iso-8859-1?Q?/K7lgQIHk2MKZAUrJUEyF1GVrqJbuMCs/dF0d2PP2FY8vMr1yXWBKzVn/C?=
 =?iso-8859-1?Q?T0Z5PIGgYwnMX1CH3xVzFdo/Xfhob90C3hQrfBXnC6uDPwKjrz1d2X7WdJ?=
 =?iso-8859-1?Q?WGR5EKRO/KyXyFNO+bCd9GDhFEuLQ22V/qgKNdVop/6viJQVUoq20enpZp?=
 =?iso-8859-1?Q?/5jJb8wU/furpOxzTWFeb3oNeQUH+vqmpBFq/9XT47cBzIyTj5iyzFJsX5?=
 =?iso-8859-1?Q?LM8dTU4HC+QCOcEJI+c4BqUK5UKF1rmkNDpfpMjYnZY7cyoPFV9GnDO0OB?=
 =?iso-8859-1?Q?Z1Yk+MURk6A3WSy4uhyf6I?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ESK+m+R9PRt2Awi3xRHl7MAi8E0sbEKLg/7hHj8NzR78+NYt3QNjqkYlMf?=
 =?iso-8859-1?Q?LVu+ThjFJzTyUImWVCjpvwp4jaEyi3UOphGI5SkjjA/pQcqTEuEMidq+ZX?=
 =?iso-8859-1?Q?D0iVG9Y+sROLBHYGo8iX4auUFWuJwt/mUcehz7dp9DMJXIuhaP5NPn0D0P?=
 =?iso-8859-1?Q?qnrnlG7BwsgnSPzSjsBbY/wOS5MFifOA8Z0OU0/yMHCsLKJKRBn2kJ1h5t?=
 =?iso-8859-1?Q?MGLmO2qCs5orH2Kj8xMs5GAwfXwb61d2k66ca5nuNvM2VfKoab4bkCI5Mc?=
 =?iso-8859-1?Q?mZWrkLKzgwn2FEQiVDMw9gf5HZPMmcLiqUZ3CQboMr3dkAWOEGF/LhvTDa?=
 =?iso-8859-1?Q?YbEirmE3CT7a3WZ+O5o+gssMJWF54DrE5hwTJonWlN5/nTlkG7U0XJUnqF?=
 =?iso-8859-1?Q?jvJhpNfm7CxHdMB9bEPcpK8JWRzVym2PfA1yt+KuXgFMa0wUDVAwSJF/yG?=
 =?iso-8859-1?Q?9W1gTG5neGNWUWlVSkZEX4f9wSj+kb5aGIHrnuWzLvhS33fDn7LZflNZj2?=
 =?iso-8859-1?Q?9fAjfZg59jy3xrqqrxf1QJNtQcowcoHYa+ErwqcY2Klx3IMYUZbdzLQ8Lf?=
 =?iso-8859-1?Q?w/X2JVMydMqQNHJ7lW2A05mitpniL8+QtVhZ2bMDyN8mdn8oFQDfYXhdIU?=
 =?iso-8859-1?Q?64KLvDZce6L7bPHIk6KqwSNFtbrQszQif9Wky3ysuA9zPca5nmR4DEmdmF?=
 =?iso-8859-1?Q?VcK3/YxBppMKGYeRfX1Bth+wc0/l4bCsVeorh9dXHg5XQzNgh0e+LskUTJ?=
 =?iso-8859-1?Q?FZ37CKh87qW0usZKr6ansfyUeP3DvdXRVbWvgjBu8j73wyDYxc6Gjh3m36?=
 =?iso-8859-1?Q?xotObkDdsVxCmzAg8Ox4L0SnblA4e4lr6NdfW1+JZW1jk/2KRMOTT2R/Xf?=
 =?iso-8859-1?Q?rXOP8mLTh7iI0CaKd9xadEd6ercBr6EjjzKZdnqSK/8joerfI5GqjvxgLz?=
 =?iso-8859-1?Q?ZJP9ldy6wBPkCa8oVbIZ6kUsS6m3uktdzpUf7b8EL2LMpeZ6tBcw5nRvX0?=
 =?iso-8859-1?Q?PxY3HSq/6479liM2P/rfRLCVSHLXc9pbcOb+9DH8+0g1TAp3BbajJyHjvr?=
 =?iso-8859-1?Q?Dtc9cgJGR31oYNvggj82mrWgzrBbEKOGB14MkWoGM43OWMbIfgV0SRGfas?=
 =?iso-8859-1?Q?iA+onN+Cwne3qPT6Uqm8DXBFH00BUPd5Dye0CqEg6/VN382urPyA1hj686?=
 =?iso-8859-1?Q?cHq9VRhbyLFkgGNzMXF77mqRINCuzwMB/lTlypqxbbH+cXt2Ggt42Qqq+y?=
 =?iso-8859-1?Q?VkwJXBATAtgxO0FRPsBJ2q+ESwGe9gVu6raj5vx9DPwau/05nTJphXWOCu?=
 =?iso-8859-1?Q?sErB04gv0nKb10DrDnXjbJWS6lpzEkQ6z9dIfPZ/3Srqj6N3WYp//NHq5V?=
 =?iso-8859-1?Q?HxjV1j/OCV8FLIKkpfJEaGVqmtajVHCETNQ6ZjSD13EyexWyltfoRSEhNE?=
 =?iso-8859-1?Q?aoV9ji3Uqsnrxln7AHXKwEwDyQuEU54sU8TWST3u6UoCKGZbqyt+C40EjA?=
 =?iso-8859-1?Q?Bwtm1M6+t4RY41clRI5gNqjQ6jXpJ9KE9VI8i6WGK9RZ5ICVYjCzviecqC?=
 =?iso-8859-1?Q?6xuanc23VZ2ddY2aOZM7qTl1aPzt6cEJ9GeIE7eldILGuKXaFZgJLB4ajH?=
 =?iso-8859-1?Q?hL6ANUCs+OsQasUQOFajko+fYp7/2dXhKDXxgDh1BAcY0D4UZcu5C2hh5b?=
 =?iso-8859-1?Q?5ReprJa33COxAaV+QqR3klFdCInd0fM2R7C+dCw/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6a4a8f-0973-4eb4-1cb2-08dd3ac709d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 09:27:49.3529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T41kGW8yz3dG4DFquydpW0EaBZfTr0Hjw91yCAGc8aVLoHe24LsjTOnkBN3EhFiDQRrYOSj8iEMcvtzq7WfS4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
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

> On Wed, Jan 08, 2025 at 11:09:00AM +0530, Arun R Murthy wrote:
> > Expose drm plane function to create formats/modifiers blob. This
> > function can be used to expose list of supported formats/modifiers for
> > sync/async flips.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/drm_plane.c | 44 +++++++++++++++++++++++++++++-------
> --------
> >  include/drm/drm_plane.h     |  4 ++++
> >  2 files changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index
> >
> 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..4f35eec2b7770fcc90c3e07a906
> 8
> > b31c0563a4c0 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -191,7 +191,10 @@ modifiers_ptr(struct drm_format_modifier_blob
> *blob)
> >  	return (struct drm_format_modifier *)(((char *)blob) +
> > blob->modifiers_offset);  }
> >
> > -static int create_in_format_blob(struct drm_device *dev, struct
> > drm_plane *plane)
> > +int drm_plane_create_format_blob(struct drm_device *dev,
> > +				 struct drm_plane *plane, u64 *modifiers,
> > +				 unsigned int modifier_count, u32 *formats,
> > +				 unsigned int format_count, bool is_async)
> >  {
> >  	const struct drm_mode_config *config =3D &dev->mode_config;
> >  	struct drm_property_blob *blob;
> > @@ -200,14 +203,14 @@ static int create_in_format_blob(struct drm_devic=
e
> *dev, struct drm_plane *plane
> >  	struct drm_format_modifier_blob *blob_data;
> >  	unsigned int i, j;
> >
> > -	formats_size =3D sizeof(__u32) * plane->format_count;
> > +	formats_size =3D sizeof(__u32) * format_count;
> >  	if (WARN_ON(!formats_size)) {
> >  		/* 0 formats are never expected */
> >  		return 0;
> >  	}
> >
> >  	modifiers_size =3D
> > -		sizeof(struct drm_format_modifier) * plane->modifier_count;
> > +		sizeof(struct drm_format_modifier) * modifier_count;
> >
> >  	blob_size =3D sizeof(struct drm_format_modifier_blob);
> >  	/* Modifiers offset is a pointer to a struct with a 64 bit field so
> > it @@ -223,37 +226,45 @@ static int create_in_format_blob(struct
> > drm_device *dev, struct drm_plane *plane
> >
> >  	blob_data =3D blob->data;
> >  	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > -	blob_data->count_formats =3D plane->format_count;
> > +	blob_data->count_formats =3D format_count;
> >  	blob_data->formats_offset =3D sizeof(struct drm_format_modifier_blob)=
;
> > -	blob_data->count_modifiers =3D plane->modifier_count;
> > +	blob_data->count_modifiers =3D modifier_count;
> >
> >  	blob_data->modifiers_offset =3D
> >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> >
> > -	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
> > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> >
> >  	mod =3D modifiers_ptr(blob_data);
> > -	for (i =3D 0; i < plane->modifier_count; i++) {
> > -		for (j =3D 0; j < plane->format_count; j++) {
> > -			if (!plane->funcs->format_mod_supported ||
> > +	for (i =3D 0; i < modifier_count; i++) {
> > +		for (j =3D 0; j < format_count; j++) {
> > +			if (is_async ||
> > +			    !plane->funcs->format_mod_supported ||
> >  			    plane->funcs->format_mod_supported(plane,
> > -							       plane-
> >format_types[j],
> > -							       plane-
> >modifiers[i])) {
> > +							       formats[j],
> > +							       modifiers[i])) {
> >  				mod->formats |=3D 1ULL << j;
> >  			}
> >  		}
> >
> > -		mod->modifier =3D plane->modifiers[i];
> > +		mod->modifier =3D modifiers[i];
> >  		mod->offset =3D 0;
> >  		mod->pad =3D 0;
> >  		mod++;
> >  	}
> >
> > -	drm_object_attach_property(&plane->base, config-
> >modifiers_property,
> > -				   blob->base.id);
> > +	if (is_async)
> > +		drm_object_attach_property(&plane->base,
> > +					   config->async_modifiers_property,
> > +					   blob->base.id);
> > +	else
> > +		drm_object_attach_property(&plane->base,
> > +					   config->modifiers_property,
> > +					   blob->base.id);
>=20
> IMO the function should only create the blob. Leave it to the caller to a=
ttach it.
>=20
Prior to this change for sync formats/modifiers the property attach was als=
o done in the same function. So retained it as it.

> The 'is_async' parameter could also be replaced with with a function poin=
ter to
> the appropriate format_mod_supported() function. That makes the
> implementation entirely generic.
>=20
If the list of formats/modifiers for sync and async is passed to this funct=
ion, then based on the list the corresponding function pointer can be calle=
d.
This was done in the earlier patchset.

> >
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL(drm_plane_create_format_blob);
> >
> >  /**
> >   * DOC: hotspot properties
> > @@ -476,7 +487,10 @@ static int __drm_universal_plane_init(struct
> drm_device *dev,
> >  	}
> >
> >  	if (format_modifier_count)
> > -		create_in_format_blob(dev, plane);
> > +		drm_plane_create_format_blob(dev, plane, plane->modifiers,
> > +					     format_modifier_count,
> > +					     plane->format_types,
> format_count,
> > +					     false);
> >
> >  	return 0;
> >  }
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
> >
> e8749e6fc3bc0acfc73bbd8401f85c3126e86759..eb84830fbb723e39436bfbadf
> 369
> > 894a5657cd45 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -1008,5 +1008,9 @@ int
> > drm_plane_create_scaling_filter_property(struct drm_plane *plane,  int
> drm_plane_add_size_hints_property(struct drm_plane *plane,
> >  				      const struct drm_plane_size_hint *hints,
> >  				      int num_hints);
> > +int drm_plane_create_format_blob(struct drm_device *dev,
> > +				 struct drm_plane *plane, u64 *modifiers,
> > +				 unsigned int modifier_count, u32 *formats,
> > +				 unsigned int format_count, bool is_async);
>=20
> I don't think this needs to be exposed to anyone.
> __drm_universal_plane_init() should just populate both the normal blob, a=
nd
> and the async blob (iff
> .format_mod_supported_async() is provided).
>=20
Ok!

Thanks and Regards,
Arun R Murthy
--------------------
