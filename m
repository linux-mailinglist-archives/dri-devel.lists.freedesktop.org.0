Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0A337C7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 20:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6578A8930C;
	Mon,  3 Jun 2019 18:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CEC8930C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 18:25:14 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 125B44000A;
 Mon,  3 Jun 2019 18:25:04 +0000 (UTC)
Date: Mon, 3 Jun 2019 19:53:09 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [linux-sunxi] [PATCH v6 0/6] Add support for Orange Pi 3
Message-ID: <20190603175309.qjlyfymbl6ybrpag@flea>
References: <20190527162237.18495-1-megous@megous.com>
 <20190531125246.qqfvmgmw2mv442tq@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531125246.qqfvmgmw2mv442tq@core.my.home>
User-Agent: NeoMutt/20180716
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDI6NTI6NDZQTSArMDIwMCwgT25kxZllaiBKaXJtYW4g
d3JvdGU6Cj4gSGVsbG8sCj4KPiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwNjoyMjozMVBNICsw
MjAwLCBtZWdvdXMgdmlhIGxpbnV4LXN1bnhpIHdyb3RlOgo+ID4gRnJvbTogT25kcmVqIEppcm1h
biA8bWVnb3VzQG1lZ291cy5jb20+Cj4gPgo+ID4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBw
b3J0IGZvciBYdW5sb25nIE9yYW5nZSBQaSAzIGJvYXJkLgo+ID4KPiA+IFVuZm9ydHVuYXRlbHks
IHRoaXMgYm9hcmQgbmVlZHMgc29tZSBzbWFsbCBkcml2ZXIgcGF0Y2hlcywgc28gSSBoYXZlCj4g
PiBzcGxpdCB0aGUgYm9hcmRzIERUIHBhdGNoIGludG8gY2h1bmtzIHRoYXQgcmVxdWlyZSBwYXRj
aGVzIGZvciBkcml2ZXJzCj4gPiBpbiB2YXJpb3VzIHN1YnN5c3RlbXMuCj4gPgo+ID4gU3VnZ2Vz
dGVkIG1lcmdpbmcgcGxhbi9kZXBlbmRlbmNpZXM6Cj4gPgo+ID4gLSBzdG1tYWMgcGF0Y2hlcyBh
cmUgbmVlZGVkIGZvciBldGhlcm5ldCBzdXBwb3J0IChwYXRjaGVzIDEtMykKPiA+ICAgLSB0aGVz
ZSBzaG91bGQgYmUgcmVhZHkgbm93Cj4gPiAtIEhETUkgc3VwcG9ydCAocGF0Y2hlcyA0LTYpCj4g
PiAgIC0gc2hvdWxkIGJlIHJlYWR5Cj4KPiBJZiB0aGVyZSBhcmUgbm8gZnV0aGVyIGNvbW1lbnRz
LCBjYW4gYWxsIHRoZXNlIHBhdGNoZXMgcGxlYXNlIGJlIG1lcmdlZD8KCkknbSB3YWl0aW5nIGZv
ciBzb21lIGZlZWRiYWNrIG9uIHRoZSBzdG1tYWMgYW5kIHRoZSBEVy1IRE1JCmRldmVsb3BwZXJz
IHRvIG1lcmdlIHRoZSByZXN0CgpNYXhpbWUKCi0tCk1heGltZSBSaXBhcmQsIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
