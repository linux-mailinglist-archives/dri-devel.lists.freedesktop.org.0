Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947B48561
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477FF89272;
	Mon, 17 Jun 2019 14:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D1289272;
 Mon, 17 Jun 2019 14:30:00 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD983217D4;
 Mon, 17 Jun 2019 14:30:00 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id y57so10947465qtk.4;
 Mon, 17 Jun 2019 07:30:00 -0700 (PDT)
X-Gm-Message-State: APjAAAXciFVAsy5r57eGRC2G8I2zN0x0Oqd9DMqzLjxaIgGRGkKCl46J
 CFzdTsxcEMYBsnX0OzFEMr3zUEW0rXXpUH4+iw==
X-Google-Smtp-Source: APXvYqyASK26LQzwRomt6iiD2y9sCFeTHLV/m8OIpqVyW9ojtFBBNp5iBGmT/mAjUDht+/goKLmPF8B9/cU/9xrQDis=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr22338717qvc.39.1560781799779; 
 Mon, 17 Jun 2019 07:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-2-masneyb@onstation.org>
In-Reply-To: <20190616132930.6942-2-masneyb@onstation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 17 Jun 2019 08:29:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ0y7_RPs-qK4thVen6nUVdFbikcwsmmun9tHsVSccQag@mail.gmail.com>
Message-ID: <CAL_JsqJ0y7_RPs-qK4thVen6nUVdFbikcwsmmun9tHsVSccQag@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560781800;
 bh=qDifSuqcxzKT2mPFaeywjNnbb7wpS1XjMQUY4VjP95s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ftWeEUcZLQyXIz69qGsxcV2k+8X5HWs0TvIl0HUP/iGfydDi7z72q5tq23j5gcIMU
 gBI4ri54fv5RFQCp50ZhqEflChHkcPdy3qDEZtZrLVD59ElSh6jFwgHv9QKP6e8Cbs
 g7a2mHo9VpiDU/ajh1Oe0Bhtk9F5EGJffhgeVVNY=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgNzoyOSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBP
biBDaGlwIE1lbW9yeSAoT0NNRU0pIHRoYXQgaXMgcHJlc2VudAo+IG9uIHNvbWUgUXVhbGNvbW0g
U25hcGRyYWdvbiBTb0NzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVt
LnlhbWwgICAgICAgICB8IDY2ICsrKysrKysrKysrKysrKysrKysKCi4uLi9iaW5kaW5ncy9zcmFt
LwoKPiAgMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVt
LnlhbWwKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c29jL3Fjb20vcWNvbSxvY21lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NvYy9xY29tL3Fjb20sb2NtZW0ueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi41ZTNhZTYzMTFhMTYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9xY29tL3Fjb20sb2NtZW0ueWFtbAo+
IEBAIC0wLDAgKzEsNjYgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAg
T1IgQlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvc29jL3Fjb20vcWNvbSxvY21lbS55YW1sIwoKc2NoZW1hcy9zcmFt
LwoKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCj4gKwo+ICt0aXRsZTogT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0aGF0IGlzIHByZXNlbnQg
b24gc29tZSBRdWFsY29tbSBTbmFwZHJhZ29uIFNvQ3MuCj4gKwo+ICttYWludGFpbmVyczoKPiAr
ICAtIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+ICsKPiArZGVzY3JpcHRp
b246IHwKPiArICBUaGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSBhbGxvY2F0b3IgYWxsb3dzIHZh
cmlvdXMgY2xpZW50cyB0byBhbGxvY2F0ZSBtZW1vcnkKCklzIHRoZXJlIHNvbWV0aGluZyBpbiB0
aGUgaC93IHRoYXQncyBhbiBhbGxvY2F0b3I/IFRoYXQncyB0eXBpY2FsbHkgYQpzL3cgdGhpbmcg
dGhhdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIGgvdyBkZXNjcmlwdGlvbi4KCj4gKyAgZnJvbSBP
Q01FTSBiYXNlZCBvbiBwZXJmb3JtYW5jZSwgbGF0ZW5jeSBhbmQgcG93ZXIgcmVxdWlyZW1lbnRz
LiBUaGlzIGlzCj4gKyAgdHlwaWNhbGx5IHVzZWQgYnkgdGhlIEdQVSwgY2FtZXJhL3ZpZGVvLCBh
bmQgYXVkaW8gY29tcG9uZW50cyBvbiBzb21lCj4gKyAgU25hcGRyYWdvbiBTb0NzLgo+ICsKPiAr
cHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IHFjb20sb2NtZW0tbXNt
ODk3NAoKV2hhdCBCam9ybiBzYWlkLi4uCgo+ICsKPiArICByZWc6Cj4gKyAgICBpdGVtczoKPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogQ29udHJvbCByZWdpc3RlcnMKPiArICAgICAgLSBkZXNjcmlw
dGlvbjogT0NNRU0gYWRkcmVzcyByYW5nZQo+ICsKPiArICByZWctbmFtZXM6Cj4gKyAgICBpdGVt
czoKPiArICAgICAgLSBjb25zdDogb2NtZW1fY3RybF9waHlzaWNhbAo+ICsgICAgICAtIGNvbnN0
OiBvY21lbV9waHlzaWNhbAoKJ2N0cmwnIGFuZCAnbWVtJyB3b3VsZCBiZSBzdWZmaWNpZW50LgoK
PiArCj4gKyAgY2xvY2tzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IENv
cmUgY2xvY2sKPiArICAgICAgLSBkZXNjcmlwdGlvbjogSW50ZXJmYWNlIGNsb2NrCj4gKwo+ICsg
IGNsb2NrLW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IGNvcmUKPiArICAg
ICAgLSBjb25zdDogaWZhY2UKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsg
IC0gcmVnCj4gKyAgLSByZWctbmFtZXMKPiArICAtIGNsb2Nrcwo+ICsgIC0gY2xvY2stbmFtZXMK
PiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svcWNvbSxycG1jYy5oPgo+ICsgICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
cWNvbSxtbWNjLW1zbTg5NzQuaD4KPiArCj4gKyAgICAgIG9jbWVtOiBvY21lbUBmZGQwMDAwMCB7
Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJxY29tLG9jbWVtLW1zbTg5NzQiOwo+ICsKPiArICAg
ICAgICByZWcgPSA8MHhmZGQwMDAwMCAweDIwMDA+LAo+ICsgICAgICAgICAgICAgICA8MHhmZWMw
MDAwMCAweDE4MDAwMD47Cj4gKyAgICAgICAgcmVnLW5hbWVzID0gIm9jbWVtX2N0cmxfcGh5c2lj
YWwiLAo+ICsgICAgICAgICAgICAgICAgICAgICJvY21lbV9waHlzaWNhbCI7Cj4gKwo+ICsgICAg
ICAgIGNsb2NrcyA9IDwmcnBtY2MgUlBNX1NNRF9PQ01FTUdYX0NMSz4sCj4gKyAgICAgICAgICAg
ICAgICAgIDwmbW1jYyBPQ01FTUNYX09DTUVNTk9DX0NMSz47Cj4gKyAgICAgICAgY2xvY2stbmFt
ZXMgPSAiY29yZSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAiaWZhY2UiOwo+ICsgICAgICB9
Owo+IC0tCj4gMi4yMC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
