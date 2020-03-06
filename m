Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705717CD84
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0608D6E155;
	Sat,  7 Mar 2020 10:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64296ECEB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1583496198; bh=JqiFr1VYUHqaDfItBN2sEwFZejl03mpzcgEzSbZHdx0=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=ESId+B1rQGutT/n7c667qYJpTjV0Av8aWhJqYjbDtHFxaw3JmN107J0JnLZsH0d9o
 LBXx11s4+9MKy1HHM89EClSFiJxmTv1+SmXSkAOBElcM6RJzM/ib0/AZ23Kl+1w3+d
 gr7E8BzchcWpQkIdkFVz76ej4S5t0ekkiKE4LTJk=
Date: Fri, 6 Mar 2020 13:03:18 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
Message-ID: <20200306120318.oq575imqjh7uolss@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>,
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a5a4a62-3189-e053-21db-983a4c766d44@collabora.com>
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
 Nicolas Boichat <drinkcat@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Torsten Duwe <duwe@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDk6NDY6NTFBTSArMDEwMCwgRW5yaWMgQmFsbGV0Ym8g
aSBTZXJyYSB3cm90ZToKPiBIaSBPbmRyZWosCj4gCj4gT24gNS8zLzIwIDIwOjM1LCBPbmTFmWVq
IEppcm1hbiB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBPbiBUaHUsIE1hciAwNSwgMjAyMCBhdCAx
MDoyOTozM0FNIC0wODAwLCBWYXNpbHkgS2hvcnV6aGljayB3cm90ZToKPiA+PiBPbiBUaHUsIE1h
ciA1LCAyMDIwIGF0IDc6MjggQU0gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYQo+ID4+IDxlbnJpYy5i
YWxsZXRib0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gSGkgVmFzaWx5LAo+ID4+
Cj4gPj4gQ0M6IEljZW5vd3kgYW5kIE9uZHJlago+ID4+Pgo+ID4+PiBXb3VsZCB5b3UgbWluZCB0
byBjaGVjayB3aGljaCBmaXJtd2FyZSB2ZXJzaW9uIGlzIHJ1bm5pbmcgdGhlIGFueDc2ODggaW4K
PiA+Pj4gUGluZVBob25lLCBJIHRoaW5rIHNob3VsZCBiZSBlYXN5IHRvIGNoZWNrIHdpdGggaTJj
LXRvb2xzLgo+ID4+Cj4gPj4gSWNlbm93eSwgT25kcmVqLCBjYW4geW91IGd1eXMgcGxlYXNlIGNo
ZWNrIGFueDc2ODggZmlybXdhcmUgdmVyc2lvbj8KPiA+IAo+ID4gaTJjZ2V0IDAgMHgyOCAweDAw
IHcKPiA+IDB4YWFhYQo+ID4gCj4gPiBpMmNnZXQgMCAweDI4IDB4MDIgdwo+ID4gMHg3Njg4Cj4g
PiAKPiA+IGkyY2dldCAwIDB4MjggMHg4MCB3Cj4gPiAweDAwMDAKPiA+IAo+IAo+IENhbiB5b3Ug
Y2hlY2sgdGhlIHZhbHVlIGZvciAweDgxIHRvbz8KCid3JyByZWFkIGNoZWNrcyBib3RoIHZhbHVl
cyBhdCBvbmNlLCBhcyB5b3UgY2FuIHNlZSBhYm92ZS4KCnJlZ2FyZHMsCglvLgoKPiBUaGFua3Ms
Cj4gIEVucmljCj4gCj4gCj4gPiByZWdhcmRzLAo+ID4gCW8uCj4gPiAKPiA+Pj4gVGhhbmtzIGlu
IGFkdmFuY2UsCj4gPj4+ICBFbnJpYwo+ID4+Pgo+ID4+PiBbc25pcF0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
