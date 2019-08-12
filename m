Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11ED8A686
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 20:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AED66E5B4;
	Mon, 12 Aug 2019 18:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777F76E5B4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 18:49:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 903A4803BA;
 Mon, 12 Aug 2019 20:49:32 +0200 (CEST)
Date: Mon, 12 Aug 2019 20:49:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/4] drm/mipi-dbi: Support command mode panel drivers
Message-ID: <20190812184931.GB6607@ravnborg.org>
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-2-noralf@tronnes.org>
 <20190811141658.GA7522@ravnborg.org>
 <5bf97f4e-e6d0-0f2d-5e6a-f6d20617bc93@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bf97f4e-e6d0-0f2d-5e6a-f6d20617bc93@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=W4eJuxmcOGY5hT8Px3oA:9 a=CjuIK1q_8ugA:10
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKPiA+IC0gZHJtX3BhbmVsIGhhcyBwcm9wZXIgc3VwcG9ydCBmb3IgbW9kZXMu
Cj4gPiAgIFRoaXMgaXMgdG9kYXkgZHVwbGljYXRlZCBpbiBtaXBpX2RiaS4KPiA+ICAgQ291bGQg
d2UgbWFrZSBpdCBzbyB0aGF0IHdoZW4gYSBwYW5lbCBpcyB1c2VkIHRoZW4gdGhlIHBhbmVsCj4g
PiAgIGhhcyB0aGUgbW9kZSBpbmZvIC0gYXMgd2UgdGhlbiB1c2UgdGhlIHBhbmVsIG1vcmUgaW4g
dGhlIHdheSB3ZSBkbwo+ID4gICBpbiBvdGhlciBjYXNlcz8KPiA+ICAgQXMgaXQgaXMgbm93IHRo
ZSBtb2RlIGlzIHNwZWNpZmllZCBpbiBtaXBpX2RiaV9kZXZfaW5pdCgpCj4gPiAgIFRoZSBkcm1f
Y29ubmVjdG9yIHdvdWxkIHRoZW4sIGlmIGEgcGFuZWwgaXMgdXNlZCwgYXNrIHRoZSBwYW5lbCBm
b3IKPiA+ICAgdGhlIG1vZGUuCj4gPiAgIEkgZGlkIG5vdCByZWFsbHkgdGhpbmsgdG8gdGhlIGVu
ZCBvZiB0aGlzLCBidXQgaXQgc2VlbXMgd3JvbmcgdGhhdAo+ID4gICB3ZSBpbnRyb2R1Y2UgZHJt
X3BhbmVsIGFuZCB0aGVuIGtlZXAgbW9kZXMgaW4gbWlwaV9kYmkuCj4gPiAKPiAKPiBJIGNvbnNp
ZGVyZWQgdGhhdCwgYnV0IGl0IHdvdWxkIHdvdWxkIGp1c3QgZ2VuZXJhdGUgZHVwbGljYXRlIGNv
ZGUgZm9yCj4gdGhlIGNvbm5lY3Rvci4gSXQgd291bGQgbWFrZSBzZW5zZSB0byByZWZhY3RvciB0
aGlzIHdoZW4vaWYgYWxsIG1pcGkgZGJpCj4gZHJpdmVycyBhcmUgdHVybmVkIGludG8gcGFuZWwg
ZHJpdmVycy4KClRoZSBvYmplY3RpdmUgc2hvdWxkIGJlIHRoYXQgYWxsIG1pcGkgZGJpIGRyaXZl
cnMgY291bGQgYmUgcmVmYWN0b3JlZC4KQW5kIHNvIGl0IG1ha2VzIHNlbnNlIHRvIGRvIGl0IHJp
Z2h0IGZyb20gdGhlIGJlZ2lubmluZy4KSXQgd2lsbCBiZSBzb21lIGR1cGxpY2F0ZWQgY29kZSB1
bnRpbCBhbGwgYXJlIG1pZ3JhdGVkLgpCdXQgYXMgdGhlIG51bWJlciBvZiBtaXBpIGRiaSBkcml2
ZXJzIGFyZSBsb3cgaXQgaXMgZG9hYmxlIGlmIGEgZmV3CnBlb3BsZSB0aHJvdyBzb21lIHRpbWUg
YWZ0ZXIgaXQuCkkgdm9sdW50ZWVyIHRvIGFzc2lzdC4KCkluIGRybV9taXBpX2RiaS5jIHdlIGNv
dWxkIGp1c3QgYWRkOgoKc3RhdGljIGludCBtaXBpX2RiaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCnsKCS4uLgogICAgICAgIGlmIChkYmlkZXYt
PnBhbmVsKQogICAgICAgICAgICAgICAgcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMoZGJpZGV2
LT5wYW5lbCk7CgoKVGhlbiBpZiB0aGVyZSBpcyBhIHBhbmVsIHdlIHdvdWxkIHVzZSB0aGUgbW9k
ZSBzcGVjaWZpZWQgYnkgdGhlIHBhbmVsLgpUbyBtYWtlIHRoaXMgd29yayB3ZSB3b3VsZCBuZWVk
IGEgZHJtX3BhbmVsX2F0dGFjaCgpIGluCmRybV9taXBpX2RiaV9wYW5lbF9yZWdpc3RlcigpIHRv
IGdpdmUgdGhlIHBhbmVsIGFjY2VzcyB0byB0aGUgY29ubmVjdG9yLgpJIGhhdmUgcGF0Y2hlcyB0
aGF0IG1ha2VzIGNvbm5lY3RvciBhbiBhcmd1bWVudCB0byBkcm1fcGFuZWxfZ2V0X21vZGVzKCkK
YnV0IHRoZXkgbmVlZCBhIGJpdCBtb3JlIGJha2luZywgc28geW91IGNhbm5vdCBiZW5lZml0IGZy
b20gdGhlbSB5ZXQuCgpNYXliZSB0aGlzIGlzIHRoZSBzYW1lIGFyZ3VtZW50IGFzIGJhY2tsaWdo
dD8KV2UgY2FuIGludHJvZHVjZSB0aGlzIHdoZW4gdGhlIGRybV9wYW5lbCBjb3JlIGlzIGJldHRl
ciBwcmVwYXJlZC4KCj4gPj4gK2ludCBkcm1fbWlwaV9kYmlfcGFuZWxfcmVnaXN0ZXIoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwsIHN0cnVjdCBtaXBpX2RiaV9kZXYgKmRiaWRldiwKPiA+PiArCQkJ
CXN0cnVjdCBkcm1fZHJpdmVyICpkcml2ZXIsIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlLAo+ID4+ICsJCQkJdTMyIHJvdGF0aW9uKQo+ID4gQ2FuIHdlIG1ha2UgdGhpcyB1c2Ug
ZW51bSBkcm1fcGFuZWxfb3JpZW50YXRpb24gLSBzbyB3ZSBjYW4gdXNlCj4gPiBvZl9kcm1fZ2V0
X3BhbmVsX29yaWVudGF0aW9uKCkgaW4gdGhlIGNhbGxlcnM/Cj4gPiBvZl9kcm1fZ2V0X3BhbmVs
X29yaWVudGF0aW9uKCkgaXMgbm90IG1lcmdlZCB5ZXQsIGJ1dCB3ZSBjb3VsZCBkbyBzbyBpZgo+
ID4gdGhpcyBwYXRjaC1zZXQgbmVlZHMgaXQuCj4gPiAKPiA+IEkga25vdyB0aGF0IHRoaXMgd291
bGQgcmVxdWlyZSBtaXBpX2RiaV9kZXZfaW5pdCgpIGFuZCBhbGwgdXNlcnMgdG8gYmUKPiA+IHVw
ZGF0ZWQuIEJ1dCBpdCBpcyBhIHNpbXBsZXIgaW50ZXJmYWNlIHNvIHdvcnRoIGl0Lgo+ID4gCj4g
Cj4gVGhhdCB3b3VsZCBicmVhayByb3RhdGlvbiBvbiB1c2Vyc3BhY2UgdGhhdCBkb2Vzbid0IGtu
b3cgYWJvdXQgdGhlIHBhbmVsCj4gb3JpZW50YXRpb24gcHJvcGVydHkgd2hpY2ggaXMgYSByZWNl
bnQgYWRkaXRpb24uIFRoZXNlIHBhbmVscyBhcmUgbW9zdGx5Cj4gdXNlZCBpbiB0aGUgZW1iZWRk
ZWQgd29ybGQgbm90IGRlc2t0b3AuIEl0IGFsc28gd291bGQgYnJlYWsgZmJkZXYgOTAvMjcwCj4g
cm90YXRpb24gKHNlZSBkcm1fY2xpZW50X3JvdGF0aW9uKCkpLgoKSSB0aGluayBpdCBpcyBwb3Nz
aWJsZSB0byBtb3ZlIG1vc3Qgb2YgZHJtIG92ZXIgdG8gb25lIHdheSB0byBzcGljaWZ5CnJvdGF0
aW9uLgpCdXQgbGV0J3Mgd2FpdCB3aXRoIHRoYXQgYmF0dGxlIHVudGlsIGFub3RoZXIgZGF5LgpJ
dCBzaG91bGQgbm90IGhpbmRlciB0aGlzIHNlcmllcy4KCglTYW0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
