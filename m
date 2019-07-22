Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDA70541
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071D289D44;
	Mon, 22 Jul 2019 16:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C08B89D40;
 Mon, 22 Jul 2019 16:18:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EDF18803BB;
 Mon, 22 Jul 2019 18:18:21 +0200 (CEST)
Date: Mon, 22 Jul 2019 18:18:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 2/4] drm/via: add VIA_WAIT_ON()
Message-ID: <20190722161820.GB14638@ravnborg.org>
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-3-sam@ravnborg.org>
 <CACvgo53GQns4Ge7kC1K0xLNVNmjuFMPm8hG32sPBApn5XgUgmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo53GQns4Ge7kC1K0xLNVNmjuFMPm8hG32sPBApn5XgUgmQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=nz1Pgn__xpXpJe1wGoIA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1haWwuCk9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDA0OjQ2OjA4UE0gKzAxMDAsIEVtaWwg
VmVsaWtvdiB3cm90ZToKPiBPbiBTYXQsIDIwIEp1bCAyMDE5IGF0IDA5OjQ2LCBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4KPiA+IFZJQV9XQUlUX09OKCkgaXMgYSBk
aXJlY3QgY29weSBvZiBEUk1fV0FJVF9PTigpIGZyb20KPiA+IGRybV9vc19saW51eC5oLgo+ID4g
VGhlIGNvcHkgaXMgbWFkZSBzbyB3ZSBjYW4gYXZvaWQgdGhlIGRlcGVuZGVuY3kgb24gdGhlIGxl
Z2FjeSBoZWFkZXIuCj4gPiBBIG1vcmUgaW52b2x2ZWQgYXBwcm9hY2ggaGFkIGJlZW4gdG8gaW50
cm9kdWNlIHdhaXRfZXZlbnRfKiBidXQgZm9yIHRoaXMKPiA+IGxlZ2FjeSBkcml2ZXIgdGhlIHNp
bXBsZXIgYW5kIG1vcmUgc2FmZSBhcHByb2FjaCB3aXRoIGEgY29weSBvZiB0aGUKPiA+IG1hY3Jv
IHdhcyBzZWxlY3RlZC4KPiA+IEFkZGVkIHRoZSByZWxldmFudCBoZWFkZXIgZmlsZXMgZm9yIHRo
ZSBmdW5jdGlvbnMgdXNlZCBpbiBWSUFfV0FJVF9PTi4KPiA+Cj4gPiBVc2VycyBvZiB0aGUgbWFj
cm8gd2lsbCBjb21lIGluIGEgZm9sbG93LXVwIHBhdGNoLgo+ID4KPiBTaW5jZSBub3RoaW5nICJu
ZXciIGlzIGFkZGVkIGhlcmUgSSB3b3VsZCBjaGFuZ2UgdGhlIHN1bW1hcnkgdG8KPiAiZHJtL3Zp
YTogY29weSBEUk1fV0FJVF9PTiBhcyBWSUFfV0FJVF9PTiBhbmQgdXNlIGl0Igo+IElNSE8gdGhl
cmUncyBsaXR0bGUgcG9pbnQgaW4gc3BsaXR0aW5nIGludHJvZHVjdGlvbiBhbmQgdXNhZ2UuCk1h
a2VzIHNlbnNlLCBJIHdpbGwgZG8gYSB2MyB3aGVyZSB0aGUgdXNhZ2UgaXMgaW5jbHVkZWQgaW4g
dGhpcyBwYXRjaC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
