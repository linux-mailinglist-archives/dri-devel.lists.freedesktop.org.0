Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CEBAD8C7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 14:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C29898FA;
	Mon,  9 Sep 2019 12:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B46898FA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 12:18:43 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1i7Icz-00071q-47; Mon, 09 Sep 2019 14:18:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: lima@lists.freedesktop.org
Subject: Re: [Lima] [PATCH] drm/lima: fix lima_gem_wait() return value
Date: Mon, 09 Sep 2019 14:18:40 +0200
Message-ID: <3263343.nbYvo8rMJO@diego>
In-Reply-To: <CAKGbVbt056DyZHer1bKnAv8uBCX6zbsWeMjE6AQy8HYQf7L1wg@mail.gmail.com>
References: <20190908024800.23229-1-anarsoul@gmail.com>
 <CAKGbVbt056DyZHer1bKnAv8uBCX6zbsWeMjE6AQy8HYQf7L1wg@mail.gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUWlhbmcsCgpBbSBNb250YWcsIDkuIFNlcHRlbWJlciAyMDE5LCAwNDozMDo0MyBDRVNUIHNj
aHJpZWIgUWlhbmcgWXU6Cj4gT2gsIEkgd2FzIG1pc3MgbGVhZGluZyBieSB0aGUgZHJtX2dlbV9y
ZXNlcnZhdGlvbl9vYmplY3Rfd2FpdAo+IGNvbW1lbnRzLiBQYXRjaCBpczoKPiBSZXZpZXdlZC1i
eTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gCj4gSSdsbCBhcHBseSB0aGlzIHBhdGNo
IHRvIGRybS1taXNjLW5leHQuCj4gCj4gQ3VycmVudCBrZXJuZWwgcmVsZWFzZSBpcyA1LjMtcmM4
LCBpcyBpdCB0b28gbGF0ZSBmb3IgdGhpcyBmaXggdG8gZ28KPiBpbnRvIHRoZSBtYWlubGluZSA1
LjMgcmVsZWFzZT8KPiBJJ2QgbGlrZSB0byBrbm93IGhvdyB0byBhcHBseSB0aGlzIGZpeCBmb3Ig
Y3VycmVudCByYyBrZXJuZWxzLCBieQo+IGRybS1taXNjLWZpeGVzPyBDYW4gSSBwdXNoCj4gdG8g
ZHJtLW1pc2MtZml4ZXMgYnkgZGltIG9yIEkgY2FuIG9ubHkgcHVzaCB0byBkcm0tbWlzYy1uZXh0
IGFuZAo+IGRybS1taXNjIG1haW50YWluZXIgd2lsbAo+IHBpY2sgZml4ZXMgZnJvbSBpdCB0byBk
cm0tbWlzYy1maXhlcz8KCmRybS1taXNjLWZpeGVzIGdldHMgbWVyZ2VkIGludG8gZHJtLW1pc2Mt
bmV4dCBieSBtYWludGFpbmVycyByZWd1bGFybHksCnNvIEkgX3RoaW5rXyB5b3Ugc2hvdWxkIGFw
cGx5IHRoZSBmaXgtcGF0Y2ggdG8gZHJtLW1pc2MtZml4ZXMgZmlyc3QuCltJIGFsc28gYWx3YXlz
IGhhdmUgdG8gcmVhZCB0aGUgZG9jdW1lbnRhdGlvbiA7LSkgXQoKSW4gYW55IGNhc2UgeW91IG1p
Z2h0IHdhbnQgdG8gYWRkIGEgIkZpeGVzOiAuLi4uLiIgdGFnIGFzIHdlbGwgYXMgYQoiQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmciIHRhZywgc28gaXQgY2FuIGJlIGJhY2twb3J0ZWQgdG8gc3Rh
YmxlCmtlcm5lbHMgaWYgYXBwbGljYWJsZS4KCgpIZWlrbwoKPiBPbiBTdW4sIFNlcCA4LCAyMDE5
IGF0IDEwOjQ4IEFNIFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4KPiA+IGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoKSByZXR1cm5zIDAgaWYg
aXQgc3VjY2VlZHMgYW5kIC1FVElNRQo+ID4gaWYgaXQgdGltZW91dHMsIGJ1dCBsaW1hIGRyaXZl
ciBhc3N1bWVkIHRoYXQgMCBpcyBlcnJvci4KPiA+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWls
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMgfCAyICst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbGltYS9saW1hX2dlbS5jCj4gPiBpbmRleCA0NzdjMGY3NjY2NjMuLmI2MDlkYzAz
MGQ2YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKPiA+IEBAIC0zNDIsNyArMzQy
LDcgQEAgaW50IGxpbWFfZ2VtX3dhaXQoc3RydWN0IGRybV9maWxlICpmaWxlLCB1MzIgaGFuZGxl
LCB1MzIgb3AsIHM2NCB0aW1lb3V0X25zKQo+ID4gICAgICAgICB0aW1lb3V0ID0gZHJtX3RpbWVv
dXRfYWJzX3RvX2ppZmZpZXModGltZW91dF9ucyk7Cj4gPgo+ID4gICAgICAgICByZXQgPSBkcm1f
Z2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0KGZpbGUsIGhhbmRsZSwgd3JpdGUsIHRpbWVvdXQp
Owo+ID4gLSAgICAgICBpZiAocmV0ID09IDApCj4gPiArICAgICAgIGlmIChyZXQgPT0gLUVUSU1F
KQo+ID4gICAgICAgICAgICAgICAgIHJldCA9IHRpbWVvdXQgPyAtRVRJTUVET1VUIDogLUVCVVNZ
Owo+ID4KPiA+ICAgICAgICAgcmV0dXJuIHJldDsKPiA+IC0tCj4gPiAyLjIzLjAKPiA+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW1hIG1haWxp
bmcgbGlzdAo+IGxpbWFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW1hCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
