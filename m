Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B5B4622
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 05:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304AC6EAE4;
	Tue, 17 Sep 2019 03:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2DB6EAE3;
 Tue, 17 Sep 2019 03:48:32 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id m22so1092594vsl.9;
 Mon, 16 Sep 2019 20:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7DAZS2BdJJF2W0TDNOaXUgIl2tvekz3Lah7nXTLdCw=;
 b=qFlGDFxcv0dMxG+jsieHGuTOn5qpDMuooJTO8eLI4HjK+DteoEmM+S62IcM3iMg33L
 YyfkisJ35qgtfF7j0OZs3bz2BVa3gCzbcOlFRJ/Le3oeWdsBNdm/o04YvQwlea+OqvQL
 Co04sStwBPM8CY69gf5/PFfd68UWFgcKK99qtElAQ+AjwG2tcjYcxAMfsYA1Jp+OQwcl
 bwUzRBMBqFD5UYlXUNJc1qyGOTS6UYpo9NYoI3bDruPrKtQ0nFlPen2uta3THpNmqrnN
 SyxxzwlxMukkQsiaBb52WdvuSRgCS9jy0UYuNgTTpl17S71yAm6T1N4Ek1CML1bs0P7K
 S5yQ==
X-Gm-Message-State: APjAAAU+hpvE18DA1XTQxW0GoCtOZFunA3PbGx0TgNCaMTk1eS0RCu49
 AVwaQPI2W2NLAfnZJEumBbuk5qDcJrhwKSsHUok=
X-Google-Smtp-Source: APXvYqzzVvSsfVhW7t57VAgp1DN/5+tMKT6HjwrUO2P/Pcezba6qs6Gphi6fpBIo9rwXX/k48R7y7hJpzsbG2rc5wOY=
X-Received: by 2002:a67:e894:: with SMTP id x20mr692198vsn.76.1568692111124;
 Mon, 16 Sep 2019 20:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-3-thierry.reding@gmail.com>
In-Reply-To: <20190916151757.10953-3-thierry.reding@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 17 Sep 2019 13:48:20 +1000
Message-ID: <CACAvsv5VKMW8fuMEj=XYAezpKVVxqem-MvKFOwDMMh2dqjFRLA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 2/6] drm/nouveau: fault: Widen engine field
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=q7DAZS2BdJJF2W0TDNOaXUgIl2tvekz3Lah7nXTLdCw=;
 b=W3H+c/GkbO5ZRYnkp1sZ8Uz91Ibp5jJ7+AtXBGZH1cCDMl8ZVAHy6Gd6nW7K8/h6hA
 yo1lyMCbK5Ifti/mYV/A7mkNRvbo44OitFO0xLVwCdEzTDyyasQhMRnaXBD3qKKzOCLE
 EIBOp25GA2m0RcGZ+oruSsSmcLdDxASijUpiLVJnyKB/i0M4PZOSXwXs7HacNbmwqQ5s
 a2rTn1aoEocsgSnKJlswBZgECm6iFfIa2VOkQPnJm+QD3I8oZHE8iRfLr+e07Oqt3RJx
 QRshEmh521YgJQBASrVVR92MFRZ87ZsyAVfO3mbo21qMuWHXArJT9JhVkF+WIZENRsRK
 IcBA==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBTZXAgMjAxOSBhdCAwMToxOCwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVk
aW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgo+Cj4gVGhlIGVuZ2luZSBmaWVsZCBpbiB0aGUgRklGTyBmYXVsdCBpbmZvcm1h
dGlvbiByZWdpc3RlcnMgaXMgYWN0dWFsbHkgOQo+IGJpdHMgd2lkZS4KTG9va3MgbGlrZSB0aGlz
IGlzIHRydWUgZm9yIGZhdWx0IGJ1ZmZlciBwYXJzaW5nIHRvby4KCj4KPiBTaWduZWQtb2ZmLWJ5
OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9ndjEwMC5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9ndjEwMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvZ3YxMDAuYwo+IGluZGV4IGI1ZTMy
Mjk1MjM3Yi4uMjgzMDZjNWY2NjUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2ZhdWx0L2d2MTAwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9mYXVsdC9ndjEwMC5jCj4gQEAgLTEzNyw4ICsxMzcsOCBAQCBndjEw
MF9mYXVsdF9pbnRyX2ZhdWx0KHN0cnVjdCBudmttX2ZhdWx0ICpmYXVsdCkKPiAgICAgICAgIGlu
Zm8uYWRkciA9ICgodTY0KWFkZHJoaSA8PCAzMikgfCBhZGRybG87Cj4gICAgICAgICBpbmZvLmlu
c3QgPSAoKHU2NClpbnN0aGkgPDwgMzIpIHwgKGluZm8wICYgMHhmZmZmZjAwMCk7Cj4gICAgICAg
ICBpbmZvLnRpbWUgPSAwOwo+IC0gICAgICAgaW5mby5lbmdpbmUgPSAoaW5mbzAgJiAweDAwMDAw
MGZmKTsKPiAgICAgICAgIGluZm8uYXBlcnR1cmUgPSAoaW5mbzAgJiAweDAwMDAwYzAwKSA+PiAx
MDsKPiArICAgICAgIGluZm8uZW5naW5lID0gKGluZm8wICYgMHgwMDAwMDFmZik7Cj4gICAgICAg
ICBpbmZvLnZhbGlkICA9IChpbmZvMSAmIDB4ODAwMDAwMDApID4+IDMxOwo+ICAgICAgICAgaW5m
by5ncGMgICAgPSAoaW5mbzEgJiAweDFmMDAwMDAwKSA+PiAyNDsKPiAgICAgICAgIGluZm8uaHVi
ICAgID0gKGluZm8xICYgMHgwMDEwMDAwMCkgPj4gMjA7Cj4gLS0KPiAyLjIzLjAKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWls
aW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
