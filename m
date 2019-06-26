Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938F57CC8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABA36E5C0;
	Thu, 27 Jun 2019 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D36F6E394
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 11:43:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QBh1Dt058683;
 Wed, 26 Jun 2019 06:43:01 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QBh1fe101052
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2019 06:43:01 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 06:43:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 06:43:01 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QBh0dl016779;
 Wed, 26 Jun 2019 06:43:00 -0500
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
To: Brian Dodge <bdodge09@gmail.com>, <pavel@ucw.cz>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <e3a6f4f5-8da9-f533-5cef-3ae2a87f52bc@ti.com>
Date: Wed, 26 Jun 2019 06:42:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561549381;
 bh=WwHQvZVuBJ4XkmGdaiEi/q1HLv0u2YRrE022uHmQfco=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vJiJSx52YheNxh4+vzGtHWRxLhdiTdGWocbHw532ycmCrV6zNoXKf1Yf+g+J4pcPh
 1By/DdttkARmrxJM4ndjIf4x8bkugjXs8+wAKtovVhW3dWiW5ddvCQYPqZLm17bHE2
 dYYnnsn24/w7//JL/RKCWSCrUNJJtSmwVEpk+E3E=
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8KCk9uIDYvMjQvMTkgMTE6MDUgUE0sIEJyaWFuIERvZGdlIHdyb3RlOgo+IFRoZSBvcmln
aW5hbCBwYXRjaCBhZGRpbmcgdGhpcyBkcml2ZXIgYW5kIERUIGJpbmRpbmdzIGltcHJvcGVybHkK
PiB1c2VkICJhcmMiIGFzIHRoZSB2ZW5kb3ItcHJlZml4LiBUaGlzIGFkZHMgImFyY3RpYyIgd2hp
Y2ggaXMgdGhlCj4gcHJvcGVyIHByZWZpeCBhbmQgcmV0YWlucyAiYXJjIiB0byBhbGxvdyBleGlz
dGluZyB1c2VycyBvZiB0aGUKPiAiYXJjIiBwcmVmaXggdG8gdXBkYXRlIHRvIG5ldyBrZXJuZWxz
LiBUaGVyZSBpcyBhdCBsZWFzdCBvbmUKPiAoU2Ftc3VuZyBDaHJvbWVib29rIFBsdXMpCj4KPiBT
aWduZWQtb2ZmLWJ5OiBCcmlhbiBEb2RnZSA8YmRvZGdlMDlAZ21haWwuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYXJjeGNubl9ibC5jIHwgMzUgKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9hcmN4Y25uX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hcmN4Y25uX2JsLmMKPiBp
bmRleCA3YjFjMGEwLi4xNGM2N2YyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2FyY3hjbm5fYmwuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2FyY3hjbm5f
YmwuYwo+IEBAIC0xLDkgKzEsOSBAQAo+ICAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQo+ICAgLyoKPiAtICogQmFja2xpZ2h0IGRyaXZlciBmb3IgQXJjdGljU2FuZCBB
UkNfWF9DXzBOXzBOIERldmljZXMKPiArICogQmFja2xpZ2h0IGRyaXZlciBmb3IgcFNlbWkgKGZv
cm1lcmx5IEFyY3RpY1NhbmQpIEFSQ19YX0NfME5fME4gRGV2aWNlcwo+ICAgICoKPiAtICogQ29w
eXJpZ2h0IDIwMTYgQXJjdGljU2FuZCwgSW5jLgo+IC0gKiBBdXRob3IgOiBCcmlhbiBEb2RnZSA8
YmRvZGdlQGFyY3RpY3NhbmQuY29tPgo+ICsgKiBDb3B5cmlnaHQgMjAxNi0yMDE5ICBwU2VtaSwg
SW5jLgo+ICsgKiBBdXRob3IgOiBCcmlhbiBEb2RnZSA8YmRvZGdlQHBzZW1pLmNvbT4KPiAgICAq
Lwo+ICAgCj4gICAjaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+Cj4gQEAgLTE5MSwyNyArMTkx
LDQwIEBAIHN0YXRpYyB2b2lkIGFyY3hjbm5fcGFyc2VfZHQoc3RydWN0IGFyY3hjbm4gKmxwKQo+
ICAgCWlmIChyZXQgPT0gMCkKPiAgIAkJbHAtPnBkYXRhLT5pbml0aWFsX2JyaWdodG5lc3MgPSBw
cm9nX3ZhbDsKPiAgIAo+IC0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxs
ZWQtY29uZmlnLTAiLCAmcHJvZ192YWwpOwo+ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIo
bm9kZSwgImFyY3RpYyxsZWQtY29uZmlnLTAiLCAmcHJvZ192YWwpOwo+ICsJaWYgKHJldCkKPiAr
CQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLGxlZC1jb25maWctMCIsICZw
cm9nX3ZhbCk7CkNhbiB5b3UgYWRkIG5ldyBsaW5lcyBiZXR3ZWVuIHRoZXNlIGFuZCBhbGwgYmVs
b3cKPiAgIAlpZiAocmV0ID09IDApCj4gICAJCWxwLT5wZGF0YS0+bGVkX2NvbmZpZ18wID0gKHU4
KXByb2dfdmFsOwo+ICAgCj4gLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJj
LGxlZC1jb25maWctMSIsICZwcm9nX3ZhbCk7Cj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
Mihub2RlLCAiYXJjdGljLGxlZC1jb25maWctMSIsICZwcm9nX3ZhbCk7Cj4gKwlpZiAocmV0KQo+
ICsJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsbGVkLWNvbmZpZy0xIiwg
JnByb2dfdmFsKTsKPiAgIAlpZiAocmV0ID09IDApCj4gICAJCWxwLT5wZGF0YS0+bGVkX2NvbmZp
Z18xID0gKHU4KXByb2dfdmFsOwo+ICAgCj4gLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihu
b2RlLCAiYXJjLGRpbS1mcmVxIiwgJnByb2dfdmFsKTsKPiArCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG5vZGUsICJhcmN0aWMsZGltLWZyZXEiLCAmcHJvZ192YWwpOwo+ICsJaWYgKHJldCkK
PiArCQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLGRpbS1mcmVxIiwgJnBy
b2dfdmFsKTsKPiAgIAlpZiAocmV0ID09IDApCj4gICAJCWxwLT5wZGF0YS0+ZGltX2ZyZXEgPSAo
dTgpcHJvZ192YWw7Cj4gICAKPiAtCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJh
cmMsY29tcC1jb25maWciLCAmcHJvZ192YWwpOwo+ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91
MzIobm9kZSwgImFyY3RpYyxjb21wLWNvbmZpZyIsICZwcm9nX3ZhbCk7Cj4gKwlpZiAocmV0KQo+
ICsJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsY29tcC1jb25maWciLCAm
cHJvZ192YWwpOwo+ICAgCWlmIChyZXQgPT0gMCkKPiAgIAkJbHAtPnBkYXRhLT5jb21wX2NvbmZp
ZyA9ICh1OClwcm9nX3ZhbDsKPiAgIAo+IC0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9k
ZSwgImFyYyxmaWx0ZXItY29uZmlnIiwgJnByb2dfdmFsKTsKPiArCXJldCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5vZGUsICJhcmN0aWMsZmlsdGVyLWNvbmZpZyIsICZwcm9nX3ZhbCk7Cj4gKwlp
ZiAocmV0KQo+ICsJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsCj4gKwkJCQkiYXJj
LGZpbHRlci1jb25maWciLCAmcHJvZ192YWwpOwo+ICAgCWlmIChyZXQgPT0gMCkKPiAgIAkJbHAt
PnBkYXRhLT5maWx0ZXJfY29uZmlnID0gKHU4KXByb2dfdmFsOwo+ICAgCj4gLQlyZXQgPSBvZl9w
cm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLHRyaW0tY29uZmlnIiwgJnByb2dfdmFsKTsKPiAr
CXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmN0aWMsdHJpbS1jb25maWciLCAm
cHJvZ192YWwpOwo+ICsJaWYgKHJldCkKPiArCQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihu
b2RlLCAiYXJjLHRyaW0tY29uZmlnIiwgJnByb2dfdmFsKTsKPiAgIAlpZiAocmV0ID09IDApCj4g
ICAJCWxwLT5wZGF0YS0+dHJpbV9jb25maWcgPSAodTgpcHJvZ192YWw7Cj4gICAKPiBAQCAtMzgx
LDYgKzM5NCw4IEBAIHN0YXRpYyBpbnQgYXJjeGNubl9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQg
KmNsKQo+ICAgfQo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhcmN4
Y25uX2R0X2lkc1tdID0gewo+ICsJeyAuY29tcGF0aWJsZSA9ICJhcmN0aWMsYXJjMmMwNjA4IiB9
LAo+ICsJLyogaGVyZSB0byByZW1haW0gY29tcGF0aWJsZSB3aXRoIGFuIG9sZGVyIGJpbmRpbmcs
IGRvIG5vdCB1c2UgKi8KCnMvcmVtYWltL3JlbWFpbgoKCj4gICAJeyAuY29tcGF0aWJsZSA9ICJh
cmMsYXJjMmMwNjA4IiB9LAo+ICAgCXsgfQo+ICAgfTsKPiBAQCAtNDA0LDUgKzQxOSw1IEBAIHN0
YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBhcmN4Y25uX2RyaXZlciA9IHsKPiAgIG1vZHVsZV9pMmNf
ZHJpdmVyKGFyY3hjbm5fZHJpdmVyKTsKPiAgIAo+ICAgTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIp
Owo+IC1NT0RVTEVfQVVUSE9SKCJCcmlhbiBEb2RnZSA8YmRvZGdlQGFyY3RpY3NhbmQuY29tPiIp
Owo+ICtNT0RVTEVfQVVUSE9SKCJCcmlhbiBEb2RnZSA8YmRvZGdlQHBzZW1pLmNvbT4iKTsKPiAg
IE1PRFVMRV9ERVNDUklQVElPTigiQVJDWENOTiBCYWNrbGlnaHQgZHJpdmVyIik7Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
