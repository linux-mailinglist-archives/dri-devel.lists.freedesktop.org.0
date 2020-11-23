Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA942C0D81
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1189EB1;
	Mon, 23 Nov 2020 14:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EED89EB1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:31:12 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7B3820888
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141872;
 bh=vuZ+rah2hE0LNJaScoerOKwY3fCT0EUtYP8hbvGF1o8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D01SUDy+AOXdGks3r6EavahhLVcEAH4UbH/COnWtfnARQswwUTjGU0Da4LEgSMvZH
 5oEB+rRWqD+Zcj/oNJBNUMdgBA6MjM9JHYG/XC35GJLcUaxFbJmRHe11UtVWoZS7F0
 NUCXLLEtcUvv8IS5a0O0Huvy08wnb3nk5Oy66jr4=
Received: by mail-ed1-f44.google.com with SMTP id a15so17315541edy.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:31:11 -0800 (PST)
X-Gm-Message-State: AOAM5339fQMUHuAddCOmmaIX7jOpf31D/7kp5NHsMv6FdUMp1nZEE4Nt
 CfgxaMzTzAgibtzX4CFimaIBwtcGnzG5aWVnIQ==
X-Google-Smtp-Source: ABdhPJwOmjtyvLkvrDJkqOOjZKJiyogKz1KZcoxRJRbT0kCAwbM+Un1KY6jBLjQqvchQiCiAbumdEjhrGCQBqzMb6+E=
X-Received: by 2002:a50:f1d2:: with SMTP id y18mr13457355edl.166.1606141870269; 
 Mon, 23 Nov 2020 06:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-11-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-11-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:30:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__N5E6TApkVomnvWpcsLAq4tpxZffpq+wxH6_q_0uNZ7g@mail.gmail.com>
Message-ID: <CAAOTY__N5E6TApkVomnvWpcsLAq4tpxZffpq+wxH6_q_0uNZ7g@mail.gmail.com>
Subject: Re: [PATCH 10/40] drm/mediatek/mtk_drm_drv: Staticise local function
 invoked by reference
To: Lee Jones <lee.jones@linaro.org>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIExlZToKCkxlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0MTHm
nIgxM+aXpSDpgLHkupQg5LiL5Y2IOTo0OeWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmM6MzE2OjI0OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yIOKAmG10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xp
bnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBDYzogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQ2M6IFN1bWl0IFNl
bXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBZVCBTSEVOIDx5dC5zaGVuQG1lZGlhdGVr
LmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGlu
YXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4g
aW5kZXggMmU4MDY1YjFlMmJiYy4uNDAxMzExNDUzZTdkMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTMxMyw4ICszMTMsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGZpbGVfb3BlcmF0aW9ucyBtdGtfZHJtX2ZvcHMgPSB7Cj4gICAqIFdlIG5lZWQgdG8g
b3ZlcnJpZGUgdGhpcyBiZWNhdXNlIHRoZSBkZXZpY2UgdXNlZCB0byBpbXBvcnQgdGhlIG1lbW9y
eSBpcwo+ICAgKiBub3QgZGV2LT5kZXYsIGFzIGRybV9nZW1fcHJpbWVfaW1wb3J0KCkgZXhwZWN0
cy4KPiAgICovCj4gLXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqbXRrX2RybV9nZW1fcHJpbWVfaW1w
b3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRtYV9idWYgKmRtYV9idWYpCj4gK3N0YXRpYyBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKPiAgewo+ICAgICAgICAgc3Ry
dWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4KPiAtLQo+
IDIuMjUuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
