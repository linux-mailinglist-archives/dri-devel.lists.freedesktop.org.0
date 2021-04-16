Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B3361AD6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 09:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6656E1A2;
	Fri, 16 Apr 2021 07:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1BD6E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:51:46 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so25005386otn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4GwvUVkQCAs0X/UNyX5pEqeUO1WdFhB1WSpRysQPPC8=;
 b=ljbOw4dWBTZwCsHaMq0PZ/dctFokBT9dSEg2Wl9dz4QOE/hP5GrAF7ZL0ZQ4nIWc8p
 GVNXrKAVueX8JdkY0wN5dOt/vg+Pwddybkab8HfeqAP261sEeE2sAmenIg40VaJTjcig
 oSle/efFKv/StjK8RCTDswW3fIE/7aevPjOyy3SRIyZHSCfGfa48bUZeDSsPho0+yf/C
 KJffQXuM2WgS4rHZjFHx/PuevLB1Uh5GtieZBbhwtml2KBFZfjR+UFEvz7NvlGj2e9L6
 5wgZj4WxOYKw+IGwDwX7RkHD5EKlqbUBkIEgXLzvpqUK4LJ2ABhx0TwshlSdPyId4UUz
 W7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4GwvUVkQCAs0X/UNyX5pEqeUO1WdFhB1WSpRysQPPC8=;
 b=DR4Xib/hla3AKpnbNSeBUw9v7eYeqz5HGUSakoqTDxnJmQqLefQfCknsxqONarrSMt
 Iz/6tNt+BS6EyPufst9aIrqPMrQc/yb28/cB3xpe3W5ejZUd9Xm9HH02InW3dE25Hmhk
 tSGdUp+xtj+R4yYoreoBYeZrCPecJtniWy7BMih4APWwQwa75zMb7TnxUU2GL0P/j824
 Kb+89OJy2d2xypvpjQhx3PTdjuSpFoizIWFbVSyxmBSCJ1itxgr6a48+32duaKwTtSSh
 YyVpT/gob7ex4BLTLI3MfR90g30gjpgqYk83gZIkBIxmL0HosCE95RipPgBS2QF86h4g
 84SA==
X-Gm-Message-State: AOAM5309cK4yQM/4qDUf03tXuRMZE9WLs7mlc5JWoUQ+vFBuR6Qe9JA9
 WyTVJORREcswmwct/3X/2zPCCxEMJkayntArxms=
X-Google-Smtp-Source: ABdhPJx2zqCjdlBGHxyj00xydr3ubb35ShJaQk8s7sLVXgo86SVvtyMsx4K2PWJIMxLsD/RDwg4wOFQmAlPFoFPd/hE=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr2808423otq.281.1618559505373; 
 Fri, 16 Apr 2021 00:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618236288-1617-3-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 09:51:36 +0200
Message-ID: <CAFqH_50kRmQLukyRERwtRGErETuKP8jry9+oG1CSX+=-Ckz7gw@mail.gmail.com>
Subject: Re: [PATCH v5, 2/4] soc: mediatek: mmsys: add component POSTMASK
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWW9uZ3FpYW5nLAoKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgoKTWlzc2F0Z2UgZGUgWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IGRlbCBkaWEgZGwuLCAxMgpk
4oCZYWJyLiAyMDIxIGEgbGVzIDE2OjA1Ogo+Cj4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IFBP
U1RNQVNLCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1l
ZGlhdGVrLmNvbT4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5i
YWxsZXRib0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0
ZWsvbXRrLW1tc3lzLmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggYi9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IGluZGV4IGY2YjU4ZjkuLjc3
MThjZDYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IEBAIC0z
MSw2ICszMSw3IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsKPiAgICAgICAgIEREUF9DT01QT05F
TlRfT1ZMXzJMMSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMXzJMMiwKPiAgICAgICAgIERE
UF9DT01QT05FTlRfT1ZMMSwKPiArICAgICAgIEREUF9DT01QT05FTlRfUE9TVE1BU0swLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9QV00wLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00xLAo+
ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00yLAo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
