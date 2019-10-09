Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13266D0577
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 04:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4F66E265;
	Wed,  9 Oct 2019 02:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3096E265;
 Wed,  9 Oct 2019 02:21:31 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 604B52070B;
 Wed,  9 Oct 2019 02:21:31 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20191007014509.25180-5-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-5-masneyb@onstation.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <masneyb@onstation.org>, robdclark@gmail.com, sean@poorly.run
Subject: Re: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
User-Agent: alot/0.8.1
Date: Tue, 08 Oct 2019 19:21:30 -0700
Message-Id: <20191009022131.604B52070B@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570587691;
 bh=nMNSf4SkgYrb/+7JppaBIkcTEZnYKwpyA7Gyu248r6w=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=gtCZh39eBGlRFQ3ffq9ktD/1ZheW3g4mpVrLq3qaLhxsSe8w1xcOB5mAR7B/Oucq+
 tMPNHCg4Y6OG0SqTVoT9IzMYGSUQBRif2VQ3/8xkA7c6rcJ0RQ7GPNnE95w0wTxTdV
 4aqQGyh6WFOhf7OgIdPROgEg8bVHAzf5PELerJZw=
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

UXVvdGluZyBCcmlhbiBNYXNuZXkgKDIwMTktMTAtMDYgMTg6NDU6MDgpCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMv
cWNvbS1tc204OTc0LmR0c2kKPiBpbmRleCA3ZmMyM2U0MjJjYzUuLmFmMDJlYWNlMTRlMiAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpCj4gQEAgLTEzMzUsNiArMTM0Miw3NyBA
QAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZtbWNjIE1EU1Nf
QUhCX0NMSz47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9
ICJpZmFjZSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaGRtaTogaGRtaS10eEBmZDkyMjEwMCB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicWNvbSxoZG1pLXR4LTg5NzQiOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4ZmQ5MjIxMDAgMHgzNWM+LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4ZmM0YjgwMDAgMHg2MGYwPjsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJjb3JlX3BoeXNp
Y2FsIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJxZnBy
b21fcGh5c2ljYWwiOwoKSXMgdGhpcyB0aGUgcWZwcm9tICJ1bmNvcnJlY3RlZCIgcGh5c2ljYWwg
YWRkcmVzcz8gSWYgc28sIHdoeSBjYW4ndCB0aGlzCm5vZGUgdXNlIGFuIG52bWVtIHRvIHJlYWQg
d2hhdGV2ZXIgaXQgbmVlZHMgb3V0IG9mIHRoZSBxZnByb20/Cgo+ICsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8Jm1kc3M+Owo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDw4IElSUV9UWVBFX0xFVkVMX0hJ
R0g+Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMg
PSA8Jm1tY2MgTURTU19HRFNDPjsKPiArCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
