Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409998E7C2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 11:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA046E955;
	Thu, 15 Aug 2019 09:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446066E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 09:06:42 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hyBiR-0002xj-T1; Thu, 15 Aug 2019 11:06:39 +0200
Message-ID: <1565859998.2641.27.camel@pengutronix.de>
Subject: Re: [PATCH v3 7/8] drm/etnaviv: provide MMU context to
 etnaviv_gem_mapping_get
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Date: Thu, 15 Aug 2019 11:06:38 +0200
In-Reply-To: <20190814095955.GA16514@bogon.m.sigxcpu.org>
References: <20190809120424.32679-1-l.stach@pengutronix.de>
 <20190809120424.32679-7-l.stach@pengutronix.de>
 <20190814095955.GA16514@bogon.m.sigxcpu.org>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbiAxNC4wOC4yMDE5LCAxMTo1OSArMDIwMCBzY2hyaWViIEd1aWRvIEfD
vG50aGVyOgo+IEhpLAo+IE9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDAyOjA0OjIzUE0gKzAyMDAs
IEx1Y2FzIFN0YWNoIHdyb3RlOgo+ID4gSW4gcHJlcGFyYXRpb24gdG8gaGF2aW5nIGEgY29udGV4
dCBwZXIgcHJvY2VzcywgZXRuYXZpdl9nZW1fbWFwcGluZ19nZXQKPiA+IHNob3VsZCBub3QgdXNl
IHRoZSBjdXJyZW50IEdQVSBjb250ZXh0LCBidXQgbmVlZHMgdG8gYmUgdG9sZCB3aGljaAo+ID4g
Y29udGV4dCB0byB1c2UuCj4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJl
bCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dlbS5jwqDCoMKgwqDCoMKgwqDCoHwgMjIgKysrKysrKysrKysrLS0t
LS0tLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uaMKgwqDCoMKg
wqDCoMKgwqB8wqDCoDMgKystCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z2VtX3N1Ym1pdC5jIHzCoMKgMyArKy0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dlbS5jCj4gPiBpbmRleCAwY2NjM2M0ZGZmYzQuLjA0YzgxNzBmNzZjZCAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMKPiA+IEBAIC0yNDgsNyArMjQ4LDgg
QEAgdm9pZCBldG5hdml2X2dlbV9tYXBwaW5nX3VucmVmZXJlbmNlKHN0cnVjdCBldG5hdml2X3Zy
YW1fbWFwcGluZyAqbWFwcGluZykKPiA+IMKgfQo+ID4gwqAKPiA+IMKgc3RydWN0IGV0bmF2aXZf
dnJhbV9tYXBwaW5nICpldG5hdml2X2dlbV9tYXBwaW5nX2dldCgKPiA+ID4gPiAtCXN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKPiA+ID4gPiArCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKPiA+ID4g
PiArCXN0cnVjdCBldG5hdml2X2lvbW11X2NvbnRleHQgKm1tdV9jb250ZXh0KQo+ID4gwqB7Cj4g
PiA+ID4gwqAJc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqZXRuYXZpdl9vYmogPSB0b19ldG5h
dml2X2JvKG9iaik7Cj4gPiA+ID4gwqAJc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICptYXBw
aW5nOwo+ID4gQEAgLTI1Niw3ICsyNTcsNyBAQCBzdHJ1Y3QgZXRuYXZpdl92cmFtX21hcHBpbmcg
KmV0bmF2aXZfZ2VtX21hcHBpbmdfZ2V0KAo+ID4gPiA+IMKgCWludCByZXQgPSAwOwo+ID4gwqAK
PiA+ID4gPiDCoAltdXRleF9sb2NrKCZldG5hdml2X29iai0+bG9jayk7Cj4gPiA+ID4gLQltYXBw
aW5nID0gZXRuYXZpdl9nZW1fZ2V0X3ZyYW1fbWFwcGluZyhldG5hdml2X29iaiwgZ3B1LT5tbXVf
Y29udGV4dCk7Cj4gPiA+ID4gKwltYXBwaW5nID0gZXRuYXZpdl9nZW1fZ2V0X3ZyYW1fbWFwcGlu
ZyhldG5hdml2X29iaiwgbW11X2NvbnRleHQpOwo+ID4gPiA+IMKgCWlmIChtYXBwaW5nKSB7Cj4g
PiA+ID4gwqAJCS8qCj4gPiA+ID4gwqAJCcKgKiBIb2xkaW5nIHRoZSBvYmplY3QgbG9jayBwcmV2
ZW50cyB0aGUgdXNlIGNvdW50IGNoYW5naW5nCj4gPiBAQCAtMjY1LDEyICsyNjYsMTIgQEAgc3Ry
dWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICpldG5hdml2X2dlbV9tYXBwaW5nX2dldCgKPiA+ID4g
PiDCoAkJwqAqIHRoZSBNTVUgb3ducyB0aGlzIG1hcHBpbmcgdG8gY2xvc2UgdGhpcyByYWNlLgo+
ID4gPiA+IMKgCQnCoCovCj4gPiA+ID4gwqAJCWlmIChtYXBwaW5nLT51c2UgPT0gMCkgewo+ID4g
PiA+IC0JCQltdXRleF9sb2NrKCZncHUtPm1tdV9jb250ZXh0LT5sb2NrKTsKPiA+ID4gPiAtCQkJ
aWYgKG1hcHBpbmctPmNvbnRleHQgPT0gZ3B1LT5tbXVfY29udGV4dCkKPiA+ID4gPiArCQkJbXV0
ZXhfbG9jaygmbW11X2NvbnRleHQtPmxvY2spOwo+ID4gPiA+ICsJCQlpZiAobWFwcGluZy0+Y29u
dGV4dCA9PSBtbXVfY29udGV4dCkKPiA+ID4gPiDCoAkJCQltYXBwaW5nLT51c2UgKz0gMTsKPiA+
ID4gPiDCoAkJCWVsc2UKPiA+ID4gPiDCoAkJCQltYXBwaW5nID0gTlVMTDsKPiA+ID4gPiAtCQkJ
bXV0ZXhfdW5sb2NrKCZncHUtPm1tdV9jb250ZXh0LT5sb2NrKTsKPiA+ID4gPiArCQkJbXV0ZXhf
dW5sb2NrKCZtbXVfY29udGV4dC0+bG9jayk7Cj4gPiA+ID4gwqAJCQlpZiAobWFwcGluZykKPiA+
ID4gPiDCoAkJCQlnb3RvIG91dDsKPiA+ID4gPiDCoAkJfSBlbHNlIHsKPiA+IEBAIC0zMDMsMTEg
KzMwNCwxMiBAQCBzdHJ1Y3QgZXRuYXZpdl92cmFtX21hcHBpbmcgKmV0bmF2aXZfZ2VtX21hcHBp
bmdfZ2V0KAo+ID4gPiA+IMKgCQlsaXN0X2RlbCgmbWFwcGluZy0+b2JqX25vZGUpOwo+ID4gPiA+
IMKgCX0KPiA+IMKgCj4gPiA+ID4gLQltYXBwaW5nLT5jb250ZXh0ID0gZ3B1LT5tbXVfY29udGV4
dDsKPiA+ID4gPiArCWV0bmF2aXZfaW9tbXVfY29udGV4dF9nZXQobW11X2NvbnRleHQpOwo+ID4g
PiA+ICsJbWFwcGluZy0+Y29udGV4dCA9IG1tdV9jb250ZXh0Owo+ID4gPiA+IMKgCW1hcHBpbmct
PnVzZSA9IDE7Cj4gPiDCoAo+ID4gPiA+IC0JcmV0ID0gZXRuYXZpdl9pb21tdV9tYXBfZ2VtKGdw
dS0+bW11X2NvbnRleHQsIGV0bmF2aXZfb2JqLAo+ID4gPiA+IC0JCQkJwqDCoMKgwqBncHUtPm1l
bW9yeV9iYXNlLCBtYXBwaW5nKTsKPiA+ID4gPiArCXJldCA9IGV0bmF2aXZfaW9tbXVfbWFwX2dl
bShtbXVfY29udGV4dCwgZXRuYXZpdl9vYmosIGdwdS0+bWVtb3J5X2Jhc2UsCj4gPiA+ID4gKwkJ
CQnCoMKgwqDCoG1hcHBpbmcpOwo+ID4gPiA+IMKgCWlmIChyZXQgPCAwKQo+ID4gwqAJCWtmcmVl
KG1hcHBpbmcpOwo+IAo+IERvZXMgdGhpcyBlcnJvciBwYXRoIG5lZWQgYSBldG5hdml2X2lvbW11
X2NvbnRleHRfcHV0KCk/CgpHb29kIGNhdGNoISBUaGFua3MsIEknbGwgZml4IHRoaXMuCgpSZWdh
cmRzLApMdWNhcwo+IAo+IGFwYXJ0IGZyb20gdGhhdAo+IAo+ID4gUmV2aWV3ZWQtYnk6IEd1aWRv
IEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+wqAKPiAKPiDCoC0tIEd1aWRvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
