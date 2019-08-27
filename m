Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D107B9DCEB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 07:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3878789A08;
	Tue, 27 Aug 2019 05:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3210A89A08
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 05:00:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 73DC5804B3;
 Tue, 27 Aug 2019 07:00:56 +0200 (CEST)
Date: Tue, 27 Aug 2019 07:00:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Hardcode panel type to DPI
Message-ID: <20190827050054.GA22071@ravnborg.org>
References: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
 <1566595809.1871.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566595809.1871.0@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=P1BnusSwAAAA:8
 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8 a=Ktmbzm-9Js0Q_TGCLygA:9
 a=wPNLvfGTeEIA:10 a=D0XLA9XvdZm18NrgonBM:22 a=9LHmKk7ezEChjTCyhBa9:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTE6MzA6MDlQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiBIaSBMYXVyZW50LAo+IAo+IAo+IExlIHZlbi4gMjMgYW/Du3QgMjAxOSDDoCAyMzoy
MywgTGF1cmVudCBQaW5jaGFydAo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
IGEgw6ljcml0IDoKPiA+IFRoZSBpbmdlbmljIGRyaXZlciBzdXBwb3J0cyBEUEkgcGFuZWxzIG9u
bHkgYXQgdGhlIG1vbWVudCwgc28gaGFyZGNvZGUKPiA+IHRoZWlyIHR5cGUgdG8gRFBJIGluc3Rl
YWQgb2YgVW5rbm93bi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiBQYXVsLCBhcyB0
aGUgZHJpdmVyIGhhcyBiZWVuIG1lcmdlZCBpbiB2NS4zLXJjMSwgdGhpcyBpcyBhIGNhbmRpZGF0
ZSBmb3IKPiA+IGEgdjUuMyBmaXguIEtlZXBpbmcgdGhlIGNvbm5lY3RvciB0eXBlIGFzIHVua25v
d24gY291bGQgY2F1c2UgYQo+ID4gdXNlcnNwYWNlIGRlcGVuZGVuY3kgb24gaXQsIHByZXZlbnRp
bmcgaXQgZnJvbSBiZWluZyBjaGFuZ2VkIGxhdGVyLgo+IAo+IE1ha2VzIHNlbnNlLgo+IAo+IFJl
dmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KCkluIGFub3Ro
ZXIgbWFpbCB3ZSBkaXNjdXNzIENPTk5FQ1RPUl9QQU5FTC4gQnV0IHdlIHNob3VsZCBub3QgaG9s
ZCB1cApkdWUgdG8gdGhpcy4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KClBhdWwgLSB3aWxsIHlvdSBhcHBseSB0byBkcm0tbWlzYy1maXhlcz8KCglTYW0KCgo+
IAo+IAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5p
Yy1kcm0uYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCj4gPiBp
bmRleCBjZTFmYWUzYTc4YTkuLjJlMmVkNjUzZTljNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
bmdlbmljL2luZ2VuaWMtZHJtLmMKPiA+IEBAIC02NzUsMTAgKzY3NSw5IEBAIHN0YXRpYyBpbnQg
aW5nZW5pY19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+ID4gKnBkZXYpCj4gPiAg
CQlyZXR1cm4gcmV0Owo+ID4gIAl9Cj4gPiAKPiA+IC0JaWYgKHBhbmVsKSB7Cj4gPiArCWlmIChw
YW5lbCkKPiA+ICAJCWJyaWRnZSA9IGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQoZGV2LCBwYW5l
bCwKPiA+IC0JCQkJCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93bik7Cj4gPiAtCX0KPiA+
ICsJCQkJCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfRFBJKTsKPiA+IAo+ID4gIAlwcml2LT5kbWFf
aHdkZXNjID0gZG1hX2FsbG9jX2NvaGVyZW50KGRldiwgc2l6ZW9mKCpwcml2LT5kbWFfaHdkZXNj
KSwKPiA+ICAJCQkJCSAgICAgICZwcml2LT5kbWFfaHdkZXNjX3BoeXMsCj4gPiAtLQo+ID4gUmVn
YXJkcywKPiA+IAo+ID4gTGF1cmVudCBQaW5jaGFydAo+ID4gCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
