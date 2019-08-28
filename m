Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D8A0ABE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 21:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0350E89E57;
	Wed, 28 Aug 2019 19:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F8F89E57;
 Wed, 28 Aug 2019 19:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4ggrToRbPoQgLF3SIHshZLP9b3sYe6Yj5h7XXIwqAKxTUdG5E8LjcO9mQRZLYmn/sDvbDLIyxJrdMHDgBbnSYqyAXqqJcSpQ4tItSF1kT63+YnSi79nWiDvy0L9qhstN4olIc+fYKQlWBPjmboLZnXjDaFjMF6v0iPloW4Og7yElRdLDKuidVGzDwYzUDlzzJjGai8M9SCXZ1h+s/aMNuwes70LUYQNFTdviRY6ryy4TdyWNBa+CACQc8AD6wNDgGHO3GtD4vFfZoV0Ng1VK8XFSce+iQN8N/TIkwFCh4ktUS97/YolHNhOYIV/OkvpZu+tB1C2amZZ1XEzzOvWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwNdl+UdxlfhJhC0O5W8lARDJDyOj4WZ5K4IE2NPbPs=;
 b=IgWV4lGppXPkwfzP6rN2ONgKKJiKpYGIhWSUEgGUyL+Gp0CJvEfm4QZRCYVuyjPNcjTMYJ6+5QWmd02JPq6iWXFadTcCR57gWwvBDyqR28KRClyVo+gDSUoPa+o8+VzWWsKZc6O4m6H852nuVNfF8fTCi7ECPYzNr0/bOLYps0AZ9tnmjK+Tcr6d855khC7RgvQw5Tkui/XSkhJ+VcWB9/phbgYrxDqkfyIEYwBusSvGsDo0Qh8KH2VtYLe5LdNXKPFQhlBOsESghl5oKPp57ip+rWFDnVuOAnxMyrE/KxD7LBw4Y7goIuMNUY1coZ0CC2mh3FlROCX6BOcLTkusTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com (10.172.75.146) by
 CY4PR1201MB0070.namprd12.prod.outlook.com (10.172.76.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 19:52:37 +0000
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335]) by CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335%5]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 19:52:37 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH V3] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V3] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVXdokkKgVCkf48k68itapbcTb5Q==
Date: Wed, 28 Aug 2019 19:52:37 +0000
Message-ID: <20190828195243.w6mq7gdv22ggums7@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To CY4PR1201MB0086.namprd12.prod.outlook.com
 (2603:10b6:910:17::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74f68709-a89e-49cf-67b4-08d72bf146c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0070; 
x-ms-traffictypediagnostic: CY4PR1201MB0070:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB007092143651EB221C59775A98A30@CY4PR1201MB0070.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(189003)(199004)(5660300002)(64756008)(2501003)(25786009)(7736002)(66066001)(305945005)(3846002)(476003)(66946007)(81156014)(81166006)(478600001)(66476007)(14454004)(316002)(99936001)(110136005)(54906003)(486006)(8676002)(6512007)(9686003)(71190400001)(66446008)(71200400001)(66556008)(86362001)(6506007)(66616009)(386003)(102836004)(1076003)(186003)(52116002)(14444005)(6116002)(6486002)(26005)(4326008)(99286004)(2906002)(256004)(8936002)(53936002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0070;
 H:CY4PR1201MB0086.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DBe0gN7pYW1qx/GU6cT95adHDavMGa/bfIgCEt8aGdPzJm2TQnEq7U+hiW53ia9aQ3tc5uRIYuAKtj9nWcBBHkfENkJgLO7Sfm/zzg3VFWJi/BYXOKrHB5UgOj+mhjm9xxDqLIM3IyZwMtpBLCD+bfLgd9L9Prj8QiC+8BWeJuemuKLB2cmkzyJspWMcQ1epcXHV2COuuTt7ThgkbgXBo8amoHSkdTqpjd30Veca2V9Xn4sLy6vzr/fZqM4n3Mw1ZlKtRn9yzxqqQNEuT6AL5y4FY03Yy7Zl4kXMkxD9IpjWW79UUz7mKNuSare+Go2Za1uQge9RQZQMv27TlI4wurkGnHmLQnOR7wTXpjH2ojX60ZUJGTreA6B73GItPU6lK0wBpbL+X/2hSus3EPopXeieKHVLgdEZCgzHo0HvO5w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f68709-a89e-49cf-67b4-08d72bf146c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 19:52:37.2057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HznV4/gfml+hfHT2CNb7o7W6jFG42r6Eg84hJmD9bqliYL+FkWF/5krdijVuuova665il3dkfRRgnYxCY3ERew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwNdl+UdxlfhJhC0O5W8lARDJDyOj4WZ5K4IE2NPbPs=;
 b=0fCFCnNhoS2Qi/HraSZ0aJOWGAhvYE/nkIRJNNapvFVmYh9LflgQvMxHh1q/tImvWcaWvhGIuwEYD++NFaLJuUUV6iCqoDmvbxt9h2c61e92hBP5ib9zvAelnT1rdOBFXB04qP/4oH8ECNk52YWRVsevYC4PmmA8YCaqBWuaXic=
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
 Abdoulaye" <Abdoulaye.Berthe@amd.com>
Content-Type: multipart/mixed; boundary="===============0258865218=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0258865218==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ro3nrwqvskbcp3f7"

--ro3nrwqvskbcp3f7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DP 1.4a specification defines Link Training Tunable PHY Repeater (LTTPR)
which is required to add support for systems with Thunderbolt or other
repeater devices.

Changes since V2:
- Drop the kernel-doc comment
- Reorder LTTPR according to register offset
Changes since V1:
- Adjusts registers names to be aligned with spec and the rest of the
  file
- Update spec comment from 1.4 to 1.4a

Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
---
 include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 8364502f92cf..67f9121d781d 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -989,6 +989,31 @@
 #define HDCP_2_2_DP_RXSTATUS_REAUTH_REQ(x)	((x) & BIT(3))
 #define HDCP_2_2_DP_RXSTATUS_LINK_FAILED(x)	((x) & BIT(4))
=20
+/* Link Training (LT)-tunable Physical Repeaters - DP 1.4a */
+#define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000
+#define DP_MAX_LINK_RATE_PHY_REPEATER                       0xf0001
+#define DP_PHY_REPEATER_CNT                                 0xf0002
+#define DP_PHY_REPEATER_MODE                                0xf0003
+#define DP_MAX_LANE_COUNT_PHY_REPEATER                      0xf0004
+#define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT               0xf0005
+#define DP_TRAINING_PATTERN_SET_PHY_REPEATER1               0xf0010
+#define DP_TRAINING_LANE0_SET_PHY_REPEATER1                 0xf0011
+#define DP_TRAINING_LANE1_SET_PHY_REPEATER1                 0xf0012
+#define DP_TRAINING_LANE2_SET_PHY_REPEATER1                 0xf0013
+#define DP_TRAINING_LANE3_SET_PHY_REPEATER1                 0xf0014
+#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1           0xf0020
+#define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1             0xf0021
+#define DP_LANE0_1_STATUS_PHY_REPEATER1                     0xf0030
+#define DP_LANE2_3_STATUS_PHY_REPEATER1                     0xf0031
+#define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1          0xf0032
+#define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1             0xf0033
+#define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1             0xf0034
+#define DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1           0xf0035
+#define DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1           0xf0037
+#define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1           0xf0039
+#define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1           0xf003b
+#define DP_FEC_STATUS_PHY_REPEATER1                         0xf0290
+
 /* DP 1.2 Sideband message defines */
 /* peer device type - DP 1.2a Table 2-92 */
 #define DP_PEER_DEVICE_NONE		0x0
--=20
2.23.0

--ro3nrwqvskbcp3f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1m24sACgkQWJzP/com
vP/aoA/+LGE7FyxEQduYBR2iPb2SJJr315jEKVeI3GMmMAVpxlMAQnKGIoy4Ygsb
IDi8k2rlq1TSmAhvNKpU4OOTli9CsW+UVjKXJPYMko5bE3CHSoAh3RI5gocQrDnU
pRvKBCw6wtkhS3v8qooIChLLjRXPAMpBRfym5m92wOFyGOQMruW/rMzA+ydRAE7H
AzkfjykWDQsRfGI304t1TI4TF0x9o8EeV8xogwMEVSMvC08GhwGau2I/Z5PSBKoP
FThyQZwkADnHP3IxmEgKGWo+SkPouqcm2ZZPFAAmIa+7S8lFkvZRetfbVzf2pcLJ
K2sp8XexE9YVNXw7Fp00r/mM3Fa928Tils5I2fsTQJGz06Bo6TIiNV7l2Gc65/SX
BKrZxffyKRhGEMYrG3S3Y8uW1UA2wWgwTm6ehfs72S0vAam9dGfSLdMg36/ha2nh
ZMd8sie3++832LpuGWQ/1E4etsqNVFwIRaZMRp51HfQIqbw4PsmnC1DSCEpqvr6U
VVx7eD0aGhhnITZnLbLQ4XK3OTE+p1xf8HTdNS6lwXw9x4SC0PU8oQ/pPM/LbJU5
cviU8YtY10PTCI3GTHcXpzbiOsDR69FKrIHZQCOYyu4rzXP0ZbG/Mqt4bTRP/hoO
0GBtBuTZiRwDmH0aVnkh3fASTb2K0nWTWOrorvqMNt+Kh06K13A=
=JOmb
-----END PGP SIGNATURE-----

--ro3nrwqvskbcp3f7--

--===============0258865218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0258865218==--
