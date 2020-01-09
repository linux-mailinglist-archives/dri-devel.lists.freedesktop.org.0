Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3C135368
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 07:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A596E3A2;
	Thu,  9 Jan 2020 06:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from manjaro.org (mail.manjaro.org [176.9.38.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52D96E3A2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 06:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by manjaro.org (Postfix) with ESMTP id 4F46036E4E03;
 Thu,  9 Jan 2020 07:58:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INa9G9XjTyTz; Thu,  9 Jan 2020 07:58:40 +0100 (CET)
Subject: Re: [PATCH 1/1] drm/rockchip: fix integer type used for storing dp
 data rate and lane count
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Tobias Schramm <t.schramm@manjaro.org>
References: <20200108223949.355975-1-t.schramm@manjaro.org>
 <20200108223949.355975-2-t.schramm@manjaro.org> <2028959.b8b8FNkPgY@diego>
From: Tobias Schramm <t.schramm@manjaro.org>
Message-ID: <2b02f9e1-5aa0-9d21-16e4-251fffbb736a@manjaro.org>
Date: Thu, 9 Jan 2020 07:56:05 +0100
MIME-Version: 1.0
In-Reply-To: <2028959.b8b8FNkPgY@diego>
Content-Language: en-US-large
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDEuMjAgdW0gMDE6MTUgc2NocmllYiBIZWlrbyBTdMO8Ym5lcjoKPiBBbSBNaXR0d29j
aCwgOC4gSmFudWFyIDIwMjAsIDIzOjM5OjQ5IENFVCBzY2hyaWViIFRvYmlhcyBTY2hyYW1tOgo+
PiBjb21taXQgMjU4OWM0MDI1ZjEzICgiZHJtL3JvY2tjaGlwOiBBdm9pZCBkcm1fZHBfbGluayBo
ZWxwZXJzIikgY2hhbmdlcwo+PiB0aGUgdHlwZSBvZiB2YXJpYWJsZXMgdXNlZCB0byBzdG9yZSB0
aGUgZGlzcGxheSBwb3J0IGRhdGEgcmF0ZSBhbmQKPj4gbnVtYmVyIG9mIGxhbmVzIHRvIHU4LiBI
b3dldmVyIHU4IGlzIG5vdCBzdWZmaWNpZW50IHRvIHN0b3JlIHRoZSBsaW5rCj4+IGRhdGEgcmF0
ZSBvZiB0aGUgZGlzcGxheSBwb3J0Lgo+PiBUaGlzIGNvbW1pdCByZXZlcnRzIHRoZSB0eXBlIG9m
IGJvdGggdGhlIG51bWJlciBvZiBsYW5lcyBhbmQgdGhlIGRhdGEKPj4gcmF0ZSB0byB1bnNpZ25l
ZCBpbnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRvYmlhcyBTY2hyYW1tIDx0LnNjaHJhbW1AbWFu
amFyby5vcmc+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3Jl
LmggfCA0ICsrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRw
LWNvcmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5oCj4+IGluZGV4
IDgzYzQ1ODY2NjViNC4uODA2Y2IwYjA4OTgyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuaAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvY2RuLWRwLWNvcmUuaAo+PiBAQCAtOTQsOCArOTQsOCBAQCBzdHJ1Y3QgY2RuX2RwX2Rldmlj
ZSB7Cj4+ICAJc3RydWN0IHZpZGVvX2luZm8gdmlkZW9faW5mbzsKPj4gIAlzdHJ1Y3QgY2RuX2Rw
X3BvcnQgKnBvcnRbTUFYX1BIWV07Cj4+ICAJdTggcG9ydHM7Cj4+IC0JdTggbWF4X2xhbmVzOwo+
PiAtCXU4IG1heF9yYXRlOwo+PiArCXVuc2lnbmVkIGludCBtYXhfbGFuZXM7Cj4gCj4gYWx0aG91
Z2ggSSB3b3VsZCB0aGluayB1OCBzaG91bGQgYmUgZW5vdWdoIGZvciBtYXhfbGFuZXM/Cj4gVGhl
cmUgc2hvdWxkbid0IGJlIGJlIG1vcmUgdGhhbiAyNTUgZHAgbGFuZXM/CgpUcnVlLiBJJ2xsIHRl
c3QgYW5kIHNlbmQgYSB2Mi4KClRoYW5rcywgVG9iaWFzCgo+IAo+IEhlaWtvCj4gCj4+ICsJdW5z
aWduZWQgaW50IG1heF9yYXRlOwo+PiAgCXU4IGxhbmVzOwo+PiAgCWludCBhY3RpdmVfcG9ydDsK
Pj4gIAo+Pgo+IAo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
