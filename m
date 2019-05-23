Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD87275F6
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 08:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F35A89C63;
	Thu, 23 May 2019 06:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 23 May 2019 06:18:26 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6B489C63
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:18:26 +0000 (UTC)
X-UUID: fbae2d38e97c4c139052c44cb752bc31-20190523
X-UUID: fbae2d38e97c4c139052c44cb752bc31-20190523
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 281682636; Thu, 23 May 2019 14:13:21 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 May 2019 14:13:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 23 May 2019 14:13:20 +0800
Message-ID: <1558592000.552.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Fix warning about unhandled enum value
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Thu, 23 May 2019 14:13:20 +0800
In-Reply-To: <20190522202207.223110-1-sean@poorly.run>
References: <20190522202207.223110-1-sean@poorly.run>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hansverk@cisco.com>, David Airlie <airlied@linux.ie>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFNlYW46CgpPbiBXZWQsIDIwMTktMDUtMjIgYXQgMTY6MjEgLTA0MDAsIFNlYW4gUGF1bCB3
cm90ZToKPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiAKPiBGaXhl
cyB0aGUgZm9sbG93aW5nIGJ1aWxkIHdhcm5pbmc6Cj4gZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmM6MzI3OjI6IHdhcm5pbmc6IGVudW1lcmF0aW9uIHZhbHVlIOKAmEhETUlfSU5G
T0ZSQU1FX1RZUEVfRFJN4oCZIG5vdCBoYW5kbGVkIGluIHN3aXRjaCBbLVdzd2l0Y2hdCj4gCj4g
SW50cm9kdWNlZCB3aXRoIHRoZSBhZGRpdGlvbiBvZiBIRE1JX0lORk9GUkFNRV9UWVBFX0RSTSBp
biB0aGUgY29tbWl0Cj4gYmVsb3csIGJ1dCB0aGUgY29kZSByZWFsbHkgc2hvdWxkIGhhdmUgYmVl
biBmdXR1cmUtcHJvb2ZlZCBmcm9tIHRoZQo+IHN0YXJ0LgoKQWNrZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+Cgo+IAo+IEZpeGVzOiAyY2RiZmQ2NmE4MjkgKCJkcm06IEVuYWJsZSBI
RFIgaW5mb2ZyYW1lIHN1cHBvcnQiKQoKSSB0aGluayAiZHJtOiBFbmFibGUgSERSIGluZm9mcmFt
ZSBzdXBwb3J0IiBleGlzdCBvbmx5IGluIGRybS1taXNjIHRyZWUsCmNvdWxkIHlvdSBqdXN0IG1l
cmdlIHRoaXMgcGF0Y2ggdG8gImRybTogRW5hYmxlIEhEUiBpbmZvZnJhbWUgc3VwcG9ydCI/CgpS
ZWdhcmRzLApDSwoKPiBDYzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiBD
YzogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgo+IENjOiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNl
YW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogIlZpbGxlIFN5cmrDpGzD
pCIgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBIYW5zIFZlcmt1aWwgPGhh
bnN2ZXJrQGNpc2NvLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBh
dWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiBpbmRleCBlMDRlNmMyOTNkMzku
LjEwY2M5OTEwZjE2NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gQEAg
LTM0MSw2ICszNDEsOSBAQCBzdGF0aWMgdm9pZCBtdGtfaGRtaV9od19zZW5kX2luZm9fZnJhbWUo
c3RydWN0IG10a19oZG1pICpoZG1pLCB1OCAqYnVmZmVyLAo+ICAJCWN0cmxfZnJhbWVfZW4gPSBW
U19FTjsKPiAgCQljdHJsX3JlZyA9IEdSTF9BQ1BfSVNSQ19DVFJMOwo+ICAJCWJyZWFrOwo+ICsJ
ZGVmYXVsdDoKPiArCQlkZXZfZXJyKGhkbWktPmRldiwgIlVua25vd24gaW5mb2ZyYW1lIHR5cGUg
JWRcbiIsIGZyYW1lX3R5cGUpOwo+ICsJCXJldHVybjsKPiAgCX0KPiAgCW10a19oZG1pX2NsZWFy
X2JpdHMoaGRtaSwgY3RybF9yZWcsIGN0cmxfZnJhbWVfZW4pOwo+ICAJbXRrX2hkbWlfd3JpdGUo
aGRtaSwgR1JMX0lORk9GUk1fVFlQRSwgZnJhbWVfdHlwZSk7CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
