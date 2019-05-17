Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B17265D8
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FCF89AB9;
	Wed, 22 May 2019 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DBD89998
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 23:12:13 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 3FFDD3E957;
 Fri, 17 May 2019 23:12:12 +0000 (UTC)
Date: Fri, 17 May 2019 19:12:11 -0400
From: Brian Masney <masneyb@onstation.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: backlight: add lm3630a bindings
Message-ID: <20190517231211.GA7907@basecamp>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-3-masneyb@onstation.org>
 <CAL_JsqLdS2SDd-dczZmqDTN3XMY7fwDjdkX5OibXbrksd7qQYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLdS2SDd-dczZmqDTN3XMY7fwDjdkX5OibXbrksd7qQYA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1558134732;
 bh=qurT+nMJYRUKyNSe+yc/AIUY3mDFS6CFIis415+foE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vn3yfw/jnNsapohuXlzskfz4gwwlrmCgVVz8/V0C5xRjhJeelhjjMS8DOJz6y8PrD
 vi0aLVvEPz3Z3VRqtNHt4NOdaT+jhb9Pztk4fbqWTEXlFP6I1vJbUEokYc2OcI4sVJ
 dTotabBBmQRVlsZ/lNKCKXuaEnJKll0PjE8fwsis=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6MTE6NDhQTSAtMDUwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgNDoyNSBBTSBCcmlhbiBNYXNu
ZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIG5ldyBiYWNrbGln
aHQgYmluZGluZ3MgZm9yIHRoZSBUSSBMTTM2MzBBIGR1YWwtc3RyaW5nIHdoaXRlIExFRC4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4K
PiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gLS0tCj4g
PiBDaGFuZ2VzIHNpbmNlIHY1Ogo+ID4gLSBDaGFuZ2UgJ2xtMzYzMGFfYmxAMzgnIGluIGV4YW1w
bGVzIHRvICdsZWQtY29udHJvbGxlckAzOCcKPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+ID4g
LSBEcm9wICRyZWYgZnJvbSBsZWQtc291cmNlcwo+ID4gLSBEcm9wIGRlc2NyaXB0aW9uIGZyb20g
cmVnIG9mIGkyYyBhZGRyZXNzCj4gPiAtIEV4cGFuZCBkZXNjcmlwdGlvbiBvZiByZWcgZm9yIHRo
ZSBjb250cm9sIGJhbmsKPiA+IC0gRHJvcCBzdGF0dXMgZnJvbSBleGFtcGxlcwo+ID4KPiA+IENo
YW5nZXMgc2luY2UgdjM6Cj4gPiAtIEFkZCBsYWJlbC4gSSBkaWRuJ3QgYWRkIGEgZGVzY3JpcHRp
b24gZm9yIGl0IHNpbmNlIHRoYXQnbGwgY29tZSBmcm9tCj4gPiAgIHRoZSBjb21tb24gcHJvcGVy
dGllcyBvbmNlIGl0cyBjb252ZXJ0ZWQuCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSB2MjoKPiA+IC0g
VXBkYXRlIGRlc2NyaXB0aW9uIG9mIG1heC1icmlnaHRuZXNzCj4gPiAtIEFkZCBkZXNjcmlwdGlv
biBmb3IgcmVnCj4gPiAtIENvcnJlY3QgdHlwbzogcy90cmFuaXNpdG9uL3RyYW5zaXRpb24KPiA+
IC0gYWRkIHJlZyB0byBjb250cm9sIGJhbmtzCj4gPiAtIGFkZCBhZGRpdGlvbmFsUHJvcGVydGll
cwo+ID4KPiA+ICAuLi4vbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCAgICAg
fCAxMjkgKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyOSBpbnNlcnRp
b25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sCj4gCj4gSSdtIHdv
cmtpbmcgb24gZ2V0dGluZyB0aGUgZXhhbXBsZXMgdG8gYmUgdmFsaWRhdGVkIGJ5IHRoZSBzY2hl
bWEgKGluCj4gYWRkaXRpb24gdG8ganVzdCBidWlsZGluZyB3aXRoIGR0YykgYW5kIHRoZXJlJ3Mg
YSBjb3VwbGUgb2YgZXJyb3JzOgo+IAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gJyNh
ZGRyZXNzLWNlbGxzJywgJyNzaXplLWNlbGxzJyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdl
eGVzOgo+ICdebGVkQFswMV0kJywgJ3BpbmN0cmwtWzAtOV0rJwo+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC5leGFtcGxl
LmR0LnlhbWw6Cj4gJyNhZGRyZXNzLWNlbGxzJywgJyNzaXplLWNlbGxzJyBkbyBub3QgbWF0Y2gg
YW55IG9mIHRoZSByZWdleGVzOgo+ICdebGVkQFswMV0kJywgJ3BpbmN0cmwtWzAtOV0rJwo+IAo+
IFlvdSBkaWRuJ3QgbGlzdCAnI2FkZHJlc3MtY2VsbHMnIGFuZCAnI3NpemUtY2VsbHMnLgo+IAo+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBh
LWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gbGVkQDA6ICd0aSxsaW5lYXItbWFwcGluZy1t
b2RlJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gJ3BpbmN0cmwtWzAtOV0r
Jwo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2
MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gbGVkQDE6ICd0aSxsaW5lYXItbWFwcGlu
Zy1tb2RlJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gJ3BpbmN0cmwtWzAt
OV0rJwo+IAo+ICd0aSxsaW5lYXItbWFwcGluZy1tb2RlJyBpcyBub3QgZGVmaW5lZCBpbiB0aGUg
Y2hpbGQgbm9kZXMuCgpJJ20gc29ycnkgYWJvdXQgdGhhdC4gSSdsbCBzZW5kIG91dCBhIHBhdGNo
IHRoaXMgd2Vla2VuZCB0byBjb3JyZWN0CnRoaXMuIEkgaGF2ZSAnbWFrZSBkdF9iaW5kaW5nX2No
ZWNrJyBpbiBteSBsb2NhbCBidWlsZCBzY3JpcHQuIElzIHRoZXJlCnNvbWV0aGluZyBlbHNlIHRo
YXQgSSBzaG91bGQgYmUgcnVubmluZyBhcyB3ZWxsPyBPciBkbyB5b3UgaGF2ZSBhCmJyYW5jaCBz
b21ld2hlcmUgd2l0aCB5b3VyIHZhbGlkYXRpb24gd29yayB0aGF0IEkgY2FuIHRlc3QgbXkgY2hh
bmdlcwphZ2FpbnN0PwoKQnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
