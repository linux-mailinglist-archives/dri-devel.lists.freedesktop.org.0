Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8FE58144
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 13:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D036D6E0CE;
	Thu, 27 Jun 2019 11:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2470C6E0CE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:17:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r9so1930317ljg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 04:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+M32KORGemVLrEhCU+mugrqZ6KHhAjcB7ktP25bgUw=;
 b=oSTfIWgHozEm9kyOexhQOq8pt9QUxatFsaOv1iZirc7lzpZHgIONTUd+2TkD5XcJTC
 GBsaEzfOjAYRxvfQiuzPlqcblodSJ/hGblHfBi22MXqUZQvBJ1C2nHS48P/IwX/nppxz
 okSqpzEP+AbtUfNqt1B8oFNLjUHcuGIVMQEJml21ituR05M4xg6M/BH5NUR2Owvvvq+U
 EfYA5xHn1akM9EIhXoPgTckvnLsiySbh9X2T8wwzaz3Lb+LiaGy27D/BrjBguPPdaYFZ
 bOz/LVCsYdZNHGnATO+LGRMQBvOsJlHZwZ3h3NuqD/s8ftvllDKTUmzH+WdgVzeyK40Q
 F//g==
X-Gm-Message-State: APjAAAXryxQvX3GAV05phwDX9ST5RDpzeRxT4+FyZqpI3rwFk/77sGDc
 PXFfUUlwZZ3G/bmt1MYDqEUZd7RwsIn7dgzRXFBZrg==
X-Google-Smtp-Source: APXvYqwhIrf7JDRO2BMtKtOJvp54agYbc9d0DQAtQ0T63qMEcpkYpkkimqLDdz3gA69lWL5g0fktxZUtlvgv/RN7KDI=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr2370304ljj.108.1561634226615; 
 Thu, 27 Jun 2019 04:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <20190625163434.13620-7-brgl@bgdev.pl>
In-Reply-To: <20190625163434.13620-7-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Jun 2019 12:16:55 +0100
Message-ID: <CACRpkdZdKigQ08bf5P9sYf-EhWFn5LmMRPQoMS2O5ouB9h6=MQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] ARM: davinci: da850-evm: model the backlight GPIO
 as an actual device
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h+M32KORGemVLrEhCU+mugrqZ6KHhAjcB7ktP25bgUw=;
 b=JATFfirzIRvl4Bn0MzZWqLXi3Ey2itUpvEWgha059qAjA3IR4c2e1wMYo0c8Z9yL/L
 WyGOxZrDK3Wnpu+UNfnPJmkwU9xOdh+bOAd5U+upstomSDHtE62P4UarRnshyBxTZwJC
 GXuAX0YXnoWrBeA4RM3Qn1INmR+BJS6DN+IzO5VbLtp3T6R99ZjdyYG6rtknT6+hXXwJ
 DPoPboHY7TP74z5yaajm17KS0cWKWMGHFArJHx42qzxQyRY1KKg7LMdAMfkwaPbuyatE
 kXX7rKx4ZmsGCoeVQpyujljI9AIVkuBs6ld7AtEB4hCOp/+cjbUg8oBHYZu0nmkh8mI7
 CsLg==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Sekhar Nori <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNTozNCBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3
c2tpQGJheWxpYnJlLmNvbT4KPgo+IEluc3RlYWQgb2YgZW5hYmxpbmcgdGhlIHBhbmVsIGJhY2ts
aWdodCBpbiBhIGNhbGxiYWNrIGRlZmluZWQgaW4gYm9hcmQKPiBmaWxlIHVzaW5nIGRlcHJlY2F0
ZWQgbGVnYWN5IEdQSU8gQVBJIGNhbGxzLCBtb2RlbCB0aGUgbGluZSBhcyBhIEdQSU8KPiBiYWNr
bGlnaHQgZGV2aWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8Ymdv
bGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
