Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDAB1282D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AF889650;
	Fri,  3 May 2019 06:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7302893D1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 10:46:13 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 639953E87D;
 Thu,  2 May 2019 10:46:12 +0000 (UTC)
Date: Thu, 2 May 2019 06:46:12 -0400
From: Brian Masney <masneyb@onstation.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v6 3/3] backlight: lm3630a: add firmware node support
Message-ID: <20190502104612.GB24563@basecamp>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-4-masneyb@onstation.org>
 <3d8a2f9e-bd41-7713-5ad4-05a0d71e8fb1@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d8a2f9e-bd41-7713-5ad4-05a0d71e8fb1@linaro.org>
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1556793973;
 bh=e/FA4mHpFx3zNjfCGCOW0Rn4GpjN//bg+m0jAFrBGDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JhXrdguNJ/0q/2s9ujlUFEtJx12kNG8hc7FpdaQv7fxd19pUfo3AS6nJ+EEdsrEaj
 V0lE1/GabHGNcJ9RwjWkA0vnwVJ8xFY/uQNfVXvisy8LTuMt8HHwWABc1PEVn4wPFS
 3NxcCY0I5GBAEelvUjtti26CIFWcEi3p7DSUbRx0=
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

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTE6MTk6NTBBTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIDI0LzA0LzIwMTkgMTA6MjUsIEJyaWFuIE1hc25leSB3cm90ZToKPiA+IEFk
ZCBmd25vZGUgc3VwcG9ydCB0byB0aGUgbG0zNjMwYSBkcml2ZXIgYW5kIG9wdGlvbmFsbHkgYWxs
b3cKPiA+IGNvbmZpZ3VyaW5nIHRoZSBsYWJlbCwgZGVmYXVsdCBicmlnaHRuZXNzIGxldmVsLCBh
bmQgbWF4aW11bSBicmlnaHRuZXNzCj4gPiBsZXZlbC4gVGhlIHR3byBvdXRwdXRzIGNhbiBiZSBj
b250cm9sbGVkIGJ5IGJhbmsgQSBhbmQgQiBpbmRlcGVuZGVudGx5Cj4gPiBvciBiYW5rIEEgY2Fu
IGNvbnRyb2wgYm90aCBvdXRwdXRzLgo+ID4gCj4gPiBJZiB0aGUgcGxhdGZvcm0gZGF0YSB3YXMg
bm90IGNvbmZpZ3VyZWQsIHRoZW4gdGhlIGRyaXZlciBkZWZhdWx0cyB0bwo+ID4gZW5hYmxpbmcg
Ym90aCBiYW5rcy4gVGhpcyBwYXRjaCBjaGFuZ2VzIHRoZSBkZWZhdWx0IHZhbHVlIHRvIGRpc2Fi
bGUKPiA+IGJvdGggYmFua3MgYmVmb3JlIHBhcnNpbmcgdGhlIGZpcm13YXJlIG5vZGUgc28gdGhh
dCBqdXN0IGEgc2luZ2xlIGJhbmsKPiA+IGNhbiBiZSBlbmFibGVkIGlmIGRlc2lyZWQuIFRoZXJl
IGFyZSBubyBpbi10cmVlIHVzZXJzIG9mIHRoaXMgZHJpdmVyLgo+IAo+IEluIHRoYXQgY2FzZSBn
aXZlbiBJJ2QgY2VydGFpbmx5IGVudGVydGFpbiBwYXRjaGVzIHRoYXQgbW92ZSB0aGUgY29uZmln
Cj4gc3RydWN0dXJlcyBvdXQgb2YgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhIGFuZCBzYXkg
dGhlIGRyaXZlciByZXF1aXJlcyBhCj4gcHJvcGVyIGVudHJ5IGluIHRoZSBoYXJkd2FyZSBkZXNj
cmlwdGlvbiEgTm90IGEgcmVxdWlyZW1lbnQgdGhvdWdoLgoKT0ssIEknbGwgc3VibWl0IHBhdGNo
ZXMgZm9yIHRoYXQgYWZ0ZXIgdGhpcyBzZXJpZXMgaXMgbWVyZ2VkLgoKQnJpYW4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
