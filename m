Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8A17CD80
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE7A6E13F;
	Sat,  7 Mar 2020 10:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8276ECA0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 08:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 42BBE296E60
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
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
 <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
 <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
 <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
 <20200305193505.4km5j7n25ph4b6hn@core.my.home>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <2a5a4a62-3189-e053-21db-983a4c766d44@collabora.com>
Date: Fri, 6 Mar 2020 09:46:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305193505.4km5j7n25ph4b6hn@core.my.home>
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

SGkgT25kcmVqLAoKT24gNS8zLzIwIDIwOjM1LCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiBIaSwK
PiAKPiBPbiBUaHUsIE1hciAwNSwgMjAyMCBhdCAxMDoyOTozM0FNIC0wODAwLCBWYXNpbHkgS2hv
cnV6aGljayB3cm90ZToKPj4gT24gVGh1LCBNYXIgNSwgMjAyMCBhdCA3OjI4IEFNIEVucmljIEJh
bGxldGJvIGkgU2VycmEKPj4gPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+
Pj4KPj4+IEhpIFZhc2lseSwKPj4KPj4gQ0M6IEljZW5vd3kgYW5kIE9uZHJlago+Pj4KPj4+IFdv
dWxkIHlvdSBtaW5kIHRvIGNoZWNrIHdoaWNoIGZpcm13YXJlIHZlcnNpb24gaXMgcnVubmluZyB0
aGUgYW54NzY4OCBpbgo+Pj4gUGluZVBob25lLCBJIHRoaW5rIHNob3VsZCBiZSBlYXN5IHRvIGNo
ZWNrIHdpdGggaTJjLXRvb2xzLgo+Pgo+PiBJY2Vub3d5LCBPbmRyZWosIGNhbiB5b3UgZ3V5cyBw
bGVhc2UgY2hlY2sgYW54NzY4OCBmaXJtd2FyZSB2ZXJzaW9uPwo+IAo+IGkyY2dldCAwIDB4Mjgg
MHgwMCB3Cj4gMHhhYWFhCj4gCj4gaTJjZ2V0IDAgMHgyOCAweDAyIHcKPiAweDc2ODgKPiAKPiBp
MmNnZXQgMCAweDI4IDB4ODAgdwo+IDB4MDAwMAo+IAoKQ2FuIHlvdSBjaGVjayB0aGUgdmFsdWUg
Zm9yIDB4ODEgdG9vPwoKVGhhbmtzLAogRW5yaWMKCgo+IHJlZ2FyZHMsCj4gCW8uCj4gCj4+PiBU
aGFua3MgaW4gYWR2YW5jZSwKPj4+ICBFbnJpYwo+Pj4KPj4+IFtzbmlwXQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
