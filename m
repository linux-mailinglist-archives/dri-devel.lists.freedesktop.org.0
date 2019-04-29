Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED8DD47
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6DD89291;
	Mon, 29 Apr 2019 07:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F0F89291
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:58:27 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id a190so14881701ite.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 00:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UeOi90RYK8x7ozYD+9mGxr1il4jAoIstt7bREKCu3cA=;
 b=ks9Uet13TFgJs4lcU6sL+BYAs4b3d6n90+VKMmvMp39fPdqbTySGlOuRK6HMSGtWxf
 JqaOgzSH+8rwKhveenTK4nReL5YIApCFPyt84CBrUbK4og/g8wV2bYIS5637dUYuH/St
 EMxg5RORHbEPbDkTTQiq/ghfQcamVN3nplCIZ6A2cFBCIUl2s7MOb0bhrlEfmB14rdhm
 nUCSpnbUk1ytOoj7TvchdR274BlYxafhmd+uTpgeSzOBK+s4KWyFdAfQzDkmiAmXblPF
 z4Flsd8LidTG1TM8ueHjPapL2zAfbsk9g6EcyblfRNiffeEYae4qlcbLMjSKlElRR2tQ
 tAMQ==
X-Gm-Message-State: APjAAAWFaX7jDgg+mhF1ULpUskjzjPtColJvZthXeHGlUrc8v9R/QAm+
 MSap2H5OzSLu3Ou2OtCG1wtr6JB0pFS/QzVT1wTvcw==
X-Google-Smtp-Source: APXvYqzsp6G7y3NwOVHRY09+SdwkQewuFMAtJSUys7eWw4XEfjH4ln4GMV5tBZs2ifQs0xWG/14owrutG4AoiC3M114=
X-Received: by 2002:a02:a394:: with SMTP id y20mr19482883jak.96.1556524706956; 
 Mon, 29 Apr 2019 00:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190426053324.26443-1-kraxel@redhat.com>
 <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
 <20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
In-Reply-To: <20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 29 Apr 2019 09:58:14 +0200
Message-ID: <CAKMK7uFB8deXDMP9cT634p_dK5LsM37R1v_vGhAEY1ZLZ+WBVA@mail.gmail.com>
Subject: Re: [Spice-devel] [PATCH] Revert "drm/qxl: drop prime import/export
 callbacks"
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UeOi90RYK8x7ozYD+9mGxr1il4jAoIstt7bREKCu3cA=;
 b=D8ZGXuNPj9TpGPOtq1s2SfKPo8/hGGiu/RdCPTwWh9MfYk3OL8KyrOZNnRvCz92Rb2
 d0PMJUqsi8lwo6mK4r6I+8T+rcP2qoGPi52PcZkxlJ3J4OwpJ9igf36ba1TNmUPvpj5b
 QhnTTh0tqGm70lA32HYjSGl8FLFMHP2IhsoxU=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, David Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo1NCBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAwNDoyMTozN1BNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgNzoz
MyBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgZjRjMzRiMWUyYTM3ZDU2NzYxODA5MDFmYTZmZjE4OGJjYjYz
NzFmOC4KPiA+ID4KPiA+ID4gU2ltbGlhciB0byBjb21taXQgYTBjZWNjMjNjZmNiIFJldmVydCAi
ZHJtL3ZpcnRpbzogZHJvcCBwcmltZQo+ID4gPiBpbXBvcnQvZXhwb3J0IGNhbGxiYWNrcyIuICBX
ZSBoYXZlIHRvIGRvIHRoZSBzYW1lIHdpdGggcXhsLAo+ID4gPiBmb3IgdGhlIHNhbWUgcmVhc29u
cyAoaXQgYnJlYWtzIERSSTMpLgo+ID4gPgo+ID4gPiBEcm9wIHRoZSBXQVJOX09OX09OQ0UoKS4K
PiA+ID4KPiA+ID4gRml4ZXM6IGY0YzM0YjFlMmEzN2Q1Njc2MTgwOTAxZmE2ZmYxODhiY2I2Mzcx
ZjgKPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
Cj4gPgo+ID4gTWF5YmUgd2UgbmVlZCBzb21lIGhlbHBlcnMgZm9yIHZpcnR1YWwgZHJpdmVycyB3
aGljaCBvbmx5IGFsbG93Cj4gPiBzZWxmLXJlaW1wb3J0IGFuZCBub3RoaW5nIGVsc2UgYXQgYWxs
Pwo+Cj4gVGhlIGN1cnJlbnQgZ2VtIHByaW1lIGhlbHBlcnMgaGFuZGxlIHRoaXMgcmVhc29uYWJs
ZSB3ZWxsLAo+IEkgZG9uJ3Qgc2VlIGEgbmVlZCBmb3IgdGhhdC4KPgo+IE1vcmUgdXNlZnVsIHdv
dWxkIGJlIHNvbWUgd2F5IHRvIHNpZ25hbCB0aGlzIHNlbGYtcmVpbXBvcnQgY2FwYWJpbGl0eQo+
IHRvIHVzZXJzcGFjZSBzb21laG93LiAgU2VlIERSTV9QUklNRV9DQVBfTE9DQUwgcGF0Y2guCgpV
c2Vyc3BhY2UgaXMgc3VwcG9zZWQgdG8gdGVzdCB3aGV0aGVyIGltcG9ydC9leHBvcnQgd29ya3Mg
Zm9yIGEKc3BlY2lmaWMgY29tYm8sIG5vdCBibGluZGx5IGFzc3VtZSBpdCBkb2VzIGFuZCB0aGVu
IGtlZWwgb3Zlci4gSSB0aGluawp3ZSBuZWVkIHRvIGZpeCB0aGF0LCBub3QgYWRkIG1vcmUgZmxh
Z3MgLSB0aGVyZSdzIGxvdHMgb2YgcmVhc29ucyB3aHkKYSBnaXZlbiBwYWlyIG9mIGRldmljZXMg
Y2FuJ3Qgc2hhcmUgYnVmZmVycyAoZS5nLiBhbGwgdGhlIGNvbnRpZ3VvdXMKYWxsb2NhdGlvbnMg
c3R1ZmYgb24gc29jcykuCgo+IFJpZ2h0IG5vdyBJIGhhdmUgdGhlIGNob2ljZSB0byBzZXQgRFJN
X1BSSU1FX0NBUF97SU1QT1JULEVYUE9SVH0sIGluCj4gd2hpY2ggY2FzZSBzb21lIHVzZXJzcGFj
ZSBhc3N1bWVzIGl0IGNhbiBkbyBjcm9zcy1kcml2ZXIgZXhwb3J0L2ltcG9ydAo+IGFuZCB0cmlw
cyBvdmVyIHRoYXQgbm90IHdvcmtpbmcuICBPciBJIGRvIG5vdCBzZXQKPiBEUk1fUFJJTUVfQ0FQ
X3tJTVBPUlQsRVhQT1JUfSwgd2hpY2ggYnJlYWtzIERSSTMgLi4uCgpZZWFoIHRoYXQncyBub3Qg
YW4gb3B0aW9uLgotRGFuaWVsCgo+ID4gSSB0aGluayB0aGVyZSdzIHF4bCwgdmlyZ2wsCj4KPiBl
eHBvcnQgaXMgaW1wbGVtZW50ZWQgZm9yIHZpcmdsLCBhbmQgaW1wb3J0IHNob3VsZCBiZSBwb3Nz
aWJsZSB0b28uCj4KPiBxeGwvYm9jaHMgaXMgc2ltbGlhciB0byB2bWdmeCwgaXQgY291bGQgYmUg
ZG9uZSBidXQgZG1hLWJ1ZnMgd291bGQKPiBiYXNpY2FsbHkgYmUgYm91bmNlIGJ1ZmZlcnMgKG5l
ZWQgY29weSBmcm9tL3RvIHZyYW0pIHNvIHByb2JhYmx5IG5vdAo+IHdvcnRoIHRoZSBlZmZvcnQu
Cj4KPiBjaGVlcnMsCj4gICBHZXJkCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
