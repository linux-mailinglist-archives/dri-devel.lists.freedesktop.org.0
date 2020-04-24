Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52D1B72B6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 13:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37816E45E;
	Fri, 24 Apr 2020 11:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D533D6E45E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 11:09:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50FD41FB;
 Fri, 24 Apr 2020 04:09:52 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 314BC3F6CF;
 Fri, 24 Apr 2020 04:09:52 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id EC473682B6C; Fri, 24 Apr 2020 12:09:50 +0100 (BST)
Date: Fri, 24 Apr 2020 12:09:50 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH v2] drm/arm: fixes pixel clock enabled with wrong format
Message-ID: <20200424110950.GC1985@e110455-lin.cambridge.arm.com>
References: <20200424063551.14336-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424063551.14336-1-bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVybmFuZCwKCk9uIFRodSwgQXByIDIzLCAyMDIwIGF0IDExOjM1OjUxUE0gLTA3MDAsIEJl
cm5hcmQgWmhhbyB3cm90ZToKPiBUaGUgcGl4ZWwgY2xvY2sgaXMgc3RpbGwgZW5hYmxlZCB3aGVu
IHRoZSBmb3JtYXQgaXMgd3JvbmcuCj4gbm8gZXJyb3IgYnJhbmNoIGhhbmRsZSwgYW5kIGFsc28g
c29tZSByZWdpc3RlciBpcyBub3Qgc2V0Cj4gaW4gdGhpcyBjYXNlLCBlLmc6IEhETENEX1JFR188
Y29sb3I+X1NFTEVDVC4gTWF5YmUgd2UKPiBzaG91bGQgZGlzYWJsZSB0aGlzIGNsb2NrIGFuZCB0
aHJvdyBhbiB3YXJuIG1lc3NhZ2Ugd2hlbgo+IHRoaXMgaGFwcGVuZWQuCj4gV2l0aCB0aGlzIGNo
YW5nZSwgdGhlIGNvZGUgbWF5YmUgYSBiaXQgbW9yZSByZWFkYWJsZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4gCj4gQ2hhbmdlcyBzaW5jZSBW
MToKPiAqYWRkIGZvcm1hdCBlcnJvciBoYW5kbGUsIGlmIGZvcm1hdCBpcyBub3QgY29ycmVjdCwg
dGhyb3cKPiBhbiB3YXJuaW5nIG1lc3NhZ2UgYW5kIGRpc2FibGUgdGhpcyBjbG9jay4KPiAKPiBM
aW5rIGZvciBWMToKPiAqaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEy
Mjg1MDEvCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0Yy5jIHwgMTMgKysr
KysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0Yy5jCj4gaW5kZXggYWY2N2ZlZmVkMzhkLi5m
Mzk0NWRlZTJiN2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRj
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYwo+IEBAIC05Niw3ICs5
Niw3IEBAIHN0YXRpYyBpbnQgaGRsY2Rfc2V0X3B4bF9mbXQoc3RydWN0IGRybV9jcnRjICpjcnRj
KQo+ICAJfQo+ICAKPiAgCWlmIChXQVJOX09OKCFmb3JtYXQpKQo+IC0JCXJldHVybiAwOwo+ICsJ
CXJldHVybiAtRUlOVkFMOwoKVGhhdCBpcyB0aGUgcmlnaHQgZml4IQoKPiAgCj4gIAkvKiBIRExD
RCB1c2VzICdieXRlcyBwZXIgcGl4ZWwnLCB6ZXJvIG1lYW5zIDEgYnl0ZSAqLwo+ICAJYnRwcCA9
IChmb3JtYXQtPmJpdHNfcGVyX3BpeGVsICsgNykgLyA4Owo+IEBAIC0xMjUsNyArMTI1LDcgQEAg
c3RhdGljIGludCBoZGxjZF9zZXRfcHhsX2ZtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gIAly
ZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgaGRsY2RfY3J0Y19tb2RlX3NldF9ub2Zi
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiArc3RhdGljIGludCBoZGxjZF9jcnRjX21vZGVfc2V0
X25vZmIoc3RydWN0IGRybV9jcnRjICpjcnRjKQoKQnV0IHRoaXMgaXMgbm90LiBXZSBkb24ndCBu
ZWVkIHRvIHByb3BhZ2F0ZSB0aGUgZXJyb3IgZnVydGhlciwganVzdCAuLi4uCgo+ICB7Cj4gIAlz
dHJ1Y3QgaGRsY2RfZHJtX3ByaXZhdGUgKmhkbGNkID0gY3J0Y190b19oZGxjZF9wcml2KGNydGMp
Owo+ICAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm0gPSAmY3J0Yy0+c3RhdGUtPmFkanVzdGVk
X21vZGU7Cj4gQEAgLTE2Miw5ICsxNjIsMTAgQEAgc3RhdGljIHZvaWQgaGRsY2RfY3J0Y19tb2Rl
X3NldF9ub2ZiKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgCj4gIAllcnIgPSBoZGxjZF9zZXRf
cHhsX2ZtdChjcnRjKTsKPiAgCWlmIChlcnIpCj4gLQkJcmV0dXJuOwoKLi4uIHJldHVybiBoZXJl
IHNvIHRoYXQgd2UgZG9uJ3QgY2FsbCBjbGtfc2V0X3JhdGUoKTsKCkJlc3QgcmVnYXJkcywKTGl2
aXUKCj4gKwkJcmV0dXJuIGVycjsKPiAgCj4gIAljbGtfc2V0X3JhdGUoaGRsY2QtPmNsaywgbS0+
Y3J0Y19jbG9jayAqIDEwMDApOwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lk
IGhkbGNkX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gQEAgLTE3
Myw3ICsxNzQsMTEgQEAgc3RhdGljIHZvaWQgaGRsY2RfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YywKPiAgCXN0cnVjdCBoZGxjZF9kcm1fcHJpdmF0ZSAqaGRsY2QgPSBj
cnRjX3RvX2hkbGNkX3ByaXYoY3J0Yyk7Cj4gIAo+ICAJY2xrX3ByZXBhcmVfZW5hYmxlKGhkbGNk
LT5jbGspOwo+IC0JaGRsY2RfY3J0Y19tb2RlX3NldF9ub2ZiKGNydGMpOwo+ICsJaWYgKGhkbGNk
X2NydGNfbW9kZV9zZXRfbm9mYihjcnRjKSkgewo+ICsJCURSTV9ERUJVR19LTVMoIkludmFsaWQg
Zm9ybWF0LCBwaXhlbCBjbG9jayBlbmFibGUgZmFpbGVkIVxuIik7Cj4gKwkJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGhkbGNkLT5jbGspOwo+ICsJCXJldHVybjsKPiArCX0KPiAgCWhkbGNkX3dyaXRl
KGhkbGNkLCBIRExDRF9SRUdfQ09NTUFORCwgMSk7Cj4gIAlkcm1fY3J0Y192Ymxhbmtfb24oY3J0
Yyk7Cj4gIH0KPiAtLSAKPiAyLjI2LjIKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkg
d291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8
IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQog
ICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
