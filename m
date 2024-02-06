Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317184BEB6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3C112E04;
	Tue,  6 Feb 2024 20:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NI1Z6sMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA98112E01;
 Tue,  6 Feb 2024 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707251571; x=1738787571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aK+nMF+ufAnDI1d2Sz03dSfgNtaD51m3HsLryFhvZwY=;
 b=NI1Z6sMPMRx8sk4SDxqcZ/7UQjPM8KWnnZD0RsQS0INvbll/2L5rJcDb
 l7MUdozDXMsycApO5pxqsthIpg+pAGE8p2wJHa7j5sV2NIlhGsS71oSCD
 DsLZbMZaW3kgaEIFjHJNoIoSBeT47QfS9lw+/iT448GDn/5NICVcT+cz0
 MLT0gblYs7F4+fqLPLPmxF1vG84qtmxBwTSD29xt6k51qB0qGw/ExfFW3
 C99d/Fd7CPGHUZ9LU9bEXKL7mFj5OEpHJD8zkXmPWPQTSLoQgFTnTHWwi
 IJ2Ua469dGTJ9ypRfsR4hb/eCNM3aU3czc7tA8TqTiXw5vdksZZu3d3zO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23320551"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="23320551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:32:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824285006"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="824285006"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:32:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:32:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:32:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:32:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3bsFHjKjyDG/oNZ4mkxput5GaftQeaSGZwHFMRROR20iJN0YKCNVPOJ7VDv8kiSZn6SFx1rZo99tlaDHNOdf6h9vpS5NA2D2RIfptnL2UN+iMAwn2+BDhog001TL8IgXKh+FMK0TZaIeyKJU447zcNST+OmHDPZzogjox65tnnRzjbXcTY8v5trldUZrYhm0oGSlTVCOwD82tttiAgy+6qO6KQpmLrtxRZNuKg/J7HJlexruigG6qyYr6hhzAgvbtBV5tqwWMix9XuBrR7UvNI0PVtNxzQH5ttQvlg4dtOxanov57fCd83pbSiD5IpQ/bBZRD/5MWVOnv7J7jX4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xtd4/Onckm+Z/IkE+2mqkVU2ZOY2dpd/fVBlgv45xtU=;
 b=L1/A5POM/pfpZ7hyPJv0CuS4qWVQh4xSqqLOsMR+Cssll6ZmtKQXsOAiGfepTO9OOUaL0uN7npyCW1LHtzAQpx/Z0KT8yrgIX/g1t4E5kffenOs47YBeyIT2iOsa+IBMNU1Yxuakbu0AFLFsdkJtb5ZQOPW7nDSuewqO6BSA31XMIuwECZLYmT6ubOZm/PuBsfD8Ntocpo5pmeW6p4nLNQgmcYblb6kdxM1GrFuACqgViX5X80xfw5fZTzM7ZFtHg1tuuL0Ky3MvOqTZ5SBheD9g/oD00UVpgwxBGhWrKoZRLkL/2Rs8iusmEJKRSDSiuwg+ztXOl/DKqv+gVi7ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 20:32:46 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:32:46 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 05/19] drm/i915/dp: Factor out
 intel_dp_config_required_rate()
Thread-Topic: [PATCH 05/19] drm/i915/dp: Factor out
 intel_dp_config_required_rate()
Thread-Index: AQHaTecGjaxpbE8S6k6DHpY+MPRgG7D922Zg
Date: Tue, 6 Feb 2024 20:32:46 +0000
Message-ID: <DM4PR11MB636009F5624930880BE9B197F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-6-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-6-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SN7PR11MB7667:EE_
x-ms-office365-filtering-correlation-id: f87fb510-c9c1-424a-face-08dc2752c78c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ocjh3p8vjI1pt2D+qwTvq6Xc3IEZa/vlXX19cP+H52OyzbbtkETWOmWxuoVgrIDYeefnMrAs32o+uRN61LmQlW7xDtJGwKAellxbl5K7omjbFmna2jZswi2j9znx+vA1/WRSUVVijGeDctuFD3QTDEZ3y4ZDzsoJXM9qgeIfEmnE5NLmlMEpoJW4hYzlVz/6Jiv9UOc54bD2g37xaU6JSJwzA7QVNZnettHg0qzNBVaQb3rAyueK00AwVyjhrkonieb+zb3huTIwLtOsdLMLjU6mL8baenwox1od9+4QmdPLJvclMGTZ/logr260ejIux1d7jODyR70Wfl6UArBzJLUGqm0A/n7dRZkM4gv9en/4AA88A/EKMNyA6gDbU8pxoAWEKSp5js2+ylACaaM19lrB0NZIMfXFQXNyFSCKhSPOmozmqP9Q9Wropg7xTKVZNY2tripUTcwulLT0hdVU2xIPJDvwmjrwII/3Q4f8rx9eQV/+QIHCkGOqLErTjBfhO0irURpgFY1U7iLl58+zEgrN+th9VwpzDvjyd2TqJTcBwlEtNk39ESVWdZ/EBR+tOmd3GMSnSumFx8hFHUk3SBmeAGmTDm8XftRWfOm9+s5HMEvLXR0s2ysxpaSTOXY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(26005)(86362001)(64756008)(5660300002)(2906002)(478600001)(110136005)(66476007)(38070700009)(76116006)(66446008)(66946007)(66556008)(450100002)(52536014)(8676002)(8936002)(316002)(4326008)(9686003)(7696005)(33656002)(53546011)(6506007)(55016003)(122000001)(71200400001)(38100700002)(83380400001)(82960400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BE75JGk6yk7XIuQhxV+3Tv+Ys0csKzQQBq7dNTNkaiVDmBfNzKz77/X8JQjV?=
 =?us-ascii?Q?0B7vIBrpZ8kHwjLwuGJ3/O384BJelQHOQZXlOC6g3J8eL4NO+RK3U4Eo5Mdg?=
 =?us-ascii?Q?0G3l2hZi2szeXb/AtiwdsH4HLAZJ9bGkMSR027fhG65U0/nu4U4qaESYWINh?=
 =?us-ascii?Q?ok7I/zI6y/Py0GmriFbkS5eyEyIRY3L0/W4IldHA96PeewZQYCzOYK1dvI/N?=
 =?us-ascii?Q?Ets6OsWA2R90aW+RjT+WBqn1FZChicKQX9ix9IC4O9wIvNnAhAYMTupZqzVu?=
 =?us-ascii?Q?y83wjRxKeeK6iv9JQ8fyTvV28hUtDuFnz0wt+cBFYnnuDO9+sQTwsu4FkiWR?=
 =?us-ascii?Q?SrZO/om2SultcKWodbwRMfe19aYF1Evjy52T/FBkR5+FCfue8Rq1T3z3tlQP?=
 =?us-ascii?Q?7af1wtQZ3lmKRl3KGV7lEBDbONbDMRN0PzotZTHe9yfbwiAKrXY8L6nDqGxs?=
 =?us-ascii?Q?+EyQeNJ5RvK1L8iCN8+RqByJGBcyT2r3tRtV6e+BARd1F/E2aPqFoFTv0kco?=
 =?us-ascii?Q?/94+EEcJaTU6atfAjO452oDwxKkadV0f8IsivvMopR5etUDbaus0PTZ4vwGG?=
 =?us-ascii?Q?VRUpade3mjOj7xPgufbSvxS5IX92qUNRWNq90wC3OSaW8M8g8ln3gKfQQQiG?=
 =?us-ascii?Q?3WcL9is/qABKNjDH53GOk30cH3q4U09DHWQWa9B1XhDTOhbth/tWMYPJsvrO?=
 =?us-ascii?Q?M2GuIdwOc99eBcS0gZLoHlv2B3dpmT4harNO0bFFo/aecoAOkbCpaiYK7p2a?=
 =?us-ascii?Q?fp8cgq43LG/Up+Ar8Ymu3iDRi3yvUv6C7LpoOwji3HLk9kpEEVywGtg24Ywy?=
 =?us-ascii?Q?nCEYH4NRGcW5n4E0RLLJ2odESEITuRi6q90tHtWQnnp69E/J3snO806DpUn3?=
 =?us-ascii?Q?YR6TZlpjfApAqEr5n6XYc7M1xIzm0+BtDNtE2Il0AqvwqNR7LDnB87sHwPg0?=
 =?us-ascii?Q?B9Y/UComcVjH99sqh/GRCZCOvdNxQ87L4wJN+qI33haHCu85GpCiGQ6a5fIa?=
 =?us-ascii?Q?Sx3icelYbaZUzd77hUOKW/phcPUNO7vFHbUhDehhlLJarucAvjUuimOOBhxx?=
 =?us-ascii?Q?OTTctRr7kdtq2RpVU7In7JsV5IkLCE47qqGqT0qCkFcVN0WiauLO3f8gm417?=
 =?us-ascii?Q?1jhYRR4yBEvLAR0DYvsiANsQ/RSMSeG3sNWvq4kY7f5yiOpxng9GZ9tsq9iO?=
 =?us-ascii?Q?zCzaoxPD2XL8mzrImoM/4ICjg3z/BnBVFbLwom3EX1RLEgU173pkOx/uZWS0?=
 =?us-ascii?Q?afHorYlcyErTJQD92XPXOBa9f2hX7zlinI13pQ7zmzUkgX/wgxMBoHR/GvVD?=
 =?us-ascii?Q?A7Yv61bimTQaOCj3pZq3izn9ITv94XtioeQsfviVL+yYweddgjR5vf40r24O?=
 =?us-ascii?Q?lMvj4qpo6RRdZk8qwPGRLlXnsvfm7JTPOvum7QYvUuxeCrHDdqfITkJ38M9l?=
 =?us-ascii?Q?Gh/beJkNODTOrLb0CrzDsJItdu+PiV75EE8a7JK+igT29VLwLXoZz1ufr3oJ?=
 =?us-ascii?Q?vVjCMlRJifMXk8zQ3/qrggOl0HpZ+OQGQCT0Q0eDKBdDJvTODISMVgDpCG3c?=
 =?us-ascii?Q?ATU4sSq7bDhNFNg1CK6m5ca0fmWEtP//8vE6WhCS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87fb510-c9c1-424a-face-08dc2752c78c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:32:46.8279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4nTEezQPv8/vKAepy0I/yAyy5+LGwrpqDoF6kwVm2DYQu+VG31TeFtdIVhMW39B3c2zEeqYxD1px2nR71YrEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Tuesday, January 23, 2024 3:59 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH 05/19] drm/i915/dp: Factor out intel_dp_config_required_r=
ate()
>=20
> Factor out intel_dp_config_required_rate() used by a follow-up patch enab=
ling the
> DP tunnel BW allocation mode.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 43 +++++++++++--------------
> drivers/gpu/drm/i915/display/intel_dp.h |  1 +
>  2 files changed, 20 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index c7b06a9b197cc..0a5c60428ffb7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2338,6 +2338,17 @@ intel_dp_compute_config_limits(struct intel_dp
> *intel_dp,
>  						       limits);
>  }
>=20
> +int intel_dp_config_required_rate(const struct intel_crtc_state
> +*crtc_state) {
> +	const struct drm_display_mode *adjusted_mode =3D
> +		&crtc_state->hw.adjusted_mode;
> +	int bpp =3D crtc_state->dsc.compression_enable ?
> +		to_bpp_int_roundup(crtc_state->dsc.compressed_bpp_x16) :
> +		crtc_state->pipe_bpp;
> +
> +	return intel_dp_link_required(adjusted_mode->crtc_clock, bpp); }
> +
>  static int
>  intel_dp_compute_link_config(struct intel_encoder *encoder,
>  			     struct intel_crtc_state *pipe_config, @@ -2405,31
> +2416,15 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>  			return ret;
>  	}
>=20
> -	if (pipe_config->dsc.compression_enable) {
> -		drm_dbg_kms(&i915->drm,
> -			    "DP lane count %d clock %d Input bpp %d Compressed
> bpp " BPP_X16_FMT "\n",
> -			    pipe_config->lane_count, pipe_config->port_clock,
> -			    pipe_config->pipe_bpp,
> -			    BPP_X16_ARGS(pipe_config-
> >dsc.compressed_bpp_x16));
> +	drm_dbg_kms(&i915->drm,
> +		    "DP lane count %d clock %d bpp input %d compressed "
> BPP_X16_FMT " link rate required %d available %d\n",
> +		    pipe_config->lane_count, pipe_config->port_clock,
> +		    pipe_config->pipe_bpp,
> +		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
> +		    intel_dp_config_required_rate(pipe_config),
> +		    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
> +					      pipe_config->lane_count));
>=20
> -		drm_dbg_kms(&i915->drm,
> -			    "DP link rate required %i available %i\n",
> -			    intel_dp_link_required(adjusted_mode->crtc_clock,
> -
> to_bpp_int_roundup(pipe_config->dsc.compressed_bpp_x16)),
> -			    drm_dp_max_dprx_data_rate(pipe_config-
> >port_clock,
> -						      pipe_config->lane_count));
> -	} else {
> -		drm_dbg_kms(&i915->drm, "DP lane count %d clock %d bpp
> %d\n",
> -			    pipe_config->lane_count, pipe_config->port_clock,
> -			    pipe_config->pipe_bpp);
> -
> -		drm_dbg_kms(&i915->drm,
> -			    "DP link rate required %i available %i\n",
> -			    intel_dp_link_required(adjusted_mode->crtc_clock,
> -						   pipe_config->pipe_bpp),
> -			    drm_dp_max_dprx_data_rate(pipe_config-
> >port_clock,
> -						      pipe_config->lane_count));
> -	}
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 46f79747f807d..37274e3c2902f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -102,6 +102,7 @@ void intel_dp_mst_suspend(struct drm_i915_private
> *dev_priv);  void intel_dp_mst_resume(struct drm_i915_private *dev_priv);=
  int
> intel_dp_max_link_rate(struct intel_dp *intel_dp);  int
> intel_dp_max_lane_count(struct intel_dp *intel_dp);
> +int intel_dp_config_required_rate(const struct intel_crtc_state
> +*crtc_state);
>  int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
>=20
>  void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
> --
> 2.39.2

