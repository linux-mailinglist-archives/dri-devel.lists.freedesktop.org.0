Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6F998BC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 18:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFC76E530;
	Thu, 22 Aug 2019 16:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B426E530
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 16:05:25 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD9DF28D1DA;
 Thu, 22 Aug 2019 17:05:23 +0100 (BST)
Date: Thu, 22 Aug 2019 18:05:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 11/50] drm/bridge: Add bridge driver for display
 connectors
Message-ID: <20190822180520.2a65eebb@collabora.com>
In-Reply-To: <20190820011721.30136-12-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-12-laurent.pinchart@ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjo0MiArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiArCS8qCj4gKwkgKiBHZXQg
dGhlIEhQRCBHUElPIGZvciBEVkkgYW5kIEhETUkgY29ubmVjdG9ycy4gSWYgdGhlIEdQSU8gY2Fu
IHByb3ZpZGUKPiArCSAqIGludGVycnVwdHMsIHJlZ2lzdGVyIGFuIGludGVycnVwdCBoYW5kbGVy
Lgo+ICsJICovCj4gKwlpZiAodHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfRFZJSSB8fAo+ICsJ
ICAgIHR5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlBKSB7Cj4gKwkJY29ubi0+aHBkX2dw
aW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbCgmcGRldi0+ZGV2LCAiaHBkIiwKPiArCQkJCQkJ
CSBHUElPRF9JTik7Cj4gKwkJaWYgKElTX0VSUihjb25uLT5ocGRfZ3BpbykpIHsKPiArCQkJaWYg
KFBUUl9FUlIoY29ubi0+aHBkX2dwaW8pICE9IC1FUFJPQkVfREVGRVIpCj4gKwkJCQlkZXZfZXJy
KCZwZGV2LT5kZXYsCj4gKwkJCQkJIlVuYWJsZSB0byByZXRyaWV2ZSBIUEQgR1BJT1xuIik7Cj4g
KwkJCXJldHVybiBQVFJfRVJSKGNvbm4tPmhwZF9ncGlvKTsKPiArCQl9Cj4gKwo+ICsJCWNvbm4t
PmhwZF9pcnEgPSBncGlvZF90b19pcnEoY29ubi0+aHBkX2dwaW8pOwo+ICsJfSBlbHNlIHsKPiAr
CQljb25uLT5ocGRfaXJxID0gLUVJTlZBTDsKPiArCX0KPiArCj4gKwlpZiAoY29ubi0+aHBkX2ly
cSA+PSAwKSB7Cj4gKwkJcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgmcGRldi0+ZGV2
LCBjb25uLT5ocGRfaXJxLAo+ICsJCQkJCQlOVUxMLCBkaXNwbGF5X2Nvbm5lY3Rvcl9ocGRfaXJx
LAo+ICsJCQkJCQlJUlFGX1RSSUdHRVJfUklTSU5HIHwKPiArCQkJCQkJSVJRRl9UUklHR0VSX0ZB
TExJTkcgfAo+ICsJCQkJCQlJUlFGX09ORVNIT1QsCj4gKwkJCQkJCSJIUEQiLCBjb25uKTsKPiAr
CQlpZiAocmV0KSB7Cj4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwKPiArCQkJCSJGYWlsZWQgdG8g
cmVxdWVzdCBIUEQgaW50ZXJydXB0XG4iKTsKPiArCQkJcmV0dXJuIHJldDsKCklzIHRoZXJlIGFu
eXRoaW5nIHRoYXQgbWFuZGF0ZXMgc3VwcG9ydCBvZiBlZGdlIGV2ZW50cyBvbiBHUElPIGNoaXBz
PwpJIGtub3cgaXQncyBxdWl0ZSBjb21tb24sIGJ1dCBtYXliZSB3ZSBzaG91bGQgZmFsbGJhY2sg
dG8gcG9sbGluZwptb2RlIHdoZW4gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgpIGZhaWxzLgoK
PiArCQl9Cj4gKwl9Cj4gKwo+ICsJLyogUmV0cmlldmUgdGhlIEREQyBJMkMgYWRhcHRlciBmb3Ig
RFZJLCBIRE1JIGFuZCBWR0EgY29ubmVjdG9ycy4gKi8KPiArCWlmICh0eXBlID09IERSTV9NT0RF
X0NPTk5FQ1RPUl9EVklJIHx8Cj4gKwkgICAgdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERN
SUEgfHwKPiArCSAgICB0eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9WR0EpIHsKPiArCQlzdHJ1
Y3QgZGV2aWNlX25vZGUgKnBoYW5kbGU7Cj4gKwo+ICsJCXBoYW5kbGUgPSBvZl9wYXJzZV9waGFu
ZGxlKHBkZXYtPmRldi5vZl9ub2RlLCAiZGRjLWkyYy1idXMiLCAwKTsKPiArCQlpZiAocGhhbmRs
ZSkgewo+ICsJCQljb25uLT5icmlkZ2UuZGRjID0gb2ZfZ2V0X2kyY19hZGFwdGVyX2J5X25vZGUo
cGhhbmRsZSk7Cj4gKwkJCW9mX25vZGVfcHV0KHBoYW5kbGUpOwo+ICsJCQlpZiAoIWNvbm4tPmJy
aWRnZS5kZGMpCj4gKwkJCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiArCQl9IGVsc2Ugewo+ICsJ
CQlkZXZfZGJnKCZwZGV2LT5kZXYsCj4gKwkJCQkiTm8gSTJDIGJ1cyBzcGVjaWZpZWQsIGRpc2Fi
bGluZyBFRElEIHJlYWRvdXRcbiIpOwo+ICsJCX0KPiArCX0KPiArCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
