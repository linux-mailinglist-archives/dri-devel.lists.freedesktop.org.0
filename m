Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F3C1C6CD8
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 11:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DF46E846;
	Wed,  6 May 2020 09:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBC26E844
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 09:26:40 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jWGK6-0000MM-3k; Wed, 06 May 2020 11:26:38 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jWGK5-0004UU-P0; Wed, 06 May 2020 11:26:37 +0200
Message-ID: <8b33b8fe9d12470743384773be0953851845e11f.camel@pengutronix.de>
Subject: Re: [PATCH v2 23/91] reset: simple: Add reset callback
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
Date: Wed, 06 May 2020 11:26:37 +0200
In-Reply-To: <31e3daec5d5b703bd87ef9d77e353589daf6fa3e.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <31e3daec5d5b703bd87ef9d77e353589daf6fa3e.1587742492.git-series.maxime@cerno.tech>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKT24gRnJpLCAyMDIwLTA0LTI0IGF0IDE3OjM0ICswMjAwLCBNYXhpbWUgUmlw
YXJkIHdyb3RlOgo+IFRoZSByZXNldC1zaW1wbGUgY29kZSBsYWNrcyBhIHJlc2V0IGNhbGxiYWNr
IHRoYXQgaXMgc3RpbGwgcHJldHR5IGVhc3kgdG8KPiBpbXBsZW1lbnQuIFRoZSBvbmx5IHJlYWwg
dGhpbmcgdG8gY29uc2lkZXIgaXMgdGhlIGRlbGF5IG5lZWRlZCBmb3IgYSBkZXZpY2UKPiB0byBi
ZSByZXNldCwgc28gbGV0J3MgZXhwb3NlIHRoYXQgYXMgcGFydCBvZiB0aGUgcmVzZXQtc2ltcGxl
IGRyaXZlciBkYXRhLgo+IAo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgo+
IC0tLQo+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNpbXBsZS5jICAgICAgIHwgMjQgKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvcmVzZXQvcmVzZXQtc2ltcGxlLmggfCAg
NiArKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtc2ltcGxlLmMgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0
LXNpbXBsZS5jCj4gaW5kZXggYzg1NGFhMzUxNjQwLi42MDJlZDk3MmIwYTkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9yZXNldC9yZXNldC1zaW1wbGUuYwo+ICsrKyBiL2RyaXZlcnMvcmVzZXQvcmVz
ZXQtc2ltcGxlLmMKPiBAQCAtMTEsNiArMTEsNyBAQAo+ICAgKiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+IEBAIC02Myw2ICs2NCwyOCBAQCBz
dGF0aWMgaW50IHJlc2V0X3NpbXBsZV9kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9k
ZXYgKnJjZGV2LAo+ICAJcmV0dXJuIHJlc2V0X3NpbXBsZV91cGRhdGUocmNkZXYsIGlkLCBmYWxz
ZSk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgcmVzZXRfc2ltcGxlX3Jlc2V0KHN0cnVjdCByZXNl
dF9jb250cm9sbGVyX2RldiAqcmNkZXYsCj4gKwkJCSAgICAgIHVuc2lnbmVkIGxvbmcgaWQpCj4g
K3sKPiArCXN0cnVjdCByZXNldF9zaW1wbGVfZGF0YSAqZGF0YSA9IHRvX3Jlc2V0X3NpbXBsZV9k
YXRhKHJjZGV2KTsKPiArCWludCByZXQ7Cj4gKwo+ICsJaWYgKCFkYXRhLT5yZXNldF91cykKPiAr
CQlyZXR1cm4gLUVOT1RTVVBQOwo+ICsKPiArCXJldCA9IHJlc2V0X3NpbXBsZV9hc3NlcnQocmNk
ZXYsIGlkKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwl1c2xlZXBfcmFu
Z2UoZGF0YS0+cmVzZXRfdXMsIGRhdGEtPnJlc2V0X3VzICogMik7Cj4gKwo+ICsJcmV0ID0gcmVz
ZXRfc2ltcGxlX2RlYXNzZXJ0KHJjZGV2LCBpZCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiBy
ZXQ7Cj4gKwo+ICsJcmV0dXJuIDA7CgpKdXN0CglyZXR1cm4gcmVzZXRfc2ltcGxlX2RlYXNzZXJ0
KHJjZGV2LCBpZCk7CmhlcmUuCgo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHJlc2V0X3NpbXBsZV9z
dGF0dXMoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwKPiAgCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgaWQpCj4gIHsKPiBAQCAtODAsNiArMTAzLDcgQEAgc3RhdGljIGludCByZXNl
dF9zaW1wbGVfc3RhdHVzKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCj4gIGNv
bnN0IHN0cnVjdCByZXNldF9jb250cm9sX29wcyByZXNldF9zaW1wbGVfb3BzID0gewo+ICAJLmFz
c2VydAkJPSByZXNldF9zaW1wbGVfYXNzZXJ0LAo+ICAJLmRlYXNzZXJ0CT0gcmVzZXRfc2ltcGxl
X2RlYXNzZXJ0LAo+ICsJLnJlc2V0CQk9IHJlc2V0X3NpbXBsZV9yZXNldCwKPiAgCS5zdGF0dXMJ
CT0gcmVzZXRfc2ltcGxlX3N0YXR1cywKPiAgfTsKPiAgRVhQT1JUX1NZTUJPTF9HUEwocmVzZXRf
c2ltcGxlX29wcyk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcmVzZXQvcmVzZXQtc2lt
cGxlLmggYi9pbmNsdWRlL2xpbnV4L3Jlc2V0L3Jlc2V0LXNpbXBsZS5oCj4gaW5kZXggMDhjY2Iy
NWE1NWU2Li41ZWI4MzYyNWE0OTUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9yZXNldC9y
ZXNldC1zaW1wbGUuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvcmVzZXQvcmVzZXQtc2ltcGxlLmgK
PiBAQCAtMjcsNiArMjcsMTEgQEAKPiAgICogQHN0YXR1c19hY3RpdmVfbG93OiBpZiB0cnVlLCBi
aXRzIHJlYWQgYmFjayBhcyBjbGVhcmVkIHdoaWxlIHRoZSByZXNldCBpcwo+ICAgKiAgICAgICAg
ICAgICAgICAgICAgIGFzc2VydGVkLiBPdGhlcndpc2UsIGJpdHMgcmVhZCBiYWNrIGFzIHNldCB3
aGlsZSB0aGUKPiAgICogICAgICAgICAgICAgICAgICAgICByZXNldCBpcyBhc3NlcnRlZC4KPiAr
ICogQHJlc2V0X3VzOiBNaW5pbXVtIGRlbGF5IGluIG1pY3Jvc2Vjb25kcyBuZWVkZWQgdGhhdCBu
ZWVkcyB0byBiZQo+ICsgKiAgICAgICAgICAgIHdhaXRlZCBmb3IgYmV0d2VlbiBhbiBhc3NlcnQg
YW5kIGEgZGVhc3NlcnQgdG8gcmVzZXQgdGhlCj4gKyAqICAgICAgICAgICAgZGV2aWNlLiBJZiBt
dWx0aXBsZSBjb25zdW1lcnMgd2l0aCBkaWZmZXJlbnQgZGVsYXkKPiArICogICAgICAgICAgICBy
ZXF1aXJlbWVudHMgYXJlIGNvbm5lY3RlZCB0byB0aGlzIGNvbnRyb2xsZXIsIGl0IG11c3QKPiAr
ICogICAgICAgICAgICBiZSB0aGUgbGFyZ2VzdCBtaW5pbXVtIGRlbGF5LgoKUGxlYXNlIG1lbnRp
b24gdGhhdCAwIGRvZXMgbm90IG1lZW4gMCDCtXMgZGVsYXksIGJ1dCB1bmtub3duIGFuZCB0aHVz
CnJlc2V0IGNhbGxiYWNrIG5vdCBzdXBwb3J0ZWQuCgpXaXRoIHRoZXNlIHR3byBpc3N1ZXMgZml4
ZWQKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cgpy
ZWdhcmRzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
