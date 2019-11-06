Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66BF22DE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 00:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D176EE44;
	Wed,  6 Nov 2019 23:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1D96EE44;
 Wed,  6 Nov 2019 23:51:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 15:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,276,1569308400"; d="scan'208";a="205499630"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by orsmga003.jf.intel.com with ESMTP; 06 Nov 2019 15:51:18 -0800
Date: Wed, 6 Nov 2019 15:54:05 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fbdev: Fallback to non tiled mode if all
 tiles not present
Message-ID: <20191106235404.GJ32264@intel.com>
References: <20191031214839.27039-1-manasi.d.navare@intel.com>
 <20191104091808.GA10326@phenom.ffwll.local>
 <CAMwc25oYjL3K7dcikX-oM_Y4ZP1ZRwUDKvsKO69vg81ZU6Xg8A@mail.gmail.com>
 <20191104210335.GB32264@intel.com>
 <CAPM=9tyEy5aPis7AApd5rsOuE=MWUqjpd4UPf=FA7=KA-Ec8ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tyEy5aPis7AApd5rsOuE=MWUqjpd4UPf=FA7=KA-Ec8ag@mail.gmail.com>
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
Cc: David Airlie <airlied@redhat.com>, "Development,
 Intel" <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTI6NTA6MjFQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gT24gVHVlLCA1IE5vdiAyMDE5IGF0IDA3OjAwLCBNYW5hc2kgTmF2YXJlIDxtYW5hc2ku
ZC5uYXZhcmVAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBh
dCAwNzo0ODoyNlBNICsxMDAwLCBEYXZpZCBBaXJsaWUgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTm92
IDQsIDIwMTkgYXQgNzoxOCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3Rl
Ogo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDI6NDg6MzlQTSAtMDcw
MCwgTWFuYXNpIE5hdmFyZSB3cm90ZToKPiA+ID4gPiA+IEluIGNhc2Ugb2YgdGlsZWQgZGlzcGxh
eXMsIGlmIHdlIGhvdHBsdWcganVzdCBvbmUgY29ubmVjdG9yLAo+ID4gPiA+ID4gZmJjb24gY3Vy
cmVudGx5IGp1c3Qgc2VsZWN0cyB0aGUgcHJlZmVycmVkIG1vZGUgYW5kIGlmIGl0IGlzCj4gPiA+
ID4gPiB0aWxlZCBtb2RlIHRoZW4gdGhhdCBiZWNvbWVzIGEgcHJvYmxlbSBpZiByZXN0IG9mIHRo
ZSB0aWxlcyBhcmUKPiA+ID4gPiA+IG5vdCBwcmVzZW50Lgo+ID4gPiA+ID4gU28gaW4gdGhlIGZi
ZGV2IGRyaXZlciBvbiBob3RwbHVnIHdoZW4gd2UgcHJvYmUgdGhlIGNsaWVudCBtb2Rlc2V0LAo+
ID4gPiA+ID4gd2Ugd2UgZG9udCBmaW5kIGFsbCB0aGUgY29ubmVjdG9ycyBmb3IgYWxsIHRpbGVz
LCB0aGVuIG9uIGEgY29ubmVjdG9yCj4gPiA+ID4gPiB3aXRoIG9uZSB0aWxlLCBqdXN0IGZhbGxi
YWNrIHRvIHRoZSBmaXJzdCBhdmFpbGFibGUgbm9uIHRpbGVkIG1vZGUKPiA+ID4gPiA+IHRvIGRp
c3BsYXkgb3ZlciBhIHNpbmdsZSBjb25uZWN0b3IuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU3VnZ2Vz
dGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+
ID4gPiA+ID4gU3VnZ2VzdGVkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4gPiA+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Cj4gPiA+ID4gPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5j
b20+Cj4gPiA+ID4KPiA+ID4gPiBIbSwgc2hvdWxkIHdlIG1heWIgaGF2ZSBhIHNsaWdodCB0aW1l
b3V0IGZpcnN0IHRvIHdhaXQgZm9yIHRoZSAybmQKPiA+ID4gPiBjb25uZWN0b3I/IE90aGVyd2lz
ZSBsb3RzIG9mIGZsaWNrZXJpbmcgZ29pbmcgb24gd2hlbiBwbHVnZ2luZyBpbiBvbmUgb2YKPiA+
ID4gPiB0aGVzZSBzY3JlZW5zIC4uLgo+ID4gPgo+ID4gPiBOb3QgcmVhbGx5LAo+ID4gPgo+ID4g
PiBUaGVyZSBhcmUgMyBzY2VuYXJpb3Mgd2l0aCB0aGUgbXVsdGktY2FibGUgdGlsZWQgbW9uaXRv
cnMuIGFuZAo+ID4gPiBub24tcmVzaXplYWJsZSBmYmRldi4KPiA+ID4KPiA+ID4gYSkgaXQncyBw
bHVnZ2VkIGluIGF0IGJvb3QuIGJvdGggY2FibGVzIGFyZSBkZXRlY3RlZCwgZmJkZXYgZ2V0cyBh
Cj4gPiA+IGZ1bGwgdGlsZWQgbW9kZS4KPiA+Cj4gPiBZZXMgdGhpcyB3b3JrcyBhcyBleHBlY3Rl
ZAo+ID4KPiA+ID4gYikgaXQncyBub3QgcGx1Z2dlZCBpbiBhdCBib290LCB0aGUgdXNlciBzdGFy
dHMgcGx1Z2dpbmcgaXQgaW4sIGZiZGV2Cj4gPiA+IHdhcyBpbml0ZWQgdmlhIHRoZSBwYW5lbCBv
ciBhbm90aGVyIG1vbml0b3IuIGZiZGV2IHdvbid0IHJlc2l6ZS4KPiA+ID4gYykgaXQncyBoYWxm
IHBsdWdnZWQgaW4gYXQgYm9vdCwgdGhlbiB5b3UgZ2V0IGEgbm9uLXRpbGVkIG1vZGUsIGFuZAo+
ID4gPiBmYmRldiBjYW4ndCByZXNpemUgdG8gdGlsZWQgYW55d2F5cy4KPiA+Cj4gPiBJbiBiIGFu
ZCBjLCB3aGVuIGl0cyBib290ZWQgd2l0aCBvbmx5IDEgY2FibGUgY29ubmVjdGVkIGFuZC9vciBo
b3RwbHVnZ2VkIG9ubHkKPiA+IG9uZSBjYWJsZSBhZnRlciBib290LCBJIGZhbGxiYWNrIHRvIGZp
c3J0IGF2YWlsYWJsZSBub24gdGlsZWQgbW9kZSwgZG9lcyB0aGF0IHNvdW5kIGdvb2Q/Cj4gPgo+
ID4gPgo+ID4gPiBBbHNvIHBsdWdnaW5nIGluIG9uZSBvZiB0aGVzZSBtdWx0aS1jYWJsZSBtb25p
dG9ycyBwaWVjZW1lYWwgaXMgZ29pbmcKPiA+ID4gdG8gdGFrZSBtdWx0aXBsZSBzZWNvbmRzIGZv
ciB0aGUgdXNlciB0byBkbyBwaHlzaWNhbCBjYWJsZSBwbHVnZ2luZy4KPiA+Cj4gPiBTbyBzdGls
bCBnb29kIHdpdGggaWdub3JpbmcgdGhlIHNlY29uZCBob3RwbHVnIGNvbXBsZXRlbHk/Cj4gPiBI
b3dldmVyIGkgZG9ubm8gd2hlcmUgaW4gdGhlIGZiIGhlbHBlciB0byBzdG9wIHBhc3NpbmcgdGhl
IG1vZGVzZXQgZG93bgo+ID4gYWZ0ZXIgdGhlIGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVudCgp
Cj4gCj4gSSBkb24ndCB0aGluayB5b3UgY2FuIGlnbm9yZSBpdCBjb21wbGV0ZWx5LiBJIHRoaW5r
IHlvdSBqdXN0IGhhdmUgdG8KPiBtYWtlIHRoZSBtb2RlIHBpY2tpbmcgbG9naWMgcGljayB0aGUg
cmlnaHQgYW5zd2VyIHNvbWVob3cuCj4gCj4gU28geW91IGNhbiB0ZWxsIGlmIHdpZHRoL2hlaWdo
dCBhcmUgZ29pbmcgdG8gYmUgbG93ZXIgdGhhbiB0aGUgdGlsZWQKPiBtb2RlIHNpemUsIGFuZCBp
biB0aGF0IGNhc2UganVzdCBkb24ndCBlbmFibGUgdGhlIHNlY29uZGFyeSB0aWxlLgo+CgpJdGhp
bmsgdGhpcyB0aWxlZCBtb25pdG9yIGlzIGJlaGF2aW5nIGluIGEgd2F5IHdoZXJlIGlmIHRoZXJl
IGFyZSB0d28gcG9ydHMgY29ubmVjdGVkLCAKb24gdGhlIHJlY2lldmVyIGVuZCBpdCB0cmllcyB0
byBqb2luIHRoZSBvdXRwdXRzIGFuZCBpZiB0aGVyZSBpcyBubyBvdXRwdXQgb3IgYSBkaWZmZXJl
bnQgb3V0cHV0Cm90aGVyIHRoYW4gdGlsZWQgbW9kZSB0aGVuIGl0IGNhbnQgZGlzcGxheSBhbnl0
aGluZyBzbyB0aGUgbW9tZW50IGkgY29ubmVjdCB0aGUgc2Vjb25kIHBvcnQsCml0IGV4cGVjdHMg
dGhlIGZ1bGwgdGlsZWQgb3V0cHV0IGJ1dCBzaW5jZSBubyBtb2RlcyBvbiBzZWNvbmQgY29ubmVj
dG9yLCBpdCBkb2VzbnQgZGlzcGxheSBhbnl0amluZyBnb2VzIGludG8gcG93ZXIgc2F2ZSAKCkl0
IGFsbW9zdCBtYWtlcyBtZSByZXRoaW5rIG91ciBsb2dpYyBvZiBmYWxsaW5nIGJhY2sgdG8gdGhl
IG5vbiB0aWxlZCBtb2RlIGZvciB0aGUgZmlyc3QgaG90cGx1ZyBzaW5jZSBhdGxlYXN0IHRoaXMg
bW9uaXRvcgpkaXNwbGF5cyB0aGUgc2luZ2xlIHRpbGUgYWNyb3NzIHRoZSB3aG9sZSBtb25pdG9y
IGJ5IHN0cmV0Y2hpbmcgaXQgb3V0IGFuZCB0aGVuIGFmdGVyIGNvbm5lY3Rpbmcgc2Vjb25kIGNv
bm5lY3RvciBpdCBjYW4gaWRlYWxseQpnbyBiYWNrIHRvIGEgZnVsbCB0aWxlZCBkaXNwbGF5CgpU
aG91Z2h0cz8KCk1hbmFzaQoKPiBEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
