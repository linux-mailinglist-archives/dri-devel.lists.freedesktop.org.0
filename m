Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55AD212A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6270089E32;
	Thu, 10 Oct 2019 06:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690138.outbound.protection.outlook.com [40.107.69.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FA76E948
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DscEbjNDUiX9yCoT4Ut0AN+gbQ/Tqzzls3DdmYSty0qEPlx6tNQeBfm/z1/6ZGwJyKPWRAPRXGzedWY0F1WUpyt4iOX55d5hG2SqZak9pu8OaIqWC6y95ekXSJLaGBV1vOf/k8I2S6/OcqMs4pn15Re79vAKDy9c0etkEHOGrEzwtydd1nrDH9b3kCQT624zkEefuCIXvjJoy0H1OK3DS2S3EfxMHTEuZ40TzHVrSxFt8d6r5Rnqqcov1ERV2aEsKFdKfW28hmVaAK0HWxUOKSVjk0v4YgbkH1n8WtD7QKCHgSfkO3jKw17LnXsVx3Fmn/b3ZLyZYpAYo1KrzM/dQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wc3gziDxfcrKbVFHOuVjRqX4rV3mucuBugsEpDqPV0=;
 b=RIO4spvAVkS+PGDjHL/8bMecHAAXsetdMpV/rPHBqKxvyHYpEMuNXA1jBCQKk50Cw0F+49mPu1alPHfptFK4ajclHmAhgddd4GFjKCpV9KJivvFcBoA52z9WI/xy23RdwEOquOu2Fk4U8IJJ/WHOF+PASoRlYZs3nePHI/wJkPdxViQnEW1WJ9+CzZyPVoiRwzFCbUVbt3/Ne+AOfWKo6zfmhEtEGt1JgIfcOYtipHU81eNQCG5sug7xyAjiP7dooAtuHDWTZi5ka9UGN73B4XbeHdG7+frYsqbJu1+KA8Vlvh0uOTK4IwOB7TMl4A/6kQPl+1s4is01l6JFKnWXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4189.namprd04.prod.outlook.com (52.135.71.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 09:26:04 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 09:26:04 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v2 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v2 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVfoOS3d9g7hjY1EGIP5Au1gAgGw==
Date: Wed, 9 Oct 2019 09:26:03 +0000
Message-ID: <cover.1570588741.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0078.apcprd03.prod.outlook.com
 (2603:1096:203:72::18) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 425c2daa-e794-4980-ec94-08d74c9ab4c1
x-ms-traffictypediagnostic: SN6PR04MB4189:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4189290DFA1D7EC90293ACE7C7950@SN6PR04MB4189.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39850400004)(346002)(396003)(136003)(53754006)(199004)(189003)(478600001)(64756008)(66476007)(486006)(26005)(66946007)(66556008)(66446008)(2906002)(186003)(86362001)(2616005)(476003)(52116002)(7736002)(66066001)(71200400001)(71190400001)(99286004)(305945005)(54906003)(6486002)(14444005)(6436002)(8676002)(25786009)(7416002)(81156014)(81166006)(8936002)(107886003)(6512007)(102836004)(14454004)(316002)(4744005)(5660300002)(386003)(6506007)(110136005)(3846002)(4326008)(6116002)(36756003)(2501003)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4189;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ukp2VV6yRjtGBvbfeaq39mPNB1GIHac1P5wVSgASUoFYkcpObtAbONlU1y6DPzm5sLFMYwqvkeph4awJUCHYHi0qg+a9f1nSR9uSK3Vxxdyjc/r0ajOu7rIN6ziiiqIY96cpA5RI+LsZybzdMtCaL63Wyy38j/FusydnbW84kBAcQhiLZz89Cu+VUwe7HNopEurhKFnTt0fuIyluyx5C5Btw3brxak1AInXpS5xOmMn5kgqE48SqXVwPPjQrdgxwS3jHcdm/Fqol1nuvTXRKFV34xVr7gEeuDosfpjkaqq94nCa9QJlG+AtBcdMTaSrLcqufqDi9wtsVH5yAIclBsn+rNY0fKmJSdpeP10UjKm80l18NlRlsWMSaBaZzw+rvmr9A+iJxWZv4v+Dz/l+oy9bv4LL47a+ShrvL09YqtEA=
Content-ID: <9EF0647850BBBD43A19B70FC675983C9@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425c2daa-e794-4980-ec94-08d74c9ab4c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 09:26:03.9375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8XexzTBX5aV6NxcIJaQxcaF7InDMHCXUsu4MvtESIfjcInPd9At+2cOP8i2neQoEVHGZFO5zujKprjwGZWkThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4189
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wc3gziDxfcrKbVFHOuVjRqX4rV3mucuBugsEpDqPV0=;
 b=u6abLSXny0wbOW9HXGazwbUpa2UgFBSihIuitdjmY8VflkqoPRn8Yb61Yu0FrzETmGpReab20yI49Hny+ZCgr4ezcRJN1V6AP4alST9tvxbteE3d2SdjUF88oILLucJDiynlyDFDox/5HoZhVIzv8RhqZyrDbL0F/ja8RXgZ1AU=
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
ZGdlL2FueDc2MjUueWFtbCAgICAgICAgICAgfCAgIDc5ICsKIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9LY29uZmlnICAgICAgICAgICAgfCAgICA2ICsKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyAgICAgICAgICB8IDIxMzIgKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5o
ICAgICAgICAgIHwgIDQwNSArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDI2MjQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5oCgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
