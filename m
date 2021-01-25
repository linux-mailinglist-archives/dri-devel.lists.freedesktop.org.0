Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C63028EF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 18:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8057E896D8;
	Mon, 25 Jan 2021 17:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775A896D8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:32:27 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1l45iw-0006oS-BC; Mon, 25 Jan 2021 18:32:22 +0100
Message-ID: <f65185790a373d293a111316768e3e8ece3e97da.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: provide more ID values via GET_PARAM ioctl.
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Mon, 25 Jan 2021 18:32:18 +0100
In-Reply-To: <20201216114209.276630-1-christian.gmeiner@gmail.com>
References: <20201216114209.276630-1-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbSAxNi4xMi4yMDIwIHVtIDEyOjQyICswMTAwIHNjaHJpZWIgQ2hyaXN0
aWFuIEdtZWluZXI6Cj4gTWFrZSBpdCBwb3NzaWJsZSBmb3IgdGhlIHVzZXIgc3BhY2UgdG8gYWNj
ZXNzIHRoZXNlIElEIHZhbHVlcy4KClRoYW5rcywgSSd2ZSBhZGRlZCB0aGlzIHBhdGNoIHRvIG15
IGV0bmF2aXYvbmV4dCBicmFuY2guCgpSZWdhcmRzLApMdWNhcwoKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+IC0tLQo+IMKg
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyB8IDEyICsrKysrKysrKysrKwo+
IMKgaW5jbHVkZS91YXBpL2RybS9ldG5hdml2X2RybS5oICAgICAgICB8ICAzICsrKwo+IMKgMiBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2dwdS5jCj4gaW5kZXggYzY0MDRiOGQwNjdmLi5lYzE2OTkxYmE4YjYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKPiBAQCAtMTU2LDYgKzE1NiwxOCBAQCBp
bnQgZXRuYXZpdl9ncHVfZ2V0X3BhcmFtKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LCB1MzIgcGFy
YW0sIHU2NCAqdmFsdWUpCj4gwqAJCQkqdmFsdWUgPSB+MFVMTDsKPiDCoAkJYnJlYWs7Cj4gwqAK
PiAKPiAKPiAKPiArCWNhc2UgRVROQVZJVl9QQVJBTV9HUFVfUFJPRFVDVF9JRDoKPiArCQkqdmFs
dWUgPSBncHUtPmlkZW50aXR5LnByb2R1Y3RfaWQ7Cj4gKwkJYnJlYWs7Cj4gKwo+ICsJY2FzZSBF
VE5BVklWX1BBUkFNX0dQVV9DVVNUT01FUl9JRDoKPiArCQkqdmFsdWUgPSBncHUtPmlkZW50aXR5
LmN1c3RvbWVyX2lkOwo+ICsJCWJyZWFrOwo+ICsKPiArCWNhc2UgRVROQVZJVl9QQVJBTV9HUFVf
RUNPX0lEOgo+ICsJCSp2YWx1ZSA9IGdwdS0+aWRlbnRpdHkuZWNvX2lkOwo+ICsJCWJyZWFrOwo+
ICsKPiDCoAlkZWZhdWx0Ogo+IMKgCQlEQkcoIiVzOiBpbnZhbGlkIHBhcmFtOiAldSIsIGRldl9u
YW1lKGdwdS0+ZGV2KSwgcGFyYW0pOwo+IMKgCQlyZXR1cm4gLUVJTlZBTDsKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS91YXBpL2RybS9ldG5hdml2X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9ldG5h
dml2X2RybS5oCj4gaW5kZXggMDlkMGRmOGI3MWM1Li5hZjAyNGQ5MDQ1M2QgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS91YXBpL2RybS9ldG5hdml2X2RybS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2Ry
bS9ldG5hdml2X2RybS5oCj4gQEAgLTc0LDYgKzc0LDkgQEAgc3RydWN0IGRybV9ldG5hdml2X3Rp
bWVzcGVjIHsKPiDCoCNkZWZpbmUgRVROQVZJVl9QQVJBTV9HUFVfTlVNX0NPTlNUQU5UUyAgICAg
ICAgICAgICAweDE5Cj4gwqAjZGVmaW5lIEVUTkFWSVZfUEFSQU1fR1BVX05VTV9WQVJZSU5HUyAg
ICAgICAgICAgICAgMHgxYQo+IMKgI2RlZmluZSBFVE5BVklWX1BBUkFNX1NPRlRQSU5fU1RBUlRf
QUREUiAgICAgICAgICAgIDB4MWIKPiArI2RlZmluZSBFVE5BVklWX1BBUkFNX0dQVV9QUk9EVUNU
X0lEICAgICAgICAgICAgICAgIDB4MWMKPiArI2RlZmluZSBFVE5BVklWX1BBUkFNX0dQVV9DVVNU
T01FUl9JRCAgICAgICAgICAgICAgIDB4MWQKPiArI2RlZmluZSBFVE5BVklWX1BBUkFNX0dQVV9F
Q09fSUQgICAgICAgICAgICAgICAgICAgIDB4MWUKPiDCoAo+IAo+IAo+IAo+IMKgI2RlZmluZSBF
VE5BX01BWF9QSVBFUyA0Cj4gwqAKPiAKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
