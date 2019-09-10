Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5A2AEF9D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 18:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BC56E129;
	Tue, 10 Sep 2019 16:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 237F16E129;
 Tue, 10 Sep 2019 16:34:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CA321000;
 Tue, 10 Sep 2019 09:34:23 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6204C3F71F;
 Tue, 10 Sep 2019 09:34:19 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] iommu: handle drivers that manage iommu directly
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org
References: <20190906214409.26677-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c43de10f-7768-592c-0fd8-6fb64b3fd43e@arm.com>
Date: Tue, 10 Sep 2019 17:34:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190906214409.26677-1-robdclark@gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bruce Wang <bzwang@chromium.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Allison Randal <allison@lohutok.net>, Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDkvMjAxOSAyMjo0NCwgUm9iIENsYXJrIHdyb3RlOgo+IEZyb206IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBPbmUgb2YgdGhlIGNoYWxsZW5nZXMgd2UgaGF2
ZSB0byBlbmFibGUgdGhlIGFhcmNoNjQgbGFwdG9wcyB1cHN0cmVhbQo+IGlzIGRlYWxpbmcgd2l0
aCB0aGUgZmFjdCB0aGF0IHRoZSBib290bG9hZGVyIGVuYWJsZXMgdGhlIGRpc3BsYXkgYW5kCj4g
dGFrZXMgdGhlIGNvcnJlc3BvbmRpbmcgU01NVSBjb250ZXh0LWJhbmsgb3V0IG9mIEJZUEFTUy4g
IFVuZm9ydHVuYXRlbHksCj4gY3VycmVudGx5LCB0aGUgSU9NTVUgZnJhbWV3b3JrIGF0dGFjaGVz
IGEgRE1BIChvciBwb3RlbnRpYWxseSBhbgo+IElERU5USVRZKSBkb21haW4gYmVmb3JlIHRoZSBk
cml2ZXIgaXMgcHJvYmVkIGFuZCBoYXMgYSBjaGFuY2UgdG8KPiBpbnRlcnZlbmUgYW5kIHNodXRk
b3duIHNjYW5vdXQuICBXaGljaCBtYWtlcyB0aGluZ3MgZ28gaG9ycmlibHkgd3JvbmcuCgpOb3Bl
LCB0aGluZ3MgYWxyZWFkeSB3ZW50IGhvcnJpYmx5IHdyb25nIGluIGFybV9zbW11X2RldmljZV9y
ZXNldCgpIC0gCnN1cmUsIHNvbWV0aW1lcyBmb3Igc29tZSBjb25maWd1cmF0aW9ucyBpdCBtaWdo
dCAqc2VlbSogbGlrZSB0aGV5IGRpZG4ndCAKYW5kIHRoYXQgeW91IGNhbiBmdWRnZSB0aGUgY29u
dGV4dCBiYW5rIHN0YXRlIGF0IGFybSdzIGxlbmd0aCBmcm9tIGNvcmUgCmNvZGUgbGF0ZXIsIGJ1
dCB0aGUgdHJ1dGggaXMgdGhhdCBpbXBsLT5jZmdfcHJvYmUgaXMgeW91ciBsYXN0IGNoYW5jZSB0
byAKZ3VhcmFudGVlIHRoYXQgYW55IG5lY2Vzc2FyeSBTTU1VIHN0YXRlIGlzIHByZXNlcnZlZC4K
ClRoZSByZW1haW5kZXIgb2YgdGhlIHByb2JsZW0gaW52b2x2ZXMgcmV3b3JraW5nIGRlZmF1bHQg
ZG9tYWluIAphbGxvY2F0aW9uIHN1Y2ggdGhhdCB3ZSBjYW4gY29udmVyZ2Ugb24gd2hhdCBpb21t
dV9yZXF1ZXN0X2RtX2Zvcl9kZXYoKSAKY3VycmVudGx5IGRvZXMgYnV0IHdpdGhvdXQgdGhlIG1v
bWVudGFyeSBhdHRhY2htZW50IHRvIGEgdHJhbnNsYXRpb24gCmRvbWFpbiB0byBjYXVzZSBoaWNj
dXBzLiBUaGF0J3Mgc3RhcnRpbmcgaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWlvbW11L2NvdmVyLjE1NjYzNTM1MjEuZ2l0LnNhaS5wcmFuZWV0aC5wcmFraHlhQGludGVsLmNv
bS8KCj4gQnV0IGluIHRoaXMgY2FzZSwgZHJtL21zbSBpcyBhbHJlYWR5IGRpcmVjdGx5IG1hbmFn
aW5nIGl0J3MgSU9NTVVzCj4gZGlyZWN0bHksIHRoZSBETUEgQVBJIGF0dGFjaGVkIGlvbW11X2Rv
bWFpbiBzaW1wbHkgZ2V0cyBpbiB0aGUgd2F5Lgo+IFRoaXMgc2VyaWVzIGFkZHMgYSB3YXkgdGhh
dCBhIGRyaXZlciBjYW4gaW5kaWNhdGUgdG8gZHJpdmVycy9pb21tdQo+IHRoYXQgaXQgZG9lcyBu
b3Qgd2lzaCB0byBoYXZlIGFuIERNQSBtYW5hZ2VkIGlvbW11X2RvbWFpbiBhdHRhY2hlZC4KPiBU
aGlzIHdheSwgZHJtL21zbSBjYW4gc2h1dCBkb3duIHNjYW5vdXQgY2xlYW5seSBiZWZvcmUgYXR0
YWNoaW5nIGl0J3MKPiBvd24gaW9tbXVfZG9tYWluLgo+IAo+IE5PVEUgdGhhdCB0byBnZXQgdGhp
bmdzIHdvcmtpbmcgd2l0aCBhcm0tc21tdSBvbiB0aGUgYWFyY2g2NCBsYXB0b3BzLAo+IHlvdSBh
bHNvIG5lZWQgYSBwYXRjaHNldFsxXSBmcm9tIEJqb3JuIEFuZGVyc3NvbiB0byBpbmhlcml0IFNN
TVUgY29uZmlnCj4gYXQgYm9vdCwgd2hlbiBpdCBpcyBhbHJlYWR5IGVuYWJsZWQuCj4gCj4gWzFd
IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2FybS1rZXJuZWwvbXNnNzMyMjQ2Lmh0bWwK
PiAKPiBOT1RFIHRoYXQgaW4gZGlzY3Vzc2lvbiBvZiBwcmV2aW91cyByZXZpc2lvbnMsIFJNUlIg
Y2FtZSB1cC4gIFRoaXMgaXMKPiBub3QgcmVhbGx5IGEgcmVwbGFjZW1lbnQgZm9yIFJNUlIgKG5v
ciBkb2VzIFJNUlIgcmVhbGx5IHByb3ZpZGUgYW55Cj4gbW9yZSBpbmZvcm1hdGlvbiB0aGFuIHdl
IGFscmVhZHkgZ2V0IGZyb20gRUZJIEdPUCwgb3IgRFQgaW4gdGhlCj4gc2ltcGxlZmIgY2FzZSku
ICBJIGFsc28gZG9uJ3Qgc2VlIGhvdyBSTVJSIGNvdWxkIGhlbHAgdy8gU01NVSBoYW5kb3Zlcgo+
IG9mIENCL1NNUiBjb25maWcgKEJqb3JuJ3MgcGF0Y2hzZXRbMV0pIHdpdGhvdXQgZGVmaW5pbmcg
bmV3IHRhYmxlcy4KClRoZSBwb2ludCBvZiBSTVJSLWxpa2UtdGhpbmdzIGlzIHRoYXQgdGhleSBp
ZGVudGlmeSBub3QganVzdCB0aGUgbWVtb3J5IApyZWdpb24gYnV0IGFsc28gdGhlIHNwZWNpZmlj
IGRldmljZSBhY2Nlc3NpbmcgdGhlbSwgd2hpY2ggbWVhbnMgdGhlIApJT01NVSBkcml2ZXIga25v
d3MgdXAtZnJvbnQgd2hpY2ggSURzIGV0Yy4gaXQgbXVzdCBiZSBjYXJlZnVsIG5vdCB0byAKZGlz
cnVwdC4gT2J2aW91c2x5IGZvciBTTU1VIHRoYXQgKndvdWxkKiBiZSBzb21lIG5ldyB0YWJsZSAo
ZGVzaWduZWQgdG8gCmVuY29tcGFzcyBldmVyeXRoaW5nIHJlbGV2YW50KSBzaW5jZSBsaXRlcmFs
IFJNUlJzIGFyZSBzcGVjaWZpY2FsbHkgYW4gCkludGVsIFZULWQgdGhpbmcuCgo+IFRoaXMgcGVy
aGFwcyBkb2Vzbid0IHNvbHZlIHRoZSBtb3JlIGdlbmVyYWwgY2FzZSBvZiBib290bG9hZGVyIGVu
YWJsZWQKPiBkaXNwbGF5IGZvciBkcml2ZXJzIHRoYXQgYWN0dWFsbHkgd2FudCB0byB1c2UgRE1B
IEFQSSBtYW5hZ2VkIElPTU1VLgo+IEJ1dCBpdCBkb2VzIGFsc28gaGFwcGVuIHRvIGF2b2lkIGEg
cmVsYXRlZCBwcm9ibGVtIHdpdGggR1BVLCBjYXVzZWQgYnkKPiB0aGUgRE1BIGRvbWFpbiBjbGFp
bWluZyB0aGUgY29udGV4dCBiYW5rIHRoYXQgdGhlIEdQVSBmaXJtd2FyZSBleHBlY3RzCj4gdG8g
dXNlLgoKQ2FyZWZ1bCBicmluZ2luZyB0aGF0IHVwIGFnYWluLCBvciBJIHJlYWxseSB3aWxsIHJl
d29yayB0aGUgY29udGV4dCBiYW5rIAphbGxvY2F0b3IgdG8gYXZvaWQgdGhpcyBkZWZhdWx0IGRv
bWFpbiBwcm9ibGVtIGVudGlyZWx5Li4uIDspCgpSb2Jpbi4KCj4gIEFuZCBpdCBhdm9pZHMgc3B1
cmlvdXMgVExCIGludmFsaWRhdGlvbiBjb21pbmcgZnJvbSB0aGUgdW51c2VkCj4gRE1BIGRvbWFp
bi4gIFNvIElNSE8gdGhpcyBpcyBhIHVzZWZ1bCBhbmQgbmVjZXNzYXJ5IGNoYW5nZS4KPiAKPiBS
b2IgQ2xhcmsgKDIpOgo+ICAgIGlvbW11OiBhZGQgc3VwcG9ydCBmb3IgZHJpdmVycyB0aGF0IG1h
bmFnZSBpb21tdSBleHBsaWNpdGx5Cj4gICAgZHJtL21zbTogbWFyayBkZXZpY2VzIHdoZXJlIGlv
bW11IGlzIG1hbmFnZWQgYnkgZHJpdmVyCj4gCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hZHJlbm9fZGV2aWNlLmMgfCAxICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9rbXMuYyAgICB8IDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9rbXMuYyAgIHwgMSArCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyAgICAgICAg
ICAgICAgfCAxICsKPiAgIGRyaXZlcnMvaW9tbXUvaW9tbXUuYyAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KPiAgIGRyaXZlcnMvaW9tbXUvb2ZfaW9tbXUuYyAgICAgICAgICAgICAgICAgICB8
IDMgKysrCj4gICBpbmNsdWRlL2xpbnV4L2RldmljZS5oICAgICAgICAgICAgICAgICAgICAgfCAz
ICsrLQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
