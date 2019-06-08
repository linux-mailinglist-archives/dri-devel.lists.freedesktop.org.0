Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071FF39A75
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEEE891F8;
	Sat,  8 Jun 2019 03:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5605A891F8
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:51:50 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w34so2122483pga.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+sAqEcYebSGTQqNUHJjZvXdBrlSAt8m9jXPFyYB00fA=;
 b=dgwptSHi8Qj2wxXs7W0LgqHDcdQvt0ItXnRtiJQhaxxeEtTg33u+PFx4SMYLvAEwxp
 TeCTlxGh0co2dqQ0BZ5n/7xXmZduQrZ6W3rm+3bZV/IEUjfCHOAdcwSZF5eAKlDpW5Du
 jXoVwzhPbl0t9TxxkZ5G1qXnQ/uWJQRqFTRX0vymiIGcLhs8u41W+VdyNhgkLUupVGKs
 br0HQW8XDXkk+FDBR5B5s/GI0ZAbFQyhpaX0702WWsfw1eVuMdVlx1S2crhEy4tvrrb+
 QH+RcHEY4k2wY3yrSkiYp02ubhj7G7TmJ1wDMluE0aZNErM7m4rsx+7/1gZ7/G4ifuSg
 5FAA==
X-Gm-Message-State: APjAAAUyE17zgBVHDRgKuFvMs1i1kQByBw0vY4DHnykljV8ojnvwoD1L
 BvHyfYWpd79La1+Pld9uI1aqvg==
X-Google-Smtp-Source: APXvYqwaFwR9TdiH8fcP0E7/plCUQ2bJqcAs+FgbmWIC/6eFKnV6hJ+Yk3YTH/8Vcg8+zQmbsZgqwQ==
X-Received: by 2002:a17:90a:b104:: with SMTP id
 z4mr9232885pjq.102.1559965909964; 
 Fri, 07 Jun 2019 20:51:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k13sm3360691pgq.45.2019.06.07.20.51.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:51:49 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:51:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 05/16] arm64: untag user pointers passed to memory
 syscalls
Message-ID: <201906072051.7B66635BE@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+sAqEcYebSGTQqNUHJjZvXdBrlSAt8m9jXPFyYB00fA=;
 b=CtSxM/iJFdFOilMt5IYz49fhtrPJpe1biMjSLL9dNHxYjLjFZgiPdCXtt2Os7+WUWp
 2h97ew7Js16BFPaL91oYsoUi+i2fwl58zxZoJKC+5LpNlJocOwDirIXVuEvjdms0IvZ/
 xj006iO3/Sm/g4St20TSl0BbuhpEFIrb4EXp0=
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gVGhpcyBwYXRjaCBhbGxvd3MgdGFnZ2VkIHBv
aW50ZXJzIHRvIGJlIHBhc3NlZCB0byB0aGUgZm9sbG93aW5nIG1lbW9yeQo+IHN5c2NhbGxzOiBn
ZXRfbWVtcG9saWN5LCBtYWR2aXNlLCBtYmluZCwgbWluY29yZSwgbWxvY2ssIG1sb2NrMiwgbXBy
b3RlY3QsCj4gbXJlbWFwLCBtc3luYywgbXVubG9jay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAgbW0vbWFkdmlzZS5j
ICAgfCAyICsrCj4gIG1tL21lbXBvbGljeS5jIHwgMyArKysKPiAgbW0vbWluY29yZS5jICAgfCAy
ICsrCj4gIG1tL21sb2NrLmMgICAgIHwgNCArKysrCj4gIG1tL21wcm90ZWN0LmMgIHwgMiArKwo+
ICBtbS9tcmVtYXAuYyAgICB8IDIgKysKPiAgbW0vbXN5bmMuYyAgICAgfCAyICsrCj4gIDcgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9tYWR2aXNl
LmMgYi9tbS9tYWR2aXNlLmMKPiBpbmRleCA2MjgwMjJlNjc0YTcuLjM5YjgyZjhhNjk4ZiAxMDA2
NDQKPiAtLS0gYS9tbS9tYWR2aXNlLmMKPiArKysgYi9tbS9tYWR2aXNlLmMKPiBAQCAtODEwLDYg
KzgxMCw4IEBAIFNZU0NBTExfREVGSU5FMyhtYWR2aXNlLCB1bnNpZ25lZCBsb25nLCBzdGFydCwg
c2l6ZV90LCBsZW5faW4sIGludCwgYmVoYXZpb3IpCj4gIAlzaXplX3QgbGVuOwo+ICAJc3RydWN0
IGJsa19wbHVnIHBsdWc7Cj4gIAo+ICsJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiAr
Cj4gIAlpZiAoIW1hZHZpc2VfYmVoYXZpb3JfdmFsaWQoYmVoYXZpb3IpKQo+ICAJCXJldHVybiBl
cnJvcjsKPiAgCj4gZGlmZiAtLWdpdCBhL21tL21lbXBvbGljeS5jIGIvbW0vbWVtcG9saWN5LmMK
PiBpbmRleCAwMTYwMGQ4MGFlMDEuLjc4ZTBhODhiMjY4MCAxMDA2NDQKPiAtLS0gYS9tbS9tZW1w
b2xpY3kuYwo+ICsrKyBiL21tL21lbXBvbGljeS5jCj4gQEAgLTEzNjAsNiArMTM2MCw3IEBAIHN0
YXRpYyBsb25nIGtlcm5lbF9tYmluZCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25n
IGxlbiwKPiAgCWludCBlcnI7Cj4gIAl1bnNpZ25lZCBzaG9ydCBtb2RlX2ZsYWdzOwo+ICAKPiAr
CXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gIAltb2RlX2ZsYWdzID0gbW9kZSAmIE1Q
T0xfTU9ERV9GTEFHUzsKPiAgCW1vZGUgJj0gfk1QT0xfTU9ERV9GTEFHUzsKPiAgCWlmIChtb2Rl
ID49IE1QT0xfTUFYKQo+IEBAIC0xNTE3LDYgKzE1MTgsOCBAQCBzdGF0aWMgaW50IGtlcm5lbF9n
ZXRfbWVtcG9saWN5KGludCBfX3VzZXIgKnBvbGljeSwKPiAgCWludCB1bmluaXRpYWxpemVkX3Zh
cihwdmFsKTsKPiAgCW5vZGVtYXNrX3Qgbm9kZXM7Cj4gIAo+ICsJYWRkciA9IHVudGFnZ2VkX2Fk
ZHIoYWRkcik7Cj4gKwo+ICAJaWYgKG5tYXNrICE9IE5VTEwgJiYgbWF4bm9kZSA8IG5yX25vZGVf
aWRzKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAKPiBkaWZmIC0tZ2l0IGEvbW0vbWluY29yZS5j
IGIvbW0vbWluY29yZS5jCj4gaW5kZXggYzNmMDU4YmQwZmFmLi42NGMzMjJlZDg0NWMgMTAwNjQ0
Cj4gLS0tIGEvbW0vbWluY29yZS5jCj4gKysrIGIvbW0vbWluY29yZS5jCj4gQEAgLTI0OSw2ICsy
NDksOCBAQCBTWVNDQUxMX0RFRklORTMobWluY29yZSwgdW5zaWduZWQgbG9uZywgc3RhcnQsIHNp
emVfdCwgbGVuLAo+ICAJdW5zaWduZWQgbG9uZyBwYWdlczsKPiAgCXVuc2lnbmVkIGNoYXIgKnRt
cDsKPiAgCj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+ICsKPiAgCS8qIENoZWNr
IHRoZSBzdGFydCBhZGRyZXNzOiBuZWVkcyB0byBiZSBwYWdlLWFsaWduZWQuLiAqLwo+ICAJaWYg
KHN0YXJ0ICYgflBBR0VfTUFTSykKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiBkaWZmIC0tZ2l0IGEv
bW0vbWxvY2suYyBiL21tL21sb2NrLmMKPiBpbmRleCAwODBmM2IzNjQxNWIuLmU4MjYwOWVhYTQy
OCAxMDA2NDQKPiAtLS0gYS9tbS9tbG9jay5jCj4gKysrIGIvbW0vbWxvY2suYwo+IEBAIC02NzQs
NiArNjc0LDggQEAgc3RhdGljIF9fbXVzdF9jaGVjayBpbnQgZG9fbWxvY2sodW5zaWduZWQgbG9u
ZyBzdGFydCwgc2l6ZV90IGxlbiwgdm1fZmxhZ3NfdCBmbGEKPiAgCXVuc2lnbmVkIGxvbmcgbG9j
a19saW1pdDsKPiAgCWludCBlcnJvciA9IC1FTk9NRU07Cj4gIAo+ICsJc3RhcnQgPSB1bnRhZ2dl
ZF9hZGRyKHN0YXJ0KTsKPiArCj4gIAlpZiAoIWNhbl9kb19tbG9jaygpKQo+ICAJCXJldHVybiAt
RVBFUk07Cj4gIAo+IEBAIC03MzUsNiArNzM3LDggQEAgU1lTQ0FMTF9ERUZJTkUyKG11bmxvY2ss
IHVuc2lnbmVkIGxvbmcsIHN0YXJ0LCBzaXplX3QsIGxlbikKPiAgewo+ICAJaW50IHJldDsKPiAg
Cj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+ICsKPiAgCWxlbiA9IFBBR0VfQUxJ
R04obGVuICsgKG9mZnNldF9pbl9wYWdlKHN0YXJ0KSkpOwo+ICAJc3RhcnQgJj0gUEFHRV9NQVNL
Owo+ICAKPiBkaWZmIC0tZ2l0IGEvbW0vbXByb3RlY3QuYyBiL21tL21wcm90ZWN0LmMKPiBpbmRl
eCBiZjM4ZGZiYmI0YjQuLjE5Zjk4MWI3MzNiYyAxMDA2NDQKPiAtLS0gYS9tbS9tcHJvdGVjdC5j
Cj4gKysrIGIvbW0vbXByb3RlY3QuYwo+IEBAIC00NjUsNiArNDY1LDggQEAgc3RhdGljIGludCBk
b19tcHJvdGVjdF9wa2V5KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHNpemVfdCBsZW4sCj4gIAljb25z
dCBib29sIHJpZXIgPSAoY3VycmVudC0+cGVyc29uYWxpdHkgJiBSRUFEX0lNUExJRVNfRVhFQykg
JiYKPiAgCQkJCShwcm90ICYgUFJPVF9SRUFEKTsKPiAgCj4gKwlzdGFydCA9IHVudGFnZ2VkX2Fk
ZHIoc3RhcnQpOwo+ICsKPiAgCXByb3QgJj0gfihQUk9UX0dST1dTRE9XTnxQUk9UX0dST1dTVVAp
Owo+ICAJaWYgKGdyb3dzID09IChQUk9UX0dST1dTRE9XTnxQUk9UX0dST1dTVVApKSAvKiBjYW4n
dCBiZSBib3RoICovCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gZGlmZiAtLWdpdCBhL21tL21yZW1h
cC5jIGIvbW0vbXJlbWFwLmMKPiBpbmRleCBmYzI0MWQyM2NkOTcuLjFkOTgyODFmNzIwNCAxMDA2
NDQKPiAtLS0gYS9tbS9tcmVtYXAuYwo+ICsrKyBiL21tL21yZW1hcC5jCj4gQEAgLTYwNiw2ICs2
MDYsOCBAQCBTWVNDQUxMX0RFRklORTUobXJlbWFwLCB1bnNpZ25lZCBsb25nLCBhZGRyLCB1bnNp
Z25lZCBsb25nLCBvbGRfbGVuLAo+ICAJTElTVF9IRUFEKHVmX3VubWFwX2Vhcmx5KTsKPiAgCUxJ
U1RfSEVBRCh1Zl91bm1hcCk7Cj4gIAo+ICsJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4g
Kwo+ICAJaWYgKGZsYWdzICYgfihNUkVNQVBfRklYRUQgfCBNUkVNQVBfTUFZTU9WRSkpCj4gIAkJ
cmV0dXJuIHJldDsKPiAgCj4gZGlmZiAtLWdpdCBhL21tL21zeW5jLmMgYi9tbS9tc3luYy5jCj4g
aW5kZXggZWYzMGE0Mjk2MjNhLi5jM2JkM2U3NWY2ODcgMTAwNjQ0Cj4gLS0tIGEvbW0vbXN5bmMu
Ywo+ICsrKyBiL21tL21zeW5jLmMKPiBAQCAtMzcsNiArMzcsOCBAQCBTWVNDQUxMX0RFRklORTMo
bXN5bmMsIHVuc2lnbmVkIGxvbmcsIHN0YXJ0LCBzaXplX3QsIGxlbiwgaW50LCBmbGFncykKPiAg
CWludCB1bm1hcHBlZF9lcnJvciA9IDA7Cj4gIAlpbnQgZXJyb3IgPSAtRUlOVkFMOwo+ICAKPiAr
CXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwo+ICAJaWYgKGZsYWdzICYgfihNU19B
U1lOQyB8IE1TX0lOVkFMSURBVEUgfCBNU19TWU5DKSkKPiAgCQlnb3RvIG91dDsKPiAgCWlmIChv
ZmZzZXRfaW5fcGFnZShzdGFydCkpCj4gLS0gCj4gMi4yMi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEt
Z29vZwo+IAoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
