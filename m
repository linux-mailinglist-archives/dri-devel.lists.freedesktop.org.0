Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821F95D2DC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48E489D77;
	Tue,  2 Jul 2019 15:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB88789D77
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:29:13 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 548C91C0012;
 Tue,  2 Jul 2019 15:29:09 +0000 (UTC)
Date: Tue, 2 Jul 2019 17:29:08 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] Re: [PATCH v10 04/11] drm/sun4i: tcon: Compute
 DCLK dividers based on format, lanes
Message-ID: <20190702152908.fwwf7smt7nh2lxo2@flea>
References: <20190523204823.mx7l4ozklzdh7npn@flea>
 <CAMty3ZA0S=+8NBrQZvP6sFdzSYWqhNZL_KjkJAQ0jTc2RVivrw@mail.gmail.com>
 <20190604143016.fcx3ezmga244xakp@flea>
 <CAMty3ZAAK4RoE6g_LAZ-Q38On_1s_TTOz65YG7PVd88mwp-+4Q@mail.gmail.com>
 <20190613131626.7zbwvrvd4e7eafrc@flea>
 <CAMty3ZBDkMJkZm8FudNB1wQ+L-q3XVKa3zR2M0wZ5Uncdy_Ayg@mail.gmail.com>
 <20190624130442.ww4l3zctykr4i2e2@flea>
 <CAMty3ZB+eZUh5mr-LMZuEd_wrwLCN0mbf7arcRQHj8=uUNNq=Q@mail.gmail.com>
 <20190625143747.3czd7sit4waz75b6@flea>
 <CAMty3ZCh+C9+zgcL633tTw6aPW_WOLnYN7FzJHX+3zu8=8Unpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMty3ZCh+C9+zgcL633tTw6aPW_WOLnYN7FzJHX+3zu8=8Unpg@mail.gmail.com>
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
Cc: Bhushan Shah <bshah@mykolab.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?utf-8?B?5Z2a5a6a5YmN6KGM?= <powerpan@qq.com>, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMTI6MzA6MTRBTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCA4OjA3IFBNIE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBCU1AgaGFzIHRj
b25fZGl2IGFuZCBkc2lfZGl2LiBkc2lfZGl2IGlzIGR5bmFtaWMgd2hpY2ggZGVwZW5kcyBvbgo+
ID4gPiA+ID4gPiA+ID4gPiBicHAvbGFuZXMgYW5kIGl0IGluZGVlZCBkZXBlbmRzIG9uIFBMTCBj
b21wdXRhdGlvbiAobm90IHRjb25fZGl2KSwKPiA+ID4gPiA+ID4gPiA+ID4gYW55d2F5IEkgaGF2
ZSBleHBsYWluZWQgYWdhaW4gb24gdGhpcyBpbml0aWFsIGxpbmsgeW91IG1lbnRpb25lZC4KPiA+
ID4gPiA+ID4gPiA+ID4gUGxlYXNlIGhhdmUgYSBsb29rIGFuZCBnZXQgYmFjay4KPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBJJ2xsIGhhdmUgYSBsb29rLCB0aGFua3MuCj4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSSd2ZSBnaXZlbiB5b3VyIHBhdGNoZXMgYSB0cnkgb24g
bXkgc2V0dXAgdGhvdWdoLCBhbmQgdGhpcyBwYXRjaAo+ID4gPiA+ID4gPiA+ID4gYnJlYWtzIGl0
IHdpdGggdmJsYW5rIHRpbWVvdXRzIGFuZCBzb21lIGhvcml6b250YWwgbGluZXMgdGhhdCBsb29r
cwo+ID4gPiA+ID4gPiA+ID4gbGlrZSB3aGF0IHNob3VsZCBiZSBkaXNwbGF5ZWQsIGJ1dCBibGlu
a2luZyBhbmQgb24gdGhlIHJpZ2h0IG9mIHRoZQo+ID4gPiA+ID4gPiA+ID4gZGlzcGxheS4gVGhl
IHByZXZpb3VzIG9uZXMgYXJlIGZpbmUgdGhvdWdoLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gV291bGQgeW91IHBsZWFzZSBzZW5kIG1lIHRoZSBsaW5rIG9mIHBhbmVsIGRyaXZlci4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gSXQncyBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9u
Ym8tcmIwNzBkMzAuYwo+ID4gPiA+ID4KPiA+ID4gPiA+IExvb2sgbGlrZSB0aGlzIHBhbmVsIHdv
cmsgZXZlbiB3L28gYW55IHZlbmRvciBzZXF1ZW5jZS4gaXQncyBzaW1pbGFyCj4gPiA+ID4gPiB0
byB0aGUgNC1sYW5lIHBhbmVsIEkgaGF2ZSB3aXRoIFJHQjg4OCwgc28gdGhlIGRjbGsgZGl2IGlz
IDYsIGlzIGl0Cj4gPiA+ID4gPiB3b3JraW5nIHdpdGggdGhpcyBkaXZpZGVyPwo+ID4gPiA+Cj4g
PiA+ID4gSXQgd29ya3Mgd2l0aCA0LCBpdCBkb2Vzbid0IHdvcmsgd2l0aCA2Lgo+ID4gPgo+ID4g
PiBDYW4gYmUgdGhlIHBpeGVsIGNsb2NrIHdpdGggYXNzb2NpYXRlZCB0aW1pbmdzIGNhbiBtYWtl
IHRoaXMgZGlmZi4KPiA+ID4gV291bGQgeW91IHNlbmQgbWUgdGhlIHBpeGVsIGNsb2NrLCBwbGxf
cmF0ZSBhbmQgdGltaW5ncyB0aGlzIHBhbmVsCj4gPiA+IHVzZWQgaXQgZnJvbSBCU1A/Cj4gPgo+
ID4gVGhpcyBib2FyZCBuZXZlciBoYWQgYW4gQWxsd2lubmVyIEJTUAo+Cj4gUnVubmluZyBvbiBC
U1Agd291bGQgaGVscCB0byB1bmRlcnN0YW5kIHNvbWUgY2x1ZSwgYW55d2F5IHdvdWxkIHlvdQo+
IHNlbmQgbWUgdGhlIHRoZSB2YWx1ZSBQTExfTUlQSSByZWdpc3RlciAoZGV2bWUgMHgxYzIwMDQw
KSBvbiB0aGlzCj4gYm9hcmQuIEknbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgaXQgdmFsdWUg
aW4geW91ciBjYXNlLgoKSSdtIHNvcnJ5LCBidXQgSSdtIG5vdCBnb2luZyB0byBwb3J0IGEgd2hv
bGUgQlNQIG9uIHRoYXQgYm9hcmQsCmVzcGVjaWFsbHkgZm9yIHNvbWV0aGluZyBJIGhhdmVuJ3Qg
YmVlbiBjb252aW5jZWQgaXQncyB0aGUgcmlnaHQgZml4LgoKTWF4aW1lCgotLQpNYXhpbWUgUmlw
YXJkLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
