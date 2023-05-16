Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709927054AE
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 19:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236810E283;
	Tue, 16 May 2023 17:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB7810E282;
 Tue, 16 May 2023 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684256719; x=1715792719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6mOJ72EMWMRlyCWbmQN/QvObXCuhRQKuUzCpfWP7v0Q=;
 b=cuwR0ZGS/AStY1C255P3l6qMWPfDkkA1bUE7PIoTdXQTyxQ4jYar7E3Z
 VB4gNxFN5K/5updP8vmkLaamdJoOdhpkqTDrgIif5KIgq5lh75VMhWM/B
 9LOXmmGZswdbcEeGEJruX+KrhRuSDv0jk0FOMju3yAY/GYkPwiBSopvRS
 eD6KovcIv6EO0uQ6ni0Q2Ya0ietslBHV95nMij1gu2AeqV9MJ0MAsYb7f
 esbWjjIospX7sInBHrp0+X2+Zf18cZqG81AlMP487twjPov4ccJln7A7F
 65GgbEFw/muHkSzHFakGZvHo2hz/dK9VPjoI47GQRpuW7o8q7EAMctLyb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="353820973"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="353820973"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="701425758"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="701425758"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 16 May 2023 10:03:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 10:03:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 10:03:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 10:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QS6fJ/646e4pM51Sx5pdw/E/cRmAecwXwgC3ujHksX9q9Q+2WgydVgd+GPQwnTJEGm/B6WtwUeBv/sXOvGri3rsnYkZ9jc3zO2SVFZ4k4+QT939c1LyRpb1TW6EdZPWoSaOzdieECaPxxfktvyL0n1QNZOk55UWKACnDrl09tcAHT73qrxJGwkZYmdy7AcuEvQG9Uzsl2C5apytLDCoSwCd7IhoqvifxY+4NsBQ91IL4sxslMkISrUkqUgcW58f3y7vqWW4wwL5fD4iTEPYwoLODL15lA9p2MYdD6cpSrEUSQh5EZyf6580iuM2Ryy3urDkScE3sokRMkPbCQbt34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq/VLfLpxd26JjKbVOY+3iN94Uy+BauY3eiwGkpx1tA=;
 b=mIOG9wh8qqxfMvms2WTrA9rOzQTVwYuZCcUmyOpU9FudSeVuyvZxS9T/qVUgEjYWYhCvdFd3l9XTOfgbSylO1S4uqf7niDdaiNcJpLUSu7iJUHf3RMErGsCn0rKvHxlSVx9Z1Tw8HCYqtosVCzKpxBldOhudKKw/AOYTfUapWHTZbXLmZ+9x4s/mQc/sw4UeZuXArCQcFEcHp250IXx0RlMWdfmt89VnoycLP2sLg7BsN04K1mGUu7qY+kGPoAwUIeauwAcrTddw+BMEEi/b0RmQ8K6KS1TXuU/IQAPlPdA7apucKdBZw5/hgEaHFd+flbvWKDUhMiIbmoDtSfGrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 17:03:34 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 17:03:34 +0000
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
Thread-Index: AQHZfp4YcDsmrD/BuE6hnamqa8oWkK9dMMHQ
Date: Tue, 16 May 2023 17:03:33 +0000
Message-ID: <SN7PR11MB6750EE75A4B736249779F12CE3799@SN7PR11MB6750.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA1PR11MB6538:EE_
x-ms-office365-filtering-correlation-id: f240eb89-de18-4842-7fc0-08db562f7b91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9D+Snejq8/dFR6ObreplOpGmj0+VDNsGjdthTBKJLn5AC1VXbES9Gg59eqFinJLbF6athaNe/8gljoSfn+HkoeidJBCP1wYnl7xwFkOhD8fkaS6TzbStAZV4x8pujr5kqhs/unBYgMwzCGO4ji87gZsOJHzxDz4gxXL32bgaphQNjN3Wxru0Fxr3DUFgvionNnrakvgZcWCxVN69Upz8ytbaEfTdldbjEZ/Hmd7ZZa1VbQ81bLpKKqOIrfyHMxNo9DuK0NuGZcWeHzjLfz1R7ULE5or8aZno1lcdw2pySTgHQICVDaTA7sTcWpQibv/Vw0/uRDwqsP/1doc8Nh/DZRMwEr3EfHcI5vUxq0nFZgy1t2/xedWNj7jw25YywCc77o4JFDdC14QQ/qGe438nXxEaeHIJLrvP4mLnxdw/xMIIRpUwx23uYOwn0jFzZFOeYUUNWrBenUeacPKujU/39t9NKRX9fsQf5tLinihZestHiGtjKWBcmEnP7GGm6sY7mc5IgLjtg5ym+/RrAcBpeq9bwVjAI5gp0payKNJ/hgYDk19mVOeEmdGKLMMqPnzJGTAvKWcDZ1rePBazuQrKbM2PWkqyZ4jNBRWE8oaXyX/2hd1MiUqUaN7EqscKH9fS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(478600001)(54906003)(110136005)(52536014)(7416002)(8676002)(86362001)(5660300002)(921005)(8936002)(2906002)(30864003)(33656002)(38070700005)(76116006)(64756008)(66556008)(4326008)(66476007)(66446008)(82960400001)(122000001)(66946007)(316002)(41300700001)(38100700002)(186003)(26005)(83380400001)(9686003)(55016003)(6506007)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PbKHQ5V57i0g1wjRvN+DjjFDrQvOQ40nJ0zIajMT3W/riA2cSkWpKXlGBk?=
 =?iso-8859-1?Q?vLYNDmsaMNYMvc7cIX6gX+JmIU4Pf7F2FIz0uT9/ahltbTrE48I6H6/9HT?=
 =?iso-8859-1?Q?AmYygApWnL/uXFxODXP+3SE1PTbmQf3Wjt6lo/nPZa+OGrCe5vygTF50to?=
 =?iso-8859-1?Q?Pq8TivSp5vnJzaNvbE8KBzldQPCwu+Wfh5f3euSg5AWpG06hbRNMZRsppY?=
 =?iso-8859-1?Q?hqhrl+JpmttX18iLOTLWdswuNSgjqxvPuTJWxGaNzSoJVBpqpvCzNNUcbd?=
 =?iso-8859-1?Q?8GQpkk+MFX/cQhZpjl2hqVTDmsbE10zPDK59tFYaVQyNFxl+ja6S5aklD+?=
 =?iso-8859-1?Q?OIb53OX0rmT65aVS80aXwFDsuuG3lO3lmfZM9wBSt1SiQsemF9A4tKIzIw?=
 =?iso-8859-1?Q?MB9DejVP4WPATyqayWEN04fAwmdfFA4wL31J+KyTM6DVlcn3IFoiANFply?=
 =?iso-8859-1?Q?2Fd2VGypINCIeB9b1V50RO/4EyTs+18spNLhdfZL0ZSgKiipcV6Gsi28Wj?=
 =?iso-8859-1?Q?OPYcxJ08VsSDnVDbhnjEBC+yGT8z0Xsa+sRyJRX88WWLQ/no6m0bpMrOpn?=
 =?iso-8859-1?Q?A5WpsZeXgwyHwLiVrkiB1SLWJaKUqqJ39itJtGDIxVUnFS8KImeY8kV1AK?=
 =?iso-8859-1?Q?RyTowThoUlojxv0+6anptfYE/fMCpYud8nFcAbGsxD0waOiqbAHx+2rYdf?=
 =?iso-8859-1?Q?OESHOHrt2fnlckWmwGKWi1mH0y86P3Q11oralZvVzWkSM7L5LgPNEsRDOT?=
 =?iso-8859-1?Q?Z1koAPy7mpbPeXn/rAunKYKLEInDU43m7DonzoEqstjxgs9UhlISqtF12S?=
 =?iso-8859-1?Q?Xfd+Q+CFlgFGWM78PpBovKtnJh56zJRPhne4vlDnLf1Vgzep2fy6BzQYSW?=
 =?iso-8859-1?Q?JYMJurtO9vcYb5mp3XDL2qr2IubF1UbM4oMgYtbCilUQEHaDuhq/oEvX72?=
 =?iso-8859-1?Q?DtRGIw4S+unOrrLINqXYvAwhhK9WwnWelqn9BuVBAMha3h7ZI69PUSC3v3?=
 =?iso-8859-1?Q?y6bwfqpN+0y/exLe/Hx4BdCgy69JnU6pckal9M3FtvWfqQ79LjZ4OK1/CH?=
 =?iso-8859-1?Q?JForscTbMQUq4qMKT7BmW/L9zLFU27nTFD7ZXt7n2biS4HotAwitWKfm8m?=
 =?iso-8859-1?Q?Jq/nwKUpHAAkJeLweeH06QLmoqFSAgEHK4v3W8WNS8Wfn/KoUiyYZUVfIA?=
 =?iso-8859-1?Q?rwyz15thYReyzQ/x5ii9aweU2rtOqGp8jGvT3ij8wk20z7SRwkORooMwXv?=
 =?iso-8859-1?Q?AlUAf/p4qIQ8s0y06wPQT2bAqT7yDUGUTo96f4Cfs5mrxW4vm942aQhtTA?=
 =?iso-8859-1?Q?bq5eJKNv16tMBhC3SxDSL14y+OLALzBZgQAvGqiOmGkPqf0NVkwB66yS/U?=
 =?iso-8859-1?Q?CXMsVWWBb0Bmn2OywkKSwET++OfibzTUHwMCrjU8zFhPL1Elqgt5VMwq3F?=
 =?iso-8859-1?Q?t/nzjxs0eYndKNi1AwbjTdaeLegybtco2QAGyaSYRxcQWtK7OVI6I9vXm3?=
 =?iso-8859-1?Q?gndnO1jTyCJhzCnX5XlrFtsUcsM8xz9vz6PdCnvnu0wF1ZqlR/iR9S6UZn?=
 =?iso-8859-1?Q?9k2tfV02A38l+Qp68tWF0RmDTVUteIX2AfDU7s/+sFGwrXBalRpRLnJq5n?=
 =?iso-8859-1?Q?UXZGXuXlX+mxRl2kVdi/M0yYgDSZb4OdHE?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f240eb89-de18-4842-7fc0-08db562f7b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 17:03:33.9202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Of/YqmaJU5evbmflgT5bHJhmm/ztqi4ufx/ZbHYsB/SG2vy7OC2gASU1I7oOOSB4w+WI9mEEZhIvnHB3kn5xUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
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

> Subject: [PATCH v5 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-S=
CR)
> parameters
>=20
> The array of rc_parameters contains a mixture of parameters from DSC 1.1
> and DSC 1.2 standards. Split these tow configuration arrays in preparatio=
n to
> adding more configuration data.
>=20
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

Maybe  comment here mentioning the DSC version and the C Model
we follow would be useful

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

The above comment shouldn't be above this function anymore since
This represent dsc_v1.2 I presume maybe move this comment above
and add a new comment for this function.

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

Nit: can we rename this to drm_dsc_param_type rather than kind=20
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

