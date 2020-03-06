Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1CA17BC61
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 13:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5981089E50;
	Fri,  6 Mar 2020 12:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5A089E50
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:11:19 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id x62so521906vkg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=0TUqo6ABKjwBnwDPZcgrzkhlR/76Lf46MG8q+lDRB/8=;
 b=Lrp8JGAiHwHwWX0IhOfZnqln4zidFkjpkzJZc5IITIoiGy+D5onYZVtO/J77i20f0U
 E5/tYpu+oeJjp5Ek57MA/FDMMSQ2kSxqccAD3kIMoucdeTGVqIBGtY480HtRL5arKs0f
 TKyBrdvSML8aVPRNV1R+JwUz3nHMvSb99nsL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=0TUqo6ABKjwBnwDPZcgrzkhlR/76Lf46MG8q+lDRB/8=;
 b=raWKqwYQicAmqDlkVKkeQPVGxlTzx4Bb27n7wwR/cqdUk/MLVrW6d2iVxEHBpbJdge
 yyJ9C87eM5scQJU2zXPJgI5nwKZcCdPdnK6B3R+Twb/IIMaj2opDtah5PkgenJB/1rZ7
 h9sVAYrzxo39gMomavk3YzPAjmbBnuTe8vdpHF2Ie0yZ3puluX50LqiBU/rXhDwQk3or
 aBcGr0+buUzf/OEbraLKSzRqxLRYCIoIWz/4J8q45mM5x4EokVkte9rNO12wjsK3+jDr
 HE9DpkvO4GQacu2+zyRUYeu+QL67lr59i+p1DN7nDu0HcYeTtETSsj5DKmFs2C6l94D0
 EHPA==
X-Gm-Message-State: ANhLgQ38QOiF3qfBOjAGAcdpkxz1MhQAom0caLRa1w03QyLxw0CIClMm
 iWbxuMSp4yJ3KzQz01bhvl2V70JV902IBo97uBDYiw==
X-Google-Smtp-Source: ADFU+vubNpp5WuQGslML1DFO7WzoJzlruVOXAnHZ2XSMzf1yBhULppWC4mBeJHnBzL21C/ktAd6KdRlpH+x9FLeKDso=
X-Received: by 2002:a1f:aac1:: with SMTP id t184mr1393354vke.33.1583496678551; 
 Fri, 06 Mar 2020 04:11:18 -0800 (PST)
MIME-Version: 1.0
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
 <20200306120726.t7aitfz5rq3m7m6y@core.my.home>
In-Reply-To: <20200306120726.t7aitfz5rq3m7m6y@core.my.home>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 6 Mar 2020 20:11:07 +0800
Message-ID: <CANMq1KC1R4B66Nr01pADa3RV8NpkPqkM-1pe-1N1nQiMviX1Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>, 
 Icenowy Zheng <icenowy@aosc.io>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, 
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>
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

T24gRnJpLCBNYXIgNiwgMjAyMCBhdCA4OjA3IFBNIE9uZMWZZWogSmlybWFuIDxtZWdvdXNAbWVn
b3VzLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1hciAwNiwgMjAyMCBhdCAwNDo1Mzo0NlBNICsw
ODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjAtMDMtMDbmmJ/mnJ/kupTnmoQg
MDk6NDYgKzAxMDDvvIxFbnJpYyBCYWxsZXRibyBpIFNlcnJh5YaZ6YGT77yaCj4gPiA+IEhpIE9u
ZHJlaiwKPiA+ID4KPiA+ID4gT24gNS8zLzIwIDIwOjM1LCBPbmTFmWVqIEppcm1hbiB3cm90ZToK
PiA+ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgTWFyIDA1LCAyMDIwIGF0IDEwOjI5
OjMzQU0gLTA4MDAsIFZhc2lseSBLaG9ydXpoaWNrIHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBN
YXIgNSwgMjAyMCBhdCA3OjI4IEFNIEVucmljIEJhbGxldGJvIGkgU2VycmEKPiA+ID4gPiA+IDxl
bnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gSGkgVmFzaWx5
LAo+ID4gPiA+ID4KPiA+ID4gPiA+IENDOiBJY2Vub3d5IGFuZCBPbmRyZWoKPiA+ID4gPiA+ID4g
V291bGQgeW91IG1pbmQgdG8gY2hlY2sgd2hpY2ggZmlybXdhcmUgdmVyc2lvbiBpcyBydW5uaW5n
IHRoZQo+ID4gPiA+ID4gPiBhbng3Njg4IGluCj4gPiA+ID4gPiA+IFBpbmVQaG9uZSwgSSB0aGlu
ayBzaG91bGQgYmUgZWFzeSB0byBjaGVjayB3aXRoIGkyYy10b29scy4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJY2Vub3d5LCBPbmRyZWosIGNhbiB5b3UgZ3V5cyBwbGVhc2UgY2hlY2sgYW54NzY4OCBm
aXJtd2FyZQo+ID4gPiA+ID4gdmVyc2lvbj8KPiA+ID4gPgo+ID4gPiA+IGkyY2dldCAwIDB4Mjgg
MHgwMCB3Cj4gPiA+ID4gMHhhYWFhCj4gPiA+ID4KPiA+ID4gPiBpMmNnZXQgMCAweDI4IDB4MDIg
dwo+ID4gPiA+IDB4NzY4OAo+ID4gPiA+Cj4gPiA+ID4gaTJjZ2V0IDAgMHgyOCAweDgwIHcKPiA+
ID4gPiAweDAwMDAKPiA+ID4gPgo+ID4gPgo+ID4gPiBDYW4geW91IGNoZWNrIHRoZSB2YWx1ZSBm
b3IgMHg4MSB0b28/Cj4gPgo+ID4gcm9vdEBpY2UtcGluZXBob25lIFsgfiBdICMgaTJjZHVtcCAw
IDB4MjgKPiA+IE5vIHNpemUgc3BlY2lmaWVkICh1c2luZyBieXRlLWRhdGEgYWNjZXNzKQo+ID4g
V0FSTklORyEgVGhpcyBwcm9ncmFtIGNhbiBjb25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2UgZGF0
YSBsb3NzIGFuZAo+ID4gd29yc2UhCj4gPiBJIHdpbGwgcHJvYmUgZmlsZSAvZGV2L2kyYy0wLCBh
ZGRyZXNzIDB4MjgsIG1vZGUgYnl0ZQo+ID4gQ29udGludWU/IFtZL25dCj4gPiAgICAgIDAgIDEg
IDIgIDMgIDQgIDUgIDYgIDcgIDggIDkgIGEgIGIgIGMgIGQgIGUgIGYgICAgMDEyMzQ1Njc4OWFi
Y2RlZgo+ID4gMDA6IGFhIGFhIDg4IDc2IGFjIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDA1
IDA1ICAgID8/P3Y/Li4uLi4uLi4uPz8KPiA+IDEwOiAzMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgICAwLi4uLi4uLi4uLi4uLi4uCj4gPiAyMDogMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMjQgZjIgZTQgZmYgMDAgICAgLi4uLi4uLi4uLi4k
Pz8uLgo+ID4gMzA6IDA2IDQwIDAwIDA0IDk0IDExIDIwIGZmIGZmIDAzIDAwIGJmIGZmIGZmIDEw
IDAxICAgID9ALj8/PyAuLj8uPy4uPz8KPiA+IDQwOiA3MiBhNCAwMCAwOSAwMCAwOCAwNSA4NCAx
NSA0MCAxNyAwMCAwMCAwYSAwMCBlMCAgICByPy4/Lj8/Pz9APy4uPy4/Cj4gPiA1MDogMDAgMDAg
MDAgMGEgMTAgMDAgZTAgZGYgZmYgZmYgMDAgMDAgMDAgMTAgNzEgMDAgICAgLi4uPz8uPz8uLi4u
Lj9xLgo+ID4gNjA6IDEwIDEwIDA0IDI5IDJkIDIxIDEwIDAxIDA5IDEzIDAwIDAzIGU4IDEzIDg4
IDAwICAgID8/PyktIT8/Pz8uPz8/Py4KPiA+IDcwOiAwMCAxOSAxOCA4MyAxNiA1YyAxMSAwMCBm
ZiAwMCAwMCAwZCAwNCAzOCA0MiAwNyAgICAuPz8/P1w/Li4uLj8/OEI/Cj4gPiA4MDogMDAgMDAg
MDAgMDAgMDAgNzQgMWIgMTkgNDQgMDggNzUgMDAgMDAgMDAgMDAgMDAgICAgLi4uLi50Pz9EP3Uu
Li4uLgo+ID4gOTA6IDAxIDAyIDAwIDAwIDAwIDAwIDAzIDAwIGZmIDMwIDAwIDU5IDAxIDAwIDAw
IDAwICAgID8/Li4uLj8uLjAuWT8uLi4KPiA+IGEwOiAwMCBmZiBmZSBmZiBmZiAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMiAgICAuLj8uLi4uLi4uLi4uLi4/Cj4gPiBiMDogMDAgMDAg
MDAgMDAgMDAgMDAgNDAgMDAgMjggMDAgMDAgMDAgMDAgNDQgMDggMDAgICAgLi4uLi4uQC4oLi4u
LkQ/Lgo+ID4gYzA6IDAwIDAwIDAwIDAwIDgwIDAwIDEwIDAxIDBhIDEwIDE4IDAwIDAwIGZkIDAw
IDAwICAgIC4uLi4/Lj8/Pz8/Li4/Li4KPiA+IGQwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgICAuLi4uLi4uLi4uLi4uLi4uCj4gPiBlMDogNTAgMTAg
MDggNTAgMDAgMDIgMDAgNzAgMDAgMDAgMzAgMTAgMGIgMDIgMWMgMDEgICAgUD8/UC4/LnAuLjA/
Pz8/Pwo+ID4gZjA6IDAwIDBiIDA3IDAwIDk0IDExIDdmIDAwIDAwIDAwIDAwIDAwIDAwIDAxIDBl
IGZmICAgIC4/Py4/Pz8uLi4uLi4/Py4KPgo+IE15IHZhbHVlcyBmb3IgMHgyOCBhZGRyZXNzIG1h
dGNoIHRoaXMuIF4KCldoYXQgYWJvdXQgdGhlIHZhbHVlcyBhdCAweDJjPwoKPiBJbnRlcmVzdGlu
ZyB0aGF0IGl0IHJldHVybnMgZGlmZmVyZW50IHJlZ2lzdGVyIHZhbHVlcyBmb3IgZGlmZmVyZW50
Cj4gZGV2aWNlIGFkZHJlc3Nlcy4KClllcyB0aGUgcmVnaXN0ZXJzIGhhdmUgZGlmZmVyZW50IG1l
YW5pbmdzIGZvciB0aGUgMiBhZGRyZXNzZXMuCgpUaGFua3MsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
