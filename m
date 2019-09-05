Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A923DAAC72
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 21:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A112A89EB7;
	Thu,  5 Sep 2019 19:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816A589D67;
 Thu,  5 Sep 2019 19:52:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQRUwf5RnKys3/Vls41tgCk+VOl9tvYjD0kxDwywiPsnCXDvvlxaJ2ep+F6e/NwX61+amDtl8pZeY/r79dIgpVOGAXZ4QOqhP53Z+7rDx6FVE7e+uKoZukJjE4+wA2jtS4PIywdpeXKQRCtBxQiT4gxXX+yCfii0rgpmYbUjKucc334T8hRv9MlYlaFdXrP/T+ZQpQ1EmFfusiTqqgDZZAhwHm7uU84jmcTbSqCedMbASgAy2CxY/eBuuCQgEiO2qZ62N9PLx0dq7M0m3ZRnjjQFn1i/DyoZvI547SsCIhoKRp5nJUanGt5mABV4W88udHJ/XjvsRQpfji5H54OLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHgZgsBAhOdgwUNv/5kJdHmokIMGbPlIwHlBGUFCcgw=;
 b=lIRencO9LDkbNr+yIBcA/uJO6jB2PeFpgC3z8+H3U4ozHDpTmOUckRsHRJsVsjo6DCHqzZhY5PHGi8CG6xKXPInmnlEvRT3oaloiBJ8znBvYS/efCgJ8raQS0J8GvQlLdTE4g/+pfbOB+mLnHHMCr8R+7GhXcHnWxF05k9EHu9Wp4/Rp3kEUKR2eInIDDyTqDG/QnQ0l/3iPsnLhv3/XvYF/Jtwwn7YYkDsbIolX5S0Av3xTctgJPgE/w8UwMxRP5+nN/HPTHBdqYdmhTqTCmALPhhpgxB78RWazQsLv29u67bhl+YlNh7R0jjSLro3Ar9F9esrEhJR82Nhh1uA8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com (10.172.75.146) by
 CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Thu, 5 Sep 2019 19:51:59 +0000
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::61a0:fba:8c7e:7edc]) by CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::61a0:fba:8c7e:7edc%12]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 19:51:59 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVY1NGou2ILAGT/Euu5mgRcB5bcacdWDkAgAAEWoCAACOEAA==
Date: Thu, 5 Sep 2019 19:51:59 +0000
Message-ID: <20190905195156.3jay646drmdrw7bi@outlook.office365.com>
References: <20190904190116.klyt2rjg3svswmot@outlook.office365.com>
 <20190905172914.GN7482@intel.com>
 <bc61a7de-2183-cb28-65e0-3b7545fb556b@amd.com>
In-Reply-To: <bc61a7de-2183-cb28-65e0-3b7545fb556b@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::15) To CY4PR1201MB0086.namprd12.prod.outlook.com
 (2603:10b6:910:17::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c125093-c6bb-4fc3-fd9b-08d7323a833a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0102; 
x-ms-traffictypediagnostic: CY4PR1201MB0102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0102C6F3796C4E8FA4F916C098BB0@CY4PR1201MB0102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(199004)(189003)(186003)(6916009)(102836004)(54906003)(6506007)(386003)(6116002)(26005)(3846002)(53546011)(316002)(5660300002)(229853002)(6486002)(66574012)(1076003)(76176011)(71190400001)(99936001)(71200400001)(446003)(256004)(14444005)(52116002)(305945005)(7736002)(66066001)(486006)(11346002)(8936002)(2906002)(81166006)(8676002)(86362001)(81156014)(476003)(14454004)(4326008)(478600001)(966005)(6246003)(25786009)(99286004)(53936002)(6436002)(6512007)(6306002)(9686003)(66446008)(64756008)(66556008)(66476007)(66616009)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0102;
 H:CY4PR1201MB0086.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k7FJ5UUhUmQ+O/ka7zrASOrkcyhna7SHQ0vMsQnahWgCAoaNG4rQ+f0qq5DRiYx9pa9hzyGKGT2hQRBJV+TANAXLU18HH3y6DpP4RdAuy6OROge/lV8+BBNgpMr6JTVnnd6ZGnoI+yHmoVcIeg7Jfzdsbktc7VQfnPJGgJsNNsEd0DQ1jUe+F8dpUXAvRM0T6AcIA4xQ9gs+fgF5tN5fc60woWGD8kJOuY7aFsR4wi5d+xoc6daytC51LYkELwN30rmpaVfFKz3sNse7AkCXIt1b4wpc2m7X9NIBpWaZLjvbdWHgshDLsivF8o1q49wV+EWEsT1drYh7nbbuPn/lnpoyEehnMHJ08V+7JxB4aNyF/2ZgI7bTs3K6GVrqnGlc24r/6EDvDU1/rlkzVRHx/KFp7lQvlWaoTUb0CqNZ7iA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c125093-c6bb-4fc3-fd9b-08d7323a833a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 19:51:59.0606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uekB9E1tC9wfRXjyEAds6Aj0qBmP+p5Y1sb/LqVbYe9k5CJGpmn14BveVsxLDbDd+X9yqIAg99jZr0iTx2VMZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHgZgsBAhOdgwUNv/5kJdHmokIMGbPlIwHlBGUFCcgw=;
 b=MNrgwf4ZDLcTym8mGIfOuNel48aOLyqqdbz0zKisH+pTjioP7RwvJ8igXGkSVlBCH3oB12mEv2fy3kespfP6h9aTCV5uMGrDlS+O7bFY/PQXbNaUwRX84K6/5emi2aJQ1RPuCaD8iqA9GOAbtR6Ot0etP/VzwSJhvT6ePvGNm6A=
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
 Manasi Navare <manasi.d.navare@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1710988286=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1710988286==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="niwzws3k25bof2su"

--niwzws3k25bof2su
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

First of all, thank you very much for the review.

I added some comments below.

On 09/05, Wentland, Harry wrote:
> On 2019-09-05 1:29 p.m., Ville Syrj=E4l=E4 wrote:
> > On Wed, Sep 04, 2019 at 07:02:18PM +0000, Siqueira, Rodrigo wrote:
> >> DP 1.4a specification defines Link Training Tunable PHY Repeater (LTTP=
R)
> >=20
> > A bunch of this stuff was already in DP 1.3 so the statement here
> > (and in the comment) is a bit misleading.
> >=20
> > "LTTPR" is not a name that appears anywhere in the spec AFAICS, so
> > calling it that is a bit confusing.
> >=20

We are using "VESA DisplayPort (DP) Standard 1.4a" as a reference. We
double-checked the specification, and we found many occurrences of
LTTPR.

> >> which is required to add support for systems with Thunderbolt or other
> >> repeater devices.
> >=20
> > "required" seems a bit strong. IIRC by default these things should be in
> > transparent mode so the DPTX can remain blissfully unaware of their
> > presence.
> >=20

Just for adding some extra information:

LTTPR can work in two modes: non-transparent and transparent. In the
non-transparent mode we need to train each repeater in the link which
brings the benefit of better signal quality in contrast to the
transparent mode.
=20
> That's the idea but in reality things usually don't work out like this.
> I remember a couple years back debugging Thunderbolt and having it
> modify DPCD register reads on me and messing up link training with
> certain receivers.
>=20
> Either way, we've found that in order to receive a reliable
> implementation we need to make use of the LTTPR functionality.
>=20
> >>
> >> Changes since V3:
> >> - Replace spaces by tabs
> >> Changes since V2:
> >> - Drop the kernel-doc comment
> >> - Reorder LTTPR according to register offset
> >> Changes since V1:
> >> - Adjusts registers names to be aligned with spec and the rest of the
> >>   file
> >> - Update spec comment from 1.4 to 1.4a
> >>
> >> Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Leo Li <sunpeng.li@amd.com>
> >> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> Cc: Manasi Navare <manasi.d.navare@intel.com>
> >> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >> Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> >> Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
> >> ---
> >>  include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >>
> >> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> >> index 8364502f92cf..5abed96a1cb1 100644
> >> --- a/include/drm/drm_dp_helper.h
> >> +++ b/include/drm/drm_dp_helper.h
> >> @@ -966,6 +966,31 @@
> >>  #define DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET	0x69494
> >>  #define DP_HDCP_2_2_REG_DBG_OFFSET		0x69518
> >> =20
> >> +/* Link Training (LT)-tunable Physical Repeaters - DP 1.4a */
> >=20
> > s/Physical/PHY/ to match the spec.
> >=20
> >> +#define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV	0xf0000
> >> +#define DP_MAX_LINK_RATE_PHY_REPEATER				0xf0001
> >> +#define DP_PHY_REPEATER_CNT					0xf0002
> >> +#define DP_PHY_REPEATER_MODE					0xf0003
> >> +#define DP_MAX_LANE_COUNT_PHY_REPEATER				0xf0004
> >> +#define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT			0xf0005
> >=20
> > The last two are DP 1.4a it seems.
> >=20
> > 0xf0004 was called Repeater_FEC_CAPABILITY in 1.4. But the spec doesn't
> > say anything about the DPCD revision so I have no idea how you're
> > supposed to decide which definition to use.
> >=20
> > DP 1.4a seems to have added FEC_CAPABILITY_PHY_REPEATER1 at 0xf0294.
> > To replace the 1.4 Repeater_FEC_CAPABILITY I suppose.
> >=20

Touch=E9! :)
Really good point, we have to check it.

For the next version, I'll add comments for showing if an address came
=66rom 1.4 or 1.4a. I'll also apply the other suggestions.

Thank you again!
=20
> This part confused me when I saw it in 1.4 and 1.4a. It's probably
> safest to go with the 1.4a definition.
>=20
> >> +#define DP_TRAINING_PATTERN_SET_PHY_REPEATER1			0xf0010
> >> +#define DP_TRAINING_LANE0_SET_PHY_REPEATER1			0xf0011
> >> +#define DP_TRAINING_LANE1_SET_PHY_REPEATER1			0xf0012
> >> +#define DP_TRAINING_LANE2_SET_PHY_REPEATER1			0xf0013
> >> +#define DP_TRAINING_LANE3_SET_PHY_REPEATER1			0xf0014
> >> +#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1		0xf0020
> >> +#define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1			0xf0021
> >=20
> > Above two are DP 1.4a.
> >=20
> >> +#define DP_LANE0_1_STATUS_PHY_REPEATER1				0xf0030
> >> +#define DP_LANE2_3_STATUS_PHY_REPEATER1				0xf0031
> >> +#define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1		0xf0032
> >> +#define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1			0xf0033
> >> +#define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1			0xf0034
> >> +#define DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1		0xf0035
> >> +#define DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1		0xf0037
> >> +#define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1		0xf0039
> >> +#define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1		0xf003b
> >> +#define DP_FEC_STATUS_PHY_REPEATER1				0xf0290
> >=20
> > This seems to have appared in DP 1.4.
> >=20
> > You skipped quite a few registers here. I guess those were deemed not
> > important?
> >=20
>=20
> They won't be used by us at the moment.
>=20
> Harry
>=20
> >> +
> >>  /* DP HDCP message start offsets in DPCD address space */
> >>  #define DP_HDCP_2_2_AKE_INIT_OFFSET		DP_HDCP_2_2_REG_RTX_OFFSET
> >>  #define DP_HDCP_2_2_AKE_SEND_CERT_OFFSET	DP_HDCP_2_2_REG_CERT_RX_OFFS=
ET
> >> --=20
> >> 2.23.0
> >=20
> >=20
> >=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--niwzws3k25bof2su
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1xZ1sACgkQWJzP/com
vP9tEBAAtYwf4CW6nME6v76pVrJawoFVPMzJ+J+yM8BTmQ6BWPRcTXJdY/+KXoc6
5OLaCdKLkqdu0DIypKmzwGks2+l1QAeAj48EKGtr6Uxr0iz45QShX/lJN4YYt+FR
+cN5XnrMlPygn7rORRfx8PD7R1x2jFui87tT4Oh0J60E9OCeYDamcmfAj0el9tLW
dkoByR4FL6DDnCXzDbXoCknjmspxE449PsiykpntK3EVNgdJZIQv/SvW3ymRlY+F
wyrxccJ7nGldgKyOpXDKuGdJNFTFqwfZBQli5gDKzzciLcJqhsBOUkMdzHwJ/gKw
ypz+kNyGUJ67Kr0aPub0NxkBjWkQuSjs0tJMLcVabQA0TS5Q2f9G9ugb/Yto46mN
hQXDc1O7kE6lCjk8Jaz56DP1CngvfDZDxZEsKmkV1fhE+Wwwa/WlrMaqNSRUN1hn
28Yd/enL/zyqu23X99ewI5vXK+zOyQnGNHD5rgKneFpzPAXNRaRAq/gwu91zflfh
CSizMpcIBgLSWk0cQqIx9MVFqi+ojxfTpCuYR8hOJbVSW9ttNRWO+jqgwTa5jry+
VbxN8Gm8DkTJJy/mzaUOAwVLjnZ1V2PhXpjbVS37wbefEfu1TS8aG4PH4Y8NEzhN
JVAqRWqmOc/mTRA+1IMILA9E7GsLaLzqTed9lnj0FEHGujUr0HY=
=iTBu
-----END PGP SIGNATURE-----

--niwzws3k25bof2su--

--===============1710988286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1710988286==--
