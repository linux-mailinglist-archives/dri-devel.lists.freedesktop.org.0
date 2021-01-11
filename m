Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094412F2333
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 01:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7D78995F;
	Mon, 11 Jan 2021 23:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6808995F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:59:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3C9222D00
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610409599;
 bh=S7y++HNlfNSNt0z4hKXdDcHN7UOBqQprNlJ3aTrtBYQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HiEvwXA9IroMbrlXh21jp1S6SSV5cJVAv5JBbdYAC0J/v9aYUHcpGAN4kNXLIkpbH
 VNycfN43tf06eRJc9uEXH005Degd9TEXsuYcw4BgAgx5jcd5kimfaSH8hJGC0pd2Rg
 bH9aUEuYO25srMpMsa+x1RYbgPfKAHoHjxhkFNLp0fvceYv2qqYEZul+ZrynvrGO5N
 iXYbeQL2ir8N6zlGoZO8A0eke6L1NsfJiXYELNcL8lGh/esLkO3imBgr/5Ro4Rrrbx
 NPVXKTy+8p/KLyv9Hn8Am30PzYImkTnzjPkIegI1cRXuwzCJh+Iun+1/mH/1AEmV8f
 4Qq0DxucXbkKA==
Received: by mail-ej1-f54.google.com with SMTP id w1so868139ejf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:59:58 -0800 (PST)
X-Gm-Message-State: AOAM530F0GzzmWINUnji5ShNRxLgh/kBqevyTwDndiXb4kRBUaKr0EnN
 B3SMwoEG90H6AcEc8cngwwJkhgM9frsGfQ843Q==
X-Google-Smtp-Source: ABdhPJxUeXqwm6w53tZVM99kGi6AORPcbUrwUwsYACUNteu6ZKUg3hrzvr3AzddjV19UEYCrp6RdUGZBIAssahFIByc=
X-Received: by 2002:a17:906:ae4e:: with SMTP id
 lf14mr1336071ejb.310.1610409597420; 
 Mon, 11 Jan 2021 15:59:57 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-8-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:59:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
Message-ID: <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
Subject: Re: [PATCH v3, 07/15] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gZW5h
YmxlIE9WTF9MQVlFUl9TTUlfSURfRU4gZm9yIG11bHRpLWxheWVyIHVzZWNhc2UKCkNvdWxkIHlv
dSBkZXNjcmliZSBtb3JlIGluZm9ybWF0aW9uPyBXaXRob3V0IHRoaXMgcGF0Y2gsIHdoYXQgd291
bGQgaGFwcGVuPwoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5u
aXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBpbmRleCBi
NDdjMjM4Li40OTM0YmVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmwuYwo+IEBAIC0yMyw2ICsyMyw3IEBACj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JTVCAgICAg
ICAgICAgICAgICAgICAgICAgMHgwMDE0Cj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JPSV9TSVpF
ICAgICAgICAgICAgICAgICAgMHgwMDIwCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX0RBVEFQQVRI
X0NPTiAgICAgICAgICAgICAgMHgwMDI0Cj4gKyNkZWZpbmUgT1ZMX0xBWUVSX1NNSV9JRF9FTiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiAgI2RlZmluZSBPVkxfQkdDTFJfU0VM
X0lOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+ICAjZGVmaW5lIERJU1Bf
UkVHX09WTF9ST0lfQkdDTFIgICAgICAgICAgICAgICAgIDB4MDAyOAo+ICAjZGVmaW5lIERJU1Bf
UkVHX09WTF9TUkNfQ09OICAgICAgICAgICAgICAgICAgIDB4MDAyYwo+IEBAIC02MSw2ICs2Miw3
IEBAIHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0YSB7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgZ21j
X2JpdHM7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgbGF5ZXJfbnI7Cj4gICAgICAgICBib29sIGZt
dF9yZ2I1NjVfaXNfMDsKPiArICAgICAgIGJvb2wgc21pX2lkX2VuOwo+ICB9Owo+Cj4gIC8qKgo+
IEBAIC0xMTYsNyArMTE4LDE3IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZGlzYWJsZV92Ymxhbmso
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPgo+ICBzdGF0aWMgdm9pZCBtdGtfb3ZsX3N0YXJ0
KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gIHsKPiArICAgICAgIHN0cnVjdCBtdGtfZGlz
cF9vdmwgKm92bCA9IGNvbXBfdG9fb3ZsKGNvbXApOwo+ICsKPiAgICAgICAgIHdyaXRlbF9yZWxh
eGVkKDB4MSwgY29tcC0+cmVncyArIERJU1BfUkVHX09WTF9FTik7Cj4gKwo+ICsgICAgICAgaWYo
b3ZsLT5kYXRhLT5zbWlfaWRfZW4pIHsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJl
ZzsKPiArCj4gKyAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsKGNvbXAtPnJlZ3MgKyBESVNQX1JF
R19PVkxfREFUQVBBVEhfQ09OKTsKPiArICAgICAgICAgICAgICAgcmVnID0gcmVnIHwgT1ZMX0xB
WUVSX1NNSV9JRF9FTjsKPiArICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBjb21w
LT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7CgpJIHRoaW5rIHRoaXMgc2V0dGlu
ZyBzaG91bGQgYmVmb3JlIHdyaXRlIDEgdG8gRElTUF9SRUdfT1ZMX0VOLgoKPiArICAgICAgIH0K
PiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19vdmxfc3RvcChzdHJ1Y3QgbXRrX2RkcF9jb21wICpj
b21wKQoKU2hvdWxkIGNsZWFyIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04gd2hlbiBzdG9wPwoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
