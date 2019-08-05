Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68BC82153
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6E089C28;
	Mon,  5 Aug 2019 16:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513C989F2A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:10:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 783BF289F04
Subject: Re: [PATCH v3 0/8] drm/panfrost: Add heap and no execute buffer
 allocation
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190802195150.23207-1-robh@kernel.org>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <104f5aea-5b9f-1ce9-8b36-c3b64daa6eda@collabora.com>
Date: Mon, 5 Aug 2019 18:09:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190802195150.23207-1-robh@kernel.org>
Content-Language: en-US
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
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yLzE5IDk6NTEgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IFRoaXMgc2VyaWVzIGFkZHMg
bmV3IEJPIGFsbG9jYXRpb24gZmxhZ3MgUEFORlJPU1RfQk9fSEVBUCBhbmQKPiBQQU5GUk9TVF9C
T19OT0VYRUMuIFRoZSBoZWFwIGFsbG9jYXRpb25zIGFyZSBwYWdlZCBpbiBvbiBHUFUgcGFnZSBm
YXVsdHMuCj4gCj4gVG9tZXUgcmVwb3J0cyBoZSBoYXMgdGVzdGVkIHRoaXMgaW4gdGhlIHBhbmZy
b3N0IENJLgoKQWxsIHNlZW1zIHRvIGJlIHdvcmtpbmcgZmluZToKCmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy90b21ldS9tZXNhL3BpcGVsaW5lcy81MzU5MQoKQ2hlZXJzLAoKVG9tZXUK
Cj4gCj4gVGhpcyBpcyBiYXNlZCBvbiBkcm0tbWlzYy1uZXh0LiBBbiB1cGRhdGVkIGJyYW5jaCBp
cyBoZXJlWzFdLgo+IAo+IHYzOgo+ICAgLSBSZXRhaW4gc2hhcmVkIGlycSBzdXBwb3J0LCBzcGxp
dHRpbmcgSVJRIGNoYW5nZXMgdG8gc2VwYXJhdGUgcGF0Y2ggKDYvOCkKPiAgIC0gU3RvcCBsZWFr
aW5nIFNHIHRhYmxlcwo+ICAgLSBQcmV2ZW50IG1tYXAgYW5kIHBpbm5pbmcgcGFnZXMgZm9yIGhl
YXAgQk9zCj4gCj4gUm9iCj4gCj4gWzFdIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdCBwYW5mcm9zdC9oZWFwLW5vZXhlYwo+IAo+IAo+
IFJvYiBIZXJyaW5nICg4KToKPiAgICBkcm0vZ2VtOiBBbGxvdyBzcGFyc2VseSBwb3B1bGF0ZWQg
cGFnZSBhcnJheXMgaW4gZHJtX2dlbV9wdXRfcGFnZXMKPiAgICBkcm0vc2htZW06IFB1dCBwYWdl
cyBpbmRlcGVuZGVudCBvZiBhIFNHIHRhYmxlIGJlaW5nIHNldAo+ICAgIGRybS9wYW5mcm9zdDog
UmVzdHJ1Y3R1cmUgdGhlIEdFTSBvYmplY3QgY3JlYXRpb24KPiAgICBkcm0vcGFuZnJvc3Q6IFNw
bGl0IHBhbmZyb3N0X21tdV9tYXAgU0cgbGlzdCBtYXBwaW5nIHRvIGl0cyBvd24KPiAgICAgIGZ1
bmN0aW9uCj4gICAgZHJtL3BhbmZyb3N0OiBBZGQgYSBubyBleGVjdXRlIGZsYWcgZm9yIEJPIGFs
bG9jYXRpb25zCj4gICAgZHJtL3BhbmZyb3N0OiBDb252ZXJ0IE1NVSBJUlEgaGFuZGxlciB0byB0
aHJlYWRlZCBoYW5kbGVyCj4gICAgZHJtL3BhbmZyb3N0OiBBZGQgc3VwcG9ydCBmb3IgR1BVIGhl
YXAgYWxsb2NhdGlvbnMKPiAgICBkcm0vcGFuZnJvc3Q6IEJ1bXAgZHJpdmVyIHZlcnNpb24gdG8g
MS4xCj4gCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgfCAgIDMg
Kwo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgIHwgICA0ICstCj4g
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETyAgICAgICAgICAgfCAgIDIgLQo+ICAgZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgIDY1ICsrKysrKy0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgfCAxMDYgKysrKysrKysrKyst
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIHwgIDE2ICstCj4g
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAyMDAgKysrKysrKysr
KysrKysrKysrKystLS0tCj4gICBpbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oICAgICAg
ICAgfCAgIDMgKwo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAzMzMgaW5zZXJ0aW9ucygrKSwgNjYgZGVs
ZXRpb25zKC0pCj4gCj4gLS0KPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
