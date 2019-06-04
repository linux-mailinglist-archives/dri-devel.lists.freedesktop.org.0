Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB0341E6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 10:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65BE89826;
	Tue,  4 Jun 2019 08:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6225D89826
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 08:34:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 843A228527C;
 Tue,  4 Jun 2019 09:34:24 +0100 (BST)
Date: Tue, 4 Jun 2019 10:34:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v4 1/5] drm/rockchip: fix fb references in async update
Message-ID: <20190604103422.63a61f46@collabora.com>
In-Reply-To: <aecadca2-f67b-5d9d-550e-f90cbca5fd3f@collabora.com>
References: <20190603165610.24614-1-helen.koike@collabora.com>
 <20190603165610.24614-2-helen.koike@collabora.com>
 <aecadca2-f67b-5d9d-550e-f90cbca5fd3f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: =?UTF-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@google.com>,
 Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 nicholas.kazlauskas@amd.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzIEp1biAyMDE5IDE3OjEzOjM0IC0wMzAwCkhlbGVuIEtvaWtlIDxoZWxlbi5rb2lr
ZUBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gT24gNi8zLzE5IDE6NTYgUE0sIEhlbGVuIEtvaWtl
IHdyb3RlOgo+ID4gSW4gdGhlIGNhc2Ugb2YgYXN5bmMgdXBkYXRlLCBtb2RpZmljYXRpb25zIGFy
ZSBkb25lIGluIHBsYWNlLCBpLmUuIGluIHRoZQo+ID4gY3VycmVudCBwbGFuZSBzdGF0ZSwgc28g
dGhlIG5ld19zdGF0ZSBpcyBwcmVwYXJlZCBhbmQgdGhlIG5ld19zdGF0ZSBpcwo+ID4gY2xlYW5l
ZCB1cCAoaW5zdGVhZCBvZiB0aGUgb2xkX3N0YXRlLCB1bmxpa2Ugd2hhdCBoYXBwZW5zIGluIGEK
PiA+IG5vcm1hbCBzeW5jIHVwZGF0ZSkuCj4gPiBUbyBjbGVhbnVwIHRoZSBvbGRfZmIgcHJvcGVy
bHksIGl0IG5lZWRzIHRvIGJlIHBsYWNlZCBpbiB0aGUgbmV3X3N0YXRlCj4gPiBpbiB0aGUgZW5k
IG9mIGFzeW5jX3VwZGF0ZSwgc28gY2xlYW51cCBjYWxsIHdpbGwgdW5yZWZlcmVuY2UgdGhlIG9s
ZF9mYgo+ID4gY29ycmVjdGx5Lgo+ID4gCj4gPiBBbHNvLCB0aGUgcHJldmlvdXMgY29kZSBoYWQg
YToKPiA+IAo+ID4gCXBsYW5lX3N0YXRlID0gcGxhbmUtPmZ1bmNzLT5hdG9taWNfZHVwbGljYXRl
X3N0YXRlKHBsYW5lKTsKPiA+IAkuLi4KPiA+IAlzd2FwKHBsYW5lX3N0YXRlLCBwbGFuZS0+c3Rh
dGUpOwo+ID4gCj4gPiAJaWYgKHBsYW5lLT5zdGF0ZS0+ZmIgJiYgcGxhbmUtPnN0YXRlLT5mYiAh
PSBuZXdfc3RhdGUtPmZiKSB7Cj4gPiAJLi4uCj4gPiAJfQo+ID4gCj4gPiBXaGljaCB3YXMgd3Jv
bmcsIGFzIHRoZSBmYiB3ZXJlIGp1c3QgYXNzaWduZWQgdG8gYmUgZXF1YWwsIHNvIHRoaXMgaWYK
PiA+IHN0YXRlbWVudCBuZXZlcnMgZXZhbHVhdGVzIHRvIHRydWUuCj4gPiAKPiA+IEFub3RoZXIg
ZGV0YWlscyBpcyB0aGF0IHRoZSBmdW5jdGlvbiBkcm1fY3J0Y192YmxhbmtfZ2V0KCkgY2FuIG9u
bHkgYmUKPiA+IGNhbGxlZCB3aGVuIHZvcC0+aXNfZW5hYmxlZCBpcyB0cnVlLCBvdGhlcndpc2Ug
aXQgaGFzIG5vIGVmZmVjdCBhbmQKPiA+IHRyb3dzIGEgV0FSTl9PTigpLgo+ID4gCj4gPiBDYWxs
aW5nIGRybV9hdG9taWNfc2V0X2ZiX2Zvcl9wbGFuZSgpICh3aGljaCBnZXQgYSByZWZlcmVudCBv
ZiB0aGUgbmV3Cj4gPiBmYiBhbmQgcHVzIHRoZSBvbGQgZmIpIGlzIG5vdCByZXF1aXJlZCwgYXMg
aXQgaXMgdGFrZW4gY2FyZSBieQo+ID4gZHJtX21vZGVfY3Vyc29yX3VuaXZlcnNhbCgpIHdoZW4g
Y2FsbGluZwo+ID4gZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3BsYW5lKCkuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEuY29tPiAgCj4g
Cj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY0LjIwKwo+IEZpeGVzOiAxNTYwOTU1
OWE4MzQgKCJkcm0vcm9ja2NoaXA6IHVwZGF0ZSBjdXJzb3JzIGFzeW5jaHJvbm91c2x5Cj4gdGhy
b3VnaCBhdG9taWMuIikKCk9uZSBjb21tZW50IGZvciBuZXh0IHRpbWUgeW91IGhhdmUgdG8gYWRk
IHN1Y2ggdGFncyBhZnRlciB0aGUgZmFjdDoKcGxlYXNlIHRyeSB0byBrZWVwIGxpbmVzIHVud3Jh
cHBlZCwgb3RoZXJ3aXNlIHBhdGNod29yayBvbmx5IGdldHMgd2hhdCdzCm9uIHRoZSBmaXJzdCBs
aW5lLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
