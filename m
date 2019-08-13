Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0D8BC03
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 16:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4398F6E165;
	Tue, 13 Aug 2019 14:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F4F6E165
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 14:50:37 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEC1220844
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 14:50:36 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id d79so79757640qke.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:50:36 -0700 (PDT)
X-Gm-Message-State: APjAAAVvoCRfUlwk7BRj8c4vUyMKFzJQ544w/wa/M10muBgo677LGQMn
 NbuD1tvOQ4p4N+IQCxGtGHT2AdJE5rwx6Tu1zA==
X-Google-Smtp-Source: APXvYqwauM1UXZZWqaUFPmT98etOdG5imZ6IeS2RZeoC8ygIrIl1xy7RCbva8Nci3tTAQT0U6shqvDCeWaP3JeEnTbc=
X-Received: by 2002:a37:6944:: with SMTP id e65mr31570154qkc.119.1565707836132; 
 Tue, 13 Aug 2019 07:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190802195727.1963-1-robh@kernel.org>
 <c9f7a287-cad7-9741-1aa2-923ce7e56bd2@baylibre.com>
In-Reply-To: <c9f7a287-cad7-9741-1aa2-923ce7e56bd2@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Aug 2019 08:50:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJqU=ue86Qum0U8gJDPWxjapi_fsPeEtbhe73+uub=26w@mail.gmail.com>
Message-ID: <CAL_JsqJqU=ue86Qum0U8gJDPWxjapi_fsPeEtbhe73+uub=26w@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Remove completed features still in TODO
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565707837;
 bh=N5jMynCwcRiTpSLbiCriK1/gFQe+V+p74zVTp3zKULg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N/JA0OAg8d3keHWmdIw3ks70Pcyg74PDqGsmK/2mr/3NORuSFeY+qIrK+9EG68HjU
 Ob2gFszepX4EhHDkc/Biy1BaGb0kCOFM8GgI8q8iJfc8AoMARoXJxbVPwSyGizr06b
 T56NJ0VoepujTyAscwnNpzayNGislUheVhZxmk4I=
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgNzowNyBBTSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gT24gMDIvMDgvMjAxOSAyMTo1NywgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4gPiBUaGVyZSdzIGEgZmV3IGZlYXR1cmVzIHRoZSBkcml2ZXIgc3VwcG9ydHMg
d2hpY2ggd2UgZm9yZ290IHRvIHJlbW92ZSwgc28KPiA+IHJlbW92ZSB0aGVtIG5vdy4KPiA+Cj4g
PiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiA+IENjOiBC
b3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPIHwgOSAtLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L1RPRE8gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETwo+ID4gaW5kZXggYzJl
NDRhZGQzN2Q4Li4yYWM5NzJhMzQ2OWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvVE9ETwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8KPiA+
IEBAIC0xLDE1ICsxLDkgQEAKPiA+IC0tIFRoZXJtYWwgc3VwcG9ydC4KPiA+IC0KPiA+ICAtIEJp
ZnJvc3Qgc3VwcG9ydDoKPiA+ICAgIC0gRFQgYmluZGluZ3MgKE5laWwsIFdJUCkKPgo+IFRoZSBi
aWZyb3N0ciBiaW5kaW5ncyBhcmUgdXBzdHJlYW0sIGJ1dCBub3QgaW4gWUFNTCwgeW91IHNob3Vs
ZCBtb3ZlIGFuZCB0cmFuc2Zvcm0gdGhpcyBsaW5lIGludG8gOgo+Cj4gICAgIC0gRFQgYmluZGlu
Z3MgaW4gWUFNTCBzY2hlbWEKCkFscmVhZHkgYXBwbGllZCB0aGlzLiBJbiBhbnkgY2FzZSwgdGhp
cyBwYXRjaCB3YXMgYWJvdXQgcmVtb3ZhbHMuIElmCndlIGhhdmUgdXBkYXRlcyBvciBhZGRpdGlv
bnMsIHRoYXQncyBhIHNlcGFyYXRlIHRoaW5nLgoKQnV0IEkgcmF0aGVyIGp1c3QgZ2V0IHRoaXMg
b25lIGRvbmUgdGhhbiBhZGQgYSB0b2RvLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
