Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC0B7E96
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 17:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD476F754;
	Thu, 19 Sep 2019 15:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE916F74A;
 Thu, 19 Sep 2019 15:53:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18548271-1500050 for multiple; Thu, 19 Sep 2019 16:52:57 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAKMK7uHFvCLyYos63-NrFUXoHicSLFKSc-iB+W25O3uMi57B+A@mail.gmail.com>
References: <20190919150853.18181-1-chris@chris-wilson.co.uk>
 <CAKMK7uHFvCLyYos63-NrFUXoHicSLFKSc-iB+W25O3uMi57B+A@mail.gmail.com>
Message-ID: <156890837522.1196.3651613875765766741@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf: Implement simple read/write vfs ops
Date: Thu, 19 Sep 2019 16:52:55 +0100
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA5LTE5IDE2OjI4OjQxKQo+IE9uIFRodSwgU2Vw
IDE5LCAyMDE5IGF0IDU6MDkgUE0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+IHdyb3RlOgo+ID4KPiA+IEl0IGlzIGV4cGVjdGVkIHRoYXQgcHJvY2Vzc2VzIHdpbGwgcGFz
cyBkbWEtYnVmIGZkIGJldHdlZW4gZHJpdmVycywgYW5kCj4gPiBvbmx5IHVzaW5nIHRoZSBmZCB0
aGVtc2VsdmVzIGZvciBtbWFwaW5nIGFuZCBzeW5jaHJvbmlzYXRpb24gaW9jdGxzLgo+ID4gSG93
ZXZlciwgaXQgbWF5IGJlIGNvbnZlbmllbnQgZm9yIGFuIGFwcGxpY2F0aW9uIHRvIHJlYWQvd3Jp
dGUgaW50byB0aGUKPiA+IGRtYS1idWYsIGZvciBpbnN0YW5jZSBhIHRlc3QgY2FzZSB0byBjaGVj
ayB0aGUgaW50ZXJuYWwKPiA+IGRtYV9idWYtPm9wcy0+a21hcCBpbnRlcmZhY2UuIFRoZXJlIG1h
eSBhbHNvIGJlIGEgc21hbGwgYWR2YW50YWdlIHRvCj4gPiBhdm9pZGluZyB0aGUgbW1hcCgpIGZv
ciB2ZXJ5IHNpbXBsZS9zbWFsbCBvcGVyYXRpb25zLgo+ID4KPiA+IE5vdGUgaW4gcGFydGljdWxh
ciwgc3luY2hyb25pc2F0aW9uIHdpdGggdGhlIGRldmljZSBpcyBsZWZ0IHRvIHRoZQo+ID4gY2Fs
bGVyIHdpdGggYW4gZXhwbGljaXQgRE1BX0JVRl9JT0NUTF9TWU5DLCByYXRoZXIgdGhhbiBkb25l
IGltcGxpY2l0bHkKPiA+IGluc2lkZSB0aGUgcmVhZC93cml0ZSwgc28gdGhhdCB0aGUgdXNlciBj
YW4gYXZvaWQgc3luY2hyb25pc2F0aW9uIGlmCj4gPiB0aGV5IHNvIGNob29zZS4KPiA+Cj4gPiAi
SXQgaXMgZWFzaWVyIHRvIGFkZCBzeW5jaHJvbmlzYXRpb24gbGF0ZXIsIHRoYW4gaXQgaXMgdG8g
dGFrZSBpdCBhd2F5LiIKPiAKPiBIbSBmb3IgbW1hcCBJIHRoaW5rIHRoZSBleHBsaWNpdCBzeW5j
IG1ha2VzIHNlbnNlICh3ZSBtaWdodCBldmVuIHdhbnQKPiB0byBkbyBpdCBpbiB1c2Vyc3BhY2Up
LiBOb3Qgc28gc3VyZSBpdCdzIGEgZ3JlYXQgaWRlYSBmb3IgcmVhZC93cml0ZQo+IC4uLiBJIGd1
ZXNzIHdlJ2QgbmVlZCB0byBzZWUgd2hhdCBwZW9wbGUgaGF2ZS9oYWQgaW4gbWluZCBmb3IgdGhl
Cj4gdXNlcnNwYWNlIGZvciB0aGlzIHRvIGRlY2lkZS4KClRoZXJlJ3MgYW4gT19TWU5DIGZsYWcg
Zm9yIG9wZW4oMik6CgogICAgICAgT19TWU5DIFdyaXRlIG9wZXJhdGlvbnMgb24gdGhlIGZpbGUg
d2lsbCBjb21wbGV0ZSBhY2NvcmRpbmcgdG8gdGhlCiAgICAgICAgICAgICAgcmVxdWlyZW1lbnRz
IG9mIHN5bmNocm9uaXplZCBJL08gZmlsZSBpbnRlZ3JpdHkgY29tcGxldGlvbiAoYnkKICAgICAg
ICAgICAgICBjb250cmFzdCB3aXRoIHRoZSBzeW5jaHJvbml6ZWQgSS9PIGRhdGEgaW50ZWdyaXR5
IGNvbXBsZXRpb24KICAgICAgICAgICAgICBwcm92aWRlZCBieSBPX0RTWU5DLikKCiAgICAgICAg
ICAgICAgQnkgdGhlIHRpbWUgd3JpdGUoMikgKG9yIHNpbWlsYXIpIHJldHVybnMsIHRoZSBvdXRw
dXQgZGF0YSBhbmQKICAgICAgICAgICAgICBhc3NvY2lhdGVkIGZpbGUgbWV0YWRhdGEgaGF2ZSBi
ZWVuIHRyYW5zZmVycmVkIHRvIHRoZSB1bmRlcmx54oCQCiAgICAgICAgICAgICAgaW5nIGhhcmR3
YXJlIChpLmUuLCBhcyB0aG91Z2ggZWFjaCB3cml0ZSgyKSB3YXMgZm9sbG93ZWQgYnkgYQogICAg
ICAgICAgICAgIGNhbGwgdG8gZnN5bmMoMikpLgoKVGhhdCBzZWVtcyBhcHBsaWNhYmxlIGhlcmU/
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
