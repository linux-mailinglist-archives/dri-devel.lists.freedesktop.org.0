Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149434EF80
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 21:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EC66E91A;
	Fri, 21 Jun 2019 19:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1126E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 19:33:36 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5ECE208C3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 19:33:35 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 16so6923273ljv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:33:35 -0700 (PDT)
X-Gm-Message-State: APjAAAU0HsKtpvbG6VI3pvcY/QFDlnJOOwU3K6r1Jg0/HvvHUWllK4eg
 NQ9iT7ajaQD6kpSIXBxKUGQxGSCU+brFjHhNdAU=
X-Google-Smtp-Source: APXvYqw+AWIZQJEwj6HlJUTLZyDgqsgk75b9MCYvZnk3E78e2B2dSpIH5xM9uQQhdUq2jLjPkfm+V8t5zxYg8wigxfw=
X-Received: by 2002:a2e:50e:: with SMTP id 14mr55540402ljf.5.1561145614235;
 Fri, 21 Jun 2019 12:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190621184904.25975-1-sam@ravnborg.org>
In-Reply-To: <20190621184904.25975-1-sam@ravnborg.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 21 Jun 2019 21:33:22 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeNDGYCctL4OpBH1V+Ez4Ld1CDzB_pANxQkwqBzj8zEmA@mail.gmail.com>
Message-ID: <CAJKOXPeNDGYCctL4OpBH1V+Ez4Ld1CDzB_pANxQkwqBzj8zEmA@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] drm/exynos: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561145616;
 bh=rRAUDibxwOOgmmwCD+xGuz6N2a3BCxb5CofqJdNJ8Mk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AOOqNdH/sXcW1MaE/3V/H1+sbwFJ7nKTsAjGoYa87LoMEA2gp/c2W+cH9YI/y0Xkl
 q0poCzjAsXVcGkGnEV8RF2tmzYPa0olJbGp90+RlI1znxL+a1NC+OUEizoIN8IJaru
 YXzL8jT0xLNgDCurjzDosbCOWVZj30X12B8BVCog=
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMSBKdW4gMjAxOSBhdCAyMDo0OSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IEJ1aWxkIHRlc3RlZCB1c2luZyBhbGx5ZXNjb25maWcsIGFsbG1vZGNv
bmZpZyBmb3IgdmFyaW91cwo+IGFyY2hpdGVjdHVyZXMuCgpIaSwKClRoYW5rcyBmb3IgZml4ZXMu
IEp1c3QgZm9yIHRoZSByZWNvcmQsIGFsbHllc2NvbmZpZy9hbGxtb2Rjb25maWcgYXJlCm5vdCBh
IHByb3BlciB3YXkgZm9yIGJ1aWxkIHRlc3Qgc3BlY2lmaWMgZHJpdmVycy4gVGhleSBhcmUgbmlj
ZSBidXQKc2luY2UgYWxsIGRlcGVuZGVuY2llcyBhcmUgaW4sIHRoZXkgbWlnaHQgbWlzcyBhIGxv
dC4gWW91IHNob3VsZCBidWlsZAptZW50aW9uZWQgcGxhdGZvcm0gKGV4eW5vc19kZWZjb25maWcg
b24gQVJNdjcsIGRlZmNvbmZpZyBvbiBBUk12OCkgYW5kCm11bHRpIGNvbmZpZ3MgKG11bHRpX3Y3
IG9uIEFSTXY3KS4gU3VjaCBydWxlIGlzIGFsc28gdmFsaWQgZm9yIG90aGVyCmRyaXZlcnMsIG5v
dCBzcGVjaWZpYyB0byBFeHlub3MuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKPgo+IHYyOgo+
IC0gYWRkIG1pc3NpbmcgcGVvcGxlIHRvIHJlY2lwaWVudCBsaXN0IG9mIG1haWwKPiAtIG5vIGNo
YW5nZSBpbiBhY3R1YWwgcGF0Y2gKPgo+IHYzOgo+IC0gZml4IGJ1aWxkIGJyZWFrYWdlIChJbmtp
IERhZSkKPgo+IFRoZSB0ZXN0aW5nIEkgaGFkIGRvbmUgd2l0aCBhbGx5ZXNjb25maWcsIGFsbG1v
ZGNvbmZpZwo+IGRpZCBub3QgdHJpZ2dlciBhIGNvbmZpZ3VyYXRpb24gd2hlcmUgZXh5bm9zX2Ry
bV9nMmQuYwo+IHdhcyBidWlsdC4gIFNvIGEgYnVpbGQgZXJyb3IgaGFkIHNsaXBwZWQgdGhyb3Vn
aC4KPgo+IFZlcmlmaWVkIHRoYXQgYWxsIDIzIC5jIGZpbGVzIGFyZSBidWlsdCBub3cuCj4KPiAg
ICAgICAgIFNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
