Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438A1E9032
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBCB6E9D4;
	Sat, 30 May 2020 09:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600089F0B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 12:36:05 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id d5so2089445ios.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=etVz/z0FCCoXbxju8q2TMA+/hX1IuOuxlidkT33un9k=;
 b=avs33Dos29eqzbPIer4J7wfZqsXbXJva2SA8UzJI1OPCLjhXDEF+vGOny7agxhbwYO
 s5/+6KT/fdOq1Jaz7WTDoY9Vd8aL/eFK2+tvY2z0jkKIPySamRpSBbAd0sC5NEF9ARdC
 30Nr2t6tUpO74p0iDBKDDi6/rMjHJlc7usNPdP/hNT7waZZcj6fBnMYHq5QjCXqpOUZH
 s8GeT7vOJ5RGX1jn2IrOD07VI/bmt+cINSjtganGhMbFGa6TqkF2loE/p/he9jTa16hZ
 4+d0UVw7kOrnvLn9pQ3E13QwUukFZpCC5QPj3D3BLL3er15yu63h/0pTgqzBxFR0eX5H
 imEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=etVz/z0FCCoXbxju8q2TMA+/hX1IuOuxlidkT33un9k=;
 b=SkQf7jxXDcds3OKe7TLNYYroz00DT5d1eIDbCWulH9oohn/5THpOJ17ZHN1MGIW62a
 l7/NEp3QZO5e+QrJ9S/cOtFaGbOWEU+6BEmJ63dlqx/jJjW+U0uhV88zTBXbi3pf8VSq
 wEycwX7DLvxqtLbWe1yqKKaQzqZspxZCLjetYcf/Wpbeudxa2MwB9BiUy7usjysMQO6p
 bJk4+J6B1NDnY/R+a2OtKxGhmVmdWZDJHhlUXUDzeIIPnZhs4b8B4Gfp+ojla8YJAYdF
 L7kfqvZgIloKaQa/Yk/6y/uZfVxaA4rCEm00SVW0ByxH3hBAGCAN8i5NaM00zUvebPlM
 Z/Pg==
X-Gm-Message-State: AOAM533PtbYpsHECk7VneDvtB4yG6FixcX/FKpiwn81sWyAv5x8X0fjf
 clY130cNZ/T49/z8CcqwQdoP9gjjs92KZwA/9T8=
X-Google-Smtp-Source: ABdhPJxps5J+f5BjuG4lwLto/KMwaQ3VLsBSceOKC0vF6QwNUWHy+oJPaIsh6dbGT8NiJkG55XKwhA4wiqbLtxWWLhY=
X-Received: by 2002:a6b:1543:: with SMTP id 64mr6493948iov.123.1590755765005; 
 Fri, 29 May 2020 05:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-12-peron.clem@gmail.com>
 <8bc659b4-dbf9-5ae6-a677-937cab6bd798@arm.com>
In-Reply-To: <8bc659b4-dbf9-5ae6-a677-937cab6bd798@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 29 May 2020 14:35:54 +0200
Message-ID: <CAJiuCce2vb+M5Dn7FSr=N2WfrAEQrUjLPuShqFyPFxwfrdDqaA@mail.gmail.com>
Subject: Re: [PATCH 11/15] drm/panfrost: set devfreq clock name
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmVuLAoKT24gVGh1LCAyOCBNYXkgMjAyMCBhdCAxNToyMywgU3RldmVuIFByaWNlIDxz
dGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMC8wNS8yMDIwIDE3OjU1LCBDbMOp
bWVudCBQw6lyb24gd3JvdGU6Cj4gPiBTb21lIFNvQ3MgaGF2ZSAgc2V2ZXJhbCBjbG9ja3MgZGVm
aW5lZCBhbmQgdGhlIE9QUCBjb3JlCj4gPiBuZWVkcyB0byBrbm93IHRoZSBleGFjdCBuYW1lIG9m
IHRoZSBjbGsgdG8gdXNlLgo+ID4KPiA+IFNldCB0aGUgY2xvY2sgbmFtZSB0byAiY29yZSIuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNv
bT4KPgo+IFRoaXMgaXMgdW5mb3J0dW5hdGVseSBhIHJlZ3Jlc3Npb24gZm9yIHRoZSBSSzMyODgu
IFRoZSBkZXZpY2UgdHJlZQo+IGJpbmRpbmcgZG9lc24ndCByZXF1aXJlICJjbG9jay1uYW1lcyIs
IGFuZCBmb3IgdGhlIFJLMzI4OCBpdCBjdXJyZW50bHkKPiBpc24ndCBzcGVjaWZpZWQuIFNvIHRo
aXMgYnJlYWtzIHRoZSBwbGF0Zm9ybS4KPgo+IEFkZGluZyB0aGUgImNsb2NrLW5hbWVzIiB0byB0
aGUgZGV2aWNlIHRyZWUgJ2ZpeGVzJyBpdCwgYnV0IHdlIHJlYWxseQo+IG5lZWQgdG8ga2VlcCBi
YWNrd2FyZHMgY29tcGF0aWJpbGl0eS4KClllcyB5b3UncmUgcmlnaHQsIHRoYW5rcyBmb3IgY2F0
aGluZyB0aGlzLgoKUmVnYXJkcywKQ2xlbWVudAoKPgo+IFN0ZXZlCj4KPiA+IC0tLQo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMTMgKysrKysrKysr
KysrKwo+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oIHwg
IDEgKwo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiA+IGluZGV4IDlmZmVh
MGQ0YTA4Ny4uNmJmMzU0MWI0ZDUzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ID4gQEAgLTEwMyw2ICsxMDMsMTQgQEAgaW50IHBhbmZy
b3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiA+Cj4gPiAg
ICAgICBzcGluX2xvY2tfaW5pdCgmcGZkZXZmcmVxLT5sb2NrKTsKPiA+Cj4gPiArICAgICBvcHBf
dGFibGUgPSBkZXZfcG1fb3BwX3NldF9jbGtuYW1lKGRldiwgImNvcmUiKTsKPiA+ICsgICAgIGlm
IChJU19FUlIob3BwX3RhYmxlKSkgewo+ID4gKyAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKG9w
cF90YWJsZSk7Cj4gPiArICAgICAgICAgICAgIGdvdG8gZXJyX2Zpbmk7Cj4gPiArICAgICB9Cj4g
PiArCj4gPiArICAgICBwZmRldmZyZXEtPmNsa25hbWVfb3BwX3RhYmxlID0gb3BwX3RhYmxlOwo+
ID4gKwo+ID4gICAgICAgb3BwX3RhYmxlID0gZGV2X3BtX29wcF9zZXRfcmVndWxhdG9ycyhkZXYs
IHBmZGV2LT5jb21wLT5zdXBwbHlfbmFtZXMsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBmZGV2LT5jb21wLT5udW1fc3VwcGxpZXMpOwo+ID4gICAgICAg
aWYgKElTX0VSUihvcHBfdGFibGUpKSB7Cj4gPiBAQCAtMTc2LDYgKzE4NCwxMSBAQCB2b2lkIHBh
bmZyb3N0X2RldmZyZXFfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiA+ICAg
ICAgICAgICAgICAgZGV2X3BtX29wcF9wdXRfcmVndWxhdG9ycyhwZmRldmZyZXEtPnJlZ3VsYXRv
cnNfb3BwX3RhYmxlKTsKPiA+ICAgICAgICAgICAgICAgcGZkZXZmcmVxLT5yZWd1bGF0b3JzX29w
cF90YWJsZSA9IE5VTEw7Cj4gPiAgICAgICB9Cj4gPiArCj4gPiArICAgICBpZiAocGZkZXZmcmVx
LT5jbGtuYW1lX29wcF90YWJsZSkgewo+ID4gKyAgICAgICAgICAgICBkZXZfcG1fb3BwX3B1dF9j
bGtuYW1lKHBmZGV2ZnJlcS0+Y2xrbmFtZV9vcHBfdGFibGUpOwo+ID4gKyAgICAgICAgICAgICBw
ZmRldmZyZXEtPmNsa25hbWVfb3BwX3RhYmxlID0gTlVMTDsKPiA+ICsgICAgIH0KPiA+ICAgfQo+
ID4KPiA+ICAgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3VtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2
aWNlICpwZmRldikKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2ZnJlcS5oIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZy
ZXEuaAo+ID4gaW5kZXggMzQ3Y2RlNDc4NmNmLi4xZjI0NzVlMWQwMzQgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCj4gPiBAQCAtMTYsNiAr
MTYsNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlOwo+ID4gICBzdHJ1Y3QgcGFuZnJvc3RfZGV2
ZnJlcSB7Cj4gPiAgICAgICBzdHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJlcTsKPiA+ICAgICAgIHN0cnVj
dCBvcHBfdGFibGUgKnJlZ3VsYXRvcnNfb3BwX3RhYmxlOwo+ID4gKyAgICAgc3RydWN0IG9wcF90
YWJsZSAqY2xrbmFtZV9vcHBfdGFibGU7Cj4gPiAgICAgICBzdHJ1Y3QgdGhlcm1hbF9jb29saW5n
X2RldmljZSAqY29vbGluZzsKPiA+ICAgICAgIGJvb2wgb3BwX29mX3RhYmxlX2FkZGVkOwo+ID4K
PiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
