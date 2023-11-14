Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B233D7EACB9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 10:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D231F10E445;
	Tue, 14 Nov 2023 09:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064E010E1E2;
 Tue, 14 Nov 2023 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699953203; x=1731489203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/23fttmBZF45ONWRhBxLVRdm3Xxcx2VH55rX6EWijX0=;
 b=fVM46d9lTbqk/NTIctxpcJ0t2jiq+JVF0LxDQ2JPlXpKlis0gk+Zvp26
 0SdVozkQ/erAXDOmMVuKd+wVyvpN57YoZgVthmBGFKH10PxWCGOQYXTKb
 yGrwTXc2++LYSaeICDiSNHdDou742M/vw5lFxxOX1StxlCmXCAo3QPHTO
 OR3xDeRiiNoYiJLfY31sU0RKHbXw64hCBI21/kkLUeZfGQ33C5QomuZsC
 O2bnNYhakFFRwZ54C+tIlbdiYam07CbpnwR4pr4OrP2iocnb5fmGNMLbC
 Mip2efb+oCacFZgtORqqUZkmuYuhFTdJ5Vs4b89mEi/efYNGSh5zCoC3N Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394532227"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="394532227"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 01:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="881991065"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="881991065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 01:13:18 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:13:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:13:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 01:13:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 01:13:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQWxWDF+TTNXPgMd6TO2wM1ey+/jvfTkOHWEIvash6lGvsXmXZDkDkOPexD+9wiqUC48CWbQqZ+bSh3fotJSSlfXyW+FgbtANiA2yZbd5JQ4eL0Q3HrmjPK8RivRguo1N1O0wbfsv31D/qVj0+HWU7K3Dm/Blw+DuEcfMOb7rA9RiEno0ngwstIGw29t2AcIs8tqv1G0RfB6eAvyi6SKRLL9S2Haer+YtAxE66EDFpdP9kgCAX+JIxm/UhNoeJ6gCXfXZHYiHrFhpzWkOaE6csy35/2vkmpqyaAse1by1pRaM6h2WRbc8+89fQwib/XY9tZqXhUe2/vkhw8wn0tRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6an+bOyqZs5NRrMtIgvsdCybmlHtHkzy5KT5scoMsE=;
 b=LNNdaxPEOIseAgQS22Ck1t2frxK+gnPFgfosw9WO8ewAufIjj2hoJVKBls5x2gIp3clekoVb1kFrYgRTE4owpCdh6LJpt7kkVnC4B/eNhYa0TKIEYip2VXOYfU18FYacZp39y/MBlu12djEl4IdKzDB7n5XC6Cp1ynU3ngDRZdZmBhVeRxarWSppQtlZd67e/JmcAlO/Yr61u0noIZICQAZIfn++izbGYCSxzCJ5X9UfZq82jdlQX6x8u+oPxnAXSzMfQaldSBA4Ibrb48QULs2I8dooaCesGodY+ea9wNs60Y8ZsH9IOwQwKXmwj+HZSna0/cTlT6w3UCJcnDQqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 09:13:10 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 09:13:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 02/11] drm/i915/display: Store compressed bpp in U6.4
 format
Thread-Topic: [PATCH 02/11] drm/i915/display: Store compressed bpp in U6.4
 format
Thread-Index: AQHaE774bziPMQCiL06tbDn4rLAxxrB5jeVA
Date: Tue, 14 Nov 2023 09:13:10 +0000
Message-ID: <SN7PR11MB67507F0B4459AF91D27BB7FAE3B2A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
 <20231110101020.4067342-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20231110101020.4067342-3-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ2PR11MB8565:EE_
x-ms-office365-filtering-correlation-id: 835be258-ef03-44e6-0000-08dbe4f1ec1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G8kinv1RxaEG9kYk4EIl80fGIfadRbESyCIinbkU6pqLJZc1GgrTaWoOn3lsmT1ytkf96Ocqu/Vv+yd/vuhFZM01K7zjrohRFAwoupnp/pcMzuaz/sbqS6h/Tlc2r3Uc1FwIWg/94ic23rt/vbs65Ukpb9YgEz+Ryi8c/xNbUsw56U55SeryK2rbgAj9eCPzqIp8/zhnWNVh6DqEkVvHzEftOcSfwtQKDgOegjsH47gXCubtoDYYS+mn7azWq8V1K4aIwRRF15AHFURvjYXsJlDS4/z5nv8FiuAqqrDiengW1H02HlBaQiTN+bDbQAzQMI55nPLj3AKRVcpkH9Xul+MAXWoWVRXwpx8geop7Lrzh0irMG91/mKiRMH/5eSAi9Xpp4ZKBm4FbdKo9kyW6i3eb/ITPGQNOlGzIrllnKnLMgN/xYN2V5Nb7QzYtBD1Szu8xE/RTbLsMsqEN/FK35mIfS0pQwrLf3AgB6k+z8UGpy+T+PNz2B8gqG1E9LQ90U4HS9oTVc4WV7X9Vko53ykgRmdXnpSb7NVErrppg0ghj7Wuijoez+VYq4YS46RTILRDEB1yu2hHzbt/3QI09k+3kyTNwLuRZbEfOKVcaYmMFsfu+7kED3O3wAiRXwnYmwJdkJhUm6N9jCCGHmG/eyM/michaqPCKptghpPJGMvM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(64100799003)(1800799009)(55016003)(66899024)(122000001)(64756008)(66476007)(66556008)(76116006)(110136005)(316002)(66446008)(66946007)(54906003)(38100700002)(38070700009)(82960400001)(33656002)(86362001)(9686003)(83380400001)(53546011)(71200400001)(26005)(6506007)(30864003)(478600001)(2906002)(7696005)(5660300002)(41300700001)(4326008)(52536014)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gb9BUxo++MDGH008nyvPJGP/fHo0q46gsAljgPOBalgF8kofAtM5jhOfs+5p?=
 =?us-ascii?Q?fbevYDsp0mgYlrQJtOkAG1vjYHSP7swi+MEB5xmEFIOmwLK8v1RW6mvFuJdG?=
 =?us-ascii?Q?j3PMUqcwRx7dtUj3dtToZ/9AxbWiq7122dwBNEJN3F1PmwUk6ngQLteoDWux?=
 =?us-ascii?Q?eko2MqsgIBDiHWGHaVElaY+TLbEB9vv56nD8m96inpEniOW9e6oBmebVhyb3?=
 =?us-ascii?Q?lJX8r+omS0QkXh2A0LMyHTKym8TJTHd1nKQpFkdhw8Tf5+gkYxyy5ANiRJDZ?=
 =?us-ascii?Q?WkcJWNXueCPwg5uQF1We4V97F0h46dLL4AABKgrXnxAvu9AQPHiVAjAfNZ5E?=
 =?us-ascii?Q?+ui4xAt8rX2lJxiiye5ygW/j0pCxtnsmtGSesMzf8pn073GIOYAoaItEPt85?=
 =?us-ascii?Q?sujFY21/ZuaqaGeL/iTMZc8RTQVjQTsNss+mpy7f50gcCVKLqWALikETzMyP?=
 =?us-ascii?Q?/0NUiFWvxzw43ZeBXn0fX6eoGh+jHFNe1Sl0QqyQnT1PYLeH3Fw4zYuK0rMl?=
 =?us-ascii?Q?LRmRkZJT67gDO+dstut85dPtvXSheayvxP0XrCI8qCFMoWqGt6u+UWw1TjSl?=
 =?us-ascii?Q?AYEmqPzaj4IBmuwMusciUMfaHYUMoFk83J38H0OJAZEw+jCoZmZH+qN2CsMF?=
 =?us-ascii?Q?hDp+9SR2txCuDHgPTGLQ2+CB311g1zcl+iQn3/KOFJ0q8SuLYfHBu+gKyPAb?=
 =?us-ascii?Q?CwDNY34SRY7xK8VzmT4RSF4eO1Tkx630eEL7+mO4nqyEoR7H25VMKrnY/B4g?=
 =?us-ascii?Q?OKCQKBU2z7f0G/DZKh/Q+WaSloX9LbiCE7elnQvB2batj8ojBxg8EF8e+O7C?=
 =?us-ascii?Q?T2Xsj6XP30qKt0wfNlu9qEaL/8eJi8B/tbHCGTUzEqX7ZM7bW1GW5KmUAk3b?=
 =?us-ascii?Q?x+3paC1RNsrYENQdNRZTUNQ602127UODJzWo6UwsTyM6vUHSxWhK4MAmJTpj?=
 =?us-ascii?Q?abjWhiIJAKSpSb3SY47BgWh+aFxZxTYPVHtrJ0/slJ3zo9p54IsztdxdiFQ6?=
 =?us-ascii?Q?Xbg7l2y+2nqxDOZgTPnA3X/OyCoKOeDS27x/4mHy4z0rRlbIAfzOrwx11GO5?=
 =?us-ascii?Q?jtDxLcz8pjlwwcRs9Ot006o52Cu1M6m57khZvol9z4bPAOphnKg6hiDWvZOi?=
 =?us-ascii?Q?deyW83b0axjdhem5GW2Xc/2tvsRA9Wx6hs/Fy6ZTTs4Unvo/FFTyAI6OZlAH?=
 =?us-ascii?Q?aMQ9A8NMySVWOLwF25nvq5ZrorC4qYeFvuFnhINgoNYJMXDUTus+lylNbwP6?=
 =?us-ascii?Q?qlAO/zihnj2ekt0980jSp53SW/sbf3UkoVzH5C7T0zRGuvkZqq3W3hlXt2kv?=
 =?us-ascii?Q?sTZR0zJHYz1ux/lqq6tm7ggsSNb+KyIw4yIb0yYivmovls5NslB2J2gX90dG?=
 =?us-ascii?Q?mi58brSRgyHry5G4/yoE8TTFM8R3LCMTMScDGu8Zz/j8OEq71NJDMSR5QET6?=
 =?us-ascii?Q?LkoZ6Ti08vBfmw/O8n4Wcdcvum75sK+qXjyrYunISBW8Yxdn5uRGkvmPJo4G?=
 =?us-ascii?Q?x7pKvRAtqdVrkeNdXSemazRNLryiRVR9FWwm9fgtI3MMdq9KyR/k/Io8uAWj?=
 =?us-ascii?Q?i0Bp2irvoSvGbUmj1Ydc+rkFroINqkcwWds7Xqo8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835be258-ef03-44e6-0000-08dbe4f1ec1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 09:13:10.2218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vxbm1I88TUuSbP9JsPczwzrCXyHD8t1DKR8QixTJqa1kaVp8PMyEQblXsYhz3H3yg6lv5Aj1ojXzjGlJ9ZsamQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
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
> Subject: [PATCH 02/11] drm/i915/display: Store compressed bpp in U6.4
> format
>=20
> DSC parameter bits_per_pixel is stored in U6.4 format.
> The 4 bits represent the fractional part of the bpp.
> Currently we use compressed_bpp member of dsc structure to store only the
> integral part of the bits_per_pixel.
> To store the full bits_per_pixel along with the fractional part,
> compressed_bpp is changed to store bpp in U6.4 formats. Intergral part is
> retrieved by simply right shifting the member compressed_bpp by 4.
>=20
> v2:
> -Use to_bpp_int, to_bpp_frac_dec, to_bpp_x16 helpers while dealing  with
> compressed bpp. (Suraj) -Fix comment styling. (Suraj)
>=20
> v3:
> -Add separate file for 6.4 fixed point helper(Jani, Nikula) -Add comment =
for
> magic values(Suraj)
>=20
> v4:
> -Fix checkpatch warnings caused by renaming(Suraj)
>=20
> v5:
> -Rebase.
> -Use existing helpers for conversion of bpp_int to bpp_x16  and vice vers=
a.
>=20

LGTM.
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c        | 10 +++----
>  drivers/gpu/drm/i915/display/intel_audio.c    |  2 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  4 +--
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 ++--
>  drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
>  .../drm/i915/display/intel_display_types.h    |  3 ++-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 27 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
>  drivers/gpu/drm/i915/display/intel_link_bw.c  |  2 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |  4 +--
>  10 files changed, 33 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c
> b/drivers/gpu/drm/i915/display/icl_dsi.c
> index c4585e445198..481fcb650850 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -330,7 +330,7 @@ static int afe_clk(struct intel_encoder *encoder,
>  	int bpp;
>=20
>  	if (crtc_state->dsc.compression_enable)
> -		bpp =3D crtc_state->dsc.compressed_bpp;
> +		bpp =3D to_bpp_int(crtc_state->dsc.compressed_bpp_x16);
>  	else
>  		bpp =3D mipi_dsi_pixel_format_to_bpp(intel_dsi-
> >pixel_format);
>=20
> @@ -860,7 +860,7 @@ gen11_dsi_set_transcoder_timings(struct
> intel_encoder *encoder,
>  	 * compressed and non-compressed bpp.
>  	 */
>  	if (crtc_state->dsc.compression_enable) {
> -		mul =3D crtc_state->dsc.compressed_bpp;
> +		mul =3D to_bpp_int(crtc_state->dsc.compressed_bpp_x16);
>  		div =3D mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>  	}
>=20
> @@ -884,7 +884,7 @@ gen11_dsi_set_transcoder_timings(struct
> intel_encoder *encoder,
>  		int bpp, line_time_us, byte_clk_period_ns;
>=20
>  		if (crtc_state->dsc.compression_enable)
> -			bpp =3D crtc_state->dsc.compressed_bpp;
> +			bpp =3D to_bpp_int(crtc_state-
> >dsc.compressed_bpp_x16);
>  		else
>  			bpp =3D mipi_dsi_pixel_format_to_bpp(intel_dsi-
> >pixel_format);
>=20
> @@ -1451,8 +1451,8 @@ static void gen11_dsi_get_timings(struct
> intel_encoder *encoder,
>  	struct drm_display_mode *adjusted_mode =3D
>  					&pipe_config->hw.adjusted_mode;
>=20
> -	if (pipe_config->dsc.compressed_bpp) {
> -		int div =3D pipe_config->dsc.compressed_bpp;
> +	if (pipe_config->dsc.compressed_bpp_x16) {
> +		int div =3D to_bpp_int(pipe_config->dsc.compressed_bpp_x16);
>  		int mul =3D mipi_dsi_pixel_format_to_bpp(intel_dsi-
> >pixel_format);
>=20
>  		adjusted_mode->crtc_htotal =3D
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c
> b/drivers/gpu/drm/i915/display/intel_audio.c
> index 19605264a35c..aa93ccd6c2aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -528,7 +528,7 @@ static unsigned int calc_hblank_early_prog(struct
> intel_encoder *encoder,
>  	h_active =3D crtc_state->hw.adjusted_mode.crtc_hdisplay;
>  	h_total =3D crtc_state->hw.adjusted_mode.crtc_htotal;
>  	pixel_clk =3D crtc_state->hw.adjusted_mode.crtc_clock;
> -	vdsc_bpp =3D crtc_state->dsc.compressed_bpp;
> +	vdsc_bpp =3D to_bpp_int(crtc_state->dsc.compressed_bpp_x16);
>  	cdclk =3D i915->display.cdclk.hw.cdclk;
>  	/* fec=3D 0.972261, using rounding multiplier of 1000000 */
>  	fec_coeff =3D 972261;
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c
> b/drivers/gpu/drm/i915/display/intel_bios.c
> index 719fb550342b..2fd72b2fd109 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -3414,8 +3414,8 @@ static void fill_dsc(struct intel_crtc_state *crtc_=
state,
>=20
>  	crtc_state->pipe_bpp =3D bpc * 3;
>=20
> -	crtc_state->dsc.compressed_bpp =3D min(crtc_state->pipe_bpp,
> -					     VBT_DSC_MAX_BPP(dsc-
> >max_bpp));
> +	crtc_state->dsc.compressed_bpp_x16 =3D to_bpp_x16(min(crtc_state-
> >pipe_bpp,
> +
> VBT_DSC_MAX_BPP(dsc->max_bpp)));
>=20
>  	/*
>  	 * FIXME: This is ugly, and slice count should take DSC engine diff --g=
it
> a/drivers/gpu/drm/i915/display/intel_cdclk.c
> b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index c4839c67cb0f..b93d1ad7936d 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2598,8 +2598,9 @@ static int intel_vdsc_min_cdclk(const struct
> intel_crtc_state *crtc_state)
>  		 * =3D> CDCLK >=3D compressed_bpp * Pixel clock  / 2 * Bigjoiner
> Interface bits
>  		 */
>  		int bigjoiner_interface_bits =3D DISPLAY_VER(i915) > 13 ? 36 :
> 24;
> -		int min_cdclk_bj =3D (crtc_state->dsc.compressed_bpp *
> pixel_clock) /
> -				   (2 * bigjoiner_interface_bits);
> +		int min_cdclk_bj =3D
> +			(to_bpp_int_roundup(crtc_state-
> >dsc.compressed_bpp_x16) *
> +			 pixel_clock) / (2 * bigjoiner_interface_bits);
>=20
>  		min_cdclk =3D max(min_cdclk, min_cdclk_bj);
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 3effafcbb411..b4a8e3087e50 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5434,7 +5434,7 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>=20
>  	PIPE_CONF_CHECK_I(dsc.compression_enable);
>  	PIPE_CONF_CHECK_I(dsc.dsc_split);
> -	PIPE_CONF_CHECK_I(dsc.compressed_bpp);
> +	PIPE_CONF_CHECK_I(dsc.compressed_bpp_x16);
>=20
>  	PIPE_CONF_CHECK_BOOL(splitter.enable);
>  	PIPE_CONF_CHECK_I(splitter.link_count);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 926bf9c1a3ed..19e7e6e2e7a6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1362,7 +1362,8 @@ struct intel_crtc_state {
>  	struct {
>  		bool compression_enable;
>  		bool dsc_split;
> -		u16 compressed_bpp;
> +		/* Compressed Bpp in U6.4 format (first 4 bits for fractional
> part) */
> +		u16 compressed_bpp_x16;
>  		u8 slice_count;
>  		struct drm_dsc_config config;
>  	} dsc;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 37d7c9c2d695..4ad3718c3c7d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1885,7 +1885,8 @@ icl_dsc_compute_link_config(struct intel_dp
> *intel_dp,
>  					      valid_dsc_bpp[i],
>  					      timeslots);
>  		if (ret =3D=3D 0) {
> -			pipe_config->dsc.compressed_bpp =3D
> valid_dsc_bpp[i];
> +			pipe_config->dsc.compressed_bpp_x16 =3D
> +				to_bpp_x16(valid_dsc_bpp[i]);
>  			return 0;
>  		}
>  	}
> @@ -1923,7 +1924,8 @@ xelpd_dsc_compute_link_config(struct intel_dp
> *intel_dp,
>  					      compressed_bpp,
>  					      timeslots);
>  		if (ret =3D=3D 0) {
> -			pipe_config->dsc.compressed_bpp =3D
> compressed_bpp;
> +			pipe_config->dsc.compressed_bpp_x16 =3D
> +				to_bpp_x16(compressed_bpp);
>  			return 0;
>  		}
>  	}
> @@ -2120,7 +2122,8 @@ static int intel_edp_dsc_compute_pipe_bpp(struct
> intel_dp *intel_dp,
>  	/* Compressed BPP should be less than the Input DSC bpp */
>  	dsc_max_bpp =3D min(dsc_max_bpp, pipe_bpp - 1);
>=20
> -	pipe_config->dsc.compressed_bpp =3D max(dsc_min_bpp,
> dsc_max_bpp);
> +	pipe_config->dsc.compressed_bpp_x16 =3D
> +		to_bpp_x16(max(dsc_min_bpp, dsc_max_bpp));
>=20
>  	pipe_config->pipe_bpp =3D pipe_bpp;
>=20
> @@ -2209,18 +2212,18 @@ int intel_dp_dsc_compute_config(struct intel_dp
> *intel_dp,
>  	ret =3D intel_dp_dsc_compute_params(connector, pipe_config);
>  	if (ret < 0) {
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "Cannot compute valid DSC parameters for Input
> Bpp =3D %d "
> -			    "Compressed BPP =3D %d\n",
> +			    "Cannot compute valid DSC parameters for Input
> Bpp =3D %d"
> +			    "Compressed BPP =3D " BPP_X16_FMT "\n",
>  			    pipe_config->pipe_bpp,
> -			    pipe_config->dsc.compressed_bpp);
> +			    BPP_X16_ARGS(pipe_config-
> >dsc.compressed_bpp_x16));
>  		return ret;
>  	}
>=20
>  	pipe_config->dsc.compression_enable =3D true;
>  	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp =3D
> %d "
> -		    "Compressed Bpp =3D %d Slice Count =3D %d\n",
> +		    "Compressed Bpp =3D " BPP_X16_FMT " Slice Count =3D %d\n",
>  		    pipe_config->pipe_bpp,
> -		    pipe_config->dsc.compressed_bpp,
> +		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
>  		    pipe_config->dsc.slice_count);
>=20
>  	return 0;
> @@ -2393,15 +2396,15 @@ intel_dp_compute_link_config(struct
> intel_encoder *encoder,
>=20
>  	if (pipe_config->dsc.compression_enable) {
>  		drm_dbg_kms(&i915->drm,
> -			    "DP lane count %d clock %d Input bpp %d
> Compressed bpp %d\n",
> +			    "DP lane count %d clock %d Input bpp %d
> Compressed bpp "
> +BPP_X16_FMT "\n",
>  			    pipe_config->lane_count, pipe_config->port_clock,
>  			    pipe_config->pipe_bpp,
> -			    pipe_config->dsc.compressed_bpp);
> +			    BPP_X16_ARGS(pipe_config-
> >dsc.compressed_bpp_x16));
>=20
>  		drm_dbg_kms(&i915->drm,
>  			    "DP link rate required %i available %i\n",
>  			    intel_dp_link_required(adjusted_mode->crtc_clock,
> -						   pipe_config-
> >dsc.compressed_bpp),
> +
> to_bpp_int_roundup(pipe_config->dsc.compressed_bpp_x16)),
>  			    intel_dp_max_data_rate(pipe_config->port_clock,
>  						   pipe_config->lane_count));
>  	} else {
> @@ -2838,7 +2841,7 @@ intel_dp_compute_config(struct intel_encoder
> *encoder,
>  		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
>=20
>  	if (pipe_config->dsc.compression_enable)
> -		link_bpp =3D pipe_config->dsc.compressed_bpp;
> +		link_bpp =3D to_bpp_int(pipe_config-
> >dsc.compressed_bpp_x16);
>  	else
>  		link_bpp =3D intel_dp_output_bpp(pipe_config-
> >output_format,
>  					       pipe_config->pipe_bpp);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 107f7418ddc5..31461ea25f7c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -227,7 +227,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struc=
t
> intel_encoder *encoder,
>  		if (!dsc)
>  			crtc_state->pipe_bpp =3D bpp;
>  		else
> -			crtc_state->dsc.compressed_bpp =3D bpp;
> +			crtc_state->dsc.compressed_bpp_x16 =3D
> to_bpp_x16(bpp);
>  		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d
> dsc %d\n", slots, bpp, dsc);
>  	}
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c
> b/drivers/gpu/drm/i915/display/intel_link_bw.c
> index 390db5c0c24a..02a0af2aa5ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_link_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
> @@ -70,7 +70,7 @@ int intel_link_bw_reduce_bpp(struct intel_atomic_state
> *state,
>  			return PTR_ERR(crtc_state);
>=20
>  		if (crtc_state->dsc.compression_enable)
> -			link_bpp =3D crtc_state->dsc.compressed_bpp;
> +			link_bpp =3D crtc_state->dsc.compressed_bpp_x16;
>  		else
>  			/*
>  			 * TODO: for YUV420 the actual link bpp is only half
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
> b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 6757dbae9ee5..3a1ed574edbb 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -248,7 +248,7 @@ int intel_dsc_compute_params(struct intel_crtc_state
> *pipe_config)
>  	struct intel_crtc *crtc =3D to_intel_crtc(pipe_config->uapi.crtc);
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>  	struct drm_dsc_config *vdsc_cfg =3D &pipe_config->dsc.config;
> -	u16 compressed_bpp =3D pipe_config->dsc.compressed_bpp;
> +	u16 compressed_bpp =3D to_bpp_int(pipe_config-
> >dsc.compressed_bpp_x16);
>  	int err;
>  	int ret;
>=20
> @@ -874,7 +874,7 @@ static void intel_dsc_get_pps_config(struct
> intel_crtc_state *crtc_state)
>  	if (vdsc_cfg->native_420)
>  		vdsc_cfg->bits_per_pixel >>=3D 1;
>=20
> -	crtc_state->dsc.compressed_bpp =3D vdsc_cfg->bits_per_pixel >> 4;
> +	crtc_state->dsc.compressed_bpp_x16 =3D vdsc_cfg->bits_per_pixel;
>=20
>  	/* PPS 2 */
>  	pps_temp =3D intel_dsc_pps_read_and_verify(crtc_state, 2);
> --
> 2.40.1

