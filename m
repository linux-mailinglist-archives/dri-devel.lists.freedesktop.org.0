Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C83B21DB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 16:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B503D6F3CD;
	Fri, 13 Sep 2019 14:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA366F3CD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 14:24:25 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i8mUp-0005df-Tz; Fri, 13 Sep 2019 16:24:23 +0200
Message-ID: <6c13bc86f33eff5378239b301620bf35304cb75e.camel@pengutronix.de>
Subject: Re: [PATCH 3/9] drm/etnaviv: use drm_debug_enabled() to check for
 debug categories
From: Lucas Stach <l.stach@pengutronix.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Fri, 13 Sep 2019 16:24:22 +0200
In-Reply-To: <1c06c0432d8ad1edc286da2df806b26b468ada79.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
 <1c06c0432d8ad1edc286da2df806b26b468ada79.1568375189.git.jani.nikula@intel.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnIsIDIwMTktMDktMTMgYXQgMTQ6NTEgKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+IEFs
bG93IGJldHRlciBhYnN0cmFjdGlvbiBvZiB0aGUgZHJtX2RlYnVnIGdsb2JhbCB2YXJpYWJsZSBp
biB0aGUKPiBmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBDYzogTHVjYXMgU3Rh
Y2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXgrZXRu
YXZpdkBhcm1saW51eC5vcmcudWs+Cj4gQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4u
Z21laW5lckBnbWFpbC5jb20+Cj4gQ2M6IGV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
U2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCkFja2Vk
LWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMgfCA4ICsrKystLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jCj4gaW5kZXggN2U0ZTI5NTliZjRmLi4zMmQ5
ZmFjNTg3ZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9i
dWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMK
PiBAQCAtMzI2LDcgKzMyNiw3IEBAIHZvaWQgZXRuYXZpdl9idWZmZXJfcXVldWUoc3RydWN0IGV0
bmF2aXZfZ3B1ICpncHUsIHUzMiBleGVjX3N0YXRlLAo+ICAKPiAgCWxvY2tkZXBfYXNzZXJ0X2hl
bGQoJmdwdS0+bG9jayk7Cj4gIAo+IC0JaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpCj4g
KwlpZiAoZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RSSVZFUikpCj4gIAkJZXRuYXZpdl9idWZm
ZXJfZHVtcChncHUsIGJ1ZmZlciwgMCwgMHg1MCk7Cj4gIAo+ICAJbGlua190YXJnZXQgPSBldG5h
dml2X2NtZGJ1Zl9nZXRfdmEoY21kYnVmLAo+IEBAIC00NTksMTMgKzQ1OSwxMyBAQCB2b2lkIGV0
bmF2aXZfYnVmZmVyX3F1ZXVlKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LCB1MzIgZXhlY19zdGF0
ZSwKPiAgCQkgZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKGJ1ZmZlciwgJmdwdS0+bW11X2NvbnRleHQt
PmNtZGJ1Zl9tYXBwaW5nKQo+ICAJCSArIGJ1ZmZlci0+dXNlcl9zaXplIC0gNCk7Cj4gIAo+IC0J
aWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpCj4gKwlpZiAoZHJtX2RlYnVnX2VuYWJsZWQo
RFJNX1VUX0RSSVZFUikpCj4gIAkJcHJfaW5mbygic3RyZWFtIGxpbmsgdG8gMHglMDh4IEAgMHgl
MDh4ICVwXG4iLAo+ICAJCQlyZXR1cm5fdGFyZ2V0LAo+ICAJCQlldG5hdml2X2NtZGJ1Zl9nZXRf
dmEoY21kYnVmLCAmZ3B1LT5tbXVfY29udGV4dC0+Y21kYnVmX21hcHBpbmcpLAo+ICAJCQljbWRi
dWYtPnZhZGRyKTsKPiAgCj4gLQlpZiAoZHJtX2RlYnVnICYgRFJNX1VUX0RSSVZFUikgewo+ICsJ
aWYgKGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUklWRVIpKSB7Cj4gIAkJcHJpbnRfaGV4X2R1
bXAoS0VSTl9JTkZPLCAiY21kICIsIERVTVBfUFJFRklYX09GRlNFVCwgMTYsIDQsCj4gIAkJCSAg
ICAgICBjbWRidWYtPnZhZGRyLCBjbWRidWYtPnNpemUsIDApOwo+ICAKPiBAQCAtNDg0LDYgKzQ4
NCw2IEBAIHZvaWQgZXRuYXZpdl9idWZmZXJfcXVldWUoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUs
IHUzMiBleGVjX3N0YXRlLAo+ICAJCQkJICAgIFZJVl9GRV9MSU5LX0hFQURFUl9QUkVGRVRDSChs
aW5rX2R3b3JkcyksCj4gIAkJCQkgICAgbGlua190YXJnZXQpOwo+ICAKPiAtCWlmIChkcm1fZGVi
dWcgJiBEUk1fVVRfRFJJVkVSKQo+ICsJaWYgKGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUklW
RVIpKQo+ICAJCWV0bmF2aXZfYnVmZmVyX2R1bXAoZ3B1LCBidWZmZXIsIDAsIDB4NTApOwo+ICB9
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
