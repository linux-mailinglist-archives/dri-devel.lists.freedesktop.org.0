Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1E3AE1C1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 03:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF4A89356;
	Tue, 10 Sep 2019 01:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1E78931F;
 Tue, 10 Sep 2019 01:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM81j6mlUwUGGR5wXTaa9uKWRrxWvUuQQy+sHj3jNvlTqrVgVuLjBgq6RF2bIngq2rvNVxIaHD17Hg3ueyKdwoCXU08CX+dgpKQfl0IJP6mAYKLnw2m1xMNLgCMQpfHShyoX1xqcf6OmeuE66tq7UR+C4YDlPDZSJDhK+zN6W9Idg5KiKbRsNwl/K35JIDioZoSb2tkT9qjxVklFRr51LEjzwnKx+IiuTT5Dzs2Db3/7NCQnY8pM0EVkZA4S8U2MqAn//7kQ4f7IsTMuZERwNZgiChSzXrYejNsesqTiGzO1tGIKN8789SvB0UAvh8/aSboTw1OgQo/osLBZp3E4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhRezt7syK6D9DXh8N4JXpN1i9ZVQeyPCyWLlmmSNFU=;
 b=lKmnOw2hq/g+0jbjiI7/6l9NZXsxmkS+s1kKUYFCuVfiwp8oGLH+iYsH+fssEjTgmpL/iHrUz64P9ZoLPHGpvdl/HdfBnQMUZs0vs+vhERhOk/Y0rqiJ9ERpVJpGqHXBOW8mXQzK0wVKgVddzbFQUv0c7/kA86NJkb4YsdKN5VJswo9zc4mDz0Bhrw44xbref1VwD1b1Y2fO961wicoua864u9yvECKOzaFQlO4Av1nkadwSJTb1Xrq/hRnKrcCzsb+oxeAYut7crarIa63GKARKwq4PbIORv2lMzk/P6Ufah/jc47hjTNgqeXVb6IirNYItbF1IbIKI5rNXe13CJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (20.178.198.25) by
 DM6PR12MB3820.namprd12.prod.outlook.com (10.255.173.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 01:00:13 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::91c9:3101:2151:88]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::91c9:3101:2151:88%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 01:00:13 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH V5] drm: Add definitions for link training repeaters
Thread-Topic: [PATCH V5] drm: Add definitions for link training repeaters
Thread-Index: AQHVZ3MaZHfzJohFyUqyY3rSI9RLRg==
Date: Tue, 10 Sep 2019 01:00:13 +0000
Message-ID: <20190910010011.sprpkquhkygvohfi@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 307f319b-7e59-4cbd-54ab-08d7358a3c7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:DM6PR12MB3820; 
x-ms-traffictypediagnostic: DM6PR12MB3820:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB382034F66521D26EAF863C0698B60@DM6PR12MB3820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(6486002)(256004)(66476007)(186003)(14444005)(8936002)(86362001)(8676002)(81156014)(14454004)(81166006)(478600001)(54906003)(305945005)(316002)(5660300002)(7736002)(25786009)(6512007)(9686003)(2906002)(102836004)(53936002)(66946007)(52116002)(110136005)(6116002)(66066001)(26005)(476003)(3846002)(386003)(4326008)(1076003)(99286004)(66574012)(71190400001)(71200400001)(6506007)(486006)(6436002)(99936001)(66616009)(66446008)(66556008)(64756008)(3716004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3820;
 H:DM6PR12MB3370.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /pb6g3nHR+NcVvbj2W5jMl/1Rj1B/YAcfjQA0tJjZiCRgvKKaKdx8FomQgDNr4ELQEDju6UN9fjX1psjYxhMFx7b3eazEr1HwJ/c/DofjPFuKIn3piYdUVuGVRpU+PZdNzCavG9apHo1/Ntvo4lALv897d4bXof+1bsS0LgziVILvPy5LIZye+/H4RdhKbECbjOrigAjUCFd6sil6sowx742jweE9ov7Hjni2S6Y8hidPKNDed4Pjrj3FLxQln7W9Gxh1B2JuHhGouulFL/cwxhzK7czLB+RdzHdb+G5da6RFjnwAAYcI3Se7Xjhu0RevcpIf+3pHHNqu5EExwYb3hSsdFGUxgJ2y1STMcbKHynryap3qs91UlBNniyQIwFkAPEYhgvaw2QVbtfjjy9bu8ZMp1NxPt5+1qdy/SWK4DE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307f319b-7e59-4cbd-54ab-08d7358a3c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 01:00:13.4429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9BlET+PF3cowmRuneX3DYI4/oNT8W7qzsOxCXiGxnNrT/pr+6NA6BvE0cQY5tkK5/CsU2B2NUCdMlCiUn9FCdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhRezt7syK6D9DXh8N4JXpN1i9ZVQeyPCyWLlmmSNFU=;
 b=PaYh/v/7/lpfTIErw5As4+9sKLDwoesUCDfxFPhZcFzX/TkQmrmYEKFfY8wMS+wrfYIItrAMuzetViq/hHTtld0YI7UCkIhu93MS3EkIGsTRRGb/5McARbtBXxMd1MFPqF/FABt2uGlVffq9buJAUysSjdrhajYJfPTlmNi2zyI=
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
Content-Type: multipart/mixed; boundary="===============1726863632=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1726863632==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7wzbl5ywty3tpgqt"

--7wzbl5ywty3tpgqt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This change adds definitions required for Link Training-tunable PHY
Repeater, which was introduced in the DP 1.3 specification, and
incremented with new features in the DP 1.4*.

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
 include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 7972b925a952..b1a9a0dcc177 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -966,6 +966,31 @@
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

--7wzbl5ywty3tpgqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl129ZoACgkQWJzP/com
vP+A4g//TFAiF095XSorWx/CTSwTBpdD/MSQNtN//MUmi2oyR1LbwJ5ddKhLAFOd
5n2u9UhPEPSxKovDq43IR6UJYAxKjS10+Mp7XdhQkei7GnWDfICZJKfLGXd8xDz6
Zos/b0iK41mt6JW1QmQfJxzo9r7CyhFKpba80L/jD9bT2LfMo9TG78W3Fc83SIVs
w6zZz3q6+hSthGqN26qyK/iJ+4/XjMSmZbn6XkbL/Bwvf1QveoGabrjDFJmV2i4H
WFRBr0KT/eG4VAnmlDFlVNoitIzLYYcbmvi1FyAjvpTwDXoC1Sn6pU6IxmMy6JpO
Xoq7RddonJpBOX4hSZNX7KtUqnOFNhiB2+Ep6mmQsp1zvBCpI1aGeyJceC2EitQx
+OG5hizhLB6ZuGYyzS609vQVgAh5yvXATS1k9BwlTWz1cLmB0BWnj7qgFbD3FOK5
5pKocboYFWMZz31vlDTmego9j0bYlPAhI0JqocFEtaUzCo40hGzF50ua6NhNE8pK
3tZ1OLqOPJV0xnwGQ94k2mhfSO3V7RwoyfhrAlzsc2y9BDaZPQs9UJQR779Rs72o
VnC8LusQSULL3i6G1+DbNIgDlO2XTPmk5hvf2FHWSJhwx2mPppTYtW1QBofyokLs
K8Hr/+huQx0iFwk2YPkbWMevgERy/dN31xlXiFcPmJFQg8wrhC8=
=FEWq
-----END PGP SIGNATURE-----

--7wzbl5ywty3tpgqt--

--===============1726863632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1726863632==--
