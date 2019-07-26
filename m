Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F3C766F1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A886ED3C;
	Fri, 26 Jul 2019 13:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D73726ED3C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:08:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FEBC337;
 Fri, 26 Jul 2019 06:08:24 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD5C3F694;
 Fri, 26 Jul 2019 06:08:24 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id CDEA7682072; Fri, 26 Jul 2019 14:08:22 +0100 (BST)
Date: Fri, 26 Jul 2019 14:08:22 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds internal bpp computing for arm afbc
 only format YU08 YU10
Message-ID: <20190726130822.GO15612@e110455-lin.cambridge.arm.com>
References: <1564127450-22601-1-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564127450-22601-1-git-send-email-lowry.li@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTG93cnksCgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwNzo1MTowMkFNICswMDAwLCBMb3dy
eSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IFRoZSBkcm1fZm9ybWF0X2luZm8g
ZG9lc24ndCBoYXZlIGFueSBjcHAgb3IgYmxvY2tfc2l6ZSAoYm90aCBhcmUgemVybykKPiBpbmZv
cm1hdGlvbiBmb3IgYXJtIG9ubHkgYWZiYyBmb3JtYXQgWVUwOC9ZVTEwLiB3ZSBuZWVkIHRvIGNv
bXB1dGUgaXQKPiBieSBvdXJzZWx2ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgLi4uL2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMgICAgfCAyMyArKysrKysrKysr
KysrKysrKysrKysrCj4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRf
Y2Fwcy5oICAgIHwgIDMgKysrCj4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9m
cmFtZWJ1ZmZlci5jICAgIHwgIDYgKysrKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMKPiBpbmRleCBjZDRkOWY1
Li4zYzllMDYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5jCj4gQEAgLTM1LDYgKzM1LDI5IEBACj4gIAly
ZXR1cm4gTlVMTDsKPiAgfQo+ICAKPiArdTMyIGtvbWVkYV9nZXRfYWZiY19mb3JtYXRfYnBwKGNv
bnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm8sIHU2NCBtb2RpZmllcikKPiArewo+ICsJ
dTMyIGJwcDsKPiArCj4gKwlXQVJOX09OKG1vZGlmaWVyID09IERSTV9GT1JNQVRfTU9EX0xJTkVB
Uik7CgpJcyBpdCBub3QgYmV0dGVyIHRvIHJldHVybiB0aGUgdmFsdWUgZnJvbSBpbmZvLT5jaGFy
X3Blcl9ibG9jayBpZiBtb2RpZmllciBpcwpEUk1fRk9STUFUX01PRF9MSU5FQVI/IE9yIHJldHVy
biAwPwoKPiArCj4gKwlzd2l0Y2ggKGluZm8tPmZvcm1hdCkgewo+ICsJY2FzZSBEUk1fRk9STUFU
X1lVVjQyMF84QklUOgo+ICsJCWJwcCA9IDEyOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBEUk1fRk9S
TUFUX1lVVjQyMF8xMEJJVDoKPiArCQlicHAgPSAxNTsKPiArCQlicmVhazsKPiArCWRlZmF1bHQ6
Cj4gKwkJYnBwID0gaW5mby0+Y3BwWzBdICogODsKPiArCQlicmVhazsKPiArCX0KPiArCj4gKwlX
QVJOX09OKGJwcCA9PSAwKTsKPiArCj4gKwlyZXR1cm4gYnBwOwo+ICt9Cj4gKwo+ICAvKiBUd28g
YXNzdW1wdGlvbnMKPiAgICogMS4gUkdCIGFsd2F5cyBoYXMgWVRSCj4gICAqIDIuIFRpbGVkIFJH
QiBhbHdheXMgaGFzIFNDCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oCj4gaW5kZXggMzYzMTkxMC4uMzIyNzNjZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9m
b3JtYXRfY2Fwcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZm9ybWF0X2NhcHMuaAo+IEBAIC05Nyw2ICs5Nyw5IEBAIHN0YXRpYyBpbmxpbmUgY29u
c3QgY2hhciAqa29tZWRhX2dldF9mb3JtYXRfbmFtZSh1MzIgZm91cmNjLCB1NjQgbW9kaWZpZXIp
Cj4gIGtvbWVkYV9nZXRfZm9ybWF0X2NhcHMoc3RydWN0IGtvbWVkYV9mb3JtYXRfY2Fwc190YWJs
ZSAqdGFibGUsCj4gIAkJICAgICAgIHUzMiBmb3VyY2MsIHU2NCBtb2RpZmllcik7Cj4gIAo+ICt1
MzIga29tZWRhX2dldF9hZmJjX2Zvcm1hdF9icHAoY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqaW5mbywKPiArCQkJICAgICAgIHU2NCBtb2RpZmllcik7Cj4gKwo+ICB1MzIgKmtvbWVkYV9n
ZXRfbGF5ZXJfZm91cmNjX2xpc3Qoc3RydWN0IGtvbWVkYV9mb3JtYXRfY2Fwc190YWJsZSAqdGFi
bGUsCj4gIAkJCQkgIHUzMiBsYXllcl90eXBlLCB1MzIgKm5fZm10cyk7Cj4gIAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZm
ZXIuYwo+IGluZGV4IDEwYmY2M2UuLjk2NmQwYzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiBAQCAt
NDQsNyArNDQsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9mYl9jcmVhdGVfaGFuZGxlKHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiLAo+ICAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5m
byA9IGZiLT5mb3JtYXQ7Cj4gIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKPiAgCXUzMiBh
bGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50X2hlYWRlcjsKPiAtCXUz
MiBuX2Jsb2NrcyA9IDAsIG1pbl9zaXplID0gMDsKPiArCXUzMiBuX2Jsb2NrcyA9IDAsIG1pbl9z
aXplID0gMCwgYnBwOwo+ICAKPiAgCW9iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBt
b2RlX2NtZC0+aGFuZGxlc1swXSk7Cj4gIAlpZiAoIW9iaikgewo+IEBAIC04NiwxMCArODYsMTIg
QEAgc3RhdGljIGludCBrb21lZGFfZmJfY3JlYXRlX2hhbmRsZShzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYiwKPiAgCWtmYi0+b2Zmc2V0X3BheWxvYWQgPSBBTElHTihuX2Jsb2NrcyAqIEFGQkNf
SEVBREVSX1NJWkUsCj4gIAkJCQkgICAgYWxpZ25tZW50X2hlYWRlcik7Cj4gIAo+ICsJYnBwID0g
a29tZWRhX2dldF9hZmJjX2Zvcm1hdF9icHAoaW5mbywgZmItPm1vZGlmaWVyKTsKPiAgCWtmYi0+
YWZiY19zaXplID0ga2ZiLT5vZmZzZXRfcGF5bG9hZCArIG5fYmxvY2tzICoKPiAtCQkJIEFMSUdO
KGluZm8tPmNwcFswXSAqIEFGQkNfU1VQRVJCTEtfUElYRUxTLAo+ICsJCQkgQUxJR04oYnBwICog
QUZCQ19TVVBFUkJMS19QSVhFTFMgLyA4LAo+ICAJCQkgICAgICAgQUZCQ19TVVBFUkJMS19BTElH
Tk1FTlQpOwo+ICAJbWluX3NpemUgPSBrZmItPmFmYmNfc2l6ZSArIGZiLT5vZmZzZXRzWzBdOwo+
ICsKPiAgCWlmIChtaW5fc2l6ZSA+IG9iai0+c2l6ZSkgewo+ICAJCURSTV9ERUJVR19LTVMoImFm
YmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCVseC4gbWluX3NpemUgMHgleC5cbiIs
Cj4gIAkJCSAgICAgIG9iai0+c2l6ZSwgbWluX3NpemUpOwoKUGF0Y2ggZG9lc24ndCBhcHBseSB0
byB0aXAgb2YgZHJtLW1pc2MtbmV4dC4gV2hhdCBpcyB0aGlzIHBhdGNoIGRlcGVuZGluZyBvbj8K
CkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gLS0gCj4gMS45LjEKPiAKCi0tIAo9PT09PT09PT09PT09
PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhl
eSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0t
LS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
