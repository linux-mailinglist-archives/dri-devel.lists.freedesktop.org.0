Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49C98BE2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 08:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEFB6EA63;
	Thu, 22 Aug 2019 06:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57206EA63
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:59:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 57EE4308A968
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:59:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 144C360C57;
 Thu, 22 Aug 2019 06:59:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 538C716E32; Thu, 22 Aug 2019 08:59:05 +0200 (CEST)
Date: Thu, 22 Aug 2019 08:59:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/qxl: get vga ioports
Message-ID: <20190822065905.pl6waewl43zlcv7i@sirius.home.kraxel.org>
References: <20190805105401.29874-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805105401.29874-1-kraxel@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 22 Aug 2019 06:59:06 +0000 (UTC)
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
Cc: Dave Airlie <airlied@redhat.com>, Frediano Ziglio <fziglio@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTI6NTQ6MDFQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBxeGwgaGFzIHR3byBtb2RlczogIm5hdGl2ZSIgKHVzZWQgYnkgdGhlIGRybSBkcml2
ZXIpIGFuZCAidmdhIiAodmdhCj4gY29tcGF0aWJpbGl0eSBtb2RlLCB0eXBpY2FsbHkgdXNlZCBm
b3IgYm9vdCBkaXNwbGF5IGFuZCBmaXJtd2FyZQo+IGZyYW1lYnVmZmVycykuCj4gCj4gQWNjZXNz
aW5nIGFueSB2Z2EgaW9wb3J0IHdpbGwgc3dpdGNoIHRoZSBxeGwgZGV2aWNlIGludG8gdmdhIG1v
ZGUuCj4gVGhlIHF4bCBkcml2ZXIgbmV2ZXIgZG9lcyB0aGF0LCBidXQgb3RoZXIgZHJpdmVycyBh
Y2Nlc3NpbmcgdmdhIHBvcnRzCj4gY2FuIHRyaWdnZXIgdGhhdCB0b28gYW5kIHRoZXJlZm9yZSBk
aXN0dXJiIHF4bCBvcGVyYXRpb24uICBTbyBhcXVpcmUKPiB0aGUgbGVnYWN5IHZnYSBpb3BvcnRz
IGZyb20gdmdhYXJiIHRvIGF2b2lkIHRoYXQuCj4gCj4gUmVwcm9kdWNlcjogQm9vdCBrdm0gZ3Vl
c3Qgd2l0aCBib3RoIHF4bCBhbmQgaTkxNSB2Z3B1LCB3aXRoIHF4bCBiZWluZwo+IGZpcnN0IGlu
IHBjaSBzY2FuIG9yZGVyLgo+IAo+IHYyOiBTa2lwIHRoaXMgZm9yIHNlY29uZGFyeSBxeGwgY2Fy
ZHMgd2hpY2ggZG9uJ3QgaGF2ZSB2Z2EgbW9kZSBpbiB0aGUKPiAgICAgZmlyc3QgcGxhY2UgKEZy
ZWRpYW5vKS4KClBpbmcsIGFueSBjaGFuY2UgZm9yIGFuIGFjaz8KCnRoYW5rcywKICBHZXJkCgo+
IAo+IENjOiBGcmVkaWFubyBaaWdsaW8gPGZ6aWdsaW9AcmVkaGF0LmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfZHJ2LmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2Rydi5jCj4gaW5kZXggYjU3YTM3NTQzNjEzLi5mY2I0OGFjNjA1OTggMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kcnYuYwo+IEBAIC02Myw2ICs2MywxMSBAQCBtb2R1bGVfcGFyYW1fbmFtZWQobnVtX2hl
YWRzLCBxeGxfbnVtX2NydGMsIGludCwgMDQwMCk7Cj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZl
ciBxeGxfZHJpdmVyOwo+ICBzdGF0aWMgc3RydWN0IHBjaV9kcml2ZXIgcXhsX3BjaV9kcml2ZXI7
Cj4gIAo+ICtzdGF0aWMgYm9vbCBpc192Z2Eoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gK3sKPiAr
CXJldHVybiBwZGV2LT5jbGFzcyA9PSBQQ0lfQ0xBU1NfRElTUExBWV9WR0EgPDwgODsKPiArfQo+
ICsKPiAgc3RhdGljIGludAo+ICBxeGxfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ICB7Cj4gQEAgLTg3LDkgKzkyLDE3IEBA
IHF4bF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2
aWNlX2lkICplbnQpCj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gZGlzYWJsZV9wY2k7Cj4gIAo+ICsJ
aWYgKGlzX3ZnYShwZGV2KSkgewo+ICsJCXJldCA9IHZnYV9nZXRfaW50ZXJydXB0aWJsZShwZGV2
LCBWR0FfUlNSQ19MRUdBQ1lfSU8pOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJRFJNX0VSUk9SKCJj
YW4ndCBnZXQgbGVnYWN5IHZnYSBpb3BvcnRzXG4iKTsKPiArCQkJZ290byBkaXNhYmxlX3BjaTsK
PiArCQl9Cj4gKwl9Cj4gKwo+ICAJcmV0ID0gcXhsX2RldmljZV9pbml0KHFkZXYsICZxeGxfZHJp
dmVyLCBwZGV2KTsKPiAgCWlmIChyZXQpCj4gLQkJZ290byBkaXNhYmxlX3BjaTsKPiArCQlnb3Rv
IHB1dF92Z2E7Cj4gIAo+ICAJcmV0ID0gcXhsX21vZGVzZXRfaW5pdChxZGV2KTsKPiAgCWlmIChy
ZXQpCj4gQEAgLTEwOSw2ICsxMjIsOSBAQCBxeGxfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ICAJcXhsX21vZGVzZXRfZmlu
aShxZGV2KTsKPiAgdW5sb2FkOgo+ICAJcXhsX2RldmljZV9maW5pKHFkZXYpOwo+ICtwdXRfdmdh
Ogo+ICsJaWYgKGlzX3ZnYShwZGV2KSkKPiArCQl2Z2FfcHV0KHBkZXYsIFZHQV9SU1JDX0xFR0FD
WV9JTyk7Cj4gIGRpc2FibGVfcGNpOgo+ICAJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+ICBm
cmVlX2RldjoKPiBAQCAtMTI2LDYgKzE0Miw4IEBAIHF4bF9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQo+ICAKPiAgCXF4bF9tb2Rlc2V0X2ZpbmkocWRldik7Cj4gIAlxeGxfZGV2aWNl
X2ZpbmkocWRldik7Cj4gKwlpZiAoaXNfdmdhKHBkZXYpKQo+ICsJCXZnYV9wdXQocGRldiwgVkdB
X1JTUkNfTEVHQUNZX0lPKTsKPiAgCj4gIAlkZXYtPmRldl9wcml2YXRlID0gTlVMTDsKPiAgCWtm
cmVlKHFkZXYpOwo+IC0tIAo+IDIuMTguMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
