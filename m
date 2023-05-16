Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1675705644
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 20:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6A010E35F;
	Tue, 16 May 2023 18:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DED10E35A;
 Tue, 16 May 2023 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684262799; x=1715798799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B1lNqqHZRxAcaqLh8U/5r2b8K9DSmMevmkXrj2hDWvo=;
 b=SbET3vjvJGoAos/wbiZD/Sw0/0KWsnggQ5kO3i5mJCywu7ZIVZn7ldoB
 sfVJ5cl9CVMqSQustIdtjYs3OZV2SZNG5zCzUl5ddlAMl1xn3J9bjpACJ
 hIoDStrwNx3eIsWGa5CWnhw2FTrIwgJyPNeftjEKlSHmLLkR9lKNZlWnB
 GRf3BPoTQeuE0S2K57gYReRLSPo34W2sbhDUA1eNncFY35zl1qc75ufab
 2reL1NKxnTJtbcviPSPmhTSSCjz/u/1AHait/1A1WdywOqfOZghPdLjbu
 sPfZh1voim1NNlQjWSnTjlZ/8DkfcTMaNnec9ZCmVLFQlWodVzKDEEJwx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="379746127"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379746127"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 11:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="695578633"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="695578633"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 16 May 2023 11:46:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 11:46:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 11:46:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 11:46:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+DDhrT+jDX/v02qicj5w8xKoZBz7hbdrWEGQXS1b0Nlg14V7tut7ZTHy4PsW+XI5mfqHhi1zSJK6H3sGoNE7alyrZ1/OWcFGbFLdBHTXwHLOZE3zTr17WtsxOKX2dAT+hZag6kyrsfWM2iED5kckGrNN9KMimZzN/PfpVPF5Rxp5wJOJnhbBoHsNAliybAiG0ixy9VV2LF15fbhygyMjTBLW8NY+jjouTqt1B8r+yfz3qJzKRDrBLtKlOQiVrTroGL9bvdGrEtM+3+iR5xmIyArR7VrTjli1DE/b/1yDTzt+F4p/Lz+8t9GVSutYx+Gn8Pg86dqi+1G0FT2B83xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moRsDcvJH0wZTj15I/LzS2lw7P0Pv0kEL3F4WvmY9t0=;
 b=UFzKNbzACzEFVgverzYq/8CqfasUUGlZd172dNYvSQ8+/lhTjhZ7u+K3ksPyd1AttamaD6rUzCjBF5+afZjUwQ+KRqiOwlP/rowacH6zkMS4GVc+H4wIEs32TN81dTtna6No/LAmObi2yHzYAY/NjesjwbmCvilJC0aq44yGU5SbkEgPNJhWXdJ7XOl6qMMk9IG0gfOYTefp9gdii7l+/7AytrNJlDa4Y1mXVgyDrfKI8kq9M9jwO/GZ501T+JA8OphATPkjEkTfaXc7Ak5B9/nX/1l97e7m10RUBEPDoqwkFvlHO756/CKVe7U0iXULhdqXWduVD0hsZi29QpJFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 18:46:11 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 18:46:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: RE: [PATCH v5 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Topic: [PATCH v5 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Thread-Index: AQHZfp4YcDsmrD/BuE6hnamqa8oWkK9dTRCg
Date: Tue, 16 May 2023 18:46:11 +0000
Message-ID: <SN7PR11MB6750F3758BA9B176904C449BE3799@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
 <20230504153511.4007320-7-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230504153511.4007320-7-dmitry.baryshkov@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH8PR11MB6853:EE_
x-ms-office365-filtering-correlation-id: 226d2910-d242-4532-ad56-08db563dd1b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ouf/CVjdQAHWMN/I29aks/l7+OEat8bmKyKoccWlNxSSShTgdOCfxbqN99yeJLg3O3P1PYxgBfN+dMljbvqRPndybKVn5e8TSZLqgh6r2EGO9GOJQ9HzIHpfjpH0QCHYZl4k21f2642fIK548Sh3X1jU0OfzMujtM1vqnR3Gfl+UAw6mSVODrI6IPwD8GfLhTB/9Tuz7j6edSBjv2HAzXzn2oYMj1Ml+19Gi5UtgwHuYbz+kaMB7on3MBjsXp5AactzKczgSSmm9yYV2IpfvwdaoJkmNb8XWj8PKAzC402FGuqAI5nGfDmehmrDFEqs45oCeLcK10/mYMEe3SMa2A0lF9exn7k+yRpa91uONJu5LZ2yVmSJOTEkbwmohaYZSAsW3jCQlPuDqU/lOU3kivoVqSIOuSBUzPiSC4gXwuoiXdrx0UhdgJzeRlLRKHiueXtL+c5JKsOdV8PqpckVo1FexBt7svqxL9DjpqfK83BaZd6tvlJS4jW7eMdF8MQ/PElXTPZWUqZpt2dzUr68s+P5LFKEJuiCt0VIgS1lkUMWUMlQLUT4yS5DqW/FwxWlhzEULcNLKdG8dtEDFKxD4EJsvwGsXqObCWEVTu1fabYMot9VsTYd0ei4d40a5R4ng
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(186003)(86362001)(33656002)(9686003)(2906002)(55016003)(26005)(6506007)(71200400001)(83380400001)(7696005)(8676002)(8936002)(38070700005)(478600001)(54906003)(110136005)(122000001)(52536014)(30864003)(5660300002)(82960400001)(921005)(316002)(66556008)(4326008)(41300700001)(7416002)(66946007)(76116006)(64756008)(66446008)(38100700002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AvgkqhyTym/qYJoyXjTuX/8MCRix9YVWl3A1cMgiDaybOfBYKo/iiqYNf5?=
 =?iso-8859-1?Q?0iPni4qLR2mxSDIMFDuVPQ8svCH7I7oal+mLh4JUEVKOmF9tPEN9ZCw2Vm?=
 =?iso-8859-1?Q?AUMyrHmWpublaSSkjAT6Gl2dk4GEd3Wjgx/r1enrmLbipL/MJX3GeDj1i3?=
 =?iso-8859-1?Q?WirNwyW8pbUfkLTYof8LCQx0e/MYXk1UBLxlL/+B0E1OBCHATT7rMinlCD?=
 =?iso-8859-1?Q?vmXk+kUkVPgYZYSHCs0Zo002oylMzX0yf5kkVKX+lb/u8UmODXrBjUgghi?=
 =?iso-8859-1?Q?DyN7Vpra4HCEW+NAHMMSoOuLRBV8xyGgjivc1hMxJj32+VI47Bo/sTrm6c?=
 =?iso-8859-1?Q?yMAIMVIKgrIw6Ss8JB/x82OtjdjhrG/3Jr/S1s1X9HQ9D8PptAAkYgSw69?=
 =?iso-8859-1?Q?FKZAzCsjBFOYdE5fZ/lqnbmKkFr+h959k/ZfOkmrhN/PdwhB2AtfT0Kk7m?=
 =?iso-8859-1?Q?0uZ5UYWSG7K4Mf/3LANUQdXOVOqn9J1FBqBA3KU81vSPu8grc22T0r+2G8?=
 =?iso-8859-1?Q?NLYEVK2l0OzjRfeMvilrf3kslDPqrHu3h1xbaJCQqhXBcyxJWaJnDtYx2p?=
 =?iso-8859-1?Q?wUPV2D7RAKCsfNT2O31tkKN/L2Pl+2/1yDL5Mj5D8LC9NHpK0q/ltN5AMp?=
 =?iso-8859-1?Q?D1gC+HlCyxfm8QW41v28nLSc1O9KCo4E7M6GdyfoDaNulICDKF8qewNwF+?=
 =?iso-8859-1?Q?7PIHi5lQ5nG7pRVlUsxVkt13+c3KJZWn91WcGjADhKadnaJ/0W6RJGmSe4?=
 =?iso-8859-1?Q?HG5wD0yo2txtF5Zw1vpqhr2p4d1P+O45TzALFroUFODIt6eaS9+kqzBb+z?=
 =?iso-8859-1?Q?O35qPOFS/sfgX/VUW/OPfoCRJGQBz0DKCYIwCtym7r+FWL1/KJC1duNEry?=
 =?iso-8859-1?Q?i5OjcQp8TGrheAeEgJxYL57L7W8ibrspFZ1Z1c7BEcN64jN2OcZ6eNLr+O?=
 =?iso-8859-1?Q?iq/6IeG/IRt4x+ZHNzgA9qndJXwgH+O95LYZ/PQorfxeMlJqW0R/fVKgAh?=
 =?iso-8859-1?Q?j9PBszZ2JuS9culeK9Rec8bV6W9uuNY5z31oyqUL64t7YGl9wD45jN8vPo?=
 =?iso-8859-1?Q?CrIqi00g+fGCjoFsgx6NSVTl5rpsArMc5dMXW/2ycX14ooUz6HwHeAnkLm?=
 =?iso-8859-1?Q?YS/YsB80a+QyVsOSCEhlcm0gcK8IPyE5QnjIq8oL0Uj6OIhMggnH5R4WOZ?=
 =?iso-8859-1?Q?pLSpPGbIyXNeh4qAXB0qGiSsub2guTPuI7AI+aoJ/dWSZku+X3M9ZsPODv?=
 =?iso-8859-1?Q?Hia85bwJeZBjCh2LEiHfp45yvl0VzuOgfCByJYA2GY/J3bjEhjuQfG7vkA?=
 =?iso-8859-1?Q?3uzVSXpd5tUuOeg4oIVSfoYGXP2qlbZ148ja7GGCN7+C2TdfZpIS2xgtkS?=
 =?iso-8859-1?Q?8lLrEW5Oi5bXjPAilGy8hClda8681vSh5f4Ry64hls6YXPpdlj1CsmeZhQ?=
 =?iso-8859-1?Q?VD883Omhl+iOglyiL6M/PX2978IzU5k0XI6FFldRF1WzkRmAvs3OThjWB7?=
 =?iso-8859-1?Q?CPqgPOriMg7LVVQei5VgPRkghxFFeN5LnYtADuhhQ1dqJou6C1qRN0yZg9?=
 =?iso-8859-1?Q?Ij0J/pz4xykNndn05kGR/4wZek2EDuIG4ImWBTKusnywKoJ4t8tQhwY2aR?=
 =?iso-8859-1?Q?d9to87/nw+FoXSBDwn2WkOwz3smMXF8qOG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226d2910-d242-4532-ad56-08db563dd1b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 18:46:11.4317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8E5YeQQ6JWCcBDu0nNVZVCkoLU+UWHH5Tci10raaj8t1a2OmN3cbleGAJdij1yvvhiI4ynuEszOPkhEUkpc3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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

Hi ,
Needed to add some more comments apart from the previous ones already given

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 127 ++++++++++++++++++----
> drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>  include/drm/display/drm_dsc_helper.h      |   7 +-
>  3 files changed, 119 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c
> b/drivers/gpu/drm/display/drm_dsc_helper.c
> index acb93d4116e0..35b39f3109c4 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -324,11 +324,81 @@ struct rc_parameters_data {
>=20
>  #define DSC_BPP(bpp)	((bpp) << 4)
>=20
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
>  /*
>   * Selected Rate Control Related Parameter Recommended Values
>   * from DSC_v1.11 spec & C Model release: DSC_model_20161212
>   */
> -static const struct rc_parameters_data rc_parameters[] =3D {
> +static const struct rc_parameters_data rc_parameters_1_2_444[] =3D {
>  	{
>  		.bpp =3D DSC_BPP(6), .bpc =3D 8,
>  		{ 768, 15, 6144, 3, 13, 11, 11, {
> @@ -388,22 +458,18 @@ static const struct rc_parameters_data
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
> @@ -412,9 +478,9 @@ static const struct rc_parameters_data
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
> @@ -498,8 +564,8 @@ static const struct rc_parameters_data
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
> @@ -508,8 +574,8 @@ static const struct rc_parameters_data
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
> @@ -518,9 +584,9 @@ static const struct rc_parameters_data
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
> @@ -602,7 +668,8 @@ static const struct rc_parameters_data
> rc_parameters[] =3D {
>  	{ /* sentinel */ }
>  };

I have verified the values and they look good to me.

>=20
> -static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
> +static const struct rc_parameters *get_rc_params(const struct
> rc_parameters_data *rc_parameters,
> +						 u16 dsc_bpp,
>  						 u8 bits_per_component)
>  {
>  	int i;
> @@ -622,11 +689,13 @@ static const struct rc_parameters
> *get_rc_params(u16 dsc_bpp,
>   * function.
>   *
>   * @vdsc_cfg: DSC Configuration data partially filled by driver
> + * @kind: operating mode and standard to follow
>   *
>   * Return: 0 or -error code in case of an error
>   */
> -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum
> +drm_dsc_params_kind kind)
>  {
> +	const struct rc_parameters_data *data;
>  	const struct rc_parameters *rc_params;
>  	int i;
>=20
> @@ -634,7 +703,19 @@ int drm_dsc_setup_rc_params(struct
> drm_dsc_config *vdsc_cfg)
>  			 !vdsc_cfg->bits_per_component))
>  		return -EINVAL;
>=20
> -	rc_params =3D get_rc_params(vdsc_cfg->bits_per_pixel,
> +	switch (kind) {
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

I do not think this kind of assignment works as you will also be adding=20
DRM_DSC_1_2_422 and DRM_DSC_1_2_420 in further patches and AFAICS
There is no where in patch 8 that you have accounted for when 422 or 420 wi=
ll be used.
Maybe you can add an if case inside the else block to check pipe_config->ou=
tput_format
to pass the rc_param_data in patch 8

Regards,
Suraj Kandpal
>  		if (ret)
>  			return ret;
>=20
> diff --git a/include/drm/display/drm_dsc_helper.h
> b/include/drm/display/drm_dsc_helper.h
> index 1681791f65a5..c634bb2935d3 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -10,12 +10,17 @@
>=20
>  #include <drm/display/drm_dsc.h>
>=20
> +enum drm_dsc_params_kind {
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
> +drm_dsc_params_kind kind);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>=20
>  #endif /* _DRM_DSC_HELPER_H_ */
> --
> 2.39.2

