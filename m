Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A20927CEDE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 15:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3476E1BE;
	Tue, 29 Sep 2020 13:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5FD89ECD;
 Tue, 29 Sep 2020 13:17:28 +0000 (UTC)
IronPort-SDR: LaKwvxX5AzGKGhxduFbvVQNd9ilXh7SpmCC936jlYGO94iarmTFbH/V927TfCgFU4fUao/b8R+
 HPErVreZDVkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="246919728"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="246919728"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 06:17:24 -0700
IronPort-SDR: 4uC3nlgtOqAXLhLviqa5CCd+QNO2hCf8Sq4bEzwVOiDg/qkQK0AZzUrv0YT2aXRJ8OmEPfOlHJ
 D1YYgeJ/hxmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="338630822"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2020 06:17:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 06:17:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 06:17:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Sep 2020 06:17:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 29 Sep 2020 06:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=On5VMaqr0qz+tIOcYDFP7LPD+rZEiFHf/n0+wZlEqXY9y2RkIyL3/ItZNqPoZu8+D5iND2nbjefaXLSm3He9ERupBiRkgVjI2gG4THHjcKdlsKVuReveBGiLFKtanlu+qwPjQzhBuVrhMY/0Dw5sL/syBgUBF+ZNdsIqORu+SeYCYEU9X8YIpuzACnE/vqlSQK7R2n4t8BJbcJSDvYsSjWxr+UCqnLQ7qHA3Uk/5eKWiM6ka3tqRDxE+d/YTDZ3CEHHm6TphDxBbA4q4gbwKzJAU29WXahYshzFWVY/krNhX2Kit38DqRUd0ib7n58d1eSdIb4Em0S+Q+Wp984qHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX3tr96+xVgs1W4L36QvXaCCv+cU2Q3wZrl3xjydxew=;
 b=cFq0vLr3BT7HoTlHqWHzwHf53FCdBlI8sOZNu4CE3WD3O/hxPPyonGa1hqyDtkT/3OEp4xVmusNzvVcx/oXjlQBjuzHtKfCMDxaMGXmqcoA5dv/wB9kEDlHEAbydOgEElov4KN6BGTVtvl1UfrcFMD72vcU3+yDqBCmM//tXLY3zztLAInS8FyOoonkCdu8UG/Rit9iUAPDGeg3PdfKA7l4UQCN4y0TXkuAE5efKGL02QMg+sPRfexw7vblY3SrNVrCw85OZ1aOqh9adgFiWmwXWcXiKZda2huxMj01c4NF4rGbm4jsiF7jCzjYq0Jiqm2k8eCZtWHXnWko3vu673g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX3tr96+xVgs1W4L36QvXaCCv+cU2Q3wZrl3xjydxew=;
 b=QaAGIXislq55UxPJaK5sX67npWwv0t1PWoChfGPXFexEk+NJu7qyFN7b1LIVinc5wJceUgc0sJaomFDDvaNYK4+9mt0ozoLmKBAeydOYHF32CFTw8cjJL2XwG7vWIaxh/FrmMytoik/slXUBNqOP+sGF9iCKsvglY3Rlf7ujGoI=
Received: from BYAPR11MB3416.namprd11.prod.outlook.com (2603:10b6:a03:90::26)
 by BYAPR11MB3173.namprd11.prod.outlook.com (2603:10b6:a03:1d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Tue, 29 Sep
 2020 13:17:21 +0000
Received: from BYAPR11MB3416.namprd11.prod.outlook.com
 ([fe80::a4e7:7bd:6fd7:289d]) by BYAPR11MB3416.namprd11.prod.outlook.com
 ([fe80::a4e7:7bd:6fd7:289d%2]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 13:17:21 +0000
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Thread-Topic: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Thread-Index: AQHWllrn9Ey1fCvIFUCK2c7nj6EUz6l/kiGAgAAFMrA=
Date: Tue, 29 Sep 2020 13:17:20 +0000
Message-ID: <BYAPR11MB3416CF05CDD3F7AB07BEF3B4DF320@BYAPR11MB3416.namprd11.prod.outlook.com>
References: <20200929121127.254086-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200929125243.GY6112@intel.com>
In-Reply-To: <20200929125243.GY6112@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [43.250.158.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce06291e-d48f-42e3-562d-08d86479ff5a
x-ms-traffictypediagnostic: BYAPR11MB3173:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3173B87EDBBD92AA1E42F637DF320@BYAPR11MB3173.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQ9Hq+iMP12loD4+qdTRDmCWxHavhCUwt921nUlONT2aYMf+CVpadlaZH9OuaGb8oXo6aT3OoI/wx6u91s2lsjV+LO4S55mwmx4lj/it6nIx2OBZ/D+EFM3B2rY98OTlwv2udeuKAqkX6It8Q2ltLpKo2A5n/63Zad/CADCX7HgcZvXpBKQ2ddeO5eTbXUJNSF7oEPFmFc9ewD+1dNv6a5v9EPYXFW6fEAon3g3jFbEMOMNTefYIQjZwKxLxi/ZTaQHVp+weniN9h46wGvFUdnfdG9hhukkBh2RuqAsRSMKIWCh3MHnoaem/QH9jD9awc6EdnNRRk3fuD+LqNw6QrLMEpDd9lupHjkHG7tE6YogHzkfzWs17QkqBgInwVFld
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3416.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(54906003)(9686003)(53546011)(6506007)(83380400001)(186003)(15650500001)(7696005)(2906002)(66574015)(316002)(71200400001)(4326008)(66476007)(64756008)(86362001)(66446008)(6916009)(5660300002)(66556008)(26005)(478600001)(55016002)(52536014)(76116006)(66946007)(33656002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4f/iWL8nORcpQmrkVTQZrPxG28gKUQMB4eAyPR/D9p8Hfb3y90GUzefot0shH5ixxUI9VbhXeI9AHHffOxwOwPOu+uEYCtYY3pE9GJY2+KbpyxAhBEnYQAeshp+EJ0ZdIOEU/IgjrEXOdcsx4jPFX1JgkLwgPRR5maddr3bRnWeN4p3pCA8zgV2WdSqJYL/YNAdDy896NLJ18qPULE9fuuqZJJlQFXyRsKeSueHtynf4/OheV9D7Ea9RHYfxilFsUn7YcVeXtqvLW6kVThxsu1o7g9Au2MsJxkcXyLoF8f/IjQCc2lzzm8gJ7PtpKsnXNIDyRE93NdR9m7qTbdqxpC2fWtdKedAGy1Eu4ksQy8lyOXW6hTy3yIb9WCWoloWXZraMuuHSjgCKfjAdatiEatRFtbnvJAKjX2G0T6oNekP6XIlNL5vpSX4yCc/kWnfHyiTMTlxpISpyNYbUPuKtQTJpfB46wn9ccs0ye1nPeAhBny6/x1kRi5FGY5fyKBk7H94REGHk54w4M5pFhncFsZ66mTa+vIU9yxaF5OMGiYdbLNa+jSdv9c8h//QTPBYu8FHFtMcpctyHnkV5zLopl1ZtygeCefe5vtFv32yurMIYcyolLq+OX07di738mFZe5m8wIIsws/8r7Mi/XIm42w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3416.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce06291e-d48f-42e3-562d-08d86479ff5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 13:17:20.8567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcywsaK1gF5ao3k7zvUGISdDVJ1iSaosA9VGQzfWGJ7eQEA7tO0T4Xo4zXAapTiU4Ztg+5SQ4qWVqDeg9qcZ5CuqJ/JG6txIJsn7GEQA4Ma6ZgYmUUtsul5Dyzung1K4LIPaOWPrmpXnAM/C6QjYWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3173
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



-----Original Message-----
From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com> =

Sent: 29 September 2020 18:23
To: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay=
@intel.com>
Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Ausmu=
s, James <james.ausmus@intel.com>; Roper, Matthew D <matthew.d.roper@intel.=
com>; Souza, Jose <jose.souza@intel.com>; De Marchi, Lucas <lucas.demarchi@=
intel.com>; Pandey, Hariom <hariom.pandey@intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and H=
BR2

On Tue, Sep 29, 2020 at 05:41:27PM +0530, Tejas Upadhyay wrote:
> JSL has update in vswing table for eDP
> =

> BSpec: 21257
> =

> Changes since V1 : =

> 	- IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
>           HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively

What do vswing values have to do with the PCH type?

Tejas : There is difference in voltage swing values for EHL and JSL. Till n=
ow we were not differentiating between EHL and JSL as both were
based on ICL. Now as per compliance test we have found change in JSL eDP vs=
wing values which does not apply to EHL which leads to differentiate
between EHL and JSL. Thus differentiator between JSL and EHL is PCH i.e HAS=
_PCH_MCC(EHL) and HAS_PCH_JSP(JSL). There is no direct relation of PCH with=
 vswing.

> 	- Reverted EHL/JSL PCI ids split change
> =

> Signed-off-by: Tejas Upadhyay =

> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 67 =

> ++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c =

> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 4d06178cd76c..e6e93d01d0ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -582,6 +582,34 @@ static const struct cnl_ddi_buf_trans ehl_combo_phy_=
ddi_translations_dp[] =3D {
>  	{ 0x6, 0x7F, 0x3F, 0x00, 0x00 },	/* 900   900      0.0   */
>  };
>  =

> +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp=
_hbr[] =3D {
> +						/* NT mV Trans mV db    */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
> +	{ 0x8, 0x7F, 0x38, 0x00, 0x07 },	/* 200   250      1.9   */
> +	{ 0x1, 0x7F, 0x33, 0x00, 0x0C },	/* 200   300      3.5   */
> +	{ 0xA, 0x35, 0x36, 0x00, 0x09 },	/* 200   350      4.9   */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
> +	{ 0x1, 0x7F, 0x38, 0x00, 0x07 },	/* 250   300      1.6   */
> +	{ 0xA, 0x35, 0x35, 0x00, 0x0A },	/* 250   350      2.9   */
> +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
> +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
> +	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
> +};
> +
> +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp=
_hbr2[] =3D {
> +						/* NT mV Trans mV db    */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   250      1.9   */
> +	{ 0x1, 0x7F, 0x3D, 0x00, 0x02 },	/* 200   300      3.5   */
> +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 200   350      4.9   */
> +	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
> +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   300      1.6   */
> +	{ 0xA, 0x35, 0x3A, 0x00, 0x05 },	/* 250   350      2.9   */
> +	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
> +	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
> +	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
> +};
> +
>  struct icl_mg_phy_ddi_buf_trans {
>  	u32 cri_txdeemph_override_11_6;
>  	u32 cri_txdeemph_override_5_0;
> @@ -1069,7 +1097,6 @@ icl_get_mg_buf_trans(struct intel_encoder *encoder,=
 int type, int rate,
>  	*n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_rbr_hbr);
>  	return icl_mg_phy_ddi_translations_rbr_hbr;
>  }
> -
>  static const struct cnl_ddi_buf_trans *  =

> ehl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
>  			int *n_entries)
> @@ -1098,6 +1125,34 @@ ehl_get_combo_buf_trans(struct intel_encoder *enco=
der, int type, int rate,
>  	}
>  }
>  =

> +static const struct cnl_ddi_buf_trans * =

> +jsl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rat=
e,
> +			int *n_entries)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> +
> +	switch (type) {
> +	case INTEL_OUTPUT_HDMI:
> +		*n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_hdmi);
> +		return icl_combo_phy_ddi_translations_hdmi;
> +	case INTEL_OUTPUT_EDP:
> +		if (dev_priv->vbt.edp.low_vswing) {
> +			if (rate > 270000) {
> +				*n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr2);
> +				return jsl_combo_phy_ddi_translations_edp_hbr2;
> +			} else {
> +				*n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr);
> +				return jsl_combo_phy_ddi_translations_edp_hbr;
> +			}
> +		}
> +		/* fall through */
> +	default:
> +		/* All combo DP and eDP ports that do not support low_vswing */
> +		*n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_dp_hbr2);
> +		return icl_combo_phy_ddi_translations_dp_hbr2;
> +	}
> +}
> +
>  static const struct cnl_ddi_buf_trans *  =

> tgl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
>  			int *n_entries)
> @@ -2265,7 +2320,10 @@ static u8 intel_ddi_dp_voltage_max(struct intel_dp=
 *intel_dp)
>  			tgl_get_dkl_buf_trans(encoder, encoder->type,
>  					      intel_dp->link_rate, &n_entries);
>  	} else if (INTEL_GEN(dev_priv) =3D=3D 11) {
> -		if (IS_ELKHARTLAKE(dev_priv))
> +		if (HAS_PCH_JSP(dev_priv))
> +			jsl_get_combo_buf_trans(encoder, encoder->type,
> +						intel_dp->link_rate, &n_entries);
> +		else if (HAS_PCH_MCC(dev_priv))
>  			ehl_get_combo_buf_trans(encoder, encoder->type,
>  						intel_dp->link_rate, &n_entries);
>  		else if (intel_phy_is_combo(dev_priv, phy)) @@ -2454,7 +2512,10 @@ =

> static void icl_ddi_combo_vswing_program(struct intel_encoder *encoder,
>  	if (INTEL_GEN(dev_priv) >=3D 12)
>  		ddi_translations =3D tgl_get_combo_buf_trans(encoder, type, rate,
>  							   &n_entries);
> -	else if (IS_ELKHARTLAKE(dev_priv))
> +	else if (HAS_PCH_JSP(dev_priv))
> +		ddi_translations =3D jsl_get_combo_buf_trans(encoder, type, rate,
> +							   &n_entries);
> +	else if (HAS_PCH_MCC(dev_priv))
>  		ddi_translations =3D ehl_get_combo_buf_trans(encoder, type, rate,
>  							   &n_entries);
>  	else
> --
> 2.28.0

--
Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
