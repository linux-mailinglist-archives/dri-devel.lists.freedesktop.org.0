Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DEC49746
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 04:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5956F89D46;
	Tue, 18 Jun 2019 02:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150073.outbound.protection.outlook.com [40.107.15.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3A089CB3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 02:05:37 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4688.eurprd08.prod.outlook.com (10.255.115.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 02:05:35 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 02:05:35 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/komeda: fix 32-bit komeda_crtc_update_clock_ratio
Thread-Topic: [PATCH] drm/komeda: fix 32-bit komeda_crtc_update_clock_ratio
Thread-Index: AQHVJXpNE3N21cdpKkuGT3soJLEwQQ==
Date: Tue, 18 Jun 2019 02:05:35 +0000
Message-ID: <20190618020529.GB32081@james-ThinkStation-P300>
References: <20190617125121.1414507-1-arnd@arndb.de>
In-Reply-To: <20190617125121.1414507-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bd65035-c28a-4f80-d7c9-08d6f3917371
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4688; 
x-ms-traffictypediagnostic: VE1PR08MB4688:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4688F748B2409842670F1D6BB3EA0@VE1PR08MB4688.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(396003)(39860400002)(346002)(376002)(366004)(136003)(199004)(189003)(76176011)(25786009)(33716001)(478600001)(6246003)(99286004)(52116002)(256004)(58126008)(476003)(316002)(54906003)(229853002)(6486002)(11346002)(486006)(33656002)(1076003)(6436002)(14444005)(446003)(4326008)(6506007)(26005)(5660300002)(66066001)(6512007)(9686003)(66476007)(66446008)(66556008)(64756008)(81166006)(53936002)(71200400001)(71190400001)(8936002)(81156014)(3846002)(6116002)(386003)(86362001)(55236004)(186003)(8676002)(102836004)(66946007)(68736007)(14454004)(6916009)(2906002)(305945005)(73956011)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4688;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y04z68eaMDTgREEPP+neA+e8LM/Xh9ECuJHSo3zcKDewmgaV7iHGG71Jue5c1iwzMyIGI8q8POjzUXWlaxc1J4FlVyEtQ9WR3t4jaFvaxd3KJCdVBzJ/wQtoR6fzgk3gII0+L/5RYOnyix5pA5oP/9+wVFRaNJQHW8VxB2YwmuSmGcQ0hTivRv60oiRuTsLRspa/z94UP0ZtjUw+e3PCyhOahZdqw+8jt5djppLXe12qWLGqhjLBr6/7znabufSA20GxyZ5RTKCumImTfxLxMzk2D8CzsiWXjW307Sm6Zr5NDcC1iE8+MOqLkr5mODRFlH4bvdkaE145die8rpIjeCVFPYWyfyRykQcUOKeTIOlc9vDP31oO4LMJ6QtwYk0ctJV/8Mf6eQWUuC9U5qix8ThC5/xxPHemBgSQXV3C7AM=
Content-ID: <E41A22522EF64C458E76260D8DFE5E21@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd65035-c28a-4f80-d7c9-08d6f3917371
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 02:05:35.4910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kg2kvnqT0VjSojJg+YRo1O9WIFi6KUcTt8LWGNg7nDc=;
 b=cEembCbJiNme+wGioPsdTCVzDyFC1DyA2U+lV6geOLavLrsMt7dEX6fHyawkJB+VO0TlnuAeNX/Du/+laneueMba/RdqEG5fGGvwNxEQ3SIxFvmQP33OkMETu8sT9jNraYfeeM5D892hrTO68uTKca8HQ0ga0NHKjqvMrBI01DA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lowry Li
 \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDI6NTE6MDRQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBjbGFuZyBwb2ludHMgb3V0IGEgYnVnIGluIHRoZSBjbG9jayBjYWxjdWxhdGlvbiBv
biAzMi1iaXQsIHRoYXQgbGVhZHMKPiB0byB0aGUgY2xvY2tfcmF0aW8gYWx3YXlzIGJlaW5nIHpl
cm86Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5j
OjMxOjM2OiBlcnJvcjogc2hpZnQgY291bnQgPj0gd2lkdGggb2YgdHlwZSBbLVdlcnJvciwtV3No
aWZ0LWNvdW50LW92ZXJmbG93XQo+ICAgICAgICAgYWNsayA9IGtvbWVkYV9jYWxjX2FjbGsoa2Ny
dGNfc3QpIDw8IDMyOwo+IAo+IE1vdmUgdGhlIHNoaWZ0IGludG8gdGhlIGRpdmlzaW9uIHRvIG1h
a2UgaXQgYXBwbHkgb24gYSA2NC1iaXQKPiB2YXJpYWJsZS4gQWxzbyB1c2UgdGhlIG1vcmUgZXhw
ZW5zaXZlIGRpdjY0X3U2NCgpIGluc3RlYWQgb2YgZGl2X3U2NCgpCj4gdG8gYWNjb3VudCBmb3Ig
cHhsY2xrIGJlaW5nIGEgNjQtYml0IGludGVnZXIuCj4gCj4gRml4ZXM6IGE5NjIwOTEyMjdlZCAo
ImRybS9rb21lZGE6IEFkZCBlbmdpbmUgY2xvY2sgcmVxdWlyZW1lbnQgY2hlY2sgZm9yIHRoZSBk
b3duc2NhbGluZyIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0
Yy5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jcnRjLmMKPiBpbmRleCBjYWZiNDQ1N2UxODcuLjNmMjIyZjQ2NGViMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiBA
QCAtMjgsMTAgKzI4LDkgQEAgc3RhdGljIHZvaWQga29tZWRhX2NydGNfdXBkYXRlX2Nsb2NrX3Jh
dGlvKHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpCj4gIAl9Cj4gIAo+ICAJcHhs
Y2xrID0ga2NydGNfc3QtPmJhc2UuYWRqdXN0ZWRfbW9kZS5jbG9jayAqIDEwMDA7Cj4gLQlhY2xr
ID0ga29tZWRhX2NhbGNfYWNsayhrY3J0Y19zdCkgPDwgMzI7Cj4gKwlhY2xrID0ga29tZWRhX2Nh
bGNfYWNsayhrY3J0Y19zdCk7Cj4gIAo+IC0JZG9fZGl2KGFjbGssIHB4bGNsayk7Cj4gLQlrY3J0
Y19zdC0+Y2xvY2tfcmF0aW8gPSBhY2xrOwo+ICsJa2NydGNfc3QtPmNsb2NrX3JhdGlvID0gZGl2
NjRfdTY0KGFjbGsgPDwgMzIsIHB4bGNsayk7Cj4gIH0KPiAgCj4gIC8qKgo+IC0tIAo+IDIuMjAu
MAoKSGkgQXJuZDoKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IEphbWVz
IFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNv
bT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
