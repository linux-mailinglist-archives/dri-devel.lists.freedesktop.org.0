Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8F34E6E9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 13:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C1889DBF;
	Tue, 30 Mar 2021 11:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149C689DBF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 11:53:23 +0000 (UTC)
Date: Tue, 30 Mar 2021 12:53:04 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] drm/ingenic: Switch IPU plane to type OVERLAY
To: Simon Ser <contact@emersion.fr>
Message-Id: <GC6SQQ.1R937FBY9A9A1@crapouillou.net>
In-Reply-To: <BH3N8QICMyp64pmUQyXLwYMnCNBvXxThwvKJIOmyMU0XIgTtorcGd7s7AjnIFXQrLGEoJMuvPcWTiv38syiYOTCDv-bSxswFBX6y3UYqTwE=@emersion.fr>
References: <20210329175046.214629-1-paul@crapouillou.net>
 <20210329175046.214629-2-paul@crapouillou.net>
 <BH3N8QICMyp64pmUQyXLwYMnCNBvXxThwvKJIOmyMU0XIgTtorcGd7s7AjnIFXQrLGEoJMuvPcWTiv38syiYOTCDv-bSxswFBX6y3UYqTwE=@emersion.fr>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ltb24sCgpMZSBtYXIuIDMwIG1hcnMgMjAyMSDDoCA3OjIzLCBTaW1vbiBTZXIgPGNvbnRh
Y3RAZW1lcnNpb24uZnI+IGEgw6ljcml0IDoKPj4gIEl0IHNob3VsZCBoYXZlIGJlZW4gYW4gT1ZF
UkxBWSBmcm9tIHRoZSBiZWdpbm5pbmcuIFRoZSBkb2N1bWVudGF0aW9uCj4+ICBzdGlwdWxhdGVz
IHRoYXQgdGhlcmUgc2hvdWxkIGJlIGFuIHVuaXF1ZSBQUklNQVJZIHBsYW5lIHBlciBDUlRDLgo+
IAo+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHBhdGNoISBPbmUgY29tbWVudCBiZWxvd+KApgo+IAo+
PiAgRml4ZXM6IGZjMWFjZjMxN2IwMSAoImRybS9pbmdlbmljOiBBZGQgc3VwcG9ydCBmb3IgdGhl
IElQVSIpCj4+ICBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNS44Kwo+PiAgU2lnbmVk
LW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4+ICAtLS0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYyB8IDExICsrKysrLS0t
LS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1pcHUuYyAgICAgfCAgMiAr
LQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
PiAKPj4gIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1k
cnYuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYwo+PiAg
aW5kZXggMjk3NDJlYzVhYjk1Li4wOTIyNWI3NzBiYjggMTAwNjQ0Cj4+ICAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYwo+PiAgKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2LmMKPj4gIEBAIC00MTksNyArNDE5LDcgQEAgc3Rh
dGljIHZvaWQgaW5nZW5pY19kcm1fcGxhbmVfZW5hYmxlKHN0cnVjdCAKPj4gaW5nZW5pY19kcm0g
KnByaXYsCj4+ICAgCXVuc2lnbmVkIGludCBlbl9iaXQ7Cj4+IAo+PiAgIAlpZiAocHJpdi0+c29j
X2luZm8tPmhhc19vc2QpIHsKPj4gIC0JCWlmIChwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQ
RV9QUklNQVJZKQo+PiAgKwkJaWYgKHBsYW5lICE9ICZwcml2LT5mMCkKPiAKPiBJIGRvbid0IGtu
b3cgYWJvdXQgdGhpcyBkcml2ZXIgYnV04oCmIGlzIHRoaXMgcmVhbGx5IHRoZSBzYW1lIGFzIHRo
ZSAKPiBwcmV2aW91cwo+IGNvbmRpdGlvbj8gVGhlIHByZXZpb3VzIGNvbmRpdGlvbiB3b3VsZCBt
YXRjaCB0d28gcGxhbmVzLCB0aGlzIG9uZSAKPiBzZWVtcyB0bwo+IG1hdGNoIG9ubHkgYSBzaW5n
bGUgcGxhbmUuIFdoYXQgYW0gSSBtaXNzaW5nPwoKVGhlcmUgYXJlIHRocmVlIHBsYW5lcywgd2hp
Y2ggd2Ugd2lsbCBjYWxsIGhlcmUgZjAsIGYxLCBhbmQgaXB1LgoKUHJldmlvdXNseSwgdGhlICJw
bGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZIiBtYXRjaGVkIGYxIGFuZCAKaXB1
LiBTaW5jZSBpcHUgaXMgbm93IE9WRVJMQVkgd2UgaGF2ZSB0byBjaGFuZ2UgdGhlIGNvbmRpdGlv
biBvciB0aGUgCmJlaGF2aW91ciB3aWxsIGJlIGRpZmZlcmVudCwgYXMgb3RoZXJ3aXNlIGl0IHdv
dWxkIG9ubHkgbWF0Y2ggdGhlIGYxIApwbGFuZS4KCkNoZWVycywKLVBhdWwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
