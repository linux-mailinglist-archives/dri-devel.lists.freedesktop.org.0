Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E235245E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F5889F5B;
	Tue, 25 Jun 2019 07:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EE6D89D87;
 Mon, 24 Jun 2019 17:38:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25282C0A;
 Mon, 24 Jun 2019 10:38:13 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 7895D3F718; Mon, 24 Jun 2019 10:38:08 -0700 (PDT)
Date: Mon, 24 Jun 2019 18:38:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <20190624173805.GK29120@arrakis.emea.arm.com>
References: <cover.1561386715.git.andreyknvl@google.com>
 <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzM6MDBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
YXJtNjQvdGFnc190ZXN0LmMKPiBAQCAtMCwwICsxLDI5IEBACj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCj4gKwo+ICsjaW5jbHVkZSA8c3RkaW8uaD4KPiArI2luY2x1ZGUg
PHN0ZGxpYi5oPgo+ICsjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gKyNpbmNsdWRlIDxzdGRpbnQuaD4K
PiArI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgo+ICsjaW5jbHVkZSA8c3lzL3V0c25hbWUuaD4KPiAr
Cj4gKyNkZWZpbmUgU0hJRlRfVEFHKHRhZykJCSgodWludDY0X3QpKHRhZykgPDwgNTYpCj4gKyNk
ZWZpbmUgU0VUX1RBRyhwdHIsIHRhZykJKCgodWludDY0X3QpKHB0cikgJiB+U0hJRlRfVEFHKDB4
ZmYpKSB8IFwKPiArCQkJCQlTSElGVF9UQUcodGFnKSkKPiArCj4gK2ludCBtYWluKHZvaWQpCj4g
K3sKPiArCXN0YXRpYyBpbnQgdGJpX2VuYWJsZWQgPSAwOwo+ICsJc3RydWN0IHV0c25hbWUgKnB0
ciwgKnRhZ2dlZF9wdHI7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCWlmIChwcmN0bChQUl9TRVRfVEFH
R0VEX0FERFJfQ1RSTCwgUFJfVEFHR0VEX0FERFJfRU5BQkxFLCAwLCAwLCAwKSA9PSAwKQo+ICsJ
CXRiaV9lbmFibGVkID0gMTsKCk5pdHBpY2s6IHdpdGggdGhlIGxhdGVzdCBwcmN0bCgpIHBhdGNo
LCB5b3UgY2FuIHNraXAgdGhlIGxhc3QgdGhyZWUKYXJndW1lbnRzIGFzIHRoZXkgYXJlIGlnbm9y
ZWQuCgpFaXRoZXIgd2F5OgoKUmV2aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
