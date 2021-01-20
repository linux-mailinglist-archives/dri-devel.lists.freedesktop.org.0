Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47C2FDD54
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 00:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510F89E14;
	Wed, 20 Jan 2021 23:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3996C89E14
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 23:47:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7F0C23619
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 23:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611186420;
 bh=0WJekRe162njhz/lN/s1NsUfes3ExpoWd49kVBnEejU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dlb2GafUES632XMG7xdeT6FSzA/aAwE13grNWfpunJA+7lNdexHZA6/QYAs7SFKPO
 L6cbuaCB4dTuFxVBT8hBPP6/2uiOULwpuVH8LKH7KdSVM13adQ78pHDn2xR8t6oaWF
 I5SedOZO7iEhqJ2hQ5nwQjKNsoFfhqEOtwNk5aN/UfPTfO2Kd/UgBcL/xDPZc/wG3T
 xLhWN49VGhxmxtTB4Of+7Yyxny6qEbxw+xwH+JrYoDWlQZcIUwb4EkwcfgpcJy3BpS
 RVzxrWfKXhAZjlLMq+9cd7lZSYKWy9jfgoC5DEmyISRKSXl+d3+RJzbHD4GdwwZ4Lf
 PKbr9yMGlV7CA==
Received: by mail-wr1-f54.google.com with SMTP id m4so31273wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 15:46:59 -0800 (PST)
X-Gm-Message-State: AOAM533cdzgPOKo26kEAoaGlePmTiDXGR+uxkYHXsJt/DsyKCswqkqKi
 Y6skw8lv5coj3hhPl5efKqGxqGW1QElQF+2HIQ==
X-Google-Smtp-Source: ABdhPJyOeJAtpzLliOtYNxoGXZZfEVvmUMa8zd9WYN928+G7DsPAZ514fbLy1jNVz+KdZq3J5WPxeP/R7tiMsnrbC4c=
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr2662537wrd.134.1611186418365; 
 Wed, 20 Jan 2021 15:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-4-chunkuang.hu@kernel.org>
 <YAh2JGUUpMcgyke0@ziggy.stardust>
In-Reply-To: <YAh2JGUUpMcgyke0@ziggy.stardust>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 21 Jan 2021 07:46:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
Message-ID: <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/mediatek: Change disp/ddp term to mutex in mtk
 mutex driver
To: Matthias Brugger <matthias.bgg@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+
IOaWvCAyMDIx5bm0MeaciDIx5pelIOmAseWbmyDkuIrljYgyOjI35a+r6YGT77yaCj4KPiBPbiBU
aHUsIEphbiAwNywgMjAyMSBhdCAwNzoxNzoyN0FNICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3Rl
Ogo+ID4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Cj4gPiBtdGsgbXV0ZXgg
aXMgdXNlZCBieSBib3RoIGRybSBhbmQgbWRwIGRyaXZlciwgc28gY2hhbmdlIGRpc3AvZGRwIHRl
cm0gdG8KPiA+IG11dGV4IHRvIHNob3cgdGhhdCBpdCdzIGEgY29tbW9uIGRyaXZlciBmb3IgZHJt
IGFuZCBtZHAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwu
b3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
IHwgIDMwICstLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8
ICAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICB8ICAg
MiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYyAgICB8IDMwNSAr
KysrKysrKysrKystLS0tLS0tLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X211dGV4LmggICAgfCAgMjYgKy0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE4MiBpbnNlcnRpb25z
KCspLCAxODMgZGVsZXRpb25zKC0pCj4gPgo+IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19tdXRleC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19tdXRleC5jCj4gPiBpbmRleCAxYzhhMjUzZjQ3ODguLjk4YTA2MGJmMjI1ZCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdXRleC5jCj4gWy4uLl0KPiA+Cj4gPiAtc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZGRwX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG11dGV4X2RyaXZlcl9kdF9tYXRj
aFtdID0gewo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1t
dXRleCIsCj4gPiAtICAgICAgIC5kYXRhID0gJm10MjcwMV9kZHBfZHJpdmVyX2RhdGF9LAo+ID4g
KyAgICAgICAuZGF0YSA9ICZtdDI3MDFfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItZGlzcC1tdXRleCIsCj4gPiAtICAgICAgIC5k
YXRhID0gJm10MjcxMl9kZHBfZHJpdmVyX2RhdGF9LAo+ID4gKyAgICAgICAuZGF0YSA9ICZtdDI3
MTJfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxNjctZGlzcC1tdXRleCIsCj4gPiAtICAgICAgIC5kYXRhID0gJm10ODE2N19kZHBfZHJp
dmVyX2RhdGF9LAo+ID4gKyAgICAgICAuZGF0YSA9ICZtdDgxNjdfbXV0ZXhfZHJpdmVyX2RhdGF9
LAo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1tdXRleCIs
Cj4gPiAtICAgICAgIC5kYXRhID0gJm10ODE3M19kZHBfZHJpdmVyX2RhdGF9LAo+ID4gKyAgICAg
ICAuZGF0YSA9ICZtdDgxNzNfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gICAgICAge30sCj4gPiAg
fTsKPiA+IC1NT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkZHBfZHJpdmVyX2R0X21hdGNoKTsKPiA+
ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdXRleF9kcml2ZXJfZHRfbWF0Y2gpOwo+Cj4gSSB0
aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIGluIGEgZm9sbG93LXVwIHBhdGNoIHRvIHVwZGF0ZSB0
aGUgYmluZGluZwo+IHRvIHVzZSAibWVkaWF0ZWssbXQyNzAxLW11dGV4IiB0byByZWZsZWN0IHRo
YXQgbXV0ZXggaXMgdXNlZCBmb3IgZHJtIGFuZAo+IG1kcCBkcml2ZXIuIE1ha2Ugc2Vuc2U/CgpZ
ZXMsIGl0IG1ha2Ugc2Vuc2UuIEkgd291bGQgdHJ5IHRvIHVwZGF0ZSB0aGUgYmluZGluZywgYnV0
IEkgd29uZGVyCmRldmljZSB0cmVlIHNob3VsZCBiZSBiYWNrd2FyZCBjb21wYXRpYmxlPyBMZXQn
cyBkaXNjdXNzIGluIHRoYXQKZm9sbG93LXVwIHBhdGNoZXMuCgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPgo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
