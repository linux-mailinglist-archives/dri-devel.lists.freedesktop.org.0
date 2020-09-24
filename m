Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B637276A8E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0553E89834;
	Thu, 24 Sep 2020 07:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281FA6EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:08:42 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id h17so2132067otr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 23:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lXB9dmAirmi4v7GPBCGSMea4z8h+BAFIgAuNXXHOb2Y=;
 b=ClueS1ymp1lS1bXGw323101aciaXB9Sy2hZzOZiXvnx89GOnngJVSqAJVDrbWf9jDd
 tZn9SE2Pf9bofHHPqwvtvpToCD9PqPhRbd9L1rxg8LqPL1ijL8ZkTURSRDA0dvRpFrWo
 kYnJ4uAcoc0wrDadvw8GMIN/4UjBCIiucM+me+sdVXT3LnrLfFQvyVjKVsabsVv2mbuB
 /OLoYlljvBMZS+KLcR10JpAyeuMCMd23GSDukYvejF+5U6rD70/fiP4q5pT89FN4Lp7I
 tcDUSD8//IKRUi1b4kZEdJVdQZ4ws6V7lhXdElNdjiig1qbzSjH6MbtGbOspHyAc71Hv
 yD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lXB9dmAirmi4v7GPBCGSMea4z8h+BAFIgAuNXXHOb2Y=;
 b=WY7qEae3hvYcCP+ylb7343JDZcnCA/4vmoZuUmAqtegc6nIhe9uSIvkMhs5UyPpBFV
 TnEJEgWiLzQUHC4qpmV4MgRZGKHPFdYvmq37XeZ2eMCB6Cj8ntc473+yKQ/XqAjRKTG4
 fb+77/Y8JZVp9jbh85FjJ5qJ2Iwqp3dpVTn7T0IKbyg2y5kl6F6Wgv2wYYhswpwy8RWb
 s23FqoOnUXJ3Qe/3ZrmWmfPhI5Slc5XAkSCDPOtDRaI/JIss84BJZxj4z0D2+FnV+T8D
 oXjmy8LM/3ElTFYQIe4niSzRubbqzZuk2HCF+EGL2rlAdoAZU2zpvW9au7Y1/8QP/IMM
 yI8g==
X-Gm-Message-State: AOAM532XdRI89cshjV6WO8rjZtNAgqwj6JFvZctjU6lQYGxVkruf88na
 WlceoTB6giSlARsfrlKQGdn2jw3FihLPbMt4EvmrMA==
X-Google-Smtp-Source: ABdhPJxubDtbjxJFVherYQTEFtOHUjR1TTTplL/wr/L2yXlHF76XKLGA0cLfr+PpH2sR1GKWN2mntDi5katKmLkzutY=
X-Received: by 2002:a05:6830:1e22:: with SMTP id
 t2mr2242455otr.100.1600927721055; 
 Wed, 23 Sep 2020 23:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpJ_efHX70Ej0uzRi-iRf7N0n6ZO5sMN-wK_YpszvVD-Un9RQ@mail.gmail.com>
 <20200923065900.658666-1-jhp@endlessos.org>
 <439c4b59-b1e6-88bb-568e-1c2a0feceed4@arm.com>
 <4641984.dSft4sXKFs@diego>
In-Reply-To: <4641984.dSft4sXKFs@diego>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Thu, 24 Sep 2020 14:07:04 +0800
Message-ID: <CAPpJ_efjVXq6BNQDfiwmEYPyjJyBH5xP2hBdGdNjT7E7=fkMXw@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: skip probed failed device
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailman-Approved-At: Thu, 24 Sep 2020 07:19:09 +0000
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
 Linux Upstreaming Team <linux@endlessm.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4g5pa8IDIwMjDlubQ55pyIMjPml6Ug6YCx
5LiJIOS4i+WNiDc6MTblr6vpgZPvvJoKPgo+IEFtIE1pdHR3b2NoLCAyMy4gU2VwdGVtYmVyIDIw
MjAsIDEzOjA1OjI2IENFU1Qgc2NocmllYiBSb2JpbiBNdXJwaHk6Cj4gPiBPbiAyMDIwLTA5LTIz
IDA3OjU5LCBKaWFuLUhvbmcgUGFuIHdyb3RlOgo+ID4gPiBUaGUgY2RuLWRwIHN1YiBkcml2ZXIg
cHJvYmVzIHRoZSBkZXZpY2UgZmFpbGVkIG9uIFBJTkVCT09LIFByby4KPiA+ID4KPiA+ID4ga2Vy
bmVsOiBjZG4tZHAgZmVjMDAwMDAuZHA6IFtkcm06Y2RuX2RwX3Byb2JlIFtyb2NrY2hpcGRybV1d
ICpFUlJPUiogbWlzc2luZyBleHRjb24gb3IgcGh5Cj4gPiA+IGtlcm5lbDogY2RuLWRwOiBwcm9i
ZSBvZiBmZWMwMDAwMC5kcCBmYWlsZWQgd2l0aCBlcnJvciAtMjIKPiA+Cj4gPiBXb3VsZG4ndCBp
dCBtYWtlIG1vcmUgc2Vuc2UgdG8gc2ltcGx5IG5vdCBlbmFibGUgdGhlIERpc3BsYXlQb3J0IG5v
ZGUgaW4KPiA+IHRoZSB1cHN0cmVhbSBEVCwgdW50aWwgdGhlIHR5cGUtQyBwaHkgd29yayBoYXMg
YmVlbiBkb25lIHRvIG1ha2UgaXQKPiA+IHVzYWJsZSBhdCBhbGw/Cj4KPiBPciBhbHRlcm5hdGl2
ZWx5IGp1c3QgZGlzYWJsZSB0aGUgY2RuLWRwIFJvY2tjaGlwIGRyaXZlciBpbiB0aGUga2VybmVs
IGNvbmZpZywKPiB3aGljaCByZXN1bHRzIGluIGl0IGFsc28gbm90IGdldHRpbmcgcHJvYmVkLgoK
VGhpcyBtYXkgYmUgdGhlIHNpbXBsZXN0IHdheS4KSG93ZXZlciwgY29uc2lkZXJpbmcgZ2VuZXJp
YyBkaXN0cm8ga2VybmVscyBoYXZlIGEgcG9saWN5IHRvIGVuYWJsZQphbGwgZHJpdmVycywgZGlz
YWJsaW5nIHRoZSBEaXNwbGF5UG9ydCBub2RlIGluIHRoZSB1cHN0cmVhbSBEVCwgdW50aWwKdGhl
IHR5cGUtQyBwaHkgd29yayBoYXMgYmVlbiBkb25lIG1heSBiZSBhIGJldHRlciBzb2x1dGlvbiBm
b3Igbm93LgpJIGNhbiBwcmVwYXJlIGEgcGF0Y2ggZm9yIHRoaXMuCgpKaWFuLUhvbmcgUGFuCgo+
ID4gQUlVSSB0aGUgIm9mZmljaWFsIiBNYW5qYXJvIGtlcm5lbCBpcyBjYXJyeWluZyBhIGJ1bmNo
IG9mCj4gPiBoYWNrcyB0byBtYWtlIHR5cGUtQyB3b3JrIHZpYSBleHRjb24sIGJ1dCB0aGV5IGtu
b3cgdGhhdCBpc24ndCBhbgo+ID4gdXBzdHJlYW1hYmxlIHNvbHV0aW9uLgo+ID4KPiA+IFJvYmlu
Lgo+ID4KPiA+ID4gVGhlbiwgdGhlIGRldmljZSBoYWx0cyBhbGwgb2YgdGhlIERSTSByZWxhdGVk
IGRldmljZSBqb2JzLiBGb3IgZXhhbXBsZSwKPiA+ID4gdGhlIG9wZXJhdGlvbnM6IHZvcF9jb21w
b25lbnRfb3BzLCB2b3BfY29tcG9uZW50X29wcyBhbmQKPiA+ID4gcm9ja2NoaXBfZHBfY29tcG9u
ZW50X29wcyBjYW5ub3QgYmUgYm91bmQgdG8gY29ycmVzcG9uZGluZyBkZXZpY2VzLiBTbywKPiA+
ID4gWG9yZyBjYW5ub3QgZmluZCB0aGUgY29ycmVjdCBEUk0gZGV2aWNlLgo+ID4gPgo+ID4gPiBU
aGlzIHBhdGNoIHNraXBzIHRoZSBwcm9iaW5nIGZhaWxlZCBkZXZpY2VzIHRvIGZpeCB0aGlzIGlz
c3VlLgo+ID4gPgo+ID4gPiBMaW5rOiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1h
aWwvbGludXgtcm9ja2NoaXAvMjAyMC1TZXB0ZW1iZXIvMDIyMzUyLmh0bWwKPiA+ID4gU2lnbmVk
LW9mZi1ieTogSmlhbi1Ib25nIFBhbiA8amhwQGVuZGxlc3Nvcy5vcmc+Cj4gPiA+IC0tLQo+ID4g
PiAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgfCA2ICsrKysr
Kwo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jCj4gPiA+IGluZGV4IDBm
M2ViMzkyZmUzOS4uZGUxMzU4ODYwMmI0IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMKPiA+ID4gQEAgLTMzMSw2ICszMzEsMTIgQEAg
c3RhdGljIHN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKnJvY2tjaGlwX2RybV9tYXRjaF9hZGQoc3Ry
dWN0IGRldmljZSAqZGV2KQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgIGlmICghZCkK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiArICAgICAgICAg
ICAgICAgICAgIGlmICghZC0+ZHJpdmVyKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICBEUk1fREVWX0VSUk9SKGQsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICIlcyBkaWQgbm90IHByb2JlIHN1Y2Nlc3NmdWxseSIsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRydi0+ZHJpdmVyLm5hbWUpOwo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgIGRldmljZV9saW5r
X2FkZChkZXYsIGQsIERMX0ZMQUdfU1RBVEVMRVNTKTsKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICBjb21wb25lbnRfbWF0Y2hfYWRkKGRldiwgJm1hdGNoLCBjb21wYXJlX2RldiwgZCk7Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
