Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190FED45CD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 18:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C756EC6C;
	Fri, 11 Oct 2019 16:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680111.outbound.protection.outlook.com [40.107.68.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1F26EBC2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 07:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3IwkygC1AMTN07vkq0dbTh7uHjZ15J1KvWcxV6ZeStHKJitUhA1Bsk5jUBecaFLGKbqEB1akx9/5nehVHbyy0g+F0O1gjUjy/TyKZmyl6R5Qk3OKpCR524nPJnGZkiqvN0Q0pQKr2y8ZQBr8bfzIg7l/gck9uGbNdmz5E2RpRNJGpQm0YH+ByV7AmRZG40CbHGp1N31MM0wt3FXPwb89MV1JHdCsaNQG7OcJKjkncnWirt2bzWTClhyogcb1Qp+do7XJzbnqMnyyw/uBxhUsnyjfwDxRlrrDb1h8ilXS5Wq5IcEqCeSXDasHkG2qo2uuztR1aRy1YTSBWcfEL1k+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDbHP/9aR2tv027b/L5g11T/XkXT4O5sq7twKVQLbdY=;
 b=f1wDcgK2ZbAxqXKgM5Ffmb+rcHmf99gaRBErMhDol8Wu+IrTTzn/ouUbbISv2401cLMCK33XFYy+4SdNUX+bHOYjUNVfvLQOyMjjmURyeSz0jBxXkmOqcvk3zW6xjYkiofdYA/ZZHY8Q0YJALO2miCwrxXP4vjIiq1x6V2TiY1poQsAswpf6EFDT4P38Q83eFlu/x8/Mfl/KD2EPxGX1YC+JHvo3j3D+ZgN+q2SQSMIkfhxGVnFfTvW6TwU5MZh7m8poJn2/iwqKqQz6LIxPGw/5xNSiy85EK096ZaxiMx0y1/T3Tc+S7eRdq0r/cegzEwnl54JlF1OWk9ji44bQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4846.namprd04.prod.outlook.com (52.135.122.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 11 Oct 2019 07:52:03 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 07:52:03 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v2 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVf9p+5jx9EdYoKE6ltb5FxvHRTadU9iCAgAAbpwA=
Date: Fri, 11 Oct 2019 07:52:03 +0000
Message-ID: <20191011075152.GA26183@xin-VirtualBox>
References: <CGME20191011022055epcas5p37790ed31cbe63d0be0f6b5786ce1392a@epcas5p3.samsung.com>
 <cover.1570760115.git.xji@analogixsemi.com>
 <1544211b-d2c7-601c-93b3-a130178b8697@samsung.com>
In-Reply-To: <1544211b-d2c7-601c-93b3-a130178b8697@samsung.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0058.apcprd03.prod.outlook.com
 (2603:1096:202:17::28) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faebfdc0-abb3-463a-ae1a-08d74e1fe750
x-ms-traffictypediagnostic: SN6PR04MB4846:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4846876866B4362557ADBD01C7970@SN6PR04MB4846.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(346002)(39850400004)(396003)(136003)(366004)(376002)(199004)(189003)(53754006)(5660300002)(1076003)(102836004)(446003)(476003)(11346002)(6916009)(7736002)(2906002)(26005)(486006)(186003)(305945005)(33716001)(6116002)(3846002)(7416002)(54906003)(316002)(6512007)(9686003)(229853002)(6436002)(6486002)(86362001)(33656002)(66066001)(53546011)(6506007)(386003)(76176011)(99286004)(52116002)(25786009)(4326008)(6246003)(14454004)(107886003)(478600001)(64756008)(66446008)(66476007)(66946007)(66556008)(8936002)(81166006)(8676002)(81156014)(14444005)(256004)(71200400001)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4846;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nBnOBEz8AiMnpPhMFXjd+SovByA1Nhe3/73/MT8gOhuI6LbW+4lrF13A2kD5EBW3VQBZqDdWL+Rn+/uNDTaMg8+guvF+3INltvygosPn5Ief9rNHmqRfOIVffY809kWhZQge5FYDHyFsD3wzKpK5sHMfixOuZYumNdlPpy9fB57GANFLydCug57Cmh3lcbZ18bLvP+51Suwp65do3CNkHo5zT8WxCkSSvNI1x2Nq/tWriRTxPYU/fX9RBCD2+HW/BbE/jjwUcSfe+lI0v8NvZzkMeikP4fYT0/tj+PMvohoV+2yhpHrfWFRqjwPjJ66r2WgJ1QYdnPjY8YI8z0yLcGRsJyJj1ai/grVah2zuRKMnqOtN2Z9t89eU1jhdPTcv9Z0t6CNx6MT4Fk9F8Se9+qWIgM9Y6F3BhPDVhBQsc88=
Content-ID: <F27D817832AD7645982B845ED0B03618@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faebfdc0-abb3-463a-ae1a-08d74e1fe750
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 07:52:03.3908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEr8Y0mZ96eP1+UNYXA6tGTra3o0/TWpTw1K8YPu9cPyV17vP1awgZ9KWLRSorsjYNYTN8vrwSQzR0YJXi0mig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4846
X-Mailman-Approved-At: Fri, 11 Oct 2019 16:52:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDbHP/9aR2tv027b/L5g11T/XkXT4O5sq7twKVQLbdY=;
 b=cS3PCk+zWubceG9BMFBYnjYhPN3dSkxFyHhAcP2QGEKAlVoPjIa3iNdiUAgXwM1LS/J4ieF2WUg9YrJy6BuXNzTauviOdNWZAUz28DVVHBbR20pF5znVNKBUYn4yV3mywETre9D8CzzPm9nUvTmIhATesfNga909Ef1xVv8DfYY=
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwgT0ssIEknbGwgaW5jcmVtZW50IHBhdGNoc2V0IHZlcnNpb24gbnVtYmVyIG5l
eHQgdGltZS4KClRoYW5rcywKWGluCgpPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwODoxMjo1M0FN
ICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+IE9uIDExLjEwLjIwMTkgMDQ6MjAsIFhpbiBK
aSB3cm90ZToKPiA+IEhpIGFsbCwKPiA+Cj4gPiBUaGUgZm9sbG93aW5nIHNlcmllcyBhZGQgaW5p
dGlhbCBzdXBwb3J0IGZvciB0aGUgU2xpbXBvcnQgQU5YNzYyNSB0cmFuc21pdHRlciwgYQo+ID4g
dWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQgNEsgTUlQSSB0byBEUCB0cmFuc21pdHRlciBkZXNpZ25l
ZCBmb3IgcG9ydGFibGUgZGV2aWNlLgo+ID4KPiA+IFRoaXMgaXMgdGhlIGluaXRpYWwgdmVyc2lv
biwgYW55IG1pc3Rha2VzLCBwbGVhc2UgbGV0IG1lIGtub3csIEkgd2lsbCBmaXggaXQgaW4KPiA+
IHRoZSBuZXh0IHNlcmllcy4KPiA+Cj4gPiBUaGFua3MsCj4gPiBYaW4KPiAKPiAKPiBOZXh0IHRp
bWUgcGxlYXNlIGluY3JlbWVudCBwYXRjaHNldCB2ZXJzaW9uIG51bWJlciAtIHRoaXMgaXMgdGhp
cmQKPiBpdGVyYXRpb24gb2YgdjIuCj4gCj4gCj4gUmVnYXJkcwo+IAo+IEFuZHJ6ZWoKPiAKPiAK
PiA+Cj4gPgo+ID4gWGluIEppICgyKToKPiA+ICAgZHQtYmluZGluZ3M6IGRybS9icmlkZ2U6IGFu
eDc2MjU6IE1JUEkgdG8gRFAgdHJhbnNtaXR0ZXIgYmluZGluZwo+ID4gICBkcm0vYnJpZGdlOiBh
bng3NjI1OiBBZGQgYW54NzYyNSBNSVBJIERTSS9EUEkgdG8gRFAgYnJpZGdlIGRyaXZlcgo+ID4K
PiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1sICAgICAgICAgICB8
ICAgOTYgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgIHwgICAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvS2Nv
bmZpZyAgICAgICAgICAgIHwgICAgNiArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9NYWtlZmlsZSAgICAgICAgICAgfCAgICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyAgICAgICAgICB8IDIxNTMgKysrKysrKysrKysrKysrKysr
KysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuaCAgICAgICAg
ICB8ICA0MDYgKysrKwo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMjY2MyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMKPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1
LmgKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
