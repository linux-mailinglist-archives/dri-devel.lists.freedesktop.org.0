Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B4972A8D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2C410E71F;
	Tue, 10 Sep 2024 07:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRyrh5MT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF7810E71C;
 Tue, 10 Sep 2024 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725952997; x=1757488997;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0H0HzAKfPkKNUYxuFsuxLGV/ktZpj45EVjH4od1qO98=;
 b=lRyrh5MTQpd+2rltsygDq/c7kD92iT+7jsYQMMLFbzkoouCE8soW3ZxX
 ZqKHXzZqulA2cdDZfdYOjJVkkWviaOFEnVy9W8nlHF0QRtnKwGg7kyjZb
 2Np63YC6NelMHafNORS8o4NTtVYdUT4NvQVGUEeCFFIYBKu8b22i3i+O5
 AtnrH5SmqeH0jPGNnSiznxAOFgPVyq12CiN1DljAHNTkVkPU3d4L6AFkX
 PkWDi7/sZAUN3yRus12ZZCEitw/fWzX+IeWIIyFrRCFAKyaX8dbld7qLO
 9kviKcNY5xr3fuwDaXI2QOLnExuEUaZTJKhDZ679FuLxGpe+qhJHMohiz Q==;
X-CSE-ConnectionGUID: Bhija5dDQ8WvwAZEFvQ0eA==
X-CSE-MsgGUID: oSIen3AwTDaAMtUa2WqVBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28573926"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="28573926"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:22:58 -0700
X-CSE-ConnectionGUID: 4qDFxNKkTSKPHtXT05kRMQ==
X-CSE-MsgGUID: Xa45k9FeTQ+sIV2Eb4nf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="66565704"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 00:22:58 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 00:22:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 00:22:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 00:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioN6LGptY7e3C+rznlWit54eNfj/W0KBloS5J9Izsdiszwf57nHczowPhJCbjHsKf5lprL8XUpmeJU4kc1z5+zS5PbraRUlrbBZMFuoHcepPL2P6K5Wqgy+B4gSaiFGjSo5IeZ2Q1WAgx28T5DoLys3VgGcAtOdN9LQvn4pWGbMAW9uDxmDytGv0lUgWHTKV5cFxCCVcLpdAdCb7unTQHPrPCzJpsD241EhBGatiDJ8XmVqqxlE1yLSODdjs43IKgLnLdMydg7qH94COoW9qDmm9L1aMMD3y7xqNv1cM2Ms78K5Eueg7F1i3+YgXBf/CojltAlxRpoup5UINaY2A1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI1JFP59SO7LOFA+LR/e9lZUQ5ahxyJX6UfPGF9xM84=;
 b=WHBbtgIbdH564G3JQxHshabUmhD+QbXjoA1646SUlQhLX4UiVOCHfhtqL88Na0mpaWJ49yuD4jbH4iuco9YnfYteR8zIxu6+8QxTgNyNUPKwDE+cjhKYzsPd6MudpOrB1k0ICSvhyzKMVbrB6ftN4KDLRY281f3+DZumfeqf0T37t9RegLr81lS4HsUgiP5MZcToAFfEARbjKdLAKOTvc0RRpnkTVBV9Q8TG9u2LXBCqHP5pJeT5t9WdHEPi2hQc/RxV476EGs8ihh0tsOtoQcyGJ6N0WQz3GXKpUJpCaHU5He2HbIp4dicKT1ZBP1gYt8dDmF+gTkkoU/pQj4jPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 07:22:54 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 07:22:54 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [v4 2/5] drm/i915/display: Compute the scaler filter coefficients
Thread-Topic: [v4 2/5] drm/i915/display: Compute the scaler filter coefficients
Thread-Index: AQHa0Q5GFJTuGLdciE68+ynLkGvDHrI+BDsQgBFLQYCAAbJq4A==
Date: Tue, 10 Sep 2024 07:22:54 +0000
Message-ID: <IA0PR11MB7307511EC5222C4F88C95EE0BA9A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-3-nemesa.garg@intel.com>
 <IA0PR11MB7307353A666BE6179B28A2CFBA962@IA0PR11MB7307.namprd11.prod.outlook.com>
 <IA1PR11MB64670907D474606D4E04B970E3992@IA1PR11MB6467.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB64670907D474606D4E04B970E3992@IA1PR11MB6467.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CO1PR11MB4916:EE_
x-ms-office365-filtering-correlation-id: c11524a0-b8f3-4cbf-9e39-08dcd16962fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EJ+d89bD7pkgAqIclYqsInj2ewjOQCytBz2zW6BrjvOmzj7LCeapiBYNO8Yx?=
 =?us-ascii?Q?YcWVejQQEgDtn5C2FiaTmlP4h5gl7089K5E/T1xNBQ88c8f8gQALoAv1EELZ?=
 =?us-ascii?Q?L1IPAXSS60vLxTHZESju+0aIetqQACzwTzNw/WSUSREvIludnEmFv2hhZl8O?=
 =?us-ascii?Q?aO6QBkAShzupZoUNBPjJYpAPmtJlzOYDL5NBx8a+IK4JgYA+NvLOi85wQuxE?=
 =?us-ascii?Q?xcqFqJ1ZD2gzLBdos7rzKWSPrTOhUitRv9KHp4B6F+xJsj9b0lCgQb3QB6zO?=
 =?us-ascii?Q?1pc9gVSmdYlJynm5o9IlqyN3Ky7HuNu/GxMlit9BHCQsJhVWPOdZWXXU22Nq?=
 =?us-ascii?Q?IdazVmYd9y8PL6m/Z5U7Sw5oohDooLfO94O5W2qEPE/zjhg027FdQh6/bI7Q?=
 =?us-ascii?Q?n574q5fEAA+Rjq7cQfExyX6iPH0IrYiDWqdx6VJJi7sndQuaFdZETg76o30q?=
 =?us-ascii?Q?CrybdCIPzHB2eUT9FY6KD7ZrUsIFHGzsk0LY83EM+KvzF+3KZgjjHHC+DA2z?=
 =?us-ascii?Q?3mMYqqhmMfXJlFt28uv1GkTeYo15hRm4mk5kPlBiPBv7a/Zf4cX/BtGMMEOM?=
 =?us-ascii?Q?Lq7/MP8tgkUAMjyCkt4LCsMTXh155vxA3bERW6x3LAcbWlsxDIUCgkTi+M4S?=
 =?us-ascii?Q?qFGRdoRTsydJKMhCqF1zoQmcG1FAiyb+WvJoeX3aGGsnYHJMgRsdtIQNwETS?=
 =?us-ascii?Q?8U5KJQ9ipxHOWhpTaO67xZtLdWNfsjB7W4n9EbcSTiFCGJV+WJwKFsaIKKCz?=
 =?us-ascii?Q?ZLMVsGLsmOY2EDx54RN+6uvM8qiM2HniemE35bUN5xFc9NUFYZxCaLlcUuhb?=
 =?us-ascii?Q?TStrIlpRz98Yesj/rsimcyClofeJuetDzDtSwbOj/+HQiUYWxFsNvY7TtoN1?=
 =?us-ascii?Q?0/nzZlw5DJgvYzh+EL4ISZk8ny1195SglsNrNUwkyv1z+/7d8Gp2+zoYVR8i?=
 =?us-ascii?Q?PWmtLXSWGbMbTpukWA8DJdvLhBgkfJPxZwl/lBG/l0zLzxbrn+5ssMIYwPaq?=
 =?us-ascii?Q?qaq3zxNN/ibhLtZbHVoLRpyBt3BNz+GGPWd+tkpqq9Vlw6ItmRdG4S6n2DK8?=
 =?us-ascii?Q?qkNyINCy1Zx2XTDRIUoaHBInHze5j2geDZQcFxFer+V/YUofzxhg1fv8Ehz3?=
 =?us-ascii?Q?ex8M7KnVkBPiAEPcObF9QFSGlE2P5Ujk2No95VhmldphzLmc+RIIGrkUbnmr?=
 =?us-ascii?Q?Dl16ZAFneiy9K4B3rnfdcxSbF0+5JatEf5omTmBfpQYuSt1MhOtY5O3W2fGs?=
 =?us-ascii?Q?LvGFaNYyZ8DS3HwXf3cIvrGIE2FrwHOwk6QHR9VEXrwovv7063ACQx/ZCYmd?=
 =?us-ascii?Q?k6od/M7yeLhCqWoxsbOuxf1jDeGq/To0Y2G8+ZfncnwygS534EQCsGkLl/We?=
 =?us-ascii?Q?TAtMiCTRt+5g17wWfg8gwmbO0FjQqo+kXkCoXWFYkCNw8200LA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PisH0+OmcIF9hyxigGwvUlwePuuOLarT88vwXdl7mhwndvHDNulI8aAlDomj?=
 =?us-ascii?Q?VVT0S57oV6tVv324yOwoKFn9NBsa9m8KG52w7GtdzZVl9ny+NWOsZa0i20We?=
 =?us-ascii?Q?HKb7MTiSEqLdyFnH15mL2seUqLmxehgs4WAc6bpl9XuB8wd4qP/r4I8wpmJF?=
 =?us-ascii?Q?aR4un3u0Ea33av/QsG2EqCnQ2m6f8FI3mCMlLyATlY47vsK99VD8Ar/2OpVx?=
 =?us-ascii?Q?8aPd8flIo8UKbaV7hISvM17KxjC6tiNp3FK7HdRsLRl6XFstb151G3hUzmaJ?=
 =?us-ascii?Q?x20f2Yap3gx+eVhy9lA/dH98fdu0+gNSBdx/Xbtj/uM5PkoQ1D623jckhZ8w?=
 =?us-ascii?Q?yZkquKld1VTG/QmGbDjtePgaNs4bRD7W1ZkD09BEWWZALF7dQmWzdFJRfX2R?=
 =?us-ascii?Q?EVjxYWVJgOmjIWGqlmfuUd0GGHUtg1P8nmExV+3MPEJjQPUZa4SJQ1HwvsOJ?=
 =?us-ascii?Q?Iystb+us/TalL6S4lIOy2rgZwUYf/LkQ0cLtwL+Zu1inPh0dQZ/mQ3TKBqMR?=
 =?us-ascii?Q?l9kF8asHBrii35F7pwPQ/96AetyPfcAXHNAzS8JqSecpKY8t/GmDKRVt96lE?=
 =?us-ascii?Q?CUEaDpX1K1aLpxMdyldfFHZByagG1cXKRr2waAh+VtRwX1fOj2roRbfCK2f8?=
 =?us-ascii?Q?jM0FSafJIttaXurKxb2JiJV823VsitDNqjFDm1tu5N91+eriR83JQar7sAf2?=
 =?us-ascii?Q?tv/ZvQ72z1cxx0nYxA7PYrMZriClpG/vWydlG60M82APZi54kyp0ryW8ke0r?=
 =?us-ascii?Q?mdR4x8X0H+Tbuhl6nh4v0nJnDbBiOqG+o1jYikPl/vEm2jwNP8nmWIiZmGqK?=
 =?us-ascii?Q?AfuZTnRP8s5wdo4ztPy08Id2/HZwnlyWtVXGsA6yI/gEkDfV+qgmqAROCle2?=
 =?us-ascii?Q?1DaFLkRgHOHXrjag4Ol7FVOciJ3eSBx4XmjJf15haKh5KOQYhkSAvAxvQqX4?=
 =?us-ascii?Q?BLVPJWn1bPaYePym8OymNs2ErGrrdvHQAI8FN6qy50zNHGYMweKdxQLybvid?=
 =?us-ascii?Q?l5yT+Enywm/By3bgxLAaM76dlPoRZdQQTZllKP9cWQBSNIXYeZg/nuE4kmEK?=
 =?us-ascii?Q?t8WdTKIe3XN+bFZW6A1SbApEim8m9zObuPeHMW4CPg9hc4v2GWQWirJEvkwy?=
 =?us-ascii?Q?ijOx1P0A7dXAzi4I0rcpQGIGXTT/ccZjki8t45cHcpg0FhsWhV/cmrVPZBHR?=
 =?us-ascii?Q?cRtqxcX0cpZCnw39/hcdbfHinvIEzfPrtwb/gmKAjQZ+uu8T5RGprgLUkuxg?=
 =?us-ascii?Q?PC1bFh7fMTz5mecYlyiENldsuPrmLfPd6SA+aGQrn7d/V5jhsEJ7NqdaLRfM?=
 =?us-ascii?Q?400UjrSRjEQqYeLk/nqRepAtiIiKjhI00lE6DUky3wPJdL/joX6IX+zE8pIx?=
 =?us-ascii?Q?SSrI+2FPYJaVRw1apSyloPdLk4mfccy5siBXCTLnpLN3J2uukvcUj7GKOgWE?=
 =?us-ascii?Q?NhUlH8F/eH9I93E7+ZOzIemi3ce5gJF8CDmb96WXenQOD+DWw0+qfI3dqZuf?=
 =?us-ascii?Q?bxIn7PrmeYCkOyOP6O/nHwzyp41GU7WO8YVmiLxCm66M9S0T8OziU9CSBN6H?=
 =?us-ascii?Q?eiUXqUIZEZqPMUrh9UwDkrmBvUtu6WDx6jMYJp2sSTZbib2ApGRvKUGrvE7a?=
 =?us-ascii?Q?Ey4k264jY0xo2uVLS5Pqp6DjljW+5Q8zU+9ApXhd3VSJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11524a0-b8f3-4cbf-9e39-08dcd16962fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 07:22:54.2302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VT3G2qtvTCFZ5HjvTtd/+SaesYIEjEi6L5jiybxnzrjSU8pnH3dO9IrtE7Ms62CXSok/gEZ+rcGKmRKM/uYn/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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

> > > The sharpness property requires the use of one of the scaler so need
> > > to set the sharpness scaler coefficient values.
> > > These values are based on experiments and vary for different tap
> > > value/win size. These values are normalized by taking the sum of all
> > > values and then dividing each value with a sum.
> > >
> > > --v4: fix ifndef header naming issue reported by kernel test robot
> > >
> > > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/Makefile                 |   1 +
> > >  drivers/gpu/drm/i915/display/intel_display.c  |   2 +
> > >  .../drm/i915/display/intel_display_types.h    |   9 ++
> > >  .../drm/i915/display/intel_sharpen_filter.c   | 121 ++++++++++++++++=
++
> > >  .../drm/i915/display/intel_sharpen_filter.h   |  27 ++++
> > >  drivers/gpu/drm/i915/i915_reg.h               |   2 +
> > >  drivers/gpu/drm/xe/Makefile                   |   1 +
> > >  7 files changed, 163 insertions(+)
> > >  create mode 100644
> > > drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > >  create mode 100644
> > > drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> >
> > Can a unified name be used across the patches. ->
> > intel_sharpness_filter.c
> >
> > >
> > > diff --git a/drivers/gpu/drm/i915/Makefile
> > > b/drivers/gpu/drm/i915/Makefile index c63fa2133ccb..0021f0a372ab
> > > 100644
> > > --- a/drivers/gpu/drm/i915/Makefile
> > > +++ b/drivers/gpu/drm/i915/Makefile
> > > @@ -280,6 +280,7 @@ i915-y +=3D \
> > >  	display/intel_pmdemand.o \
> > >  	display/intel_psr.o \
> > >  	display/intel_quirks.o \
> > > +	display/intel_sharpen_filter.o \
> > >  	display/intel_sprite.o \
> > >  	display/intel_sprite_uapi.o \
> > >  	display/intel_tc.o \
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > index c2c388212e2e..a62560a0c1a9 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -5906,6 +5906,8 @@ static int intel_atomic_check_planes(struct
> > > intel_atomic_state *state)
> > >  		if (ret)
> > >  			return ret;
> > >
> > > +		intel_sharpness_scaler_compute_config(new_crtc_state);
> > > +
> > >  		/*
> > >  		 * On some platforms the number of active planes affects
> > >  		 * the planes' minimum cdclk calculation. Add such planes diff -
> > > -git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > index 8713835e2307..1c3e031ab369 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > @@ -55,6 +55,7 @@
> > >  #include "intel_display_limits.h"
> > >  #include "intel_display_power.h"
> > >  #include "intel_dpll_mgr.h"
> > > +#include "intel_sharpen_filter.h"
> > >  #include "intel_wm_types.h"
> > >
> > >  struct drm_printer;
> > > @@ -828,6 +829,13 @@ struct intel_scaler {
> > >  	u32 mode;
> > >  };
> > >
> > > +struct intel_sharpness_filter {
> > > +	struct scaler_filter_coeff coeff[7];
> > > +	u32 scaler_coefficient[119];
> > What is this magic number 119 and 7?
> > For each win size there are 7 coefficients, so coeff[7] is used to stor=
e these
> values which are further used in calculating scaler coefficients.
> As we need to compute scaler coefficients for 17 phases of 7 taps I have =
used
> scaler_coefficient[119] .

Can these magic numbers be replaced with a meaningful macros?

Thanks and Regards,
Arun R Murthy
--------------------
