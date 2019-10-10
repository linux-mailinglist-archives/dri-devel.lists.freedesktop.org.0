Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84883D398C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36906EBA5;
	Fri, 11 Oct 2019 06:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::720])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7FA6EAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+fjN8W0MF40MyMgExkDwXM5lg3OdWpYf37L8hswIqQfuWsN0ZZtAIeU6WpSOwXEIvTPKn7Q7mOywifU8gpDqUwEWjHaJ1jhE44VQXT/2Vxi52NqVcX4GJtuf7vjombfEbiXp+01JKNEQNvHH1tjbyUy4nJUiD5TPykbxeNElasgK44yz2sX3B4OxTIgYwqqQ1oy4jR4ndA6RAvvBWGzKJWmYZuouYkzpFRttUfIA5DGdvvusQRw5zxY0jiQhrjk151SUW8H1G5W4ULMNQXVFfH1p3RgBjMrraa7x3gHXO54XmbpOZ8/xmzZ/qehExF+vwfOeA2tEMEI7y5VchsdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMPvfG55FZUqtBg6uq+Nf2D/eTESknfNUSOnWMpsW5Q=;
 b=cKebEemjgleE1w6gd1wV4BstUQME1xUl69WR4k90PtpEvcTs3KjjPfxMGlG+AC5zkVlgHG4wrmuezkvJ5xXN1UqfeTPt+HEVBpOAho7i6sohw/8GDH5wX/mDpru8e0zCWo8aVm1Cgk8qOKunriPq0HZZdT340PmeRRPqQQLNe+zcpJKYEWgIT0qosaQAHxeS0HVrd2B5NvUJfyhnXX+kHe3llo4b7FXPQ00TMLtlP2WNC0/gEhJaUzLAaEMPLlh5ImEk8loBLU2zIIuyQ0NEtmeR9N96fdqFLiJYanYL8JDA6bOyEWNpP+i404dk/SFXXWtOsa63OaplDy+DuAlobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB5374.namprd04.prod.outlook.com (20.178.6.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 10 Oct 2019 09:31:51 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 09:31:51 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v2 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v2 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVf02Lgtx0676fOUSsX2pXrX7r4g==
Date: Thu, 10 Oct 2019 09:31:51 +0000
Message-ID: <cover.1570699576.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0066.apcprd03.prod.outlook.com
 (2603:1096:203:52::30) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 593adf43-d261-42f0-e6ad-08d74d64ae1a
x-ms-traffictypediagnostic: SN6PR04MB5374:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB53741CBB8E2E59BB3BF90C22C7940@SN6PR04MB5374.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39840400004)(136003)(346002)(376002)(199004)(53754006)(189003)(99286004)(4326008)(71200400001)(71190400001)(6506007)(14444005)(256004)(52116002)(386003)(316002)(305945005)(2906002)(7736002)(186003)(102836004)(478600001)(25786009)(26005)(14454004)(66066001)(8676002)(86362001)(6436002)(5660300002)(8936002)(2501003)(81166006)(81156014)(4744005)(6512007)(486006)(54906003)(110136005)(7416002)(6116002)(3846002)(2616005)(6486002)(476003)(66556008)(66946007)(66476007)(107886003)(64756008)(66446008)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5374;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lu9lPA8AdBRq+fzdpGE0KCtNyxe8Bs886wV+6yHDQuCrGyO6pCpRx+7LYDTVzeE1agMH+G99cvqK1Usv98T1/3z8kIkyF2SfZvPDZMRpkDar2k1OPLC4xXA0ZA2dd8BmCZXGzoj2aolujot1QXkTF6LoXbvVDpcVFmgz/Q09pVS4FPTvuz9i+BPAmv9otDixiuLb2WmY/KfvlYjbrkF98mIF7/zSGcSHOmeBQUihm53r1CvfrutCuY2HJ2fEm8fBsD018Ao+DrY3rEtitlXGVm9RPz2jHDmLnlMq63JkbZAAmiWDPOl58JrNWol4QnU/qeYPpfDAGlAPr8IDrf3Kx09R0R51pPIOkvHVbwJo/8xBmgVLzO9CDnrdoHQY2DCgon1NOBIsZEDI+ikjoStq8SaQnRDl+cYjQQMTmjolZaA=
Content-ID: <A0B40718F7C5ED4A8177B42D35AC70E0@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593adf43-d261-42f0-e6ad-08d74d64ae1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 09:31:51.0800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PkcuvLzHXpJSZDQdjv1oAB78qcudGcsNPEN1Rm4gjVK+jddTuE0OCUcEBq4rnLi4Zg+OxKF1wGf9S3YUJdr7+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5374
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMPvfG55FZUqtBg6uq+Nf2D/eTESknfNUSOnWMpsW5Q=;
 b=rukj2oPXM+SC/zcECLFaZhCtKf+I9PeJdBeIDOACb8kRGPs8VXyAYjqAP1K22+gpvxKURvboudwxfB4AfycjaO4vsC+UM9IHIslz0mbVjTc7fsNjmDozmMCDYl0sQmSD3JMzsUG6JX3RPqbCEWzAQ3T6IP0U+ier/fOeikQVkTE=
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
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
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
ZGdlL2FueDc2MjUueWFtbCAgICAgICAgICAgfCAgIDk2ICsKIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9LY29uZmlnICAgICAgICAgICAgfCAgICA2ICsKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyAgICAgICAgICB8IDIxNTUgKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5o
ICAgICAgICAgIHwgIDQwNiArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDI2NjUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5oCgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
