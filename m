Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF041CD0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B1B8929D;
	Wed, 12 Jun 2019 06:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94FF889166;
 Tue, 11 Jun 2019 17:44:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFAB0337;
 Tue, 11 Jun 2019 10:44:55 -0700 (PDT)
Received: from mbp (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF5C63F73C;
 Tue, 11 Jun 2019 10:44:50 -0700 (PDT)
Date: Tue, 11 Jun 2019 18:44:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 05/16] arm64: untag user pointers passed to memory
 syscalls
Message-ID: <20190611174448.exg2zycfqf4a2vea@mbp>
References: <cover.1559580831.git.andreyknvl@google.com>
 <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
 <20190610142824.GB10165@c02tf0j2hf1t.cambridge.arm.com>
 <CAAeHK+zBDB6i+iEw+TJY14gZeccvWeOBEaU+otn1F+jzDLaRpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+zBDB6i+iEw+TJY14gZeccvWeOBEaU+otn1F+jzDLaRpA@mail.gmail.com>
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDU6MzU6MzFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBNb24sIEp1biAxMCwgMjAxOSBhdCA0OjI4IFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMDMsIDIw
MTkgYXQgMDY6NTU6MDdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gVGhp
cyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5lbCBB
QkkgdG8gYWxsb3cgdG8KPiA+ID4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUg
dG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4gPiA+IHRoYW4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRhZ2dlZCBw
b2ludGVycyB0byBiZSBwYXNzZWQgdG8gdGhlIGZvbGxvd2luZyBtZW1vcnkKPiA+ID4gc3lzY2Fs
bHM6IGdldF9tZW1wb2xpY3ksIG1hZHZpc2UsIG1iaW5kLCBtaW5jb3JlLCBtbG9jaywgbWxvY2sy
LCBtcHJvdGVjdCwKPiA+ID4gbXJlbWFwLCBtc3luYywgbXVubG9jay4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4K
PiA+IEkgd291bGQgYWRkIGluIHRoZSBjb21taXQgbG9nIChhbmQgcG9zc2libHkgaW4gdGhlIGNv
ZGUgd2l0aCBhIGNvbW1lbnQpCj4gPiB0aGF0IG1yZW1hcCgpIGFuZCBtbWFwKCkgZG8gbm90IGN1
cnJlbnRseSBhY2NlcHQgdGFnZ2VkIGhpbnQgYWRkcmVzc2VzLgo+ID4gQXJjaGl0ZWN0dXJlcyBt
YXkgaW50ZXJwcmV0IHRoZSBoaW50IHRhZyBhcyBhIGJhY2tncm91bmQgY29sb3VyIGZvciB0aGUK
PiA+IGNvcnJlc3BvbmRpbmcgdm1hLiBXaXRoIHRoaXM6Cj4gCj4gSSdsbCBjaGFuZ2UgdGhlIGNv
bW1pdCBsb2cuIFdoZXJlIGRvIHlvdSB5b3UgdGhpbmsgSSBzaG91bGQgcHV0IHRoaXMKPiBjb21t
ZW50PyBCZWZvcmUgbW1hcCBhbmQgbXJlbWFwIGRlZmluaXRpb25zIGluIG1tLz8KCk9uIGFybTY0
IHdlIHVzZSBvdXIgb3duIHN5c19tbWFwKCkuIEknZCBzYXkganVzdCBhZGQgYSBjb21tZW50IG9u
IHRoZQpnZW5lcmljIG1yZW1hcCgpIGp1c3QgYmVmb3JlIHRoZSB1bnRhZ2dlZF9hZGRyKCkgYWxv
bmcgdGhlIGxpbmVzIHRoYXQKbmV3X2FkZHJlc3MgaXMgbm90IHVudGFnZ2VkIGZvciBwcmVzZXJ2
aW5nIHNpbWlsYXIgYmVoYXZpb3VyIHRvIG1tYXAoKS4KCi0tIApDYXRhbGluCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
