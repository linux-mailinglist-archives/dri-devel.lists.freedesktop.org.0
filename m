Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECF17CD81
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547BB6E14E;
	Sat,  7 Mar 2020 10:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EBD89DFE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 08:46:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 62A1F296E60
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: Icenowy Zheng <icenowy@aosc.io>, Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
 <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
 <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
 <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
 <1E10190D-265F-4287-9717-AD1457E7044A@aosc.io>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <f4de0db0-ab63-902d-2988-3550e6ac9943@collabora.com>
Date: Fri, 6 Mar 2020 09:46:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1E10190D-265F-4287-9717-AD1457E7044A@aosc.io>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:45 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Torsten Duwe <duwe@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSWNlbm93eSwKCk9uIDUvMy8yMCAxOTozNSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiAKPiAK
PiDkuo4gMjAyMOW5tDPmnIg25pelIEdNVCswODowMCDkuIrljYgyOjI5OjMzLCBWYXNpbHkgS2hv
cnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPiDlhpnliLA6Cj4+IE9uIFRodSwgTWFyIDUsIDIw
MjAgYXQgNzoyOCBBTSBFbnJpYyBCYWxsZXRibyBpIFNlcnJhCj4+IDxlbnJpYy5iYWxsZXRib0Bj
b2xsYWJvcmEuY29tPiB3cm90ZToKPj4+Cj4+PiBIaSBWYXNpbHksCj4+Cj4+IENDOiBJY2Vub3d5
IGFuZCBPbmRyZWoKPj4+Cj4+PiBXb3VsZCB5b3UgbWluZCB0byBjaGVjayB3aGljaCBmaXJtd2Fy
ZSB2ZXJzaW9uIGlzIHJ1bm5pbmcgdGhlIGFueDc2ODgKPj4gaW4KPj4+IFBpbmVQaG9uZSwgSSB0
aGluayBzaG91bGQgYmUgZWFzeSB0byBjaGVjayB3aXRoIGkyYy10b29scy4KPj4KPj4gSWNlbm93
eSwgT25kcmVqLCBjYW4geW91IGd1eXMgcGxlYXNlIGNoZWNrIGFueDc2ODggZmlybXdhcmUgdmVy
c2lvbj8KPiAKPiBBdCAweDJjLCAweDgwIGlzIDB4MDEsIDB4ODEgaXMgMHgyNQo+IAo+IDAxLjI1
LCByaWdodD8KPiAKClllcywgdGhhbmtzLgoKPj4KPj4+IFRoYW5rcyBpbiBhZHZhbmNlLAo+Pj4g
IEVucmljCj4+Pgo+Pj4gW3NuaXBdCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
