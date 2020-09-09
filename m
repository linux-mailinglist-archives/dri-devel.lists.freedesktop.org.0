Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC9262EC6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 14:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BE06EB4C;
	Wed,  9 Sep 2020 12:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5297F890F5;
 Wed,  9 Sep 2020 12:56:04 +0000 (UTC)
IronPort-SDR: 5WAHYh5SC0OP7odgH+pjw39dkk3Mv/JvfGjRLlYVnsS8iZtff5eQ8KGaUqx+qUJZJWLXQqXF9Y
 BSEKYSroZryQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="159281007"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="159281007"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 05:56:03 -0700
IronPort-SDR: JQMyvoN12VuK/irCbuVWf848SLQCDQe4s2TJxhN6e7q3mAjHQ8jO8ITqda006fm/oJ1+v0fyDP
 AZ+yU9lS391g==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="336762463"
Received: from vdc-station-04.ger.corp.intel.com (HELO [10.251.165.91])
 ([10.251.165.91])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 05:55:52 -0700
Subject: Re: [Intel-gfx] [PATCH 0/8] Convert the intel iommu driver to the
 dma-iommu api
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Tom Murphy <murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
 <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
 <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
 <60a82319-cbee-4cd1-0d5e-3c407cc51330@linux.intel.com>
 <e598fb31-ef7a-c2ee-8a54-bf62d50c480c@deltatee.com>
 <b27cae1f-07ff-bef2-f125-a5f0d968016d@linux.intel.com>
 <CALQxJut5c=cWdi+SVkN3JnbkhPSYmLkOyRUhduL-UJ9gyKn9Ow@mail.gmail.com>
 <7106602a-9964-851e-9c4e-d8acf4033b89@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ea24e077-5aa6-dd8e-69a7-d186b606703f@linux.intel.com>
Date: Wed, 9 Sep 2020 13:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7106602a-9964-851e-9c4e-d8acf4033b89@linux.intel.com>
Content-Language: en-US
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, David Woodhouse <dwmw2@infradead.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA5LzA5LzIwMjAgMTA6MTYsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IE9uIDA4LzA5LzIw
MjAgMjM6NDMsIFRvbSBNdXJwaHkgd3JvdGU6Cj4+IE9uIFR1ZSwgOCBTZXAgMjAyMCBhdCAxNjo1
NiwgVHZydGtvIFVyc3VsaW4KPj4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6Cj4+PiBPbiAwOC8wOS8yMDIwIDE2OjQ0LCBMb2dhbiBHdW50aG9ycGUgd3JvdGU6Cj4+Pj4g
T24gMjAyMC0wOS0wOCA5OjI4IGEubS4sIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+Pj4+Pj4KPj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3NjYXR0ZXJsaXN0LmgK
Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNQo+Pj4+Pj4gaW5kZXggYjdiNTkzMjhj
Yjc2Li45MzY3YWM4MDFmMGMgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3NjYXR0ZXJsaXN0LmgKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfc2NhdHRlcmxpc3QuaAo+Pj4+Pj4gQEAgLTI3LDEzICsyNywxOSBAQCBzdGF0aWMgX19hbHdh
eXNfaW5saW5lIHN0cnVjdCBzZ3RfaXRlciB7Cj4+Pj4+PiDCoMKgwqAgfSBfX3NndF9pdGVyKHN0
cnVjdCBzY2F0dGVybGlzdCAqc2dsLCBib29sIGRtYSkgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHNndF9pdGVyIHMgPSB7IC5zZ3AgPSBzZ2wgfTsKPj4+Pj4+Cj4+Pj4+PiAr
wqDCoMKgwqDCoMKgIGlmIChzZ2wgJiYgIXNnX2RtYV9sZW4ocy5zZ3ApKQo+Pj4+Pgo+Pj4+PiBJ
J2QgZXh0ZW5kIHRoZSBjb25kaXRpb24gdG8gYmUsIGp1c3QgdG8gYmUgc2FmZToKPj4+Pj4gwqDC
oMKgwqDCoCBpZiAoZG1hICYmIHNnbCAmJiAhc2dfZG1hX2xlbihzLnNncCkpCj4+Pj4+Cj4+Pj4K
Pj4+PiBSaWdodCwgZ29vZCBjYXRjaCwgdGhhdCdzIGRlZmluaXRlbHkgbmVjZXNzYXJ5Lgo+Pj4+
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLnNncCA9IE5VTEw7Cj4+Pj4+
PiArCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocy5zZ3ApIHsKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLm1heCA9IHMuY3VyciA9IHMuc2dwLT5v
ZmZzZXQ7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLm1heCArPSBzLnNn
cC0+bGVuZ3RoOwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRtYSkK
Pj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChkbWEpIHsK
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLm1h
eCArPSBzZ19kbWFfbGVuKHMuc2dwKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcy5kbWEgPSBzZ19kbWFfYWRkcmVzcyhzLnNncCk7
Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMubWF4ICs9IHMuc2dwLT5sZW5ndGg7Cj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMu
cGZuID0gcGFnZV90b19wZm4oc2dfcGFnZShzLnNncCkpOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pgo+Pj4+PiBPdGhlcndpc2UgaGFzIHRoaXMgYmVlbiB0ZXN0
ZWQgb3IgYWx0ZXJuYXRpdmVseSBob3cgdG8gdGVzdCBpdD8gCj4+Pj4+IChIb3cgdG8KPj4+Pj4g
cmVwcm8gdGhlIGlzc3VlLikKPj4+Pgo+Pj4+IEl0IGhhcyBub3QgYmVlbiB0ZXN0ZWQuIFRvIHRl
c3QgaXQsIHlvdSBuZWVkIFRvbSdzIHBhdGNoIHNldCB3aXRob3V0IAo+Pj4+IHRoZQo+Pj4+IGxh
c3QgIkRPIE5PVCBNRVJHRSIgcGF0Y2g6Cj4+Pj4KPj4+PiBodHRwczovL2xrbWwua2VybmVsLm9y
Zy9sa21sLzIwMjAwOTA3MDcwMDM1LkdBMjUxMTRAaW5mcmFkZWFkLm9yZy9ULwo+Pj4KPj4+IFRv
bSwgZG8geW91IGhhdmUgYSBicmFuY2ggc29tZXdoZXJlIEkgY291bGQgcHVsbCBmcm9tPyAoSnVz
dCBiZWluZyBsYXp5Cj4+PiBhYm91dCBkb3dubG9hZGluZyBhIGJ1bmNoIG9mIG1lc3NhZ2VzIGZy
b20gdGhlIGFyY2hpdmVzLikKPj4KPj4gSSBkb24ndCB1bmZvcnR1bmF0ZWx5LiBJJ20gd29ya2lu
ZyBsb2NhbGx5IHdpdGggcG9vciBpbnRlcm5ldC4KPj4KPj4+Cj4+PiBXaGF0IEdQVSBpcyBpbiB5
b3VyIExlbm92byB4MSBjYXJib24gNXRoIGdlbmVyYXRpb24gYW5kIHdoYXQKPj4+IGdyYXBoaWNh
bC9kZXNrdG9wIHNldHVwIEkgbmVlZCB0byByZXBybz8KPj4KPj4KPj4gSXMgdGhpcyBlbm91Z2gg
aW5mbz86Cj4+Cj4+ICQgbHNwY2kgLXZubiB8IGdyZXAgVkdBIC1BIDEyCj4+IDAwOjAyLjAgVkdB
IGNvbXBhdGlibGUgY29udHJvbGxlciBbMDMwMF06IEludGVsIENvcnBvcmF0aW9uIEhECj4+IEdy
YXBoaWNzIDYyMCBbODA4Njo1OTE2XSAocmV2IDAyKSAocHJvZy1pZiAwMCBbVkdBIGNvbnRyb2xs
ZXJdKQo+PiDCoMKgwqDCoCBTdWJzeXN0ZW06IExlbm92byBUaGlua1BhZCBYMSBDYXJib24gNXRo
IEdlbiBbMTdhYToyMjRmXQo+PiDCoMKgwqDCoCBGbGFnczogYnVzIG1hc3RlciwgZmFzdCBkZXZz
ZWwsIGxhdGVuY3kgMCwgSVJRIDE0OAo+PiDCoMKgwqDCoCBNZW1vcnkgYXQgZWIwMDAwMDAgKDY0
LWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MTZNXQo+PiDCoMKgwqDCoCBNZW1vcnkgYXQg
NjAwMDAwMDAgKDY0LWJpdCwgcHJlZmV0Y2hhYmxlKSBbc2l6ZT0yNTZNXQo+PiDCoMKgwqDCoCBJ
L08gcG9ydHMgYXQgZTAwMCBbc2l6ZT02NF0KPj4gwqDCoMKgwqAgW3ZpcnR1YWxdIEV4cGFuc2lv
biBST00gYXQgMDAwYzAwMDAgW2Rpc2FibGVkXSBbc2l6ZT0xMjhLXQo+PiDCoMKgwqDCoCBDYXBh
YmlsaXRpZXM6IFs0MF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBMZW49MGMgPD8+Cj4+
IMKgwqDCoMKgIENhcGFiaWxpdGllczogWzcwXSBFeHByZXNzIFJvb3QgQ29tcGxleCBJbnRlZ3Jh
dGVkIEVuZHBvaW50LCBNU0kgMDAKPj4gwqDCoMKgwqAgQ2FwYWJpbGl0aWVzOiBbYWNdIE1TSTog
RW5hYmxlKyBDb3VudD0xLzEgTWFza2FibGUtIDY0Yml0LQo+PiDCoMKgwqDCoCBDYXBhYmlsaXRp
ZXM6IFtkMF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDIKPj4gwqDCoMKgwqAgQ2FwYWJpbGl0
aWVzOiBbMTAwXSBQcm9jZXNzIEFkZHJlc3MgU3BhY2UgSUQgKFBBU0lEKQo+PiDCoMKgwqDCoCBD
YXBhYmlsaXRpZXM6IFsyMDBdIEFkZHJlc3MgVHJhbnNsYXRpb24gU2VydmljZSAoQVRTKQo+IAo+
IFdvcmtzIGZvciBhIHN0YXJ0LiBXaGF0IGFib3V0IHRoZSBzdGVwcyB0byByZXBybz8gQW55IGRl
c2t0b3AgCj4gZW52aXJvbm1lbnQgYW5kIGl0IGlzIGp1c3QgdmlzdWFsIGNvcnJ1cHRpb24sIG5v
IGhhbmdzL3N0YWxscyBvciBzdWNoPwo+IAo+IEkndmUgc3VibWl0dGVkIGEgc2VyaWVzIGNvbnNp
c3Rpbmcgb2Ygd2hhdCBJIHVuZGVyc3Rvb2QgYXJlIHRoZSBwYXRjaGVzIAo+IG5lZWRlZCB0byBy
ZXBybyB0aGUgaXNzdWUgdG8gb3VyIGF1dG9tYXRlZCBDSSBoZXJlOgo+IAo+IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODE0ODkvCj4gCj4gU28gd2lsbCBzZWUgaWYg
aXQgd2lsbCBjYXRjaCBzb21ldGhpbmcsIG9yIG1vcmUgdGFyZ2V0ZWQgdGVzdGluZyB3aWxsIGJl
IAo+IHJlcXVpcmVkLiBIb3BlZnVsbHkgaXQgZG9lcyB0cmlwIG92ZXIgaW4gd2hpY2ggY2FzZSBJ
IGNhbiBhZGQgdGhlIHBhdGNoIAo+IHN1Z2dlc3RlZCBieSBMb2dhbiBvbiB0b3AgYW5kIHNlZSBp
ZiB0aGF0IGZpeGVzIGl0LiBPciBJJ2xsIG5lZWQgdG8gCj4gd3JpdGUgYSBuZXcgdGVzdCBjYXNl
Lgo+IAo+IElmIHlvdSBjb3VsZCBnbGFuY2Ugb3ZlciBteSBzZXJpZXMgdG8gY2hlY2sgSSBpZGVu
dGlmaWVkIHRoZSBwYXRjaGVzIAo+IGNvcnJlY3RseSBpdCB3b3VsZCBiZSBhcHByZWNpYXRlZC4K
Ck91ciBDSSB3YXMgbW9yZSB0aGFuIGNhcGFibGUgYXQgY2F0Y2hpbmcgdGhlIGJyZWFrYWdlIHNv
IEkndmUgY29waWVkIHlvdSAKb24gYSBwYXRjaCAoaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy84MTQ5Ny8pIHdoaWNoIGhhcyBhIApnb29kIHBvdGVudGlhbCB0byBmaXgg
dGhpcy4gKE9yIGltcHJvdmUgdGhlIHJvYnVzdG5lc3Mgb2Ygb3VyIHNnIHdhbGtzLCAKZGVwZW5k
cyBob3cgeW91IGxvb2sgYXQgaXQuKQoKV291bGQgeW91IGJlIGFibGUgdG8gdGVzdCBpdCBpbiB5
b3VyIGVudmlyb25tZW50IGJ5IGFueSBjaGFuY2U/IElmIGl0IAp3b3JrcyBJIHVuZGVyc3RhbmQg
aXQgdW5ibG9ja3MgeW91ciBJT01NVSB3b3JrLCByaWdodD8KClJlZ2FyZHMsCgpUdnJ0a28KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
