Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B938507F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBF36E72D;
	Wed,  7 Aug 2019 16:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4F96E72D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 16:00:43 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id y16so60952705vsc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 09:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fj3iA8aUslGeR8WSt9eJO3h2wZEAjp0nwAA5kqv9aDI=;
 b=KR2nQIdYOl9CjGVJJCC8ViP/oZWGBFatRZB6UHAzWwnpT3SLsV6XES7+6/rfyOSmIG
 VK2byROLJOqaUEQQ4EO/tGY6FuSk1KOle8BwWjmvn0Hka5fC0aL7kkoGnmxJOzV99yIH
 rin+q6ADq1r+vx6mUjNGuYrpa/vHfg53lHnBEoNdn0jBNzA9TpDTTuOxagRM3OBbiq0O
 DsYGc3Gd9FDAPFYUqvR7R0MTxmTGAXVKdKcz0tJtSZZIAgnmheCpVCy5I+rtrRd1XBMG
 /1TyguXtwsAQfWEx0+1QjDgBD19yAvcVprdXsCmwG4NKQCT+oOt65VOOp17xMGrdj8cO
 lOqA==
X-Gm-Message-State: APjAAAW6NDr7/SKzffzGRsdssU4EXYBaHVJwnA7YO+Vb8OKWKFCbLxxp
 mkhLP6KFmGbo8i6Bc+OdQ30zRoAbrxXmoTfGeKE=
X-Google-Smtp-Source: APXvYqwiTy1D3lKEwMS0KAmfH7CZpNUIDAJP1y4AC1tv1tGjYKZfmoMi96d0DKMB14uZOWQQIL2wZODCO5FexVBAXXw=
X-Received: by 2002:a67:79d4:: with SMTP id u203mr6598562vsc.85.1565193642084; 
 Wed, 07 Aug 2019 09:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190807145253.2037-1-sean@poorly.run>
 <20190807145253.2037-3-sean@poorly.run>
In-Reply-To: <20190807145253.2037-3-sean@poorly.run>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 7 Aug 2019 16:59:51 +0100
Message-ID: <CACvgo50K+Wy3HAmVud8+Rvotm86vaqen1yPaO6gsUjc3K5BwSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm/panfrost: Use drm_gem_map_offset()"
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fj3iA8aUslGeR8WSt9eJO3h2wZEAjp0nwAA5kqv9aDI=;
 b=eqa/1e3+Ma+c6CLBYUdXlRk3EEz3/AVzxkMxYqzmT1/AksmJWEWm2I0jJOGXtqnwl/
 Av105rC3e6iJsaEzQysWLlKpF98IIyTkfnfwiMg5o71L4SvavCWhVDGsqTODCbn0rK0A
 TRlZbfS7cXiNH+qQJ4ZQefqXOYwjewcJYh7bOhYBGNRgbHky4+6YHIdfs67g4Wky2KEu
 gGtzsIFnaTCtSsqTza1Xy8LzcnccWy+Zxh1gOS4SVJWfof6YGefoMwhHokkdKmiTsoOe
 u7QzBowbVT1tqvszuXA6Y2zFMgoc4P6CmGHUwhdkCvOLAQ0UUJlih7gfWcZ06Duxxg2A
 HbpQ==
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
Cc: Maxime Ripard <mripard@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA3IEF1ZyAyMDE5IGF0IDE1OjUzLCBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4g
d3JvdGU6Cj4KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Cj4gVGhpcyBy
ZXZlcnRzIGNvbW1pdCA1ODNiYmY0NjEzM2M3MjZiYWUyNzdlOGY0ZTMyYmZiYTJhNTI4YzdmLgo+
Cj4gVHVybnMgb3V0IHdlIG5lZWQgbW1hcCB0byB3b3JrIG9uIGltcG9ydGVkIEJPcyBldmVuIGlm
IHRoZSBjdXJyZW50IGNvZGUKPiBpcyBidWdneS4KPgpQZXJzb25hbGx5IEkgd291bGQgaGF2ZSBt
ZW50aW9uZWQgYSB1c2UgY2FzZSB3aGVyZSBpbXBvcnRlZCBCT3MgYXJlIHVzZWQuCgo+IFNpZ25l
ZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CgpSZWdhcmRsZXNzIG9mIHRoZSBhYm92ZSBuaXRw
aWNrLCB3aXRoIHRoZSBwYXRjaCBvcmRlciBmaXhlZCB0aGUgc2VyaWVzIGlzOgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCi4uLiBpbiBjYXNl
IHlvdSBoYXZlbid0IHBpY2tlZCBpdCBhbHJlYWR5LgoKLUVtaWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
