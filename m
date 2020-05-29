Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030141E902F
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE276E9C4;
	Sat, 30 May 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF3F6E962;
 Fri, 29 May 2020 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nhAOftfyfj+FPkKvFiLyWhZt65EpTKYajbE3eXvsvFs=; b=Au5x22kdoavuCP15EixJShyeVc
 xSf1ZvVd/sQsd21cm+wlMkMVPvmWUNCuTwOXOspqpww0a042+UM9sc8AJpFSpVUsYFEh4rsbl+FZO
 mMdOQJ13c/r35Pu4XwHP/vpqKEt1ZJMUTg9psw1MVR5EgpPeLY9sRw+TQrOl/N7TMJ4xk94Jk+rsJ
 Mvp7tDsg05uFy8LEnvhacd6Quyv6NmV6RcOMnRcr4Hqh//UfP6DTM/gi45aQ297i+RyOU4NJbKQDQ
 6TF9Pp10KoRcCt2b1u3v2J2JlzgFkHY8usyjXKelkV30hDNKVxV6NcEJ6BWnhbYJBUP/1z43voVXr
 CQIfKJBg==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1jekJh-0002Ks-TI; Fri, 29 May 2020 13:05:18 -0600
To: Christoph Hellwig <hch@infradead.org>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
Date: Fri, 29 May 2020 13:05:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529124523.GA11817@infradead.org>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: joonas.lahtinen@linux.intel.com, jani.nikula@linux.intel.com,
 m.szyprowski@samsung.com, dwmw2@infradead.org, kgene@kernel.org,
 linux-kernel@vger.kernel.org, cohuck@redhat.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux-foundation.org, tglx@linutronix.de,
 linux-tegra@vger.kernel.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, alex.williamson@redhat.com,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-s390@vger.kernel.org, gerald.schaefer@de.ibm.com, agross@kernel.org,
 linux-rockchip@lists.infradead.org, jonathanh@nvidia.com, krzk@kernel.org,
 maz@kernel.org, linux-samsung-soc@vger.kernel.org, jean-philippe@linaro.org,
 will@kernel.org, thierry.reding@gmail.com, julien.grall@arm.com,
 matthias.bgg@gmail.com, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, kvm@vger.kernel.org,
 iommu@lists.linux-foundation.org, murphyt7@tcd.ie, hch@infradead.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIwLTA1LTI5IDY6NDUgYS5tLiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24g
VGh1LCBNYXkgMjgsIDIwMjAgYXQgMDY6MDA6NDRQTSAtMDYwMCwgTG9nYW4gR3VudGhvcnBlIHdy
b3RlOgo+Pj4gVGhpcyBpc3N1ZSBpcyBtb3N0IGxpa2VseSBpbiB0aGUgaTkxNSBkcml2ZXIgYW5k
IGlzIG1vc3QgbGlrZWx5IGNhdXNlZCBieSB0aGUgZHJpdmVyIG5vdCByZXNwZWN0aW5nIHRoZSBy
ZXR1cm4gdmFsdWUgb2YgdGhlIGRtYV9tYXBfb3BzOjptYXBfc2cgZnVuY3Rpb24uIFlvdSBjYW4g
c2VlIHRoZSBkcml2ZXIgaWdub3JpbmcgdGhlIHJldHVybiB2YWx1ZSBoZXJlOgo+Pj4gaHR0cHM6
Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvN2UwMTY1YjJmMWE5MTJhMDZlMzgxZTkx
ZjBmNGU0OTVmNGFjMzczNi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVm
LmMjTDUxCj4+Pgo+Pj4gUHJldmlvdXNseSB0aGlzIGRpZG7igJl0IGNhdXNlIGlzc3VlcyBiZWNh
dXNlIHRoZSBpbnRlbCBtYXBfc2cgYWx3YXlzIHJldHVybmVkIHRoZSBzYW1lIG51bWJlciBvZiBl
bGVtZW50cyBhcyB0aGUgaW5wdXQgc2NhdHRlciBnYXRoZXIgbGlzdCBidXQgd2l0aCB0aGUgY2hh
bmdlIHRvIHRoaXMgZG1hLWlvbW11IGFwaSB0aGlzIGlzIG5vIGxvbmdlciB0aGUgY2FzZS4gSSB3
YXNu4oCZdCBhYmxlIHRvIHRyYWNrIHRoZSBidWcgZG93biB0byBhIHNwZWNpZmljIGxpbmUgb2Yg
Y29kZSB1bmZvcnR1bmF0ZWx5LiAgCj4gCj4gTWFyayBkaWQgYSBiaWcgYXVkaXQgaW50byB0aGUg
bWFwX3NnIEFQSSBhYnVzZSBhbmQgaW5pdGlhbGx5IGhhZAo+IHNvbWUgaTkxNSBwYXRjaGVzLCBi
dXQgdGhlbiBnYXZlIHVwIG9uIHRoZW0gd2l0aCB0aGlzIGNvbW1lbnQ6Cj4gCj4gIlRoZSBiaWdn
ZXN0IFRPRE8gaXMgRFJNL2k5MTUgZHJpdmVyIGFuZCBJIGRvbid0IGZlZWwgYnJhdmUgZW5vdWdo
IHRvIGZpeAo+ICBpdCBmdWxseS4gVGhlIGRyaXZlciBjcmVhdGl2ZWx5IHVzZXMgc2dfdGFibGUt
Pm9yaWdfbmVudHMgdG8gc3RvcmUgdGhlCj4gIHNpemUgb2YgdGhlIGFsbG9jYXRlIHNjYXR0ZXJs
aXN0IGFuZCBpZ25vcmVzIHRoZSBudW1iZXIgb2YgdGhlIGVudHJpZXMKPiAgcmV0dXJuZWQgYnkg
ZG1hX21hcF9zZyBmdW5jdGlvbi4gSW4gdGhpcyBwYXRjaHNldCBJIG9ubHkgZml4ZWQgdGhlCj4g
IHNnX3RhYmxlIG9iamVjdHMgZXhwb3J0ZWQgYnkgZG1hYnVmIHJlbGF0ZWQgZnVuY3Rpb25zLiBJ
IGhvcGUgdGhhdCBJCj4gIGRpZG4ndCBicmVhayBhbnl0aGluZyB0aGVyZS4iCj4gCj4gaXQgd291
bGQgYmUgcmVhbGx5IG5pY2UgaWYgdGhlIGk5MTUgbWFpbnRhaW5lcnMgY291bGQgaGVscCB3aXRo
IHNvcnRpbmcKPiB0aGF0IEFQSSBhYnVzZSBvdXQuCj4gCgpJIGFncmVlIGNvbXBsZXRlbHkgdGhh
dCB0aGUgQVBJIGFidXNlIHNob3VsZCBiZSBzb3J0ZWQgb3V0LCBidXQgSSB0aGluawp0aGF0J3Mg
bXVjaCBsYXJnZXIgdGhhbiBqdXN0IHRoZSBpOTE1IGRyaXZlci4gUHJldHR5IG11Y2ggZXZlcnkg
ZG1hLWJ1ZgptYXBfZG1hX2J1ZiBpbXBsZW1lbnRhdGlvbiBJIGxvb2tlZCBhdCBpZ25vcmVzIHRo
ZSByZXR1cm5lZCBuZW50cyBvZgpzZ19hdHRycy4gVGhpcyBzdWNrcywgYnV0IEkgZG9uJ3QgdGhp
bmsgaXQncyB0aGUgYnVnIFRvbSByYW4gaW50by4gU2VlOgoKYW1kZ3B1X2RtYV9idWZfbWFwCmFy
bWFkYV9nZW1fcHJpbWVfbWFwX2RtYV9idWYKZHJtX2dlbV9tYXBfZG1hX2J1ZgppOTE1X2dlbV9t
YXBfZG1hX2J1Zgp0ZWdyYV9nZW1fcHJpbWVfbWFwX2RtYV9idWYKClNvIHRoaXMgc2hvdWxkIHBy
b2JhYmx5IGJlIGFkZHJlc3NlZCBieSB0aGUgd2hvbGUgR1BVIGNvbW11bml0eS4KCkhvd2V2ZXIs
IGFzIFJvYmluIHBvaW50ZWQgb3V0LCB0aGVyZSBhcmUgb3RoZXIgdWdseSB0cmlja3MgbGlrZSBz
dG9wcGluZwppdGVyYXRpbmcgdGhyb3VnaCB0aGUgU0dMIHdoZW4gc2dfZG1hX2xlbigpIGlzIHpl
cm8uIEZvciBleGFtcGxlLCB0aGUKQU1EIGRyaXZlciBhcHBlYXJzIHRvIHVzZSBkcm1fcHJpbWVf
c2dfdG9fcGFnZV9hZGRyX2FycmF5cygpIHdoaWNoIGRvZXMKdGhpcyB0cmljayBhbmQgdGh1cyBs
aWtlbHkgaXNuJ3QgYnVnZ3kgKG90aGVyd2lzZSwgSSdkIGV4cGVjdCBzb21lb25lIHRvCmhhdmUg
Y29tcGxhaW5lZCBieSBub3cgc2VlaW5nIEFNRCBoYXMgYWxyZWFkeSBzd2l0Y2hlZCB0byBJT01N
VS1ETUEuCgpBcyBJIHRyaWVkIHRvIHBvaW50IG91dCBpbiBteSBwcmV2aW91cyBlbWFpbCwgaTkx
NSBkb2VzIG5vdCBkbyB0aGlzCnRyaWNrLiBJbiBmYWN0LCBpdCBjb21wbGV0ZWx5IGlnbm9yZXMg
c2dfZG1hX2xlbigpIGFuZCBpcyB0aHVzCmNvbXBsZXRlbHkgYnJva2VuLiBTZWUgaTkxNV9zY2F0
dGVybGlzdC5oIGFuZCB0aGUgX19zZ3RfaXRlcigpIGZ1bmN0aW9uLgpTbyBpdCBkb2Vzbid0IHNv
dW5kIHRvIG1lIGxpa2UgTWFyaydzIGZpeCB3b3VsZCBhZGRyZXNzIHRoZSBpc3N1ZSBhdAphbGwu
IFBlciBteSBwcmV2aW91cyBlbWFpbCwgSSdkIGd1ZXNzIHRoYXQgaXQgY2FuIGJlIGZpeGVkIHNp
bXBseSBieQphZGp1c3RpbmcgdGhlIF9fc2d0X2l0ZXIoKSBmdW5jdGlvbiB0byBkbyBzb21ldGhp
bmcgbW9yZSBzZW5zaWJsZS4KKEJldHRlciB5ZXQsIGlmIHBvc3NpYmxlLCBkaXRjaCBfX3NndF9p
dGVyKCkgYW5kIHVzZSB0aGUgY29tbW9uIERSTQpmdW5jdGlvbiB0aGF0IEFNRCB1c2VzKS4KClRo
aXMgd291bGQgYXQgbGVhc3QgYWxsb3cgdXMgdG8gbWFrZSBwcm9ncmVzcyB3aXRoIFRvbSdzIElP
TU1VLURNQSBwYXRjaApzZXQgYW5kIG9uY2UgdGhhdCBnZXRzIGluLCBpdCB3aWxsIGJlIGhhcmRl
ciBmb3Igb3RoZXIgZHJpdmVycyB0byBtYWtlCnRoZSBzYW1lIG1pc3Rha2UuCgpMb2dhbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
