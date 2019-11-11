Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD549F8311
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 23:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D368B6E0A2;
	Mon, 11 Nov 2019 22:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769DB6E0A2;
 Mon, 11 Nov 2019 22:39:49 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l1so1027012wme.2;
 Mon, 11 Nov 2019 14:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLZzRK49xDavb9wz9Sf4AjD14pe2l4fvkbkWyRvqJ9M=;
 b=OpxQOId96gRgNLU5WGoK5T1kBV5SevaR0jjwE2chi/c1aIEbdWGLw7p4aa/gu6XxY0
 rw9SxI2nczh3HNp6glkREX0ch94W5lGemCwxqB9pbytA10YzBt4aVwKFzxg8+ERiFbYw
 Cxs0ms0v2fGF+zY9A4pTmyK9kOCXulhXXgn52vMOXk7brQQHIE2HdkjCPKf0EmX267R2
 zYDAfq9eleqvhM982fdRKjg5pFblvznDbGqf77aV9LAUr+m0LyViV9bbabYon2KUexfc
 JlmK2OJA72jNrCwGihwYeRCgMaYgdPOXTeFI87owJFtFfZNuvKWKV78n/ptm5KoWelXs
 pRXg==
X-Gm-Message-State: APjAAAXsv+DaVndnBlUyUIEAgG0D+pTaN4vj6ccwSCRXfYfXtxaARu62
 EQGX9KPTqNjywuDJ33fh7Xx0vdUIhBM0BfwwibU=
X-Google-Smtp-Source: APXvYqz+tmuJK+8UMO293AmQSmsTISo+DNCWj9/FOQWAl3qhe7Xq8Jc6y5Cy2acisbs754yH/eX41FMkrx0gHYnlKHc=
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr1037425wma.34.1573511988047; 
 Mon, 11 Nov 2019 14:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20191111172543.GA31748@embeddedor>
 <b5b41653-3536-b0f0-2f49-2c010370ec99@amd.com>
 <cf7d4cfe-be29-39d8-8a5e-bac217475597@embeddedor.com>
In-Reply-To: <cf7d4cfe-be29-39d8-8a5e-bac217475597@embeddedor.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 17:39:34 -0500
Message-ID: <CADnq5_NmfCaQ=6to+ng81=qV0mp7Vo-ugKPTF__5JMAmjP13Kw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsigned variable compared to less
 than zero
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kLZzRK49xDavb9wz9Sf4AjD14pe2l4fvkbkWyRvqJ9M=;
 b=VZXuhxfCsYqJHeAAZWi8U4wsj49O2BkOkmkDNoQod5eOhXrb0FI6MPWtiONK3lEHIC
 g6EgrDgHM4QqZWIG1URCW42d7CaCrN/dTtkea5oO3HRXepParhfR+8mTgj+SUhB5SlsD
 cpUat5dlYyBH/Nn5g/Jhc22m++/wA4M0LInFkqytUm3CoUi0Yxcsy45ybiRGJWBRMI2t
 y60LN80clF+fH2hFqNLvnYKd2jd6Iwf86ZmKY+VHhQj8GS5qU6SlVR+0qDEyggoLishn
 4N2jfW8fYOulcywjy1p69/IHUErRea8Vc3YugI4Qi0mE6fktdQjMW3MYugVNHmzgmM+M
 JVeA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Mikita Lipski <mlipski@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTm92IDExLCAyMDE5IGF0IDI6NDQgUE0g
R3VzdGF2byBBLiBSLiBTaWx2YQo8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4gd3JvdGU6Cj4KPgo+
Cj4gT24gMTEvMTEvMTkgMTE6NDYsIE1pa2l0YSBMaXBza2kgd3JvdGU6Cj4gPgo+ID4gVGhhbmtz
IGZvciBjYXRjaGluZyBpdCEKPiA+Cj4KPiBHbGFkIHRvIGhlbHAgb3V0LiA6KQo+Cj4gPiBSZXZp
ZXdlZC1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgo+ID4KPgo+IFRo
YW5rcwo+IC0tCj4gR3VzdGF2bwo+Cj4gPgo+ID4gT24gMTEuMTEuMjAxOSAxMjoyNSwgR3VzdGF2
byBBLiBSLiBTaWx2YSB3cm90ZToKPiA+PiBDdXJyZW5seSwgdGhlIGVycm9yIGNoZWNrIGJlbG93
IG9uIHZhcmlhYmxlKnZjcGlfc2xvdHMqICBpcyBhbHdheXMKPiA+PiBmYWxzZSBiZWNhdXNlIGl0
IGlzIGEgdWludDY0X3QgdHlwZSB2YXJpYWJsZSwgaGVuY2UsIHRoZSB2YWx1ZXMKPiA+PiB0aGlz
IHZhcmlhYmxlIGNhbiBob2xkIGFyZSBuZXZlciBsZXNzIHRoYW4gemVybzoKPiA+Pgo+ID4+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6Cj4gPj4gNDg3
MCAgICAgICAgIGlmIChkbV9uZXdfY29ubmVjdG9yX3N0YXRlLT52Y3BpX3Nsb3RzIDwgMCkgewo+
ID4+IDQ4NzEgICAgICAgICAgICAgICAgIERSTV9ERUJVR19BVE9NSUMoImZhaWxlZCBmaW5kaW5n
IHZjcGkgc2xvdHM6ICVkXG4iLCAoaW50KWRtX25ld19jb25uZWN0b3Jfc3RhdCAgICAgZS0+dmNw
aV9zbG90cyk7Cj4gPj4gNDg3MiAgICAgICAgICAgICAgICAgcmV0dXJuIGRtX25ld19jb25uZWN0
b3Jfc3RhdGUtPnZjcGlfc2xvdHM7Cj4gPj4gNDg3MyAgICAgICAgIH0KPiA+Pgo+ID4+IEZpeCB0
aGlzIGJ5IG1ha2luZyp2Y3BpX3Nsb3RzKiAgb2YgaW50IHR5cGUKPiA+Pgo+ID4+IEFkZHJlc3Nl
cy1Db3Zlcml0eTogMTQ4NzgzOCAoIlVuc2lnbmVkIGNvbXBhcmVkIGFnYWluc3QgMCIpCj4gPj4g
Rml4ZXM6IGI0YzU3OGYwODM3OCAoImRybS9hbWQvZGlzcGxheTogQWRkIE1TVCBhdG9taWMgcm91
dGluZXMiKQo+ID4+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmE8Z3VzdGF2b0Bl
bWJlZGRlZG9yLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggfCAyICstCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAo+ID4+IGluZGV4IDZkYjA3ZTll
MzNhYi4uYThmYzkwYTkyN2Q2IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCj4gPj4gQEAgLTQwMyw3ICs0MDMsNyBA
QCBzdHJ1Y3QgZG1fY29ubmVjdG9yX3N0YXRlIHsKPiA+PiAgICAgICBib29sIHVuZGVyc2Nhbl9l
bmFibGU7Cj4gPj4gICAgICAgYm9vbCBmcmVlc3luY19jYXBhYmxlOwo+ID4+ICAgICAgIHVpbnQ4
X3QgYWJtX2xldmVsOwo+ID4+IC0gICAgdWludDY0X3QgdmNwaV9zbG90czsKPiA+PiArICAgIGlu
dCB2Y3BpX3Nsb3RzOwo+ID4+ICAgICAgIHVpbnQ2NF90IHBibjsKPiA+PiAgIH07Cj4gPj4gICAt
LSAyLjIzLjAKPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
