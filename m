Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6E1C410
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7FC892AC;
	Tue, 14 May 2019 07:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id C615189FD9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 15:14:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B5C7341;
 Mon, 13 May 2019 08:14:04 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 655D03F71E;
 Mon, 13 May 2019 08:14:03 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Use drm_gem_dump_map_offset()
To: Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>
References: <20190513143244.16478-1-steven.price@arm.com>
 <20190513143921.GP17751@phenom.ffwll.local>
 <155775884217.2165.11223399053598674062@skylake-alporthouse-com>
From: Steven Price <steven.price@arm.com>
Message-ID: <0b7f0b7f-3e14-f5bb-368a-08037c2a8529@arm.com>
Date: Mon, 13 May 2019 16:14:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155775884217.2165.11223399053598674062@skylake-alporthouse-com>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
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
Cc: David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDUvMjAxOSAxNTo0NywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgRGFuaWVs
IFZldHRlciAoMjAxOS0wNS0xMyAxNTozOToyMSkKPj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQg
MDM6MzI6NDRQTSArMDEwMCwgU3RldmVuIFByaWNlIHdyb3RlOgo+Pj4gcGFuZnJvc3RfaW9jdGxf
bW1hcF9ibygpIGNvbnRhaW5zIGEgcmVpbXBsZW1lbnRhdGlvbiBvZgo+Pj4gZHJtX2dlbV9kdW1w
X21hcF9vZmZzZXQoKSBidXQgd2l0aCBhIGJ1ZyAtIGl0IGFsbG93cyBtYXBwaW5nIGltcG9ydGVk
Cj4+PiBvYmplY3RzICh3aXRob3V0IGdvaW5nIHRocm91Z2ggdGhlIGV4cG9ydGVyKS4gRml4IHRo
aXMgYnkgc3dpdGNoaW5nIHRvCj4+PiB1c2UgdGhlIGdlbmVyaWMgZHJtX2dlbV9kdW1wX21hcF9v
ZmZzZXQoKSBmdW5jdGlvbiBpbnN0ZWFkIHdoaWNoIGhhcyB0aGUKPj4+IGJvbnVzIG9mIHNpbXBs
aWZ5aW5nIHRoZSBjb2RlLgo+Pgo+PiBnZW1fZHVtYiBzdHVmZiBpcyBmb3Iga21zIGRyaXZlcnMs
IHBhbmZyb3N0IGlzIGEgcmVuZGVyIGRyaXZlci4gV2UncmUKPj4gZ2VuZXJhbGx5IHRyeWluZyB0
byBzZXBhcmF0ZSB0aGVzZSB0d28gd29ybGRzIHNvbWV3aGF0IGNsZWFubHkuCj4+Cj4+IEkgdGhp
bmsgaXQnZCBiZSBnb29kIHRvIGhhdmUgYSBub24tZHVtYiB2ZXJzaW9uIG9mIHRoaXMgaW4gdGhl
IGNvcmUsIGFuZAo+PiB1c2UgdGhhdC4gT3IgdXBncmFkZSB0aGUgZHVtYiB2ZXJzaW9uIHRvIGJl
IHRoYXQgaGVscGVyIGZvciBldmVyeW9uZSAoYW5kCj4+IGRyb3AgdGhlIF9kdW1iKS4KCkknbSBz
bGlnaHRseSBjb25mdXNlZCBieSB3aGF0IHlvdSB0aGluayBpcyB0aGUgYmVzdCBjb3Vyc2Ugb2Yg
YWN0aW9uIGhlcmUuCgpJIGNhbiBjcmVhdGUgYSBwYXRjaCBkcm9wcGluZyB0aGUgJ19kdW1iJyBm
cm9tIGRybV9nZW1fZHVtcF9tYXBfb2Zmc2V0KCkKaWYgdGhhdCdzIHRoZSBvYmplY3Rpb24uIE9y
IGRvIHlvdSB3YW50IGEgaGVscGVyIGZ1bmN0aW9uIHdpdGggdHdvCmNhbGxlcnMgKHRoZSAnZHVt
cCcgYW5kIHRoZSAnc2htZW0nIHZlcnNpb25zKT8KCj4gTW9yZSBzcGVjaWZpY2FsbHksIHNpbmNl
IHBhbmZyb3N0IGlzIHVzaW5nIHRoZSBkcm1fZ2VtX3NobWVtIGhlbHBlciBhbmQKPiB2bV9vcHMs
IGl0IHRvbyBjYW4gcHJvdmlkZSB0aGUgd3JhcHBlciBhcyBpdCBpcyB0aGUgZHJtX2dlbV9zaG1l
bSBsYXllcgo+IHRoYXQgaW1wbGllcyB0aGF0IHRyeWluZyB0byBtbWFwIGFuIGltcG9ydGVkIG9i
amVjdCBpcyBhbiBpc3N1ZSBhcyB0aGF0Cj4gaXMgbm90IGEgdW5pdmVyc2FsIHByb2JsZW0uCm1t
YXAnaW5nIGFuIGltcG9ydGVkIG9iamVjdCBpc24ndCBhIHByb2JsZW0gYXMgc3VjaC4gQnV0IHJh
dGhlciB0aGFuCmdvaW5nIGJlaGluZCB0aGUgZXhwb3J0ZXIncyBiYWNrIHdlIHdvdWxkIG5lZWQg
dG8gY2FsbCBkbWFfYnVmX21tYXAoKSB0bwplbnN1cmUgdGhhdCB0aGUgZXhwb3J0ZXIgY2FuIGRv
IHdoYXRldmVyIGlzIG5lY2Vzc2FyeS4KCkkgY291bGQgYWRkIGEgd3JhcHBlciBpbiBkcm1fZ2Vt
X3NobWVtX2hlbHBlciwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IHRoZQpiZW5lZml0IG9mIGEgd3Jh
cHBlciBoZXJlIGlzPwoKU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
