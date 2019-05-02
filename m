Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A5B118A0
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 14:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCE0892C8;
	Thu,  2 May 2019 12:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D478A892C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 12:01:48 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hMAPK-0007mT-Bl; Thu, 02 May 2019 14:01:46 +0200
Message-ID: <1556798505.2590.7.camel@pengutronix.de>
Subject: Re: [PATCH] backlight: rave-sp: don't touch initial state and
 register with correct device
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones
 <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>
Date: Thu, 02 May 2019 14:01:45 +0200
In-Reply-To: <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
References: <20190429152919.27277-1-l.stach@pengutronix.de>
 <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKQW0gRG9ubmVyc3RhZywgZGVuIDAyLjA1LjIwMTksIDExOjMzICswMTAwIHNj
aHJpZWIgRGFuaWVsIFRob21wc29uOgo+IE9uIDI5LzA0LzIwMTkgMTY6MjksIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+ID4gVGhpcyB3YXkgdGhlIGJhY2tsaWdodCBjYW4gYmUgcmVmZXJlbmNlZCB0aHJv
dWdoIGl0cyBkZXZpY2Ugbm9kZSBhbmQKPiA+IGVuYWJsaW5nL2Rpc2FibGluZyBjYW4gYmUgbWFu
YWdlZCB0aHJvdWdoIHRoZSBwYW5lbCBkcml2ZXIuCj4gCj4gSXMgaXQgcG9zc2libGUgdG8gaW1w
bGVtZW50IHNvbWV0aGluZyBzaW1pbGFyIHRvwqAKPiBwd21fYmFja2xpZ2h0X2luaXRpYWxfcG93
ZXJfc3RhdGUoKSB0byBoYW5kbGUgdGhpcz8KCkknbSBub3QgYXdhcmUgb2YgYW55IHByb3RvY29s
IHRvIHRoZSBSQVZFLVNQIHRoYXQgd291bGQgYWxsb3cgdG8gcmVhZApiYWNrIHRoZSBiYWNrbGln
aHQgc3RhdGUuIEFGQUlDUyB0aGUgYmFja2xpZ2h0IGlzIGltcGxlbWVudGVkIGFzIGEKdW5pZGly
ZWN0aW9uYWwgcHJvdG9jb2wuCgpSZWdhcmRzLApMdWNhcwoKPiBiYWNrbGlnaHQgZHJpdmVycyBh
bHJlYWR5IHN1ZmZlciBmcm9tIHRvbyBtdWNoIGRpdmVyc2l0eSBzbyBJIHByZWZlcsKgCj4gdGhp
bmdzIGxpa2UgdGhpcyB0byBhbGlnbiBiZWhhdmlvdXIgd2l0aCB0aGUgKGZhaXJseSBoZWF2aWx5
bHkgdXNlZCkgUFdNwqAKPiBkcml2ZXIgaWYgcG9zc2libGUuCj4gCj4gCj4gRGFuaWVsLgo+IAo+
IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4
LmRlPgo+ID4gLS0tCj4gPiDCoCBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9yYXZlLXNwLWJhY2ts
aWdodC5jIHwgNCArLS0tCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMg
ZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9yYXZlLXNwLWJhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcmF2ZS1zcC1i
YWNrbGlnaHQuYwo+ID4gaW5kZXggNDYyZjE0YTFiMTlkLi5kMjk2YmZjZjQzOTYgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9yYXZlLXNwLWJhY2tsaWdodC5jCj4gPiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9yYXZlLXNwLWJhY2tsaWdodC5jCj4gPiBAQCAt
NDgsMTUgKzQ4LDEzIEBAIHN0YXRpYyBpbnQgcmF2ZV9zcF9iYWNrbGlnaHRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4gPiDCoMKgCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7Cj4gPiA+ID4gwqDCoAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmQ7Cj4g
PiDCoMKgCj4gPiA+ID4gLQliZCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYs
IHBkZXYtPm5hbWUsIGRldi0+cGFyZW50LAo+ID4gPiA+ICsJYmQgPSBkZXZtX2JhY2tsaWdodF9k
ZXZpY2VfcmVnaXN0ZXIoZGV2LCBwZGV2LT5uYW1lLCBkZXYsCj4gPiA+ID4gwqDCoAkJCQkJwqDC
oMKgwqBkZXZfZ2V0X2RydmRhdGEoZGV2LT5wYXJlbnQpLAo+ID4gPiA+IMKgwqAJCQkJCcKgwqDC
oMKgJnJhdmVfc3BfYmFja2xpZ2h0X29wcywKPiA+ID4gPiDCoMKgCQkJCQnCoMKgwqDCoCZyYXZl
X3NwX2JhY2tsaWdodF9wcm9wcyk7Cj4gPiA+ID4gwqDCoAlpZiAoSVNfRVJSKGJkKSkKPiA+ID4g
PiDCoMKgCQlyZXR1cm4gUFRSX0VSUihiZCk7Cj4gPiDCoMKgCj4gPiA+ID4gLQliYWNrbGlnaHRf
dXBkYXRlX3N0YXR1cyhiZCk7Cj4gPiAtCj4gPiA+ID4gwqDCoAlyZXR1cm4gMDsKPiA+IMKgIH0K
PiA+IMKgwqAKPiA+IAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
