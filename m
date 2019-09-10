Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73188AE1BA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 02:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A37089CC9;
	Tue, 10 Sep 2019 00:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730046.outbound.protection.outlook.com [40.107.73.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4176C89CC1;
 Tue, 10 Sep 2019 00:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ9+5QG6UW+nFmwpt7HlYG7JtxMTauG2DcO/mMhjouCaONpPD4bvapUNMg15dQV0g4ov3v+VS1KRcQZPSM3ttGpUjdjBNytoeyMv1MwNlDWb+L40zAeFZsUfhV0x3NyucMYYX7eQPHbqORRSMj6rIa4v2Vy6dOXnGorpnpnRDtt3Ovz/MbPGLD91H6HBuAoJ7WHU3dRkSgn4WjaKfi6NH+gVtRKSUMp1tXNq4U/KGIKqINKhYbbsERhayiZK/cw6rEReMFZeejFic3w7/idK7eNxMTvSQlPS2U3105BovKDObSeQ01G+1FuutLNx5sV8lJuIZLZUnEsMYjgS6g/pWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZObGVbG5A12UnIoj2z42P5YDfpPZb84egxb5ass681g=;
 b=cuTj+DUDt/L3OecWqq5wu+7cpYUC6FiqR9Hrd/26rJtDRkSVelcFX3aposSFERH7K19JeJIUG3iKgYz6BJrIc3vi8h02sJ2tQe7TXmlN/8/SGFSjQuWtUppBTwUqu9KdwY+aY9dpyD/GRS2iumHz5dgHx7QoW1spTYGmNntqhZ5SWge4Qr5gFO/yZKlLhoqWbeUknL3HdEZKSEXDRLi9dg4qJ6WZYLXxKHH1d7/Fl/C2vFOMt8NyZr7Tp4IFWJ6Mh39VoiAmZu0s+Urn2GlpSBO6YgACCSFuh1pG8AUfeVuhg+6nLWaN361pzTYUyf+WlSMM5P5Jh+68reBxpitJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (20.178.198.25) by
 DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.19; Tue, 10 Sep 2019 00:55:50 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::91c9:3101:2151:88]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::91c9:3101:2151:88%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 00:55:50 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH V5] drm: Add link training repeaters addresses
Thread-Topic: [PATCH V5] drm: Add link training repeaters addresses
Thread-Index: AQHVZ1SWi9o1oavDy0i5wabsgP0RQKckFk4A
Date: Tue, 10 Sep 2019 00:55:50 +0000
Message-ID: <20190910005548.kkls6su27bamyn3c@outlook.office365.com>
References: <20190909212144.deeomlsqihwg4l3y@outlook.office365.com>
In-Reply-To: <20190909212144.deeomlsqihwg4l3y@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90c2bc8e-e038-43d4-96a2-08d735899f96
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:DM6PR12MB3305; 
x-ms-traffictypediagnostic: DM6PR12MB3305:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB33056172A9143CDB0BEADF8A98B60@DM6PR12MB3305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(199004)(99936001)(26005)(2906002)(102836004)(66574012)(1076003)(11346002)(446003)(6512007)(9686003)(6436002)(4326008)(6306002)(25786009)(53936002)(66446008)(7736002)(305945005)(6246003)(486006)(5660300002)(6506007)(386003)(71190400001)(14444005)(476003)(14454004)(966005)(76176011)(66946007)(2501003)(6116002)(3846002)(71200400001)(256004)(186003)(86362001)(316002)(99286004)(52116002)(54906003)(110136005)(6486002)(229853002)(66616009)(478600001)(8936002)(81166006)(64756008)(66556008)(66476007)(81156014)(8676002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3305;
 H:DM6PR12MB3370.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lP3AimbniFB/hZM5j7CGw5pe0bpqihNHlReiceItD+W3dgFdUfxhHiaF8hXKNmnSk3WDp2zrCixSa/rBiT95ZkPYnDyMzT2q0n7oNG+RRMnt6rLRwZ58pM/Q0Mlj9W1txnMXj+AraXouJe7L9D+Tu6Jycf0IIp8b76C2+vbVh/8msXD6xjS0WXLkRilPWpYOxELGo5tyAmYstsnFFK19dLXMAGj3tFvcBeroj+zjpdqmojbGrLMC0NXwZygvFlQPMynzusyGbwbwZ68BvLDjpL2SxcEHhWoKM9zOgx1JG1jbimKAWyAk0Eny9UEIX1kop1qpL3HaBJUw2dkNYUUgOWnKrNJJshzZn6jk2OAZu/CiwsyNRXldBD/44HUPjbfueOkQ+dJlinz5q88ER+2fnSK4Omg3VSaa/DvXlFVMbEo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c2bc8e-e038-43d4-96a2-08d735899f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 00:55:50.3760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NERGXZAfe2ruf9bXyWIPk2h4WushH1w8g4wS1YQG0enxbQHM2cCc36xUcdFYwvl5+BSxnMNjzxjpQL7rH4bJEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZObGVbG5A12UnIoj2z42P5YDfpPZb84egxb5ass681g=;
 b=YfJiKBd9An/R+ANmyBpVfvzIP5PzxcvP/NDBuYM1YAYU8Yhqx6P2uUI6UhgSYZScyul7GanO9ffYLIiY2XLU/xi/mSKTjZG4AxihUkVQePIdvoU5j0vCLV6peqFrSWK8a60yHGAlFJNdLUk8Ih26BtpRaPgbRW22RpHCbv648Ys=
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
 Manasi Navare <manasi.d.navare@intel.com>
Content-Type: multipart/mixed; boundary="===============1636903860=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1636903860==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isr5gai32t3vxiat"

--isr5gai32t3vxiat
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please, ignore this patch.

I just noticed that I sent the wrong version. I resend the correct patch
with the title:

[PATCH V5] drm: Add definitions for link training repeaters

Sorry for this mistake.

On 09/09, Siqueira, Rodrigo wrote:
> DP 1.3 specification introduces the Link Training-tunable PHY Repeater,
> and DP 1.4* supplemented it with new features. In the 1.4a spec, it was
> introduced some innovations to make handy to add support for systems
> with Thunderbolt or other repeater devices.
>=20
> It is important to highlight that DP specification had some updates from
> 1.3 through 1.4a. In particular, DP 1.4 defines Repeater_FEC_CAPABILITY
> at the address 0xf0004, and DP 1.4a redefined the address 0xf0004 to
> DP_MAX_LANE_COUNT_PHY_REPEATER.
>=20
> Changes since V4:
> - Update commit message
> - Fix misleading comments related to the spec version
> Changes since V3:
> - Replace spaces by tabs
> Changes since V2:
> - Drop the kernel-doc comment
> - Reorder LTTPR according to register offset
> Changes since V1:
> - Adjusts registers names to be aligned with spec and the rest of the
>   file
> - Update spec comment from 1.4 to 1.4a
>=20
> Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
> ---
>  include/drm/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 7972b925a952..fddcd84601f8 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -966,6 +966,32 @@
>  #define DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET	0x69494
>  #define DP_HDCP_2_2_REG_DBG_OFFSET		0x69518
> =20
> +/* Link Training (LT)-tunable PHY Repeaters */
> +#define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000 /* 1=
=2E3 */
> +#define DP_MAX_LINK_RATE_PHY_REPEATER			    0xf0001 /* 1.4a */
> +#define DP_PHY_REPEATER_CNT				    0xf0002 /* 1.3 */
> +#define DP_PHY_REPEATER_MODE				    0xf0003 /* 1.3 */
> +#define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /* 1.4a */
> +#define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
> +#define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /* 1.4a */
> +#define DP_TRAINING_PATTERN_SET_PHY_REPEATER1		    0xf0010 /* 1.3 */
> +#define DP_TRAINING_LANE0_SET_PHY_REPEATER1		    0xf0011 /* 1.3 */
> +#define DP_TRAINING_LANE1_SET_PHY_REPEATER1		    0xf0012 /* 1.3 */
> +#define DP_TRAINING_LANE2_SET_PHY_REPEATER1		    0xf0013 /* 1.3 */
> +#define DP_TRAINING_LANE3_SET_PHY_REPEATER1		    0xf0014 /* 1.3 */
> +#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1	    0xf0020 /* 1.4a */
> +#define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1		    0xf0021 /* 1.4a */
> +#define DP_LANE0_1_STATUS_PHY_REPEATER1			    0xf0030 /* 1.3 */
> +#define DP_LANE2_3_STATUS_PHY_REPEATER1			    0xf0031 /* 1.3 */
> +#define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1	    0xf0032 /* 1.3 */
> +#define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1		    0xf0033 /* 1.3 */
> +#define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1		    0xf0034 /* 1.3 */
> +#define DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1	    0xf0035 /* 1.3 */
> +#define DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1	    0xf0037 /* 1.3 */
> +#define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1	    0xf0039 /* 1.3 */
> +#define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1	    0xf003b /* 1.3 */
> +#define DP_FEC_STATUS_PHY_REPEATER1			    0xf0290 /* 1.4 */
> +
>  /* DP HDCP message start offsets in DPCD address space */
>  #define DP_HDCP_2_2_AKE_INIT_OFFSET		DP_HDCP_2_2_REG_RTX_OFFSET
>  #define DP_HDCP_2_2_AKE_SEND_CERT_OFFSET	DP_HDCP_2_2_REG_CERT_RX_OFFSET
> --=20
> 2.23.0



--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--isr5gai32t3vxiat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl129JQACgkQWJzP/com
vP/buRAAo3ZW5rzQaa5S3Kf411c3SvUAOHm1+4b5s9pvG3yYsyyRSGsw9le7W7fb
o2/FwCm8pvtzptK/Q14kNdYyn1cVkyYkhPoz7+8xsTQD+TCmZHwXAA5i4hBWigh0
feSUX5HG3nSqlZwz/A34Y10k5T3RRrahp9KOkWwnekU/rTngZNI41vvRF61p2zgV
mrWwmAYOG3So5jHLZeoO69kx0JiBGFpvN6okIYr/H8O8zsHZv1OJZvdjqrV6Ax+k
HZMYOIXORVYgUU1IjJAla8P1W3+BINLlKKjSWemlTtgpl5U8i7QZXsiWcX7ZLVzV
Gml0eoJFNj0cPqAfOG6Rv/4iHhLz9zTGzZ7mX5lWRFnDF9QvZvK+M73vTSzV+u50
QrOjnF0aFr9zNmRp2Ngj4ZK3invTy1hiAiCeeVtI0szNb03pzF2o7IjO4n2XBb1Y
r1O33rvosySAoCb6ItuSf8oSnG3LDvDI7liUaFCxoBwRNB5dKuxw8WOhe1aebHW9
oM+zd0ZrWQHYkrUiWwxk6oEcduYc7vn1pRa55Dwop9yyKO7P/wwCczbPzMYmrHc4
nzGOY407HgeKjujm1RissdAzCxDeYOXe0LKIMIYKks/wVWNI4F+0L4GEBLqwPJfh
H9yHE6VRMaHlmoGr8KPZLWJnqBUg4j6vUzsb5+JmoYqIBXJwtsA=
=cbwD
-----END PGP SIGNATURE-----

--isr5gai32t3vxiat--

--===============1636903860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1636903860==--
