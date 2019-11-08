Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AE8F6CA5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748426E7CA;
	Mon, 11 Nov 2019 02:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820137.outbound.protection.outlook.com [40.107.82.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF496F8B6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 08:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnIiw+bO66YeotkXTpkaOFzJ+AMXcf7Etn4WhT5zmoYrABEl2nYTsM0Ju3urlWS+Qp1XdqMqrkmDwur/qr2+3OW3BKvoOqwvPZMuajz60DCkEMs4uehqs8ArJNX7kQnysJ94LFHMNyzQQhqp5e8IpnQu/33/vFdO1gdNAyj49gsFmLxYIBLtjqbSWpp9Sj+xpHgR4H6DjPpwAdrM5ZjyliOUKkacL4LefHDmLu5h5dS3Tx74bW7yhBXutaXzE950DfM+fV1i49g+TpvcyKm68J5XYGO2RHe2Us+zXLDFyiKj1qbXphfgoOaQztdXibxKr0ZdB15yVPhY8JfTy414wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFjHGx+Kbi4l1RRILG6GNPCOWVs6nm9FnVIb1i+4AlI=;
 b=ku5Vh00EsLRBB95AD2XNDLXt3dpUOr6Aia7YRCXghLZnpHKyQ3BIASu+exGA6OsKjCBED2du/MgaBCZJo/1y3SPvGoPuy/g1dJ7J17tZZxWce2YMf9HP6Myt5AOmw/6KZf244aEbF9c0OGhivv75CReaijTa7CW0/+sNqNBvhw/Ez5/NALbMBo8zNYhTocGv1w0f++UKzwAns2sSrLdGUtzCcGHOhRpgKsA3hJpHLELJYcLyRs/RgEh0w+EztrzHCKHyhFx0tv8k5E91s0beHz5fFFplw1kJsn47ar/+8zJb0bRfx6vGQVoEHF7hhQYGomkiteNes7R/vifA0vRy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4942.namprd04.prod.outlook.com (52.135.114.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 08:58:33 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16%5]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 08:58:33 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v3 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v3 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVlhKyDegwd7ihkkKNeWETzvlDsQ==
Date: Fri, 8 Nov 2019 08:58:32 +0000
Message-ID: <cover.1573203022.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b7fcd43-e3f5-4cde-c833-08d76429d506
x-ms-traffictypediagnostic: SN6PR04MB4942:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB49422FF7DB19E00A42F8834AC77B0@SN6PR04MB4942.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(136003)(39840400004)(346002)(189003)(199004)(53754006)(71200400001)(256004)(2501003)(486006)(8676002)(54906003)(2906002)(6486002)(107886003)(6512007)(14444005)(6436002)(2616005)(4326008)(476003)(25786009)(102836004)(66066001)(8936002)(26005)(7416002)(52116002)(7736002)(66446008)(66476007)(66556008)(66946007)(99286004)(316002)(5660300002)(86362001)(71190400001)(186003)(36756003)(305945005)(386003)(81166006)(110136005)(81156014)(3846002)(6506007)(14454004)(4744005)(6116002)(64756008)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4942;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yC6yXjseGYJDvZwI/86y2n+L8lhMNukUdLUNKL6zW2/dWOjVg9g5+tli/ecbTEinvx5QE0k3pSjwI35zII0zuHbL/IRrk+nAhIWhi/yqFTTp8Z3dzAnj5A6T3dW0KGhPceu5Ej/1qtECcu4Y/Nr6mXwxWpIZKb7XeHtBhHxDDjhCrJIsTUABEvO4mjCez7GiHm0/giqX8fV3RBlpLc3wVTgGg6qeLZnkwROefnKV1BHYlr6rS3O6VWpAXWqxiEZSatDMuuZJVuzSe4WvBFoIImN9XkZKgpO0quguSoa0alh1+30Z1lbGaYjLNOe3eke1KNW00+FCT8vqpZLqN8/608QKqH996bnKC/TSYTs/PySlO3oRdQoVgtUkkWFoEcXCONrwxe7KZRt/0152bz9xs8AZ5RTufHO5jrMEQbeyhVdVx1SITgTKZsp/2F57PnUv
Content-ID: <A34ACF29C0458440A376E7E65BEB7237@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7fcd43-e3f5-4cde-c833-08d76429d506
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 08:58:33.5727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bldGUqKQtciGaVAl7woIAebFJbKso2XUttYXaumBVa4h7hBYBYimQO1ftF5EiCs1WdHHFbY9fcDaLD9fX/VYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4942
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFjHGx+Kbi4l1RRILG6GNPCOWVs6nm9FnVIb1i+4AlI=;
 b=mownslAcagLZSPAOYdRrYbvytNbTIY5XbAR5GTqIutPw1Bedj8COCetGrouMXlvpYq3iou+5VbqJKO6cNkyPC9uGXFSGUpxlHIGlPRg1AnfbvFyZs8nuq0wQzf03wfYLml1bwTZvIW/d/aRTDNi7mJ7Ja8F2WEfOwPLlZE1aLbA=
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
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyAgICAgICAgICB8IDIwNDIgKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5o
ICAgICAgICAgIHwgIDQwNiArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDI1NDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5oCgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
