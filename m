Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682DC9EC3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 14:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760EE6E03A;
	Thu,  3 Oct 2019 12:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA196E03A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 12:47:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93ClE2a102613;
 Thu, 3 Oct 2019 07:47:14 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93ClEVg119215;
 Thu, 3 Oct 2019 07:47:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 07:47:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 07:47:14 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93ClBe1067033;
 Thu, 3 Oct 2019 07:47:12 -0500
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
To: Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
Date: Thu, 3 Oct 2019 14:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003104228.c5nho6eimwzqwxpt@earth.universe>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570106834;
 bh=JMexwncxTG0RXIsiZpMRKEljXTzagWDuN8gPgZxM0XE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Fjcj6iDtcRQawB3mvUUYvOiTXnNrYyGqT3c3C0ia4wJgyOoqWRLysVEqCWmxlVtuG
 kifRa1kmP1LOh6VFH2LQplnTc11uh9+7tNP9pk0pPXYK3xSDyMSAD85zEvnyGsztFj
 vIFMYDOJrT8DEZK6AzOBDissL37IMza2jHpniEq8=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ViYXN0aWFuLAoKT24gMDMvMTAvMjAxOSAxMjo0MiwgU2ViYXN0aWFuIFJlaWNoZWwgd3Jv
dGU6Cj4gSGksCj4KPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAxMDoyODowOUFNICswMjAwLCBK
ZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+PiBGcm9tOiBUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgYmFzaWMgc3VwcG9ydCBmb3Ig
YSBrZXJuZWwgZHJpdmVyIHRvIGdldCBhIExFRCBkZXZpY2UuCj4+IFRoaXMgd2lsbCBiZSB1c2Vk
IGJ5IHRoZSBsZWQtYmFja2xpZ2h0IGRyaXZlci4KPj4KPj4gT25seSBPRiB2ZXJzaW9uIGlzIGlt
cGxlbWVudGVkIGZvciBub3csIGFuZCB0aGUgYmVoYXZpb3IgaXMgc2ltaWxhciB0bwo+PiBQV00n
cyBvZl9wd21fZ2V0KCkgYW5kIHB3bV9wdXQoKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmVhbi1K
YWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+PiBBY2tlZC1ieTogUGF2ZWwgTWFjaGVr
IDxwYXZlbEB1Y3cuY3o+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyB8IDQ0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICBpbmNsdWRlL2xp
bnV4L2xlZHMuaCAgICAgfCAgNCArKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgYi9kcml2
ZXJzL2xlZHMvbGVkLWNsYXNzLmMKPj4gaW5kZXggYzIxNjdiNjZiNjFmLi40NTU1NDVmNWQ2NjMg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwo+PiArKysgYi9kcml2ZXJz
L2xlZHMvbGVkLWNsYXNzLmMKPj4gQEAgLTE5LDYgKzE5LDcgQEAKPj4gICAjaW5jbHVkZSA8bGlu
dXgvc3BpbmxvY2suaD4KPj4gICAjaW5jbHVkZSA8bGludXgvdGltZXIuaD4KPj4gICAjaW5jbHVk
ZSA8dWFwaS9saW51eC91bGVkcy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4+ICAgI2lu
Y2x1ZGUgImxlZHMuaCIKPj4gICAKPj4gICBzdGF0aWMgc3RydWN0IGNsYXNzICpsZWRzX2NsYXNz
Owo+PiBAQCAtMjE0LDYgKzIxNSw0OSBAQCBzdGF0aWMgaW50IGxlZF9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQo+PiAgIAo+PiAgIHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhsZWRzX2NsYXNz
X2Rldl9wbV9vcHMsIGxlZF9zdXNwZW5kLCBsZWRfcmVzdW1lKTsKPj4gICAKPj4gKy8qKgo+PiAr
ICogb2ZfbGVkX2dldCgpIC0gcmVxdWVzdCBhIExFRCBkZXZpY2UgdmlhIHRoZSBMRUQgZnJhbWV3
b3JrCj4+ICsgKiBAbnA6IGRldmljZSBub2RlIHRvIGdldCB0aGUgTEVEIGRldmljZSBmcm9tCj4+
ICsgKiBAaW5kZXg6IHRoZSBpbmRleCBvZiB0aGUgTEVECj4+ICsgKgo+PiArICogUmV0dXJucyB0
aGUgTEVEIGRldmljZSBwYXJzZWQgZnJvbSB0aGUgcGhhbmRsZSBzcGVjaWZpZWQgaW4gdGhlICJs
ZWRzIgo+PiArICogcHJvcGVydHkgb2YgYSBkZXZpY2UgdHJlZSBub2RlIG9yIGEgbmVnYXRpdmUg
ZXJyb3ItY29kZSBvbiBmYWlsdXJlLgo+PiArICovCj4+ICtzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpv
Zl9sZWRfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCkKPj4gK3sKPj4gKwlz
dHJ1Y3QgZGV2aWNlICpsZWRfZGV2Owo+PiArCXN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2
Owo+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbGVkX25vZGU7Cj4+ICsKPj4gKwlsZWRfbm9kZSA9
IG9mX3BhcnNlX3BoYW5kbGUobnAsICJsZWRzIiwgaW5kZXgpOwo+PiArCWlmICghbGVkX25vZGUp
Cj4+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQpOwo+PiArCj4+ICsJbGVkX2RldiA9IGNsYXNz
X2ZpbmRfZGV2aWNlX2J5X29mX25vZGUobGVkc19jbGFzcywgbGVkX25vZGUpOwo+IElmIHlvdSBj
b252ZXJ0IGxlZF9ub2RlIGludG8gYSBmd25vZGUsIHlvdSBjYW4gdXNlCj4gY2xhc3NfZmluZF9k
ZXZpY2VfYnlfZndub2RlKCkgaW5zdGVhZC4gVGhhdCB3YXkgdGhlCj4gZmlyc3QgcGF0Y2ggY2Fu
IGp1c3QgYmUgZHJvcHBlZC4KClRoYW5rcyBmb3IgdGhlIHJldmlld3MuCgpUaGUgZmlyc3QgcGF0
Y2ggY291bGQgYmUgZHJvcHBlZMKgIGluZGVlZCwgYnV0IGl0IHdvdWxkIGJyZWFrIHNvbWV0aGlu
ZyAKZWxzZSBJJ20gd29ya2luZyBvbjogZ2V0dGluZyByZWd1bGF0b3Igc3VwcG9ydCBpbiB0aGUg
TEVEIGNvcmUuCgpUaGlzIGhhcyBiZWVuIGRpc2N1c3NlZCBkdXJpbmcgdGhlIHY3IGl0ZXJhdGlv
biBvZiB0aGlzIHNlcmllcy4KCkpKCgoKPgo+IC0tIFNlYmFzdGlhbgo+Cj4+ICsJb2Zfbm9kZV9w
dXQobGVkX25vZGUpOwo+PiArCj4+ICsJaWYgKCFsZWRfZGV2KQo+PiArCQlyZXR1cm4gRVJSX1BU
UigtRVBST0JFX0RFRkVSKTsKPj4gKwo+PiArCWxlZF9jZGV2ID0gZGV2X2dldF9kcnZkYXRhKGxl
ZF9kZXYpOwo+PiArCj4+ICsJaWYgKCF0cnlfbW9kdWxlX2dldChsZWRfY2Rldi0+ZGV2LT5wYXJl
bnQtPmRyaXZlci0+b3duZXIpKQo+PiArCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPj4gKwo+
PiArCXJldHVybiBsZWRfY2RldjsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKG9mX2xlZF9n
ZXQpOwo+PiArCj4+ICsvKioKPj4gKyAqIGxlZF9wdXQoKSAtIHJlbGVhc2UgYSBMRUQgZGV2aWNl
Cj4+ICsgKiBAbGVkX2NkZXY6IExFRCBkZXZpY2UKPj4gKyAqLwo+PiArdm9pZCBsZWRfcHV0KHN0
cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQo+PiArewo+PiArCW1vZHVsZV9wdXQobGVkX2Nk
ZXYtPmRldi0+cGFyZW50LT5kcml2ZXItPm93bmVyKTsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xf
R1BMKGxlZF9wdXQpOwo+PiArCj4+ICAgc3RhdGljIGludCBsZWRfY2xhc3NkZXZfbmV4dF9uYW1l
KGNvbnN0IGNoYXIgKmluaXRfbmFtZSwgY2hhciAqbmFtZSwKPj4gICAJCQkJICBzaXplX3QgbGVu
KQo+PiAgIHsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbGVkcy5oIGIvaW5jbHVkZS9s
aW51eC9sZWRzLmgKPj4gaW5kZXggYjhkZjcxMTkzMzI5Li42ZjczNzFiYzc3NTcgMTAwNjQ0Cj4+
IC0tLSBhL2luY2x1ZGUvbGludXgvbGVkcy5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbGVkcy5o
Cj4+IEBAIC0yMCw2ICsyMCw3IEBACj4+ICAgCj4+ICAgc3RydWN0IGRldmljZTsKPj4gICBzdHJ1
Y3QgbGVkX3BhdHRlcm47Cj4+ICtzdHJ1Y3QgZGV2aWNlX25vZGU7Cj4+ICAgLyoKPj4gICAgKiBM
RUQgQ29yZQo+PiAgICAqLwo+PiBAQCAtMTk2LDYgKzE5Nyw5IEBAIGV4dGVybiB2b2lkIGRldm1f
bGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LAo+PiAgIGV4dGVy
biB2b2lkIGxlZF9jbGFzc2Rldl9zdXNwZW5kKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2
KTsKPj4gICBleHRlcm4gdm9pZCBsZWRfY2xhc3NkZXZfcmVzdW1lKHN0cnVjdCBsZWRfY2xhc3Nk
ZXYgKmxlZF9jZGV2KTsKPj4gICAKPj4gK2V4dGVybiBzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpvZl9s
ZWRfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCk7Cj4+ICtleHRlcm4gdm9p
ZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKPj4gKwo+PiAgIC8qKgo+
PiAgICAqIGxlZF9ibGlua19zZXQgLSBzZXQgYmxpbmtpbmcgd2l0aCBzb2Z0d2FyZSBmYWxsYmFj
awo+PiAgICAqIEBsZWRfY2RldjogdGhlIExFRCB0byBzdGFydCBibGlua2luZwo+PiAtLSAKPj4g
Mi4xNy4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
