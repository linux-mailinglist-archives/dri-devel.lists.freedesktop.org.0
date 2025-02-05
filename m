Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1AFA295FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 17:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACEA10E396;
	Wed,  5 Feb 2025 16:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icxUgcnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E0110E390;
 Wed,  5 Feb 2025 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738772064; x=1770308064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XVSJvutgs6gncoJFO1oqTA3aU6NuZlK8ki0MCuI81ac=;
 b=icxUgcnpXa83erJFoeX1PzfYn68YL716TyF1i6RCVFEZAOEJ3adF4Ish
 1okFMkidC6zMZDmXKMIs1nV46KoH5AZdC6DFVaQychQQHYrYpd6/dnxAz
 5r2Nu5gE55QepX51+tOOx/Zn/sTGkZnx+3H3oPFeM8bIo8kFkKaZ/1bzO
 Ap7hApaOd3kA/Q2N1ac/zUM6QBOQn6Y9csF1bprqCdCIIGj0WrxWn9nHQ
 W0GpvG4ad4CPLs8U2eMsspfxbsBlEmYan3+ZyfGbA4wzpbWWEO2Ru5WXj
 UDCldwHMP4qa6e1Vjv6tS16JMwsVswE2S1QelnBnDlF4iLZIjOolKNkoj A==;
X-CSE-ConnectionGUID: QSn7O9D8SfeEIJy/34trhg==
X-CSE-MsgGUID: QG/9A45uSQiTqPZLvJdbTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38549441"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="38549441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 08:14:23 -0800
X-CSE-ConnectionGUID: AJbOEbnCQ1me/y1wvJ3/SA==
X-CSE-MsgGUID: rGYhUHQRRVqsfnxDJW4aqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="110841866"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 08:14:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 08:14:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 08:14:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 08:14:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhJ9q++7cl6iC2UYz2BUdDeJMF6Rp6a1KTKu5NGkcoriwca9Klln89ZyC5sE4C8q62c1LJvbYFArNDFLrUT5wZLg3uvEgnY8Zz1I8Z0M1zmsPVfjjV2SoaFCuk7ABQH5Y1crauFVXPZ5fEAWrZC0XoqAHrn0gAQuHiQGngCOWvrVKTiMZoKT/2PqN0uspSk9OdqVC22Pdxtfn7Fe2zjFvI7Y+frANAdYotPIm5TPzYsfGzUQNSgbQr9TgCteb1earNEuxuWODD6SUDXEpKchrxzYJJpaYOnWo45CsnBv01mVRvwZJBMo0P5LaoV36UkwhNwmpS46txV/Kh1DHUls6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BME5pNPlr89Yhdtl69uusUAbJGzUX23IEM3YBJ6bJoA=;
 b=WU6sU/xQgnXLlh++zBGeXq6HgtlmHOKRNicFBGI+Ah3eFCU3YmjrQyib9fVvP9Iknt3cyDQuNLvD/Vq97Yj6tHRqKfxUS0/BZVorbYZpoqCl/V7rTAVdiKTtREiTSgWIlPwYlkeVHxbrdW7XCQJmRJN9O5/mtq+WxbjR1IvX6MswjjTsNvgj9x1N1fBGa1a7S8dJyLTK4cQ1PkLhBRRKaQw3cC9UxZup+wbeFLnzv0OYBz8twSysUGrTpKbHNHU3ph9T5ZX7UXl1Hu/T45tbp5UWX+6Znm2Xvu7nHC8VNh3yPXNnLNdba6kSUws6M4oWwNDxLRHko8oq3/GVCnY9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 16:14:20 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 16:14:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 5/7] drm/i915/backlight: Add function to change brightness
 in nits for VESA
Thread-Topic: [PATCH 5/7] drm/i915/backlight: Add function to change
 brightness in nits for VESA
Thread-Index: AQHbdwNpEt0/pInss0WwqlyIESVMXrM44u8w
Date: Wed, 5 Feb 2025 16:14:20 +0000
Message-ID: <IA0PR11MB730748D7A52408F40DD02596BAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-6-suraj.kandpal@intel.com>
In-Reply-To: <20250204125009.2609726-6-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB8020:EE_
x-ms-office365-filtering-correlation-id: b306b65a-070e-460f-97f9-08dd460025c3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oa+rIYQxWugEd3SCxQxaU6G0/XBOx99a6Vn9CzJIKqHnRQArgiQr/omlCOhv?=
 =?us-ascii?Q?pxBbOf3tWvzrvwNTL0Kq9jnQEdT+bPm1LgdX5vLNqOXm3Q+IurirN0h3+Y6C?=
 =?us-ascii?Q?LlziXMkCgYBZpBzxcqoOLwXumDJzSxGtaQGQtfcUIJH9fMLmx+1OjBKYKalG?=
 =?us-ascii?Q?aq+ACiGPiBW6CIWOg/XxBoKIb8UzNu9G92inbTZ5At3xvmXAYOprnF86mcvi?=
 =?us-ascii?Q?XRWFKg+aJSfp+pGeBa389zVPtBhi+MsbZt5R9wk1DD1eLbdnERoVsbpr5p8Q?=
 =?us-ascii?Q?cfg9zzCKJ6oQsDykS6s/C0ImvblGarOvj/TvZIKIyDIzT0NQVKlkPcaQ6mum?=
 =?us-ascii?Q?8Vd/PSqYLnHNvWG2rXrd05Xi0RVeUqWQfCHYYCvM2CTphoGAdiXymOCtDb59?=
 =?us-ascii?Q?1BWCaOyCfTpKiYr0ESJXmGYUlWWmCSO+zrpSDzhAG7DtbK/PNthttmMokpF3?=
 =?us-ascii?Q?xOjenvfmvQOt5M7o/3rz4D24bMQT2MvGcoaHI/Mkehz0vgBAHtHZgx6pZjpH?=
 =?us-ascii?Q?Eog8dCVGxAsr1rFasGKOAG4khAdStdsdr+r4+mHQf/pNrJ9xfCRY+Otb/M+h?=
 =?us-ascii?Q?1QEnEmBtOebJR9ECBHzn2uxeRTz8HcOtFUou34yVqsyYF2D0y0O8j0xL61wC?=
 =?us-ascii?Q?cRYyJDYZs7n4ZhELHdBUdJHXJdCoW+EB1MaUkQGSvisgQjpVAGTPftGs4Qgd?=
 =?us-ascii?Q?llv8PWp6+aBcLhz7lgXgyfRL+InC1VHpUDjdHeYEX7Ax3Vl+kX5DaoWC1zYC?=
 =?us-ascii?Q?sgVQPV9ap3mrV6uCJAi6KNw4suCC7L1ffIrKP807HAdSKntJe0d/51FIzYcN?=
 =?us-ascii?Q?AKLS/FhFzwQm9wZIQAB4uYL8CqRx6EOFdBgJbYUIFfklJqGlt4+X6z9bXCuF?=
 =?us-ascii?Q?HkLtQtN1BaX7iPayU7+4h/96FHIkVm9YQWf0YFSQar4fs7swBPC9yjX8052B?=
 =?us-ascii?Q?J1uv5lYNc3w7H7I1vv8oWzuNYYzOYNwmrVL8uG/dZbmAjOLrJnZtgwcovoZF?=
 =?us-ascii?Q?qub5oLs5itLUEv4JjRwDH3N+Ly4pfnpkGoBcDH6SHAKXjor6DUgHRsmfHTks?=
 =?us-ascii?Q?kkn0iAtnh6c3jU52sHB5tfImGtquyPMOewNS8MKevDGlh+xUMZdKEoUAcSgU?=
 =?us-ascii?Q?3+zPZPcaaoiNmTQSg0iIio3w31whgpSVyaS52rWrzxCC//fb3D+zcDlXsTYZ?=
 =?us-ascii?Q?rRjur0j410I6cAFYyLilqRWUxyLXp/NgvCW5nChC/+BrzFWpCZDxEPo62pKu?=
 =?us-ascii?Q?yZb5QC94tw4gAiZehes1gC0qcLgGIHC5vJXZQAK/zI+o2DxsYL+WxrKRMagl?=
 =?us-ascii?Q?3BemVFC136dqa1jkTAvRGyMkQQKiSKrl+cy+pZvqf/yre8wUA8Srq+AiRioH?=
 =?us-ascii?Q?PFP5hxJEP32n0wNRV4MnoyCaFF0VABdL5H+SJdqiA8oa4/MmOFJnNcpvjQj2?=
 =?us-ascii?Q?w5G2tTDIWRZTTlsStYOc/JPu39CGLweU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?07w1i86b4wLJBzhbTkD+dsVulsqCZpFe8GDe8HjaW7BdHDLkeJamUPDZkL9U?=
 =?us-ascii?Q?cvow24mok/0LOuCnXhSplKchvMsAJT2og+NosAfohlCAtZTl/OZWII8k5cF/?=
 =?us-ascii?Q?4NzUm+13G1SXTt/IvUG59/19WxRaX7t3lyH9iwcG6AeavjgrTXxKOPBqCx72?=
 =?us-ascii?Q?zw7/lLYVf7B68wR85MQBMrZf8roudNi9Hk9Edf8Zu3Q+sxJczc8lG2dgch2y?=
 =?us-ascii?Q?z6z5wBwlyzBIJAxcLKFYwq++cq09f/8MY1O8u9LnstKYl0cQwQkW6kIklHqu?=
 =?us-ascii?Q?1+n3lCbuvtcJuQYAzYdeWGe0lDzVahFsOLiy5E0ZcTLv+fMvwWHaWx4cs/sy?=
 =?us-ascii?Q?HDgAPV+T1NsEYpgWnv28q7+XyURvY+dyNIzIf7ThY+iydO0fGiSgZrsGSTJn?=
 =?us-ascii?Q?kTNTjasbFAEUbkb3mi8/yL0NKgUJQmx9nQB/2OqxI+Xq/tP0ky7KrKSiF4Vn?=
 =?us-ascii?Q?FPVvvRKIS5KNYKm5U/MAV2T/x+FWL8gd3NBdobS+pSyRy4ZFHohDLcspiOCV?=
 =?us-ascii?Q?udZ31HAjz/SU4PNSmnxnXeujb/bbmD1i2gmfItbibbeRpLY4v2up/rZOm9oP?=
 =?us-ascii?Q?Z88xyVe+AiV32ZkNLK/vga81wmKIafwA5Ui+vnj01wJj/4dB+B6rkFR4x7MZ?=
 =?us-ascii?Q?dGx987+IvaL1kueXsYsC0Bz8AhSeWbJIIGJ9/brWGx1Ow+SZVhvWRdM5Q+HW?=
 =?us-ascii?Q?kWGoZTxrtMZ3grPIzUIXke9ePMrwOXx/hSFUYqOigxBD52Tsci9FnYlmXH3B?=
 =?us-ascii?Q?EstizFJrHZ0Px2PFf6RY1s7O5Yizn0MBROFZllIxNeFnxMeT3FobUcumVhVh?=
 =?us-ascii?Q?w58/Gvf66uroG0TPWFnMdvxIk2XMS5Qy5SUSIr2Diuqgcp/aEYhH4DbdhnAN?=
 =?us-ascii?Q?BTke7FWUFYLI6DwfCWTW2ePiWVF/DV6ciz9GP1MZmfapsZiQLXl0Jhgy6doK?=
 =?us-ascii?Q?g0el1RvrtC/eQypRbqoXaF0MproUo7jSUO9g/w6BG98kcE8dELEYTc4VcWQ9?=
 =?us-ascii?Q?VznpMBaYaYxrX9czNx1xeSs9PqiwxtP4feUhHae5GXrF1dLbKb1auoOPVpbj?=
 =?us-ascii?Q?gispAIhH+IimSabbGjN27YhSKejClGSJfLGXYErq77zGG8/fZk0lkyQNgqbp?=
 =?us-ascii?Q?MDBkAIsEFY33AZ+KvvjntyjwGuj+FCEHGQuOaGDDDZHp1mqu9z7Eixz0B6JC?=
 =?us-ascii?Q?Xkd1M1FPLltJjuQlQg6vDgzKkSXvAMmawcUytSP0TzR/E5+UF7jCc09EkGfE?=
 =?us-ascii?Q?Npsi3Wfche6783dA8PPlyJyVztSbKdVHh4VxjQV6q2kz3PACq9EArpNDl9wH?=
 =?us-ascii?Q?a6CXPkaSjgztb7bwEade7lQiMttf6Xr9zHmYEoxDbtX3CAInFSxvfs1bRHO8?=
 =?us-ascii?Q?QMO0A11F9RgCSNgzR9R1s8BSyg5E6My21Ivi6AEWg7mrAwWt4EifquIqSzkG?=
 =?us-ascii?Q?BKrLDyu4hTxJo3iKQuX3lNpBhQ7b9jWVnVHMgjm5T9YTEDFQy2FgXcjcw/VT?=
 =?us-ascii?Q?zQis0XWKttUKkQbvpY1yDw45p7eMmp38cYy9GDophNSQw+q8jygR1PgTkU8d?=
 =?us-ascii?Q?Y9WtZqUXmBo9aVKxFIuBpCxlAlFvwE2yAQg4L0oE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b306b65a-070e-460f-97f9-08dd460025c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 16:14:20.3587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdyBGuBj1MySvM1k86KFijckMAulphLms0Pteux75LeokKjXhtahB6xXYmfUbvn4UVqNedsN7SZvkxxIInr1qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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

> Create a function that fills in the value for PANEL_TARGET_LUMINANCE_VALU=
E
> which helps in changing the luminance in nits using VESA interface.
>=20
> --v2
> -Prefer using luminance over nits [Jani]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Tested-by: Ben Kao <ben.kao@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  .../drm/i915/display/intel_dp_aux_backlight.c | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index a733b5623563..a9facfacac95 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -474,6 +474,31 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> intel_connector *connector, en
>  	return connector->panel.backlight.level;  }
>=20
> +static int
> +intel_dp_aux_vesa_set_luminance(struct intel_connector *connector, u32
> +level) {
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
> +	u8 buf[3];
> +	int ret;
> +
> +	level =3D level * 1000;
> +	level &=3D 0xffffff;
> +	buf[0] =3D (level & 0x0000ff);
> +	buf[1] =3D (level & 0x00ff00) >> 8;
> +	buf[2] =3D (level & 0xff0000) >> 16;
> +
> +	ret =3D drm_dp_dpcd_write(&intel_dp->aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
> +				buf, sizeof(buf));
> +	if (ret !=3D sizeof(buf)) {
> +		drm_err(intel_dp->aux.drm_dev,
> +			"%s: Failed to set VESA Aux Luminance: %d\n",
> +			intel_dp->aux.name, ret);
> +		return -EINVAL;
> +	} else {
> +		return 0;
> +	}
> +}
> +
>  static void
>  intel_dp_aux_vesa_set_backlight(const struct drm_connector_state
> *conn_state, u32 level)  { @@ -481,6 +506,11 @@
> intel_dp_aux_vesa_set_backlight(const struct drm_connector_state
> *conn_state, u3
>  	struct intel_panel *panel =3D &connector->panel;
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>=20
> +	if (panel->backlight.edp.vesa.luminance_control_support) {
> +		if (!intel_dp_aux_vesa_set_luminance(connector, level))
> +			return;
> +	}
> +
>  	if (!panel->backlight.edp.vesa.info.aux_set) {
>  		const u32 pwm_level =3D
> intel_backlight_level_to_pwm(connector, level);
>=20
> --
> 2.34.1

