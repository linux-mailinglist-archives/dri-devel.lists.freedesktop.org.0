Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F6B0C04
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C886EC93;
	Thu, 12 Sep 2019 09:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D686EC93
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:56:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d5so22981767lja.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 02:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=329cG7VF2FWSqrxDIURXoF4mNurdRp+cB0ol/yD2IWM=;
 b=t3DJsa1PG5cYjIEpe/P5eS/PBbI814JJS06MGNEXf/jshGWlSi8Yqvws1k+MBUPPN7
 xJ3SBuPivAdYeyKgBJTeO874PxxkIS/PXNNy5djxAZzJYwGRehDgVYmKuS3/dfxjiIcP
 uV2CMD+jkQTPtbjfjTba/aeq1jJDjgEaaVh8ynYkv3+3j8xoY1e8pn+DohwFN5YLTm8Z
 Fp9ECafnAz9mkM5Y3jA3H4UWqPxXDqfcTppo8sNTqotF0ZjldzLm/l1BcSvJ2490kE9n
 Pxho2fOqz0dCFabjvEIe9fiDW5+rVL0b9TkkLOvPo7qhJJG3R79xJ3+9JpSI6Lqz5lTe
 rFKA==
X-Gm-Message-State: APjAAAX+UksxKqLB5gfeCsanmdQiAIWmNko6KMKSHmtjLE8/jxl/6L9z
 YP7UYzgr+OUwQDXFtmox3wIhAclas9pYlmprkVh6/Q==
X-Google-Smtp-Source: APXvYqxzzu1xektMPHWgtffW/ZJV0KpU2PYzjtvuUtd9AIHNy13c8WglMkiuJC9aHP7eR5XUK9IR4cvejz1fmBwj4RE=
X-Received: by 2002:a2e:a408:: with SMTP id p8mr25771055ljn.54.1568282158508; 
 Thu, 12 Sep 2019 02:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Sep 2019 10:55:47 +0100
Message-ID: <CACRpkdb=s67w2DCGubhbLQTtxpWtiW8S1MECMO4cvec=bF6OdA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Add support for software nodes to gpiolib
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=329cG7VF2FWSqrxDIURXoF4mNurdRp+cB0ol/yD2IWM=;
 b=zQWgVC5tdLMykaX4/vwY9NwQnl84kGz+E6G4gmnU7E7z3xPgxUBAJuq/KLQlPf1oam
 RdLkgwT7ktokKveMir+dbsSJjHyajz6I6pmACAQ/vaCXqP1u+H53qJ9UGfH9Rqw4f+BS
 F8tIL5183K5mqiZie+gUfjKim5aKDftgnnpqvro3Rlrly4++DaglYIiO64u3PqxKyEqS
 vgu3cD+nTugMhX7gSo0wLYQx22Wjix5fu1vewOQSg/1dXyjPdDlBL2ZYcPZ7siq3qChf
 T+vLBgVhPJk/tcy3slq1OFZi3PAwqOrLAaNYWiAa1505El6PWxe3yZ95a9+Hy+PVW/Ih
 wamA==
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

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgODo1MiBBTSBEbWl0cnkgVG9yb2tob3YKPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+IHdyb3RlOgoKPiBJZiB3ZSBhZ3JlZSBpbiBwcmluY2lwbGUsIEkg
d291bGQgbGlrZSB0byBoYXZlIHRoZSB2ZXJ5IGZpcnN0IDMgcGF0Y2hlcwo+IGluIGFuIGltbXV0
YWJsZSBicmFuY2ggb2ZmIG1heWJlIC1yYzggc28gdGhhdCBpdCBjYW4gYmUgcHVsbGVkIGludG8K
PiBpbmRpdmlkdWFsIHN1YnN5c3RlbXMgc28gdGhhdCBwYXRjaGVzIHN3aXRjaGluZyB2YXJpb3Vz
IGRyaXZlcnMgdG8KPiBmd25vZGVfZ3Bpb2RfZ2V0X2luZGV4KCkgY291bGQgYmUgYXBwbGllZC4K
CkkgdGhpbmsgaXQgc2VlbXMgYSBiaXQgZW50aHVzaWFzdGljIHRvIGhhdmUgbm9uLUdQSU8gc3Vi
c3lzdGVtcwpwaWNrIHVwIHRoZXNlIGNoYW5nZXMgdGhpcyBjbG9zZSB0byB0aGUgbWVyZ2Ugd2lu
ZG93IHNvIG15IHBsYW4KaXMgdG8gbWVyZ2UgcGF0Y2hlcyAxLjIuMyAoMSBhbHJlYWR5IG1lcmdl
ZCkgYW5kIHRoZW4geW91IGNvdWxkCm1hc3NhZ2UgdGhlIG90aGVyIHN1YnN5c3RlbXMgaW4gdjUu
NC1yYzEuCgpCdXQgaWYgb3RoZXIgc3Vic3lzdGVtcyBzYXkgImhleSB3ZSB3YW50IGRvIGZpeCB0
aGlzIGluIGxpa2UgMyBkYXlzIgp0aGVuIEknbSBnYW1lIGZvciBhbiBpbW11dGFibGUgYnJhbmNo
IGFzIHdlbGwuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
