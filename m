Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040EAE7547
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92956E129;
	Mon, 28 Oct 2019 15:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BA56E129
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:36:36 +0000 (UTC)
Received: from localhost (unknown [91.217.168.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CEE1208C0;
 Mon, 28 Oct 2019 15:36:35 +0000 (UTC)
Date: Mon, 28 Oct 2019 16:34:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock =?utf-8?Q?ex?=
 =?utf-8?Q?plicitly=C2=A0?=
Message-ID: <20191028153427.pc3tnoz2d23filhx@hendrix>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025175625.8011-5-jagan@amarulasolutions.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572276996;
 bh=ymo9rl9CtwjArSQnfFPyty8tp1BY+ffoTl/pqxOlMJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dydQ8BCY/oWvaNr7y/rrFiwxqN7tEIACyy3Kx6qUkXvclMnnCBVfk6NzLkhzdBLbE
 Czf1eVRDF/OtyUbA9RcyKjUILeyDa3mGUdP5tPphPU3Ii8+ltKhyqK6SdE9c5kNXZ8
 HsQgObTenXdM8WzMQKTZpL7DpsrMfN2PKCHgVCU0=
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
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6MjY6MjJQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiBVc2FnZSBvZiBjbG9ja3MgYXJlIHZhcmllcyBiZXR3ZWVuIGRpZmZlcmVudCBBbGx3aW5u
ZXIKPiBEU0kgY29udHJvbGxlcnMuIENsb2NraW5nIGluIEEzMyB3b3VsZCBuZWVkIGJ1cyBhbmQK
PiBtb2QgY2xvY2tzIHdoZXJlIGFzIEE2NCB3b3VsZCBuZWVkIG9ubHkgYnVzIGNsb2NrLgo+Cj4g
VG8gc3VwcG9ydCB0aGlzIGtpbmQgb2YgY2xvY2tpbmcgc3RydWN0dXJlIHZhcmlhbnRzCj4gaW4g
dGhlIHNhbWUgZHNpIGRyaXZlciwKClRoZXJlJ3Mgbm8gdmFyaWFuY2UgaW4gdGhlIGNsb2NrIHN0
cnVjdHVyZSBhcyBmYXIgYXMgdGhlIGJ1cyBjbG9jayBpcwpjb25jZXJuZWQuCgo+IGV4cGxpY2l0
IGhhbmRsaW5nIG9mIGNvbW1vbiBjbG9jayB3b3VsZCByZXF1aXJlIHNpbmNlIHRoZSBBNjQKPiBk
b2Vzbid0IG5lZWQgdG8gbWVudGlvbiB0aGUgY2xvY2stbmFtZXMgZXhwbGljaXRseSBpbiBkdHMg
c2luY2UgaXQKPiBzdXBwb3J0IG9ubHkgb25lIGJ1cyBjbG9jay4KPgo+IEFsc28gcGFzcyBjbGtf
aWQgTlVMTCBpbnN0ZWFkICJidXMiIHRvIHJlZ21hcCBjbG9jayBpbml0IGZ1bmN0aW9uCj4gc2lu
Y2UgdGhlIHNpbmdsZSBjbG9jayB2YXJpYW50cyBubyBuZWVkIHRvIG1lbnRpb24gY2xvY2stbmFt
ZXMKPiBleHBsaWNpdGx5LgoKWW91IGRvbid0IG5lZWQgZXhwbGljaXQgY2xvY2sgaGFuZGxpbmcu
IFBhc3NpbmcgTlVMTCBhcyB0aGUgYXJndW1lbnQKaW4gcmVnbWFwX2luaXRfbW1pb19jbGsgd2ls
bCBtYWtlIGl0IHVzZSB0aGUgZmlyc3QgY2xvY2ssIHdoaWNoIGlzIHRoZQpidXMgY2xvY2suCgpN
YXhpbWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
