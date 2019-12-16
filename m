Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705991228D2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973066E990;
	Tue, 17 Dec 2019 10:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9F96E519
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:10:43 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1ADC860011;
 Mon, 16 Dec 2019 13:10:37 +0000 (UTC)
Date: Mon, 16 Dec 2019 14:10:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/panel: simple: Support reset GPIOs
Message-ID: <20191216141036.24c22899@xps13>
In-Reply-To: <20191216130615.qs6ub7bwqofwvhr7@gilmour.lan>
References: <20191213181325.26228-1-miquel.raynal@bootlin.com>
 <20191216130615.qs6ub7bwqofwvhr7@gilmour.lan>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdyb3RlIG9uIE1v
biwgMTYgRGVjIDIwMTkgMTQ6MDY6MTUKKzAxMDA6Cgo+IEhpLAo+IAo+IE9uIEZyaSwgRGVjIDEz
LCAyMDE5IGF0IDA3OjEzOjI1UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBUaGUg
cGFuZWwgY29tbW9uIGJpbmRpbmdzIHByb3ZpZGUgYSBncGlvcy1yZXNldCBwcm9wZXJ0eSB3aGlj
aCBpcwo+ID4gYWN0aXZlIGxvdyBieSBkZWZhdWx0LiBMZXQncyBzdXBwb3J0IGl0IGluIHRoZSBz
aW1wbGUgZHJpdmVyLgo+ID4KPiA+IERlLWFzc2VydGluZyB0aGUgcmVzZXQgcGluIGltcGxpZXMg
YSBwaHlzaWNhbCBoaWdoLCB3aGljaCBpbiB0dXJucyBpcwo+ID4gYSBsb2dpYyBsb3cuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4gIAo+IAo+IFRoZSBHUElPZCBBUEkgYXNrcyBmb3IgYSBsb2dpY2FsIHN0YXRlLCBzbyBpdCBk
b2Vzbid0IHJlYWxseSBtYXR0ZXIKPiB3aGF0IHRoZSBwb2xhcml0eSBvZiB0aGUgR1BJTywgT1VU
X0xPVyB3aWxsIGFsd2F5cyBtZWFuIHRoYXQgdGhlIHJlc2V0Cj4gaXMgZGVhc3NlcnRlZCAoYW5k
IHRodXMsIGl0IHdpbGwgd29yayBldmVuIGlmIHRoZSByZXNldCBwaW4gaXMgYWN0aXZlCj4gaGln
aCkuCj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMg
fCAxMiArKysrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+
IGluZGV4IDVkNDg3Njg2ZDI1Yy4uMTVkZDQ5NWMzNDdkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+IEBAIC0xMTAsNiArMTEwLDcgQEAgc3RydWN0IHBhbmVs
X3NpbXBsZSB7Cj4gPiAgCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwo+ID4KPiA+ICAJc3RydWN0
IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87Cj4gPiArCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dw
aW87Cj4gPgo+ID4gIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBvdmVycmlkZV9tb2RlOwo+ID4g
IH07Cj4gPiBAQCAtNDMzLDEyICs0MzQsMjEgQEAgc3RhdGljIGludCBwYW5lbF9zaW1wbGVfcHJv
YmUoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyAqZGVzYykKPiA+
ICAJaWYgKElTX0VSUihwYW5lbC0+c3VwcGx5KSkKPiA+ICAJCXJldHVybiBQVFJfRVJSKHBhbmVs
LT5zdXBwbHkpOwo+ID4KPiA+ICsJcGFuZWwtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9v
cHRpb25hbChkZXYsICJyZXNldCIsCj4gPiArCQkJCQkJICAgIEdQSU9EX09VVF9MT1cpOwo+ID4g
KwlpZiAoSVNfRVJSKHBhbmVsLT5yZXNldF9ncGlvKSkgewo+ID4gKwkJZXJyID0gUFRSX0VSUihw
YW5lbC0+cmVzZXRfZ3Bpbyk7Cj4gPiArCQlpZiAoZXJyICE9IC1FUFJPQkVfREVGRVIpCj4gPiAr
CQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVxdWVzdCByZXNldCBwaW46ICVkXG4iLCBlcnIp
Owo+ID4gKwkJcmV0dXJuIGVycjsKPiA+ICsJfQo+ID4gKyAgCj4gCj4gSG93ZXZlciwgSSdtIHdv
bmRlcmluZyBpZiBpdCB3b3VsZG4ndCBiZSBiZXR0ZXIgdG8ganVzdCBoYXZlIHRoZQo+IGRldmlj
ZSBtYWludGFpbmVkIGluIHJlc2V0IGF0IHByb2JlIChzbyBPVVRfSElHSCkgYW5kIG1vdmVkIG91
dCBvZgo+IHJlc2V0IGR1cmluZyBlaXRoZXIgdGhlIHByZXBhcmUgb3IgZW5hYmxlIGNhbGxiYWNr
cy4KPiAKPiBUaGlzIGlzIHByZXR0eSBtdWNoIHdoYXQgaXMgaGFwcGVuaW5nIHdpdGggdGhlIGVu
YWJsZS1ncGlvcyBhbHJlYWR5Lgo+IAo+IEFsc28sIHBhbmVscyB1c3VhbGx5IG5lZWQgdG8gd2Fp
dCBmb3IgYSBtaW5pbXVtIHRpbWUgYWZ0ZXIgeW91Cj4gZGVhc3NlcnQgdGhlIHJlc2V0IGxpbmUu
IEhvdyBpcyB0aGF0IGRlYWx0IHdpdGg/Cj4gCj4gSSBndWVzcyBhIGdvb2Qgd2F5IHRvIGRvIHRo
YXQgd291bGQgYmUgdG8gYWRkIHRoYXQgZHVyYXRpb24gdG8gdGhlCj4gcGFuZWwgZGVzY3JpcHRp
b24sIHNpbmNlIHRoaXMgaXMgcHJldHR5IG11Y2ggZGV2aWNlIHNwZWNpZmljLgoKV2hhdCBhYm91
dCB0aGUgY2FzZSB3ZXJlIHlvdXIgQm9vdGxvYWRlciBkaXNwbGF5cyBzb21ldGhpbmcgYW5kIHlv
dQpkb24ndCB3YW50IHRoZSBwYW5lbCB0byBibGluayA/CgpSaWdodCBub3cgSSBhbSBqdXN0IGZv
cmNpbmcgdGhlIHJlc2V0IHRvIGJlIGRlYXNzZXJ0ZWQuCgpUaGFua3MsCk1pcXXDqGwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
