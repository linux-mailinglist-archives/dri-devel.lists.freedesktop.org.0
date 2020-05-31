Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E41E9499
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 02:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387906E0D5;
	Sun, 31 May 2020 00:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FD989991
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 00:02:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8CF120776
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 00:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590883371;
 bh=4kQfV8Z5NM+yv61ENjp90Sn1Rp/tfJj+VqnQHQ+4R9U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=12M1Hve3RHexJsmswOs0TlhMFJARWj0+2NznHPBBm83jla4rExldF3IvR1HOx1JGF
 r16MrMY789R0ouRaSPystO3TUEtxcisQrWmXo5EpDSfQ4b7bhFNTCJp1LAKXrv3QIL
 u90JT/e+vl3cRcehJnN74mErRNLD+GKBUtaQRjk4=
Received: by mail-lj1-f175.google.com with SMTP id e4so3751364ljn.4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 17:02:50 -0700 (PDT)
X-Gm-Message-State: AOAM530Nbt982zdZbroZsbnBfk8r5n3UTTt6Fx4dXo0YeBDP60Q9+bM6
 DM5Akl/zNhew0qTOLD33iVpqX6NfDQxZcg97R3w=
X-Google-Smtp-Source: ABdhPJy+whAFBYV/fP7KNi+oY3T4bic8rdTdkffy4fJ20iLO1POc6g0O/PC7z3+uiuU/GjVeqLatWylwfkZl4RfapeQ=
X-Received: by 2002:a05:651c:1130:: with SMTP id
 e16mr7569379ljo.10.1590883369324; 
 Sat, 30 May 2020 17:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200529163226eucas1p15bea74bed9cc5d22727c9ba732a5cbb9@eucas1p1.samsung.com>
 <20200529163200.18031-1-s.nawrocki@samsung.com>
 <20200529163200.18031-5-s.nawrocki@samsung.com>
In-Reply-To: <20200529163200.18031-5-s.nawrocki@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 31 May 2020 09:02:13 +0900
X-Gmail-Original-Message-ID: <CAGTfZH0wdAdEFJ74USv62MXxs=Ytx0g_pFNG4B9DpUnNqDcY7w@mail.gmail.com>
Message-ID: <CAGTfZH0wdAdEFJ74USv62MXxs=Ytx0g_pFNG4B9DpUnNqDcY7w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 4/6] ARM: dts: exynos: Add interconnect properties
 to Exynos4412 bus nodes
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
TmF3cm9ja2kKPHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBh
ZGRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBmb3IgRXh5bm9zNDQxMiBpbnRlcmNvbm5lY3QK
PiBidXMgbm9kZXM6Cj4gIC0gc2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFyZW50OiB0byBkZWNsYXJl
IGNvbm5lY3Rpb25zIGJldHdlZW4KPiAgICBub2RlcyBpbiBvcmRlciB0byBndWFyYW50ZWUgUE0g
UW9TIHJlcXVpcmVtZW50cyBiZXR3ZWVuIG5vZGVzOwo+ICAtICNpbnRlcmNvbm5lY3QtY2VsbHM6
IHJlcXVpcmVkIGJ5IHRoZSBpbnRlcmNvbm5lY3QgZnJhbWV3b3JrLgo+Cj4gTm90ZSB0aGF0ICNp
bnRlcmNvbm5lY3QtY2VsbHMgaXMgYWx3YXlzIHplcm8gYW5kIG5vZGUgSURzIGFyZSBub3QKPiBo
YXJkY29kZWQgYW55d2hlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5z
d2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxz
Lm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgZm9yIHY1Ogo+ICAtIGFkanVz
dCB0byByZW5hbWVkIGV4eW5vcyxpbnRlcmNvbm5lY3QtcGFyZW50LW5vZGUgcHJvcGVydHksCj4g
IC0gYWRkIHByb3BlcnRpZXMgaW4gY29tbW9uIGV4eW5vczQ0MTIuZHRzaSBmaWxlIHJhdGhlciB0
aGFuCj4gICAgaW4gT2Ryb2lkIHNwZWNpZmljIG9kcm9pZDQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNp
Lgo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgfCA1ICsrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEy
LmR0c2kKPiBpbmRleCA0ODg2ODk0Li5hNzQ5NmQzIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczQ0MTIuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0
MTIuZHRzaQo+IEBAIC0zODEsNiArMzgxLDcgQEAKPiAgICAgICAgICAgICAgICAgICAgICAgICBj
bG9ja3MgPSA8JmNsb2NrIENMS19ESVZfRE1DPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBj
bG9jay1uYW1lcyA9ICJidXMiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIG9wZXJhdGluZy1w
b2ludHMtdjIgPSA8JmJ1c19kbWNfb3BwX3RhYmxlPjsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAgICAgICAgICAgICAgIH07Cj4KPiBAQCAtNDUwLDYgKzQ1
MSw4IEBACj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbG9jayBDTEtfRElW
X0dETD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfbGVmdGJ1
c19vcHBfdGFibGU+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNhbXN1bmcsaW50ZXJjb25u
ZWN0LXBhcmVudCA9IDwmYnVzX2RtYz47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI2ludGVy
Y29ubmVjdC1jZWxscyA9IDwwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
ZGlzYWJsZWQiOwo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gQEAgLTQ2Niw2ICs0NjksOCBAQAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xvY2sgQ0xLX0FDTEsxNjA+Owo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImJ1cyI7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2Rpc3BsYXlfb3BwX3Rh
YmxlPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJl
bnQgPSA8JmJ1c19sZWZ0YnVzPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAjaW50ZXJjb25u
ZWN0LWNlbGxzID0gPDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7Cj4gICAgICAgICAgICAgICAgIH07Cj4KPiAtLQo+IDIuNy40Cj4KClJldmlld2VkLWJ5
OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KCi0tIApCZXN0IFJlZ2FyZHMs
CkNoYW53b28gQ2hvaQpTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
