Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3599B2C9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 16:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5546ECBA;
	Fri, 23 Aug 2019 14:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFE556ECBA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:56:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0D228;
 Fri, 23 Aug 2019 07:56:46 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DF263F718;
 Fri, 23 Aug 2019 07:56:41 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] drm/panfrost: Remove unnecessary flushing from
 tlb_inv_context
To: Rob Herring <robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-9-robh@kernel.org>
 <39a16722-9ab2-b7ca-1c28-dd733c1b193a@arm.com>
 <CAL_JsqKeUBUw3JmCyc5Ui5Ou_shmizyEzFA-UQ-zXHCsPDv0DQ@mail.gmail.com>
 <b45dc9fc-be55-ec91-74c4-dad5e2ed4917@arm.com>
 <CAL_JsqJgjdw9WVXYPtxA4F0B8NfXVQ00NWqcM_bW582QbQjp9w@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b55cc937-c5cf-3c7b-1cac-6d78ea9bdcab@arm.com>
Date: Fri, 23 Aug 2019 15:56:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJgjdw9WVXYPtxA4F0B8NfXVQ00NWqcM_bW582QbQjp9w@mail.gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAxNToyNiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMjMs
IDIwMTkgYXQgOTowNSBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90
ZToKPj4KPj4gT24gMjMvMDgvMjAxOSAxNDoxOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBPbiBG
cmksIEF1ZyAyMywgMjAxOSBhdCA3OjU2IEFNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFy
bS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcg
d3JvdGU6Cj4+Pj4+IHRsYl9pbnZfY29udGV4dCgpIGhvb2sgaXMgb25seSBjYWxsZWQgd2hlbiBm
cmVlaW5nIHRoZSBwYWdlIHRhYmxlcy4gVGhlcmUncwo+Pj4+PiBubyBwb2ludCBpbiBmbHVzaGlu
ZyBvbmx5IHRvIGZyZWUgdGhlIHBhZ2UgdGFibGVzIGltbWVkaWF0ZWx5IGZvbGxvd2luZy4KPj4+
Pgo+Pj4+IEZXSVcsIGluIGdlbmVyYWwgdGhlIHBvaW50IG9mIGZsdXNoaW5nIGlzICpiZWNhdXNl
KiB3ZSdyZSBhYm91dCB0byBmcmVlCj4+Pj4gdGhlIHBhZ2V0YWJsZXMgLSBpZiB0aGVyZSdzIGFu
eSBwb3NzaWJpbGl0eSB0aGF0IHRoZSBoYXJkd2FyZSBjb3VsZAo+Pj4+IGNvbnRpbnVlIHRvIGlz
c3VlIHRyYW5zbGF0aW9uIHRhYmxlIHdhbGtzIChzcGVjdWxhdGl2ZSBvciBvdGhlcndpc2UpCj4+
Pj4gYWZ0ZXIgdGhvc2UgcGFnZXMgaGF2ZSBiZWVuIHJldXNlZCBieSBzb21lb25lIGVsc2UsIFRM
QiBiYWRuZXNzIG1heSBlbnN1ZS4KPj4+Pgo+Pj4+IEZvciBwYW5mcm9zdCBpbiBwYXJ0aWN1bGFy
IEkgc3VzcGVjdCB3ZSBjYW4gcHJvYmFibHkgZ2V0IGF3YXkgd2l0aG91dAo+Pj4+IGl0LCBhdCBs
ZWFzdCBmb3IgdGhlIG1vbWVudCwgYnV0IGl0IG1pZ2h0IGJlIHdvcnRoIG1vdmluZyB0aGUgZmx1
c2ggdG8KPj4+PiBtbXVfZGlzYWJsZSgpIGZvciBjb21wbGV0ZSBwZWFjZSBvZiBtaW5kICh3aGlj
aCBraW5kIG9mIHByZWVtcHRzIHRoZQo+Pj4+IHNvcnQgb2YgdGhpbmcgdGhhdCBwZXItcHJvY2Vz
cyBBUyBzd2l0Y2hpbmcgd2lsbCB3YW50IGFueXdheSkuCj4+Pgo+Pj4gVGhlcmUncyBiaWdnZXIg
cHJvYmxlbSB0aGF0IG1tdV9kaXNhYmxlKCkgaXMgc3RpbGwgb25seSBjYWxsZWQgZm9yIEFTMAo+
Pj4gYW5kIG9ubHkgZm9yIGRyaXZlciB1bmxvYWQuCj4+Cj4+IFN1cmUsIGJ1dCBBUzAgaXMgdGhl
IG9ubHkgb25lIHdlIGV2ZXIgZW5hYmxlLCBhbmQgY29uY2VwdHVhbGx5IHdlIGRvCj4+IHRoYXQg
b25jZSBhdCBwcm9iZSB0aW1lIChBRkFJQ1MgaXQgc3RheXMgbm9taW5hbGx5IGxpdmUgdGhyb3Vn
aCByZXNldHMKPj4gYW5kIHJlc3VtZXMpLCBzbyB3aGlsZSBpdCBtYXkgYmUgdGhlIGxlYXN0LWNs
ZXZlciBBUyB1c2FnZSBwb3NzaWJsZSBpdCdzCj4+IGF0IGxlYXN0IHNlbGYtY29uc2lzdGVudC4g
QW5kIGF0IHRoZSBtb21lbnQgdGhlIG9ubHkgdGltZSB3ZSdsbCBjYWxsCj4+IC50bGJfaW52X2Nv
bnRleHQgaXMgZnJvbSBwYW5mcm9zdF9tbXVfZmluaSgpIHdoZW4gd2UncmUgdW5jb25kaXRpb25h
bGx5Cj4+IHBva2luZyByZWdpc3RlcnMgYW55d2F5LCBzbyBlaXRoZXIgd2F5IEkgZG9uJ3QgdGhp
bmsgdGhlcmUncyBhbnkgYWN0dWFsCj4+IHByb2JsZW0gdG9kYXkgLSBJJ20gdmlld2luZyB0aGlz
IHBhdGNoIGFzIGdldHRpbmcgdGhpbmdzIHN0cmFpZ2h0IGluCj4+IHByZXBhcmF0aW9uIGZvciB0
aGUgZnV0dXJlLgo+IAo+IEl0IHdhcyBvbmx5IEFTMCwgYnV0IHdlIG5vdyBoYXZlIHBlciBGRCBB
Uy4KCkFoLCBzaWxseSBtZSwgSSBmb3Jnb3QgdG8gbG9vayBhdCAtbmV4dC4uLgoKPj4+IEkgZ3Vl
c3Mgd2Ugc2hvdWxkIGZpeCB0aGF0IGFuZCB0aGVuIGZpZ3VyZQo+Pj4gb3V0IHdoZXJlIGEgZmx1
c2ggaXMgbmVlZGVkIGlmIGF0IGFsbC4gSSB3b3VsZCB0aGluayBjaGFuZ2luZyB0aGUgVFRCUgo+
Pj4gd291bGQgYmUgZW5vdWdoIHRvIHF1aWVzY2UgdGhlIGgvdyBhbmQgVExCcy4gVGhhdCBzZWVt
cyB0byBiZSB0aGUgY2FzZQo+Pj4gaW4gbXkgdGVzdGluZyBvZiBzd2l0Y2hpbmcgYWRkcmVzcyBz
cGFjZXMuCj4+Cj4+ICAgRnJvbSBhIHF1aWNrIHNjYW4gdGhyb3VnaCBrYmFzZSwga2Jhc2VfbW11
X2Rpc2FibGUoKSBhcHBlYXJzIHRvIHBlcmZvcm0KPj4gYW4gZnVsbCBGTFVTSF9NRU0gYmVmb3Jl
IHJld3JpdGluZyBUUkFOU1RBQiwgYW5kIGl0IGxvb2tzIGxpa2UgdGhhdCBkb2VzCj4+IGdldCBj
YWxsZWQgd2hlbiBzY2hlZHVsaW5nIG91dCBhIGNvbnRleHQuIFRoYXQncyBpbiBsaW5lIHdpdGgg
d2hhdCBJIHdhcwo+PiBpbWFnaW5pbmcsIHNvIHVubGVzcyB3ZSBrbm93IGJldHRlciBmb3Igc3Vy
ZSwgd2UgbWF5IGFzIHdlbGwgcGxheSBpdAo+PiBzYWZlIGFuZCBmb2xsb3cgdGhlIHNhbWUgcGF0
dGVybi4KPiAKPiBBZ3JlZWQuCgpJIGd1ZXNzIGluIHRoYXQgY2FzZSB3ZSBwcm9iYWJseSB3YW50
IGl0IGluIHBhbmZyb3N0X21tdV9hc19wdXQoKSB3aGVuIAphc19jb3VudCBmYWxscyB0byAwLCB0
byBiYWxhbmNlIHRoZSBjb3JyZXNwb25kaW5nIGVuYWJsZSBpbiBhc19nZXQoKS4gSWYgCnRoZSB0
YWJsZXMgYXJlIG9ubHkgZnJlZWQgbGF0ZXIgd2hlbiB0aGUgRkQgaXMgY2xvc2VkIGFuZCB3aGlj
aGV2ZXIgQVMgCmlzIHByb2JhYmx5IGluIHVzZSBieSBzb21lIG90aGVyIGpvYiwgdGhhdCdzIGV2
ZW4gbW9yZSByZWFzb24gdGhhdCAKLnRsYl9pbnZfY29udGV4dCBpcyBub3cgdGhlIHdyb25nIHBs
YWNlIHRvIGJlIHRvdWNoaW5nIGhhcmR3YXJlLgoKUm9iaW4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
