Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DC36B85
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 07:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52718926A;
	Thu,  6 Jun 2019 05:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581498926A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 05:25:19 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w79so696583oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 22:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U78VXPux3r76fkTPf2NcR92O7OtIqWfSlpgMdm1/Q7s=;
 b=n2wSsZkD/16jarmKnmvRlKsOb9l5l23e0c2Ypd8i/4KcEPtciw7D58vwvg+wZI8vrJ
 HNxfcJ9j91oSVRVQeZNeel82u3U6E0p0rLKdUovZ94rKFRDbBTlNsofNrq6Re5rs3TtE
 zqVlruYire/Z+0y9cHeDuuW8GS4jK9eo5yzPtiKEUQFV/PqeaAbAe4FXh2di1Ujb+lpk
 HGMFOsztj0Gj2Tlofo2glbdRPoDag71nFAHrXj/F2r0nYKccC3vk8EE6xhZS7e/mWcGk
 4TPL65/67dsKehGF+CxhIf8rfPbIa+Cba3tQaLVleRYkhCSHdGEBAGuB/M3psbdb8CyH
 mUPg==
X-Gm-Message-State: APjAAAXvayTpn5TKhoaVNqLLCBSDtUuSeIAXemunVvBObhSCe3Oj6zjs
 g5/r8oSt37reii3lRzNK0xLQdscI8IQZSfiLcwOSdA==
X-Google-Smtp-Source: APXvYqzIzGfG/FcWYRo/sKS23AMXB4kqmAWOjhNsQKWfRhO5XIAs6LJzLZ06tEJiF0zb5Sb3OJ6X1589v+ZWjf40TTQ=
X-Received: by 2002:aca:6208:: with SMTP id w8mr11312302oib.128.1559798718502; 
 Wed, 05 Jun 2019 22:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190605191157.3134-1-alexander.deucher@amd.com>
 <CAPM=9twLRm41uHjsYn8KG-fsCrG=cdpQ8Jh1VJ1kBcFs2FFWYA@mail.gmail.com>
 <CADnq5_PdnFMjA4RqJgC6jo=Zc__t=z3deNYebbcvngc8UmV39Q@mail.gmail.com>
In-Reply-To: <CADnq5_PdnFMjA4RqJgC6jo=Zc__t=z3deNYebbcvngc8UmV39Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 6 Jun 2019 07:25:06 +0200
Message-ID: <CAKMK7uEQ_HvT1LBrBj2PO92XSUMyh9A3Vtc+NTFAnEmjBGY66w@mail.gmail.com>
Subject: Re: [pull] amdgpu, ttm drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=U78VXPux3r76fkTPf2NcR92O7OtIqWfSlpgMdm1/Q7s=;
 b=Grtd8dvtRUHUMI94BTcidfMzZWPjjzBF24crzxu7/m+dSpk8/yNanrbL2D5usZ+ezf
 9nYm8PrptkPh6ofynXqZBLcDk3UOh4Dg9XbJ4bWXlx1/wGv7KITJxVuNzExZ+9XSIYtE
 s7rwdx3FpjKlK7JG5/MQKpUpx0hjh2bdVL5jw=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA1OjA1IEFNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDUsIDIwMTkgYXQgMTA6MzQgUE0gRGF2
ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDYgSnVu
IDIwMTkgYXQgMDU6MTIsIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gSGkgRGF2ZSwgRGFuaWVsLAo+ID4gPgo+ID4gPiBNb3JlIG5ldyBzdHVm
ZiBmb3IgNS4zOgo+ID4gPgo+ID4gPiBhbWRncHU6Cj4gPiA+IC0gUmV2ZXJ0IHRpbWVsaW5lIHN1
cHBvcnQgdW50aWwgS0hSIGlzIHJlYWR5Cj4gPiA+IC0gVmFyaW91cyBkcml2ZXIgcmVsb2FkIGZp
eGVzCj4gPiA+IC0gUmVmYWN0b3IgY2xvY2sgaGFuZGxpbmcgaW4gREMKPiA+ID4gLSBBdXggZml4
ZXMgZm9yIERDCj4gPiA+IC0gQmFuZHdpZHRoIGNhbGN1bGF0aW9uIHVwZGF0ZXMgZm9yIERDCj4g
PiA+IC0gRml4IGRvY3VtZW50YXRpb24gZHVlIHRvIGZpbGUgcmVuYW1lCj4gPiA+IC0gUkFTIGZp
eAo+ID4gPiAtIEZpeCByYWNlIGluIGxhdGVfaW5pdAo+ID4gPgo+ID4gPiB0dG06Cj4gPiA+IC0g
QWxsb3cgZm9yIGJldHRlciBmb3J3YXJkIHByb2dyZXNzIHdoZW4gdGhlcmUgaXMgaGVhdnkgbWVt
b3J5IGNvbnRlbnRpb24KPiA+Cj4gPiBkaW06IDEzN2E3ZGE5MjU1NyAoIlJldmVydCAiZHJtL2Ft
ZGdwdTogYWRkIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FIHRvCj4gPiBhbWRncHUiIik6IG1hbmRh
dG9yeSByZXZpZXcgbWlzc2luZy4KPiA+IGRpbTogY2YyNWI2NDQ0Mzc2ICgiZ3B1OiBhbWRncHU6
IGZpeCBicm9rZW4gYW1kZ3B1X2RtYV9idWYuYwo+ID4gcmVmZXJlbmNlcyIpOiBTSEExIGluIGZp
eGVzIGxpbmUgbm90IGZvdW5kOgo+ID4gZGltOiAgICAgOTg4MDc2Y2Q4YzVjICgiZHJtL2FtZGdw
dTogcmVuYW1lIGFtZGdwdV9wcmltZS5bY2hdIGludG8KPiA+IGFtZGdwdV9kbWFfYnVmLltjaF0i
KQo+ID4KPiA+IFRoZSBmaXJzdCBJJ20gbm90IHdvcnJpZWQgYWJvdXQsIGJ1dCB0aGUgZml4ZXMg
bGluZSBzaG91bGQgYmUgZml4ZWQKPiA+IGJlZm9yZSBJIGNhbiBwdWxsIHRoaXMuCj4gPiAyZmJk
NmY5NGFjY2RiYjIyM2FjY2NhZGE2ODk0MGI1MGIwYzY2OGQ5IGlzIHRoZSB1cHN0cmVhbSBjb21t
aXQgaW4gbXkgdHJlZS4KPgo+IFdlaXJkLiAgZGltIGRpZG4ndCBjb21wbGFpbiB3aGVuIEkgcmFu
IGl0LiAgSSBndWVzcyB0aGUgb2xkIGNvbW1pdAo+IGhhcHBlbmVkIHRvIGJlIGluIG15IHJlcG8u
ICBJJ2xsIGZpeCBpdCB1cC4KCkkgc2hvdWxkIGNoZWNrIGFsc28gdGhhdCBpdCdzIGFuIGFuY2Vz
dG9yIGNvbW1pdCwgbm90IGp1c3QgdGhhdCBpdCdzCmluIHRoZSByZXBvIChidXQgdGhhdCdzIGEg
ZmV3IGNvbmRpdGlvbnMgbGF0ZXIgb24sIGZvciBEYXZlIGl0Cm9idmlvdXNseSBmYWlsZWQgZWFy
bGllcikuIFNpbmNlIGl0J3MgYSBicmFuY2ggbm90IGEgdGFnIEkgY2FuJ3QgcHVsbAp0aGUgb2xk
IHZlcnNpb24gYW55bW9yZSBhbmQgdGFrZSBhIGxvb2sgYW5kIGZpZ3VyZSBvdXQgd2hhdCBtaWdo
dCBiZQp0aGUgcmVhc29uLCBidXQgdGhpcyBzaG91bGQgaGF2ZSB3b3JrZWQuCi1EYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
