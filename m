Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536127B1F1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 18:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD538947A;
	Mon, 28 Sep 2020 16:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB818947A;
 Mon, 28 Sep 2020 16:34:26 +0000 (UTC)
IronPort-SDR: 8NSdt91j8oVHcELD5QIuapNkOiEX82RedDl+SfKynglDtTyBXL8Q/JI1/XCv4OuRN6399q2zfF
 IVtkcEBjWa3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159364533"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
 d="scan'208,217";a="159364533"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 09:34:24 -0700
IronPort-SDR: BNi0/NA6fTFPH1ISo6uCutc22Jc1rOanW17F8h5/u3YkECoeKZbDq+OXHJSu5PDoCEZMC5igUm
 eYutr5sydTjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
 d="scan'208,217";a="456889607"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 28 Sep 2020 09:34:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 09:34:23 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 09:34:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 28 Sep 2020 09:34:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 28 Sep 2020 09:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHktFnQjP5tjpKHMw1+NNNTyyz6wwzQeYo38EMJAEdbXrziBFYF109HttQBOf3xi2tIgzF70MCTqFf0CiHJ7jAQYAGrmB/07h3ZitZpXL1uY0/vTw5oqUzx9zWrJgR/9ioIBe/9cssUWpF+lyIT9p4cc/WhuDo+CgxSVGROVbkIwNYTvlK/9hnkPT8qZtiupgZRkCaLLEfh4A1QhPEpJCnLUOsO+YUdFqfK1wc5cmWPedscrd/86nosHDri7qTmTubBjzppLjYVnU/8scRL1NlChS7v0evOHVOjPaAh6S4RaRWqF2RHgXjxEwrgYlktcAFD64aWWJZfCIAAqgyvpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwTehKizY1gTIIc6jriqvMf9ic9VNH/B6WJ/Kmjs8ZY=;
 b=QrRy/Fu3Wo9hvQ7QzYrqrtGaKXom0pv4zoluOdCYTRdrPp9+4iMz1IBx1REGmr2SBa9L1Jrp232uM9D+7HqlSPUXgV0QWfCWfnfIghUAJ3Qz7BURf/DXB7Xgy9ESBrOL14G+mc1ySDKBmP7imVH2RzRjmbmja2HbIWDkB2tjtuO82aqletUoSqOPawyJhHzkbIL6sDceZ3O4vad9MphDMwRje9PJPpI7iZ8z3zpcgE/xvft7jzCi6kAwNc0fOuqg6vLEydPogEU5Tl9qeHNaS5cRDBoSS6uIdt7KIRCKeFmNorB6BdipqlogY/TFCnI+8UjxCnRmogYXY/kCoX7ZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwTehKizY1gTIIc6jriqvMf9ic9VNH/B6WJ/Kmjs8ZY=;
 b=FZns647vPP7wYbnFxC5QYFjXRUTKMMFtKQeeE4sr5wwo+CLjP3/bxwDj9tZTDMjxA1VfvORS8JLObi/0zf6qqTPghty0eqt9/gk10jVRLYWholHB9+rYck/WelI/yia6aSjvfeCGeMdswaeKzwbI/NdEqoL39z+rO3nVgJBpzf4=
Received: from SN6PR11MB3421.namprd11.prod.outlook.com (2603:10b6:805:cd::27)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Mon, 28 Sep
 2020 16:34:18 +0000
Received: from SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::85cc:7d43:b53d:33ff]) by SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::85cc:7d43:b53d:33ff%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 16:34:18 +0000
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Ausmus, James" <james.ausmus@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Pandey, Hariom" <hariom.pandey@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table for
 HBR and HBR2
Thread-Topic: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table
 for HBR and HBR2
Thread-Index: AQHWlW/jxEAozpvRL0imed5p9M1VlKl+D7yAgAAvTKk=
Date: Mon, 28 Sep 2020 16:34:18 +0000
Message-ID: <SN6PR11MB3421725FE60CC7930FC02AB6DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-3-tejaskumarx.surendrakumar.upadhyay@intel.com>,
 <87a6xaow40.fsf@intel.com>
In-Reply-To: <87a6xaow40.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [103.240.170.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd1430b5-d662-45c8-41d0-08d863cc58dd
x-ms-traffictypediagnostic: SA0PR11MB4621:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4621DA10F58E1027920561D9DF350@SA0PR11MB4621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q0wlFRI/cUdTzavhea6Y0DIZdw+v12bU9ymiuuIxqjzdkpqxPg0LD0aYZi5hQCI+v+ckcmWtUTRL4PCyZTEKCCYGacAQPvC9ma3EJh8FyRf572Hpt19DEZ3zP6rFHG93IgqB2jdtlwLdw7CtOmtElm9eMWJdK32m7QpyViXhnsPujJZpPz75qZgocOc+BsAmfbIQWsFvNTwbVsrvdLdua4Aa5fCiDE7l+BjC0vRg2DFBXvi9X/clB+9pdB6l3rORuInrtFZpYS93BlhdQW4eHx7Wdba641EA1bMtYBszIxFDZf420589FGMv+ciDCW6Ap4yiWY+VDTWDH7Gbbj/UW51sKkVf0hKEGJJqVtvEjiiBiFnBXvWIfdO2mUBwx6VXyP/eiFPV4gax42Ju+mFJYJR/qkpmaCzUP/YWHGwE/Vs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3421.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(110136005)(52536014)(8936002)(55016002)(8676002)(71200400001)(6636002)(2906002)(9686003)(66446008)(64756008)(91956017)(86362001)(6506007)(7696005)(53546011)(26005)(76116006)(66946007)(83380400001)(15650500001)(33656002)(478600001)(5660300002)(316002)(186003)(19627405001)(66476007)(66556008)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DTm+uDxMgHxzfujAfVxOcf+pt6AF/OiGYQ9vozstSeowczo52vRumfE0Ov9uL1YJYdnoquYqDl9g45+cb86e0pYkJV6PYa3nTMGCVC1qGX1KH+yerD8Q1MOo9r9K/laAXS9f1Yc68gDU11Py99mNUwrdQNjbHS+LwtzrArVjyrXZtxMQPJH589kTCgRsvE6sPik5p3v/no5I/Gu3GGdGghttmqKkS48icRkyPUZZFQmvIw/jwGpAcsP12snif5QUpiMVDnU5f83/8rr8/o01R/jmp+s5xVlWn/UR4j0jW6b1FaTNZFtpC37tkywIeJgWDM9VJpSebcGVV78XUtOqw6gJy+fi+44W+cWwQ7wJP1jRKp8ZHQ6SRl7XPME/LssK49m73Q7UpAB9R8vVWu5edgniNcg2qym8jsVlOouiwqv4on3tdlmd57/kkMErSPtFDsKoohl4264K7/oCgyb138hX+qhT73S230sVqftLVWPlryTVCzM/wn0ND7yzevudhLmpkGbSJfWQLFP74DyPWq8PaTwtRMbFi15APb4Qm1xiQqf3FWAetIPmnOmSKqThnjec6ftQZXi3O10hGWZFRTgH7ajdbLeiepWd3fPvP6V0jrR4MyNi9GbP3oP6PJT6ghKACjbl8n4rUm6aPC1iWw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1430b5-d662-45c8-41d0-08d863cc58dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 16:34:18.6999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9D+WqFbNE7jJTAlqPMXKcTVlgo1lAGHKsvcwSRHKzhMd7+zmxbnChjTwJY2ZsNP1vzkse7e8po/t6JCaezHhot+PGToykyst9TaJ/ER9+6pTyUzDKomdB7NJGsjGXTgJYL+7wUDWQnojTWKD8UHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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
Content-Type: multipart/mixed; boundary="===============1760368187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1760368187==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB3421725FE60CC7930FC02AB6DF350SN6PR11MB3421namp_"

--_000_SN6PR11MB3421725FE60CC7930FC02AB6DF350SN6PR11MB3421namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Jani Nikula <jani.nikula@linux.intel.com>
Sent: Monday, September 28, 2020 7:13 PM
To: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay=
@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; airlied@linux.ie <airl=
ied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; intel-gfx@lists.freedeskt=
op.org <intel-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <=
dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kerne=
l@vger.kernel.org>; Ausmus, James <james.ausmus@intel.com>; Roper, Matthew =
D <matthew.d.roper@intel.com>; Souza, Jose <jose.souza@intel.com>; ville.sy=
rjala@linux.intel.com <ville.syrjala@linux.intel.com>; De Marchi, Lucas <lu=
cas.demarchi@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table =
for HBR and HBR2

On Mon, 28 Sep 2020, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@int=
el.com> wrote:
> JSL has update in vswing table for eDP

I've thought the TLA for Jasper Lake is JSP, not JSL. At least we have
PCH_JSP for Jasper Lake PCH.

>
> BSpec: 21257
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.c=
om>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 67 ++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 4d06178cd76c..fa08463bcf2e 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -582,6 +582,34 @@ static const struct cnl_ddi_buf_trans ehl_combo_phy_=
ddi_translations_dp[] =3D {
>        { 0x6, 0x7F, 0x3F, 0x00, 0x00 },        /* 900   900      0.0   */
>  };
>
> +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp=
_hbr[] =3D {
> +                                             /* NT mV Trans mV db    */
> +     { 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 200   200      0.0   */
> +     { 0x8, 0x7F, 0x38, 0x00, 0x07 },        /* 200   250      1.9   */
> +     { 0x1, 0x7F, 0x33, 0x00, 0x0C },        /* 200   300      3.5   */
> +     { 0xA, 0x35, 0x36, 0x00, 0x09 },        /* 200   350      4.9   */
> +     { 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 250   250      0.0   */
> +     { 0x1, 0x7F, 0x38, 0x00, 0x07 },        /* 250   300      1.6   */
> +     { 0xA, 0x35, 0x35, 0x00, 0x0A },        /* 250   350      2.9   */
> +     { 0x1, 0x7F, 0x3F, 0x00, 0x00 },        /* 300   300      0.0   */
> +     { 0xA, 0x35, 0x38, 0x00, 0x07 },        /* 300   350      1.3   */
> +     { 0xA, 0x35, 0x3F, 0x00, 0x00 },        /* 350   350      0.0   */
> +};
> +
> +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp=
_hbr2[] =3D {
> +                                             /* NT mV Trans mV db    */
> +     { 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 200   200      0.0   */
> +     { 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 200   250      1.9   */
> +     { 0x1, 0x7F, 0x3D, 0x00, 0x02 },        /* 200   300      3.5   */
> +     { 0xA, 0x35, 0x38, 0x00, 0x07 },        /* 200   350      4.9   */
> +     { 0x8, 0x7F, 0x3F, 0x00, 0x00 },        /* 250   250      0.0   */
> +     { 0x1, 0x7F, 0x3F, 0x00, 0x00 },        /* 250   300      1.6   */
> +     { 0xA, 0x35, 0x3A, 0x00, 0x05 },        /* 250   350      2.9   */
> +     { 0x1, 0x7F, 0x3F, 0x00, 0x00 },        /* 300   300      0.0   */
> +     { 0xA, 0x35, 0x38, 0x00, 0x07 },        /* 300   350      1.3   */
> +     { 0xA, 0x35, 0x3F, 0x00, 0x00 },        /* 350   350      0.0   */
> +};
> +
>  struct icl_mg_phy_ddi_buf_trans {
>        u32 cri_txdeemph_override_11_6;
>        u32 cri_txdeemph_override_5_0;
> @@ -1069,7 +1097,6 @@ icl_get_mg_buf_trans(struct intel_encoder *encoder,=
 int type, int rate,
>        *n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_rbr_hbr);
>        return icl_mg_phy_ddi_translations_rbr_hbr;
>  }
> -
>  static const struct cnl_ddi_buf_trans *
>  ehl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rat=
e,
>                        int *n_entries)
> @@ -1098,6 +1125,34 @@ ehl_get_combo_buf_trans(struct intel_encoder *enco=
der, int type, int rate,
>        }
>  }
>
> +static const struct cnl_ddi_buf_trans *
> +jsl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rat=
e,
> +                     int *n_entries)
> +{
> +     struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> +
> +     switch (type) {
> +     case INTEL_OUTPUT_HDMI:
> +             *n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_hd=
mi);
> +             return icl_combo_phy_ddi_translations_hdmi;
> +     case INTEL_OUTPUT_EDP:
> +             if (dev_priv->vbt.edp.low_vswing) {
> +                     if (rate > 270000) {
> +                             *n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi=
_translations_edp_hbr2);
> +                             return jsl_combo_phy_ddi_translations_edp_h=
br2;
> +                     } else {
> +                             *n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi=
_translations_edp_hbr);
> +                             return jsl_combo_phy_ddi_translations_edp_h=
br;
> +                     }
> +             }
> +             /* fall through */
> +     default:
> +             /* All combo DP and eDP ports that do not support low_vswin=
g */
> +             *n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_dp=
_hbr2);
> +             return icl_combo_phy_ddi_translations_dp_hbr2;
> +     }
> +}
> +
>  static const struct cnl_ddi_buf_trans *
>  tgl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rat=
e,
>                        int *n_entries)
> @@ -2265,9 +2320,12 @@ static u8 intel_ddi_dp_voltage_max(struct intel_dp=
 *intel_dp)
>                        tgl_get_dkl_buf_trans(encoder, encoder->type,
>                                              intel_dp->link_rate, &n_entr=
ies);
>        } else if (INTEL_GEN(dev_priv) =3D=3D 11) {
> -             if (IS_ELKHARTLAKE(dev_priv))
> +             if (IS_JASPERLAKE(dev_priv))
> +                     jsl_get_combo_buf_trans(encoder, encoder->type,
> +                                     intel_dp->link_rate, &n_entries);
> +             else if (IS_ELKHARTLAKE(dev_priv))
>                        ehl_get_combo_buf_trans(encoder, encoder->type,
> -                                             intel_dp->link_rate, &n_ent=
ries);
> +                                     intel_dp->link_rate, &n_entries);

This is a good example of a potential trap that having IS_ELKHARTLAKE()
cover both ELK and JSP creates. An unsuspecting coder might change the
if ladder to have IS_ELKHARTLAKE() first, and the subsequent
IS_JASPERLAKE() branch would never be taken.

BR,
Jani.

Tejas : In that case I will put attention note in comment about platform ch=
ecks such that ladder distrubance can be avoided. What you suggest?

>                else if (intel_phy_is_combo(dev_priv, phy))
>                        icl_get_combo_buf_trans(encoder, encoder->type,
>                                                intel_dp->link_rate, &n_en=
tries);
> @@ -2454,6 +2512,9 @@ static void icl_ddi_combo_vswing_program(struct int=
el_encoder *encoder,
>        if (INTEL_GEN(dev_priv) >=3D 12)
>                ddi_translations =3D tgl_get_combo_buf_trans(encoder, type=
, rate,
>                                                           &n_entries);
> +     else if (IS_JASPERLAKE(dev_priv))
> +             ddi_translations =3D jsl_get_combo_buf_trans(encoder, type,=
 rate,
> +                                                        &n_entries);
>        else if (IS_ELKHARTLAKE(dev_priv))
>                ddi_translations =3D ehl_get_combo_buf_trans(encoder, type=
, rate,
>                                                           &n_entries);

--
Jani Nikula, Intel Open Source Graphics Center

--_000_SN6PR11MB3421725FE60CC7930FC02AB6DF350SN6PR11MB3421namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jani Nikula &lt;jani.=
nikula@linux.intel.com&gt;<br>
<b>Sent:</b> Monday, September 28, 2020 7:13 PM<br>
<b>To:</b> Surendrakumar Upadhyay, TejaskumarX &lt;tejaskumarx.surendrakuma=
r.upadhyay@intel.com&gt;; Vivi, Rodrigo &lt;rodrigo.vivi@intel.com&gt;; air=
lied@linux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch=
&gt;; intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedesktop.org&g=
t;;
 dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; l=
inux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Ausmus, J=
ames &lt;james.ausmus@intel.com&gt;; Roper, Matthew D &lt;matthew.d.roper@i=
ntel.com&gt;; Souza, Jose &lt;jose.souza@intel.com&gt;; ville.syrjala@linux=
.intel.com
 &lt;ville.syrjala@linux.intel.com&gt;; De Marchi, Lucas &lt;lucas.demarchi=
@intel.com&gt;; Pandey, Hariom &lt;hariom.pandey@intel.com&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing=
 table for HBR and HBR2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon, 28 Sep 2020, Tejas Upadhyay &lt;tejaskumar=
x.surendrakumar.upadhyay@intel.com&gt; wrote:<br>
&gt; JSL has update in vswing table for eDP<br>
<br>
I've thought the TLA for Jasper Lake is JSP, not JSL. At least we have<br>
PCH_JSP for Jasper Lake PCH.<br>
<br>
&gt;<br>
&gt; BSpec: 21257<br>
&gt; Signed-off-by: Tejas Upadhyay &lt;tejaskumarx.surendrakumar.upadhyay@i=
ntel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_ddi.c | 67 ++++++++++++++++++=
++++--<br>
&gt;&nbsp; 1 file changed, 64 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/dr=
m/i915/display/intel_ddi.c<br>
&gt; index 4d06178cd76c..fa08463bcf2e 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_ddi.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_ddi.c<br>
&gt; @@ -582,6 +582,34 @@ static const struct cnl_ddi_buf_trans ehl_combo_p=
hy_ddi_translations_dp[] =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x6, 0x7F, 0x3F, 0x00, 0x0=
0 },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 900&nbsp;&nbsp; 900&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_=
edp_hbr[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NT mV Trans mV db&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x8, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 200&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x8, 0x7F, 0x38, 0x00, 0x07 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 250&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 1.9&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x1, 0x7F, 0x33, 0x00, 0x0C },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 300&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 3.5&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x36, 0x00, 0x09 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 4.9&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x8, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 250&nbsp;&nbsp; 250&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x1, 0x7F, 0x38, 0x00, 0x07 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 250&nbsp;&nbsp; 300&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 1.6&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x35, 0x00, 0x0A },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 250&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 2.9&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x1, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 300&nbsp;&nbsp; 300&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x38, 0x00, 0x07 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 300&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 1.3&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 350&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_=
edp_hbr2[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NT mV Trans mV db&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x8, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 200&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x8, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 250&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 1.9&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x1, 0x7F, 0x3D, 0x00, 0x02 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 300&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 3.5&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x38, 0x00, 0x07 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 200&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 4.9&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x8, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 250&nbsp;&nbsp; 250&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x1, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 250&nbsp;&nbsp; 300&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 1.6&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x3A, 0x00, 0x05 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 250&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 2.9&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0x1, 0x7F, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 300&nbsp;&nbsp; 300&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x38, 0x00, 0x07 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 300&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 1.3&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { 0xA, 0x35, 0x3F, 0x00, 0x00 },&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 350&nbsp;&nbsp; 350&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0.0&nbsp;&nbsp; */<br>
&gt; +};<br>
&gt; +<br>
&gt;&nbsp; struct icl_mg_phy_ddi_buf_trans {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 cri_txdeemph_override_11=
_6;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 cri_txdeemph_override_5_=
0;<br>
&gt; @@ -1069,7 +1097,6 @@ icl_get_mg_buf_trans(struct intel_encoder *encod=
er, int type, int rate,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *n_entries =3D ARRAY_SIZE(ic=
l_mg_phy_ddi_translations_rbr_hbr);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return icl_mg_phy_ddi_transl=
ations_rbr_hbr;<br>
&gt;&nbsp; }<br>
&gt; -<br>
&gt;&nbsp; static const struct cnl_ddi_buf_trans *<br>
&gt;&nbsp; ehl_get_combo_buf_trans(struct intel_encoder *encoder, int type,=
 int rate,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *n_=
entries)<br>
&gt; @@ -1098,6 +1125,34 @@ ehl_get_combo_buf_trans(struct intel_encoder *e=
ncoder, int type, int rate,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; +static const struct cnl_ddi_buf_trans *<br>
&gt; +jsl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int =
rate,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *n_entries)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_i915_private *dev_priv =3D to_i91=
5(encoder-&gt;base.dev);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; switch (type) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case INTEL_OUTPUT_HDMI:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; *n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_hdmi);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return icl_combo_phy_ddi_translations_hdmi;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case INTEL_OUTPUT_EDP:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (dev_priv-&gt;vbt.edp.low_vswing) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rate &gt; 270000) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; *n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_transl=
ations_edp_hbr2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; return jsl_combo_phy_ddi_translations_edp_hbr2;<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; *n_entries =3D ARRAY_SIZE(jsl_combo_phy_ddi_transl=
ations_edp_hbr);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; return jsl_combo_phy_ddi_translations_edp_hbr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* fall through */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* All combo DP and eDP ports that do not support low_vswing */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; *n_entries =3D ARRAY_SIZE(icl_combo_phy_ddi_translations_dp_hbr2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return icl_combo_phy_ddi_translations_dp_hbr2;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static const struct cnl_ddi_buf_trans *<br>
&gt;&nbsp; tgl_get_combo_buf_trans(struct intel_encoder *encoder, int type,=
 int rate,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *n_=
entries)<br>
&gt; @@ -2265,9 +2320,12 @@ static u8 intel_ddi_dp_voltage_max(struct intel=
_dp *intel_dp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tgl_get=
_dkl_buf_trans(encoder, encoder-&gt;type,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;link_rate, &=
amp;n_entries);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (INTEL_GEN(dev_pri=
v) =3D=3D 11) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (IS_ELKHARTLAKE(dev_priv))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (IS_JASPERLAKE(dev_priv))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jsl_get_combo_buf_trans=
(encoder, encoder-&gt;type,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
tel_dp-&gt;link_rate, &amp;n_entries);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else if (IS_ELKHARTLAKE(dev_priv))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ehl_get=
_combo_buf_trans(encoder, encoder-&gt;type,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;link_rate, &amp;=
n_entries);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
tel_dp-&gt;link_rate, &amp;n_entries);<br>
<br>
This is a good example of a potential trap that having IS_ELKHARTLAKE()<br>
cover both ELK and JSP creates. An unsuspecting coder might change the<br>
if ladder to have IS_ELKHARTLAKE() first, and the subsequent<br>
IS_JASPERLAKE() branch would never be taken.<br>
<br>
BR,<br>
Jani.<br>
<br>
Tejas : In that case I will put attention note in comment about platform ch=
ecks such that ladder distrubance can be avoided. What you suggest?</div>
<div class=3D"PlainText">&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; else if (intel_phy_is_combo(dev_priv, phy))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icl_get=
_combo_buf_trans(encoder, encoder-&gt;type,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_dp-&gt;=
link_rate, &amp;n_entries);<br>
&gt; @@ -2454,6 +2512,9 @@ static void icl_ddi_combo_vswing_program(struct =
intel_encoder *encoder,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (INTEL_GEN(dev_priv) &gt;=
=3D 12)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ddi_translations =3D tgl_get_combo_buf_trans(encoder, t=
ype, rate,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;n_entries);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (IS_JASPERLAKE(dev_priv))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ddi_translations =3D jsl_get_combo_buf_trans(encoder, type, rate,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;n_entries);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (IS_ELKHARTLAKE(dev_=
priv))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ddi_translations =3D ehl_get_combo_buf_trans(encoder, t=
ype, rate,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;n_entries);<br>
<br>
-- <br>
Jani Nikula, Intel Open Source Graphics Center<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB3421725FE60CC7930FC02AB6DF350SN6PR11MB3421namp_--

--===============1760368187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1760368187==--
