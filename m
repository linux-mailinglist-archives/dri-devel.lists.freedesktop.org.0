Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09724415
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 01:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AEE8925A;
	Mon, 20 May 2019 23:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D01E89211;
 Mon, 20 May 2019 23:19:33 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2688.namprd12.prod.outlook.com (52.135.103.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 23:19:31 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 23:19:31 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGdwdTogZHJtOiB1c2Ugc3RydWN0X3NpemUoKSBp?=
 =?utf-8?Q?n_kmalloc()?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGdwdTogZHJtOiB1c2Ugc3RydWN0X3NpemUoKSBp?=
 =?utf-8?Q?n_kmalloc()?=
Thread-Index: AQHVDI2qe/CUJDlUrE6nllhDkI7lB6ZvhnyWgASya4CAAPTQ9w==
Date: Mon, 20 May 2019 23:19:31 +0000
Message-ID: <SN6PR12MB28007ED8F5C6838F2C25A9D587060@SN6PR12MB2800.namprd12.prod.outlook.com>
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
 <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>,
 <20190520162807.GE21222@phenom.ffwll.local>
In-Reply-To: <20190520162807.GE21222@phenom.ffwll.local>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.88.213.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed292735-d7ea-49d9-ff2d-08d6dd799ce8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2688; 
x-ms-traffictypediagnostic: SN6PR12MB2688:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SN6PR12MB2688BE22D83B62F1A5E3EF7587060@SN6PR12MB2688.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(396003)(39860400002)(376002)(136003)(346002)(366004)(189003)(199004)(73956011)(91956017)(66556008)(66476007)(66946007)(66446008)(76116006)(64756008)(8936002)(102836004)(256004)(53936002)(86362001)(478600001)(66066001)(81166006)(14454004)(966005)(72206003)(71200400001)(71190400001)(81156014)(54906003)(3846002)(99286004)(224303003)(6116002)(305945005)(9686003)(186003)(26005)(2906002)(6306002)(7736002)(55016002)(4326008)(486006)(6916009)(52536014)(7696005)(476003)(11346002)(446003)(6506007)(53546011)(6436002)(5660300002)(316002)(25786009)(33656002)(76176011)(74316002)(68736007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2688;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PptyUbDnTfb+vJzcdJtE1PR1yjaVafuZ/nsyvzB57nicKy8QusGmhcgIOkHk7HH1bUk6ZExtCMHiRG1huwPej9FmAD9BiGM3zQoKVIIp+Ej7hITQLQwX+GzZ2Zljlnq2f7TmBTgaI/YW9QBAaOESG+OAQHn51kIqSDARcvDApc7l2n/Drz5qLdOH8kzuEt5xJUSQ+t+eiwfjhzJRAcyrxBTpHnh1E7kRFJswdxBuxZoGsfX9ox8Nl6xlpeBbikmGZ2ajCXrhPwiUu1k5Cy+lOdvp1odxVYMtiuC1v/DtzprvghprcEv/tJQrBryiyju5sUZSZQfGvG8RbMXS5n88IjLUGqTwBN32wK7EQKa2TI5DzqeCbm3lFEUEIDyaUjgU4K3+lQhb2U4RLxyYWW8Hr5cQixp+97x0pa57XeRONa0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed292735-d7ea-49d9-ff2d-08d6dd799ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 23:19:31.1081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5+A4q5K5cdqQGA5Ihkd354ZfHanOdPx+5b5x0iq0yY=;
 b=SNcUz3irU+fd9LB1t2k6LgJCtcZfJU8X0DMX6ms3VdB2T/NNPIFEa23TuJpIicZ5ShOSACYlrxEa/ZZ5qteR+rigpAZE9SGj3RDDY+wYxfPibOiPjWKNC/WRyyW4ekk2ID3a8DnI67ylgrSPf26jK7QmokiT3HY5H2SuHRfoc7Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, xiaolinkui <xiaolinkui@kylinos.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsLCB3aGF0IHlvdSBhcmUgdGFsa2luZyBhYm91dCBpcyB0b3RhbGx5IHdyb25nLgoxKSBB
RkFJSywgb25seSBvbmUgemVyby1zaXplIGFycmF5IGNhbiBiZSBpbiB0aGUgZW5kIG9mIGEgc3Ry
dWN0LgoyKSB0d28gc3RydWN0X3NpemUgd2lsbCBhZGQgdXAgc3RydWN0IGl0c2VsZiB0d2ljZS4g
dGhlIHN1bSBpcyB3cm9uZyB0aGVuLgoKTm8gb2ZmZW5zZS4gSSBjYW4ndCBoZWxwIGZlZWxpbmcg
bHVja3kgdGhhdCB5b3UgYXJlIGluIGludGVsLiAKCgrlj5Hku7bkuro6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IOS7o+ihqCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CuWPkemAgeaXtumXtDogMjAxOeW5tDXmnIgyMeaXpSAwOjI4CuaUtuS7tuS6ujogUGFu
LCBYaW5odWkK5oqE6YCBOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEtvZW5pZywgQ2hyaXN0aWFuOyBa
aG91LCBEYXZpZChDaHVuTWluZyk7IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsg
UXVhbiwgRXZhbjsgeGlhb2xpbmt1aTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcK5Li76aKYOiBSZTogW1BBVENIXSBncHU6IGRybTogdXNlIHN0cnVjdF9zaXplKCkgaW4ga21h
bGxvYygpCsKgCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KCk9uIEZyaSwgTWF5IDE3LCAyMDE5
IGF0IDA0OjQ0OjMwUE0gKzAwMDAsIFBhbiwgWGluaHVpIHdyb3RlOgo+IEkgYW0gZ29pbmcgdG8g
cHV0IG1vcmUgbWVtYmVycyB3aGljaCBhcmUgYWxzbyBhcnJheSBhZnRlciB0aGlzIHN0cnVjdCwK
PiBub3Qgb25seSBvYmpbXS7CoCBMb29rcyBsaWtlIHRoaXMgc3RydWN0X3NpemUgZGlkIG5vdCBo
ZWxwIG9uIG11bHRpcGxlCj4gYXJyYXkgY2FzZS4gVGhhbmtzIGFueXdheS7CoCBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwoKWW91IGNhbiB0aGVuIGFkZCB0aGVtIHVwLCBlLmcuIGtt
YWxsb2Moc3RydWN0X3NpemUoKStzdHJ1Y3Rfc2l6ZSgpLApHRlBfS0VSTkVMKSwgc28gdGhpcyBw
YXRjaCBoZXJlIHN0aWxsIGxvb2tzIGxpa2UgYSBnb29kIGlkZWEuCgpSZXZpZXdlZC1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCkNoZWVycywgRGFuaWVsCgo+IEZy
b206IHhpYW9saW5rdWkgPHhpYW9saW5rdWlAa3lsaW5vcy5jbj4KPiBTZW50OiBGcmlkYXksIE1h
eSAxNywgMjAxOSA0OjQ2OjAwIFBNCj4gVG86IERldWNoZXIsIEFsZXhhbmRlcjsgS29lbmlnLCBD
aHJpc3RpYW47IFpob3UsIERhdmlkKENodW5NaW5nKTsgYWlybGllZEBsaW51eC5pZTsgZGFuaWVs
QGZmd2xsLmNoOyBQYW4sIFhpbmh1aTsgUXVhbiwgRXZhbgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgeGlhb2xpbmt1aUBreWxpbm9zLmNuCj4gU3ViamVjdDogW1BB
VENIXSBncHU6IGRybTogdXNlIHN0cnVjdF9zaXplKCkgaW4ga21hbGxvYygpCj4KPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdCj4KPiBVc2Ugc3RydWN0X3NpemUoKSBoZWxwZXIgdG8ga2VlcCBj
b2RlIHNpbXBsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IHhpYW9saW5rdWkgPHhpYW9saW5rdWlAa3ls
aW5vcy5jbj4KPiAtLS0KPsKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YyB8IDMgKy0tCj7CoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gaW5kZXggMjJi
ZDIxZS4uNDcxN2E2NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMKPiBAQCAtMTM3NSw4ICsxMzc1LDcgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKPsKgwqDCoMKgwqDCoMKgwqAgaWYgKGNvbikKPsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Cj4gLcKgwqDCoMKgwqDCoCBjb24gPSBr
bWFsbG9jKHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3JhcykgKwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IHJhc19tYW5hZ2VyKSAqIEFN
REdQVV9SQVNfQkxPQ0tfQ09VTlQsCj4gK8KgwqDCoMKgwqDCoCBjb24gPSBrbWFsbG9jKHN0cnVj
dF9zaXplKGNvbiwgb2JqcywgQU1ER1BVX1JBU19CTE9DS19DT1VOVCksCj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTHxfX0dGUF9aRVJP
KTsKPsKgwqDCoMKgwqDCoMKgwqAgaWYgKCFjb24pCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPiAtLQo+IDIuNy40Cj4KPgo+CgotLQpEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
