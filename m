Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486AC24C8C4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA4F6EA7A;
	Thu, 20 Aug 2020 23:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44796EA7A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:46:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 462D4207DE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967175;
 bh=Lgp8hsNdzOTq4kLm5ig7EfIsrARcaqyBrt2jpFkQe6s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OZZdzKzBD51K1BPGM0EaH36CMBKdv2QMN7b+GZuFw580TLsXutGo3pLBWhEXxDJjb
 yyKWfMFiN5pyb8aRWbVR6bWiB3b6XemNhW8ka0ApBKAQewZpX+xuTYvG603BrQW6fU
 cJrqycD8Iahf+l7FUboEoQsu0APFA7Lj3l5W3YdY=
Received: by mail-ej1-f54.google.com with SMTP id o18so241634eje.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:46:15 -0700 (PDT)
X-Gm-Message-State: AOAM532e3BgFK6JBYFqksGd9B5A1Sb5vZwl9FdlnLeHn4iUseSwCSXzO
 buPt+GsNNp+1V20vTteX4OoDOumEbu4EBZwyLw==
X-Google-Smtp-Source: ABdhPJwImiPZfml816TKJ8tULu0ObTfnI7+zw4vuK73Jk4H3K6TAuI9PR6yWIJfRJ60uRj1hxTknbdc2N7ifSaHVAU8=
X-Received: by 2002:a17:906:2356:: with SMTP id
 m22mr350366eja.124.1597967173923; 
 Thu, 20 Aug 2020 16:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-10-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-10-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:46:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8rWUdGgNQfvdZh0gCim8uQ=mJ7Pm=WRgCN_z+Dfb_bEQ@mail.gmail.com>
Message-ID: <CAAOTY_8rWUdGgNQfvdZh0gCim8uQ=mJ7Pm=WRgCN_z+Dfb_bEQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/21] drm/mediatek: fix aal size config
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjoxOOWvq+mBk++8mgo+Cj4gZml4
IGFhbCBzaXplIGNvbmZpZwo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmMgfCAxMSArKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggYzkwZDJlZS4uZmU3NjM4NyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0zMSw4ICsz
MSwxMyBAQAo+ICAjZGVmaW5lIERJU1BfUkVHX1VGT19TVEFSVCAgICAgICAgICAgICAgICAgICAg
IDB4MDAwMAo+Cj4gICNkZWZpbmUgRElTUF9BQUxfRU4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwMDAwCj4gKyNkZWZpbmUgRElTUF9BQUxfQ0ZHICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwMDIwCj4gKyNkZWZpbmUgQUFMX1JFTEFZX01PREUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBCSVQoMCkKPiArI2RlZmluZSBBQUxfRU5HSU5FX0VOICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+ICAjZGVmaW5lIERJU1BfQUFMX1NJWkUgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDAzMAo+Cj4gKyNkZWZpbmUgRElTUF9BQUxfT1VUUFVUX1NJ
WkUgICAgICAgICAgICAgICAgICAgMHgwNGQ4Cj4gKwo+ICAjZGVmaW5lIERJU1BfQ0NPUlJfRU4g
ICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMAo+ICAjZGVmaW5lIENDT1JSX0VOICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+ICAjZGVmaW5lIERJU1BfQ0NPUlJfQ0ZH
ICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMAo+IEBAIC0xODIsNyArMTg3LDExIEBAIHN0
YXRpYyB2b2lkIG10a19hYWxfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2ln
bmVkIGludCB3LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBoLCB1
bnNpZ25lZCBpbnQgdnJlZnJlc2gsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGJwYywgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkKPiAgewo+IC0gICAgICAgbXRr
X2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsIGNvbXAsIERJU1BfQUFMX1NJWkUpOwo+
ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8PCAxNiB8IGgsIGNvbXAsIERJU1Bf
QUFMX1NJWkUpOwo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8PCAxNiB8IGgs
IGNvbXAsIERJU1BfQUFMX09VVFBVVF9TSVpFKTsKPiArCj4gKyAgICAgICBtdGtfZGRwX3dyaXRl
X21hc2soTlVMTCwgQUFMX1JFTEFZX01PREUsIGNvbXAsIERJU1BfQUFMX0NGRywKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICBBQUxfUkVMQVlfTU9ERSB8IEFBTF9FTkdJTkVfRU4pOwoKSWYg
dGhpcyBvbmx5IHNob3VsZCBzZXQgaW4gbXQ4MTkyLCBhZGQgYSBwcml2YXRlIGRhdGEgdG8gZGlz
dGluZ3Vpc2ggdGhpcy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICB9Cj4KPiAgc3RhdGljIHZv
aWQgbXRrX2FhbF9zdGFydChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+IC0tCj4gMS44LjEu
MS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
