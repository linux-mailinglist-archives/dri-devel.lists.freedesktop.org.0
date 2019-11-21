Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B3210526A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 13:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93DF6EB3D;
	Thu, 21 Nov 2019 12:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C496E182;
 Thu, 21 Nov 2019 12:52:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 04:52:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="216129127"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Nov 2019 04:52:36 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 21 Nov 2019 14:52:36 +0200
Date: Thu, 21 Nov 2019 14:52:36 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191121125236.GX11621@lahna.fi.intel.com>
References: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121114610.GW11621@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Karol Herbst <kherbst@redhat.com>, Linux PM <linux-pm@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDE6NDY6MTRQTSArMDIwMCwgTWlrYSBXZXN0ZXJiZXJn
IHdyb3RlOgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEyOjM0OjIyUE0gKzAxMDAsIFJhZmFl
bCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MjggUE0g
TWlrYSBXZXN0ZXJiZXJnCj4gPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDExOjI5OjMzUE0gKzAxMDAsIFJhZmFl
bCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiA+ID4gbGFzdCB3ZWVrIG9yIHNvIEkgZm91bmQgc3lz
dGVtcyB3aGVyZSB0aGUgR1BVIHdhcyB1bmRlciB0aGUgIlBDSQo+ID4gPiA+ID4gRXhwcmVzcyBS
b290IFBvcnQiIChuYW1lIGZyb20gbHNwY2kpIGFuZCBvbiB0aG9zZSBzeXN0ZW1zIGFsbCBvZiB0
aGF0Cj4gPiA+ID4gPiBzZWVtcyB0byB3b3JrLiBTbyBJIGFtIHdvbmRlcmluZyBpZiBpdCdzIGlu
ZGVlZCBqdXN0IHRoZSAweDE5MDEgb25lLAo+ID4gPiA+ID4gd2hpY2ggYWxzbyBleHBsYWlucyBN
aWthcyBjYXNlIHRoYXQgVGh1bmRlcmJvbHQgc3R1ZmYgd29ya3MgYXMgZGV2aWNlcwo+ID4gPiA+
ID4gbmV2ZXIgZ2V0IHBvcHVsYXRlZCB1bmRlciB0aGlzIHBhcnRpY3VsYXIgYnJpZGdlIGNvbnRy
b2xsZXIsIGJ1dCB1bmRlcgo+ID4gPiA+ID4gdGhvc2UgIlJvb3QgUG9ydCJzCj4gPiA+ID4KPiA+
ID4gPiBJdCBhbHdheXMgaXMgYSBQQ0llIHBvcnQsIGJ1dCBpdHMgbG9jYXRpb24gd2l0aGluIHRo
ZSBTb0MgbWF5IG1hdHRlci4KPiA+ID4KPiA+ID4gRXhhY3RseS4gSW50ZWwgaGFyZHdhcmUgaGFz
IFBDSWUgcG9ydHMgb24gQ1BVIHNpZGUgKHRoZXNlIGFyZSBjYWxsZWQKPiA+ID4gUEVHLCBQQ0kg
RXhwcmVzcyBHcmFwaGljcywgcG9ydHMpLCBhbmQgdGhlIFBDSCBzaWRlLiBJIHRoaW5rIHRoZSBJ
UCBpcwo+ID4gPiBzdGlsbCB0aGUgc2FtZS4KPiA+ID4KPiA+ID4gPiBBbHNvIHNvbWUgY3VzdG9t
IEFNTC1iYXNlZCBwb3dlciBtYW5hZ2VtZW50IGlzIGludm9sdmVkIGFuZCB0aGF0IG1heQo+ID4g
PiA+IGJlIG1ha2luZyBzcGVjaWZpYyBhc3N1bXB0aW9ucyBvbiB0aGUgY29uZmlndXJhdGlvbiBv
ZiB0aGUgU29DIGFuZCB0aGUKPiA+ID4gPiBHUFUgYXQgdGhlIHRpbWUgb2YgaXRzIGludm9jYXRp
b24gd2hpY2ggdW5mb3J0dW5hdGVseSBhcmUgbm90IGtub3duIHRvCj4gPiA+ID4gdXMuCj4gPiA+
ID4KPiA+ID4gPiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRoZSBBTUwgaW52b2tlZCB0byBwb3dl
ciBkb3duIHRoZSBHUFUgZnJvbQo+ID4gPiA+IGFjcGlfcGNpX3NldF9wb3dlcl9zdGF0ZSgpIGdl
dHMgY29uZnVzZWQgaWYgaXQgaXMgbm90IGluIFBDSSBEMCBhdAo+ID4gPiA+IHRoYXQgcG9pbnQs
IHNvIGl0IGxvb2tzIGxpa2UgdGhhdCBBTUwgdHJpZXMgdG8gYWNjZXNzIGRldmljZSBtZW1vcnkg
b24KPiA+ID4gPiB0aGUgR1BVIChiZXlvbmQgdGhlIFBDSSBjb25maWcgc3BhY2UpIG9yIHNpbWls
YXIgd2hpY2ggaXMgbm90Cj4gPiA+ID4gYWNjZXNzaWJsZSBpbiBQQ0kgcG93ZXIgc3RhdGVzIGJl
bG93IEQwLgo+ID4gPgo+ID4gPiBPciB0aGUgUENJIGNvbmZpZyBzcGFjZSBvZiB0aGUgR1BVIHdo
ZW4gdGhlIHBhcmVudCByb290IHBvcnQgaXMgaW4gRDNob3QKPiA+ID4gKGFzIGl0IGlzIHRoZSBj
YXNlIGhlcmUpLiBBbHNvIHRoZW4gdGhlIEdQVSBjb25maWcgc3BhY2UgaXMgbm90Cj4gPiA+IGFj
Y2Vzc2libGUuCj4gPiAKPiA+IFdoeSB3b3VsZCB0aGUgcGFyZW50IHBvcnQgYmUgaW4gRDNob3Qg
YXQgdGhhdCBwb2ludD8gIFdvdWxkbid0IHRoYXQgYmUKPiA+IGEgc3VzcGVuZCBvcmRlcmluZyB2
aW9sYXRpb24/Cj4gCj4gTm8uIFdlIHB1dCB0aGUgR1BVIGludG8gRDNob3QgZmlyc3QsIHRoZW4g
dGhlIHJvb3QgcG9ydCBhbmQgdGhlbiB0dXJuCj4gb2ZmIHRoZSBwb3dlciByZXNvdXJjZSAod2hp
Y2ggaXMgYXR0YWNoZWQgdG8gdGhlIHJvb3QgcG9ydCkgcmVzdWx0aW5nCj4gdGhlIHRvcG9sb2d5
IGVudGVyaW5nIEQzY29sZC4KCkkgZG9uJ3Qgc2VlIHRoYXQgaGFwcGVuaW5nIGluIHRoZSBBTUwg
dGhvdWdoLgoKQmFzaWNhbGx5IHRoZSBkaWZmZXJlbmNlIGlzIHRoYXQgd2hlbiBXaW5kb3dzIDcg
b3IgTGludXggKHRoZSBfUkVWPT01CmNoZWNrKSB0aGVuIHdlIGRpcmVjdGx5IGRvIGxpbmsgZGlz
YWJsZSB3aGVyZWFzIGluIFdpbmRvd3MgOCsgd2UgaW52b2tlCkxLRFMoKSBtZXRob2QgdGhhdCBw
dXRzIHRoZSBsaW5rIGludG8gTDIvTDMuIE5vbmUgb2YgdGhlIGZpZWxkcyB0aGV5CmFjY2VzcyBz
ZWVtIHRvIHRvdWNoIHRoZSBHUFUgaXRzZWxmLgoKTEtEUygpIGZvciB0aGUgZmlyc3QgUEVHIHBv
cnQgbG9va3MgbGlrZSB0aGlzOgoKICAgUDBMMiA9IE9uZQogICBTbGVlcCAoMHgxMCkKICAgTG9j
YWwwID0gWmVybwogICBXaGlsZSAoUDBMMikKICAgewoJSWYgKChMb2NhbDAgPiAweDA0KSkKCXsK
CSAgICBCcmVhawoJfQoKCVNsZWVwICgweDEwKQoJTG9jYWwwKysKICAgfQoKT25lIHRoaW5nIHRo
YXQgY29tZXMgdG8gbWluZCBpcyB0aGF0IHRoZSBsb29wIGNhbiBlbmQgZXZlbiBpZiBQMEwyIGlz
Cm5vdCBjbGVhcmVkIGFzIGl0IGRvZXMgb25seSA1IGl0ZXJhdGlvbnMgd2l0aCAxNiBtcyBzbGVl
cCBiZXR3ZWVuLiBNYXliZQpTbGVlcCgpIGlzIGltcGxlbWVudGVkIGRpZmZlcmVudGx5IGluIFdp
bmRvd3M/IEkgbWVhbiBMaW51eCBtYXkgYmUKImZhc3RlciIgaGVyZSBhbmQgcmV0dXJuIHByZW1h
dHVyZWx5IGFuZCBpZiB3ZSBsZWF2ZSB0aGUgcG9ydCBpbnRvIEQwCnRoaXMgZG9lcyBub3QgaGFw
cGVuLCBvciBzb21ldGhpbmcuIEknbSBqdXN0IHRocm93aW5nIG91dCBpZGVhcyA6KQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
