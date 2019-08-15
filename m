Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BCA8E617
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C8A6E8C3;
	Thu, 15 Aug 2019 08:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901F16E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 08:18:41 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j17so1135245lfp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 01:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n93Dng/Ji8MdS4CMyB8lWHjceWaq72wrZdpqfUie2jw=;
 b=mKthPysywZ/g6NHOBpxY5kDgyf8eAdnouhWXmuHKte2EKYHWvJryD4MUNbcgKfxFP9
 xixuFschJ3GcIDNXHR7go6Yda+c3GB0IcLtoC7tzCaBIaT/YSeZHDUibVmm4cIEVzW+x
 Rb5RoQYMI4lRPHb7OB7GjMBf0A6ER3H8UnRoxxw8WBd4T76c3+vQJVlJTCdH76gXbEPj
 PhrQPZc8+ApUofscSd0FDxXjyFEaRqdvq6FxWLcld8xu0uB/hWWrCEYI3UqeiM522Rpr
 +V7TQpX3UCe+RlU9ruw+8PekuNtRph74eMgA7xSp6LVroXmkgUCaKbV40P0HnRW6nnGQ
 8Dew==
X-Gm-Message-State: APjAAAV2gPVXayE1C/RhQHjMhqUqaQ+ri0xG4Zh/K+3VHK9fGma9kRAl
 ygD46WDlyDlM1zusZuGp1Zl03IydAOPpGpAvdonfNg==
X-Google-Smtp-Source: APXvYqz+3m9CpHTiryHGgaHMtDawA41PP43UTCZWzylvPS7O0bar1RDoxUlI3ihahWRnC9SzzajOeS5xqZGxmVYZE8o=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr1883275lfn.60.1565857119990; 
 Thu, 15 Aug 2019 01:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-5-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-5-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:18:28 +0200
Message-ID: <CACRpkdbj10yneOP4JKFGXyiY4e1vS6-oB=W2vs6nj_X2uAY=pQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=n93Dng/Ji8MdS4CMyB8lWHjceWaq72wrZdpqfUie2jw=;
 b=n917679wlyShUhrE5Ig3CFfBox9eY1vDh5kRoK7P3mDg7njrsuDaJ4qJSjP0n0hbvN
 6XifsLDIS3pWYVy7ZekSuZ95mPYr4uznZ084qrwwJW9GSUwY02fmoiMMGjcPWsPLiNYJ
 BJt4KywfKUnhrIVLnU600Uws2yZ9Et0XWqrlcCzH7U6LxN7OD1HNTr293DBvwy30Q1cs
 11+aPHS28sOkmSS/L2JI9Bmr2f3qQsIvSylZyRF9Pv2QANJ0oTZ7TKwfE6F/SM1L/Nyw
 XBCZnmBV99kF3Gb8iTlXZgSaY1JtoKpN45vN06DanE0j0nSsx191aIGKHyhj6a+FPHth
 etVQ==
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFRoZSBpMmNfbmV3X2R1bW15KCkgZnVuY3Rpb24gaXMgZGVw
cmVjYXRlZCBzaW5jZSBpdCByZXR1cm5zIE5VTEwgb24KPiBlcnJvci4gQ2hhbmdlIHRoaXMgdG8g
dXNlIHRoZSByZWNvbW1lbmRlZCByZXBsYWNlbWVudAo+IGkyY19uZXdfZHVtbXlfZGV2aWNlKCkg
dGhhdCByZXR1cm5zIGFuIGVycm9yIGNvZGUgdGhhdCBjYW4gYmUgcmVhZCB3aXRoCj4gUFRSX0VS
UigpIGFuZCBmcmllbmRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
