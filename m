Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC899E6C7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C21E899A7;
	Tue, 27 Aug 2019 11:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69072899A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:30:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0871228;
 Tue, 27 Aug 2019 04:30:38 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBA2C3F718;
 Tue, 27 Aug 2019 04:30:36 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] drm/panfrost: Add cache/TLB flush before switching
 address space
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190826223317.28509-1-robh@kernel.org>
 <20190826223317.28509-7-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <cbc50750-07c9-dd12-2a5f-96f7a4e0660c@arm.com>
Date: Tue, 27 Aug 2019 12:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190826223317.28509-7-robh@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDgvMjAxOSAyMzozMywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSXQncyBub3QgZW50aXJl
bHkgY2xlYXIgaWYgdGhpcyBpcyByZXF1aXJlZCwgYnV0IGFkZCBhIGZsdXNoIG9mIEdQVSBjYWNo
ZXMKPiBhbmQgVExCcyBiZWZvcmUgd2UgY2hhbmdlIGFuIGFkZHJlc3Mgc3BhY2UgdG8gbmV3IHBh
Z2UgdGFibGVzLgoKVGhpcyBtaWdodCB3b3JrIG91dCB0byBiZSBwYXJ0aWFsbHkgcmVkdW5kYW50
IHdpdGggc29tZSBvZiB0aGUgcmV2YW1wZWQgCmZsdXNoaW5nIGluICM3LCBidXQgdW5sZXNzIGl0
IHByb3ZlcyB0byBiZSBhIHBlcmZvcm1hbmNlIGJvdHRsZW5lY2ssIApoYXZpbmcgYm90aCBkb2Vz
IG1ha2UgdGhpbmdzIHNlZW0gbW9yZSByb2J1c3QgYW5kIGVhc2llciB0byByZWFzb24gYWJvdXQu
CgpSZXZpZXdlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KCj4gRml4
ZXM6IDcyODJmNzY0NWQwNiAoImRybS9wYW5mcm9zdDogSW1wbGVtZW50IHBlciBGRCBhZGRyZXNz
IHNwYWNlcyIpCj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFseXNzYSBS
b3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwgMiArKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IHYzOgo+ICAgLSBOZXcgcGF0Y2gKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gaW5kZXggMzQwN2IwMGQw
YTNhLi5kMWViZGUzMzI3ZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X21tdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X21tdS5jCj4gQEAgLTExNSw2ICsxMTUsOCBAQCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9tbXVfZW5h
YmxlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBzdHJ1Y3QgcGFuZnJvc3RfbQo+ICAg
CXU2NCB0cmFuc3RhYiA9IGNmZy0+YXJtX21hbGlfbHBhZV9jZmcudHJhbnN0YWI7Cj4gICAJdTY0
IG1lbWF0dHIgPSBjZmctPmFybV9tYWxpX2xwYWVfY2ZnLm1lbWF0dHI7Cj4gCj4gKwltbXVfaHdf
ZG9fb3BlcmF0aW9uX2xvY2tlZChwZmRldiwgYXNfbnIsIDAsIH4wVUwsIEFTX0NPTU1BTkRfRkxV
U0hfTUVNKTsKPiArCj4gICAJbW11X3dyaXRlKHBmZGV2LCBBU19UUkFOU1RBQl9MTyhhc19uciks
IHRyYW5zdGFiICYgMHhmZmZmZmZmZlVMKTsKPiAgIAltbXVfd3JpdGUocGZkZXYsIEFTX1RSQU5T
VEFCX0hJKGFzX25yKSwgdHJhbnN0YWIgPj4gMzIpOwo+IAo+IC0tCj4gMi4yMC4xCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
