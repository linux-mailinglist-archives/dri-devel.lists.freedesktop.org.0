Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57F199832
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 16:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F786E836;
	Tue, 31 Mar 2020 14:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F105E6E836
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:10:29 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m17so26103140wrw.11;
 Tue, 31 Mar 2020 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6KkVAX9LHQdy5bHn212eBpteLV15dAVUf1jSf5zOtEI=;
 b=CBuNpmAdmCOS9vPjHPGBzs3t/L7Yy6BKi/X/WMLwNFHK85ob3GXcaVicIX131gfJn2
 OU8OqjmxYznVOzw9ShEUda19LDx6ErO2Z1y5NCgqYgJ9BmkpVH4/K8MyjDXe13mjsxg/
 BB2i6Sy9cMjQttATOhQ32MukPB1hmG3r5LI7JfjFRrRlI7C3qBFymVIWXYs+kVfaC3zk
 R1uXZpAWPjrh9ry545106iUh6fNP3A4aLtkpmQyyG20Bvkkfyr7VSel8H2al5hDn3JM7
 dCvpRDi901uzlVNmgDNP1wHvYyRMuDAxcI7kD5o/IFirSeHOgzVBdQko+U/ah64ZsuKK
 7bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6KkVAX9LHQdy5bHn212eBpteLV15dAVUf1jSf5zOtEI=;
 b=tLiyhpwlVyNVYt/RNkO/G1g+cRHIEyr5LL7YuPI1QbQHnqr2yjUrSDDZDHaHMgS56X
 MsS8x47yMlASsStP2x8gqo7ZrF+VKChahyVcCdl4jr0MCOrxDWy8Lnt/yykf9YNOtLFr
 tHHPNWu2Wj52csuuI3ms6R4XBEM8pS6R/T6Hssp8ia/trlHRMX6pg6L5rfpQCQBkiOEr
 +A4r8IncdJ4vMCF67OszlhzXBa12Xrxax6UgZ9oji59afBJ8ZWrt27t8VKSLyOWPzesO
 ddBIpZWMzVmjxO21EgGEqcqhBgy3swEuw69E4a5ReQoYY7OYMvBEnNUu8chrvd/BRdpL
 2jqA==
X-Gm-Message-State: ANhLgQ2eavcqk1IU8ZbqmSQnSKNTiJMSeXxVc4bCJapZoM7HjQge6pKw
 AqQc8jUrTFR1IInHwlAws9975s5TeucBebX3M/o=
X-Google-Smtp-Source: ADFU+vuptnxHXiRXfHruTSFrIWhJmSwzLXngCmzoyKLq6ikXfD7hMknhh7AogD4BJxghw+8QXj8CfDHg6qw7LeNCLRA=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr21860749wrw.124.1585663828600; 
 Tue, 31 Mar 2020 07:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
 <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
 <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
 <CADnq5_O6pwxJsYdfJO0xZtmER05GtO+2-4uHTeexKNeHyUq8_Q@mail.gmail.com>
 <3a0cb2bc-84be-6f9f-a0e8-ecb653026301@samsung.com>
In-Reply-To: <3a0cb2bc-84be-6f9f-a0e8-ecb653026301@samsung.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Mar 2020 10:10:17 -0400
Message-ID: <CADnq5_NEhfZwE6B0UBu0My7Sk5YNoDE=7Nj_CUYpPe9HOjpjqQ@mail.gmail.com>
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shane Francis <bigbeeshane@gmail.com>, amd-gfx-request@lists.freedesktop.org,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMToyNSBBTSBNYXJlayBTenlwcm93c2tpCjxtLnN6eXBy
b3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleCwKPgo+IE9uIDIwMjAtMDMtMzAg
MTU6MjMsIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+IE9uIE1vbiwgTWFyIDMwLCAyMDIwIGF0IDQ6
MTggQU0gTWFyZWsgU3p5cHJvd3NraQo+ID4gPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4gd3Jv
dGU6Cj4gPj4gSGkKPiA+Pgo+ID4+IE9uIDIwMjAtMDMtMjcgMTA6MTAsIE1hcmVrIFN6eXByb3dz
a2kgd3JvdGU6Cj4gPj4+IEhpIENocmlzdGlhbiwKPiA+Pj4KPiA+Pj4gT24gMjAyMC0wMy0yNyAw
OToxMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+Pj4+IEFtIDI3LjAzLjIwIHVtIDA4OjU0
IHNjaHJpZWIgTWFyZWsgU3p5cHJvd3NraToKPiA+Pj4+PiBPbiAyMDIwLTAzLTI1IDEwOjA3LCBT
aGFuZSBGcmFuY2lzIHdyb3RlOgo+ID4+Pj4+PiBBcyBkbWFfbWFwX3NnIGNhbiByZW9yZ2FuaXpl
IHNjYXR0ZXItZ2F0aGVyIGxpc3RzIGluIGEKPiA+Pj4+Pj4gd2F5IHRoYXQgY2FuIGNhdXNlIHNv
bWUgbGF0ZXIgc2VnbWVudHMgdG8gYmUgZW1wdHkgd2Ugc2hvdWxkCj4gPj4+Pj4+IGFsd2F5cyB1
c2UgdGhlIHNnX2RtYV9sZW4gbWFjcm8gdG8gZmV0Y2ggdGhlIGFjdHVhbCBsZW5ndGguCj4gPj4+
Pj4+Cj4gPj4+Pj4+IFRoaXMgY291bGQgbm93IGJlIDAgYW5kIG5vdCBuZWVkIHRvIGJlIG1hcHBl
ZCB0byBhIHBhZ2Ugb3IKPiA+Pj4+Pj4gYWRkcmVzcyBhcnJheQo+ID4+Pj4+Pgo+ID4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBTaGFuZSBGcmFuY2lzIDxiaWdiZWVzaGFuZUBnbWFpbC5jb20+Cj4gPj4+
Pj4+IFJldmlld2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNv
bT4KPiA+Pj4+PiBUaGlzIHBhdGNoIGxhbmRlZCBpbiBsaW51eC1uZXh0IDIwMjAwMzI2IGFuZCBp
dCBjYXVzZXMgYSBrZXJuZWwKPiA+Pj4+PiBwYW5pYyBvbgo+ID4+Pj4+IHZhcmlvdXMgRXh5bm9z
IFNvQyBiYXNlZCBib2FyZHMuCj4gPj4+Pj4+IC0tLQo+ID4+Pj4+PiAgICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jIHwgMiArLQo+ID4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+Pj4+Cj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMK
PiA+Pj4+Pj4gaW5kZXggODZkOWIwZTQ1YzhjLi4xZGUyY2RlMjI3N2MgMTAwNjQ0Cj4gPj4+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ID4+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMKPiA+Pj4+Pj4gQEAgLTk2Nyw3ICs5NjcsNyBAQCBpbnQgZHJt
X3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXMoc3RydWN0Cj4gPj4+Pj4+IHNnX3RhYmxlICpz
Z3QsIHN0cnVjdCBwYWdlICoqcGFnZXMsCj4gPj4+Pj4+ICAgICAgICAgICAgaW5kZXggPSAwOwo+
ID4+Pj4+PiAgICAgICAgIGZvcl9lYWNoX3NnKHNndC0+c2dsLCBzZywgc2d0LT5uZW50cywgY291
bnQpIHsKPiA+Pj4+Pj4gLSAgICAgICAgbGVuID0gc2ctPmxlbmd0aDsKPiA+Pj4+Pj4gKyAgICAg
ICAgbGVuID0gc2dfZG1hX2xlbihzZyk7Cj4gPj4+Pj4+ICAgICAgICAgICAgIHBhZ2UgPSBzZ19w
YWdlKHNnKTsKPiA+Pj4+Pj4gICAgICAgICAgICAgYWRkciA9IHNnX2RtYV9hZGRyZXNzKHNnKTsK
PiA+Pj4+PiBTb3JyeSwgYnV0IHRoaXMgY29kZSBpcyB3cm9uZyA6KAo+ID4+Pj4gV2VsbCBpdCBp
cyBhdCBsZWFzdCBiZXR0ZXIgdGhhbiBiZWZvcmUgYmVjYXVzZSBpdCBtYWtlcyBtb3N0IGRyaXZl
cnMKPiA+Pj4+IHdvcmsgY29ycmVjdGx5IGFnYWluLgo+ID4+PiBXZWxsLCBJJ20gbm90IHN1cmUg
dGhhdCBhIGhhbGYtYnJva2VuIGZpeCBzaG91bGQgYmUgY29uc2lkZXJlZCBhcyBhCj4gPj4+IGZp
eCA7KQo+ID4+Pgo+ID4+PiBBbnl3YXksIEkganVzdCBnb3QgdGhlIGNvbW1lbnQgZnJvbSBTaGFu
ZSwgdGhhdCBteSBwYXRjaCBpcyBmaXhpbmcgdGhlCj4gPj4+IGlzc3VlcyB3aXRoIGFtZGdwdSBh
bmQgcmFkZW9uLCB3aGlsZSBzdGlsbCB3b3JraW5nIGZpbmUgZm9yIGV4eW5vcywgc28KPiA+Pj4g
aXQgaXMgaW5kZWVkIGEgcHJvcGVyIGZpeC4KPiA+PiBUb2RheSBJJ3ZlIG5vdGljZWQgdGhhdCB0
aGlzIHBhdGNoIHdlbnQgdG8gZmluYWwgdjUuNiB3aXRob3V0IGV2ZW4gYSBkYXkKPiA+PiBvZiB0
ZXN0aW5nIGluIGxpbnV4LW5leHQsIHNvIHY1LjYgaXMgYnJva2VuIG9uIEV4eW5vcyBhbmQgcHJv
YmFibHkgYSBmZXcKPiA+PiBvdGhlciBBUk0gYXJjaHMsIHdoaWNoIHJlbHkgb24gdGhlIGRybV9w
cmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzCj4gPj4gZnVuY3Rpb24uCj4gPiBQbGVhc2UgY29t
bWl0IHlvdXIgcGF0Y2ggYW5kIGNjIHN0YWJsZS4KPgo+IEkndmUgYWxyZWFkeSBkaWQgdGhhdDog
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvMy8yNy81NTUKCkRvIHlvdSBoYXZlIGRybS1taXNj
IGNvbW1pdCByaWdodHMgb3IgZG8geW91IG5lZWQgc29tZW9uZSB0byBjb21taXQKdGhpcyBmb3Ig
eW91PwoKQWxleAoKCj4KPiBCZXN0IHJlZ2FyZHMKPiAtLQo+IE1hcmVrIFN6eXByb3dza2ksIFBo
RAo+IFNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
