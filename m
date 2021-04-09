Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A852435A8BF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 00:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF0E6E0D5;
	Fri,  9 Apr 2021 22:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3526E0AD
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 22:41:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2BF5611AF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618008109;
 bh=kPU9MHQc5UBpAesVzgChKDqg5ezVTH1zzx3kKya3lS4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mfx9Ja5QDAcDuMJ0cIxsWj13awopKAanMQQzk+uzyiLfl6TBS7Xqs4+NpUjdzNUXC
 75PSiAv+VD5ODnnyL39lVTG/vhDVaXwWJ2E0MfPoxNMEXd/N0TnLm4k9lkt64NNf+c
 l+Bp0I2AC9QSs6qF+l5MmOKKOQzpmgmRHEmYpoXr3s44mYSjUKF+Cn4+8eOQ1Tc7MH
 YxHaByhjSpZ1f/9UG1k29pR6Z97BaFBRBtxI6BVt1LKOcx7F7Doq5fplTZ2ViyigxG
 D5vBngsUX2T3QOTDzGuvJZ/Dn73CQymnFUi9V6PtdVkgqFfrulmeI1SzHSQA2h2jC2
 cadyrrYvXPmIg==
Received: by mail-ej1-f43.google.com with SMTP id u21so10971505ejo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 15:41:48 -0700 (PDT)
X-Gm-Message-State: AOAM532FeXXZbkf+KCHn4PkZ6qpCuJPmET1ZUX3Om6JCxEnTQ5bIQLzc
 kCUhUSg2sYbtQHkK6R0ZLqwmSiRspBambpKYtA==
X-Google-Smtp-Source: ABdhPJxHH2lrOdOuGA1wZAlZs2TRipft1zFc1O4kBSOWkcjad7ttw50P23oLD4EgsHthvgWENyhgcC/G8ZhZKbbGe4U=
X-Received: by 2002:a17:907:700d:: with SMTP id
 wr13mr18342403ejb.310.1618008107597; 
 Fri, 09 Apr 2021 15:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210409084308.481185-1-narmstrong@baylibre.com>
In-Reply-To: <20210409084308.481185-1-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 10 Apr 2021 06:41:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
Message-ID: <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm: mediatek: hdmi: check for valid modes on MT8167
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDnml6Ug6YCx5LqUIOS4i+WNiDQ6NDPlr6vpgZPvvJoKPgo+IE9uIE1UODE2Nywg
b25seSBDRUEgbW9kZXMgYW5kIGFueXRoaW5nIHVzaW5nIGEgY2xvY2sgYmVsb3cgMTQ4NTAwIGlz
Cj4gc3VwcG9ydGVkIGZvciBIRE1JLiBUaGlzIGNoYW5nZSBhZGRzIHNvbWUgY2hlY2tzIHRvIG1h
a2Ugc3VyZSB0aGUKPiB2aWRlbyBmb3JtYXQgaXMgT0sgZm9yIE1UODE2Ny4KCkkgdGhpbmsgdGhp
cyBwYXRjaCBzaG91bGQgYmUgc2VwYXJhdGVkIHRvIDMgcGF0Y2hlcy4gY2hlY2sgQ0VBIG1vZGUs
CmNoZWNrIGNsb2NrLCBhZGQgbXQ4MTY3IGhkbWkgc3VwcG9ydC4KCj4KPiBTaWduZWQtb2ZmLWJ5
OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBO
ZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jCj4gaW5kZXggOGVlNTVmOWUyOTU0Li45OTFlMmU5MzViOTMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0xNDgsNiArMTQ4LDggQEAgc3RydWN0IGhkbWlf
YXVkaW9fcGFyYW0gewo+Cj4gIHN0cnVjdCBtdGtfaGRtaV9jb25mIHsKPiAgICAgICAgIGJvb2wg
dHpfZGlzYWJsZWQ7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIG1heF9tb2RlX2Nsb2NrOwo+ICsg
ICAgICAgYm9vbCBjZWFfbW9kZXNfb25seTsKPiAgfTsKPgo+ICBzdHJ1Y3QgbXRrX2hkbWkgewo+
IEBAIC0xMjU5LDYgKzEyNjEsMTMgQEAgc3RhdGljIGludCBtdGtfaGRtaV9jb25uX21vZGVfdmFs
aWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm4sCj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIE1PREVfQkFEOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAoaGRtaS0+Y29uZi0+
Y2VhX21vZGVzX29ubHkgJiYgIWRybV9tYXRjaF9jZWFfbW9kZShtb2RlKSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIE1PREVfQkFEOwo+ICsKPiArICAgICAgIGlmIChoZG1pLT5jb25mLT5tYXhf
bW9kZV9jbG9jayAmJgo+ICsgICAgICAgICAgIG1vZGUtPmNsb2NrID4gaGRtaS0+Y29uZi0+bWF4
X21vZGVfY2xvY2spCj4gKyAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0hJR0g7Cj4g
Kwo+ICAgICAgICAgaWYgKG1vZGUtPmNsb2NrIDwgMjcwMDApCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBNT0RFX0NMT0NLX0xPVzsKPiAgICAgICAgIGlmIChtb2RlLT5jbG9jayA+IDI5NzAwMCkK
PiBAQCAtMTgxMCwxMCArMTgxOSwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19oZG1pX2Nv
bmYgbXRrX2hkbWlfY29uZl9tdDI3MDEgPSB7Cj4gICAgICAgICAudHpfZGlzYWJsZWQgPSB0cnVl
LAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2hkbWlfY29uZiBtdGtfaGRtaV9j
b25mX210ODE2NyA9IHsKPiArICAgICAgIC5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMCwKPiArICAg
ICAgIC5jZWFfbW9kZXNfb25seSA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX2hkbWlfb2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1oZG1pIiwKPiAgICAgICAgICAgLmRhdGEgPSAm
bXRrX2hkbWlfY29uZl9tdDI3MDEsCj4gICAgICAgICB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxNjctaGRtaSIsCgoibWVkaWF0ZWssbXQ4MTY3LWhkbWkiIGRvZXMg
bm90IGV4aXN0IGluIGJpbmRpbmcgZG9jdW1lbnQsIHNvIGFkZCB0aGlzCnRvIGJpbmRpbmcgZG9j
dW1lbnQgZmlyc3QuCkluIGFkZGl0aW9uLCBjb3VsZCB5b3UgYWxzbyB0cmFuc2ZlciBtZWRpYXRl
ayxoZG1pLnR4dCB0byB5YW1sIGZvcm1hdD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAg
ICAgICAuZGF0YSA9ICZtdGtfaGRtaV9jb25mX210ODE2NywKPiArICAgICAgIH0sCj4gICAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1oZG1pIiwKPiAgICAgICAgIH0sCj4g
ICAgICAgICB7fQo+IC0tCj4gMi4yNS4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
