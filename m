Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5C31F82BF
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76316E46B;
	Sat, 13 Jun 2020 10:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8976D89FCA
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 09:01:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r9so9968478wmh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VkuzFvdlM+WfXelz0UOaKXXxDWlDEXZOnTOaISWqbKw=;
 b=EqxjKs52NJHgtFyMhVSpqyD3PWJhDN0rsx9hl9lfVFcvJr+NZbRIbchujrGGh2XBck
 9awQrTW+DlyZH33L2UJ6aUDn/Yq1eW03/p3QtsmvU6BHqFNWLuDyISfNURMv4T1xu+/L
 i1DnEzknJBrzz9JEFbmUP58rdiWlwJabZ0eTE0mMNzFXCSLDjlQseWhDJ+9Wz+iPH1WB
 C9wQ6L31HVmuAyXjurZEDjBlveAorSw9USDN+i3KnWA0HCJ4G4s459EcUn5gvgV2/gos
 JzM4Ikb16/00TpGZCdrn5ZBd6JDaWXNZ1sVcgWFYuzage+9DOBUQp9ZBnSdhIx9e4A6X
 gUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VkuzFvdlM+WfXelz0UOaKXXxDWlDEXZOnTOaISWqbKw=;
 b=EpqbwKk240Q0XsfmmiZQerZOjR/zXClnu007AgnkErcZSH6wpLbW1V4XdVL3ILn+Cf
 8VI0VFPxL7WLZe/RLWTvyyl7lKwPiSpSeEQ0H+5SaXfRpWrTZh7F94HmjonrCeBmnzi/
 USE4EGTWeZMdfAnWIgaoe1Na6VMz5I9z8aWRNn91M5HNduKDXkCPqT0ipuHTegyr8EDC
 wEmgfMO1iSBXlrzkQ0psJbb14M6q7GWmAJ+lmj5adsJ1pc1UdzuaH3j9Wu+E6evD6V9g
 WqHV7+KIRMnNSU98SVD1Tt6z0G0utOWHVzPoVf51XszDXvfaGnuFqY3rZ1aJJAGmLkOh
 twtg==
X-Gm-Message-State: AOAM532uqJaIozt9i4wMV7oqZtuYrgGKkoaTFo7uTJTfIRg2IT0meFV9
 qFgO2c6LZK7Al5D+UBAnQzE=
X-Google-Smtp-Source: ABdhPJwu3rED1GP9pmDiBAlCpcu0C6Z5OC80/BR0W/RoDA2qCmKIZfNB+8MGMX4d7gHqRTyItrE7ig==
X-Received: by 2002:a1c:2d83:: with SMTP id t125mr3122985wmt.187.1592038918000; 
 Sat, 13 Jun 2020 02:01:58 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan
 (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
 by smtp.gmail.com with ESMTPSA id b143sm5746659wme.20.2020.06.13.02.01.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jun 2020 02:01:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
Date: Sat, 13 Jun 2020 11:01:56 +0200
Message-Id: <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
References: <20200605170720.2478262-1-noltari@gmail.com>
 <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2FtYWwsCgo+IEVsIDEyIGp1biAyMDIwLCBhIGxhcyAyMDo0NywgS2FtYWwgRGFzdSA8a2Rh
c3Uua2RldkBnbWFpbC5jb20+IGVzY3JpYmnDszoKPiAKPiBPbiBGcmksIEp1biA1LCAyMDIwIGF0
IDE6MDcgUE0gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+IAo+PiBNVERfT1BTX0FVVE9fT09CIGlzIHdyaXR0aW5nIE9PQiB3aXRoIEVDQyBlbmFi
bGVkLCB3aGljaCBjaGFuZ2VzIGFsbCBFQ0MgYnl0ZXMKPj4gZnJvbSBhbiBlcmFzZWQgcGFnZSB0
byAweDAwIHdoZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRlZCB3aXRoIG10ZC11dGlscy4K
Pj4gICAgICAgICB8IEJCSSB8ICAgSkZGUzIgICB8ICAgRUNDICAgfCAgIEpGRlMyICAgfCBTcGFy
ZSAgfAo+PiAwMDAwMDgwMCAgZmYgZmYgMTkgODUgMjAgMDMgMDAgMDAgIDAwIDAwIDAwIDAwIDA4
IGZmIGZmIGZmCj4+IAo+PiBIb3dldmVyLCBpZiBPT0IgaXMgd3JpdHRlbiB3aXRoIEVDQyBkaXNh
YmxlZCwgdGhlIEpGRlMyIGNsZWFubWFya2VycyBhcmUKPj4gY29ycmVjdGx5IHdyaXR0ZW4gd2l0
aG91dCBjaGFuZ2luZyB0aGUgRUNDIGJ5dGVzOgo+PiAgICAgICAgIHwgQkJJIHwgICBKRkZTMiAg
IHwgICBFQ0MgICB8ICAgSkZGUzIgICB8IFNwYXJlICB8Cj4+IDAwMDAwODAwICBmZiBmZiAxOSA4
NSAyMCAwMyBmZiBmZiAgZmYgMDAgMDAgMDAgMDggZmYgZmYgZmYKPiAKPiBCb3RoIGJyY21hbmRf
d3JpdGVfb29iX3JhdygpIGFuZCBicmNtbmFuZF93cml0ZV9vb2IoKSB1c2UKPiBicmNtbmFuZF93
cml0ZSgpIHRoYXQgdXNlcyBQUk9HUkFNX1BBR0UgY21kLCBtZWFucyBhbHNvIHByb2dyYW1zIGRh
dGEKPiBhcmVhcyBhbmQgRUNDIHdoZW4gZW5hYmxlZCAgaXMgYWx3YXlzIGNhbGN1bGF0ZWQgb24g
REFUQStPT0IuICBzaW5jZQoKQXJlIHlvdSBzdXJlIGFib3V0IHRoYXQ/IEkgdGhpbmsgdGhhdCBI
VyBFQ0MgaXMgb25seSBjYWxjdWxhdGVkIGZvciBEQVRBLCBub3QgZm9yIE9PQi4KVGhlIGZhY3Qg
dGhhdCB3ZeKAmXJlIG5vdCB3cml0aW5nIGFueSBEQVRBIHNlZW1zIHRvIGJlIHRoZSBwcm9ibGVt
IHRoYXQgaXMgY2hhbmdpbmcgYWxsIEVDQyBieXRlcyB0byAweDAwLgoKPiBpbiBib3RoIGNhc2Vz
IHdlIG9ubHkgd2FudCB0byBtb2RpZnkgT09CLCBkYXRhIGlzIGFsd2F5cyBhc3N1bWVkIHRvIGJl
Cj4gMHhmZnMgKG1lYW5zIGVyYXNlZCBzdGF0ZSkuIFNvIGFzIGZhciBhcyB0aGlzIGFwaSBhbHdh
eXMgaXMgdXNlZCBvbgo+IHRoZSBlcmFzZWQgcGFnZSBpdCBzaG91bGQgYmUgZ29vZC4gQXJlIHRo
ZSBzdWItcGFnZXMvb29iIGFyZWFzIHJlYWQgYnkKPiBqZmZzMiAgYWxzbyByZWFkIHdpdGhvdXQg
ZWNjIGVuYWJsZWQ/LiBKdXN0IHdhbnQgdG8gYmUgc3VyZSB0aGF0IGl0Cj4gZG9lcyBub3QgYnJl
YWsgYW55IG90aGVyIHV0aWxpdGllcyBsaWtlIG5hbmR3cml0ZS4KCk5vLCBzdWItcGFnZXMvb29i
IGFyZWFzIHJlYWQgYnkgSkZGUzIgd2l0aCBFQ0MgZW5hYmxlZC4KSSBkb27igJl0IHRoaW5rIHRo
aXMgYnJlYWtzIGFueXRoaW5nIGF0IGFsbCwgc2luY2UgSSB0ZXN0ZWQgbmFuZHdyaXRlIHdpdGgg
T09CIGVuYWJsZWQgYW5kIGV2ZXJ5dGhpbmcgd2FzIHdyaXR0ZW4gcGVyZmVjdGx5LgoKQlRXLCBJ
IHRyaWVkIGFub3RoZXIgYXBwcm9hY2ggdGhhdCBmb3JjZWQgTVREX09QU19BVVRPX09PQiB0byBi
ZSB3cml0dGVuIGFzIHJhdyBPT0IsIGJ1dCBpdCB3YXMgcmVqZWN0ZWQ6Cmh0dHA6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8yMDIwMDUwNDA5NDI1My4yNzQx
MTA5LTEtbm9sdGFyaUBnbWFpbC5jb20vCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzUvNC8y
MTUKCj4gCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5v
bHRhcmlAZ21haWwuY29tPgo+PiAtLS0KPj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYyB8IDkgKy0tLS0tLS0tCj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgOCBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwo+PiBpbmRleCA4ZjlmZmI0NmEwOWYuLjU2NjI4MTc3MDg0MSAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+PiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+IEBAIC0yMjc5LDEzICsyMjc5
LDYgQEAgc3RhdGljIGludCBicmNtbmFuZF93cml0ZV9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBjb25zdCB1aW50OF90ICpidWYsCj4+ICAgICAgICByZXR1cm4gbmFuZF9wcm9nX3Bh
Z2VfZW5kX29wKGNoaXApOwo+PiB9Cj4+IAo+PiAtc3RhdGljIGludCBicmNtbmFuZF93cml0ZV9v
b2Ioc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IHBhZ2UpCj4+IC17Cj4+IC0gICAgICAgcmV0
dXJuIGJyY21uYW5kX3dyaXRlKG5hbmRfdG9fbXRkKGNoaXApLCBjaGlwLAo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAodTY0KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdCwgTlVMTCwK
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hpcC0+b29iX3BvaSk7Cj4+IC19Cj4+
IC0KPj4gc3RhdGljIGludCBicmNtbmFuZF93cml0ZV9vb2JfcmF3KHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsIGludCBwYWdlKQo+PiB7Cj4+ICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5h
bmRfdG9fbXRkKGNoaXApOwo+PiBAQCAtMjY0Miw3ICsyNjM1LDcgQEAgc3RhdGljIGludCBicmNt
bmFuZF9pbml0X2NzKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0LCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKmRuKQo+PiAgICAgICAgY2hpcC0+ZWNjLndyaXRlX29vYl9yYXcgPSBicmNtbmFuZF93cml0
ZV9vb2JfcmF3Owo+PiAgICAgICAgY2hpcC0+ZWNjLnJlYWRfb29iX3JhdyA9IGJyY21uYW5kX3Jl
YWRfb29iX3JhdzsKPj4gICAgICAgIGNoaXAtPmVjYy5yZWFkX29vYiA9IGJyY21uYW5kX3JlYWRf
b29iOwo+PiAtICAgICAgIGNoaXAtPmVjYy53cml0ZV9vb2IgPSBicmNtbmFuZF93cml0ZV9vb2I7
Cj4+ICsgICAgICAgY2hpcC0+ZWNjLndyaXRlX29vYiA9IGJyY21uYW5kX3dyaXRlX29vYl9yYXc7
Cj4+IAo+PiAgICAgICAgY2hpcC0+Y29udHJvbGxlciA9ICZjdHJsLT5jb250cm9sbGVyOwo+PiAK
Pj4gLS0KPj4gMi4yNi4yCj4+IAoKQmVzdCByZWdhcmRzLArDgWx2YXJvLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
