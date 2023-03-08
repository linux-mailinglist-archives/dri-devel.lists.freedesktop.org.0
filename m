Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 873126B05D8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8655010E004;
	Wed,  8 Mar 2023 11:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D4110E004;
 Wed,  8 Mar 2023 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678274597; x=1709810597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=41l0H7uLzJ0YhIKuxIQUWKJ609DkyCDTrJTVs3zhpKI=;
 b=d80OTP18pKeUxwRoyQGJwqy5NrNpYIjNsTWHJ9YEhCnrQMxcv2ZoTpUO
 +O5/wNqjnmvB1Eu12JZff6bPMRNOKDI0P1lFmxagzWLops/JzRbMtn7D3
 s89F5XDPp5XZbu45+DDDLVOvrLO93R0snVwu9KlHX6ZgmXj7WVSrNnmSN
 XMltX65NlweSPya1RSt+3FYIOjimyH0Tr0qlgK49WW1Q5RIVlmPq1QSOm
 w0Z6h5jTpYtqaxWvXnxTXDdCNISEZxjrIrHIGmZlQ1JbAUTDfQeaLS+Rg
 jxPVEdHBL1RzQO5IJYp7w9q0U7zN88P3Im8aP2GJGaZGqr7zHUq1jI9A2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337646377"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="337646377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="707147064"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="707147064"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 03:23:17 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 03:23:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 03:23:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 03:23:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fya9DT6HVBs9ZW4Hb0Tx37n9zpdxUuQHhQE8sGwuU27712mv0C45BBhmQL2NvvddW3y/BTvwmhcrs9PWHkOFF5QyL4TRM199lq0CBWBHRrdKG0munVvbtYKnZr8p9w4QPV+S0CcWaD3bZJ1PORGRpziRecs+yN7rMPF3Wl9mHEU19q0hwGEiH6roKAxC9bwuJbczrL8JTA3ZK3ugUSp4QjWxIRzhdCn+HUtLFX3JZM4WQwtjGg4cOBbWuSOGUrhYkJimFv3Xh+yqjNX8h+KaEPW3zZWUEObCfbpbBOCLMfSP0o+4dvsetoZPYeptawtOt/Z2de23aJ3Kwh1484wuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPYrloNta+2t/PWVZtkZF9rpnY6pRU2Br5JjdT3rXiQ=;
 b=jiyft4kquEpqs1XgvSuOILWxAfeHghDV8N6mkjVkot1nmJTzaNEqXvSQpwXtq2+0+XI4j7iPkUoYOqpwr6qafDi5ZOsVyo73US5CtCEv03CkGinhKNkkZ15WDozmWsHwoZb0toichrrW2YqZFa5Z0g2d0TEeaFZZ4aqRdX5avBx+H0dYWGkkxv/hkFffTx/MamCprt6Ggfw+wv8QFqgHFvhIbvHLj4L89pjFU7GJfggevfq+iDusBAEwMa9oNIIGOGQgDQCqIipsRzxFDM3erev0kJYpSNbYnFP0zjeRMTtyVD9Sci0t4wuPlwBGs7yKe/soSbfsYSoX4cv6Tr/MDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 11:23:13 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e%6]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 11:23:13 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 6/7] drm/i915/vdsc: Check slice design requirement
Thread-Topic: [PATCH 6/7] drm/i915/vdsc: Check slice design requirement
Thread-Index: AQHZRn8s35EzIHteUUeqwQkyWDPHvK7w064w
Date: Wed, 8 Mar 2023 11:23:13 +0000
Message-ID: <DM4PR11MB63608476674D518759B203D0F4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <20230222053153.3658345-7-suraj.kandpal@intel.com>
In-Reply-To: <20230222053153.3658345-7-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB8150:EE_
x-ms-office365-filtering-correlation-id: b2fb965e-9589-4436-61c6-08db1fc78158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gc5UTgC0H5Ht795cSWar1F9WFyxVQuCQfmGK3hoI5eh4/RUcGBt2HkU+VNVZ1RKriCiEVLGleeYObtdH2PkCLLKORztVMg8GFBxthhMP74S5BOZTusUGkCZJaD5FLuFY4T6Eo6rpPEibxHn5OpvSgzXOTChc8xwrIwI+83Y/wUZ5EFgNPo0mSlL8eHidQt+7U8JWcHrjvn2QpC5WM/JYG/eP1/e1DTwn/e+W1BP2btnpVnfrUxEX8kfoJSUX2eIdHiY/WdHE267j/jD0eCHDCnnf4xkGVziTLqq45c0w8AvZTASO49Ve4GrAGtbVd2ClWjsgqMAhlIkpqK1z4q1WtTIz0UhKkkZAxipnDQmc9hDq9JtH5QV0q8+nD2TBiiqFf37hvCyUM93BIvpgz5KSfPgwmNsuHJjvUJ2HrWunyaMnBf3ERCx1EsqNyLZJj9202dVXDFBrJXr0PrnJ53zJvXi2bGZd5EiUNIqfF3ipRLwkgj//XhwVZhnXnv67U5Jd2gAhlhql5BNfMNK08AaUKQNFvaaIxlABZa6gXhDUyJWXnRp4v4VT13tQ2KcmhsYcEwCLxFx96Szj1FPOartrbYBchlgQSZy5iGX8rynePiU71paSK15Yb/r2mFfWtRRUnXXcfITW4hQBzsak+lP2KgykaSjCLMkUirImLt98uGRkpH8g9YCyhl/Zeo9uG2/hDsCJTu1B6xWsL4f/3QD4ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199018)(33656002)(38070700005)(8676002)(4326008)(64756008)(66556008)(66446008)(8936002)(41300700001)(71200400001)(2906002)(76116006)(5660300002)(66946007)(86362001)(122000001)(82960400001)(66476007)(38100700002)(55016003)(107886003)(478600001)(26005)(110136005)(316002)(450100002)(52536014)(83380400001)(53546011)(6506007)(186003)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?90HtZDfjhAa+KuG8jblUr9DlGgIgSnTJsWLzEtxmiEnH0UtqIJzdpv9Nyp8s?=
 =?us-ascii?Q?86XPKC2HJ5n6gSIiVjTnjItuqmAjBMm6wuFSI+gKPJf2HkKRz5GJCpW5t0zP?=
 =?us-ascii?Q?FABj3InAIuvHeLFIec7wJsn/m+kPmXOrb2XZ6U4BByfIk4rmy4IPjOhUON3l?=
 =?us-ascii?Q?zhym1Cde5/l2C9q99CiWlOhRIfaMM8sqr5jj2cQVK2Kw8T9HheHG7AHc7U+a?=
 =?us-ascii?Q?8NrtvGMYJuuP2VuWzfhJcUER+Z5gptgeLXld+ZI/bGQ9Od9D24Sb8z3BXsiS?=
 =?us-ascii?Q?jfR+CYzqbbPlbmVhpSHSoSG5UcFU/orRhnn+AVXL9Un6utb9vmE3a33UBqcu?=
 =?us-ascii?Q?1r8KlOFmSmTbKjeWR785bgGKUFzPluISPXSB8bUi3JZJ7tAzLJecNTD3QhUc?=
 =?us-ascii?Q?qAqRSknkrlTHcVASvshjIW3lEoPj0LKIpCePN954FdG5durL5NGjtwln8wrf?=
 =?us-ascii?Q?qiUFhClfhgctgjaWoU0q145O+mbxiJSkQcJ4bVX1NZmIn36h4c01w1SXG0uf?=
 =?us-ascii?Q?3QGJmT8fqdjDuAJmBjqb99RHPwh9lKWu5WSvb8xkckjj/o09An3bsavh9tC0?=
 =?us-ascii?Q?h03ARa+P777q/Rt8yZe7JoLngvLB3g0yXCOaEGYfvylZu564Le6/p/tUrLLY?=
 =?us-ascii?Q?8/4lG9xBe3oEvsBmaCkTirI/2P9ondBqBE2P4eAab0UP8+Uh38vzKN4REFIf?=
 =?us-ascii?Q?1heB1urP8ZyuduVREHXNA8FBe0yzY3WE5H8gK7pfXAkTuCQodoNGbiCIEYzf?=
 =?us-ascii?Q?+Q3GSoxxz8JP8faLkWqRn+h0Vxd2JFK07k8qGNgvb4okD2CykxJdSoYKDUAf?=
 =?us-ascii?Q?n2qXyo0ywSvhl0UGJM/lMmd9kddSbeTjA3U9E39oH+AM6/fvUEU6TF0KjavV?=
 =?us-ascii?Q?an6JoNwh0H3kp8nVX/fRw/RaJ/NsJY3MrGsBnSEMoIrGDmoWGKzISD5ghLj9?=
 =?us-ascii?Q?EfNViOQudzOKAJG2OWoE4ZOwIQFewc0uPBuk3nDLV7NoEgILpnnXfwzgh9va?=
 =?us-ascii?Q?krXIizAtae5X8ReM25Sa6ChxYwrg0LOipo3Syoe8zcaIlmKdjlBWD7sN92Vv?=
 =?us-ascii?Q?DOtc7KPEBgvOXSfwSkckuNQqBUxtMkC6xTIXCs+VrBXJD50ypuJ/4CxHmgPQ?=
 =?us-ascii?Q?kE7IAU/12d0VByT0+R6tW0luBwfo/p1EOdPnDl3ztTkriuLYkYkmiwe510T8?=
 =?us-ascii?Q?ubmYvBF97v3ImyzI/02g2Afwvxvax/LxtW/tmIdNAKYCjdUKgmX51RdzXOiN?=
 =?us-ascii?Q?La5HK87z/wGWW37DUimXaoXDdJ8rSU1OpBkhU+va198wpDFhlrUXGvEkSZDX?=
 =?us-ascii?Q?TMi6DiFQIPXrc9FIbLDNYil/0R1dFHCp9/Frczp4XHgFVCtPoe/SQlRkCbL3?=
 =?us-ascii?Q?x/+mPEZG7KidWh5bDdyKq4Ry7NCvJ0DH32SmOeNnVrwofUWWx5yiXSEcSP5a?=
 =?us-ascii?Q?+SzJM4rBifjhk+gt0lC5yYfP1O6rLopy1ptw9ww1O7DSHAWhsK2D+W/0iUVh?=
 =?us-ascii?Q?XFDrtpmLPtzhCPLyaIYENeDNi2ksvZmE+tKX9NQZAkwxcIx9PrxZ46nbm88A?=
 =?us-ascii?Q?CbGxZdVqusIfpGxCFWT9qP+87FCZAjnVC/EkveH0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fb965e-9589-4436-61c6-08db1fc78158
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 11:23:13.1438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BW8/UP3gdvE9B0bazs0uJ5nzcp9QVktNsJtBl4IPKsF493Wsg+zly+6dYssdCwKhOeA/g+89+wNse5hdYkdpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Wednesday, February 22, 2023 11:02 AM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 6/7] drm/i915/vdsc: Check slice design requirement
>=20
> Add function to check if slice design requirements are being met as defin=
ed in Bspec:
> 49259 in the section Slice Design Requirement
>=20
> --v7
> -remove full bspec link [Jani]
> -rename intel_dsc_check_slice_design_req to intel_dsc_slice_dimensions_va=
lid
> [Jani]
>=20
> --v8
> -fix condition to check if slice width and height are of two -fix minimum=
 pixel in slice
> condition
>=20
> --v10
> -condition should be < rather then >=3D [Uma]

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 32997c9773aa..a9585f493318 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -447,6 +447,29 @@ calculate_rc_params(struct rc_parameters *rc,
>  	}
>  }
>=20
> +static int intel_dsc_slice_dimensions_valid(struct intel_crtc_state *pip=
e_config,
> +					    struct drm_dsc_config *vdsc_cfg) {
> +	if (pipe_config->output_format =3D=3D INTEL_OUTPUT_FORMAT_RGB ||
> +	    pipe_config->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444) {
> +		if (vdsc_cfg->slice_height > 4095)
> +			return -EINVAL;
> +		if (vdsc_cfg->slice_height * vdsc_cfg->slice_width < 15000)
> +			return -EINVAL;
> +	} else if (pipe_config->output_format =3D=3D
> INTEL_OUTPUT_FORMAT_YCBCR420) {
> +		if (vdsc_cfg->slice_width % 2)
> +			return -EINVAL;
> +		if (vdsc_cfg->slice_height % 2)
> +			return -EINVAL;
> +		if (vdsc_cfg->slice_height > 4094)
> +			return -EINVAL;
> +		if (vdsc_cfg->slice_height * vdsc_cfg->slice_width < 30000)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)  {
>  	struct intel_crtc *crtc =3D to_intel_crtc(pipe_config->uapi.crtc);
> @@ -455,11 +478,20 @@ int intel_dsc_compute_params(struct intel_crtc_stat=
e
> *pipe_config)
>  	u16 compressed_bpp =3D pipe_config->dsc.compressed_bpp;
>  	const struct rc_parameters *rc_params;
>  	struct rc_parameters *rc =3D NULL;
> +	int err;
>  	u8 i =3D 0;
>=20
>  	vdsc_cfg->pic_width =3D pipe_config->hw.adjusted_mode.crtc_hdisplay;
>  	vdsc_cfg->slice_width =3D DIV_ROUND_UP(vdsc_cfg->pic_width,
>  					     pipe_config->dsc.slice_count);
> +
> +	err =3D intel_dsc_slice_dimensions_valid(pipe_config, vdsc_cfg);
> +
> +	if (err) {
> +		drm_dbg_kms(&dev_priv->drm, "Slice dimension requirements not
> met\n");
> +		return err;
> +	}
> +
>  	/*
>  	 * According to DSC 1.2 specs if colorspace is YCbCr then convert_rgb i=
s 0
>  	 * else 1
> --
> 2.25.1

