Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5C672E7D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EC56E4CF;
	Wed, 24 Jul 2019 12:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3C06E3F2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:11:06 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hqG6q-0000oR-R8; Wed, 24 Jul 2019 14:11:04 +0200
Message-ID: <1563970264.2914.9.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/8] drm/etnaviv: simplify unbind checks
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Wed, 24 Jul 2019 14:11:04 +0200
In-Reply-To: <20190705171727.27501-1-l.stach@pengutronix.de>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTA1IGF0IDE5OjE3ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBS
ZW1lbWJlciBpZiB0aGUgR1BVIGhhcyBiZWVuIHN1Y2Vzc2Z1bGx5IGluaXRpYWxpemVkLiBPbmx5
IGluIHRoYXQgY2FzZQo+IGRvIHdlIG5lZWQgdG8gY2xlYW4gdXAgdmFyaW91cyBzdHJ1Y3R1cmVz
IGluIHRoZSB1bmJpbmQgcGF0aC4gSWYgdGhlCj4gR1BVIGhhc24ndCBiZWVuIHN1Y2Vzc2Z1bGx5
IGluaXRpYWxpemVkIGFsbCB0aGUgY2xlYW51cHMgc2hvdWxkIGhhcHBlbgo+IGluIHRoZSBmYWls
dXJlIHBhdGhzIG9mIHRoZSBpbml0IGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2Fz
IFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgMjAgKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9ncHUuYwo+IGluZGV4IDQ4MjI1NDk1MDBlZS4uZTg0YTBlZDkwNGFhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gQEAgLTc5OSwxNyArNzk5LDE2
IEBAIGludCBldG5hdml2X2dwdV9pbml0KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICAJcG1f
cnVudGltZV9tYXJrX2xhc3RfYnVzeShncHUtPmRldik7Cj4gIAlwbV9ydW50aW1lX3B1dF9hdXRv
c3VzcGVuZChncHUtPmRldik7Cj4gIAo+ICsJZ3B1LT5pbml0aWFsaXplZCA9IHRydWU7Cj4gKwo+
ICAJcmV0dXJuIDA7Cj4gIAo+ICBmcmVlX2J1ZmZlcjoKPiAgCWV0bmF2aXZfY21kYnVmX2ZyZWUo
JmdwdS0+YnVmZmVyKTsKPiAtCWdwdS0+YnVmZmVyLnN1YmFsbG9jID0gTlVMTDsKPiAgZGVzdHJv
eV9zdWJhbGxvYzoKPiAgCWV0bmF2aXZfY21kYnVmX3N1YmFsbG9jX2Rlc3Ryb3koZ3B1LT5jbWRi
dWZfc3ViYWxsb2MpOwo+IC0JZ3B1LT5jbWRidWZfc3ViYWxsb2MgPSBOVUxMOwo+ICBkZXN0cm95
X2lvbW11Ogo+ICAJZXRuYXZpdl9pb21tdV9kZXN0cm95KGdwdS0+bW11KTsKPiAtCWdwdS0+bW11
ID0gTlVMTDsKPiAgZmFpbDoKPiAgCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koZ3B1LT5kZXYp
Owo+ICAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZ3B1LT5kZXYpOwo+IEBAIC0xNTIxLDcg
KzE1MjAsNyBAQCBpbnQgZXRuYXZpdl9ncHVfd2FpdF9pZGxlKHN0cnVjdCBldG5hdml2X2dwdSAq
Z3B1LCB1bnNpZ25lZCBpbnQgdGltZW91dF9tcykKPiAgCj4gIHN0YXRpYyBpbnQgZXRuYXZpdl9n
cHVfaHdfc3VzcGVuZChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKPiAgewo+IC0JaWYgKGdwdS0+
YnVmZmVyLnN1YmFsbG9jKSB7Cj4gKwlpZiAoZ3B1LT5pbml0aWFsaXplZCkgewo+ICAJCS8qIFJl
cGxhY2UgdGhlIGxhc3QgV0FJVCB3aXRoIEVORCAqLwo+ICAJCW11dGV4X2xvY2soJmdwdS0+bG9j
ayk7Cj4gIAkJZXRuYXZpdl9idWZmZXJfZW5kKGdwdSk7Cj4gQEAgLTE2ODAsMTkgKzE2NzksMTQg
QEAgc3RhdGljIHZvaWQgZXRuYXZpdl9ncHVfdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZSAqbWFzdGVyLAo+ICAJZXRuYXZpdl9ncHVfaHdfc3VzcGVuZChncHUpOwo+ICAj
ZW5kaWYKPiAgCj4gLQlpZiAoZ3B1LT5idWZmZXIuc3ViYWxsb2MpCj4gKwlpZiAoZ3B1LT5pbml0
aWFsaXplZCkgewo+ICAJCWV0bmF2aXZfY21kYnVmX2ZyZWUoJmdwdS0+YnVmZmVyKTsKPiAtCj4g
LQlpZiAoZ3B1LT5jbWRidWZfc3ViYWxsb2MpIHsKPiAgCQlldG5hdml2X2NtZGJ1Zl9zdWJhbGxv
Y19kZXN0cm95KGdwdS0+Y21kYnVmX3N1YmFsbG9jKTsKPiAtCQlncHUtPmNtZGJ1Zl9zdWJhbGxv
YyA9IE5VTEw7Cj4gLQl9Cj4gLQo+IC0JaWYgKGdwdS0+bW11KSB7Cj4gIAkJZXRuYXZpdl9pb21t
dV9kZXN0cm95KGdwdS0+bW11KTsKPiAtCQlncHUtPm1tdSA9IE5VTEw7Cj4gKwkJZ3B1LT5pbml0
aWFsaXplZCA9IGZhbHNlOwo+ICAJfQo+ICAKPiArCgpTdXBlcmZsdW91cyB3aGl0ZXNwYWNlLCBh
cGFydCBmcm9tIHRoYXQKClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
