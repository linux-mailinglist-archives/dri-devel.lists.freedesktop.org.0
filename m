Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70258260A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 22:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62756E14A;
	Mon,  5 Aug 2019 20:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992AF89128
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 20:29:55 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BE1C78034E;
 Mon,  5 Aug 2019 22:29:52 +0200 (CEST)
Date: Mon, 5 Aug 2019 22:29:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190805202951.GA18148@ravnborg.org>
References: <20190725143224.GB31803@ravnborg.org>
 <20190726095016.wsj7jnni5zdh37dl@holly.lan>
 <20190726112724.GB20065@ravnborg.org> <20190805103600.GF4739@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805103600.GF4739@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8
 a=gSw8uvwejDmJeGKncQQA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Gerd Hoffmann <kraxel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLgoKT24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTE6MzY6MDBBTSArMDEwMCwgTGVlIEpv
bmVzIHdyb3RlOgo+IE9uIEZyaSwgMjYgSnVsIDIwMTksIFNhbSBSYXZuYm9yZyB3cm90ZToKPiAK
PiA+IEhpIERhbmllbC4KPiA+IAo+ID4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTA6NTA6MTZB
TSArMDEwMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEp1bCAyNSwgMjAx
OSBhdCAwNDozMjoyNFBNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiA+ID4gVGhlcmUg
d2FzIG5vIHVzZXJzIGxlZnQgLSBzbyBkcm9wIHRoZSBjb2RlIHRvIHN1cHBvcnQgRUFSTFlfRkJf
QkxBTksuCj4gPiA+IAo+ID4gPiBXaHkgYXJlIHdlIHVzaW5nIGEgZGlmZmVyZW50IG5vdW4gZm9y
IHRoZSBzdWJqZWN0IGFuZCBkZXNjcmlwdGlvbj8KPiA+IEkgZmF0LWZpbmdlcmVkIHRoZSBkZXNj
cmlwdGlvbi4KPiAKPiA+IFdpbGwgZml4IHdoZW4gSSBhcHBseSAtIG9yIHNlbmQgb3V0IGEgdjIg
aWYgcmVxdWVzdGVkLgo+IAo+IE9rYXksIGp1c3QgYXBwbHkgaXQgdGhlbjoKPiAKPiBBY2tlZC1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkZpeGVkIGNoYW5nZWxvZyBhbmQg
YXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
