Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358ADE549
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 09:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E7489A76;
	Mon, 21 Oct 2019 07:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B048E897C5;
 Sun, 20 Oct 2019 23:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOYYHdEt9B03wMPEQU1g5Py6eIsXsJMzQ29+YAMrohQF4tvnbA2QSuLX35nle6NtD6ftB1IfwhuO6PWxFtePaQq1HvClgK6WTIVUT5la5kCUTYLPYJr0AgXCV/ULetBkLbT6LzBE7E7BrflQ5XLr3OOYQzgL+IIF8DNe43FfZQnzH6+dWveljXGxrEI60MOPAY7IKkuB2WDfbSMHNBW+UWLOv8vXY1a+ahi7bGUh01jNMdx2gRkdvc7G0XEoNLMFuxb75TSoB0SFIRZk990SxhDMNW08Se4iKj41L2ElxZkEUrmc+5SbnwI9io4EBQ/0o788rti/gbJsFLGD6dxpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtsxWHowPY+SYyqBT5x37OPRU/hvFI0uduGFMCW4g5c=;
 b=KDfdvojgSWlWwYuJkESlPRddb2CD/kW9RkD0zdktp0nFe+s9aKNdTKZtTVX755EFQzLAivFSz1bg9CRX2fGrQ5P+NmXTFtO8DTDrZiY/b98JS0TTCJUa5o+D+VZDmWuQF8Uj+b3QBL7SjDZZcB5SwrMzlvUgsQRzWI3aB6UYHAkYCmoOLoK0Ob4N6uKUcmpk2kJidLfUOiNdtzpIBfom15UZjigjT3I5Kev3wN+mbro6+AFFOyXBkweDrdt9EH85RE1LWyQ9DAjwYsNo5jS8tJuD6z65MHThiiHQM23RPzs7EZ95laDtt7XyIKjl5eNAmCppOV3Ctdx8HiFqwsCNgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com (20.176.214.160) by
 AM0PR05MB4690.eurprd05.prod.outlook.com (52.133.55.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Sun, 20 Oct 2019 23:25:17 +0000
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432]) by AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432%7]) with mapi id 15.20.2347.028; Sun, 20 Oct 2019
 23:25:17 +0000
From: Parav Pandit <parav@mellanox.com>
To: Jason Wang <jasowang@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>
Subject: RE: [PATCH V4 2/6] modpost: add support for mdev class id
Thread-Topic: [PATCH V4 2/6] modpost: add support for mdev class id
Thread-Index: AQHVhNi2EUWuA567NECmSzAAowpnoKdkMTEw
Date: Sun, 20 Oct 2019 23:25:17 +0000
Message-ID: <AM0PR05MB4866D3AA8112529F0DD40FC8D16E0@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-3-jasowang@redhat.com>
In-Reply-To: <20191017104836.32464-3-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2605:6000:ec82:1c00:4571:4eb1:2e3a:4d72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0483f3b-1aac-4987-af89-08d755b4c48f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR05MB4690:|AM0PR05MB4690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR05MB4690300D59D287DB93E5A4CED16E0@AM0PR05MB4690.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 0196A226D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(13464003)(199004)(189003)(86362001)(14454004)(33656002)(55016002)(2201001)(446003)(476003)(256004)(7406005)(316002)(7416002)(478600001)(11346002)(229853002)(486006)(9686003)(6436002)(74316002)(7736002)(305945005)(2501003)(110136005)(54906003)(71190400001)(71200400001)(5660300002)(102836004)(6506007)(53546011)(6116002)(66946007)(99286004)(8936002)(76176011)(7696005)(8676002)(25786009)(66556008)(46003)(52536014)(64756008)(66446008)(186003)(4326008)(66476007)(81166006)(6246003)(81156014)(2906002)(76116006)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB4690;
 H:AM0PR05MB4866.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l7EEocA8BJNKWnBlIdikpBgOfGR7+8M7dMj+lIx8Lg6tkaFgMLUWmyg3fPjrTDD027hRIYpsYU/Bhtv5Hc7fY2BYWpMlmiotGpcaAfuVHT29xW3EbKQ5jb6trYGnz4hU35Lro3qxLrtCozm1zNY8s3BsjHRNUagroQONnyHB/xehh69His7EGM/SHmMODnmjDWUfJ/S5LRlZ+E9W7eY6T6p94oN/V/tYCpdx17bD0Lfy8fJzngRHiFrAfkED71+ZSLJXN0m2d1cUQUjdlYyAVAHkisYc9bvhQRgSiq1io8Vl1Lg0xN2fGFYx1JAUZqiJicM75WKgg1daDjf4vs+YZdyhA2ZoCRx4CjBHk7GKWhY8GQgH/rt++LAS9xcY75x5ipgFDUdkTKvv/BRG3IEq59FMWuR00er77uF6Kb22eK4=
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0483f3b-1aac-4987-af89-08d755b4c48f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2019 23:25:17.4500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZzQnSiU1LTyCD05KqrB0d9X7QDWDM4Be7GvI8BZvx/Af5JygSRUi7LRSztKgMjlWgTvGaddfwgfQxTLfhBwFQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4690
X-Mailman-Approved-At: Mon, 21 Oct 2019 07:26:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtsxWHowPY+SYyqBT5x37OPRU/hvFI0uduGFMCW4g5c=;
 b=qKpXLUQW2tph9WRVniLMjyUmL5r9+JFX1ca12E67B/KsYztNrcrWSJ4klS5Cnp72Bv+YlBFRWxu27q2Lqi1FfmnA/m9ICUslZ/RzWzL77Cg0XZiBTzbCr3tqfsi2eesRbSHED9RzhUnyD7wKqTGTfEmJi+SHogp1xIjGGx5UkTM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=parav@mellanox.com; 
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxNywgMjAxOSA1OjQ5IEFN
Cj4gVG86IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnOyBs
aW51eC0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBpbnRlbC0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsKPiBrd2Fua2hlZGVAbnZpZGlhLmNvbTsgYWxleC53aWxs
aWFtc29uQHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29tOwo+IHRpd2VpLmJpZUBpbnRlbC5jb20K
PiBDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IG5ldGRldkB2
Z2VyLmtlcm5lbC5vcmc7Cj4gY29odWNrQHJlZGhhdC5jb207IG1heGltZS5jb3F1ZWxpbkByZWRo
YXQuY29tOwo+IGN1bm1pbmcubGlhbmdAaW50ZWwuY29tOyB6aGlob25nLndhbmdAaW50ZWwuY29t
Owo+IHJvYi5taWxsZXJAYnJvYWRjb20uY29tOyB4aWFvLncud2FuZ0BpbnRlbC5jb207Cj4gaGFv
dGlhbi53YW5nQHNpZml2ZS5jb207IHpoZW55dXdAbGludXguaW50ZWwuY29tOyB6aGkuYS53YW5n
QGludGVsLmNvbTsKPiBqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb207IGpvb25hcy5sYWh0aW5l
bkBsaW51eC5pbnRlbC5jb207Cj4gcm9kcmlnby52aXZpQGludGVsLmNvbTsgYWlybGllZEBsaW51
eC5pZTsgZGFuaWVsQGZmd2xsLmNoOwo+IGZhcm1hbkBsaW51eC5pYm0uY29tOyBwYXNpY0BsaW51
eC5pYm0uY29tOyBzZWJvdHRAbGludXguaWJtLmNvbTsKPiBvYmVycGFyQGxpbnV4LmlibS5jb207
IGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb207IGdvckBsaW51eC5pYm0uY29tOwo+IGJvcm50cmFl
Z2VyQGRlLmlibS5jb207IGFrcm93aWFrQGxpbnV4LmlibS5jb207IGZyZXVkZUBsaW51eC5pYm0u
Y29tOwo+IGxpbmdzaGFuLnpodUBpbnRlbC5jb207IElkbyBTaGFtYXkgPGlkb3NAbWVsbGFub3gu
Y29tPjsKPiBlcGVyZXptYUByZWRoYXQuY29tOyBsdWx1QHJlZGhhdC5jb207IFBhcmF2IFBhbmRp
dAo+IDxwYXJhdkBtZWxsYW5veC5jb20+OyBjaHJpc3RvcGhlLmRlLmRpbmVjaGluQGdtYWlsLmNv
bTsKPiBrZXZpbi50aWFuQGludGVsLmNvbTsgc3RlZmFuaGFAcmVkaGF0LmNvbTsgSmFzb24gV2Fu
Zwo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCBWNCAyLzZdIG1vZHBv
c3Q6IGFkZCBzdXBwb3J0IGZvciBtZGV2IGNsYXNzIGlkCj4gCj4gQWRkIHN1cHBvcnQgdG8gcGFy
c2UgbWRldiBjbGFzcyBpZCB0YWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYu
YyAgICAgfCAgMiArKwo+ICBzY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgfCAgMyAr
KysKPiAgc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jICAgICAgICAgIHwgMTAgKysrKysrKysrKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYu
Ywo+IGluZGV4IDdiMjRlZTljYjhkZC4uY2I3MDFjZDY0NmYwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jCj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19t
ZGV2LmMKPiBAQCAtMTI1LDYgKzEyNSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9jbGFz
c19pZCBpZF90YWJsZVtdID0gewo+ICAJeyAwIH0sCj4gIH07Cj4gCj4gK01PRFVMRV9ERVZJQ0Vf
VEFCTEUobWRldiwgaWRfdGFibGUpOwo+ICsKPiAgc3RhdGljIHN0cnVjdCBtZGV2X2RyaXZlciB2
ZmlvX21kZXZfZHJpdmVyID0gewo+ICAJLm5hbWUJPSAidmZpb19tZGV2IiwKPiAgCS5wcm9iZQk9
IHZmaW9fbWRldl9wcm9iZSwKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUt
b2Zmc2V0cy5jIGIvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtCj4gb2Zmc2V0cy5jCj4gaW5kZXgg
MDU0NDA1YjkwYmE0Li42Y2JiMTA2MjQ4OGEgMTAwNjQ0Cj4gLS0tIGEvc2NyaXB0cy9tb2QvZGV2
aWNldGFibGUtb2Zmc2V0cy5jCj4gKysrIGIvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0
cy5jCj4gQEAgLTIzMSw1ICsyMzEsOCBAQCBpbnQgbWFpbih2b2lkKQo+ICAJREVWSUQod21pX2Rl
dmljZV9pZCk7Cj4gIAlERVZJRF9GSUVMRCh3bWlfZGV2aWNlX2lkLCBndWlkX3N0cmluZyk7Cj4g
Cj4gKwlERVZJRChtZGV2X2NsYXNzX2lkKTsKPiArCURFVklEX0ZJRUxEKG1kZXZfY2xhc3NfaWQs
IGlkKTsKPiArCj4gIAlyZXR1cm4gMDsKPiAgfQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL21vZC9m
aWxlMmFsaWFzLmMgYi9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMgaW5kZXgKPiBjOTFlYmE3NTE4
MDQuLmQzNjVkZmU3YzcxOCAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMK
PiArKysgYi9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKPiBAQCAtMTMzNSw2ICsxMzM1LDE1IEBA
IHN0YXRpYyBpbnQgZG9fd21pX2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLAo+IHZvaWQgKnN5
bXZhbCwgY2hhciAqYWxpYXMpCj4gIAlyZXR1cm4gMTsKPiAgfQo+IAo+ICsvKiBsb29rcyBsaWtl
OiAibWRldjpjTiIgKi8KPiArc3RhdGljIGludCBkb19tZGV2X2VudHJ5KGNvbnN0IGNoYXIgKmZp
bGVuYW1lLCB2b2lkICpzeW12YWwsIGNoYXIKPiArKmFsaWFzKSB7Cj4gKwlERUZfRklFTEQoc3lt
dmFsLCBtZGV2X2NsYXNzX2lkLCBpZCk7Cj4gKwo+ICsJc3ByaW50ZihhbGlhcywgIm1kZXY6YyUw
MlgiLCBpZCk7Cj4gKwlyZXR1cm4gMTsKPiArfQo+ICsKPiAgLyogRG9lcyBuYW1lbGVuIGJ5dGVz
IG9mIG5hbWUgZXhhY3RseSBtYXRjaCB0aGUgc3ltYm9sPyAqLyAgc3RhdGljIGJvb2wKPiBzeW1f
aXMoY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgbmFtZWxlbiwgY29uc3QgY2hhciAqc3ltYm9s
KSAgeyBAQCAtCj4gMTQwNyw2ICsxNDE2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZ0YWJs
ZSBkZXZ0YWJsZVtdID0gewo+ICAJeyJ0eXBlYyIsIFNJWkVfdHlwZWNfZGV2aWNlX2lkLCBkb190
eXBlY19lbnRyeX0sCj4gIAl7InRlZSIsIFNJWkVfdGVlX2NsaWVudF9kZXZpY2VfaWQsIGRvX3Rl
ZV9lbnRyeX0sCj4gIAl7IndtaSIsIFNJWkVfd21pX2RldmljZV9pZCwgZG9fd21pX2VudHJ5fSwK
PiArCXsibWRldiIsIFNJWkVfbWRldl9jbGFzc19pZCwgZG9fbWRldl9lbnRyeX0sCj4gIH07Cj4g
Cj4gIC8qIENyZWF0ZSBNT0RVTEVfQUxJQVMoKSBzdGF0ZW1lbnRzLgo+IC0tCj4gMi4xOS4xClJl
dmlld2VkLWJ5OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG1lbGxhbm94LmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
