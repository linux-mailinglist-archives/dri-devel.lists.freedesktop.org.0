Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BE240F6
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 21:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F9689127;
	Mon, 20 May 2019 19:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD189127
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 19:13:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 087CD8044B;
 Mon, 20 May 2019 21:13:18 +0200 (CEST)
Date: Mon, 20 May 2019 21:13:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/6] drm: make headers self-contained
Message-ID: <20190520191317.GA1727@ravnborg.org>
References: <20190519142036.22861-1-sam@ravnborg.org>
 <20190520184526.GH21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520184526.GH21222@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=OLL_FvSJAAAA:8
 a=OjnhRPAta7E0iBJEmCsA:9 a=CjuIK1q_8ugA:10 a=AtpN4jx8x8MA:10
 a=yGLrSRyMIJ4A:10 a=oIrB72frpwYPwTMnlWqB:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDg6NDU6MjZQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBTdW4sIE1heSAxOSwgMjAxOSBhdCAwNDoyMDozMFBNICsw
MjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBXaGlsZSByZW1vdmluZyB1c2Ugb2YgZHJtUC5o
IGZyb20gZmlsZXMgaW4gZHJtLyogSQo+ID4gbm90aWNlZCB0aGF0IEkgaGFkIHRvIGFkZCB0aGUg
c2FtZSBpbmNsdWRlIGZpbGVzIGR1ZSB0bwo+ID4gYnVpbGQgZXJyb3JzIGluIHRoZSBoZWFkZXIg
ZmlsZXMuCj4gPiAKPiA+IEl0IGlzIGJldHRlciB0byBsZXQgdGhlIGhlYWRlciBmaWxlcyBpbmNs
dWRlIHdoYXQgaXMgbmVjZXNzYXJ5Cj4gPiBhbmQgbGV0IHRoZSB1c2VycyBwdWxsIGluIG9ubHkg
dGhlIGFkZGl0aW9uYWwgaGVhZGVycyBmaWxlcyByZXF1aXJlZC4KPiA+IFNvIEkgd2VudCBhaGVh
ZCBhbmQgbWFkZSB0aGUgaGVhZGVyIGZpbGVzIHNlbGYtY29uYXRpbmVkLgo+ID4gKEkgZGlkIG5v
dCBjaGVjayBpZiB0aGlzIG1hZGUgYW55IGluY2x1ZGVzIHJlZHVuZGFudCBpbiBzb21lIGZpbGVz
LAo+ID4gSSBkbyBub3QgaGF2ZSB0b29saW5nIGluIHBsYWNlIHRvIGRvIHNvKS4KPiAKPiBJIHRo
aW5rIGl0J2QgYmUgZ3JlYXQgdG8gbWFrZSBzdXJlIHRoaXMga2VlcHMgYmVpbmcgdGhlIGNhc2Uu
IEphbmkgTmlrdWxhCj4ganVzdCBwb2ludGVkIG1lIGF0IHNvbWUgbmVhdCBzdHVmZiBpbiBkcm0v
aTkxNS9NYWtlZmlsZS5oZWFkZXItdGVzdC4KPiAKCj4gSSB0aGluayBpdCdkIGJlIG5pY2UgdG8g
aGF2ZSBzb21ldGhpbmcgc2ltaWxhciBmb3IgZHJtIGhlYWRlcnMgaW4KPiBkcml2ZXJzL2dwdS9k
cm0sIGJlaGluZCBhIEtjb25maWcgb3B0aW9uIHBlcmhhcHMgc28gdGhhdCBpdCBkb2Vzbid0IHVw
c2V0Cj4gcGVvcGxlLCBidXQgMGRheSB3aWxsIHN0aWxsIHNwb3QgaXNzdWVzLiBUaGF0IHdvdWxk
IGFsc28gbWFrZSB0aGUgc2VyaWVzCj4gZWFzaWVyIHRvIHJldmlldywgc2luY2UgZWFjaCBwYXRj
aCB3b3VsZCBhZGQgdGhlIGhlYWRlciBpdCBmaXhlcyB0byB0aGF0Cj4gYnVpbGQgdGFyZ2V0LgpJ
IHdvdWxkIGxpa2UgdG8gd2FpdCB3aXRoIHRoaXMgdW50aWwgSmFuaSdzIGdlbmVyYWwgc29sdXRp
b246Cmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWtidWlsZC9tc2cyMTgzOS5o
dG1sCmhpdHMgbWFpbmxpbmUuCgpJIGNhbiBhbHNvIGR1cGxpY2F0ZSB3aGF0IEphbmkgYWxyZWFk
eSBkaWQgYW5kIHRoZW4gbWlncmF0ZSB0byB0aGUKZ2VuZXJhbCBzb2x1dGlvbiB3aGVuIGl0IGlz
IHJlYWR5LgpIbW0uIEkgdGhpbmsgdGhpcyBpcyB0aGUgYmVzdCB3YXkgZm9yd2FyZC4KU28gd2Ug
Y2FuIGhhdmUgYWxsIHRoZSBvdGhlciBmdW5jdGlvbmFsaXR5IGluIHBsYWNlLgpMZXQgbWUgZ2l2
ZSB0aGlzIGEgc2hvdCBhbmQgZ2V0IGJhY2sgd2l0aCBhIGZldyBwYXRjaGVzLgoKCVNhbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
