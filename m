Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD392AEF8
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5478C89850;
	Mon, 27 May 2019 06:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3479689830;
 Mon, 27 May 2019 06:55:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 85AE68046D;
 Mon, 27 May 2019 08:54:57 +0200 (CEST)
Date: Mon, 27 May 2019 08:54:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/7] drm: make headers self-contained and drop drmP.h
Message-ID: <20190527065456.GC8648@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
 <20190527061835.GH21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527061835.GH21222@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=ERpt7XKqUhCZQlnr3SsA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgpPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwODoxODozNUFNICswMjAwLCBEYW5p
ZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFN1biwgTWF5IDI2LCAyMDE5IGF0IDA3OjM1OjI4UE0gKzAy
MDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IFdoaWxlIHJlbW92aW5nIHVzZSBvZiBkcm1QLmgg
ZnJvbSBmaWxlcyBpbiBkcm0vKiBJCj4gPiBub3RpY2VkIHRoYXQgSSBoYWQgdG8gYWRkIHRoZSBz
YW1lIGluY2x1ZGUgZmlsZXMgZHVlIHRvCj4gPiBkZXBlbmRlbmNpZXMgaW4gdGhlIGhlYWRlciBm
aWxlcy4KPiA+IAo+ID4gSXQgaXMgYmV0dGVyIHRvIGxldCB0aGUgaGVhZGVyIGZpbGVzIGJlIHNl
bGYtY29udGFpbmVkIGFuZAo+ID4gbGV0IHRoZSB1c2VycyBwdWxsIGluIG9ubHkgdGhlIGFkZGl0
aW9uYWwgaGVhZGVycyBmaWxlcyByZXF1aXJlZC4KPiA+IFNvIEkgd2VudCBhaGVhZCBhbmQgbWFk
ZSB0aGUgcmVsZXZhbnQgaGVhZGVyIGZpbGVzIHNlbGYtY29udGFpbmVkLgo+ID4gKEkgZGlkIG5v
dCBjaGVjayBpZiB0aGlzIG1hZGUgYW55IGluY2x1ZGVzIHJlZHVuZGFudCBpbiBzb21lIGZpbGVz
LAo+ID4gSSBkbyBub3QgaGF2ZSB0b29saW5nIGluIHBsYWNlIHRvIGRvIHNvKS4KPiA+IAo+ID4g
RGFuaWVsIHN1Z2dlc3RlZCB0byBhZGQgc3VwcG9ydCBmb3IgdGVzdGluZyB0aGF0IHRoZXkgc3Rh
eQo+ID4gc2VsZiBjb250YWluZWQuCj4gPiBKYW5pIE5pa3VsYSBoYXMgc2VudCBhIHBhdGNoIHRv
IGtidWlsZCB0byBtYWtlIHRoaXMgcGFydCBvZiB0aGUKPiA+IGtidWlsZCBtYWNoaW5lcnkuIEkg
aGF2ZSB1c2VkIGl0IGxvY2FsbHkgYW5kIGFzIHNvb24gYXMgaXQKPiA+IGxhbmRzIGluIGtidWls
ZCBJIHdpbGwgc3RhcnQgdXNpbmcgaXQgZm9yIGRybS4KPiA+IFdlIGNvdWxkIGhhdmUgZHVwbGlj
YXRlZCB0aGUgaW5mcmFzdHJ1Y3R1cmUgbm93IGJ1dCB0aGF0IHNlZW1lZAo+ID4gdG9vIG11Y2gg
Y29kZSBjaHJ1bmNoLgo+ID4gCj4gPiBUaGlzIHBhdGNoc2V0IGluY2x1ZGUgdGhlIGFjdHVhbCBy
ZW1vdmFsIG9mIGRybVAuaCBhcyBvbmUgYmlnIHBhdGNoLgo+ID4gVGhpcyBpcyBidWlsZCB0ZXN0
ZWQgb24gYWxwaGEgKGFsd2F5cyBpbnRlcmVzdGluZyksIGFybSwgYXJtNjQsIHg4NiBldGMuCj4g
PiAKPiA+IEZvciBhbGwgZmlsZXMgdG91Y2hlZCB0aGUgZm9sbG93aW5nIHdhcyBkb25lOgo+ID4g
LSBpbmNsdWRlIGZpbGVzIGRpdmlkZWQgdXAgaW4gYmxvY2tzIGluIGZvbGxvd2luZyBvcmRlcjoK
PiA+ICAgICAJbGludXgvKgo+ID4gCXZpZGVvLyoKPiA+IAlkcm0vKgo+ID4gCSIiCj4gPiAtIHdp
dGhpbiBlYWNoIGJsb2NrIHRoZSBpbmNsdWRlIGZpbGVzIGFyZSBzb3J0ZWQgYWxwaGFiZXRpY2Fs
bHkKPiA+IAo+ID4gdjI6Cj4gPiAtIHVzZSBzYW1lIG9yZGVyaW5nIGFmIGJsb2Nrcwo+ID4gLSBt
b3ZlIGluY2x1ZGVzIGRvd24gYmVsb3cgbGljZW5zZSB0ZXh0Cj4gPiAtIGFkZGVkIHBhdGNoIHdp
dGggYWN0dWFsIGRybVAuaCByZW1vdmFsCj4gPiAtIHJld29yZGVkIHNvbWUgc3ViamVjdHMgdG8g
bWFrZSB0aGVtIG1vcmUgZGVzY3JpcHRpdmUKPiA+IC0gZml4ZWQgYSBmZXcgc3BlbGxpbmcgZXJy
b3MgaW4gY2hhbmdlbG9ncyAoYnV0IGEgZmV3IG1heSByZW1haW4pCj4gPiAKPiA+ICAgICAgICAg
U2FtCj4gCj4gT24gdGhlIHNlcmllczoKPiAKPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KVGhhbmtzCgo+IAo+IERpZCBhIGJpdCBvZiBzY3JvbGxpbmcs
IGxvb2tzIGFsbCByZWFzb25hYmxlLCBidXQgZGVmaW5pdGVseSBkaWRuJ3QgY2hlY2sKPiB0aGlu
Z3MgaW4tZGVwdGguCj4gCj4gYnR3IGRpZCB5b3UgbG9vayBhdCB0aGUgaTkxNSBNYWtlZmlsZSB0
cmlja2VyeSB0byBtYWtlIHN1cmUgaGVhZGVycyBzdGF5Cj4gc2VsZi1jb250YWluZWQ/Cll1cCwg
dGhpcyBpcyB3aGF0IEphbmkgd29ya3Mgb24gZ2V0dGluZyB1cHN0cmVhbWVkIHRvIGJlIHBhcnQg
b2Yga2J1aWxkLgpXaGVuIGl0IGxhbmRzIEkgd2lsbCBhY3RpdmF0ZSBpdCBmb3IgdGhlIGRybSBo
ZWFkZXJzIChpZiBub3QgYmVhdGVuIGJ5CnNvbWVvbmUgZWxzZSkKSSB1c2VkIGl0IGxvY2FsbHkg
dG8gY2hlY2sgZXZlcnl0aGluZyB3YXMgT0suCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
