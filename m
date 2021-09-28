Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85C41B88F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 22:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6C46E985;
	Tue, 28 Sep 2021 20:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580EE6E985
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 20:42:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="204289514"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="204289514"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 13:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="478889411"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2021 13:42:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 13:42:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 13:42:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 13:42:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 13:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVwR1y0PLHrMai6o8m1xc3XNf2dXLOxHKvvSl0lYO16yeMK4kSotXJBPjTKyUqOccIk89obaKF46TPd5HwgIVH7ZiYMAOIuK1wPVnr7GyA0+FIOVraSkWvNlrd/WNjw+tM6DHqow1cr4/o8t0OcaqFxHnDPTt4vJXyqvxIzqP1dWRmigggs9uJ/5tfCklIkU4XbnoGd1n4vkp9BopizCQ5SoWf9JnsxWhUXShVqREMJHa8dECkcrOOv/o4A5jyVAoGqxiX6Sf/tM+i8LPtgGMwb+LGObgNf3v1pAScP0aBGpM9GMzifKW2luz8tFLjrJCmlJSdVBKT/2Xx1RJaFOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=g15VE20IWDM+JC4uLN7VBP9zpKR3CZCcznL4HzOqIVM=;
 b=LC62k8DKZXiqVqMljm9vIKt4EK7oFHR8fZIHYCqUAXQpJ48OeXTPlJBpU8zONmZRl7VN/GQY29xELpDTUolOn0FNjolsAv2tTgQYoN0foPK7JMQroJ/j9qoqXWbbM3TIqMDdCQ6R0X33LlKg0XjfF1NH1LpShf+u8dAQeVoyRKyttL3k4Ae4TO0HT0pQ9Ui1Adzy5CWP41j84jY3fbXBaa5/ZvK4nWH3fF4vhXcEONI7vqCxj2L+kIG09qMscCn/OklN5Ca3OgXFr+SwKdLFZ63m9wW7gwZuYbCM633MypWHEJyGAWeaCFPmKN6Ji4wbAY+MWlIimdAzd4OBQBT69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g15VE20IWDM+JC4uLN7VBP9zpKR3CZCcznL4HzOqIVM=;
 b=Zul5NHga5ljJB0jgraZI+nuzyoagfEs09MCTAJpGNOVWfCyLdekfkTXK4tHwbKNVHiQWKtEiM0LhU5nm++82Ta7SQ/QR0yuPtwqMRYTahsvmQ1WUgGUcyHkoHVDWgmOPudhRAWGPLDJGO7JB5ZnaCGwNBMQJ6o1p+mg+W8oRMRc=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Tue, 28 Sep
 2021 20:42:37 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::e189:6f03:9fde:2062%5]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 20:42:37 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Nathan Chancellor <nathan@kernel.org>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Nick Desaulniers
 <ndesaulniers@google.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, lkp <lkp@intel.com>
Subject: RE: [PATCH] drm/kmb: Remove
 set_test_mode_src_osc_freq_target_{hi,low}_bits()
Thread-Topic: [PATCH] drm/kmb: Remove
 set_test_mode_src_osc_freq_target_{hi,low}_bits()
Thread-Index: AQHXtJ5sxognB5Xrs0e6qUBrFVe0/6u56Rzg
Date: Tue, 28 Sep 2021 20:42:37 +0000
Message-ID: <BY5PR11MB4182633C57DF92E3793BF2978CA89@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210928192338.1987872-1-nathan@kernel.org>
In-Reply-To: <20210928192338.1987872-1-nathan@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ee72240-973b-43d6-ea5b-08d982c08228
x-ms-traffictypediagnostic: BYAPR11MB3254:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3254BCB82E4EA956B49309908CA89@BYAPR11MB3254.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:597;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XkICzjUmTKYWVijBN10MGtoiOhLkxLxfgEO8Nj2hETxGf/GldpGg6trONfKAowHddWArpJUjxleUyHOU6qI2v5hfmSz8lIJHiBlRgUXyKfpo3wBWyUNJPFdyb6aV3uM2egLXZieaGsP4FwZxB6SRLvpRyTZQ4b4KiAIGWEyGo1nqTSVeTM17N8NgUu9CcwEw9U/PVvp94Fmbgc4QW0sFUh6X6VMau7Yk55azedY9rHfJnI982md5iHFE7vdCFyYt8i34o+vwF+9lfJuYjBHD11kgnRyTJAncGB5+Uy466rftvB0KeqFXcbuwtFYrkGLsotEirQfXMu2WxBNhHQC9cMInyc3sdzDT3qptnqoJG/ynViIoPZ1czwh388erNN1ikflYKTAJCJzsTM5G/wU02OLo5kCYqbnvfDlchfq42nFR5eiXgMZ4+XQMlVBAmX9VbmOvIK3pDXrMGEdceA0TiLUlMLBfJGJB5U+f4rS1uHJp3UGGz7nQgs7Ftk9t3nJgShDQ8s1IIWzcnvOvfRazSa5H++jluFmQnVRRsyp9TqrhvljHPkR2oAV47LXwd14N/pDGFjAgp1z99ffl5UXyFfrw4TIRnL2RuH0OrETatMZmRwbUFe7P77KU6iTIQ0GI/SszF+8gGkIUyf9HAakdfjDNuiouSmiUZ9/HrvAGCkWhmLIJpEbBUXaKnpv5LUDJwu8CU0xL9KnyVd6GHNIUOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(5660300002)(38100700002)(8676002)(8936002)(55016002)(6636002)(54906003)(122000001)(71200400001)(33656002)(110136005)(316002)(26005)(83380400001)(9686003)(508600001)(64756008)(66556008)(66476007)(86362001)(76116006)(66446008)(52536014)(53546011)(4326008)(107886003)(38070700005)(7696005)(66946007)(2906002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WJCvf+VgXV8coestw5MWSGH0mIe5B53zcQr/TT6YKprVvPBdlGVOaLX5f8dA?=
 =?us-ascii?Q?DfVYzTCP/Uvdp/Y/7xfPehK/YMJeIZSGQukmPGAX2A0phMISLK4G29PMWYcI?=
 =?us-ascii?Q?rFJIHZIdeiRPSOzoIXSNBY51qfpzR4Gm7FAJs+V+fhIyML5PjqDEpuQtzKj/?=
 =?us-ascii?Q?VQYipBAcwhXJCc+QGHuuRuMH49FHMhP0qT0PZCLJeYV6/Scpuy/jnhuzMgV6?=
 =?us-ascii?Q?OHs0wMIxa4yDjrsWQH4in5F3zAYr3uNQ+ANkkmL0IkoMIXfVtliFsZ/CO1w1?=
 =?us-ascii?Q?HUXwBd44DK/OOXQ825RLFfsIcCwekczjjbTCIK+l78ochFWPXwrFCamEJymk?=
 =?us-ascii?Q?l8Ht/sG218Gcuh76M5ApxK9FboY4OpLg0KR3Tkf/L22Wl69hQLGHwcdKNsbr?=
 =?us-ascii?Q?R/QdVbQ41nzOyXX38imgzhdo+e/TctgskYMJ4o7f+ucgJ4RIuGcOgTNyTxJM?=
 =?us-ascii?Q?T9XhQ5rcIZimRuSD8kYFjZuv8ghirFIVnnRy51qXJPmoyhlnmumY7oFyAktW?=
 =?us-ascii?Q?pmlwUzOg1M0wG3vPIzSzdzAyOQSmkdkRYijWlqe1hO7ZC9d0+aOeqRZmPNDB?=
 =?us-ascii?Q?wporFHzDV+0D9YhFGaJ0kVfan0AuuxloPL8n9ocsnoqFzVZkCHCbpJHshn+n?=
 =?us-ascii?Q?pxmu9ZLHmxgzz9PhkjFOQasnETRxsr0U0/uet33aI32+QnuwpmBl8mtJn/7V?=
 =?us-ascii?Q?EaKdFsStMCFcCKIxsadgC0f9305NX4c9rgGDY5xWKBcAwFgvF7plgc+wYDhT?=
 =?us-ascii?Q?WZtyP7jsK1eyrr29saAyw8X3KSiAqzQTJITwEjD2rWPxPTzTzsmaIjmSZuni?=
 =?us-ascii?Q?5L2AjI0YPTknw4hcKIs8arZQvNntBANPOqtPN4m3rA2SygmnEBfmeZH7lwWR?=
 =?us-ascii?Q?/GESldMpY1mUkG5v8FjTMNHy3QvUbh4aYOc5SwW4QkhEqm5qrAZlHUB9uFMp?=
 =?us-ascii?Q?2rh6Sbu6RzRvXuguw/nGWNP8IHa3SgYLt76ENmgfklMtziBdAMzbT9ewX6tv?=
 =?us-ascii?Q?GQnN1kkDZYDCA8CzafgY5qqMbVLtlsk2bNTj0oMQCitOVY6i0yLbm16lclio?=
 =?us-ascii?Q?nJvPZd4KiAYKuJkDDhxibV/qRL4zwD4n58yILO95xNOomhsejvzo7S4sa/+t?=
 =?us-ascii?Q?tc3Y/jHzt/cbvRBTQMVTqWnGCZaaXbqqCRdhu/vgQ6njWUPEMNE7s2aTpptQ?=
 =?us-ascii?Q?4cvhqcAuRaYfl5ox6Z1gKhof7t3LCZ1seG4/SjsjbnhfuO7c/wxpJmdY1W1L?=
 =?us-ascii?Q?vRA0XJrxkL6ffo46h0GXkIjfMnwzoqskPk6Ip+mYENZ3Kw2KvCcfYyut/vcb?=
 =?us-ascii?Q?WQg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee72240-973b-43d6-ea5b-08d982c08228
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 20:42:37.7777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTpUdD0fePBK+OGWiJivzmiSw21aPDpbBIn4k8KDco/9CTc/NIeveZMpcfai4Ayl0uCZ16RLnC9xmTyKdP10MwCXPqxz8892SYlJd1SK2hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3254
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

Thanks for the patch. Looks good.
Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

> -----Original Message-----
> From: Nathan Chancellor <nathan@kernel.org>
> Sent: Tuesday, September 28, 2021 12:24 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>; Nick Desaulniers
> <ndesaulniers@google.com>; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; llvm@lists.linux.dev; Nathan Chancellor
> <nathan@kernel.org>; lkp <lkp@intel.com>
> Subject: [PATCH] drm/kmb: Remove
> set_test_mode_src_osc_freq_target_{hi,low}_bits()
>=20
> clang with W=3D1 warns:
>=20
> drivers/gpu/drm/kmb/kmb_dsi.c:812:2: error: unused function
> 'set_test_mode_src_osc_freq_target_low_bits' [-Werror,-Wunused-function]
>         set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_ds=
i,
>         ^
> drivers/gpu/drm/kmb/kmb_dsi.c:824:2: error: unused function
> 'set_test_mode_src_osc_freq_target_hi_bits' [-Werror,-Wunused-function]
>         set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi=
,
>         ^
> 2 errors generated.
>=20
> Remove them, as they have been unused since the driver's introduction in
> commit 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver").
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c
> b/drivers/gpu/drm/kmb/kmb_dsi.c
> index 1793cd31b117..ae24c5fc35a5 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -808,34 +808,6 @@ static void test_mode_send(struct kmb_dsi
> *kmb_dsi, u32 dphy_no,
>  	}
>  }
>=20
> -static inline void
> -	set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi
> *kmb_dsi,
> -						   u32 dphy_no,
> -						   u32 freq)
> -{
> -	/* Typical rise/fall time=3D166, refer Table 1207 databook,
> -	 * sr_osc_freq_target[7:0]
> -	 */
> -	test_mode_send(kmb_dsi, dphy_no,
> TEST_CODE_SLEW_RATE_DDL_CYCLES,
> -		       (freq & 0x7f));
> -}
> -
> -static inline void
> -	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
> -						  u32 dphy_no,
> -						  u32 freq)
> -{
> -	u32 data;
> -
> -	/* Flag this as high nibble */
> -	data =3D ((freq >> 6) & 0x1f) | (1 << 7);
> -
> -	/* Typical rise/fall time=3D166, refer Table 1207 databook,
> -	 * sr_osc_freq_target[11:7]
> -	 */
> -	test_mode_send(kmb_dsi, dphy_no,
> TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
> -}
> -
>  static void mipi_tx_get_vco_params(struct vco_params *vco)
>  {
>  	int i;
>=20
> base-commit: 93ee1a2c0f08345ab17c51198f725d4c95984f4c
> --
> 2.33.0.591.gddb1055343

