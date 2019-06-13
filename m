Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170D8455E2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F155E89780;
	Fri, 14 Jun 2019 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E71789B27;
 Thu, 13 Jun 2019 15:26:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A46BD3EF;
 Thu, 13 Jun 2019 08:26:49 -0700 (PDT)
Received: from C02TF0J2HF1T.local (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FA233F718;
 Thu, 13 Jun 2019 08:26:36 -0700 (PDT)
Date: Thu, 13 Jun 2019 16:26:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190613152632.GT28951@C02TF0J2HF1T.local>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613110235.GW28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613110235.GW28398@e103592.cambridge.arm.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCk9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDEyOjAyOjM1UE0gKzAxMDAsIERhdmUg
UCBNYXJ0aW4gd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6NDM6MjBQTSArMDIw
MCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ICsvKgo+ID4gKyAqIEdsb2JhbCBzeXNjdGwg
dG8gZGlzYWJsZSB0aGUgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHN1cHBvcnQuIFRoaXMgY29udHJv
bAo+ID4gKyAqIG9ubHkgcHJldmVudHMgdGhlIHRhZ2dlZCBhZGRyZXNzIEFCSSBlbmFibGluZyB2
aWEgcHJjdGwoKSBhbmQgZG9lcyBub3QKPiA+ICsgKiBkaXNhYmxlIGl0IGZvciB0YXNrcyB0aGF0
IGFscmVhZHkgb3B0ZWQgaW4gdG8gdGhlIHJlbGF4ZWQgQUJJLgo+ID4gKyAqLwo+ID4gK3N0YXRp
YyBpbnQgemVybzsKPiA+ICtzdGF0aWMgaW50IG9uZSA9IDE7Cj4gCj4gISEhCj4gCj4gQW5kIHRo
ZXNlIGNhbid0IGV2ZW4gYmUgY29uc3Qgd2l0aG91dCBhIGNhc3QuICBZdWsuCj4gCj4gKE5vdCB5
b3VyIGZhdWx0IHRob3VnaCwgYnV0IGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIHByb2NfZG9i
b29sKCkgdG8KPiBhdm9pZCB0aGlzLikKCkkgaGFkIHRoZSBzYW1lIHJlYWN0aW9uLiBNYXliZSBm
b3IgYW5vdGhlciBwYXRjaCBzYW5pdGlzaW5nIHRoaXMgcGF0dGVybgphY3Jvc3MgdGhlIGtlcm5l
bC4KCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaAo+ID4gKysrIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L3ByY3RsLmgKPiA+IEBAIC0yMjksNCArMjI5LDkgQEAgc3RydWN0IHByY3Rs
X21tX21hcCB7Cj4gPiAgIyBkZWZpbmUgUFJfUEFDX0FQREJLRVkJCQkoMVVMIDw8IDMpCj4gPiAg
IyBkZWZpbmUgUFJfUEFDX0FQR0FLRVkJCQkoMVVMIDw8IDQpCj4gPiAgCj4gPiArLyogVGFnZ2Vk
IHVzZXIgYWRkcmVzcyBjb250cm9scyBmb3IgYXJtNjQgKi8KPiA+ICsjZGVmaW5lIFBSX1NFVF9U
QUdHRURfQUREUl9DVFJMCQk1NQo+ID4gKyNkZWZpbmUgUFJfR0VUX1RBR0dFRF9BRERSX0NUUkwJ
CTU2Cj4gPiArIyBkZWZpbmUgUFJfVEFHR0VEX0FERFJfRU5BQkxFCQkoMVVMIDw8IDApCj4gPiAr
Cj4gCj4gRG8gd2UgZXhwZWN0IHRoaXMgcHJjdGwgdG8gYmUgYXBwbGljYWJsZSB0byBvdGhlciBh
cmNoZXMsIG9yIGlzIGl0Cj4gc3RyaWN0bHkgYXJtNjQtc3BlY2lmaWM/CgpJIGtlcHQgaXQgZ2Vu
ZXJpYywgYXQgbGVhc3QgdGhlIHRhZ2dlZCBhZGRyZXNzIHBhcnQuIFRoZSBNVEUgYml0cyBsYXRl
cgpvbiB3b3VsZCBiZSBhcm02NC1zcGVjaWZpYy4KCj4gPiBAQCAtMjQ5Miw2ICsyNDk4LDE2IEBA
IFNZU0NBTExfREVGSU5FNShwcmN0bCwgaW50LCBvcHRpb24sIHVuc2lnbmVkIGxvbmcsIGFyZzIs
IHVuc2lnbmVkIGxvbmcsIGFyZzMsCj4gPiAgCQkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAgCQllcnJv
ciA9IFBBQ19SRVNFVF9LRVlTKG1lLCBhcmcyKTsKPiA+ICAJCWJyZWFrOwo+ID4gKwljYXNlIFBS
X1NFVF9UQUdHRURfQUREUl9DVFJMOgo+ID4gKwkJaWYgKGFyZzMgfHwgYXJnNCB8fCBhcmc1KQo+
IAo+IDxiaWtlc2hlZD4KPiAKPiBIb3cgZG8geW91IGFudGljaXBhdGUgdGhlc2UgYXJndW1lbnRz
IGJlaW5nIHVzZWQgaW4gdGhlIGZ1dHVyZT8KCkkgZG9uJ3QgZXhwZWN0IHRoZW0gdG8gYmUgdXNl
ZCBhdCBhbGwuIEJ1dCBzaW5jZSBJJ20gbm90IHN1cmUsIEknZCBmb3JjZQp0aGVtIGFzIHplcm8g
Zm9yIG5vdyByYXRoZXIgdGhhbiBpZ25vcmVkLiBUaGUgR0VUIGlzIHN1cHBvc2VkIHRvIHJldHVy
bgp0aGUgU0VUIGFyZzIsIGhlbmNlIEknZCByYXRoZXIgbm90IHVzZWQgdGhlIG90aGVyIGFyZ3Vt
ZW50cy4KCj4gRm9yIHRoZSBTVkUgcHJjdGxzIEkgdG9vayB0aGUgdmlldyB0aGF0ICJnZXQiIGNv
dWxkIG9ubHkgZXZlciBtZWFuIG9uZQo+IHRoaW5nLCBhbmQgInB1dCIgYWxyZWFkeSBoYWQgYSBm
bGFncyBhcmd1bWVudCB3aXRoIHNwYXJlIGJpdHMgZm9yIGZ1dHVyZQo+IGV4cGFuc2lvbiBhbnl3
YXksIHNvIGZvcmNpbmcgdGhlIGV4dHJhIGFyZ3VtZW50cyB0byB6ZXJvIHdvdWxkIGJlCj4gdW5u
ZWNlc3NhcnkuCj4gCj4gT3BpbmlvbnMgc2VlbSB0byBkaWZmZXIgb24gd2hldGhlciByZXF1aXJp
bmcgc3VycGx1cyBhcmd1bWVudHMgdG8gYmUgMAo+IGlzIGJlbmVmaWNpYWwgZm9yIGh5Z2llbmUs
IGJ1dCB0aGUgZ2xpYmMgcHJvdG90eXBlIGZvciBwcmN0bCgpIGlzCj4gCj4gCWludCBwcmN0bCAo
aW50IF9fb3B0aW9uLCAuLi4pOwo+IAo+IHNvIGl0IHNlZW1lZCBhbm5veWluZyB0byBoYXZlIHRv
IHBhc3MgZXh0cmEgYXJndW1lbnRzIHRvIGl0IGp1c3QgZm9yIHRoZQo+IHNha2Ugb2YgaXQuICBJ
TUhPIHRoaXMgYWxzbyBtYWtlcyB0aGUgY29kZSBhdCB0aGUgY2FsbCBzaXRlIGxlc3MKPiByZWFk
YWJsZSwgc2luY2UgaXQncyBub3QgaW1tZWRpYXRlbHkgYXBwYXJlbnQgdGhhdCBhbGwgdGhvc2Ug
MHMgYXJlCj4gbWVhbmluZ2xlc3MuCgpJdCdzIGZpbmUgYnkgbWUgdG8gaWdub3JlIHRoZSBvdGhl
ciBhcmd1bWVudHMuIEkganVzdCBmb2xsb3dlZCB0aGUKcGF0dGVybiBvZiBzb21lIGV4aXN0aW5n
IHByY3RsIG9wdGlvbnMuIEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uCmVpdGhlciB3YXku
Cgo+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4gKwkJZXJyb3IgPSBTRVRfVEFHR0VEX0FERFJf
Q1RSTChhcmcyKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIFBSX0dFVF9UQUdHRURfQUREUl9D
VFJMOgo+ID4gKwkJaWYgKGFyZzIgfHwgYXJnMyB8fCBhcmc0IHx8IGFyZzUpCj4gPiArCQkJcmV0
dXJuIC1FSU5WQUw7Cj4gPiArCQllcnJvciA9IEdFVF9UQUdHRURfQUREUl9DVFJMKCk7Cj4gCj4g
SGF2aW5nIGEgImdldCIgcHJjdGwgaXMgcHJvYmFibHkgYSBnb29kIGlkZWEsIGJ1dCBpcyB0aGVy
ZSBhIGNsZWFyCj4gdXNlY2FzZSBmb3IgaXQ/CgpOb3Qgc3VyZSwgbWF5YmUgc29tZSBvdGhlciBs
aWJyYXJ5IChlLmcuIGEgSklUIGNvbXBpbGVyKSB3b3VsZCBsaWtlIHRvCmNoZWNrIHdoZXRoZXIg
dGFnZ2VkIGFkZHJlc3NlcyBoYXZlIGJlZW4gZW5hYmxlZCBkdXJpbmcgYXBwbGljYXRpb24Kc3Rh
cnQgYW5kIGRlY2lkZSB0byBnZW5lcmF0ZSB0YWdnZWQgcG9pbnRlcnMgZm9yIGl0c2VsZi4gSXQg
c2VlbWVkCnByZXR0eSBoYXJtbGVzcywgdW5sZXNzIHdlIGFkZCBtb3JlIGNvbXBsZXggdGhpbmdz
IHRvIHRoZSBwcmN0bCgpIHRoYXQKY2Fubm90IGJlIHJldHVybmVkIGluIG9uZSByZXF1ZXN0KS4K
Ci0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
