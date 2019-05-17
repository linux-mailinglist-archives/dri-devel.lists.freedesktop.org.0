Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF521F6B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 23:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9685E899B3;
	Fri, 17 May 2019 21:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD95899B3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 21:12:01 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F06F02087B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 21:12:00 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id f24so9610888qtk.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 14:12:00 -0700 (PDT)
X-Gm-Message-State: APjAAAX9TZZfaV2o5A1q38IpJJJT078hpuUXHa/6a9guOS3LjIqj1daG
 W9Uis+RiOh75bYIwNhrZxuedBS+eaJ/KPPg5Iw==
X-Google-Smtp-Source: APXvYqzPeJBGMQo9MUCbEz0jHdsw9NOoM2DjetgzWmPgzzxGJ8qADKNKR9tBGIvkgVO70RL7qVN1xMcR/sOzQTUX2sg=
X-Received: by 2002:a0c:8aad:: with SMTP id 42mr48279852qvv.200.1558127520194; 
 Fri, 17 May 2019 14:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-3-masneyb@onstation.org>
In-Reply-To: <20190424092505.6578-3-masneyb@onstation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 17 May 2019 16:11:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLdS2SDd-dczZmqDTN3XMY7fwDjdkX5OibXbrksd7qQYA@mail.gmail.com>
Message-ID: <CAL_JsqLdS2SDd-dczZmqDTN3XMY7fwDjdkX5OibXbrksd7qQYA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: backlight: add lm3630a bindings
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558127521;
 bh=Cr5kb3G7RGw3ztcggbHW6k8d8aqqY2Qosw+W4yl+edE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RVRGkAgCXj67cHasiMUZLXRu3M2Kh4X4/vTVb89qs8DinBil4+Da07NiNdjKUdeLK
 aGSnp46JC6AY0I6VZhc4Vbbsb3vb4bskHFwO5oSfH+mBG33XwYktUW9GiFJVR9TEnE
 GcSTKqn2no2O+tAuRzygt+Jwd0AXGMVeSqe/zaNU=
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgNDoyNSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBBZGQgbmV3IGJhY2tsaWdodCBiaW5kaW5ncyBmb3IgdGhl
IFRJIExNMzYzMEEgZHVhbC1zdHJpbmcgd2hpdGUgTEVELgo+Cj4gU2lnbmVkLW9mZi1ieTogQnJp
YW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2NToKPiAtIENoYW5n
ZSAnbG0zNjMwYV9ibEAzOCcgaW4gZXhhbXBsZXMgdG8gJ2xlZC1jb250cm9sbGVyQDM4Jwo+Cj4g
Q2hhbmdlcyBzaW5jZSB2NDoKPiAtIERyb3AgJHJlZiBmcm9tIGxlZC1zb3VyY2VzCj4gLSBEcm9w
IGRlc2NyaXB0aW9uIGZyb20gcmVnIG9mIGkyYyBhZGRyZXNzCj4gLSBFeHBhbmQgZGVzY3JpcHRp
b24gb2YgcmVnIGZvciB0aGUgY29udHJvbCBiYW5rCj4gLSBEcm9wIHN0YXR1cyBmcm9tIGV4YW1w
bGVzCj4KPiBDaGFuZ2VzIHNpbmNlIHYzOgo+IC0gQWRkIGxhYmVsLiBJIGRpZG4ndCBhZGQgYSBk
ZXNjcmlwdGlvbiBmb3IgaXQgc2luY2UgdGhhdCdsbCBjb21lIGZyb20KPiAgIHRoZSBjb21tb24g
cHJvcGVydGllcyBvbmNlIGl0cyBjb252ZXJ0ZWQuCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+IC0g
VXBkYXRlIGRlc2NyaXB0aW9uIG9mIG1heC1icmlnaHRuZXNzCj4gLSBBZGQgZGVzY3JpcHRpb24g
Zm9yIHJlZwo+IC0gQ29ycmVjdCB0eXBvOiBzL3RyYW5pc2l0b24vdHJhbnNpdGlvbgo+IC0gYWRk
IHJlZyB0byBjb250cm9sIGJhbmtzCj4gLSBhZGQgYWRkaXRpb25hbFByb3BlcnRpZXMKPgo+ICAu
Li4vbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCAgICAgfCAxMjkgKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKCkknbSB3b3JraW5nIG9uIGdldHRpbmcgdGhl
IGV4YW1wbGVzIHRvIGJlIHZhbGlkYXRlZCBieSB0aGUgc2NoZW1hIChpbgphZGRpdGlvbiB0byBq
dXN0IGJ1aWxkaW5nIHdpdGggZHRjKSBhbmQgdGhlcmUncyBhIGNvdXBsZSBvZiBlcnJvcnM6CgpE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1i
YWNrbGlnaHQuZXhhbXBsZS5kdC55YW1sOgonI2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2VsbHMn
IGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6CidebGVkQFswMV0kJywgJ3BpbmN0cmwt
WzAtOV0rJwpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQv
bG0zNjMwYS1iYWNrbGlnaHQuZXhhbXBsZS5kdC55YW1sOgonI2FkZHJlc3MtY2VsbHMnLCAnI3Np
emUtY2VsbHMnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6CidebGVkQFswMV0kJywg
J3BpbmN0cmwtWzAtOV0rJwoKWW91IGRpZG4ndCBsaXN0ICcjYWRkcmVzcy1jZWxscycgYW5kICcj
c2l6ZS1jZWxscycuCgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQuZXhhbXBsZS5kdC55YW1sOgpsZWRAMDogJ3RpLGxpbmVh
ci1tYXBwaW5nLW1vZGUnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczoKJ3BpbmN0
cmwtWzAtOV0rJwpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGln
aHQvbG0zNjMwYS1iYWNrbGlnaHQuZXhhbXBsZS5kdC55YW1sOgpsZWRAMTogJ3RpLGxpbmVhci1t
YXBwaW5nLW1vZGUnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczoKJ3BpbmN0cmwt
WzAtOV0rJwoKJ3RpLGxpbmVhci1tYXBwaW5nLW1vZGUnIGlzIG5vdCBkZWZpbmVkIGluIHRoZSBj
aGlsZCBub2Rlcy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
