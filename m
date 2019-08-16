Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848118FDC8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 10:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6050C6E2A5;
	Fri, 16 Aug 2019 08:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6225D6E2A5;
 Fri, 16 Aug 2019 08:27:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E376FAFC3;
 Fri, 16 Aug 2019 08:27:39 +0000 (UTC)
Date: Fri, 16 Aug 2019 10:27:38 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816082738.GC27790@dhcp22.suse.cz>
References: <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDE1LTA4LTE5IDIyOjE2OjQzLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFRodSwg
QXVnIDE1LCAyMDE5IGF0IDk6MzUgUE0gTWljaGFsIEhvY2tvIDxtaG9ja29Aa2VybmVsLm9yZz4g
d3JvdGU6ClsuLi5dCj4gPiA+IFRoZSBsYXN0IGRldGFpbCBpcyBJJ20gc3RpbGwgdW5jbGVhciB3
aGF0IGEgR0ZQIGZsYWdzIGEgYmxvY2thYmxlCj4gPiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQo
KSBzaG91bGQgdXNlLiBJcyBHRlBfS0VSTkVMIE9LPwo+ID4KPiA+IEkgaG9wZSBJIHdpbGwgbm90
IG1ha2UgdGhpcyBtdWRkeSBhZ2FpbiA7KQo+ID4gaW52YWxpZGF0ZV9yYW5nZV9zdGFydCBpbiB0
aGUgYmxvY2thYmxlIG1vZGUgY2FuIHVzZS9kZXBlbmQgb24gYW55IHNsZWVwYWJsZQo+ID4gYWxs
b2NhdGlvbiBhbGxvd2VkIGluIHRoZSBjb250ZXh0IGl0IGlzIGNhbGxlZCBmcm9tLiBTbyBpbiBv
dGhlciB3b3Jkcwo+ID4gaXQgaXMgbm8gZGlmZmVyZW50IGZyb20gYW55IG90aGVyIGZ1bmN0aW9u
IGluIHRoZSBrZXJuZWwgdGhhdCBjYWxscyBpbnRvCj4gPiBhbGxvY2F0b3IuIEFzIHRoZSBBUEkg
aXMgbWlzc2luZyBnZnAgY29udGV4dCB0aGVuIEkgaG9wZSBpdCBpcyBub3QKPiA+IGNhbGxlZCBm
cm9tIGFueSByZXN0cmljdGVkIGNvbnRleHRzIChleGNlcHQgZnJvbSB0aGUgb29tIHdoaWNoIHdl
IGhhdmUKPiA+ICFibG9ja2FibGUgZm9yKS4KPiAKPiBIbSwgdGhhdCdzIG5ldyB0byBtZS4gSSB0
aG91Z2h0IG1tdSBub3RpZmllcnMgdmVyeSBtdWNoIGNhbiBiZSBjYWxsZWQKPiBmcm9tIGRpcmVj
dCByZWNsYWltIHBhdGhzLCBzbyB5b3UgaGF2ZSB0byBiZSBleHRyZW1lbHkgY2FyZWZ1bCB3aXRo
Cj4gZ2V0dGluZyBiYWNrIGludG8gdGhhdCBvbmUuCgpDb3JyZWN0LCBJIHNob3VsZCBoYXZlIGFk
ZGVkIHRoYXQgbm90aWZpZXIgY2FsbGJhY2tzIGlkZWFsbHkgZG8gbm90CmFsbG9jYXRlIGFueSBt
ZW1vcnkuIFRoZXkgY2FuIGJsb2NrIGFuZCBldmVuIHRoYXQgaXMgcXVpdGUgYSBwYWluIHRvIGJl
CmhvbmVzdC4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
