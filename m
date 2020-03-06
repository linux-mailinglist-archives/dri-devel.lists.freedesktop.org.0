Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA7C17CD7C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2B6E135;
	Sat,  7 Mar 2020 10:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF936ECA0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 08:54:31 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 95253d68
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 6 Mar 2020 00:54:23 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 0B8624BC35;
 Fri,  6 Mar 2020 08:53:56 +0000 (UTC)
Message-ID: <5d72a8c6824b31163a303b5ef1526efe05121e5d.camel@aosc.io>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
From: Icenowy Zheng <icenowy@aosc.io>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 =?gb2312?Q?Ond=810=940ej?= Jirman <megous@megous.com>, Vasily Khoruzhick
 <anarsoul@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Nicolas Boichat <drinkcat@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,  Neil Armstrong
 <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Torsten Duwe
 <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>, linux-kernel
 <linux-kernel@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  Thomas Gleixner
 <tglx@linutronix.de>, Collabora Kernel ML <kernel@collabora.com>
Date: Fri, 06 Mar 2020 16:53:46 +0800
In-Reply-To: <2a5a4a62-3189-e053-21db-983a4c766d44@collabora.com>
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
 <2a5a4a62-3189-e053-21db-983a4c766d44@collabora.com>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1583484858;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=whGTAJHlYigYjZ8Bt9ei5nP1KSVeXS1a1/b/mBSwvdU=;
 b=TMAyBXMIAmUr2NuUqUbtT7YKm9o5pQpohi3Ru/es8GLfSDjPXde0A+J1u+DnXjsLe5YFth
 UFFzHRfgi/SE8ALhSwWtxB1k+SjQmXAbANQKyy/3tSei2JJzS+0W596rLI8ybTO2KACSXW
 PPVo+clmVSVLhe7dR5JlNCmgf/AM+DU=
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

5ZyoIDIwMjAtMDMtMDbmmJ/mnJ/kupTnmoQgMDk6NDYgKzAxMDDvvIxFbnJpYyBCYWxsZXRibyBp
IFNlcnJh5YaZ6YGT77yaCj4gSGkgT25kcmVqLAo+IAo+IE9uIDUvMy8yMCAyMDozNSwgT25kxZll
aiBKaXJtYW4gd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gT24gVGh1LCBNYXIgMDUsIDIwMjAgYXQg
MTA6Mjk6MzNBTSAtMDgwMCwgVmFzaWx5IEtob3J1emhpY2sgd3JvdGU6Cj4gPiA+IE9uIFRodSwg
TWFyIDUsIDIwMjAgYXQgNzoyOCBBTSBFbnJpYyBCYWxsZXRibyBpIFNlcnJhCj4gPiA+IDxlbnJp
Yy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+ID4gPiBIaSBWYXNpbHksCj4gPiA+
IAo+ID4gPiBDQzogSWNlbm93eSBhbmQgT25kcmVqCj4gPiA+ID4gV291bGQgeW91IG1pbmQgdG8g
Y2hlY2sgd2hpY2ggZmlybXdhcmUgdmVyc2lvbiBpcyBydW5uaW5nIHRoZQo+ID4gPiA+IGFueDc2
ODggaW4KPiA+ID4gPiBQaW5lUGhvbmUsIEkgdGhpbmsgc2hvdWxkIGJlIGVhc3kgdG8gY2hlY2sg
d2l0aCBpMmMtdG9vbHMuCj4gPiA+IAo+ID4gPiBJY2Vub3d5LCBPbmRyZWosIGNhbiB5b3UgZ3V5
cyBwbGVhc2UgY2hlY2sgYW54NzY4OCBmaXJtd2FyZQo+ID4gPiB2ZXJzaW9uPwo+ID4gCj4gPiBp
MmNnZXQgMCAweDI4IDB4MDAgdwo+ID4gMHhhYWFhCj4gPiAKPiA+IGkyY2dldCAwIDB4MjggMHgw
MiB3Cj4gPiAweDc2ODgKPiA+IAo+ID4gaTJjZ2V0IDAgMHgyOCAweDgwIHcKPiA+IDB4MDAwMAo+
ID4gCj4gCj4gQ2FuIHlvdSBjaGVjayB0aGUgdmFsdWUgZm9yIDB4ODEgdG9vPwoKcm9vdEBpY2Ut
cGluZXBob25lIFsgfiBdICMgaTJjZHVtcCAwIDB4MjgKTm8gc2l6ZSBzcGVjaWZpZWQgKHVzaW5n
IGJ5dGUtZGF0YSBhY2Nlc3MpCldBUk5JTkchIFRoaXMgcHJvZ3JhbSBjYW4gY29uZnVzZSB5b3Vy
IEkyQyBidXMsIGNhdXNlIGRhdGEgbG9zcyBhbmQKd29yc2UhCkkgd2lsbCBwcm9iZSBmaWxlIC9k
ZXYvaTJjLTAsIGFkZHJlc3MgMHgyOCwgbW9kZSBieXRlCkNvbnRpbnVlPyBbWS9uXSAKICAgICAw
ICAxICAyICAzICA0ICA1ICA2ICA3ICA4ICA5ICBhICBiICBjICBkICBlICBmICAgIDAxMjM0NTY3
ODlhYmNkZWYKMDA6IGFhIGFhIDg4IDc2IGFjIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDA1
IDA1ICAgID8/P3Y/Li4uLi4uLi4uPz8KMTA6IDMwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwICAgIDAuLi4uLi4uLi4uLi4uLi4KMjA6IDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDI0IGYyIGU0IGZmIDAwICAgIC4uLi4uLi4uLi4uJD8/Li4KMzA6
IDA2IDQwIDAwIDA0IDk0IDExIDIwIGZmIGZmIDAzIDAwIGJmIGZmIGZmIDEwIDAxICAgID9ALj8/
PyAuLj8uPy4uPz8KNDA6IDcyIGE0IDAwIDA5IDAwIDA4IDA1IDg0IDE1IDQwIDE3IDAwIDAwIDBh
IDAwIGUwICAgIHI/Lj8uPz8/P0A/Li4/Lj8KNTA6IDAwIDAwIDAwIDBhIDEwIDAwIGUwIGRmIGZm
IGZmIDAwIDAwIDAwIDEwIDcxIDAwICAgIC4uLj8/Lj8/Li4uLi4/cS4KNjA6IDEwIDEwIDA0IDI5
IDJkIDIxIDEwIDAxIDA5IDEzIDAwIDAzIGU4IDEzIDg4IDAwICAgID8/PyktIT8/Pz8uPz8/Py4K
NzA6IDAwIDE5IDE4IDgzIDE2IDVjIDExIDAwIGZmIDAwIDAwIDBkIDA0IDM4IDQyIDA3ICAgIC4/
Pz8/XD8uLi4uPz84Qj8KODA6IDAwIDAwIDAwIDAwIDAwIDc0IDFiIDE5IDQ0IDA4IDc1IDAwIDAw
IDAwIDAwIDAwICAgIC4uLi4udD8/RD91Li4uLi4KOTA6IDAxIDAyIDAwIDAwIDAwIDAwIDAzIDAw
IGZmIDMwIDAwIDU5IDAxIDAwIDAwIDAwICAgID8/Li4uLj8uLjAuWT8uLi4KYTA6IDAwIGZmIGZl
IGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAyICAgIC4uPy4uLi4uLi4uLi4u
Lj8KYjA6IDAwIDAwIDAwIDAwIDAwIDAwIDQwIDAwIDI4IDAwIDAwIDAwIDAwIDQ0IDA4IDAwICAg
IC4uLi4uLkAuKC4uLi5EPy4KYzA6IDAwIDAwIDAwIDAwIDgwIDAwIDEwIDAxIDBhIDEwIDE4IDAw
IDAwIGZkIDAwIDAwICAgIC4uLi4/Lj8/Pz8/Li4/Li4KZDA6IDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KZTA6IDUwIDEw
IDA4IDUwIDAwIDAyIDAwIDcwIDAwIDAwIDMwIDEwIDBiIDAyIDFjIDAxICAgIFA/P1AuPy5wLi4w
Pz8/Pz8KZjA6IDAwIDBiIDA3IDAwIDk0IDExIDdmIDAwIDAwIDAwIDAwIDAwIDAwIDAxIDBlIGZm
ICAgIC4/Py4/Pz8uLi4uLi4/Py4Kcm9vdEBpY2UtcGluZXBob25lIFsgfiBdICMgaTJjZHVtcCAw
IDB4MmMKTm8gc2l6ZSBzcGVjaWZpZWQgKHVzaW5nIGJ5dGUtZGF0YSBhY2Nlc3MpCldBUk5JTkch
IFRoaXMgcHJvZ3JhbSBjYW4gY29uZnVzZSB5b3VyIEkyQyBidXMsIGNhdXNlIGRhdGEgbG9zcyBh
bmQKd29yc2UhCkkgd2lsbCBwcm9iZSBmaWxlIC9kZXYvaTJjLTAsIGFkZHJlc3MgMHgyYywgbW9k
ZSBieXRlCkNvbnRpbnVlPyBbWS9uXSAKICAgICAwICAxICAyICAzICA0ICA1ICA2ICA3ICA4ICA5
ICBhICBiICBjICBkICBlICBmICAgIDAxMjM0NTY3ODlhYmNkZWYKMDA6IDI5IDFmIDg4IDc2IDAw
IGFjIDExIDAwIDExIDIwIDEwIDEwIDAwIDAwIDAwIDAwICAgICk/P3YuPz8uPyA/Py4uLi4KMTA6
IDAzIDAwIGZmIDhmIGZmIDdmIDAwIDAwIDAwIDAwIDA1IDAwIDEwIDBhIDBjIDAwICAgID8uLj8u
Py4uLi4/Lj8/Py4KMjA6IDAwIDAwIDAwIDAwIDk5IDA2IGMwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAyIDAwICAgIC4uLi4/Pz8uLi4uLi4uPy4KMzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KNDA6IDA0IDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgID8uLi4uLi4uLi4uLi4uLi4K
NTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4u
Li4uLi4uLi4uLi4uLi4KNjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KNzA6IGI4IDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgID8uLi4uLi4uLi4uLi4uLi4KODA6IDAxIDI1IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgID8lLi4uLi4uLi4uLi4u
Li4KOTA6IDBmIDBmIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAg
ID8/Li4uLi4uLi4uLi4uLi4KYTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KYjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KYzA6IDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4u
Li4uLi4KZDA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
ICAgIC4uLi4uLi4uLi4uLi4uLi4KZTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KZjA6IDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KCj4gCj4g
VGhhbmtzLAo+ICBFbnJpYwo+IAo+IAo+ID4gcmVnYXJkcywKPiA+IAlvLgo+ID4gCj4gPiA+ID4g
VGhhbmtzIGluIGFkdmFuY2UsCj4gPiA+ID4gIEVucmljCj4gPiA+ID4gCj4gPiA+ID4gW3NuaXBd
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
