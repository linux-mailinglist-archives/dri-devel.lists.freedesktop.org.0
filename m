Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62595DCE45
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558756EBBB;
	Fri, 18 Oct 2019 18:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.cmpwn.com (mail.cmpwn.com [45.56.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C69C6E121;
 Fri, 18 Oct 2019 14:43:18 +0000 (UTC)
In-Reply-To: <20191018173437.0c07c2db@eldfell.localdomain>
Date: Fri, 18 Oct 2019 10:43:16 -0400
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
From: "Drew DeVault" <sir@cmpwn.com>
To: "Pekka Paalanen" <ppaalanen@gmail.com>, "Daniel Vetter"
 <daniel.vetter@ffwll.ch>
Message-Id: <BXSQA6JW25GT.1OK4I53XFO1M5@homura>
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=cmpwn.com; s=cmpwn; 
 t=1571409797; bh=0jNF5g8BvM1SuLJ5goNb//AoWRlyNeOYqKRXoNDTa5c=;
 h=In-Reply-To:Date:Cc:Subject:From:To;
 b=4IZzlBFar9T5dcAJh9kn+i8Ca6P+KEY+SV7c24szcyiAFybNxojUwhVezNEUY1cdO
 bzgS6omDFlERQ+asOW3EqsryMZXWXBM5q1zjJkSYIo3IxzHg4qgc/Z0YnAfEsLr/cB
 lX587m9CnJfEx6cRb3/WCS40xa/lv1NTC/9OT+aU=
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
Cc: Marius Vlad <marius.vlad@collabora.com>, Drew DeVault <sir@cmpwn.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVnYXJkaW5nIGhvdHBsdWdnaW5nLCB0aGUgV2F5bGFuZCBjb21wb3NpdG9yIGlzIHByb2JhYmx5
IGtlZXBpbmcgdHJhY2sKb2YgaG90cGx1Z3MgaXRzZWxmIGFuZCB3aXRoZHJhd2luZy9vZmZlcmlu
ZyBjb25uZWN0b3JzIGFzIGFwcHJvcHJpYXRlLgpBbHNvLCB3aGVuIHRoZSBsZWFzZSBpcyBpc3N1
ZWQsIHRoZSBjb21wb3NpdG9yIHdpdGhkcmF3cyB0aGF0IGNvbm5lY3Rvci4KRm9yIHRoZSBjbGll
bnQsIHVwb24gaG90cGx1ZyBJIGltYWdpbmUgdGhlIERSTSBhc2tzIHN0YXJ0IHRvIGZhaWwsIGFu
ZAppdCBoYW5kbGVzIHRoYXQgYWNjb3JkaW5nbHkgKHByZXN1bWFibHkgaXQnbGwgY2xvc2UgdGhl
IGxlYXNlLCBpZiB0aGUKY29tcG9zaXRvciBoYXNuJ3QgYWxyZWFkeSwgYW5kIHdhaXQgZm9yIGl0
IHRvIGNvbWUgYmFjaywgb3IganVzdCBleGl0KS4KCldoZW4gYSBob3RwbHVnIG9mIGEgbGVhc2Vk
IGNvbm5lY3RvciBoYXBwZW5zIG9uIHRoZSBjb21wb3NpdG9yIHNpZGUsIGl0CmNhbiBub3RpY2Ug
dGhpcyBhbmQgZXhlcmNpc2UgaXRzIGRlc2NyZXRpb24gaW4gdGhlIGltcGxlbWVudGF0aW9uLiBJ
CnRoaW5rIHRoZSBjdXJyZW50IHRleHQgb2YgdGhlIHByb3RvY29sIHN1cHBvcnRzIHRoaXMgdmll
dy4KCk9uIEZyaSBPY3QgMTgsIDIwMTkgYXQgNTozNCBQTSBQZWtrYSBQYWFsYW5lbiB3cm90ZToK
PiA+IFNvIHRoZSBydWxlcyBhcmUgKGlmIEknbSBub3QgbWFraW5nIGEgbWlzdGFrZSkKPiA+IC0g
SWYgeW91J3JlIG5vdCBDQVBfU1lTX0FETUlOIHlvdSBjYW4ndCBnZXQvZHJvcF9tYXN0ZXIuCj4g
Cj4gbm90IGFibGUgdG8gZHJvcCwgeWlrZXMuIFNvIGlmIHNvbWVvbmUgcG9rZXMgdGhlIFdheWxh
bmQgRFJNIGxlYXNpbmcKPiBpbnRlcmZhY2Ugd2hpbGUgdGhlIGRpc3BsYXkgc2VydmVyIGlzIFZU
IHN3aXRjaGVkIGF3YXkgKGRvZXMgbm90IGhhdmUKPiBEUk0gbWFzdGVyKSwgYW5kIG1heWJlIG5v
LW9uZSBlbHNlIGhhcyBEUk0gbWFzdGVyIGVpdGhlciAoeW91J3JlCj4gaGFja2luZyBpbiBWVCB0
ZXh0IG1vZGUpLCB0aGVuIGEgbmV3IERSTSBmZCB3b3VsZCBiZSBtYXN0ZXIgd2l0aCBubyB3YXkK
PiBvdXQ/Cgpmd2l3IEkgaGF2ZSBhbiBhc3NlcnQoIWRybUlzTWFzdGVyKGZkKSk7IGJlZm9yZSBJ
IHNlbmQgaXQgdG8gdGhlIGNsaWVudCwKanVzdCB0byBiZSBzYWZlLiBCdXQgdGhpcyBtYXkgYmUg
bWlzZ3VpZGVkLCBzaW5jZSBhcHBhcmVudGx5IGlmIGl0IGVuZHMKdXAgd2l0aCBhIG1hc3RlciBu
b2RlIGRybURyb3BNYXN0ZXIoZmQpIHdvbid0IHdvcmsuIEkga2luZCBvZiBmaW5kIHRoaXMKaGFy
ZCB0byBiZWxpZXZlLCBpZiB0aGVyZSdzIG9ubHkgZXZlciBvbmUgbWFzdGVyLCBhbmQgdGhlIG1h
c3RlciBjYW5ub3QKZHJvcCBtYXN0ZXIsIHRoZW4gd2h5IGRvZXMgdGhpcyBpb2N0bCBldmVuIGV4
aXN0PwoKPiBTbyBXYXlsYW5kIGRpc3BsYXkgc2VydmVycyBzaG91bGQgbWFrZSBzdXJlIHRoZXkg
aGF2ZSBtYXN0ZXIgdGhlbXNlbHZlcwo+IGJlZm9yZSBzZW5kaW5nIGEgc3VwcG9zZWRseSBub24t
bWFzdGVyIERSTSBmZCB0byBhbnlvbmUgZWxzZS4gSSB3b25kZXIKPiBpZiB0aGUgV2F5bGFuZCBw
cm90b2NvbCBleHRlbnNpb24gbmVlZHMgdG8gY29uc2lkZXIgdGhhdCB0aGUgY29tcG9zaXRvcgo+
IG1pZ2h0IG5vdCBiZSBhYmxlIHRvIHNlbmQgYW55IGZkIHNvb24uIEJlaW5nIGFibGUgdG8gZGVm
ZXIgc2VuZGluZyB0aGUKPiBmZCBzaG91bGQgcHJvYmFibHkgYmUgbWVudGlvbmVkIGluIHRoZSBw
cm90b2NvbCBzcGVjLCBzbyB0aGF0IGNsaWVudHMKPiBkbyBub3QgZXhwZWN0IGEgc2ltcGxlIHJv
dW5kdHJpcCB0byBiZSBlbm91Z2ggdG8gZW5zdXJlIHRoZSBmZCBoYXMKPiBhcnJpdmVkLgoKV2hl
biB5b3UgVlQgc3dpdGNoIGF3YXksIHRoZSBXYXlsYW5kIGNvbXBvc2l0b3IgaXMgbm8gbG9uZ2Vy
IG5lY2Vzc2FyaWx5CmFibGUgdG8gbGVhc2UgdGhvc2UgZGlzcGxheXMgYW55d2F5IC0gaXQncyBu
b3QgdGhlIG1hc3RlciBhbnltb3JlLiBTbyBpdApzaG91bGQgd2l0aGRyYXcgdGhlbSwgYW5kIGlu
IGNhc2Ugb2YgYSByYWNlIGl0J2xsIHJlamVjdCB0aGUgbGVhc2UKcmVxdWVzdC4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
