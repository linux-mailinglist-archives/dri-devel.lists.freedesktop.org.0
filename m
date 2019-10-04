Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8EFCBD7E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73806EBB6;
	Fri,  4 Oct 2019 14:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF20D6EBB6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:39:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n14so7496198wrw.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 07:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YSJx2AVpZIhH/SmIkBCouxV6Yw+6RdyUnfQbUQg9xHo=;
 b=GTXg3eLx29Ovq11oMyW+i8huc/qw9bDrPw8sznVGRV1C1UMDk/6vY1mbXQl1braB3D
 OrHizmloTLueYmDATQfILEgQvJ+ihYDqr7BUvMTmtbdwn3TRDPcyQTWseftaaiQWj4Iz
 kr6f216+Yo1tg8Hi5QxLQ0Zs+OxVA9V+SJWPp8CFB8yCpUG0cUu9WnYalrQpKPL+9+tf
 T31nZUu4T11fUO/p+VZ2il2XUyJ+q9e9GIx4gs3I3q5ONHR4aDDtHEkxVmhr2l1CfOxI
 Uq6CF3Dp0GuXR2FQG+JHaDVqJ6sJ5a7MKKBGkeK/DTEuMkKee4ll3jewuzMMXpINpSbn
 xpSA==
X-Gm-Message-State: APjAAAWXfRrsTErdQiJ5/tkLoGCobro2g/196dMKCJzpjSs4kbXyqvMZ
 GI7QNFbz6VlKtwfH4POPJVkTTw==
X-Google-Smtp-Source: APXvYqzWsK19yzkIkp4GiYmqNcrSqqri+QClnftj1qCLCnM7D7Z/q2g2MF9SygafVBX8aUWGmDkoOg==
X-Received: by 2002:a5d:48d0:: with SMTP id p16mr2445899wrs.83.1570199942428; 
 Fri, 04 Oct 2019 07:39:02 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id o4sm1065292wre.91.2019.10.04.07.39.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 04 Oct 2019 07:39:01 -0700 (PDT)
Date: Fri, 4 Oct 2019 15:39:00 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v7 5/5] backlight: add led-backlight driver
Message-ID: <20191004143900.GO18429@dell>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-6-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918145730.22805-6-jjhiblot@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=YSJx2AVpZIhH/SmIkBCouxV6Yw+6RdyUnfQbUQg9xHo=;
 b=PsT/Hu4bN1kmMpoS7Yly/JpXitObRi+4sbIGKFaai/teDTC9OsWJHnN90FDzXMmGgu
 vDzmp+y7NDwNf0Su4i1PgkqpGAWXTLkHU2uXngFzosjFEGJm9iyWqkLHpebJx31+UEAJ
 0ilVeTNjLXs6Qq7bLksNbUK5Jq3BV7phYGxtv7wur3XKDa13A531Xm8I7saFpPKrTP6A
 bfI2eLNE5whWj5eKAbahdxGsKH6Z8jk7GpBRJg2p3GUO5HCtk9JODApjwH6OxufpB4Ps
 pXQcjPf66zltB8NNV25hQh2tnppa4/upLtnyfWVk0qsDEe5ejnPtflbSph2LNW9wX0sP
 q+Ng==
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOCBTZXAgMjAxOSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKCj4gRnJvbTog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGFk
ZHMgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciAobGVkX2JsKSwgd2hpY2ggaXMgc2ltaWxhciB0bwo+
IHB3bV9ibCBleGNlcHQgdGhlIGRyaXZlciB1c2VzIGEgTEVEIGNsYXNzIGRyaXZlciB0byBhZGp1
c3QgdGhlCj4gYnJpZ2h0bmVzcyBpbiB0aGUgSFcuIE11bHRpcGxlIExFRHMgY2FuIGJlIHVzZWQg
Zm9yIGEgc2luZ2xlIGJhY2tsaWdodC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBI
aWJsb3QgPGpqaGlibG90QHRpLmNvbT4KPiBBY2tlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1
Y3cuY3o+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxp
bmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgIHwgICA3
ICsKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZpbGUgfCAgIDEgKwo+ICBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYyB8IDI2MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjY4IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5jCgpBcHBsaWVkLCB0aGFu
a3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwg
TGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
