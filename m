Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543489236F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 14:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7D46E10F;
	Mon, 19 Aug 2019 12:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA36E10F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 12:29:19 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hzgmj-0002vD-DX; Mon, 19 Aug 2019 14:29:17 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hzgmh-0007dT-8g; Mon, 19 Aug 2019 14:29:15 +0200
Date: Mon, 19 Aug 2019 14:29:15 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190819122915.icjszuvnwyjpa75n@pengutronix.de>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190816165148.7keg45fmlndr22fl@pengutronix.de>
 <20190816175157.GT250418@google.com>
 <20190816194754.ldzjqy2yjonfvaat@pengutronix.de>
 <20190816211051.GV250418@google.com>
 <20190819054628.asw3cxp46w3rpml7@pengutronix.de>
 <20190819095037.h3gig3quyhnzshm7@holly.lan>
 <20190819102127.wqudnbngottjakf5@pengutronix.de>
 <20190819111613.2kkn25tmjgyjhbip@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819111613.2kkn25tmjgyjhbip@holly.lan>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTI6MTY6MTNQTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDEyOjIxOjI3UE0gKzAyMDAsIFV3ZSBL
bGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiA+ID4gSW4gYW4gaWRlYWwgd29ybGQgdGhlIGJhY2ts
aWdodCBpbnRlcmZhY2Ugd291bGQgYmUgY29uc2lzdGVudCBhcyB5b3UKPiA+ID4gPiA+IHN1Z2dl
c3QsIGhvd2V2ZXIgdGhlcmUgYXJlIHBsZW50eSBvZiBleGlzdGluZyBkZXZpY2VzIHdoaWNoIHVz
ZSB0aGUKPiA+ID4gPiA+ICdvdGhlcicgc2NhbGluZyAocmVnYXJkbGVzcyBvZiB3aGljaCBpcyBj
aG9zZW4gYXMgdGhlICdjb3JyZWN0Jwo+ID4gPiA+ID4gb25lKS4gVXNlcnNwYWNlIHN0aWxsIGhh
cyB0byBkZWFsIHdpdGggdGhlc2UuIEFuZCBjaGFuZ2luZyBwcmV2aW91c2x5Cj4gPiA+ID4gPiAn
bG9nYXJpdGhtaWMnIGRyaXZlcnMgdG8gbGluZWFyIChvciB2aWNldmVyc2EpIG1heSAnYnJlYWsn
IHVzZXJzcGFjZSwKPiA+ID4gPiA+IHdoZW4gaXQga2VlcHMgdXNpbmcgaXRzICdvbGQnIHNjYWxp
bmcsIHdoaWNoIG5vdyBpc24ndCBjb3JyZWN0IGFueW1vcmUuCj4gPiA+ID4gCj4gPiA+ID4gSXQg
bWlnaHQgYmUgc3ViamVjdGl2ZSwgb3IgbWF5YmUgSSdtIGp1c3QgdG9vIG9wdGltaXN0aWMsIGJ1
dCBJIHRoaW5rIGlmCj4gPiA+ID4gdGhlcmUgd2FzIG5vIHBvbGljeSBiZWZvcmUgYWJvdXQgdGhl
IG1lYW5pbmcgb2YKPiA+ID4gPiAKPiA+ID4gPiAJZWNobyAxNyA+IGJyaWdodG5lc3MKPiA+ID4g
PiAKPiA+ID4gPiBvdGhlciB0aGFuICJicmlnaHRlciB0aGFuIGxvd2VyIHZhbHVlcyBhbmQgZGFy
a2VyIHRoYW4gaGlnaGVyIG9uZXMiCj4gPiA+ID4gaW50cm9kdWNpbmcgKHNheSkgdGhlIHNjYWxl
IGlzIGludGVuZGVkIHRvIHJlcHJlc2VudCBhIGxpbmVhciBicmlnaHRuZXNzCj4gPiA+ID4gY3Vy
dmUgaXMgb2suCj4gPiA+ID4gCj4gPiA+ID4gVW5sZXNzIHVzZXJzcGFjZSBqdW1wcyB0aHJvdWdo
IGhvb3BzIGFuZCB0cmllcyB0byBpZGVudGlmeSB0aGUgYWN0dWFsCj4gPiA+ID4gZGV2aWNlIGl0
IGlzIHJ1bm5pbmcgb24gaXQgaXMgd3Jvbmcgb24gc29tZSBtYWNoaW5lcyBhbnlob3cgYW5kIHdl
J3JlCj4gPiA+ID4gb25seSBzaGlmdGluZyB0aGUgc2V0IG9mIGFmZmVjdGVkIG1hY2hpbmVzIHdp
dGggYSB0aWdodGVyIHBvbGljeSAodW50aWwKPiA+ID4gPiB0aGF0IHVzZXJzcGFjZSBhcHBsaWNh
dGlvbiBpcyBmaXhlZCkuCj4gPiA+IAo+ID4gPiBJIGJlbGlldmUgdGhhdCB0aGVyZSBhcmUgdHdv
IGNvbW1vbiBhcHByb2FjaGVzIGJ5IHVzZXJzcGFjZSBhdCBwcmVzZW50Ogo+ID4gPiAKPiA+ID4g
MS4gQXNzdW1lIHRoZSBzY2FsZSBpcyBwZXJjZXB0dWFsIGFuZCB3ZSBjYW4gZGlyZWN0bHkgbWFw
IGEgc2xpZGVyCj4gPiA+ICAgIHRvIHRoZSBiYWNrbGlnaHQgdmFsdWUuIFRoaXMgaXMgY29tbW9u
IHNpbXBseSBiZWNhdXNlIG1vc3QgQUNQSQo+ID4gPiAgICBiYWNrbGlnaHRzIGFyZSBwZXJjZXB0
dWFsIGFuZCB0aGVyZWZvcmUgd2hlbiB0ZXN0ZWQgaW4gYSBsYXB0b3AKPiA+ID4gICAgaXQgd29y
a3MgT0suCj4gPiA+IAo+ID4gPiAyLiBBc3N1bWUgdGhhdCBpcyBtYXggYnJpZ2h0bmVzcyBpcyBz
bWFsbCAoZS5nLiBBQ1BJKSB0aGVuIHRoZQo+ID4gPiAgICBzY2FsZSBpcyBwZXJjZXB0dWFsIGFu
ZCBpZiB0aGUgbWF4IGJyaWdodG5lc3MgaXMgbGFyZ2UgKGUuZy4KPiA+ID4gICAgYSBQV00pIHRo
ZW4gdGhlIHNjYWxlIGlzIGxpbmVhciBhbmQgYXBwbHkgYSBjb3JyZWN0aW9uCj4gPiA+ICAgIGZ1
bmN0aW9uIGJldHdlZW4gdGhlIHNsaWRlciBhbmQgdGhlIGNvbnRyb2wuCj4gPiA+IAo+ID4gPiBU
aGF0IGhpc3RvcmljIGJhZ2dhZ2UgbWFrZXMgaXMgZGlmZmN1bHQgdG8gImp1c3QgZGVmaW5lIGEg
c3RhbmRhcmRpemVkCj4gPiA+IHNjYWxlIi4uLiBlc3BlY2lhbGx5IGdpdmVuIHRoYXQgaWYgd2Ug
c2VsZWN0ZWQgYSBzdGFuZGFyZGl6ZWQgc2NhbGUgd2UKPiA+ID4gd291bGQgcHJvYmFibHkgd2Fu
dCBhIHBlcmNlcHR1YWwgc2NhbGUgd2l0aCBsb3RzIG9mIHN0ZXBzIChlLmcuIGJyZWFrCj4gPiA+
IHRoZSBoZXVyaXN0aWMpLgo+ID4gCj4gPiBXaXRoICJwZXJjZXB0dWFsIiB5b3UgbWVhbiB0aGF0
IGxvZ2FyaXRobWljIHN0dWZmLCByaWdodD8KPiAKPiBIdW1hbiBwZXJjZXB0aW9uIGlzIGZhaXJs
eSBjb21wbGV4IHNvIGl0IGRlcGVuZHMgaG93IHN0cmljdCB5b3Ugd2FudCB0bwo+IGdldC4gQXQg
dGhlIGVuZCBvZiB0aGUgZGF5IHdoYXQgaXQgbWVhbnMgaXMgeW91IGNhbiBtYXAgYSBzbGlkZXIg
VUkKPiBjb21wb25lbnQgZGlyZWN0bHkgdG8gdGhlIGJhY2tsaWdodCByYW5nZSBhbmQgaXQgd2ls
bCBmZWVsIHJpZ2h0LiBUaHVzCj4gYSB1c2Vyc3BhY2UgdGhhdCBtYXBzIGRpcmVjdGx5IHRvIGEg
c2xpZGVyICppcyogYXNzdW1pbmcgdGhlIHNjYWxlCj4gaXMgcGVyY2VwdHVhbC4KCkkgaGF2ZSBw
cm9ibGVtcyB0byBkZWNsYXJlIHNvbWV0aGluZyBhcyAidGhlIHJpZ2h0IHRoaW5nIHRvIGRvIiB0
aGF0CmRlcGVuZHMgb24gZmVlbGluZyBvZiB1c2Vycy4gSSBtdWNoIHByZWZlciB0byBtYWtlIGEg
dGVjaG5pY2FsIGRldmljZQphdXRob3JpdGF0aXZlIGhlcmUgKGluIHRoaXMgY2FzZSBhIGRldmlj
ZSB0aGF0IG1lYXN1cmVzIGVtaXR0ZWQgbGlnaHQpLgoKT3RoZXIgdGhhbiB0aGF0IEkgZG9uJ3Qg
aGF2ZSBlbm91Z2ggZXhwZXJpZW5jZSB3aXRoIGJhY2tsaWdodHMgdG8ganVkZ2UKdGhlIGRlY2lz
aW9ucyB0aGF0IGhhdmUgdG8gYmUgZG9uZSBhbmQgc28gd2lsbCBzdG9wIG15IHBhcnRpY2lwYXRp
b24gaW4KdGhpcyB0aHJlYWQgbm93LgoKQmVzdCByZWdhcmRzClV3ZQoKLS0gClBlbmd1dHJvbml4
IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAg
ICAgICAgfApJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRw
Oi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
