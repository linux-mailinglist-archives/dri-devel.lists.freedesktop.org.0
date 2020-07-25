Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3345022D472
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 05:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393656EA5C;
	Sat, 25 Jul 2020 03:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DED6EA5C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 03:51:03 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED0B220773
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 03:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595649063;
 bh=IB/6QMM3mNcLq0yp3daj3De1omfUDNO/kHLqyEhsa6Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K2KEh7TpNnF0mxAAYCqLboKVGglNo3SHCYHfljAe0xUta6Iitan62CbCecjxUdHwG
 HXBphKcfLkHGOOtCm8zoVgCHNZ2F3SrYMMzB+yes4gHO1K41s2zWEp/P/TaiTzKW6+
 AvVEhpyF9jSOP3gHlxMV12o5Wbs1AflrT4CHiD8Q=
Received: by mail-ej1-f46.google.com with SMTP id gg18so8495317ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 20:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM531yepC0VJNT+xFnM9JwpJpSR4ar3bqdZJfPFIk4EJGQtw98sALk
 AWBHqHJC9ID2945bx1IStFtpgM/3OvV4g88A2w==
X-Google-Smtp-Source: ABdhPJxcx4pKWckZ+ivOQWgliPqjd8Cxz0hiophWU1IPuWMgAOcngrm0sm/OsQ7JYpawO3hTDs8v8meuDWYVWGhBJ0k=
X-Received: by 2002:a17:906:7857:: with SMTP id
 p23mr10925441ejm.260.1595649061371; 
 Fri, 24 Jul 2020 20:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Jul 2020 11:50:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9jsunT=PH59yrJ=q_uPM83WVH1m4c379APCUOGL3ZjdQ@mail.gmail.com>
Message-ID: <CAAOTY_9jsunT=PH59yrJ=q_uPM83WVH1m4c379APCUOGL3ZjdQ@mail.gmail.com>
Subject: Re: [v7, PATCH 6/7] drm/mediatek: add fifo_size into rdma private data
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

VGhlIHByaW1hcnkgdGhpbmcgb2YgdGhpcyBwYXRjaCBpcyB0byBnZXQgZmlmbyBzaXplIGZyb20g
ZGV2aWNlIHRyZWUuClNvIHlvdSBtYXkgbW9kaWZ5IHRpdGxlIHRvIHNob3cgdGhlIHByaW1hcnkg
dGhpbmcuCgpZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g5pa8IDIw
MjDlubQ35pyIMjPml6Ug6YCx5ZubIOS4iuWNiDEwOjEy5a+r6YGT77yaCj4KPiB0aGUgZmlmbyBz
aXplIG9mIHJkbWEgaW4gbXQ4MTgzIGlzIGRpZmZlcmVudC4KPiByZG1hMCBmaWZvIHNpemUgaXMg
NWsKPiByZG1hMSBmaWZvIHNpemUgaXMgMmsKCkkgd291bGQgbGlrZSB0aGUgZGVzY3JpcHRpb24g
dG8gYmUgIkdldCB0aGUgZmlmbyBzaXplIGZyb20gZGV2aWNlIHRyZWUKYmVjYXVzZSBlYWNoIHJk
bWEgaW4gdGhlIHNhbWUgU29DIG1heSBoYXZlIGRpZmZlcmVudCBmaWZvIHNpemUuIgoKUmVnYXJk
cywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX3JkbWEuYyB8IDE5ICsrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX3JkbWEuYwo+IGluZGV4IGUwNDMxOWYuLjc5NGFjYzUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiBAQCAtNjMsNiArNjMsNyBAQCBz
dHJ1Y3QgbXRrX2Rpc3BfcmRtYSB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICAgICAg
ICAgICAgIGRkcF9jb21wOwo+ICAgICAgICAgc3RydWN0IGRybV9jcnRjICAgICAgICAgICAgICAg
ICAqY3J0YzsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2RhdGEgKmRhdGE7
Cj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpZm9fc2l6ZTsKPiAg
fTsKPgo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGtfZGlzcF9yZG1hICpjb21wX3RvX3JkbWEo
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiBAQCAtMTMxLDEyICsxMzIsMTggQEAgc3RhdGlj
IHZvaWQgbXRrX3JkbWFfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVk
IGludCB3aWR0aCwKPiAgICAgICAgIHVuc2lnbmVkIGludCB0aHJlc2hvbGQ7Cj4gICAgICAgICB1
bnNpZ25lZCBpbnQgcmVnOwo+ICAgICAgICAgc3RydWN0IG10a19kaXNwX3JkbWEgKnJkbWEgPSBj
b21wX3RvX3JkbWEoY29tcCk7Cj4gKyAgICAgICB1MzIgcmRtYV9maWZvX3NpemU7Cj4KPiAgICAg
ICAgIG10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgd2lkdGgsIGNvbXAsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRElTUF9SRUdfUkRNQV9TSVpFX0NPTl8wLCAweGZmZik7Cj4gICAg
ICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIGhlaWdodCwgY29tcCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBESVNQX1JFR19SRE1BX1NJWkVfQ09OXzEsIDB4ZmZmZmYpOwo+
Cj4gKyAgICAgICBpZiAocmRtYS0+Zmlmb19zaXplKQo+ICsgICAgICAgICAgICAgICByZG1hX2Zp
Zm9fc2l6ZSA9IHJkbWEtPmZpZm9fc2l6ZTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAg
ICAgcmRtYV9maWZvX3NpemUgPSBSRE1BX0ZJRk9fU0laRShyZG1hKTsKPiArCj4gICAgICAgICAv
Kgo+ICAgICAgICAgICogRW5hYmxlIEZJRk8gdW5kZXJmbG93IHNpbmNlIERTSSBhbmQgRFBJIGNh
bid0IGJlIGJsb2NrZWQuCj4gICAgICAgICAgKiBLZWVwIHRoZSBGSUZPIHBzZXVkbyBzaXplIHJl
c2V0IGRlZmF1bHQgb2YgOCBLaUIuIFNldCB0aGUKPiBAQCAtMTQ1LDcgKzE1Miw3IEBAIHN0YXRp
YyB2b2lkIG10a19yZG1hX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25l
ZCBpbnQgd2lkdGgsCj4gICAgICAgICAgKi8KPiAgICAgICAgIHRocmVzaG9sZCA9IHdpZHRoICog
aGVpZ2h0ICogdnJlZnJlc2ggKiA0ICogNyAvIDEwMDAwMDA7Cj4gICAgICAgICByZWcgPSBSRE1B
X0ZJRk9fVU5ERVJGTE9XX0VOIHwKPiAtICAgICAgICAgICAgIFJETUFfRklGT19QU0VVRE9fU0la
RShSRE1BX0ZJRk9fU0laRShyZG1hKSkgfAo+ICsgICAgICAgICAgICAgUkRNQV9GSUZPX1BTRVVE
T19TSVpFKHJkbWFfZmlmb19zaXplKSB8Cj4gICAgICAgICAgICAgICBSRE1BX09VVFBVVF9WQUxJ
RF9GSUZPX1RIUkVTSE9MRCh0aHJlc2hvbGQpOwo+ICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRx
X3BrdCwgcmVnLCBjb21wLCBESVNQX1JFR19SRE1BX0ZJRk9fQ09OKTsKPiAgfQo+IEBAIC0yOTEs
NiArMjk4LDE2IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfcmRtYV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gY29tcF9pZDsKPiAgICAg
ICAgIH0KPgo+ICsgICAgICAgaWYgKG9mX2ZpbmRfcHJvcGVydHkoZGV2LT5vZl9ub2RlLCAibWVk
aWF0ZWsscmRtYV9maWZvX3NpemUiLCAmcmV0KSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25vZGUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJtZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZSIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwcml2LT5maWZvX3NpemUpOwo+
ICsgICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IHJkbWEgZmlmbyBzaXplXG4iKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9
Cj4gKwo+ICAgICAgICAgcmV0ID0gbXRrX2RkcF9jb21wX2luaXQoZGV2LCBkZXYtPm9mX25vZGUs
ICZwcml2LT5kZHBfY29tcCwgY29tcF9pZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZtdGtfZGlzcF9yZG1hX2Z1bmNzKTsKPiAgICAgICAgIGlmIChyZXQpIHsKPiAtLQo+IDEu
OC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
