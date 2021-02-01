Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853630A8DF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28D26E101;
	Mon,  1 Feb 2021 13:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941396E101
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:37:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF23B64EAC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612186627;
 bh=Ca6sILXG4fwyLv608fCB+3JeQwCE0JDKDmcvJPplyMU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kr3EddrrKwSTCkaYxO9jNkuvl767WrHxraPzTgsh4dCinF9nC9h87lejDgnzya/Ur
 4pYiK/WYT3DZcpGcUEaxv16ICA8WV8K/zFA8ClVI+n1eGnkAah+rFP+77cYjpjG8hc
 dS0I46/hqxrB6Lcq+If/Flrv0P6GQHEh2sls7pR/61KY5h0fY8QJzcfzXrNz6XuiwC
 Dd4pQBy5IX78RJWVC+3aWfUqm4eYd3XvtftJ4rKGlDGcmXGJUihWXC/8xOm676x+Gz
 t21RHf9rTVE+ADr+WAL42yx3ANpCerxEj2DOF5rfF9ZvzpEOHuEosMIR0VTVmT9vat
 Roj3n/x8TXrDw==
Received: by mail-wr1-f51.google.com with SMTP id 7so16626957wrz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:37:06 -0800 (PST)
X-Gm-Message-State: AOAM533B+hniVZ8SEK1JIi8FE9BwaTg+UbtHaLJkuPoSeivYv+sQp/rN
 QWhgSq0kwIw1SY/VTQeWYUTdVOSVAlRQlwRvog==
X-Google-Smtp-Source: ABdhPJwGbLbPXA9ztMTVXLGo0SWhr8NHgerLg6mdo4pyBi7dlYyviEPBb6aW4ApZKN9NnopTRVp50+8iSm8fx35JTCw=
X-Received: by 2002:a5d:524a:: with SMTP id k10mr18325193wrc.394.1612186625106; 
 Mon, 01 Feb 2021 05:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20210131051058.3407985-1-hsinyi@chromium.org>
 <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
In-Reply-To: <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 1 Feb 2021 21:36:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VKeP0Z-Up5gpaB9SwcCbwQdB5cHXfssQB77s_G1U63w@mail.gmail.com>
Message-ID: <CAAOTY__VKeP0Z-Up5gpaB9SwcCbwQdB5cHXfssQB77s_G1U63w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: enable dither function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8
IDIwMjHlubQy5pyIMeaXpSDpgLHkuIAg5LiK5Y2IMTI6MjDlr6vpgZPvvJoKPgo+IEhpLCBIc2lu
LVlpOgo+Cj4gSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMeW5tDHm
nIgzMeaXpSDpgLHml6Ug5LiL5Y2IMToxMeWvq+mBk++8mgo+ID4KPiA+IEZyb206IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4KPiA+IEVuYWJsZSBkaXRoZXIg
ZnVuY3Rpb24gdG8gaW1wcm92ZSB0aGUgZGlzcGxheSBxdWFsaXR5Lgo+Cj4gUmV2aWV3ZWQtYnk6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+CgpBcHBsaWVkIHRvIG1l
ZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1l
ZGlhdGVrLWRybS1uZXh0Cgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlv
bmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5n
IDxoc2lueWlAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiBQcmV2aW91cyB2ZXJzaW9uOgo+ID4g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNo
LzIwMjEwMTI5MDkyMjA5LjI1ODQ3MTgtNy1oc2lueWlAY2hyb21pdW0ub3JnLwo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDkgKysrKysr
Ky0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
X2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiA+
IGluZGV4IGM3MzAwMjlhYzhmYzcuLjA0NDRiNDI5ZGFmMDAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gPiBAQCAtNTMsNiArNTMsNyBA
QAo+ID4gICNkZWZpbmUgRElUSEVSX0VOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KDApCj4gPiAgI2RlZmluZSBESVNQX0RJVEhFUl9DRkcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4MDAyMAo+ID4gICNkZWZpbmUgRElUSEVSX1JFTEFZX01PREUgICAgICAgICAgICAg
ICAgICAgICAgQklUKDApCj4gPiArI2RlZmluZSBESVRIRVJfRU5HSU5FX0VOICAgICAgICAgICAg
ICAgICAgICAgICBCSVQoMSkKPiA+ICAjZGVmaW5lIERJU1BfRElUSEVSX1NJWkUgICAgICAgICAg
ICAgICAgICAgICAgIDB4MDAzMAo+ID4KPiA+ICAjZGVmaW5lIExVVF8xMEJJVF9NQVNLICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDNmZgo+ID4gQEAgLTMxNSw4ICszMTYsMTIgQEAgc3RhdGlj
IHZvaWQgbXRrX2RpdGhlcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQg
dywKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBtdGtfZGRwX2NvbXBfZGV2ICpwcml2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4gPgo+ID4gLSAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0
LCBoIDw8IDE2IHwgdywgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLCBESVNQX0RJVEhFUl9T
SVpFKTsKPiA+IC0gICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgRElUSEVSX1JFTEFZX01P
REUsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywgRElTUF9ESVRIRVJfQ0ZHKTsKPiA+ICsg
ICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsICZwcml2LT5jbWRxX3Jl
ZywgcHJpdi0+cmVncywKPiA+ICsgICAgICAgICAgICAgICAgICAgICBESVNQX0RJVEhFUl9TSVpF
KTsKPiA+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgRElUSEVSX1JFTEFZX01PREUs
ICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiA+ICsgICAgICAgICAgICAgICAgICAgICBE
SVNQX0RJVEhFUl9DRkcpOwo+ID4gKyAgICAgICBtdGtfZGl0aGVyX3NldF9jb21tb24ocHJpdi0+
cmVncywgJnByaXYtPmNtZHFfcmVnLCBicGMsIERJU1BfRElUSEVSX0NGRywKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIERJVEhFUl9FTkdJTkVfRU4sIGNtZHFfcGt0KTsKPiA+ICB9
Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIG10a19kaXRoZXJfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2
KQo+ID4gLS0KPiA+IDIuMzAuMC4zNjUuZzAyYmM2OTM3ODktZ29vZwo+ID4KPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
