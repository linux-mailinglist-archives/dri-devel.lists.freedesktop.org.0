Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C09A33B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 00:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100356E562;
	Thu, 22 Aug 2019 22:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730066.outbound.protection.outlook.com [40.107.73.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1276E3F5;
 Thu, 22 Aug 2019 22:46:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+WCkYwC+a0Ifb/H1jOvU3uaR/cqAOB6yPH1wNMZzMhEMM7L/6iLIcTlR1pUfy0YIhfcRl/m7yqrtFlblLFA8O0Esf5h4EJg6nDfrk0I8I0FjNM/EY55OzDsSoZPM93eaRIMNgfOPFQYdWHj2fpMEqqls3ZsB3+SgVd63KpN6PXvFeNxytC47lyUAf4Rwpfi0t8aSs5CE0tyJ2vn3yVV4Df2aiiWM//6BW5WAoBBTh+AKG2mdZtb22bIw4WY6dyTIE0VyrE/AvI/mTEmJeYkOMobpbPLJ1efWXKXtz1Wxt8ywoeRUFujdrPikaUE5NlEazcy7NdgucFs/S5dbWQl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuiI1r2ywb4+E5QM5RXO+OIZFPu9fLI3FSIWXnUrrw0=;
 b=l9ZfgH2bLkAb4ALZt4sD4kzK+s/RLdImJRz4q8ZkY80cDGSQhQ9QSzO8ub8VNoFsmYSF7zo3hr00Epw/TOrhoXTsNNq+JPZ7QSQEM7WK/2Y/sqY329q//1PyB2+qv0uFYzcyqCHn4WGkdCrVt+oWBVkoPTooB0X8ywdqrp7+01EmsbRE8W6Ht7ZQ+93AuIueMMQ/A+pciU2lnh8sAPWgHZm8EZ3Iwl0dF8dSmYYE+vamrxEVAvQ4NhYVJBuM3qDts8C+xB0+eMV17XPZPI8xA1VBgXmkCbaL5O6HU9Pj8D8YPRlTFsMKFcj4/82GA92wXq1n5o+iXyANUJQ+50nUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com (10.172.75.146) by
 CY4PR1201MB2548.namprd12.prod.outlook.com (10.172.120.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 22:46:12 +0000
Received: from CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335]) by CY4PR1201MB0086.namprd12.prod.outlook.com
 ([fe80::1dca:a430:30e9:2335%5]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 22:46:12 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Add LTTPR defines for DP 1.4
Thread-Topic: [PATCH] drm: Add LTTPR defines for DP 1.4
Thread-Index: AQHVWTtlZ/MqugNHyEyjQDzi8fC43Q==
Date: Thu, 22 Aug 2019 22:46:12 +0000
Message-ID: <20190822224607.m73g3a2a23zww644@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To CY4PR1201MB0086.namprd12.prod.outlook.com
 (2603:10b6:910:17::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a53b2154-4eef-46da-35b3-08d72752884f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB2548; 
x-ms-traffictypediagnostic: CY4PR1201MB2548:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2548E907F2FC7A14DA00465598A50@CY4PR1201MB2548.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:549;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(14454004)(2501003)(1076003)(86362001)(316002)(99936001)(54906003)(71200400001)(7736002)(26005)(71190400001)(2906002)(5660300002)(305945005)(110136005)(3846002)(6116002)(102836004)(66066001)(478600001)(4326008)(66946007)(486006)(386003)(53936002)(66446008)(81166006)(8676002)(9686003)(6512007)(8936002)(476003)(186003)(52116002)(6436002)(66616009)(99286004)(450100002)(6486002)(14444005)(66476007)(66556008)(64756008)(6506007)(81156014)(25786009)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2548;
 H:CY4PR1201MB0086.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fJn07iYjXLyxIoOz1A3r1UGpb4pnwCnx75N/snFSHa28Rhf35ZqZ+bcP2QjAUeWGKh3V/b1KljhGmSjsJd9De8s9OLrv9Ma6a0+nhKoKThdKcKjyWgR02P0NwL2f1BKLFZh8Gw/BKffFTpjAnTNh+qadzMThsfLAR+Bs4henA5TO78xGlIBATy1qpn9kU99mWFJAM5MlTSlkNM6dyMeLBipaoV9bAXhu0prMGhgydkd6n19JtVEqx6iDNv5I1P5BoqpQmTw95akBML4V2UV+5lxIvuGFo5IzsuUEUgi31Xcv4HwzNIa5+/+sN21xMT3qfFq0FaOrDI5GoeyJE+Mi/EChzECp3j6vs1cfcnYcMXlfjzH5qa9owy7UptlvZEcIIZIltRGRNbZPNQKgM6ojQR9gaEhm4U/EPEsQlqSIyM0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53b2154-4eef-46da-35b3-08d72752884f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 22:46:12.5457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lvb/W1bbjt57WPH8c08z81xKvtp5wWadCMtrdXhiYRfvESbShuWOFAXkj/MZ50miI7OQI6Gm1jRYEKEvBW6+dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2548
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuiI1r2ywb4+E5QM5RXO+OIZFPu9fLI3FSIWXnUrrw0=;
 b=vg7Vlj/C0roWQoAahxMHnG/mmjUx8mHXrCCUasmcLL7qDdTAPlo9e/SHs9UsK+YRBuOTw2SxGPWIv0qYiBO4DMuYav3r65dKuWXLdk1FlVkPmegnM2j26qi+sE3hUg1waUKSWIspYjekvAi7Hx0ZnwgHfHEUK7xFvyRKkvTbMMo=
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
Content-Type: multipart/mixed; boundary="===============0500666621=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0500666621==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kkqc63twztjn7o6t"

--kkqc63twztjn7o6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DP 1.4 specification defines Link Training Tunable PHY Repeater (LTTPR)
which is required to add support for systems with Thunderbolt or other
repeater devices.

Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
---
 include/drm/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 8364502f92cf..8336d960da7f 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -134,6 +134,32 @@
 #define DP_SUPPORTED_LINK_RATES		    0x010 /* eDP 1.4 */
 # define DP_MAX_SUPPORTED_RATES		     8	    /* 16-bit little-endian */
=20
+/** Link Training (LT)-tunable Physical Repeaters - DP 1.4 **/
+#define DP_LTTPR_REV                                  0xf0000
+#define DP_LTTPR_MAX_LINK_RATE                        0xf0001
+#define DP_LTTPR_REPEATER_CNT                         0xf0002
+#define DP_LTTPR_REPEATER_MODE                        0xf0003
+#define DP_LTTPR_MAX_LANE_CNT                         0xf0004
+#define DP_LTTPR_EXTENDED_WAIT_TIMEOUT                0xf0005
+#define DP_LTTPR_TRAINING_PATTERN_SET_REPEATER1       0xf0010
+#define DP_LTTPR_TRAINING_LANE0_SET_REPEATER1         0xf0011
+#define DP_LTTPR_TRAINING_LANE1_SET_REPEATER1         0xf0012
+#define DP_LTTPR_TRAINING_LANE2_SET_REPEATER1         0xf0013
+#define DP_LTTPR_TRAINING_LANE3_SET_REPEATER1         0xf0014
+#define DP_LTTPR_TRAINING_AUX_RD_INTERVAL_REPEATER1   0xf0020
+#define DP_LTTPR_TRANSMITTER_CAPABILITY_REPEATER1     0xf0021
+#define DP_LTTPR_LANE0_1_STATUS_REPEATER1             0xf0030
+#define DP_LTTPR_LANE2_3_STATUS_REPEATER1             0xf0031
+#define DP_LTTPR_LANE_ALIGN_STATUS_UPDATED_REPEATER1  0xf0032
+#define DP_LTTPR_ADJUST_REQUEST_LANE0_1_REPEATER1     0xf0033
+#define DP_LTTPR_ADJUST_REQUEST_LANE2_3_REPEATER1     0xf0034
+#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE0_REPEATER1   0xf0035
+#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE1_REPEATER1   0xf0037
+#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE2_REPEATER1   0xf0039
+#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE3_REPEATER1   0xf003b
+#define DP_REPEATER_CONFIGURATION_AND_STATUS_OFFSET   0x50
+#define DP_LTTPR_FEC_STATUS_REPEATER1                 0xf0290
+
 /* Multiple stream transport */
 #define DP_FAUX_CAP			    0x020   /* 1.2 */
 # define DP_FAUX_CAP_1			    (1 << 0)
--=20
2.23.0

--kkqc63twztjn7o6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1fGy8ACgkQWJzP/com
vP+a2BAAwfPB7FBqmETG+jBr4xesGSLNQ1cQU2VdDI6K/Xf0hn3CxkWsIHI9MBAF
bBqtKMB45t6oKFVMzOYv58f0l5K6RcS1HznrjrM2Njp2wyC89CA4jAsjz4zBCKja
MqNbJ4FEfSNrKrdk4tVZm6DCcmFRdQi+G/EmRoRuuz970fKFOWqjjfU537J2S1n2
kmQ7HPaJz19TaVZilw34uo+fJh2mq+BmsRIxrKwAR37hTf8GSmMnbLWflueoM+LX
v/3X20xLhOgeuQHN6t9s9O75AzuhE5xVou7iPXnHyPgXWeVaaiOQR8wxgBond0Ch
9n95SgoOdIzX/+yYD3nz+ggRVYLv2Z/wS9345lagI9UmOGsKoPCuH9KL2vEwF/WL
0ZE+byshobQL+ybysPb5a0K8nUsjJpprlCJW2cAOTGBl8n1AX5tprif/15pHSAox
goDQ/iVJ+JCmF1MeQuBPcP71pqCcUqHENBxp0Y1GNmNd/fONs7QC9uTg1i2FA2p0
IiERQLTm4lj4VaBfy4zlgFqdzn6DRjg0Al8YYm5wCyjO+GRL3C0yKb2Brq8P3CKS
If0LTuvNaryasqqyG8m366CYB3dqeLrdOwOazxjXLvanrI2WtO7Fm1VHLc3aNOUQ
kYYnEZHt2pGdBK1MXmUMs6UxU7dqeowoCLcClSi1/OJY2TbkdBE=
=raUH
-----END PGP SIGNATURE-----

--kkqc63twztjn7o6t--

--===============0500666621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0500666621==--
