Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46B0AA5A1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 16:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE078922B;
	Thu,  5 Sep 2019 14:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE7C891D5;
 Thu,  5 Sep 2019 14:19:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 07:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="212795299"
Received: from rweigelx-mobl1.ger.corp.intel.com (HELO [10.252.40.21])
 ([10.252.40.21])
 by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2019 07:19:35 -0700
Subject: Re: [PATCH 1/3] drm/atomic: Take the atomic toys away from X
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ed222af0-4d87-88eb-1de0-4020a7cf6cf3@linux.intel.com>
Date: Thu, 5 Sep 2019 16:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMDMtMDktMjAxOSBvbSAyMTowNiBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gVGhlIC1tb2Rl
c2V0dGluZyBkZHggaGFzIGEgdG90YWxseSBicm9rZW4gaWRlYSBvZiBob3cgYXRvbWljIHdvcmtz
Ogo+IC0gZG9lc24ndCBkaXNhYmxlIG9sZCBjb25uZWN0b3JzLCBhc3N1bWluZyB0aGV5IGdldCBh
dXRvLWRpc2FibGUgbGlrZQo+ICAgd2l0aCB0aGUgbGVnYWN5IHNldGNydGMKPiAtIGFzc3VtZXMg
QVNZTkNfRkxJUCBpcyB3aXJlZCB0aHJvdWdoIGZvciB0aGUgYXRvbWljIGlvY3RsCj4gLSBub3Qg
YSBzaW5nbGUgY2FsbCB0byBURVNUX09OTFkKPgo+IElvdyB0aGUgaW1wbGVtZW50YXRpb24gaXMg
YSAxOjEgdHJhbnNsYXRpb24gb2YgbGVnYWN5IGlvY3RscyB0bwo+IGF0b21pYywgd2hpY2ggaXMg
YSkgYnJva2VuIGIpIHBvaW50bGVzcy4KPgo+IFdlIGFscmVhZHkgaGF2ZSBidWdzIGluIGJvdGgg
aTkxNSBhbmQgYW1kZ3B1LURDIHdoZXJlIHRoaXMgcHJldmVudHMgdXMKPiBmcm9tIGVuYWJsaW5n
IG5lYXQgZmVhdHVyZXMuCj4KPiBJZiBhbnlvbmUgZXZlciBjYXJlcyBhYm91dCBhdG9taWMgaW4g
WCB3ZSBjYW4gZWFzaWx5IGFkZCBhIG5ldyBhdG9taWMKPiBsZXZlbCAocmVxLT52YWx1ZSA9PSAy
KSBmb3IgWCB0byBnZXQgYmFjayB0aGUgc2hpbnkgdG95cy4KPgo+IFNpbmNlIHRoZXNlIGJyb2tl
biB2ZXJzaW9ucyBvZiAtbW9kZXNldHRpbmcgaGF2ZSBiZWVuIHNoaXBwaW5nLAo+IHRoZXJlJ3Mg
cmVhbGx5IG5vIG90aGVyIHdheSB0byBnZXQgb3V0IG9mIHRoaXMgYmluZC4KPgo+IFJlZmVyZW5j
ZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvaXNzdWVzLzYy
OQo+IFJlZmVyZW5jZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2
ZXIvbWVyZ2VfcmVxdWVzdHMvMTgwCj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgo+IENj
OiBBZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0LmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMg
fCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0
bC5jCj4gaW5kZXggMmMxMjBjNThmNzJkLi4xY2I3YjRjM2M4N2MgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9pb2N0bC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0
bC5jCj4gQEAgLTMzNCw2ICszMzQsOSBAQCBkcm1fc2V0Y2xpZW50Y2FwKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQo+ICAJCWZp
bGVfcHJpdi0+dW5pdmVyc2FsX3BsYW5lcyA9IHJlcS0+dmFsdWU7Cj4gIAkJYnJlYWs7Cj4gIAlj
YXNlIERSTV9DTElFTlRfQ0FQX0FUT01JQzoKPiArCQkvKiBUaGUgbW9kZXNldHRpbmcgRERYIGhh
cyBhIHRvdGFsbHkgYnJva2VuIGlkZWEgb2YgYXRvbWljLiAqLwo+ICsJCWlmIChzdHJzdHIoY3Vy
cmVudC0+Y29tbSwgIlgiKSkKPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAJCWlmICghZHJt
X2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9BVE9NSUMpKQo+ICAJCQlyZXR1cm4gLUVP
UE5PVFNVUFA7Cj4gIAkJaWYgKHJlcS0+dmFsdWUgPiAxKQoKR29vZCByaWRkYW5jZSEKCk1pc3Np
bmcgb25lIG1vcmU6CmNvbW1pdCBhYmJjMDY5N2Q1ZmJmNTNmNzRjZTBiY2JlOTM2NjcwMTk5NzY0
Y2ZhCkF1dGhvcjogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KRGF0ZTrCoMKgIFdl
ZCBBcHIgMjQgMTY6MzM6MjkgMjAxOSArMTAwMAoKwqDCoMKgIGRybS9mYjogcmV2ZXJ0IHRoZSBp
OTE1IEFjdHVhbGx5IGNvbmZpZ3VyZSB1bnRpbGVkIGRpc3BsYXlzIGZyb20gbWFzdGVyCsKgwqDC
oArCoMKgwqAgVGhpcyBjb2RlIG1vdmVkIGluIGhlcmUgaW4gbWFzdGVyLCBzbyByZXZlcnQgaXQg
dGhlIHNhbWUgd2F5LgrCoMKgwqAKwqDCoMKgIFRoaXMgaXMgdGhlIHNhbWUgcmV2ZXJ0IGFzIDlm
YTI0NjI1NmUwOSAoIlJldmVydCAiZHJtL2k5MTUvZmJkZXY6CsKgwqDCoCBBY3R1YWxseSBjb25m
aWd1cmUgdW50aWxlZCBkaXNwbGF5cyIiKSBpbiBkcm0tZml4ZXMuCsKgwqDCoArCoMKgwqAgU2ln
bmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkNhbiB3ZSB1bnJl
dmVydCB0aGF0IG5vdz8KCldpdGggdGhhdCBmaXhlZCwgb24gdGhlIHdob2xlIHNlcmllczoKClJl
dmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
