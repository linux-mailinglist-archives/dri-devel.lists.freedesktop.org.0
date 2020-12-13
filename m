Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B382D8AC7
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 02:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7497C89ACC;
	Sun, 13 Dec 2020 01:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F8989AA6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 01:15:18 +0000 (UTC)
X-Gm-Message-State: AOAM533PPNBAkIHh9T1eY11oexhBllrDC6BlYnEvuiB24MGcuMAOKiKK
 e9JWZnEygyPdmmqGxAqi17B3X451+Azlo1rmkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607822118;
 bh=DuuvSYAgKQaNskB+hKM10xoonyLBpgBKY3lVUg/jzKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mGfFiGHPZ+0K8oG5EitT1rP0Ln7RvsH4jvAjTD/RVWb71OgL+ZTr8BAXiI21Spjtg
 duuylj1rz9UqQjR3OJ+PXojw0hlVngPLz7cKAwS+YQGKYol99bj1NnYaWyF6bRdPqh
 oMJFtI1YvBDFzij0buLUhDhZQMQPcLu821pavPB//cyYkhoY25h0sYconPs7MadNiv
 TqySZQHNs2nxx3QOzCBpq/G9G2Lp2Dc5z8p2lgEYYge3m/bv6wyc6gkmKtZoa1wNtK
 FEuO4I+UZDyJr/vU9Xk539Ta9f7YLNrRYFVYZwiFCDvZzqFaNMuJa5mxIbETRGhxX3
 y9smBV9qObshA==
X-Google-Smtp-Source: ABdhPJxwatlJb+8VRQZCMPRl8VIOjuxvSaZJuqeloLzJDD7QgR6XPq6bmpgZNV+0chJV9VkJ7Cdgd5MYWpjqub7z4kY=
X-Received: by 2002:a17:907:414c:: with SMTP id
 od20mr16781511ejb.75.1607822116713; 
 Sat, 12 Dec 2020 17:15:16 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-5-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 13 Dec 2020 09:15:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
Message-ID: <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
Subject: Re: [PATCH v2, 04/17] drm/mediatek: add component OVL_2L2
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBU
aGlzIHBhdGNoIGFkZCBjb21wb25lbnQgT1ZMXzJMMgoKQnJlYWsgZHJtIHBhcnQgYW5kIHNvYyBw
YXJ0IGludG8gZGlmZmVyZW50IHBhdGNoZXMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNp
Z25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMSAr
Cj4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oICAgICAgfCAxICsKPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGluZGV4IDhlYmE0NGIuLjg5Mzg1NTQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtNDAz
LDYgKzQwMyw3IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfbWF0Y2ggewo+ICAgICAgICAgW0REUF9D
T01QT05FTlRfT1ZMMV0gICAgPSB7IE1US19ESVNQX09WTCwgICAgICAgMSwgTlVMTCB9LAo+ICAg
ICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMF0gPSB7IE1US19ESVNQX09WTF8yTCwgICAgMCwg
TlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMV0gPSB7IE1US19ESVNQX09W
TF8yTCwgICAgMSwgTlVMTCB9LAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMl0gPSB7
IE1US19ESVNQX09WTF8yTCwgICAgMiwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRf
UFdNMF0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0RE
UF9DT01QT05FTlRfUFdNMV0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAgMSwgTlVMTCB9LAo+
ICAgICAgICAgW0REUF9DT01QT05FTlRfUFdNMl0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAg
MiwgTlVMTCB9LAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gaW5kZXgg
NGI2YzUxNC4uNDI0NzZjMiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5
cy5oCj4gQEAgLTI5LDYgKzI5LDcgQEAgZW51bSBtdGtfZGRwX2NvbXBfaWQgewo+ICAgICAgICAg
RERQX0NPTVBPTkVOVF9PVkwwLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkxfMkwwLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9PVkxfMkwxLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkxf
MkwyLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkwxLAo+ICAgICAgICAgRERQX0NPTVBPTkVO
VF9QV00wLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00xLAo+IC0tCj4gMS44LjEuMS5kaXJ0
eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
