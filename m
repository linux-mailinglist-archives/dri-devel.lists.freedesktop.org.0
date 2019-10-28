Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C584E6EDA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 10:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2812A6E4F9;
	Mon, 28 Oct 2019 09:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E1B6E4F9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 09:18:25 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1F3B20717;
 Mon, 28 Oct 2019 09:18:25 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-5-arnd@arndb.de>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 05/46] ARM: pxa: split up mach/hardware.h
To: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
User-Agent: alot/0.8.1
Date: Mon, 28 Oct 2019 02:18:24 -0700
Message-Id: <20191028091825.A1F3B20717@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572254305;
 bh=Y0pjFTnEi7fofZFVzScrzdhMzlM8KuUwtUfFJMd6jEM=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=RgzxngTnQ5mhx9Hl2fC158gkHbjFpCK1xE9h+M1GjeCZxXb6MUInbliEaxAObjuqL
 wSQcKENaW7bda+XlQFMQ4kSrY/CYQhZIb7yuVvXU8ecOVokkeGpi3FpJqjni84Zghu
 HHQWsB9WCGlUQTC7Hz+Y655Ladb2jywc3qV2avTY=
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBBcm5kIEJlcmdtYW5uICgyMDE5LTEwLTE4IDA4OjQxOjIwKQo+IFRoZSBtYWNoL2hh
cmR3YXJlLmggaXMgaW5jbHVkZWQgaW4gbG90cyBvZiBwbGFjZXMsIGFuZCBpdCBwcm92aWRlcwo+
IHRocmVlIGRpZmZlcmVudCB0aGluZ3Mgb24gcHhhOgo+IAo+IC0gdGhlIGNwdV9pc19weGEqIG1h
Y3Jvcwo+IC0gYW4gaW5kaXJlY3QgaW5jbHVzaW9uIG9mIG1hY2gvYWRkci1tYXAuaAo+IC0gdGhl
IF9fUkVHKCkgYW5kIGlvX3B2MigpIGhlbHBlciBtYWNyb3MKPiAKPiBTcGxpdCBpdCB1cCBpbnRv
IHNlcGFyYXRlIDxsaW51eC9zb2MvcHhhL2NwdS5oPiBhbmQgbWFjaC9weGEtcmVncy5oCj4gaGVh
ZGVycywgdGhlbiBjaGFuZ2UgYWxsIHRoZSBmaWxlcyB0aGF0IHVzZSBtYWNoL2hhcmR3YXJlLmgg
dG8KPiBpbmNsdWRlIHRoZSBleGFjdCBzZXQgb2YgdGhvc2UgdGhyZWUgaGVhZGVycyB0aGF0IHRo
ZXkgYWN0dWFsbHkKPiBuZWVkLCBhbGxvd2luZyBmb3IgZnVydGhlciBtb3JlIHRhcmdldGVkIGNs
ZWFudXAuCj4gCj4gbGludXgvc29jL3B4YS9jcHUuaCBjYW4gcmVtYWluIHBlcm1hbmVudGx5IGV4
cG9ydGVkIGFuZCBpcyBub3cgaW4KPiBhIGdsb2JhbCBsb2NhdGlvbiBhbG9uZyB3aXRoIHNpbWls
YXIgaGVhZGVycy4gcHhhLXJlZ3MuaCBhbmQKPiBhZGRyLW1hcC5oIGFyZSBvbmx5IHVzZWQgaW4g
YSB2ZXJ5IHNtYWxsIG51bWJlciBvZiBkcml2ZXJzIG5vdwo+IGFuZCBjYW4gYmUgbW92ZWQgdG8g
YXJjaC9hcm0vbWFjaC1weGEvIGRpcmVjdGx5IHdoZW4gdGhvc2UgZHJpdmVycwo+IGFyZSB0byBw
YXNzIHRoZSBuZWNlc3NhcnkgZGF0YSBhcyByZXNvdXJjZXMuCj4gCj4gQ2M6IE1pY2hhZWwgVHVy
cXVldHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT4KPiBDYzogU3RlcGhlbiBCb3lkIDxzYm95
ZEBrZXJuZWwub3JnPgo+IENjOiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3Jn
Pgo+IENjOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+Cj4gQ2M6
IEphY2VrIEFuYXN6ZXdza2kgPGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPgo+IENjOiBQYXZl
bCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiBDYzogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxp
bmFyby5vcmc+Cj4gQ2M6IERvbWluaWsgQnJvZG93c2tpIDxsaW51eEBkb21pbmlrYnJvZG93c2tp
Lm5ldD4KPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4u
Y29tPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
Pgo+IENjOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gQ2M6IE1hcmsgQnJv
d24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwo+
IENjOiBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJu
ZWwub3JnCj4gQ2M6IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1tY0B2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzog
bGludXgtcnRjQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtZmJkZXZA
dmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZwo+IENj
OiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQoKQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRA
a2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
