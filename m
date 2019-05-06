Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF911144FE
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4AB89213;
	Mon,  6 May 2019 07:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF73189213
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 07:07:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d15so10105570ljc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 00:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CwhE2uGZiLqXEkI99lHZnisKdDy8+j12/x0rEBhmeMM=;
 b=kQlQzH8fq31TB0JbQ7sLYxlvog7TVa8sS9D/DeY5Lvs1mJjnhmZsx6tCAHq1m2eIs9
 OPuUMoZaQ5jHxYPDkM62VbZdug5UYuNRDu9KlHPapB6VF8RtO3bsV290HH0Y9mViD5ra
 2zHh2ltem1tJD0aB/APU/jKPpilZxsNBeT7Ss/0deL6zS/riLvVF5ww7qCYYxT7K/ytP
 5kz/wcQMS+kVwIlIom99tLK5GdorunSgbXaGm8bglB98LUMWTrtjCjdYMe0EXxEIyKzB
 FCz9HIFXYiX2CnDe0OMSek/jGAqM3InqebZn5kxdlDK9XnZISzVD6U7/9akZHm/+xkYp
 tdug==
X-Gm-Message-State: APjAAAW3fhv9gZB7IKkpmAmJdbijfk4bAViaciZqd7oJ4QT9gpwVRTnv
 19imV9eNkgAE2nRJBB+5Eq94w6aMcYD5ofYYfP2AvQ==
X-Google-Smtp-Source: APXvYqy5QhAAjdwvG22vzOX8m6OHCd2VKpL1I6A8CX0v3BiwyS6su6YLuw04TDhpCSaHEIZ/H1RuHvzvAIH2QzK179o=
X-Received: by 2002:a2e:834d:: with SMTP id l13mr13133044ljh.97.1557126451228; 
 Mon, 06 May 2019 00:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-5-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2019 09:07:19 +0200
Message-ID: <CACRpkdY_SwZMudmKaC90Q8O4OnhjVLeGN2ZU29xGw3FGG3uYiQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CwhE2uGZiLqXEkI99lHZnisKdDy8+j12/x0rEBhmeMM=;
 b=l2L8hf9litttSO44g7UtX5hvurVX6oUBgrgVujLll+Rl/TJbvf3yhbIMo9EhmEZ9Rk
 Wa2kzhcPXWJ1bcoLMsvfOY2kCOo0Dp9p+w3OEZsKkK4mKLpsiY1e935zU70ZGM5BvbjH
 WQHijhdwJToIsiTpW66nmXUpeAGgGsTgL2YH9b3xSEgDX996kJl1VxdiNLu3a54gq9y8
 s6bqhRSSGn90aGEWOpIXvBqEf1+xLT9YdV6OpKZyCSTnbF8IYG0R1/R/nVPrV3mzSSUr
 r+RrzSE2Cwn8yJsRl+MCGGc+Nv8WEiF/H4gRbUC007pQnjF5URyBaMLARwq1JvbYca1w
 IVkQ==
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgNSwgMjAxOSBhdCAzOjA0IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gQWRkIHRoZSBNRFA1LCBEU0kgYW5kIERTSSBQSFkgYmxvY2tz
IGZvciB0aGUgZGlzcGxheSBmb3VuZCBvbiB0aGUKPiBtc204OTc0IFNvQ3MuIFRoaXMgaXMgYmFz
ZWQgb24gd29yayBmcm9tIG1zbTg5MTYuZHRzaSBhbmQgSm9uYXRoYW4KPiBNYXJlay4KPgo+IFNp
Z25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKRnJvbSBt
eSBsaW1pdGVkIHVuZGVyc3RhbmRpbmcgaXQgbG9va3MgZ29vZDoKUmV2aWV3ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlq
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
