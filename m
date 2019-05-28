Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F102BF29
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 08:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B2489B68;
	Tue, 28 May 2019 06:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C851E89B95
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 06:17:00 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y10so13593520lfl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 23:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWtD8B5AoLXyUNUAp8iNQQwN1DwwnJaVZ5aKCSiblCY=;
 b=IaeZ3Tglh6Xv4d6YH1LRnD4vf7DkbcX+qlOGaDdV9B/Yg4JcMdXvqZb1uGiKhI1Dk4
 OCS2JNLC5YZ3i2wO1/YZ4vv/mQqrtD6xt/crJ/i61bwfjSY5hRfqQPK10QIJd4zU/2Qp
 leKozj+HFW6hZ8ahog21E3kzs2E0t5jhL5jeQreNEo0H7ssy+BWlMcrv7GXnRy+G6h9y
 3N3rdraddFAnccEOVLNQqJQeUXAmZM0AHoJ2ABziy/2gsP3/D9AKlQ7bqnf1xgk80l85
 m2utXVr7gT1NkuO89dPv8rCn4XvjcMuK0l8hUDBLW4/meX/1+h7HqF+MwN57ioVzIItD
 qbzA==
X-Gm-Message-State: APjAAAXCBB6mO9ONbUjH+3lylMAQheKvKZWcd0U6rdDjs+YFvPNWY6qr
 lOdIt2f9Jm6RT83ubXIcMiJ6ILIHuN3qRIEhPjqsVw==
X-Google-Smtp-Source: APXvYqxCh//v38fFGfUQsg5VRhIuqV5mMzHiENkjZG39h81lE1a1COYA/jgEFIELxDloPd8yJmz+5SEHbglfmyCN5ms=
X-Received: by 2002:ac2:429a:: with SMTP id m26mr2868415lfh.152.1559024219140; 
 Mon, 27 May 2019 23:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190526180532.1641-1-sam@ravnborg.org>
 <20190526180532.1641-2-sam@ravnborg.org>
In-Reply-To: <20190526180532.1641-2-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2019 08:16:47 +0200
Message-ID: <CACRpkdYsx7_7ZG-=y6_jemg98LmfanRGeK2bcVzAYvei8Baq_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: panel-innolux: drop unused variable
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BWtD8B5AoLXyUNUAp8iNQQwN1DwwnJaVZ5aKCSiblCY=;
 b=Wj68hmaEHbFBAdBkGER/ZVgnw/cr+0ICsAedRruI2K+3/Rku+6te9EE9jvE73F2hvp
 zUpoluf9IIFUTjV4grWTww3VspXlDMoHCy9759iMrZnz5XZjpRD0Tt6WkNyvkxjQDyUx
 4P1jD196G42BQHD4BDjV3IUObZOxxmN5fGcVToJJSx1R5l+GCqn1WndVGlOmO383E+UA
 RGbbeQ1hr+z2lz0yANVCVpd9MWA+lFhqzIlCIpXzK0IaXug8Txrq/biKOrNQVsCoAyBb
 Y8MuNDhD61vAboejh4hGw+ENrU/f5lj5HwqXBshCREVa+BtN1YR36tgPpHeATfCztmqq
 SlgQ==
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
Cc: Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMjYsIDIwMTkgYXQgODowNSBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgoKPiBUaGUgbnVtX3N1cHBsaWVzIHZhcmlhYmxlIGlzIG5vdCB1c2VkLCBk
ZWxldGUgaXQuCj4gQnVpbGQgdGVzdGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
