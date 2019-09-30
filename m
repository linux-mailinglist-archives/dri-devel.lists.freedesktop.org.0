Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264AC2665
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 22:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8756E434;
	Mon, 30 Sep 2019 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800054.outbound.protection.outlook.com [40.107.80.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381816E429;
 Mon, 30 Sep 2019 20:09:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTgBsD0xb2KJyLa405p8z4pkWhE6Tzo+cPM9+wxU8hq4CO4JE8Ji8tn1XFtDkvPue/clihrfpTFA7Rih+eSkqiz3SOerwn8OBQzB7sV7K9jFSt1XK6LMJkdnXQa/t9dPfg4BznT2HIzS6RpLECxQvWlG8bOU3B9zxW/f+7xrYuyZMKDrA6UVzgeG/uTwdMFBYguNh5txFddvg7u3vf7Khvv0UqwMOtrhV/eT+YDLVHJa12qu/66kER3gYy541KgCtxJg+QvHbl7Ed00G34/vQBGw31lCcyZVTEOosCHxVsM943mIT9EISYVezLvYuDKZ437+U42E5UHYs6oIjd2KEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R1kP8VbvyyM3lWeVcPaNUzd7rGjD/a+qSCUhx/j7Cs=;
 b=Hd8Oba65bBoe32QS8EW97NM/EDXox2Brxe6y4bYDbcCzcN53LeD7slhlaFjZdR3xo8yd/OjvLwyhxPRNj6aTJ4KMaVHrRjCWH+Cbc/r0h3K2MxgAImsMTaDG8CFakJ6QXEb3CFN+d9sNlH/Ngi9MGhB3E1By0KPQ+FBT85WZsopGTLC+R9gbxcU7tlLXaDsiCJXcT2fnGNJjWe/zvNEHUdDVgCMvGDOIEBsFq772nGeDN7F4c0F1pQAfGVDYvCtO1ZSZradn1MwtMBLur13jx7Q2LzJuNmSCDPrMsFz8PTOx4vUBSIFVKJapRYC9iWV5BL4L8hHVoHDW2ErUAeqgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (20.178.198.25) by
 DM6PR12MB4219.namprd12.prod.outlook.com (10.141.185.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 20:09:13 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::88a6:9681:d4cd:51d2]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::88a6:9681:d4cd:51d2%6]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 20:09:13 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu: Initialize variable before use
Thread-Topic: [PATCH] drm/amdgpu: Initialize variable before use
Thread-Index: AQHVd8rt5AOkNlp/g0yZwjdHUDZVYQ==
Date: Mon, 30 Sep 2019 20:09:13 +0000
Message-ID: <20190930200902.inmjn264l6pxcdsq@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63f2d78a-ed67-4fbe-727b-08d745e2100a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB4219:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB421973F90D0C4FC0017E4FA698820@DM6PR12MB4219.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(54906003)(110136005)(14444005)(316002)(4326008)(256004)(8936002)(99936001)(486006)(1076003)(6436002)(6486002)(8676002)(81166006)(2201001)(9686003)(6512007)(81156014)(86362001)(14454004)(66616009)(186003)(71190400001)(66556008)(71200400001)(66476007)(64756008)(66446008)(2906002)(25786009)(52116002)(476003)(66946007)(305945005)(2501003)(5660300002)(66066001)(26005)(102836004)(99286004)(6116002)(3846002)(478600001)(386003)(6506007)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4219;
 H:DM6PR12MB3370.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wkuEPRKu8RC3vyQNbqy5bYXvJbDIfwHjnrLivXrSMcrRoLgs9KrjbfQUwWd+S2n0EQA+yIsK83hK8XyWmtPykomRqkPfAnyPeVGI56jr2RIcpXEJ11Kt/AqF8H3OeQFtLDgeKlM/r6J9UIQOT5NuVXZOZXk2tU+c6zM2rZAGYMPUkW6fJAm13uxTPcrjyOU09LlKPOMo3atosmlOdI4Plx3zAOrNxrn8ERHf3k3nWPfszwoEOcfldm62wpujhhCDIjMzdlC6uIQJj9pYkQX0agVayA/mPPUIiTizjj3YBhtXiEBJT5rloDXfjYCmviutr3T1jesmDGpmcDQqTMRgHrkroTeAHhqBsf72neTYYyjwranHj/JaITyWyV/r990JhVdWFxj/RuQczjFrk0z+3hVoSUpE2JIjqr30PE1CSzQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f2d78a-ed67-4fbe-727b-08d745e2100a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 20:09:13.3658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h12ix/UG6JnyD15TVNkhWxUCr0QEBqiiLvwFNgMvujZIQlpfjMe65NW6B/cx5q5j/ns8XB8ILWujhmpaGi07dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R1kP8VbvyyM3lWeVcPaNUzd7rGjD/a+qSCUhx/j7Cs=;
 b=M5USCmF2c3YeAxVRvB2M98uYZWv9o37WDloCWZVkY5ZJEqO9A/pu3Mobi7qXdKUvx70fMuEZNnJr3l1l1RM3Mh0RWfYy5xWgYUkJdupmLD0lYM8U/2tvYeTE+fl07C96IxczgBdla2qe+HOewrhtys1P2/tKx5VRS/Agghtm+Mk=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0268369342=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0268369342==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="txxk4cquvzk7uxl3"

--txxk4cquvzk7uxl3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The 'debug_data' variable gets printed in debug statements without a
prior initialization in the function
hubbub1_verify_allow_pstate_change_high, as reported when building with
gcc 9.1.0:

warning: =E2=80=98debug_data=E2=80=99 may be used uninitialized in this fun=
ction [-Wmaybe-uninitialized]
  290 |  printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
      |  ^~~~~~
dc/dcn10/dcn10_hubbub.c:134:15: note: =E2=80=98debug_data=E2=80=99 was decl=
ared here
  134 |  unsigned int debug_data;

Note that initialize debug_data with 0, in this case, is safe because we
have a loop in a few lines below that will initialize this variable with
the proper value.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c b/drivers/=
gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
index a780057e2dbc..b6967a7e6c7b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
@@ -133,7 +133,7 @@ bool hubbub1_verify_allow_pstate_change_high(
 	static unsigned int max_sampled_pstate_wait_us; /* data collection */
 	static bool forced_pstate_allow; /* help with revert wa */
=20
-	unsigned int debug_data;
+	unsigned int debug_data =3D 0;
 	unsigned int i;
=20
 	if (forced_pstate_allow) {
--=20
2.23.0

--txxk4cquvzk7uxl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2SYN4ACgkQWJzP/com
vP+ZZw//TKZ68EVv0YJGu9G+5mCRQGjtH1CmeD85MF3RHxVMdiHJun2AFJkz38aH
slGNn0FclGf7r9y7iYvI7yDwlBRBS3g+Dj/pkk9zfUZ2XpiEP02LrZiSEyVv9zF+
Y7NKhHp7nYMGwAVytlpRYglH20BlvthMGE9Rt42GTmdFDY8LYeTB/5J6Nl6R+/EZ
4uhOPTwcRffUK7TNqsBIuqnSUbrBt1ekpgm4baJeUKsPzx26q6bPO42AsX2JJhdJ
58TPbsN/8WvHfHdx/vL0/cJ9+aD6YeDhfTEm+nYJ42OIVcUmLEJqOA5Y54EWTPg7
yDA3KCNhnVNMXl00DDj9LyADEm8jMBniN729Arp01S9Ak6Aiw5xrpauEvyXScr4S
1uy+PpInyvDNcHT0i1GGRRycVvbCzQHCd4YYxL3TxCgemUIA9Wzj2vLw1UhZKp+s
gTDuAbghFwW9Nn+w3AXP1NT+VvBmP7FGNdEL7Q6Q1MN1X5w7Dy1oPz+wANeBPN71
ChGp6vF+9TLjCyx/u0Y3Hu+nnKlLDpnlPaVtUC31NhsgkbDgpJA5sHCSQVJjrKTy
cVKcGjpVBcSd0dzppxvhX9tShBcjnvvDjIuNLaxDFenla/aeubQt9GLiPMeAOxCu
Bv+g6gD9cRatgMWFEBc1VjZwlu0679U8Q+X07X2YrZtmdwv5aDo=
=oORu
-----END PGP SIGNATURE-----

--txxk4cquvzk7uxl3--

--===============0268369342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0268369342==--
