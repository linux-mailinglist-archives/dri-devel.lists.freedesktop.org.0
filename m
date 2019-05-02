Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0081281E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0C895CA;
	Fri,  3 May 2019 06:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB38E89237
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 10:42:41 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 301433E87D;
 Thu,  2 May 2019 10:42:40 +0000 (UTC)
Date: Thu, 2 May 2019 06:42:39 -0400
From: Brian Masney <masneyb@onstation.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
Message-ID: <20190502104239.GA24563@basecamp>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
 <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1556793760;
 bh=K7Cjww+vVyauxok0wNSyRl6X27bdPZhoR2t4aaeUtFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gwemzpUmSI4+iFJdNxQg3pyjOTHNRBRpJhAlncFwY3ayBp3GC3/QwUqpRWrpZb96J
 IWcs+C0KmsxbBrVg+JloYyBigrtfKgO41vsl7cskSvCg5L4TPmE+t+PSts2jiXEAb1
 WN59mnMTceerjAjqJ4GO0FSs0ZrvXTiVDnWjiin0=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, jonathan@marek.ca, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Daniel Thompson <daniel@redfelineninja.org.uk>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTE6MDc6NTFBTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIDI0LzA0LzIwMTkgMTA6MjUsIEJyaWFuIE1hc25leSB3cm90ZToKPiA+IGxt
MzYzMGFfYmFua19hX3VwZGF0ZV9zdGF0dXMoKSBhbmQgbG0zNjMwYV9iYW5rX2JfdXBkYXRlX3N0
YXR1cygpCj4gPiBib3RoIHJldHVybiB0aGUgYnJpZ2h0bmVzcyB2YWx1ZSBpZiB0aGUgYnJpZ2h0
bmVzcyB3YXMgc3VjY2Vzc2Z1bGx5Cj4gPiB1cGRhdGVkLiBXcml0aW5nIHRvIHRoZXNlIGF0dHJp
YnV0ZXMgdmlhIHN5c2ZzIHdvdWxkIGNhdXNlIGEgJ0JhZAo+ID4gYWRkcmVzcycgZXJyb3IgdG8g
YmUgcmV0dXJuZWQuIFRoZXNlIGZ1bmN0aW9ucyBzaG91bGQgcmV0dXJuIDAgb24KPiA+IHN1Y2Nl
c3MsIHNvIGxldCdzIGNoYW5nZSBpdCB0byBjb3JyZWN0IHRoYXQgZXJyb3IuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+ID4gRml4
ZXM6IDI4ZTY0YTY4YTJlZiAoImJhY2tsaWdodDogbG0zNjMwOiBhcHBseSBjaGlwIHJldmlzaW9u
IikKPiA+IEFja2VkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiAKPiBIaSBCcmlh
biwgc29ycnkgZm9yIHRoZSBkZWxheS4gRm9yIHNvbWUgcmVhc29uIHlvdXIgbWFpbHMgYXJlIGJl
aW5nIGR1bXBlZAo+IGJlZm9yZSB0aGV5IHJlYWNoIG1lIHNvIEkgb25seSBkaXNjb3ZlcmVkIHRo
ZXNlIHBhdGNoZXMgd2hlbiBJIHBhaWQgcHJvcGVyCj4gYXR0ZW50aW9uIHRvIHRoZSByZXBsaWVz
IGFuZCBmZXRjaGVkIHRoZW0gZnJvbSBwYXRjaHdvcmsuCj4gCj4gSGkgTGVlLCBpcyB0aGUgc2Ft
ZSB0aGluZyBoYXBwZW5pbmcgZm9yIHlvdT8gOy0pCgpIdWgsIHRoYXQncyBvZGQuIEkgaGF2ZW4n
dCByYW4gaW50byB0aGF0IGlzc3VlIHdoZW4gd29ya2luZyB3aXRoIHBlb3BsZQpmcm9tIExpbmFy
byBpbiBvdGhlciBzdWJzeXN0ZW1zLgoKQXMgYSBzYW5pdHkgY2hlY2ssIEkgdXNlZCAnZ2l0IHNl
bmQtZW1haWwnIHRvIHNlbmQgdGhpcyBwYXRjaCB0bwpjaGVjay1hdXRoQHZlcmlmaWVyLnBvcnQy
NS5jb20gYW5kIGl0IHZlcmlmaWVkIHRoYXQgSSBzdGlsbCBoYXZlIFNQRiwKREtJTSwgcmV2ZXJz
ZSBETlMsIGV0Yy4gYWxsIHNldHVwIHByb3Blcmx5IG9uIHRoaXMgZG9tYWluLgoKaG90bWFpbC5j
b20gYWRkcmVzc2VzIGFyZSB0aGUgb25seSBvbmVzIEkndmUgaGFkIGlzc3VlcyB3aXRoIGluIHRo
ZQpwYXN0LCBidXQgSSBkb3VidCB5b3UncmUgZm9yd2FyZGluZyB5b3VyIGVtYWlsIHRoZXJlLiA6
KQoKQnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
