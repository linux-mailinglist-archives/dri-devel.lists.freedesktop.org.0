Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964277A669
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 13:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639D6E48F;
	Tue, 30 Jul 2019 11:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7C76E48F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 11:03:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C5A4206E0;
 Tue, 30 Jul 2019 11:03:49 +0000 (UTC)
Date: Tue, 30 Jul 2019 13:03:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/7] drivers: Introduce device lookup variants by
 of_node
Message-ID: <20190730110315.GA31631@kroah.com>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-3-suzuki.poulose@arm.com>
 <20190725135402.GL23883@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725135402.GL23883@dell>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564484629;
 bh=m7dX//3pP3+FR/k30u2LZ08eMNQLWPNMDC/X3b/BoIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMur5BSVhiHRRxRO7wuNTmwbmOspluKLLcMqQiSBI6R7I/hFrZiXflMDNkswhbTtv
 EtfxkIXJJq6sth6CVf9ItRiCuP0D4xoZNWRDgBMa+C9ci6Q/RzCOpg0pkrmiDgRQ+R
 3Gg+K/+v70+FPzWyiJ5B9GhEpGfyM7rsXoIoSgX0=
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 rafael@kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa@the-dreams.de>, David Airlie <airlied@linux.ie>,
 Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
 Alan Tull <atull@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDI6NTQ6MDJQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFR1ZSwgMjMgSnVsIDIwMTksIFN1enVraSBLIFBvdWxvc2Ugd3JvdGU6Cj4gCj4gPiBJ
bnRyb2R1Y2Ugd3JhcHBlcnMgZm9yIHtidXMvZHJpdmVyL2NsYXNzfV9maW5kX2RldmljZSgpIHRv
Cj4gPiBsb2NhdGUgZGV2aWNlcyBieSBpdHMgb2Zfbm9kZS4KPiA+IAo+ID4gQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVs
bGlAZ21haWwuY29tPgo+ID4gQ2M6IEZyYW5rIFJvd2FuZCA8ZnJvd2FuZC5saXN0QGdtYWlsLmNv
bT4KPiA+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+ID4gQ2M6IExpYW0g
R2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+Cj4gPiBDYzogbGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZwo+ID4gQ2M6IGxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IENj
OiBsaW51eC1zcGlAdmdlci5rZXJuZWwub3JnCj4gPiBDYzogTWF0aGlldSBQb2lyaWVyIDxtYXRo
aWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KPiA+IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPgo+ID4gQ2M6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFA
bGluYXJvLm9yZz4KPiA+IENjOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuY29tPgo+ID4gQ2M6
IFdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+Cj4gPiBDYzogQWxhbiBUdWxsIDxhdHVs
bEBrZXJuZWwub3JnPgo+ID4gQ2M6IE1vcml0eiBGaXNjaGVyIDxtZGZAa2VybmVsLm9yZz4KPiA+
IENjOiBsaW51eC1mcGdhQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IFBldGVyIFJvc2luIDxwZWRh
QGF4ZW50aWEuc2U+Cj4gPiBDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+ID4g
Q2M6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgo+ID4gQ2M6IEhlaW5l
ciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4gPiBDYzogIkRhdmlkIFMuIE1pbGxl
ciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gPiBDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPgo+ID4gQ2M6IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+Cj4gPiBDYzog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+IENjOiAi
UmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxAa2VybmVsLm9yZz4KPiA+IENjOiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gQ2M6IFRob3IgVGhheWVyIDx0aG9yLnRoYXllckBs
aW51eC5pbnRlbC5jb20+Cj4gPiBDYzogSmlyaSBTbGFieSA8anNsYWJ5QHN1c2UuY29tPgo+ID4g
Q2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiA+IENjOiBBbmRyZXcgTHVubiA8
YW5kcmV3QGx1bm4uY2g+Cj4gPiBDYzogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KPiA+
IFNpZ25lZC1vZmYtYnk6IFN1enVraSBLIFBvdWxvc2UgPHN1enVraS5wb3Vsb3NlQGFybS5jb20+
Cj4gPiAtLS0KPiA+ICAtIERyb3BwZWQgdGhlIHJldmlld2VkLWJ5IHRhZ3MgZnJvbSBUaG9yLCBN
YXJrLCBBbmRyZXcgYW5kIFBldGVyIGFzIHRoZQo+ID4gICAgcGF0Y2hlcyBhcmUgbWVyZWdlZCwg
dGhvdWdoIHRoZXJlIGFyZSBubyBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gPiAtLS0KPiA+ICBkcml2
ZXJzL2FtYmEvdGVncmEtYWhiLmMgICAgICAgICAgICAgIHwgMTEgKy0tLS0tLS0KPiA+ICBkcml2
ZXJzL2ZwZ2EvZnBnYS1icmlkZ2UuYyAgICAgICAgICAgIHwgIDggKy0tLS0tCj4gPiAgZHJpdmVy
cy9mcGdhL2ZwZ2EtbWdyLmMgICAgICAgICAgICAgICB8ICA4ICstLS0tLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fbWlwaV9kc2kuYyAgICAgICAgfCAgNyArLS0tLQo+ID4gIGRyaXZlcnMvaTJj
L2kyYy1jb3JlLW9mLmMgICAgICAgICAgICAgfCAgNyArLS0tLQo+ID4gIGRyaXZlcnMvbWZkL2Fs
dGVyYS1zeXNtZ3IuYyAgICAgICAgICAgfCAxNCArKy0tLS0tLS0tCj4gCj4gRm9yIG15IG93biBy
ZWZlcmVuY2U6Cj4gICBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+IAo+IFdoYXQncyB0aGUgbWVyZ2UgcGxhbiBmb3IgdGhpcyBwYXRjaD8KPiAKPiBJ
cyBhbnlvbmUgcHJlcGFyZWQgdG8gY3JlYXRlIGFuIGltbXV0YWJsZSBicmFuY2ggZm9yIHVzIHRv
IHB1bGwgZnJvbT8KPiBJJ20gaGFwcHkgdG8gZG8gaXQgaWYgbm8gb25lIGVsc2Ugc3RlcHMgdXAu
CgpJJ2xsIHRha2UgaXQsIGFuZCBjcmVhdGUgYSBicmFuY2ggZm9yIGV2ZXJ5b25lIHRvIHB1bGwg
ZnJvbS4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
