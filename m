Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B01585D1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3376E055;
	Thu, 27 Jun 2019 15:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820135.outbound.protection.outlook.com [40.107.82.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA826E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:29:49 +0000 (UTC)
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB6110.namprd04.prod.outlook.com (20.178.248.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Thu, 27 Jun 2019 11:29:47 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635%3]) with mapi id 15.20.2032.016; Thu, 27 Jun 2019
 11:29:47 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v1] Adjust analogix chip driver location
Thread-Topic: [PATCH v1] Adjust analogix chip driver location
Thread-Index: AQHVLNugE9/A6NeXyUKRWvLnNCDN2w==
Date: Thu, 27 Jun 2019 11:29:47 +0000
Message-ID: <20190627112939.GA4832@xin-VirtualBox>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::20) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e06ecaa8-4e44-4947-5b6a-08d6faf2c2a9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB6110; 
x-ms-traffictypediagnostic: MN2PR04MB6110:
x-microsoft-antispam-prvs: <MN2PR04MB61106D0F54D9B3B1524CD31EC7FD0@MN2PR04MB6110.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:177;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(396003)(366004)(39840400004)(376002)(346002)(189003)(199004)(54906003)(110136005)(7736002)(316002)(25786009)(2906002)(476003)(53936002)(256004)(52116002)(486006)(6486002)(6436002)(99286004)(305945005)(4326008)(6512007)(9686003)(86362001)(14454004)(26005)(8676002)(66066001)(1076003)(107886003)(8936002)(81166006)(81156014)(33716001)(33656002)(66476007)(66556008)(64756008)(66446008)(66946007)(73956011)(5660300002)(71190400001)(186003)(71200400001)(2501003)(478600001)(6506007)(102836004)(6116002)(3846002)(386003)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6110;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6LDYImq0SYySngHQljdx99KpHYWHZpZLYPnjGWiAQdmaRZG7MSn/Z/5vFdccvS6F8gnyFBElK8KZIZ7dRgVKdtsGEdOH8N9HZTpRzvVQ2zhPxoY3Wfu5MMsMEwB6IzYDegzjunjcKfo0YwaXM/hFlvbiNSVn7cuaU/RfuvAk4ACEUMH3oIuaj6GEaJOOwZRsjYRUCIlpEOuLbDxcSHows1gLeHmP83RskLEWW7va1CudoTWxB/hnH5ZOal+A9YgEUCQjp3a02zIpkpHdicOXfzIitU2ANPxX0OeIrH18YbvojNRzoq1dR9AzFcqmtt7ZYGJoAitIHunAhD62UqCVHvyCkS0xe1WPTw4XSJLZW290lJ0dxNtuK8WaBBK+2YbKob7cLcYSA+jI1R+43FgVnBh3bbJeLTuB56w2CpCSzyA=
Content-ID: <34B723CC14C47F4FB2A9966795AFA4EE@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06ecaa8-4e44-4947-5b6a-08d6faf2c2a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 11:29:47.6990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xji@analogixsemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6110
X-Mailman-Approved-At: Thu, 27 Jun 2019 15:33:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector1-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDWKXlpxu98HCogElK4jEUKX/2hU/aZhK5XO2ZF0fFI=;
 b=TzU7ruEtKE/Omz0K6G7YqA18Dw8stdbR2F0aIUKItNRrwnHabW6VXhRJc/htaV1RY8X5HSsSdZjZm2EcifUQ07qQQ5u7UYz/oKH47N6iBFA+yHqP+PSkuWuLYf+95Ty4lbuufm0nGhVD5+x4dOHtZJ2OvDSmPgzwSo/r8bvd554=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sjoerd.simons@collabora.co.uk" <sjoerd.simons@collabora.co.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSBhbmFsb2dpeCBjaGlwIEFOWDc4WFggYnJpZGdlIGRyaXZlciBpbnRvICJhbmFsb2dpeCIg
ZGlyZWN0b3J5LgoKU2lnbmVkLW9mZi1ieTogWGluIEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDEwIC0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4L0tjb25maWcgICAgICAgICAgICAgICAgICB8IDEwICsrKysrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgIDIgKysK
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UveyA9PiBhbmFsb2dpeH0vYW5hbG9naXgtYW54Nzh4eC5j
IHwgIDAKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UveyA9PiBhbmFsb2dpeH0vYW5hbG9naXgtYW54
Nzh4eC5oIHwgIDAKIDYgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCiByZW5hbWUgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS97ID0+IGFuYWxvZ2l4fS9hbmFs
b2dpeC1hbng3OHh4LmMgKDEwMCUpCiByZW5hbWUgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS97ID0+
IGFuYWxvZ2l4fS9hbmFsb2dpeC1hbng3OHh4LmggKDEwMCUpCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmln
CmluZGV4IGVlNzc3NDYuLjg2Mjc4OWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKQEAgLTE2LDE2
ICsxNiw2IEBAIGNvbmZpZyBEUk1fUEFORUxfQlJJREdFCiBtZW51ICJEaXNwbGF5IEludGVyZmFj
ZSBCcmlkZ2VzIgogCWRlcGVuZHMgb24gRFJNICYmIERSTV9CUklER0UKIAotY29uZmlnIERSTV9B
TkFMT0dJWF9BTlg3OFhYCi0JdHJpc3RhdGUgIkFuYWxvZ2l4IEFOWDc4WFggYnJpZGdlIgotCXNl
bGVjdCBEUk1fS01TX0hFTFBFUgotCXNlbGVjdCBSRUdNQVBfSTJDCi0JLS0taGVscC0tLQotCSAg
QU5YNzhYWCBpcyBhbiB1bHRyYS1sb3cgRnVsbC1IRCBTbGltUG9ydCB0cmFuc21pdHRlcgotCSAg
ZGVzaWduZWQgZm9yIHBvcnRhYmxlIGRldmljZXMuIFRoZSBBTlg3OFhYIHRyYW5zZm9ybXMKLQkg
IHRoZSBIRE1JIG91dHB1dCBvZiBhbiBhcHBsaWNhdGlvbiBwcm9jZXNzb3IgdG8gTXlEUAotCSAg
b3IgRGlzcGxheVBvcnQuCi0KIGNvbmZpZyBEUk1fQ0ROU19EU0kKIAl0cmlzdGF0ZSAiQ2FkZW5j
ZSBEUEkvRFNJIGJyaWRnZSIKIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01h
a2VmaWxlCmluZGV4IDQ5MzRmY2YuLjAyY2I0Y2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZQpA
QCAtMSw1ICsxLDQgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLW9iai0k
KENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzhYWCkgKz0gYW5hbG9naXgtYW54Nzh4eC5vCiBvYmot
JChDT05GSUdfRFJNX0NETlNfRFNJKSArPSBjZG5zLWRzaS5vCiBvYmotJChDT05GSUdfRFJNX0RV
TUJfVkdBX0RBQykgKz0gZHVtYi12Z2EtZGFjLm8KIG9iai0kKENPTkZJR19EUk1fTFZEU19FTkNP
REVSKSArPSBsdmRzLWVuY29kZXIubwpAQCAtMTIsOCArMTEsOCBAQCBvYmotJChDT05GSUdfRFJN
X1NJSTkyMzQpICs9IHNpaTkyMzQubwogb2JqLSQoQ09ORklHX0RSTV9USElORV9USEM2M0xWRDEw
MjQpICs9IHRoYzYzbHZkMTAyNC5vCiBvYmotJChDT05GSUdfRFJNX1RPU0hJQkFfVEMzNTg3NjQp
ICs9IHRjMzU4NzY0Lm8KIG9iai0kKENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2NykgKz0gdGMz
NTg3Njcubwotb2JqLSQoQ09ORklHX0RSTV9BTkFMT0dJWF9EUCkgKz0gYW5hbG9naXgvCiBvYmot
JChDT05GSUdfRFJNX0kyQ19BRFY3NTExKSArPSBhZHY3NTExLwogb2JqLSQoQ09ORklHX0RSTV9U
SV9TTjY1RFNJODYpICs9IHRpLXNuNjVkc2k4Ni5vCiBvYmotJChDT05GSUdfRFJNX1RJX1RGUDQx
MCkgKz0gdGktdGZwNDEwLm8KIG9iai15ICs9IHN5bm9wc3lzLworb2JqLXkgKz0gYW5hbG9naXgv
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKaW5kZXggZTkzMGZmOS4uZGZl
ODRmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9LY29uZmln
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvS2NvbmZpZwpAQCAtMSw0ICsx
LDE0IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKK2NvbmZpZyBE
Uk1fQU5BTE9HSVhfQU5YNzhYWAorCXRyaXN0YXRlICJBbmFsb2dpeCBBTlg3OFhYIGJyaWRnZSIK
KwlzZWxlY3QgRFJNX0tNU19IRUxQRVIKKwlzZWxlY3QgUkVHTUFQX0kyQworCS0tLWhlbHAtLS0K
KwkgIEFOWDc4WFggaXMgYW4gdWx0cmEtbG93IEZ1bGwtSEQgU2xpbVBvcnQgdHJhbnNtaXR0ZXIK
KwkgIGRlc2lnbmVkIGZvciBwb3J0YWJsZSBkZXZpY2VzLiBUaGUgQU5YNzhYWCB0cmFuc2Zvcm1z
CisJICB0aGUgSERNSSBvdXRwdXQgb2YgYW4gYXBwbGljYXRpb24gcHJvY2Vzc29yIHRvIE15RFAK
KwkgIG9yIERpc3BsYXlQb3J0LgorCiBjb25maWcgRFJNX0FOQUxPR0lYX0RQCiAJdHJpc3RhdGUK
IAlkZXBlbmRzIG9uIERSTQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUK
aW5kZXggZmRiZjNmZC4uZDRjNTRhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L01ha2VmaWxlCkBAIC0xLDMgKzEsNSBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CitvYmotJChDT05GSUdfRFJNX0FOQUxPR0lYX0FOWDc4WFgpICs9IGFuYWxvZ2l4
LWFueDc4eHgubworCiBhbmFsb2dpeF9kcC1vYmpzIDo9IGFuYWxvZ2l4X2RwX2NvcmUubyBhbmFs
b2dpeF9kcF9yZWcubwogb2JqLSQoQ09ORklHX0RSTV9BTkFMT0dJWF9EUCkgKz0gYW5hbG9naXhf
ZHAubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguYwpz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC1hbng3OHh4LmMKcmVuYW1lIHRvIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXgtYW54Nzh4eC5jCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4LWFueDc4eHguaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXgtYW54Nzh4eC5oCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaApyZW5hbWUgdG8gZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmgKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
