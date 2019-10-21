Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2EBDE548
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 09:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78989A60;
	Mon, 21 Oct 2019 07:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5F78992E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 02:27:39 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a2so7409070pfo.10
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 19:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
 b=iKqC6IMAaQJCR8zGDXGwPcREO3pi1HeKWjsU3Dz1bxjyNpXR+/+mHOILYmMGahkK+C
 rgCoZHLKW4rH83dx9ZLza4te2w8mnIil5jAD/nQIkVZ83NPy9yyMj0prIrsnBleX36C0
 Hm9tVBg7q0SfbGIASDMWzDa6/0d88a1x2l4yAY0cJzr9fLnwJq6FwDDIGwYoKq3nURei
 mrrx5a+nBMVTML9c7rd4nRcAiSumyDgGAuejoSafbepKU1RgOpIOU02gwnqGaQPGSklT
 LooyC8L9k50EHKJ1OFTWVW+tiVYKNP6c2CCCX14kf51LyIES9+vY9Jld26mdrg/ro7F7
 qZVw==
X-Gm-Message-State: APjAAAVrmOwYKIhUhAWKHZjDLWJ6Ga/ynqNZJMFVqCfvIu7ttYm6qIEk
 NzuJ2QuDjGiVKSGhj5HA2eflhQ==
X-Google-Smtp-Source: APXvYqwgXGc8U+6JV2azREgJVpwvucEYJlBr8fKvxMlwaeCP9tIcS23wt/WioWPY0VSEsf3wqmlSTg==
X-Received: by 2002:a63:4e52:: with SMTP id o18mr11185515pgl.153.1571624859157; 
 Sun, 20 Oct 2019 19:27:39 -0700 (PDT)
Received: from localhost ([122.172.151.112])
 by smtp.gmail.com with ESMTPSA id f17sm20835265pgd.8.2019.10.20.19.27.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Oct 2019 19:27:38 -0700 (PDT)
Date: Mon, 21 Oct 2019 07:57:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/46] ARM: pxa: split up mach/hardware.h
Message-ID: <20191021022736.yu6unspozqf5634p@vireshk-i7>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 21 Oct 2019 07:26:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
 b=HBXUvt040GMIEwLCNj0cv5hSZlRkL/uSj5D7wLWdq/dK4otL0nVEbSqZR/yA3O2Og9
 AGWR8nz33JcyPwt0cVzYqNq50Faf18+z3imXfVGexdoVV7YqaTAx1/VUr9tWFd1T5Cbb
 Tf3GaNcBURk5SkpU/x/jomYDDMhIfJxW71YTg5rvruJX3ueO8ezhfGPDpZ8h4aBGcFO7
 kumSOPEltTLr+L4+0n9vUg4CWg75RR45G4UAxyVxqOpn3JU7cI+2DI4kkwOVZWPX+nFt
 EIZgqQsA7otGwkMKpKWeRDE8Vka9aexA24uKnw1PmWmT0weSSgJHTEGbfcCA0RE8KN8b
 2ajw==
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgtMTAtMTksIDE3OjQxLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IFRoZSBtYWNoL2hhcmR3
YXJlLmggaXMgaW5jbHVkZWQgaW4gbG90cyBvZiBwbGFjZXMsIGFuZCBpdCBwcm92aWRlcwo+IHRo
cmVlIGRpZmZlcmVudCB0aGluZ3Mgb24gcHhhOgo+IAo+IC0gdGhlIGNwdV9pc19weGEqIG1hY3Jv
cwo+IC0gYW4gaW5kaXJlY3QgaW5jbHVzaW9uIG9mIG1hY2gvYWRkci1tYXAuaAo+IC0gdGhlIF9f
UkVHKCkgYW5kIGlvX3B2MigpIGhlbHBlciBtYWNyb3MKPiAKPiBTcGxpdCBpdCB1cCBpbnRvIHNl
cGFyYXRlIDxsaW51eC9zb2MvcHhhL2NwdS5oPiBhbmQgbWFjaC9weGEtcmVncy5oCj4gaGVhZGVy
cywgdGhlbiBjaGFuZ2UgYWxsIHRoZSBmaWxlcyB0aGF0IHVzZSBtYWNoL2hhcmR3YXJlLmggdG8K
PiBpbmNsdWRlIHRoZSBleGFjdCBzZXQgb2YgdGhvc2UgdGhyZWUgaGVhZGVycyB0aGF0IHRoZXkg
YWN0dWFsbHkKPiBuZWVkLCBhbGxvd2luZyBmb3IgZnVydGhlciBtb3JlIHRhcmdldGVkIGNsZWFu
dXAuCj4gCj4gbGludXgvc29jL3B4YS9jcHUuaCBjYW4gcmVtYWluIHBlcm1hbmVudGx5IGV4cG9y
dGVkIGFuZCBpcyBub3cgaW4KPiBhIGdsb2JhbCBsb2NhdGlvbiBhbG9uZyB3aXRoIHNpbWlsYXIg
aGVhZGVycy4gcHhhLXJlZ3MuaCBhbmQKPiBhZGRyLW1hcC5oIGFyZSBvbmx5IHVzZWQgaW4gYSB2
ZXJ5IHNtYWxsIG51bWJlciBvZiBkcml2ZXJzIG5vdwo+IGFuZCBjYW4gYmUgbW92ZWQgdG8gYXJj
aC9hcm0vbWFjaC1weGEvIGRpcmVjdGx5IHdoZW4gdGhvc2UgZHJpdmVycwo+IGFyZSB0byBwYXNz
IHRoZSBuZWNlc3NhcnkgZGF0YSBhcyByZXNvdXJjZXMuCj4gCj4gQ2M6IE1pY2hhZWwgVHVycXVl
dHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT4KPiBDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBr
ZXJuZWwub3JnPgo+IENjOiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgo+
IENjOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+Cj4gQ2M6IEph
Y2VrIEFuYXN6ZXdza2kgPGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPgo+IENjOiBQYXZlbCBN
YWNoZWsgPHBhdmVsQHVjdy5jej4KPiBDYzogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFy
by5vcmc+Cj4gQ2M6IERvbWluaWsgQnJvZG93c2tpIDxsaW51eEBkb21pbmlrYnJvZG93c2tpLm5l
dD4KPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29t
Pgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+
IENjOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gQ2M6IE1hcmsgQnJvd24g
PGJyb29uaWVAa2VybmVsLm9yZz4KPiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwo+IENj
OiBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1tY0B2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGlu
dXgtcnRjQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtZmJkZXZAdmdl
ci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZwo+IENjOiBh
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2NwdWZyZXEvcHhhMnh4LWNwdWZyZXEu
YyAgICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvY3B1ZnJlcS9weGEzeHgtY3B1ZnJlcS5j
ICAgICAgICAgICAgICB8ICAxICsKCkFja2VkLWJ5OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1h
ckBsaW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
