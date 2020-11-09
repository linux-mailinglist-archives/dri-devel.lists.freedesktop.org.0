Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BA42AC961
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 00:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF43A89760;
	Mon,  9 Nov 2020 23:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D33789760
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 23:32:08 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF0A320809
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 23:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604964728;
 bh=qEITAPMHJ7RcpcZ6fFQRVmfMg/2dltGWGmZBxVMFc4s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mdr2RIaVsFL5h20iTYlVWUcsRG2pEZ7we8XV+SZcKUJBfEXE/Blkf5uWZeB0Dq7fz
 1ssHFSzReWAaVh2tZTb5Cmk03lRCF+P+/tbGsgJCyE1foECPljXAuBYZhOeC0Ra6PL
 pb5U976e3nFnR1mysNV1QwYZoXoAS20zv+M84Bo8=
Received: by mail-ej1-f46.google.com with SMTP id za3so14809129ejb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 15:32:07 -0800 (PST)
X-Gm-Message-State: AOAM532IqhMUhI4qDxfhaMbxKaBBV7Pbm6RKWKQdO9OtOsvW+3xo3oaQ
 pwg0XO/vbSxDPFW2obPLlHxccq53NxyGLI+m6w==
X-Google-Smtp-Source: ABdhPJziewFX90NL28wieZNoMnJARdYMTBTgOKpCDGql+LFfX3AEL+OAko+xKqH/oxUVC1M88npS/jxmi6rc6MXUhDE=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr17259608ejq.303.1604964726295; 
 Mon, 09 Nov 2020 15:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201029152702.533-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 10 Nov 2020 07:31:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-8hs2oMNZStNyyD0VmCfOnHTdeZ75L8+BTx6gMwQZOWQ@mail.gmail.com>
Message-ID: <CAAOTY_-8hs2oMNZStNyyD0VmCfOnHTdeZ75L8+BTx6gMwQZOWQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Move Mediatek MIPI DSI PHY driver from DRM folder to
 PHY folder
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIgy
OeaXpSDpgLHlm5sg5LiL5Y2IMTE6Mjflr6vpgZPvvJoKPgo+IG10a19taXBpX2RzaV9waHkgaXMg
Y3VycmVudGx5IHBsYWNlZCBpbnNpZGUgbWVkaWF0ZWsgZHJtIGRyaXZlciwgYnV0IGl0J3MKPiBt
b3JlIHN1aXRhYmxlIHRvIHBsYWNlIGEgcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVy
LCBzbyBtb3ZlCj4gbXRrX21pcGlfZHNpX3BoeSBkcml2ZXIgaW50byBwaHkgZHJpdmVyIGZvbGRl
ci4KCkFwcGxpZWQgdGhlIHdob2xlIHNlcmllcyBpbnRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXS4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4KPiBDaHVuLUt1YW5nIEh1ICgzKToKPiAgIGRybS9tZWRpYXRlazogU2VwYXJh
dGUgbXRrX21pcGlfdHggdG8gYW4gaW5kZXBlbmRlbnQgbW9kdWxlCj4gICBwaHk6IG1lZGlhdGVr
OiBNb3ZlIG10a19taXBpX2RzaV9waHkgZHJpdmVyIGludG8gZHJpdmVycy9waHkvbWVkaWF0ZWsK
PiAgICAgZm9sZGVyCj4gICBNQUlOVEFJTkVSUzogYWRkIGZpbGVzIGZvciBNZWRpYXRlayBEUk0g
ZHJpdmVycwo+Cj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgICAgICAgICAgICAgICAg
ICAgIHwgMSAtCj4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCA3ICsrKysrKysKPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrKysKPiAgLi4uL21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2ktbXQ4MTczLmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAg
Li4uL21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTgzLmN9ICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KPiAgLi4uL210a19taXBpX3R4LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlw
aS1kc2kuY30gICAgICB8IDUgKysrKy0KPiAgLi4uL210a19taXBpX3R4LmggPT4gcGh5L21lZGlh
dGVrL3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiAgMTEgZmlsZXMgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX210ODE3M19taXBpX3R4LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlw
aS1kc2ktbXQ4MTczLmN9ICg5OSUpCj4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVr
L210a19tdDgxODNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLW10
ODE4My5jfSAoOTklKQo+ICByZW5hbWUgZHJpdmVycy97Z3B1L2RybS9tZWRpYXRlay9tdGtfbWlw
aV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmN9ICg5NyUpCj4gIHJlbmFt
ZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2kuaH0gKDEwMCUpCj4KPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
