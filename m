Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBDCDA9A1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 12:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA1D6EA3C;
	Thu, 17 Oct 2019 10:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B306EA3C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 10:11:21 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iL2kY-0003Uf-Ew; Thu, 17 Oct 2019 12:11:18 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iL2kW-0001UO-UY; Thu, 17 Oct 2019 12:11:16 +0200
Date: Thu, 17 Oct 2019 12:11:16 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017101116.3d5okxmto5coecad@pengutronix.de>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <c89925bd-857d-874f-b74f-c5700d4c9fbd@ysoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c89925bd-857d-874f-b74f-c5700d4c9fbd@ysoft.com>
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
 Adam Ford <aford173@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, Jingoo Han <jingoohan1@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTE6NDg6MDhBTSArMDIwMCwgTWljaGFsIFZva8OhxI0g
d3JvdGU6Cj4gT24gMTcuIDEwLiAxOSAxMDoxMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4g
PiBBIHByZXZpb3VzIGNoYW5nZSBpbiB0aGUgcHdtIGNvcmUgKG5hbWVseSAwMWNjZjkwM2VkZDYg
KCJwd206IExldAo+ID4gcHdtX2dldF9zdGF0ZSgpIHJldHVybiB0aGUgbGFzdCBpbXBsZW1lbnRl
ZCBzdGF0ZSIpKSBjaGFuZ2VkIHRoZQo+ID4gc2VtYW50aWMgb2YgcHdtX2dldF9zdGF0ZSgpIGFu
ZCBkaXNjbG9zZWQgYW4gKGFzIGl0IHNlZW1zKSBjb21tb24KPiA+IHByb2JsZW0gaW4gbG93bGV2
ZWwgUFdNIGRyaXZlcnMuIEJ5IG5vdCByZWx5aW5nIG9uIHRoZSBwZXJpb2QgYW5kIGR1dHkKPiA+
IGN5Y2xlIGJlaW5nIHJldHJpZXZhYmxlIGZyb20gYSBkaXNhYmxlZCBQV00gdGhpcyB0eXBlIG9m
IHByb2JsZW0gaXMKPiA+IHdvcmtlZCBhcm91bmQuCj4gPiAKPiA+IEFwYXJ0IGZyb20gdGhpcyBp
c3N1ZSBvbmx5IGNhbGxpbmcgdGhlIHB3bV9nZXRfc3RhdGUvcHdtX2FwcGx5X3N0YXRlCj4gPiBj
b21ibyBvbmNlIGlzIGFsc28gbW9yZSBlZmZlY3RpdmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gPiAt
LS0KPiA+IEhlbGxvLAo+ID4gCj4gPiBUaGVyZSBhcmUgbm93IHR3byByZXBvcnRzIGFib3V0IDAx
Y2NmOTAzZWRkNiBicmVha2luZyBhIGJhY2tsaWdodC4gQXMKPiA+IGZhciBhcyBJIHVuZGVyc3Rh
bmQgdGhlIHByb2JsZW0gdGhpcyBpcyBhIGNvbWJpbmF0aW9uIG9mIHRoZSBiYWNrZW5kIHB3bQo+
ID4gZHJpdmVyIHlpZWxkaW5nIHN1cnByaXNpbmcgcmVzdWx0cyBhbmQgdGhlIHB3bS1ibCBkcml2
ZXIgZG9pbmcgdGhpbmdzCj4gPiBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gbmVjZXNzYXJ5Lgo+ID4g
Cj4gPiBTbyBJIGd1ZXNzIHRoaXMgcGF0Y2ggd29ya3MgYXJvdW5kIHRoZXNlIHByb2JsZW1zLiBT
dGlsbCBpdCB3b3VsZCBiZQo+ID4gaW50ZXJlc3RpbmcgdG8gZmluZCBvdXQgdGhlIGRldGFpbHMg
aW4gdGhlIGlteCBkcml2ZXIgdGhhdCB0cmlnZ2VycyB0aGUKPiA+IHByb2JsZW0uIFNvIEFkYW0s
IGNhbiB5b3UgcGxlYXNlIGluc3RydW1lbnQgdGhlIHB3bS1pbXgyNyBkcml2ZXIgdG8KPiA+IHBy
aW50ICpzdGF0ZSBhdCB0aGUgYmVnaW5uaW5nIG9mIHB3bV9pbXgyN19hcHBseSgpIGFuZCB0aGUg
ZW5kIG9mCj4gPiBwd21faW14MjdfZ2V0X3N0YXRlKCkgYW5kIHByb3ZpZGUgdGhlIHJlc3VsdHM/
Cj4gPiAKPiA+IE5vdGUgSSBvbmx5IGNvbXBpbGUgdGVzdGVkIHRoaXMgY2hhbmdlLgo+IAo+IEhp
IFV3ZSwKPiBJIHdhcyBqdXN0IGFib3V0IHRvIHJlc3BvbmQgdG8gdGhlICJwd21fYmwgb24gaS5N
WDZRIGJyb2tlbiBvbiA1LjQtUkMxKyIKPiB0aHJlYWQgdGhhdCBJIGhhdmUgYSBzaW1pbGFyIHBy
b2JsZW0gd2hlbiB5b3Ugc3VibWl0dGVkIHRoaXMgcGF0Y2guCj4gCj4gU28gaGVyZSBhcmUgbXkg
ZmV3IGNlbnRzOgo+IAo+IE15IHNldHVwIGlzIGFzIGZvbGxvd3M6Cj4gIC0gaW14NmRsLXlhcHA0
LWRyYWNvIHdpdGggaS5NWDZTb2xvCj4gIC0gYmFja2xpZ2h0IGlzIGNvbnRyb2xsZWQgd2l0aCBp
bnZlcnRlZCBQV00gc2lnbmFsCj4gIC0gbWF4IGJyaWdodG5lc3MgbGV2ZWwgPSAzMiwgZGVmYXVs
dCBicmlnaHRuZXNzIGxldmVsIHNldCB0byAzMiBpbiBEVC4KPiAKPiAxLiBBbG1vc3QgY29ycmVj
dCBiYWNrbGlnaHQgYmVoYXZpb3IgYmVmb3JlIDAxY2NmOTAzZWRkNiAoInB3bTogTGV0Cj4gICAg
cHdtX2dldF9zdGF0ZSgpIHJldHVybiB0aGUgbGFzdCBpbXBsZW1lbnRlZCBzdGF0ZSk6Cj4gCj4g
IC0gU3lzdGVtIGJvb3RzIHRvIHVzZXJzcGFjZSBhbmQgYmFja2xpZ2h0IGlzIGVuYWJsZWQgYWxs
IHRoZSB0aW1lIGZyb20KPiAgICBwb3dlciB1cC4KPiAKPiAgICAkIGRtZXNnIHwgZ3JlcCBzdGF0
ZQo+ICAgIFsgICAgMS43NjMzODFdIGdldCBzdGF0ZSBlbmQ6IC0xODExMzYwNjA4LCBlbmFibGVk
OiAwCgpXaGF0IGlzIC0xODExMzYwNjA4PyBXaGVuIEkgd3JvdGUgInByaW50ICpzdGF0ZSIgYWJv
dmUsIEkgdGhvdWdodCBhYm91dApzb21ldGhpbmcgbGlrZToKCglwcl9pbmZvKCIlczogcGVyaW9k
OiAldSwgZHV0eTogJXUsIHBvbGFyaXR5OiAlZCwgZW5hYmxlZDogJWQiLAoJCV9fZnVuY19fLCBz
dGF0ZS0+cGVyaW9kLCBzdGF0ZS0+ZHV0eV9jeWNsZSwgc3RhdGUtPnBvbGFyaXR5LCBzdGF0ZS0+
ZW5hYmxlZCk7CgpBIHF1aWNrIGxvb2sgaW50byBkcml2ZXJzL3B3bS9wd20taW14MjcuYyBzaG93
cyB0aGF0IHRoaXMgaXMgYW5vdGhlcgpkcml2ZXIgdGhhdCB5aWVsZHMgZHV0eV9jeWNsZSA9IDAg
d2hlbiB0aGUgaGFyZHdhcmUgaXMgb2ZmLgoKQmVzdCByZWdhcmRzClV3ZQoKLS0gClBlbmd1dHJv
bml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnICAg
ICAgICAgICAgfApJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBo
dHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
