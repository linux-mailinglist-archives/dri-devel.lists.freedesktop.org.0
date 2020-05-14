Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2191D32D5
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AC56E03E;
	Thu, 14 May 2020 14:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EAA6E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:28:47 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95B9F20767
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589466526;
 bh=c9L1O1InlStlIGidxd6wkgttvIpBEDDoT/skiDV3RvQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JxDecQBn7l1dJvcoAMtJKzjbkyoPCFe3jN6GE9bIN4vNpmS0jZ4BL8QmgWPYGhjdx
 98XZLTISx3rmSGgsqNb9oJHtZnynI6zR0DVGcAvfrbFtKT3rANG5o1pYzdwIFJnaVV
 3fYXikXicKhyaywo187A9P+UdGinb8CG40vHH6cI=
Received: by mail-ed1-f41.google.com with SMTP id w2so2563051edx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:28:46 -0700 (PDT)
X-Gm-Message-State: AOAM530iLcTTXZufhikOeQPXHudp7QKRk2HuigozvJEd0vSKtSt28jVz
 c4OcEtRLC2mbHMvKJaGrhIuvk6MgEvgCQbwmVQ==
X-Google-Smtp-Source: ABdhPJwIyb+lTea2pZcVEwHLHdT4AKiwC3a2Q/WIWGftFZnpe494JxoCIClrf22bFDtgFzG2+qSq9oUl8aupkmV1SZA=
X-Received: by 2002:a50:ea87:: with SMTP id d7mr4038661edo.48.1589466524869;
 Thu, 14 May 2020 07:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200501152335.1805790-1-enric.balletbo@collabora.com>
 <20200501152335.1805790-8-enric.balletbo@collabora.com>
 <CAFqH_53h=3OXzwLnw1XT3rHYkMPOPNFBdQdPeFmNubN9qq_Twg@mail.gmail.com>
In-Reply-To: <CAFqH_53h=3OXzwLnw1XT3rHYkMPOPNFBdQdPeFmNubN9qq_Twg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 May 2020 22:28:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-pOUuM7LQ1jm6gqpg8acMqDWOHxGucY5XOjq0ctGUkzA@mail.gmail.com>
Message-ID: <CAAOTY_-pOUuM7LQ1jm6gqpg8acMqDWOHxGucY5XOjq0ctGUkzA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
To: Enric Balletbo Serra <eballetbo@gmail.com>
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
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gU2VycmEgPGViYWxsZXRib0BnbWFpbC5jb20+IOaW
vCAyMDIw5bm0NeaciDE05pelIOmAseWbmyDkuIrljYgxMjo0MeWvq+mBk++8mgo+Cj4gSGkgQ2h1
bi1LdWFuZywKPgo+IE1pc3NhdGdlIGRlIEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJh
bGxldGJvQGNvbGxhYm9yYS5jb20+IGRlbAo+IGRpYSBkdi4sIDEgZGUgbWFpZyAyMDIwIGEgbGVz
IDE3OjI1Ogo+ID4KPiA+IFVzZSB0aGUgZHJtX2JyaWRnZV9jb25uZWN0b3IgaGVscGVyIHRvIGNy
ZWF0ZSBhIGNvbm5lY3RvciBmb3IgcGlwZWxpbmVzCj4gPiB0aGF0IHVzZSBkcm1fYnJpZGdlLiBU
aGlzIGFsbG93cyBzcGxpdHRpbmcgY29ubmVjdG9yIG9wZXJhdGlvbnMgYWNyb3NzCj4gPiBtdWx0
aXBsZSBicmlkZ2VzIHdoZW4gbmVjZXNzYXJ5LCBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgbGFzdCBi
cmlkZ2UgaW4KPiA+IHRoZSBjaGFpbiBjcmVhdGluZyB0aGUgY29ubmVjdG9yIGFuZCBoYW5kbGlu
ZyBhbGwgY29ubmVjdG9yIG9wZXJhdGlvbnMKPiA+IGludGVybmFsbHkuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3Jh
LmNvbT4KPiA+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4KPiBB
IGdlbnRsZSBwaW5nIG9uIHRoaXMsIEkgdGhpbmsgdGhhdCB0aGlzIG9uZSBpcyB0aGUgb25seSBv
bmUgdGhhdAo+IHN0aWxsIG5lZWRzIGEgcmV2aWV3IGluIHRoZSBzZXJpZXMuCgpUaGlzIGlzIHdo
YXQgSSByZXBseSBpbiBwYXRjaCB2MzoKCkkgdGhpbmsgdGhlIHBhbmVsIGlzIHdyYXBwZWQgaW50
byBuZXh0X2JyaWRnZSBoZXJlLAoKaWYgKHBhbmVsKSB7CiAgICBkc2ktPm5leHRfYnJpZGdlID0g
ZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZChkZXYsIHBhbmVsKTsKCnNvIHRoZSBuZXh0X2JyaWRn
ZSBpcyBhIHBhbmVsX2JyaWRnZSwgaW4gaXRzIGF0dGFjaCBmdW5jdGlvbgpwYW5lbF9icmlkZ2Vf
YXR0YWNoKCksCmFjY29yZGluZyB0byB0aGUgZmxhZyBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05O
RUNUT1IsIGlmIG5vdCBleGlzdCwKaXQgd291bGQgY3JlYXRlIGNvbm5lY3RvciBhbmQgYXR0YWNo
IGNvbm5lY3RvciB0byBwYW5lbC4KCkknbSBub3Qgc3VyZSB0aGlzIGZsYWcgd291bGQgZXhpc3Qg
b3Igbm90LCBidXQgZm9yIGJvdGggY2FzZSwgaXQncyBzdHJhbmdlLgpJZiBleGlzdCwgeW91IGNy
ZWF0ZSBjb25uZWN0b3IgaW4gdGhpcyBwYXRjaCBidXQgbm8gd2hlcmUgdG8gYXR0YWNoCmNvbm5l
Y3RvciB0byBwYW5lbC4KSWYgbm90IGV4aXN0LCB0aGUgbmV4dF9icmlnZSB3b3VsZCBjcmVhdGUg
b25lIGNvbm5lY3RvciBhbmQgdGhpcyBicmlnZQp3b3VsZCBjcmVhdGUgYW5vdGhlciBjb25uZWN0
b3IuCgpJIHRoaW5rIGluIHlvdXIgY2FzZSwgbXRrX2RzaSBkb2VzIG5vdCBkaXJlY3RseSBjb25u
ZWN0IHRvIGEgcGFuZWwsIHNvCkkgbmVlZCBhIGV4YWN0IGV4cGxhaW4uIE9yIHNvbWVvbmUgY291
bGQgdGVzdCB0aGlzIG9uIGEKZGlyZWN0bHktY29ubmVjdC1wYW5lbCBwbGF0Zm9ybS4KClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgo+Cj4gVGhhbmtzLAo+ICBFbnJpYwo+Cj4gPiAtLS0KPiA+Cj4gPiBD
aGFuZ2VzIGluIHY0OiBOb25lCj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBNb3ZlIHRoZSBicmlk
Z2UudHlwZSBsaW5lIHRvIHRoZSBwYXRjaCB0aGF0IGFkZHMgZHJtX2JyaWRnZSBzdXBwb3J0LiAo
TGF1cmVudCBQaW5jaGFydCkKPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4gPgo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMyArKysrKysrKysrKystCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+IGluZGV4IDRmM2JkMDk1YzFlZS4uNDcxZmNh
ZmRmMzQ4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gQEAgLTE3
LDYgKzE3LDcgQEAKPiA+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+
ID4gICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX2Jy
aWRnZV9jb25uZWN0b3IuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9taXBpX2RzaS5oPgo+ID4g
ICNpbmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4K
PiA+IEBAIC0xODMsNiArMTg0LDcgQEAgc3RydWN0IG10a19kc2kgewo+ID4gICAgICAgICBzdHJ1
Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsKPiA+ICAgICAgICAgc3RydWN0IGRybV9icmlkZ2UgYnJp
ZGdlOwo+ID4gICAgICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSAqbmV4dF9icmlkZ2U7Cj4gPiArICAg
ICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4gPiAgICAgICAgIHN0cnVjdCBw
aHkgKnBoeTsKPiA+Cj4gPiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiA+IEBAIC05Nzcs
MTAgKzk3OSwxOSBAQCBzdGF0aWMgaW50IG10a19kc2lfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gPiAgICAgICAgICAqLwo+ID4gICAg
ICAgICBkc2ktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSAxOwo+ID4KPiA+IC0gICAgICAgcmV0
ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMLCAw
KTsKPiA+ICsgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRzaS0+ZW5jb2RlciwgJmRz
aS0+YnJpZGdlLCBOVUxMLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1f
QlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAg
ICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXBfZW5jb2RlcjsKPiA+Cj4gPiArICAgICAgIGRz
aS0+Y29ubmVjdG9yID0gZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdChkcm0sICZkc2ktPmVuY29k
ZXIpOwo+ID4gKyAgICAgICBpZiAoSVNfRVJSKGRzaS0+Y29ubmVjdG9yKSkgewo+ID4gKyAgICAg
ICAgICAgICAgIERSTV9FUlJPUigiVW5hYmxlIHRvIGNyZWF0ZSBicmlkZ2UgY29ubmVjdG9yXG4i
KTsKPiA+ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRzaS0+Y29ubmVjdG9yKTsKPiA+
ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVwX2VuY29kZXI7Cj4gPiArICAgICAgIH0K
PiA+ICsgICAgICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihkc2ktPmNvbm5lY3Rvciwg
JmRzaS0+ZW5jb2Rlcik7Cj4gPiArCj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICBlcnJf
Y2xlYW51cF9lbmNvZGVyOgo+ID4gLS0KPiA+IDIuMjYuMgo+ID4KPiA+Cj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0Cj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
