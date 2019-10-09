Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62BD057F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 04:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F103C6E288;
	Wed,  9 Oct 2019 02:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6306E288;
 Wed,  9 Oct 2019 02:25:35 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD6C62070B;
 Wed,  9 Oct 2019 02:25:34 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20191007014509.25180-6-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-6-masneyb@onstation.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <masneyb@onstation.org>, robdclark@gmail.com, sean@poorly.run
Subject: Re: [PATCH RFC v2 5/5] ARM: dts: qcom: msm8974-hammerhead: add
 support for external display
User-Agent: alot/0.8.1
Date: Tue, 08 Oct 2019 19:25:33 -0700
Message-Id: <20191009022534.BD6C62070B@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570587934;
 bh=/QrBYB469HZKoP2i/Ui/nDSLpglSMZz/YjFahCD1rJ8=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=i2KzweRXVvxB7h86Tlqn50OZGHqsVOrbbZwc36eE86FnOw8DMeoKQcaMRO0hOv2VO
 uQDjjQWyoKv9boVcqw6DR4nCX6k/FhqApJk2KWhw0FYDFxeONL0xXEoa3ULHmNbx0c
 kk4xAGf4rGLx76mitQjqpjP8IrWrEJI7uA0YjrCo=
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
Cc: jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Laurent.pinchart@ideasonboard.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmlhbiBNYXNuZXkgKDIwMTktMTAtMDYgMTg6NDU6MDkpCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1LWhhbW1lcmhlYWQuZHRz
IGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5k
dHMKPiBpbmRleCBiNjA3YzlmZjllMTIuLjM4MGE4MDVjZDFmMCAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQtbGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cwo+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1LWhhbW1lcmhlYWQu
ZHRzCj4gQEAgLTM3MSw2ICs0MDEsNDAgQEAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZ1bmN0aW9uID0gImdwaW8iOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gICAg
ICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICBoZG1pX3BpbjogaGRtaSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY2VjIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBpbnMgPSAiZ3BpbzMxIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZ1bmN0aW9uID0gImhkbWlfY2VjIjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsK
PiArICAgICAgICAgICAgICAgICAgICAgICBkZGMgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGlucyA9ICJncGlvMzIiLCAiZ3BpbzMzIjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZ1bmN0aW9uID0gImhkbWlfZGRjIjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICB9Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBocGQgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGlucyA9ICJncGlvMzQiOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiaGRtaV9ocGQiOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICBhbnhf
bXNtX3BpbjogYW54IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpcnEgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGlucyA9ICJncGlvMjgiOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiZ3BpbyI7CgpJcyBmdW5jdGlvbiA9ICJncGlv
IiBuZWNlc3NhcnkgYW55bW9yZT8gSSB0aG91Z2h0IHdlIHdvdWxkIHR1cm4gZ3Bpb3MKaW50byBn
cGlvIGZ1bmN0aW9uIHdoZW4gaXQncyByZXF1ZXN0ZWQgYXMgYSBncGlvIGJ5IHNvbWUgY29uc3Vt
ZXIuCgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGggPSA8
OD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaWFzLXB1bGwtdXA7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnB1dC1lbmFibGU7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXQgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlucyA9ICJncGlvNjgiOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiZ3BpbyI7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aCA9IDw4PjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJpYXMtcHVsbC11cDsKPiArICAgICAgICAgICAgICAgICAgICAg
ICB9Owo+ICsgICAgICAgICAgICAgICB9Owo+ICAgICAgICAgfTsKPiAgCj4gICAgICAgICB2aWJy
YXRvckBmZDhjMzQ1MCB7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
