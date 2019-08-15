Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C68E703
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9742F6E927;
	Thu, 15 Aug 2019 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8113A6E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 08:35:24 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j17so1161332lfp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 01:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIQuHahZHT61N3pBhyPaMSRx0lDKJTzgLeGkPUGpwnw=;
 b=BX1Nz0grRXUJvnmqQcz6WodgB1eaHgQj4bD0lFRSV909FeusoZ6GvN8y+wlW4IcgDC
 2UzVyNsPoZS5GJ9CLZeUo6dq2nf/+nOa/JmVgADBfaKsBn/vcLz6sFemC4OCoM13eAF5
 Fm+FQwTEvW4iXVNCx3Vgw14DPYH0Npn8cO+Gs/eCIlSOjU6BtS8NtJ/Cur9CjRcUzA4Z
 TcdHZFuspE+qRg82gRMK/9MKa+Yd8Bd4W5PyEcMkEsuHPJ9/GQddrSLUcP1SDQ4TtYES
 4bXsFS+t+nSBnD0G0qS/1b7ucLEm08p2oYyb+/RnDWyeYtK+Z5hPvU6z87BsCvZAXEFX
 pcsg==
X-Gm-Message-State: APjAAAWlllzvSZqRP2FHoPe1Jj2zJYTOQq1czWQ3XEI9P5Ji4qLjndiJ
 U7nL8plLXi2geOtbDZrhAPav+yTXhgXIy+FmY/7Oaw==
X-Google-Smtp-Source: APXvYqy4JWhaSExzEs8fNpyvhhFIffJYnQjxDmgWOFMcNEneP7xcjaUdbR6c+1Du9tQXJhhtHsvVS1Z3y4aDb+ws8Qs=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1829550lfi.115.1565858122600; 
 Thu, 15 Aug 2019 01:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-4-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-4-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:35:10 +0200
Message-ID: <CACRpkdbCwUbn68trGZTN8pe8rF8x6SeAW1gd7bwFTs3z-6vK=A@mail.gmail.com>
Subject: Re: [PATCH 03/11] drm/bridge: analogix-anx78xx: silence -EPROBE_DEFER
 warnings
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rIQuHahZHT61N3pBhyPaMSRx0lDKJTzgLeGkPUGpwnw=;
 b=Y+FH2yajTgKkaI7nsmE3WEZkZeDokd2RUNA2EldWJj3L3ayjASGWVw8k2Ij/OubaDA
 M5j0TR6ZH7t2zzUaVTqdINB8m5lZjQKpnPOSypEFo2alm8nos9NKEpcKFvMeG4r1uAGP
 8AaHAOiGbMsxK4DiqokN1Oe/6ULi7Td0OYQaU6PgDrUrliFei/NY6KsdXRXQTJ6grcA2
 +XXBHx1lgL1P0ofcfjauBj28vKllqp7gfVIDQ8OSvDzcvPiPEFztsRnRSqMrrh/2PyyG
 Dd0SqjtUzV6NYaebRMJOREUG+7ff7D1na1lXslQREjafp/2W4q53ICtF5IW5iS9XRfz6
 bsYg==
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFNpbGVuY2UgdHdvIHdhcm5pbmcgbWVzc2FnZXMgdGhhdCBv
Y2N1ciBkdWUgdG8gLUVQUk9CRV9ERUZFUiBlcnJvcnMgdG8KPiBoZWxwIGNsZWFudXAgdGhlIHN5
c3RlbSBib290IGxvZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBv
bnN0YXRpb24ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
