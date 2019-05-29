Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C422E368
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 19:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EE06E03B;
	Wed, 29 May 2019 17:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83CF26E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 17:38:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A0CF341;
 Wed, 29 May 2019 10:38:33 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8DAC3F5AF;
 Wed, 29 May 2019 10:38:30 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
 <CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4ff02295-6c34-791b-49f4-6558a92ad7a3@arm.com>
Date: Wed, 29 May 2019 18:38:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
Content-Language: en-GB
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMDUvMjAxOSAxNjowOSwgVG9tZXUgVml6b3NvIHdyb3RlOgo+IE9uIFR1ZSwgMjEgTWF5
IDIwMTkgYXQgMTg6MTEsIENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+IHdy
b3RlOgo+Pgo+IFtzbmlwXQo+PiBbICAzNDUuMjA0ODEzXSBwYW5mcm9zdCAxODAwMDAwLmdwdTog
bW11IGlycSBzdGF0dXM9MQo+PiBbICAzNDUuMjA5NjE3XSBwYW5mcm9zdCAxODAwMDAwLmdwdTog
VW5oYW5kbGVkIFBhZ2UgZmF1bHQgaW4gQVMwIGF0IFZBCj4+IDB4MDAwMDAwMDAwMjQwMDQwMAo+
IAo+ICBGcm9tIHdoYXQgSSBjYW4gc2VlIGhlcmUsIDB4MDAwMDAwMDAwMjQwMDQwMCBwb2ludHMg
dG8gdGhlIGZpcnN0IGJ5dGUKPiBvZiB0aGUgZmlyc3Qgc3VibWl0dGVkIGpvYiBkZXNjcmlwdG9y
Lgo+IAo+IFNvIG1hcHBpbmcgYnVmZmVycyBmb3IgdGhlIEdQVSBkb2Vzbid0IHNlZW0gdG8gYmUg
d29ya2luZyBhdCBhbGwgb24KPiA2NC1iaXQgVC03NjAuCj4gCj4gU3RldmVuLCBSb2JpbiwgZG8g
eW91IGhhdmUgYW55IGlkZWEgb2Ygd2h5IHRoaXMgY291bGQgYmU/CgpJIHRyaWVkIHJvbGxpbmcg
YmFjayB0byB0aGUgb2xkIHBhbmZyb3N0L25vbmRybSBzaGltLCBhbmQgaXQgd29ya3MgZmluZSAK
d2l0aCBrYmFzZSwgYW5kIEkgYWxzbyBmb3VuZCB0aGF0IFQtODIwIGZhbGxzIG92ZXIgaW4gdGhl
IGV4YWN0IHNhbWUgCm1hbm5lciwgc28gdGhlIGZhY3QgdGhhdCBpdCBzZWVtZWQgdG8gYmUgY29t
bW9uIHRvIHRoZSBzbWFsbGVyIDMzLWJpdCAKZGVzaWducyByYXRoZXIgdGhhbiBhbnl0aGluZyB0
byBkbyB3aXRoIHRoZSBvdGhlciAKam9iX2Rlc2NyaXB0b3Jfc2l6ZS92NC92NSBjb21wbGljYXRp
b24gdHVybmVkIG91dCB0byBiZSB0ZWxsaW5nLgoKWyBhcyBhbiBhc2lkZSwgYXJlIDY0LWJpdCBq
b2JzIGFjdHVhbGx5IGtub3duIG5vdCB0byB3b3JrIG9uIHY0IEdQVXMsIG9yIAppcyBpdCBqdXN0
IHRoYXQgbm9ib2R5J3MgeWV0IG9ic2VydmVkIGEgNjQtYml0IGJsb2IgZHJpdmluZyBvbmU/IF0K
Ckxvbmcgc3Rvcnkgc2hvcnQsIGl0IGFwcGVhcnMgdGhhdCAnTWFsaSBMUEFFJyBpcyBhbHNvIGxh
Y2tpbmcgdGhlIHN0YXJ0IApsZXZlbCBub3Rpb24gb2YgVk1TQSwgYW5kIGV4cGVjdHMgYSBmdWxs
IDQtbGV2ZWwgdGFibGUgZXZlbiBmb3IgPDQwIGJpdHMgCndoZW4gbGV2ZWwgMCBlZmZlY3RpdmVs
eSByZWR1bmRhbnQuIFRodXMgd2Fsa2luZyB0aGUgMy1sZXZlbCB0YWJsZSB0aGF0IAppby1wZ3Rh
YmxlIGNvbWVzIGJhY2sgd2l0aCBlbmRzIHVwIGdvaW5nIHdpbGRseSB3cm9uZy4gVGhlIGhhY2sg
YmVsb3cgCnNlZW1zIHRvIGRvIHRoZSBqb2IgZm9yIG1lOyBpZiBDbMOpbWVudCBjYW4gY29uZmly
bSAob24gVC03MjAgeW91J2xsIApzdGlsbCBuZWVkIHRoZSB1c2Vyc3BhY2UgaGFjayB0byBmb3Jj
ZSAzMi1iaXQgam9icyBhcyB3ZWxsKSB0aGVuIEkgdGhpbmsgCkknbGwgY29vayB1cCBhIHByb3Bl
ciByZWZhY3RvcmluZyBvZiB0aGUgYWxsb2NhdG9yIHRvIHB1dCB0aGluZ3MgcmlnaHQuCgpSb2Jp
bi4KCgotLS0tLT44LS0tLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1h
cm0uYyBiL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYwppbmRleCA1NDY5NjhkOGEzNDku
LmYyOWRhNmU4ZGMwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5j
CisrKyBiL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYwpAQCAtMTAyMywxMiArMTAyMywx
NCBAQCBhcm1fbWFsaV9scGFlX2FsbG9jX3BndGFibGUoc3RydWN0IAppb19wZ3RhYmxlX2NmZyAq
Y2ZnLCB2b2lkICpjb29raWUpCiAgCWlvcCA9IGFybV82NF9scGFlX2FsbG9jX3BndGFibGVfczEo
Y2ZnLCBjb29raWUpOwogIAlpZiAoaW9wKSB7CiAgCQl1NjQgbWFpciwgdHRicjsKKwkJc3RydWN0
IGFybV9scGFlX2lvX3BndGFibGUgKmRhdGEgPSBpb19wZ3RhYmxlX29wc190b19kYXRhKCZpb3At
Pm9wcyk7CgorCQlkYXRhLT5sZXZlbHMgPSA0OwogIAkJLyogQ29weSB2YWx1ZXMgYXMgdW5pb24g
ZmllbGRzIG92ZXJsYXAgKi8KICAJCW1haXIgPSBjZmctPmFybV9scGFlX3MxX2NmZy5tYWlyWzBd
OwogIAkJdHRiciA9IGNmZy0+YXJtX2xwYWVfczFfY2ZnLnR0YnJbMF07CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
