Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504350F68
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C459689C21;
	Mon, 24 Jun 2019 15:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED66389C21
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:00:59 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id t16so7647996pfe.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZH0KsEpqEXiZL11grL/nW8IzWOxozO/nFecO0TNWzZg=;
 b=CUl2PvVoGxwDN2WUhQLwCgt8hRJtnIQZBYHaDVbZeH7A9nItrPBLr8D6Jw0AXXdqo1
 WLJTv3Rwj08IbEQBD6nd4zeCflU0Xg1DcJY8f8mnHB1pEGFpAEFKDlWn941etvVhJiIL
 zLLL/N4xbwrg8Ra785PvkPoEUBLp8nGht/0L0yvzluqFKAyRHYDOBTl5ESK/VC0t1LkN
 p3jaoQqLGYXzLdSQjvGxN+rN2ZJmiEthMHT/OuQNSrDYCE+wjMbGuub0QiCBTmHkOuhK
 v0LXfvs6K29hMpYcCSRtEk7PjtFYyA7n/swH5beJAPWaFdm98IEA9LOnpeu88GPR03v3
 CDkQ==
X-Gm-Message-State: APjAAAXRJm9VVtHDtgvh8wO9N0Eh6VsCbbm7K9fhoovMF/GlwCBvsIEp
 z62iQ4FQFPYSRiGWvnFfnJA/RA==
X-Google-Smtp-Source: APXvYqyXA9qWckeMWJ1FYgTNxW3Kl/SaHQcwWPkv+8Ov9g+q8rZ/yCmpPgqZaQwQyexxau4NGmLb3Q==
X-Received: by 2002:a17:90a:338b:: with SMTP id
 n11mr24999228pjb.21.1561388459522; 
 Mon, 24 Jun 2019 08:00:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e188sm1978374pfh.99.2019.06.24.08.00.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 08:00:58 -0700 (PDT)
Date: Mon, 24 Jun 2019 08:00:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 09/15] drm/amdgpu: untag user pointers
Message-ID: <201906240800.5677E3CF@keescook>
References: <cover.1561386715.git.andreyknvl@google.com>
 <1d036fc5bec4be059ee7f4f42bf7417dc44651dd.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d036fc5bec4be059ee7f4f42bf7417dc44651dd.1561386715.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZH0KsEpqEXiZL11grL/nW8IzWOxozO/nFecO0TNWzZg=;
 b=KQ2654w6YgnMZs2At+Zd89XQIqIuYR8jlquNCWJJuIXpWD/HlSd4ZBjLxPQsxGeT2n
 QOBGSpQkVzrAWhjdNm3L175i3EwkQyprQmoxs6iyZjw9hV5O7BunNQVJJ3RYGgog4Rsr
 YQVv/8/84su3okC1IPWa+LhVmvUHm4bqUkhyE=
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzI6NTRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gSW4gYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsKCkgYW5k
IGFtZGdwdV9hbWRrZmRfZ3B1dm0uYy9pbml0X3VzZXJfcGFnZXMoKQo+IGFuIE1NVSBub3RpZmll
ciBpcyBzZXQgdXAgd2l0aCBhICh0YWdnZWQpIHVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdn
ZWQKPiBhZGRyZXNzIHNob3VsZCBiZSB1c2VkIHNvIHRoYXQgTU1VIG5vdGlmaWVycyBmb3IgdGhl
IHVudGFnZ2VkIGFkZHJlc3MgZ2V0Cj4gY29ycmVjdGx5IG1hdGNoZWQgdXAgd2l0aCB0aGUgcmln
aHQgQk8uIFRoaXMgcGF0Y2ggdW50YWcgdXNlciBwb2ludGVycyBpbgo+IGFtZGdwdV9nZW1fdXNl
cnB0cl9pb2N0bCgpIGZvciB0aGUgR0VNIGNhc2UgYW5kIGluIGFtZGdwdV9hbWRrZmRfZ3B1dm1f
Cj4gYWxsb2NfbWVtb3J5X29mX2dwdSgpIGZvciB0aGUgS0ZEIGNhc2UuIFRoaXMgYWxzbyBtYWtl
cyBzdXJlIHRoYXQgYW4KPiB1bnRhZ2dlZCBwb2ludGVyIGlzIHBhc3NlZCB0byBhbWRncHVfdHRt
X3R0X2dldF91c2VyX3BhZ2VzKCksIHdoaWNoIHVzZXMKPiBpdCBmb3Igdm1hIGxvb2t1cHMuCj4g
Cj4gU3VnZ2VzdGVkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4K
PiBBY2tlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgoKUmV2
aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgoKLUtlZXMKCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDIg
Ky0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgICAgICAgIHwg
MiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKPiBpbmRleCBhNmU1MTg0ZDQzNmMuLjVkNDc2ZTliYmM0MyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiBAQCAtMTEwOCw3
ICsxMTA4LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSgK
PiAgCQlhbGxvY19mbGFncyA9IDA7Cj4gIAkJaWYgKCFvZmZzZXQgfHwgISpvZmZzZXQpCj4gIAkJ
CXJldHVybiAtRUlOVkFMOwo+IC0JCXVzZXJfYWRkciA9ICpvZmZzZXQ7Cj4gKwkJdXNlcl9hZGRy
ID0gdW50YWdnZWRfYWRkcigqb2Zmc2V0KTsKPiAgCX0gZWxzZSBpZiAoZmxhZ3MgJiBBTExPQ19N
RU1fRkxBR1NfRE9PUkJFTEwpIHsKPiAgCQlkb21haW4gPSBBTURHUFVfR0VNX0RPTUFJTl9HVFQ7
Cj4gIAkJYWxsb2NfZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fQ1BVOwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPiBpbmRleCBkNGZjZjU0NzU0NjQuLmU5MWRmMTQw
NzYxOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Vt
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPiBAQCAt
Mjg3LDYgKzI4Nyw4IEBAIGludCBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgCXVpbnQzMl90IGhhbmRsZTsKPiAgCWludCByOwo+
ICAKPiArCWFyZ3MtPmFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFyZ3MtPmFkZHIpOwo+ICsKPiAgCWlm
IChvZmZzZXRfaW5fcGFnZShhcmdzLT5hZGRyIHwgYXJncy0+c2l6ZSkpCj4gIAkJcmV0dXJuIC1F
SU5WQUw7Cj4gIAo+IC0tIAo+IDIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwo+IAoKLS0gCktl
ZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
