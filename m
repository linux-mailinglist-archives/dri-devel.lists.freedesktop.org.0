Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5ADB61F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 20:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55756E043;
	Thu, 17 Oct 2019 18:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCA16E043
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 18:28:42 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iLAVs-00086n-1C; Thu, 17 Oct 2019 20:28:40 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iLAVr-0001DC-0G; Thu, 17 Oct 2019 20:28:39 +0200
Date: Thu, 17 Oct 2019 20:28:38 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017182838.e3mx3vmwqcvb3aco@pengutronix.de>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
 <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
 <20191017131802.defwuzrgq4ai4mud@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017131802.defwuzrgq4ai4mud@holly.lan>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDI6MTg6MDJQTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDAyOjE5OjQ1UE0gKzAyMDAsIFV3ZSBL
bGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6NDc6MjdQ
TSArMDEwMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAx
OSBhdCAxMDoxMDo1OUFNICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gPiBB
IHByZXZpb3VzIGNoYW5nZSBpbiB0aGUgcHdtIGNvcmUgKG5hbWVseSAwMWNjZjkwM2VkZDYgKCJw
d206IExldAo+ID4gPiA+IHB3bV9nZXRfc3RhdGUoKSByZXR1cm4gdGhlIGxhc3QgaW1wbGVtZW50
ZWQgc3RhdGUiKSkgY2hhbmdlZCB0aGUKPiA+ID4gPiBzZW1hbnRpYyBvZiBwd21fZ2V0X3N0YXRl
KCkgYW5kIGRpc2Nsb3NlZCBhbiAoYXMgaXQgc2VlbXMpIGNvbW1vbgo+ID4gPiA+IHByb2JsZW0g
aW4gbG93bGV2ZWwgUFdNIGRyaXZlcnMuIEJ5IG5vdCByZWx5aW5nIG9uIHRoZSBwZXJpb2QgYW5k
IGR1dHkKPiA+ID4gPiBjeWNsZSBiZWluZyByZXRyaWV2YWJsZSBmcm9tIGEgZGlzYWJsZWQgUFdN
IHRoaXMgdHlwZSBvZiBwcm9ibGVtIGlzCj4gPiA+ID4gd29ya2VkIGFyb3VuZC4KPiA+ID4gPiAK
PiA+ID4gPiBBcGFydCBmcm9tIHRoaXMgaXNzdWUgb25seSBjYWxsaW5nIHRoZSBwd21fZ2V0X3N0
YXRlL3B3bV9hcHBseV9zdGF0ZQo+ID4gPiA+IGNvbWJvIG9uY2UgaXMgYWxzbyBtb3JlIGVmZmVj
dGl2ZS4KPiA+ID4gCj4gPiA+IEknbSBvbmx5IGludGVyZXN0ZWQgaW4gdGhlIHNlY29uZCBwYXJh
Z3JhcGggaGVyZS4KPiA+ID4gCj4gPiA+IFRoZXJlIHNlZW1zIHRvIGJlIGEgcmVhc29uYWJsZSBj
b25zZW5zdXMgdGhhdCB0aGUgaS5NWDI3IGFuZCBjcm9zLWVjCj4gPiA+IFBXTSBkcml2ZXJzIHNo
b3VsZCBiZSBmaXhlZCBmb3IgdGhlIGJlbmVmaXQgb2Ygb3RoZXIgUFdNIGNsaWVudHMuCj4gPiA+
IFNvIHdlIG1ha2UgdGhpcyBjaGFuZ2UgYmVjYXVzZSBpdCBtYWtlcyB0aGUgcHdtLWJsIGJldHRl
ci4uLiBub3QgdG8KPiA+ID4gd29yayBhcm91bmQgYnVncyA7LSkuCj4gPiAKPiA+IFRoYXQncyBm
aW5lLCBzdGlsbCBJIHRoaW5rIGl0J3MgZmFpciB0byBleHBsYWluIHRoZSBtb3RpdmF0aW9uIG9m
Cj4gPiBjcmVhdGluZyB0aGlzIHBhdGNoLgo+IAo+IE1heWJlLgo+IAo+IFdoZXRoZXIgdGhpcyBw
YXRjaCBpcyBhIHdvcmthcm91bmQgb3Igc2ltcGx5IGFuIGltcHJvdmVtZW50IHRvIHB3bS1ibAo+
IGRvZXMgbmVlZCB0byBiZSBjbGVhciBzaW5jZSBpdCBhZmZlY3RzIHdoZXRoZXIgTGVlIHN0ZWVy
cyBpdCB0b3dhcmRzCj4gdjUuNC1yY1ggb3IgbGludXgtbmV4dCAuCgpHaXZlbiB0aGF0IHRoZXJl
IHdpbGwgYmUgYSBhIGZpeCBpbiB0aGUgcHdtIHN1YnN5c3RlbSBJJ2Qgc2F5IGxpbnV4LW5leHQK
c291bmRzIHJpZ2h0LgoKQmVzdCByZWdhcmRzClV3ZQoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAgICAgICAgfApJ
bmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBl
bmd1dHJvbml4LmRlLyAgfApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
