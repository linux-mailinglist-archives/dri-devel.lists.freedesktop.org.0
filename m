Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13F132EA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 19:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F3C6E82C;
	Fri,  3 May 2019 17:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B676E82C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 17:11:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 785D631E;
 Fri,  3 May 2019 19:11:36 +0200 (CEST)
Date: Fri, 3 May 2019 20:11:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 03/22] drm/bridge: tc358767: fix ansi 8b10b use
Message-ID: <20190503171123.GC4903@pendragon.ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-4-tomi.valkeinen@ti.com>
 <20190420211353.GF4964@pendragon.ideasonboard.com>
 <CAFmnZc3hHt62TPa5_Fq7rbuynFAEhy3QcFHzqxzP_ac9eatygg@mail.gmail.com>
 <20190423145632.GC16111@pendragon.ideasonboard.com>
 <85c349f3-c96d-7db3-5446-5c0d9539580e@ti.com>
 <20190503124825.GF4912@pendragon.ideasonboard.com>
 <c9de8795-fce6-bf0b-08c6-120537272573@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9de8795-fce6-bf0b-08c6-120537272573@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1556903496;
 bh=hmreggQT/ed8g9Xc5El3RyeOBAe1qJwZLxWWbWwd12w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rw3FTss7F1IL5tK3qixjefovGIB1YOoiz1FG7qZCXZwvz9MAF+Wnd27cTX6TNUD05
 i9siJmqzaWa6rQHdK6F3oERQnyESsvVV0yvvH9rOaU4aZf1FAADLBOWPIeLbG4Gfuo
 3fmpgk3yY7mGRwIBPilOFFtebkzNGzxoETbChvrs=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDA0OjE3OjQxUE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDAzLzA1LzIwMTkgMTU6NDgsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBPbiBGcmksIE1heSAwMywgMjAxOSBhdCAwMjo0Mzo1MVBNICswMzAwLCBUb21p
IFZhbGtlaW5lbiB3cm90ZToKPiA+PiBPbiAyMy8wNC8yMDE5IDE3OjU2LCBMYXVyZW50IFBpbmNo
YXJ0IHdyb3RlOgo+ID4+Cj4gPj4+PiBEdXJpbmcgaW5pdGlhbCBkcml2ZXIgZGV2ZWxvcG1lbnQg
SSBoYWQgb25lIGVEUCBkaXNwbGF5IHRoYXQgcmVwb3J0cyAwIGluIEJpdCAwCj4gPj4+PiAoQU5T
SSA4Qi8xMEIpIG9mIERQQ0QgcmVnIDB4MDAwNiAoTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HKS4K
PiA+Pj4+IEFsc28gaXQgZG9lcyBub3QgcmVhY3Qgb24gc2V0dGluZyBCaXQgMCAoU0VUX0FOU0kg
OEIxMEIpIGluIDB4MDEwOAo+ID4+Pj4gKE1BSU5fTElOS19DSEFOTkVMX0NPRElOR19TRVQpIC0g
YWZ0ZXIgcmVhZGluZyBiYWNrIGl0IHdhcyAwIGFnYWluLgo+ID4+Pj4gU28gSSBoYWQgdG8gZGlz
YWJsZSA4QjEwIGVuY29kaW5nIG9uIHRjMzU4NzY3IHNpZGUgdG8gbWFrZSB0aGlzIGRpc3BsYXkK
PiA+Pj4+IHdvcmsuCj4gPj4+Cj4gPj4+IE91dCBvZiBjdXJpb3NpdHksIGhvdyBkb2VzIHRoZSBl
RFAgZGlzcGxheSByZWNvdmVyIHRoZSBjbG9jayB3aXRob3V0Cj4gPj4+IDhCLzEwQiBlbmNvZGlu
ZyA/Cj4gPj4+Cj4gPj4+PiBPbiBvdGhlciBoYW5kIGlmIHRoZXJlIGFyZSBkaXNwbGF5cyB0aGF0
IHJlcG9ydCB6ZXJvIGJpdCAwIGluCj4gPj4+PiBNQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkcgd2hp
bGUgbmVlZGluZyA4YjEwYiB0aGVuIHRoaXMgcGF0Y2ggbG9va3MKPiA+Pj4+IHJlYXNvbmFibGUu
Cj4gPj4+Pgo+ID4+Pj4gTWF5IGJlIGRyaXZlciBzaG91bGQgcmVhZCBiYWNrIE1BSU5fTElOS19D
SEFOTkVMX0NPRElOR19TRVQKPiA+Pj4+IHJlZ2lzdGVyIGFmdGVyIHNldHRpbmcgaXQgYW5kIGNo
ZWNrIGlmIDhiMTBiIGFjdHVhbGx5IGVuYWJsZWQ/Cj4gPj4+Cj4gPj4+IFRoaXMgc291bmRzIGxp
a2UgYSByZWFzb25hYmxlIHRoaW5nIHRvIHRyeS4gVG9taSwgZG8geW91IHN0aWxsIGhhdmUKPiA+
Pj4gYWNjZXNzcyB0byB0aG9zZSBmYXVsdHkgbW9uaXRvcnMgPwo+ID4+Cj4gPj4gT24gbXkgbW9u
aXRvciBpdCBkb2VzIG5vdCBzZWVtIHRvIG1hdHRlciB3aGV0aGVyIEkgd3JpdGUgMCBvciAxIHRv
Cj4gPj4gTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HX1NFVCwgYXMgbG9uZyBhcyBJIGhhdmUgOGIx
MGIgZW5hYmxlZCBvbgo+ID4+IFRDMzU4NzY3IHNpZGUuIFRoZSB3cml0ZXMgZG8gZ28gdGhyb3Vn
aCwgYW5kIEkgY2FuIHJlYWQgdGhlIHdyaXR0ZW4gYml0Cj4gPj4gYmFjay4KPiA+Pgo+ID4+IFNv
Li4uIEkgZ3Vlc3Mgd2hlbiB3ZSB0YWxrIGFib3V0IGVEUCBwYW5lbHMsIHRoZXJlIG1heSBiZSBh
bGwga2luZHMgb2YKPiA+PiBvZGRpdGllcywgYXMgdGhleSdyZSB1c3VhbGx5IG1lYW50IHRvIGJl
IHVzZWQgd2l0aCBhIGNlcnRhaW4gY29uZmlndXJhdGlvbi4KPiA+Pgo+ID4+IEJ1dCBpZiBldmVy
eW9uZSBhZ3JlZXMgdGhhdCA4QjEwQiBpcyBhIG5vcm1hbCwgcmVxdWlyZWQgZmVhdHVyZSBvZiBE
UCwKPiA+PiBhbmQgdGhlcmUgaXMgYW4gZURQIHBhbmVsIHRoYXQgbmVlZHMgOEIxMEIgZGlzYWJs
ZWQsIG1heWJlIHRoYXQgcGFuZWwKPiA+PiBoYXMgdG8gYmUgaGFuZGxlZCBzZXBhcmF0ZWx5IGFz
IGEgc3BlY2lhbCBjYXNlPyBBIGR0cyBlbnRyeSB0byBkaXNhYmxlCj4gPj4gOEIxMEI/IE9yIHNv
bWV0aGluZy4gQnV0IGl0IGRvZXMgbm90IHNvdW5kIGxpa2UgYSBnb29kIGlkZWEgZm9yIHRoZQo+
ID4+IGRyaXZlciB0byB0cnkgdG8gZ3Vlc3MgdGhpcy4KPiA+IAo+ID4gQXMgcmVwb3J0ZWQgYnkg
QW5kcmV5LCB0aGVyZSBpcyBhdCBsZWFzdCBvbmUgcGFuZWwgdGhhdCB3b3VsZCBicmVhayB3aXRo
Cj4gPiB0aGlzIHBhdGNoLiBJIGFncmVlIDhiMTBiIHNob3VsZCBiZSB0aGUgZGVmYXVsdCwgYnV0
IGlmIHRoZSBhYm92ZQo+ID4gcHJvY2VkdXJlIHdvcmtzIGZvciBhbGwgdGhlIHBhbmVscyB3ZSBr
bm93IGFib3V0LCBpcyB0aGVyZSBhbiBpc3N1ZQo+ID4gaW1wbGVtZW50aW5nIGl0ID8KPiAKPiBX
ZWxsLCB3ZSBkb24ndCBoYXZlIGRhdGEgZm9yIGEgYmlnIHNldCBvZiBwYW5lbHMuIEknbSB3b3Jy
aWVkIHRoYXQgc3VjaAo+IGEgY2hhbmdlLCB3aGljaCwgaW4gbXkgb3BpbmlvbiwgbWFrZXMgdGhl
IGRyaXZlciBndWVzcyB3aGV0aGVyIHRvIGVuYWJsZQo+IG9yIGRpc2FibGUgOGIxMGIsIGNhbiBi
cmVhayBvdGhlciBwYW5lbHMgb3IgbW9uaXRvcnMgaWYgdGhlIGd1ZXNzCj4gZG9lc24ndCBnbyBy
aWdodC4gRXNwZWNpYWxseSBhcyBkaXNhYmxpbmcgOGIxMGIgZG9lcyBub3Qgc291bmQgbGlrZSBh
Cj4gdmFsaWQgc2V0dXAgIm9mZmljaWFsbHkiLgo+IAo+IEkgYWdyZWUgdGhhdCBpZiB0aGUgcGFu
ZWwgQW5kcmV5IG1lbnRpb25lZCBpcyBzdGlsbCB1c2VkLCB3ZSBuZWVkIHRvCj4gaGFuZGxlIGl0
IHNvbWVob3cuIEJ1dCBJIHRoaW5rIGV4cGxpY2l0bHkgaGFuZGxpbmcgc3VjaCBhIGNhc2UgaXMg
YmV0dGVyCj4gdGhhbiBndWVzc2luZy4KClRoZSByaXNrIG1heSBub3QgYmUgd29ydGggaXQsIEkg
YWdyZWUuIEkgd291bGQgZXhwbGFpbiB0aGlzIGluIGRldGFpbHMKaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIHRob3VnaCwgYW5kIGFkZCBhIGNvbW1lbnQgdG8gdGhlIGNvZGUgYXMgd2VsbCwgdG8KZWFz
ZSBmdXR1cmUgZGVidWdnaW5nLgoKPiBBbmQgaXNuJ3QgdGhpcyBzb21ldGhpbmcgdGhhdCdzIG5v
dCByZWFsbHkgVEMzNTg3Njcgc3BlY2lmaWM/IElmIHRoYXQKPiBwYW5lbCBpcyB1c2VkIHdpdGgg
b3RoZXIgYnJpZGdlcywgd2UgbmVlZCB0byBkZWFsIHdpdGggdGhpcyBjYXNlIHdpdGgKPiB0aG9z
ZSBicmlkZ2VzIHRvbz8gT3IgaXMgVEMzNTg3NjcgdGhlIG9ubHkgYnJpZGdlIHRoYXQgYWxsb3dz
IGRpc2FibGluZwo+IDhiMTBiPwoKSSBkb24ndCBrbm93IGFib3V0IG90aGVyIGJyaWRnZXMsIGJ1
dCBJIHRoaW5rIGl0IHdvdWxkIG5lZWQgdG8gYmUKaGFuZGxlZCBnbG9iYWxseSwgeWVzLgoKLS0g
ClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
