Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD639A64
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874D289204;
	Sat,  8 Jun 2019 03:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E4489204
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:49:07 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i189so2212943pfg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5iFtOAxSpyEwrNGKsnJSAuPHnmB6sZsxY7o3VcURDbs=;
 b=f1TweOh2bWWa1XQqp2XQwakvHtmxrnvsMefQhSKsd4Xjt1QE2AY1+cym4LyLMWKMnb
 QReuEardZLoUrtPyl+m4FJkXh7IBSeh5hnBC/o7xhQQGbwNWmPYlPiHJ4GieilRj63yd
 2VR8DyGtVxfh1exS23WwgH88fwrZa7Ovyg0ExlA+5HutHXrZzwJsbS+u2SmBc6bjEdTH
 uRigGTw0/eM3kGvKQKCIQq6y9uuUPGJLkN62Pzqi6q5Hx1s15sD1to4rWfcOXvBctPTq
 LRLtLtPJvdEs7eNlDkQq/v6gpFSQBkk2UPRdLqXK3jJIDKYUaO4Qf+Me3D70bXowRkeS
 657Q==
X-Gm-Message-State: APjAAAX7loTUc95QsSbiHhQaEdK0xIRqF9U/j6GrwFepln5nf1Y8A3/S
 9sN5/nFJExh3BVXgj/tpgtxOfg==
X-Google-Smtp-Source: APXvYqyjpXWbpUp/M/TNwB1KLrsvdqCimHBytjvPEw0jUB6ar1HA2nI5YlI2gocy+KHTqRtIofNEIA==
X-Received: by 2002:a63:5247:: with SMTP id s7mr5637363pgl.29.1559965746908;
 Fri, 07 Jun 2019 20:49:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y12sm3218417pgi.10.2019.06.07.20.49.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:49:06 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:49:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 04/16] mm: untag user pointers in do_pages_move
Message-ID: <201906072049.C71D545@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5iFtOAxSpyEwrNGKsnJSAuPHnmB6sZsxY7o3VcURDbs=;
 b=H67pCnfy+inYwtx7CHiN5h4f1U/pgcnleLkOrUnW4+QdjbqfAr9cQdSkm3W08ImQFl
 MKpSL+Xxt/SE/t0ZUnbh42ewav3Rgd/mWolnnSDbYBR+Ld/cLmR9BtGJ7sEbWVa+oHPR
 1hTMHtgCUOMHLDYeeHgvIO8Lm0UyCIchcEask=
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gZG9fcGFnZXNfbW92ZSgpIGlzIHVzZWQgaW4g
dGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBtb3ZlX3BhZ2VzIHN5c2NhbGwuCj4gCj4gVW50YWcg
dXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IFJldmlld2VkLWJ5OiBDYXRhbGlu
IE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBLZWVzIENv
b2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KCi1LZWVzCgo+IC0tLQo+ICBtbS9taWdyYXRlLmMg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBh
L21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUuYwo+IGluZGV4IGYyZWNjMjg1NWExMi4uMzkzMGJi
NmZhNjU2IDEwMDY0NAo+IC0tLSBhL21tL21pZ3JhdGUuYwo+ICsrKyBiL21tL21pZ3JhdGUuYwo+
IEBAIC0xNjE3LDYgKzE2MTcsNyBAQCBzdGF0aWMgaW50IGRvX3BhZ2VzX21vdmUoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIG5vZGVtYXNrX3QgdGFza19ub2RlcywKPiAgCQlpZiAoZ2V0X3VzZXIobm9k
ZSwgbm9kZXMgKyBpKSkKPiAgCQkJZ290byBvdXRfZmx1c2g7Cj4gIAkJYWRkciA9ICh1bnNpZ25l
ZCBsb25nKXA7Cj4gKwkJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4gIAo+ICAJCWVyciA9
IC1FTk9ERVY7Cj4gIAkJaWYgKG5vZGUgPCAwIHx8IG5vZGUgPj0gTUFYX05VTU5PREVTKQo+IC0t
IAo+IDIuMjIuMC5yYzEuMzExLmc1ZDc1NzNhMTUxLWdvb2cKPiAKCi0tIApLZWVzIENvb2sKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
