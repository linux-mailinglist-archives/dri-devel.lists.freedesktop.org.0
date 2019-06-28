Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1265961E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309D06E891;
	Fri, 28 Jun 2019 08:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800105.outbound.protection.outlook.com [40.107.80.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881DE6E87E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=Uc2rgkiIm/rKgrKPoHWYfsia27P5ZSTQ7pgjl0gdKfYuouKyb1k0MEFmm15vFdRIyEpK0ERn4+HHdVrPPUWL0CYYVSraDmxrW6cNdFJEEFMC2I1OVOZX6GHrqU6zm4DSo3m9iQpQjHyJdQjnWBYMUeRt371GCFMV5PTKoAQEAU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1l5Z0vYbqYP7KSTi3kmtsxMgBFD18PPqdWQg1taQ8k=;
 b=SBef9vcl/ByCcIjvX9PZlpmA62c9RfA1xYYVq7g+S2aW4owMCMAOltyti84U5K/Ngg8dhoCxbYNi1eJ/Q4K10fKsqXHLkClSrWTwDSbBl1JDxLjWR1piOk2OM/0WkMpY0eh8PvGycZ8Yb80HmB7Ts1YMOMUfbvm3FfPvaFPtkTM=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB5726.namprd04.prod.outlook.com (20.179.21.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.18; Fri, 28 Jun 2019 03:00:05 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635%3]) with mapi id 15.20.2032.016; Fri, 28 Jun 2019
 03:00:05 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v2] Adjust analogix chip driver location
Thread-Topic: [PATCH v2] Adjust analogix chip driver location
Thread-Index: AQHVLV2WCWeZm1Hwg0iNc/LOCnv60g==
Date: Fri, 28 Jun 2019 03:00:05 +0000
Message-ID: <20190628025957.GA16108@xin-VirtualBox>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:36::29) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad8ee2a3-7f84-4d6e-e486-08d6fb74b859
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB5726; 
x-ms-traffictypediagnostic: MN2PR04MB5726:
x-microsoft-antispam-prvs: <MN2PR04MB5726452372BCF3A88EA6FA7BC7FC0@MN2PR04MB5726.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:177;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(396003)(376002)(39850400004)(346002)(136003)(366004)(189003)(199004)(476003)(66476007)(66446008)(64756008)(81156014)(256004)(5660300002)(2501003)(33716001)(2906002)(86362001)(66556008)(66946007)(73956011)(71200400001)(71190400001)(1076003)(14454004)(8936002)(110136005)(486006)(6116002)(81166006)(8676002)(3846002)(26005)(316002)(54906003)(53936002)(25786009)(66066001)(186003)(99286004)(9686003)(7736002)(4326008)(6506007)(107886003)(52116002)(305945005)(6486002)(478600001)(102836004)(33656002)(68736007)(6512007)(386003)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5726;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oTfQZaLkek8/ipkHWISD84b2A19OyXztbcXnmwoTE2JDVNAjGfaTrW1w1RjPYTwnqfS8su/qXDd5CvWwG7hC1tykLWQaUsVWcbrJmIqvyUtjpNDbtTvuIboSYIT6TDAexRGE4B3+k2F4g69XJ+S4gKK7ktZX9PrUgDswUFJFnLiqJr0uIITNHM7dQ3m7yq4AnN+/w9n6wyHIBldNAXRhEm9JXoNQvCqva6g2iTQ0sA1rdB/xgCyOQv5sMx78NV8wn37+D3s7dELD7XaGu87kupbqV1sP2MnY79cfZW43tOneq018y72YiLqOVvpdyq705YzZLCd8nDu3HubZ0d2AJjAZxfbr7117Xkuin+ItNcFJx27v0hay8fGn96ojR5rZTI8ch1jA7HmuX39J2oYDhSavnahDAE1V0naFreWfeOM=
Content-ID: <7B9E23BCA8BDD34EA3486D765F48E57A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8ee2a3-7f84-4d6e-e486-08d6fb74b859
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 03:00:05.0379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xji@analogixsemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5726
X-Mailman-Approved-At: Fri, 28 Jun 2019 08:29:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector1-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1l5Z0vYbqYP7KSTi3kmtsxMgBFD18PPqdWQg1taQ8k=;
 b=BQYZaSpddyHy5qH581WiXcXmUs833otM2wwWWv4znS/viNrS0+ACkjXNMrptTSS+vobJtUGgjPuRlZCxdXk3cCBcoLEHAdXeep0bjoI7QCNoRFQrZUIE4soHtBnND5tAyOMnQ0uddVNhwrXJ54CJhtofGRMv5RlWVNPYkHYZ9xk=
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
a2VmaWxlCmluZGV4IDQ5MzRmY2YuLjIyM2NhNWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
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
MCkgKz0gdGktdGZwNDEwLm8KK29iai15ICs9IGFuYWxvZ2l4Lwogb2JqLXkgKz0gc3lub3BzeXMv
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
