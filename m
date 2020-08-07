Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8002402B8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBCE89E39;
	Mon, 10 Aug 2020 07:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2906EA1B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:28:55 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id e16so2231383ilc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=urdx1lDCi4hW3gy7vsIQcFrWIUTqXkOIttnIizLyY9k=;
 b=WNCCYGsxW+ASrgZsReTjZV3s5rXlvNA3Kpznvja+rCIXZ8VCC2tr9oR4i699RPBU5t
 5b7ovu6DHwYQNjxMYVE+H7Z2ML4J/Pidk0JiaM3MGG2eooJhi2rWXPE2yRLzztz3Y+iq
 ZOCHoGhJz3NJXm3p869Us2AANUjhaoBjjzPpfvpYdq3zzZdPm/fmEy7eeeeqqjQ7+uqr
 wrhssM4iknq4oQnoi8AldXTc4+/UYlZnhIui9u6UUcLP+adYQ9PLzM2Y01VMRUJ9CF8M
 +7OQamtZo1QPKUwT5yRtBT4mb0GrQ/MXh/zPyvmNl9/izQJlJSYecwuffUoIJ2IEFaf5
 3obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=urdx1lDCi4hW3gy7vsIQcFrWIUTqXkOIttnIizLyY9k=;
 b=Lmg21qRjjioe7ovnB/JM3kn74wq1Hg8H7pgROF0Lgn+ll0vSiX+bxiynM8Qkp05x6U
 n9qJaHEygKPGouXHZtbv7Um4/kUThN9aZSHCqlddDNfGwMrHdFOIWqSTfgawq6OGxCwt
 F9OetoBjRrqbCajEv/9G/TPU8w8ZBz1Txm6fAtwobDKqBRtPq+6tKJKM3B8ii7ogXsdg
 wo9VnvhCUe5CLcEuUepFtv9hSN1FmZi5o1yaXsiB1k7YIqyqBnVjXF5u4CzH3DJg7Qav
 V2ohQh+fnm1c3x00J1DYF6z1akkwUnNukTYcTnaxC+mQxrB26oNN/pMLxKjEzrltGYih
 qXjA==
X-Gm-Message-State: AOAM5302bYZlw1UPiy06P6um+y43y+SJoO4VgdX0h78nNWP2u+vDN9Tz
 Jeokkb2h9amb8oegL2cnzWtIvH6hfZpHRN9Sri1KSMkk
X-Google-Smtp-Source: ABdhPJxsGc96PuX6gvseLk4/WW2Y/uZlIj/qKox35x1oE+cutdGb8+/VdEsU5lXA9pCRco3q4fhnDA+zOdcLCA3S2zs=
X-Received: by 2002:a05:6e02:5a7:: with SMTP id
 k7mr5167981ils.293.1596817734496; 
 Fri, 07 Aug 2020 09:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200710095409.407087-1-peron.clem@gmail.com>
 <CAL_JsqLnOGVbO5T92dyzt3K-v4BRNt72yMpYR_wW-z8dpdVSvA@mail.gmail.com>
In-Reply-To: <CAL_JsqLnOGVbO5T92dyzt3K-v4BRNt72yMpYR_wW-z8dpdVSvA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 7 Aug 2020 18:28:43 +0200
Message-ID: <CAJiuCcfezzr7w9=-G6WK0p6YS=6SBAKF8jv=yAOyNFJ59X80qw@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] Add regulator devfreq support to Panfrost
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gRnJpLCA3IEF1ZyAyMDIwIGF0IDE4OjEzLCBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDEwLCAyMDIwIGF0IDM6NTQgQU0gQ2zD
qW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4g
Pgo+ID4gVGhpcyBzZXJpZSBjbGVhbnMgYW5kIGFkZHMgcmVndWxhdG9yIHN1cHBvcnQgdG8gUGFu
ZnJvc3QgZGV2ZnJlcS4KPiA+IFRoaXMgaXMgbW9zdGx5IGJhc2VkIG9uIGNvbW1lbnQgZm9yIHRo
ZSBmcmVzaGx5IGludHJvZHVjZWQgbGltYQo+ID4gZGV2ZnJlcS4KPiA+Cj4gPiBXZSBuZWVkIHRv
IGFkZCByZWd1bGF0b3Igc3VwcG9ydCBiZWNhdXNlIG9uIEFsbHdpbm5lciB0aGUgR1BVIE9QUAo+
ID4gdGFibGUgZGVmaW5lcyBib3RoIGZyZXF1ZW5jaWVzIGFuZCB2b2x0YWdlcy4KPiA+Cj4gPiBG
aXJzdCBwYXRjaGVzIFswMS0wN10gc2hvdWxkIG5vdCBjaGFuZ2UgdGhlIGFjdHVhbCBiZWhhdmlv
cgo+ID4gYW5kIGludHJvZHVjZSBhIHByb3BlciBwYW5mcm9zdF9kZXZmcmVxIHN0cnVjdC4KPiA+
Cj4gPiBSZWdhcmRzLAo+ID4gQ2zDqW1lbnQKPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+ID4g
IC0gRml4IG1pc3NlZCBhIHBmZGV2IHRvICZwZmRldi0+ZGV2ZnJlcSBkdXJpbmcgcmViYXNlCj4g
Pgo+ID4gQ2hhbmdlcyBzaW5jZSB2MzoKPiA+ICAtIENvbGxlY3QgU3RldmVuIFByaWNlIHJldmll
d2VkLWJ5IHRhZ3MKPiA+ICAtIFJlYmFzZSBvbiBuZXh0L21hc3RlciAobmV4dC0yMDIwMDcwOSkK
PiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ID4gIC0gQ29sbGVjdCBBbHlzc2EgUm9zZW56d2Vp
ZyByZXZpZXdlZC1ieSB0YWdzCj4gPiAgLSBGaXggb3BwX3NldF9yZWd1bGF0b3IgYmVmb3JlIGFk
ZGluZyBvcHBfdGFibGUgKGludHJvZHVjZSBpbiB2MikKPiA+ICAtIENhbGwgZXJyX2ZpbmkgaW4g
Y2FzZSBvcHBfYWRkX3RhYmxlIGZhaWxlZAo+ID4KPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiAg
LSBDb2xsZWN0IFN0ZXZlbiBQcmljZSByZXZpZXdlZC1ieSB0YWdzCj4gPiAgLSBGaXggc3Bpbmxv
Y2sgY29tbWVudAo+ID4gIC0gRHJvcCBPUFAgY2xvY2stbmFtZSBwYXRjaAo+ID4gIC0gRHJvcCBk
ZXZpY2VfcHJvcGVydHlfdGVzdCBwYXRjaAo+ID4gIC0gQWRkIHJlbmFtZSBlcnJvciBsYWJlbHMg
cGF0Y2gKPiA+Cj4gPiBDbMOpbWVudCBQw6lyb24gKDE0KToKPiA+ICAgZHJtL3BhbmZyb3N0OiBh
dm9pZCBzdGF0aWMgZGVjbGFyYXRpb24KPiA+ICAgZHJtL3BhbmZyb3N0OiBjbGVhbiBoZWFkZXJz
IGluIGRldmZyZXEKPiA+ICAgZHJtL3BhbmZyb3N0OiBkb24ndCB1c2UgcGZkZXZmcmVxLmJ1c3lf
Y291bnQgdG8ga25vdyBpZiBodyBpcyBpZGxlCj4gPiAgIGRybS9wYW5mcm9zdDogaW50cm9kdWNl
IHBhbmZyb3N0X2RldmZyZXEgc3RydWN0Cj4gPiAgIGRybS9wYW5mcm9zdDogdXNlIHNwaW5sb2Nr
IGluc3RlYWQgb2YgYXRvbWljCj4gPiAgIGRybS9wYW5mcm9zdDogcHJvcGVybHkgaGFuZGxlIGVy
cm9yIGluIHByb2JlCj4gPiAgIGRybS9wYW5mcm9zdDogcmVuYW1lIGVycm9yIGxhYmVscyBpbiBk
ZXZpY2VfaW5pdAo+ID4gICBkcm0vcGFuZnJvc3Q6IG1vdmUgZGV2ZnJlcV9pbml0KCkvZmluaSgp
IGluIGRldmljZQo+ID4gICBkcm0vcGFuZnJvc3Q6IGR5bmFtaWNhbGx5IGFsbG9jIHJlZ3VsYXRv
cnMKPiA+ICAgZHJtL3BhbmZyb3N0OiBhZGQgcmVndWxhdG9ycyB0byBkZXZmcmVxCj4gPiAgIGFy
bTY0OiBkZWZjb25maWc6IEVuYWJsZSBkZXZmcmVxIGNvb2xpbmcgZGV2aWNlCj4gPiAgIGFybTY0
OiBkdHM6IGFsbHdpbm5lcjogaDY6IEFkZCBjb29saW5nIG1hcCBmb3IgR1BVCj4gPiAgIFtETyBO
T1QgTUVSR0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogaDY6IEFkZCBHUFUgT1BQIHRhYmxlCj4g
PiAgIFtETyBOT1QgTUVSR0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogZm9yY2UgR1BVIHJlZ3Vs
YXRvciB0byBiZSBhbHdheXMKPgo+IFBhdGNoZXMgMS0xMCBhcHBsaWVkIHRvIGRybS1taXNjLgoK
VGhpcyBzZXJpZSBoYXMgYmVlbiBzdXBlcnNlZGVkIGJ5IHY1LgoKQ291bGQgeW91IGFwcGx5IHRo
ZSB2NSBpbnN0ZWFkLgoKVGhhbmtzCkNsw6ltZW50Cgo+Cj4gUm9iCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
