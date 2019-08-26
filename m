Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F008B9D2C3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6C6E23F;
	Mon, 26 Aug 2019 15:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720065.outbound.protection.outlook.com [40.107.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185A26E23F;
 Mon, 26 Aug 2019 15:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyH5SrzUltfrs9DoieDMAFUAOF6/hrDRv0N7p7UWaJPSnBWnb6LhQjL/ypr66AFfaWAj9OhL+cugRhm2fxwvBH1hq5DH1wTJNNFu6jUdyRtg0Apu7D75riG0gB7qliyk/wF9zboXsIGwD3GKI7dqjdNcC3SKrajQJQu+7JNRopxUO5K3VcazXtK7gI9HpO3Unv6JAzrtwA1lV5H6f45IlI0QRzfPisaHT9gwxKrmMGD9LQ533un3U1XC+7DuRpasTYqcT/stsUYZ3qL8K9SZaupPFTWyNc31Yt0q+yTKbGHYeN8mBLulktgwpAZPV39wqPXE64oSm42JgxBbMRbOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/oSmWgN8E11p5iPiHOeuRhSV/wqJrApx9GOgJSvCvw=;
 b=EwC9QR2wcjmaGPCjgliViGfvTfA+0m6025vioYfGtV96MNEi9xc/WAfwXXXiZNyLLrVcJDdYfWfrfu7w27o1GWdNlVR+Z5qlpyvdiZsJxiRiqtR30OYX9t0Wl6WzTtbWqMpaXijtUWO163gtIIM5//+g+4VCcWVAJr5GhdHAI5njnqy6LMip7B81uSYvfBFhLi9mAV9cGcxrKnovM9s/1tvMr9213u6Myf+Xb4Xu54tdPmD7auzzKoNWB7Xk/bP3qtjvdp145dshHjyyvkGtU/ACTv3isoNFYa8MqAJc5eXMsIkzJFQb2J6jgtN5JWQ7nQKfK82/in+rw4ICv2TtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com (10.172.75.146) by
 CY4PR1201MB0183.namprd12.prod.outlook.com (10.174.52.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 15:29:22 +0000
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335]) by CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335%5]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 15:29:22 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH V2] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V2] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVXCMIs0HPddxKiUWpD8Y2be0Pag==
Date: Mon, 26 Aug 2019 15:29:22 +0000
Message-ID: <20190826152925.4x7mwhzxit353yww@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::32) To CY4PR1201MB0086.namprd12.prod.outlook.com
 (2603:10b6:910:17::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fb3033d-cd6d-4cec-c43a-08d72a3a2b5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0183; 
x-ms-traffictypediagnostic: CY4PR1201MB0183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0183923BC73E3EF0515C946298A10@CY4PR1201MB0183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(199004)(189003)(316002)(66446008)(6436002)(6486002)(66556008)(66616009)(99286004)(64756008)(66476007)(53936002)(9686003)(386003)(6506007)(6512007)(110136005)(25786009)(54906003)(186003)(102836004)(7736002)(4326008)(450100002)(26005)(305945005)(486006)(8936002)(81156014)(81166006)(8676002)(476003)(2501003)(14444005)(256004)(86362001)(3846002)(6116002)(2906002)(1076003)(52116002)(66946007)(478600001)(99936001)(14454004)(5660300002)(71200400001)(71190400001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0183;
 H:CY4PR1201MB0086.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TXV1qL8awJhdvYV1r1HrffSs0sm54EACJTRSx4VtB1rbOn536UUykXEMjVNTYo5gTHcSg2NXkDhnJJUpkWIr1UdHNfu6Z6+mrSSwJLcZH26Xwf2uI9IsbVc+77UzVPURmxV7AcdWRPDy88n/IRQihPahpvzdAL27aWSt1cRrgY6gk0DqYcfCbZ8QRbizPlpIQnuGjeDi6YJfUDOXtjlklz77UgQuYoOcvLxrn/Qhb3S0Z6gPnOvoUKaxVfH5U1J6bfdRF7Uo7kmiRNV+BJ9LSTAVE9oxxg/XJdzV2nw3imY6zZhFu20siqDixL62aIG9Al+DuQkpoj8las3RCB/1nzFVRt8FwzEIqkPWkULQw23vFOG3TE8aRjT3DJlxUYDY33SbfgUVJNf1WadMYzmTFgajgvv5ms3yMETdB/3/BOo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb3033d-cd6d-4cec-c43a-08d72a3a2b5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 15:29:22.2277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lhUxEZP3P5voHqTGBBeE47EyicCe24WtIJmXIDfifHyTIxC8tvWfe0M2E5zF/2rAXYYhceyFP53Q0iAnDbEKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/oSmWgN8E11p5iPiHOeuRhSV/wqJrApx9GOgJSvCvw=;
 b=zLmZfIKdBxJiowvxSDQLk4zcKfPNz1A+BPy7B+il+rYcpItICUmRvKlqOlgU/d+nLJL2ln2ALxRN830Z/3uPSpWyS1tEGcKgplipTpC/+DHG/1lmpvaBZAk9SsuERIO1yCTc6ibv+KT2TQChtCPM8aL4ZPJjIBPSGz1ythrkfak=
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
Content-Type: multipart/mixed; boundary="===============0970182849=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0970182849==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mepy6fehghb3th64"

--mepy6fehghb3th64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DP 1.4a specification defines Link Training Tunable PHY Repeater (LTTPR)
which is required to add support for systems with Thunderbolt or other
repeater devices.

Changes since V1:
- Adjusts registers names to be aligned with spec and the rest of the
  file
- Update spec comment from 1.4 to 1.4a

Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
---
 include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 8364502f92cf..e8beb4e7e5da 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -134,6 +134,31 @@
 #define DP_SUPPORTED_LINK_RATES		    0x010 /* eDP 1.4 */
 # define DP_MAX_SUPPORTED_RATES		     8	    /* 16-bit little-endian */
=20
+/** Link Training (LT)-tunable Physical Repeaters - DP 1.4a **/
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
 /* Multiple stream transport */
 #define DP_FAUX_CAP			    0x020   /* 1.2 */
 # define DP_FAUX_CAP_1			    (1 << 0)
--=20
2.23.0

--mepy6fehghb3th64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1j+tQACgkQWJzP/com
vP/X5hAAuy945amvZTEO7GL1f00ONJUknkj+mhWR8NzZJe+3c/NzmwJkOWRWFtN2
mdEoK9j7oAW+ERQ2QxPwKKtP1vsLkqfp8SQ6aBuhu3ABpnQUmROQMK8yTcMVw2FW
DA7UWsl8YD8CXJzvWbiNH4zgSkp4H/5xzTsmBLccceVxSaIxgASOzvugm9sxv9tu
Pp9fwmoK4+VGErMJy7fqgcRqC1r8otYmMGuEuoglJDFBE+/rjBdyKr39iSzWyZF4
ak3v/XSjE9wF+NbWl/karWEJAEBSZnsbd04g/lz6hC1C2f2SVnW/6xgzkqlTrLon
zKq1iWJ1sJFYmRSiG+xE2Y4ukHclGLAbnUc0+9OaO2wNpkcwoB5P77NAdtXdayNd
qZn+mZgpqwsFQeURuJIsngX8dIFPSTOKbGruPeMwwNhB4+HnfAo8OXHTZpcw26ON
Ep1DXdPJ81J2VlPPin/Rcp0wjg26iDU+YrMU1qOTwq4rgs8G+1S28DS8LvAfFKjX
1JX5Hu9cBfwFAMkBZuyP4z6vmnCmWG/MGsORuEl/4wJ8KukIWapAA/LNB/sGoE/w
lGNNCf4xOycP/tcdSJHztVDy66BNIxffI9XGKtHhoSwqe2YvF41LbJ1GxoAyzugz
b2WdoYQNk8/XgRZ9hHTOSFKnhS/RasBo7Hz9uBQN+mfqTK6ZKgs=
=6MQ1
-----END PGP SIGNATURE-----

--mepy6fehghb3th64--

--===============0970182849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0970182849==--
