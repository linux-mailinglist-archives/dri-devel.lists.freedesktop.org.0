Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D917CD85
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FDA6E16B;
	Sat,  7 Mar 2020 10:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150196ECEB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1583496446; bh=xEkZMnAJaW3CjRi8Tr1/kP+MDL1qKFyRyqRQ+hjJeW8=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=cBP3CStA3Edz4S9BwQCuNbfWe+Fj/lOclcu8ezWy/dUGtOlmx74M2LTAsfj8Tw4d1
 cJPGiiAfwrWAvq+4ii9HKLCpyxfF6lQoYVG4GA9jOX7ub842aFUHH4Wv+5bVBbcKgU
 PGdpmjIyPoyGpyHQb1mgINbbcfEWPzxHIhgukGPw=
Date: Fri, 6 Mar 2020 13:07:26 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
Message-ID: <20200306120726.t7aitfz5rq3m7m6y@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Torsten Duwe <duwe@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>
References: <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
 <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
 <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
 <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
 <20200305193505.4km5j7n25ph4b6hn@core.my.home>
 <2a5a4a62-3189-e053-21db-983a4c766d44@collabora.com>
 <5d72a8c6824b31163a303b5ef1526efe05121e5d.camel@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d72a8c6824b31163a303b5ef1526efe05121e5d.camel@aosc.io>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Torsten Duwe <duwe@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Andrzej Hajda <a.hajda@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDQ6NTM6NDZQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyMC0wMy0wNuaYn+acn+S6lOeahCAwOTo0NiArMDEwMO+8jEVucmljIEJh
bGxldGJvIGkgU2VycmHlhpnpgZPvvJoKPiA+IEhpIE9uZHJlaiwKPiA+IAo+ID4gT24gNS8zLzIw
IDIwOjM1LCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiBPbiBU
aHUsIE1hciAwNSwgMjAyMCBhdCAxMDoyOTozM0FNIC0wODAwLCBWYXNpbHkgS2hvcnV6aGljayB3
cm90ZToKPiA+ID4gPiBPbiBUaHUsIE1hciA1LCAyMDIwIGF0IDc6MjggQU0gRW5yaWMgQmFsbGV0
Ym8gaSBTZXJyYQo+ID4gPiA+IDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiB3cm90ZToK
PiA+ID4gPiA+IEhpIFZhc2lseSwKPiA+ID4gPiAKPiA+ID4gPiBDQzogSWNlbm93eSBhbmQgT25k
cmVqCj4gPiA+ID4gPiBXb3VsZCB5b3UgbWluZCB0byBjaGVjayB3aGljaCBmaXJtd2FyZSB2ZXJz
aW9uIGlzIHJ1bm5pbmcgdGhlCj4gPiA+ID4gPiBhbng3Njg4IGluCj4gPiA+ID4gPiBQaW5lUGhv
bmUsIEkgdGhpbmsgc2hvdWxkIGJlIGVhc3kgdG8gY2hlY2sgd2l0aCBpMmMtdG9vbHMuCj4gPiA+
ID4gCj4gPiA+ID4gSWNlbm93eSwgT25kcmVqLCBjYW4geW91IGd1eXMgcGxlYXNlIGNoZWNrIGFu
eDc2ODggZmlybXdhcmUKPiA+ID4gPiB2ZXJzaW9uPwo+ID4gPiAKPiA+ID4gaTJjZ2V0IDAgMHgy
OCAweDAwIHcKPiA+ID4gMHhhYWFhCj4gPiA+IAo+ID4gPiBpMmNnZXQgMCAweDI4IDB4MDIgdwo+
ID4gPiAweDc2ODgKPiA+ID4gCj4gPiA+IGkyY2dldCAwIDB4MjggMHg4MCB3Cj4gPiA+IDB4MDAw
MAo+ID4gPiAKPiA+IAo+ID4gQ2FuIHlvdSBjaGVjayB0aGUgdmFsdWUgZm9yIDB4ODEgdG9vPwo+
IAo+IHJvb3RAaWNlLXBpbmVwaG9uZSBbIH4gXSAjIGkyY2R1bXAgMCAweDI4Cj4gTm8gc2l6ZSBz
cGVjaWZpZWQgKHVzaW5nIGJ5dGUtZGF0YSBhY2Nlc3MpCj4gV0FSTklORyEgVGhpcyBwcm9ncmFt
IGNhbiBjb25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2UgZGF0YSBsb3NzIGFuZAo+IHdvcnNlIQo+
IEkgd2lsbCBwcm9iZSBmaWxlIC9kZXYvaTJjLTAsIGFkZHJlc3MgMHgyOCwgbW9kZSBieXRlCj4g
Q29udGludWU/IFtZL25dIAo+ICAgICAgMCAgMSAgMiAgMyAgNCAgNSAgNiAgNyAgOCAgOSAgYSAg
YiAgYyAgZCAgZSAgZiAgICAwMTIzNDU2Nzg5YWJjZGVmCj4gMDA6IGFhIGFhIDg4IDc2IGFjIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDA1IDA1ICAgID8/P3Y/Li4uLi4uLi4uPz8KPiAxMDog
MzAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgICAgMC4uLi4u
Li4uLi4uLi4uLgo+IDIwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAyNCBmMiBl
NCBmZiAwMCAgICAuLi4uLi4uLi4uLiQ/Py4uCj4gMzA6IDA2IDQwIDAwIDA0IDk0IDExIDIwIGZm
IGZmIDAzIDAwIGJmIGZmIGZmIDEwIDAxICAgID9ALj8/PyAuLj8uPy4uPz8KPiA0MDogNzIgYTQg
MDAgMDkgMDAgMDggMDUgODQgMTUgNDAgMTcgMDAgMDAgMGEgMDAgZTAgICAgcj8uPy4/Pz8/QD8u
Lj8uPwo+IDUwOiAwMCAwMCAwMCAwYSAxMCAwMCBlMCBkZiBmZiBmZiAwMCAwMCAwMCAxMCA3MSAw
MCAgICAuLi4/Py4/Py4uLi4uP3EuCj4gNjA6IDEwIDEwIDA0IDI5IDJkIDIxIDEwIDAxIDA5IDEz
IDAwIDAzIGU4IDEzIDg4IDAwICAgID8/PyktIT8/Pz8uPz8/Py4KPiA3MDogMDAgMTkgMTggODMg
MTYgNWMgMTEgMDAgZmYgMDAgMDAgMGQgMDQgMzggNDIgMDcgICAgLj8/Pz9cPy4uLi4/PzhCPwo+
IDgwOiAwMCAwMCAwMCAwMCAwMCA3NCAxYiAxOSA0NCAwOCA3NSAwMCAwMCAwMCAwMCAwMCAgICAu
Li4uLnQ/P0Q/dS4uLi4uCj4gOTA6IDAxIDAyIDAwIDAwIDAwIDAwIDAzIDAwIGZmIDMwIDAwIDU5
IDAxIDAwIDAwIDAwICAgID8/Li4uLj8uLjAuWT8uLi4KPiBhMDogMDAgZmYgZmUgZmYgZmYgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDIgICAgLi4/Li4uLi4uLi4uLi4uPwo+IGIwOiAw
MCAwMCAwMCAwMCAwMCAwMCA0MCAwMCAyOCAwMCAwMCAwMCAwMCA0NCAwOCAwMCAgICAuLi4uLi5A
LiguLi4uRD8uCj4gYzA6IDAwIDAwIDAwIDAwIDgwIDAwIDEwIDAxIDBhIDEwIDE4IDAwIDAwIGZk
IDAwIDAwICAgIC4uLi4/Lj8/Pz8/Li4/Li4KPiBkMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgICAgLi4uLi4uLi4uLi4uLi4uLgo+IGUwOiA1MCAxMCAw
OCA1MCAwMCAwMiAwMCA3MCAwMCAwMCAzMCAxMCAwYiAwMiAxYyAwMSAgICBQPz9QLj8ucC4uMD8/
Pz8/Cj4gZjA6IDAwIDBiIDA3IDAwIDk0IDExIDdmIDAwIDAwIDAwIDAwIDAwIDAwIDAxIDBlIGZm
ICAgIC4/Py4/Pz8uLi4uLi4/Py4KCk15IHZhbHVlcyBmb3IgMHgyOCBhZGRyZXNzIG1hdGNoIHRo
aXMuIF4KCkludGVyZXN0aW5nIHRoYXQgaXQgcmV0dXJucyBkaWZmZXJlbnQgcmVnaXN0ZXIgdmFs
dWVzIGZvciBkaWZmZXJlbnQKZGV2aWNlIGFkZHJlc3Nlcy4KCj4gcm9vdEBpY2UtcGluZXBob25l
IFsgfiBdICMgaTJjZHVtcCAwIDB4MmMKPiBObyBzaXplIHNwZWNpZmllZCAodXNpbmcgYnl0ZS1k
YXRhIGFjY2VzcykKPiBXQVJOSU5HISBUaGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMg
YnVzLCBjYXVzZSBkYXRhIGxvc3MgYW5kCj4gd29yc2UhCj4gSSB3aWxsIHByb2JlIGZpbGUgL2Rl
di9pMmMtMCwgYWRkcmVzcyAweDJjLCBtb2RlIGJ5dGUKPiBDb250aW51ZT8gW1kvbl0gCj4gICAg
ICAwICAxICAyICAzICA0ICA1ICA2ICA3ICA4ICA5ICBhICBiICBjICBkICBlICBmICAgIDAxMjM0
NTY3ODlhYmNkZWYKPiAwMDogMjkgMWYgODggNzYgMDAgYWMgMTEgMDAgMTEgMjAgMTAgMTAgMDAg
MDAgMDAgMDAgICAgKT8/di4/Py4/ID8/Li4uLgo+IDEwOiAwMyAwMCBmZiA4ZiBmZiA3ZiAwMCAw
MCAwMCAwMCAwNSAwMCAxMCAwYSAwYyAwMCAgICA/Li4/Lj8uLi4uPy4/Pz8uCj4gMjA6IDAwIDAw
IDAwIDAwIDk5IDA2IGMwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAyIDAwICAgIC4uLi4/Pz8uLi4u
Li4uPy4KPiAzMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgICAgLi4uLi4uLi4uLi4uLi4uLgo+IDQwOiAwNCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAgICA/Li4uLi4uLi4uLi4uLi4uCj4gNTA6IDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4K
PiA2MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgICAg
Li4uLi4uLi4uLi4uLi4uLgo+IDcwOiBiOCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAgICA/Li4uLi4uLi4uLi4uLi4uCj4gODA6IDAxIDI1IDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgID8lLi4uLi4uLi4uLi4uLi4KPiA5MDog
MGYgMGYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgICAgPz8uLi4u
Li4uLi4uLi4uLgo+IGEwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAgICAuLi4uLi4uLi4uLi4uLi4uCj4gYjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KPiBjMDogMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgICAgLi4uLi4uLi4uLi4u
Li4uLgo+IGQwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAgICAuLi4uLi4uLi4uLi4uLi4uCj4gZTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KPiBmMDogMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgICAgLi4uLi4uLi4uLi4uLi4uLgo+
IAo+ID4gCj4gPiBUaGFua3MsCj4gPiAgRW5yaWMKPiA+IAo+ID4gCj4gPiA+IHJlZ2FyZHMsCj4g
PiA+IAlvLgo+ID4gPiAKPiA+ID4gPiA+IFRoYW5rcyBpbiBhZHZhbmNlLAo+ID4gPiA+ID4gIEVu
cmljCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFtzbmlwXQo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
