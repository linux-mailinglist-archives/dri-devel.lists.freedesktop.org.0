Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0F51E8C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 00:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEEF89E7C;
	Mon, 24 Jun 2019 22:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07F89E7C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 22:47:49 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA5CE20820
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 22:47:49 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id p15so16359945qtl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:47:49 -0700 (PDT)
X-Gm-Message-State: APjAAAXgBPA1WK/t7jnmvJK2WLjjaB+e/hvRLvY4PkEUhhULUVS63Mp3
 CqiXANqHRxhRDHADifu7SfCg27pKQsc9J0g/iQ==
X-Google-Smtp-Source: APXvYqxlIjRIh2l+yvudNPwYZZU47VyJImJvI4DwxJA9a0YvEE16V980+qj+PoVEKQNRejw/RKwcphoC4/c2U6xGudE=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr79951733qth.136.1561416468915; 
 Mon, 24 Jun 2019 15:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-11-robh@kernel.org>
 <CACRpkdYKE=zLJhmTeTWYGRCQNt3K8+rNNqsp5UDa2d31GG6Y2g@mail.gmail.com>
In-Reply-To: <CACRpkdYKE=zLJhmTeTWYGRCQNt3K8+rNNqsp5UDa2d31GG6Y2g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Jun 2019 16:47:36 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+uCMKhUFgCCK3uUetL9OwokQPaq74GJHQS2VS=UjVH8w@mail.gmail.com>
Message-ID: <CAL_Jsq+uCMKhUFgCCK3uUetL9OwokQPaq74GJHQS2VS=UjVH8w@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: display: Convert tpo,tpg110 panel
 to DT schema
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561416469;
 bh=CNuguc/P7Uhwo23QdZ0+FEJG6Sl7bZvkg9koDHGRBwE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Npq7eKyUPEHt7I0J0hKuLIpspweayj0V9QS0gOnqL+j7TtXzRTL62cNwJJWzLJQm/
 wtD4cfbz+c2rML7Gi3PZOPjORFr0bf5+kyE+2SDqYw/jE23WjzE9AfP0+1cbAHCTxk
 zqOTv+XxbniKpHhtuni4sq2Vx/pDwgKkw9JAeIFs=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNDoxMyBQTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NTkg
UE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+IENvbnZlcnQgdGhl
IHRwbyx0cGcxMTAgcGFuZWwgYmluZGluZyB0byBEVCBzY2hlbWEuCj4gPgo+ID4gQ2M6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiA+IENjOiBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgo+ID4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Cj4gQXdlc29tZSwgZml4
ZWQgdXAgdGhlIE1BSU5BVElORVJTIGVudHJ5IGFuZCBhcHBsaWVkIGFuZAo+IHB1c2hlZCBmb3Ig
RFJNIG5leHQgd2l0aCBteSBSZXZpZXdlZC1ieS4KCllvdSBzaG91bGRuJ3QgaGF2ZSBiZWNhdXNl
IHRoaXMgaXMgZGVwZW5kZW50IG9uIHBhdGNoIDIgYW5kCnBhbmVsLWNvbW1vbi55YW1sLiBTbyBu
b3cgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgaXMgYnJva2VuLgoKUm9iCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
