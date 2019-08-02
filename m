Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD687F7E4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE026EDFE;
	Fri,  2 Aug 2019 13:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DCA6EDFE;
 Fri,  2 Aug 2019 13:10:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17817444-1500050 for multiple; Fri, 02 Aug 2019 14:10:20 +0100
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156475071634.6598.8668583907388398632@skylake-alporthouse-com>
References: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
 <20190802123956.2450-2-sergey.senozhatsky@gmail.com>
 <156475071634.6598.8668583907388398632@skylake-alporthouse-com>
Message-ID: <156475141863.6598.6809215010139776043@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 2/2] i915: do not leak module ref counter
Date: Fri, 02 Aug 2019 14:10:18 +0100
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgtMDIgMTM6NTg6MzYpCj4gUXVvdGluZyBTZXJn
ZXkgU2Vub3poYXRza3kgKDIwMTktMDgtMDIgMTM6Mzk6NTYpCj4gPiBwdXRfZmlsZXN5c3RlbSgp
IGJlZm9yZSBpOTE1X2dlbWZzX2luaXQoKSBkZWFscyB3aXRoCj4gPiBrZXJuX21vdW50KCkgZXJy
b3IuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBTZW5vemhhdHNreSA8c2VyZ2V5LnNl
bm96aGF0c2t5QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbWZzLmMgfCA0ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1mcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
ZnMuYwo+ID4gaW5kZXggY2YwNWJhNzJkZjlkLi5kNDM3MTg4ZDE3MzYgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jCj4gPiBAQCAtMjQsOCArMjQsMTAgQEAgaW50
IGk5MTVfZ2VtZnNfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiA+ICAKPiA+ICAgICAgICAgZ2VtZnMgPSBrZXJu
X21vdW50KHR5cGUpOwo+IAo+IExvb2tpbmcgYXJvdW5kLCBpdCBsb29rcyBsaWtlIHdlIGFsd2F5
cyBuZWVkIHRvIGRyb3AgdHlwZSBhZnRlcgo+IG1vdW50aW5nLiBTaG91bGQgdGhlCj4gICAgICAg
ICBwdXRfZmlsZXN5c3RlbSh0eXBlKTsKPiBiZSBoZXJlIGluc3RlYWQ/Cj4gCj4gQW55d2F5LCBu
aWNlIGNhdGNoLgoKU2lnaC4gcHV0X2ZpbGVzeXN0ZW0oKSBpcyBwYXJ0IG9mIGZzIGludGVybmFs
cy4gSSdkIGJlIHRlbXB0ZWQgdG8gYWRkCgpzdGF0aWMgdm9pZCBwdXRfZmlsZXN5c3RlbShzdHJ1
Y3QgZmlsZV9zeXN0ZW1fdHlwZSAqZnMpCnsKCW1vZHVsZV9wdXQoZnMtPm93bmVyKTsKfQoKYW5k
IGNjIHRoYXQgZm9yIHN0YWJsZS4gQW5kIHNlbmQgYSBwYXRjaCB0byBhZGQgRVhQT1JUX1NZTUJP
TCBhbmQgcXVldWUKaXQgZm9yIHJlbW92YWwuIE9yIGp1c3QgaWdub3JlIHRoZSBzdGFibGVAIHNp
bmNlIGl0J3MgdW5saWtlbHkgdG8gYmUKZXZlciBtZXQgaW4gdGhlIHdpbGQgYW5kIGp1c3QgcmVx
dWVzdCB0aGUgRVhQT1JUX1NZTUJPTC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
