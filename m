Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDEC17B7DB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752766EC6C;
	Fri,  6 Mar 2020 08:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108116E391
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 18:35:24 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 04bece6b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 5 Mar 2020 10:35:22 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 182D04B2E3;
 Thu,  5 Mar 2020 18:35:17 +0000 (UTC)
Date: Fri, 06 Mar 2020 02:35:12 +0800
In-Reply-To: <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
 <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
 <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
 <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <1E10190D-265F-4287-9717-AD1457E7044A@aosc.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1583433319;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=//QrWlD/P+HB+nkieh4hRmpzn2XAHQWWWeCW88czZjU=;
 b=FWIm1DWulIexbYtpxgnXp718ykKfXTtxpwAKWiUdWiZll5BA+EA6nziXFm2SFHaxnqj/K4
 S82mGdox2p+i8EZPcPyNFP8Y2+uc+s+kJJ7uTnEJnsLEheDu7qamp+gDQWTDbn0M5+/KCs
 sfEk9RJhwNQVTrm8MG4PpiYlbfIx2+k=
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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

Cgrkuo4gMjAyMOW5tDPmnIg25pelIEdNVCswODowMCDkuIrljYgyOjI5OjMzLCBWYXNpbHkgS2hv
cnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPiDlhpnliLA6Cj5PbiBUaHUsIE1hciA1LCAyMDIw
IGF0IDc6MjggQU0gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYQo+PGVucmljLmJhbGxldGJvQGNvbGxh
Ym9yYS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBWYXNpbHksCj4KPkNDOiBJY2Vub3d5IGFuZCBPbmRy
ZWoKPj4KPj4gV291bGQgeW91IG1pbmQgdG8gY2hlY2sgd2hpY2ggZmlybXdhcmUgdmVyc2lvbiBp
cyBydW5uaW5nIHRoZSBhbng3Njg4Cj5pbgo+PiBQaW5lUGhvbmUsIEkgdGhpbmsgc2hvdWxkIGJl
IGVhc3kgdG8gY2hlY2sgd2l0aCBpMmMtdG9vbHMuCj4KPkljZW5vd3ksIE9uZHJlaiwgY2FuIHlv
dSBndXlzIHBsZWFzZSBjaGVjayBhbng3Njg4IGZpcm13YXJlIHZlcnNpb24/CgpBdCAweDJjLCAw
eDgwIGlzIDB4MDEsIDB4ODEgaXMgMHgyNQoKMDEuMjUsIHJpZ2h0PwoKPgo+PiBUaGFua3MgaW4g
YWR2YW5jZSwKPj4gIEVucmljCj4+Cj4+IFtzbmlwXQoKLS0gCuS9v+eUqCBLLTkgTWFpbCDlj5Hp
gIHoh6rmiJHnmoRBbmRyb2lk6K6+5aSH44CCCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
