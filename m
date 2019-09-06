Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78739ABAEE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 16:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FE26E2C1;
	Fri,  6 Sep 2019 14:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064696E2C1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 14:33:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C02D542;
 Fri,  6 Sep 2019 16:33:20 +0200 (CEST)
Date: Fri, 6 Sep 2019 17:33:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
Message-ID: <20190906143312.GB5028@pendragon.ideasonboard.com>
References: <20190906135012.10285-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906135012.10285-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567780401;
 bh=e8eKG77p40C7hywk1oNcsdbBOVT2AOHv/tMo08FuJ/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rAotsIthvobIw1BtvM91jO/MRRxK3+QekpnNr+D4WHF318iik+Bhi8/YLdTd0bG1h
 QLGzEmrMIUvHEg/RWETqPNoA/WIRdRqiBk/jyjfN8SgYtUpxoxksMA0WKmqt7d2CL2
 AMFUps/ivmLM5Eni2cNN3oQJICCEEjtvWAyt98js=
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDM6NTA6MTJQTSArMDIwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IEV4cGFuZCBjb21tZW50IGluIHRoZSAndnNwcycgcGFyc2luZyBy
b3V0aW5lIHRvIHNwZWNpZnkgdGhlIExJRgo+IGNoYW5uZWwgaW5kZXggZGVmYXVsdHMgdG8gMCBp
biBjYXNlIHRoZSBzZWNvbmQgY2VsbCBvZiB0aGUgcHJvcGVydHkKPiBpcyBub3Qgc3BlY2lmaWVk
IHRvIHJlbWFpbiBjb21wYXRpYmxlIHdpdGggb2xkZXIgRFQgYmluZGluZ3MuCj4gCj4gUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5v
cmc+Cj4gLS0tCj4gVGhpcyB0cml2aWFsIGNoYW5nZSBpcyBhIGxlZnRvdmVyIGZyb20gYSBzZXJp
ZXMgdGhhdCBHZWVydCBhbHJlYWR5Cj4gdG9vayBpbi4gUmUtc2VuZGluZyBhcyBJIGZvcmdvdCB0
byBhZGQgdGhlIGRyaSBsaXN0Lgo+IAo+IExhdXJlbnQsIGNvdWxkIHlvdSBwaWNrIHRoaXMgb25l
IHBsZWFzZT8KCkRvbmUsIHRoYW5rIHlvdS4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfa21zLmMgfCA2ICsrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2tt
cy5jCj4gaW5kZXggZmMzMGZmZjBlYjhkLi5jYjYzNjYzNzAzMmQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiBAQCAtNjI1LDcgKzYyNSwxMSBAQCBzdGF0aWMgaW50
IHJjYXJfZHVfdnNwc19pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSkKPiAKPiAgCQl2
c3BzW2pdLmNydGNzX21hc2sgfD0gQklUKGkpOwo+IAo+IC0JCS8qIFN0b3JlIHRoZSBWU1AgcG9p
bnRlciBhbmQgcGlwZSBpbmRleCBpbiB0aGUgQ1JUQy4gKi8KPiArCQkvKgo+ICsJCSAqIFN0b3Jl
IHRoZSBWU1AgcG9pbnRlciBhbmQgcGlwZSBpbmRleCBpbiB0aGUgQ1JUQy4gSWYgdGhlCj4gKwkJ
ICogc2Vjb25kIGNlbGwgb2YgdGhlICd2c3BzJyBzcGVjaWZpZXIgaXNuJ3QgcHJlc2VudCwgZGVm
YXVsdAo+ICsJCSAqIHRvIDAgdG8gcmVtYWluIGNvbXBhdGlibGUgd2l0aCBvbGRlciBEVCBiaW5k
aW5ncy4KPiArCQkgKi8KPiAgCQlyY2R1LT5jcnRjc1tpXS52c3AgPSAmcmNkdS0+dnNwc1tqXTsK
PiAgCQlyY2R1LT5jcnRjc1tpXS52c3BfcGlwZSA9IGNlbGxzID49IDEgPyBhcmdzLmFyZ3NbMF0g
OiAwOwo+ICAJfQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
