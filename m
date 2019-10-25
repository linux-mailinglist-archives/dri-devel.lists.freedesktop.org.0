Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AAE510D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 18:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C326EAFA;
	Fri, 25 Oct 2019 16:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB0D06EAF5;
 Fri, 25 Oct 2019 16:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 210712A6046;
 Fri, 25 Oct 2019 18:20:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id cDFWOZDoYXzC; Fri, 25 Oct 2019 18:20:01 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id CC4982A6045;
 Fri, 25 Oct 2019 18:20:01 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.3)
 (envelope-from <michel@daenzer.net>)
 id 1iO2Jl-0005jU-GJ; Fri, 25 Oct 2019 18:20:01 +0200
Subject: Re: [PATCH] drm/radeon: Handle workqueue allocation failure
To: Will Deacon <will@kernel.org>
References: <20191025110450.10474-1-will@kernel.org>
 <5d6a88a2-2719-a859-04df-10b0d893ff39@daenzer.net>
 <20191025161804.GA12335@willie-the-truck>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <e2f87ecc-0a8e-253d-107c-5cf6486c4b6a@daenzer.net>
Date: Fri, 25 Oct 2019 18:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025161804.GA12335@willie-the-truck>
Content-Language: en-CA
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Waisman <nico@semmle.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yNSA2OjE4IHAubS4sIFdpbGwgRGVhY29uIHdyb3RlOgo+IE9uIEZyaSwgT2N0
IDI1LCAyMDE5IGF0IDA2OjA2OjI2UE0gKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+PiBP
biAyMDE5LTEwLTI1IDE6MDQgcC5tLiwgV2lsbCBEZWFjb24gd3JvdGU6Cj4+PiBJbiB0aGUgaGln
aGx5IHVubGlrZWx5IGV2ZW50IHRoYXQgd2UgZmFpbCB0byBhbGxvY2F0ZSB0aGUgInJhZGVvbi1j
cnRjIgo+Pj4gd29ya3F1ZXVlLCB3ZSBzaG91bGQgYmFpbCBjbGVhbmx5IHJhdGhlciB0aGFuIGJs
aW5kbHkgbWFyY2ggb24gd2l0aCBhCj4+PiBOVUxMIHBvaW50ZXIgaW5zdGFsbGVkIGZvciB0aGUg
J2ZsaXBfcXVldWUnIGZpZWxkIG9mIHRoZSAncmFkZW9uX2NydGMnCj4+PiBzdHJ1Y3R1cmUuCj4+
Pgo+Pj4gVGhpcyB3YXMgcmVwb3J0ZWQgcHJldmlvdXNseSBieSBOaWNvbGFzLCBidXQgSSBkb24n
dCB0aGluayBoaXMgZml4IHdhcwo+Pj4gY29ycmVjdDoKPj4KPj4gTmVpdGhlciBpcyB0aGlzIG9u
ZSBJJ20gYWZyYWlkLiBTZWUgbXkgZmVlZGJhY2sgb24KPj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzMzMTUzNC8gLgo+IAo+IFRoYW5rcy4gQWx0aG91Z2ggSSBhZ3Jl
ZSB3aXRoIHlvdSB3cnQgdGhlIG9yaWdpbmFsIHBhdGNoLCBJIGRvbid0IHRoaW5rCj4gdGhlIHdv
cmtxdWV1ZSBhbGxvY2F0aW9uIGZhaWx1cmUgaXMgZGlzdGluZ3Vpc2hhYmxlIGZyb20gdGhlIENS
VEMgYWxsb2NhdGlvbgo+IGZhaWx1cmUgd2l0aCBteSBwYXRjaC4gQXJlIHlvdSBzYXlpbmcgdGhh
dCB0aGUgZXJyb3IgcGF0aCB0aGVyZSBpcyBicm9rZW4KPiB0b28/CgpUaGUgZHJpdmVyIHdvbid0
IGFjdHVhbGx5IHdvcmsgaWYgcmFkZW9uX2NydGNfaW5pdCBiYWlscyBzaWxlbnRseSwgaXQnbGwK
anVzdCBmYWxsIG92ZXIgYXQgc29tZSBsYXRlciBwb2ludC4KCgotLSAKRWFydGhsaW5nIE1pY2hl
bCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNv
bQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVz
YSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
