Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D281362
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F856E2BD;
	Mon,  5 Aug 2019 07:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E4AE6EDB6;
 Fri,  2 Aug 2019 10:20:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E44A3344;
 Fri,  2 Aug 2019 03:20:38 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 26BB63F71F; Fri,  2 Aug 2019 03:20:34 -0700 (PDT)
Date: Fri, 2 Aug 2019 11:20:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190802102031.GB4175@arrakis.emea.arm.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <8c618cc9-ae68-9769-c5bb-67f1295abc4e@intel.com>
 <13b4cf53-3ecb-f7e7-b504-d77af15d77aa@arm.com>
 <CAAeHK+zTFqsLiB3Wf0bAi5A8ukQX5ZuvfUg4td-=r5UhBsUBOQ@mail.gmail.com>
 <96fd8da4-a912-f6cc-2b32-5791027dbbd5@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96fd8da4-a912-f6cc-2b32-5791027dbbd5@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
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
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
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

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDg6MzY6NDdBTSAtMDcwMCwgRGF2ZSBIYW5zZW4gd3Jv
dGU6Cj4gT24gOC8xLzE5IDU6NDggQU0sIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBU
aHUsIEF1ZyAxLCAyMDE5IGF0IDI6MTEgUE0gS2V2aW4gQnJvZHNreSA8a2V2aW4uYnJvZHNreUBh
cm0uY29tPiB3cm90ZToKPiA+PiBPbiAzMS8wNy8yMDE5IDE3OjUwLCBEYXZlIEhhbnNlbiB3cm90
ZToKPiA+Pj4gT24gNy8yMy8xOSAxMDo1OCBBTSwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+
Pj4+IFRoZSBtbWFwIGFuZCBtcmVtYXAgKG9ubHkgbmV3X2FkZHIpIHN5c2NhbGxzIGRvIG5vdCBj
dXJyZW50bHkgYWNjZXB0Cj4gPj4+PiB0YWdnZWQgYWRkcmVzc2VzLiBBcmNoaXRlY3R1cmVzIG1h
eSBpbnRlcnByZXQgdGhlIHRhZyBhcyBhIGJhY2tncm91bmQKPiA+Pj4+IGNvbG91ciBmb3IgdGhl
IGNvcnJlc3BvbmRpbmcgdm1hLgo+ID4+Pgo+ID4+PiBXaGF0IHRoZSBoZWNrIGlzIGEgImJhY2tn
cm91bmQgY29sb3VyIj8gOikKPiA+Pgo+ID4+IEdvb2QgcG9pbnQsIHRoaXMgaXMgc29tZSBqYXJn
b24gdGhhdCB3ZSBzdGFydGVkIHVzaW5nIGZvciBNVEUsIHRoZSBpZGVhIGJlaW5nIHRoYXQKPiA+
PiB0aGUga2VybmVsIGNvdWxkIHNldCBhIHRhZyB2YWx1ZSAoc3BlY2lmaWVkIGR1cmluZyBtbWFw
KCkpIGFzICJiYWNrZ3JvdW5kIGNvbG91ciIgZm9yCj4gPj4gYW5vbnltb3VzIHBhZ2VzIGFsbG9j
YXRlZCBpbiB0aGF0IHJhbmdlLgo+ID4+Cj4gPj4gQW55d2F5LCB0aGlzIHBhdGNoIHNlcmllcyBp
cyBub3QgYWJvdXQgTVRFLiBBbmRyZXksIGZvciB2MjAgKGlmIGFueSksIEkgdGhpbmsgaXQncwo+
ID4+IGJlc3QgdG8gZHJvcCB0aGlzIGxhc3Qgc2VudGVuY2UgdG8gYXZvaWQgYW55IGNvbmZ1c2lv
bi4KCkluZGVlZCwgdGhlIHBhcnQgd2l0aCB0aGUgImJhY2tncm91bmQgY29sb3VyIiBhbmQgZXZl
biB0aGUgImN1cnJlbnRseSIKYWR2ZXJiIHNob3VsZCBiZSBkcm9wcGVkLgoKQWxzbywgaWYgd2Ug
bWVyZ2UgdGhlIHBhdGNoZXMgdmlhIGRpZmZlcmVudCB0cmVlcyBhbnl3YXksIEkgZG9uJ3QgdGhp
bmsKdGhlcmUgaXMgYSBuZWVkIGZvciBBbmRyZXkgdG8gaW50ZWdyYXRlIHRoZW0gd2l0aCBoaXMg
c2VyaWVzLiBXZSBjYW4KcGljayB0aGVtIHVwIGRpcmVjdGx5IGluIHRoZSBhcm02NCB0cmVlIChv
bmNlIHRoZSByZXZpZXcgZmluaXNoZWQpLgoKPiBPSywgYnV0IHdoYXQgZG9lcyB0aGF0IG1lYW4g
Zm9yIHRhZ2dlZCBhZGRyZXNzZXMgZ2V0dGluZyBwYXNzZWQgdG8KPiBtbWFwL21yZW1hcD8gIFRo
YXQgc2VudGVuY2UgcmVhZCB0byBtZSBsaWtlICJhcmNoaXRlY3R1cmVzIG1pZ2h0IGFsbG93Cj4g
dGFncyBmb3IgLi4uc29tZXRoaW5nLi4uIi4gIFNvIGRvIHdlIGFjY2VwdCB0YWdnZWQgYWRkcmVz
c2VzIGludG8gdGhvc2UKPiBzeXNjYWxscz8KCklmIG1tYXAoKSBkb2VzIG5vdCByZXR1cm4gYSB0
YWdnZWQgYWRkcmVzcywgdGhlIHJlYXNvbmluZyBpcyB0aGF0IGl0CnNob3VsZCBub3QgYWNjZXB0
IG9uZSBhcyBhbiBhZGRyZXNzIGhpbnQgKHdpdGggb3Igd2l0aG91dCBNQVBfRklYRUQpLgpOb3Rl
IHRoYXQgdGhlc2UgZG9jcyBzaG91bGQgb25seSBkZXNjcmliZSB0aGUgdG9wLWJ5dGUtaWdub3Jl
IEFCSSB3aGlsZQpsZWF2aW5nIHRoZSBtZW1vcnkgdGFnZ2luZyBmb3IgYSBmdXR1cmUgcGF0Y2hz
ZXQuCgpJbiB0aGF0IGZ1dHVyZSBwYXRjaHNldCwgd2UgbWF5IHdhbnQgdG8gdXBkYXRlIHRoZSBt
bWFwKCkgQUJJIHRvIGFsbG93LApvbmx5IGluIGNvbmp1bmN0aW9uIHdpdGggUFJPVF9NVEUsIGEg
dGFnZ2VkIHBvaW50ZXIgYXMgYW4gYWRkcmVzcwphcmd1bWVudC4gSW4gc3VjaCBjYXNlIG1tYXAo
KSB3aWxsIHJldHVybiBhIHRhZ2dlZCBhZGRyZXNzIGFuZCB0aGUgcGFnZXMKcHJlLWNvbG91cmVk
IChvbiBmYXVsdCkgd2l0aCB0aGUgdGFnIHJlcXVlc3RlZCBieSB0aGUgdXNlci4gQXMgSSBzYWlk
LAp0aGF0J3MgdG8gYmUgZGlzY3Vzc2VkIGxhdGVyIGluIHRoZSB5ZWFyLgoKLS0gCkNhdGFsaW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
