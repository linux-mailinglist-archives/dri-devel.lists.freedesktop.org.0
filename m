Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAC2D7FAF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 21:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA656E3B2;
	Tue, 15 Oct 2019 19:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820044.outbound.protection.outlook.com [40.107.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B51B6E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 19:15:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KH4YaEMpmaoA+Phz51tHS6hO1BJJvORX5YtyRelPgOOa7uV7lpGgfYIjXdrgmIzLAaskzl4ScS8pcIrUwQUhS+7CkCmuSaOO9Hj3w9aUWW/SNFvHYWxua33NVJrk9oj6B8d4Xfa0oYdHuTjU0l1rkGR1Pzxu+/3a8eMVGSk8mG5Ez8QsU61nbws8QTk46hT9h/v6g4Dq9W7JT1rRaPPyXwTURrVisgzpDoJXIfZtl8d9ZjYB7oIcnmCotv6BeXjeE1GfnplVdPRXFepBXhbvdvCJ780cdv1bFMx4zaQttGfK/9kAnGkqIJjx7U6xsWy8P+TRtjgTM/k+DPyRwNBxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seI6TbLbW8Se7sKaud8olhdkBZJ6KoGqXBHfj9FmowI=;
 b=FBgi5pITFTIG3SDBxVEdMrdTwfy6+QxLBnqKLeHb/sUvtR7veK/LYmDgHUAbCO0gB8lHQ9Wk6nIUXsvfnbadAjZRP8H+G3o0P1Hiqn3fqKq0sEYA4k93d41iDbegHqiALZdyhCoXJEGc2ETFA3Dq9zbxt9cUcsKknXGYU/lAWZmQL/U/58YtbnxPALQBCfxWvcUBD03LCfGWul31x8U45ugbGzeNQhcL5x8f6w5wG9SYA2wUVXVgIgFPnsTHMe7avSnsFL0FvGN7JeyorR8BZNGL+4y+6c9Y94KSiF+w61/c8/0g8rilWDVrecHmRmGlNHiwkg/mrOVSJLKF5WzzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (20.178.198.25) by
 DM6PR12MB3497.namprd12.prod.outlook.com (20.178.199.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 19:15:05 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::88a6:9681:d4cd:51d2]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::88a6:9681:d4cd:51d2%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 19:15:05 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Add LT-tunable PHY repeater mode operations
Thread-Topic: [PATCH] drm: Add LT-tunable PHY repeater mode operations
Thread-Index: AQHVg14R21/cmlYs3kCpQ3lK2eqOFKdbuQoAgABZ6QA=
Date: Tue, 15 Oct 2019 19:15:04 +0000
Message-ID: <20191015191502.zrngl6arydwazwr5@outlook.office365.com>
References: <20191015134010.26zwopwnrbsmz5az@outlook.office365.com>
 <20191015135314.GE1208@intel.com>
In-Reply-To: <20191015135314.GE1208@intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac1f49db-b617-45d8-adf1-08d751a3fc0e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3497:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB34972B29E7E957AA8A84DCD798930@DM6PR12MB3497.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(189003)(199004)(66556008)(66946007)(64756008)(66616009)(66476007)(66066001)(2906002)(11346002)(52116002)(6246003)(99286004)(966005)(446003)(186003)(66446008)(76176011)(6916009)(6512007)(9686003)(14454004)(6486002)(6436002)(256004)(26005)(25786009)(71200400001)(6306002)(8676002)(102836004)(81166006)(229853002)(81156014)(86362001)(5660300002)(1076003)(486006)(4326008)(316002)(8936002)(6116002)(478600001)(6506007)(71190400001)(386003)(54906003)(305945005)(476003)(3846002)(99936001)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3497;
 H:DM6PR12MB3370.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hFdR+riYSceEf+mPBDoedb0Fy0Ro9KLejZ3/qwM5dshKGVvJECGyEpKlESFscJhRaBaUjKlSaKFK6ZyiE1F5l9RJFlYbJ0iSl5pPMZrARqi85/OatlWMkOrTXVvGpMhs7Z3IFVVr1r97P2aQquzy4+fgNNtTY/l8WTkTDqFPglSSjMwPP+9ykXS/JmtVKNWlCNkI11qpgcO8YmKgr8Yg6/MqNWxtR2sQyhLfHtXHRTMPsYhBHBYoUqO2ApXX+HVMOxVt3kSF7OY9MziE4j05YQXizQtS/ipVlwCT10ArEQLB0AMRQ4oNKuP4U872dHOdM7eT8zMTJAJX83/CclBvLMQwcDclHZlqCaNkmj3wkyaPyx0uvY3QxBrJZTShGSXhmlomoLjRr9+yErrcb4OGxI+CHuSoA1A3rnY5rge8DG0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1f49db-b617-45d8-adf1-08d751a3fc0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 19:15:04.9132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZ+bRyM1bB5rm1AwFJ0N4C5ozV/IAGYLnhzCau9CxTW5Fis1a27OkX95HMqIr1XMjLD8LiFYD6JgXjLtPdErTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3497
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seI6TbLbW8Se7sKaud8olhdkBZJ6KoGqXBHfj9FmowI=;
 b=vtdo8zeLAGcGDWPEftfy1EPRdgSQgoZQxwie18anpcmRENQn1JvhG4izkWc7+MU/af2B+oex3AfrWjXopm2FocG0LpQ86kMAw3WPC5gNZgggvyaF+Vn3YRu0sNwJ7SY2N+cKggbiAb5L6KOb6gryAnbL8f9kMDPQ8mTaVDIBdl0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>
Content-Type: multipart/mixed; boundary="===============1184027052=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1184027052==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udp5nohy3qs232fn"

--udp5nohy3qs232fn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Applied to drm-misc-next.

Thanks

On 10/15, Ville Syrj=E4l=E4 wrote:
> On Tue, Oct 15, 2019 at 01:40:12PM +0000, Siqueira, Rodrigo wrote:
> > LT-tunable PHY Repeaters can operate in two different modes: transparent
> > (default) and non-transparent. The value 0x55 specifies the transparent
> > mode, and 0xaa represents the non-transparent; this commit adds these
> > two values as definitions.
> >=20
> > Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>=20
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> > ---
> >  include/drm/drm_dp_helper.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index bf62b43aaf2b..cfadeeef8492 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1034,6 +1034,10 @@
> >  #define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1	    0xf003b /* 1.3 */
> >  #define DP_FEC_STATUS_PHY_REPEATER1			    0xf0290 /* 1.4 */
> > =20
> > +/* Repeater modes */
> > +#define DP_PHY_REPEATER_MODE_TRANSPARENT		    0x55    /* 1.3 */
> > +#define DP_PHY_REPEATER_MODE_NON_TRANSPARENT		    0xaa    /* 1.3 */
> > +
> >  /* DP HDCP message start offsets in DPCD address space */
> >  #define DP_HDCP_2_2_AKE_INIT_OFFSET		DP_HDCP_2_2_REG_RTX_OFFSET
> >  #define DP_HDCP_2_2_AKE_SEND_CERT_OFFSET	DP_HDCP_2_2_REG_CERT_RX_OFFSET
> > --=20
> > 2.23.0
>=20
>=20
>=20
> --=20
> Ville Syrj=E4l=E4
> Intel

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--udp5nohy3qs232fn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2mGrUACgkQWJzP/com
vP9E+A//UaVzf/8YhouHYfbmraLJHyggL0dmRR9dfGUUUNBF94Nzpv0PCs08h5k0
KWc/OwKJQq8pLkEqxw8w3AHIjfxJ9ElyTQAUEs4hR23egw8m3h+zCsO5y+TO6NU3
SrZc2tQiX+7d5njYJXSzfVoZIiozl4ttsdA8uOXMNPSWAkk7aobgfTIxL2q0dvxq
n3FtCFipfmtKJFTRKueZqfNfgQw4t9EPUsEYAmOmPTUlQd1l4dh1nL2+RkSTT8xs
pEiVl+14aRU4yTmqQJbWQ10GBWBjs7pPw8/lJ0WUTy1ZMyZayOcjwwgrEWGCadfo
JHLaqi2kyDCfDDGGUPAj94J/C4cc96fpiqyNlOKJdRHHPPelpJZ2kTvu6bkvSdhw
FgPh1kapeKCP20sCeyGEBnuasMqyMoJGnZIMovsV5u8WbALUTzawGk/Zl8LxW06I
Eod0t795DE3vOhTa8ip1lUi5rZigP2B7LmZ8/e0TtoiGbjgl9anqFVLuecwszaHm
hXk1KuqQ0Ozlx7Q7DgFy5CnUPTovvT/i44TbG1+uWwGrWLGCcW8DnTpbjm5/WIkr
QAN3PjBwkhWV+FQGlozYl4zc7WiQ7WqG168lUfcsFKTLyJpPyEAFudaTLazuJzq7
0i3KKiCfVV5nxbfC+yVadM6wEkAqJiEr0dgiBTJuwI5yJ1wiuao=
=OsbP
-----END PGP SIGNATURE-----

--udp5nohy3qs232fn--

--===============1184027052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1184027052==--
