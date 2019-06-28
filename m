Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D098C59BF2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32806E8DC;
	Fri, 28 Jun 2019 12:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499136E8DC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:48:44 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:59200)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hgqIu-0000oG-LM; Fri, 28 Jun 2019 13:48:36 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hgqIq-0001WC-7c; Fri, 28 Jun 2019 13:48:32 +0100
Date: Fri, 28 Jun 2019 13:48:32 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/armada: fix debugfs link error
Message-ID: <20190628124832.cedpoabfiqgjhtkq@shell.armlinux.org.uk>
References: <20190628103359.2516007-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628103359.2516007-1-arnd@arndb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FmEpqg75x9unomlBsmRDCIgN/BXip3W5+lKSjz4bVP4=; b=vny6Hmz++O86J7C/jOObNx8wv
 gT8hGXMkuDdfOhOxiQq+6p5nb2tr+8x3N+IfnhHkl+G8cmU9Oc00lLtxYe5hW6gfnMr5joV+ld0ui
 HHLz/FZN8TS3ZiJt4VIZfotY/RKDdvxtVW9Rn1Q07bKsyO1LoI3udIcViapcoNXL5oWnepVE0HdGr
 +IRMb3d3hDwKokzPYyahmHJPZuqWAzQXeB0awpFb7+2ne33dEH0CDNohugDnFX9ERMX4bDRZoQ2Qb
 e3ncggQxDTkCgmfd1VHTELBJKWkV0I82iPmgj3hGM4Fq4Sc67EoMNu1wKqfhcM/maFKfrLbTAbPjr
 M9O9U6OdA==;
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTI6MzM6NDBQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBEZWJ1Z2ZzIGNhbiBiZSBkaXNhYmxlZCBhdCBjb21waWxlIHRpbWUsIGNhdXNpbmcg
YSBsaW5rIGVycm9yCj4gd2l0aCB0aGUgbmV3bHkgcmVzdHJ1Y3R1cmVkIGNvZGU6Cj4gCj4gZHJp
dmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5vOiBJbiBmdW5jdGlvbiBgYXJtYWRhX2Ry
bV9jcnRjX2xhdGVfcmVnaXN0ZXInOgo+IGFybWFkYV9jcnRjLmM6KC50ZXh0KzB4OTc0KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgYXJtYWRhX2RybV9jcnRjX2RlYnVnZnNfaW5pdCcKPiAKPiBN
YWtlIHRoZSBjb2RlIGludG8gdGhlIGRlYnVnZnMgaW5pdCBmdW5jdGlvbiBjb25kaXRpb25hbC4K
ClRoYW5rcyBBcm5kLCBtaW5kIGlmIEkgcm9sbCB0aGlzIGludG8gdGhlIG9yaWdpbmFsIGNvbW1p
dD8KCj4gRml4ZXM6IDA1ZWM4YmQ1MjRiYSAoImRybS9hcm1hZGE6IHJlZG8gQ1JUQyBkZWJ1Z2Zz
IGZpbGVzIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMgfCA0ICsrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMKPiBpbmRleCBlM2E1OTY0ZDhhNjUuLjAzZDNmZDAw
ZmUwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMKPiBAQCAtNzczLDcg
Kzc3Myw5IEBAIHN0YXRpYyB2b2lkIGFybWFkYV9kcm1fY3J0Y19kZXN0cm95KHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YykKPiAgCj4gIHN0YXRpYyBpbnQgYXJtYWRhX2RybV9jcnRjX2xhdGVfcmVnaXN0
ZXIoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICB7Cj4gLQlhcm1hZGFfZHJtX2NydGNfZGVidWdm
c19pbml0KGRybV90b19hcm1hZGFfY3J0YyhjcnRjKSk7Cj4gKwlpZiAoSVNfRU5BQkxFRChDT05G
SUdfREVCVUdfRlMpKQo+ICsJCWFybWFkYV9kcm1fY3J0Y19kZWJ1Z2ZzX2luaXQoZHJtX3RvX2Fy
bWFkYV9jcnRjKGNydGMpKTsKPiArCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtLSAKPiAyLjIw
LjAKPiAKPiAKCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9y
Zy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBp
biBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRv
IHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
