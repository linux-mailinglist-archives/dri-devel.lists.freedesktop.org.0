Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB92B441
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938E789CA2;
	Mon, 27 May 2019 12:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C89F89DFF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 11:52:49 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 79A4768AFE; Thu, 23 May 2019 13:52:24 +0200 (CEST)
Date: Thu, 23 May 2019 13:52:24 +0200
From: Torsten Duwe <duwe@lst.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/6] drm/bridge: extract some Analogix I2C DP common code
Message-ID: <20190523115224.GA15685@lst.de>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065352.8FD7668B05@newverein.lst.de>
 <CAGb2v66+1+goJfnY7nWTGN2fupqMUm5o+gkPdUW6nxcwQEDwog@mail.gmail.com>
 <20190523075035.GA5971@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523075035.GA5971@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
 Thierry Reding <thierry.reding@gmail.com>, Harald Geyer <harald@ccbib.org>,
 Sean Paul <seanpaul@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTA6NTA6MzVBTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBPbiBUaHUsIE1heSAyMywgMjAxOSBhdCAwMzo0MDoyNVBNICswODAwLCBDaGVu
LVl1IFRzYWkgd3JvdGU6Cj4gPiAKPiA+IElmIHRoaXMgd2FzIHNpbXBsZSBjb2RlIG1vdmVtZW50
LCB0aGVuIHRoZSBvcmlnaW5hbCBjb3B5cmlnaHQgc3RpbGwgYXBwbGllcy4KPiA+IEEgZGlmZmVy
ZW50IGNvcHlyaWdodCBub3RpY2Ugc2hvdWxkIG5vdCBiZSB1c2VkLiBJIHN1cHBvc2UgdGhlIHNh
bWUgYXBwbGllcwo+ID4gdG8gdGhlIG1vZHVsZSBhdXRob3IuCj4gCj4gQW5kIGxpa2VseSB0byBw
YXRjaCAyLzYgdG9vLgoKQWJzb2x1dGVseSBjb3JyZWN0LiBXZGlmZiBkb2VzIG5vdCBsaWUuClJl
LWV2YWx1YXRpbmcuLi4KCglUb3JzdGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
