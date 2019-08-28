Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC17A0AF2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 21:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5BE89E57;
	Wed, 28 Aug 2019 19:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801E589E57;
 Wed, 28 Aug 2019 19:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFholl43+1nxhFSJe6RfIeWh98mHdSLgYbuZwEecAMNzIpaelZCKgLnfF0wbX64AaWnkyq3OwrO4q6XGaPO4jVYYJUnwKjBXFyIZCSTZbOjKjkG7v1rgy/r5cfI6OgbKG3mmWQ3C2YWW8997G5/iuSE10VSHSBoYmBBN3OMauGjJj1wSt57AmUzZcpF3RR0P19dCA04gsqRLjGSUmlNMPul3ZGlBlbZ2fe7swfHJzTVlQWY+/N29u+U9yg4OxFFNuOGi2mBC5BNbggTP10TVOrZDYsdRM5OtZ6PcVTV9qH4rIp3+iRF3B2RQW/l4lI0YePviKDXaVU3oCc9Eh5Y4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOqxHDbw24O1l1zwoKTNia3AV1zRR4jE8tfpaA/zOgg=;
 b=X1uoqb67ORnCLCgqotrtYYfd+l5g9opGZNf9zuJzJg2+J5J44GBd5qsVkwvB/sRlW7YbsexZwo9WZm8OsENxnERjQ9+kCAcnDrKuJWhlE8CVipLD1H3Qx6o17BkOS6byu3QhZV6bxLwQrPlRBgJeC85vTTwcnqrbunPw5v9ASrKFGnAqfluUvcc6f5/Rfz6/16IBktZeK8AQBrZ0cm2quEU3X53menxxKFN0T2ywfdlPtsnD/MixQ9j6JMCVcBAcpTTsboYaVnmyiHMt/wbam2kyfZChfzkSW/DC6JpU+OXXe6Jvs9qFbdcm0l8juX3J9YB/ZennTFZJ8V5sv9UdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com (10.172.75.146) by
 CY4PR1201MB0183.namprd12.prod.outlook.com (10.174.52.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 19:58:57 +0000
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335]) by CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335%5]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 19:58:57 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH V2] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V2] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVXCMIs0HPddxKiUWpD8Y2be0PaqcOpyoAgAJWpQA=
Date: Wed, 28 Aug 2019 19:58:57 +0000
Message-ID: <20190828195904.u4lqjwi4naclkh4r@outlook.office365.com>
References: <20190826152925.4x7mwhzxit353yww@outlook.office365.com>
 <87zhjv81lx.fsf@intel.com>
In-Reply-To: <87zhjv81lx.fsf@intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25)
 To CY4PR1201MB0086.namprd12.prod.outlook.com
 (2603:10b6:910:17::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53c3db1d-37ff-4fb0-54bd-08d72bf22966
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0183; 
x-ms-traffictypediagnostic: CY4PR1201MB0183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0183325AD665D16218BB36D798A30@CY4PR1201MB0183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(189003)(199004)(64756008)(66476007)(99936001)(66066001)(6486002)(66556008)(54906003)(6436002)(5660300002)(99286004)(66616009)(4326008)(305945005)(6506007)(386003)(6306002)(26005)(25786009)(186003)(102836004)(53936002)(9686003)(6512007)(229853002)(316002)(6246003)(446003)(11346002)(476003)(8936002)(8676002)(66446008)(81156014)(486006)(81166006)(6916009)(52116002)(6116002)(71200400001)(71190400001)(2906002)(7736002)(3846002)(86362001)(966005)(478600001)(66946007)(14454004)(1076003)(76176011)(14444005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0183;
 H:CY4PR1201MB0086.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AdB/lAkFCqiZV4LdVNh6K07h8cFYMOec9GllsrRcf9u+zr/NfHSUFvNYxejuxmRl2i0kO6sUml81qW53jroQraJQnn996Tg9phW7LubNFj6b7JbCsTlPRpKc93ngZR+hx9yPxjg+6mdk+DklXYqV+AOPCTgjnlCjvhOv576jCMbW4LmDSy4zWs1cr+5pJUIT8j5vQEoPMoef5wNRWLmO+4grDkAejPIuWNTPxdY6mdOvOqfSqwDHF6tS9oy4g1abjSXH0XoI/mk/IVbejerKnAovbuTEpHTeXTb8YqKKyE9xv1a/EwzAxEOVMj6uD2jyonWd8OtwjLlzmQJ8l4/qJ47ekMdssHcde0iU0G020wWhnaJtl5soBABti6jKEbae/dC0SFd+/5YmPRiAqC5h1GJUWzeLcH8CCLIagAxoPu4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c3db1d-37ff-4fb0-54bd-08d72bf22966
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 19:58:57.5915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqsAbI/JO04smNFsowU41yPm0X7xkg7fyVpWkvHFO2NkbrTuP30dOrDen8P/jBYvBwVbET31xGywCTmtJTlveQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOqxHDbw24O1l1zwoKTNia3AV1zRR4jE8tfpaA/zOgg=;
 b=ZrNSZCjqEpulAWOqgW1gJpqnAlIhPjrku/hGwqsab+DJU+8AHMVYcjKZF+Vh1oSGoqt0wsjfiUQmrtLxg9Ny1tFAMF8uwPQGG2j4YofBr1uzrOGBXy381N5rJnqxu773OM2AufFRH5ppVioFeetBshn1xUzD/i00R3+momiF/2o=
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2067205127=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2067205127==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g77yriyayozscbdx"

--g77yriyayozscbdx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/27, Jani Nikula wrote:
> On Mon, 26 Aug 2019, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com> wrote:
> > DP 1.4a specification defines Link Training Tunable PHY Repeater (LTTPR)
> > which is required to add support for systems with Thunderbolt or other
> > repeater devices.
> >
> > Changes since V1:
> > - Adjusts registers names to be aligned with spec and the rest of the
> >   file
> > - Update spec comment from 1.4 to 1.4a
> >
> > Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> > ---
> >  include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 8364502f92cf..e8beb4e7e5da 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -134,6 +134,31 @@
> >  #define DP_SUPPORTED_LINK_RATES		    0x010 /* eDP 1.4 */
> >  # define DP_MAX_SUPPORTED_RATES		     8	    /* 16-bit little-endian */
> > =20
> > +/** Link Training (LT)-tunable Physical Repeaters - DP 1.4a **/
>=20
> This is not a kernel-doc comment, so please drop the double ** and use
> regular comments.
>=20
> All the DPCD register definitions are ordered according to register
> offset. Why add 0xf0000 and friends between 0x10 and 0x20...?

Hi Jani,

Thank you for the feedback. I already sent a V3 patch based on your
comments; please let me know if you have any other suggestion.

Best Regards

> BR,
> Jani.
>=20
> > +#define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000
> > +#define DP_MAX_LINK_RATE_PHY_REPEATER                       0xf0001
> > +#define DP_PHY_REPEATER_CNT                                 0xf0002
> > +#define DP_PHY_REPEATER_MODE                                0xf0003
> > +#define DP_MAX_LANE_COUNT_PHY_REPEATER                      0xf0004
> > +#define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT               0xf0005
> > +#define DP_TRAINING_PATTERN_SET_PHY_REPEATER1               0xf0010
> > +#define DP_TRAINING_LANE0_SET_PHY_REPEATER1                 0xf0011
> > +#define DP_TRAINING_LANE1_SET_PHY_REPEATER1                 0xf0012
> > +#define DP_TRAINING_LANE2_SET_PHY_REPEATER1                 0xf0013
> > +#define DP_TRAINING_LANE3_SET_PHY_REPEATER1                 0xf0014
> > +#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1           0xf0020
> > +#define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1             0xf0021
> > +#define DP_LANE0_1_STATUS_PHY_REPEATER1                     0xf0030
> > +#define DP_LANE2_3_STATUS_PHY_REPEATER1                     0xf0031
> > +#define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1          0xf0032
> > +#define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1             0xf0033
> > +#define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1             0xf0034
> > +#define DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1           0xf0035
> > +#define DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1           0xf0037
> > +#define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1           0xf0039
> > +#define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1           0xf003b
> > +#define DP_FEC_STATUS_PHY_REPEATER1                         0xf0290
> > +
> >  /* Multiple stream transport */
> >  #define DP_FAUX_CAP			    0x020   /* 1.2 */
> >  # define DP_FAUX_CAP_1			    (1 << 0)
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--g77yriyayozscbdx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1m3QgACgkQWJzP/com
vP+NMw/+MsgYUVfI4L4iH6c7sGo0x8hLxxRGAZ25MaIMtCfa+oaguXI3nx0cWddU
I5zvcGVU5X+s2dFOXyG4qOlmUV6x+uJMnqTB7RcRybjpjzv8OamB6hhSV7Gt/cRb
dEYX8ugtDhSQWHoZT4LzARuFUIOnIJO9N12oLe8B98QXmZpsAQl+X6ZyWAHzEVzo
FA9iyuCRKGPO/+Y1xn7NkD36WcZDNwRRC/ivE4AOh2yu2EFOdnMyykuDRTQvXyXr
2cPOjayOafmyPw6CNscHkmcWNYSkrKnbH3I2RfT867CNpXdLW5ed/XAio2s213H6
j2H/f4NboQ7kFi/SoHtqKvubMBTPb82zLUnoMyL21hof8XkuN2ZMFO8MnAMRBPgi
uCaJKHGZrq7QeXu6ClD50gRZ5Grv7gM9ZyQ8GotAcu/T534YsRYPmiajhmvsoxI6
//BC/Mu37IfrXA2y3jwbgPRMX1PGccEGdLzV9fY8gysiKCULzMfYMyQTBtE3Tw0L
FeJZcJiULr4jLZQCtG+Ia/KLZXFaRRnav4721Ai9HTfpOf8ZDDvpAnkCABgfhlTk
v9nSyVJcn++IUjV2pe4tmcemb36RY4WXQPQNWSqP8Yd+B6Ci5+2w3pxnecabiH/Z
qJ7yTVHAriLg8FoardjzGnjYL5PX4q3EZqwgfBwjYZDp52ySJXY=
=vZf3
-----END PGP SIGNATURE-----

--g77yriyayozscbdx--

--===============2067205127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2067205127==--
