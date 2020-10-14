Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF028E0EF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 15:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F23489C1F;
	Wed, 14 Oct 2020 13:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6694989C1F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 13:00:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABDC822201
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602680411;
 bh=EjQyMXBgmkGopUQIOpSQ0qJ6aFXvAlg6I7g92NkSgMQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fLBWb4iDrpBUKe6rxTTtf70Eda3+Q02E2x6UnykIAPRRGz17bipaL0LMokMsx7Hsn
 XSss2EcKy7Wg9vQcmOrQPyfZJj6y+jF9GSwl8qWWWzNNfZBONfVakXBt1e7ETe7WZK
 klZDLKm6mkfNyobaMG16UmAXDuZBsz5C46GdbmMs=
Received: by mail-ed1-f53.google.com with SMTP id g4so3072499edk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 06:00:10 -0700 (PDT)
X-Gm-Message-State: AOAM531EwJmLD4a/Nb5bdFEBQVBxwdzja+ot5NqJ+7J2aR87kCjsT78h
 +r0ew7fmZardc6Nkrtgy1+RNVi+PJBWfhX8BwQ==
X-Google-Smtp-Source: ABdhPJx3leXWo1y/6rJJ+KAWg7Fbkc30MfGqk8ihqIGPrl/962tukEUoCc8WEJHlE62caGzULO47VlzVmHwMP2PHfsk=
X-Received: by 2002:aa7:c3ca:: with SMTP id l10mr5129675edr.72.1602680409031; 
 Wed, 14 Oct 2020 06:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
In-Reply-To: <20201013181924.4143303-2-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Oct 2020 20:59:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
Message-ID: <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: Fabien Parent <fparent@baylibre.com>
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

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMTTml6Ug6YCx5LiJIOS4iuWNiDI6MTnlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBIRE1JIG9uIE1UODE2Ny4gSERNSSBvbiBNVDgxNjcgaXMgc2ltaWxhciB0bwo+IE1UODE3
My9NVDI3MDEgZXhlY3B0IGZvciB0aGUgdHdvIHJlZ2lzdGVyczogU1lTX0NGRzFDIGFuZCBTWVNf
Q0ZHMjAKCkkgdGhpbmsgeW91IHNob3VsZCBkcm9wIHRoaXMgc2VyaWVzLiBBY2NvcmRpbmcgdG8g
TWVkaWF0ZWsgSERNSQpiaW5kaW5nIGRvY3VtZW50IFsxXSwgdGhlIHNlY29uZCBwYXJhbWV0ZXIg
b2YgbWVkaWF0ZWssc3lzY29uLWhkbWkgaXMKdGhlIHJlZ2lzdGVyIG9mZnNldC4gSSB0aGluayB5
b3UgY291bGQgc2V0IHJlZ2lzdGVyIG9mZnNldCB0byAweDgwMApmb3IgbXQ4MTY3LgoKWzFdIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGhkbWkudHh0P2g9djUuOQoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAt
LS0KPgo+IENoYW5nZWxvZzoKPiB2MjogZml4IG5hbWUgb2YgcGRhdGEgc3RydWN0dXJlCj4KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICB8IDcgKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcmVncy5oIHwgMiArKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMKPiBpbmRleCA1NzM3MGMwMzY0OTcuLjQ4NGVhOWNkNjU0YSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jCj4gQEAgLTE4MzUsOSArMTgzNSwxNiBAQCBzdGF0aWMgc3RydWN0
IG10a19oZG1pX2RhdGEgbXQ4MTczX2hkbWlfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuc3lz
X2NmZzIwID0gSERNSV9TWVNfQ0ZHMjAsCj4gIH07Cj4KPiArc3RhdGljIHN0cnVjdCBtdGtfaGRt
aV9kYXRhIG10ODE2N19oZG1pX2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLnN5c19jZmcxYyA9
IE1UODE2N19IRE1JX1NZU19DRkcxQywKPiArICAgICAgIC5zeXNfY2ZnMjAgPSBNVDgxNjdfSERN
SV9TWVNfQ0ZHMjAsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtdGtfZHJtX2hkbWlfb2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE3My1oZG1pIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX2hkbWlfZHJp
dmVyX2RhdGEgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWhk
bWkiLAo+ICsgICAgICAgICAuZGF0YSA9ICZtdDgxNjdfaGRtaV9kcml2ZXJfZGF0YSB9LAo+ICAg
ICAgICAge30KPiAgfTsKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWlfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3Mu
aAo+IGluZGV4IDIwNTBiYTQ1YjIzYS4uYTBmOWMzNjdkN2FhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWlfcmVncy5oCj4gQEAgLTE5NSw2ICsxOTUsNyBAQAo+ICAjZGVm
aW5lIEdFTl9SR0IgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgwIDw8IDcpCj4KPiAg
I2RlZmluZSBIRE1JX1NZU19DRkcxQyAgICAgICAgIDB4MDAwCj4gKyNkZWZpbmUgTVQ4MTY3X0hE
TUlfU1lTX0NGRzFDICAweDgwMAo+ICAjZGVmaW5lIEhETUlfT04gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJJVCgwKQo+ICAjZGVmaW5lIEhETUlfUlNUICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMSkKPiAgI2RlZmluZSBBTkxHX09OICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMikKPiBAQCAtMjExLDYgKzIxMiw3IEBACj4gICNkZWZpbmUgSFRQTEdfUElOX1NF
TF9PRkYgICAgICAgICAgICAgIEJJVCgzMCkKPiAgI2RlZmluZSBBRVNfRUZVU0VfRU5BQkxFICAg
ICAgICAgICAgICAgQklUKDMxKQo+ICAjZGVmaW5lIEhETUlfU1lTX0NGRzIwICAgICAgICAgMHgw
MDQKPiArI2RlZmluZSBNVDgxNjdfSERNSV9TWVNfQ0ZHMjAgIDB4ODA0Cj4gICNkZWZpbmUgREVF
UF9DT0xPUl9NT0RFX01BU0sgICAgICAgICAgICgzIDw8IDEpCj4gICNkZWZpbmUgQ09MT1JfOEJJ
VF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgKDAgPDwgMSkKPiAgI2RlZmluZSBDT0xPUl8x
MEJJVF9NT0RFICAgICAgICAgICAgICAgKDEgPDwgMSkKPiAtLQo+IDIuMjguMAo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
