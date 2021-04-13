Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D585535E10B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AB189D79;
	Tue, 13 Apr 2021 14:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5149989D79
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:14:14 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lWJnw-0001Xa-8n; Tue, 13 Apr 2021 16:14:12 +0200
Message-ID: <83a41b2e9636cb6a790b23843c6d2628d02c6997.camel@pengutronix.de>
Subject: Re: [PATCH 05/12] drm/imx: Don't set allow_fb_modifiers explicitly
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Apr 2021 16:14:11 +0200
In-Reply-To: <YHWk9V/4mu1lGFgD@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-5-daniel.vetter@ffwll.ch>
 <290aef5ed13749d465eb19235aa87a2cef63dd2a.camel@pengutronix.de>
 <YHWk9V/4mu1lGFgD@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRGllbnN0YWcsIGRlbSAxMy4wNC4yMDIxIHVtIDE2OjA0ICswMjAwIHNjaHJpZWIgRGFuaWVs
IFZldHRlcjoKPiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAwMTo0NzoyOFBNICswMjAwLCBMdWNh
cyBTdGFjaCB3cm90ZToKPiA+IEFtIERpZW5zdGFnLCBkZW0gMTMuMDQuMjAyMSB1bSAxMTo0OCAr
MDIwMCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+IFNpbmNlCj4gPiA+IAo+ID4gPiBjb21t
aXQgODkwODgwZGRmZGJlMjU2MDgzMTcwODY2ZTQ5Yzg3NjE4YjcwNmFjNwo+ID4gPiBBdXRob3I6
IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiA+ID4g
RGF0ZTogICBGcmkgSmFuIDQgMDk6NTY6MTAgMjAxOSArMDEwMAo+ID4gPiAKPiA+ID4gwqDCoMKg
wqBkcm06IEF1dG8tc2V0IGFsbG93X2ZiX21vZGlmaWVycyB3aGVuIGdpdmVuIG1vZGlmaWVycyBh
dCBwbGFuZSBpbml0Cj4gPiA+IAo+ID4gPiB0aGlzIGlzIGRvbmUgYXV0b21hdGljYWxseSBhcyBw
YXJ0IG9mIHBsYW5lIGluaXQsIGlmIGRyaXZlcnMgc2V0IHRoZQo+ID4gPiBtb2RpZmllciBsaXN0
IGNvcnJlY3RseS4gV2hpY2ggaXMgdGhlIGNhc2UgaGVyZS4KPiA+ID4gCj4gPiA+IFRoaXMgb25l
IGFjdHVhbGx5IHNldCBpdCB0d2ljZSBvbiB0b3Agb2Ygd2hhdCBkcm1fcGxhbmVfaW5pdCBkb2Vz
LCBzbwo+ID4gPiBkb3VibGUtcmVkdW5kYW50IQo+ID4gCj4gPiBUaGF0J3Mgbm90IHRydWUuIGlt
eC1kY3NzIGFuZCBpbXgtZHJtIGFyZSB0d28gdG90YWxseSBzZXBhcmF0ZSBkcml2ZXJzLgo+ID4g
TWF5YmUgd2Ugc2hvdWxkIG1vdmUgaW14LWRybSBpbnRvIGl0cyBvd24gaXB1djMgZGlyZWN0b3J5
IG9uZSBkYXkgdG8KPiA+IG1ha2UgdGhpcyBtb3JlIGNsZWFyLiBDaGFuZ2UgaXMgc3RpbGwgY29y
cmVjdCwgdGhvdWdoLgo+IAo+IEhtIEkgZ3JlZXBlZCBmb3IgZHJtX3VuaXZlcnNhbF9wbGFuZV9p
bml0IGFuZCBkaWRuJ3QgZmluZCBhbnl0aGluZiBmb3IgdGhlCj4gaW14IG1haW4gZHJpdmVyIC4u
LiB3aGVyZSBhcmUgcGxhbmVzIHNldCB1cCBmb3IgdGhhdD8gTmVlZCB0byByZXZpZXcgdGhhdAo+
IHRoZXkgaGF2ZSB0aGUgbW9kaWZpZXJzIGxpc3RlZCBpbiBhbGwgY2FzZXMuCgpUaGF0J3MgaW4g
ZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jIGFuZCBtb2RpZmllcnMgYXJlIGFsd2F5
cwpzZXQgb24gcGxhbmUgaW5pdC4KClJlZ2FyZHMsCkx1Y2FzCgo+IAo+ID4gCj4gPiBSZXZpZXdl
ZC1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gPiAKPiA+ID4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiA+
IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+ID4gPiBDYzogU2hh
d24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgo+ID4gPiBDYzogU2FzY2hhIEhhdWVyIDxzLmhh
dWVyQHBlbmd1dHJvbml4LmRlPgo+ID4gPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtl
cm5lbEBwZW5ndXRyb25peC5kZT4KPiA+ID4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdt
YWlsLmNvbT4KPiA+ID4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KPiA+
ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiAtLS0KPiA+
ID4gwqBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1rbXMuYyB8IDEgLQo+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMgIHwgMSAtCj4gPiA+IMKgMiBmaWxlcyBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pbXgvZGNzcy9kY3NzLWttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9kY3NzL2Rj
c3Mta21zLmMKPiA+ID4gaW5kZXggYjU0OWNlNWU3NjA3Li4zN2FlNjhhN2ZiYTUgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvZGNzcy9kY3NzLWttcy5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pbXgvZGNzcy9kY3NzLWttcy5jCj4gPiA+IEBAIC01Miw3ICs1Miw2
IEBAIHN0YXRpYyB2b2lkIGRjc3Nfa21zX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGRjc3Nfa21z
X2RldiAqa21zKQo+ID4gPiDCoAljb25maWctPm1pbl9oZWlnaHQgPSAxOwo+ID4gPiDCoAljb25m
aWctPm1heF93aWR0aCA9IDQwOTY7Cj4gPiA+IMKgCWNvbmZpZy0+bWF4X2hlaWdodCA9IDQwOTY7
Cj4gPiA+IC0JY29uZmlnLT5hbGxvd19mYl9tb2RpZmllcnMgPSB0cnVlOwo+ID4gPiDCoAljb25m
aWctPm5vcm1hbGl6ZV96cG9zID0gdHJ1ZTsKPiA+ID4gwqAKPiA+ID4gCj4gPiA+IAo+ID4gPiAK
PiA+ID4gwqAJY29uZmlnLT5mdW5jcyA9ICZkY3NzX2RybV9tb2RlX2NvbmZpZ19mdW5jczsKPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jCj4gPiA+IGluZGV4IDJkZWQ4ZTRmMzJkMC4u
OGJlNGVkYWVjOTU4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1k
cm0tY29yZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMK
PiA+ID4gQEAgLTIwOSw3ICsyMDksNiBAQCBzdGF0aWMgaW50IGlteF9kcm1fYmluZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gPiA+IMKgCWRybS0+bW9kZV9jb25maWcubWF4X2hlaWdodCA9IDQwOTY7
Cj4gPiA+IMKgCWRybS0+bW9kZV9jb25maWcuZnVuY3MgPSAmaW14X2RybV9tb2RlX2NvbmZpZ19m
dW5jczsKPiA+ID4gwqAJZHJtLT5tb2RlX2NvbmZpZy5oZWxwZXJfcHJpdmF0ZSA9ICZpbXhfZHJt
X21vZGVfY29uZmlnX2hlbHBlcnM7Cj4gPiA+IC0JZHJtLT5tb2RlX2NvbmZpZy5hbGxvd19mYl9t
b2RpZmllcnMgPSB0cnVlOwo+ID4gPiDCoAlkcm0tPm1vZGVfY29uZmlnLm5vcm1hbGl6ZV96cG9z
ID0gdHJ1ZTsKPiA+ID4gwqAKPiA+ID4gCj4gPiA+IAo+ID4gPiAKPiA+ID4gwqAJcmV0ID0gZHJt
bV9tb2RlX2NvbmZpZ19pbml0KGRybSk7Cj4gPiAKPiA+IAo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
