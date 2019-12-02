Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04910E70B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B5D89CBA;
	Mon,  2 Dec 2019 08:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 500 seconds by postgrey-1.36 at gabe;
 Mon, 02 Dec 2019 08:49:19 UTC
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu [138.201.91.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFFE89CB2;
 Mon,  2 Dec 2019 08:49:19 +0000 (UTC)
Received: from aether.lan.sysophe.eu (unknown
 [IPv6:2001:a18:24b:8201:e8b:fdff:fea0:3408])
 by smtp.sysophe.eu (Postfix) with ESMTPSA id B0DE6103DF1E1;
 Mon,  2 Dec 2019 09:35:27 +0100 (CET)
Date: Mon, 2 Dec 2019 09:40:47 +0100
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 11/14] HID: picoLCD: constify fb ops
Message-ID: <20191202094047.34525a7d@aether.lan.sysophe.eu>
In-Reply-To: <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com>
X-Mailer: Claws Mail 3.17.4git3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaSwKCk9uIEZyaSwgMjkgTm92IDIwMTkgMTI6Mjk6NDEgSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4gd3JvdGU6Cj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBz
dHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2UgY2FuIHN0YXJ0Cj4gbWFraW5nIHRoZSBvcHMgY29u
c3QgYXMgd2VsbC4KPgo+IHYyOiBmaXgJdHlwbyAoQ2hyaXN0b3BoZSBkZSBEaW5lY2hpbikKCkZp
bmUgd2l0aCBtZS4KSSBkb24ndCB0aGluayBnb2luZyB0aHJvdWdoIGRybS1taXNjIHdvdWxkIHRy
aWdnZXIgYW55IGNvbmZsaWN0LCBidXQKYWRkaW5nIEppcmkgdG8gQ0MgZm9yIHRoZSBjYXNlIHRo
ZXJlIHdhcyBhbnkgcHJlZmVyZW5jZS4KCkFja2VkLWJ5OiBCcnVubyBQcsOpbW9udCA8Ym9uYm9u
c0BsaW51eC12c2VydmVyLm9yZz4KCj4gQ2M6IEJydW5vIFByw6ltb250IDxib25ib25zQGxpbnV4
LXZzZXJ2ZXIub3JnPgo+IENjOiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcKPiBSZXZpZXdl
ZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2hpZC9oaWQtcGljb2xjZF9mYi5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQt
cGljb2xjZF9mYi5jIGIvZHJpdmVycy9oaWQvaGlkLXBpY29sY2RfZmIuYwo+IGluZGV4IGUxNjJh
NjY4ZmI3ZS4uYTU0OWM0MmU4YzkwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaGlkL2hpZC1waWNv
bGNkX2ZiLmMKPiArKysgYi9kcml2ZXJzL2hpZC9oaWQtcGljb2xjZF9mYi5jCj4gQEAgLTQxNyw4
ICs0MTcsNyBAQCBzdGF0aWMgaW50IHBpY29sY2Rfc2V0X3BhcihzdHJ1Y3QgZmJfaW5mbyAqaW5m
bykKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IC0vKiBOb3RlIHRoaXMgY2FuJ3QgYmUgY29uc3Qg
YmVjYXVzZSBvZiBzdHJ1Y3QgZmJfaW5mbyBkZWZpbml0aW9uICovCj4gLXN0YXRpYyBzdHJ1Y3Qg
ZmJfb3BzIHBpY29sY2RmYl9vcHMgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIHBp
Y29sY2RmYl9vcHMgPSB7Cj4gIAkub3duZXIgICAgICAgID0gVEhJU19NT0RVTEUsCj4gIAkuZmJf
ZGVzdHJveSAgID0gcGljb2xjZF9mYl9kZXN0cm95LAo+ICAJLmZiX3JlYWQgICAgICA9IGZiX3N5
c19yZWFkLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
