Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA4E129598
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 12:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01396E27A;
	Mon, 23 Dec 2019 11:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE156E26C;
 Mon, 23 Dec 2019 11:41:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:41:45 -0800
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="211530914"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:41:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Robin Murphy <robin.murphy@arm.com>, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
In-Reply-To: <432d306c-fe9f-75b2-f0f7-27698f1467ad@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <87blrzwcn8.fsf@intel.com> <432d306c-fe9f-75b2-f0f7-27698f1467ad@arm.com>
Date: Mon, 23 Dec 2019 13:41:33 +0200
Message-ID: <87o8vzuv4i.fsf@intel.com>
MIME-Version: 1.0
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
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Kukjin Kim <kgene@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMyBEZWMgMjAxOSwgUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4g
d3JvdGU6Cj4gT24gMjAxOS0xMi0yMyAxMDozNyBhbSwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9u
IFNhdCwgMjEgRGVjIDIwMTksIFRvbSBNdXJwaHkgPG11cnBoeXQ3QHRjZC5pZT4gd3JvdGU6Cj4+
PiBUaGlzIHBhdGNoc2V0IGNvbnZlcnRzIHRoZSBpbnRlbCBpb21tdSBkcml2ZXIgdG8gdGhlIGRt
YS1pb21tdSBhcGkuCj4+Pgo+Pj4gV2hpbGUgY29udmVydGluZyB0aGUgZHJpdmVyIEkgZXhwb3Nl
ZCBhIGJ1ZyBpbiB0aGUgaW50ZWwgaTkxNSBkcml2ZXIKPj4+IHdoaWNoIGNhdXNlcyBhIGh1Z2Ug
YW1vdW50IG9mIGFydGlmYWN0cyBvbiB0aGUgc2NyZWVuIG9mIG15Cj4+PiBsYXB0b3AuIFlvdSBj
YW4gc2VlIGEgcGljdHVyZSBvZiBpdCBoZXJlOgo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3BpcHB5
MzYwL2tlcm5lbFBhdGNoZXMvYmxvYi9tYXN0ZXIvSU1HXzIwMTkxMjE5XzIyNTkyMi5qcGcKPj4+
Cj4+PiBUaGlzIGlzc3VlIGlzIG1vc3QgbGlrZWx5IGluIHRoZSBpOTE1IGRyaXZlciBhbmQgaXMg
bW9zdCBsaWtlbHkgY2F1c2VkCj4+PiBieSB0aGUgZHJpdmVyIG5vdCByZXNwZWN0aW5nIHRoZSBy
ZXR1cm4gdmFsdWUgb2YgdGhlCj4+PiBkbWFfbWFwX29wczo6bWFwX3NnIGZ1bmN0aW9uLiBZb3Ug
Y2FuIHNlZSB0aGUgZHJpdmVyIGlnbm9yaW5nIHRoZQo+Pj4gcmV0dXJuIHZhbHVlIGhlcmU6Cj4+
PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi83ZTAxNjViMmYxYTkxMmEw
NmUzODFlOTFmMGY0ZTQ5NWY0YWMzNzM2L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9kbWFidWYuYyNMNTEKPj4+Cj4+PiBQcmV2aW91c2x5IHRoaXMgZGlkbuKAmXQgY2F1c2UgaXNz
dWVzIGJlY2F1c2UgdGhlIGludGVsIG1hcF9zZyBhbHdheXMKPj4+IHJldHVybmVkIHRoZSBzYW1l
IG51bWJlciBvZiBlbGVtZW50cyBhcyB0aGUgaW5wdXQgc2NhdHRlciBnYXRoZXIgbGlzdAo+Pj4g
YnV0IHdpdGggdGhlIGNoYW5nZSB0byB0aGlzIGRtYS1pb21tdSBhcGkgdGhpcyBpcyBubyBsb25n
ZXIgdGhlCj4+PiBjYXNlLiBJIHdhc27igJl0IGFibGUgdG8gdHJhY2sgdGhlIGJ1ZyBkb3duIHRv
IGEgc3BlY2lmaWMgbGluZSBvZiBjb2RlCj4+PiB1bmZvcnR1bmF0ZWx5Lgo+Pj4KPj4+IENvdWxk
IHNvbWVvbmUgZnJvbSB0aGUgaW50ZWwgdGVhbSBsb29rIGF0IHRoaXM/Cj4+IAo+PiBMZXQgbWUg
Z2V0IHRoaXMgc3RyYWlnaHQuIFRoZXJlIGlzIGN1cnJlbnQgQVBJIHRoYXQgb24gc3VjY2VzcyBh
bHdheXMKPj4gcmV0dXJucyB0aGUgc2FtZSBudW1iZXIgb2YgZWxlbWVudHMgYXMgdGhlIGlucHV0
IHNjYXR0ZXIgZ2F0aGVyCj4+IGxpc3QuIFlvdSBwcm9wb3NlIHRvIGNoYW5nZSB0aGUgQVBJIHNv
IHRoYXQgdGhpcyBpcyBubyBsb25nZXIgdGhlIGNhc2U/Cj4KPiBObywgdGhlIEFQSSBmb3IgZG1h
X21hcF9zZygpIGhhcyBhbHdheXMgYmVlbiB0aGF0IGl0IG1heSByZXR1cm4gZmV3ZXIgCj4gRE1B
IHNlZ21lbnRzIHRoYW4gbmVudHMgLSBzZWUgRG9jdW1lbnRhdGlvbi9ETUEtQVBJLnR4dCAoYW5k
IG90aGVyd2lzZSwgCj4gdGhlIHJldHVybiB2YWx1ZSB3b3VsZCBzdXJlbHkgYmUgYSBzaW1wbGUg
c3VjY2Vzcy9mYWlsIGNvbmRpdGlvbikuIAo+IFJlbHlpbmcgb24gYSBwYXJ0aWN1bGFyIGltcGxl
bWVudGF0aW9uIGJlaGF2aW91ciBoYXMgbmV2ZXIgYmVlbiBzdHJpY3RseSAKPiBjb3JyZWN0LCBl
dmVuIGlmIGl0IGRvZXMgaGFwcGVuIHRvIGJlIGEgdmVyeSBjb21tb24gYmVoYXZpb3VyLgo+Cj4+
IEEgcXVpY2sgY2hlY2sgb2YgdmFyaW91cyBkbWFfbWFwX3NnKCkgY2FsbHMgaW4gdGhlIGtlcm5l
bCBzZWVtcyB0bwo+PiBpbmRpY2F0ZSBjaGVja2luZyBmb3IgMCBmb3IgZXJyb3JzIGFuZCB0aGVu
IGlnbm9yaW5nIHRoZSBub24temVybyByZXR1cm4KPj4gaXMgYSBjb21tb24gcGF0dGVybi4gQXJl
IHlvdSBzdXJlIGl0J3Mgb2theSB0byBtYWtlIHRoZSBjaGFuZ2UgeW91J3JlCj4+IHByb3Bvc2lu
Zz8KPgo+IFZhcmlvdXMgY29kZSB1c2VzIHRyaWNrcyBsaWtlIGp1c3QgaXRlcmF0aW5nIHRoZSBt
YXBwZWQgbGlzdCB1bnRpbCB0aGUgCj4gZmlyc3Qgc2VnbWVudCB3aXRoIHplcm8gc2dfZG1hX2xl
bigpLiBPdGhlcnMgbWF5IHdlbGwgc2ltcGx5IGhhdmUgYnVncy4KClRoYW5rcyBmb3IgdGhlIGNs
YXJpZmljYXRpb24uCgpCUiwKSmFuaS4KCj4KPiBSb2Jpbi4KPgo+PiBBbnl3YXksIGR1ZSB0byB0
aGUgdGltZSBvZiB5ZWFyIGFuZCBhbGwsIEknZCBsaWtlIHRvIGFzayB5b3UgdG8gZmlsZSBhCj4+
IGJ1ZyBhZ2FpbnN0IGk5MTUgYXQgWzFdIHNvIHRoaXMgaXMgbm90IGZvcmdvdHRlbiwgYW5kIHBs
ZWFzZSBsZXQncyBub3QKPj4gbWVyZ2UgdGhlIGNoYW5nZXMgYmVmb3JlIHRoaXMgaXMgcmVzb2x2
ZWQuCj4+IAo+PiAKPj4gVGhhbmtzLAo+PiBKYW5pLgo+PiAKPj4gCj4+IFsxXSBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsL2lzc3Vlcy9uZXcKPj4gCj4+IAoKLS0gCkph
bmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
