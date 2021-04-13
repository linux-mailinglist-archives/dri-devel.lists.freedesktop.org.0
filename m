Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B235DE07
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 13:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077D789F5B;
	Tue, 13 Apr 2021 11:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6912C89D5E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 11:47:31 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lWHVx-0001uN-Hk; Tue, 13 Apr 2021 13:47:29 +0200
Message-ID: <290aef5ed13749d465eb19235aa87a2cef63dd2a.camel@pengutronix.de>
Subject: Re: [PATCH 05/12] drm/imx: Don't set allow_fb_modifiers explicitly
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Tue, 13 Apr 2021 13:47:28 +0200
In-Reply-To: <20210413094904.3736372-5-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-5-daniel.vetter@ffwll.ch>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRGllbnN0YWcsIGRlbSAxMy4wNC4yMDIxIHVtIDExOjQ4ICswMjAwIHNjaHJpZWIgRGFuaWVs
IFZldHRlcjoKPiBTaW5jZQo+IAo+IGNvbW1pdCA4OTA4ODBkZGZkYmUyNTYwODMxNzA4NjZlNDlj
ODc2MThiNzA2YWM3Cj4gQXV0aG9yOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dz
a2lAYm9vdGxpbi5jb20+Cj4gRGF0ZTogICBGcmkgSmFuIDQgMDk6NTY6MTAgMjAxOSArMDEwMAo+
IAo+IMKgwqDCoMKgZHJtOiBBdXRvLXNldCBhbGxvd19mYl9tb2RpZmllcnMgd2hlbiBnaXZlbiBt
b2RpZmllcnMgYXQgcGxhbmUgaW5pdAo+IAo+IHRoaXMgaXMgZG9uZSBhdXRvbWF0aWNhbGx5IGFz
IHBhcnQgb2YgcGxhbmUgaW5pdCwgaWYgZHJpdmVycyBzZXQgdGhlCj4gbW9kaWZpZXIgbGlzdCBj
b3JyZWN0bHkuIFdoaWNoIGlzIHRoZSBjYXNlIGhlcmUuCj4gCj4gVGhpcyBvbmUgYWN0dWFsbHkg
c2V0IGl0IHR3aWNlIG9uIHRvcCBvZiB3aGF0IGRybV9wbGFuZV9pbml0IGRvZXMsIHNvCj4gZG91
YmxlLXJlZHVuZGFudCEKClRoYXQncyBub3QgdHJ1ZS4gaW14LWRjc3MgYW5kIGlteC1kcm0gYXJl
IHR3byB0b3RhbGx5IHNlcGFyYXRlIGRyaXZlcnMuCk1heWJlIHdlIHNob3VsZCBtb3ZlIGlteC1k
cm0gaW50byBpdHMgb3duIGlwdXYzIGRpcmVjdG9yeSBvbmUgZGF5IHRvCm1ha2UgdGhpcyBtb3Jl
IGNsZWFyLiBDaGFuZ2UgaXMgc3RpbGwgY29ycmVjdCwgdGhvdWdoLgoKUmV2aWV3ZWQtYnk6IEx1
Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwu
b3JnPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFBl
bmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEZhYmlv
IEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4
LWlteEBueHAuY29tPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pbXgvZGNzcy9kY3NzLWttcy5jIHwgMSAtCj4gwqBk
cml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jICB8IDEgLQo+IMKgMiBmaWxlcyBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14
L2Rjc3MvZGNzcy1rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvZGNzcy9kY3NzLWttcy5jCj4g
aW5kZXggYjU0OWNlNWU3NjA3Li4zN2FlNjhhN2ZiYTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2lteC9kY3NzL2Rjc3Mta21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2Rj
c3MvZGNzcy1rbXMuYwo+IEBAIC01Miw3ICs1Miw2IEBAIHN0YXRpYyB2b2lkIGRjc3Nfa21zX21v
ZGVfY29uZmlnX2luaXQoc3RydWN0IGRjc3Nfa21zX2RldiAqa21zKQo+IMKgCWNvbmZpZy0+bWlu
X2hlaWdodCA9IDE7Cj4gwqAJY29uZmlnLT5tYXhfd2lkdGggPSA0MDk2Owo+IMKgCWNvbmZpZy0+
bWF4X2hlaWdodCA9IDQwOTY7Cj4gLQljb25maWctPmFsbG93X2ZiX21vZGlmaWVycyA9IHRydWU7
Cj4gwqAJY29uZmlnLT5ub3JtYWxpemVfenBvcyA9IHRydWU7Cj4gwqAKPiAKPiAKPiAKPiDCoAlj
b25maWctPmZ1bmNzID0gJmRjc3NfZHJtX21vZGVfY29uZmlnX2Z1bmNzOwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lt
eC9pbXgtZHJtLWNvcmUuYwo+IGluZGV4IDJkZWQ4ZTRmMzJkMC4uOGJlNGVkYWVjOTU4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jCj4gQEAgLTIwOSw3ICsyMDksNiBAQCBzdGF0
aWMgaW50IGlteF9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gwqAJZHJtLT5tb2RlX2Nv
bmZpZy5tYXhfaGVpZ2h0ID0gNDA5NjsKPiDCoAlkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0gJmlt
eF9kcm1fbW9kZV9jb25maWdfZnVuY3M7Cj4gwqAJZHJtLT5tb2RlX2NvbmZpZy5oZWxwZXJfcHJp
dmF0ZSA9ICZpbXhfZHJtX21vZGVfY29uZmlnX2hlbHBlcnM7Cj4gLQlkcm0tPm1vZGVfY29uZmln
LmFsbG93X2ZiX21vZGlmaWVycyA9IHRydWU7Cj4gwqAJZHJtLT5tb2RlX2NvbmZpZy5ub3JtYWxp
emVfenBvcyA9IHRydWU7Cj4gwqAKPiAKPiAKPiAKPiDCoAlyZXQgPSBkcm1tX21vZGVfY29uZmln
X2luaXQoZHJtKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
