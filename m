Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6BE38590
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E14F89C16;
	Fri,  7 Jun 2019 07:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 445 seconds by postgrey-1.36 at gabe;
 Thu, 06 Jun 2019 14:07:01 UTC
Received: from mail.cosmopool.net (h1.radempa.de [176.9.142.194])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D7368972B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.cosmopool.net (Postfix) with ESMTP id 0B80890FE45;
 Thu,  6 Jun 2019 15:59:33 +0200 (CEST)
Received: from mail.cosmopool.net ([127.0.0.1])
 by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6ScGfx02b-c; Thu,  6 Jun 2019 15:59:32 +0200 (CEST)
Received: from stardust.g4.wien.funkfeuer.at
 (77.117.149.20.wireless.dyn.drei.com [77.117.149.20])
 by mail.cosmopool.net (Postfix) with ESMTPSA id 513A190213F;
 Thu,  6 Jun 2019 15:59:31 +0200 (CEST)
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
 (envelope-from <harald@ccbib.org>)
 id 1hYsvP-0000PY-Pz; Thu, 06 Jun 2019 15:59:27 +0200
From: Harald Geyer <harald@ccbib.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
In-reply-to: <20190605120237.ekmytfxcwbjaqy3x@flea>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
 <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
Comments: In-reply-to Maxime Ripard <maxime.ripard@bootlin.com>
 message dated "Wed, 05 Jun 2019 14:02:37 +0200."
MIME-Version: 1.0
Content-ID: <1582.1559829566.1@stardust.g4.wien.funkfeuer.at>
Date: Thu, 06 Jun 2019 15:59:27 +0200
Message-Id: <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ccbib.org; s=201902; 
 t=1559829572; bh=yRX2r+1exJu+xt6035zadTL1ALZUnRaTg/CjqI7wAzk=;
 h=From:To:cc:Subject:In-reply-to:References:Date:From;
 b=Xfkl4O7wX3W5m8UlC0jDHhFkqAU2BvG0QxydrPbS9pMTSjHknn5s/c1SBTbtruCcq
 coWAmuJr1yuOJaqZowoulZ4CcLBNmsNeCqUBUAZ7PircVahSQsVhWKIyeT5tBQ5436
 fIYEpSYrT8cO2D3AnUl0hF34wAuI64BKWaKomt8Y=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R3V5cywgdGhpcyBkaXNjdXNzaW9uIGlzIGdldHRpbmcgaGVhdGVkIGZvciBubyByZWFzb24uIExl
dCdzIHB1dApwZXJzb25hbCBmcnVzdHJhdGlvbnMgYXNpZGUgYW5kIGRpc2N1c3MgdGhlIGlzc3Vl
IG9uIGl0cyBtZXJpdHM6CgpNYXhpbWUgUmlwYXJkIHdyaXRlczoKPiBPbiBXZWQsIEp1biAwNSwg
MjAxOSBhdCAxMjoxMzoxN1BNICswMjAwLCBUb3JzdGVuIER1d2Ugd3JvdGU6Cj4gPiBPbiBUdWUs
IEp1biAwNCwgMjAxOSBhdCAwODowODo0MEFNIC0wNzAwLCBWYXNpbHkgS2hvcnV6aGljayB3cm90
ZToKPiA+ID4gT24gVHVlLCBKdW4gNCwgMjAxOSBhdCA1OjIzIEFNIFRvcnN0ZW4gRHV3ZSA8ZHV3
ZUBsc3QuZGU+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gVGVyZXMtSSBoYXMgYW4gYW54NjM0NSBi
cmlkZ2UgY29ubmVjdGVkIHRvIHRoZSBSR0I2NjYgTENEIG91dHB1dCwgYW5kCj4gPiA+ID4gdGhl
IEkyQyBjb250cm9sbGluZyBzaWduYWxzIGFyZSBjb25uZWN0ZWQgdG8gSTJDMCBidXMuIGVEUCBv
dXRwdXQgZ29lcwo+ID4gPiA+IHRvIGFuIElubm9sdXggTjExNkJHRSBwYW5lbC4KPiA+ID4gPgo+
ID4gPiA+IEVuYWJsZSBpdCBpbiB0aGUgZGV2aWNlIHRyZWUuCj4gPiA+ID4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Cj4gPiA+ID4gLS0tCj4gPiA+ID4g
IC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cyAgICAgIHwgNjUg
KysrKysrKysrKysrKysrKysrKystLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cwo+ID4gPiA+IGlu
ZGV4IDBlYzQ2Yjk2OWE3NS4uYTBhZDQzOGIwMzdmIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKPiA+ID4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRz
Cj4gPiA+ID4gQEAgLTY1LDYgKzY1LDIxIEBACj4gPiA+ID4gICAgICAgICAgICAgICAgIH07Cj4g
PiA+ID4gICAgICAgICB9Owo+ID4gPiA+Cj4gPiA+ID4gKyAgICAgICBwYW5lbDogcGFuZWwgewo+
ID4gPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0iaW5ub2x1eCxuMTE2YmdlIiwgInNp
bXBsZS1wYW5lbCI7Cj4gPiA+Cj4gPiA+IEl0J3Mgc3RpbGwgInNpbXBsZS1wYW5lbCIuIEkgYmVs
aWV2ZSBJIGFscmVhZHkgbWVudGlvbmVkIHRoYXQgUm9iCj4gPiA+IGFza2VkIGl0IHRvIGJlIGVk
cC1jb25uZWN0b3IuCgpBY3R1YWxseSBqdXN0IGRyb3BwaW5nIHRoZSAic2ltcGxlLXBhbmVsIiBj
b21wYXRpYmxlIHdvdWxkIGJlIGEgcG9vcgpjaG9pY2UuIEV2ZW4gaWYgImVkcC1jb25uZWN0b3Ii
IGlzIHNwZWNpZmllZCBhcyBiaW5kaW5nIGFuZCBpbXBsZW1lbnRlZCBpbiBhCmRyaXZlciwgdGhl
cmUgYXJlIG9sZGVyIGtlcm5lbCB2ZXJzaW9ucyBhbmQgb3RoZXIgb3BlcmF0aW5nIHN5c3RlbXMg
dG8Ka2VlcCBpbiBtaW5kLiBJZiB0aGUgSFcgd29ya3Mgd2l0aCAic2ltcGxlLXBhbmVsIiBkcml2
ZXIgc2F0aXNmYWN0b3JpbHksCndlIHNob3VsZCBkZWZpbml0ZWx5IGtlZXAgdGhlIGNvbXBhdGli
bGUgYXMgYSBmYWxsIGJhY2sgZm9yIGNhc2VzIHdoZXJlCnRoZSBlZHAtY29ubmVjdG9yIGRyaXZl
ciBpcyB1bmF2YWlsYWJsZS4KCklmIHRoaW5rIHZhbGlkIGNvbXBhdGlibGUgcHJvcGVydGllcyB3
b3VsZCBiZToKY29tcGF0aWJsZSA9ICJpbm5vbHV4LG4xMTZiZ2UiLCAic2ltcGxlLXBhbmVsIjsK
Y29tcGF0aWJsZSA9ICJlZHAtY29ubmVjdG9yIiwgInNpbXBsZS1wYW5lbCI7CmNvbXBhdGlibGUg
PSAiaW5ub2x1eCxuMTE2YmdlIiwgImVkcC1jb25uZWN0b3IiLCAic2ltcGxlLXBhbmVsIjsKY29t
cGF0aWJsZSA9ICJlZHAtY29ubmVjdG9yIiwgImlubm9sdXgsbjExNmJnZSIsICJzaW1wbGUtcGFu
ZWwiOwoKSSBjYW4ndCBtYWtlIHVwIG15IG1pbmQgd2hpY2ggb25lIEkgcHJlZmVyZS4gSG93ZXZl
ciBuZWl0aGVyIG9mIHRoZXNlCnZhcmlhbnRzIHJlcXVpcmVzIGFjdHVhbGx5IGltcGxtZW50aW5n
IGFuIGVkcC1jb25uZWN0b3IgZHJpdmVyLiBBbmQgZWFjaApvZiB0aGVzZSB2YXJpYW50cyBpcyBj
bGVhcmx5IHByZWZlcmFibGUgdG8gc2hpcHBpbmcgRFRzIHdpdGhvdXQKZGVzY3JpcHRpb24gb2Yg
dGhlIHBhbmVsIGF0IGFsbCBhbmQgY29tcGxpZXMgd2l0aCBiaW5kaW5ncyBhZnRlciBhZGRpbmcK
YSBzdHViIGZvciAiZWRwLWNvbm5lY3RvciIuCgo+IEFuZCB0aGUgRFQgaXMgY29uc2lkZXJlZCBh
biBBQkksIHNvIHllYWgsIHdlIHdpbGwgd2l0aGVsZCBldmVyeXRoaW5nCj4gdGhhdCBkb2Vzbid0
IGZpdCB3aGF0IHdlIHdvdWxkIGxpa2UuCgpJIGZhaWwgdG8gc2VlIGhvdyB0aGUgcGF0Y2ggaW4g
ZGlzY3Vzc2lvbiBhZGRzIG5ldyBBQkkuIFdoaWxlIEkgdW5kZXJzdGFuZAp0aGUgbmVlZCB0byBw
ZXN0ZXIgY29udHJpYnV0b3JzIGZvciBtb3JlIHdvcmssIG91dHJpZ2h0IGJsb2NraW5nIERUcywg
dGhhdApwcm9wZXJseSBkZXNjcmliZSB0aGUgSFcgYW5kIGNvbXBseSB3aXRoIGV4aXN0aW5nIGJp
bmRpbmdzLCBzZWVtcyBhCmJpdCB1bnJlYXNvbmFibGUuIChBc3N1bWluZyB0aGVyZSBhcmUgbm8g
b3RoZXIgaXNzdWVzIG9mIGNvdXJzZS4pCgpBbHNvIG5vdGUgdGhhdCB0aGUgaW5ub2x1eCxuMTE2
YmdlIGJpbmRpbmcgc3VnZ2VzdGVzIHVzaW5nIHNpbXBsZS1wYW5lbAphcyBmYWxsYmFjay4KCkhU
SCwKSGFyYWxkCgotLSAKSWYgeW91IHdhbnQgdG8gc3VwcG9ydCBteSB3b3JrOgpzZWUgaHR0cDov
L2ZyaWVuZHMuY2NiaWIub3JnL2hhcmFsZC9zdXBwb3J0aW5nLwpvciBkb25hdGUgdmlhIENMQU0g
dG8geEFTUEJ0ZXpMTnFqNGNVZThNVDVuWmp0aFJTRWpyUlFYTgpvciB2aWEgcGVlcmNvaW4gdG8g
UDk4TFJkaGl0M2daYkhEQmU3dGE1anRYck1KVW1zNHA3dwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
