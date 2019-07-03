Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E05ECC4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 21:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860516E1BC;
	Wed,  3 Jul 2019 19:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240FB6E1BC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 19:27:43 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62952
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hikur-0000r8-61; Wed, 03 Jul 2019 21:27:41 +0200
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
Date: Wed, 3 Jul 2019 21:27:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703083302.2609-1-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Fim4j7VbqUMQEUX2smRAc1YukNARo49PRYDt+wRVbD8=; 
 b=rXq8H6H0u6cgVf65W0gUoq2V/HdYfMzP8KLS8aPEdZuhNdgQvI+R1FVuqwjghzyO1X1xBU8RikkotMgipD39UPsvzRva4wxAUNemBVScpXmNLoeIt4+2/COx8ktUVuFsgBwKXEqZaW+BlYZlEj9GPVqDlsvVO5b+gpZJs3STjEzBmFuZ+sQac0vENwaOCQf3luR1UmGzW4L1CNjenM/LlO1d2s6CMpvcbhGFrYSquDJCaa852pSaKpFbanPGEtbwiQbGamUqg5nYaX93jiYyzEt/7JG0D7iu8ef9vtvbYDYmcWdnpkPEt+QvUkqcX+mzjWQlot5VlgsAZbrsSPFzIw==;
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDMuMDcuMjAxOSAxMC4zMiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gRFJNIGNs
aWVudCBidWZmZXJzIGFyZSBwZXJtYW5lbnRseSBtYXBwZWQgdGhyb3VnaG91dCB0aGVpciBsaWZl
dGltZS4gVGhpcwo+IHByZXZlbnRzIHVzIGZyb20gdXNpbmcgZ2VuZXJpYyBmcmFtZWJ1ZmZlciBl
bXVsYXRpb24gZm9yIGRldmljZXMgd2l0aAo+IHNtYWxsIGRlZGljYXRlZCB2aWRlbyBtZW1vcnks
IHN1Y2ggYXMgYXN0IG9yIG1nYWcyMDAuIFdpdGggZmIgYnVmZmVycwo+IHBlcm1hbmVudGx5IG1h
cHBlZCwgc3VjaCBkZXZpY2VzIG9mdGVuIHdvbid0IGhhdmUgZW5vdWd0aCBzcGFjZSBsZWZ0IHRv
Cj4gZGlzcGxheSBvdGhlciBjb250ZW50IChlLmcuLCBYMTEpLgo+IAo+IFRoaXMgcGF0Y2ggc2V0
IGludHJvZHVjZXMgdW5tYXBwYWJsZSBEUk0gY2xpZW50IGJ1ZmZlcnMgZm9yIGZyYW1lYnVmZmVy
Cj4gZW11bGF0aW9uIHdpdGggc2hhZG93IGJ1ZmZlcnMuIFdoaWxlIHRoZSBzaGFkb3cgYnVmZmVy
IHJlbWFpbnMgaW4gc3lzdGVtCj4gbWVtb3J5IHBlcm1hbmVudGx5LCB0aGUgcmVzcGVjdGl2ZSBi
dWZmZXIgb2JqZWN0IHdpbGwgb25seSBiZSBtYXBwZWQgYnJpZWZseQo+IGR1cmluZyB1cGRhdGVz
IGZyb20gdGhlIHNoYWRvdyBidWZmZXIuIEhlbmNlLCB0aGUgZHJpdmVyIGNhbiByZWxvY2F0ZSBo
ZQo+IGJ1ZmZlciBvYmplY3QgYW1vbmcgbWVtb3J5IHJlZ2lvbnMgYXMgbmVlZGVkLgo+IAo+IFRo
ZSBkZWZhdWx0IGJlaG92aW91ciBmb3IgRFJNIGNsaWVudCBidWZmZXJzIGlzIHN0aWxsIHRvIGJl
IHBlcm1hbmVudGx5Cj4gbWFwcGVkLgo+IAo+IFRoZSBwYXRjaCBzZXQgY29udmVydHMgYXN0IGFu
ZCBtZ2FnMjAwIHRvIGdlbmVyaWMgZnJhbWVidWZmZXIgZW11bGF0aW9uCj4gYW5kIHJlbW92ZXMg
YSBsYXJnZSBhbW91bnQgb2YgZnJhbWVidWZmZXIgY29kZSBmcm9tIHRoZXNlIGRyaXZlcnMuIEZv
cgo+IGJvY2hzLCBhIHByb2JsZW0gd2FzIHJlcG9ydGVkIHdoZXJlIHRoZSBkcml2ZXIgY291bGQg
bm90IGRpc3BsYXkgdGhlIGNvbnNvbGUKPiBiZWNhdXNlIGl0IHdhcyBwaW5uZWQgaW4gc3lzdGVt
IG1lbW9yeS4gWzFdIFRoZSBwYXRjaCBzZXQgZml4ZXMgdGhpcyBidWcKPiBieSBjb252ZXJ0aW5n
IGJvY2hzIHRvIHVzZSB0aGUgc2hhZG93IGZiLgo+IAo+IFRoZSBwYXRjaCBzZXQgaGFzIGJlZW4g
dGVzdGVkIG9uIGFzdCBhbmQgbWdhMjAwIEhXLgo+IAoKSSd2ZSBiZWVuIHRoaW5raW5nLCB0aGlz
IGVuYWJsZXMgZGlydHkgdHJhY2tpbmcgaW4gRFJNIHVzZXJzcGFjZSBmb3IKdGhlc2UgZHJpdmVy
cyBzaW5jZSB0aGUgZGlydHkgY2FsbGJhY2sgaXMgbm93IHNldCBvbiBhbGwgZnJhbWVidWZmZXJz
LgpJcyB0aGlzIE9LPyBTaG91bGQgd2UgYWRkIGEgZHJtX2ZiZGV2X2dlbmVyaWNfc2hhZG93X3Nl
dHVwKCkgdGhhdCBzZXRzIGEKZmxhZyBlbmFibGluZyB0aGUgc2hhZG93IGJ1ZmZlciBpbnN0ZWFk
PwoKUmVhbGx5IG5pY2UgZGlmZnN0YXQgYnkgdGhlIHdheSA6LSkKCk5vcmFsZi4KCj4gWzFdIGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUv
MjI0NDIzLmh0bWwKPiAKPiBUaG9tYXMgWmltbWVybWFubiAoNSk6Cj4gICBkcm0vY2xpZW50OiBT
dXBwb3J0IHVubWFwcGluZyBvZiBEUk0gY2xpZW50IGJ1ZmZlcnMKPiAgIGRybS9mYi1oZWxwZXI6
IFVubWFwIEJPIGZvciBzaGFkb3ctYnVmZmVyZWQgZnJhbWVidWZmZXIgY29uc29sZQo+ICAgZHJt
L2FzdDogUmVwbGFjZSBzdHJ1Y3QgYXN0X2ZiZGV2IHdpdGggZ2VuZXJpYyBmcmFtZWJ1ZmZlciBl
bXVsYXRpb24KPiAgIGRybS9ib2NoczogVXNlIHNoYWRvdyBidWZmZXIgZm9yIGJvY2hzIGZyYW1l
YnVmZmVyIGNvbnNvbGUKPiAgIGRybS9tZ2FnMjAwOiBSZXBsYWNlIHN0cnVjdCBtZ2FfZmJkZXYg
d2l0aCBnZW5lcmljIGZyYW1lYnVmZmVyCj4gICAgIGVtdWxhdGlvbgo+IAo+ICBkcml2ZXJzL2dw
dS9kcm0vYXN0L01ha2VmaWxlICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcnYuYyAgICAgICAgICB8ICAyMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9kcnYuaCAgICAgICAgICB8ICAxNyAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5j
ICAgICAgICAgICB8IDM0MSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X21haW4uYyAgICAgICAgIHwgIDMwICsrLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9tb2RlLmMgICAgICAgICB8ICAyMSAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfa21zLmMgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5j
ICAgICAgICAgICB8ICA3MSArKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
ICAgICAgICB8ICAxNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9NYWtlZmlsZSAgICAg
ICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5oICB8ICAx
OSAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2ZiLmMgICB8IDMwOSAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFp
bi5jIHwgIDYxICsrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5j
IHwgIDI3IC0tCj4gIGluY2x1ZGUvZHJtL2RybV9jbGllbnQuaCAgICAgICAgICAgICAgIHwgICAz
ICsKPiAgMTUgZmlsZXMgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMoKyksIDc4NyBkZWxldGlvbnMo
LSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMKPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYwo+
IAo+IC0tCj4gMi4yMS4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
