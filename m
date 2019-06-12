Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35AF42C5A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 18:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E1589745;
	Wed, 12 Jun 2019 16:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E04F89740
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:32:33 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38634)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hb6Ak-0005iO-9A; Wed, 12 Jun 2019 17:32:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hb6Ai-0000SQ-Gk; Wed, 12 Jun 2019 17:32:24 +0100
Date: Wed, 12 Jun 2019 17:32:24 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH 08/13] drm/i2c: tda998x: move audio routing configuration
Message-ID: <20190612163224.5y7oxozx3oxysbsq@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXd-0001yS-Bg@rmk-PC.armlinux.org.uk>
 <CAGngYiUoLCzquqaxC3oMk7zJ8+WmgNi=NmFRO6HC8psu_PrunA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiUoLCzquqaxC3oMk7zJ8+WmgNi=NmFRO6HC8psu_PrunA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j7/bCBDiQbmXUJQErDoO9ovAAnB9dt/tLMC5RQBh5K0=; b=fhYcst8RwKf0kQcKBHdwMU4Mp
 IjjY5KzciVyS/FQMuQWPA0KHST2Kr6T5WpWnFSlwscI12PDkDohdfwTPGwySCM0gI3iOnoBAyXWjP
 bBt/LwqWZs5YIsBlujxQjJox402vG7ONHQnAKdVGY1cS9P60/aKKdTWcIr9bqwy3T0a4l73R5U0ft
 z1JwPSkbVkguW7mB+N4MoQ3cwT16udGtfn3JTUuJnNUkR0pTVn6LckySUa+0TxyKqLcdSOeUwx9pf
 Bqen+FePBIe4B2MNSBKxKQ37JDFg1WBTP3myEJBLsg2nsqMccvI0PfDWNFiO75laIvODGjC2IAm7x
 787nxY28g==;
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

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MzY6NTlBTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMiBBTSBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBNb3ZlIHRoZSBtdXgg
YW5kIGNsb2NraW5nIHNlbGVjdGlvbiBvdXQgb2YgdGRhOTk4eF9jb25maWd1cmVfYXVkaW8oKQo+
ID4gaW50byB0aGUgcGFyZW50IGZ1bmN0aW9ucywgc28gd2UgY2FuIHZhbGlkYXRlIHRoaXMgd2hl
biBwYXJhbWV0ZXJzCj4gPiBhcmUgc2V0IG91dHNpZGUgb2YgdGhlIGF1ZGlvIG11dGV4Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWs+Cj4gPiAtLS0KPiAKPiArLyogQ29uZmlndXJlIHRoZSBUREE5OTh4IGF1ZGlvIGRhdGEgYW5k
IGNsb2NrIHJvdXRpbmcuICovCj4gK3N0YXRpYyBpbnQgdGRhOTk4eF9kZXJpdmVfcm91dGluZyhz
dHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgdGRhOTk4eF9hdWRpb19zZXR0aW5ncyAqcywKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJvdXRlKQo+ICt7Cj4gKyAgICAgICBzLT5y
b3V0ZSA9ICZ0ZGE5OTh4X2F1ZGlvX3JvdXRlW3JvdXRlXTsKPiArICAgICAgIHMtPmVuYV9hcCA9
IHByaXYtPmF1ZGlvX3BvcnRfZW5hYmxlW3JvdXRlXTsKPiArICAgICAgIGlmIChzLT5lbmFfYXAg
PT0gMCkgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKCZwcml2LT5oZG1pLT5kZXYsICJubyBh
dWRpbyBjb25maWd1cmF0aW9uIGZvdW5kXG4iKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiAKPiBOaXQ6
IHByaXYgaXMgbmVhcmx5IHVudXNlZCBpbiB0aGlzIGZ1bmN0aW9uLgo+IE1heWJlIGRlbGVnYXRl
IHRoZSBlcnJvciBsb2cgdG8gdGhlIGNhbGxlciwgaW4gdGhhdCBjYXNlIHdlIGNvdWxkIGp1c3Qg
cGFzcwo+IHJvdXRlIGFuZCBjb25zdCBhdWRpb19wb3J0X2VuYWJsZSB0byB0aGUgZnVuY3Rpb24u
IEluc3RlYWQgb2YgcGFzc2luZyBpbiB0aGUKPiAna2l0Y2hlbiBzaW5rJyBwcml2ID8KCkkgZG9u
J3QgdGhpbmsgdGhhdCdzIHdvcnRoIGRvaW5nLiAgVGhpcyB3YXksIGNvbXBpbGVycyBhcmUgZnJl
ZSB0bwplbWl0IGNvZGUgdG8gYm91bmRzLWNoZWNrIHRoZSBhdWRpb19wb3J0X2VuYWJsZSBhY2Nl
c3Mgc2luY2UgdGhleQprbm93IHRoYXQgaXQgaXMgYSBkZWZpbmVkIHNpemUuICBQYXNzaW5nIGlu
IGEgY29uc3QgcG9pbnRlciBjYQptZWFuIHRoYXQgY2hlY2sgaGFzIHRvIGJlIGF2b2lkZWQuCgot
LSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxv
cGVyL3BhdGNoZXMvCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6
IHN5bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3Qu
bmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
