Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D922DC2CA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418D289EB7;
	Wed, 16 Dec 2020 15:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E703289EB7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:11:09 +0000 (UTC)
X-Gm-Message-State: AOAM531vKX8PFrfqM6qTXQ0Rb9HqY8d0hIXkqa4B6upq1j/MU6GVqMX5
 tqSVlaD8+TFa8dvpNyQqwtICk01HK5KTXpOkug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608131469;
 bh=qJnz4jINEHnwylSMSs8ygzcSuobmntS82hFNu7/S1oQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lRAsTNDWesqlzQ3DfHEKOK3sUEih3R8sZvgqKu7FOxscR2Jx2o64DlAWsbq5aOfPs
 L/+MntDsLzLCCDpILOstBBLRMb061S5uGGRj1DM4HAXGtO2W8YYjN43oWvKR77qeSg
 MNsoGkyZOHXa+SJtpvYX2kJAqkdZh+G6x7z/V/PZaGr/U5pDDY/6s8Vzq52gVAv8Op
 NSiBaxK3AQKLvK5wc6xNwdNWW5tDbPLKIxvHwb1WwEvNUPv4Wm5bU609c4aYdqnJ5A
 6lYHM1a2YCCahcw8rHFeKVsYCj75XkJSHfpaJTy+R5RO+Z/sY/Rwc/1xIbUMzWQTOK
 O4UFAPVEjkZvg==
X-Google-Smtp-Source: ABdhPJwS/YraW4qyb0Dm3f675N42jAY1oC2Y8j8EzHOplVWPvcJ8f3cI6/ZgJvdjQ83rFs2emQdjBQ/MA4j9o6AQcBc=
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr3796965wmg.145.1608131467393; 
 Wed, 16 Dec 2020 07:11:07 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-11-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-11-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 16 Dec 2020 23:10:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
Message-ID: <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
Subject: Re: [PATCH v2, 10/17] drm/mediatek: fix aal size config
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
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjIy5a+r6YGT77yaCj4KPiBm
aXggYWFsIHNpemUgY29uZmlnCj4KPiBGaXhlczogMDY2NGQxMzkyYzI2IChkcm0vbWVkaWF0ZWs6
IEFkZCBBQUwgZW5naW5lIGJhc2ljIGZ1bmN0aW9uKQo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMTEgKysrKysrKysrKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGluZGV4IGJlNjFkMTEuLmU3ZDQ4
MWUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5j
Cj4gQEAgLTMzLDggKzMzLDEzIEBACj4gICNkZWZpbmUgRElTUF9SRUdfVUZPX1NUQVJUICAgICAg
ICAgICAgICAgICAgICAgMHgwMDAwCj4KPiAgI2RlZmluZSBESVNQX0FBTF9FTiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDAwMDAKPiArI2RlZmluZSBESVNQX0FBTF9DRkcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDAwMjAKPiArI2RlZmluZSBBQUxfUkVMQVlfTU9ERSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+ICsjZGVmaW5lIEFBTF9FTkdJTkVfRU4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDEpCj4gICNkZWZpbmUgRElTUF9B
QUxfU0laRSAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDMwCj4KPiArI2RlZmluZSBESVNQ
X0FBTF9PVVRQVVRfU0laRSAgICAgICAgICAgICAgICAgICAweDA0ZDgKPiArCj4gICNkZWZpbmUg
RElTUF9DQ09SUl9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwCj4gICNkZWZpbmUg
Q0NPUlJfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDApCj4gICNkZWZpbmUg
RElTUF9DQ09SUl9DRkcgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDIwCj4gQEAgLTE4NCw3
ICsxODksMTEgQEAgc3RhdGljIHZvaWQgbXRrX2FhbF9jb25maWcoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCwgdW5zaWduZWQgaW50IHcsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGgsIHVuc2lnbmVkIGludCB2cmVmcmVzaCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+ICB7
Cj4gLSAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBoIDw8IDE2IHwgdywgY29tcCwgRElT
UF9BQUxfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwg
aCwgY29tcCwgRElTUF9BQUxfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0
LCB3IDw8IDE2IHwgaCwgY29tcCwgRElTUF9BQUxfT1VUUFVUX1NJWkUpOwo+ICsKPiArICAgICAg
IG10a19kZHBfd3JpdGVfbWFzayhOVUxMLCBBQUxfUkVMQVlfTU9ERSwgY29tcCwgRElTUF9BQUxf
Q0ZHLAoKY21kcV9wa3QKCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgQUFMX1JFTEFZX01P
REUgfCBBQUxfRU5HSU5FX0VOKTsKClRoaXMgcGF0Y2ggaXMgdG8gZml4IHNpemUgY29uZmlnLCBz
byBtb3ZlIHRoaXMgc3RhdGVtZW50IHRvIGFub3RoZXIgcGF0Y2guCgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19hYWxfc3RhcnQoc3RydWN0IG10a19kZHBf
Y29tcCAqY29tcCkKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
