Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4316D41CFA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E095C89332;
	Wed, 12 Jun 2019 06:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C8BF88FA6;
 Tue, 11 Jun 2019 17:50:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D236337;
 Tue, 11 Jun 2019 10:50:45 -0700 (PDT)
Received: from mbp (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18BF83F73C;
 Tue, 11 Jun 2019 10:50:39 -0700 (PDT)
Date: Tue, 11 Jun 2019 18:50:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 16/16] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <20190611175037.pflr6q6ob67zjj25@mbp>
References: <cover.1559580831.git.andreyknvl@google.com>
 <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
 <20190611150122.GB63588@arrakis.emea.arm.com>
 <CAAeHK+wZrVXxAnDXBjoUy8JK9iG553G2Bp8uPWQ0u1u5gts0vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+wZrVXxAnDXBjoUy8JK9iG553G2Bp8uPWQ0u1u5gts0vQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDc6MTg6MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCA1OjAxIFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gc3RhdGljIHZvaWQgKnRhZ19w
dHIodm9pZCAqcHRyKQo+ID4gewo+ID4gICAgICAgICBzdGF0aWMgaW50IHRhZ2dlZF9hZGRyX2Vy
ciA9IDE7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdGFnID0gMDsKPiA+Cj4gPiAgICAgICAg
IGlmICh0YWdnZWRfYWRkcl9lcnIgPT0gMSkKPiA+ICAgICAgICAgICAgICAgICB0YWdnZWRfYWRk
cl9lcnIgPSBwcmN0bChQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTCwKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBQUl9UQUdHRURfQUREUl9FTkFCTEUsIDAsIDAsIDAp
Owo+IAo+IEkgdGhpbmsgdGhpcyByZXF1aXJlcyBhdG9taWNzLiBtYWxsb2MoKSBjYW4gYmUgY2Fs
bGVkIGZyb20gbXVsdGlwbGUgdGhyZWFkcy4KCkl0J3Mgc2xpZ2h0bHkgcmFjeSBidXQgSSBhc3N1
bWUgaW4gYSByZWFsIGxpYmMgaXQgY2FuIGJlIGluaXRpYWxpc2VkCmVhcmxpZXIgdGhhbiB0aGUg
aG9vayBjYWxscyB3aGlsZSBzdGlsbCBpbiBzaW5nbGUtdGhyZWFkZWQgbW9kZSAoSSBoYWQKYSBx
dWljayBhdHRlbXB0IHdpdGggX19hdHRyaWJ1dGVfXygoY29uc3RydWN0b3IpKSBidXQgZGlkbid0
IGdldCBmYXIpLgoKRXZlbiB3aXRoIHRoZSByYWNlLCB1bmRlciBub3JtYWwgY2lyY3Vtc3RhbmNl
cyBjYWxsaW5nIHRoZSBwcmN0bCgpIHR3aWNlCmlzIG5vdCBhIHByb2JsZW0uIEkgdGhpbmsgdGhl
IHJpc2sgaGVyZSBpcyB0aGF0IHNvbWVvbmUgZGlzYWJsZXMgdGhlIEFCSQp2aWEgc3lzY3RsIGFu
ZCB0aGUgQUJJIGlzIGVuYWJsZWQgZm9yIHNvbWUgb2YgdGhlIHRocmVhZHMgb25seS4KCi0tIApD
YXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
