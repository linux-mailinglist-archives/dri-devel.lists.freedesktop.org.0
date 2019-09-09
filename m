Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE44AE03E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 23:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C98889E3B;
	Mon,  9 Sep 2019 21:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1716D89E1B;
 Mon,  9 Sep 2019 21:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXKPI0t9d8Q5Q7c1zJWdT+nTCKjuM9EdnsdcemBy/Og/A8LD8zqZoy6eCwTv66BPvs/TeKgHxOBOLvPooBpI2sbfwziKwjrsJqLNFonkZoXc6xke5ngP4Zf8id3JHznlCeUcf5lFhRUWT+L0WBONvuTP2MtvY2zxhZr9GUtV+0JVn/bNZN/AwnSB05WMYkfbqG34KeccgkK861Ou6b23GWBCctG8qN2YgTguZfhruJhXeuBzfqE4bbw4n+IALT1tEjwu3bjFar1TMfn7Ed8i/qcrSlOuveY4uVX+J71UjQwSimXM0OngqJRXWIMzftlmAq1Vu+5xnb9+lCnwU5WItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Ut7XcpjkYIWQn7lNstRjdmLu/iHnHgEomCHb/N4wg=;
 b=A+BceFkY2Ko+nhxJUZ2zTwYLNI36ou5Fq80KzdVRVIVYsTFEgspXXw0jLJyLTNhab5ROMZ6pBxqir1IcTs84BGSlEbwfHsCWACy7XkRJjERYFRiSrZjipHcE5ftBbc/kta7pghAQfgOZHNHH4GRhkiqXRMGY1BQhykmplOlN5Gaz4ZEFccAa1NlWU0irFt9tHhdzVwm0pT9T3r3bvE3G9bQrad+o6NbxzGimNur9oeEANuHUGSqpD1GdkS2O3c/fVWidIi4/B1aQU6UpMmcYi/KGL3lA+nXrQtoMw5z9Rqgbfrp4Xvt/J6SsZzIk7agao10zSefiN5rvdU4lmh7z6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (20.178.198.25) by
 DM6PR12MB3946.namprd12.prod.outlook.com (10.255.174.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 21:21:47 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::91c9:3101:2151:88]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::91c9:3101:2151:88%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 21:21:47 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH V5] drm: Add link training repeaters addresses
Thread-Topic: [PATCH V5] drm: Add link training repeaters addresses
Thread-Index: AQHVZ1SWi9o1oavDy0i5wabsgP0RQA==
Date: Mon, 9 Sep 2019 21:21:47 +0000
Message-ID: <20190909212144.deeomlsqihwg4l3y@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be95cd42-28c5-4c75-d011-08d7356bb89d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:DM6PR12MB3946; 
x-ms-traffictypediagnostic: DM6PR12MB3946:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3946D64B8519D333C31849ED98B70@DM6PR12MB3946.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(14444005)(54906003)(316002)(478600001)(7736002)(386003)(6506007)(305945005)(110136005)(186003)(256004)(1076003)(66574012)(4326008)(99286004)(3846002)(8676002)(2906002)(6512007)(81166006)(9686003)(52116002)(53936002)(8936002)(81156014)(66446008)(64756008)(66556008)(66476007)(66616009)(2501003)(66946007)(86362001)(6436002)(6116002)(71190400001)(71200400001)(6486002)(5660300002)(486006)(102836004)(25786009)(26005)(476003)(66066001)(99936001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3946;
 H:DM6PR12MB3370.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fj58LfUosg+cjnWO9nRFZmxZOzZjTHXbl1+OwsPcuEFPjSrpoaeP93EdSLb2j/UU31L7f+4pkbeHShZIDZf4cL9R1suaIxtvxzwKWbG3p2BGWzP4e23GwGBjoCebwD7mn+/Y2G0s4sB1zi0avQyXow5O35E3GWrPFg0d3eSxO26bwPHo0gy2pxRVulRnYdR+vidDPSPSaVx4TjMVqMHRwWQCfz+4Rvnke1PLYMl+1o6D1FdkVClryxZ94XRheqnJ5S3fwo7HQ6hfTOVf+0qBuGdweWAaAvMrdcXZ+NEWWAKTS6WrYu/5FBRPC60Xugm2YuNeoYLOEBCbMMpabLYSkKIE+4vjqS/R420kE2WorZw87/qeRcx5sCm8p875fCe2vjT2ymp78o73RNv9E3x7tyu6hsXkIFPA9AEKG5o7iP0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be95cd42-28c5-4c75-d011-08d7356bb89d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 21:21:47.3376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0eFb2Q34/3f6SH9DwRbDFP0WdbeAc/ZdhIIwJHRpYiejLxt4HgmdMnD7HTOR+p3wfQDLix3eH3q19/c1otDUzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3946
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Ut7XcpjkYIWQn7lNstRjdmLu/iHnHgEomCHb/N4wg=;
 b=mEHb99dO8iMOz843pxW0aG9CQh8xH+QE1Y5Q1kI87x0qhvsIIgPjebjSbEPi3+xlH1faiugwelOH2mzuM1KeYaIFk06Gk6g/YUeGmQHbzMMvWxXQXXiW06snF1GKj15bD/qu22tICa86AUJZhf7bcOPlJBWhLlgYoLnanemAoUA=
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
Content-Type: multipart/mixed; boundary="===============1691180383=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1691180383==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtwh2agsnzqxqrsu"

--vtwh2agsnzqxqrsu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DP 1.3 specification introduces the Link Training-tunable PHY Repeater,
and DP 1.4* supplemented it with new features. In the 1.4a spec, it was
introduced some innovations to make handy to add support for systems
with Thunderbolt or other repeater devices.

It is important to highlight that DP specification had some updates from
1.3 through 1.4a. In particular, DP 1.4 defines Repeater_FEC_CAPABILITY
at the address 0xf0004, and DP 1.4a redefined the address 0xf0004 to
DP_MAX_LANE_COUNT_PHY_REPEATER.

Changes since V4:
- Update commit message
- Fix misleading comments related to the spec version
Changes since V3:
- Replace spaces by tabs
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
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
---
 include/drm/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 7972b925a952..fddcd84601f8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -966,6 +966,32 @@
 #define DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET	0x69494
 #define DP_HDCP_2_2_REG_DBG_OFFSET		0x69518
=20
+/* Link Training (LT)-tunable PHY Repeaters */
+#define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000 /* 1.3=
 */
+#define DP_MAX_LINK_RATE_PHY_REPEATER			    0xf0001 /* 1.4a */
+#define DP_PHY_REPEATER_CNT				    0xf0002 /* 1.3 */
+#define DP_PHY_REPEATER_MODE				    0xf0003 /* 1.3 */
+#define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /* 1.4a */
+#define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
+#define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /* 1.4a */
+#define DP_TRAINING_PATTERN_SET_PHY_REPEATER1		    0xf0010 /* 1.3 */
+#define DP_TRAINING_LANE0_SET_PHY_REPEATER1		    0xf0011 /* 1.3 */
+#define DP_TRAINING_LANE1_SET_PHY_REPEATER1		    0xf0012 /* 1.3 */
+#define DP_TRAINING_LANE2_SET_PHY_REPEATER1		    0xf0013 /* 1.3 */
+#define DP_TRAINING_LANE3_SET_PHY_REPEATER1		    0xf0014 /* 1.3 */
+#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1	    0xf0020 /* 1.4a */
+#define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1		    0xf0021 /* 1.4a */
+#define DP_LANE0_1_STATUS_PHY_REPEATER1			    0xf0030 /* 1.3 */
+#define DP_LANE2_3_STATUS_PHY_REPEATER1			    0xf0031 /* 1.3 */
+#define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1	    0xf0032 /* 1.3 */
+#define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1		    0xf0033 /* 1.3 */
+#define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1		    0xf0034 /* 1.3 */
+#define DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1	    0xf0035 /* 1.3 */
+#define DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1	    0xf0037 /* 1.3 */
+#define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1	    0xf0039 /* 1.3 */
+#define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1	    0xf003b /* 1.3 */
+#define DP_FEC_STATUS_PHY_REPEATER1			    0xf0290 /* 1.4 */
+
 /* DP HDCP message start offsets in DPCD address space */
 #define DP_HDCP_2_2_AKE_INIT_OFFSET		DP_HDCP_2_2_REG_RTX_OFFSET
 #define DP_HDCP_2_2_AKE_SEND_CERT_OFFSET	DP_HDCP_2_2_REG_CERT_RX_OFFSET
--=20
2.23.0

--vtwh2agsnzqxqrsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl12wmgACgkQWJzP/com
vP+9+BAAzKClvJnIEjwkJgu53Fy8h79hXaH+6kBSa27PUDMRlZcXNw9TpZB0lC3m
2N86P6ZME92weGZ6fksyaVnaskGcm4Lj+CncKXx/FxkBDl0pXECFAWqJWrxHwE7B
dqUBjfuBfpdES1f4FvtHpOMJ7NBAswsXgZ6E0Sq9lrH+oGHodlGLX6VTfj8j3aLa
hg2dySOn5p5YRGRmHN6Y/1cr2whLWfkECNLPIy7ZBKAFN+GhgHrRDt8cxs0hnHNQ
CoAqVM+AlhP7wealasg9/UtQpNNSpVJFdGEVuOI/w7pIGbJlXpt0vO9tDC662DyR
nt5s5W88Y5xGarnCPpwSLAyoHCtZZX8bzHZCDTmG8URkxh1dQWoUwHZSAxp/bV/9
fA73z7rbKC9iBV6G/veu5biOQwQvuF96QpESpr/E4k5WeDYlfs31RvAYYMpyA15Q
ELEST70hbyNG+bEY3OQ9QKXZ5POimafgMQqK78IfmQ5THCCB8aADr4iPk1qzTpyS
VgoanbxRJBd2Ja28Kdxvdn0FJjvgQD3FyBjtdhLvA5NEkZw+Ub7Y7XpNDunPmNfL
LQzqgptyFtDNHYK3Bx1FP0/Ht0V8aPr7SNuHg3Zubrs7aLEkhU+8jQY0TvTqoqwG
NUZhHxcFogltXGQ6hCKkp9XGRrfrd++0S54V2yvXF/KSWnbf1is=
=g5Dr
-----END PGP SIGNATURE-----

--vtwh2agsnzqxqrsu--

--===============1691180383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1691180383==--
