Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C625C116143
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2019 10:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B746E2BC;
	Sun,  8 Dec 2019 09:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26D86E2BC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 09:31:54 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C4ED58063C;
 Sun,  8 Dec 2019 10:31:51 +0100 (CET)
Date: Sun, 8 Dec 2019 10:31:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/4] drm/of: add support to find any enabled endpoint
Message-ID: <20191208093150.GA21141@ravnborg.org>
References: <20191207203553.286017-1-robdclark@gmail.com>
 <20191207203553.286017-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191207203553.286017-3-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
 a=e5mUnYsNAAAA:8 a=AkfTbbr1AOnX2gBTQ4oA:9 a=CjuIK1q_8ugA:10
 a=xmb-EsYY8bH0VWELuYED:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Jeffrey Hugo <jhugo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLgoKUGF0Y2ggbG9va3MgZ29vZCwgb25lIHNtYWxsIGltcHJvdmVtZW50IHByb3Bvc2Fs
LgoKT24gU2F0LCBEZWMgMDcsIDIwMTkgYXQgMTI6MzU6NTFQTSAtMDgwMCwgUm9iIENsYXJrIHdy
b3RlOgo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBUbyBo
YW5kbGUgdGhlIGNhc2Ugd2hlcmUgdGhlcmUgYXJlIG11bHRpcGxlIHBhbmVsIGVuZHBvaW50cywg
b25seSBvbmUgb2YKPiB3aGljaCBpcyBlbmFibGVkL2luc3RhbGxlZCwgYWRkIHN1cHBvcnQgZm9y
IGEgd2lsZGNhcmQgZW5kcG9pbnQgdmFsdWUgdG8KPiByZXF1ZXN0IGZpbmRpbmcgd2hpY2hldmVy
IGVuZHBvaW50IGlzIGVuYWJsZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMgfCA0
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fb2YuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+IGluZGV4
IDBjYTU4ODAzYmE0Ni4uMmJhZjQ0ZTQwMWI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fb2YuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+IEBAIC0yMTksMTEg
KzIxOSw0NCBAQCBpbnQgZHJtX29mX2VuY29kZXJfYWN0aXZlX2VuZHBvaW50KHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSwKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChkcm1fb2ZfZW5jb2Rlcl9h
Y3RpdmVfZW5kcG9pbnQpOwo+ICAKPiArc3RhdGljIGludCBmaW5kX2VuYWJsZWRfZW5kcG9pbnQo
Y29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1MzIgcG9ydCkKPiArewo+ICsJc3RydWN0
IGRldmljZV9ub2RlICplbmRwb2ludF9ub2RlLCAqcmVtb3RlOwo+ICsJdTMyIGVuZHBvaW50ID0g
MDsKPiArCj4gKwlmb3IgKGVuZHBvaW50ID0gMDsgOyBlbmRwb2ludCsrKSB7Cj4gKwkJZW5kcG9p
bnRfbm9kZSA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzKG5vZGUsIHBvcnQsIGVuZHBv
aW50KTsKPiArCQlpZiAoIWVuZHBvaW50X25vZGUpIHsKPiArCQkJcHJfZGVidWcoIk5vIG1vcmUg
ZW5kcG9pbnRzIVxuIik7Cj4gKwkJCXJldHVybiAtRU5PREVWOwo+ICsJCX0KPiArCj4gKwkJcmVt
b3RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlbmRwb2ludF9ub2RlKTsKPiAr
CQlvZl9ub2RlX3B1dChlbmRwb2ludF9ub2RlKTsKPiArCQlpZiAoIXJlbW90ZSkgewo+ICsJCQlw
cl9kZWJ1Zygibm8gdmFsaWQgcmVtb3RlIG5vZGVcbiIpOwo+ICsJCQljb250aW51ZTsKPiArCQl9
Cj4gKwo+ICsJCWlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKSB7Cj4gKwkJCXBy
X2RlYnVnKCJub3QgYXZhaWxhYmxlIGZvciByZW1vdGUgbm9kZVxuIik7Cj4gKwkJCW9mX25vZGVf
cHV0KHJlbW90ZSk7Cj4gKwkJCWNvbnRpbnVlOwo+ICsJCX0KPiArCj4gKwkJcHJfZGVidWcoImZv
dW5kIGVuYWJsZWQgZW5kcG9pbnQgJWQgZm9yICVzXG4iLCBlbmRwb2ludCwgcmVtb3RlLT5uYW1l
KTsKPiArCQlvZl9ub2RlX3B1dChyZW1vdGUpOwo+ICsJCXJldHVybiBlbmRwb2ludDsKPiArCX0K
PiArCj4gKwlyZXR1cm4gLUVOT0RFVjsKPiArfQpUaGlzIGZ1bmN0aW9uIHNlZW1zIHByZXR0eSBn
ZW5lcmljLiBTaG91bGQgdGhpcyBiZSBwYXJ0IG9mCmRyaXZlcnMvb2YvcHJvcGVydHkuYyAtIGFz
IG90aGVycyBtYXkgaGF2ZSB0aGUgc2FtZSBuZWVkPwoKPiArCj4gIC8qKgo+ICAgKiBkcm1fb2Zf
ZmluZF9wYW5lbF9vcl9icmlkZ2UgLSByZXR1cm4gY29ubmVjdGVkIHBhbmVsIG9yIGJyaWRnZSBk
ZXZpY2UKPiAgICogQG5wOiBkZXZpY2UgdHJlZSBub2RlIGNvbnRhaW5pbmcgZW5jb2RlciBvdXRw
dXQgcG9ydHMKPiAgICogQHBvcnQ6IHBvcnQgaW4gdGhlIGRldmljZSB0cmVlIG5vZGUKPiAtICog
QGVuZHBvaW50OiBlbmRwb2ludCBpbiB0aGUgZGV2aWNlIHRyZWUgbm9kZQo+ICsgKiBAZW5kcG9p
bnQ6IGVuZHBvaW50IGluIHRoZSBkZXZpY2UgdHJlZSBub2RlLCBvciAtMSB0byBmaW5kIGFuIGVu
YWJsZWQgZW5kcG9pbnQKPiAgICogQHBhbmVsOiBwb2ludGVyIHRvIGhvbGQgcmV0dXJuZWQgZHJt
X3BhbmVsCj4gICAqIEBicmlkZ2U6IHBvaW50ZXIgdG8gaG9sZCByZXR1cm5lZCBkcm1fYnJpZGdl
CgpJbnRyb2R1Y2luZyBhIGRlZmluZSB3b3VsZCBtYWtlIGl0IGVhc2llciB0byB1c2UgdGhpcyBm
dW5jdGlvbiBpbiB0aGUKcmlnaHQgd2F5LgpGb3IgZXhhbXBsZToKI2RlZmluZSBPRl9FTkRQT0lO
VF9GSVJTVAktMQoKClRoZW4gd2Ugd291bGQgc2VlIHRoaXMgY29kZSBpbiB0aGUgdXNlciBzaWRl
OgorICAgICAgIHJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShwZGF0YS0+ZGV2LT5v
Zl9ub2RlLCAxLAoJCQkJCSAgT0ZfRU5EUE9JTlRfRklSU1QsCgkJCQkJICAmcGRhdGEtPnBhbmVs
LCBOVUxMKTsKCk9yIHNvbWV0aGluZyBsaWtlIHRoaXMuCgoJU2FtCgoKPiAgICoKPiBAQCAtMjQ2
LDYgKzI3OSwxMiBAQCBpbnQgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGNvbnN0IHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnAsCj4gIAlpZiAocGFuZWwpCj4gIAkJKnBhbmVsID0gTlVMTDsKPiAg
Cj4gKwlpZiAoZW5kcG9pbnQgPT0gLTEpIHsKPiArCQllbmRwb2ludCA9IGZpbmRfZW5hYmxlZF9l
bmRwb2ludChucCwgcG9ydCk7Cj4gKwkJaWYgKGVuZHBvaW50IDwgMCkKPiArCQkJcmV0dXJuIGVu
ZHBvaW50Owo+ICsJfQo+ICsKPiAgCXJlbW90ZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZShu
cCwgcG9ydCwgZW5kcG9pbnQpOwo+ICAJaWYgKCFyZW1vdGUpCj4gIAkJcmV0dXJuIC1FTk9ERVY7
Cj4gLS0gCj4gMi4yMy4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
