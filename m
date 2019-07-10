Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B29E646CA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 15:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1B56E0D7;
	Wed, 10 Jul 2019 13:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82556E0D7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 13:07:42 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hlCJw-00018R-Tf; Wed, 10 Jul 2019 15:07:40 +0200
Message-ID: <1562764060.23869.12.camel@pengutronix.de>
Subject: Re: [PATCH] drm/panel: simple: fix AUO g185han01 horizontal blanking
From: Lucas Stach <l.stach@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Wed, 10 Jul 2019 15:07:40 +0200
In-Reply-To: <1544793616.3137.44.camel@pengutronix.de>
References: <20181112174126.3787-1-l.stach@pengutronix.de>
 <1544793616.3137.44.camel@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKc2luY2UgeW91J3ZlIGJlZW4gcGlja2luZyB1cCBzb21lIHBhbmVsIHBhdGNoZXMg
bGF0ZWx5LCBtaWdodCBJIGFzayB5b3UKdG8gdGFrZSBhIGxvb2sgYXQgdGhpcyBwYXRjaD8KClJl
Z2FyZHMsCkx1Y2FzCgpBbSBGcmVpdGFnLCBkZW4gMTQuMTIuMjAxOCwgMTQ6MjAgKzAxMDAgc2No
cmllYiBMdWNhcyBTdGFjaDoKPiBIaSBUaGllcnJ5LAo+IAo+IGNhbiB5b3UgcGxlYXNlIGhhdmUg
YSBsb29rIGF0IHRoaXMgb25lPwo+IAo+IFJlZ2FyZHMsCj4gTHVjYXMKPiAKPiBBbSBNb250YWcs
IGRlbiAxMi4xMS4yMDE4LCAxODo0MSArMDEwMCBzY2hyaWViIEx1Y2FzIFN0YWNoOgo+ID4gVGhl
IGhvcml6b250YWwgYmxhbmtpbmcgcGVyaW9kcyBhcmUgdG9vIHNob3J0LCBhcyB0aGUgdmFsdWVz
IGFyZQo+ID4gc3BlY2lmaWVkIGZvciBhIHNpbmdsZSBMVkRTIGNoYW5uZWwuIFNpbmNlIHRoaXMg
cGFuZWwgaXMgZHVhbCBMVkRTCj4gPiB0aGV5IG5lZWQgdG8gYmUgZG91YmxlZC4gV2l0aCB0aGlz
IGNoYW5nZSB0aGUgcGFuZWwgcmVhY2hlcyBpdHMKPiA+IG5vbWluYWwgdnJlZnJlc2ggcmF0ZSBv
ZiA2MEZwcywgaW5zdGVhZCBvZiB0aGUgNjRGcHMgd2l0aCB0aGUKPiA+IGN1cnJlbnQgd3Jvbmcg
YmxhbmtpbmcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBl
bmd1dHJvbml4LmRlPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1z
aW1wbGUuYyB8IDYgKysrLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jCj4gPiBpbmRleCA5Nzk2NGY3ZjJhY2UuLjJjODk3OTJlOTFlMiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiBAQCAtNjYzLDkgKzY2Myw5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhdW9fZzEzM2hhbjAxID0KPiA+IHsKPiA+IMKgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkaXNwbGF5X3RpbWluZyBhdW9fZzE4NWhhbjAxX3RpbWluZ3MgPSB7
Cj4gPiDCoAkucGl4ZWxjbG9jayA9IHsgMTIwMDAwMDAwLCAxNDQwMDAwMDAsIDE3NTAwMDAwMCB9
LAo+ID4gwqAJLmhhY3RpdmUgPSB7IDE5MjAsIDE5MjAsIDE5MjAgfSwKPiA+IC0JLmhmcm9udF9w
b3JjaCA9IHsgMTgsIDYwLCA3NCB9LAo+ID4gLQkuaGJhY2tfcG9yY2ggPSB7IDEyLCA0NCwgNTQg
fSwKPiA+IC0JLmhzeW5jX2xlbiA9IHsgMTAsIDI0LCAzMiB9LAo+ID4gKwkuaGZyb250X3BvcmNo
ID0geyAzNiwgMTIwLCAxNDggfSwKPiA+ICsJLmhiYWNrX3BvcmNoID0geyAyNCwgODgsIDEwOCB9
LAo+ID4gKwkuaHN5bmNfbGVuID0geyAyMCwgNDgsIDY0IH0sCj4gPiDCoAkudmFjdGl2ZSA9IHsg
MTA4MCwgMTA4MCwgMTA4MCB9LAo+ID4gwqAJLnZmcm9udF9wb3JjaCA9IHsgNiwgMTAsIDQwIH0s
Cj4gPiDCoAkudmJhY2tfcG9yY2ggPSB7IDIsIDUsIDIwIH0sCj4gCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
