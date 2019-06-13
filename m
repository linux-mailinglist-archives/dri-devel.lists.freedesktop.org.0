Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603644D94
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60D892B7;
	Thu, 13 Jun 2019 20:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED65892B7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:36:49 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:56372)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbWSe-0005MI-4p; Thu, 13 Jun 2019 21:36:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbWSZ-0001V0-Ly; Thu, 13 Jun 2019 21:36:35 +0100
Date: Thu, 13 Jun 2019 21:36:35 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v2 01/13] drm/i2c: tda998x: introduce
 tda998x_audio_settings
Message-ID: <20190613203635.hiqroknbggzw2iv4@shell.armlinux.org.uk>
References: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
 <E1hbQkh-0007yl-DV@rmk-PC.armlinux.org.uk>
 <CAGngYiVO=YBnp3ePUJofmPQ_Eo_0tvuetoqyBqVs00aA7qh-7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiVO=YBnp3ePUJofmPQ_Eo_0tvuetoqyBqVs00aA7qh-7Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4+CveO2iY7DzEp0h1WDRC9KxABrLcuIsv/gz9uF/FBc=; b=Eh9J/gNkykB5UTLDMn9PHvejI
 TKhhGkjKagn9Ki8frATiweRqOjNmCQy3GIC5FqIMNTth2Td9sPjSgSkv6K22MZoAuiLBXsSytWw9p
 6vxWuYjFikiCVuj3SldzLZ4XHnTHPmrgftEd1vygu7X1D0k8O8DP/gtPM3L+p3m6N6sBsdqXa7DZr
 8kZ9T210PSN7wWkPZn5fcYiiF+g0Ng6y74vm5fc6co28M3To1DNB6enoOUYy2iZMihWCOYErYnTRP
 70PKsNHc0cTiG7B7TUP1vQ5fBNpcq/OPiumbRjAW6h/Q8A5uwin4RDQUPAUbLP+3bdgNpcFhAOMUO
 C6KS6wV3A==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDI6NDg6NDdQTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gTml0OiBjaGVja3BhdGNoLnBsIGFwcGVhcnMgdW5oYXBweSB3aXRoIHRoaXMg
cGF0Y2g6Cj4gCj4gV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKPiAjMjIyOiBGSUxF
OiBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmM6MTAxMToKPiArIGF1ZGlvLnBhcmFt
cy5jb25maWcgPSBwcml2LT5hdWRpb19wb3J0W2ldLmNvbmZpZzsKPiAKPiBXQVJOSU5HOiBsaW5l
IG92ZXIgODAgY2hhcmFjdGVycwo+ICMyMzA6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRh
OTk4eF9kcnYuYzoxMDE3Ogo+ICsgYXVkaW8ucGFyYW1zLmNvbmZpZyA9IHByaXYtPmF1ZGlvX3Bv
cnRbaV0uY29uZmlnOwo+IAo+IHRvdGFsOiAwIGVycm9ycywgMiB3YXJuaW5ncywgMTc4IGxpbmVz
IGNoZWNrZWQKCkNvbnNpZGVyaW5nIHRoYXQgY29kZSBpcyBnb2luZyBhd2F5IGluIHRoZSB2ZXJ5
IG5leHQgcGF0Y2gsIHRob3NlCndhcm5pbmdzIGFyZSBub3Qgc29tZXRoaW5nIEknbSBjb25jZXJu
ZWQgYWJvdXQgLSB0aGUgZXh0cmEgaGFzc2xlCm9mIGZvcm1hdHRpbmcgdGhlIGNvZGUgc28gY2hl
Y2twYXRjaCBpcyBoYXBweSBvbmx5IHRvIHJlbW92ZSBpdAppbiB0aGUgbmV4dCBwYXRjaCBpcyBu
b3Qgd29ydGggdGhlIGVmZm9ydC4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3
LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAu
OG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAK
QWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
