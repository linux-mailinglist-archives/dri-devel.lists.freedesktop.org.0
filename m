Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1153638CD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 17:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DADE6E06B;
	Tue,  9 Jul 2019 15:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 09 Jul 2019 15:43:26 UTC
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182BA6E06B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 15:43:26 +0000 (UTC)
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Joshua.Henderson@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Joshua.Henderson@microchip.com";
 x-sender="Joshua.Henderson@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Joshua.Henderson@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
IronPort-SDR: k73VEKjPVQ7elR9L+HFBMp4PZdQ++W4HylrHJvD40VJhzhIfH64jt5ApTrXTaNsRUBU1QXWeRU
 lfwIH1u/1cOIdX+p+CCG8mvWFZvH3GmxUrdTu/WWamkcjUb31iGyjGV7ZB7pz+8OsSr60s56nJ
 YRWkucZT3c2CyLj61msidMkUBzI/b6Je9xGBI+Ef4vogan+yVtfsBf3KYzwnnUhQGFBD8Kp81g
 BTRz3uSfMRVBQIywCUI+e+6NS4FsR+jZkbs0+5PGbBCOVhIjw1HG9YDx5B213KRqrtTNKa87Po
 EeI=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="42015352"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Jul 2019 08:35:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 08:35:15 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 9 Jul 2019 08:35:14 -0700
Received: from MWHPR1101MB2079.namprd11.prod.outlook.com (10.174.96.9) by
 MWHPR1101MB2255.namprd11.prod.outlook.com (10.174.101.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 15:35:12 +0000
Received: from MWHPR1101MB2079.namprd11.prod.outlook.com
 ([fe80::7408:6501:d238:63cd]) by MWHPR1101MB2079.namprd11.prod.outlook.com
 ([fe80::7408:6501:d238:63cd%9]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 15:35:12 +0000
From: <Joshua.Henderson@microchip.com>
To: <boris.brezillon@free-electrons.com>, <airlied@linux.ie>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@free-electrons.com>
Subject: [PATCH] drm/atmel-hlcdc: set layer REP bit to enable replication logic
Thread-Topic: [PATCH] drm/atmel-hlcdc: set layer REP bit to enable replication
 logic
Thread-Index: AQHVNmvlXoLVjRxOEE2KayDJ7WC1cA==
Date: Tue, 9 Jul 2019 15:35:12 +0000
Message-ID: <1562686509-8747-1-git-send-email-joshua.henderson@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To MWHPR1101MB2079.namprd11.prod.outlook.com
 (2603:10b6:301:50::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [198.175.253.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffc36d22-1cf5-434d-3d8f-08d70483085e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR1101MB2255; 
x-ms-traffictypediagnostic: MWHPR1101MB2255:
x-microsoft-antispam-prvs: <MWHPR1101MB22553B0BEC02A649EEFE9C379BF10@MWHPR1101MB2255.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(366004)(189003)(199004)(6506007)(478600001)(110136005)(81166006)(81156014)(54906003)(386003)(14444005)(256004)(6486002)(6512007)(6436002)(476003)(53936002)(72206003)(8936002)(52116002)(26005)(8676002)(316002)(102836004)(4326008)(36756003)(186003)(5660300002)(66446008)(66476007)(73956011)(66946007)(4744005)(66556008)(6116002)(305945005)(64756008)(3846002)(7736002)(68736007)(486006)(66066001)(99286004)(14454004)(71190400001)(71200400001)(2906002)(86362001)(50226002)(25786009)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1101MB2255;
 H:MWHPR1101MB2079.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jaU/+ij4cMDBDUmyxbZPODO9nRFbGFTvjoX/ruJRDqym0MAcX8ysUVjPHMz0uiY5pBEE5Nsto1/5/zIYllEoQQjPZs4v0NBfrc7Qw7+Og1LJIgbftKcE43XrSGPmn1FfYfcpwxoKi/0zNSIAPSgGlnSOCYnJKt8MRcnmPUOIkNZusXfgsVt+cY5k2DNUDvNmKeAncxaUenFTmQYmxk5K2FloQyyW+tg06NSJTGEy2eafjJY4N/+6dNotBnadq4WUvcbRq7kG/UW8Y23zgrH3DBIfJsj1AirSyO27SV5qpooV8llXp/6TKJAsDnV8HwzuwKCZnkXTpXsvpZq4dKPXQHXkio3ft+Ns0kMWArhc844BsV12p+clZQOhCfsvFRJi4DD1vcoYtZgUQPihpV0ftLy7hzAfAQs/A3DXS28+AwU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc36d22-1cf5-434d-3d8f-08d70483085e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 15:35:12.5786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joshua.henderson@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2255
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhx64/kt1EPO29AOpPoX5HrQ1mdPrjVrcvtbOT88JiE=;
 b=r+6UMSl3MbDaqZckpjEhLf6InorgCGtAyKhGinOKP1mTKfzMVsJa9mtkTo5un/iqJkz7cf5hVWDohbDzHmrGMD448YS41319/MT7jL2RWDIm+1GqKijdHJbiaIwJvpeux81kYVGMg7KrrL6r2gjDOH9fjLKC9oHcq8N9CHboxDQ=
X-Mailman-Original-Authentication-Results: esa1.microchip.iphmx.com; spf=Pass
 smtp.mailfrom=Joshua.Henderson@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBiaXQgZW5hYmxlcyByZXBsaWNhdGlvbiBsb2dpYyB0byBleHBhbmQgYW4gUkdCIGNvbG9y
IGxlc3MgdGhhbiAyNApiaXRzLCB0byAyNCBiaXRzLCB3aGljaCBpcyB1c2VkIGludGVybmFsbHkg
Zm9yIGFsbCBmb3JtYXRzLiAgT3RoZXJ3aXNlLAp0aGUgbGVhc3Qgc2lnbmlmaWNhbnQgYml0cyBh
cmUgYWx3YXlzIHNldCB0byB6ZXJvIGFuZCB0aGUgY29sb3IgbWF5IG5vdApiZSB3aGF0IGlzIGV4
cGVjdGVkLgoKU2lnbmVkLW9mZi1ieTogSm9zaHVhIEhlbmRlcnNvbiA8am9zaHVhLmhlbmRlcnNv
bkBtaWNyb2NoaXAuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9o
bGNkY19wbGFuZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNf
cGxhbmUuYwppbmRleCBlYjdjNGNmLi42ZjZjZjYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYwpAQCAtMzg5LDcgKzM4OSw3IEBAIGF0bWVs
X2hsY2RjX3BsYW5lX3VwZGF0ZV9nZW5lcmFsX3NldHRpbmdzKHN0cnVjdCBhdG1lbF9obGNkY19w
bGFuZSAqcGxhbmUsCiAJYXRtZWxfaGxjZGNfbGF5ZXJfd3JpdGVfY2ZnKCZwbGFuZS0+bGF5ZXIs
IEFUTUVMX0hMQ0RDX0xBWUVSX0RNQV9DRkcsCiAJCQkJICAgIGNmZyk7CiAKLQljZmcgPSBBVE1F
TF9ITENEQ19MQVlFUl9ETUE7CisJY2ZnID0gQVRNRUxfSExDRENfTEFZRVJfRE1BIHwgQVRNRUxf
SExDRENfTEFZRVJfUkVQOwogCiAJaWYgKHBsYW5lLT5iYXNlLnR5cGUgIT0gRFJNX1BMQU5FX1RZ
UEVfUFJJTUFSWSkgewogCQljZmcgfD0gQVRNRUxfSExDRENfTEFZRVJfT1ZSIHwgQVRNRUxfSExD
RENfTEFZRVJfSVRFUjJCTCB8Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
