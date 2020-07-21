Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A0227C1B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3716E6E059;
	Tue, 21 Jul 2020 09:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F9D6E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:50:49 +0000 (UTC)
Received: by mail-oo1-xc41.google.com with SMTP id z23so3801434ood.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+Mxwe8+/2sAl5aV7lSivEyRgzWsOGsAmcnpV4ySF6Ks=;
 b=Vbv8Xzl+vP1jTrX4oYxiAQUq3baNzA3kvZo8juXKiWI936pBlM7UD9ehHYU8sQT/Hy
 4guaqZae/3o9/Kn7QMqL0MsT9d0YWJtCCjdLzzkoQD3lDd3N95c/N9K1/ArLqu5nHj6X
 h8Jom6d8XDQwOSM0tY9t3bYMJ6hYTvysZ67BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Mxwe8+/2sAl5aV7lSivEyRgzWsOGsAmcnpV4ySF6Ks=;
 b=ahsTuciTLkTSPrHmbkSNFQOI8SP1tU9m2D41dulqyVlORKaqEZNSrwiDqCJAHlwfm9
 uT9Lpi7t2y2LCeTNJQoQDRCDOdMh4dIMj7FJNdJeZPwkOk/WEdgSW8UHOT/kxZFfdWtG
 6kiNdRrIFM1wYbGi/KYrHqUhuFIPDL8wtiacsuWbO6EAHaS7OJQFqRldaEUmKudtdnVZ
 kR3ymyfKNyuYB1Ij8QxYDQTbqZU4Ku34WQLeaJHxhvL1cjXLsKP6qV+ntl7v45kapuBR
 iDW9qX8PnfTPjps0FwvYKbalKYL5b90pdylX7ruDfBbkbxga5cII15w3gSwSlnMoGFmH
 XH8w==
X-Gm-Message-State: AOAM5332RwyUsrN9Rft8FR5EbGBg9Jjze6T0meUUuGU7MiQBpN3y/DlN
 be2fX7mk/5EUu7tyWiMS8dHmpKbS6Z/ziqN7BZrr2Q==
X-Google-Smtp-Source: ABdhPJwI3gJQ0NtOaqhq9TtKHG92T7bavDoHOsV389jg+GbUKhN9jTjMRfRhnq5aQBSDS1D+4bTxdMPUI50KzrE96fM=
X-Received: by 2002:a4a:b6c5:: with SMTP id w5mr2677127ooo.89.1595325048653;
 Tue, 21 Jul 2020 02:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <2ca2c004-1e11-87f5-4bd8-761e1b44d21f@amd.com>
 <74727f17-b3a5-ca12-6db6-e47543797b72@shipmail.org>
In-Reply-To: <74727f17-b3a5-ca12-6db6-e47543797b72@shipmail.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 21 Jul 2020 11:50:37 +0200
Message-ID: <CAKMK7uFfMi5M5EkCeG6=tjuDANH4=gDLnFpxCYU-E-xyrxwYUg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
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
Cc: Daniel Stone <daniels@collabora.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgMTE6MzggQU0gVGhvbWFzIEhlbGxzdHLDtm0gKEludGVs
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPgo+IE9uIDcvMjEvMjAgMTA6NTUg
QU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiBBbSAyMS4wNy4yMCB1bSAxMDo0NyBzY2hy
aWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6Cj4gPj4KPiA+PiBPbiA3LzIxLzIwIDk6NDUg
QU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPj4+IEFtIDIxLjA3LjIwIHVtIDA5OjQxIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+Pj4+IE9uIE1vbiwgSnVsIDIwLCAyMDIwIGF0IDAxOjE1
OjE3UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPiA+Pj4+IHdyb3RlOgo+ID4+
Pj4+IEhpLAo+ID4+Pj4+Cj4gPj4+Pj4gT24gNy85LzIwIDI6MzMgUE0sIERhbmllbCBWZXR0ZXIg
d3JvdGU6Cj4gPj4+Pj4+IENvbWVzIHVwIGV2ZXJ5IGZldyB5ZWFycywgZ2V0cyBzb21ld2hhdCB0
ZWRpb3VzIHRvIGRpc2N1c3MsIGxldCdzCj4gPj4+Pj4+IHdyaXRlIHRoaXMgZG93biBvbmNlIGFu
ZCBmb3IgYWxsLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBXaGF0IEknbSBub3Qgc3VyZSBhYm91dCBpcyB3
aGV0aGVyIHRoZSB0ZXh0IHNob3VsZCBiZSBtb3JlCj4gPj4+Pj4+IGV4cGxpY2l0IGluCj4gPj4+
Pj4+IGZsYXQgb3V0IG1hbmRhdGluZyB0aGUgYW1ka2ZkIGV2aWN0aW9uIGZlbmNlcyBmb3IgbG9u
ZyBydW5uaW5nCj4gPj4+Pj4+IGNvbXB1dGUKPiA+Pj4+Pj4gd29ya2xvYWRzIG9yIHdvcmtsb2Fk
cyB3aGVyZSB1c2Vyc3BhY2UgZmVuY2luZyBpcyBhbGxvd2VkLgo+ID4+Pj4+IEFsdGhvdWdoIChp
biBteSBodW1ibGUgb3BpbmlvbikgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gY29tcGxldGVseQo+
ID4+Pj4+IHVudGFuZ2xlCj4gPj4+Pj4ga2VybmVsLWludHJvZHVjZWQgZmVuY2VzIGZvciByZXNv
dXJjZSBtYW5hZ2VtZW50IGFuZCBkbWEtZmVuY2VzCj4gPj4+Pj4gdXNlZCBmb3IKPiA+Pj4+PiBj
b21wbGV0aW9uLSBhbmQgZGVwZW5kZW5jeSB0cmFja2luZyBhbmQgbGlmdCBhIGxvdCBvZiByZXN0
cmljdGlvbnMKPiA+Pj4+PiBmb3IgdGhlCj4gPj4+Pj4gZG1hLWZlbmNlcywgaW5jbHVkaW5nIHBy
b2hpYml0aW5nIGluZmluaXRlIG9uZXMsIEkgdGhpbmsgdGhpcwo+ID4+Pj4+IG1ha2VzIHNlbnNl
Cj4gPj4+Pj4gZGVzY3JpYmluZyB0aGUgY3VycmVudCBzdGF0ZS4KPiA+Pj4+IFllYWggSSB0aGlu
ayBhIGZ1dHVyZSBwYXRjaCBuZWVkcyB0byB0eXBlIHVwIGhvdyB3ZSB3YW50IHRvIG1ha2UgdGhh
dAo+ID4+Pj4gaGFwcGVuIChmb3Igc29tZSBjcm9zcyBkcml2ZXIgY29uc2lzdGVuY3kpIGFuZCB3
aGF0IG5lZWRzIHRvIGJlCj4gPj4+PiBjb25zaWRlcmVkLiBTb21lIG9mIHRoZSBuZWNlc3Nhcnkg
cGFydHMgYXJlIGFscmVhZHkgdGhlcmUgKHdpdGgKPiA+Pj4+IGxpa2UgdGhlCj4gPj4+PiBwcmVl
bXB0aW9uIGZlbmNlcyBhbWRrZmQgaGFzIGFzIGFuIGV4YW1wbGUpLCBidXQgSSB0aGluayBzb21l
IGNsZWFyCj4gPj4+PiBkb2NzCj4gPj4+PiBvbiB3aGF0J3MgcmVxdWlyZWQgZnJvbSBib3RoIGh3
LCBkcml2ZXJzIGFuZCB1c2Vyc3BhY2Ugd291bGQgYmUgcmVhbGx5Cj4gPj4+PiBnb29kLgo+ID4+
Pgo+ID4+PiBJJ20gY3VycmVudGx5IHdyaXRpbmcgdGhhdCB1cCwgYnV0IHByb2JhYmx5IHN0aWxs
IG5lZWQgYSBmZXcgZGF5cwo+ID4+PiBmb3IgdGhpcy4KPiA+Pgo+ID4+IEdyZWF0ISBJIHB1dCBk
b3duIHNvbWUgKHZlcnkpIGluaXRpYWwgdGhvdWdodHMgYSBjb3VwbGUgb2Ygd2Vla3MgYWdvCj4g
Pj4gYnVpbGRpbmcgb24gZXZpY3Rpb24gZmVuY2VzIGZvciB2YXJpb3VzIGhhcmR3YXJlIGNvbXBs
ZXhpdHkgbGV2ZWxzIGhlcmU6Cj4gPj4KPiA+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRsYWIuZnJlZWRlc2t0b3Au
b3JnJTJGdGhvbWFzaCUyRmRvY3MlMkYtJTJGYmxvYiUyRm1hc3RlciUyRlVudGFuZ2xpbmclMjUy
MGRtYS1mZW5jZSUyNTIwYW5kJTI1MjBtZW1vcnklMjUyMGFsbG9jYXRpb24ub2R0JmFtcDtkYXRh
PTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Qzg5NzhiYmQ3ODIzZTRiNDE2
NjM3MDhkODJkNTJhZGQzJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzMwOTE4MDQyNDMxMjM5MCZhbXA7c2RhdGE9dFR4eDJ2Znpmd0xNMUlCSlNxcUFaUncx
NjA0UiUyRjBiSTNNd04xJTJGQmYyVlElM0QmYW1wO3Jlc2VydmVkPTAKPiA+Pgo+ID4KPiA+IEkg
ZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIHdpbGwgZXZlciBiZSBwb3NzaWJsZS4KPiA+Cj4gPiBTZWUg
dGhhdCBEYW5pZWwgZGVzY3JpYmVzIGluIGhpcyB0ZXh0IGlzIHRoYXQgaW5kZWZpbml0ZSBmZW5j
ZXMgYXJlIGEKPiA+IGJhZCBpZGVhIGZvciBtZW1vcnkgbWFuYWdlbWVudCwgYW5kIEkgdGhpbmsg
dGhhdCB0aGlzIGlzIGEgZml4ZWQgZmFjdC4KPiA+Cj4gPiBJbiBvdGhlciB3b3JkcyB0aGUgd2hv
bGUgY29uY2VwdCBvZiBzdWJtaXR0aW5nIHdvcmsgdG8gdGhlIGtlcm5lbAo+ID4gd2hpY2ggZGVw
ZW5kcyBvbiBzb21lIHVzZXIgc3BhY2UgaW50ZXJhY3Rpb24gZG9lc24ndCB3b3JrIGFuZCBuZXZl
ciB3aWxsLgo+Cj4gV2VsbCB0aGUgaWRlYSBoZXJlIGlzIHRoYXQgbWVtb3J5IG1hbmFnZW1lbnQg
d2lsbCAqbmV2ZXIqIGRlcGVuZCBvbgo+IGluZGVmaW5pdGUgZmVuY2VzOiBBcyBzb29uIGFzIHNv
bWVvbmUgd2FpdHMgb24gYSBtZW1vcnkgbWFuYWdlciBmZW5jZQo+IChiZSBpdCBldmljdGlvbiwg
c2hyaW5rZXIgb3IgbW11IG5vdGlmaWVyKSBpdCBicmVha3Mgb3V0IG9mIGFueQo+IGRtYS1mZW5j
ZSBkZXBlbmRlbmNpZXMgYW5kIC9vciB1c2VyLXNwYWNlIGludGVyYWN0aW9uLiBUaGUgdGV4dCB0
cmllcyB0bwo+IGRlc2NyaWJlIHdoYXQncyByZXF1aXJlZCB0byBiZSBhYmxlIHRvIGRvIHRoYXQg
KHNhdmUgZm9yIG5vbi1wcmVlbXB0aWJsZQo+IGdwdXMgd2hlcmUgc29tZW9uZSBzdWJtaXRzIGEg
Zm9yZXZlci1ydW5uaW5nIHNoYWRlcikuCgpZZWFoIEkgdGhpbmsgdGhhdCBwYXJ0IG9mIHlvdXIg
dGV4dCBpcyBnb29kIHRvIGRlc2NyaWJlIGhvdyB0bwp1bnRhbmdsZSBtZW1vcnkgZmVuY2VzIGZy
b20gc3luY2hyb25pemF0aW9uIGZlbmNlcyBnaXZlbiBob3cgbXVjaCB0aGUKaHcgY2FuIGRvLgoK
PiBTbyB3aGlsZSBJIHRoaW5rIHRoaXMgaXMgcG9zc2libGUgKHVudGlsIHNvbWVvbmUgY29tZXMg
dXAgd2l0aCBhIGNhc2UKPiB3aGVyZSBpdCB3b3VsZG4ndCB3b3JrIG9mIGNvdXJzZSksIEkgZ3Vl
c3MgRGFuaWVsIGhhcyBhIHBvaW50IGluIHRoYXQgaXQKPiB3b24ndCBoYXBwZW4gYmVjYXVzZSBv
ZiBpbmVydGlhIGFuZCB0aGVyZSBtaWdodCBiZSBiZXR0ZXIgb3B0aW9ucy4KClllYWggaXQncyBq
dXN0IEkgZG9uJ3Qgc2VlIG11Y2ggY2hhbmNlIGZvciBzcGxpdHRpbmcgZG1hLWZlbmNlIGl0c2Vs
Zi4KVGhhdCdzIGFsc28gd2h5IEknbSBub3QgcG9zaXRpdmUgb24gdGhlICJubyBodyBwcmVlbXB0
aW9uLCBvbmx5CnNjaGVkdWxlciIgY2FzZTogWW91IHN0aWxsIGhhdmUgYSBkbWFfZmVuY2UgZm9y
IHRoZSBiYXRjaCBpdHNlbGYsCndoaWNoIG1lYW5zIHN0aWxsIG5vIHVzZXJzcGFjZSBjb250cm9s
bGVkIHN5bmNocm9uaXphdGlvbiBvciBvdGhlcgpmb3JtIG9mIGluZGVmaW5pdGUgYmF0Y2hlcyBh
bGxvd2VkLiBTbyBub3QgZ2V0dGluZyB1cyBhbnkgY2xvc2VyIHRvCmVuYWJsaW5nIHRoZSBjb21w
dXRlIHVzZSBjYXNlcyBwZW9wbGUgd2FudC4gU28gbWluaW1hbGx5IEkgdGhpbmsgaHcKbmVlZHMg
dG8gYmUgYWJsZSB0byBwcmVlbXB0LCBhbmQgcHJlZW1wdCBmYWlybHkgcXVpY2tseSAoaS5lLiB3
aXRoaW4Kc2hhZGVycyBpZiB5b3UgaGF2ZSBsb25nIHJ1bm5pbmcgc2hhZGVycyBhcyB5b3VyIHVz
ZS1jYXNlKSwgb3Igc3VwcG9ydApncHUgcGFnZSBmYXVsdHMuIEFuZCBkZXBlbmRpbmcgaG93IGl0
IGFsbCB3b3JrcyBkaWZmZXJlbnQgcGFydHMgb2YgdGhlCmRyaXZlciBjb2RlIGVuZCB1cCBpbiBk
bWEgZmVuY2UgY3JpdGljYWwgc2VjdGlvbnMsIHdpdGggZGlmZmVyZW50CnJlc3RyaWN0aW9ucy4K
LURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
