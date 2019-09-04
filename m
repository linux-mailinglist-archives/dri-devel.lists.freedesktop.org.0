Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF6A875F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 21:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9776289C33;
	Wed,  4 Sep 2019 19:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700088.outbound.protection.outlook.com [40.107.70.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0357D89A7A;
 Wed,  4 Sep 2019 19:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Prle6nyWzyb/YzHXa03Z6ZwKn1kB1EW+S4Ho/nq1dWFi6NyeqIqNq5mC5fsRvZOwLQG51O5WA+8kWQRYRBIrj/lOfKuh+do8k8PGhy02M73sD+jma/dR/Sw5N264t/GfZP/zLSZ6RWk0JD5kiNuKAX+tbj2mP8Kc2lD0P4iMFh49MJtt1oMBKea4aDevYok/bNLTj21R+4zZu+eXMPfUOjlWsrEdjFS+v2yiVx7lFVmd4H2HTl0yy/wUmf74f2lW7mlEcUZhXIn8nsvgPmUc0Q1HA3PCdqMU0WER1gGDTQrYtd6UO0Nl4S5p3OWjz7Nb2O6tI8WuV3hSl9tr5+VnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Txy6njhDEiSbrYsKOmUa80x3UdhkIdh3mqD8IPzV5o=;
 b=hqBwVEsij6CbGQ/oQH++3+gIYM2lOBd/EN/FJ9p51rra1R4eHib59sOoFOuI8tyZ0bfDw23ACflv/NVoSKMbzlkvb8eNoezMJbesqn1qDm3bK/iN9T3y9GuFwNU2WLFOTJlWp+qTylXsSeTwkGNhKcLmUPQmDS9H39qkG0HZz8+1keJCrpD1T/7DaSCLAci2qphrDfLDgRtowaJFCwUc8f2jNJKuzeR3svOXXml7CPnIH/LxcWE2OQXjQBs6BIoTqbgxFEbAHI/NIZG97AmM3EGTeblax/weFZN9W7U4w8kczG+usQxcGzypDDBs5SBjMdlVbuwyxL2ihZkb2vXiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com (10.172.75.146) by
 CY4PR1201MB0135.namprd12.prod.outlook.com (10.172.75.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 19:02:19 +0000
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::61a0:fba:8c7e:7edc]) by CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::61a0:fba:8c7e:7edc%12]) with mapi id 15.20.2241.014; Wed, 4 Sep 2019
 19:02:19 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVY1NGou2ILAGT/Euu5mgRcB5bcQ==
Date: Wed, 4 Sep 2019 19:02:18 +0000
Message-ID: <20190904190116.klyt2rjg3svswmot@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To CY4PR1201MB0086.namprd12.prod.outlook.com
 (2603:10b6:910:17::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9851742a-437d-4bcf-cd7a-08d7316a6882
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0135; 
x-ms-traffictypediagnostic: CY4PR1201MB0135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01354973AD9353AA432B1A4398B80@CY4PR1201MB0135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(189003)(199004)(66574012)(1076003)(71200400001)(486006)(6436002)(99936001)(6116002)(256004)(102836004)(478600001)(66476007)(66616009)(54906003)(81166006)(476003)(81156014)(110136005)(71190400001)(53936002)(8676002)(25786009)(9686003)(6512007)(2501003)(86362001)(66556008)(64756008)(66946007)(14454004)(4326008)(7736002)(66446008)(3846002)(8936002)(2906002)(6506007)(316002)(52116002)(66066001)(305945005)(186003)(6486002)(26005)(5660300002)(99286004)(14444005)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0135;
 H:CY4PR1201MB0086.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aFHc2A6NQbo68ISC3urAf2Xz1EjIoHxcyfJ8UaaqyN+vXVKB/6sjnTDT0Wpliht8vCzfT4s8/6/Il4Bt+6AFZW1/99wfC/YDw1Tb3NmDEIHmHRW4O32HhWEa/N9kDWarNnNLk8Y4Hs/yMD0WxEgo1SxM4UP0nI63GnEuy2hP/Rx21MrCw9Ng5SRlU7b99cBekkQ//4YcQ08Vg3ou51nGnEv5OkLETXBLpgU7SjJYZmM3aQjoaxfSbQ754q1i+UpX2y0CTIOGyBOuz0UlmEs652F0QJezuuGHaLe5WvkQTlS7fhSiXP/DDEIXXpD/ESaiN9Kt4WbwY5mIm8VQAmGMIOijB+eDXeYIRme4MnpbEXsBYWSLilsx7EbkUx4JdoMbqeXlfcYLF6CptBzlaqJHQjM4+aGrIV7s2xkJqDQnKDg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9851742a-437d-4bcf-cd7a-08d7316a6882
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 19:02:18.7510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndcxuSNsLDT8eV2eMBj7cbbKc+NBky3daTfkJly9V3PYxFtgH1xi3xGf+5hnGSPk2J88Z/bVYwdrPEJejjfT0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Txy6njhDEiSbrYsKOmUa80x3UdhkIdh3mqD8IPzV5o=;
 b=Epyx673HFh/GXV5TizWXN+e/+RxQjL0Obm/NlEdWiLE4yv221pZQE4B8et440AtHVLuWdtk+GYvV9GEyMKe7AYy7nV/PzizRb6ofJEN0L552rqc7t7noNpmrOLRCjSusKcxUi2bWiSmlui/vJdGNqRCpfSV8wrqjJ1pxkwA7bh8=
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
Content-Type: multipart/mixed; boundary="===============0013819920=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0013819920==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxdoj3tukgzujy23"

--mxdoj3tukgzujy23
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DP 1.4a specification defines Link Training Tunable PHY Repeater (LTTPR)
which is required to add support for systems with Thunderbolt or other
repeater devices.

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
 include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 8364502f92cf..5abed96a1cb1 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -966,6 +966,31 @@
 #define DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET	0x69494
 #define DP_HDCP_2_2_REG_DBG_OFFSET		0x69518
=20
+/* Link Training (LT)-tunable Physical Repeaters - DP 1.4a */
+#define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV	0xf0000
+#define DP_MAX_LINK_RATE_PHY_REPEATER				0xf0001
+#define DP_PHY_REPEATER_CNT					0xf0002
+#define DP_PHY_REPEATER_MODE					0xf0003
+#define DP_MAX_LANE_COUNT_PHY_REPEATER				0xf0004
+#define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT			0xf0005
+#define DP_TRAINING_PATTERN_SET_PHY_REPEATER1			0xf0010
+#define DP_TRAINING_LANE0_SET_PHY_REPEATER1			0xf0011
+#define DP_TRAINING_LANE1_SET_PHY_REPEATER1			0xf0012
+#define DP_TRAINING_LANE2_SET_PHY_REPEATER1			0xf0013
+#define DP_TRAINING_LANE3_SET_PHY_REPEATER1			0xf0014
+#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1		0xf0020
+#define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1			0xf0021
+#define DP_LANE0_1_STATUS_PHY_REPEATER1				0xf0030
+#define DP_LANE2_3_STATUS_PHY_REPEATER1				0xf0031
+#define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1		0xf0032
+#define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1			0xf0033
+#define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1			0xf0034
+#define DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1		0xf0035
+#define DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1		0xf0037
+#define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1		0xf0039
+#define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1		0xf003b
+#define DP_FEC_STATUS_PHY_REPEATER1				0xf0290
+
 /* DP HDCP message start offsets in DPCD address space */
 #define DP_HDCP_2_2_AKE_INIT_OFFSET		DP_HDCP_2_2_REG_RTX_OFFSET
 #define DP_HDCP_2_2_AKE_SEND_CERT_OFFSET	DP_HDCP_2_2_REG_CERT_RX_OFFSET
--=20
2.23.0

--mxdoj3tukgzujy23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1wCfwACgkQWJzP/com
vP9+Lg/+L5NfIqhhYrkraYXDvRGx4gaAEusVOCt0YD/c+StlaR5WUBkdEeMO6UBP
8T7NBxALJS6w29EwPU704eTXM/8E4ehMqOFiByFZ/sG5Yni7ovaWyoHLh/GMlMH/
LDd0hZD/x68deIJccoG6yfcmn8kBlhKfoYG+CzZPZgDlW5sln/1WGyM47K4qiBES
SoVq6NSDptCmdQNdp+3IAzQpD7QGkE0Zf7ebIADFRv0H0fJDUpJNH3vxBz4H3MkD
zcvhh4rt/uvFXu0umqQSnYs+5D969thb4GBmwWSqSiV0NcvO8BhQnQcTLE3XvI8/
iMyxWrRMkKhNeaeenGCTIOGrP0pmeV0OPGtDCXzsV/LtFre149vdEwTlMysUUIj5
5OXp+vdnu7AUJfQWzTVSKIgZhDaG6rJrj0EJbjDE8bObW30GGz01WPCbVcfUX3wJ
8zWs+o5cqMmgb9Ml6TpsI8UcB4GgxWcSxWC4x5tkIOpnLkK7mevZkh/h9H5v+B7W
9XVUBjVGss96EtIMHS8FiKWNRkFSpWX6cGOCKXCFXCpG22TAjcrshvhCcws/BRlS
PL52oKGTrj402+uoG4mrVE9fWdvcECyNsYjONvY+xOiwj1yFTT23NVAKMSOe9+OM
2pYzDsW/BmzIQL8MM8E0Tdav0157mWq/hiz81wg6k1Tt4BiqZzQ=
=2Svr
-----END PGP SIGNATURE-----

--mxdoj3tukgzujy23--

--===============0013819920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0013819920==--
