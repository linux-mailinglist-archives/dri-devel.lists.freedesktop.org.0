Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645149D1F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 11:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359CC6E120;
	Tue, 18 Jun 2019 09:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9C6E120
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 09:27:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6757B2084B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 09:27:11 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id x25so2773026ljh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 02:27:11 -0700 (PDT)
X-Gm-Message-State: APjAAAUENdie+AF6DpE0zblalU/udEQDeAyD2RJ7WKgC7QZ7KfEbbAIN
 EAnkE72C9S3wejrgHf7y5VAtHURQ03PP+Jw7IcY=
X-Google-Smtp-Source: APXvYqzv7Gbmd6Xf/1K1px/rY6lBV7NSaMJUwamp2eOU1O40f6wjgppWFyx9CidnmsTWpf06LGliW+GVZtXWpi54Tbo=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr10481642ljg.80.1560850029693; 
 Tue, 18 Jun 2019 02:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
In-Reply-To: <20190614235719.8134-1-joseph.kogut@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 18 Jun 2019 11:26:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
Message-ID: <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560850031;
 bh=3d0WB2FWSq617HwBgtInbOFcIijY2d0ifcR6Ea00qN8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ImqAUIsomz+S+K3RJ1At8naHxBQ5VKVZ7zN2BeD/fqyI+PN1PHJnllocUrPWLqL9R
 4RJoVrM+vEJSIBAnQ89brETmsQokQSFSKDVLkqSdOszPh70zYhR+Ki5IN1H8jvO2tV
 LgI2Q6sdVSP+1oDmThdaHW4dcWzk0NYRSuQd/mvA=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 kgene@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxNSBKdW4gMjAxOSBhdCAwMTo1NywgSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRA
Z21haWwuY29tPiB3cm90ZToKPgo+IEFkZCBkZXZpY2UgdHJlZSBub2RlIGZvciBtYWxpIGdwdSBv
biBPZHJvaWQgWFUzIFNvQ3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2Vw
aC5rb2d1dEBnbWFpbC5jb20+Cj4gLS0tCj4KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+IC0gVXNlIGlu
dGVycnVwdCBuYW1lIG9yZGVyaW5nIGZyb20gYmluZGluZyBkb2MKPiAtIFNwZWNpZnkgYSBzaW5n
bGUgY2xvY2sgZm9yIEdQVSBub2RlCj4gLSBBZGQgZ3B1IG9wcCB0YWJsZQo+IC0gRml4IHdhcm5p
bmdzIGZyb20gSVJRX1RZUEVfTk9ORQo+Cj4gIC4uLi9ib290L2R0cy9leHlub3M1NDIyLW9kcm9p
ZHh1My1jb21tb24uZHRzaSB8IDI2ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9l
eHlub3M1NDIyLW9kcm9pZHh1My1jb21tb24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCj4gaW5kZXggOTNhNDhmMmRkYTQ5Li5iOGE0MjQ2
ZTNiMzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4
dTMtY29tbW9uLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9kcm9p
ZHh1My1jb21tb24uZHRzaQo+IEBAIC00OCw2ICs0OCwzMiBAQAo+ICAgICAgICAgICAgICAgICBj
b29saW5nLWxldmVscyA9IDwwIDEzMCAxNzAgMjMwPjsKPiAgICAgICAgIH07Cj4KPiArICAgICAg
IGdwdTogZ3B1QDExODAwMDAwIHsKPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzYW1z
dW5nLGV4eW5vcy1tYWxpIiwgImFybSxtYWxpLXQ2MjgiOwo+ICsgICAgICAgICAgICAgICByZWcg
PSA8MHgxMTgwMDAwMCAweDUwMDA+Owo+ICsgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMjE5IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPEdJQ19TUEkgNzQgIElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPEdJQ19TUEkgMTE3IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsgICAg
ICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiam9iIiwgIm1tdSIsICJncHUiOwo+ICsgICAg
ICAgICAgICAgICBjbG9ja3MgPSA8JmNsb2NrIENMS19HM0Q+Owo+ICsgICAgICAgICAgICAgICBt
YWxpLXN1cHBseSA9IDwmYnVjazRfcmVnPjsKPiArICAgICAgICAgICAgICAgb3BlcmF0aW5nLXBv
aW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47Cj4gKyAgICAgICB9Owo+ICsKPiArICAgICAgIGdw
dV9vcHBfdGFibGU6IGdwdS1vcHAtdGFibGUgewoKT25lIG1vcmUgdGhpbmcgLSB1c2UgIm9wcF90
YWJsZSIgYXMgbm9kZSBuYW1lIChnZW5lcmljIGNsYXNzIG9mIG5vZGUsCm1hdGNoZXMgc3R5bGUg
d2l0aCBvdGhlciB0YWJsZXMpLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCj4gKyAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12MiI7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBvcHAtMTc3MDAwMDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBvcHAtaHog
PSAvYml0cy8gNjQgPDExNzAwMDAwMD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb3BwLW1p
Y3Jvdm9sdCA9IDw4MTI1MDA+Owo+ICsgICAgICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAg
ICAgICAgb3BwLTYwMDAwMDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb3BwLWh6ID0g
L2JpdHMvIDY0IDw2MDAwMDAwMDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIG9wcC1taWNy
b3ZvbHQgPSA8MTE1MDAwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+ICsK
PiAgICAgICAgIHRoZXJtYWwtem9uZXMgewo+ICAgICAgICAgICAgICAgICBjcHUwX3RoZXJtYWw6
IGNwdTAtdGhlcm1hbCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdGhlcm1hbC1zZW5zb3Jz
ID0gPCZ0bXVfY3B1MCAwPjsKPiAtLQo+IDIuMjIuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
