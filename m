Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E993F1A6934
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 17:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03F48924B;
	Mon, 13 Apr 2020 15:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 910748924B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 15:55:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 022341FB;
 Mon, 13 Apr 2020 08:55:09 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C73EA3F68F;
 Mon, 13 Apr 2020 08:55:07 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
Date: Mon, 13 Apr 2020 16:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
Content-Language: en-GB
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDQvMjAyMCAxNTozMSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IE1vbiwgMTMgQXByIDIwMjAgYXQgMTY6MTgsIENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBn
bWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBTdGV2ZW4sCj4+Cj4+IE9uIE1vbiwgMTMgQXByIDIw
MjAgYXQgMTU6MTgsIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+IHdyb3RlOgo+
Pj4KPj4+IE9uIDExLzA0LzIwMjAgMjE6MDYsIENsw6ltZW50IFDDqXJvbiB3cm90ZToKPj4+PiBP
UFAgdGFibGUgY2FuIGRlZmluZWQgYm90aCBmcmVxdWVuY3kgYW5kIHZvbHRhZ2UuCj4+Pj4KPj4+
PiBSZWdpc3RlciB0aGUgbWFsaSByZWd1bGF0b3IgaWYgaXQgZXhpc3QuCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgo+Pj4+IC0t
LQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAz
NCArKysrKysrKysrKysrKysrKystLS0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2aWNlLmggIHwgIDEgKwo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+Pj4+IGluZGV4IDYyNTQxZjRlZGQ4MS4uMmRjOGUy
MzU1MzU4IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZGV2ZnJlcS5jCj4+Pj4gQEAgLTc4LDEyICs3OCwyNiBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9p
bml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+Pj4+ICAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGZkZXYtPnBkZXYtPmRldjsKPj4+PiAgICAgICAgc3RydWN0IGRldmZyZXEg
KmRldmZyZXE7Cj4+Pj4gICAgICAgIHN0cnVjdCB0aGVybWFsX2Nvb2xpbmdfZGV2aWNlICpjb29s
aW5nOwo+Pj4+ICsgICAgIGNvbnN0IGNoYXIgKm1hbGkgPSAibWFsaSI7Cj4+Pj4gKyAgICAgc3Ry
dWN0IG9wcF90YWJsZSAqb3BwX3RhYmxlID0gTlVMTDsKPj4+PiArCj4+Pj4gKyAgICAgLyogUmVn
dWxhdG9yIGlzIG9wdGlvbmFsICovCj4+Pj4gKyAgICAgb3BwX3RhYmxlID0gZGV2X3BtX29wcF9z
ZXRfcmVndWxhdG9ycyhkZXYsICZtYWxpLCAxKTsKPj4+Cj4+PiBUaGlzIGxvb2tzIGxpa2UgaXQg
YXBwbGllcyBiZWZvcmUgM2UxMzk5YmNjZjUxICgiZHJtL3BhbmZyb3N0OiBBZGQKPj4+IHN1cHBv
cnQgZm9yIG11bHRpcGxlIHJlZ3VsYXRvcnMiKSB3aGljaCBpcyBjdXJyZW50bHkgaW4gZHJtLW1p
c2MtbmV4dAo+Pj4gKGFuZCBsaW51eC1uZXh0KS4gWW91IHdhbnQgc29tZXRoaW5nIG1vcmUgbGlr
ZToKPj4KPj4gVGhhbmtzIGZvciB5b3UgcmV2aWV3LCBpbmRlZWQgSSBkaWRuJ3Qgc2VlIHRoYXQg
bXVsdGlwbGUgcmVndWxhdG9ycwo+PiBzdXBwb3J0IGhhcyBiZWVuIGFkZGVkLgo+PiBXaWxsIHVw
ZGF0ZSBpbiB2Mi4KPj4KPj4+Cj4+PiAgICAgICBvcHBfdGFibGUgPSBkZXZfcG1fb3BwX3NldF9y
ZWd1bGF0b3JzKGRldiwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGZkZXYtPmNvbXAtPnN1cHBseV9uYW1lcywKPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGZkZXYtPmNvbXAtPm51bV9zdXBwbGllcyk7Cj4+Pgo+
Pj4gT3RoZXJ3aXNlIGEgcGxhdGZvcm0gd2l0aCBtdWx0aXBsZSByZWd1bGF0b3JzIHdvbid0IHdv
cmsgY29ycmVjdGx5Lgo+Pj4KPj4+IEFsc28gcnVubmluZyBvbiBteSBmaXJlZmx5IChSSzMyODgp
IGJvYXJkIEkgZ2V0IHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPj4+Cj4+PiAgICAgIGRlYnVnZnM6
IERpcmVjdG9yeSAnZmZhMzAwMDAuZ3B1LW1hbGknIHdpdGggcGFyZW50ICd2ZGRfZ3B1JyBhbHJl
YWR5Cj4+PiBwcmVzZW50IQo+Pj4KPj4+IFRoaXMgaXMgZHVlIHRvIHRoZSByZWd1bGF0b3IgZGVi
dWdmcyBlbnRyaWVzIGdldHRpbmcgY3JlYXRlZCB0d2ljZSAob25jZQo+Pj4gaW4gcGFuZnJvc3Rf
cmVndWxhdG9yX2luaXQoKSBhbmQgb25jZSBoZXJlKS4KPj4KPj4gSXMgaXQgYSB3YXJuaW5nIHRo
YXQgc2hvdWxkIGJlIGNvbnNpZGVyIGFzIGFuIGVycm9yPyBMb29rJ3MgbW9yZSBhbiBpbmZvIG5v
Pwo+PiBXaGF0IHNob3VsZCBiZSB0aGUgY29ycmVjdCBiZWhhdmlvciBpZiBhIGRldmljZSB3YW50
IHRvIHJlZ2lzdGVyIHR3bwo+PiB0aW1lcyB0aGUgc2FtZSByZWd1bGF0b3I/Cj4gCj4gT3Igd2Ug
Y2FuIGNoYW5nZSB0aGUgbmFtZSBmcm9tIHZkZF9YWFggdG8gb3BwX3ZkZF9YWFggPwo+IGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9vcHAvZGVi
dWdmcy5jI0w0NQoKWWVzLCBJJ20gbm90IHN1cmUgdGhhdCBpdCdzIGFjdHVhbGx5IGEgcHJvYmxl
bSBpbiBwcmFjdGljZS4gQW5kIGl0IG1heSAKd2VsbCBiZSBjb3JyZWN0IHRvIGNoYW5nZSB0aGlz
IGluIHRoZSBnZW5lcmljIGNvZGUgcmF0aGVyIHRoYW4gdHJ5IHRvIAp3b3JrIGFyb3VuZCBpdCBp
biBQYW5mcm9zdC4gQnV0IHdlIHNob3VsZG4ndCBzcGFtIHRoZSB1c2VyIHdpdGggd2FybmluZ3Mg
CmFzIHRoYXQgbWFrZXMgcmVhbCBpc3N1ZXMgaGFyZGVyIHRvIHNlZS4KCllvdXIgc3VnZ2VzdGlv
biB0byBjaGFuZ2UgdGhlIG5hbWUgc2VlbXMgcmVhc29uYWJsZSB0byBtZSwgYnV0IEkgZG9uJ3Qg
CmZ1bGx5IHVuZGVyc3RhbmQgdGhlIG9wcCBjb2RlLCBzbyB3ZSdkIG5lZWQgc29tZSByZXZpZXcg
ZnJvbSB0aGUgT1BQIAptYWludGFpbmVycy4gSG9wZWZ1bGx5IFZpcmVzaCwgTmlzaGFudGggb3Ig
U3RlcGhlbiBjYW4gcHJvdmlkZSBzb21lIGluc2lnaHQuCgpTdGV2ZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
