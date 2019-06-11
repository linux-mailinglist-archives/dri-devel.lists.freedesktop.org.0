Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559C41CE5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0655789307;
	Wed, 12 Jun 2019 06:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17F51891E2;
 Tue, 11 Jun 2019 15:01:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFDBE346;
 Tue, 11 Jun 2019 08:01:29 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 103473F246; Tue, 11 Jun 2019 08:01:24 -0700 (PDT)
Date: Tue, 11 Jun 2019 16:01:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 16/16] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <20190611150122.GB63588@arrakis.emea.arm.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MThQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIGEgc2ltcGxlIHRl
c3QsIHRoYXQgY2FsbHMgdGhlIHVuYW1lIHN5c2NhbGwgd2l0aCBhCj4gdGFnZ2VkIHVzZXIgcG9p
bnRlciBhcyBhbiBhcmd1bWVudC4gV2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQK
PiB1c2VyIHBvaW50ZXJzIHRoZSB0ZXN0IGZhaWxzIHdpdGggRUZBVUxULgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KCkJUVywgeW91
IGNvdWxkIGFkZAoKQ28tZGV2ZWxvcGVkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgoKc2luY2UgSSB3cm90ZSB0aGUgbWFsbG9jKCkgZXRjLiBob29rcy4KCgo+
ICtzdGF0aWMgdm9pZCAqdGFnX3B0cih2b2lkICpwdHIpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcg
dGFnID0gcmFuZCgpICYgMHhmZjsKPiArCWlmICghcHRyKQo+ICsJCXJldHVybiBwdHI7Cj4gKwly
ZXR1cm4gKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpcHRyIHwgKHRhZyA8PCBUQUdfU0hJRlQpKTsK
PiArfQoKV2l0aCB0aGUgcHJjdGwoKSBvcHRpb24sIHRoaXMgZnVuY3Rpb24gYmVjb21lcyAoaWYg
eW91IGhhdmUgYSBiZXR0ZXIKaWRlYSwgZmluZSBieSBtZSk6CgotLS0tLS0tLS0tODwtLS0tLS0t
LS0tLS0tLS0KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3lzL3ByY3RsLmg+CgojZGVm
aW5lIFRBR19TSElGVAkoNTYpCiNkZWZpbmUgVEFHX01BU0sJKDB4ZmZVTCA8PCBUQUdfU0hJRlQp
CgojZGVmaW5lIFBSX1NFVF9UQUdHRURfQUREUl9DVFJMCQk1NQojZGVmaW5lIFBSX0dFVF9UQUdH
RURfQUREUl9DVFJMCQk1NgojIGRlZmluZSBQUl9UQUdHRURfQUREUl9FTkFCTEUJCSgxVUwgPDwg
MCkKCnZvaWQgKl9fbGliY19tYWxsb2Moc2l6ZV90IHNpemUpOwp2b2lkIF9fbGliY19mcmVlKHZv
aWQgKnB0cik7CnZvaWQgKl9fbGliY19yZWFsbG9jKHZvaWQgKnB0ciwgc2l6ZV90IHNpemUpOwp2
b2lkICpfX2xpYmNfY2FsbG9jKHNpemVfdCBubWVtYiwgc2l6ZV90IHNpemUpOwoKc3RhdGljIHZv
aWQgKnRhZ19wdHIodm9pZCAqcHRyKQp7CglzdGF0aWMgaW50IHRhZ2dlZF9hZGRyX2VyciA9IDE7
Cgl1bnNpZ25lZCBsb25nIHRhZyA9IDA7CgoJaWYgKHRhZ2dlZF9hZGRyX2VyciA9PSAxKQoJCXRh
Z2dlZF9hZGRyX2VyciA9IHByY3RsKFBSX1NFVF9UQUdHRURfQUREUl9DVFJMLAoJCQkJCVBSX1RB
R0dFRF9BRERSX0VOQUJMRSwgMCwgMCwgMCk7CgoJaWYgKCFwdHIpCgkJcmV0dXJuIHB0cjsKCWlm
ICghdGFnZ2VkX2FkZHJfZXJyKQoJCXRhZyA9IHJhbmQoKSAmIDB4ZmY7CgoJcmV0dXJuICh2b2lk
ICopKCh1bnNpZ25lZCBsb25nKXB0ciB8ICh0YWcgPDwgVEFHX1NISUZUKSk7Cn0KCi0tIApDYXRh
bGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
