Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBCC29ACF
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B0988F78;
	Fri, 24 May 2019 15:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CD26E093
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 15:16:51 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hUBwA-0000xR-0p; Fri, 24 May 2019 17:16:50 +0200
Message-ID: <1558711009.2987.1.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: lock MMU while dumping core
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Fri, 24 May 2019 17:16:49 +0200
In-Reply-To: <20190522095514.7000-1-l.stach@pengutronix.de>
References: <20190522095514.7000-1-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA1LTIyIGF0IDExOjU1ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBU
aGUgZGV2Y29yZWR1bXAgbmVlZHMgdG8gb3BlcmF0ZSBvbiBhIHN0YWJsZSBzdGF0ZSBvZiB0aGUg
TU1VIHdoaWxlCj4gaXQgaXMgd3JpdGluZyB0aGUgTU1VIHN0YXRlIHRvIHRoZSBjb3JlZHVtcC4g
VGhlIG1pc3NpbmcgbG9jawo+IGFsbG93ZWQgYm90aCB0aGUgdXNlcnNwYWNlIHN1Ym1pdCwgYXMg
d2VsbCBhcyB0aGUgR1BVIGpvYiBmaW5pc2gKPiBwYXRocyB0byBtdXRhdGUgdGhlIE1NVSBzdGF0
ZSB3aGlsZSBhIGNvcmVkdW1wIGlzIHVuZGVyIHdheS4KPiAKPiBGaXhlczogYThjMjFhNTQ1MWQ4
IChkcm0vZXRuYXZpdjogYWRkIGluaXRpYWwgZXRuYXZpdiBEUk0gZHJpdmVyKQo+IFJlcG9ydGVk
LWJ5OiBEYXZpZCBKYW5kZXIgPGRhdmlkQHByb3RvbmljLm5sPgo+IFNpZ25lZC1vZmYtYnk6IEx1
Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IFRlc3RlZC1ieTogRGF2aWQgSmFu
ZGVyIDxkYXZpZEBwcm90b25pYy5ubD4KClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRu
YXZpdl9kdW1wLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kdW1wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwo+IGluZGV4IDMzODU0Yzk0
Y2I4NS4uNTE1NTE1ZWYyNGY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfZHVtcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9k
dW1wLmMKPiBAQCAtMTI1LDYgKzEyNSw4IEBAIHZvaWQgZXRuYXZpdl9jb3JlX2R1bXAoc3RydWN0
IGV0bmF2aXZfZ3B1ICpncHUpCj4gIAkJcmV0dXJuOwo+ICAJZXRuYXZpdl9kdW1wX2NvcmUgPSBm
YWxzZTsKPiAgCj4gKwltdXRleF9sb2NrKCZncHUtPm1tdS0+bG9jayk7Cj4gKwo+ICAJbW11X3Np
emUgPSBldG5hdml2X2lvbW11X2R1bXBfc2l6ZShncHUtPm1tdSk7Cj4gIAo+ICAJLyogV2UgYWx3
YXlzIGR1bXAgcmVnaXN0ZXJzLCBtbXUsIHJpbmcgYW5kIGVuZCBtYXJrZXIgKi8KPiBAQCAtMTY3
LDYgKzE2OSw3IEBAIHZvaWQgZXRuYXZpdl9jb3JlX2R1bXAoc3RydWN0IGV0bmF2aXZfZ3B1ICpn
cHUpCj4gIAlpdGVyLnN0YXJ0ID0gX192bWFsbG9jKGZpbGVfc2l6ZSwgR0ZQX0tFUk5FTCB8IF9f
R0ZQX05PV0FSTiB8IF9fR0ZQX05PUkVUUlksCj4gIAkJCSAgICAgICBQQUdFX0tFUk5FTCk7Cj4g
IAlpZiAoIWl0ZXIuc3RhcnQpIHsKPiArCQltdXRleF91bmxvY2soJmdwdS0+bW11LT5sb2NrKTsK
PiAgCQlkZXZfd2FybihncHUtPmRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSBkZXZjb3JlZHVtcCBm
aWxlXG4iKTsKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gQEAgLTIzNCw2ICsyMzcsOCBAQCB2b2lkIGV0
bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICAJCQkJCSBvYmotPmJh
c2Uuc2l6ZSk7Cj4gIAl9Cj4gIAo+ICsJbXV0ZXhfdW5sb2NrKCZncHUtPm1tdS0+bG9jayk7Cj4g
Kwo+ICAJZXRuYXZpdl9jb3JlX2R1bXBfaGVhZGVyKCZpdGVyLCBFVERVTVBfQlVGX0VORCwgaXRl
ci5kYXRhKTsKPiAgCj4gIAlkZXZfY29yZWR1bXB2KGdwdS0+ZGV2LCBpdGVyLnN0YXJ0LCBpdGVy
LmRhdGEgLSBpdGVyLnN0YXJ0LCBHRlBfS0VSTkVMKTsKCnJlZ2FyZHMKUGhpbGlwcApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
