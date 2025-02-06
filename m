Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA2A29FDD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 06:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176C10E106;
	Thu,  6 Feb 2025 05:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boj/FnLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF37910E106;
 Thu,  6 Feb 2025 05:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738818410; x=1770354410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h+A0MEvyuSWZTxa8zYz24GPAkbj/vggHB+zqV5EjDTQ=;
 b=boj/FnLxdWNBanz8tGny1X1cKonO+RE1HsWpdQUmvN4vplvYFefpJLYm
 7JE0uFEXVkXBfbn/TRTbqsEZBu9HVRihCK+w9T3CRrhLLNk0sMyLORrGT
 u+6DTH01Zl+cphA2mt4F9YcIga7VKgSwEwEpxNxbIIkn6XPXyofw8BjN+
 eFlCVsrpEVC4xtDw5XjVOF4/4Z7tAunmkPx17eIMkMpB0/ol689Yg852C
 Tds9Duvf+kxuJNPaTOtzZb+zGV5bARv5kCFH5CZgJ2E+tZ44M98iAq9mM
 dEET84T41BCtWDJTXa4vIQFBT18gF0tLxhCkykXAYe7ZeiLrtrfDt0lHX A==;
X-CSE-ConnectionGUID: 9gJ37krHR7Gymw9YF2oz/A==
X-CSE-MsgGUID: 1JZ0neJzSfyZcOmUzHFvYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43329876"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="43329876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 21:06:49 -0800
X-CSE-ConnectionGUID: ha5zQTkAQlKDoq31lvaxtw==
X-CSE-MsgGUID: tvi1+c0rT2WBbTidcicBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110959069"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 21:06:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 21:06:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 21:06:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 21:06:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7WfswrxYW90nmi4tWKajXsoLcJMxD9KBhxQmrYSKYr/uEPFzQd3esfSlxejx/y/r2WLQ2JT14zF6SLI7M3r+UY954Z/zpSyQIMqjESsg4gkUWzlp9DcAp9wAvctzr1GmhxWrTiDc+fLtpptXCGlKL9PqkdohppNxHvXemjzKA6O7uZ8lLLqef6zLNa+pJHIj9aWiH4HeokP0093NqObMqmBfsqlEMK1e3tpxkYWjIkZT9bl3St4PmWMEVbIH1JUll0IiMhAbAZbV/S0/tlja/51U+SzEjXo3Oh/Pz7bdgGozxqC+lkkwp6oVk8UyWaud8Ob4KkNtgexphBBs77FWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Xlm0kfPlhfq6PXPzMXJHkUGG9fs2Dw83bqlyjLiwY=;
 b=bqPWZEehSZIMYGHbIWMvPFaL2GFPJZXiffb+lRhwZ/3TnS+vJM0Ilb4zOloVGtCWR3+8Fk4chdwRPec12nSGFgyoPQuVI3a+xfI00hZy+EHZJSht3h5WVIpOZifro/9MSf6n/hk342dfqoXWwY2nPAMuspuCNq03BgRRKTK6GN5DBjsRgKAUQ9WkCUCeSUYT2u3F1xpL/vB+heJmkMQl7LRCSlpvK68GMCtK9LTr1LOkzekRKgGy3JfI3Cx2lpggQwqPru5EYLdXlfIXPiV3Nlmr88+Sg+KuD/WZXYai+vW2klVLag01ixOgZjecsb7CvhyvfcX+d/DLO4aPlNBlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 05:06:44 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 05:06:44 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 6/7] drm/i915/backlight: Setup nits based luminance via
 VESA
Thread-Topic: [PATCH 6/7] drm/i915/backlight: Setup nits based luminance via
 VESA
Thread-Index: AQHbdwNrgGyFZw5R00aI5W1HuPMXs7M5uHhw
Date: Thu, 6 Feb 2025 05:06:44 +0000
Message-ID: <IA0PR11MB7307830B2CA2369BE691A4B5BAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-7-suraj.kandpal@intel.com>
In-Reply-To: <20250204125009.2609726-7-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA1PR11MB5873:EE_
x-ms-office365-filtering-correlation-id: 786d8f57-586b-4241-6366-08dd466c0d15
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2ygzJm6YLhZJiibF/OEKsxRmQXsSC8sDjtrWhrKs3zW2imXDTLG8Q9ZCf/TA?=
 =?us-ascii?Q?Qi+5KVtMdrTHABT0HrykwCRBWGzlJKnrEuUynsnWjU/Te7BYSNl/0TDAA6Ll?=
 =?us-ascii?Q?paUbd1tXpeqVVwz74JgeWkSeQoF/yogJsww5rIV+Uh+VQzdpjvFLRlB7ervh?=
 =?us-ascii?Q?/i+qTXeC95W7fSdSWauDYVjhAVLkk64kzSiWGA59i1b7piKqWoLGu0dhhMMj?=
 =?us-ascii?Q?JCERD5/Y/eVD1Xfo97xbI/KDUrgIL7mmvEB99palPwI6/sKm5Af0JjbzwrE/?=
 =?us-ascii?Q?Ee10NtwgjxkzDbRB9RoE7aJdq7UB0tOc52TlEdl3PFK+LVnHix+jWzilF6Si?=
 =?us-ascii?Q?KoE3WmKWczG+7q36ju1xVXm+2zAA7m11IrwyUw/Me7WfnfKW4jtN/OiGmcfF?=
 =?us-ascii?Q?I1IzqCqJicxYiJ3rkNkwwvHIkQRwNi80ne0aGxCtmiJqFxXeiJUE7DinOy9E?=
 =?us-ascii?Q?iySfyARVKDv6+f/P35SxCn7Os7jjGdw7AVZbqnbs23c2niMRQ5ovI2L1zis0?=
 =?us-ascii?Q?RIi4uUlVKwiWDsSHG643vJEOFfM5dnHVzB5TdJ7fNG64elt8Lohz1D3mTFyi?=
 =?us-ascii?Q?MwIWiSdvS+VHGJBobOH9OsMnBNWQfS46UX2bPj8DBf42atMfep0HC1nc0Tab?=
 =?us-ascii?Q?TiwqJ6Hop6Yze+JKVrjdlYnM2TWOCllj/FEfIxnb6ZtaGeKdF3cuJUji6V2y?=
 =?us-ascii?Q?Z2ATjKj764rimWh4+FAzowg/qtuX26wquEo6BwLzAcD7Ic7I6e81Y6FyshLD?=
 =?us-ascii?Q?tYDK6z+NGHY3KjJx72NXqUrBIhgv1yeHF28J+MrhDKD6rhroLajeIQ1gUisR?=
 =?us-ascii?Q?gsRQXiL7eIqytYWJYvxD7/eV+10A3GIayPYaQNKPQ9VPQ7BKRRJLoBdRoe6F?=
 =?us-ascii?Q?ArA9UEJIwCtnvvDbWpX0QJqkmFEosNfYFP4ZC2AVQ3W1/rJFdmzFWN0lXRf9?=
 =?us-ascii?Q?JeBlS5JFX3KeGcoyKfa23Tl7yIhbtJwPanudB796woiufWsp6QpRGIqkHjdQ?=
 =?us-ascii?Q?RHtTQsLD7LtZ2TNO/HR1ji/Mx3F51f58vZQOnZkFfOeC/LE+caZy6b5fE8yt?=
 =?us-ascii?Q?bowVpEtEyhTwobDUdBhCHuMNnFNoH6ZywWNdgU8yHWKZVnb8mF+TyZhhCUyM?=
 =?us-ascii?Q?/CfItXXR/F3EAZQV664HbvJIFPTzh1BerMzGBZMKXdSvVny5rZfwsP4WwhV8?=
 =?us-ascii?Q?7TkjTZ72JTyl+MlFrHsYeIpLoRAXYGj4+sF2N4AnLCOMLD5brlgcCG52pJLU?=
 =?us-ascii?Q?OD5oOy/zljMl/F34pLVFTqrdmtixyyfbsPM011qCWnfyAHtC9aI2pZyQEjLk?=
 =?us-ascii?Q?7H2OJQypzi8fBhTGofgfUpGUmuHHaJFyD1dXUp033gMgYl5eXYhTLnrkFh+l?=
 =?us-ascii?Q?LPpJtgYxPB52BvH3RnK9kSr45HhBrbA1fOZGGyY2wItw/UItqSw6L6VfkkNA?=
 =?us-ascii?Q?DsiId6+/qeicOgVcac8cLfB43WA2r2rD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z6P3Crnx/WmOk2/egNPXRwsqqt5RjYATm2PoF96vi72GBDGiHP70P4cxL6Tn?=
 =?us-ascii?Q?mpe61bYI2scTnv0KjpQLs217sa1HGKtqDKOsh0UoslfXnE1CGbVyYbqHR1B0?=
 =?us-ascii?Q?yarWj5O8mXI37DhgnyQ1QVUO1rQWm+2psWEZVEl6+bbj89Y6OOWVEVJuA+Gw?=
 =?us-ascii?Q?kIC4Xf8qCpayiTHnw1tjvh7++2uF0eYua74rXsc+wO+Onoq39yYNLdOmAdXV?=
 =?us-ascii?Q?5hfl3u+iVKn3m3ouzzvH7mEbMHgTrmityAxwSOjhrX60AabgKR1RynQXgqs3?=
 =?us-ascii?Q?JGVE2XDuYbCXRHsp2Xd6CMvhALmS5BN4YkxIghuY0rlBKy4LcpQYfnykgXmO?=
 =?us-ascii?Q?95/0STDJwcK60MZOf8WGKQz+aF98luxrz63i3MPRQdDqmFCt2JqphyKfIRN3?=
 =?us-ascii?Q?DUHgTacdyo3G+Pp5avLqx5ObWi1kniMarrVQfI6yzfFQiRIX7dhAgWFFxs5H?=
 =?us-ascii?Q?VFpsEFIJHWhsosEps4C2D0wDRpqxEt/501RZ+qLmEn0QSSeQjz+8NmkgtuqA?=
 =?us-ascii?Q?cHD+G9Jc/vYyUt1flrtDn+2Hb1hjP11NZE89nIZa1VBIE9D1yAJs92F4H1bQ?=
 =?us-ascii?Q?0ulnXWNDKFQ+wTLcWRCNamPURyUKTjdd9o9SHzSRLpZ+2KvjLT5CdW+0j+wD?=
 =?us-ascii?Q?s6Py2yaqtDphafmEMa1MGKKu8Rtm+HOkB60HokPEbQ8DoMEbT7j0yGlo9PbQ?=
 =?us-ascii?Q?L6jWsKRCffVf0FDiIDUeZiTvBFVpaCFiaXVAHlvtGbmjt01Al8PqmG1BShx9?=
 =?us-ascii?Q?29BbD5Vtj9CPIQ46RwJrq4ljyG+81zaLUEPpk0+hF1AqfVvQhs/YLo6fNPb0?=
 =?us-ascii?Q?Cz+xk89fOpV00fPocGtBZU0Cs+PyziXQY6JS7X6PxoX6xKwnTZJsLZcxeWqc?=
 =?us-ascii?Q?ZuSP++wu208H8HAnkVyVzGQLiFKLexV3wbbJoVLAWKDsxotM/4vGlKZvLXDF?=
 =?us-ascii?Q?suUZVkcyNbNTvVVz5qvjWoIEExMM4fCmCM0ct3L3FdRTlZxL0nFxrTekAsHr?=
 =?us-ascii?Q?Qw/6CJ7Y1518p/lhVBJk7kWTEt2gBzfPBKPrMpOM4zNI46vruUhiIXN5gBjj?=
 =?us-ascii?Q?HWNtjUCZ04poBORWQRVqPUohUc9lNA24lYLTJzLyR+IybM5JnYKh2v3ZS/rR?=
 =?us-ascii?Q?QPm+PAmmxTa1fYPO+7PHKJHcdZGnQC2gFni6e9aaN6VNHhRkPxq7c6eUeHec?=
 =?us-ascii?Q?JtTgnka2UY3RZXhnn1GqzcsFY+8UDzCErsgvKFjKd3fZQTwBt++WCh0gE9hx?=
 =?us-ascii?Q?YAGD+/R9BdSgL1gRFVLkTOCEAPYB24oPnMnUGcYZiAwgUsIb9280HZ/L03TY?=
 =?us-ascii?Q?JszSi3GctOtzTVpeyQL4fnW2mMhV4tPI8i7fxSrP4fiO7zvBRavKjspsUtGv?=
 =?us-ascii?Q?xKnyi5togmVq5HOXD6+7RCg8c8MEB9FoU79qAiGVubklGT8TQKEtR1FfMapL?=
 =?us-ascii?Q?vvoTZi5fhG5g4AYNH3Q17sPmWLN8EKnuJVt3XE/3oN93rWbnJz4EwzN2XxSZ?=
 =?us-ascii?Q?xyL8LwtYb17Q0UDMDPHFexIQwwLdTr6xwN6NIKaDRpksCszXySvzmta/xYg+?=
 =?us-ascii?Q?CzsAsgGtlH+0vJcJlYgXBG7NTE8Gi/a5BB8SDnid?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786d8f57-586b-4241-6366-08dd466c0d15
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 05:06:44.6317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YKQLIlG+H2aG+FTviWOawWZ9k7/V87YLwy5CUIaiitlOrii9KBo3UePNRXaM7YU7h6sscAGMO0QyqG7K+OY0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

> Modify backlight setup function for VESA interface to take into account t=
he nits
> based luminance.
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

>  .../drm/i915/display/intel_dp_aux_backlight.c | 99 +++++++++++--------
>  1 file changed, 59 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index a9facfacac95..38e2b8cc591c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -560,56 +560,75 @@ static void
> intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state  sta=
tic
> int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
> enum pipe pipe)  {
>  	struct intel_display *display =3D to_intel_display(connector);
> +	struct drm_luminance_range_info *luminance_range =3D
> +		&connector->base.display_info.luminance_range;
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>  	struct intel_panel *panel =3D &connector->panel;
>  	u16 current_level;
>  	u8 current_mode;
>  	int ret;
>=20
> -	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> -				     panel->vbt.backlight.pwm_freq_hz,
> intel_dp->edp_dpcd,
> -				     &current_level, &current_mode);
> -	if (ret < 0)
> -		return ret;
> -
> -	drm_dbg_kms(display->drm,
> -		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> controlled through %s\n",
> -		    connector->base.base.id, connector->base.name,
> -		    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_enable));
> -	drm_dbg_kms(display->drm,
> -		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled
> through %s\n",
> -		    connector->base.base.id, connector->base.name,
> -		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
> -
> -	if (!panel->backlight.edp.vesa.info.aux_set || !panel-
> >backlight.edp.vesa.info.aux_enable) {
> -		ret =3D panel->backlight.pwm_funcs->setup(connector, pipe);
> -		if (ret < 0) {
> -			drm_err(display->drm,
> -				"[CONNECTOR:%d:%s] Failed to setup PWM
> backlight controls for eDP backlight: %d\n",
> -				connector->base.base.id, connector-
> >base.name, ret);
> -			return ret;
> -		}
> -	}
> -
> -	if (panel->backlight.edp.vesa.info.aux_set) {
> -		panel->backlight.max =3D panel->backlight.edp.vesa.info.max;
> -		panel->backlight.min =3D 0;
> -		if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> -			panel->backlight.level =3D current_level;
> -			panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> +	if (panel->backlight.edp.vesa.luminance_control_support) {
> +		if (luminance_range->max_luminance) {
> +			panel->backlight.max =3D luminance_range-
> >max_luminance;
> +			panel->backlight.min =3D luminance_range-
> >min_luminance;
>  		} else {
> -			panel->backlight.level =3D panel->backlight.max;
> -			panel->backlight.enabled =3D false;
> +			panel->backlight.max =3D 512;
> +			panel->backlight.min =3D 0;
>  		}
> +		panel->backlight.level =3D
> intel_dp_aux_vesa_get_backlight(connector, 0);
> +		panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level
> is controlled through DPCD\n",
> +			    connector->base.base.id, connector->base.name);
>  	} else {
> -		panel->backlight.max =3D panel->backlight.pwm_level_max;
> -		panel->backlight.min =3D panel->backlight.pwm_level_min;
> -		if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> -			panel->backlight.level =3D panel->backlight.pwm_funcs-
> >get(connector, pipe);
> -			panel->backlight.enabled =3D panel-
> >backlight.pwm_enabled;
> +		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> +					     panel->vbt.backlight.pwm_freq_hz,
> intel_dp->edp_dpcd,
> +					     &current_level, &current_mode);
> +		if (ret < 0)
> +			return ret;
> +
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> controlled through %s\n",
> +			    connector->base.base.id, connector->base.name,
> +			    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_enable));
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> controlled through %s\n",
> +			    connector->base.base.id, connector->base.name,
> +			    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_set));
> +
> +		if (!panel->backlight.edp.vesa.info.aux_set ||
> +		    !panel->backlight.edp.vesa.info.aux_enable) {
> +			ret =3D panel->backlight.pwm_funcs->setup(connector,
> pipe);
> +			if (ret < 0) {
> +				drm_err(display->drm,
> +					"[CONNECTOR:%d:%s] Failed to setup
> PWM backlight controls for eDP backlight: %d\n",
> +					connector->base.base.id, connector-
> >base.name, ret);
> +				return ret;
> +			}
> +		}
> +
> +		if (panel->backlight.edp.vesa.info.aux_set) {
> +			panel->backlight.max =3D panel-
> >backlight.edp.vesa.info.max;
> +			panel->backlight.min =3D 0;
> +			if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> +				panel->backlight.level =3D current_level;
> +				panel->backlight.enabled =3D panel-
> >backlight.level !=3D 0;
> +			} else {
> +				panel->backlight.level =3D panel->backlight.max;
> +				panel->backlight.enabled =3D false;
> +			}
>  		} else {
> -			panel->backlight.level =3D panel->backlight.max;
> -			panel->backlight.enabled =3D false;
> +			panel->backlight.max =3D panel-
> >backlight.pwm_level_max;
> +			panel->backlight.min =3D panel-
> >backlight.pwm_level_min;
> +			if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> +				panel->backlight.level =3D
> +					panel->backlight.pwm_funcs-
> >get(connector, pipe);
> +				panel->backlight.enabled =3D panel-
> >backlight.pwm_enabled;
> +			} else {
> +				panel->backlight.level =3D panel->backlight.max;
> +				panel->backlight.enabled =3D false;
> +			}
>  		}
>  	}
>=20
> --
> 2.34.1

