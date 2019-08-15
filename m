Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC68E610
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223F36E13F;
	Thu, 15 Aug 2019 08:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B7F6E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 08:18:12 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u15so1548162ljl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 01:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7xfr16BH5ZJjmVp0865t1tdCv0TJfQQ8MOvl0IA0RI=;
 b=PLQcMSnbgn1Gq025hc95CgCxyLfTKEo+Ug6VztHLw+lxoYnzoD8SVPCF7dTqpVL+QU
 eQxzCvJB+fyCex+3z2pOqLy0Sul9lSZtEqx8pgU08FlxOvj4uR4acNerYsLG6L24hn1T
 m1lsauAoJmA8n3pTnbEJjtkD5m4deVEcoIPB0+k1kaElbeMH33nt29iV8PooesPwm9qH
 hEMtFljd2+XDo91YXaJgYQTlKCN0bD/GnAF4aY8KaZohf88PsTh0cqGSB6Ea8m2saG65
 oOfv4/YBZ0koaUanSGWGsUV8mmsSTl2ViWpswMqzmhTqIYghzeUEThN6aIuun10hC+vZ
 wMDA==
X-Gm-Message-State: APjAAAVgQTEgkKQgeNfmRKQKmwbGEwbQIHTy5uvQWnBEBkxfeDfbKRwZ
 EMyDf1mXiXO5Cszjvin2MZTSkHyEG9etJvVKjDj7RQ==
X-Google-Smtp-Source: APXvYqwlNuGYnM4syJ7wAaplZofwwfNvfLAdOC0xu1V73tUg0jS10SDexNQ4wMU3AxJ+Dtlu9zFGYve/VAiy/marM2E=
X-Received: by 2002:a05:651c:28c:: with SMTP id
 b12mr2044788ljo.69.1565857090860; 
 Thu, 15 Aug 2019 01:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-3-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-3-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:17:59 +0200
Message-ID: <CACRpkdaDHoJvoH93Amzv2gSDGbgAsF-iNLiEFA3Fuov3D4uh5Q@mail.gmail.com>
Subject: Re: [PATCH 02/11] drm/bridge: analogix-anx78xx: add new variants
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=W7xfr16BH5ZJjmVp0865t1tdCv0TJfQQ8MOvl0IA0RI=;
 b=h/iE0ACwRL8YZpox9tiry6Y6F9AtQ6fulXq/U4nRshmUS5LIgMjgsMcGGCCmgSfY0J
 nglNTBQxeLzOt23t5VWv3b16qAW7RU72nYgfDHIc6rn/87aL9AlP5VRxR1gOtdNN2rzJ
 CE8Oaxl6PzFKEDehEhvT9xMnQ2BuRQKgGSacBPydzgzfPTcdrYIriDbFD0KYhisx/fYQ
 TfxHkfwUUu+WzgWKIvWBuJerhIihKrkXphGv+H3J2ktph4Au4Vf7P8one0DBq1AYscNq
 Ya5pxqW6o6aiYu+tmytDC5UQsm+gOAXmFAltlAlJRfVa6YAKIB8IWmHbMqFum5Xh0C62
 Y8KQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMjo0OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgNzgwOCB2YXJpYW50LiBX
aGlsZSB3ZSdyZSBoZXJlLCB0aGUgb2YgbWF0Y2ggdGFibGUKPiB3YXMgbWlzc2luZyBzdXBwb3J0
IGZvciB0aGUgNzgxMiBhbmQgNzgxOCB2YXJpYW50cywgc28gYWRkIHRoZW0gYXMgd2VsbC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
