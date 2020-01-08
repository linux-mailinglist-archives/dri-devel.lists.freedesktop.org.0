Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5BB135FC2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D0F6E92F;
	Thu,  9 Jan 2020 17:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474216E1B7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 08:58:23 +0000 (UTC)
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id E73017C2A6CED79D2CF4;
 Wed,  8 Jan 2020 16:58:19 +0800 (CST)
Received: from dggeme710-chm.china.huawei.com (10.1.199.106) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Jan 2020 16:58:19 +0800
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme710-chm.china.huawei.com (10.1.199.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Wed, 8 Jan 2020 16:58:19 +0800
Received: from dggeme759-chm.china.huawei.com ([10.7.64.73]) by
 dggeme759-chm.china.huawei.com ([10.7.64.73]) with mapi id 15.01.1713.004;
 Wed, 8 Jan 2020 16:58:19 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "Chenfeng (puck)"
 <puck.chen@hisilicon.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "kraxel@redhat.com" <kraxel@redhat.com>, 
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xinliang.liu@linaro.org"
 <xinliang.liu@linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGRybS9oaXNpbGljb246IGFkZCB0aGUgbW9kZV92?=
 =?utf-8?Q?alid_function?=
Thread-Topic: [PATCH] drm/hisilicon: add the mode_valid function
Thread-Index: AQHVxfxbpD+5L/GN/0KaWTRqEuV1/aff7sEAgACHSsA=
Date: Wed, 8 Jan 2020 08:58:19 +0000
Message-ID: <53780a8769c44f5484a97882a0c8b642@hisilicon.com>
References: <1578471540-43322-1-git-send-email-tiantao6@hisilicon.com>
 <ae14b728-d2dc-282d-2fed-19bf6db4df64@suse.de>
In-Reply-To: <ae14b728-d2dc-282d-2fed-19bf6db4df64@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.57.60.129]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzIFppbW1lcm1hbm46DQoNCglJIHdpbGwgbW9kaWZ5IHRoaXMgcGF0Y2ggYW5kIHNl
bmQgdjIgYXMgeW91IHN1Z2dlc3RlZC4NCglUaGFuayB5b3UgdmVyeSBtdWNoLg0KDQpCZXN0DQoN
Ci0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogVGhvbWFzIFppbW1lcm1hbm4gW21h
aWx0bzp0emltbWVybWFubkBzdXNlLmRlXSANCuWPkemAgeaXtumXtDogMjAyMOW5tDHmnIg45pel
IDE2OjQ5DQrmlLbku7bkuro6IHRpYW50YW8gKEgpIDx0aWFudGFvNkBoaXNpbGljb24uY29tPjsg
Q2hlbmZlbmcgKHB1Y2spIDxwdWNrLmNoZW5AaGlzaWxpY29uLmNvbT47IGFpcmxpZWRAbGludXgu
aWU7IGRhbmllbEBmZndsbC5jaDsga3JheGVsQHJlZGhhdC5jb207IGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb207IHRnbHhAbGludXRyb25peC5kZTsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgeGlubGlhbmcubGl1QGxpbmFyby5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCuaKhOmAgTogTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+DQrkuLvpopg6IFJlOiBb
UEFUQ0hdIGRybS9oaXNpbGljb246IGFkZCB0aGUgbW9kZV92YWxpZCBmdW5jdGlvbg0KDQpIaSwN
Cg0KaGVyZSBhcmUgYSBmZXcgbW9yZSBuaXRzIHRvIGZpeC4NCg0KQW0gMDguMDEuMjAgdW0gMDk6
MTkgc2NocmllYiBUaWFuIFRhbzoNCj4gYWRkIG1vZGVfdmFsaWQgZnVuY3Rpb24sIGFuZCB3ZSBj
YW4gYWxzbyB1c2UgaXQgdG8gbWFrZSBzdXNlIHRoZSANCj4gcmVzb2x1dGlvbiBpcyB2YWxpZC4N
Cg0KU3RhcnQgd2l0aCBjYXBpdGFsICdBZGQnIGFuZCBtYWtlIGl0IGEgc2ltcGxlIHNlbnRlbmNl
LiBDaGFuZ2UgJ3N1c2UnIHRvICdzdXJlJw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaWFuIFRh
byA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR29uZyBqdW5qaWUg
PGdvbmdqdW5qaWUyQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2hpc2ls
aWNvbi9oaWJtYy9oaWJtY19kcm1fZGUuYyB8IDIwIA0KPiArKysrKysrKysrKysrKysrKysrKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kZS5jIA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2RlLmMNCj4gaW5kZXggODQzZDc4
NC4uNmNiN2E3OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJt
Yy9oaWJtY19kcm1fZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1j
L2hpYm1jX2RybV9kZS5jDQo+IEBAIC0yNDIsNiArMjQyLDI1IEBAIHN0YXRpYyB2b2lkIGhpYm1j
X2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgCWhpYm1jX3Nl
dF9jdXJyZW50X2dhdGUocHJpdiwgcmVnKTsNCj4gIH0NCj4gIA0KPiArZW51bSBkcm1fbW9kZV9z
dGF0dXMgaGlibWNfY3J0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gKwkJ
CQkJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpDQoNClBsZWFzZSBkZWNsYXJl
IHRoaXMgZnVuY3Rpb24gYXMgc3RhdGljLg0KDQo+ICt7DQo+ICsJaW50IGkgPSAwOw0KPiArCWlu
dCB2cmVmcmVzaCA9IGRybV9tb2RlX3ZyZWZyZXNoKG1vZGUpOw0KPiArDQo+ICsJaWYgKHZyZWZy
ZXNoIDwgNTkgfHwgdnJlZnJlc2ggPiA2MSkNCj4gKwkJcmV0dXJuIE1PREVfTk9NT0RFOw0KDQpJ
J2QgcmV0dXJuIE1PREVfTk9DTE9DSyBvciBNT0RFX0NMT0NLX1JBTkdFLg0KDQo+ICsNCj4gKwlm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShoaWJtY19wbGxfdGFibGUpOyBpKyspIHsNCj4gKwkJ
aWYgKGhpYm1jX3BsbF90YWJsZVtpXS5oZGlzcGxheSA9PSBtb2RlLT5oZGlzcGxheSAmJg0KPiAr
CQkJaGlibWNfcGxsX3RhYmxlW2ldLnZkaXNwbGF5ID09IG1vZGUtPnZkaXNwbGF5KQ0KPiArCQkJ
cmV0dXJuIE1PREVfT0s7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIE1PREVfTk9NT0RFOw0KDQpN
YXliZSByZXR1cm4gTU9ERV9CQUQuIE1PREVfTk9NT0RFIGFwcGFyZW50bHkgcmVmZXJzIHRvIGEg
ZGVzY3JpcHRpdmUgc3RyaW5nIGZvciB0aGUgbW9kZS4NCg0KPiArfQ0KPiArDQo+ICsNCg0KT25l
IG9uZSBlbXB0eSBsaW5lIHBsZWFzZS4NCg0KV2l0aCB0aGVzZSBmaXhlcyBhcHBsaWVkLCB5b3Ug
Y2FuIGFkZCBteQ0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiAgc3RhdGljIHVuc2lnbmVk
IGludCBmb3JtYXRfcGxsX3JlZyh2b2lkKSAgew0KPiAgCXVuc2lnbmVkIGludCBwbGxyZWcgPSAw
Ow0KPiBAQCAtNTEwLDYgKzUyOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfaGVs
cGVyX2Z1bmNzIGhpYm1jX2NydGNfaGVscGVyX2Z1bmNzID0gew0KPiAgCS5hdG9taWNfZmx1c2gJ
PSBoaWJtY19jcnRjX2F0b21pY19mbHVzaCwNCj4gIAkuYXRvbWljX2VuYWJsZQk9IGhpYm1jX2Ny
dGNfYXRvbWljX2VuYWJsZSwNCj4gIAkuYXRvbWljX2Rpc2FibGUJPSBoaWJtY19jcnRjX2F0b21p
Y19kaXNhYmxlLA0KPiArCS5tb2RlX3ZhbGlkID0gaGlibWNfY3J0Y19tb2RlX3ZhbGlkLA0KPiAg
fTsNCj4gIA0KPiAgaW50IGhpYm1jX2RlX2luaXQoc3RydWN0IGhpYm1jX2RybV9wcml2YXRlICpw
cml2KQ0KPiANCg0KLS0NClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
