Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B038BCE0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 17:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA556E179;
	Tue, 13 Aug 2019 15:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF4D6E179
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 15:18:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3A532B2;
 Tue, 13 Aug 2019 17:18:40 +0200 (CEST)
Date: Tue, 13 Aug 2019 18:18:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 28/60] drm/omap: Factor out display type to connector
 type conversion
Message-ID: <20190813151837.GJ5009@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-25-laurent.pinchart@ideasonboard.com>
 <89eb9d64-3375-568a-6f0a-9e4cbe5896cc@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89eb9d64-3375-568a-6f0a-9e4cbe5896cc@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565709520;
 bh=Pw7/bbe42TMdUm8X13tQbBGJjIgNYWT3I/ZPDeYrH9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6+WlP9Eeq8HPzX8fHfVLKFEP9scAws8xnlrUanplyMJwo4EpFdIp6XGnAg+qyBeT
 w7Vwdu/QxfEvO1vy5dXLMNqPQGpkd1oYmNwu3TNgnl3hmk4ICDurolO7Y78wORjESV
 rBah9dcZjZId3AuFQ7A4h36F+e22E0yVvChDZyn4=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDEwOjMyOjEwQU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDA3LzA3LzIwMTkgMjE6MTksIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBNb3ZlIHRoZSBjb2RlIHRoYXQgY29tcHV0ZXMgdGhlIERSTSBjb25uZWN0b3Ig
dHlwZSBmb3IgdGhlCj4gPiBvbWFwZHNzX2RldmljZSBkaXNwbGF5IHR5cGUgdG8gYSBuZXcgb21h
cGRzc19kZXZpY2VfY29ubmVjdG9yX3R5cGUoKQo+ID4gZnVuY3Rpb24gZm9yIGxhdGVyIHJldXNl
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2Jhc2UuYyAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmggICAgfCAgMSArCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMgfCAxOSArLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25z
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvYmFz
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Jhc2UuYwo+ID4gaW5kZXggYTE5NzBi
OWRiNmFiLi5jYWU1Njg3ODIyZTIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvYmFzZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvYmFz
ZS5jCj4gPiBAQCAtMjg1LDYgKzI4NSwyOSBAQCB2b2lkIG9tYXBkc3NfZGV2aWNlX3Bvc3RfZGlz
YWJsZShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYpCj4gPiAgIH0KPiA+ICAgRVhQT1JU
X1NZTUJPTF9HUEwob21hcGRzc19kZXZpY2VfcG9zdF9kaXNhYmxlKTsKPiA+ICAgCj4gPiArdW5z
aWduZWQgaW50IG9tYXBkc3NfZGV2aWNlX2Nvbm5lY3Rvcl90eXBlKGVudW0gb21hcF9kaXNwbGF5
X3R5cGUgdHlwZSkKPiA+ICt7Cj4gPiArCXN3aXRjaCAodHlwZSkgewo+ID4gKwljYXNlIE9NQVBf
RElTUExBWV9UWVBFX0hETUk6Cj4gPiArCQlyZXR1cm4gRFJNX01PREVfQ09OTkVDVE9SX0hETUlB
Owo+ID4gKwljYXNlIE9NQVBfRElTUExBWV9UWVBFX0RWSToKPiA+ICsJCXJldHVybiBEUk1fTU9E
RV9DT05ORUNUT1JfRFZJRDsKPiA+ICsJY2FzZSBPTUFQX0RJU1BMQVlfVFlQRV9EU0k6Cj4gPiAr
CQlyZXR1cm4gRFJNX01PREVfQ09OTkVDVE9SX0RTSTsKPiA+ICsJY2FzZSBPTUFQX0RJU1BMQVlf
VFlQRV9EUEk6Cj4gPiArCWNhc2UgT01BUF9ESVNQTEFZX1RZUEVfREJJOgo+ID4gKwkJcmV0dXJu
IERSTV9NT0RFX0NPTk5FQ1RPUl9EUEk7Cj4gPiArCWNhc2UgT01BUF9ESVNQTEFZX1RZUEVfVkVO
QzoKPiA+ICsJCS8qIFRPRE86IFRoaXMgY291bGQgYWxzbyBiZSBjb21wb3NpdGUgKi8KPiA+ICsJ
CXJldHVybiBEUk1fTU9ERV9DT05ORUNUT1JfU1ZJREVPOwo+ID4gKwljYXNlIE9NQVBfRElTUExB
WV9UWVBFX1NESToKPiA+ICsJCXJldHVybiBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUzsKPiA+ICsJ
ZGVmYXVsdDoKPiA+ICsJCXJldHVybiBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93bjsKPiA+ICsJ
fQo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChvbWFwZHNzX2RldmljZV9jb25uZWN0b3Jf
dHlwZSk7Cj4gCj4gV2h5IGRvIHdlIG5lZWQgdG8gZXhwb3J0IHRoaXM/IEluIHRoZSBlbmQgZW51
bSBvbWFwX2Rpc3BsYXlfdHlwZSBzaG91bGQgCj4gZ28gYXdheSBvciBiZSBwcml2YXRlIHRvIG9t
YXBkcm0sIHJpZ2h0PwoKRXZlbnR1YWxseSA6LSkgVGhlIGZ1bmN0aW9uIGlzIGltcGxlbWVudGVk
IGluIGRzcy9iYXNlLmMgYW5kIHVzZWQgaW4Kb21hcF9jb25uZWN0b3IuYyBpbiB0aGlzIHBhdGNo
LCBzbyBpdCBoYXMgdG8gYmUgZXhwb3J0ZWQuIEhvd2V2ZXIsIHBhdGNoCiJkcm0vb21hcDogU2lt
cGxpZnkgY29ubmVjdG9yIGltcGxlbWVudGF0aW9uIiB0aGVuIHJlbW92ZXMgdGhlIG5lZWQgdG8K
ZXhwb3J0IHRoZSBmdW5jdGlvbiwgc28gSSdsbCByZW1vdmUgdGhlIEVYUE9SVF9TWU1CT0xfR1BM
IGluIHRoYXQgcGF0Y2guCgo+IFJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
