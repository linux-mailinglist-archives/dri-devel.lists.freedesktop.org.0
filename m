Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294EB28B46B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 14:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251136E0BC;
	Mon, 12 Oct 2020 12:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A256E0BC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3cb7WZFRBswsrdws6R8QmvzchDk3x4uafw61Cqj46FE=; b=MktsYIDrMHeWyYQQFErIcK5cU
 NFHtdu8v0drlLLjOeQTWnWlr6q9uz1x3Vn673Ustp5/XskoF5KGILucp3vuFaq8NuQTFX5fjaKUUq
 Cu1MFC78UaMcmxkZp40Yf/jZZoJGN0RB2tJErpTb6PtGaTfe1VqemFhqVP2Uy9Twm1+Uw2YbraekZ
 2Smca42r+QwqTSqDHYPKG7+TyqSfjKLbWArtPm7SuLnJ4H1LF5jtar7Blx/hUYA9QM5ICYA8V9fiy
 IdfwQJbJzR4ZWWWIqB2T9FmJH4yeqlFCaS9fp6So0wOojLVqdj/4ytDMMBmYcYHufq86hSFi9YWdY
 ycr1OIB9g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45066)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kRwio-0003zN-CC; Mon, 12 Oct 2020 13:14:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kRwik-0005bg-Hu; Mon, 12 Oct 2020 13:14:30 +0100
Date: Mon, 12 Oct 2020 13:14:30 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] gpu/drm/armada: fix unused parameter warning
Message-ID: <20201012121430.GP1551@shell.armlinux.org.uk>
References: <20201012115724.8980-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012115724.8980-1-bernard@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, opensource.kernel@vivo.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTIsIDIwMjAgYXQgMDQ6NTc6MjRBTSAtMDcwMCwgQmVybmFyZCBaaGFvIHdy
b3RlOgo+IEZ1bmN0aW9ucyBhcm1hZGFfZHJtX2NydGNfYXRvbWljX2ZsdXNoICYKPiBhcm1hZGFf
ZHJtX2NydGNfYXRvbWljX2VuYWJsZSBkb25gdCB1c2UgdGhlIHNlY29uZCBwYXJhbWV0ZXIuCj4g
U28gd2UgbWF5IGdldCB3YXJuaW5nIGxpa2UgOgo+IHdhcm5pbmc6IHVudXNlZCBwYXJhbWV0ZXIg
4oCYKioq4oCZIFstV3VudXNlZC1wYXJhbWV0ZXJdLgo+IFRoaXMgY2hhbmdlIGlzIHRvIGZpeCB0
aGUgY29tcGlsZSB3YXJuaW5nIHdpdGggLVd1bnVzZWQtcGFyYW1ldGVyLgoKVW5kZXIgd2hhdCBj
aXJjdW1zdGFuY2VzIGRvIHdlIGJ1aWxkIHRoZSBrZXJuZWwgd2l0aCB0aGF0IHdhcm5pbmcKZW5h
YmxlZD8KCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMgfCA0ICsrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jCj4gaW5kZXggMzhkZmFhNDZkMzA2Li5mYzhi
OTIyYzNlNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0
Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jCj4gQEAgLTQy
Nyw3ICs0MjcsNyBAQCBzdGF0aWMgaW50IGFybWFkYV9kcm1fY3J0Y19hdG9taWNfY2hlY2soc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBhcm1hZGFfZHJtX2Ny
dGNfYXRvbWljX2JlZ2luKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAtCQkJCQkgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0ZSkKPiArCQkJCXN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKSAqb2xkX2NydGNfc3RhdGUpCj4gIHsKPiAgCXN0cnVj
dCBhcm1hZGFfY3J0YyAqZGNydGMgPSBkcm1fdG9fYXJtYWRhX2NydGMoY3J0Yyk7Cj4gIAo+IEBA
IC00NDEsNyArNDQxLDcgQEAgc3RhdGljIHZvaWQgYXJtYWRhX2RybV9jcnRjX2F0b21pY19iZWdp
bihzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGFybWFkYV9k
cm1fY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLAo+IC0JCQkJCSBzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlKQo+ICsJCQkJc3RydWN0IGRybV9jcnRj
X3N0YXRlIF9fYXR0cmlidXRlX18oKHVudXNlZCkpICpvbGRfY3J0Y19zdGF0ZSkKPiAgewo+ICAJ
c3RydWN0IGFybWFkYV9jcnRjICpkY3J0YyA9IGRybV90b19hcm1hZGFfY3J0YyhjcnRjKTsKPiAg
Cj4gLS0gCj4gMi4yOC4wCj4gCj4gCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3
dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgNDBNYnBz
IGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
