Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD34C4A2C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 11:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D276E918;
	Wed,  2 Oct 2019 09:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D9D6E918
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 09:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 405DA2540;
 Wed,  2 Oct 2019 09:02:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-252.ams2.redhat.com
 [10.36.117.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E81975D9D3;
 Wed,  2 Oct 2019 09:02:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9AADE11AAA; Wed,  2 Oct 2019 11:02:28 +0200 (CEST)
Date: Wed, 2 Oct 2019 11:02:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/7] drm/mgag200: Place cursor BOs at VRAM high-end
Message-ID: <20191002090228.pdz4w7xbu6qxjxji@sirius.home.kraxel.org>
References: <20190927091301.10574-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927091301.10574-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 02 Oct 2019 09:02:31 +0000 (UTC)
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6MTI6NTRBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gKHdhczogZHJtL2FzdC9tZ2FnMjAwOiBQbGFjZSBjdXJzb3IgQk9zIGF0IFZS
QU0gaGlnaC1lbmQpCj4gCj4gVGhpcyBwYXRjaHNldCBjbGVhbnMgdXAgdGhlIG1lbW9yeSBtYW5h
Z2VtZW50IG9mIEhXIGN1cnNvcnMgaW4gbWdhZzIwMC4gSXQKPiBmdXJ0aGVyIG1vdmVzIHRoZSBh
bGxvY2F0ZWQgY3Vyc29yIEJPcyB0byB0aGUgb2YgdGhlIHZpZGVvIFJBTSB0byByZWR1Y2UKPiBt
ZW1vcnkgZnJhZ21lbnRhdGlvbi4KPiAKPiBUaGUgbWdhZzIwMCBkcml2ZXIgbWFuYWdlcyBjdXJz
b3IgbWVtb3J5IGluIGRlZGljYXRlZCBHRU0gVlJBTSBidWZmZXIKPiBvYmplY3RzLiBJdCB1c2Vz
IGEgZG91YmxlLWJ1ZmZlcmluZyBzY2hlbWUgb2YgYWx0ZXJuYXRpbmcgYmV0d2VlbiB0d28gR0VN
Cj4gQk9zIFRoZSBjb2RlIGlzIGNvbnZvbHV0ZWQgYW5kIGNhbiBsZWFkIHRvIG1lbW9yeSBmcmFn
bWVudGF0aW9uIGlmIGEgQk8KPiBpcyBzdG9yZWQgdGhlIG1pZGRsZSBvZiBWUkFNLiBUaGlzIGlz
IGVzcGVjaWFsbHkgYSBwcm9ibGVtIGFzIG1nYWcyMDAKPiBkZXZpY2VzIG9ubHkgY29udGFpbiBh
IHNtYWxsIGFtb3VudCBvZiB2aWRlbyBtZW1vcnkgKGUuZy4sIDE2IE1pQikuCj4gCj4gV2l0aCB0
aGlzIHBhdGNoc2V0LCB0aGUgY3Vyc29yIGhhbmRsaW5nIGluIG1nYWcyMDAgaXMgZmlyc3Qgc3Bs
aXQgdXAgaW50bwo+IHNlcGFyYXRlIGZ1bmN0aW9ucyBmb3IgY29weWluZyBjdXJzb3IgaW1hZ2Vz
LCBtYW5hZ2luZyBidWZmZXIgb2JqZWN0cywKPiBzZXR0aW5nIHNjYW5vdXQgYWRkcmVzc2VzLCBh
bmQgbW92aW5nIGFuZCBoaWRpbmcgdGhlIGN1cnNvci4gRnVydGhlcm1vcmUsCj4gdGhlIGRyaXZl
ciBkZWRpY2F0ZXMgYSBmZXcgS2lCIGF0IHRoZSBoaWdoIGVuZCBvZiBhIGRldmljZSdzIHZpZGVv
IG1lbW9yeQo+IHRvIHN0b3JpbmcgdGhlIGN1cnNvcidzIGJ1ZmZlciBvYmplY3RzLiBUaGlzIHBy
ZXZlbnRzIG1lbW9yeSBmcmFnbWVudGF0aW9uLgo+IAo+IFRoZSBwYXRjaHNldCBoYXMgYmVlbiB0
ZXN0ZWQgb24gbWdhZzIwMCBoYXJkd2FyZS4KCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KCj4gCj4gdjM6Cj4gCSogc3BsaXQtb2ZmIG1nYWcyMDAgcGF0Y2hlcyBp
bnRvIHNlcGFyYXRlIHNlcmllcwo+IHYyOgo+IAkqIHJlbW92ZSBWUkFNIGJ1ZmZlcnMgaW4gZmF2
b3Igb2YgR0VNIEJPcwo+IAkqIG1hbmFnZSBCTyBwbGFjZW1lbnQgd2l0aCBwaW4gZmxhZwo+IAo+
IFRob21hcyBaaW1tZXJtYW5uICg3KToKPiAgIGRybS9tZ2FnMjAwOiBSZW5hbWUgY3Vyc29yIGZ1
bmN0aW9ucyB0byB1c2UgbWdhZzIwMF8gcHJlZml4Cj4gICBkcm0vbWdhZzIwMDogQWRkIGluaXQg
YW5kIGZpbmkgZnVuY3Rpb25zIGZvciBjdXJzb3IgaGFuZGxpbmcKPiAgIGRybS9tZ2FnMjAwOiBB
ZGQgc2VwYXJhdGUgbW92ZS1jdXJzb3IgZnVuY3Rpb24KPiAgIGRybS9tZ2FnMjAwOiBNb3ZlIGN1
cnNvci1pbWFnZSB1cGRhdGUgdG8gbWdhZzIwMF9zaG93X2N1cnNvcigpCj4gICBkcm0vbWdhZzIw
MDogTW92ZSBjdXJzb3IgQk8gc3dhcHBpbmcgaW50byBtZ2FnMjAwX3Nob3dfY3Vyc29yKCkKPiAg
IGRybS9tZ2FnMjAwOiBSZXNlcnZlIHZpZGVvIG1lbW9yeSBmb3IgY3Vyc29yIHBsYW5lCj4gICBk
cm0vbWdhZzIwMDogQWxsb2NhdGUgY3Vyc29yIEJPcyBhdCBoaWdoIGVuZCBvZiB2aWRlbyBtZW1v
cnkKPiAKPiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYyB8IDMxMyAr
KysrKysrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X2Rydi5oICAgIHwgIDIyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFp
bi5jICAgfCAgMjAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMg
ICB8ICAgNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX3R0bS5jICAgIHwg
ICA0ICsKPiAgNSBmaWxlcyBjaGFuZ2VkLCAyMTYgaW5zZXJ0aW9ucygrKSwgMTQ5IGRlbGV0aW9u
cygtKQo+IAo+IC0tCj4gMi4yMy4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
