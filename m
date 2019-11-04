Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F9EEAAD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 22:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC046E87A;
	Mon,  4 Nov 2019 21:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91DC6E87A;
 Mon,  4 Nov 2019 21:00:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 13:00:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="219617345"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2019 13:00:53 -0800
Date: Mon, 4 Nov 2019 13:03:36 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: David Airlie <airlied@redhat.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fbdev: Fallback to non tiled mode if all
 tiles not present
Message-ID: <20191104210335.GB32264@intel.com>
References: <20191031214839.27039-1-manasi.d.navare@intel.com>
 <20191104091808.GA10326@phenom.ffwll.local>
 <CAMwc25oYjL3K7dcikX-oM_Y4ZP1ZRwUDKvsKO69vg81ZU6Xg8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMwc25oYjL3K7dcikX-oM_Y4ZP1ZRwUDKvsKO69vg81ZU6Xg8A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "Development, Intel" <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDc6NDg6MjZQTSArMTAwMCwgRGF2aWQgQWlybGllIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQgNzoxOCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgT2N0IDMxLCAyMDE5IGF0IDAyOjQ4
OjM5UE0gLTA3MDAsIE1hbmFzaSBOYXZhcmUgd3JvdGU6Cj4gPiA+IEluIGNhc2Ugb2YgdGlsZWQg
ZGlzcGxheXMsIGlmIHdlIGhvdHBsdWcganVzdCBvbmUgY29ubmVjdG9yLAo+ID4gPiBmYmNvbiBj
dXJyZW50bHkganVzdCBzZWxlY3RzIHRoZSBwcmVmZXJyZWQgbW9kZSBhbmQgaWYgaXQgaXMKPiA+
ID4gdGlsZWQgbW9kZSB0aGVuIHRoYXQgYmVjb21lcyBhIHByb2JsZW0gaWYgcmVzdCBvZiB0aGUg
dGlsZXMgYXJlCj4gPiA+IG5vdCBwcmVzZW50Lgo+ID4gPiBTbyBpbiB0aGUgZmJkZXYgZHJpdmVy
IG9uIGhvdHBsdWcgd2hlbiB3ZSBwcm9iZSB0aGUgY2xpZW50IG1vZGVzZXQsCj4gPiA+IHdlIHdl
IGRvbnQgZmluZCBhbGwgdGhlIGNvbm5lY3RvcnMgZm9yIGFsbCB0aWxlcywgdGhlbiBvbiBhIGNv
bm5lY3Rvcgo+ID4gPiB3aXRoIG9uZSB0aWxlLCBqdXN0IGZhbGxiYWNrIHRvIHRoZSBmaXJzdCBh
dmFpbGFibGUgbm9uIHRpbGVkIG1vZGUKPiA+ID4gdG8gZGlzcGxheSBvdmVyIGEgc2luZ2xlIGNv
bm5lY3Rvci4KPiA+ID4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IERhdmUgQWlybGll
IDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVk
aGF0LmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2
YXJlQGludGVsLmNvbT4KPiA+Cj4gPiBIbSwgc2hvdWxkIHdlIG1heWIgaGF2ZSBhIHNsaWdodCB0
aW1lb3V0IGZpcnN0IHRvIHdhaXQgZm9yIHRoZSAybmQKPiA+IGNvbm5lY3Rvcj8gT3RoZXJ3aXNl
IGxvdHMgb2YgZmxpY2tlcmluZyBnb2luZyBvbiB3aGVuIHBsdWdnaW5nIGluIG9uZSBvZgo+ID4g
dGhlc2Ugc2NyZWVucyAuLi4KPiAKPiBOb3QgcmVhbGx5LAo+IAo+IFRoZXJlIGFyZSAzIHNjZW5h
cmlvcyB3aXRoIHRoZSBtdWx0aS1jYWJsZSB0aWxlZCBtb25pdG9ycy4gYW5kCj4gbm9uLXJlc2l6
ZWFibGUgZmJkZXYuCj4gCj4gYSkgaXQncyBwbHVnZ2VkIGluIGF0IGJvb3QuIGJvdGggY2FibGVz
IGFyZSBkZXRlY3RlZCwgZmJkZXYgZ2V0cyBhCj4gZnVsbCB0aWxlZCBtb2RlLgoKWWVzIHRoaXMg
d29ya3MgYXMgZXhwZWN0ZWQKCj4gYikgaXQncyBub3QgcGx1Z2dlZCBpbiBhdCBib290LCB0aGUg
dXNlciBzdGFydHMgcGx1Z2dpbmcgaXQgaW4sIGZiZGV2Cj4gd2FzIGluaXRlZCB2aWEgdGhlIHBh
bmVsIG9yIGFub3RoZXIgbW9uaXRvci4gZmJkZXYgd29uJ3QgcmVzaXplLgo+IGMpIGl0J3MgaGFs
ZiBwbHVnZ2VkIGluIGF0IGJvb3QsIHRoZW4geW91IGdldCBhIG5vbi10aWxlZCBtb2RlLCBhbmQK
PiBmYmRldiBjYW4ndCByZXNpemUgdG8gdGlsZWQgYW55d2F5cy4KCkluIGIgYW5kIGMsIHdoZW4g
aXRzIGJvb3RlZCB3aXRoIG9ubHkgMSBjYWJsZSBjb25uZWN0ZWQgYW5kL29yIGhvdHBsdWdnZWQg
b25seQpvbmUgY2FibGUgYWZ0ZXIgYm9vdCwgSSBmYWxsYmFjayB0byBmaXNydCBhdmFpbGFibGUg
bm9uIHRpbGVkIG1vZGUsIGRvZXMgdGhhdCBzb3VuZCBnb29kPwoKPiAKPiBBbHNvIHBsdWdnaW5n
IGluIG9uZSBvZiB0aGVzZSBtdWx0aS1jYWJsZSBtb25pdG9ycyBwaWVjZW1lYWwgaXMgZ29pbmcK
PiB0byB0YWtlIG11bHRpcGxlIHNlY29uZHMgZm9yIHRoZSB1c2VyIHRvIGRvIHBoeXNpY2FsIGNh
YmxlIHBsdWdnaW5nLgoKU28gc3RpbGwgZ29vZCB3aXRoIGlnbm9yaW5nIHRoZSBzZWNvbmQgaG90
cGx1ZyBjb21wbGV0ZWx5PwpIb3dldmVyIGkgZG9ubm8gd2hlcmUgaW4gdGhlIGZiIGhlbHBlciB0
byBzdG9wIHBhc3NpbmcgdGhlIG1vZGVzZXQgZG93bgphZnRlciB0aGUgZHJtX2ZiX2hlbHBlcl9o
b3RwbHVnX2V2ZW50KCkKCkFueSBzdWdnZXN0aW9ucz8KClJlZ2FyZHMKTWFuYXNpCgo+IAo+IERh
dmUuCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
