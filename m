Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA2F19EB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 16:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889F46EDA4;
	Wed,  6 Nov 2019 15:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C656EDA4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:23:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q2so20020902ljg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 07:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7u4DJelTiLo3xdFi3FzOMpoZhJ7TQZl0WcryvK6J9QA=;
 b=YZyUg9hPKoqRrowezNBiQzeCbzGbiz/6jf6eMpoun2DzCXR3VNCrCouW31qUigXjDe
 clInq406a7FwA4DgsjrdC2cTnbbI1XSjwGp2PZJGX9jc0AzO4YvykUjfMwtVQlD0U6ke
 PKP/KYSHut18EVmj07LS8dFG4o8Km/PIZ8130wnHD0DjOmEZiq4ZGH/KLpIlvZ9/1wCt
 FiBfOL3D4IesXRqKfIwImvp88sellJmbtDonDlslHvB3M+EnnwUtzNV05GN/unEha8kJ
 BfVq+ost6MrvoiH8/veaRVz2LbAjZ0S4qpGNJmzxJvXfQOCMx9pKLajeVNnPoNQKEtRB
 uH9w==
X-Gm-Message-State: APjAAAXVmCDHCFCBJ02sJG3a/wBmgp3sJqG8KA8h2Y5qrNZwg27w1voW
 3O9UeeQDdMZF++LHI7sV1+IIurXKlCNeORa7nfk=
X-Google-Smtp-Source: APXvYqyrq0kT7d6RQ0yg6I9REVRZIMZLgthEOIGQLGqNlD36KJ255nhNn3PAxsNUoFt5oULhzVOjMIgenQ1hD6OFvFs=
X-Received: by 2002:a2e:9119:: with SMTP id m25mr2475827ljg.24.1573053798616; 
 Wed, 06 Nov 2019 07:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20191106094400.445834-1-paul.kocialkowski@bootlin.com>
 <20191106094400.445834-2-paul.kocialkowski@bootlin.com>
In-Reply-To: <20191106094400.445834-2-paul.kocialkowski@bootlin.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 6 Nov 2019 16:23:07 +0100
Message-ID: <CAMeQTsa+tYWAA5vkChqDvEiFmbjFzNp804fD6J4GfLgHUBho9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/gma500: Add missing call to allow enabling vblank
 on psb/cdv
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7u4DJelTiLo3xdFi3FzOMpoZhJ7TQZl0WcryvK6J9QA=;
 b=KIWeJBPuhJIAD/GVcGzaGJS+QMkD9/lwi4OA2yEfei4X0kyOd5lkP6owSnmSOlcb//
 hLiDIFY0rOjg6HKi9gqv4i1mNoKNrb8dBXvtBzMZA2i7MMx6PVrbXJ0p+KWjODCSomic
 bkrTkwl9f0CSJRIsIoaXrE0P48aC0jNJKUO9y8oNVlCuHz+wL+pYw5ENACAl3LT1CmyA
 VqI3z37xPuxXCaqWr+z6hv1kenP8OzDUoTEp/y8fcuyX6NX1UZteVbKNqiX5JphUkzzH
 D4FkVVAkZ8n3gw5zy6QzuIBJbHGIFIXKSAbb+v8OMzsIs0+xLlVs6Mfmf5X/T21AURe/
 TBXw==
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCAxMDo0NCBBTSBQYXVsIEtvY2lhbGtvd3NraQo8cGF1bC5r
b2NpYWxrb3dza2lAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIGEgbWlzc2luZyBj
YWxsIHRvIGRybV9jcnRjX3ZibGFua19vbiB0byB0aGUgY29tbW9uIERQTVMgaGVscGVyCj4gKHVz
ZWQgYnkgcG91bHNibyBhbmQgY2VkYXJ0cmFpbCksIHdoaWNoIGlzIGNhbGxlZCBpbiB0aGUgQ1JU
QyBlbmFibGUgcGF0aC4KPgo+IFdpdGggdGhhdCBjYWxsLCBpdCBiZWNvbWVzIHBvc3NpYmxlIHRv
IGVuYWJsZSB2Ymxhbmsgd2hlbiBuZWVkZWQuCj4gSXQgaXMgYWxyZWFkeSBiYWxhbmNlZCBieSBh
IGRybV9jcnRjX3ZibGFua19vZmYgY2FsbCBpbiB0aGUgaGVscGVyLgo+Cj4gT3RoZXIgcGxhdGZv
cm1zIChvYWt0cmFpbCBhbmQgbWVkZmllbGQpIHVzZSBhIGRlZGljYXRlZCBEUE1TIGhlbHBlciB0
aGF0Cj4gZG9lcyBub3QgaGF2ZSB0aGUgcHJvcGVyIHZibGFuayBvbi9vZmYgaG9va3MuIFRoZXkg
YXJlIG5vdCBhZGRlZCBpbiB0aGlzCj4gY29tbWl0IGR1ZSB0byBsYWNrIG9mIGhhcmR3YXJlIHRv
IHRlc3QgaXQgd2l0aC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVs
LmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KCkRvbid0IHRoaW5rIHdlIGV2ZXIgZm91bmQgYSBu
ZWVkIGZvciBoYXZpbmcgdmJsYW5rcyBlbmFibGVkLi4uIHVudGlsCm5vdy4gSSdsbCBoYXZlIGEg
bG9vayBpZiBzb21ldGhpbmcgY2FuIGJlIGRvbmUgZm9yIE9ha3RyYWlsIHNpbmNlIEkKaGF2ZSBo
dy4KClJldmlld2VkLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21h
aWwuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jIHwg
MiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9nbWFfZGlzcGxheS5jCj4gaW5kZXggZTIwY2NiNWQxMGZkLi5iYzA3YWUyYTlhMWQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jCj4gQEAgLTI1NSw2ICsyNTUsOCBA
QCB2b2lkIGdtYV9jcnRjX2RwbXMoc3RydWN0IGRybV9jcnRjICpjcnRjLCBpbnQgbW9kZSkKPiAg
ICAgICAgICAgICAgICAgLyogR2l2ZSB0aGUgb3ZlcmxheSBzY2FsZXIgYSBjaGFuY2UgdG8gZW5h
YmxlCj4gICAgICAgICAgICAgICAgICAqIGlmIGl0J3Mgb24gdGhpcyBwaXBlICovCj4gICAgICAg
ICAgICAgICAgIC8qIHBzYl9pbnRlbF9jcnRjX2RwbXNfdmlkZW8oY3J0YywgdHJ1ZSk7IFRPRE8g
Ki8KPiArCj4gKyAgICAgICAgICAgICAgIGRybV9jcnRjX3ZibGFua19vbihjcnRjKTsKPiAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIERSTV9NT0RFX0RQTVNfT0ZGOgo+ICAg
ICAgICAgICAgICAgICBpZiAoIWdtYV9jcnRjLT5hY3RpdmUpCj4gLS0KPiAyLjIzLjAKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
