Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B4E7627F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239AA6ECD6;
	Fri, 26 Jul 2019 09:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDF36E77D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:53:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 5BBF368B02; Thu, 25 Jul 2019 17:53:28 +0200 (CEST)
Date: Thu, 25 Jul 2019 17:53:28 +0200
From: Torsten Duwe <duwe@lst.de>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Re: [PATCH v3 5/7] drm/bridge: Add Analogix anx6345 support
Message-ID: <20190725155328.GC4820@lst.de>
References: <20190722151154.8344568BFE@verein.lst.de>
 <CA+E=qVeSjE1i-ngJWv=GTQDM6HL-VEZWjXH_p_BXy+eP7SvWhg@mail.gmail.com>
 <CAFqH_50s0J_NEevV9b5o-wq-bw+xGaUZ3WyhVDRZKyM2Yn-iVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFqH_50s0J_NEevV9b5o-wq-bw+xGaUZ3WyhVDRZKyM2Yn-iVg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDU6NDU6MTVQTSArMDIwMCwgRW5yaWMgQmFsbGV0Ym8g
U2VycmEgd3JvdGU6Cj4gSGksCj4gCj4gTWlzc2F0Z2UgZGUgVmFzaWx5IEtob3J1emhpY2sgPGFu
YXJzb3VsQGdtYWlsLmNvbT4gZGVsIGRpYSBkbC4sIDIyIGRlCj4ganVsLiAyMDE5IGEgbGVzIDIw
OjUwOgo+ID4KPiA+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDg6MTEgQU0gVG9yc3RlbiBEdXdl
IDxkdXdlQGxzdC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ICttb2R1bGVfaTJjX2RyaXZlcihhbng2
MzQ1X2RyaXZlcik7Cj4gPiA+ICsKPiA+ID4gK01PRFVMRV9ERVNDUklQVElPTigiQU5YNjM0NSBl
RFAgVHJhbnNtaXR0ZXIgZHJpdmVyIik7Cj4gPiA+ICtNT0RVTEVfQVVUSE9SKCJFbnJpYyBCYWxs
ZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiIpOwo+ID4KPiA+IEkg
YmVsaWV2ZSBJY2Vub3d5IGlzIHRoZSBhdXRob3Igb2YgdGhpcyBkcml2ZXIuIElmIHlvdSB0aGlu
ayBvdGhlcndpc2UKPiA+IHBsZWFzZSBhZGQgRW5yaWMgdG8gQ0MgYW5kIGdldCBoaXMgU2lnbmVk
LW9mZi1ieS4KPiA+Cj4gCj4gSSB0aGluayB0aGF0IHRoZSBvbmx5IHJlYXNvbiBteSBuYW1lIGFw
cGVhcnMgaGVyZSBpcyBiZWNhdXNlIGlzIGEKPiBjb3B5L3Bhc3RlIGZyb20gYW5hbG9naXgtYW54
Nzh4eC5jIChwcm9iYWJseSB0aGlzIGRyaXZlciB0b29rIHRoYXQKClllcywgdGhpcyBpcyB0aGUg
Y2FzZS4KWW91IHdyb3RlIC8gYXV0aG9yZWQgNTAwIGxpbmVzIG9mIGl0LCBJY2Vub3d5IGFib3V0
IDMwMC4KCj4gZmlsZSBhcyBhIHJlZmVyZW5jZT8pLiBJbmRlZWQgSSBhbSBub3QgdGhlIGF1dGhv
ciBvZiB0aGlzIGRyaXZlciwgc28KPiBJY2Vub3d5IHNob3VsZCBiZSBoZXJlLCBub3QgbWUuCgpW
ZXJ5IHdlbGwuIFRoYW5rcyBmb3IgdGhpcyBjbGVhciBzdGF0ZW1lbnQhCgoJVG9yc3RlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
