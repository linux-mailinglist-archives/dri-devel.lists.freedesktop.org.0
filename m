Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF7D2B7058
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAD089BAE;
	Tue, 17 Nov 2020 20:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF6089BAE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:42:46 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f11so32026899lfs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L2XntWx1y1gpB2zza3sexbEVvLmMOFS8PQu3a25Ms+I=;
 b=WJypW+MHidKZaX64TWWzLmN6D07RxOwfKLvMUmMki4n6R9DuTk3yi7tRfOdJl/n4jx
 R/7T7OtppVTMUo5Bw5+NEZ1p+oqDhQOpEjVF2+sGPO42/Am/Y+X9Wy41MTZg4+awaMuZ
 +Ck/KOt01whYifxeNP9YyxwrAxJfAlmZyfxIn859V3X2+K/nvSivBAJKy8yRXadrxhxX
 81kAqDwKmDcedER8pf/GB8NKck15xAOOyQ072y//0MIzl1f+M+kYGj+07Eo0XnTG1711
 aXTYeWZ1yKHJtUxBXxokBge+JYcJDczwDoISNZ9e4FdaT4C1z8AhKU8FLN4MGI3zTIlu
 nnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L2XntWx1y1gpB2zza3sexbEVvLmMOFS8PQu3a25Ms+I=;
 b=JBrpdIZfQ/iyzJiIrjmqoeOwBZX7GtljF64rBNAm8TQgLy7ntDnMNSCgydMxeR/a4j
 +t1E6nykAYV753TQW8EcFLgripvpUpJWKhBUWbxDTZfb+NEZiEUk/7WNR1gpPFKWzjZ+
 8zYnMcLSTo0gBQXt/+6o2Ast1YXbo46cPacRXmLjd71OHiVFEfD+TG4nTFdKVQKvyFV7
 FF5/lqOYZAiewoQ85+bZO9pz9AHPAE9HLm+9LzE28SQbMKiC8qGJYiJ/49Jw2MF//hUI
 MVMyjvgKld9VND8573CWLDDYnqLoU66tNxq2pNdZyOsEPGBIeeuAgs4AWvX4L67ZG2IM
 kxyw==
X-Gm-Message-State: AOAM5316ZQ7NrvZlUvVn5dfRmMn17MP40jvG5qsCmwJTdNK5MXaMSTWj
 VNDNKSf7w+cZ9DWqpj9nchg02+5H09Pgv0gB7lAN7w==
X-Google-Smtp-Source: ABdhPJwCEFlugDpftC5aCbRFV58aiwRCbJbF7gyOc8c0nXAR58EkOd4ZGBwLbtPI/hao+2//l0/OetjMt0kKI3hEWWE=
X-Received: by 2002:a19:546:: with SMTP id 67mr2233621lff.502.1605645764854;
 Tue, 17 Nov 2020 12:42:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605635248.git.agx@sigxcpu.org>
 <a4930fb7a7464e4feedbdae993fe25080c8f5490.1605635248.git.agx@sigxcpu.org>
In-Reply-To: <a4930fb7a7464e4feedbdae993fe25080c8f5490.1605635248.git.agx@sigxcpu.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Nov 2020 21:42:33 +0100
Message-ID: <CACRpkdao_TMcpRsdK=7K5fNKJse0Bqwk58iWu0xsXdDNdcffVA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] dt-bindings: vendor-prefixes: Add ys vendor prefix
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgNjo0OSBQTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKCj4gQWRkIHByZWZpeCBmb3IgU2hlbnpoZW4gWWFzaGkgQ2hhbmdodWEg
SW50ZWxsaWdlbnQgVGVjaG5vbG9neSBDby4sIEx0ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWRv
IEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+IGluZGV4IGU0MGVlMzY5ZjgwOC4u
ZDBmM2FiZjJmMTJjIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+IEBAIC0xMjIwLDYgKzEyMjAsOCBAQCBw
YXR0ZXJuUHJvcGVydGllczoKPiAgICAgIGRlc2NyaXB0aW9uOiBTaGVuemhlbiBZYW5nbGltaW5n
IEVsZWN0cm9uaWMgVGVjaG5vbG9neSBDby4sIEx0ZC4KPiAgICAiXnluYSwuKiI6Cj4gICAgICBk
ZXNjcmlwdGlvbjogWVNIICYgQVRJTAo+ICsgICJeeXMsLioiOgo+ICsgICAgZGVzY3JpcHRpb246
IFNoZW56aGVuIFlhc2hpIENoYW5naHVhIEludGVsbGlnZW50IFRlY2hub2xvZ3kgQ28uLCBMdGQu
Cj4gICAgIl55b25lcy10b3B0ZWNoLC4qIjoKPiAgICAgIGRlc2NyaXB0aW9uOiBZb25lcyBUb3B0
ZWNoIENvLiwgTHRkLgo+ICAgICJeeXNvZnQsLioiOgoKSSB0aGluayB0aGlzIHNob3VsZCBiZSBp
biBhbHBoYWJldGljYWwgb3JkZXIgb2YgdGhlIGNvbXBhdGlibGUgc3RyaW5nLCBpLmUuCnVuZGVy
IHlvbmVzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
