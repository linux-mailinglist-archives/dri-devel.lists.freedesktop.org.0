Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2A4564F8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECFB6E331;
	Wed, 26 Jun 2019 08:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A4D6E331
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:58:35 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hg3l8-0006dR-FY; Wed, 26 Jun 2019 10:58:30 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hg3l5-0008VO-Se; Wed, 26 Jun 2019 10:58:27 +0200
Date: Wed, 26 Jun 2019 10:58:27 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: Set pin to sleep state when powered
 down
Message-ID: <20190626085827.fija4kfzb5uhwosi@pengutronix.de>
References: <20190522163428.7078-1-paul@crapouillou.net>
 <5b0f8bb3-e7b0-52c1-1f2f-9709992b76fc@linaro.org>
 <20190621135608.GB11839@ulmo>
 <20190624112844.fmwbfpdxjkst3u7r@holly.lan>
 <20190625093839.GB1516@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625093839.GB1516@ulmo>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, kernel@pengutronix.de,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTE6Mzg6MzlBTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTI6Mjg6NDRQTSArMDEwMCwgRGFuaWVs
IFRob21wc29uIHdyb3RlOgo+ID4gWy4uLl0gYWx0aG91Z2ggZ2l2ZW4gcHdtLWJhY2tsaWdodCBp
cyBlc3NlbnRpYWxseSBhIHdyYXBwZXIgZHJpdmVyCj4gPiByb3VuZCBhIFBXTSBJIHdvbmRlcmVk
IHdoeSB0aGUgcGluY3RybCB3YXMgb24gdGhlIGJhY2tsaWdodCBub2RlCj4gPiAocmF0aGVyIHRo
YW4gdGhlIFBXTSBub2RlKS4KPiAKPiBJIGFncmVlIHdpdGggdGhpcy4gV2UncmUgZGVmaW5pbmcg
dGhlIHBpbiBjb250cm9sIHN0YXRlIGZvciB0aGUgUFdNIHBpbiwKPiBzbyBpbiBteSBvcGluaW9u
IGl0IHNob3VsZCBiZSB0aGUgUFdNIGRyaXZlciB0aGF0IGNvbnRyb2xzIGl0Lgo+IAo+IE9uZSBy
ZWFzb24gd2h5IEkgdGhpbmsgdGhpcyBpcyBpbXBvcnRhbnQgaXMgaWYgd2UgZXZlciBlbmQgdXAg
d2l0aCBhCj4gZGV2aWNlIHRoYXQgcmVxdWlyZXMgcGlucyBmcm9tIHR3byBkaWZmZXJlbnQgY29u
dHJvbGxlcnMgdG8gYmUKPiBjb25maWd1cmVkIGF0IHJ1bnRpbWUsIHRoZW4gaG93IHdvdWxkIHdl
IG1vZGVsIHRoYXQ/IFNpbmNlIHBpbiBjb250cm9sCj4gc3RhdGVzIGNhbm5vdCBiZSBhZ2dyZWdh
dGVkLCBzbyB5b3UnZCBoYXZlIHRvIGhhdmUgbXVsdGlwbGUgImRlZmF1bHQiCj4gc3RhdGVzLCBl
YWNoIGZvciB0aGUgcGlucyB0aGF0IHRoZXkgY29udHJvbC4KCkkgdGhvdWdodCB5b3UgY2FuIGRv
OgoKCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CglwaW5jdHJsLTAgPSA8JnBpbmN0cmxfaW5f
Zmlyc3RfcGluY29udHJvbGxlcj4sIDwmcGluY3RybF9pbl9hbm90aGVyX2NvbnRyb2xsZXI+OwoK
aWYgdHdvIChvciBtb3JlKSBjb250cm9sbGVycyBhcmUgaW52b2x2ZWQuCiAKPiBPbiB0aGUgb3Ro
ZXIgaGFuZCBpZiB3ZSBhc3NvY2lhdGUgdGhlIHBpbiBjb250cm9sIHN0YXRlcyB3aXRoIGVhY2gg
b2YKPiB0aGUgcmVzb3VyY2VzIHRoYXQgbmVlZCB0aG9zZSBzdGF0ZXMsIHRoZW4gd2hlbiB0aG9z
ZSByZXNvdXJjZXMgYXJlCj4gY29udHJvbGxlZCwgdGhleSB3aWxsIGF1dG9tYXRpY2FsbHkga25v
dyBob3cgdG8gZGVhbCB3aXRoIHRoZSBzdGF0ZXMuCj4gVGhlIHRvcC1sZXZlbCBkZXZpY2UgKGku
ZS4gYmFja2xpZ2h0KSBkb2Vzbid0IG5lZWQgdG8gY29uY2VybiBpdHNlbGYKPiB3aXRoIHRob3Nl
IGRldGFpbHMuCgpTbyB0aGUgb3B0aW9ucyBhcmU6CgogYSkgcHV0ICJhY3RpdmUiIGFuZCAiaW5h
Y3RpdmUiIHBpbmN0cmxzIGludG8gdGhlIHB3bS1ub2RlLCBhbmQgbm90aGluZwogICAgcmVsYXRl
ZCB0byB0aGUgaW52b2x2ZWQgUFdNIHBpbnMgaW4gdGhlIGNvbnN1bWVyCgogYikgcHV0IHRoZSBQ
V00gcGluIGNvbmZpZyBpbiB0aGUgY29uc3VtZXIncyAiZGVmYXVsdCIgcGluY3RybCAoYW5kCiAg
ICBtYXliZSBsZWF2ZSBpdCBvdXQgaW50ICJpbml0IiBpZiB5b3Ugd2FudCBzbW9vdGggdGFraW5n
IG92ZXIpLgoKKE9yIG1heWJlIHVzZSAiZW5hYmxlZCIgYW5kICJkaXNhYmxlZCIgaW4gYSkgdG8g
bWF0Y2ggdGhlIHB3bV9zdGF0ZXMKLmVuYWJsZWQ/KQoKVGhlIGFkdmFudGFnZXMgSSBzZWUgaW4g
Yikgb3ZlciBhKSBhcmU6CgogLSAiZGVmYXVsdCIgYW5kICJpbml0IiBhcmUgYSBrbm93biBwaW5j
dHJsIGNvbmNlcHQgdGhhdCBtb3N0IHBlb3BsZQogICBzaG91bGQgaGF2ZSB1bmRlcnN0b29kLgoK
IC0gWW91IGhhdmUgYWxsIHBpbmN0cmwgY29uZmlnIGZvciB0aGUgYmFja2xpZ2h0IGluIGEgc2lu
Z2xlIHBsYWNlLgoKIC0gbm9uZSBvZiB0aGUgaW52b2x2ZWQgZHJpdmVyIG11c3QgZXhwbGljaXRs
eSBoYW5kbGUgcGluY3RybCBzdHVmZgoKWW91IHByZXN1bWUgdGhhdCBiKSBiZWluZyBjb21tb25s
eSBkb25lIGlzIGEgc2lnbiBvZiAib3VyIGRldmljZSB0cmVlcwphbmQga2VybmVsIHN1YnN5c3Rl
bXMgc3RpbGwgbWF0dXJpbmciLiBCdXQgbWF5YmUgaXQncyBvbmx5IHRoYXQgdGhlCmNhcGFiaWxp
dGllcyBwcm92aWRlZCBieSBwaW5jdHJsIHN1YnN5c3RlbSB3aXRob3V0IGV4dHJhIGVmZm9ydCBp
cyBnb29kCmVub3VnaD8KCkJlc3QgcmVnYXJkcwpVd2UKCi0tIApQZW5ndXRyb25peCBlLksuICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwK
SW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5w
ZW5ndXRyb25peC5kZS8gIHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
