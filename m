Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288B72C99
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 12:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B596E503;
	Wed, 24 Jul 2019 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847806E503
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 10:51:32 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hqErq-0000CA-FO; Wed, 24 Jul 2019 12:51:30 +0200
Message-ID: <1563965489.2914.4.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: fix etnaviv_cmdbuf_suballoc_new return
 value
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Wed, 24 Jul 2019 12:51:29 +0200
In-Reply-To: <20190705171536.26727-1-l.stach@pengutronix.de>
References: <20190705171536.26727-1-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
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

T24gRnJpLCAyMDE5LTA3LTA1IGF0IDE5OjE1ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBU
aGUgY2FsbCBzaXRlIGV4cGVjdHMgdG8gZ2V0IGVpdGhlciBhIHZhbGlkIHN1YmFsbG9jIG9yIGFu
IGVycm9yCj4gcG9pbnRlciwgc28gYSBOVUxMIHJldHVybiB3aWxsIG5vdCBiZSB0cmVhdGVkIGFz
IGFuIGVycm9yLiBNYWtlCj4gc3VyZSB0byBhbHdheXMgcmV0dXJuIGEgcHJvcGVyIGVycm9yIHBv
aW50ZXIgaW4gY2FzZSBzb21ldGhpbmcgZ29lcwo+IHdyb25nLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBoaWxpcHAKCj4gIGRy
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfY21kYnVmLmMgfCA2ICsrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2NtZGJ1Zi5jIGIvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9jbWRidWYuYwo+IGluZGV4IGJiNDkwMGJjMWM0Yy4uN2I3
Nzk5MmYzMWM0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Y21kYnVmLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2NtZGJ1Zi5j
Cj4gQEAgLTQ4LDggKzQ4LDEwIEBAIGV0bmF2aXZfY21kYnVmX3N1YmFsbG9jX25ldyhzdHJ1Y3Qg
ZXRuYXZpdl9ncHUgKiBncHUpCj4gIAo+ICAJc3ViYWxsb2MtPnZhZGRyID0gZG1hX2FsbG9jX3dj
KGdwdS0+ZGV2LCBTVUJBTExPQ19TSVpFLAo+ICAJCQkJICAgICAgICZzdWJhbGxvYy0+cGFkZHIs
IEdGUF9LRVJORUwpOwo+IC0JaWYgKCFzdWJhbGxvYy0+dmFkZHIpCj4gKwlpZiAoIXN1YmFsbG9j
LT52YWRkcikgewo+ICsJCXJldCA9IC1FTk9NRU07Cj4gIAkJZ290byBmcmVlX3N1YmFsbG9jOwo+
ICsJfQo+ICAKPiAgCXJldCA9IGV0bmF2aXZfaW9tbXVfZ2V0X3N1YmFsbG9jX3ZhKGdwdSwgc3Vi
YWxsb2MtPnBhZGRyLAo+ICAJCQkJCSAgICAmc3ViYWxsb2MtPnZyYW1fbm9kZSwgU1VCQUxMT0Nf
U0laRSwKPiBAQCAtNjQsNyArNjYsNyBAQCBldG5hdml2X2NtZGJ1Zl9zdWJhbGxvY19uZXcoc3Ry
dWN0IGV0bmF2aXZfZ3B1ICogZ3B1KQo+ICBmcmVlX3N1YmFsbG9jOgo+ICAJa2ZyZWUoc3ViYWxs
b2MpOwo+ICAKPiAtCXJldHVybiBOVUxMOwo+ICsJcmV0dXJuIEVSUl9QVFIocmV0KTsKPiAgfQo+
ICAKPiAgdm9pZCBldG5hdml2X2NtZGJ1Zl9zdWJhbGxvY19kZXN0cm95KHN0cnVjdCBldG5hdml2
X2NtZGJ1Zl9zdWJhbGxvYyAqc3ViYWxsb2MpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
