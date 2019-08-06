Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B719783590
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0184C6E3D2;
	Tue,  6 Aug 2019 15:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316CC6E3D2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:46:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 49FFE80475;
 Tue,  6 Aug 2019 17:46:29 +0200 (CEST)
Date: Tue, 6 Aug 2019 17:46:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/3] drm: add gem ttm helpers
Message-ID: <20190806154627.GA10478@ravnborg.org>
References: <20190806133454.8254-1-kraxel@redhat.com>
 <20190806133454.8254-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806133454.8254-2-kraxel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8
 a=IZVlWtmyn-D7wekicaMA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZC4KCk9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDAzOjM0OjUyUE0gKzAyMDAsIEdlcmQg
SG9mZm1hbm4gd3JvdGU6Cj4gTm93IHdpdGggdHRtX2J1ZmZlcl9vYmplY3QgYmVpbmcgYSBzdWJj
bGFzcyBvZiBkcm1fZ2VtX29iamVjdCB3ZSBjYW4KPiBlYXNpbHkgbG9va3VwIHR0bV9idWZmZXJf
b2JqZWN0IGZvciBhIGdpdmVuIGRybV9nZW1fb2JqZWN0LCB3aGljaCBpbgo+IHR1cm0gYWxsb3dz
IHRvIGNyZWF0ZSBjb21tb24gaGVscGVyIGZ1bmN0aW9ucy4gIFRoaXMgcGF0Y2ggc3RhcnRzIG9m
Zgo+IHdpdGggZHVtcCBtbWFwIGhlbHBlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpPbmUgbml0IGJlbG93LgoKPiAtLS0KPiAgaW5jbHVk
ZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmggICAgIHwgMjcgKysrKysrKysrKysrKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyB8IDUyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgIHwgIDcg
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAgICAgfCAgMyArKwo+ICA0
IGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxw
ZXIuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yYzY4NzQx
OTBiMTcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVs
cGVyLmgKPiBAQCAtMCwwICsxLDI3IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9yLWxhdGVyICovCj4gKwo+ICsjaWZuZGVmIERSTV9HRU1fVFRNX0hFTFBFUl9ICj4g
KyNkZWZpbmUgRFJNX0dFTV9UVE1fSEVMUEVSX0gKPiArCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2dl
bS5oPgo+ICsjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fYXBpLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4gLyogZm9yIGNvbnRhaW5lcl9vZigpICovCgpUaGUgdHlwaWNhbCBvcmRlciBv
ZiBpbmNsdWRlIGZpbGVzIGlzOgoKI2luY2x1ZGUgPGxpbnV4Lyo+CgojaW5jbHVkZSA8ZHJtLyo+
CgpTbyBzcGFjZSBiZXR3ZWVuIGVhY2ggYmxvY2sgb2YgaW5jbHVkZXMgYW5kIHNvcnQgd2l0aGlu
IGVhY2ggYmxvY2suCgpUaGUgY29tbWVudCAiLyogZm9yIGNvbnRhaW5lcl9vZigpICovIiBpcyBu
b3QgcmVhbGx5IHVzZWZ1bCBmb3IKYW55b25lLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
