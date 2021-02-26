Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CB325E49
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 08:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262966E8FB;
	Fri, 26 Feb 2021 07:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1041 seconds by postgrey-1.36 at gabe;
 Fri, 26 Feb 2021 01:18:42 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292C6E086;
 Fri, 26 Feb 2021 01:18:42 +0000 (UTC)
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Dmrsd1ZJGzRHRD;
 Fri, 26 Feb 2021 08:59:49 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 26 Feb 2021 09:01:17 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi761-chm.china.huawei.com (10.1.198.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 26 Feb 2021 09:01:17 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Fri, 26 Feb 2021 09:01:17 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: luojiaxing <luojiaxing@huawei.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "bskeggs@redhat.com" <bskeggs@redhat.com>
Subject: RE: [Linuxarm]  [PATCH v1] drm/nouveau/device: append a
 NUL-terminated character for the string which filled by strncpy()
Thread-Topic: [Linuxarm]  [PATCH v1] drm/nouveau/device: append a
 NUL-terminated character for the string which filled by strncpy()
Thread-Index: AQHXC2rCMCjd7ClCyEWCr1KHIxXraKppnNNQ
Date: Fri, 26 Feb 2021 01:01:17 +0000
Message-ID: <1b841f487ad742ee941282b534bdcb4d@hisilicon.com>
References: <1614253132-21793-1-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1614253132-21793-1-git-send-email-luojiaxing@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.200.34]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 26 Feb 2021 07:30:53 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: luojiaxing <luojiaxing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVvIEppYXhpbmcgW21h
aWx0bzpsdW9qaWF4aW5nQGh1YXdlaS5jb21dDQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjYs
IDIwMjEgMTI6MzkgQU0NCj4gVG86IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBic2tlZ2dzQHJlZGhhdC5jb20NCj4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4YXJtQG9wZW5ldWxlci5vcmc7IGx1
b2ppYXhpbmcNCj4gPGx1b2ppYXhpbmdAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogW0xpbnV4YXJt
XSBbUEFUQ0ggdjFdIGRybS9ub3V2ZWF1L2RldmljZTogYXBwZW5kIGEgTlVMLXRlcm1pbmF0ZWQN
Cj4gY2hhcmFjdGVyIGZvciB0aGUgc3RyaW5nIHdoaWNoIGZpbGxlZCBieSBzdHJuY3B5KCkNCj4g
DQo+IEZvbGxvd2luZyB3YXJuaW5nIGlzIGZvdW5kIHdoZW4gdXNpbmcgVz0xIHRvIGJ1aWxkIGtl
cm5lbDoNCj4gDQo+IEluIGZ1bmN0aW9uIOKAmG52a21fdWRldmljZV9pbmZv4oCZLA0KPiAgICAg
aW5saW5lZCBmcm9tIOKAmG52a21fdWRldmljZV9tdGhk4oCZIGF0DQo+IGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS91c2VyLmM6MTk1OjEwOg0KPiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdXNlci5jOjE2NDoyOiB3YXJuaW5nOiDi
gJhzdHJuY3B54oCZDQo+IHNwZWNpZmllZCBib3VuZCAxNiBlcXVhbHMgZGVzdGluYXRpb24gc2l6
ZSBbLVdzdHJpbmdvcC10cnVuY2F0aW9uXQ0KPiAgIDE2NCB8ICBzdHJuY3B5KGFyZ3MtPnYwLmNo
aXAsIGRldmljZS0+Y2hpcC0+bmFtZSwgc2l6ZW9mKGFyZ3MtPnYwLmNoaXApKTsNCj4gZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3VzZXIuYzoxNjU6Mjogd2Fybmlu
Zzog4oCYc3RybmNweeKAmQ0KPiBzcGVjaWZpZWQgYm91bmQgNjQgZXF1YWxzIGRlc3RpbmF0aW9u
IHNpemUgWy1Xc3RyaW5nb3AtdHJ1bmNhdGlvbl0NCj4gICAxNjUgfCAgc3RybmNweShhcmdzLT52
MC5uYW1lLCBkZXZpY2UtPm5hbWUsIHNpemVvZihhcmdzLT52MC5uYW1lKSk7DQo+IA0KPiBUaGUg
cmVhc29uIG9mIHRoaXMgd2FybmluZyBpcyBzdHJuY3B5KCkgZG9lcyBub3QgZ3VhcmFudGVlIHRo
YXQgdGhlDQo+IGRlc3RpbmF0aW9uIGJ1ZmZlciB3aWxsIGJlIE5VTCB0ZXJtaW5hdGVkLiBJZiB0
aGUgbGVuZ3RoIG9mIHNvdXJjZSBzdHJpbmcNCj4gaXMgYmlnZ2VyIHRoYW4gbnVtYmVyIHdlIHNl
dCBieSB0aGlyZCBpbnB1dCBwYXJhbWV0ZXIsIG9ubHkgZmlyc3QgW251bWJlcl0NCj4gb2YgY2hh
cmFjdGVycyBpcyBjb3BpZWQgdG8gdGhlIGRlc3RpbmF0aW9uLCBhbmQgbm8gTlVMLXRlcm1pbmF0
ZWQgaXMNCj4gYXV0b21hdGljYWxseSBhZGRlZC4gVGhlcmUgYXJlIHNvbWUgcG90ZW50aWFsIHJp
c2tzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVvIEppYXhpbmcgPGx1b2ppYXhpbmdAaHVhd2Vp
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZp
Y2UvdXNlci5jIHwgNiArKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvZGV2aWNlL3VzZXIuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vZW5naW5lL2RldmljZS91c2VyLmMNCj4gaW5kZXggZmVhOWQ4Zi4uMmEzMmZlMCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3Vz
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2Uv
dXNlci5jDQo+IEBAIC0xNjEsOCArMTYxLDEwIEBAIG52a21fdWRldmljZV9pbmZvKHN0cnVjdCBu
dmttX3VkZXZpY2UgKnVkZXYsIHZvaWQgKmRhdGEsDQo+IHUzMiBzaXplKQ0KPiAgCWlmIChpbWVt
ICYmIGFyZ3MtPnYwLnJhbV9zaXplID4gMCkNCj4gIAkJYXJncy0+djAucmFtX3VzZXIgPSBhcmdz
LT52MC5yYW1fdXNlciAtIGltZW0tPnJlc2VydmVkOw0KPiANCj4gLQlzdHJuY3B5KGFyZ3MtPnYw
LmNoaXAsIGRldmljZS0+Y2hpcC0+bmFtZSwgc2l6ZW9mKGFyZ3MtPnYwLmNoaXApKTsNCj4gLQlz
dHJuY3B5KGFyZ3MtPnYwLm5hbWUsIGRldmljZS0+bmFtZSwgc2l6ZW9mKGFyZ3MtPnYwLm5hbWUp
KTsNCj4gKwlzdHJuY3B5KGFyZ3MtPnYwLmNoaXAsIGRldmljZS0+Y2hpcC0+bmFtZSwgc2l6ZW9m
KGFyZ3MtPnYwLmNoaXApIC0gMSk7DQo+ICsJYXJncy0+djAuY2hpcFtzaXplb2YoYXJncy0+djAu
Y2hpcCkgLSAxXSA9ICdcMCc7DQo+ICsJc3RybmNweShhcmdzLT52MC5uYW1lLCBkZXZpY2UtPm5h
bWUsIHNpemVvZihhcmdzLT52MC5uYW1lKSAtIDEpOw0KPiArCWFyZ3MtPnYwLm5hbWVbc2l6ZW9m
KGFyZ3MtPnYwLm5hbWUpIC0gMV0gPSAnXDAnOw0KDQoNCklzbid0IGl0IGJldHRlciB0byB1c2Ug
c25wcmludGYoKT8NCg0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiANClRoYW5rcw0KQmFycnkNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
