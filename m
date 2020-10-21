Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F5C295150
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 19:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358796E158;
	Wed, 21 Oct 2020 17:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23626E158
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:07:17 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 202182242E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603300037;
 bh=cmX/YO3xz5pAF8CH4Yv2e+wNRl4pkQd8JHkdyLyXh1A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uul/3MRW1yCz1Mj6OHpN7L03VExvPsGkMsRM10hBPxslr6UgE2cIwbYwiJ6/srP9X
 eIJ0xDyWl5glw48AD5rG8IcPylxHA8AD7VQGdMeYPeEsPhfUYA6gLMq2yle8ZFkl1F
 +ZxctGWTnlfLf3f94y4EC0kzdcu+cJao5JZ8m0r0=
Received: by mail-ej1-f43.google.com with SMTP id c15so3211556ejs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 10:07:17 -0700 (PDT)
X-Gm-Message-State: AOAM532hdAMlRDkLy2SZn22pNf/QGmdRo/811uxAd6ZZ+9nflch4XKwq
 TybMVUcsgDBDLABqvCgEmOx7sBs1yscf79BrSQ==
X-Google-Smtp-Source: ABdhPJzkI1tdwAjD8c04bQdTDw9wZakzcNHkiciym4rO8nnPUMoynFasWgKThhVCIRKLRPIRtHqBKCELzLsq4X0lGu8=
X-Received: by 2002:a17:906:95d1:: with SMTP id
 n17mr4668586ejy.75.1603300035519; 
 Wed, 21 Oct 2020 10:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-5-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-5-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 01:07:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
Message-ID: <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/mediatek: dsi: add pdata variable to start clk in
 HS mode
To: Fabien Parent <fparent@baylibre.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IE9uIE1UODE2Nywg
RFNJIHNlZW1zIHRvIHdvcmsgZmluZSBvbmx5IGlmIHdlIHN0YXJ0IHRoZSBjbGsgaW4gSFMgbW9k
ZS4KPiBJZiB3ZSBkb24ndCBzdGFydCB0aGUgY2xrIGluIEhTIGJ1dCB0cnkgdG8gc3dpdGNoIGxh
dGVyIHRvIEhTLCB0aGUKPiBkaXNwbGF5IGRvZXMgbm90IHdvcmsuCj4KPiBUaGlzIGNvbW1pdCBh
ZGRzIGEgcGxhdGZvcm0gZGF0YSB2YXJpYWJsZSB0byBiZSB1c2VkIHRvIHN0YXJ0IHRoZQo+IERT
SSBjbGsgaW4gSFMgbW9kZSBhdCBwb3dlciBvbi4KClRoaXMgcGF0Y2ggbG9va3MgbGlrZSBhIGhh
Y2sgcGF0Y2guIElmIHlvdSBjb3dvcmsgd2l0aCBNZWRpYXRlaywKcGxlYXNlIGZpbmQgb3V0IHRo
ZSBjb3JyZWN0IHNvbHV0aW9uIG9yIGdpdmUgYSByZWFzb25hYmxlIGV4cGxhbmF0aW9uLgpJZiB5
b3UgY291bGQgbm90IGdldCBoZWxwIGZyb20gTWVkaWF0ZWssIEkgd291bGQgd2FpdCBmb3IgY29t
bWVudCBvbgp0aGlzIHBhdGNoLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYwo+IGluZGV4IDRhMTg4YTk0MmMzOC4uNDYxNjQzYzA1Njg5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTE3NSw2ICsxNzUsNyBAQCBzdHJ1Y3QgbXRrX2RzaV9k
cml2ZXJfZGF0YSB7Cj4gICAgICAgICBjb25zdCB1MzIgcmVnX2NtZHFfb2ZmOwo+ICAgICAgICAg
Ym9vbCBoYXNfc2hhZG93X2N0bDsKPiAgICAgICAgIGJvb2wgaGFzX3NpemVfY3RsOwo+ICsgICAg
ICAgYm9vbCB1c2VfaHNfb25fcG93ZXJfb247Cj4gIH07Cj4KPiAgc3RydWN0IG10a19kc2kgewo+
IEBAIC02NzEsNyArNjcyLDcgQEAgc3RhdGljIGludCBtdGtfZHNpX3Bvd2Vyb24oc3RydWN0IG10
a19kc2kgKmRzaSkKPgo+ICAgICAgICAgbXRrX2RzaV9jbGtfdWxwX21vZGVfbGVhdmUoZHNpKTsK
PiAgICAgICAgIG10a19kc2lfbGFuZTBfdWxwX21vZGVfbGVhdmUoZHNpKTsKPiAtICAgICAgIG10
a19kc2lfY2xrX2hzX21vZGUoZHNpLCAwKTsKPiArICAgICAgIG10a19kc2lfY2xrX2hzX21vZGUo
ZHNpLCAhIWRzaS0+ZHJpdmVyX2RhdGEtPnVzZV9oc19vbl9wb3dlcl9vbik7Cj4KPiAgICAgICAg
IHJldHVybiAwOwo+ICBlcnJfZGlzYWJsZV9lbmdpbmVfY2xrOgo+IC0tCj4gMi4yOC4wCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
