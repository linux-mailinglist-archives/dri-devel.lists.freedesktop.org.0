Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37348DC0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 21:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9E089286;
	Mon, 17 Jun 2019 19:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD86489286
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:16:44 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97F99208CB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:16:44 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id i34so6883988qta.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 12:16:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVSKqbjR09PLMeNheA1VDw5+wdoA0cOcJPeSW4RBx0jgcqQixQa
 nZwSXyU/a6u+ovw8hW8NamZJWHVLwRGzz4qQgw==
X-Google-Smtp-Source: APXvYqyVZbh0PlMogbVhE0NULb2YNLy3fCj6PKe8704XokjeEqmm6eZIegjHmk/tzMvMCwl9xNlf5j9cXMv6fjsBPAU=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr13618835qtc.143.1560799003868; 
 Mon, 17 Jun 2019 12:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
In-Reply-To: <20190614235719.8134-1-joseph.kogut@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 17 Jun 2019 13:16:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKasi4m7xU2AF1YQk-Tp0Z6=qh51LgTpb=xiZ9g6A3HvA@mail.gmail.com>
Message-ID: <CAL_JsqKasi4m7xU2AF1YQk-Tp0Z6=qh51LgTpb=xiZ9g6A3HvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560799004;
 bh=Gt19uq+qmreWDS4gPNgKL+i/1lZeWJVrbTndQXm88hA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ygI4mXZ4FK/DIAC0x67TCpM/GLGF7iIf6vOaeEfsnPSMNoQfK28rgck+5RB2qRpEO
 CMsaZVg4ehzf/O4mj+wCZIvyxGeQNNkRPycGzlVa9w80eY/UyXxP7tixjhKDXtQyHL
 YyRUpu5ryCwzuA+MoSUQrA/vBH4C2sSnqAWyYbSw=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNTo1NyBQTSBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1
dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGRldmljZSB0cmVlIG5vZGUgZm9yIG1hbGkgZ3B1
IG9uIE9kcm9pZCBYVTMgU29Dcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9z
ZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gLSBVc2Ug
aW50ZXJydXB0IG5hbWUgb3JkZXJpbmcgZnJvbSBiaW5kaW5nIGRvYwo+IC0gU3BlY2lmeSBhIHNp
bmdsZSBjbG9jayBmb3IgR1BVIG5vZGUKPiAtIEFkZCBncHUgb3BwIHRhYmxlCj4gLSBGaXggd2Fy
bmluZ3MgZnJvbSBJUlFfVFlQRV9OT05FCj4KPiAgLi4uL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ry
b2lkeHUzLWNvbW1vbi5kdHNpIHwgMjYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kKPiBpbmRleCA5M2E0OGYyZGRhNDkuLmI4YTQy
NDZlM2IzNyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9kcm9p
ZHh1My1jb21tb24uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ry
b2lkeHUzLWNvbW1vbi5kdHNpCj4gQEAgLTQ4LDYgKzQ4LDMyIEBACj4gICAgICAgICAgICAgICAg
IGNvb2xpbmctbGV2ZWxzID0gPDAgMTMwIDE3MCAyMzA+Owo+ICAgICAgICAgfTsKPgo+ICsgICAg
ICAgZ3B1OiBncHVAMTE4MDAwMDAgewo+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNh
bXN1bmcsZXh5bm9zLW1hbGkiLCAiYXJtLG1hbGktdDYyOCI7Cj4gKyAgICAgICAgICAgICAgIHJl
ZyA9IDwweDExODAwMDAwIDB4NTAwMD47Cj4gKyAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8
R0lDX1NQSSAyMTkgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8R0lDX1NQSSA3NCAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8R0lDX1NQSSAxMTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKyAg
ICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJqb2IiLCAibW11IiwgImdwdSI7Cj4gKyAg
ICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xvY2sgQ0xLX0czRD47Cj4gKyAgICAgICAgICAgICAg
IG1hbGktc3VwcGx5ID0gPCZidWNrNF9yZWc+Owo+ICsgICAgICAgICAgICAgICBvcGVyYXRpbmct
cG9pbnRzLXYyID0gPCZncHVfb3BwX3RhYmxlPjsKPiArICAgICAgIH07Cj4gKwo+ICsgICAgICAg
Z3B1X29wcF90YWJsZTogZ3B1LW9wcC10YWJsZSB7CgpOb3QgcmVhbGx5IGEgbmV3IHByb2JsZW0g
aW4gdGhpcyBmaWxlLCBidXQgeW91IGFyZSBtaXhpbmcgbm9kZXMgd2l0aAphbmQgd2l0aG91dCBh
biBhZGRyZXNzIGFuZCByZWFsbHkgdGhlIGdwdSBub2RlIHNob3VsZCBiZSB1bmRlciBhCnNpbXBs
ZS1idXMgbm9kZS4KCklmIHRoZSBPUFAgaXMgb25seSBmb3IgdGhlIEdQVSwgSSdkIG1ha2UgaXQg
YSBjaGlsZCBvZiB0aGUgZ3B1IG5vZGUgaW5zdGVhZC4KCj4gKyAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12MiI7Cj4gKwo+ICsgICAgICAgICAgICAgICBvcHAt
MTc3MDAwMDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBvcHAtaHogPSAvYml0cy8gNjQg
PDExNzAwMDAwMD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb3BwLW1pY3Jvdm9sdCA9IDw4
MTI1MDA+Owo+ICsgICAgICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAgICAgICAgb3BwLTYw
MDAwMDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb3BwLWh6ID0gL2JpdHMvIDY0IDw2
MDAwMDAwMDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIG9wcC1taWNyb3ZvbHQgPSA8MTE1
MDAwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+ICsKPiAgICAgICAgIHRo
ZXJtYWwtem9uZXMgewo+ICAgICAgICAgICAgICAgICBjcHUwX3RoZXJtYWw6IGNwdTAtdGhlcm1h
bCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdGhlcm1hbC1zZW5zb3JzID0gPCZ0bXVfY3B1
MCAwPjsKPiAtLQo+IDIuMjIuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
