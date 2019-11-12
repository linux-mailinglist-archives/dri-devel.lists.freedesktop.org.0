Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76530F8A3C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF1A6EA61;
	Tue, 12 Nov 2019 08:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720134.outbound.protection.outlook.com [40.107.72.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623666E365
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 06:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ic9LVJdQVfvDOr5fw2TSQYYMKpBpcFFoY8JeuIC0Rle7cGF12GSGrXH7+miLJSDyrvbeAuHYcUaxA+s82lMo9234JTHCZOpbzb+3+rV0DuLVhbIdsHwkH1jnZqBnBjurvDUTBm3tsDU+01L8cDffjjK7cdT9rIxmIBnH8L982JSN6CwFXLiwtOvwHxPbeM3pZQmSva4IR7+JX3fH0LvWGMAokLQa/1iwnU9RjIceDlxidwu5mxS5wS4s3Lb1Yt7I6VHcVwHUT68+4v+Ze9wzljeIhRtM+0IQOTYVrf7+q9+JsZzSpLPXYyoO7a8BceZGB/BwVXqbgWxioDrXdpj2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DvtEIlgHiZ3p8b7Of0Jjvzozu6ePAPPD1f8skNjvgk=;
 b=UID34PAFcoEokcz49XPjrjQZxkohMBGbJJWHpVb2v/aW2ofkhCMWedI78vovUwRqw6MbEYKrGFBXlQ7E/yjY9ZnEjwCi64hCzvD26Stzk+SfuIO9W2x+zwnUMLmnjilOtYX3CFivmvopoFH2xxNNq6wS0Je9hKjEUaUy54VW5/sCM1x9GuZ77mtqUtsjyj761NrYxUMYEpBOywLFWIDlqwQ6ppI3t1h99Bn/RSgCjxjsXY9p7ejknFe2jkIkmW6eWlp1ViGWuYwDblRnRZXwF1FXPGIX0f41sCdymQNrMpxpeytxPZgAZ9ULrBa0FOb6V+j0D/HxbYiHaVLErasAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB5424.namprd04.prod.outlook.com (20.177.254.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Tue, 12 Nov 2019 06:32:16 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16%5]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 06:32:15 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v5 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v5 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVmSLsP5Ss0Kn5Z0aTDg3uikCeVg==
Date: Tue, 12 Nov 2019 06:32:15 +0000
Message-ID: <cover.1573540100.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::15) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856406a7-a30e-4059-69fa-08d7673a0f2c
x-ms-traffictypediagnostic: SN6PR04MB5424:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB542420731E0CB7956DA29201C7770@SN6PR04MB5424.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(366004)(376002)(396003)(136003)(346002)(53754006)(199004)(189003)(6512007)(36756003)(7416002)(476003)(7736002)(486006)(2616005)(66066001)(81166006)(81156014)(26005)(4744005)(478600001)(305945005)(14454004)(8676002)(4326008)(8936002)(107886003)(66476007)(66556008)(25786009)(64756008)(66446008)(86362001)(6116002)(6436002)(256004)(3846002)(14444005)(66946007)(110136005)(71200400001)(71190400001)(186003)(5660300002)(2906002)(6506007)(386003)(316002)(102836004)(99286004)(6486002)(52116002)(54906003)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5424;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /a3im8wrIg/FfdH6VVLozrQTnrpYFuu8Kb/atw8eXtgm7Cd0E0PtrTYG0Yt49fHRSMwFkQUM78oC0XK25CtWtBQ/blDC1bZ0SwfB0/JjMpXvxz6cuF9XE+xDF62N6brm4GRoWDyg2Ew/1HID0UJ2KDzCHNRSOox4x9WRH8Lt04wSfjTYra13cMwP5tFF6ye5oxIGnlaIIuaQ79wTDbvKab5CfJBF1kbf4rXIRjWipGgqvtCoCvKtaPNIyWzrAMMLWNjiXKUbUA9QFoGeiKsdfEaqMYSbzf6PrMEBLbawNwaarM6QrNeqIpltm1XddeYmQgo+upYeYRNI2k9lEusEnCPSVVMCeR4+fhfOjJV/qsQwwZOxLzw8sMEed3dpFuD5YBOTwO3hQe+3YytDA9dtZr2vHpGLifMLSeMXYtm79oW2pwAue7Ex/gruxTkspohi
Content-ID: <2FF7CC8B9914D04AADAF488FF6856BE9@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856406a7-a30e-4059-69fa-08d7673a0f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 06:32:15.8566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PtdMUHLvw9AFAy8jZIlbLI77VczzHwPBfHM3aW8w+P63zO909Ok7p+JDCqVGIduXRe+bHesyGUhU01FAs3254g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5424
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DvtEIlgHiZ3p8b7Of0Jjvzozu6ePAPPD1f8skNjvgk=;
 b=MILnKfgXSqfW8ojDo7TnhKLXa1QDIO52DlhtehrDZxlWDotQ6WiG8N7+EObvDGiNeztpSM1vLT9+4MP7NzXvfBhz5NGeaC9xUg5C3bBF39n/L0MZBra/Ou1sW49gTcQt/1N5dVq0cnPgAc6HY6xIrD84oH11sZvx7oTIHFEoXPY=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhlIGZvbGxvd2luZyBzZXJpZXMgYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhl
IFNsaW1wb3J0IEFOWDc2MjUgdHJhbnNtaXR0ZXIsIGEKdWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQg
NEsgTUlQSSB0byBEUCB0cmFuc21pdHRlciBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlLgoK
VGhpcyBpcyB0aGUgaW5pdGlhbCB2ZXJzaW9uLCBhbnkgbWlzdGFrZXMsIHBsZWFzZSBsZXQgbWUg
a25vdywgSSB3aWxsIGZpeCBpdCBpbgp0aGUgbmV4dCBzZXJpZXMuCgpUaGFua3MsClhpbgoKClhp
biBKaSAoMik6CiAgZHQtYmluZGluZ3M6IGRybS9icmlkZ2U6IGFueDc2MjU6IE1JUEkgdG8gRFAg
dHJhbnNtaXR0ZXIgYmluZGluZwogIGRybS9icmlkZ2U6IGFueDc2MjU6IEFkZCBhbng3NjI1IE1J
UEkgRFNJL0RQSSB0byBEUCBicmlkZ2UgZHJpdmVyCgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2FueDc2MjUueWFtbCAgICAgICAgICAgfCAgIDkxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9LY29uZmlnICAgICAgICAgICAgfCAgICA2ICsKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyAgICAgICAgICB8IDIwNDQgKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5o
ICAgICAgICAgIHwgIDQwNiArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDI1NDkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5oCgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
