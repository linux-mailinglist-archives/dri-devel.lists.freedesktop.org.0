Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC52C9296
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D065989C18;
	Mon, 30 Nov 2020 23:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6089C07;
 Mon, 30 Nov 2020 23:34:07 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id e105so1069811ote.5;
 Mon, 30 Nov 2020 15:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PeewXy7NC7XXblYMxEWdawjkTVhWy4LJb2cZR8KPRgU=;
 b=ryNpJxgGgmPAR25f2mBd4A2HVAqiC4jjs1MlZnbBf9PfQn2NiNQLGpMA0a7MSZewPq
 d3CBIhmvc2Exao/qyM9B/GNxyo1GrnuxJ7gW21ZirtiXN3dkdXt+tqfjaVuTIHPZUv6j
 Nd3MyEHmNHFZCh+MkWJklXOnhcGxp0esx4qnFaOteCsB6IFOoDWgcsmffm/aCJpsMc2V
 jpZWX5VD1x4cZYigjtG/ktXhbwmn1lUx0jLEq2SSK76rniR+tDSVH0kn4/KsdbLtXzM9
 TmZhVWpWZ3L22hf1Bwv5fYKlwMjSvy0R0lJ7wqb5JQiQcoDzQybwFpoZGTSCnVyEzLvY
 opSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PeewXy7NC7XXblYMxEWdawjkTVhWy4LJb2cZR8KPRgU=;
 b=d36q+Pxux3my0HS0r6x9vKWVFRSLveo/S09amnWGKlliNV5GJXrjqDQetU3oJ21U4l
 tYWm7K613rPPKsqoIWn+y+NM0DTLR0kasrYj9Do2LwwZW1M1hhqiqIinoMW5hZ/Bg66+
 dW/oTBXY2z7F5TSinvdAdzLwlWFVmYMamuhefGuR+GB5NCs4JXSWmdgNLIUDRxsfgFR+
 ZJ1f8uFa3XA81JoHH81QOkacAgiqevGfbPfR4y2BISxF88T9bVFrOe955NO/4IuRyBwN
 8yOaSf9LxaUK3MDXrCZbkiSySuFeU7thNAWoLa6WZeoXP7WOwxnmYLjxIEf7aVHlsreY
 1+cg==
X-Gm-Message-State: AOAM531/LTPR1dLwCJZZqfW6BQhQcjHa4MXIJh+IAG3Vs7YPOtCurhWa
 OR63rSEncgN5pzarXt72hZCN1i7RslKnQPThlf4=
X-Google-Smtp-Source: ABdhPJzbM+ERYLAt2H3fxGgdW4jJgjNLIKnHBnoHDRo0SfL7na09rjAyUilpsPkvBfuszsm/jzRc/smso1HH9R/7LUM=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr18962424otg.311.1606779247247; 
 Mon, 30 Nov 2020 15:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-14-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-14-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:33:55 -0500
Message-ID: <CADnq5_P=+P6MVzD0VTV9qYKAi=4KGvaBkSrEbwQVvUfbpSaivQ@mail.gmail.com>
Subject: Re: [PATCH 13/40] drm/amd/pm/powerplay/hwmgr/hwmgr: Move
 'smu7_init_function_pointers()'s prototype to header
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9od21nci9zbXU3X2h3bWdyLmM6NTY5Njo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmHNtdTdfaW5pdF9mdW5jdGlvbl9wb2ludGVyc+KAmSBbLVdtaXNzaW5nLXByb3Rv
dHlwZXNdCj4gIDU2OTYgfCBpbnQgc211N19pbml0X2Z1bmN0aW9uX3BvaW50ZXJzKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IpCj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4KPiBDYzog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRo
YW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgg
ICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdt
Z3IvaHdtZ3IuYyB8IDEgLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdt
Z3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKPiBpbmRleCAwZTIyY2Jh
M2NlM2E2Li4zOTNlNGU3NmE4OTYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vaW5jL2h3bWdyLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5o
Cj4gQEAgLTgyOCw2ICs4MjgsNyBAQCBpbnQgaHdtZ3JfaGFuZGxlX3Rhc2soc3RydWN0IHBwX2h3
bWdyICpod21nciwKPgo+ICAjZGVmaW5lIFBITV9FTlRJUkVfUkVHSVNURVJfTUFTSyAweEZGRkZG
RkZGVQo+Cj4gK2ludCBzbXU3X2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0IHBwX2h3bWdy
ICpod21ncik7Cj4gIGludCBzbXU4X2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0IHBwX2h3
bWdyICpod21ncik7Cj4KPiAgI2VuZGlmIC8qIF9IV01HUl9IXyAqLwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9od21nci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwo+IGluZGV4IGVjMTdhM2U2M2Vh
MDIuLjc5OTkwOTFjY2ExNmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9w
b3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L2h3bWdyL2h3bWdyLmMKPiBAQCAtNDYsNyArNDYsNiBAQCBleHRlcm4gY29uc3Qgc3Ry
dWN0IHBwX3NtdW1ncl9mdW5jIHZlZ2ExMl9zbXVfZnVuY3M7Cj4gIGV4dGVybiBjb25zdCBzdHJ1
Y3QgcHBfc211bWdyX2Z1bmMgc211MTBfc211X2Z1bmNzOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0
IHBwX3NtdW1ncl9mdW5jIHZlZ2EyMF9zbXVfZnVuY3M7Cj4KPiAtZXh0ZXJuIGludCBzbXU3X2lu
aXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0IHBwX2h3bWdyICpod21ncik7Cj4gIGV4dGVybiBp
bnQgdmVnYTEwX2h3bWdyX2luaXQoc3RydWN0IHBwX2h3bWdyICpod21ncik7Cj4gIGV4dGVybiBp
bnQgdmVnYTEyX2h3bWdyX2luaXQoc3RydWN0IHBwX2h3bWdyICpod21ncik7Cj4gIGV4dGVybiBp
bnQgdmVnYTIwX2h3bWdyX2luaXQoc3RydWN0IHBwX2h3bWdyICpod21ncik7Cj4gLS0KPiAyLjI1
LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
