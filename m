Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8495656C6F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229CB6E42E;
	Wed, 26 Jun 2019 14:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0216E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:43:24 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C92921743
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:43:24 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id i34so2617797qta.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:43:24 -0700 (PDT)
X-Gm-Message-State: APjAAAWBgKrC0o9YwJHWr/nHvCOCFU7CvC3E0IFF+W9rQDS7Oh8+h6yf
 RlsrkiFFui/CYGE6JLxwMJlBI2IikZIU1eyyqQ==
X-Google-Smtp-Source: APXvYqyr8Zlz8fpqgay129UIrkPbfTa84lhlkGKPvEDgHYVRyKeCNl7CMNHQYKrlqQCQGb5m02XxK/OTjfw2ow7sePk=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr4212078qth.136.1561560203223; 
 Wed, 26 Jun 2019 07:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
In-Reply-To: <20190626105614.ujmryi7qou2ra7aq@holly.lan>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 26 Jun 2019 08:43:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL2XXZY-vxb16=6Mh8cV=YaMv0U7d+SHzzgWHwEWFy4Sg@mail.gmail.com>
Message-ID: <CAL_JsqL2XXZY-vxb16=6Mh8cV=YaMv0U7d+SHzzgWHwEWFy4Sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561560204;
 bh=00rC0wdpAdD7iwooPkJILqIhsMM0FV+mEJjQaxzmaM8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bbLSFe0hmo/BVopnXvLcUiwWWKLYb6WnJZuMmJ0fMJRQnKhfz4iKW+qNz+E4hibsh
 WHkP05nOJLH3js7w+1dbZ1Dz+femBXT6l+JiEcrBqb5/GrEt0TVyaw9lXqrc8u+5QP
 detnyz80PaTcTeuhixV1PgwNOVd5BOJz/jCAKiCE=
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
Cc: devicetree@vger.kernel.org, Brian Dodge <bdodge09@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 pbacon@psemi.com, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNDo1NiBBTSBEYW5pZWwgVGhvbXBzb24KPGRhbmllbC50
aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDA3
OjQ0OjA2QU0gLTA0MDAsIEJyaWFuIERvZGdlIHdyb3RlOgo+ID4gSSB3b3VsZCBsaWtlIHRvIGRl
cHJlY2F0ZSB0aGUgb2xkIHByZWZpeCBpbiB0aGUgZnV0dXJlIGFmdGVyIGNvbW11bmljYXRpbmcK
PiA+IHdpdGggYWxsIGNoaXAgY3VzdG9tZXJzLCB3aGljaCBpcyB3aHkgdGhlIG9sZCBwcmVmaXgg
aXMgbm90IGRvY3VtZW50ZWQgaW4KPiA+IHRoZSBuZXcgYmluZGluZ3MuCj4KPiBEZXByZWNhdGlv
biBpcyBmaW5lIChieSBtZSBhdCBsZWFzdCkgaXQncyBqdXN0IHRoYXQgSSdtIG5vdCBzdXJlIHRo
YXQKPiByZW1vdmluZyB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRlcHJlY2F0ZWQgYmluZGlu
Z3MgaXMgdGhlIHJpZ2h0IHdheQo+IHRvIGRvIGl0LiBXaGF0IGlzIHRoZSBwcmlvciBhcnQgaGVy
ZT8KCktpbmQgb2YgZGVwZW5kcyBvbiBob3cgd2lkZWx5IHVzZWQgc29tZXRoaW5nIGlzIGFuZCB3
ZSd2ZSBkb25lIGJvdGgKd2F5cyBnZW5lcmFsbHkuIElmIHRoZXJlIGFyZSBub3QgYW55IHVwc3Ry
ZWFtIGR0cyBmaWxlcywgcmVtb3ZhbCBpcwpmaW5lIElNTy4KCldpdGggc2NoZW1hLCB0aGVyZSdz
IGEgJ2RlcHJlY2F0ZWQnIGtleXdvcmQgY29taW5nIGluIGRyYWZ0OC4gU28gd2UnbGwKaGF2ZSBh
IGRlZmluZWQgd2F5IHRvIGtlZXAgdGhpbmdzIGRvY3VtZW50ZWQgYXMgbmVlZGVkIGFuZCBhbHNv
IHdhcm4KYWJvdXQgdGhlaXIgdXNlLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
