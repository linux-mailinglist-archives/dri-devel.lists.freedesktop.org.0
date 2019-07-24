Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D062473708
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7061189196;
	Wed, 24 Jul 2019 18:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED5C88ECC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:54:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BD1A680622;
 Wed, 24 Jul 2019 20:54:18 +0200 (CEST)
Date: Wed, 24 Jul 2019 20:54:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/pl111: Drop special pads config check
Message-ID: <20190724185417.GC22640@ravnborg.org>
References: <20190724134959.2365-1-linus.walleij@linaro.org>
 <20190724134959.2365-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724134959.2365-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=YUqRonFL-ueWVgxenA0A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Pawel Moll <pawel.moll@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDM6NDk6NTlQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGlzIGRyb3BzIHRoZSBjaGVjayBvZiB0aGUgc3VycGx1cyAicGFkcyIgY29uZmln
dXJhdGlvbgo+IGZyb20gdGhlIGRldmljZSB0cmVlIHRoYXQgaXMgY29tcGxldGVseSB1bnVzZWQg
aW4gdGhlIERSTQo+IGRyaXZlci4KPiAKPiBUaGlzIHdhcyBvbmx5IHVzZWQgdG8gd29yayBhcm91
bmQgbGltaXRhdGlvbnMgaW4gdGhlIGVhcmxpZXIKPiBmYmRldiBkcml2ZXIuCj4gCj4gQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogUGF3ZWwgTW9sbCA8cGF3ZWwubW9s
bEBhcm0uY29tPgo+IENjOiBMaXZpdSBEdWRhdSA8TGl2aXUuRHVkYXVAYXJtLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpBbHdh
eXMgZ29vZCB0byBkZWxldGUgY29kZS4KClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxh
eS5jIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jCj4gaW5kZXggZTQyZmI2
MzUzNjIzLi44NTk1YTY3NmIwODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTEx
L3BsMTExX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNw
bGF5LmMKPiBAQCAtNTcyLDI0ICs1NzIsOCBAQCBpbnQgcGwxMTFfZGlzcGxheV9pbml0KHN0cnVj
dCBkcm1fZGV2aWNlICpkcm0pCj4gIHsKPiAgCXN0cnVjdCBwbDExMV9kcm1fZGV2X3ByaXZhdGUg
KnByaXYgPSBkcm0tPmRldl9wcml2YXRlOwo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gZHJtLT5k
ZXY7Cj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50Owo+IC0JdTMyIHRmdF9yMGIwZzBb
M107Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCWVuZHBvaW50ID0gb2ZfZ3JhcGhfZ2V0X25leHRfZW5k
cG9pbnQoZGV2LT5vZl9ub2RlLCBOVUxMKTsKPiAtCWlmICghZW5kcG9pbnQpCj4gLQkJcmV0dXJu
IC1FTk9ERVY7Cj4gLQo+IC0JaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KGVuZHBvaW50
LAo+IC0JCQkJICAgICAgICJhcm0scGwxMXgsdGZ0LXIwZzBiMC1wYWRzIiwKPiAtCQkJCSAgICAg
ICB0ZnRfcjBiMGcwLAo+IC0JCQkJICAgICAgIEFSUkFZX1NJWkUodGZ0X3IwYjBnMCkpICE9IDAp
IHsKPiAtCQlkZXZfZXJyKGRldiwgImFybSxwbDExeCx0ZnQtcjBnMGIwLXBhZHMgc2hvdWxkIGJl
IDMgaW50c1xuIik7Cj4gLQkJb2Zfbm9kZV9wdXQoZW5kcG9pbnQpOwo+IC0JCXJldHVybiAtRU5P
RU5UOwo+IC0JfQo+IC0Jb2Zfbm9kZV9wdXQoZW5kcG9pbnQpOwo+IC0KPiAgCXJldCA9IHBsMTEx
X2luaXRfY2xvY2tfZGl2aWRlcihkcm0pOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+
IC0tIAo+IDIuMjEuMApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
