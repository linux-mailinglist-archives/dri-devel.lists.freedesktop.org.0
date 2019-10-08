Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B1D0803
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BCA6E907;
	Wed,  9 Oct 2019 07:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8675A6E7C6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:21:56 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 915D88081;
 Tue,  8 Oct 2019 14:22:29 +0000 (UTC)
Date: Tue, 8 Oct 2019 07:21:53 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Message-ID: <20191008142153.GD5610@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
Cc: linux-omap@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkxMDA4IDE0OjE3XToK
PiBPbiAwOC8xMC8yMDE5IDE3OjEzLCBUb255IExpbmRncmVuIHdyb3RlOgo+ID4gKiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkwOTMwIDEwOjM4XToKPiA+ID4gSWYg
dXNlX21jbGsgaXMgZmFsc2UsIG1jbGtfbW9kZSBpcyB3cml0dGVuIHRvIGEgcmVnaXN0ZXIgd2l0
aG91dAo+ID4gPiBpbml0aWFsaXphdGlvbi4gVGhpcyBkb2Vzbid0IGNhdXNlIGFueSBpbGwgZWZm
ZWN0cyBhcyB0aGUgd3JpdHRlbiB2YWx1ZQo+ID4gPiBpcyBub3QgdXNlZCB3aGVuIHVzZV9tY2xr
IGlzIGZhbHNlLgo+ID4gPiAKPiA+ID4gVG8gZml4IHRoaXMsIHdyaXRlIHVzZV9tY2xrIG9ubHkg
d2hlbiB1c2VfbWNsayBpcyB0cnVlLgo+ID4gCj4gPiBIZXkgbmljZSBjYXRjaC4gQmFzZWQgb24g
YSBxdWljayB0ZXN0IGxvb2tzIGxpa2UgdGhpcyBmaXhlcyBhbgo+ID4gaXNzdWUgd2hlcmUgcG93
ZXIgY29uc3VtcHRpb24gc3RheXMgaGlnaGVyIGFmdGVyIHVzaW5nIEhETUkuCj4gPiAKPiA+IFdv
dWxkIGJlIG5pY2UgdG8gaGF2ZSBtZXJnZWQgaW4gdGhlIHY1LjQtcmMgc2VyaWVzOgo+ID4gCj4g
PiBUZXN0ZWQtYnk6IFRvbnkgTGluZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+Cj4gCj4gUmVhbGx5
PyBPaywgd2VsbCwgdGhlbiBpdCB3YXMgYSBnb29kIHJhbmRvbSBmaW5kID0pLgoKWWVhaCBzbyBp
dCBzZWVtcyA6KSBFYXJsaWVyIEkgdGhvdWdodCB0aGVyZSdzIHN0aWxsIHNvbWUKY2xrY3RybCBz
ZXR0aW5nIHdyb25nIGFmdGVyIHVzaW5nIEhETUksIGJ1dCBkaWQgbm90IHNlZQphbnl0aGluZyBk
aWZmaW5nIHRoZSBjbGtjdHJsIHJlZ2lzdGVycyBiZWZvcmUgYW5kIGFmdGVyCmFuZCBnYXZlIHVw
LgoKPiBJIGRpZCBhbHJlYWR5IHB1c2ggdGhpcyB0byBkcm0tbWlzYy1uZXh0LCBhcyBJIHRob3Vn
aHQgaXQgZG9lcyBub3QgaGF2ZSBhbnkKPiByZWFsIGVmZmVjdC4gSSdsbCBjaGVjayBpZiBpdCdz
IG9rIHRvIHB1c2ggdG8gZHJtLW1pc2MtZml4ZXMgdG9vLCB3aXRoIENjCj4gc3RhYmxlLgoKT0sg
Z3JlYXQgdGhhbmtzLgoKVG9ueQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
