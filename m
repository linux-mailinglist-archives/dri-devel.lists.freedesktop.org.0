Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C237E6E1E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518E86E486;
	Mon, 28 Oct 2019 08:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0F89C55
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:47:53 +0000 (UTC)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9PAlRBw027852; Fri, 25 Oct 2019 06:47:38 -0400
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2057.outbound.protection.outlook.com [104.47.40.57])
 by mx0b-00128a01.pphosted.com with ESMTP id 2vt9t2b0ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 06:47:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lbe7B3vAkdB2IfaLEf/iSH+w6UFyUsoZIeL8jqz4IIuJvmTnkP9AMW3mRJ2/CYlRsi8CJId0keKtekduQ+Fq1YvXjNKwZy9JPXf1l1Sfi3gbW1CBSrvzI2JLlak6CorahD0Or9nZOFji1hQQkPOu3tZSNvy6CssgNRt8PAj7rQgSt+CgwzYbbfvgh2nmTCIN6GgTmPwxhaqF/4ZHj7zlu9ptr/HXR8LgeTDnxLuE4auIYZ9Lz7/rLh//U/9hPO5i1j2PsfUD/+LNo1dCOtr/ySA3t61NpFZYENAGttQmHPcXNOsKLmeVzpvEyBCQtTmZmq5Wz943k4mXSQrDuoQtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXr1CS+Onv/bAP35WOni6UcuvOJhwmrcteAKlw4f6/8=;
 b=IVnFA+lL1RG+kC0FXt4Owm04B7HLqFfvfweFBq2s6/9A2MYiVb4n/GgBJUL5+8MaWnJ+uj4PboPyyHfqs3bJVPbESBTu1MCpc+sdxkUVWv7lk+81QEWcAczf7vEuPirN94i0EmKaOW8ZsrVivhRTB6XGwNG0psJP+WUiGDK4nKfEz+vZNVgnhuiiHi8iYPOSXpHxxkialMP3RKgQH/Y9FFKhEQo9r19VtLYAXDV7qm3/q1m3zZA3i9/u9WYkqunUQHzT1h5vCF4cV3Wx5iT9ssBzv3SJrUhBbs7toDizw2hce1Ye9eVFSCXAX4siGHbELjHi3E2Z2+yBgiTuxvX1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=samsung.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
Received: from BY5PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:1e0::34)
 by DM6PR03MB4859.namprd03.prod.outlook.com (2603:10b6:5:188::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21; Fri, 25 Oct
 2019 10:47:36 +0000
Received: from BL2NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::203) by BY5PR03CA0024.outlook.office365.com
 (2603:10b6:a03:1e0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.25 via Frontend
 Transport; Fri, 25 Oct 2019 10:47:35 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT044.mail.protection.outlook.com (10.152.77.35) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Fri, 25 Oct 2019 10:47:35 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9PAlPYm027211
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 25 Oct 2019 03:47:25 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 25 Oct 2019 06:47:31 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND PATCH] drm: bridge: adv7511: Fix low refresh rate register
 for ADV7533/5
Date: Fri, 25 Oct 2019 13:44:18 +0300
Message-ID: <20191025104417.28901-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(305945005)(47776003)(14444005)(54906003)(478600001)(70586007)(48376002)(476003)(86362001)(8936002)(70206006)(50226002)(2870700001)(8676002)(7416002)(106002)(36756003)(126002)(1076003)(2351001)(486006)(2906002)(44832011)(7636002)(336012)(246002)(2616005)(316002)(5660300002)(356004)(6666004)(426003)(186003)(107886003)(4326008)(26005)(7696005)(6916009)(51416003)(50466002)(16453002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB4859; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a3d6a52-b18b-47f3-7c9a-08d75938bf06
X-MS-TrafficTypeDiagnostic: DM6PR03MB4859:
X-Microsoft-Antispam-PRVS: <DM6PR03MB485976D0E3D09057EB5CBF4B9B650@DM6PR03MB4859.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-Forefront-PRVS: 02015246A9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OQI62jjY9M0nINvHuCfFTgAmJ5h7W83uzauoj3Ra3tiQ/HYF3/xeSMryi4Dr3Paq5lW1UionmPDpbNfRRe3hAiKduxb0Iay0TjyAT7JxQq5U9XUz4hmv88b1j6z53jHLQt39t0zdmXdd4tOnA8FgWWrok+DFVY9b5Doms2WKhVqTsPLirkHc54JNFgLZD4e13Fr9Ld/KNqUwT5lbUGiDDlo1cTj5G4pRGQU0b1V/wTLxWq9I0CGD7Uy1ZzAKjXd/dOrwOTpMuiGhBRAXk5Km5BTdNJzfRa5+ntGfyAV0WbXBe+GIDu2x/sVzc/jJtzNrVL/viAiW4v/JNBcjSlp+Egv8SwtvuF0q2j4FkD2S8jdgZEjd6+5OqgWRjqY9i/z72opb/nuXXbW2NdSFKrJljobxYQUiFnPd47oJAFriuOKq4cG/C8rwGiN6o3aAcC5
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2019 10:47:35.3614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3d6a52-b18b-47f3-7c9a-08d75938bf06
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4859
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_06:2019-10-25,2019-10-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=1 mlxlogscore=830 phishscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910250102
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXr1CS+Onv/bAP35WOni6UcuvOJhwmrcteAKlw4f6/8=;
 b=yepqcDDjrq0hOqDQeM0xvQOR3JU+RvILCTtONKKbz2lycYH6PcJAKbL6glDbcSM5uoYBSsAEJjLrN0j+ubxzFI2PEJtpEVQA+8wxKLjA2GXodvDwR+AAfhh9dhLDSRIACH/P/Sk+Oo6Q/TzvRWnjcRYHTE+A4B/pWbW7XMWB/cI=
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIEFEVjc1MzMgYW5kIEFEVjc1MzUgbG93IHJlZnJlc2ggcmF0ZSBpcyBzZWxlY3RlZCB1c2lu
ZwpiaXRzIFszOjJdIG9mIDB4NGEgbWFpbiByZWdpc3Rlci4KU28gZGVwZW5kaW5nIG9uIEFEViBt
b2RlbCB3cml0ZSAweGZiIG9yIDB4NGEgcmVnaXN0ZXIuCgpGaXhlczogOWM4YWY4ODJiZjEyOiAo
ImRybTogQWRkIGFkdjc1MTEgZW5jb2RlciBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBCb2dkYW4g
VG9nb3JlYW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIHwgOSArKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwppbmRleCA5ZTEzZTQ2NmU3MmMuLjJmOGY3NTEw
ZjA3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFf
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMK
QEAgLTc1Niw4ICs3NTYsMTMgQEAgc3RhdGljIHZvaWQgYWR2NzUxMV9tb2RlX3NldChzdHJ1Y3Qg
YWR2NzUxMSAqYWR2NzUxMSwKIAllbHNlCiAJCWxvd19yZWZyZXNoX3JhdGUgPSBBRFY3NTExX0xP
V19SRUZSRVNIX1JBVEVfTk9ORTsKIAotCXJlZ21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdt
YXAsIDB4ZmIsCi0JCTB4NiwgbG93X3JlZnJlc2hfcmF0ZSA8PCAxKTsKKwlpZiAoYWR2NzUxMS0+
dHlwZSA9PSBBRFY3NTExKQorCQlyZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVnbWFwLCAw
eGZiLAorCQkJMHg2LCBsb3dfcmVmcmVzaF9yYXRlIDw8IDEpOworCWVsc2UKKwkJcmVnbWFwX3Vw
ZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgMHg0YSwKKwkJCTB4YywgbG93X3JlZnJlc2hfcmF0
ZSA8PCAyKTsKKwogCXJlZ21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsIDB4MTcsCiAJ
CTB4NjAsICh2c3luY19wb2xhcml0eSA8PCA2KSB8IChoc3luY19wb2xhcml0eSA8PCA1KSk7CiAK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
