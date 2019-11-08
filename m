Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F381F5048
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 16:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336A36F9DE;
	Fri,  8 Nov 2019 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4D456F9DE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 15:55:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE4546A;
 Fri,  8 Nov 2019 07:55:26 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A09F3F71A;
 Fri,  8 Nov 2019 07:55:25 -0800 (PST)
Subject: Re: [PATCH 4/5] drm/panfrost: remove DRM_AUTH and respective comment
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-4-emil.l.velikov@gmail.com>
 <d652ceaa-2c64-31f0-1793-14a5de51dc57@arm.com>
 <CACvgo52zMar0q1CPNd0UnBFU3AZt-m1v7ZKaP0y3p6bSJ6LxFQ@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <8a392fc2-20e2-11cf-e06e-b66723a10b86@arm.com>
Date: Fri, 8 Nov 2019 15:55:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACvgo52zMar0q1CPNd0UnBFU3AZt-m1v7ZKaP0y3p6bSJ6LxFQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMTEvMjAxOSAxMzoxMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+IE9uIEZyaSwgMSBOb3Yg
MjAxOSBhdCAxMzozNCwgU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIDAxLzExLzIwMTkgMTM6MDMsIEVtaWwgVmVsaWtvdiB3cm90ZToKPj4+IEZyb206
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4+Pgo+Pj4gQXMgb2Yg
ZWFybGllciBjb21taXQgd2UgaGF2ZSBhZGRyZXNzIHNwYWNlIHNlcGFyYXRpb24uIFlldCB3ZSBm
b3Jnb3QgdG8KPj4+IHJlbW92ZSB0aGUgcmVzcGVjdGl2ZSBjb21tZW50IGFuZCBEUk1fQVVUSCBp
biB0aGUgaW9jdGwgZGVjbGFyYXRpb24uCj4+Pgo+Pj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUu
dml6b3NvQGNvbGxhYm9yYS5jb20+Cj4+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4+IENjOiBSb2Jp
biBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+Pj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+Cj4+PiBGaXhlczogNzI4MmY3NjQ1ZDA2ICgiZHJtL3BhbmZyb3N0
OiBJbXBsZW1lbnQgcGVyIEZEIGFkZHJlc3Mgc3BhY2VzIikKPj4+IFNpZ25lZC1vZmYtYnk6IEVt
aWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5
OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+Pgo+PiBJJ20gbm90IHN1cmUg
RFJNX0FVVEggcHJvdmlkZWQgdXMgd2l0aCBtdWNoIGluIHRoZSBmaXJzdCBwbGFjZSAoYmVjYXVz
ZQo+PiByZW5kZXIgbm9kZXMgY291bGQgc25vb3AvYWZmZWN0IHRoZSBwcmltYXJ5IG5vZGUpLCBi
dXQgc2luY2Ugd2UgaGF2ZQo+PiBhZGRyZXNzIHNwYWNlIHNlcGFyYXRpb24gaXQncyBjbGVhcmx5
IG5vdCByZXF1aXJlZCBub3cuCj4+Cj4gVGhhbmtzIFN0ZXZlLiBUaGlzIGlzIGV4YWN0bHkgdGhl
IHJlYXNvbiB3aHkgSSByZW1vdmVkIGl0IGZyb20gbW9zdAo+IG90aGVyIGRyaXZlcnMuCj4gVGhl
cmUgYXJlIGVxdWl2YWxlbnQgdm13Z2Z4IGNoYW5nZXMgYW5kIGEgRFJNIGNvcmUgcGF0Y2ggaW4g
dGhpcyBzZXJpZXMuCj4gCj4gRG8geW91IHRoaW5rIHlvdSdsbCBoYXZlIHNvbWUgdGltZSB0byBj
aGVjayB0aG9zZSBvdmVyPyBXb3VsZCBiZQo+IGFtYXppbmcgaWYgSSBjYW4gYXBwbHkgdGhlIGxv
dCBpbiBvbmUgZ28gdG8gZHJtLW1pc2MuCgpJJ20gYWZyYWlkIEkgZG9uJ3Qga25vdyBlbm91Z2gg
YWJvdXQgdGhlIHNlY3VyaXR5IG1vZGVsIG9mIHZtd2dmeCB0bwptZWFuaW5nZnVsbHkgY29tbWVu
dCBvbiB0aG9zZSBjaGFuZ2VzLiBPbiB0aGUgc3VyZmFjZSB0aGV5IGxvb2sgZmluZSwKYnV0IGl0
IHJlYWxseSBuZWVkcyBzb21lb25lIHdobyB1bmRlcnN0YW5kcyB3aGV0aGVyIHRoaXMgZXhwb3Nl
cyBhbgphdHRhY2sgc3VyZmFjZS4KClRoZSBEUk0gY29yZSBwYXRjaCBjb25jZXJucyBtZSBzbGln
aHRseSAoYWx0aG91Z2ggYWdhaW4gSSdtIG5vdApjb21wbGV0ZWx5IHVwIHRvIHNwZWVkIG9uIHRo
ZSBzZWN1cml0eSBtb2RlIGhlcmUpLiBGb3IgYSBkZXZpY2Ugd2hpY2gKZG9lc24ndCBoYXZlIGFk
ZHJlc3Mgc3BhY2Ugc2VwYXJhdGlvbiAoYW5kIGRvZXNuJ3Qgc3VwcG9ydCByZW5kZXIKbm9kZXMp
LCBpcyB0aGVyZSBhbnl0aGluZyBzdG9wcGluZyBhIHByb2Nlc3Mgd2hpY2ggaGFzbid0IGF1dGhl
bnRpY2F0ZWQKY29udmVydGluZyBhbm90aGVyIHByb2Nlc3MncyBoYW5kbGUgdG8gYSBwcmltZSBm
ZD8gKG9yIGluamVjdGluZyBkbWFidWZzCmludG8gdGhlIGFkZHJlc3Mgc3BhY2UgdXNlZCBieSB0
aGUgYXV0aGVudGljYXRlZCBwcm9jZXNzIC0gd2hpY2ggbWlnaHQKY2F1c2UgYWRkcmVzcyBzcGFj
ZSBleGhhdXN0aW9uKS4gSWYgdGhhdCdzIG5vdCBhIGNvbmNlcm4gdGhlbiBJJ20gbm90CnN1cmUg
d2h5IHRoZSBpb2N0bHMgd2VyZSBvcmlnaW5hbGx5IGFkZGVkIHdpdGggRFJNX0FVVEguLi4KClN0
ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
