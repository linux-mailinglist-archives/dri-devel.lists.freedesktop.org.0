Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6E32E1EB9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 16:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588D66E941;
	Wed, 23 Dec 2020 15:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286936E928
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 15:48:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DEFD2226A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608738511;
 bh=gFOktdnZlZmvTlgAN2h803xCQHcUKcooY0lSAj9WxE4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jg6eGQ1BXWTirJh/jh5f7JZi+5mMmKWbGV+nupvVevih8T1c1pZ1m5AkfCZu+vPZ9
 OI0KLmPBhOU2csvypopsBnocUtGTcebLj878fL9EC5cZ0FGN370D6xSMeWfnP/N0d+
 XaZwLd98NUXyoZLkx3bZwRyeVhZCWCTppjGqyihs3/Y6a8AzxrIFM1QULF6ucFfe7m
 3J/roxj0GzSR87LOYwwrfR+sLeDD9pQQWUl7B7vFJ0zw3f9Lh1E2RNedRP7WZ/kJko
 acpgoUTeMxBz8vtFgGubiyVHdCE99a1ILLYP+JrI4O6XgOyIUjE7PIgp9TKDUF4+3t
 k4pwdX3a7tgXg==
Received: by mail-ed1-f46.google.com with SMTP id cw27so16630207edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 07:48:31 -0800 (PST)
X-Gm-Message-State: AOAM530qVfFULKi7BRu50pZVp6sJ1k+dZu+7CnXrnQiYQ2QK0eiPxI4m
 pOAjDawCNxaAanBE4Vdy9pgmMiUlFSDPX0dfSw==
X-Google-Smtp-Source: ABdhPJwb5w2chHm2EqxPnyCoI9LEydqAoLEm1aIKXtYZ+vl4PEgEEDKf4mkp5MzyZv81GXD9gbxVNqMMg+4+cPbvMq4=
X-Received: by 2002:a50:fc83:: with SMTP id f3mr25508730edq.219.1608738510218; 
 Wed, 23 Dec 2020 07:48:30 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
 <1608687471.18252.10.camel@mhfsdcap03>
In-Reply-To: <1608687471.18252.10.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 23:48:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=QuVvyrFiUP=8-EMNPmgTK9TZr_ZmuJ=SbHZEjNnxyw@mail.gmail.com>
Message-ID: <CAAOTY_9=QuVvyrFiUP=8-EMNPmgTK9TZr_ZmuJ=SbHZEjNnxyw@mail.gmail.com>
Subject: Re: [PATCH v2, 12/17] drm/mediatek: fix gamma size config
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
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
PiDmlrwgMjAyMOW5tDEy5pyIMjPml6Ug6YCx5LiJIOS4iuWNiDk6Mzflr6vpgZPvvJoKPgo+IE9u
IFR1ZSwgMjAyMC0xMi0xNSBhdCAwNzo0MCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+
IEhpLCBZb25ncWlhbmc6Cj4gPgo+ID4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTPlr6vpgZPv
vJoKPiA+ID4KPiA+ID4gZml4IGdhbW1hIHNpemUgY29uZmlnCj4gPgo+ID4gSSB3b3VsZCBsaWtl
IHlvdSB0byBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24uIFRoZSBvcmlnaW5hbCBjb2RlIHdvcmtz
Cj4gPiBpbiBtdDgxNzMsIHdoeSBkbyB5b3UgbW9kaWZ5IHRoaXM/IFRoZSBkZXNjcmlwdGlvbiBt
YXkgYmUgc29tZXRoaW5nCj4gPiBsaWtlIHRoaXM6Cj4gPgo+ID4gQWNjb3JkaW5nIHRvIGRhdGEg
c2hlZXQsIHRoZSB3aWR0aCBpcyBpbiBiaXRzIFszMSwgMTZdIGFuZCBoZWlnaHQgaXMKPiA+IGlu
IGJpdHMgWzE1LCAwXS4gRXZlbiB0aG91Z2ggd3Jvbmcgc2V0dGluZyBtYXkgd29ya3MgaW4gc29t
ZSBTb0Mgc3VjaAo+ID4gYXMgbXQ4MTczLCBidXQgaXQgZG9lcyBub3Qgd29yayBpbiBtdDgxOTIu
Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4KPiBpdCBzdGlsbCB3b3JrcyBpbiBt
dDgxOTIuCj4ganVzdCBtb2RpZnkgdGhpcyBmb2xsb3cgZGF0YSBzaGVldAoKVGhpcyBwYXRjaCBp
cyBub3Qgc3Ryb25nbHkgcmVsYXRlZCB0byBNVDgxOTIsIHNvIG1vdmUgdGhpcyBwYXRjaCBvdXQK
b2YgdGhpcyBzZXJpZXMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+ID4KPiA+ID4KPiA+ID4g
Rml4ZXM6IGUwYTVkMzM3MDI0NSAoZHJtL21lZGlhdGVrOiBBZGQgR0FNTUEgZW5naW5lIGJhc2lj
IGZ1bmN0aW9uKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcu
bml1QG1lZGlhdGVrLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ID4gPiBpbmRleCAwMGQ1Njg3Li41MmI2ZmM3IDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMKPiA+ID4gQEAgLTI5Nyw3ICsyOTcsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZ2FtbWFfY29uZmln
KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCB3LAo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBoLCB1bnNpZ25lZCBpbnQgdnJlZnJl
c2gsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJwYywg
c3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkKPiA+ID4gIHsKPiA+ID4gLSAgICAgICBtdGtfZGRw
X3dyaXRlKGNtZHFfcGt0LCBoIDw8IDE2IHwgdywgY29tcCwgRElTUF9HQU1NQV9TSVpFKTsKPiA+
ID4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwgaCwgY29tcCwgRElT
UF9HQU1NQV9TSVpFKTsKPiA+ID4gICAgICAgICBtdGtfZGl0aGVyX3NldChjb21wLCBicGMsIERJ
U1BfR0FNTUFfQ0ZHLCBjbWRxX3BrdCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDEu
OC4xLjEuZGlydHkKPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gPiA+IExpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
