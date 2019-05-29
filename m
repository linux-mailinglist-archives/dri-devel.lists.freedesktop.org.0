Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F12E094
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 17:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA62F6E2B2;
	Wed, 29 May 2019 15:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2350B6E2B2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 15:09:34 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id g16so2110493iom.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 08:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZnaDev0tj+heu2iB5lB6hq5yDeKgLXO4KFHMV/Qt+5k=;
 b=nACYZMXcEcQF1zRNt4OFTSMtwDDuoFbQb4OMKR7+0A5J3C9RGpLMA4T/a+AQQs/1Av
 x/brb2vqYBZQYW3PW54h170LtfoK8AYRwDhOMC3/r5/+qWe4GwVvhdc7uFnb3mXLGX09
 XiTVFjNn4lMlAPMh3FfhnZPU4Y1TogmKmKhedlURdpndeQBYFArjxhroE1QvVjpr0IOH
 PSmh84jUxrky96mNW9DL9dOAcjfiVNsJQrB37lyUUKpIfmoq3oKVt+uXx36OuCx/Bhig
 0gEGP13RQClqRwM11wjzv5AercVcrA8n1KQr64SCpNL9iWY/tT+yVDtPT6h2tDbf7JvY
 LqPw==
X-Gm-Message-State: APjAAAV6LnPoZjNB3YNMXnv4WdSx3hOOwCPKCFOeyNXZsyXqZfc+KKzk
 6dgkAUvVqwvYOWRxUN/KxF9FMALdDvMU2P3y7LURKZXw
X-Google-Smtp-Source: APXvYqySOnocW0FtjyGqwuP2FQxhmxY7P/texfW33GuY5PwHsuap8yTRqkoaWNnTkj3NpjtfrGddYcbbqyuWzUYQqNA=
X-Received: by 2002:a6b:7:: with SMTP id 7mr828192ioa.253.1559142573556; Wed,
 29 May 2019 08:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161102.29620-1-peron.clem@gmail.com>
In-Reply-To: <20190521161102.29620-1-peron.clem@gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Wed, 29 May 2019 17:09:22 +0200
Message-ID: <CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMSBNYXkgMjAxOSBhdCAxODoxMSwgQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVt
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KW3NuaXBdCj4gWyAgMzQ1LjIwNDgxM10gcGFuZnJvc3QgMTgw
MDAwMC5ncHU6IG1tdSBpcnEgc3RhdHVzPTEKPiBbICAzNDUuMjA5NjE3XSBwYW5mcm9zdCAxODAw
MDAwLmdwdTogVW5oYW5kbGVkIFBhZ2UgZmF1bHQgaW4gQVMwIGF0IFZBCj4gMHgwMDAwMDAwMDAy
NDAwNDAwCgpGcm9tIHdoYXQgSSBjYW4gc2VlIGhlcmUsIDB4MDAwMDAwMDAwMjQwMDQwMCBwb2lu
dHMgdG8gdGhlIGZpcnN0IGJ5dGUKb2YgdGhlIGZpcnN0IHN1Ym1pdHRlZCBqb2IgZGVzY3JpcHRv
ci4KClNvIG1hcHBpbmcgYnVmZmVycyBmb3IgdGhlIEdQVSBkb2Vzbid0IHNlZW0gdG8gYmUgd29y
a2luZyBhdCBhbGwgb24KNjQtYml0IFQtNzYwLgoKU3RldmVuLCBSb2JpbiwgZG8geW91IGhhdmUg
YW55IGlkZWEgb2Ygd2h5IHRoaXMgY291bGQgYmU/CgpUaGFua3MsCgpUb21ldQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
