Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975DCC50F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 23:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F3C6E347;
	Fri,  4 Oct 2019 21:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C102B6E347
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 21:44:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m13so7881737ljj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 14:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Am86CuSg4L4/4SThzqZ+x3OfLvEnqGtERkpRQqbTyyo=;
 b=C5tp7WBmAsH3tftGdWJ3rmAQX0w8e2BU50y780Nn0W843+Aac0wWIhF0dkB8uxACTH
 lTb6Qu3IXLLrBA05rGR9Fu+OCaT0xvpKm5pUQhbuEKuwPF1gFWQUTZx0qnY0pEsPh5Oh
 Hmv1CdCXiTUi8MJ2vGTGJrrGzZVK7xzHC6WK9TYy1o8gJpGQGdevvs4c/4mB2P53ZwOz
 T/k1E5f4acIij27SGUaGlMhIaETEAGe+DJefmn+cTV68Rd134Mi7oQOf5SbEn42G7C8V
 9D0vd9aIwMfy8JCYW445J2ONjXG0SeX3YHcg4RKBeyq3UjJQlMcBYpHfdJDBx5ClvRiT
 yHsA==
X-Gm-Message-State: APjAAAV1TjYoabpiYsJTMkg8y33GqplqD3WHccW2Md9V7iOxIrXVHCea
 Co2j7wF5Xj2J9rPTsseL8z1aRB0apfawPQziPMxDqA==
X-Google-Smtp-Source: APXvYqwroM5221kd6DE0lMFbDD6+AtmXgtU5HwVqu+4VQvfXVATqsHb0Kap1NezC3fWlTCLdds9tQ/fVqjmiw3vaPP0=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr10681582ljk.152.1570225481142; 
 Fri, 04 Oct 2019 14:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <CACRpkdb=s67w2DCGubhbLQTtxpWtiW8S1MECMO4cvec=bF6OdA@mail.gmail.com>
 <20190917002207.GJ237523@dtor-ws> <20190930224456.GV237523@dtor-ws>
In-Reply-To: <20190930224456.GV237523@dtor-ws>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2019 23:44:29 +0200
Message-ID: <CACRpkdZB2Z5fgbgq=aqBmw7wJ_uSE0_fyeOx6f7JvxJwfwjjMg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Add support for software nodes to gpiolib
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Am86CuSg4L4/4SThzqZ+x3OfLvEnqGtERkpRQqbTyyo=;
 b=mHoyMz44D2WiAxEQObuEHX6G00RlGGHzOJlRf4ram5Uw4WSYGsCgGObrFsOGL0bJUT
 aiOzQh7CHwV1qQrdMAcusBqOeNWE6EjE6sSFbCZcwuTGGZn02ga15PNfBS2AMwITwVdF
 EgKmzjP7XWS2xGmR0xPdrifdKD01SMM9eyR/Bt3tAd77+2Ivj48bbb+2FqdbrTquiFwI
 AcH8C6wUr68r8TNz0boFXRi344UGq9c9qA49TbQE5FyalLJ0dE328a/7G+MyE//kvAAz
 jYVahOt3Ou685MUsdu1JMEGKJNG2KJmxEad8vqpvyFD797Go+4+z9KOMWd+4luzNMZhI
 +H7w==
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, netdev <netdev@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxMjo0NSBBTSBEbWl0cnkgVG9yb2tob3YKPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+IHdyb3RlOgoKPiBTbyBJIGd1ZXNzIHdlIG1pc3NlZCAtcmMxLiBB
bnkgY2hhbmNlIHdlIGNvdWxkIGdldCBhbiBpbW11dGFibGUgYnJhbmNoCj4gb2ZmIC1yYzEgdGhh
dCB5b3Ugd2lsbCBwdWxsIGludG8geW91ciBtYWluIGJyYW5jaCBhbmQgSSBob3BlZnVsbHkgY2Fu
Cj4gcGVyc3VhZGUgb3RoZXIgbWFpbnRhaW5lcnMgdG8gcHVsbCBhcyB3ZWxsIHNvIHdlIGRvIG5v
dCBuZWVkIHRvIGRyYWcgaXQKPiBvdmVyIDIrIG1lcmdlIHdpbmRvd3M/CgpZZXMgSSdtIHNvcnJ5
LiBJIHdhcyBzd2FtcGVkIHdpdGggc3RhYmlsaXppbmcgdGhlIGtlcm5lbC4KSSBtYWRlIGFuIGlt
bXV0YWJsZSBicmFuY2ggYW5kIHRyaWVkIHRvIHVzZSB6ZXJvZGF5IGZvciB0ZXN0aW5nCmJ1dCBp
dCB0aW1lZCBvdXQgc28gSSBmb2xkZWQgaXQgaW4gZm9yLW5leHQgYW55d2F5cyBhZnRlciBzb20g
YmFzaWMKdGVzdHMuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
