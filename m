Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A188B33FC6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F778972D;
	Tue,  4 Jun 2019 07:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C11892AE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 17:06:26 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y11so10944839pfm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 10:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HYJoR/zfyv70Em+OIILglCe3XWuiH6p+K727C24pDAs=;
 b=sOUsWjDYlO1zyGNCwEQsKrLDyfVKmxZw4eeVVOM1hm3lYzD3uXAECHfS3Sm9FZaOhK
 YNJfkIaf+MKH5thPT1pNJayaUzZaS8on/EsCDk/We03/G0M60hDEquambpkhrz+75X6G
 +BiwA5YyBh5K7OUjUtRIgUYp+jlXdlWAY8BkloXvT75cKJHmJN9KtpgHr7q6cQQE3Cpt
 TOYFBsd9umGm9VM65qejUF8S/lO5eUrF1X2vWkbu0KeUoSRKFAMKM/yzmRqUz8gH78hV
 RJLHj8FcGe/dzB/sYyZS0eOhQb13jyRCIE1abO907oNC6lyQ7ZqX4oUUyURGSA8xVz+K
 LoeA==
X-Gm-Message-State: APjAAAXb1Y0SfakX98pzA78zMEp8ZWsMAJqnuhwvOrcfofmjOMuoz006
 cHrq2TE5LZ4zxM9XkLoRF0ohHkqOGMAIEQYAXfuJxg==
X-Google-Smtp-Source: APXvYqzVD08oLbUBv5TB7pQev79oUx9XvjbFqir2kEseCZEnF7+ERZIlVyBSOpSgKKJ3rEYpDIEwDIElz1nyAoYLJGY=
X-Received: by 2002:a17:90a:2488:: with SMTP id
 i8mr23649149pje.123.1559581585869; 
 Mon, 03 Jun 2019 10:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
 <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
In-Reply-To: <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 3 Jun 2019 19:06:14 +0200
Message-ID: <CAAeHK+xX2538e674Pz25unkdFPCO_SH0pFwFu=8+DS7RzfYnLQ@mail.gmail.com>
Subject: Re: [PATCH v16 01/16] uaccess: add untagged_addr definition for other
 arches
To: Khalid Aziz <khalid.aziz@oracle.com>
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HYJoR/zfyv70Em+OIILglCe3XWuiH6p+K727C24pDAs=;
 b=XymoGc7JWCRKHtM+wd/9hGi9VWGsUM72Lwa90KnvQJ358uEmtUgcHoKdtU9g/YH4UJ
 5u34zZdjU4FRJazo1vFuW3Ni1y1DNZVh/alS1ECRtC3BF7TZUH+GUyZUoEV1ZTcu35tt
 nObul5i9lrx30r8a/e6JYyssLeymB2ctqES0N7//YxV4uMKqEsaUeN3+PzxtLJVdrwsh
 Z/k985v/01dgnrGjVh59cUp9Nom/0K7l3TgAT4n5WZQPD1vgp3vkfuUimZ+Xh+PsD+fW
 QdzcgoJaWOtWSqcWc9IK1QohrHJZ7wW5wsfUIytyUhIb0Cs9PUborvrLgVelRcAz9JGB
 usaQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA3OjA0IFBNIEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBv
cmFjbGUuY29tPiB3cm90ZToKPgo+IE9uIDYvMy8xOSAxMDo1NSBBTSwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiA+IFRvIGFsbG93IGFybTY0IHN5c2NhbGxzIHRvIGFjY2VwdCB0YWdnZWQgcG9p
bnRlcnMgZnJvbSB1c2Vyc3BhY2UsIHdlIG11c3QKPiA+IHVudGFnIHRoZW0gd2hlbiB0aGV5IGFy
ZSBwYXNzZWQgdG8gdGhlIGtlcm5lbC4gU2luY2UgdW50YWdnaW5nIGlzIGRvbmUgaW4KPiA+IGdl
bmVyaWMgcGFydHMgb2YgdGhlIGtlcm5lbCwgdGhlIHVudGFnZ2VkX2FkZHIgbWFjcm8gbmVlZHMg
dG8gYmUgZGVmaW5lZAo+ID4gZm9yIGFsbCBhcmNoaXRlY3R1cmVzLgo+ID4KPiA+IERlZmluZSBp
dCBhcyBhIG5vb3AgZm9yIGFyY2hpdGVjdHVyZXMgb3RoZXIgdGhhbiBhcm02NC4KPiA+Cj4gPiBB
Y2tlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiA+IFJl
dmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlkLmF6aXpAb3JhY2xlLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiA+IC0t
LQo+ID4gIGluY2x1ZGUvbGludXgvbW0uaCB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIv
aW5jbHVkZS9saW51eC9tbS5oCj4gPiBpbmRleCAwZTg4MzRhYzMyYjcuLjk0OWQ0M2U5YzBiNiAx
MDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ID4gKysrIGIvaW5jbHVkZS9saW51
eC9tbS5oCj4gPiBAQCAtOTksNiArOTksMTAgQEAgZXh0ZXJuIGludCBtbWFwX3JuZF9jb21wYXRf
Yml0cyBfX3JlYWRfbW9zdGx5Owo+ID4gICNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgo+ID4gICNp
bmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gPgo+ID4gKyNpZm5kZWYgdW50YWdnZWRfYWRkcgo+
ID4gKyNkZWZpbmUgdW50YWdnZWRfYWRkcihhZGRyKSAoYWRkcikKPiA+ICsjZW5kaWYKPiA+ICsK
PiA+ICAjaWZuZGVmIF9fcGFfc3ltYm9sCj4gPiAgI2RlZmluZSBfX3BhX3N5bWJvbCh4KSAgX19w
YShSRUxPQ19ISURFKCh1bnNpZ25lZCBsb25nKSh4KSwgMCkpCj4gPiAgI2VuZGlmCj4gPgo+Cj4g
QW5kcmV5LAo+Cj4gVGhpcyBwYXRjaCBoYXMgbm93IGJlY29tZSBwYXJ0IG9mIHRoZSBvdGhlciBw
YXRjaCBzZXJpZXMgQ2hyaXMgSGVsbHdpZwo+IGhhcyBzZW50IG91dCAtCj4gPGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA2MDEwNzQ5NTkuMTQwMzYtMS1oY2hAbHN0LmRlLz4uIENh
bgo+IHlvdSBjb29yZGluYXRlIHdpdGggdGhhdCBwYXRjaCBzZXJpZXM/CgpIaSEKClllcywgSSd2
ZSBzZWVuIGl0LiBIb3cgc2hvdWxkIEkgY29vcmRpbmF0ZT8gUmViYXNlIHRoaXMgc2VyaWVzIG9u
IHRvcApvZiB0aGF0IG9uZT8KClRoYW5rcyEKCj4KPiAtLQo+IEtoYWxpZAo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
