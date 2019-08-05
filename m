Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E130C815AC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C2D89FC5;
	Mon,  5 Aug 2019 09:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B089FC5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:40:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z28so24511736ljn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 02:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v6nHWw38PrNdn5IqJLy2kmE9JSXT2ARkxxd5IIHgNGE=;
 b=J0RS0hol6JRub6iGSYCFqqozvrkmBADWuQaaWqKrcwYxAGbHdlu1t2KXln4xXBR1KS
 uU3fR8q8+kNwXkoalX3yqttdYn/EHKjZWapSCNx4KW93MJHffLl+cjgdggjoSHJSBu/d
 TE7L9DZz5iY3pTNszMUaWEarcqlEFfAYtYYM4zxdvEeHCZTlrxBcUfKQUOEUOPeCModj
 jQDzCwkcO+IuWLlU2y7H+i2+h7PUzKv9Xp90M6ctXuMxn0vFY4i8TTodpwaJVqpSkdOM
 eOWnxwmYpiKt1oiEPKfxJh0Ceepvek060xLuURdSiZ5mw3k7y+fVG4ABAv5uWh/B0AqN
 mBaA==
X-Gm-Message-State: APjAAAWuGGnD/jLySOb2gmW/xWPsJbwbkrJGQACY2Tgq48B9sK1IGA4O
 5Cw+tKAfJcbvKH5xy47OQWQwdRDdHSTIbXJYtS+zTw==
X-Google-Smtp-Source: APXvYqydAtkGQW5B7ltoPSSTGn2bB6DrqW7USuQxQsNFUa9LkCzXRmVEA3Rn+uDDb7SGn1NDSYgxCpmqzAC8aer2T7s=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr9646155ljg.62.1564998043713; 
 Mon, 05 Aug 2019 02:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190708112803.12432-1-linus.walleij@linaro.org>
 <CACRpkdYYmVjBV+gjiPfjzGUeP-8w+E8AV392ed2Y8cF6AeNPBg@mail.gmail.com>
 <20190805093107.GA29747@pendragon.ideasonboard.com>
In-Reply-To: <20190805093107.GA29747@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 11:40:32 +0200
Message-ID: <CACRpkdb7w7yKJxwt=7-Ao4wfmeJHt=_n6P4085G=+j5D3O0O6A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/megachips: Drop GPIO header
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v6nHWw38PrNdn5IqJLy2kmE9JSXT2ARkxxd5IIHgNGE=;
 b=sXLzcc6mXJbLZQ5Oxjdn7qKDmXqqibx+CvFr7RXMJ04V4C1u6G0b1Dq1CcZkaXZGU9
 WIBf9jWA1D/N1O606UjEyX4pc5vNiGb7tn7dEj6zdfR2qlgyz4LcQwWmI8djGc3PnEhI
 O1nRir3l633NBmVL5+ZdNmTQZqVrqBXssXcfR2bGKQuKp7gK3qo3cH1epnxsvrzK7BYI
 f3JR9iuulmv6ckQOpQkCI8yDMjf8tT2PHRdUwtaINfKKuO2VSQqg/X3OkbaYgiwkba1N
 EYiqIzrM6Ot7TSFRcqsF8+4vJvFOvXc/5pNdnGNLt75wiQplho1WLRTStkrljtR8+LzB
 Yr/A==
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAxMTozMSBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+IE9uIE1vbiwgQXVnIDA1LCAyMDE5
IGF0IDExOjA1OjU1QU0gKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBPbiBNb24sIEp1
bCA4LCAyMDE5IGF0IDE6MjggUE0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPiB3cm90ZToKPiA+Cj4gPiA+IFRoaXMgZmlsZSBpc24ndCB1c2luZyBhbnkgaW50ZXJmYWNl
cyBmcm9tIDxsaW51eC9ncGlvLmg+IHNvCj4gPiA+IGp1c3QgZHJvcCB0aGUgaW5jbHVkZS4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgo+ID4KPiA+IFNvIHdoYXQgZG8gSSBkbyB3aXRoIHRoZXNlIHNpbXBsZSBwYXRjaGVz
IGFzIG5vb25lIHNlZW1zIHRvCj4gPiBBQ0sgb3IgcmV2aWV3IHRoZW0gZm9yIGEgbW9udGg/Cj4g
Pgo+ID4gSSBndWVzcyBhcyBsYXN0IHJlc29ydCBzaW1wbHkgYXBwbHkgdGhlbSB0byB0aGUgR1BJ
TyB0cmVlLCBidXQKPiA+IGhleS4KPgo+IFRoZXkgaGF2ZSBhIHRlbmRlbmN5IHRvIHNsaXAgdGhy
b3VnaCB0aGUgY3JhY2tzIDotUyBPbmUgcGluZyBpcwo+IHNvbWV0aW1lcyBhbGwgaXQgdGFrZXMg
dGhvdWdoOgo+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KClRoYW5rcyBMYXVyZW50ISA6KQoKSXQgZ29lcyBmb3IgYWxs
IG9mIHRoZW0gSSBhc3N1bWUuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
