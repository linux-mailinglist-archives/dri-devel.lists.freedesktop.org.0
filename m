Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140836ACBF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF2289FAC;
	Mon, 26 Apr 2021 07:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C088389FAC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:15:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id k128so29340697wmk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dnRv0hx7T2iwOT1O1w9fhtRjWFNst0K+ucU5RxAsI0U=;
 b=CeWnh2LbEWabetknFejFcJIDf/OyIRMgwnzJCibLEdA1mrBHcwD038VvBwEracDC51
 w0glPFhn1dzvGTfnN3mljzyH21L96E1IsG8FGzbhjIbX1GXvTosJfgV8soIucfRPICpY
 /nFpBXhCrev0R+4N2L0J7KMxVSs/TcAS5cxM6KpAwk0873GVyEgx7Ht9dX7w2h1NbzVJ
 R9xn+EO6b6o2UCGWzEpH/LHlymsMNiC7cZGwfYVw5iaKV+AepgSgff2rkjuuaadiDwBa
 EEUXkUOW6MPJRk2OZCKo6cZJqo582rV1RCENBv6JXQUQvLTbNeE18QVubrltWB6B97zC
 O+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dnRv0hx7T2iwOT1O1w9fhtRjWFNst0K+ucU5RxAsI0U=;
 b=QsFu+By7b/6pDz7+HCdJdOdCwNFZzSg++Rliqu7gH7vYiQEyvlj9YnUQaRe8nHFtHK
 NyXiMUJTvI4a48esqGqiN8b8AmhrGD1Z6in6ObJ5mLPB2J4y5UebfJBO/peboYz4k98w
 Yx7WCR/Jh7wqXlzCyZcllXD74p5TqMeSLCUcDGCLOtx+8aRhchyTBqCVFumtOC0Y8Ps2
 yLLGp81YK/tsahxm0kC94s4yA29Few6BICbLxdECao4asaPp6Xlbi3BMof3rfmjZ1DHD
 W1Y1BuGErjwvneWv2Ec82KqR0ljUvGhNnFvWPwGnNPtoTNZ57W3yqJOp0KXRk7PlwUvu
 +YnA==
X-Gm-Message-State: AOAM533Px7dNtYpk+/1xCyzsetqSTnPxtgfwkWRHAFbZNaqawXI+qkGw
 N1g0tQG0Qt0OUZFXHX5/DOQO3g==
X-Google-Smtp-Source: ABdhPJw+LljXF/i5dij4rTrhjsbP0UeJSjI2KzKG7Mv+o6cUOME7Jt3lZXQa5cQ0yRYx1HRY999q4g==
X-Received: by 2002:a05:600c:b4b:: with SMTP id
 k11mr20089414wmr.129.1619421319330; 
 Mon, 26 Apr 2021 00:15:19 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e0a:90c:e290:9d7d:4b49:ce60:a152])
 by smtp.gmail.com with ESMTPSA id q128sm4566253wma.39.2021.04.26.00.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 00:15:18 -0700 (PDT)
Subject: Re: [PATCH] drm: bridge: add missing word in Analogix help text
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20210424061817.7339-1-rdunlap@infradead.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <ecbe576f-1a96-a873-3716-6fa478a8269e@baylibre.com>
Date: Mon, 26 Apr 2021 09:15:17 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210424061817.7339-1-rdunlap@infradead.org>
Content-Language: fr
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSAyNC8wNC8yMDIxIMOgIDA4OjE4LCBSYW5keSBEdW5sYXAgYSDDqWNyaXTCoDoKPiBJbnNl
cnQgYSBtaXNzaW5nIHdvcmQgInBvd2VyIiBpbiBLY29uZmlnIGhlbHAgdGV4dC4KPiAKPiBGaXhl
czogNmFhMTkyNjk4MDg5ICgiZHJtL2JyaWRnZTogQWRkIEFuYWxvZ2l4IGFueDYzNDUgc3VwcG9y
dCIpCj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+
Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gQ2M6IE5laWwgQXJt
c3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBDYzogUm9iZXJ0IEZvc3MgPHJvYmVy
dC5mb3NzQGxpbmFyby5vcmc+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4K
PiBDYzogVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNvbT4KPiBDYzogVG9yc3Rl
biBEdXdlIDxkdXdlQHN1c2UuZGU+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50
ZWNoPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcgfCAg
ICAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IC0tLSBsaW51eC1uZXh0LTIwMjEwNDIzLm9yaWcvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC9LY29uZmlnCj4gKysrIGxpbnV4LW5leHQtMjAyMTA0MjMvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9LY29uZmlnCj4gQEAgLTYsNyArNiw3IEBAIGNvbmZpZyBEUk1fQU5B
TE9HSVhfQU5YNjM0NQo+ICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gIAlzZWxlY3QgUkVHTUFQ
X0kyQwo+ICAJaGVscAo+IC0JICBBTlg2MzQ1IGlzIGFuIHVsdHJhLWxvdyBGdWxsLUhEIERpc3Bs
YXlQb3J0L2VEUAo+ICsJICBBTlg2MzQ1IGlzIGFuIHVsdHJhLWxvdyBwb3dlciBGdWxsLUhEIERp
c3BsYXlQb3J0L2VEUAo+ICAJICB0cmFuc21pdHRlciBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2
aWNlcy4gVGhlCj4gIAkgIEFOWDYzNDUgdHJhbnNmb3JtcyB0aGUgTFZUVEwgUkdCIG91dHB1dCBv
ZiBhbgo+ICAJICBhcHBsaWNhdGlvbiBwcm9jZXNzb3IgdG8gZURQIG9yIERpc3BsYXlQb3J0Lgo+
IAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25ndEBiYXlsaWJyZS5jb20+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
