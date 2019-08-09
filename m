Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A987714
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 12:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F656ED7E;
	Fri,  9 Aug 2019 10:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056E76ED6F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 10:18:00 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hw1y9-0001Xi-W5; Fri, 09 Aug 2019 12:17:58 +0200
Message-ID: <1565345876.4864.2.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: dump only failing submit
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Fri, 09 Aug 2019 12:17:56 +0200
In-Reply-To: <20190702141830.13580-1-l.stach@pengutronix.de>
References: <20190702141830.13580-1-l.stach@pengutronix.de>
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

T24gVHVlLCAyMDE5LTA3LTAyIGF0IDE2OjE4ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBE
dWUgdG8gdGhlIHRyYWNraW5nIHByb3ZpZGVkIGJ5IHRoZSBzY2hlZHVsZXIgd2Uga25vdyBleGFj
dGx5IHdoaWNoCj4gc3VibWl0IGlzIGZhaWxpbmcuIE9ubHkgZHVtcCB0aGlzIHNpbmdsZSBzdWJt
aXQgYW5kIHRoZSByZXF1aXJlZAo+IGF1eGlsaWFyeSBpbmZvcm1hdGlvbi4gVGhpcyBjdXRzIGRv
d24gdGhlIHNpemUgb2YgdGhlIGRldmNvcmVkdW1wcwo+IGJ5IG9ubHkgaW5jbHVkaW5nIHJlbGV2
YW50IGluZm9ybWF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNo
QHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X2R1bXAuYyAgfCA1NyArKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHVtcC5oICB8ICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfc2NoZWQuYyB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9kdW1wLmMKPiBpbmRleCA1MTU1MTVlZjI0ZjkuLmJhYjA5YmFlMzVkMCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCj4gQEAgLTkxLDkgKzkxLDkgQEAgc3RhdGlj
IHZvaWQgZXRuYXZpdl9jb3JlX2R1bXBfcmVnaXN0ZXJzKHN0cnVjdCBjb3JlX2R1bXBfaXRlcmF0
b3IgKml0ZXIsCj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGV0bmF2aXZfY29yZV9kdW1wX21tdShz
dHJ1Y3QgY29yZV9kdW1wX2l0ZXJhdG9yICppdGVyLAo+IC0Jc3RydWN0IGV0bmF2aXZfZ3B1ICpn
cHUsIHNpemVfdCBtbXVfc2l6ZSkKPiArCXN0cnVjdCBldG5hdml2X2lvbW11ICptbXUsIHNpemVf
dCBtbXVfc2l6ZSkKPiAgewo+IC0JZXRuYXZpdl9pb21tdV9kdW1wKGdwdS0+bW11LCBpdGVyLT5k
YXRhKTsKPiArCWV0bmF2aXZfaW9tbXVfZHVtcChtbXUsIGl0ZXItPmRhdGEpOwo+ICAKPiAgCWV0
bmF2aXZfY29yZV9kdW1wX2hlYWRlcihpdGVyLCBFVERVTVBfQlVGX01NVSwgaXRlci0+ZGF0YSAr
IG1tdV9zaXplKTsKPiAgfQpbLi4uXQo+IEBAIC0xODEsMTkgKzE2NywxNSBAQCB2b2lkIGV0bmF2
aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICAJbWVtc2V0KGl0ZXIuaGRy
LCAwLCBpdGVyLmRhdGEgLSBpdGVyLnN0YXJ0KTsKPiAgCj4gIAlldG5hdml2X2NvcmVfZHVtcF9y
ZWdpc3RlcnMoJml0ZXIsIGdwdSk7Cj4gLQlldG5hdml2X2NvcmVfZHVtcF9tbXUoJml0ZXIsIGdw
dSwgbW11X3NpemUpOwo+ICsJZXRuYXZpdl9jb3JlX2R1bXBfbW11KCZpdGVyLCBncHUtPm1tdSwg
bW11X3NpemUpOwo+ICsKCkknZCBzcGxpdCB0aGlzIGludG8gYSBzZXBhcmF0ZSBjb21taXQsIG9y
IGF0IGxlYXN0IG1lbnRpb24gaXQgaW4gdGhlCmNvbW1pdCBtZXNzYWdlLiBUaGlzIGNoYW5nZSBp
cyBuZWl0aGVyIG5lY2Vzc2FyeSBmb3Igbm9yIGVuYWJsZWQgYnkgdGhlCnJlc3Qgb2YgdGhlIHBh
dGNoLiBPdGhlcndpc2UsCgpSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
