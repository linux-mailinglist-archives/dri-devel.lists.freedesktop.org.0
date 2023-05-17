Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B22705DC2
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 05:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6549410E391;
	Wed, 17 May 2023 03:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5786710E391;
 Wed, 17 May 2023 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684293022; x=1715829022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7WuoaaAtzpl68orxmY3ORk9YMv+E5FZOdE8ikTYDVSw=;
 b=PNRAQ3QMu7fLuOVun6v+xnN/tTLOdANw/ZstgMEg7gD7iJuzktHsf+Yd
 I+DjhsbMQzESNISHRW3/8Ng7rGLwver2iFA6Iq2EAlsVmcYr7h4VAqby5
 H22uWH144f6xhtYzmqhPo2Y0sMer79wO40xofbGs84LRSmQ0ZY2ByNrbA
 /aBzF0cUbovhVEv3zARXMtZJWhx6mOZcXKUOZBZNJb9S0aYUk9Hby+K3b
 Yp48NZph/OawcjCJN60Grl0FrkjkUNYWHFpaxBBSDwUfbeSE35Ltgv0wL
 F8AYYrxXm805dF0uEEGxZ+BHzN3cr+RRjX4sk4UXYtBXeaQf2GI/1mm0M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354821417"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="354821417"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 20:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="825805410"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="825805410"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 16 May 2023 20:10:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 20:10:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 20:10:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 20:10:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 20:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIZ4yiKHaapao06+4Boq7O9yHelgMx3VjOag4Nzuw7sPYN1JcFDbggtcZgHPMErrtS4/pNhRqYxZXYsMjIiwvRjRxVK197rkoKw9y/3/fVlFhNeEYNx0eTLHxeIQUDCf3Rs22puPudOc7Uv+SsQSA6HoVnKtrXgPoRc9F9r2rPGJxgmvZWEw7zCjehpawE+CiHP5C6FZAqrdHuE0ciZ7BZhEFTpZ1m+c3314iQR5O5amb6MA20CtI11SNP8uMS7VVO9Mpg0Ko5F7lhVwAFkZNu/72SIyHIY4xaH1HUfBaV2JX9ptdbfuYCxYTrB+SnD0wvo9PgF+6BJXzgz4ZIwdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxPnT98j19l1wB4Kdr3HK36DVFCsVoS3RuikxXAjVtU=;
 b=jZ/Edq01vmN3WggEHuaqCz8yWWScFpTmfThLsw6fAOdyWwZc6+Katav1K13MooZ+dNv8qAy2SVA+oSaIvEwmqGdhqYgTy68FGNG490VuFse/z7m7ysm6xyjYRQ36A1wRi03WP0VdgIYeURKto71qnhD4zjaxGV/Rvna4x6rpWGLyFylVjc9q4cdqBiv42QhdM0Cd83caHko3qOqGkMajoqSL/eqFGSi8C4f+9HEKzauUDYnbeWQmXe8G+bvd4sLLBhtgGtSO/5nDk6oBJRmx4a89CU8j2bPa/saUbEos7R/P4Jbvdh4lhQJ3hrfuzt7/UGJWM380jYDokzbUFu182w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 03:10:13 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c%3]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 03:10:13 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: RE: [PATCH v6 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Topic: [PATCH v6 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Index: AQHZiFOk+ByiNz5uNkSrdNkEXt2U3K9dyNHQ
Date: Wed, 17 May 2023 03:10:13 +0000
Message-ID: <SN7PR11MB675047C1B66D356C56C1A0B0E37E9@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230517000740.2102599-1-dmitry.baryshkov@linaro.org>
 <20230517000740.2102599-7-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230517000740.2102599-7-dmitry.baryshkov@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA1PR11MB7109:EE_
x-ms-office365-filtering-correlation-id: 6777a4a5-085f-4aac-3287-08db56843b1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6JAmMlI1hZnSq4zh5+MvT5ThGwjjAmVKGLi8PgM0NfWNTA9KkFi3rqdLAAVF+5MZhrOa3AitUOakYeZvV1IVoRyHqFYNvfLn7MDV+1cztOzY2+xRfJSadNRX3pVQKLr10GgkBRhaMkxWDa957LMHNNgw/BcyHdG8Q/YNMeinSMIM9jqrk7Ukp4jxBC88q37Leq4cmqa6/KpwNZOuph7T2Gu9Q6aum/fybxQNFMKWWjav+4Cnc2vuwJImc+EjVkKR7fytuo7Q+Mo8uMBD0azJuCSYFo/mOf2usd8FwPituHhaSuxN8+usZ/cWEfr3DoZAIH6UtkK/kqSenr/QAYaMDNUg+E8PFNhxXvESXYkF86hk0QCU0m+p4ECUQDvLiHCNGR0onOiKmpvTUhOkd9VFesfJNvIEpJ6INajCD1KtmBMvf8ihu7tVuiTqvbCGEgFYieNvNYexJIhKvJEY59IhHmZg95Y2j+0QqTHvTEgBR4gZilklp79Oo0rf5s/WeHdklAlwCrBwKcGIvPezEOPh7NMW/2hEmYY02C2r6knux9gWPSL54ZnWDyawA5DNBSrA51dEB7f4+Yg/3igTKoUvSjH45ZjLm16wKNwM+gGRaH5J3HzFgd7lrYtx2bkBm/TelHKBMPZUe0RNQpS1URgZsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(33656002)(7696005)(38070700005)(55016003)(83380400001)(122000001)(9686003)(38100700002)(26005)(6506007)(921005)(186003)(82960400001)(86362001)(110136005)(54906003)(7416002)(52536014)(30864003)(2906002)(41300700001)(8676002)(5660300002)(316002)(8936002)(4326008)(64756008)(76116006)(66556008)(66446008)(66476007)(66946007)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uD6j5ImLEhzFfvRrMs2hS7iizYTU2BD/w/Rf1YQ/skDTg9mpyO8JxUEM2n?=
 =?iso-8859-1?Q?yYhVWA7uxQ5CBOW4/o2YBqEtGHYVoddNi3twPBVDqCE8IY8qPoHKFKsuHR?=
 =?iso-8859-1?Q?eX/+Y56+dcz+Y+RuPkrtivUz3C7UE3+IVJcJT1bLBm8i0zz9We0lK15337?=
 =?iso-8859-1?Q?v/WNISad0oyvvBkGBN00NSWEzvgdzf6DsWQGNr5KZg9ywnA3LeYatoNYz6?=
 =?iso-8859-1?Q?0yuLTaAk/DKKSO5uvOEtd+AYqgIJtdnjC6gsDHUiKZywhgWHPJzbrl4S3V?=
 =?iso-8859-1?Q?z1TRc64j2bzpS1uO32WxRVy7ZTppmERBZO0z7Tq+6weAmzzWziWueq07TA?=
 =?iso-8859-1?Q?8aWnkH+ObGQ0CxROCKkc/SXa5STIjG2QLQMcRCq3AFOC6YKN/o+BjWdhyp?=
 =?iso-8859-1?Q?4dGo1hRVuSRV5D5RQbQL0eVqBFrbNN8irBZ1lkn3UByn4Q6Q2VTyy+FUEE?=
 =?iso-8859-1?Q?f9RcbS+cvrRQ7vX2DZT2UbPFP+i6ZgVGVmPrMFHrkpwCZQukLIIEwe+oGJ?=
 =?iso-8859-1?Q?Dg9E9LAfzelwS9xLPGplJUxAx2pn+Q7o1AnBclpCU9sGxAVXis3wnmKs9B?=
 =?iso-8859-1?Q?JTogYqF4ym3scbquqWxmW2DCVy6UaDksJXi3XzfNGKRYGm/wbfnL1m0Wbe?=
 =?iso-8859-1?Q?h71asxbPSpo9ObbNye2dRy0E3BY9H7NYxmVhS1J/Uj0GO3kIzxHW+pPBeT?=
 =?iso-8859-1?Q?3uBz+2FDGSd2ynnBbM9NMwS/d7mWjU3tIP81XHqotiZ5a7DaH9tJ7bNbl7?=
 =?iso-8859-1?Q?MVhVescbEw6mR3TVXAu7c5yC6UOwCk6O5YgNZHjtp20jXk333n+Sy6RyJ0?=
 =?iso-8859-1?Q?wR1jWOzqhYtWRy1PypzhLqx+W7Uzgri82Ru19QCzwC/S7HmaV8MR2mZuqO?=
 =?iso-8859-1?Q?hLaB4JhvZSck/DyeFxDEMsPYCBOf8gXkqY8+BxZxxuiUyTp/b73QEdcKIt?=
 =?iso-8859-1?Q?567WWnnq8TTjXzBbmxbjf2oj3/5O6vBFwuIMvXLD0wNnQaU0cQxW7Q0EXO?=
 =?iso-8859-1?Q?gY4DbHJ6+J11dRXsFw5avOl/VSnc2xNoEh/87QFdHFYJdq/QnOlyHr1eYR?=
 =?iso-8859-1?Q?yweCllIypVEFYRIw7EgYLZnYm352PsmoP/aNV7dYaavDB93tpMMMw29Wf2?=
 =?iso-8859-1?Q?vxrqoW9piuxFjuYpP5PPjc5vg1nv54XOP0EPQ1ufJcrc+Ai8Jv6iFxdfPV?=
 =?iso-8859-1?Q?lvUS5oisPaYjz9gipFh0UvES+Ctr1PvwS3P23xUkZYcSNtLz4YxdYSfDTb?=
 =?iso-8859-1?Q?y9DQL//7FDUd6UEj4Xoa7dCQ0RkfKLY1F2zv6qlJeJcPERoqhhoJ2KNfMA?=
 =?iso-8859-1?Q?oKSPmmeHP6OobOQ0ui8bgERIj/bFK054t8gJhT2HaWq1YNYrfmhV6e77DY?=
 =?iso-8859-1?Q?PTGUvh/eTmbFHpw4F2frQlUQnmkDOfxg10/soJWw8FQruW7Tfb825MnH8F?=
 =?iso-8859-1?Q?FVDSVwVfhhBgq6Srhl75aAyfXIrHfxo/0/TDjB//w9Zsn/CcT7aJyKoOrK?=
 =?iso-8859-1?Q?eMUQeUg2+IGNjwYGNl09xqmGhgb0QMJHUChEmedMtLAox/bbC1DSwvyJSi?=
 =?iso-8859-1?Q?PhZVRE78XmsedW8PwRi4HIr/eIr/Q694yo47LsR+o86Eq8PtBKm+n1Cv+s?=
 =?iso-8859-1?Q?xCkBUcICCNel7HUsp/Ounkw+AxkiUBVku+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6777a4a5-085f-4aac-3287-08db56843b1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 03:10:13.0352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMiSIdVRxYoiEyvQjoAurg1K1d1XxxOEFL8oT8j5t2iRgPNhb9gVNbMIT0VU2+9rEvgtv6zVx/bcj92VF+TyYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 139 ++++++++++++++++++----
> drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>  include/drm/display/drm_dsc_helper.h      |   7 +-
>  3 files changed, 129 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c
> b/drivers/gpu/drm/display/drm_dsc_helper.c
> index acb93d4116e0..f9d01d72c1ff 100644
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
> +	switch (kind) {

Shouldn't this be type now.


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

