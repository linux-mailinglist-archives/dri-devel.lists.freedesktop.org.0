Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D317712944B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 11:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155B26E250;
	Mon, 23 Dec 2019 10:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400316E250;
 Mon, 23 Dec 2019 10:38:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 02:38:01 -0800
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="211517217"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 02:37:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221150402.13868-1-murphyt7@tcd.ie>
Date: Mon, 23 Dec 2019 12:37:47 +0200
Message-ID: <87blrzwcn8.fsf@intel.com>
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
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Kukjin Kim <kgene@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMSBEZWMgMjAxOSwgVG9tIE11cnBoeSA8bXVycGh5dDdAdGNkLmllPiB3cm90ZToK
PiBUaGlzIHBhdGNoc2V0IGNvbnZlcnRzIHRoZSBpbnRlbCBpb21tdSBkcml2ZXIgdG8gdGhlIGRt
YS1pb21tdSBhcGkuCj4KPiBXaGlsZSBjb252ZXJ0aW5nIHRoZSBkcml2ZXIgSSBleHBvc2VkIGEg
YnVnIGluIHRoZSBpbnRlbCBpOTE1IGRyaXZlcgo+IHdoaWNoIGNhdXNlcyBhIGh1Z2UgYW1vdW50
IG9mIGFydGlmYWN0cyBvbiB0aGUgc2NyZWVuIG9mIG15Cj4gbGFwdG9wLiBZb3UgY2FuIHNlZSBh
IHBpY3R1cmUgb2YgaXQgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vcGlwcHkzNjAva2VybmVs
UGF0Y2hlcy9ibG9iL21hc3Rlci9JTUdfMjAxOTEyMTlfMjI1OTIyLmpwZwo+Cj4gVGhpcyBpc3N1
ZSBpcyBtb3N0IGxpa2VseSBpbiB0aGUgaTkxNSBkcml2ZXIgYW5kIGlzIG1vc3QgbGlrZWx5IGNh
dXNlZAo+IGJ5IHRoZSBkcml2ZXIgbm90IHJlc3BlY3RpbmcgdGhlIHJldHVybiB2YWx1ZSBvZiB0
aGUKPiBkbWFfbWFwX29wczo6bWFwX3NnIGZ1bmN0aW9uLiBZb3UgY2FuIHNlZSB0aGUgZHJpdmVy
IGlnbm9yaW5nIHRoZQo+IHJldHVybiB2YWx1ZSBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9ibG9iLzdlMDE2NWIyZjFhOTEyYTA2ZTM4MWU5MWYwZjRlNDk1ZjRhYzM3
MzYvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jI0w1MQo+Cj4gUHJl
dmlvdXNseSB0aGlzIGRpZG7igJl0IGNhdXNlIGlzc3VlcyBiZWNhdXNlIHRoZSBpbnRlbCBtYXBf
c2cgYWx3YXlzCj4gcmV0dXJuZWQgdGhlIHNhbWUgbnVtYmVyIG9mIGVsZW1lbnRzIGFzIHRoZSBp
bnB1dCBzY2F0dGVyIGdhdGhlciBsaXN0Cj4gYnV0IHdpdGggdGhlIGNoYW5nZSB0byB0aGlzIGRt
YS1pb21tdSBhcGkgdGhpcyBpcyBubyBsb25nZXIgdGhlCj4gY2FzZS4gSSB3YXNu4oCZdCBhYmxl
IHRvIHRyYWNrIHRoZSBidWcgZG93biB0byBhIHNwZWNpZmljIGxpbmUgb2YgY29kZQo+IHVuZm9y
dHVuYXRlbHkuCj4KPiBDb3VsZCBzb21lb25lIGZyb20gdGhlIGludGVsIHRlYW0gbG9vayBhdCB0
aGlzPwoKTGV0IG1lIGdldCB0aGlzIHN0cmFpZ2h0LiBUaGVyZSBpcyBjdXJyZW50IEFQSSB0aGF0
IG9uIHN1Y2Nlc3MgYWx3YXlzCnJldHVybnMgdGhlIHNhbWUgbnVtYmVyIG9mIGVsZW1lbnRzIGFz
IHRoZSBpbnB1dCBzY2F0dGVyIGdhdGhlcgpsaXN0LiBZb3UgcHJvcG9zZSB0byBjaGFuZ2UgdGhl
IEFQSSBzbyB0aGF0IHRoaXMgaXMgbm8gbG9uZ2VyIHRoZSBjYXNlPwoKQSBxdWljayBjaGVjayBv
ZiB2YXJpb3VzIGRtYV9tYXBfc2coKSBjYWxscyBpbiB0aGUga2VybmVsIHNlZW1zIHRvCmluZGlj
YXRlIGNoZWNraW5nIGZvciAwIGZvciBlcnJvcnMgYW5kIHRoZW4gaWdub3JpbmcgdGhlIG5vbi16
ZXJvIHJldHVybgppcyBhIGNvbW1vbiBwYXR0ZXJuLiBBcmUgeW91IHN1cmUgaXQncyBva2F5IHRv
IG1ha2UgdGhlIGNoYW5nZSB5b3UncmUKcHJvcG9zaW5nPwoKQW55d2F5LCBkdWUgdG8gdGhlIHRp
bWUgb2YgeWVhciBhbmQgYWxsLCBJJ2QgbGlrZSB0byBhc2sgeW91IHRvIGZpbGUgYQpidWcgYWdh
aW5zdCBpOTE1IGF0IFsxXSBzbyB0aGlzIGlzIG5vdCBmb3Jnb3R0ZW4sIGFuZCBwbGVhc2UgbGV0
J3Mgbm90Cm1lcmdlIHRoZSBjaGFuZ2VzIGJlZm9yZSB0aGlzIGlzIHJlc29sdmVkLgoKClRoYW5r
cywKSmFuaS4KCgpbMV0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC9p
c3N1ZXMvbmV3CgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
