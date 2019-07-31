Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F07C533
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 16:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C6989916;
	Wed, 31 Jul 2019 14:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D6D89916
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 14:43:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b17so47671006lff.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 07:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KPXFjjONkZjk+QhsiqsCSSD7dqbWf2ywnlPRvZ8gixI=;
 b=m4khO8axDlUMZcOUztbqp9b340eqUN+EyrGS6YeGXP1th1Mb7rR5IedXK2SNYuHydR
 KQU1e5jieZfkyHIU6tq4zynFqVS2XTv+TTqcNr3Jdp30TOKOMxuGZBoXE7RN+11dPzfb
 5Q4nEf7OANdPtBcZ/IvakuTqpSHBYbazsp2Zc9gAImLo1thfhyDdfzF2vg/BokJ0tjXz
 y9Fh30KQFKOpBPHfgdxi7NQ1ffce3PaW7gRDGM5Z/Yo2SnOdKGGFjIb6ln4o8v3pUah4
 5kq/ltAOy2xc75fqusf5ZI5iUqETdeI9cN006Nt9LKCBdc0Ka8EPLBr/HA5yBV9FHxtr
 ZrUw==
X-Gm-Message-State: APjAAAUfFxUqe7nZtTlTz5zA8Mr6/PavOaNMjLO5Q8vmGE5ZxL2j14lD
 cUG2snqBcvyJfkLLCjySp2v6/tFg/2YiIlUyT+E=
X-Google-Smtp-Source: APXvYqygpHQFKPnj6BO1hqHn6Ij7xVfMs5QdPNXO/94e/Hw1RB9FX/CJz9+niC5JDPx4i0aT0dMN3KSX76AWC9rswW8=
X-Received: by 2002:a19:cbd3:: with SMTP id
 b202mr59221363lfg.185.1564584221471; 
 Wed, 31 Jul 2019 07:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563983037.git.agx@sigxcpu.org>
 <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
 <CAOMZO5BRbV_1du1b9eJqcBvvXSE2Mon3yxSPJxPpZgBqYNjBSg@mail.gmail.com>
 <20190731143532.GA1935@bogon.m.sigxcpu.org>
In-Reply-To: <20190731143532.GA1935@bogon.m.sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 31 Jul 2019 11:43:47 -0300
Message-ID: <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KPXFjjONkZjk+QhsiqsCSSD7dqbWf2ywnlPRvZ8gixI=;
 b=l/8ghr+t920KkX4P/sZvL73iKiZu4M4l+Y51L8wmWkr0PAY9KZcE75OFeo5KKVLGhM
 cZZXhyHqJLXznkgDawUG3lP+GVGxN0mBQDaVA8CLv08Dw6Rgc6b2ReIjA6Pbep6ycNYX
 AU0XwyiKfKWjZuIbNoc+e/KquQMk/19e0u7IRn6o6qUZCJxCBWT9k+bMHfCZBm5OLbEt
 uDqJG907R4mC5ky5U1wP66iRG5FhMz0mkw0jHJ2XeXu1a8ftkwqcTM2iXEPkAFv+N1Wl
 HMmnHQQkDOkGlp0w3u0SIS9u7QIRP3Ac35Ii32NeGDU8boPn0ufVDVbH9I9KWvH7YziD
 HH4g==
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
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Chris Healy <cphealy@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTozNSBBTSBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPiB3cm90ZToKCj4gVGhlIGlkZWEgaXMgdG8gaGF2ZQo+Cj4gICAg
ICIlc2FibGluZyBwbGF0Zm9ybSBjbG9ja3MiLCBlbmFibGUgPyAiZW4iIDogImRpcyIpOwo+Cj4g
ZGVwZW5kaW5nIHdoZXRoZXIgY2xvY2tzIGFyZSBlbmFibGVkL2Rpc2FibGVkLgoKWWVzLCBJIHVu
ZGVyc3Rvb2QgdGhlIGlkZWEsIGJ1dCB0aGlzIHdvdWxkIHByaW50OgoKZW5zYWJsaW5nIG9yIGRp
c3NhYmxpbmcgOi0pCgo+ID4gU2FtZSBoZXJlLiBQbGVhc2UgcmV0dXJuICdpbnQnIGluc3RlYWQu
Cj4KPiBUaGlzIGlzIGZyb20gZHJtX2JyaWRnZV9mdW5jcyBzbyB0aGUgcHJvdG90eXBlIGlzIGZp
eGVkLiBJJ20gbm90IHN1cmUKPiBob3cgd2hhdCdzIHRoZSBiZXN0IHdheSB0byBidWJibGUgdXAg
ZmF0YWwgZXJyb3JzIHRocm91Z2ggdGhlIGRybSBsYXllcj8KCk9rLCBzbyBsZXQncyBub3QgY2hh
bmdlIHRoaXMgb25lLgoKPiBJIHdlbnQgZm9yIERSTV9ERVZfRVJST1IoKSBzaW5jZSB0aGF0IHdo
YXQgaSB1c2VkIGluIHRoZSByZXN0IG9mIHRoZQo+IGRyaXZlciBhbmQgdGhlc2Ugb25lcyB3ZXJl
IG9taXNzaW9uLiBIb3BlIHRoYXQncyBvLmsuCgpObyBzdHJvbmcgcHJlZmVyZW5jZXMgaGVyZS4g
SSBqdXN0IHRoaW5rIGRldl9lcnIoKSBlYXNpZXIgdG8gdHlwZSBhbmQgc2hvcnRlci4KClRoYW5r
cyBmb3IgdGhpcyB3b3JrIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
