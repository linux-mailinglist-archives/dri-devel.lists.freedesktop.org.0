Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1849586FF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 18:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB426E129;
	Thu, 27 Jun 2019 16:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522676E129
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 16:26:30 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:59168)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hgXEA-00043q-0g; Thu, 27 Jun 2019 17:26:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hgXE9-0000jo-7J; Thu, 27 Jun 2019 17:26:25 +0100
Date: Thu, 27 Jun 2019 17:26:25 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: add missing failure path to destroy suballoc
Message-ID: <20190627162625.aoxuss3j5u7lcpy2@shell.armlinux.org.uk>
References: <20190627144438.2016-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627144438.2016-1-l.stach@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UxhdSegeJc5x7iqawEdZNy0375DdJZgloBdbB4MKAaA=; b=fI0wPExbJTHHKZY/qWHgAUmCK
 4tZF2CMUxkF8VoZvL1tE1xcxBaGrstu0MASuy1TOR+lAiyPDA/WxYsEAThDTWmnopffOpv3t8F+il
 ZCmSyEiEkYg4zrvbK5S7YS3MszjlkfW+fPKiacM9rtWkOIUg1tZG5jx2zBmjCTncEc7jKoLJIriVl
 BJBZ79iX+A1Au/PwRTUNpzqFqVz6r8Z8E+VDVspGwlGAU9+xB9tDyFWYjhxP/O/X/lrprwcc5BnXj
 GNuvS1fYqKPiDUwqK5xU3OS9uTYnM30lVQ2Af4RikPREGNSBm6yPIAlJbQgeERivXlrvz/pxYFO5R
 6NNOgaN4Q==;
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDQ6NDQ6MzhQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gV2hlbiBzb21ldGhpbmcgZ29lcyB3cm9uZyBpbiB0aGUgR1BVIGluaXQgYWZ0ZXIgdGhl
IGNtZGJ1ZiBzdWJhbGxvY2F0b3IKPiBoYXMgYmVlbiBjb25zdHJ1Y3RlZCwgd2UgZmFpbCB0byBk
ZXN0b3J5IGl0IHByb3Blcmx5LiBUaGlzIGNhdXNlcyBoYXZvawo+IGxhdGVyIHdoZW4gdGhlIEdQ
VSBpcyB1bmJvdW5kIGR1ZSB0byBhIG1vZHVsZSB1bmxvYWQgb3Igc2ltaWxhci4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KVGVzdGVkLWJ5
OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgoKVGhhbmtzLgoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyB8IDcgKysrKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwo+IGluZGV4IDcyZDAxZTg3MzE2MC4uNTQx
OGExYTg3YjJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gQEAg
LTc2MCw3ICs3NjAsNyBAQCBpbnQgZXRuYXZpdl9ncHVfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUg
KmdwdSkKPiAgCWlmIChJU19FUlIoZ3B1LT5jbWRidWZfc3ViYWxsb2MpKSB7Cj4gIAkJZGV2X2Vy
cihncHUtPmRldiwgIkZhaWxlZCB0byBjcmVhdGUgY21kYnVmIHN1YmFsbG9jYXRvclxuIik7Cj4g
IAkJcmV0ID0gUFRSX0VSUihncHUtPmNtZGJ1Zl9zdWJhbGxvYyk7Cj4gLQkJZ290byBmYWlsOwo+
ICsJCWdvdG8gZGVzdHJveV9pb21tdTsKPiAgCX0KPiAgCj4gIAkvKiBDcmVhdGUgYnVmZmVyOiAq
Lwo+IEBAIC03NjgsNyArNzY4LDcgQEAgaW50IGV0bmF2aXZfZ3B1X2luaXQoc3RydWN0IGV0bmF2
aXZfZ3B1ICpncHUpCj4gIAkJCQkgIFBBR0VfU0laRSk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJZGV2
X2VycihncHUtPmRldiwgImNvdWxkIG5vdCBjcmVhdGUgY29tbWFuZCBidWZmZXJcbiIpOwo+IC0J
CWdvdG8gZGVzdHJveV9pb21tdTsKPiArCQlnb3RvIGRlc3Ryb3lfc3ViYWxsb2M7Cj4gIAl9Cj4g
IAo+ICAJaWYgKGdwdS0+bW11LT52ZXJzaW9uID09IEVUTkFWSVZfSU9NTVVfVjEgJiYKPiBAQCAt
ODAwLDYgKzgwMCw5IEBAIGludCBldG5hdml2X2dwdV9pbml0KHN0cnVjdCBldG5hdml2X2dwdSAq
Z3B1KQo+ICBmcmVlX2J1ZmZlcjoKPiAgCWV0bmF2aXZfY21kYnVmX2ZyZWUoJmdwdS0+YnVmZmVy
KTsKPiAgCWdwdS0+YnVmZmVyLnN1YmFsbG9jID0gTlVMTDsKPiArZGVzdHJveV9zdWJhbGxvYzoK
PiArCWV0bmF2aXZfY21kYnVmX3N1YmFsbG9jX2Rlc3Ryb3koZ3B1LT5jbWRidWZfc3ViYWxsb2Mp
Owo+ICsJZ3B1LT5jbWRidWZfc3ViYWxsb2MgPSBOVUxMOwo+ICBkZXN0cm95X2lvbW11Ogo+ICAJ
ZXRuYXZpdl9pb21tdV9kZXN0cm95KGdwdS0+bW11KTsKPiAgCWdwdS0+bW11ID0gTlVMTDsKPiAt
LSAKPiAyLjIwLjEKPiAKPiAKCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFy
bWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1p
bGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNj
b3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
