Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838639A55
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6975891EF;
	Sat,  8 Jun 2019 03:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD2D89203
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:48:10 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g9so1532574plm.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RNlIE7RpVdU5f0iicQk2k5+1DUNsXJMHiELoWiOeeG4=;
 b=bswqctwUQJ8pGWlm+lzNlhqjPk7ki8TDtDRbDWWYLJPGBOMVbwhHwxdvH2Qp1jGkbi
 e2jm8AeHj4VX5ne5wdQZWO3z1/bP5SFow74YUi6joV2hRJlCVCxpyXf51UV/51O9mGki
 Vxb2jwXqSjA0tJbIa3WjhR6d34sxLBWMlFvBX+LJMoMU93OYE0RiSgFDkjQnuzCq6lJb
 IFAsRSwun5HtvnCXFpWHA5d+uEsbF1uvrtGfDbO/t9t+QsF6nrBvyVxPVLsyDxCwtHEI
 7wOaS/ixMq97/nRn0ohOh00uYY6G2u1K6bMehv0eBKbdMmw21u6e++JaDY+Y/a6lixim
 GehA==
X-Gm-Message-State: APjAAAVZg1QWQcVmw3sw933mSmx6WPB/VLrNWXglGtW6O9BdBZCCs+5C
 Xo3LIHBhTS6FlR8I5J1ZDfm8dA==
X-Google-Smtp-Source: APXvYqzUHOb4VtJencGcx41aqOHHoNwcDiffGcfqaDDdYTWrPV9XhElqMpS0fUjS81CjEO5luRHFeQ==
X-Received: by 2002:a17:902:d916:: with SMTP id
 c22mr34327398plz.195.1559965689632; 
 Fri, 07 Jun 2019 20:48:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l13sm3156889pjq.20.2019.06.07.20.48.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:48:08 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:48:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 03/16] lib, arm64: untag user pointers in strn*_user
Message-ID: <201906072047.50371DBE2@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <14f17ef1902aa4f07a39f96879394e718a1f5dc1.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14f17ef1902aa4f07a39f96879394e718a1f5dc1.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RNlIE7RpVdU5f0iicQk2k5+1DUNsXJMHiELoWiOeeG4=;
 b=D3MmOWnYob5UGtglFoMh75eVVkGVzLzcVT66trF4Vmsjdvy86taKH6QFas2mfzRzwj
 M8+OanNKrPI4fOGoGPo9/Uo5q+LH1LQX0K1IVkP72ijXTjagsPaUUaKA337dIrVp0dDF
 lHdVQs6LUPfUrx+oo7yXpxf993QJ3yfDpOh+8=
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDVQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gc3RybmNweV9mcm9tX3VzZXIgYW5kIHN0cm5s
ZW5fdXNlciBhY2NlcHQgdXNlciBhZGRyZXNzZXMgYXMgYXJndW1lbnRzLCBhbmQKPiBkbyBub3Qg
Z28gdGhyb3VnaCB0aGUgc2FtZSBwYXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNv
IGhlcmUgd2UKPiBuZWVkIHRvIGhhbmRsZSB0aGUgY2FzZSBvZiB0YWdnZWQgdXNlciBhZGRyZXNz
ZXMgc2VwYXJhdGVseS4KPiAKPiBVbnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBm
dW5jdGlvbnMuCj4gCj4gTm90ZSwgdGhhdCB0aGlzIHBhdGNoIG9ubHkgdGVtcG9yYXJpbHkgdW50
YWdzIHRoZSBwb2ludGVycyB0byBwZXJmb3JtCj4gdmFsaWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1
c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1lbW9yeSBhY2Nlc3Nlcy4KPiAKPiBSZXZp
ZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+CgpBY2tl
ZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAg
bGliL3N0cm5jcHlfZnJvbV91c2VyLmMgfCAzICsrLQo+ICBsaWIvc3Rybmxlbl91c2VyLmMgICAg
ICB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvc3RybmNweV9mcm9tX3VzZXIuYyBiL2xpYi9zdHJu
Y3B5X2Zyb21fdXNlci5jCj4gaW5kZXggMDIzYmE5ZjNiOTlmLi5kY2NiOTVhZjYwMDMgMTAwNjQ0
Cj4gLS0tIGEvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMKPiArKysgYi9saWIvc3RybmNweV9mcm9t
X3VzZXIuYwo+IEBAIC02LDYgKzYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+
ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgo+
ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiAgCj4gICNpbmNsdWRlIDxhc20vYnl0ZW9yZGVyLmg+
Cj4gICNpbmNsdWRlIDxhc20vd29yZC1hdC1hLXRpbWUuaD4KPiBAQCAtMTA4LDcgKzEwOSw3IEBA
IGxvbmcgc3RybmNweV9mcm9tX3VzZXIoY2hhciAqZHN0LCBjb25zdCBjaGFyIF9fdXNlciAqc3Jj
LCBsb25nIGNvdW50KQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCW1heF9hZGRyID0gdXNlcl9hZGRy
X21heCgpOwo+IC0Jc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZylzcmM7Cj4gKwlzcmNfYWRkciA9
ICh1bnNpZ25lZCBsb25nKXVudGFnZ2VkX2FkZHIoc3JjKTsKPiAgCWlmIChsaWtlbHkoc3JjX2Fk
ZHIgPCBtYXhfYWRkcikpIHsKPiAgCQl1bnNpZ25lZCBsb25nIG1heCA9IG1heF9hZGRyIC0gc3Jj
X2FkZHI7Cj4gIAkJbG9uZyByZXR2YWw7Cj4gZGlmZiAtLWdpdCBhL2xpYi9zdHJubGVuX3VzZXIu
YyBiL2xpYi9zdHJubGVuX3VzZXIuYwo+IGluZGV4IDdmMmRiM2ZlMzExZi4uMjhmZjU1NGExYmU4
IDEwMDY0NAo+IC0tLSBhL2xpYi9zdHJubGVuX3VzZXIuYwo+ICsrKyBiL2xpYi9zdHJubGVuX3Vz
ZXIuYwo+IEBAIC0yLDYgKzIsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4gIAo+ICAjaW5jbHVkZSA8YXNtL3dvcmQtYXQtYS10aW1l
Lmg+Cj4gIAo+IEBAIC0xMDksNyArMTEwLDcgQEAgbG9uZyBzdHJubGVuX3VzZXIoY29uc3QgY2hh
ciBfX3VzZXIgKnN0ciwgbG9uZyBjb3VudCkKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAltYXhfYWRk
ciA9IHVzZXJfYWRkcl9tYXgoKTsKPiAtCXNyY19hZGRyID0gKHVuc2lnbmVkIGxvbmcpc3RyOwo+
ICsJc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHN0cik7Cj4gIAlpZiAo
bGlrZWx5KHNyY19hZGRyIDwgbWF4X2FkZHIpKSB7Cj4gIAkJdW5zaWduZWQgbG9uZyBtYXggPSBt
YXhfYWRkciAtIHNyY19hZGRyOwo+ICAJCWxvbmcgcmV0dmFsOwo+IC0tIAo+IDIuMjIuMC5yYzEu
MzExLmc1ZDc1NzNhMTUxLWdvb2cKPiAKCi0tIApLZWVzIENvb2sKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
