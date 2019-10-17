Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C67DABDE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 14:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA9F6EA5F;
	Thu, 17 Oct 2019 12:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BECD6EA5F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:19:49 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iL4ks-00087g-Np; Thu, 17 Oct 2019 14:19:46 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iL4kr-0005Yu-SV; Thu, 17 Oct 2019 14:19:45 +0200
Date: Thu, 17 Oct 2019 14:19:45 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
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
 Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6NDc6MjdQTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDEwOjEwOjU5QU0gKzAyMDAsIFV3ZSBL
bGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gQSBwcmV2aW91cyBjaGFuZ2UgaW4gdGhlIHB3bSBjb3Jl
IChuYW1lbHkgMDFjY2Y5MDNlZGQ2ICgicHdtOiBMZXQKPiA+IHB3bV9nZXRfc3RhdGUoKSByZXR1
cm4gdGhlIGxhc3QgaW1wbGVtZW50ZWQgc3RhdGUiKSkgY2hhbmdlZCB0aGUKPiA+IHNlbWFudGlj
IG9mIHB3bV9nZXRfc3RhdGUoKSBhbmQgZGlzY2xvc2VkIGFuIChhcyBpdCBzZWVtcykgY29tbW9u
Cj4gPiBwcm9ibGVtIGluIGxvd2xldmVsIFBXTSBkcml2ZXJzLiBCeSBub3QgcmVseWluZyBvbiB0
aGUgcGVyaW9kIGFuZCBkdXR5Cj4gPiBjeWNsZSBiZWluZyByZXRyaWV2YWJsZSBmcm9tIGEgZGlz
YWJsZWQgUFdNIHRoaXMgdHlwZSBvZiBwcm9ibGVtIGlzCj4gPiB3b3JrZWQgYXJvdW5kLgo+ID4g
Cj4gPiBBcGFydCBmcm9tIHRoaXMgaXNzdWUgb25seSBjYWxsaW5nIHRoZSBwd21fZ2V0X3N0YXRl
L3B3bV9hcHBseV9zdGF0ZQo+ID4gY29tYm8gb25jZSBpcyBhbHNvIG1vcmUgZWZmZWN0aXZlLgo+
IAo+IEknbSBvbmx5IGludGVyZXN0ZWQgaW4gdGhlIHNlY29uZCBwYXJhZ3JhcGggaGVyZS4KPiAK
PiBUaGVyZSBzZWVtcyB0byBiZSBhIHJlYXNvbmFibGUgY29uc2Vuc3VzIHRoYXQgdGhlIGkuTVgy
NyBhbmQgY3Jvcy1lYwo+IFBXTSBkcml2ZXJzIHNob3VsZCBiZSBmaXhlZCBmb3IgdGhlIGJlbmVm
aXQgb2Ygb3RoZXIgUFdNIGNsaWVudHMuCj4gU28gd2UgbWFrZSB0aGlzIGNoYW5nZSBiZWNhdXNl
IGl0IG1ha2VzIHRoZSBwd20tYmwgYmV0dGVyLi4uIG5vdCB0bwo+IHdvcmsgYXJvdW5kIGJ1Z3Mg
Oy0pLgoKVGhhdCdzIGZpbmUsIHN0aWxsIEkgdGhpbmsgaXQncyBmYWlyIHRvIGV4cGxhaW4gdGhl
IG1vdGl2YXRpb24gb2YKY3JlYXRpbmcgdGhpcyBwYXRjaC4KCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYwo+ID4gaW5kZXggNzQ2ZWViYzQxMWRmLi5kZGViZDYyYjM5NzggMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ID4gKysrIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+IEBAIC02Nyw0MCArNjIsMjcgQEAgc3RhdGljIHZv
aWQgcHdtX2JhY2tsaWdodF9wb3dlcl9vbihzdHJ1Y3QgcHdtX2JsX2RhdGEgKnBiKQo+ID4gIAo+
ID4gIHN0YXRpYyB2b2lkIHB3bV9iYWNrbGlnaHRfcG93ZXJfb2ZmKHN0cnVjdCBwd21fYmxfZGF0
YSAqcGIpCj4gPiAgewo+ID4gLQlzdHJ1Y3QgcHdtX3N0YXRlIHN0YXRlOwo+ID4gLQo+ID4gLQlw
d21fZ2V0X3N0YXRlKHBiLT5wd20sICZzdGF0ZSk7Cj4gPiAtCWlmICghcGItPmVuYWJsZWQpCj4g
PiAtCQlyZXR1cm47Cj4gPiAtCj4gCj4gV2h5IHJlbW92ZSB0aGUgcGItPmVuYWJsZWQgY2hlY2s/
IEkgdGhvdWdodCB0aGF0IHdhcyB0aGVyZSB0byBlbnN1cmUgd2UKPiBkb24ndCBtZXNzIHVwIHRo
ZSByZWd1bGFyIHJlZmVyZW5jZSBjb3VudHMuCgpJIGhhdm4ndCBsb29rZWQgeWV0LCBidXQgSSBn
dWVzcyBJIGhhdmUgdG8gcmVzcGluLiBFeHBlY3QgYSB2MiBsYXRlcgp0b2RheS4KCkJlc3QgcmVn
YXJkcwpVd2UKCi0tIApQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlv
bnMgICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
