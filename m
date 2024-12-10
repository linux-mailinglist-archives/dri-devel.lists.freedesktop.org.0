Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F689EAADB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 09:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF5710E822;
	Tue, 10 Dec 2024 08:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvEB0tsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C6710E822;
 Tue, 10 Dec 2024 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733820160; x=1765356160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ee9p/FG/us3QisL5gr9lk/kqMXlPELczPpN0YALuMig=;
 b=FvEB0tsm7PMJnGLPRp1PuSgFKGBjW8h9/5FIFd2j32cpc2blYDbTJ5d8
 Ib9VZCXCL65RaCWF9x60rovhRumLwsvBDSXYCfXOXEi6peONh/2F4oih/
 yzOZ8M9IGKrJpf/jjE/fB08ccOLMAYD9LBRikPcj84ABct2z9aXyqTCD3
 fTmjFz5yz8tJIZtAt13GKZ6TBGRsYndmQUGeutbsK2BzwsYWyRRmEuhy7
 rQyNM0BJdMn08xYxFyG5wZf2qeWOJJY7/0ej39t0M5j2j1ImGw8xqVZKg
 9hdXRKLZlMSSUB2syMAaBHEF3oFsCRRGGJhUxfjfBdtlOxX3/dp6nTAid w==;
X-CSE-ConnectionGUID: cAt9uqn1R0m1Qe2YkEfXfA==
X-CSE-MsgGUID: ANN9fYu+TdymTn3qfYmwkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34399871"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34399871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 00:42:39 -0800
X-CSE-ConnectionGUID: jDf0AdwbR6G5z3wh9ditnA==
X-CSE-MsgGUID: z8An300SQy2e/VMPxsy0RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="99401078"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 00:42:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 00:42:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 00:42:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 00:42:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkUhYy2Q6TZGs0GoCYdVlevMeJnzjDwyqafdI4e0Z27MuxFEvRrFJ8qKtVO7f/DIqR0T1XIIgqtfW3Una7WXMEVaNf5tZt25/o0c8J4ujF8gerTTVdOi1doycnCYnPUBkagrf1Q0yte2JdewZKkMLu8Rs87pVpL6fqOYL1o3KpeLGGiQ+4TvwsrnAkgh3z26tr8JzeX3yv8OWJWj6TsZ0tUNgKjoCnEypiJ7rFIiZu5uQ0AZ1PHTezielj2/PxngvVmzjryVLfDZKGNjU6JSnN6oF4dk9S3B1bruk/Qa79lb09YoCW9oGOFD/mM7JKoannGWjfKb/9qHGMJEJt7HUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odLLjVqQk8sTI0ybvpiz5BYGjjLGxuy3DNvTn/YWpz8=;
 b=VnkmuIL5bqQzhbnu0ZIWRlHDxiaaFwrbwv5hefQMqvCIOpEPczmrHPwV4pHEjWcSMd10h4W3LLvhvEkI3Xn1EJwfBp+xbYB3ZcNG26ZbuCFETW8oRaEFIiRsZjcOlDFIQJzGS3gSZPRYaZrrJKGjTv7WyyFdpIXLPZhuvtzZ3jv89eE8tHKeoroXtYqoGBgkZgd3d/o/Nq6ZaAiXDqTUU1qF9k2N8u5xFe0yJQ68+CDi03GdXpAbUGfUxJ/koOVHp9BJTHrZxHspsAm9PSCOctB1MQIeWtSsvIFJ+0RuVHRkLEaBdgJSLVgoMu/45thZLncbSA882Wl+T3cEb6IYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Tue, 10 Dec
 2024 08:42:36 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Tue, 10 Dec 2024
 08:42:36 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 01/10] drm/crtc: Add histogram properties
Thread-Topic: [PATCHv3 01/10] drm/crtc: Add histogram properties
Thread-Index: AQHbSlhPV7QoPwvZL02lhyw6ED9XxLLen34AgAB/+QA=
Date: Tue, 10 Dec 2024 08:42:36 +0000
Message-ID: <IA0PR11MB7307E1C101F417CFAE3B114ABA3D2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-2-arun.r.murthy@intel.com>
 <7tho6j262nzbu6nvjgzelsu3ljjipxdhazjlzdfa3xi2lbn3vs@bx55yrrbmshg>
In-Reply-To: <7tho6j262nzbu6nvjgzelsu3ljjipxdhazjlzdfa3xi2lbn3vs@bx55yrrbmshg>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB7682:EE_
x-ms-office365-filtering-correlation-id: 44fe7b39-c8c1-417a-2e2a-08dd18f69925
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Bmc0UY0mvCxHakcC97RZaKhuKM3O6gM1SgQ1828FHPbRQ3ISuS/cWYJBelK8?=
 =?us-ascii?Q?kAQaah5chDnN4HWpmn3dtIdKbPmqoyc69szygWDYCrnqiVfF/Zc5GWDsiMgG?=
 =?us-ascii?Q?HFsp9zt77qadgb7zI5NLJ9mON/tLhcsykbXo7YYQ0oaV8bMePcjCjFsMrgbA?=
 =?us-ascii?Q?TFOVl3CI0k7j+DwTKJDezEasUohLC9R3eFNbwORslKQ4EN5NEA+0yAxOJWNr?=
 =?us-ascii?Q?kLeMadVn9bHUo60Ssabwv678ga3J/lBg6IC0rn89n5ZWIp4Xr8cOU4whG5Km?=
 =?us-ascii?Q?tcKmkiqvQEQ4/gUPAgSEDq1RHj7eo1JSE65KVwZpT+Pfx1Y4nMMUF6onsAdV?=
 =?us-ascii?Q?psdX8hm3WEiQJsIPFXd1C3W9wB0BuLjczeEgSQQk3+b/5X+Ctdwq8mPnYk5x?=
 =?us-ascii?Q?gsGt5Wq2JIKktYO25cjvr/XFiQuh8ryznsu+4OPQ0uTGNtWkLHQQolgYpFUv?=
 =?us-ascii?Q?DPh+crbncwHA8LcWmF1VP0z9NW9eH/wCUS7ES+xpYUlHs1Ye53DhB8mFXA2I?=
 =?us-ascii?Q?qflKwEAsHzBCpE4npE2LOiOjUs/fm1Z1Rv/LUPmU3EHF1/p7o0f7+Ge6Y6TX?=
 =?us-ascii?Q?O9+pAT8FtY3UX187/sf7z6pQI2r8pTI4zm9S0e5hMGYXSgnfP9KTlHixe9NT?=
 =?us-ascii?Q?AigwXhDOoajRbNel/IwXVL8vYJ3oHp5eYKNB6sSsNJlle9hBcxWBq/BRO2ic?=
 =?us-ascii?Q?GUXkjG/s9UcTiW5RHVn1RSvPAADAAQXxbIG3EfzM5IiLCSOfnfz8OD7qCBLk?=
 =?us-ascii?Q?YIvpnOSottPOf1oFecjASVgPz8hRd+q0K5eabruTh24yruf1E8LmFzlBKSzd?=
 =?us-ascii?Q?VuxucyBt9hpfGqBIWRq8NLGb398DLVTJ8cn5seBvuvM8NfabjGtH9qWJOP5J?=
 =?us-ascii?Q?yfriC398y/EnpBwDz8tA3jCUAbwPGsVfHufHU3jBaR8dEoAcyBUseEydAp2+?=
 =?us-ascii?Q?mGUnVg77lBReD0eZQPGpbMyA5/YywXaB1atVqPcrimgTEMdHjs0aYBg25PSB?=
 =?us-ascii?Q?Byb/Ip+IY2jZ5VdaoL8dVObzIaMBbvl37vDwWk0QIAgciIuQ0fFLfm71Cc7G?=
 =?us-ascii?Q?QUK7/sFOIpukuakxVcHHi2JqygfWRlhbk5BY6ywXfxm/k+UCi54tekGm/R4/?=
 =?us-ascii?Q?iVOesZReKqoqLfKfib9iyMJLpzk4bjXyjo6hDTglMdJRUYyQ9bI4RmRx9g2Q?=
 =?us-ascii?Q?tjrs5jSafY2iqdOIUiB2v2HixnE9Q4jNNMV6gU1Kyu2nz5Yx6N9/ge4g0bP/?=
 =?us-ascii?Q?sGDueB8UykmDr28K+6XtXqeVBXf7tJ/0infguWHri6hhShZ5I8xYhQr3cnCz?=
 =?us-ascii?Q?DGEgojiBtBMTNSI12R/k9vYZj/XFuLsplq9pBWFYAbwo9Ft3lFPy2bjIFw9F?=
 =?us-ascii?Q?D1yLQwRuc+EnU4lltnKzjYodYJ69n2iqFehRprPGYbCsxIwGTQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mSf2V90m47D2HKfg7WQduz/X0J/l8+o5uX7CvAROPJD8RCL5Ojdrp/H23Nbe?=
 =?us-ascii?Q?u/4F+VCHlLAusAdv9/tpbANHuoDC+E0rwY1LByzDv2rbiVmdyd+HOvZ9LAPG?=
 =?us-ascii?Q?SVCJzJiwAQQ/mYGOC6Caze1O66087qnAh9h0FyiILGXKK3ahEMXZ+MlkFY+s?=
 =?us-ascii?Q?H4SRHpn2i2WA5b/+DYUz/7qYvVbXgW/wxT3EIhOXewVWZfbAloW9dB9MFjmi?=
 =?us-ascii?Q?hNRtgJnI3bl7690XRWGiSh8BcTaifigX2oVa81muCYX/Wi83NEVxxeSh8aqX?=
 =?us-ascii?Q?fFivQ9kflZUIKixAPI10h5q+zdeGukaStD6+MbIEzG8aYgOsegGyvP9ARlt+?=
 =?us-ascii?Q?Yb3b4zk/nhYyjsC4b4OKrImvyVDCOOROVmPVHqzsZklcldyDm4378YxzJbYr?=
 =?us-ascii?Q?qXFCrq2IbhFybPFaXGevQhRMYQVA/Qi7lCPwvEUfVycpdvMcUlNwcS07HdKF?=
 =?us-ascii?Q?iyppFD14dC6nCuoJN8z8xAlCXJShS5RrLjTa9P/FiAaEjc8CsFo77AXn4s6u?=
 =?us-ascii?Q?ZmmYxkkunUuzwCkrDzQO8jA/szj+IpnPf6ci/5SQm+d4aE5bvhKRFjCxtQD3?=
 =?us-ascii?Q?f0WY4HI0NMfK7TsRo39xEFG8Xt18EHdFWV4Db6qeY0EMAQMH8A2lVum3Ot/l?=
 =?us-ascii?Q?xfdrlFBhv2WNPrp62tCXpeV8rlGFem2G4fssDCpq5mBNx2XLcvnNmNWRKK6E?=
 =?us-ascii?Q?WsUNJmIfO+FGbsQ2l4QbRjLD5J6HlWKQez+cN3OdULmUp2K9dNmUpXV7eG6s?=
 =?us-ascii?Q?bD5CJBop5uCYZFK47KJpJGgtszhKb5otdk80pByecuGWZ/+hWhizlUFHTS4W?=
 =?us-ascii?Q?E+50nTyrYg0CLe7MLjWEvFhlX7ry6oOVZl2c2r3z9nDBpkGSrS7vDTIpKtMn?=
 =?us-ascii?Q?1jcBIYs9A1mNkTP+ldHKH1iH8fIw4eBdIcOQrbDTO9PnxJOj0ZwwQJ+ppJPX?=
 =?us-ascii?Q?RY0WoBGLiNxaVWmOQjJ6jJbw5NhAvxSdPeNrBurna4QD+GWUfycWXnrfzoVn?=
 =?us-ascii?Q?JVWSK6MDUCyWMNe6BPC4RI4RURMF/JtbJUpDEncOwXBMg13O+8JvuRci1qtS?=
 =?us-ascii?Q?xF2u/ZbBz6rsMiy4fXjdosVq/+9zEeBl4nC21/vbTmV18aeLxaxN3zQhOYAk?=
 =?us-ascii?Q?UT8VsI23nF+lS39iSei72jvQgiEqZFd7DnzyO73QmRaRgnrC2f1THGvxYxvm?=
 =?us-ascii?Q?uF+CoHxUCPJlX+aq1UuPEbDNkYVmRMo7iDgzmkkFQzF43J4UAv0sasku37o6?=
 =?us-ascii?Q?KNHLlwx3iHWJ7+KlsjNRaBbymiQFp35rDHPgpzOFOORp6lm7qgbTMLZTm1sd?=
 =?us-ascii?Q?hl30SG16Wd7LcNRkbNiYx1IkbEC5AqWG7AL7ZZEi3kD/8+SAA07RnxmNsrEP?=
 =?us-ascii?Q?kYfQ/mgJRIaAoegzScaEHHXypJuUOKat2c/N7NlXpvv5MZ83Z9dxVZFuYCdn?=
 =?us-ascii?Q?fFSlOhMeSgdgLXAjcvp3C11o2puCljpX4vmEaVKPxT4LKuT2iMG8fj7/T8rb?=
 =?us-ascii?Q?dhdkDpQYZI4E+RlTRm+tfcYBDmo14V78hvrRg/8pNUVFHBcSQT2MOEFGl6wN?=
 =?us-ascii?Q?NNxQjQx1ik2tb7Ai624rJsjO2Nvu2VvVc2eX8ys2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fe7b39-c8c1-417a-2e2a-08dd18f69925
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 08:42:36.6325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SPGDttttd4GA3jAUuK8vdWE8UXd6CcDO9HqDaQOCD9gsMp/pPkSfCGP/aKqqSs0sPbj2mq6YP1YA6g4KLZ17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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

> On Mon, Dec 09, 2024 at 09:54:55PM +0530, Arun R Murthy wrote:
> > Add variables for histogram drm_property, its corrsponding crtc_state
> > variables and define the structure pointed by the blob property.
> >
> > struct drm_histogram and drm_iet defined in
> > include/uapi/drm/drm_mode.h
> >
> > The property HISTOGRAM_ENABLE allows user to enable/disable the
> > histogram feature in the hardware. Upon KMD enabling by writing to the
> > hardware registers, a histogram is generated. Histogram is composed of
> > 'n' bins with each bin being an integer(pixel count).
>=20
> Is it really a count of pixels that fall into one of the bins?
It's the statistics generated for each frame that is sent to the display an=
d the value corresponds to 5 bit pixel depth.

>=20
> > An event HISTOGRAM will be sent to the user. User upon recieving this
> > event user can read the hardware generated histogram using crtc
> > property
>=20
> Nit: here and further, it's CRTC, not crtc
Ok.

>=20
> > HISTOGRAM_DATA. User can use this histogram data, apply various
> > equilization techniques to come up with a pixel factor. This pixel
> > factor is an array of integer with 'n+1' elements. This is fed back to
> > the KMD by crtc property HISTOGRAM_IET. KMD will write this IET data
> > back to the hardware to see the enhancement/equilization done to the
> > images on that pipe.
> > The crtc property HISTOGRAM_DATA and HISTOGRAM_IET is of type blob.
> >
> > For crtc property HISTOGRAM_DATA,
> > the blob data pointer will be the address of the struct drm_histogram.
> > struct drm_histogram {
> > 	u64 data_ptr;
> > 	u32 nr_elements;
> > }
> > Histogram is composed of @nr_elements of bins with each bin being an
> > integer value, referred to as pixel_count.
> > The element @data_ptr holds the address of histogam.
> > Sample:
> > Historgram[0] =3D 2050717
> > Historgram[1] =3D 244619
> > Historgram[2] =3D 173368
> > ....
> > Historgram[31] =3D 21631
> >
> > For crtc_property HISTOGRAM_IET,
> > the blob data pointer will be the address of the struct drm_iet.
> > struct drm_iet {
> > 	u64 data_ptr;
> > 	u32 nr_elements;
> > }
> > ImageEnhancemenT(IET) is composed of @nr_elements of bins with each
> > bin being an integer value, referred to as pixel factor.
>=20
> What are pixel factors? How are they supposed to be used? You have specif=
ied
> the format of the data, but one still can not implement proper HISTOGRAM
> support for the VKMS.
>
This pixel factor is a value that can be multiplied/appended/prepended to t=
he pixels of the incoming image on that pipe thereby enhancing the image qu=
ality.
=20
> > The element @data_ptr holds the addess of pixel factor.
> > Sample:
> > Pixel Factor[0] =3D 1023
> > Pixel Factor[1] =3D 695
> > Pixel Factor[2] =3D 1023
> > ....
> > Pixel Factor[32] =3D 512
> >
> > Histogram is the statistics generated with 'n' number of frames on a
> > pipe.
> > Usually the size of pixel factor is one more than the size of
> > histogram data.
>=20
> What does that mean? What does it mean if this "Usually" isn't being foll=
owed?
> Previously you've written that it always has n+1 elements.
>=20
In Intel platform its 'n' for histogram and 'n+1' for IET. Can vary with ot=
her vendors supporting this feature.
Hence have a variable(nr_elements) to convey this.

Thanks and Regards,
Arun R Murthy
--------------------
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  include/drm/drm_crtc.h      | 51
> +++++++++++++++++++++++++++++++++++++
> >  include/uapi/drm/drm_mode.h | 24 +++++++++++++++++
> >  2 files changed, 75 insertions(+)
> >
>=20
> --
> With best wishes
> Dmitry
