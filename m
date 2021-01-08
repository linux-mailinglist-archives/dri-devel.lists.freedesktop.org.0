Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E352EF9ED
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBEA6E8D2;
	Fri,  8 Jan 2021 21:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3740B6E8D2;
 Fri,  8 Jan 2021 21:09:09 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id q25so12854670oij.10;
 Fri, 08 Jan 2021 13:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hj2BDjkjwXsMxC7AwthRbXSFYL/Nuw/Pgh7craXfm4Y=;
 b=df/i+IUS/WvgV2yk+srMUN2ud5xcHg4fi3IKglxVDhn9WSR2e9KkbQjuXQrESEDP8A
 vFRXLqG+Vw5yGaSMGJWm5IwJJN24k0ehBQh9YucrX9yXPOHDBU8vmoHET16I1FXAL6Ow
 5hLxwudrB/i/Lw/N1UIF8JH4AW300TC0lK/deGiOlELw3HPZa5bGLvRqf72dkNdyLfVo
 BqefH2pZlyOIlX5r7A0JPrSjjCnzp/hQ+RXxoXix4MiE1ztsg3lxH/bxZcSALcPlv5Lh
 Hw4WpKYQA5u0uR/TsWgWhddtSAM/ddTKNj42+XOiCdYjzKl0oRDCSFbCj5+tNsWFlnGJ
 dkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hj2BDjkjwXsMxC7AwthRbXSFYL/Nuw/Pgh7craXfm4Y=;
 b=CicBUnfs//x1lNb9bgredMm+NkMuNOyQG0XauUEFB5//IDISxgGEQKMZ4+Mf7wD0I8
 0/ZdZ/ae8bGwLXYbHYaBkPrWF/UIIrNmSReAoNL3LIUlndi29LbPIMCeSE7U02QnkZuR
 GWKIAnDu+LeetoQAhGkaUOCPKNHeomXXvjfMRwv7p1qN2hAGmMLG7O7bzrdnOIOw+m/S
 HEzUPF+Cxz9EKoFlzksy09XxxNxR+b0s1icHNV7ih/ADPl0Cqm0gGcX5XwlfXJnsWYDX
 EyOf9HpguR13uwMq9vz4xE1akoVERWgSimdC66AankLIP0HGGPHZ/9A/7uQFQTVpCNoC
 uASw==
X-Gm-Message-State: AOAM531zT6qUJx6kXQMrnTI+W7anRMOMR8u3i4gcHoyTSpwVDKT5IJ8S
 YHHVwqJ4/QGoz5Sty9UvyG+UQeG5F05kyWzKp5mNlyjh
X-Google-Smtp-Source: ABdhPJxERzv0PbVY1h7MH3aEGuyAxH6AnBzi7W7TneraBmWUvS9TSHsDBFrs3+muIaxjBJ83Y8Khij7L5DKzv0d+Qq4=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr3495197oib.123.1610140148635; 
 Fri, 08 Jan 2021 13:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-24-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-24-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:08:57 -0500
Message-ID: <CADnq5_O6tuHm6AQEFZWofm_kaWGVG5O_sTXUsBT_=c9-qTN4ug@mail.gmail.com>
Subject: Re: [PATCH 23/40] drm/amd/display/dc/dce/dce_audio: Make function
 invoked by reference static
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX2F1ZGlvLmM6ODcxOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYZGNlNjBfYXVkX3dhbGxfZHRvX3NldHVw4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+
IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1A
Z21haWwuY29tPgo+IENjOiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uYwo+IGluZGV4IDJhMmEwZmRiOTI1MzkuLjc4NjZj
ZjJhNjY4ZmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfYXVkaW8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Uv
ZGNlX2F1ZGlvLmMKPiBAQCAtODY4LDcgKzg2OCw3IEBAIHZvaWQgZGNlX2F1ZF93YWxsX2R0b19z
ZXR1cCgKPiAgfQo+Cj4gICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX1NJKQo+IC12b2lk
IGRjZTYwX2F1ZF93YWxsX2R0b19zZXR1cCgKPiArc3RhdGljIHZvaWQgZGNlNjBfYXVkX3dhbGxf
ZHRvX3NldHVwKAo+ICAgICAgICAgc3RydWN0IGF1ZGlvICphdWRpbywKPiAgICAgICAgIGVudW0g
c2lnbmFsX3R5cGUgc2lnbmFsLAo+ICAgICAgICAgY29uc3Qgc3RydWN0IGF1ZGlvX2NydGNfaW5m
byAqY3J0Y19pbmZvLAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
