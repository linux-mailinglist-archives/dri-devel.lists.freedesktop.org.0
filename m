Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3A9DE5F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70898919E;
	Tue, 27 Aug 2019 07:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71E88919E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 07:06:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACF912F0;
 Tue, 27 Aug 2019 09:06:01 +0200 (CEST)
Date: Tue, 27 Aug 2019 10:05:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 07/60] drm/bridge: simple-bridge: Add support for the TI
 OP362
Message-ID: <20190827070555.GA5054@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-4-laurent.pinchart@ideasonboard.com>
 <fba61fe8-5526-c773-f5e7-9da3216770ea@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fba61fe8-5526-c773-f5e7-9da3216770ea@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566889561;
 bh=/9PFXvyGY+aijN3fGDWSbNDAdYFzGZTiemNDqgyhbzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ADcdzEZ1HuXmG5qc4Ef9aY0pMbtZkX2/1iwaWALRTd3uHl2IJ+UyBu5CuDdgswiZd
 SDGqkQlWarvS1NZicNn7Vj0mVuE+iSM8FhivLUFus56rgygf4aY4j6VdfadKfjv+oA
 HtpoRMvPe0mNXtMiSRaJ3EzM03b7iGpEQqS4bQNY=
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDA5OjE2OjQyQU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDA3LzA3LzIwMTkgMjE6MTgsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBUaGUgVEkgT1AzNjIgaXMgYW4gYW5hbG9nIHZpZGVvIGFtcGxpZmllciBjb250
cm9sbGVkIHRocm91Z2ggYSBHUElPLiBBZGQKPiA+IHN1cHBvcnQgZm9yIGl0IHRvIHRoZSBzaW1w
bGUtYnJpZGdlIGRyaXZlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jIHwgNSArKysrKwo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lt
cGxlLWJyaWRnZS5jCj4gPiBpbmRleCBhN2VkZjNjMzk2MjcuLjc0OTViOWJlZjg2NSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYwo+ID4gQEAgLTI5Niw2ICsy
OTYsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2ltcGxlX2JyaWRnZV9t
YXRjaFtdID0gewo+ID4gICAJCQkudGltaW5ncyA9ICZkZWZhdWx0X2JyaWRnZV90aW1pbmdzLAo+
ID4gICAJCQkudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9WR0EsCj4gPiAgIAkJfSwKPiA+ICsJ
fSwgewo+ID4gKwkJLmNvbXBhdGlibGUgPSAidGksb3BhMzYyIiwKPiA+ICsJCS5kYXRhID0gJihj
b25zdCBzdHJ1Y3Qgc2ltcGxlX2JyaWRnZV9pbmZvKSB7Cj4gPiArCQkJLnR5cGUgPSBEUk1fTU9E
RV9DT05ORUNUT1JfQ29tcG9zaXRlLAo+ID4gKwkJfSwKPiAKPiBJIGhhdmUgdG8gc2F5IEknbSBw
cmV0dHkgY2x1ZWxlc3MgYWJvdXQgdGhlIGFuYWxvZyBUViwgYnV0IE9NQVAgRFNTIAo+IHN1cHBv
cnRzIGFsc28gcy12aWRlbyBvdXRwdXRzLiBCdXQgSSBkb24ndCBrbm93IGlmIE9QQTM2MiBjYW4g
YmUgdXNlZCAKPiB3aXRoIHMtdmlkZW8sIG9yIGRvZXMgaXQgZGljdGF0ZSBjb21wb3NpdGUuCgpU
aGUgT1BBMzYyIGhhcyBhIHNpbmdsZSBhbXBsaWZpZXIsIHNvIGl0IGNhbid0IGhhbmRsZSBTLVZp
ZGVvIGJ5IGl0c2VsZi4KVXNpbmcgdHdvIGluc3RhbmNlcyBvZiB0aGUgY2hpcCBtYXkgd29yayBm
b3Igc3VjaCBhIHVzZSBjYXNlIChJIGhhdmVuJ3QKY2hlY2tlZCBpbiBkZXRhaWxzKSwgYnV0IHRo
YXQgd291bGQgcmVxdWlyZSBzdXBwb3J0IGZvciBub24tbGluZWFyCmNoYWlucyBvZiBicmlkZ2Vz
LCB3aGljaCBpc24ndCBzdXBwb3J0ZWQgdG9kYXkuIExldCdzIHJldmlzaXQgdGhpcyB0b3BpYwp3
aGVuIG5lZWRlZCAoaG9wZWZ1bGx5IG5ldmVyIDotKSkuCgo+IEluIGFueSBjYXNlLAo+IAo+IFJl
dmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
