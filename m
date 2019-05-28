Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49552C75C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 15:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570646E22F;
	Tue, 28 May 2019 13:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C535B8989E;
 Tue, 28 May 2019 13:07:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 201AF803F3;
 Tue, 28 May 2019 15:07:48 +0200 (CEST)
Date: Tue, 28 May 2019 15:07:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/7] drm: make drm/drm_auth.h self contained
Message-ID: <20190528130746.GA19737@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
 <20190526173535.32701-2-sam@ravnborg.org>
 <87d0k268o7.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d0k268o7.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EJ5q1KBv4N_MDyTbJBkA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=d3PnA9EDa4IxuAV0gXij:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaS4KCk9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDAzOjU0OjQ4UE0gKzAzMDAsIEphbmkg
TmlrdWxhIHdyb3RlOgo+IE9uIFN1biwgMjYgTWF5IDIwMTksIFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4gd3JvdGU6Cj4gPiBEbyBub3QgcmVxdWlyZSB1c2VycyBvZiBpbmNsdWRlL2Ry
bS9kcm1fYXV0aC5oIHRvIGluY2x1ZGUKPiA+IG90aGVyIGZpbGVzIGp1c3QgdG8gbGV0IGl0IGJ1
aWxkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+
Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvZHJtL2RybV9hdXRoLmggfCAxMSArKysrKysrKystLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdXRoLmggYi9pbmNsdWRlL2RybS9kcm1f
YXV0aC5oCj4gPiBpbmRleCA4NzEwMDgxMThiYWIuLjZiZjhiMmI3ODk5MSAxMDA2NDQKPiA+IC0t
LSBhL2luY2x1ZGUvZHJtL2RybV9hdXRoLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9hdXRo
LmgKPiA+IEBAIC0xLDMgKzEsNiBAQAo+ID4gKyNpZm5kZWYgX0RSTV9BVVRIX0hfCj4gPiArI2Rl
ZmluZSBfRFJNX0FVVEhfSF8KPiA+ICsKPiAKPiBJdCdzIGEgYml0IG9mIGEgYmlrZXNoZWQgYW5k
IHRoaXMgZ290IGFwcGxpZWQgYWxyZWFkeSwgYnV0IEkgdGhpbmsgdGhlCj4gY29weXJpZ2h0L2xp
Y2Vuc2UgY29tbWVudCBzaG91bGQgYmUgdGhlIGZpcnN0IHRoaW5nIGluIGFueSBmaWxlLCBhbmQg
dGhlCj4gaWZkZWZzIHNob3VsZCBjb21lIGFmdGVyIHRoYXQuIFVzaW5nIFNQRFggaGVhZGVycyBt
YW5kYXRlIHRoaXMgYW55d2F5LgoKSSB3YXMgaW5zcGlyZWQgYnkgb3RoZXIgZmlsZXMgd2hlbiBJ
IGRpZCB0aGlzIGNoYW5nZS4KQnV0IHlvdSBhcmUgcmlnaHQsIHRoaXMgd2FzIGEgYmFkIGNoYW5n
ZS4KRm9yIGZ1dHVyZSBjaGFuZ2VzIEkgd2lsbCBrZWVwIHRoaXMgaW4gbWluZC4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
