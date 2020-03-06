Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBEB17CD96
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9876E194;
	Sat,  7 Mar 2020 10:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AA46E429
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:19:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 9A6CD297044
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>
References: <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
 <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
 <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
 <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
 <20200305193505.4km5j7n25ph4b6hn@core.my.home>
 <2a5a4a62-3189-e053-21db-983a4c766d44@collabora.com>
 <20200306120318.oq575imqjh7uolss@core.my.home>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <522fc986-50b3-e4ff-9dc3-93921733d362@collabora.com>
Date: Fri, 6 Mar 2020 13:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306120318.oq575imqjh7uolss@core.my.home>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA2LzMvMjAgMTM6MDMsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDA2
LCAyMDIwIGF0IDA5OjQ2OjUxQU0gKzAxMDAsIEVucmljIEJhbGxldGJvIGkgU2VycmEgd3JvdGU6
Cj4+IEhpIE9uZHJlaiwKPj4KPj4gT24gNS8zLzIwIDIwOjM1LCBPbmTFmWVqIEppcm1hbiB3cm90
ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIFRodSwgTWFyIDA1LCAyMDIwIGF0IDEwOjI5OjMzQU0gLTA4
MDAsIFZhc2lseSBLaG9ydXpoaWNrIHdyb3RlOgo+Pj4+IE9uIFRodSwgTWFyIDUsIDIwMjAgYXQg
NzoyOCBBTSBFbnJpYyBCYWxsZXRibyBpIFNlcnJhCj4+Pj4gPGVucmljLmJhbGxldGJvQGNvbGxh
Ym9yYS5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBIaSBWYXNpbHksCj4+Pj4KPj4+PiBDQzogSWNl
bm93eSBhbmQgT25kcmVqCj4+Pj4+Cj4+Pj4+IFdvdWxkIHlvdSBtaW5kIHRvIGNoZWNrIHdoaWNo
IGZpcm13YXJlIHZlcnNpb24gaXMgcnVubmluZyB0aGUgYW54NzY4OCBpbgo+Pj4+PiBQaW5lUGhv
bmUsIEkgdGhpbmsgc2hvdWxkIGJlIGVhc3kgdG8gY2hlY2sgd2l0aCBpMmMtdG9vbHMuCj4+Pj4K
Pj4+PiBJY2Vub3d5LCBPbmRyZWosIGNhbiB5b3UgZ3V5cyBwbGVhc2UgY2hlY2sgYW54NzY4OCBm
aXJtd2FyZSB2ZXJzaW9uPwo+Pj4KPj4+IGkyY2dldCAwIDB4MjggMHgwMCB3Cj4+PiAweGFhYWEK
Pj4+Cj4+PiBpMmNnZXQgMCAweDI4IDB4MDIgdwo+Pj4gMHg3Njg4Cj4+Pgo+Pj4gaTJjZ2V0IDAg
MHgyOCAweDgwIHcKPj4+IDB4MDAwMAo+Pj4KPj4KPj4gQ2FuIHlvdSBjaGVjayB0aGUgdmFsdWUg
Zm9yIDB4ODEgdG9vPwo+IAo+ICd3JyByZWFkIGNoZWNrcyBib3RoIHZhbHVlcyBhdCBvbmNlLCBh
cyB5b3UgY2FuIHNlZSBhYm92ZS4KPiAKCk9oIHJpZ2h0LCBzb3JyeS4gVGhlIHRoaW5nIGlzIHRo
YXQgZmlybXdhcmUgdmVyc2lvbiBpcyBhdCAweDJjLCBub3QgMHgyOCwgc28Kd2UncmUgaW50ZXJl
c3RlZCBvbiBzZWUgcmVnaXN0ZXIgMHg4MCBhbmQgMHg4MSBmb3IgMHgyYyBhZGRyZXNzLgoKVGhh
bmtzLAogRW5yaWMKCj4gcmVnYXJkcywKPiAJby4KPiAKPj4gVGhhbmtzLAo+PiAgRW5yaWMKPj4K
Pj4KPj4+IHJlZ2FyZHMsCj4+PiAJby4KPj4+Cj4+Pj4+IFRoYW5rcyBpbiBhZHZhbmNlLAo+Pj4+
PiAgRW5yaWMKPj4+Pj4KPj4+Pj4gW3NuaXBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
