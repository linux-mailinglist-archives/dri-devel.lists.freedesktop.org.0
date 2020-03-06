Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0117CD7E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB136E141;
	Sat,  7 Mar 2020 10:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4157D6E430
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1583498804; bh=Hq/SxVhmuqTkQU0lHEM/7do8nN5uoeLcscHI4XCDnT0=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=RnG6d57C8x+pmDej2igLxil8i2jQRp9SxKEUnOY6oU8d5cXRVV6+HSv8EIF5cbt4e
 ZktQtIXowPU3HA3oh4Jh27qXXPajdsCjIAvtLqsmjwi5Lyvs6Y9W+VZGkO01IzNUJ7
 wZ2z3bBxJI/KHm6jkD+b9tppcqVThi4Tzd/hpHrs=
Date: Fri, 6 Mar 2020 13:46:43 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
Message-ID: <20200306124643.wec6d47loprk4zfi@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Icenowy Zheng <icenowy@aosc.io>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
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
References: <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
 <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
 <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
 <20200305193505.4km5j7n25ph4b6hn@core.my.home>
 <2a5a4a62-3189-e053-21db-983a4c766d44@collabora.com>
 <5d72a8c6824b31163a303b5ef1526efe05121e5d.camel@aosc.io>
 <20200306120726.t7aitfz5rq3m7m6y@core.my.home>
 <CANMq1KC1R4B66Nr01pADa3RV8NpkPqkM-1pe-1N1nQiMviX1Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANMq1KC1R4B66Nr01pADa3RV8NpkPqkM-1pe-1N1nQiMviX1Cg@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Torsten Duwe <duwe@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Andrzej Hajda <a.hajda@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDg6MTE6MDdQTSArMDgwMCwgTmljb2xhcyBCb2ljaGF0
IHdyb3RlOgo+IE9uIEZyaSwgTWFyIDYsIDIwMjAgYXQgODowNyBQTSBPbmTFmWVqIEppcm1hbiA8
bWVnb3VzQG1lZ291cy5jb20+IHdyb3RlOgo+IAo+IFdoYXQgYWJvdXQgdGhlIHZhbHVlcyBhdCAw
eDJjPwoKaTJjZHVtcCAwIDB4MjgKCiAgICAgMCAgMSAgMiAgMyAgNCAgNSAgNiAgNyAgOCAgOSAg
YSAgYiAgYyAgZCAgZSAgZiAgICAwMTIzNDU2Nzg5YWJjZGVmCjAwOiBhYSBhYSA4OCA3NiBhYyAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCA4MCAwNSAwNSAgICA/Pz92Py4uLi4uLi4uPz8/CjEwOiAz
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgICAwLi4uLi4u
Li4uLi4uLi4uCjIwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAzNCBmMiBlNCBm
ZiAwMCAgICAuLi4uLi4uLi4uLjQ/Py4uCjMwOiAwNCA0MCAwMCAwNCA5NCAxMSAyMCBmZiBmZiAw
MyAwMCBmZiBmZiBmZiAwMCAwMSAgICA/QC4/Pz8gLi4/Li4uLi4/CjQwOiA3OCBhNCAwMCAwOSAw
MCAwOCAwNSA4NCAxMCA2MCAxNyAwMCAwMCAwYSAwMCBiMCAgICB4Py4/Lj8/Pz9gPy4uPy4/CjUw
OiAwMCAwMCAwMCAwYSAwMCAwMCBlMCBkZiBmZiBmZiAwMCAwMCAwMCAxMCA3MSAwMCAgICAuLi4/
Li4/Py4uLi4uP3EuCjYwOiAxMCAxMCAwNCAyOSAyZCAyMSAxMCAwMSAwOSAwMyAwMCAwMyBlOCAx
MyA4OCAwMCAgICA/Pz8pLSE/Pz8/Lj8/Pz8uCjcwOiAwMCAxOSAxOCA4MyAwNiA1YSAxMSAwMCBm
ZiAwMCAwMCAwZCAwNCAzOCA0MiAwNyAgICAuPz8/P1o/Li4uLj8/OEI/CjgwOiAwMCAwMCAwMCAw
MCAwMCA3NCAxYiAxOSA0MCAwOCA3NSAwMCAwMCAwMCAwMCAwMCAgICAuLi4uLnQ/P0A/dS4uLi4u
CjkwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMyAwMCBmZiAzMCAwMCA1OSAwMSAwMCAwMCAwMCAgICAu
Li4uLi4/Li4wLlk/Li4uCmEwOiAwMCBmZiBmZiBmZiBmZiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAgICAuLi4uLi4uLi4uLi4uLi4uCmIwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgICAuLi4uLi4uLi4uLi4uLi4uCmMwOiAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwYSAxMCAxOCAwMCAwMCBmZiAwMCAwMCAgICAuLi4uLi4uLj8/Py4u
Li4uCmQwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAg
ICAuLi4uLi4uLi4uLi4uLi4uCmUwOiA1MCAxMCAwOCA1MCAwMCAwMiAwMCA3MCAwMCAwMCAzMCAx
MCAxMSAwMiAxYyAwMSAgICBQPz9QLj8ucC4uMD8/Pz8/CmYwOiAwMCAxMSAwNyAwMCA5NCAxMSA3
ZiAwMCAwMCAwMCAwMCAwMCAwMCAwMSAwZSBmZiAgICAuPz8uPz8/Li4uLi4uPz8uCgppMmNkdW1w
IDAgMHgyYwoKICAgICAwICAxICAyICAzICA0ICA1ICA2ICA3ICA4ICA5ICBhICBiICBjICBkICBl
ICBmICAgIDAxMjM0NTY3ODlhYmNkZWYKMDA6IDI5IDFmIDg4IDc2IDAwIGFjIDExIDAwIDExIDIw
IDEwIDEwIDAwIDAwIDAwIDAwICAgICk/P3YuPz8uPyA/Py4uLi4KMTA6IDAzIDAwIGZmIDhmIGZm
IDdmIDAwIDAwIDAwIDAwIDBhIDAwIDEwIDExIDBjIDAwICAgID8uLj8uPy4uLi4/Lj8/Py4KMjA6
IDAwIDAwIDAwIDAwIDk5IDA2IGMwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAyIDAwICAgIC4uLi4/
Pz8uLi4uLi4uPy4KMzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KNDA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KNTA6IDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4K
NjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4u
Li4uLi4uLi4uLi4uLi4KNzA6IGI0IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwICAgID8uLi4uLi4uLi4uLi4uLi4KODA6IDAxIDI1IDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgID8lLi4uLi4uLi4uLi4uLi4KOTA6IDBmIDBmIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgID8/Li4uLi4uLi4uLi4u
Li4KYTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAg
IC4uLi4uLi4uLi4uLi4uLi4KYjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KYzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KZDA6IDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4u
Li4uLi4KZTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
ICAgIC4uLi4uLi4uLi4uLi4uLi4KZjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwICAgIC4uLi4uLi4uLi4uLi4uLi4KCgpyZWdhcmRzLAoJby4KCj4gCj4g
VGhhbmtzLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
