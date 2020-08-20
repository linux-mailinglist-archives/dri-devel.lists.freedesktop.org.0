Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAD24C8C0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346066EA77;
	Thu, 20 Aug 2020 23:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D266EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:43:50 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 585852072D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967030;
 bh=12Z/1F9ynfQG7TePTBeyr3mih++Uy7SZRp4TeFeFs00=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zh7RPShu8RDbXHSq/oO4RIrP7wWBy3WN/odPT+2RPzaYmOP++iCWgSxuDuz7TTrd3
 u/rZq9S0bOYAjczwn4IXAUllxtXntn5divU1ss+SS2VPiDDLGc4BJDg+kWq9wRyLDd
 upGN6rew7AYY0LKvqeSxDvRU14iudWvSn7Kglwvw=
Received: by mail-ej1-f42.google.com with SMTP id m22so217462eje.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:43:50 -0700 (PDT)
X-Gm-Message-State: AOAM533vaJJ3GmPlMwWOmgHk7n9EwDnFfVyN3xO18OXo3P4SJ8ZvFP88
 vJDJx4LMtWGrn0lVOa9II/NufSD/Cjb4FhDDrw==
X-Google-Smtp-Source: ABdhPJwvENKIDffOUlwzID4Z1RX/ZzTkvvhpMC6nA358MClEWoZg7KM+bFIxElWhuhPq+Q71kLgNBHiZNim6++NVVE4=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr178889ejl.375.1597967028984; 
 Thu, 20 Aug 2020 16:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-8-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:43:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LnY3Tbzhmeia5DS7o1WAxd0kz9oVCeKLvwNCn48j_Dg@mail.gmail.com>
Message-ID: <CAAOTY_8LnY3Tbzhmeia5DS7o1WAxd0kz9oVCeKLvwNCn48j_Dg@mail.gmail.com>
Subject: Re: [PATCH v1 07/21] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
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

SEksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjowNuWvq+mBk++8mgo+Cj4gZW5h
YmxlIE9WTF9MQVlFUl9TTUlfSURfRU4gZm9yIG11bHRpLWxheWVyIHVzZWNhc2UKPgo+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAzICsrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bC5jCj4gaW5kZXggOGNmOWYzYi4uNDI3ZmU3ZiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBAQCAtMjMsNiArMjMsNyBAQAo+ICAjZGVm
aW5lIERJU1BfUkVHX09WTF9SU1QgICAgICAgICAgICAgICAgICAgICAgIDB4MDAxNAo+ICAjZGVm
aW5lIERJU1BfUkVHX09WTF9ST0lfU0laRSAgICAgICAgICAgICAgICAgIDB4MDAyMAo+ICAjZGVm
aW5lIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04gICAgICAgICAgICAgIDB4MDAyNAo+ICsjZGVm
aW5lIE9WTF9MQVlFUl9TTUlfSURfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDAp
Cj4gICNkZWZpbmUgT1ZMX0JHQ0xSX1NFTF9JTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoMikKPiAgI2RlZmluZSBESVNQX1JFR19PVkxfUk9JX0JHQ0xSICAgICAgICAgICAgICAg
ICAweDAwMjgKPiAgI2RlZmluZSBESVNQX1JFR19PVkxfU1JDX0NPTiAgICAgICAgICAgICAgICAg
ICAweDAwMmMKPiBAQCAtMTE2LDYgKzExNyw4IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZGlzYWJs
ZV92Ymxhbmsoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiAgc3RhdGljIHZvaWQgbXRrX292
bF9zdGFydChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+ICB7Cj4gICAgICAgICB3cml0ZWxf
cmVsYXhlZCgweDEsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfRU4pOwo+ICsgICAgICAgbXRr
X2RkcF93cml0ZV9tYXNrKE5VTEwsIE9WTF9MQVlFUl9TTUlfSURfRU4sIGNvbXAsCgp3cml0ZWxf
cmVsYXhlZCBpbnN0ZWFkIG9mIG10a19kZHBfd3JpdGVfbWFzay4KCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTiwgT1ZMX0xBWUVSX1NNSV9JRF9F
Tik7CgpJZiB0aGlzIG9ubHkgc2hvdWxkIHNldCBpbiBtdDgxOTIsIGFkZCBhIHByaXZhdGUgZGF0
YSB0byBkaXN0aW5ndWlzaCB0aGlzLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gIH0KPgo+ICBz
dGF0aWMgdm9pZCBtdGtfb3ZsX3N0b3Aoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiAtLQo+
IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
