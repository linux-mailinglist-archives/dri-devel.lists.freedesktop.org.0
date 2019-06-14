Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3A45AFE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 12:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29284894C5;
	Fri, 14 Jun 2019 10:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F30C894C5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 10:56:42 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id u13so4870174iop.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06iI6z4cthU4ce66OeHWQkRCnmuFyEIHHZ9Es1yn3sc=;
 b=FKuLAUNi0YijiprOJ1QhAp1BOfgD3tNWqbtibGgZNi8mrTL/eGr3zC3o8cIiGQ3T6i
 ydpiyJTjAE38yM5ogfaeMTIa7Pfb2CLR6MynyFyhGhtK3Aom3Ayj8vP3EIWIf9bVfBbe
 DwHy8l9b/bYR7bzqWoP0oBsbTKx7f9Uq69zoBgDkOl4SfzcgpmVxjiWEKnIWlIMxEUgl
 SvWZmHYSWDH+mh+eodJ7ACD7e29P3TMy6I9eQaOcQNX5PlND00cFkwRW+wld0+mRo1Uc
 H+j2N0ZzwzUWK4728taZiFMTkiqgx8NdVJH0TR1dpnkbs80mpcb76IEUaFpQGtK3iX1K
 0IJQ==
X-Gm-Message-State: APjAAAWqVXDjX4xfKqAn5Sc8GAYdM6wcZYq8USkl9yYffssxPSP9zs8B
 /ku4ihFKgFweAtK5XP2r01iIDKogy/TqwUdLAQzdig==
X-Google-Smtp-Source: APXvYqwkcIwVPtfblhejh6xHVBtwFYzc9v3JjBjZavec/51f+nlxxqOghRWbuFOJBMDNowUmrcO58Fw+cwukMr5fTSU=
X-Received: by 2002:a05:6602:2253:: with SMTP id
 o19mr14463706ioo.297.1560509801785; 
 Fri, 14 Jun 2019 03:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-3-jagan@amarulasolutions.com>
 <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
 <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
In-Reply-To: <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 14 Jun 2019 16:26:30 +0530
Message-ID: <CAMty3ZBc-AqbNGZCxRhOPw46iMvEZxoq1oATA46=K29gRYi4Sg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/9] drm/sun4i: tcon: Add TCON LCD support
 for R40
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=06iI6z4cthU4ce66OeHWQkRCnmuFyEIHHZ9Es1yn3sc=;
 b=ooZzfFJD2u9j2LussEGHFOPOfLBkJ+BU0GJHPBhgAJ/vkF6JbiQbi3Z9LCSduATYrm
 pmqk7dvkdE04MoEJvLFEsmWLKI31BrB0lbpcgBa7PmY2Pqee615LcMhMjtdzFAWkeAol
 te7vdgYxjdEddafQhiDTatljo0z/1a5LRul94=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgOTowNSBBTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTE6MTkgQU0gQ2hlbi1ZdSBU
c2FpIDx3ZW5zQGNzaWUub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1biAxNCwgMjAxOSBh
dCAyOjUzIEFNIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gVENPTiBMQ0QwLCBMQ0QxIGluIGFsbHdpbm5lciBSNDAsIGFyZSB1c2VkIGZv
ciBtYW5hZ2luZwo+ID4gPiBMQ0QgaW50ZXJmYWNlcyBsaWtlIFJHQiwgTFZEUyBhbmQgRFNJLgo+
ID4gPgo+ID4gPiBMaWtlIFRDT04gVFYwLCBUVjEgdGhlc2UgTENEMCwgTENEMSBhcmUgYWxzbyBt
YW5hZ2VkIHZpYQo+ID4gPiB0Y29uIHRvcC4KPiA+ID4KPiA+ID4gQWRkIHN1cHBvcnQgZm9yIGl0
LCBpbiB0Y29uIGRyaXZlci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6IENoZW4tWXUg
VHNhaSA8d2Vuc0Bjc2llLm9yZz4KPgo+IEkgdGFrZSB0aGF0IGJhY2suCj4KPiBUaGUgVENPTiBv
dXRwdXQgbXV4aW5nICh3aGljaCBzZWxlY3RzIHdoZXRoZXIgVENPTiBMQ0Qgb3IgVENPTiBUVgo+
IG91dHB1dHMgdG8gdGhlIEdQSU8gcGlucykKPiBpcyBub3Qgc3VwcG9ydGVkIHlldC4gUGxlYXNl
IGF0IGxlYXN0IGFkZCBUT0RPIG5vdGVzLCBvciBpZGVhbGx5LAoKQXJlIHlvdSByZWZlcnJpbmcg
YWJvdXQgcG9ydCBzZWxlY3Rpb24/IGl0IGlzIHN1cHBvcnQgaW4Kc3VuOGlfdGNvbl90b3BfZGVf
Y29uZmlnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
