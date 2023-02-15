Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B326984EE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 20:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55A410EBB3;
	Wed, 15 Feb 2023 19:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1659A10E2AA;
 Wed, 15 Feb 2023 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676490497; x=1708026497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jLVkXym4XNRmdMAoI9QUZhyb0nkGHxS7MN7PI+Qx9j0=;
 b=gqJV80cYIEBD4Al96eQ5xqMT7F3TaRTyDVwGLbQiYZoaqr6Ew92ByQdL
 ypgTCuNqpoZ1bdLAVnpmW/jtOL6yYmlw2WTCSOkTYlM0R1xeAvD5BFXv8
 9QwXogVo1YFQeBiO+v+rp0WkGY7/Voi0ouWlcxGXt4EoLhoBsKujXqG9F
 CMpC5mSbzZv7bDs4pt60De6NAQvok/Sah1uQP/hBUwsr0W9V8SRYPrD24
 dKi/8VBwyIF4zLm6Ch84eG8YjJiVZOBrv16JkuEuMarX4cmBSji62FYNG
 r2mAjvMJ9ePE22S2iveOdVHddmqBqe3/1w/8A9UgRWekLMvYUdx6X0YPM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="332843899"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="332843899"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 11:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="738514223"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="738514223"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2023 11:48:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 11:48:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 11:48:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 11:48:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gogxYISya/IZ+lDngY7Nj7PVDuPkgKGRWz0OYjpBCI3MntEECI23S0YOhmZhbwp5/vas2IUpF9kqz5LJnVxe4K+4SqE+0zGVb8+/MI0I739BmXud9dNfiwL0PYA4MKWGN5I79ZAw6syoZlKwFjRqhJ040lL5DgCpaTJYFJkYfIIWaQJs76+PX3gLaA4NIr8+AZY5+bieH96ysEgHiXdT3VWKAmQSltzuiQLuMBokpKZYytYlJL7XtoXZyXW8vjuHeUT1nefYpjj0vLOFqiv7PKcU+JBUfJlFn7RtntfTh2K9Lc5JVR9UMxuR1neFV7m9yxbEE/tAzYRdw7V8KWUgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3Z340DAl5Vwq9IBk8bqI3RMhRmy8FdKPW2WUEKo4fs=;
 b=JyL9NaHuO0ieAHfpCam6NuPnPVbgHgd8YL2liZRZ9m9eVdQzdU65aCWX0jZN5/tHSWPP7gKLoILpj01m1izfBsqvuFIErNNrVOCeijkHJxH+q96+Jtj0JdUQqO/wX4oIRYkQcvPqhJAVNGdg0zuDAR/zWyK757F9r+xwOGu5fwQtWuG9QQS36GzM2qg10XyNt+mStZjvinTnxehJjH+59Pn/PVN2CMYHyt2PJKwRNT58faRW09YeoBGcpNEPnSCspwdJwR/iMt6hEIttDZnTFw4K0+Pw4Lxbl+b+IFZgonXXfOG5UmlqhVB8gk1y+YSvWfiOgobPOWHaXRRrw/p5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Wed, 15 Feb 2023 19:48:13 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::37fb:4480:3ea:b4f]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::37fb:4480:3ea:b4f%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 19:48:13 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/xelpmp: Consider GSI offset when doing MCR
 lookups
Thread-Topic: [PATCH] drm/i915/xelpmp: Consider GSI offset when doing MCR
 lookups
Thread-Index: AQHZQAoIiOe3R61+LEeFQRuRGLdgLa7QbGbw
Date: Wed, 15 Feb 2023 19:48:13 +0000
Message-ID: <DM4PR11MB5971F28E15324881A9F8B70B87A39@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230214001906.1477370-1-matthew.d.roper@intel.com>
In-Reply-To: <20230214001906.1477370-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|CY8PR11MB7059:EE_
x-ms-office365-filtering-correlation-id: f8e4cffd-26c2-4316-71b6-08db0f8d931d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vc9cE8n/kK4crcTWIdiTNWKpMyBzaiq9KAV2Vq0l8plIcKG524RtskpW3l0wZh20DB3USw3yskVKigGw+0pfUBMbtj7cv35ElG/ZZcc4URcbGPInA18QReoCLarlA+PbCFOTdxaC24lCdVYG1JTNR7axleeYv5yaYq5fUGlOmWOoPhshg5ovOSbtBJ3pd1XbaGeSPRObhGvlCZnp1jCpLfNhnW+w41DOqmQout0pam7mqnFCyflv//7teYg9BzYqyL0KJgppUYDBP2HUfakmQ/NzZAijAYbsxgVH5DoLpWi6GdBjwZli4q0odkWI1lObWvnU3UQWkZTVhftwLKqu8dfRI6p5bBFv8DhtMgf2YSamwP8p9781qKwfsXo04tw0tCSKJ2e5m40uyymrGvDVXXO9I5iFaxI96Q6IilP3MIbJAMjh37AlW18yagAjLkaHLdByDmwjv/85X6NYCqlL17iprxPg6fkCXkfdUx3YeeLBzObyHl2RjB5BQTW8CzWmsWQ8pouYDK5CWQYkP13OyXSYVxjMa41Zx8fj5dOyRviZl1XxOObt7Yl5E98CCYKejL2HLqnKwIJdZaWszsPiop1HhSLWn/dgaO3VYLETn+43malNaowKTBU+uqfDAO2/VsWTy1KvG6aq2yU+DTFveF1qC3vTAv9ooqUjdwELbmbbCKTniyIMn/KyOCA6X4oCBUq3HGbQ1J+0d+CmTpnGZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199018)(82960400001)(33656002)(478600001)(41300700001)(9686003)(5660300002)(52536014)(8936002)(450100002)(110136005)(66476007)(71200400001)(4326008)(7696005)(316002)(66556008)(64756008)(8676002)(86362001)(66446008)(66946007)(83380400001)(76116006)(53546011)(26005)(6506007)(186003)(38070700005)(2906002)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?20m7wghiAXR3HetGHecpzXv1xsBrPG3WpZ4Bu2yL2lSPzFIpaPbu3bXuKIr9?=
 =?us-ascii?Q?bWHLtKDvZds/jHl8jXwIh2q07EFwdpUvEsN1RzZHJBF9AJe9ZQlJDk5SdTpr?=
 =?us-ascii?Q?EjWV1PlYsfy+RTOh68VOLruQ/5wjAnzDnn7yH8N0Y2lOhSNrxgLGLg/tyVz1?=
 =?us-ascii?Q?LpKg993ZjHJ/QUpmRTAaNActK6Y7hzPNR2fyGCgOYoUEoZFZse/hOwg43nLx?=
 =?us-ascii?Q?jhMznwNTEM1xAkkYS6ekoPAIgZOoUwTPOxOUGMp6hsSNj1PKFDTCW598C0J5?=
 =?us-ascii?Q?HC+FziUMVYUx2Uvcioki2XRgtge3r5SuAqBKZuQjwj3VAfke6GYsSpwRW3OG?=
 =?us-ascii?Q?wqhQVlUjq9U2zmNTy0TPLPDcClMGDEy4ByBGlpQhK0XGkvEL03yx2Plh4zt0?=
 =?us-ascii?Q?eUPK1wMTZKqXKL0f1BJqxtbTBEYKEq28vDVvnARqBL6lEIQnC+J7R8zcjibj?=
 =?us-ascii?Q?s03gPPQoLYpJicvRhjukEMDdG8SXSotJO6NU7IZrci3LO8m1zcGP2Nt64/MR?=
 =?us-ascii?Q?IF9vh4qpiCXoGLMEENMOUkx51ViiIwRyBqaZUlBSBZR8+pvW/uGi4gcmdfoD?=
 =?us-ascii?Q?sbEmp+/RGKPauGlqLkTaq13fjnOLG2tDYufFm7M++5ZfdYC0omgCKX/1lCT9?=
 =?us-ascii?Q?vlGtuE1eOeQ7UO+eeGBKnfloQiJ7Tv+DjeOuJoQlns4FV2yawiIwSd95uHA3?=
 =?us-ascii?Q?bWJYCmjYZ93pkOUUqTyVuXItEsF51nR9WcJuWY6yBZTLr1oD+FCsV+DTVYyY?=
 =?us-ascii?Q?kwbA/dyly99b1SuEy8To5UC7OqMbJHg2jIoiQ0eP2cs03HUF6unpRa3/Ih1l?=
 =?us-ascii?Q?1vYkYo37+oy0uyOurOvic3A0xYsbaMADSea+itGkjzSaCdrz0ZWl1vMYQDAL?=
 =?us-ascii?Q?6vyzzBuut5dgPxdEcc4iWEd11YW8VXCtT02zzIIJLP9bcyXW+z5Nm7Rbia2U?=
 =?us-ascii?Q?lfPbkiqauBj8+D7XtUGjPSDs70+QC9m+X25NYuH+Qg7cFLaslI0EvdXNErzq?=
 =?us-ascii?Q?i5xkA3Eu7wQRy6dmbKWe0347jFggVdW9B6/88CW+ulkufZk31AY2PTSbdJGJ?=
 =?us-ascii?Q?jqP6pOapzaq3C3eDFiRUMBTOkmyD1+LAu0xDH+IumUztNPL/zdAZCzMrsaZ4?=
 =?us-ascii?Q?KCjKW1UZCCbFCYSSd3E+j9hmqUiz6WagrwdAawTNo6jVXWBfAjFQ2fxzAhO7?=
 =?us-ascii?Q?gGFLw9Y0cnCCHDJTVuL2JyjRORqLVpcsZV2R8qd1pLbCkUtgKFnjN7ulsHNc?=
 =?us-ascii?Q?nV+ciSFm2sRy0pNLSFxheRO8tkv3BSGbznt0hnE1cYtXh19MS/MbcNS/x1H9?=
 =?us-ascii?Q?EFm8wrgy56sjlMOgZs2Gf1u2Hgd15mfNlJ/V6ZRwv+sfL94spoZEYw2UZKMI?=
 =?us-ascii?Q?QB9N0hANkg7WkFtktflwezfqok0mT5Vk9EjDE4Rlmi7D2sMjx02R3aMdgfnM?=
 =?us-ascii?Q?jjubln/xX33EbYr4KqVeer6qx9RiszoTsWZ3vy7HqxsY3bYLy4L50/shqY5t?=
 =?us-ascii?Q?N8eJQWC7zfqaxFiNra6hPsNV1D2AXeMFR8rqZEjr1CF5cwMUZWvtgQBycBou?=
 =?us-ascii?Q?LcSCIlWfK7TqJiHELutWQ4yHXCz5/Uzl4CxD+HrMFjUPewZC0/aPxCMf/wfE?=
 =?us-ascii?Q?0w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e4cffd-26c2-4316-71b6-08db0f8d931d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 19:48:13.5730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wz1Qmh3Aix3SR/0hV6LnaYsx6yv+hwMXDX7hHtLPMXv9u3eBYcYOHAlE5eWHktKshDStZiFFUCkCkkQasrMkyC5kpRa/jx40CLbZGOvFnTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ma=
tt
> Roper
> Sent: Monday, February 13, 2023 4:19 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH] drm/i915/xelpmp: Consider GSI offset when doing MCR
> lookups
>=20
> MCR range tables use the final MMIO offset of a register (including the
> 0x380000 GSI offset when applicable).  Since the i915_mcr_reg_t passed
> as a parameter during steering lookup does not include the GSI offset,
> we need to add it back in for GSI registers before searching the tables.
>=20
> Fixes: a7ec65fc7e83 ("drm/i915/xelpmp: Add multicast steering for media G=
T")

LGTM,
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index a4a8b8bc5737..03632df27de3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -561,12 +561,15 @@ static bool reg_needs_read_steering(struct intel_gt
> *gt,
>  				    i915_mcr_reg_t reg,
>  				    enum intel_steering_type type)
>  {
> -	const u32 offset =3D i915_mmio_reg_offset(reg);
> +	u32 offset =3D i915_mmio_reg_offset(reg);
>  	const struct intel_mmio_range *entry;
>=20
>  	if (likely(!gt->steering_table[type]))
>  		return false;
>=20
> +	if (IS_GSI_REG(offset))
> +		offset +=3D gt->uncore->gsi_offset;
> +
>  	for (entry =3D gt->steering_table[type]; entry->end; entry++) {
>  		if (offset >=3D entry->start && offset <=3D entry->end)
>  			return true;
> --
> 2.39.1

