Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F48F26B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 19:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896D88800B;
	Thu, 15 Aug 2019 17:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC9A6EA0A;
 Thu, 15 Aug 2019 17:39:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 500082A09BD;
 Thu, 15 Aug 2019 17:39:26 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90D51841D7;
 Thu, 15 Aug 2019 17:39:24 +0000 (UTC)
Date: Thu, 15 Aug 2019 13:39:22 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815173922.GH30916@redhat.com>
References: <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
 <20190815151028.GJ21596@ziepe.ca>
 <CAKMK7uG33FFCGJrDV4-FHT2FWi+Z5SnQ7hoyBQd4hignzm1C-A@mail.gmail.com>
 <20190815173557.GN21596@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815173557.GN21596@ziepe.ca>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 15 Aug 2019 17:39:26 +0000 (UTC)
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDI6MzU6NTdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA2OjI1OjE2UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gCj4gPiBJJ20gbm90IHJlYWxseSB3ZWxsIHZlcnNlZCBpbiB0aGUg
ZGV0YWlscyBvZiBvdXIgdXNlcnB0ciwgYnV0IGJvdGgKPiA+IGFtZGdwdSBhbmQgaTkxNSB3YWl0
IGZvciB0aGUgZ3B1IHRvIGNvbXBsZXRlIGZyb20KPiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQu
IEplcm9tZSBoYXMgYXQgbGVhc3QgbG9va2VkIGEgbG90IGF0IHRoZSBhbWRncHUKPiA+IG9uZSwg
c28gbWF5YmUgaGUgY2FuIGV4cGxhaW4gd2hhdCBleGFjdGx5IGl0IGlzIHdlJ3JlIGRvaW5nIC4u
Lgo+IAo+IGFtZGdwdSBpcyAod3JvbmdseSkgdXNpbmcgaG1tIGZvciBzb21ldGhpbmcsIEkgY2Fu
J3QgcmVhbGx5IHRlbGwgd2hhdAo+IGl0IGlzIHRyeWluZyB0byBkby4gVGhlIGNhbGxzIHRvIGRt
YV9mZW5jZSB1bmRlciB0aGUKPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGRvIG5vdCBnaXZlIG1l
IGEgZ29vZCBmZWVsaW5nLgo+IAo+IEhvd2V2ZXIsIGk5MTUgc2hvd3MgYWxsIHRoZSBzaWducyBv
ZiB0cnlpbmcgdG8gZm9sbG93IHRoZSByZWdpc3RyYXRpb24KPiBjYWNoZSBtb2RlbCwgaXQgZXZl
biBoYXMgYSBuaWNlIGNvbW1lbnQgaW4KPiBpOTE1X2dlbV91c2VycHRyX2dldF9wYWdlcygpIGV4
cGxhaW5pbmcgdGhhdCB0aGUgcmFjZXMgaXQgaGFzIGRvbid0Cj4gbWF0dGVyIGJlY2F1c2UgaXQg
aXMgYSB1c2VyIHNwYWNlIGJ1ZyB0byBjaGFuZ2UgdGhlIFZBIG1hcHBpbmcgaW4gdGhlCj4gZmly
c3QgcGxhY2UuIFRoYXQganVzdCBzY3JlYW1zIHJlZ2lzdHJhdGlvbiBjYWNoZSB0byBtZS4KPiAK
PiBTbyBpdCBpcyBmaW5lIHRvIHJ1biBIVyB0aGF0IHdheSwgYnV0IGlmIHlvdSBkbywgdGhlcmUg
aXMgbm8gcmVhc29uIHRvCj4gZmVuY2UgaW5zaWRlIHRoZSBpbnZhbGlkYXRlX3JhbmdlIGVuZC4g
SnVzdCBvcnBoYW4gdGhlIERNQSBidWZmZXIgYW5kCj4gY2xlYW4gaXQgdXAgJiByZWxlYXNlIHRo
ZSBwYWdlIHBpbnMgd2hlbiBhbGwgRE1BIGJ1ZmZlciByZWZzIGdvIHRvCj4gemVyby4gVGhlIG5l
eHQgYWNjZXNzIHRvIHRoYXQgVkEgc2hvdWxkIGdldCBhIG5ldyBETUEgYnVmZmVyIHdpdGggdGhl
Cj4gcmlnaHQgbWFwcGluZy4KPiAKPiBJbiBvdGhlciB3b3JkcyB0aGUgaW52YWxpZGF0aW9uIHNo
b3VsZCBiZSB2ZXJ5IHNpbXBsZSB3aXRob3V0Cj4gY29tcGxpY2F0ZWQgbG9ja2luZywgb3Igd2Fp
dF9ldmVudCdzLiBMb29rIGF0IGhmaTEgZm9yIGV4YW1wbGUuCgpUaGlzIHdvdWxkIGJyZWFrIHRo
ZSB0b2RheSB1c2FnZSBtb2RlbCBvZiB1cHRyIGFuZCBpdCB3aWxsCmJyZWFrIHVzZXJzcGFjZSBl
eHBlY3RhdGlvbiBpZSBpZiBHUFUgaXMgd3JpdHRpbmcgdG8gdGhhdAptZW1vcnkgYW5kIHRoYXQg
bWVtb3J5IHRoZW4gdGhlIHVzZXJzcGFjZSB3YW50IHRvIG1ha2Ugc3VyZQp0aGF0IGl0IHdpbGwg
c2VlIHdoYXQgdGhlIEdQVSB3cml0ZS4KClllcyBpOTE1IGlzIGJyb2tlbiBpbiByZXNwZWN0IHRv
IG5vdCBoYXZpbmcgYSBlbmQgbm90aWZpZXIKYW5kIHRyYWNraW5nIGFjdGl2ZSBpbnZhbGlkYXRp
b24gZm9yIGEgcmFuZ2UgYnV0IHRoZSBHVVAKc2lkZSBvZiB0aGluZyBraW5kIG9mIGhpZGUgdGhp
cyBidWcgYW5kIGl0IHNocmlua3MgdGhlIHdpbmRvdwpmb3IgYmFkIHRvIGhhcHBlbiB0byBzb21l
dGhpbmcgc28gc21hbGwgdGhhdCBpIGRvdWJ0IGFueW9uZQpjb3VsZCBldmVyIGhpdCBpdCAoc3Rp
bGwgYSBidWcgdGhvdWdodCkuCgpDaGVlcnMsCkrDqXLDtG1lCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
