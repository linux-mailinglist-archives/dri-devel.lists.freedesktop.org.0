Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381C5E6C3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF7189956;
	Wed,  3 Jul 2019 14:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB23E89956
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 14:32:09 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1higIn-0003cP-R0; Wed, 03 Jul 2019 16:32:05 +0200
Message-ID: <1562164325.2321.13.camel@pengutronix.de>
Subject: Re: [PATCH] drm/scheduler: put killed job cleanup to worker
From: Lucas Stach <l.stach@pengutronix.de>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Date: Wed, 03 Jul 2019 16:32:05 +0200
In-Reply-To: <e40563b4-3a0f-0370-4790-67328c6e5ad2@amd.com>
References: <20190703102802.17004-1-l.stach@pengutronix.de>
 <e40563b4-3a0f-0370-4790-67328c6e5ad2@amd.com>
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
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbiAwMy4wNy4yMDE5LCAxNDoyMyArMDAwMCBzY2hyaWViIEdyb2R6b3Zz
a3ksIEFuZHJleToKPiBPbiA3LzMvMTkgNjoyOCBBTSwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gPiBk
cm1fc2NoZWRfZW50aXR5X2tpbGxfam9ic19jYigpIGlzIGNhbGxlZCByaWdodCBmcm9tIHRoZSBs
YXN0IHNjaGVkdWxlZAo+ID4gam9iIGZpbmlzaGVkIGZlbmNlIHNpZ25hbGluZy4gQXMgdGhpcyBt
aWdodCBoYXBwZW4gZnJvbSBJUlEgY29udGV4dCB3ZQo+ID4gbm93IGVuZCB1cCBjYWxsaW5nIHRo
ZSBHUFUgZHJpdmVyIGZyZWVfam9iIGNhbGxiYWNrIGluIElSUSBjb250ZXh0LCB3aGlsZQo+ID4g
YWxsIG90aGVyIHBhdGhzIGNhbGwgaXQgZnJvbSBub3JtYWwgcHJvY2VzcyBjb250ZXh0Lgo+ID4g
Cj4gPiBFdG5hdml2IGluIHBhcnRpY3VsYXIgY2FsbHMgY29yZSBrZXJuZWwgZnVuY3Rpb25zIHRo
YXQgYXJlIG9ubHkgdmFsaWQgdG8KPiA+IGJlIGNhbGxlZCBmcm9tIHByb2Nlc3MgY29udGV4dCB3
aGVuIGZyZWVpbmcgdGhlIGpvYi4gT3RoZXIgZHJpdmVycyBtaWdodAo+ID4gaGF2ZSBzaW1pbGFy
IGlzc3VlcywgYnV0IEkgZGlkIG5vdCB2YWxpZGF0ZSB0aGlzLiBGaXggdGhpcyBieSBwdW50aW5n
Cj4gPiB0aGUgY2xlYW51cCB3b3JrIGludG8gYSB3b3JrIGl0ZW0sIHNvIHRoZSBkcml2ZXIgZXhw
ZWN0YXRpb25zIGFyZSBtZXQuCj4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFj
aCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiA+IC0tLQo+ID4gwqAgZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8IDI4ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRp
dHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKPiA+IGluZGV4
IDM1ZGRiZWMxMzc1YS4uYmE0ZWI2Njc4NGI5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+ID4gQEAgLTIwMiwyMyArMjAyLDIzIEBAIGxvbmcgZHJt
X3NjaGVkX2VudGl0eV9mbHVzaChzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5LCBsb25n
IHRpbWVvdXQpCj4gPiDCoCB9Cj4gPiDCoCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9lbnRpdHlf
Zmx1c2gpOwo+ID4gwqDCoAo+ID4gLS8qKgo+ID4gLSAqIGRybV9zY2hlZF9lbnRpdHlfa2lsbF9q
b2JzIC0gaGVscGVyIGZvciBkcm1fc2NoZWRfZW50aXR5X2tpbGxfam9icwo+ID4gLSAqCj4gPiAt
ICogQGY6IHNpZ25hbGVkIGZlbmNlCj4gPiAtICogQGNiOiBvdXIgY2FsbGJhY2sgc3RydWN0dXJl
Cj4gPiAtICoKPiA+IC0gKiBTaWduYWwgdGhlIHNjaGVkdWxlciBmaW5pc2hlZCBmZW5jZSB3aGVu
IHRoZSBlbnRpdHkgaW4gcXVlc3Rpb24gaXMga2lsbGVkLgo+ID4gLSAqLwo+ID4gK3N0YXRpYyB2
b2lkIGRybV9zY2hlZF9lbnRpdHlfa2lsbF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykK
PiA+ICt7Cj4gPiA+ID4gKwlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iID0gY29udGFpbmVyX29m
KHdvcmssIHN0cnVjdCBkcm1fc2NoZWRfam9iLAo+ID4gPiA+ICsJCQkJCQnCoGZpbmlzaF93b3Jr
KTsKPiA+ICsKPiA+ID4gPiArCWRybV9zY2hlZF9mZW5jZV9maW5pc2hlZChqb2ItPnNfZmVuY2Up
Owo+ID4gPiA+ICsJV0FSTl9PTihqb2ItPnNfZmVuY2UtPnBhcmVudCk7Cj4gPiA+ID4gKwlqb2It
PnNjaGVkLT5vcHMtPmZyZWVfam9iKGpvYik7Cj4gPiArfQo+ID4gKwo+ID4gwqAgc3RhdGljIHZv
aWQgZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnNfY2Ioc3RydWN0IGRtYV9mZW5jZSAqZiwKPiA+
ID4gPiDCoMKgCQkJCQnCoMKgc3RydWN0IGRtYV9mZW5jZV9jYiAqY2IpCj4gPiDCoCB7Cj4gPiA+
ID4gwqDCoAlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iID0gY29udGFpbmVyX29mKGNiLCBzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiwKPiA+ID4gPiDCoMKgCQkJCQkJwqBmaW5pc2hfY2IpOwo+ID4gwqDC
oAo+ID4gPiA+IC0JZHJtX3NjaGVkX2ZlbmNlX2ZpbmlzaGVkKGpvYi0+c19mZW5jZSk7Cj4gPiA+
ID4gLQlXQVJOX09OKGpvYi0+c19mZW5jZS0+cGFyZW50KTsKPiA+ID4gPiAtCWpvYi0+c2NoZWQt
Pm9wcy0+ZnJlZV9qb2Ioam9iKTsKPiA+ID4gPiArCXNjaGVkdWxlX3dvcmsoJmpvYi0+ZmluaXNo
X3dvcmspOwo+ID4gwqAgfQo+ID4gwqDCoAo+ID4gwqAgLyoqCj4gPiBAQCAtMjQwLDYgKzI0MCwx
MiBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2tpbGxfam9icyhzdHJ1Y3QgZHJtX3Nj
aGVkX2VudGl0eSAqZW50aXR5KQo+ID4gPiA+IMKgwqAJCWRybV9zY2hlZF9mZW5jZV9zY2hlZHVs
ZWQoc19mZW5jZSk7Cj4gPiA+ID4gwqDCoAkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+
ZmluaXNoZWQsIC1FU1JDSCk7Cj4gPiDCoMKgCj4gPiA+ID4gKwkJLyoKPiA+ID4gPiArCQnCoCog
UmVwbGFjZSByZWd1bGFyIGZpbmlzaCB3b3JrIGZ1bmN0aW9uIHdpdGggb25lIHRoYXQganVzdAo+
ID4gPiA+ICsJCcKgKiBraWxscyB0aGUgam9iLgo+ID4gPiA+ICsJCcKgKi8KPiA+ICsJCWpvYi0+
ZmluaXNoX3dvcmsuZnVuYyA9IGRybV9zY2hlZF9lbnRpdHlfa2lsbF93b3JrOwo+IAo+IAo+IEkg
cmVjaGVja2VkIHRoZSBsYXRlc3QgY29kZSBhbmQgZmluaXNoX3dvcmsgd2FzIHJlbW92ZWQgaW4g
ZmZhZTNlNcKgCj4gJ2RybS9zY2hlZHVsZXI6IHJld29yayBqb2IgZGVzdHJ1Y3Rpb24nCgpBdywg
dGhhbmtzLiBTZWVtcyB0aGlzIHBhdGNoIHdhcyBzdHVjayBmb3IgYSBiaXQgdG9vIGxvbmcgaW4g
bXkKb3V0Z29pbmcgcXVldWUuIEkndmUganVzdCBjaGVja2VkIHRoZSBjb21taXQgeW91IHBvaW50
ZWQgb3V0LCBpdCBzaG91bGQKYWxzbyBmaXggdGhlIGlzc3VlIHRoYXQgdGhpcyBwYXRjaCB3YXMg
dHJ5aW5nIHRvIGZpeC4KClJlZ2FyZHMsCkx1Y2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
