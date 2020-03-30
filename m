Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E3197CC7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 15:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B8789FD4;
	Mon, 30 Mar 2020 13:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B4F89FD4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 13:24:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a25so21655329wrd.0;
 Mon, 30 Mar 2020 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CMTqMgwFG5tqJgidUd5oMEQh79mmBxijxw/tBJhZNas=;
 b=JtAcIcmB49EOq2i+ns9besXPK/mGZS6KK9LFemRR2CTN49cBDzOLntZVbLq0ta0uPB
 GLOVL7Bhys+xD/vH09YvCqIbTZrZp6Au416K7VZ6Pg0vW/UoW71gGeJ1OxI6sq/9QMXn
 nNaZXhecWIucMDwCkq8Ld7iFzHdS7Q3CJ8+Q2USCatVuK9AWHVB2qkWQgb3vHsuBpb0K
 hMIXZ2Fjpu9Ec2pzWrY72V4jFd/zcXggm+jVbaCUrcFwiTZyWBuClUC38xAvhyrjbaHg
 Tk6mTK+xvpcROO/0LPkbH+nagJ0nQ/M2Qdcqbb4cHdSlYWtnl9RcDV7ErU7F02lUdT3C
 QwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CMTqMgwFG5tqJgidUd5oMEQh79mmBxijxw/tBJhZNas=;
 b=TWdbHSeLS07ZgU+lx0y+zQmaRFpty4meoHNsyJ/QEmznuacYQrAjOTz6C3TEjsSH+T
 f4SSgL9NTGMF8uymXpPfUKOG1nIJZcaZY4qzFz1BzzdC3VYB33GE8sd8eRe6R+oWx+A6
 YWchZmSMWzZ8g7LC9NKj3UOou6YpPB0M8t7D8wSOSp/CXscEOxYNksjWoM9v7t9Ucxc2
 BkvNMRc54mAeY1hd3RXAtU7l0+zTbS0HhrJmmCxA4bBP7ABWH3RnGnsLzAunmiA9/wau
 pO8Rre5q48Ff8z0Ztp8eAt8QSq8wSJ+v3Tk4hjnoJYwcvqC0CEmNPrUplUQDaCnXmy+g
 laOw==
X-Gm-Message-State: ANhLgQ0GOldohZ9J2cbqPQkaYLiDxXbHgUTtcKMSdQKnZCErMs++grWn
 E2hR40B721NXD7ZU/qY9fjSzm2TWvbhtLwnrf7s=
X-Google-Smtp-Source: ADFU+vtJye8xW+n9VCoeqE0xOpGyTc9Q3qOk0ZnFhU0eMORf5tBG0rZftxN1dqcqRiYTuaslunqVrqYQYaS24exoqyQ=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr15754494wrw.124.1585574641716; 
 Mon, 30 Mar 2020 06:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
 <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
 <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
In-Reply-To: <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Mar 2020 09:23:50 -0400
Message-ID: <CADnq5_O6pwxJsYdfJO0xZtmER05GtO+2-4uHTeexKNeHyUq8_Q@mail.gmail.com>
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shane Francis <bigbeeshane@gmail.com>, amd-gfx-request@lists.freedesktop.org,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMzAsIDIwMjAgYXQgNDoxOCBBTSBNYXJlayBTenlwcm93c2tpCjxtLnN6eXBy
b3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gSGkKPgo+IE9uIDIwMjAtMDMtMjcgMTA6MTAs
IE1hcmVrIFN6eXByb3dza2kgd3JvdGU6Cj4gPiBIaSBDaHJpc3RpYW4sCj4gPgo+ID4gT24gMjAy
MC0wMy0yNyAwOToxMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+PiBBbSAyNy4wMy4yMCB1
bSAwODo1NCBzY2hyaWViIE1hcmVrIFN6eXByb3dza2k6Cj4gPj4+IE9uIDIwMjAtMDMtMjUgMTA6
MDcsIFNoYW5lIEZyYW5jaXMgd3JvdGU6Cj4gPj4+PiBBcyBkbWFfbWFwX3NnIGNhbiByZW9yZ2Fu
aXplIHNjYXR0ZXItZ2F0aGVyIGxpc3RzIGluIGEKPiA+Pj4+IHdheSB0aGF0IGNhbiBjYXVzZSBz
b21lIGxhdGVyIHNlZ21lbnRzIHRvIGJlIGVtcHR5IHdlIHNob3VsZAo+ID4+Pj4gYWx3YXlzIHVz
ZSB0aGUgc2dfZG1hX2xlbiBtYWNybyB0byBmZXRjaCB0aGUgYWN0dWFsIGxlbmd0aC4KPiA+Pj4+
Cj4gPj4+PiBUaGlzIGNvdWxkIG5vdyBiZSAwIGFuZCBub3QgbmVlZCB0byBiZSBtYXBwZWQgdG8g
YSBwYWdlIG9yCj4gPj4+PiBhZGRyZXNzIGFycmF5Cj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1i
eTogU2hhbmUgRnJhbmNpcyA8YmlnYmVlc2hhbmVAZ21haWwuY29tPgo+ID4+Pj4gUmV2aWV3ZWQt
Ynk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPgo+ID4+PiBUaGlz
IHBhdGNoIGxhbmRlZCBpbiBsaW51eC1uZXh0IDIwMjAwMzI2IGFuZCBpdCBjYXVzZXMgYSBrZXJu
ZWwKPiA+Pj4gcGFuaWMgb24KPiA+Pj4gdmFyaW91cyBFeHlub3MgU29DIGJhc2VkIGJvYXJkcy4K
PiA+Pj4+IC0tLQo+ID4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMiArLQo+
ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ID4+Pj4gaW5kZXggODZkOWIwZTQ1YzhjLi4xZGUy
Y2RlMjI3N2MgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMK
PiA+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ID4+Pj4gQEAgLTk2Nyw3
ICs5NjcsNyBAQCBpbnQgZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXMoc3RydWN0Cj4g
Pj4+PiBzZ190YWJsZSAqc2d0LCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAo+ID4+Pj4gICAgICAgICAg
IGluZGV4ID0gMDsKPiA+Pj4+ICAgICAgICBmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2csIHNndC0+
bmVudHMsIGNvdW50KSB7Cj4gPj4+PiAtICAgICAgICBsZW4gPSBzZy0+bGVuZ3RoOwo+ID4+Pj4g
KyAgICAgICAgbGVuID0gc2dfZG1hX2xlbihzZyk7Cj4gPj4+PiAgICAgICAgICAgIHBhZ2UgPSBz
Z19wYWdlKHNnKTsKPiA+Pj4+ICAgICAgICAgICAgYWRkciA9IHNnX2RtYV9hZGRyZXNzKHNnKTsK
PiA+Pj4gU29ycnksIGJ1dCB0aGlzIGNvZGUgaXMgd3JvbmcgOigKPiA+Pgo+ID4+IFdlbGwgaXQg
aXMgYXQgbGVhc3QgYmV0dGVyIHRoYW4gYmVmb3JlIGJlY2F1c2UgaXQgbWFrZXMgbW9zdCBkcml2
ZXJzCj4gPj4gd29yayBjb3JyZWN0bHkgYWdhaW4uCj4gPgo+ID4gV2VsbCwgSSdtIG5vdCBzdXJl
IHRoYXQgYSBoYWxmLWJyb2tlbiBmaXggc2hvdWxkIGJlIGNvbnNpZGVyZWQgYXMgYQo+ID4gZml4
IDspCj4gPgo+ID4gQW55d2F5LCBJIGp1c3QgZ290IHRoZSBjb21tZW50IGZyb20gU2hhbmUsIHRo
YXQgbXkgcGF0Y2ggaXMgZml4aW5nIHRoZQo+ID4gaXNzdWVzIHdpdGggYW1kZ3B1IGFuZCByYWRl
b24sIHdoaWxlIHN0aWxsIHdvcmtpbmcgZmluZSBmb3IgZXh5bm9zLCBzbwo+ID4gaXQgaXMgaW5k
ZWVkIGEgcHJvcGVyIGZpeC4KPgo+IFRvZGF5IEkndmUgbm90aWNlZCB0aGF0IHRoaXMgcGF0Y2gg
d2VudCB0byBmaW5hbCB2NS42IHdpdGhvdXQgZXZlbiBhIGRheQo+IG9mIHRlc3RpbmcgaW4gbGlu
dXgtbmV4dCwgc28gdjUuNiBpcyBicm9rZW4gb24gRXh5bm9zIGFuZCBwcm9iYWJseSBhIGZldwo+
IG90aGVyIEFSTSBhcmNocywgd2hpY2ggcmVseSBvbiB0aGUgZHJtX3ByaW1lX3NnX3RvX3BhZ2Vf
YWRkcl9hcnJheXMKPiBmdW5jdGlvbi4KClBsZWFzZSBjb21taXQgeW91ciBwYXRjaCBhbmQgY2Mg
c3RhYmxlLgoKQWxleAoKCj4KPiBCZXN0IHJlZ2FyZHMKPiAtLQo+IE1hcmVrIFN6eXByb3dza2ks
IFBoRAo+IFNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
