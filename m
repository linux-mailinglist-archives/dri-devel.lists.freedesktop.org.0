Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8A4083D6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 07:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5882789CD3;
	Mon, 13 Sep 2021 05:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872FC89CD3;
 Mon, 13 Sep 2021 05:35:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="285277255"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="285277255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2021 22:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="543005901"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2021 22:35:14 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 06:35:12 +0100
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Mon, 13 Sep 2021 11:05:11 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v2 3/6] drm/edid: abstract OUI conversion to 24-bit int
Thread-Topic: [PATCH v2 3/6] drm/edid: abstract OUI conversion to 24-bit int
Thread-Index: AQHXnnMH2FLEsoz68E6Q5w9RC/wPy6uhhThw
Date: Mon, 13 Sep 2021 05:35:10 +0000
Message-ID: <e1c4d6369d8a4f7cb94bca5e03e6a6a3@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
 <2f43032d5f001510c7eed059321ceeb76d07a606.1630419362.git.jani.nikula@intel.com>
In-Reply-To: <2f43032d5f001510c7eed059321ceeb76d07a606.1630419362.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni Nikula
> Sent: Tuesday, August 31, 2021 7:48 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com; Nikul=
a, Jani
> <jani.nikula@intel.com>
> Subject: [PATCH v2 3/6] drm/edid: abstract OUI conversion to 24-bit int
>=20
> Replace the open coded OUI conversion from three bytes to a 24-bit int, a=
s we'll be
> adding one more user shortly. No functional changes.
>=20
> Side note: CTA-861 format has the OUI bytes in reverse order.

Looks ok to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c inde=
x
> 6325877c5fd6..92974b1478bc 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -49,6 +49,11 @@
>  	(((edid)->version > (maj)) || \
>  	 ((edid)->version =3D=3D (maj) && (edid)->revision > (min)))
>=20
> +static int oui(u8 first, u8 second, u8 third) {
> +	return (first << 16) | (second << 8) | third; }
> +
>  #define EDID_EST_TIMINGS 16
>  #define EDID_STD_TIMINGS 8
>  #define EDID_DETAILED_TIMINGS 4
> @@ -4113,32 +4118,24 @@ cea_db_offsets(const u8 *cea, int *start, int *en=
d)
>=20
>  static bool cea_db_is_hdmi_vsdb(const u8 *db)  {
> -	int hdmi_id;
> -
>  	if (cea_db_tag(db) !=3D VENDOR_BLOCK)
>  		return false;
>=20
>  	if (cea_db_payload_len(db) < 5)
>  		return false;
>=20
> -	hdmi_id =3D db[1] | (db[2] << 8) | (db[3] << 16);
> -
> -	return hdmi_id =3D=3D HDMI_IEEE_OUI;
> +	return oui(db[3], db[2], db[1]) =3D=3D HDMI_IEEE_OUI;
>  }
>=20
>  static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)  {
> -	unsigned int oui;
> -
>  	if (cea_db_tag(db) !=3D VENDOR_BLOCK)
>  		return false;
>=20
>  	if (cea_db_payload_len(db) < 7)
>  		return false;
>=20
> -	oui =3D db[3] << 16 | db[2] << 8 | db[1];
> -
> -	return oui =3D=3D HDMI_FORUM_IEEE_OUI;
> +	return oui(db[3], db[2], db[1]) =3D=3D HDMI_FORUM_IEEE_OUI;
>  }
>=20
>  static bool cea_db_is_vcdb(const u8 *db)
> --
> 2.30.2

