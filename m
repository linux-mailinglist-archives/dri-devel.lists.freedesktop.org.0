Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75C433E8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304B6896F7;
	Thu, 13 Jun 2019 07:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AAE896F7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:56:04 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id i10so15232156iol.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 00:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mt9IXgQK0R3bZVbL1gX4lwhgNE2WNQzmEIjkbIH3lKE=;
 b=uBYYMOOh8QAM3JvCqGMjufiBnaLlR6js6o/lz6q/lULFYD65//DWXdLw/de5J2d2w8
 7HNn7SogTXuKM0rY6dYE34qNrNyDTcy9v2ubRmsZjzYCJjyTLSfZL4IDWLn/GfKVyTWy
 n6yqoK0Vu9xpNA+yeuuXOF2OrFZoVueXphCnLq77hSa3yVhfznTu9IlJemGXrB2qHTrB
 vAsOh195zCqimI6ZbH3Nn6OxyflM+qOLDIjTfRzE31WGUpkl8K/58/t9LlSpVQ843/e7
 usYynzNGgqug2e68P/6l0DpAcKrk9rty6gv1DVam5P9CF64N8VHNovFOdXRKV7dDsDSS
 Msvg==
X-Gm-Message-State: APjAAAWs/gjn5iR8FadV7svIl6/eM5eaKDnaIeyVyAH0IFTb932zgz4b
 rRhMKX31tMg/+volerPvEENHP4SlGtrLSKWDNAzQBA==
X-Google-Smtp-Source: APXvYqwDhRfnaHJtf1PQHQ/jF+8eogSJypvcgbC/dcDrOKV/5SpBek5mjlGRiNPmxM88wklf9JqUz4ZZ47Kx3KJwqsI=
X-Received: by 2002:a6b:6b14:: with SMTP id g20mr51043170ioc.28.1560412563915; 
 Thu, 13 Jun 2019 00:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190520090318.27570-1-jagan@amarulasolutions.com>
 <20190520090318.27570-10-jagan@amarulasolutions.com>
 <20190603134907.lh5rdpucbrzrsdps@flea>
In-Reply-To: <20190603134907.lh5rdpucbrzrsdps@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 13 Jun 2019 13:25:52 +0530
Message-ID: <CAMty3ZC5-y8RJcLjFP_G8i7=9-BuOQWdnxoo66TO4mrrOxqDLg@mail.gmail.com>
Subject: Re: [PATCH v10 09/11] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI
 regulator support
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mt9IXgQK0R3bZVbL1gX4lwhgNE2WNQzmEIjkbIH3lKE=;
 b=CtrAEoilqvh20HeyueqUwiW7Sa/FbuwD7y/aJXyR4xt9xVi1BLl8zqjbMMpgvcpfBD
 TJalZ6QEJZvTLm4nqCFht30YUEyRuM+d2nhm/jtcU7Gi+OVZTfHrUhuwe4D+d1PfnBBc
 RilEpAmd11hs5QxMrxz60PzbfFEFEoRfCQWSA=
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
Cc: Bhushan Shah <bshah@mykolab.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?B?5Z2a5a6a5YmN6KGM?= <powerpan@qq.com>, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA3OjE5IFBNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDI6MzM6
MTZQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+IEFsbHdpbm5lciBNSVBJIERTSSBjb250
cm9sbGVycyBhcmUgc3VwcGxpZWQgd2l0aCBTb0MKPiA+IERTSSBwb3dlciByYWlscyB2aWEgVkND
LURTSSBwaW4uCj4gPgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoaXMgc3VwcGx5IHBpbiBieSBhZGRp
bmcgdm9sdGFnZQo+ID4gcmVndWxhdG9yIGhhbmRsaW5nIGNvZGUgdG8gTUlQSSBEU0kgZHJpdmVy
Lgo+ID4KPiA+IFRlc3RlZC1ieTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgo+
ID4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4KPiBUaGlzIGNyZWF0ZXMgYSBsb3Qgb2Ygd2FybmluZ3MgYXQgYm9vdCB0aW1lIG9uIG15IGJv
YXJkIHRoaXMgaXMKPiBtaXNzaW5nIHZjYy1kc2ktc3VwcGx5LgoKSXMgaXQgYWJvdXQgcmVndWxh
dG9yX3B1dCBvciBzaW1pbGFyLCB3b3VsZCB5b3UgcHJvdmlkZSB0aGUgbG9nLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
