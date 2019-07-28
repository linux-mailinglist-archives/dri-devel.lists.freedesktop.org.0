Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277A77EF8
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 12:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063BB89C49;
	Sun, 28 Jul 2019 10:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAD989BF4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 10:02:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v18so55544182ljh.6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 03:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqJPOf3ole/ocwpSBgy0ZOy0oBYIEFe0Lpin0fI4i4g=;
 b=ln3BTdMtV19WQnpVVWiugn9VlMyKeShYSfvnVzAAh1R3p2vOaLMlN2S/zy2zecm5QF
 5fZmZXJntUdOp2qv5DLgiQhJ16J3Jtn26hJ/W+kQa2a2ZtzvUWMR8i+EwqaW3HcGZOa3
 FE9mz69BUrxzqUUHx6N02hX/Mel+PII0O84uLANntf4IN9Rjt4jeZYf3McYIpTlkDCWW
 vZQ983fhLuHmv1IpB/UwWYp2ck0VAB12Rx0GX/KGXf2hflgEpPSrfemPRvgP3IvGb5Ug
 ibbvfK0dCfoIf0RGqAm/+Wkmt2h/kSTS/MLs+RP55kpFJsJToQfh0xSTvrZngsoNbO1E
 Cc3w==
X-Gm-Message-State: APjAAAU0y3zcUI61xG646zzt99AFxneIwD8U+rFxGiOUIkuj011IcijF
 E+sKUPRuQ16sLDhftYs+JsBiKfWzZlCbfOvvsM2Dy1We
X-Google-Smtp-Source: APXvYqz6EmJJJTKLfbfJEwbI9boVgwgnhYa+vwRfTg39dxtl7DiKAYb7s7X1xZfaTDAEq8Rul0rr79Hz1LXszhPLgOM=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr32928008ljm.180.1564308151456; 
 Sun, 28 Jul 2019 03:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jul 2019 12:02:20 +0200
Message-ID: <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
To: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dqJPOf3ole/ocwpSBgy0ZOy0oBYIEFe0Lpin0fI4i4g=;
 b=ATSPbECq/2Dk57WgaaHGygsRg1afRoCRLL5jv2+lMJP5BmgY/x/Y6ccmzhGFuwVKwg
 xwU9DQbweCbPfb7SnrSXADgqPsF4lVdP9zsoQZIR9HUy2aUBe9kRKuAzeaRP8UyS5AMk
 E/nPFTLjgD+WnqqqgS9LIlTuZACBvgBZ2mbE3kKlax864d/M+qrTAgzs2yVeVERJ2271
 vMTx/LdiJhVtUCm8ph6Iv01CiTj42iENItK5UUp754dQfQLsmmnchn6s5PWEDbylafvu
 tzJIvhikFsRS+4YtJONZtCO9GD/x/2XIIhvRbjYOLNtS4JRTxi3eNvr/CXHfYiaCnGXs
 LB8g==
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
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjksIDIwMTkgYXQgMzowMSBQTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGlzIGZpbGUgaXMgbm90IHVzaW5nIGFueSBzeW1i
b2xzIGZyb20gPGxpbnV4L2dwaW8uaD4gc28ganVzdAo+IGRyb3AgdGhpcyBpbmNsdWRlLgo+Cj4g
Q2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+Cj4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpSb2IgJiBmcmllbmRzOiBjYW4gdGhpcyBi
ZSBtZXJnZWQgdG8gd2hlcmV2ZXIgeW91IG1lcmdlCnRoZSBNU00gRFJNIHBhdGNoZXM/IElmIGl0
IGlzIGluIGRybS1taXNjIEkgY2FuIGFwcGx5IGl0CmJ1dCBJIG5lZWQgc29tZSBBQ0tzLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
