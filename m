Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED77ABC1F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 17:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3048910B;
	Fri,  6 Sep 2019 15:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F598910B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 15:19:46 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a127so5255522oii.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 08:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0uxQfXAvY3OM2K+j6EzEou6jodSEblNjaWkWic4+6Pc=;
 b=tOqBFM86K5bjR/4cBZ8sGjEyY6n0S2L63mpiNfx9YrOfu7BVqD5dHHmNkTnLyCJOuk
 QNhRqSptrQJbesy7MGw9hvxdswbo8HQ7WmFyrHeeexC8UOiflr+nZqrrXihC93SG54MY
 B5VTS3EZX0rRyRybNA+P9Kxk4u5dABTXYmegWznW/oZlpclpHIEg+93TdsEbdb7D9bCH
 QSwCeQsMU8JwbxsWTM5mqIF2WO8gV8Z1Syy20MQfyNZUZ+qpOgVkxHv25U+BCcIt0I1P
 B5Pz/y6b2TkJfF0zN4REyauNOS45i6umk/UThLAOcQiNNmzZrn47Nnfm6ghm/sbaAIIO
 dsDA==
X-Gm-Message-State: APjAAAX473BRkcQDyTJJLYxYxsknUEGs7XX0P8K8woFQJ3bdEdKPtXkC
 txU3G/Ahm8lIAlporOuz9iJjOOMENlZBBAv5nGJu8gZtsjc=
X-Google-Smtp-Source: APXvYqypWH7tQj+dtneyDit+oZ4NCqNylhgUKSt7Ty6Skh1PKkf6xu0PrS2KWwJp3UG9ahzA9Jldi6nywbiTgmnJ5cI=
X-Received: by 2002:aca:f20a:: with SMTP id q10mr7643754oih.128.1567783185261; 
 Fri, 06 Sep 2019 08:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190906144459.16025-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190906144459.16025-1-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 6 Sep 2019 17:19:34 +0200
Message-ID: <CAKMK7uEFv+8Qx9+Gs8a=GmN+LEgaxF1zbvw_42-soM8z1AeK1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/blend: Define the direction of Z position values
To: DRI Development <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0uxQfXAvY3OM2K+j6EzEou6jodSEblNjaWkWic4+6Pc=;
 b=Ur3MdR3ie+EElPSeY1+IaA8Q8Qk+6rumSfMXOl0CQZMflM1cj7dWzxvJx2M+8oO4QE
 mTag4N0FWSQnDORyzfvD606n6Fy6O217jZVy2xPu0x4w8QeSsLpcDBgFBDoKx25M7JCk
 FTTjpNprmdZPSWzQExNAKN/PeQ2x2N+zaUyDQ=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCA0OjQ1IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gV2UgZm9yZ290IHRoYXQuCj4KPiBQcm9vZiBpcyB0aGUg
b25lIGlndCB0ZXN0Y2FzZSB3ZSBoYXZlOgo+Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9pZ3QtZ3B1LXRvb2xzL2Jsb2IvbWFzdGVyL3Rlc3RzL2ttc19hdG9taWMuYyNMMjgw
Cj4KPiBXaGlsZSBhdCBpdCBhbHNvIGRvY3VtZW50IHRoYXQgd2UgaGF2ZSBpbW11dGFibGUgenBv
cyBwcm9wZXJ0aWVzIGluCj4gc29tZSBjYXNlcy4KPgo+IFJlcG9ydGVkLWJ5OiBQZWtrYSBQYWFs
YW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbT4KPiBDYzogUGVra2EgUGFhbGFuZW4g
PHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBla2thIFBhYWxh
bmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEuY29tPgo+IENjOiBJbGlhIE1pcmtpbiA8aW1p
cmtpbkBhbHVtLm1pdC5lZHU+Cj4gQWNrZWQtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0u
bWl0LmVkdT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KCkZyb20gaXJjOiBSZXZpZXdlZC1ieTogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNv
bGxhYm9yYS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMgfCA3ICsr
KysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYmxlbmQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYmxlbmQuYwo+IGluZGV4IDM3YWMxNjhmY2I2MC4uZDAyNzA5ZGQyZDRhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYmxlbmQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYmxlbmQuYwo+IEBAIC0xMzAsNyArMTMwLDEyIEBACj4gICAqICAgICBaIHBvc2l0
aW9uIGlzIHNldCB1cCB3aXRoIGRybV9wbGFuZV9jcmVhdGVfenBvc19pbW11dGFibGVfcHJvcGVy
dHkoKSBhbmQKPiAgICogICAgIGRybV9wbGFuZV9jcmVhdGVfenBvc19wcm9wZXJ0eSgpLiBJdCBj
b250cm9scyB0aGUgdmlzaWJpbGl0eSBvZiBvdmVybGFwcGluZwo+ICAgKiAgICAgcGxhbmVzLiBX
aXRob3V0IHRoaXMgcHJvcGVydHkgdGhlIHByaW1hcnkgcGxhbmUgaXMgYWx3YXlzIGJlbG93IHRo
ZSBjdXJzb3IKPiAtICogICAgIHBsYW5lLCBhbmQgb3JkZXJpbmcgYmV0d2VlbiBhbGwgb3RoZXIg
cGxhbmVzIGlzIHVuZGVmaW5lZC4KPiArICogICAgIHBsYW5lLCBhbmQgb3JkZXJpbmcgYmV0d2Vl
biBhbGwgb3RoZXIgcGxhbmVzIGlzIHVuZGVmaW5lZC4gVGhlIHBvc2l0aXZlCj4gKyAqICAgICBa
IGF4aXMgcG9pbnRzIHRvd2FyZHMgdGhlIHVzZXIsIGkuZS4gcGxhbmVzIHdpdGggbG93ZXIgWiBw
b3NpdGlvbiB2YWx1ZXMKPiArICogICAgIGFyZSB1bmRlcm5lYXRoIHBsYW5lcyB3aXRoIGhpZ2hl
ciBaIHBvc2l0aW9uIHZhbHVlcy4gTm90ZSB0aGF0IHRoZSBaCj4gKyAqICAgICBwb3NpdGlvbiB2
YWx1ZSBjYW4gYWxzbyBiZSBpbW11dGFibGUsIHRvIGluZm9ybSB1c2Vyc3BhY2UgYWJvdXQgdGhl
Cj4gKyAqICAgICBoYXJkLWNvZGVkIHN0YWNraW5nIG9mIG92ZXJsYXkgcGxhbmVzLCBzZWUKPiAr
ICogICAgIGRybV9wbGFuZV9jcmVhdGVfenBvc19pbW11dGFibGVfcHJvcGVydHkoKS4KPiAgICoK
PiAgICogcGl4ZWwgYmxlbmQgbW9kZToKPiAgICogICAgIFBpeGVsIGJsZW5kIG1vZGUgaXMgc2V0
IHVwIHdpdGggZHJtX3BsYW5lX2NyZWF0ZV9ibGVuZF9tb2RlX3Byb3BlcnR5KCkuCj4gLS0KPiAy
LjIzLjAKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
