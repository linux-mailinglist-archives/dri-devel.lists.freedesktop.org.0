Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC4B358D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5366B6E846;
	Mon, 16 Sep 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6A9789D02
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:57:55 +0000 (UTC)
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
 by kirsty.vergenet.net (Postfix) with ESMTPA id 2F96425B7B0;
 Fri, 13 Sep 2019 18:57:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
 id 268F3940513; Fri, 13 Sep 2019 10:57:52 +0200 (CEST)
Date: Fri, 13 Sep 2019 10:57:52 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
Message-ID: <20190913085751.j743ry4ygtoyb7n6@verge.net.au>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <CAMuHMdU5SgQhnfoeTc1Ur+dhjrUXkEfpk+9VRQR2EKxLzEnmGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU5SgQhnfoeTc1Ur+dhjrUXkEfpk+9VRQR2EKxLzEnmGg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:05 +0000
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6MzA6NDVBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IE9uIEZyaSwgU2VwIDEzLCAyMDE5IGF0IDEwOjIxIEFNIFNpbW9uIEhvcm1h
biA8aG9ybXNAdmVyZ2UubmV0LmF1PiB3cm90ZToKPiA+IE9uIFRodSwgU2VwIDEyLCAyMDE5IGF0
IDAxOjAwOjQxUE0gKzAzMDAsIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToKPiA+ID4gT24gMTEuMDku
MjAxOSAyMjoyNSwgS2llcmFuIEJpbmdoYW0gd3JvdGU6Cj4gPiA+ID4gQWRkIGRpcmVjdCBzdXBw
b3J0IGZvciB0aGUgcjhhNzc5ODAgKFYzSCkuCj4gPiA+ID4gVGhlIFYzSCBzaGFyZXMgYSBjb21t
b24sIGNvbXBhdGlibGUgY29uZmlndXJhdGlvbiB3aXRoIHRoZSByOGE3Nzk3MAo+ID4gPiA+IChW
M00pIHNvIHRoYXQgZGV2aWNlIGluZm8gc3RydWN0dXJlIGlzIHJldXNlZC4KPiA+ID4KPiA+ID4g
ICAgRG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRkIHlldCBhbm90aGVyIGNvbXBhdGlibGUgaW4gdGhp
cyBjYXNlPwo+ID4gPiBJIGp1c3QgYWRkZWQgcjhhNzc5NzAgdG8gdGhlIGNvbXBhdGlibGUgcHJv
cCBpbiB0aGUgcjhhNzc5ODAgRFQuIFRoYXQncyB3aHkKPiA+ID4gYSBwYXRjaCBsaWtlIHRoaXMg
b25lIGRpZG4ndCBnZXQgcG9zdGVkIGJ5IG1lLgo+ID4KPiA+IFRoZSByZWFzb24gZm9yIGhhdmlu
ZyBwZXItU29DIGNvbXBhdCBzdHJpbmdzIGlzIHRoYXQgdGhlIElQIGJsb2Nrcwo+ID4gYXJlIG5v
dCB2ZXJzaW9uZWQgYW5kIHdoaWxlIHdlIGNhbiBvYnNlcnZlIHRoYXQgdGhlcmUgYXJlIHNpbWls
YXJpdGllcwo+ID4gYmV0d2VlbiwgZi5lLiB0aGUgRFUgb24gdGhlIHI4YTc3OTcwIGFuZCByOGE3
Nzk4MCwgd2UgY2FuJ3QgYmUgY2VydGFpbiB0aGF0Cj4gPiBkaWZmZXJlbmNlcyBtYXkgbm90IGVt
ZXJnZSBhdCBzb21lIHBvaW50LiBCeSBoYXZpbmcgcGVyLVNvQyBjb21wYXQgc3RyaW5ncwo+ID4g
d2UgaGF2ZSB0aGUgZmxleGliaWxpdHkgZm9yIHRoZSBkcml2ZXIgdG8gYWRkcmVzcyBhbnkgc3Vj
aCBkaWZmZXJlbmNlcyBhcwo+ID4gdGhlIG5lZWQgYXJpc2VzLgo+IAo+IFRoYW5rcywgdGhhdCBp
cyB0aGUgZ2VuZXJpYyByZWFzb24sIGFwcGxpY2FibGUgdG8gYWxsIElQIGJsb2NrcyB3aXRob3V0
Cj4gdmVyc2lvbiByZWdpc3RlcnMuCj4gCj4gRm9yIHRoZSBEaXNwbGF5IFVuaXQsIHRoZXJlIGFy
ZSBkb2N1bWVudGVkIGRpZmZlcmVuY2VzIChlLmcuIG51bWJlciBhbmQgdHlwZQo+IG9mIHBvcnRz
KSwgc28gd2UgZGVmaW5pdGVseSBuZWVkIGl0IHRoZXJlLgoKQWNrLgoKPiA+IE15IHJlY29sbGVj
dGlvbiBpcyB0aGF0IHRoaXMgc2NoZW1lIGhhcyBiZWVuIGFkb3B0ZWQgZm9yIG5vbi12ZXJzaW9u
ZWQKPiA+IFJlbmVzYXMgSVAgYmxvY2tzIHNpbmNlIEp1bmUgMjAxNSBhbmQgdXNlcyBvZiB0aGlz
IHNjaGVtZSB3ZWxsIGJlZm9yZSB0aGF0Lgo+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLaWVy
YW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+ID4K
PiA+IFJldmlld2VkLWJ5OiBTaW1vbiBIb3JtYW4gPGhvcm1zK3JlbmVzYXNAdmVyZ2UubmV0LmF1
Pgo+IAo+IEdye29ldGplLGVldGluZ31zLAo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0Cj4gCj4gLS0gCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+IAo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
