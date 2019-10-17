Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C86DB7C7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 21:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBDE6E079;
	Thu, 17 Oct 2019 19:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BB76E079
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 19:44:07 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iLBgr-0006ya-5S; Thu, 17 Oct 2019 21:44:05 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iLBgq-0003XT-95; Thu, 17 Oct 2019 21:44:04 +0200
Date: Thu, 17 Oct 2019 21:44:04 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017194404.vvjfgt2wdrfoq7l2@pengutronix.de>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <c89925bd-857d-874f-b74f-c5700d4c9fbd@ysoft.com>
 <20191017101116.3d5okxmto5coecad@pengutronix.de>
 <20191017111131.GB3122066@ulmo>
 <20191017120917.fcb7x4fq4tbl2iat@pengutronix.de>
 <20191017125932.GB3768303@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017125932.GB3768303@ulmo>
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
 Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gVGhpZXJyeSwKCk9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDAyOjU5OjMyUE0gKzAyMDAs
IFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDAyOjA5OjE3
UE0gKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTcsIDIw
MTkgYXQgMDE6MTE6MzFQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3B3bS9wd20taW14MjcuYyBiL2RyaXZlcnMvcHdtL3B3bS1pbXgyNy5j
Cj4gPiA+IGluZGV4IGFlMTFkODU3N2YxOC4uNDExM2Q1Y2Q0YzYyIDEwMDY0NAo+ID4gPiAtLS0g
YS9kcml2ZXJzL3B3bS9wd20taW14MjcuYwo+ID4gPiArKysgYi9kcml2ZXJzL3B3bS9wd20taW14
MjcuYwo+ID4gPiBbLi4uXQo+ID4gCj4gPiBJIHdvbmRlciBpZiBpdCB3b3VsZCBiZSBtb3JlIHNl
bnNpYmxlIHRvIGRvIHRoaXMgaW4gdGhlIHB3bSBjb3JlCj4gPiBpbnN0ZWFkLiBDdXJyZW50bHkg
dGhlcmUgYXJlIHR3byBkcml2ZXJzIGtub3duIHdpdGggdGhpcyBwcm9ibGVtLiBJCj4gPiB3b3Vs
ZG4ndCBiZSBzdXJwcmlzZWQgaWYgdGhlcmUgd2VyZSBtb3JlLgo+IAo+IEkndmUgaW5zcGVjdGVk
IGFsbCB0aGUgZHJpdmVycyBhbmQgZGlkbid0IHNwb3QgYW55IGJleW9uZCBjcm9zLWVjIGFuZAo+
IGkuTVggdGhhdCBoYXZlIHRoaXMgcHJvYmxlbS4KCkkgdG9vayBhIGxvb2ssIHRvbywgYW5kIEkn
ZCBzYXkgcHdtLWF0bWVsLmMsIHB3bS1pbXgtdHBtLmMsIHB3bS1scHNzLmMsCnB3bS1tZXNvbi5j
LCBwd20tc2lmaXZlLmMsIHB3bS1zcHJkLmMgYW5kIHB3bS1zdG0zMi1scC5jIGFyZSBhZmZlY3Rl
ZC4KCj4gU28gdGhlIGNvcmUgd291bGQgaGF2ZSB0byByZWx5IG9uIHN0YXRlLT5kdXR5X2N5Y2xl
IHRoYXQgaXMgcGFzc2VkIGluLAo+IGJ1dCB0aGVuIHRoZSBvZmZlbmRpbmcgY29tbWl0IGJlY29t
ZXMgdXNlbGVzcyBiZWNhdXNlIHRoZSB3aG9sZSBwb2ludAo+IHdhcyB0byByZXR1cm4gdGhlIHN0
YXRlIGFzIHdyaXR0ZW4gdG8gaGFyZHdhcmUgKHJhdGhlciB0aGFuIHRoZQo+IHNvZnR3YXJlIHN0
YXRlIHdoaWNoIHdhcyBiZWluZyByZXR1cm5lZCBiZWZvcmUgdGhhdCBwYXRjaCkuCgpJIGxpa2Ug
YWxsb3dpbmcgbG93bGV2ZWwgZHJpdmVycyB0byBpbXBsZW1lbnQgdGhlIC5lbmFibGVkID0gZmFs
c2UgY2FzZQpsYXppbHkgYXMgdGhlcmUgaXMgbGl0dGxlIHZhbHVlIGluIGNhbGN1bGF0aW5nIHRo
ZSBuZWVkZWQgcmVnaXN0ZXIKdmFsdWVzIGZvciBhIHJlcXVlc3QgbGlrZQoKCS5kdXR5X2N5Y2xl
ID0gWCwgLnBlcmlvZCA9IFksIC5lbmFibGVkID0gZmFsc2UKCmV2ZW4gaWYgdGhlIG5leHQgcmVx
dWVzdCBtaWdodCBiZQoKCS5kdXR5X2N5Y2xlID0gWCwgLnBlcmlvZCA9IFksIC5lbmFibGVkID0g
dHJ1ZQoKYmVjYXVzZSBxdWl0ZSBsaWtlbHkgdGhlIHNhbWUgY2FsY3VsYXRpb24gaXMgZG9uZSBm
b3IgdGhlIHNlY29uZCByZXF1ZXN0CmFnYWluIGFuZCB0aGVyZSBpcyBubyBiZW5lZml0IHRvIHNh
dmUgWCBhbmQgWSBpbiB0aGUgaGFyZHdhcmUgKG9yIHRoZQpkcml2ZXIgaWYgdGhlIGhhcmR3YXJl
IGlzIGluY2FwYWJsZSkgYXBhcnQgZnJvbSByZXR1cm5pbmcgaXQgdG8gYQpjb25zdW1lciB3aG8g
bWF5YmUgZXZlbiBkb2Vzbid0IGNhcmUgYmVjYXVzZSB0aGVzZSB2YWx1ZXMgZG9uJ3QgdGVsbAph
bnl0aGluZyBhdCBhbGwgYWJvdXQgdGhlIGltcGxlbWVudGVkIHdhdmUgZm9ybSBhbmQgc28gaXQg
c2VlbXMgbmF0dXJhbAp0byBtZSB0aGF0IHRoZSBsb3dsZXZlbCBkcml2ZXIgc2hvdWxkbid0IGNh
cmUuCgo+ID4gSWYgd2Ugd2FudCB0byBtb3ZlIGNsaWVudHMgdG8gbm90IHJlbHkgb24gLnBlcmlv
ZCBhbmQgLmR1dHlfY3ljbGUgZm9yIGEKPiA+IGRpc2FibGVkIFBXTSAoZG8gd2U/KSBhIHNpbmds
ZSBjaGFuZ2UgaW4gdGhlIGNvcmUgaXMgYWxzbyBiZW5lZmljaWFsCj4gPiBjb21wYXJlZCB0byBm
aXhpbmcgc2V2ZXJhbCBsb3dsZXZlbCBkcml2ZXJzLgo+IAo+IFRoZXNlIGFyZSByZWFsbHkgdHdv
IG9ydGhvZ29uYWwgcHJvYmxlbXMuIFdlIGRvbid0IGN1cnJlbnRseSBjb25zaWRlcgo+IGVuYWJs
ZWQgPSAwIHRvIGJlIGVxdWl2YWxlbnQgdG8gZHV0eV9jeWNsZSA9IDAgYXQgYW4gQVBJIGxldmVs
LiBJJ20gbm90Cj4gcHJlcGFyZWQgdG8gZG8gdGhhdCBhdCB0aGlzIHBvaW50IGluIHRoZSByZWxl
YXNlIGN5Y2xlIGVpdGhlci4KClllYWgsIEkgZnVsbHkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgbm90
IGRvIHRoYXQgbm93LiBHaXZlbiB0aGUgbnVtYmVyIG9mCmFmZmVjdGVkIGRyaXZlcnMgSSBvcHQg
Zm9yIHJldmVydGluZyBhbmQgcmV0cnlpbmcgYWdhaW4gbW9yZSBjYXJlZnVsbHkKbGF0ZXIuCiAK
PiBXaGF0IHRoaXMgaGVyZSBoYXMgc2hvd24gaXMgdGhhdCB3ZSBoYXZlIGF0IGxlYXN0IHR3byBk
cml2ZXJzIHRoYXQgZG9uJ3QKPiBiZWhhdmUgdGhlIHdheSB0aGV5IGFyZSBzdXBwb3NlZCB0byBh
Y2NvcmRpbmcgdG8gdGhlIEFQSSBhbmQgdGhleSBicmVhawo+IGNvbnN1bWVycy4gSWYgdGhleSBi
cmVhayBmb3IgcHdtLWJhY2tsaWdodCwgaXQncyBwb3NzaWJsZSB0aGF0IHRoZXkgd2lsbAo+IGJy
ZWFrIGZvciBvdGhlciBjb25zdW1lcnMgYXMgd2VsbC4gU28gdGhlIHJpZ2h0IHRoaW5nIHRvIGRv
IGlzIGZpeCB0aGUKPiB0d28gZHJpdmVycyB0aGF0IGFyZSBicm9rZW4uCgpJbiBteSBleWVzIHNo
aWZ0aW5nIHRoZSBkZWZpbml0aW9uIG9mICJleHBlY3RlZCBiZWhhdmlvdXIiIGFuZCBhZGFwdGlu
Zwp0aGUgY29yZSBjb2RlIGFjY29yZGluZ2x5IHRvIG1ha2UgdGhpcyBpbnZpc2libGUgdG8gY29u
c3VtZXJzIGlzIGFsc28gYQp2aWFibGUgb3B0aW9uLiBBbHNvIHNoaWZ0aW5nIHRoZSBkZWZpbml0
aW9uIGFuZCBhZGFwdCBhbGwgY29uc3VtZXJzIG5vdAp0byByZWx5IG9uIHRoZSBvbGQgYmVoYXZp
b3VyIGlzIGZpbmUuIEJ1dCBhcyBhYm92ZSwgdGhpcyBpcyBub3QgYSBnb29kCmlkZWEgYXQgdGhl
IGN1cnJlbnQgcG9pbnQgaW4gdGltZS4KCkJlc3QgcmVnYXJkcwpVd2UKCi0tIApQZW5ndXRyb25p
eCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAg
ICAgICAgIHwKSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0
cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
