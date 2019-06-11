Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE541CF4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA02892AD;
	Wed, 12 Jun 2019 06:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51FE891C3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:01:51 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h10so6317186ljg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26bbmtxXOJyY8N47HEW02fS/RJ36aAsn2edvgu3kR/Q=;
 b=cyvnnguSO8FW1+vM1NvoFd199MSIorrZG2sGwbAznMiHFPiP+b6uJpjS/eJZSzKurW
 6JrHmLs+D2I4QXdWNN0zHyDvEdBMD3d5JLHBXMrELFIBALsgVejz+JoUhtQz0lyphGzH
 YsLfbxbZCwj5kXKDEb97yHBCeFqcsXpBmt3kzWH1yUbWAOkaYem0VEuQbc9uUy2qxPjA
 cFRLHk0xFlP4iP6FX2zl4R5Qnpu+RRENE+Mz/+0SOF3TNqXPGxcWCAHkc0sYY15Q1F44
 s+zlneif/PYet50LEjopVWKCXut/ujF3bdqaLk6LDHf0wZL4gf5DW8GFdTdvDRIEwMsH
 +qyg==
X-Gm-Message-State: APjAAAVKBw4ng2zHKCfDpHkfC2vdEEDe4/gtW80+j17JvDhVfL2x6gYr
 pua23jm0l+S6h7CSW4OFW8THOMbHjF4Sr/GG4+sF3g==
X-Google-Smtp-Source: APXvYqx6Zyw6k7ktWfeFF2r+YwhlBxFZxaQiK+x6AhML42vVuWgezfZ5idk+Li58YpSowx4YLXEIM/M85D3+c+YcaXY=
X-Received: by 2002:a2e:5c88:: with SMTP id
 q130mr11691520ljb.176.1560268910098; 
 Tue, 11 Jun 2019 09:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094722.23816-1-anders.roxell@linaro.org>
 <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
 <CADYN=9KY5=FzrkC7MKj9QnG-eM1NVuL00w8Xv4yU2r05rhr7WQ@mail.gmail.com>
 <c2ff2c77-5c14-4bc4-f59c-7012d272ec76@thinci.com>
 <1560240943.13886.1.camel@pengutronix.de>
 <221c8ef8-7adc-4383-93c9-9031dca590f0@xs4all.nl>
In-Reply-To: <221c8ef8-7adc-4383-93c9-9031dca590f0@xs4all.nl>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 11 Jun 2019 18:01:39 +0200
Message-ID: <CADYN=9K7GwPGM_Eh5q-OZ9rcEPAjXw4BXy-m3a=QxmGuVruCUw@mail.gmail.com>
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
To: Hans Verkuil <hverkuil@xs4all.nl>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=26bbmtxXOJyY8N47HEW02fS/RJ36aAsn2edvgu3kR/Q=;
 b=kxSAFUyXCR/ZITQ4nMHjx72+UcwqH6Em59goohv6EvmNVmO1iPWvQKrlj48FEaWjzF
 HfWTfoSHrvqI2pueWXSMZH6jycHd7lF+btC2PWymdR/SKr12C1KnhbQd5QMcZshr6Xh7
 BiB7KQjnvAx2yJbfD8rvyPIyMPB0LhgluCZmRwn10iW0uFEOZmkeaCj8HLNQRGpGqaKU
 vMFtp0pWXYF/hSLGdgRRz/iM3gUG2b/se6Vsej8EBx7ab6E1qRhzZ5bhexwVvK17hHCI
 QajxmMBKso5WuHHaJWHNqFdVQCzsQn5N8qjyoStQPyhgHtU133V1l9PiBYfYOme2qucF
 se0w==
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, "marex@denx.de" <marex@denx.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "vivien.didelot@gmail.com" <vivien.didelot@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 David Miller <davem@davemloft.net>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMSBKdW4gMjAxOSBhdCAxMDoyMSwgSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRh
bGwubmw+IHdyb3RlOgo+Cj4gT24gNi8xMS8xOSAxMDoxNSBBTSwgUGhpbGlwcCBaYWJlbCB3cm90
ZToKPiA+IEhpLAo+ID4KPiA+IE9uIE1vbiwgMjAxOS0wNi0xMCBhdCAxMzoxNCArMDAwMCwgTWF0
dCBSZWRmZWFybiB3cm90ZToKPiA+Pgo+ID4+IE9uIDEwLzA2LzIwMTkgMTQ6MDMsIEFuZGVycyBS
b3hlbGwgd3JvdGU6Cj4gPj4+IE9uIFRodSwgNiBKdW4gMjAxOSBhdCAxMjoxMywgSGFucyBWZXJr
dWlsIDxodmVya3VpbEB4czRhbGwubmw+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IE9uIDYvNi8xOSAx
MTo0NyBBTSwgQW5kZXJzIFJveGVsbCB3cm90ZToKPiA+Pj4+PiBXaGVuIGJ1aWxkaW5nIHdpdGgg
Q09ORklHX1ZJREVPX0NPREEgYW5kIENPTkZJR19DT0RBX0ZTIGVuYWJsZWQgYXMKPiA+Pj4+PiBs
b2FkYWJsZSBtb2R1bGVzLCB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+ID4+Pj4+Cj4g
Pj4+Pj4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPj4+Pj4gICAgZnMvY29k
YS9jb2RhLmtvCj4gPj4+Pj4gICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL2NvZGEua28K
PiA+Pj4+Pgo+ID4+Pj4+IFJld29yayBzbyBtZWRpYSBjb2RhIG1hdGNoZXMgdGhlIGNvbmZpZyBm
cmFnbWVudC4gTGVhdmluZyBDT0RBX0ZTIGFzIGlzCj4gPj4+Pj4gc2luY2UgdGhhdHMgYSB3ZWxs
IGtub3duIG1vZHVsZS4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZGVycyBSb3hl
bGwgPGFuZGVycy5yb3hlbGxAbGluYXJvLm9yZz4KPiA+Pj4+PiAtLS0KPiA+Pj4+PiAgIGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vY29kYS9NYWtlZmlsZSB8IDQgKystLQo+ID4+Pj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Pgo+ID4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUKPiA+Pj4+PiBpbmRleCA1NGU5YTczYTky
YWIuLjU4OGU2YmY3YzE5MCAxMDA2NDQKPiA+Pj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2NvZGEvTWFrZWZpbGUKPiA+Pj4+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2Nv
ZGEvTWFrZWZpbGUKPiA+Pj4+PiBAQCAtMSw2ICsxLDYgQEAKPiA+Pj4+PiAgICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4+Pj4+Cj4gPj4+Pj4gLWNvZGEtb2JqcyA6
PSBjb2RhLWNvbW1vbi5vIGNvZGEtYml0Lm8gY29kYS1nZGkubyBjb2RhLWgyNjQubyBjb2RhLW1w
ZWcyLm8gY29kYS1tcGVnNC5vIGNvZGEtanBlZy5vCj4gPj4+Pj4gK3ZpZGVvLWNvZGEtb2JqcyA6
PSBjb2RhLWNvbW1vbi5vIGNvZGEtYml0Lm8gY29kYS1nZGkubyBjb2RhLWgyNjQubyBjb2RhLW1w
ZWcyLm8gY29kYS1tcGVnNC5vIGNvZGEtanBlZy5vCj4gPj4+Pj4KPiA+Pj4+PiAtb2JqLSQoQ09O
RklHX1ZJREVPX0NPREEpICs9IGNvZGEubwo+ID4+Pj4+ICtvYmotJChDT05GSUdfVklERU9fQ09E
QSkgKz0gdmlkZW8tY29kYS5vCj4gPj4+Pgo+ID4+Pj4gSG93IGFib3V0IGlteC1jb2RhPyB2aWRl
by1jb2RhIHN1Z2dlc3RzIGl0IGlzIHBhcnQgb2YgdGhlIHZpZGVvIHN1YnN5c3RlbSwKPiA+Pj4+
IHdoaWNoIGl0IGlzbid0Lgo+ID4+Pgo+ID4+PiBJJ2xsIHJlc2VuZCBhIHYyIHNob3J0bHkgd2l0
aCBpbXgtY29kYSBpbnN0ZWFkLgo+ID4KPiA+IEknZCBiZSBpbiBmYXZvciBvZiBjYWxsaW5nIGl0
ICJjb2RhLXZwdSIgaW5zdGVhZC4KPgo+IEZpbmUgYnkgbWUhCj4KPiA+Cj4gPj4gV2hhdCBhYm91
dCBvdGhlciB2ZW5kb3IgU29DcyBpbXBsZW1lbnRpbmcgdGhlIENvZGEgSVAgYmxvY2sgd2hpY2gg
YXJlCj4gPj4gbm90IGFuIGlteD8gSSdkIHByZWZlciBhIG1vcmUgZ2VuZXJpYyBuYW1lIC0gbWF5
YmUgbWVkaWEtY29kYS4KPiA+Cj4gPiBSaWdodCwgdGhpcyBkcml2ZXIgY2FuIGJlIHVzZWQgb24g
b3RoZXIgU29DcyBbMV0uCj4KPiBHb29kIHBvaW50LgoKT0ssIHNvIEknbGwgY2hhbmdlIGl0IHRv
ICdtZWRpYS1jb2RhJy4KCkNoZWVycywKQW5kZXJzCgo+Cj4gUmVnYXJkcywKPgo+ICAgICAgICAg
SGFucwo+Cj4gPgo+ID4gWzFdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnL21zZzE0NjQ5OC5odG1sCj4gPgo+ID4gcmVnYXJkcwo+ID4gUGhp
bGlwcAo+ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
