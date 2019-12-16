Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8A1228E8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2672C6E98C;
	Tue, 17 Dec 2019 10:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD646E560
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:48:15 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 351A2C0003;
 Mon, 16 Dec 2019 13:48:11 +0000 (UTC)
Date: Mon, 16 Dec 2019 14:48:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/panel: simple: Support reset GPIOs
Message-ID: <20191216144810.18710ed3@xps13>
In-Reply-To: <20191216132732.mmqivmpnq4mio6oo@gilmour.lan>
References: <20191213181325.26228-1-miquel.raynal@bootlin.com>
 <20191216130615.qs6ub7bwqofwvhr7@gilmour.lan>
 <20191216141036.24c22899@xps13>
 <20191216132732.mmqivmpnq4mio6oo@gilmour.lan>
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

SGkgU2FtLAoKTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdyb3RlIG9uIE1vbiwg
MTYgRGVjIDIwMTkgMTQ6Mjc6MzIKKzAxMDA6Cgo+IE9uIE1vbiwgRGVjIDE2LCAyMDE5IGF0IDAy
OjEwOjM2UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDEyICsrKysrKysrKysrLQo+ID4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gPiA+IGluZGV4IDVkNDg3Njg2
ZDI1Yy4uMTVkZDQ5NWMzNDdkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYwo+ID4gPiA+IEBAIC0xMTAsNiArMTEwLDcgQEAgc3RydWN0IHBhbmVsX3Np
bXBsZSB7Cj4gPiA+ID4gIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKPiA+ID4gPgo+ID4gPiA+
ICAJc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87Cj4gPiA+ID4gKwlzdHJ1Y3QgZ3Bpb19k
ZXNjICpyZXNldF9ncGlvOwo+ID4gPiA+Cj4gPiA+ID4gIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSBvdmVycmlkZV9tb2RlOwo+ID4gPiA+ICB9Owo+ID4gPiA+IEBAIC00MzMsMTIgKzQzNCwyMSBA
QCBzdGF0aWMgaW50IHBhbmVsX3NpbXBsZV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0
IHN0cnVjdCBwYW5lbF9kZXNjICpkZXNjKQo+ID4gPiA+ICAJaWYgKElTX0VSUihwYW5lbC0+c3Vw
cGx5KSkKPiA+ID4gPiAgCQlyZXR1cm4gUFRSX0VSUihwYW5lbC0+c3VwcGx5KTsKPiA+ID4gPgo+
ID4gPiA+ICsJcGFuZWwtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYs
ICJyZXNldCIsCj4gPiA+ID4gKwkJCQkJCSAgICBHUElPRF9PVVRfTE9XKTsKPiA+ID4gPiArCWlm
IChJU19FUlIocGFuZWwtPnJlc2V0X2dwaW8pKSB7Cj4gPiA+ID4gKwkJZXJyID0gUFRSX0VSUihw
YW5lbC0+cmVzZXRfZ3Bpbyk7Cj4gPiA+ID4gKwkJaWYgKGVyciAhPSAtRVBST0JFX0RFRkVSKQo+
ID4gPiA+ICsJCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZXF1ZXN0IHJlc2V0IHBpbjogJWRc
biIsIGVycik7Cj4gPiA+ID4gKwkJcmV0dXJuIGVycjsKPiA+ID4gPiArCX0KPiA+ID4gPiArICAK
PiA+ID4KPiA+ID4gSG93ZXZlciwgSSdtIHdvbmRlcmluZyBpZiBpdCB3b3VsZG4ndCBiZSBiZXR0
ZXIgdG8ganVzdCBoYXZlIHRoZQo+ID4gPiBkZXZpY2UgbWFpbnRhaW5lZCBpbiByZXNldCBhdCBw
cm9iZSAoc28gT1VUX0hJR0gpIGFuZCBtb3ZlZCBvdXQgb2YKPiA+ID4gcmVzZXQgZHVyaW5nIGVp
dGhlciB0aGUgcHJlcGFyZSBvciBlbmFibGUgY2FsbGJhY2tzLgo+ID4gPgo+ID4gPiBUaGlzIGlz
IHByZXR0eSBtdWNoIHdoYXQgaXMgaGFwcGVuaW5nIHdpdGggdGhlIGVuYWJsZS1ncGlvcyBhbHJl
YWR5Lgo+ID4gPgo+ID4gPiBBbHNvLCBwYW5lbHMgdXN1YWxseSBuZWVkIHRvIHdhaXQgZm9yIGEg
bWluaW11bSB0aW1lIGFmdGVyIHlvdQo+ID4gPiBkZWFzc2VydCB0aGUgcmVzZXQgbGluZS4gSG93
IGlzIHRoYXQgZGVhbHQgd2l0aD8KPiA+ID4KPiA+ID4gSSBndWVzcyBhIGdvb2Qgd2F5IHRvIGRv
IHRoYXQgd291bGQgYmUgdG8gYWRkIHRoYXQgZHVyYXRpb24gdG8gdGhlCj4gPiA+IHBhbmVsIGRl
c2NyaXB0aW9uLCBzaW5jZSB0aGlzIGlzIHByZXR0eSBtdWNoIGRldmljZSBzcGVjaWZpYy4gIAo+
ID4KPiA+IFdoYXQgYWJvdXQgdGhlIGNhc2Ugd2VyZSB5b3VyIEJvb3Rsb2FkZXIgZGlzcGxheXMg
c29tZXRoaW5nIGFuZCB5b3UKPiA+IGRvbid0IHdhbnQgdGhlIHBhbmVsIHRvIGJsaW5rID8gIAo+
IAo+IFRoZSBCb290bG9hZGVyIHRvIExpbnV4IHRyYW5zaXRpb24gd2lsbCBtYWtlIHRoZSBwYW5l
bCBibGluayBhbHJlYWR5LAo+IHNpbmNlIHRoZSBkaXNwbGF5IGVuZ2luZSBpcyBnb2luZyB0byBi
ZSByZXNldCAvIHJlY29uZmlndXJlZCBkdXJpbmcKPiB0aGUgdHJhbnNpdGlvbi4KPiAKPiBUaGUg
b25seSB3YXkgdG8gaW1wbGVtZW50IHRoaXMgd291bGQgYmUgdG8gaW1wbGVtZW50IHByb3Blcmx5
IHRoZQo+IHJlc2V0IGNhbGxiYWNrcyBpbiBhbGwgeW91IGRpc3BsYXkgZHJpdmVycyB0byByZWNy
ZWF0ZSB0aGUgRFJNIHN0YXRlCj4gZnJvbSB0aGUgaGFyZHdhcmUgc3RhdGUsIGFuZCB0aGVuIHlv
dSdsbCBiZSBhYmxlIHRvIGp1c3Qgc3dpdGNoIHRvIHRoZQo+IG5ldyBidWZmZXIuCj4gCj4gT25s
eSBJbnRlbCBkb2VzIHRoaXMgYXQgdGhlIHRpbWUgdGhvdWdoLCBhbmQgdGhhdCdzIHdheSBvdXRz
aWRlIG9mIHRoZQo+IHNjb3BlIG9mIHRoaXMgcGF0Y2guLi4KPiAKPiA+IFJpZ2h0IG5vdyBJIGFt
IGp1c3QgZm9yY2luZyB0aGUgcmVzZXQgdG8gYmUgZGVhc3NlcnRlZC4gIAo+IAo+IC4uLiBFc3Bl
Y2lhbGx5IHNpbmNlIHRoZSB2ZXJ5IG5leHQgbGluZSBhZnRlciB5b3VyIHBhdGNoIGZvcmNlcyB0
aGUKPiBwYW5lbCB0byBiZSBkaXNhYmxlZC4KPiAKCklzIHRoZSBhZGRpdGlvbiBvZiB0aGUgcmVz
ZXQgc3VwcG9ydCAoYXMgcHJvcG9zZWQgYnkgTWF4aW1lKQppbnRlcmVzdGluZyBmcm9tIHlvdXIg
cG9pbnQgb2Ygdmlldz8gQXMgeW91IGFuc3dlcmVkIHRoYXQgeW91IHdlcmUgbm90CnVuZGVyc3Rh
bmRpbmcgdGhlIG5lZWRzIGZvciBzdWNoIGEgY2hhbmdlLCBJIHByZWZlciB0byBhc2sgYmVmb3Jl
CnNwZW5kaW5nIG1vcmUgdGltZSBvbiBpdC4KCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
