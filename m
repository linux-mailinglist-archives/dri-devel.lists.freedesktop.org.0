Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0034B33A235
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 02:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234586E32A;
	Sun, 14 Mar 2021 01:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57F18999E
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 01:42:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61A0664ED9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 01:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615686167;
 bh=d8r78DmHZoQq/Xpde3tw/rQjLBC2qxYXAEfmbWF2bP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fakOty/OHbvQxSv2CtMch+TMWS3l3uxOlWFWgIOsf5/SWb4lrzStEhsizPP5RLg6V
 Q+pvjsfXPOJPtRs1KgdewqNbHbyKeO2zjqT4o58dbM0DuaxkibyaU2wvOchRXcgF/H
 y9yxakpcigDKbdLQcPyKJWjSNHmS8ooxB3BFyCXRq07lXU4S+/4EKgtQgcVzo7HfR8
 1wIF9lLesMSM5zYdUo1NRs2sGDtH8V1qbVUDk7OM1k0tA+n+5XLKwE0ZX8K/dIZYni
 /hWCSNVE/Madwf4ON7yaoghCRkgdXGRVz4l+N1jmibwnPiyLdkwcwvj+xQHGhCju2j
 GuE1gKc+EAjuA==
Received: by mail-ej1-f54.google.com with SMTP id lr13so60575039ejb.8
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 17:42:47 -0800 (PST)
X-Gm-Message-State: AOAM5314WcO2DR/D34z8ySo6edg2/e59YudFRJ9fdqrkflIqw7kFcR6x
 NweYWW5dhcs0UItNFDWobIznwtRlTzpZ23rlrg==
X-Google-Smtp-Source: ABdhPJwt7yggnfbLt0nEaJTQ57OcD/f1c2ihvZExUaKqy5DsREVzfjShGFYpeA+UzbmIb8LIcItruBFVhr25lUHDo/U=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr16649455ejy.63.1615686165972; 
 Sat, 13 Mar 2021 17:42:45 -0800 (PST)
MIME-Version: 1.0
References: <1615621683-2122-1-git-send-email-wangqing@vivo.com>
In-Reply-To: <1615621683-2122-1-git-send-email-wangqing@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 14 Mar 2021 09:42:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY__77A5ckALr=dxXK4zV3sbm_84_m9Bo0nBKBxPMMv2sxQ@mail.gmail.com>
Message-ID: <CAAOTY__77A5ckALr=dxXK4zV3sbm_84_m9Bo0nBKBxPMMv2sxQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: mediatek: delete redundant printing of return
 value
To: Wang Qing <wangqing@vivo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFdhbmc6CgpXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPiDmlrwgMjAyMeW5tDPmnIgx
M+aXpSDpgLHlha0g5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gcGxhdGZvcm1fZ2V0X2lycSgpIGhh
cyBhbHJlYWR5IGNoZWNrZWQgYW5kIHByaW50ZWQgdGhlIHJldHVybiB2YWx1ZSwKPiB0aGUgcHJp
bnRpbmcgaGVyZSBpcyBub3RoaW5nIHNwZWNpYWwsIGl0IGlzIG5vdCBuZWNlc3NhcnkgYXQgYWxs
LgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYwo+IGluZGV4IGIwNWY5MDAuLjBhYzQ5NjIKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+IEBAIC03NTEsMTAgKzc1MSw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgfQo+Cj4gICAgICAgICBkcGkt
PmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLSAgICAgICBpZiAoZHBpLT5pcnEg
PD0gMCkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgaXJx
OiAlZFxuIiwgZHBpLT5pcnEpOwo+ICsgICAgICAgaWYgKGRwaS0+aXJxIDw9IDApCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IC0gICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBk
cm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoZGV2LT5vZl9ub2RlLCAwLCAwLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsICZkcGktPm5leHRfYnJpZGdl
KTsKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
