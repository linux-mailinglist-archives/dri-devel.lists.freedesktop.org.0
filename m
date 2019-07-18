Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38F6CED1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AF56E3BF;
	Thu, 18 Jul 2019 13:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BDA6E3BF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:23:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17400362-1500050 for multiple; Thu, 18 Jul 2019 14:23:32 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chunming Zhou <zhoucm1@amd.com>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <156344872806.23055.12897857019960560550@skylake-alporthouse-com>
 <8343b732-2e4b-31f0-9e68-18171977a606@amd.com>
 <156345544398.24728.3877059803253335858@skylake-alporthouse-com>
 <e38b9278-21d7-d4d5-0362-0c63b9f4a6aa@amd.com>
In-Reply-To: <e38b9278-21d7-d4d5-0362-0c63b9f4a6aa@amd.com>
Message-ID: <156345621038.24728.1144921218981142423@skylake-alporthouse-com>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Date: Thu, 18 Jul 2019 14:23:30 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHVubWluZyBaaG91ICgyMDE5LTA3LTE4IDE0OjE1OjQ5KQo+IAo+IOWcqCAyMDE5
LzcvMTggMjE6MTAsIENocmlzIFdpbHNvbiDlhpnpgZM6Cj4gPiBRdW90aW5nIENodW5taW5nIFpo
b3UgKDIwMTktMDctMTggMTQ6MDQ6MDkpCj4gPj4g5ZyoIDIwMTkvNy8xOCAxOToxOCwgQ2hyaXMg
V2lsc29uIOWGmemBkzoKPiA+Pj4gUXVvdGluZyBDaHVubWluZyBaaG91ICgyMDE5LTA3LTE4IDEy
OjEzOjM5KQo+ID4+Pj4gaWYgV0FJVF9GT1JfU1VCTUlUIGlzbid0IHNldCBhbmQgaW4gdGhlIG1l
YW53aGlsZSBubyB1bmRlcmx5aW5nIGZlbmNlIG9uIHN5bmNvYmosCj4gPj4+PiB0aGVuIHJldHVy
biBub24tYmxvY2sgZXJyb3IgY29kZSB0byB1c2VyIHNhcGNlLgo+ID4+PiBCbG9jayBkZXZpY2Ug
cmVxdWlyZWQ/Cj4gPj4gWWVzLCBpZiBXQUlUX0ZPUl9TVUJNSVQgaXMgc2V0LCB0aGVuIHRoYXQg
d2lsbCBibG9jayBkZXZpY2UuCj4gPiBObywgdGhlIGVycm9yIG1lc3NhZ2UgaXMgdGhhdCBpdCBy
ZXF1aXJlcyBhICJibG9jayBkZXZpY2UiLCBub3QgdGhhdCBpdAo+ID4gd2lsbCBibG9jayB0aGUg
ZGV2aWNlLCB3aGljaCBpcyBFV09VTERCTE9DSy4KPiAKPiBPSywgSSBnb3QgeW91ciBtZWFuLgo+
IAo+IEFueSBvdGhlciBwb3NzaWxlIHZhbHVlIHN1Z2dlc3R0ZWQ/CgpFTlhJTyAtLSBmb3IgdGhl
IG5vbi1leGlzdGVudCAiYWRkcmVzcyIgYWxvbmcgdGhlIHRpbWVsaW5lLgpFT1BOT1RTVVBQIC0t
IGFsc28gbWFrZXMgc2Vuc2UsIGJ1dCB3ZSd2ZSBzdGFydGVkIHRvIHVzZSB0aGF0IGZvcgppbnRl
cmZhY2Ugbm90IHN1cHBvcnRlZCwgc28gd291bGQgYmUgYSBiaXQgaW5jb25zaXN0ZW50IGFjcm9z
cyBkcm0uCgpPciBFTk9UQkxLLCBiZWluZyB2ZXJ5IGNsZWFyIGluIHRoZSBjb21taXQgbWVzc2Fn
ZSBob3cgaXQgZG9lc24ndCByZWZsZWN0CnRoZSBvcmlnaW5hbCBtZWFuaW5nIChhcyB3b3VsZCBi
ZSBnaXZlbiBieSBzdHJlcnJvcigpKSBhbmQgd2h5IHRoZQpzZWVtaW5nbHkgbW9yZSBuYXR1cmFs
IEVXT1VMREJMT0NLIGRvZXNuJ3Qgd29yayBmb3IgZHJtIGluIHRoaXMgY2FzZSwKYW5kIHdoYXQg
dXNlIGNhc2UgdGhhdCBuZWVkcyB0byBkaXN0aW5ndWlzaCB0aGlzIHBhcnRpY3VsYXIgY2FzZSAo
aS5lLgp3aHkgRUlOVkFMIGlzbid0IGdvb2QgZW5vdWdoKS4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
