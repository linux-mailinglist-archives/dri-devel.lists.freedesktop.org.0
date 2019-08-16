Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8D90631
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 18:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EB16E8BA;
	Fri, 16 Aug 2019 16:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D62B6E35B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 16:51:52 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hyfSA-0002eU-Cf; Fri, 16 Aug 2019 18:51:50 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hyfS8-00027l-G7; Fri, 16 Aug 2019 18:51:48 +0200
Date: Fri, 16 Aug 2019 18:51:48 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190816165148.7keg45fmlndr22fl@pengutronix.de>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-3-mka@chromium.org>
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

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTI6MDA6MDVQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gQmFja2xpZ2h0IGJyaWdodG5lc3MgY3VydmVzIGNhbiBoYXZlIGRpZmZlcmVu
dCBzaGFwZXMuIFRoZSB0d28gbWFpbgo+IHR5cGVzIGFyZSBsaW5lYXIgYW5kIG5vbi1saW5lYXIg
Y3VydmVzLiBUaGUgaHVtYW4gZXllIGRvZXNuJ3QKPiBwZXJjZWl2ZSBsaW5lYXJseSBpbmNyZWFz
aW5nL2RlY3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBsaW5lYXIgKHNlZQo+IGFsc28gODhiYTk1YmVk
Yjc5ICJiYWNrbGlnaHQ6IHB3bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRAo+IGxpbmVh
cmx5IHRvIGh1bWFuIGV5ZSIpLCBoZW5jZSBtYW55IGJhY2tsaWdodHMgdXNlIG5vbi1saW5lYXIg
KG9mdGVuCj4gbG9nYXJpdGhtaWMpIGJyaWdodG5lc3MgY3VydmVzLiBUaGUgdHlwZSBvZiBjdXJ2
ZSBjdXJyZW50bHkgaXMgb3BhcXVlCj4gdG8gdXNlcnNwYWNlLCBzbyB1c2Vyc3BhY2Ugb2Z0ZW4g
dXNlcyBtb3JlIG9yIGxlc3MgcmVsaWFibGUgaGV1cmlzdGljcwo+IChsaWtlIHRoZSBudW1iZXIg
b2YgYnJpZ2h0bmVzcyBsZXZlbHMpIHRvIGRlY2lkZSB3aGV0aGVyIHRvIHRyZWF0IGEKPiBiYWNr
bGlnaHQgZGV2aWNlIGFzIGxpbmVhciBvciBub24tbGluZWFyLgo+IAo+IEV4cG9ydCB0aGUgdHlw
ZSBvZiB0aGUgYnJpZ2h0bmVzcyBjdXJ2ZSB2aWEgdGhlIG5ldyBzeXNmcyBhdHRyaWJ1dGUKPiAn
c2NhbGUnLiBUaGUgdmFsdWUgb2YgdGhlIGF0dHJpYnV0ZSBjYW4gYmUgJ2xpbmVhcicsICdub24t
bGluZWFyJyBvcgo+ICd1bmtub3duJy4gRm9yIGRldmljZXMgdGhhdCBkb24ndCBwcm92aWRlIGlu
Zm9ybWF0aW9uIGFib3V0IHRoZSBzY2FsZQo+IG9mIHRoZWlyIGJyaWdodG5lc3MgY3VydmUgdGhl
IHZhbHVlIG9mIHRoZSAnc2NhbGUnIGF0dHJpYnV0ZSBpcyAndW5rbm93bicuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+CgpJIHdvbmRlciB3
aGF0IGtpbmQgb2YgcHJvYmxlbSB5b3UgYXJlIHNvbHZpbmcgaGVyZS4gQ2FuIHlvdSBkZXNjcmli
ZQp0aGF0IGluIGEgZmV3IHdvcmRzPwoKQmVzdCByZWdhcmRzClV3ZQoKLS0gClBlbmd1dHJvbml4
IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAg
ICAgICAgfApJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRw
Oi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
