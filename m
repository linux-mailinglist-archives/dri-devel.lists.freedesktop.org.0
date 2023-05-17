Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00950706588
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 12:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1521510E3E8;
	Wed, 17 May 2023 10:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3470610E3E3;
 Wed, 17 May 2023 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684320156; x=1715856156;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sWYakdGes8V2hKnHB756o9sqPJngGkgGg0x0xltIfWw=;
 b=J2M3K1GlEmahS9Zd8tVzpskUUqrqN92j3mK6hWuzN0Q5U8AYZ/luV4TW
 TE4z+H1E5f/3vMvBvgTD1/fbjl/DeBlnakB8fDNpsEqhpafCQTjcJHgBL
 d8V2BUeejmlm85sFvp49LqTD4rTT6q0ATwYPNP224CSXc2g2m6pF2GJ4a
 9wZ0r6rWUngqJTUtTeMogh46lTQzyQqkeWUJpJUWk+CQrEsM4VVjzl5nY
 cq2Of4Yjjcp6M/KRZxvNX77IRCMtxbWzdj//oogEj+GdZIT0DUPsPjWJO
 Kqxwxd8LuLEBtUAQLcuDxplIdbChso/OmfClFzmRLm9ElaY62iZOSjYei Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="350560130"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="350560130"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 03:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="771417748"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="771417748"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 17 May 2023 03:42:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 03:42:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 03:42:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 03:42:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 03:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgV00Cf8wejNSB1/62akNIlQaZmejsvIuTPEMo54hQQQ7aCPA2MQC0qCzxsyMP5ixkTdN/mRW665D+LHIe+mOx3p3Xvpdg5dUL4VAtiQ32Gv7+IXtQekxrTre/RUE+odN43bzNFNJkgctjmKOV0OzJd5eeN559h4cik3uTUh5BpAf5wo2Llcz8pkUSS4BGLqFiwizUYPlwzTseQqTT/52SieDLnSTDCtb5xpKTu/8OiVwXMMGE8xtJ2Jd0fOeePCQYNedCVqfexPpFyTsq+RjoSnjwQu6LJNdVpzFGHJZD7ZJmhJKJ1Cn0w617q4sPmVJjfcPRYAHLOJXom7XBvllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwhWCU+shhb1oQVZWGtf92kj/8IFUXswMI8HPxFdX0g=;
 b=fFoHvnW6RyhWdLb3OV/VYOrtncJfb8wNxH8Gt29knUQjjK2CqorN1Km81tTX0NbVeyWJdCwTYuinSfj41DivNSYn1xgJr2jQhcXrj7p9ZppzDJ0N++YCf1VOV6wBRMWG5p3THYFzGi0F0DfA+3uG5udhercrw612dmtkh0S+bj8u7y4sCu1xWPjIfShIQS8zHcuA7qg+9Pf42ZG6iHTvHD7o3q6gjvHzqamVMI8D7c8mPNZ0Eslo9JGry2DHWmjauB1W6yzkVYNPTs+dFeb4bvxayka8SKKGJC8pJIKRhQ45z0oaHyJRcXy4N2sLRJGSN257rhBz/IuzoO8Cx7lCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 10:42:32 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c%3]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 10:42:31 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: RE: [PATCH v7 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Topic: [PATCH v7 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Index: AQHZiKpNklz9nwIHl0S1ZcPePAxJcK9eRBLg
Date: Wed, 17 May 2023 10:42:31 +0000
Message-ID: <SN7PR11MB67506715FEA682D6FC61C073E37E9@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
 <20230517102807.2181589-7-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230517102807.2181589-7-dmitry.baryshkov@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ2PR11MB7598:EE_
x-ms-office365-filtering-correlation-id: 625de435-0505-451e-a02e-08db56c36afb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NdpiL9yZnxR9/dpm0ZCq1nEki0WbOHHvsgGEAvrJNYh3lPW3yy8wPYH0fHg2S7Q007tuiQ1dHBt9VHqAvHMt0Ji3Dmk+u53PUtqRZgmMlky1lndFZNezwwl+DB0lhCT/hBtz57n6Dly5muwjbUtWUrYbKN8NN5X9pv+9nHu1kc2bVQrEn15uGkm4yqeBny/Ts33c9CthKMf8rFuc/4SvOVO88mhA8+31Ju8jWniDH5O5NuktsAIiuXnUc6UrIO+KO7yRIMsi4+vYHFVX57aFg+wMNE324FehTSm7I6sMU5xkA7voPySii+8HJBTtcVSDiv1XYKv43QywlmYrss7XcaqF+QZyWhSBAK5P6H82nA1gBuatH1y4j+1RR0WwS3tYrEZ341gD0mSOBJMmmErvJN6cqGU/zF0eXqMygkkYGSZ+XOWDIFpenpPZHpm9yVxHxqEb9GLq8BT8qjNE3FyzrNt/zoB83Xa6hfrX3k6lBS5fbpaEL5u30YG0Xd6WILyshW9fwlEokbP78dVpnLy9vNjgWK6hvVyOCqUO+qnIu2oFa16DJ/WjGZJkFg48mvinwBvpe7gUle6BXnRCYCCk5M02qpmzN2iBxRCEJCtDMuJEU5qXWHBYwv9GI7QeajMN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199021)(7696005)(66556008)(9686003)(66446008)(66946007)(76116006)(66476007)(64756008)(316002)(478600001)(4326008)(110136005)(54906003)(5660300002)(71200400001)(41300700001)(52536014)(186003)(6506007)(30864003)(55016003)(26005)(8676002)(8936002)(7416002)(38100700002)(2906002)(38070700005)(83380400001)(33656002)(921005)(82960400001)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?39GyLr/Lso7TcLFn09RaZLgkhRfGQEK7Ku1B8TxbJLoE0bwN1KC2dwz0HL?=
 =?iso-8859-1?Q?3yrovzb+wGUBR6lfs8MpGndKGArZrhPZrimm/M4hTCmqRjO2vbA9duTGC/?=
 =?iso-8859-1?Q?bgomcdKDsV0vzDdGoMuDobyqy4Uz0pLlmPL2098zRyIJGXJnYF6a4h22dV?=
 =?iso-8859-1?Q?2h//I9K6TXI5tOkBZhXmxyeW0FpBxwl/ddtiRd7N6+BdwvM7VTOsKbCagx?=
 =?iso-8859-1?Q?cF9xJ/tw9jGPPG6hMA8+ggGC2RukvlJf6DnX3wIu6mW82fpoub6nYGKur2?=
 =?iso-8859-1?Q?O3IqGZzK7q6sltf1YqQeYqDeKXOVBdafncmEKbKHcQGih+EB2gO/v1c+5q?=
 =?iso-8859-1?Q?HOeLIIqK7vsZWAEME61sEj43NiYYrTpJ7SFoCmWuXJq6YNQYuJZdA6voRn?=
 =?iso-8859-1?Q?k1xPzD+rq4ej7YnY6zwsk8iTD0aZuLjk8N0h5Bvvkah4u2AbXN7J5gp0Fc?=
 =?iso-8859-1?Q?fD8btfNmO6eExQjRfDTu/FUAXz66mZJ+jPKwNbXxtcbUkRuzN1JKwkAWd9?=
 =?iso-8859-1?Q?JJ/JqQlHFyQBt0dXLyFQHW8VHYO843xbXfE6XhNIRKGo68CKpDX6rQUdBm?=
 =?iso-8859-1?Q?xFcEhKlnBrvEvmgJeVD5rKK5DLhUEVDmsY5cCooxfjQ5CWL0MsBjm/YnuW?=
 =?iso-8859-1?Q?q3HGSpvcr4EprfG2iVP1PT2ZXavqpEWIBc83LSeKOZWibGrhwbaihFA0rR?=
 =?iso-8859-1?Q?kuTbIj1L+PVlKPHieIeP7JAcJSiml/0xoAYkHO+4b11/B1rvEV7t/nKUeX?=
 =?iso-8859-1?Q?h085qvsbTpC8ObvLQM+hTJCzDH9SFK0SfZjxavBZXzW584C8QWEiX+7ItU?=
 =?iso-8859-1?Q?G0t+sxTZrooB3SZTTn5xmdGIA4X9caXPnTIcyEhB8BCDsNbYn7GaNVLFlJ?=
 =?iso-8859-1?Q?pB3Kiv/N0XPHXFy4yAHyOdRgyap9NPCbRE/EsfRF2+UzzWpvtg2Y2uEsOe?=
 =?iso-8859-1?Q?R38Lk9qOvXlDqmQF706Fxl0Bk8jG9A/V71+qZryHhPx+XrBJa3fODDQp7g?=
 =?iso-8859-1?Q?b//nUR3715TyXC84h6Qf70IQSdR68AN6CodL2XZSIjz8j5sNdMfcjwwrqp?=
 =?iso-8859-1?Q?boEK7rMGcuaXftWJP9tsXZkDjfZXpjZEjxcklACUX8gBRdixXNg6Xk6M55?=
 =?iso-8859-1?Q?6M5zzF2DXUzjeg7Y7gajwDJIGz3Ni8vHSlSdQo2o2WxNGGBmpxo0mfN8N8?=
 =?iso-8859-1?Q?SIYvvKv5JWo0EjjWEuwKeDioF6TGporjNyGsfA7SGHUXA4vSdXiYm0cL27?=
 =?iso-8859-1?Q?jvD1mxkG+IuK287AoJARPSyIP1D/w/RMYloLeNp9WDjUkxpY8rKNcqGz1T?=
 =?iso-8859-1?Q?jCOruV5PG/qsfqH7zNhBKGIkixSYaKEhlmUo7OdjeJEQpZ0B+f29W2i78i?=
 =?iso-8859-1?Q?XbjrictIeLOel0YoOx063u2w0WxRUxy08px9CI6zQ+Oh9jK5HEgdFsYes3?=
 =?iso-8859-1?Q?Xjxit22QiIYu3oR86g/RXTlAV+qzsPyWNDjEzlUyfZsjBv3DEM5fhgJY6T?=
 =?iso-8859-1?Q?KW1ckznnpi1v990cLIdXUJPXD54/9rTDpqNrqM8XmrrXXUD2SWr2IzT8O8?=
 =?iso-8859-1?Q?EjTobYlNg9cYi7t5IU0/b5J3CuJh94uMvcZCfEAtjco/3OWzBGIZFmCpnF?=
 =?iso-8859-1?Q?8ZgNhXoirhGESe9MFs84nKkGJL0pK/lPcO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625de435-0505-451e-a02e-08db56c36afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 10:42:31.6221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxsfEzgCyguF8+jbvMZM5FQhsIbGVRdSpxxbJLN2pblMbFhm+0Ivchtd8MWoyexIBPNbpOblYktu46WtSHMN3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>=20
> The array of rc_parameters contains a mixture of parameters from DSC 1.1
> and DSC 1.2 standards. Split these tow configuration arrays in preparatio=
n to
> adding more configuration data.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

LGTM.

Reviewed-by: Suraj Kandpal

> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 139 ++++++++++++++++++----
> drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>  include/drm/display/drm_dsc_helper.h      |   7 +-
>  3 files changed, 129 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c
> b/drivers/gpu/drm/display/drm_dsc_helper.c
> index acb93d4116e0..f1ba39df5708 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -325,10 +325,88 @@ struct rc_parameters_data {
>  #define DSC_BPP(bpp)	((bpp) << 4)
>=20
>  /*
> - * Selected Rate Control Related Parameter Recommended Values
> - * from DSC_v1.11 spec & C Model release: DSC_model_20161212
> + * Rate Control Related Parameter Recommended Values from DSC_v1.1
> spec
> + prior
> + * to DSC 1.1 fractional bpp underflow SCR (DSC_v1.1_E1.pdf)
> + *
> + * Cross-checked against C Model releases: DSC_model_20161212 and
> + 20210623
>   */
> -static const struct rc_parameters_data rc_parameters[] =3D {
> +static const struct rc_parameters_data rc_parameters_pre_scr[] =3D {
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 8,
> +		{ 512, 12, 6144, 3, 12, 11, 11, {
> +			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
> +			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 10,
> +		{ 512, 12, 6144, 7, 16, 15, 15, {
> +			/*
> +			 * DSC model/pre-SCR-cfg has 8 for
> range_max_qp[0], however
> +			 * VESA DSC 1.1 Table E-5 sets it to 4.
> +			 */
> +			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> +			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 12,
> +		{ 512, 12, 6144, 11, 20, 19, 19, {
> +			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> +			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> +			{ 21, 23, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(12), .bpc =3D 8,
> +		{ 341, 15, 2048, 3, 12, 11, 11, {
> +			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
> +			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(12), .bpc =3D 10,
> +		{ 341, 15, 2048, 7, 16, 15, 15, {
> +			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
> +			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> +			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(12), .bpc =3D 12,
> +		{ 341, 15, 2048, 11, 20, 19, 19, {
> +			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
> +			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> +			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> +			{ 21, 23, -12 }
> +			}
> +		}
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +/*
> + * Selected Rate Control Related Parameter Recommended Values from DSC
> +v1.2, v1.2a, v1.2b and
> + * DSC_v1.1_E1 specs.
> + *
> + * Cross-checked against C Model releases: DSC_model_20161212 and
> +20210623  */ static const struct rc_parameters_data
> +rc_parameters_1_2_444[] =3D {
>  	{
>  		.bpp =3D DSC_BPP(6), .bpc =3D 8,
>  		{ 768, 15, 6144, 3, 13, 11, 11, {
> @@ -388,22 +466,18 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 512, 12, 6144, 3, 12, 11, 11, {
>  			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>  			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> -			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
> -			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
> +			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
>  			}
>  		}
>  	},
>  	{
>  		.bpp =3D DSC_BPP(8), .bpc =3D 10,
>  		{ 512, 12, 6144, 7, 16, 15, 15, {
> -			/*
> -			 * DSC model/pre-SCR-cfg has 8 for
> range_max_qp[0], however
> -			 * VESA DSC 1.1 Table E-5 sets it to 4.
> -			 */
> -			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>  			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> -			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> -			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
> +			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
>  			}
>  		}
>  	},
> @@ -412,9 +486,9 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 512, 12, 6144, 11, 20, 19, 19, {
>  			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
>  			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> -			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> -			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> -			{ 21, 23, -12 }
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
> +			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
> +			{ 20, 21, -12 }
>  			}
>  		}
>  	},
> @@ -498,8 +572,8 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 341, 15, 2048, 3, 12, 11, 11, {
>  			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>  			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> -			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
> -			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
> +			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
>  			}
>  		}
>  	},
> @@ -508,8 +582,8 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 341, 15, 2048, 7, 16, 15, 15, {
>  			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
>  			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> -			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> -			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
> +			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
>  			}
>  		}
>  	},
> @@ -518,9 +592,9 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  		{ 341, 15, 2048, 11, 20, 19, 19, {
>  			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
>  			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> -			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
> -			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
> -			{ 21, 23, -12 }
> +			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
> +			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
> +			{ 18, 19, -12 }
>  			}
>  		}
>  	},
> @@ -602,7 +676,8 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  	{ /* sentinel */ }
>  };
>=20
> -static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
> +static const struct rc_parameters *get_rc_params(const struct
> rc_parameters_data *rc_parameters,
> +						 u16 dsc_bpp,
>  						 u8 bits_per_component)
>  {
>  	int i;
> @@ -622,11 +697,13 @@ static const struct rc_parameters
> *get_rc_params(u16 dsc_bpp,
>   * function.
>   *
>   * @vdsc_cfg: DSC Configuration data partially filled by driver
> + * @type: operating mode and standard to follow
>   *
>   * Return: 0 or -error code in case of an error
>   */
> -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum
> +drm_dsc_params_type type)
>  {
> +	const struct rc_parameters_data *data;
>  	const struct rc_parameters *rc_params;
>  	int i;
>=20
> @@ -634,7 +711,19 @@ int drm_dsc_setup_rc_params(struct
> drm_dsc_config *vdsc_cfg)
>  			 !vdsc_cfg->bits_per_component))
>  		return -EINVAL;
>=20
> -	rc_params =3D get_rc_params(vdsc_cfg->bits_per_pixel,
> +	switch (type) {
> +	case DRM_DSC_1_2_444:
> +		data =3D rc_parameters_1_2_444;
> +		break;
> +	case DRM_DSC_1_1_PRE_SCR:
> +		data =3D rc_parameters_pre_scr;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	rc_params =3D get_rc_params(data,
> +				  vdsc_cfg->bits_per_pixel,
>  				  vdsc_cfg->bits_per_component);
>  	if (!rc_params)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index d4340b18c18d..bd9116d2cd76 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -226,7 +226,15 @@ int intel_dsc_compute_params(struct
> intel_crtc_state *pipe_config)
>  	if (DISPLAY_VER(dev_priv) >=3D 13) {
>  		calculate_rc_params(vdsc_cfg);
>  	} else {
> -		ret =3D drm_dsc_setup_rc_params(vdsc_cfg);
> +		if ((compressed_bpp =3D=3D 8 ||
> +		     compressed_bpp =3D=3D 12) &&
> +		    (vdsc_cfg->bits_per_component =3D=3D 8 ||
> +		     vdsc_cfg->bits_per_component =3D=3D 10 ||
> +		     vdsc_cfg->bits_per_component =3D=3D 12))
> +			ret =3D drm_dsc_setup_rc_params(vdsc_cfg,
> DRM_DSC_1_1_PRE_SCR);
> +		else
> +			ret =3D drm_dsc_setup_rc_params(vdsc_cfg,
> DRM_DSC_1_2_444);
> +
>  		if (ret)
>  			return ret;
>=20
> diff --git a/include/drm/display/drm_dsc_helper.h
> b/include/drm/display/drm_dsc_helper.h
> index 1681791f65a5..66eac7276d04 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -10,12 +10,17 @@
>=20
>  #include <drm/display/drm_dsc.h>
>=20
> +enum drm_dsc_params_type {
> +	DRM_DSC_1_2_444,
> +	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */ };
> +
>  void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);  int
> drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
> void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set
> *pps_sdp,
>  			      const struct drm_dsc_config *dsc_cfg);  void
> drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg); -int
> drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum
> +drm_dsc_params_type type);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>=20
>  #endif /* _DRM_DSC_HELPER_H_ */
> --
> 2.39.2

