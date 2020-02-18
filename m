Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1023163394
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 21:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEC989E63;
	Tue, 18 Feb 2020 20:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDE489E63
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 20:57:26 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id p14so11262715pfn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 12:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7G02odti0in1pq50CWlLcK4M4B/JV9odEsJqdHdLviE=;
 b=KHoVLGc755Nz6QKqLcJzGCgRBp+XXAiXHMpAaVBedqGguP4caPbh3yUqoHbxMMDRhZ
 LuCujhgxmDMzq2G+oZSoadDw/WHfbdzPUn4k34rX+Q0rOtxp/xSOCSg3mpURlTXk9jD4
 7PGYe7gsEODmAYge8vu4b3lJ/qUFPc/QDHc/GxtKJDkb70eWqZSa8lP1/mhQcmcSmSJa
 weLvEenZ0VJddUoUwme/2uDnrM2G0V43DED0oOQ97gdsf+DhXzmidMpXn2AJqC737cTG
 nBenUWs8zdSWxuUWWZJZNOTAr7rzVoM0Ek74SdvHtWJKvD1n/A83THFEAl/zMrsbaZmF
 DR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7G02odti0in1pq50CWlLcK4M4B/JV9odEsJqdHdLviE=;
 b=jlY5oF98PYkT4r9FO2HmyOxDgRTKN7Ga33CDFGD1WOo1Tzu1PmJm/Dtv+r2drMah8F
 5+5DzqsnvXPIe1+P5F4dV+BE0UXPV+UrvcIABG0OAcbfSM8Z63u6A2WmAg2MbA+RRAOi
 IGFE8Y123y/bhGdJ61B3hWjFfVoCFc84iw8u7J0s/rAY1n9T8lWzw3juJGl1SzuEJ7/x
 7UsHUuW44tojxI3hVvsQZtAhjmHcrJ8vqIuDlviZaGUZdqO6nQsXGYrLOZxpvhXoexP+
 JgU+NQ6mdnGqPOwPIKekMMmfDpHBRiLU/46SgoECmAYkqUFTau6UPxNmkTqbvUH9sV3Q
 ax4A==
X-Gm-Message-State: APjAAAXsfX0y256+XR9FG2WhsiJEDaL67sGUEMIwDbUB8YiAFOxgBzc8
 gHqwi68j5SBi+MbeNyn7rP3qg8S+hBsboxsNwEie1hWr+ac=
X-Google-Smtp-Source: APXvYqxl/xUw4Bt2Rq0VgN9BTwXuXH3FcqqjT11pvZykTUXjHtCX1r2J07POGReBKNUY6CQFRQxMEFp6g/kg8c3TWBQ=
X-Received: by 2002:a65:5242:: with SMTP id q2mr23952408pgp.74.1582059445708; 
 Tue, 18 Feb 2020 12:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20200216172117.49832-1-noralf@tronnes.org>
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Feb 2020 22:57:15 +0200
Message-ID: <CAHp75Vc6=V=cXM0mmh88V6XLmJT6kFnJCS547vgxX0zBG+cTZQ@mail.gmail.com>
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, USB <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBGZWIgMTYsIDIwMjAgYXQgNzozMCBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IEEgd2hpbGUgYmFjayBJIGhhZCB0aGUgaWRl
YSB0byB0dXJuIGEgUmFzcGJlcnJ5IFBpIFplcm8gaW50byBhICQ1Cj4gVVNCIHRvIEhETUkvU0RU
Vi9EU0kvRFBJIGRpc3BsYXkgYWRhcHRlci4KPgo+IFRoaW5raW5nIGFib3V0IGhvdyB0byByZXBy
ZXNlbnQgdGhlIGRpc3BsYXkgdG8gdGhlIGRyaXZlciBJIHJlYWxpc2VkCj4gdGhhdCBoYXJkd2Fy
ZSB1c2UgcmVnaXN0ZXJzIGFzIEFQSS4gQW5kIExpbnV4IGRvZXMgaGF2ZSBhIGdlbmVyaWMKPiBy
ZWdpc3RlciBhYnN0cmFjdGlvbjogcmVnbWFwLiBGdXJ0aGVybW9yZSB0aGlzIG1lYW5zIHRoYXQg
aWYgSSBjYW4gZG8gYQo+IHJlZ21hcCBvdmVyIFVTQiBpbXBsZW1lbnRhdGlvbiwgaXQgd2lsbCBi
ZSBlYXN5IHRvIGRvIG90aGVyIGZ1bmN0aW9ucwo+IGxpa2UgZ3BpbywgYWRjIGFuZCBvdGhlcnMu
IEFmdGVyIGEgZmV3IGl0ZXJhdGlvbnMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQKPiB0aGUgVVNCIHN1
YnN5c3RlbSBhbmQgc2F0aXNmeWluZyBkcml2ZXIgcmVxdWlyZW1lbnRzLCBJIG5vdyBoYXZlCj4g
c29tZXRoaW5nIHRoYXQgbG9va3MgcHJvbWlzaW5nLgo+Cj4gSSdtIHNlbmRpbmcgb3V0IGFuIGVh
cmx5IHZlcnNpb24gaG9waW5nIHRvIGdldCBmZWVkYmFjayBlc3BlY2lhbGx5IG9uCj4gdGhlIGNv
cmUgcGFydHMgdGhhdCBoYW5kbGVzIHJlZ21hcCBhbmQgaW50ZXJydXB0cy4KPgo+IE92ZXJ2aWV3
Ogo+Cj4gICAgICAgICAgIFVTQiBIb3N0ICAgICAgICAgIDogICAgICAgICBVU0IgRGV2aWNlCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDoKPiAgICAgICAgICAgICAtLS0tLS0tLS0tLS0t
LSAgOiAgLS0tLS0tLS0tLS0tLS0tLS0tCj4gLS0tLS0tLS0tLSAgfCBtZmQ6IG11ZCAgIHwgIDog
IHwgZl9tdWQgICAgICAgICAgfCAgLS0tLS0tLS0tLQo+IHwgRHJpdmVyIHwgIC0tLS0tLS0tLS0t
LS0tICA6ICB8ICAgICAgICAgICAgICAgIHwgIHwgRHJpdmVyIHwKPiAtLS0tLS0tLS0tICB8IHJl
Z21hcC11c2IgfCAgOiAgfCAobXVkX3JlZ21hcCkgICB8ICAtLS0tLS0tLS0tCj4gICAgICAgICAg
ICAgLS0tLS0tLS0tLS0tLS0gIDogIC0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4KPiBJJ3ZlIGF0dGFj
aGVkIDIgZHJpdmVyczoKPiAtIGdwaW8vcGluY3RybDogaXMgbW9yZSBvciBsZXNzIGZpbmlzaGVk
Cj4gLSBkaXNwbGF5OiBuZWVkcyBhIGxvdCBtb3JlIHdvcmsKCkNhbiByZWdtYXAtdXNiIGJlIHVz
ZWQgZm9yIGRyaXZlcnMvbWZkL2RsbjIuYyBmb3IgZXhhbXBsZT8KCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
