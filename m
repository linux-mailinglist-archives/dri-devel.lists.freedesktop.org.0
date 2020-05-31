Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B11E949E
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 02:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8FB6E927;
	Sun, 31 May 2020 00:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8B26E927
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 00:08:34 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4374207BC
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590883714;
 bh=vPVMwMifj/bpMWbGPxUi+uNL+vBHSk9Nn5YsO2IKxxU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ye8Fo2mczopyLo1ob1diXWW16znwynBE+2PS8SYTdutOvrF6fUiiyZsJixjjlMzXJ
 XuuRfBeBELwzCQi63Xm7fLhI+BQgJUfT7Dvo/yFWzBKi+Tvc7eao+I2X8IPANwF/QQ
 ItZVnMjy7oOjV3O+C2cQB8U06NNjgT5XUonvKu2A=
Received: by mail-lf1-f45.google.com with SMTP id 82so1865775lfh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 17:08:33 -0700 (PDT)
X-Gm-Message-State: AOAM531xjePOavVgTF14Hj+w3kZ49ebc8vaZw9xpuQqZRZ8iwTBES7SE
 ofodD90a82gZj0930vWvSjmSdmBeauf3fzkOwjk=
X-Google-Smtp-Source: ABdhPJx30aOLCYD8rhRQWuNuFBNi6DG6GHiGFBCH1V8mZXSiFUlhvrP9bf+Ajogwaw5NyNDhtFnAPjOErTVI/7WeuYc=
X-Received: by 2002:a05:6512:691:: with SMTP id
 t17mr7982786lfe.85.1590883712070; 
 Sat, 30 May 2020 17:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200529163228eucas1p1d05340fef9ffc724f5d3d9f5709a600f@eucas1p1.samsung.com>
 <20200529163200.18031-1-s.nawrocki@samsung.com>
 <20200529163200.18031-6-s.nawrocki@samsung.com>
In-Reply-To: <20200529163200.18031-6-s.nawrocki@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 31 May 2020 09:07:55 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1Cin346tRz=+AH1x9QT=z0UGOvCC=NaAM9xLjGM2dHjg@mail.gmail.com>
Message-ID: <CAGTfZH1Cin346tRz=+AH1x9QT=z0UGOvCC=NaAM9xLjGM2dHjg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 5/6] ARM: dts: exynos: Add interconnects to
 Exynos4412 mixer
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3lsd2VzdGVyLAoKT24gU2F0LCBNYXkgMzAsIDIwMjAgYXQgMTozMyBBTSBTeWx3ZXN0ZXIg
TmF3cm9ja2kKPHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQXJ0dXIg
xZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGFuICdp
bnRlcmNvbm5lY3RzJyBwcm9wZXJ0eSB0byBFeHlub3M0NDEyIERUUyBpbiBvcmRlciB0bwo+IGRl
Y2xhcmUgdGhlIGludGVyY29ubmVjdCBwYXRoIHVzZWQgYnkgdGhlIG1peGVyLiBQbGVhc2Ugbm90
ZSB0aGF0IHRoZQo+ICdpbnRlcmNvbm5lY3QtbmFtZXMnIHByb3BlcnR5IGlzIG5vdCBuZWVkZWQg
d2hlbiB0aGVyZSBpcyBvbmx5IG9uZSBwYXRoIGluCj4gJ2ludGVyY29ubmVjdHMnLCBpbiB3aGlj
aCBjYXNlIGNhbGxpbmcgb2ZfaWNjX2dldCgpIHdpdGggYSBOVUxMIG5hbWUgc2ltcGx5Cj4gcmV0
dXJucyB0aGUgcmlnaHQgcGF0aC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxh
LnN3aWdvbkBzYW1zdW5nLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNo
b2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBmb3IgdjU6Cj4gIC0gbm9uZS4KPiAtLS0K
PiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIHwgMSArCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczQ0MTIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQo+IGluZGV4
IGE3NDk2ZDMuLmVlZTg2ZDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NDQxMi5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCj4gQEAg
LTc3Niw2ICs3NzYsNyBAQAo+ICAgICAgICAgY2xvY2stbmFtZXMgPSAibWl4ZXIiLCAiaGRtaSIs
ICJzY2xrX2hkbWkiLCAidnAiOwo+ICAgICAgICAgY2xvY2tzID0gPCZjbG9jayBDTEtfTUlYRVI+
LCA8JmNsb2NrIENMS19IRE1JPiwKPiAgICAgICAgICAgICAgICAgIDwmY2xvY2sgQ0xLX1NDTEtf
SERNST4sIDwmY2xvY2sgQ0xLX1ZQPjsKPiArICAgICAgIGludGVyY29ubmVjdHMgPSA8JmJ1c19k
aXNwbGF5ICZidXNfZG1jPjsKCkkgdGhpbmsgaXQgaXMgcmVhbGx5IGdvb2QgYW5kIG5lY2Vzc2Fy
eSBpbiBvcmRlciB0byBzdXBwb3J0IHRoZQptaW5pbXVtIGJhbmR3aWR0aC4KVW50aWwgbm93LCBJ
IGhhZCB0byBhZGQgdGhlIGFkZGl0aW9uYWwgY29kZSB0byBzdXBwb3J0IGZvciB0aGlzIHNhbWUg
cHVycG9zZQppbnRvIHByb2R1Y3QgY29kZS4KClJldmlld2VkLWJ5OiBDaGFud29vIENob2kgPGN3
MDAuY2hvaUBzYW1zdW5nLmNvbT4KCi0tIApCZXN0IFJlZ2FyZHMsCkNoYW53b28gQ2hvaQpTYW1z
dW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
