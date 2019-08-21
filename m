Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1505D97EB8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F29F6E967;
	Wed, 21 Aug 2019 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DC16E971
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 15:30:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 37036283C0C;
 Wed, 21 Aug 2019 16:30:23 +0100 (BST)
Date: Wed, 21 Aug 2019 17:30:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH RFC 02/19] drm: Support custom encoder/bridge
 enable/disable sequences officially
Message-ID: <20190821173019.379b1e98@collabora.com>
In-Reply-To: <20190820190505.GP10820@pendragon.ideasonboard.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-3-boris.brezillon@collabora.com>
 <20190820190505.GP10820@pendragon.ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAyMjowNTowNSArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBIaSBCb3JpcywKPiAKPiBU
aGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwNTox
MTozM1BNICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBUaGUgVkM0IGFuZCBFeHlu
b3MgRFNJIGVuY29kZXIgZHJpdmVycyBuZWVkIGEgY3VzdG9tIGVuYWJsZS9kaXNhYmxlCj4gPiBz
ZXF1ZW5jZSBhbmQgbWFudWFsbHkgc2V0IGVuY29kZXItPmJyaWRnZSB0byBOVUxMIHRvIHByZXZl
bnQgdGhlIGNvcmUKPiA+IGZyb20gY2FsbGluZyB0aGUgYnJpZGdlIGhvb2tzLgo+ID4gCj4gPiBM
ZXQncyBwcm92aWRlIGEgbW9yZSBvZmZpY2lhbCB3YXkgdG8gc3VwcG9ydCBjdXN0b20gYnJpZGdl
L2VuY29kZXIKPiA+IGVuYWJsZS9kaXNhYmxlIHNlcXVlbmNlcy4gIAo+IAo+IFNvLCB3aGlsZSBJ
J20gbm90IG9wcG9zZWQgdG8gdGhpcywgSSB0aGluayBpdCdzIGEgYml0IG9mIGEgaGFjaywgYW5k
IEknZAo+IGxpa2UgdG8gc2hhcmUgbXkgdmlzaW9uIG9mIGhvdyBJJ2QgbGlrZSB0byBzZWUgdGhp
cyBiZWluZyBpbXBsZW1lbnRlZCBpbgo+IHRoZSBtb3JlIGRpc3RhbnQgZnV0dXJlIChhbmQgdGh1
cyBwb3NzaWJseSBvbiB0b3Agb2YgdGhpcyBjaGFuZ2UpLgoKSSBhZ3JlZSwgaXQgZGVmaW5pdGVs
eSBsb29rcyBsaWtlIGEgaGFjaywgYnV0IEkgZmluZCBpdCBsZXNzIGhhY2staXNoCnRoYW4gbGV0
dGluZyBkcml2ZXJzIHJlLWluaXRpYWxpemUgdGhlIGVuY29kZXItPmJyaWRnZSBmaWVsZCB0byBO
VUxMCmp1c3QgYWZ0ZXIgY2FsbGluZyBicmlkZ2VfYXR0YWNoKCkgOlAuCgo+IAo+IEl0IGhhcyBi
ZWVuIGVzdGFibGlzaGVkIGZvciBxdWl0ZSBzb21lIHRpbWUgbm93IHRoYXQgZXhwb3NpbmcKPiBk
cm1fZW5jb2RlciB0byB1c2Vyc3BhY2Ugd2FzIGxpa2VseSBhIG1pc3Rha2UsIGFuZCB0aGF0IGl0
IHNob3VsZCBoYXZlCj4gc3RheWVkIGEga2VybmVsLW9ubHkgb2JqZWN0LiBXaXRoIHRoZSBnZW5l
cmFsaXNlZCB1c2FnZSBvZiBkcm1fYnJpZGdlLCBJCj4gd291bGQgZ28gb25lIHN0ZXAgZnVydGhl
cjogZHJtX2VuY29kZXIgc2hvdWxkbid0IG1hdHRlciBmb3IgRFJNL0tNUwo+IGRyaXZlcnMgYXQg
YWxsLgoKSSBjb3VsZG4ndCBhZ3JlZSBtb3JlLgoKPiAKPiBkcm1fYnJpZGdlIGhhcyBiZWVuIGlu
dHJvZHVjZWQgdG8gbW9kZWwgY2hhaW5lZCBlbmNvZGVycywgd2hlcmUgdGhlCj4gc2Vjb25kIChh
bmQgc3Vic2VxdWVudCkgZW5jb2RlcnMgY291bGRuJ3QgZWFzaWx5IGJlIHN1cHBvcnRlZCBpbiBh
Cj4gc3RhbmRhcmQgYW5kIHJldXNhYmxlIHdheSB3aXRoIGp1c3QgZHJtX2VuY29kZXIuIEEgYnJp
ZGdlICh3aXRoIHRoZQo+IGV4Y2VwdGlvbiBvZiB0aGUgcGFuZWwgYnJpZGdlKSBpcyBqdXN0IGFu
IGVuY29kZXIuIEl0IHNob3VsZG4ndCBtYXR0ZXIKPiB3aGV0aGVyIGVuY29kZXJzIGFyZSBpbnRl
cm5hbCB0byB0aGUgZGlzcGxheSBjb250cm9sbGVyLCBzZXBhcmF0ZSBJUHMgaW4KPiB0aGUgU29D
IG9yIGV4dGVybmFsIGNvbXBvbmVudHMsIHRoZXkgY291bGQgYWxsIGJlIG1vZGVsbGVkIGFzIGJy
aWRnZXMuCj4gV2UgZG8gaGF2ZSBicmlkZ2VzIGZvciBEU0kgZW5jb2RlciBJUHMsIGFuZCBEU0kg
KGFuZCBvdGhlcikgYnJpZGdlcwo+IHBvdGVudGlhbGx5IG5lZWQgc2ltaWxhciBjdXN0b20gZW5h
YmxlL2Rpc2FibGUgc2VxdWVuY2VzLiBJIHdvdWxkIHRodXMKPiBpZGVhbGx5IGxpa2UgdG8gc2Vl
IHRoZSBWQzQgYW5kIEV4eW5vcyBEU0kgZW5jb2RlcnMgYmVpbmcgaW1wbGVtZW50ZWQgYXMKPiBi
cmlkZ2VzLCB3aXRoIHN1cHBvcnQgZm9yIGN1c3RvbSBlbmFibGUvZGlzYWJsZSBzZXF1ZW5jZXMg
aW4gYnJpZGdlcywKPiBhbmQgZHJvcCBzdXBwb3J0IGZvciBjdXN0b20gZW5hYmxlL2Rpc2FibGUg
c2VxdWVuY2VzIGluIGRybV9lbmNvZGVyLgoKTG9va3MgbGlrZSB3ZSdyZSBvbiB0aGUgc2FtZSBw
YWdlLgoKPiAKPiBEb2VzIHRoaXMgbWFrZSBzZW5zZSB0byB5b3UgPwoKRGVmaW5pdGVseS4KCj4g
V2hpbGUgSSB3b3VsZCBsb3ZlIHRvIHNlZSB0aGlzIGJlaW5nCj4gaW1wbGVtZW50ZWQgcmlnaHQg
YXdheSwgaXQgbWF5IGJlIHRvbyBtdWNoIHdvcmsgYXMgYSBwcmVyZXF1aXNpdGUgZm9yCj4gdGhp
cyBidXMgZm9ybWF0IG5lZ290aWF0aW9uIHNlcmllcywgc28gSSBkb24ndCB3YW50IHRvIHJlamVj
dCB0aGlzCj4gcGF0Y2guIEkgd291bGQgaG93ZXZlciBsaWtlIHRvIGFscmVhZHkgbWFrZSBzdXJl
IHdlIGFncmVlIG9uIHRoZSB3YXkKPiBmb3J3YXJkIGZvciB0aGUgbmV4dCBzdGVwcy4KCkFjdHVh
bGx5LCBJIHRoaW5rIEkgaGF2ZSBzb21ldGhpbmcgWzFdIHRoYXQgaW1wbGVtZW50cyB3aGF0IHlv
dSdyZQpwcm9wb3NpbmcgaGVyZSAod2hpY2ggaXMgbm90IHN1cnByaXNpbmcgc2luY2Ugd2UgZGlz
Y3Vzc2VkIGl0IG9uCklSQyA7KSkuIEknbGwgc2VuZCBhIHYyIHNvIHlvdSBjYW4gY29tbWVudCBv
biB0aGUgbmV3IGFwcHJvYWNoLgoKWzFdaHR0cHM6Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGlu
dXgtMGRheS9jb21taXRzL2RybS1icmlkZ2UtYnVzZm10LTIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
