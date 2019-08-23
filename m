Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD9C9B00A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 14:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187026E071;
	Fri, 23 Aug 2019 12:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ACB76E071
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 12:56:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7007337;
 Fri, 23 Aug 2019 05:56:14 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669A53F718;
 Fri, 23 Aug 2019 05:56:12 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] drm/panfrost: Remove unnecessary flushing from
 tlb_inv_context
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-9-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <39a16722-9ab2-b7ca-1c28-dd733c1b193a@arm.com>
Date: Fri, 23 Aug 2019 13:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190823021216.5862-9-robh@kernel.org>
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
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gdGxiX2ludl9jb250ZXh0
KCkgaG9vayBpcyBvbmx5IGNhbGxlZCB3aGVuIGZyZWVpbmcgdGhlIHBhZ2UgdGFibGVzLiBUaGVy
ZSdzCj4gbm8gcG9pbnQgaW4gZmx1c2hpbmcgb25seSB0byBmcmVlIHRoZSBwYWdlIHRhYmxlcyBp
bW1lZGlhdGVseSBmb2xsb3dpbmcuCgpGV0lXLCBpbiBnZW5lcmFsIHRoZSBwb2ludCBvZiBmbHVz
aGluZyBpcyAqYmVjYXVzZSogd2UncmUgYWJvdXQgdG8gZnJlZSAKdGhlIHBhZ2V0YWJsZXMgLSBp
ZiB0aGVyZSdzIGFueSBwb3NzaWJpbGl0eSB0aGF0IHRoZSBoYXJkd2FyZSBjb3VsZCAKY29udGlu
dWUgdG8gaXNzdWUgdHJhbnNsYXRpb24gdGFibGUgd2Fsa3MgKHNwZWN1bGF0aXZlIG9yIG90aGVy
d2lzZSkgCmFmdGVyIHRob3NlIHBhZ2VzIGhhdmUgYmVlbiByZXVzZWQgYnkgc29tZW9uZSBlbHNl
LCBUTEIgYmFkbmVzcyBtYXkgZW5zdWUuCgpGb3IgcGFuZnJvc3QgaW4gcGFydGljdWxhciBJIHN1
c3BlY3Qgd2UgY2FuIHByb2JhYmx5IGdldCBhd2F5IHdpdGhvdXQgCml0LCBhdCBsZWFzdCBmb3Ig
dGhlIG1vbWVudCwgYnV0IGl0IG1pZ2h0IGJlIHdvcnRoIG1vdmluZyB0aGUgZmx1c2ggdG8gCm1t
dV9kaXNhYmxlKCkgZm9yIGNvbXBsZXRlIHBlYWNlIG9mIG1pbmQgKHdoaWNoIGtpbmQgb2YgcHJl
ZW1wdHMgdGhlIApzb3J0IG9mIHRoaW5nIHRoYXQgcGVyLXByb2Nlc3MgQVMgc3dpdGNoaW5nIHdp
bGwgd2FudCBhbnl3YXkpLgoKUm9iaW4uCgo+IFRoZXJlIGlzIGFsc28gYSBwcm9ibGVtIHRoYXQg
d2UgY291bGQgYmUgYWNjZXNzaW5nIHRoZSBoL3cgd2hlbiBzdXNwZW5kZWQuCj4gCj4gQ2M6IFRv
bWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IFN0ZXZlbiBQcmlj
ZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eu
cm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2Zm
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IHYyOiBuZXcgcGF0Y2gK
PiAKPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDYgKy0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+IGluZGV4IGNjZjY3MWE5YzNm
Yi4uOWY4NTI3NWE4OTZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9t
bXUuYwo+IEBAIC0zMjgsMTEgKzMyOCw3IEBAIHZvaWQgcGFuZnJvc3RfbW11X3VubWFwKHN0cnVj
dCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgbW11
X3RsYl9pbnZfY29udGV4dF9zMSh2b2lkICpjb29raWUpCj4gLXsKPiAtCXN0cnVjdCBwYW5mcm9z
dF9maWxlX3ByaXYgKnByaXYgPSBjb29raWU7Cj4gLQo+IC0JbW11X2h3X2RvX29wZXJhdGlvbihw
cml2LT5wZmRldiwgJnByaXYtPm1tdSwgMCwgfjBVTCwgQVNfQ09NTUFORF9GTFVTSF9NRU0pOwo+
IC19Cj4gK3t9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIG1tdV90bGJfaW52X3JhbmdlX25vc3luYyh1
bnNpZ25lZCBsb25nIGlvdmEsIHNpemVfdCBzaXplLAo+ICAgCQkJCSAgICAgc2l6ZV90IGdyYW51
bGUsIGJvb2wgbGVhZiwgdm9pZCAqY29va2llKQo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
