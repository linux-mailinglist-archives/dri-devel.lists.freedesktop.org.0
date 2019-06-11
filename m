Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B216F41CE9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7111989301;
	Wed, 12 Jun 2019 06:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BDD89175
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:18:16 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 19so7000551pfa.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cRK7dSJ9ozXpkMag7XMLUlUKlJp+YVQsFuMywlLYIIY=;
 b=M52mQgdeUKC2pxn02fFZMvAoIfAtznYQRrJ1BQXUtHibV539mdEgQew3ajmpdcbcrG
 o82uTgRtIVBay6WoZW5HuTLgV0i9IaFGnm0m+AQnHs5+a1vU9LoqCMjgfEcE+QDxugF9
 2tsfHEBFptppUA6HmslMxrnyl+SJNrpySHk4rWi8egskPfiHKvd3QcfhmmiffvYvOKpw
 8CN0JDdit7glrhD7wuAPYnxMJ4/sls9b2j7C8Fi4WQwlvxcfZj45TINh7MLRzSk/gP+M
 loruW7Ww76HdlMduyKhRcWl1JKj6u7zhu1E//TxAWCt0x9+5EIKeqc9sHrxuVza6urYK
 3a9A==
X-Gm-Message-State: APjAAAVKwGVMrPx+T+j4cDveRXHUZrYquQ6macwQoB959qXXOhmuRViq
 yUjz46ohw6ur22sfgAT00F6+zLH2lndngqPhUxGaGA==
X-Google-Smtp-Source: APXvYqwTIY2/OtCAe2ytKIYqGY3omJlioSYHG1JrmGnaMaDG0e9TwsYGQisqOCiIuCpfggd2Tzz2lgNj29c+F+rHVNg=
X-Received: by 2002:a17:90a:2488:: with SMTP id
 i8mr27381746pje.123.1560273495783; 
 Tue, 11 Jun 2019 10:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
 <20190611150122.GB63588@arrakis.emea.arm.com>
In-Reply-To: <20190611150122.GB63588@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 11 Jun 2019 19:18:04 +0200
Message-ID: <CAAeHK+wZrVXxAnDXBjoUy8JK9iG553G2Bp8uPWQ0u1u5gts0vQ@mail.gmail.com>
Subject: Re: [PATCH v16 16/16] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cRK7dSJ9ozXpkMag7XMLUlUKlJp+YVQsFuMywlLYIIY=;
 b=b9zA6Ql86DPqQkTp5i0i6v7MtDOq0tAACNbJiToG/gsWM88lOHPNTLEE2A75D2FKoO
 SaTGSkkdbkFjBHB6V7dNy3yNl8DW1iE0pnw0WmGXH9zKr6DLv5bE7mRA4LdyIllbpD/D
 KcrOvJfjpWiyccNOyNMsy4lUx+9EWF4+Rz1owvnwBXs022X3zquKp/rp+skYCj68ppuI
 s9oCX7Or8ik9oAg9pTuxoIFV/Q0kJ7gPx7GPxqYH4vPwX3SSd1Ma3tHuV9GC8yXrZkiY
 8Msdnuz2aqf5gojfEQ2ZtoCfHhj+2CsKFVVs7asqO5iLhZbFI9QDBNBmCP2d56v0+z1i
 p9EA==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNTowMSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA2OjU1
OjE4UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEg
cGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0
bwo+ID4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRv
IHNvbWV0aGluZyBlbHNlIG90aGVyCj4gPiB0aGFuIDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRz
Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIHNpbXBsZSB0ZXN0LCB0aGF0IGNhbGxzIHRoZSB1
bmFtZSBzeXNjYWxsIHdpdGggYQo+ID4gdGFnZ2VkIHVzZXIgcG9pbnRlciBhcyBhbiBhcmd1bWVu
dC4gV2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKPiA+IHVzZXIgcG9pbnRlcnMg
dGhlIHRlc3QgZmFpbHMgd2l0aCBFRkFVTFQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+Cj4gQlRXLCB5b3UgY291bGQgYWRk
Cj4KPiBDby1kZXZlbG9wZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFy
bS5jb20+Cj4KPiBzaW5jZSBJIHdyb3RlIHRoZSBtYWxsb2MoKSBldGMuIGhvb2tzLgoKU3VyZSEK
Cj4KPgo+ID4gK3N0YXRpYyB2b2lkICp0YWdfcHRyKHZvaWQgKnB0cikKPiA+ICt7Cj4gPiArICAg
ICB1bnNpZ25lZCBsb25nIHRhZyA9IHJhbmQoKSAmIDB4ZmY7Cj4gPiArICAgICBpZiAoIXB0cikK
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIHB0cjsKPiA+ICsgICAgIHJldHVybiAodm9pZCAqKSgo
dW5zaWduZWQgbG9uZylwdHIgfCAodGFnIDw8IFRBR19TSElGVCkpOwo+ID4gK30KPgo+IFdpdGgg
dGhlIHByY3RsKCkgb3B0aW9uLCB0aGlzIGZ1bmN0aW9uIGJlY29tZXMgKGlmIHlvdSBoYXZlIGEg
YmV0dGVyCj4gaWRlYSwgZmluZSBieSBtZSk6Cj4KPiAtLS0tLS0tLS0tODwtLS0tLS0tLS0tLS0t
LS0KPiAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgo+Cj4gI2Rl
ZmluZSBUQUdfU0hJRlQgICAgICAgKDU2KQo+ICNkZWZpbmUgVEFHX01BU0sgICAgICAgICgweGZm
VUwgPDwgVEFHX1NISUZUKQo+Cj4gI2RlZmluZSBQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCAgICAg
ICAgIDU1Cj4gI2RlZmluZSBQUl9HRVRfVEFHR0VEX0FERFJfQ1RSTCAgICAgICAgIDU2Cj4gIyBk
ZWZpbmUgUFJfVEFHR0VEX0FERFJfRU5BQkxFICAgICAgICAgICgxVUwgPDwgMCkKPgo+IHZvaWQg
Kl9fbGliY19tYWxsb2Moc2l6ZV90IHNpemUpOwo+IHZvaWQgX19saWJjX2ZyZWUodm9pZCAqcHRy
KTsKPiB2b2lkICpfX2xpYmNfcmVhbGxvYyh2b2lkICpwdHIsIHNpemVfdCBzaXplKTsKPiB2b2lk
ICpfX2xpYmNfY2FsbG9jKHNpemVfdCBubWVtYiwgc2l6ZV90IHNpemUpOwo+Cj4gc3RhdGljIHZv
aWQgKnRhZ19wdHIodm9pZCAqcHRyKQo+IHsKPiAgICAgICAgIHN0YXRpYyBpbnQgdGFnZ2VkX2Fk
ZHJfZXJyID0gMTsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdGFnID0gMDsKPgo+ICAgICAgICAg
aWYgKHRhZ2dlZF9hZGRyX2VyciA9PSAxKQo+ICAgICAgICAgICAgICAgICB0YWdnZWRfYWRkcl9l
cnIgPSBwcmN0bChQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUFJfVEFHR0VEX0FERFJfRU5BQkxFLCAwLCAwLCAwKTsKCkkg
dGhpbmsgdGhpcyByZXF1aXJlcyBhdG9taWNzLiBtYWxsb2MoKSBjYW4gYmUgY2FsbGVkIGZyb20g
bXVsdGlwbGUgdGhyZWFkcy4KCj4KPiAgICAgICAgIGlmICghcHRyKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gcHRyOwo+ICAgICAgICAgaWYgKCF0YWdnZWRfYWRkcl9lcnIpCj4gICAgICAgICAg
ICAgICAgIHRhZyA9IHJhbmQoKSAmIDB4ZmY7Cj4KPiAgICAgICAgIHJldHVybiAodm9pZCAqKSgo
dW5zaWduZWQgbG9uZylwdHIgfCAodGFnIDw8IFRBR19TSElGVCkpOwo+IH0KPgo+IC0tCj4gQ2F0
YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
