Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A076040C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 12:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F9A6E478;
	Fri,  5 Jul 2019 10:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C926E478
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 10:08:59 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id D2DE9805FF; Fri,  5 Jul 2019 12:08:46 +0200 (CEST)
Date: Fri, 5 Jul 2019 12:08:51 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH 3/4] backlight: add led-backlight driver
Message-ID: <20190705100851.zn2jkipj4fxq5we6@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-4-jjhiblot@ti.com>
 <20190702095434.d426lichmaffz7a5@holly.lan>
 <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
 <20190702130434.frbx7jkec27ejbpo@holly.lan>
 <72c45311-c710-dc2d-a6de-68e44ea8436a@ti.com>
 <20190703094457.etmbbjhhssbdkveo@holly.lan>
 <a8886ae9-31ec-de4c-0a83-5f681582a0b9@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8886ae9-31ec-de4c-0a83-5f681582a0b9@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: mark.rutland@arm.com, Daniel Thompson <daniel.thompson@linaro.org>,
 jingoohan1@gmail.com, tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgo+ID4gPiA+IEFsc28gc3RpbGwgcmVsZXZhbnQgaXMgd2hldGhlciB0aGUgTEVEIGRldmlj
ZSBpcyBiZWluZyBjb3JyZWN0bHkKPiA+ID4gPiBtb2RlbGxlZCBpZiB0aGUgYWN0IG9mIHR1cm5p
bmcgb24gdGhlIExFRCBkb2Vzbid0LCBpbiBmYWN0LCB0dXJuIHRoZSBMRUQKPiA+ID4gPiBvbi4g
SXMgaXQgKnJlYWxseSogYSBjb3JyZWN0IGltcGxlbWVudGF0aW9uIG9mIGFuIExFRCBkZXZpY2Ug
dGhhdAo+ID4gPiA+IHNldHRpbmcgaXQgdG8gTEVEX0ZVTEwgdXNpbmcgc3lzZnMgZG9lc24ndCBj
YXVzZSBpdCB0byBsaWdodCB1cD8KPiA+ID4gV2hhdCBJIHVuZGVyc3Rvb2QgZnJvbSB0aGUgZGlz
Y3Vzc2lvbiBiZXR3ZWVuIFJvYiBhbmQgVG9taSBpcyB0aGF0IHRoZQo+ID4gPiBjaGlsZC1ub2Rl
IG9mIHRoZSBMRUQgY29udHJvbGxlciBzaG91bGQgYmUgY29uc2lkZXJlZCBhIGJhY2tsaWdodCBk
ZXZpY2UsCj4gPiA+IG5vdCBhIHNpbXBsZSBMRUQuIEknbSBub3Qgc3VyZSBpZiB0aGUgc3lzZnMg
aW50ZXJmYWNlIGlzIHN0aWxsIHJlbGV2YW50IGluCj4gPiA+IHRoYXQgY2FzZS4gTWF5YmUgaXQg
c2hvdWxkIGp1c3QgYmUgZGlzYWJsZWQgYnkgdGhlIGJhY2tsaWdodCBkcml2ZXIKPiA+ID4gKHBv
c3NpYmxlIHdpdGggbGVkX3N5c2ZzX2Rpc2FibGUoKSkKPiA+IGxlZF9zeXNmc19kaXNhYmxlKCkg
c291bmRzIGxpa2UgYSBzZW5zaWJsZSBjaGFuZ2UgYnV0IHRoYXQncyBub3QgcXVpdGUKPiA+IHdo
YXQgSSBtZWFuLgo+ID4gCj4gPiBJdCBpcyBtb3JlIGEgdGhvdWdodCBleHBlcmltZW50IHRvIHNl
ZSBpZiB0aGUgcG93ZXIgY29udHJvbCAqc2hvdWxkKiBiZQo+ID4gaW1wbGVtZW50ZWQgYnkgdGhl
IGJhY2tsaWdodC4gQ29uc2lkZXIgd2hhdCBoYXBwZW5zIGlmIHdlICpkb24ndCoKPiA+IGVuYWJs
ZSBDT05GSUdfQkFDS0xJR0hUX0xFRCBpbiB0aGUga2VybmVsOiB3ZSB3b3VsZCBzdGlsbCBoYXZl
IGFuIExFRAo+ID4gZGV2aWNlIGFuZCBpdCB3b3VsZCBub3Qgd29yayBjb3JyZWN0bHkuCj4gPiAK
PiA+IEluIG90aGVyIHdvcmRzIEkgbmFpdmVseSBleHBlY3QgdHVybmluZyBvbiBhbiBMRUQgdXNp
bmcgdGhlIExFRCBBUEkKPiA+IChhbnkgb2YgdGhlbSwgc3lzZnMgb3Iga2VybmVsKSB0byByZXN1
bHQgaW4gdGhlIExFRCB0dXJuaW5nIG9uLgo+ID4gSW1wbGVtZW50aW5nIGEgd29ya2Fyb3VuZCBp
biB0aGUgY2xpZW50IGZvciB3aGF0IGFwcGVhcnMgdG8gYmUKPiA+IHNvbWV0aGluZyBtaXNzaW5n
IGluIHRoZSBMRUQgZHJpdmVyIHN0cmlrZXMgbWUgYXMgb2RkLiBXaHkgc2hvdWxkbid0Cj4gPiB0
aGUgcmVndWxhdG9yIGJlIG1hbmFnZWQgaW4gdGhlIExFRCBkcml2ZXI/Cj4gCj4gSSBzZWUgeW91
ciBwb2ludC4gSW5kZWVkIGhhdmluZyB0aGUgcmVndWxhdG9yIGhhbmRsZWQgaW4gdGhlIExFRC1j
b3JlIG1ha2VzCj4gc2Vuc2UgaW4gYSBsb3Qgb2Ygc2l0dWF0aW9ucwo+IAo+IEknbGwgdGhpbmsg
YWJvdXQgaXQuCgpGb3IgdGhlIHJlY29yZCwgSSBhbHNvIGJlbGlldmUgcmVndWxhdG9yIGFuZCBl
bmFibGUgZ3BpbyBzaG91bGQgYmUKaGFuZGxlZCBpbiB0aGUgY29yZS4KCgkJCQkJCQkJCVBhdmVs
ClBTIHBsZWFzZSB0cmltIGRvd24gdGhlIHF1b3RlZCB0ZXh0LgkJCQkJCQkJCQotLSAKKGVuZ2xp
c2gpIGh0dHA6Ly93d3cubGl2ZWpvdXJuYWwuY29tL35wYXZlbG1hY2hlawooY2Vza3ksIHBpY3R1
cmVzKSBodHRwOi8vYXRyZXkua2FybGluLm1mZi5jdW5pLmN6L35wYXZlbC9waWN0dXJlL2hvcnNl
cy9ibG9nLmh0bWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
