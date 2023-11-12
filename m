Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EEF7E8E65
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 05:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8180B10E11C;
	Sun, 12 Nov 2023 04:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B0E10E115;
 Sun, 12 Nov 2023 04:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699764882; x=1731300882;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lABOPNeFY1eJAX3HIAroOAeR5yHRs4+iPweM2HSUbvw=;
 b=Q+Td6bZ7SaC8QI2EluyHtyKYv8Bpii+Z5Xs9eE4GgmiJ7B8abhxRyrte
 z11GKuREeYH4ohZw4+cO2hgo+S5aIoDKO4Kltsvta6zy2XQZ546S8YHwu
 jbFh0Uxv91QlQQuhtcmH6l58N7Avt+eOKGjQT4s6bRcq6iv6rAa0ylMup
 0sabe0pHTZuUeMBdgEfrz0pT0haaxOjNH4nyKlZ8A76aj80QBXdWwSONk
 lhrGbQBckJhufM5Hl+tAXUYihG62/fCIu08eFCRKNZI/vzwk91pUJNcSm
 wWVipMXW5aStZ1uvkzpX1yWok/oiLeCM3upDVc/eOlKkMDt6O8ujcgydv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="393180012"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="393180012"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 20:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="767628742"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="767628742"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2023 20:54:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 20:54:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 20:54:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sat, 11 Nov 2023 20:54:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sat, 11 Nov 2023 20:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nd95KL99xQ0cMI6QRWlR0fV8/MNvIWco7uk0PDe7/zoQMCg6Faup46ovXyZGJ6D+B6ECk+PolK/E1DKjB4wPhWtNaWPuwikdGa3nXfbSOflIALKgGmSIBwJLi/iFnQMFJNoi9QEslTKEFiwrQL2275qlfa497uZvw0JDQtj+lVwbtyGokzcU0woAZfx3EdA9OeO0ZqVC5l5XZGumrGUtfJtr9jgYrC0oWDXAtqfGHZ3Qk3C6sWa1i0rWxF6YsPuNJJ/40A9kVHr1iLTUtJ6aB6NJEyMkvl0zS9FuQx5bb206uY5O3mM1JeyB5QU6dnFj+50HVYryEFPHgzyzPhZD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxPNovhAND7Js3dcsm247vheGkUyRClYlPWFu+qA5Ks=;
 b=AXQ5lCpmAhCNXvrdwWFfqzr/oAted0+AdoiiWuEyft805PNdD94wZjYu9sS4szQQQfs/ugqBJVJTzQa6cPReeWk9K+hmonOEUti7qhB12l2dLPPq8dU7RPMR5q+8D7tSTFJE6f4ylR9kJU1vBxfqZ7kNH/57CYPMSGBH42mVIqvYTfouMMiicskN6grtk+MaJ1mb8E9mX1+RQWjRelvePYqmKWz6G8AdezndZr3R34C8Fky/XwhjRrxUPgUAcD0reh4TRkyMw8zORfN+r2UkqMezn3ktFHa/fPRIK47V5PJKA5x/5XP/ZsAVNltr/Jb8j6h3x/4+Evq7rTdH4CoqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Sun, 12 Nov
 2023 04:54:37 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb%4]) with mapi id 15.20.6977.026; Sun, 12 Nov 2023
 04:54:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 09/11] drm/i915/dp_mst: Use precision of 1/16 for
 computing bpp
Thread-Topic: [PATCH 09/11] drm/i915/dp_mst: Use precision of 1/16 for
 computing bpp
Thread-Index: AQHaE78CtiECurxaME6TuxOxB40jWrB2H65g
Date: Sun, 12 Nov 2023 04:54:36 +0000
Message-ID: <SN7PR11MB67505B3BFD2422BCB134A239E3ACA@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
 <20231110101020.4067342-10-ankit.k.nautiyal@intel.com>
In-Reply-To: <20231110101020.4067342-10-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH8PR11MB7966:EE_
x-ms-office365-filtering-correlation-id: 3e632925-1323-433a-7802-08dbe33b787c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RIJ0+I10vDqQJEnDTFGa8+JjerFHQeLu/IJaloHkCSNTrDFXO6aExfP47v8boRdDK3txFyd+xx5DvkyqXgtbhb5x04pdzuMT4o65q8zBQnaRztsmH44FxjqrK3m49j8W5mlkLygalYYK6UCbdDWwjSPUoUQcQr/FdLWlu24RtS0TZHBI+ANR6yhwkKEalXD2/KbiaL4hjtE1utKirz+33Rv+ZWZ4KiBTakhc6VICxCC1UpLKq4BZtTJsH2Pya2Lh+b8gMmM+UDnmz9FuOP2GV/V7nFR0MC1pxxtYA2pYY/mDdaA0zGADD+hKhcHNokZDGgDG48cUWNyVtGfdzIzt4QGkxrCiYjwOJYLvUn3684cnqU+fSUmZXBViWLvEVtZmLYse3u7Ev25hOB/wxbMbYiUHsFY5L3G4is6zPNfxRAKfomLTFRBIrEHdqzvRT1slIJHtmlOXVQ1IVm17O8FeeHv9KBtY2Z366+zKvWPwbF4+qbL/oIVbL5OL54KlVzdDAAD9ngzlJVzlIHrRUrnaANLDnWlU06jcYoEIuZZawXxJyC3kSJdRI3hNGZ+j8TXNVAqnV0RQySUATGPbae6sBTZbxVTZnLakpjKXWw/S/Go=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(83380400001)(8676002)(71200400001)(38100700002)(52536014)(2906002)(4326008)(122000001)(55016003)(41300700001)(53546011)(82960400001)(5660300002)(8936002)(9686003)(7696005)(66946007)(66899024)(110136005)(26005)(478600001)(86362001)(66476007)(6506007)(316002)(76116006)(33656002)(66556008)(54906003)(64756008)(66446008)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JDanXeplLJtOT6KkogEgLK2gtCjlrkYqGYJRgkCCvKnvatvBd4KzOuYFATbU?=
 =?us-ascii?Q?2Tk2tgucqIyay5uIV8BvjhHCJyDJJbVKCxCtOpBLKPnaIm+6TmQJiLRAaOLA?=
 =?us-ascii?Q?NBO1gqPfmE9q6D5Xu6emejIAAa4apGCvGNG3BTm25rrt/CmsCVdgvjJ3CrrV?=
 =?us-ascii?Q?X9LuOCreqn3J4OCXUkcRIIB8KJCQF9uI4yXczY6jAeMccVg932wW1eu+1BWt?=
 =?us-ascii?Q?v6B2YLURY8yjsPXTpOnVte9w5Z81cOEXetiPGP9Ra05uWSxwSe8r9xQUdrC9?=
 =?us-ascii?Q?OnT65+TPOSxSuC6Mj3c98GCnWDIUTgp+Kz2W3eg6u4tj1CCAbYkqsK8XSvdM?=
 =?us-ascii?Q?o9OFxeErrTmF7CrFpErcXlOoiODYVUMp9hB7hzMjVBWQ1iUB+qv/kg3u8ZPW?=
 =?us-ascii?Q?mhyyEZBXKA5ZwGuRe56sFxCjGk8vTFSGvEzjxWFNu1Ad1+7XUWD//1z+r3IY?=
 =?us-ascii?Q?NlWtChWM6PBsk+YYXfQEgGfdXs+aKsfQxJQXq5fiW4DWFnUBw190sTBYUV+i?=
 =?us-ascii?Q?917eyCjQ1SJtNmLmgwGGygYnMe0So1EiO4H2ryBUT9xHcxlymeJZJzF6RIao?=
 =?us-ascii?Q?tO4QC7AUlqEIFQ/3/H+CHGMfFQTdssCAkC+b7dxsX7Q/BP7TGdtSasl63wfU?=
 =?us-ascii?Q?HuoCTOqWvQla0gvxfnpEbCDRlsiSeyfryRSPsizFenlhqLXE+vi26e8wA8nn?=
 =?us-ascii?Q?wBclnFy21fXxKxgmeTc3Vb9ADNogi9a30qf4Hhh2PCmGmL3I7Ex6tkVSRSGe?=
 =?us-ascii?Q?Fqj18+AQmwJUWKivUyxT6AM48zJve71O9bwoviqoRoaLo8rMuYSWkELadbS7?=
 =?us-ascii?Q?0/amLUPT1pZhEZDfvG5EP/qT3bYhZs298U+9olFdeKVK9S9GlXrHHZ3JR2OB?=
 =?us-ascii?Q?IVLyWYok2TsqYFeZ2jKBd986bY/D8b0iSpZBMPIiW8wyJhbBGDsL2lVoG9a/?=
 =?us-ascii?Q?YVBakwGssPHqLVzKVpvOhezVdAZfjPij5jnZSYIJBQuMS8lR2G74dgFyK5mc?=
 =?us-ascii?Q?LgvVMhGCDmGahX71icQta0esYEqiatGAv1Kne3XVqngO7RnVSf4sMKsHhI5V?=
 =?us-ascii?Q?ZbUYIgOKdDgsE9vaPIKOnZPK/jWVtM9Rmxo8yjFsDR+/O+MxyOLFFbEtSzJK?=
 =?us-ascii?Q?q4k71tdum1yhxT7RTHSlumeXOWaulhg0tXi0+GTU2Pd1S+rj/ZJR9Y8hOnl4?=
 =?us-ascii?Q?B2vlxcgEicXJEERcsZB89iDHB448nDZT9SvtTVlLLp9Qb81yfwmxTtPipbfu?=
 =?us-ascii?Q?eA7hOjJhe3yoTfzOSZ80NdRQEAJN5qkyuydBmIAyte5l3sYXj3YLpjrCBUYC?=
 =?us-ascii?Q?gwDUSUyUG17saMy8ih4h0pFHHr9c5+cMvBhqJdWOX4n9GFhhUw/80zC38iBe?=
 =?us-ascii?Q?exqM0tMC5ZPHtbYp1URlG9jkOKUuYtqmg+4arrWsDVh07Z5bskKkbsWkaM2s?=
 =?us-ascii?Q?1NLH9vgACkvtE0G4trImdz6msmjGtSrYiFYnCd2l1NU7lVS54cMCcTyisoGM?=
 =?us-ascii?Q?cPazJY4O1hIEyMaQqizSnfY4RGjy6y1vQAl4jdqMfXniyTGBySbXvEAX8W8s?=
 =?us-ascii?Q?nLrCyAreK4dyoSAZ/fgxcNcpQgEWAYDJbTEdp63k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e632925-1323-433a-7802-08dbe33b787c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2023 04:54:36.6554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yDrCSNeQkKsJWSCr9eYNhyjmlQz+jxBPfDt6GNZGC6Jkx56jtfoPM2yjR+0SZVlon6ehKQ0MlZwIlpqiZ4Mt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Friday, November 10, 2023 3:40 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kulkarni, Vandita
> <vandita.kulkarni@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> suijingfeng@loongson.cn
> Subject: [PATCH 09/11] drm/i915/dp_mst: Use precision of 1/16 for computi=
ng
> bpp
>=20
> Modify the functions to deal with bpps with 1/16 precision.
> This will make way for cases when DSC with fractional bpp is used.
> For bpp without DSC, there is no change, as we still use whole numbers.
>=20

LGTM.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 56 +++++++++++----------
>  1 file changed, 30 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 5c7e9d296483..e7806fe11b9d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -47,20 +47,21 @@
>  #include "intel_vdsc.h"
>  #include "skl_scaler.h"
>=20
> -static int intel_dp_mst_check_constraints(struct drm_i915_private *i915,=
 int
> bpp,
> +static int intel_dp_mst_check_constraints(struct drm_i915_private
> +*i915, int bpp_x16,
>  					  const struct drm_display_mode
> *adjusted_mode,
>  					  struct intel_crtc_state *crtc_state,
>  					  bool dsc)
>  {
>  	if (intel_dp_is_uhbr(crtc_state) && DISPLAY_VER(i915) <=3D 13 && dsc) {
> -		int output_bpp =3D bpp;
> +		int output_bpp_x16 =3D bpp_x16;
>  		/* DisplayPort 2 128b/132b, bits per lane is always 32 */
>  		int symbol_clock =3D crtc_state->port_clock / 32;
>=20
> -		if (output_bpp * adjusted_mode->crtc_clock >=3D
> +		if (DIV_ROUND_UP(output_bpp_x16 * adjusted_mode-
> >crtc_clock, 16) >=3D
>  		    symbol_clock * 72) {
>  			drm_dbg_kms(&i915->drm, "UHBR check
> failed(required bw %d available %d)\n",
> -				    output_bpp * adjusted_mode->crtc_clock,
> symbol_clock * 72);
> +				    DIV_ROUND_UP(output_bpp_x16 *
> adjusted_mode->crtc_clock, 16),
> +				    symbol_clock * 72);
>  			return -EINVAL;
>  		}
>  	}
> @@ -127,8 +128,8 @@ static void intel_dp_mst_compute_m_n(const struct
> intel_crtc_state *crtc_state,
>=20
>  static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder
> *encoder,
>  						struct intel_crtc_state
> *crtc_state,
> -						int max_bpp,
> -						int min_bpp,
> +						int max_bpp_x16,
> +						int min_bpp_x16,
>  						struct link_config_limits
> *limits,
>  						struct drm_connector_state
> *conn_state,
>  						int step,
> @@ -143,7 +144,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struc=
t
> intel_encoder *encoder,
>  	struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
>  	const struct drm_display_mode *adjusted_mode =3D
>  		&crtc_state->hw.adjusted_mode;
> -	int bpp, slots =3D -EINVAL;
> +	int bpp_x16, slots =3D -EINVAL;
>  	int ret =3D 0;
>=20
>  	mst_state =3D drm_atomic_get_mst_topology_state(state, &intel_dp-
> >mst_mgr); @@ -164,25 +165,25 @@ static int
> intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  						      crtc_state->port_clock,
>  						      crtc_state->lane_count);
>=20
> -	drm_dbg_kms(&i915->drm, "Looking for slots in range min bpp %d
> max bpp %d\n",
> -		    min_bpp, max_bpp);
> +	drm_dbg_kms(&i915->drm, "Looking for slots in range min bpp "
> BPP_X16_FMT " max bpp " BPP_X16_FMT "\n",
> +		    BPP_X16_ARGS(min_bpp_x16),
> BPP_X16_ARGS(max_bpp_x16));
>=20
> -	for (bpp =3D max_bpp; bpp >=3D min_bpp; bpp -=3D step) {
> +	for (bpp_x16 =3D max_bpp_x16; bpp_x16 >=3D min_bpp_x16; bpp_x16 -=3D
> step) {
>  		struct intel_link_m_n remote_m_n;
> -		int link_bpp;
> +		int link_bpp_x16;
>=20
> -		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
> +		drm_dbg_kms(&i915->drm, "Trying bpp " BPP_X16_FMT "\n",
> +BPP_X16_ARGS(bpp_x16));
>=20
> -		ret =3D intel_dp_mst_check_constraints(i915, bpp,
> adjusted_mode, crtc_state, dsc);
> +		ret =3D intel_dp_mst_check_constraints(i915, bpp_x16,
> adjusted_mode,
> +crtc_state, dsc);
>  		if (ret)
>  			continue;
>=20
> -		link_bpp =3D dsc ? bpp :
> -			intel_dp_output_bpp(crtc_state->output_format,
> bpp);
> +		link_bpp_x16 =3D dsc ? bpp_x16 :
> +			intel_dp_output_bpp(crtc_state->output_format,
> to_bpp_int(bpp_x16));
>=20
> -		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc,
> to_bpp_x16(link_bpp),
> +		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc,
> +link_bpp_x16,
>  					 &crtc_state->dp_m_n);
> -		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc,
> to_bpp_x16(link_bpp),
> +		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc,
> +link_bpp_x16,
>  					 &remote_m_n);
>=20
>  		/*
> @@ -225,10 +226,11 @@ static int
> intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  			    slots);
>  	} else {
>  		if (!dsc)
> -			crtc_state->pipe_bpp =3D bpp;
> +			crtc_state->pipe_bpp =3D to_bpp_int(bpp_x16);
>  		else
> -			crtc_state->dsc.compressed_bpp_x16 =3D
> to_bpp_x16(bpp);
> -		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc
> %d\n", slots, bpp, dsc);
> +			crtc_state->dsc.compressed_bpp_x16 =3D bpp_x16;
> +		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp "
> BPP_X16_FMT " dsc %d\n",
> +			    slots, BPP_X16_ARGS(bpp_x16), dsc);
>  	}
>=20
>  	return slots;
> @@ -246,10 +248,10 @@ static int intel_dp_mst_compute_link_config(struct
> intel_encoder *encoder,
>  	 * YUV420 is only half of the pipe bpp value.
>  	 */
>  	slots =3D intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
> -						     to_bpp_int(limits-
> >link.max_bpp_x16),
> -						     to_bpp_int(limits-
> >link.min_bpp_x16),
> +						     limits->link.max_bpp_x16,
> +						     limits->link.min_bpp_x16,
>  						     limits,
> -						     conn_state, 2 * 3, false);
> +						     conn_state, 2 * 3 * 16,
> false);
>=20
>  	if (slots < 0)
>  		return slots;
> @@ -325,9 +327,11 @@ static int
> intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>  	min_compressed_bpp =3D intel_dp_dsc_nearest_valid_bpp(i915,
> min_compressed_bpp,
>  							    crtc_state-
> >pipe_bpp);
>=20
> -	slots =3D intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
> max_compressed_bpp,
> -						     min_compressed_bpp,
> limits,
> -						     conn_state, 1, true);
> +	slots =3D intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
> +
> to_bpp_x16(max_compressed_bpp),
> +
> to_bpp_x16(min_compressed_bpp),
> +						     limits,
> +						     conn_state, 16, true);
>=20
>  	if (slots < 0)
>  		return slots;
> --
> 2.40.1

