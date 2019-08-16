Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BAA908E3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A136E99D;
	Fri, 16 Aug 2019 19:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFAF6E99D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:48:01 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hyiCa-0000qu-4D; Fri, 16 Aug 2019 21:47:56 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hyiCY-0006aL-DA; Fri, 16 Aug 2019 21:47:54 +0200
Date: Fri, 16 Aug 2019 21:47:54 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190816194754.ldzjqy2yjonfvaat@pengutronix.de>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190816165148.7keg45fmlndr22fl@pengutronix.de>
 <20190816175157.GT250418@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816175157.GT250418@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6NTE6NTdBTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gSGkgVXdlLAo+IAo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDA2OjUxOjQ4
UE0gKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMDksIDIw
MTkgYXQgMTI6MDA6MDVQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gPiA+IEJh
Y2tsaWdodCBicmlnaHRuZXNzIGN1cnZlcyBjYW4gaGF2ZSBkaWZmZXJlbnQgc2hhcGVzLiBUaGUg
dHdvIG1haW4KPiA+ID4gdHlwZXMgYXJlIGxpbmVhciBhbmQgbm9uLWxpbmVhciBjdXJ2ZXMuIFRo
ZSBodW1hbiBleWUgZG9lc24ndAo+ID4gPiBwZXJjZWl2ZSBsaW5lYXJseSBpbmNyZWFzaW5nL2Rl
Y3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBsaW5lYXIgKHNlZQo+ID4gPiBhbHNvIDg4YmE5NWJlZGI3
OSAiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJpZ2h0bmVzcyBvZiBMRUQKPiA+ID4gbGlu
ZWFybHkgdG8gaHVtYW4gZXllIiksIGhlbmNlIG1hbnkgYmFja2xpZ2h0cyB1c2Ugbm9uLWxpbmVh
ciAob2Z0ZW4KPiA+ID4gbG9nYXJpdGhtaWMpIGJyaWdodG5lc3MgY3VydmVzLiBUaGUgdHlwZSBv
ZiBjdXJ2ZSBjdXJyZW50bHkgaXMgb3BhcXVlCj4gPiA+IHRvIHVzZXJzcGFjZSwgc28gdXNlcnNw
YWNlIG9mdGVuIHVzZXMgbW9yZSBvciBsZXNzIHJlbGlhYmxlIGhldXJpc3RpY3MKPiA+ID4gKGxp
a2UgdGhlIG51bWJlciBvZiBicmlnaHRuZXNzIGxldmVscykgdG8gZGVjaWRlIHdoZXRoZXIgdG8g
dHJlYXQgYQo+ID4gPiBiYWNrbGlnaHQgZGV2aWNlIGFzIGxpbmVhciBvciBub24tbGluZWFyLgo+
ID4gPiAKPiA+ID4gRXhwb3J0IHRoZSB0eXBlIG9mIHRoZSBicmlnaHRuZXNzIGN1cnZlIHZpYSB0
aGUgbmV3IHN5c2ZzIGF0dHJpYnV0ZQo+ID4gPiAnc2NhbGUnLiBUaGUgdmFsdWUgb2YgdGhlIGF0
dHJpYnV0ZSBjYW4gYmUgJ2xpbmVhcicsICdub24tbGluZWFyJyBvcgo+ID4gPiAndW5rbm93bicu
IEZvciBkZXZpY2VzIHRoYXQgZG9uJ3QgcHJvdmlkZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2Nh
bGUKPiA+ID4gb2YgdGhlaXIgYnJpZ2h0bmVzcyBjdXJ2ZSB0aGUgdmFsdWUgb2YgdGhlICdzY2Fs
ZScgYXR0cmlidXRlIGlzICd1bmtub3duJy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+ID4gCj4gPiBJIHdvbmRlciB3aGF0
IGtpbmQgb2YgcHJvYmxlbSB5b3UgYXJlIHNvbHZpbmcgaGVyZS4gQ2FuIHlvdSBkZXNjcmliZQo+
ID4gdGhhdCBpbiBhIGZldyB3b3Jkcz8KPiAKPiBUaGUgaHVtYW4gZXllIHBlcmNlaXZlcyBicmln
aHRuZXNzIGluIGEgbG9nYXJpdGhtaWMgbWFubmVyLiBGb3IKPiBiYWNrbGlnaHRzIHdpdGggYSBs
aW5lYXIgYnJpZ2h0bmVzcyBjdXJ2ZSBicmlnaHRuZXNzIGNvbnRyb2xzIGxpa2UKPiBzbGlkZXJz
IG5lZWQgdG8gdXNlIGEgbWFwcGluZyB0byBhY2hpZXZlIGEgYmVoYXZpb3IgdGhhdCBpcyBwZXJj
ZWl2ZWQKPiBhcyBsaW5lYXItaXNoIChtb3JlIGRldGFpbHM6IGh0dHA6Ly93d3cucGF0aHdheWxp
Z2h0aW5nLmNvbS9wcm9kdWN0cy9kb3dubG9hZHMvYnJvY2h1cmUvdGVjaG5pY2FsX21hdGVyaWFs
c18xNDY2Nzk3MDQ0X0xpbmVhcit2cytMb2dhcml0aG1pYytEaW1taW5nK1doaXRlK1BhcGVyLnBk
ZikKPiAKPiBBcyBvZiBub3cgdXNlcnNwYWNlIGRvZXNuJ3QgaGF2ZSBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgdHlwZSBvZiB0aGUKPiBicmlnaHRuZXNzIGN1cnZlLCBhbmQgb2Z0ZW4gdXNlcyBoZXVy
aXN0aWNzIHRvIG1ha2UgYSBndWVzcywgd2hpY2ggbWF5Cj4gYmUgcmlnaHQgbW9zdCBvZiB0aGUg
dGltZSwgYnV0IG5vdCBhbHdheXMuIFRoZSBuZXcgYXR0cmlidXRlIGVsaW1pbmF0ZXMKPiB0aGUg
bmVlZCB0byBndWVzcy4KClRoaXMgaXMgYWJvdXQgYmFja2xpZ2h0cyByaWdodD8gU28gdGhlIGtl
cm5lbCBwcm92aWRlcyB0byB1c2Vyc3BhY2UgYW4KaW50ZXJ2YWwgWzAsIHhdIGZvciBzb21lIHgg
YW5kIGRlcGVuZGluZyBvbiB0aGUgcGh5c2ljcyBvZiB0aGUgdGhlCmJhY2tsaWdodCBjb25maWd1
cmluZyB4LzIgKHByb2JhYmx5PykgZWl0aGVyIG1lYW5zIDUwJSBtZWFzdXJlZCBsaWdodCBvcgo1
MCUgcGVyY2VpdmVkIGxpZ2h0LCByaWdodD8KCkkgd29uZGVyIGlmIGl0IHdvdWxkIGJlIHBvc3Np
YmxlIGluc3RlYWQgb2YgZ2l2aW5nIGRpZmZlcmVudCBiYWNrbGlnaHQKaW1wbGVtZW50YXRpb25z
IHRoZSBmcmVlZG9tIHRvIHVzZSBlaXRoZXIgbGluZWFyIG9yIGxvZ2FyaXRobWljIChvcgpxdWFk
cmF0aWM/KSBzY2FsaW5nIGFuZCB0ZWxsIHVzZXJzcGFjZSB3aGljaCBvZiB0aGUgb3B0aW9ucyB3
ZXJlIHBpY2tlZApyZXF1aXJlIHRoZSBkcml2ZXJzIHRvIHByb3ZpZGUgYSAoc2F5KSBsaW5lYXIg
c2NhbGluZyBhbmQgdGhlbiB1c2Vyc3BhY2UKd291bGRuJ3QgbmVlZCB0byBjYXJlIGFib3V0IHRo
ZSBleGFjdCBwaHlzaWNzLgoKQmVzdCByZWdhcmRzClV3ZQoKLS0gClBlbmd1dHJvbml4IGUuSy4g
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAgICAgICAg
fApJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3
LnBlbmd1dHJvbml4LmRlLyAgfApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
