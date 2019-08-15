Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03B8E70A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EB56E940;
	Thu, 15 Aug 2019 08:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64306E934
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 08:35:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v16so1124271lfg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 01:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LckeMEL++L98xkE6bRHUomn8itgtRqdrAYiiSW7aPt8=;
 b=EuQjSSAZO4syU94XYeKtV9238cSXftBNh6zHjYe7knmqzwenEI4xwphCa8UzI8poqv
 yCEx+Rd3nU/8X+djHzaq4+c3TyGayOpfgRqalg+Y9s9mX0A2oYmHbYBMJCC2jgpxy+2r
 9NnMlxNW6UXKHNbk1+N1bqSCms+FqH7XQZDSgZOR3IOualoFUU4SH9dvXo1e8Ix0VIXZ
 txE49rimK23kfQ0IuE78+EFGyYyri14o9ZVm2wZwDeA9RJdr7kc3S/HPXkJnFOFIsF8+
 8HYNPgPY5glXtXU6kR7EEdDQ2vbw5q3Tt1LazDBPCCbHQd+Mx/K88eW50eNtQxbs+6tL
 bhzQ==
X-Gm-Message-State: APjAAAUZjXLe8wcMgnEEuIRD4iDynjL1mXBZ0onlUCMFUGyu2heYx9aC
 wECcEl/PNLY2KHdcjKlMdoCL/s+Zbn7ZnO7fHIPQaw==
X-Google-Smtp-Source: APXvYqwK1EXF1OlxOI1zDtBRCI1LlnDOnp15wcax8wzG7tnNStvRwTaXt1N5txPI2Ni93wI6DJH8/9XBc1qmOdGdFeU=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1783154lfy.141.1565858143676; 
 Thu, 15 Aug 2019 01:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-9-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-9-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:35:31 +0200
Message-ID: <CACRpkdavMPW1gv8jGUJb-48+=9XCmT=_bsMQFEx3Tk06aQNcAA@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/hdmi: silence -EPROBE_DEFER warning
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LckeMEL++L98xkE6bRHUomn8itgtRqdrAYiiSW7aPt8=;
 b=jPedfFTQpgM6N16VFCMmcxfHRcTAvQLEVyl2L+pi2uNbG2bAZTYPJy6zsyYd/zsq75
 qLGM6kd/VOPA6/+zGy4f2K6XHTk26IBdEHY/QLWxecOs/9lvtdbmOJfZwKIQJ7DlE+sE
 YPADIXmnziNit+bcqcv1rMbb3OPAfelMCc27OtpaNVFdT2cms0GzvMd1b8R0vzNSkYZj
 89bhsFLRmjCXBeGnfb0+txiyL5JPTobZE1xPE4SJnCl4HZqvVhB6UcxWPwOK7DObetSQ
 fffSbk6TjILxq9Q88zUiRn1VeY8FagM25tADUr0X8nG874svkQvTRhpsxvLxr4M5G22L
 rQ2Q==
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFNpbGVuY2UgYSB3YXJuaW5nIG1lc3NhZ2UgZHVlIHRvIGFu
IC1FUFJPQkVfREVGRVIgZXJyb3IgdG8gaGVscCBjbGVhbnVwCj4gdGhlIHN5c3RlbSBib290IGxv
Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3Jn
PgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
CllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
