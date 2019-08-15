Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C2F8F1A7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 19:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368D26E9FE;
	Thu, 15 Aug 2019 17:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46F6E9FD;
 Thu, 15 Aug 2019 17:12:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 732FD30832E1;
 Thu, 15 Aug 2019 17:12:00 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9562687A9;
 Thu, 15 Aug 2019 17:11:58 +0000 (UTC)
Date: Thu, 15 Aug 2019 13:11:56 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815171156.GB30916@redhat.com>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815165631.GK21596@ziepe.ca>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 15 Aug 2019 17:12:00 +0000 (UTC)
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
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDE6NTY6MzFQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA2OjAwOjQxUE0gKzAyMDAsIE1pY2hh
bCBIb2NrbyB3cm90ZToKPiAKPiA+ID4gQUZBSUsgJ0dGUF9OT1dBSVQnIGlzIGNoYXJhY3Rlcml6
ZWQgYnkgdGhlIGxhY2sgb2YgX19HRlBfRlMgYW5kCj4gPiA+IF9fR0ZQX0RJUkVDVF9SRUNMQUlN
Li4KPiA+ID4KPiA+ID4gVGhpcyBtYXRjaGVzIHRoZSBleGlzdGluZyB0ZXN0IGluIF9fbmVlZF9m
c19yZWNsYWltKCkgLSBzbyBpZiB5b3UgYXJlCj4gPiA+IE9LIHdpdGggR0ZQX05PRlMsIGFrYSBf
X0dGUF9JTyB3aGljaCB0cmlnZ2VycyB0cnlfdG9fY29tcGFjdF9wYWdlcygpLAo+ID4gPiBhbGxv
Y2F0aW9ucyBkdXJpbmcgT09NLCB0aGVuIEkgdGhpbmsgZnNfcmVjbGFpbSBhbHJlYWR5IG1hdGNo
ZXMgd2hhdAo+ID4gPiB5b3UgZGVzY3JpYmVkPwo+ID4gCj4gPiBObyBHRlBfTk9GUyBpcyBlcXVh
bGx5IGJhZC4gUGxlYXNlIHJlYWQgbXkgb3RoZXIgZW1haWwgZXhwbGFpbmluZyB3aGF0Cj4gPiB0
aGUgb29tX3JlYXBlciBhY3R1YWxseSByZXF1aXJlcy4gSW4gc2hvcnQgbm8gYmxvY2tpbmcgb24g
ZGlyZWN0IG9yCj4gPiBpbmRpcmVjdCBkZXBlbmRlY3kgb24gbWVtb3J5IGFsbG9jYXRpb24gdGhh
dCBtaWdodCBzbGVlcC4KPiAKPiBJdCBpcyBtdWNoIGVhc2llciB0byBmb2xsb3cgd2l0aCBzb21l
IGhpbnRzIG9uIGNvZGUsIHNvIHRoZSB0cnVlCj4gcmVxdWlyZW1lbnQgaXMgdGhhdCB0aGUgT09N
IHJlcGVhciBub3QgYmxvY2sgb24gR0ZQX0ZTIGFuZCBHRlBfSU8KPiBhbGxvY2F0aW9ucywgZ3Jl
YXQsIHRoYXQgY29uc3RyYWludCBpcyBub3cgY2xlYXIuCj4gCj4gPiBJZiB5b3UgY2FuIGV4cHJl
c3MgdGhhdCBpbiB0aGUgZXhpc3RpbmcgbG9ja2RlcCBtYWNoaW5lcnkuIEFsbAo+ID4gZmluZS4g
QnV0IHRoZW4gY29uc2lkZXIgZGVwbG95bWVudHMgd2hlcmUgbG9ja2RlcCBpcyBuby1ubyBiZWNh
dXNlCj4gPiBvZiB0aGUgb3ZlcmhlYWQuCj4gCj4gVGhpcyBpcyBhbGwgZm9yIGRyaXZlciBkZWJ1
Z2dpbmcuIFRoZSBwb2ludCBvZiBsb2NrZGVwIGlzIHRvIGZpbmQgYWxsCj4gdGhlc2UgcGF0aHMg
d2l0aG91dCBoYXZlIHRvIGhpdCB0aGVtIGFzIGFjdHVhbCByYWNlcywgdXNpbmcgZGVidWcKPiBr
ZXJuZWxzLgo+IAo+IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0aGlzIGtpbmQgb2YgZGVidWdnaW5n
IG9uIHByb2R1Y3Rpb24ga2VybmVscz8KPiAKPiA+ID4gVGhlIGJlc3Qgd2UgZ290IHdhcyBkcml2
ZXJzIHRlc3RlZCB0aGUgVkEgcmFuZ2UgYW5kIHJldHVybmVkIHN1Y2Nlc3MKPiA+ID4gaWYgdGhl
eSBoYWQgbm8gaW50ZXJlc3QuIFdoaWNoIGlzIGEgYmlnIHdpbiB0byBiZSBzdXJlLCBidXQgaXQg
bG9va3MKPiA+ID4gbGlrZSBnZXR0aW5nIGFueSBtb3JlIGlzIG5vdCByZWFsbHkgcG9zc3NpYmxl
Lgo+ID4gCj4gPiBBbmQgdGhhdCBpcyBhbHJlYWR5IGEgZ3JlYXQgd2luISBCZWNhdXNlIG1hbnkg
bm90aWZpZXJzIG9ubHkgZG8gY2FyZQo+ID4gYWJvdXQgcGFydGljdWxhciBtYXBwaW5ncy4gUGxl
YXNlIG5vdGUgdGhhdCBiYWNraW5nIG9mZiB1bmNvbmRpdGlvYW5sbHkKPiA+IHdpbGwgc2ltcGx5
IGNhdXNlIHRoYXQgdGhlIG9vbSByZWFwZXIgd2lsbCBoYXZlIHRvIGJhY2sgb2ZmIG5vdCBkb2lu
Zwo+ID4gYW55IHRlYXIgZG93biBhbnl0aGluZy4KPiAKPiBXZWxsLCBJJ20gd29ya2luZyB0byBw
cm9wb3NlIHRoYXQgd2UgZG8gdGhlIFZBIHJhbmdlIHRlc3QgdW5kZXIgY29yZQo+IG1tdSBub3Rp
ZmllciBjb2RlIHRoYXQgY2Fubm90IGJsb2NrIGFuZCB0aGVuIHdlIHNpbXBseSByZW1vdmUgdGhl
IGlkZWEKPiBvZiBibG9ja2FibGUgZnJvbSBkcml2ZXJzIHVzaW5nIHRoaXMgbmV3ICdyYW5nZSBu
b3RpZmllcicuIAo+IAo+IEkgdGhpbmsgdGhpcyBwcmV0dHkgbXVjaCBzb2x2ZXMgdGhlIGNvbmNl
cm4/CgpJIGFtIG5vdCBzdXJlIGkgZm9sbG93IHdoYXQgeW91IHByb3Bvc2UgaGVyZSA/IExpa2Ug
aSBwb2ludGVkIG91dCBpbgphbm90aGVyIGVtYWlsIGZvciBHUFUgd2UgZG8gbmVlZCB0byBiZSBh
YmxlIHRvIHNsZWVwICh3ZSBtaWdodCBnZXQKbHVja3kgYW5kIG5vdCBuZWVkIHRvbyBidXQgdGhp
cyBpcyBydW50aW1lIHRoaW5nKSB3aXRoaW4gbm90aWZpZXIKcmFuZ2Vfc3RhcnQgY2FsbGJhY2su
IFRoaXMgaGFzIGJlZW4gc29tZXRoaW5nIGFsbG93IGJ5IG5vdGlmaWVyIHNpbmNlCml0IGhhcyBi
ZWVuIGludHJvZHVjZWQgaW4gdGhlIGtlcm5lbC4KCkNoZWVycywKSsOpcsO0bWUKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
