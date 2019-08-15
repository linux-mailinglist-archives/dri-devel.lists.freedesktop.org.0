Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B58F4B9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 21:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F1D6EA59;
	Thu, 15 Aug 2019 19:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D48F6EA58;
 Thu, 15 Aug 2019 19:35:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8682CABBE;
 Thu, 15 Aug 2019 19:35:28 +0000 (UTC)
Date: Thu, 15 Aug 2019 21:35:26 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815193526.GT9477@dhcp22.suse.cz>
References: <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815191810.GR21596@ziepe.ca>
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

T24gVGh1IDE1LTA4LTE5IDE2OjE4OjEwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVGh1
LCBBdWcgMTUsIDIwMTkgYXQgMDk6MDU6MjVQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
IAo+ID4gVGhpcyBpcyB3aGF0IHlvdSBjbGFpbSBhbmQgSSBhbSBzYXlpbmcgdGhhdCBmc19yZWNs
YWltIGlzIGFib3V0IGEKPiA+IHJlc3RyaWN0ZWQgcmVjbGFpbSBjb250ZXh0IGFuZCBpdCBpcyBh
biB1Z2x5IGhhY2suIEl0IGhhcyBwcm92ZW4gdG8KPiA+IHJlcG9ydCBmYWxzZSBwb3NpdGl2ZXMu
IE1heWJlIGl0IGNhbiBiZSBleHRlbmRlZCB0byBhIGdlbmVyaWMgcmVjbGFpbS4KPiA+IEkgaGF2
ZW4ndCB0cmllZCB0aGF0LiBEbyBub3QgYWltIHRvIHRyeSBpdC4KPiAKPiBPa2F5LCBncmVhdCwg
SSB0aGluayB0aGlzIGhhcyBiZWVuIHZlcnkgaGVscGZ1bCwgYXQgbGVhc3QgZm9yIG1lLAo+IHRo
YW5rcy4gSSBkaWQgbm90IGtub3cgZnNfcmVjbGFpbSB3YXMgc28gcHJvYmxlbWF0aWMsIG9yIHRo
ZSBzcGVjaWFsCj4gY2FzZXMgYWJvdXQgT09NICdyZWNsYWltJy4gCgpJIGFtIGhhcHB5IHRoYXQg
dGhpcyBpcyBtb3JlIGNsZWFyIG5vdy4KCj4gT24gdGhpcyBwYXRjaCwgSSBoYXZlIG5vIGdlbmVy
YWwgb2JqZWN0aW9uIHRvIGVuZm9yY2luZyBkcml2ZXJzIHRvIGJlCj4gbm9uLWJsb2NraW5nLCBJ
J2QganVzdCBsaWtlIHRvIHNlZSBpdCBkb25lIHdpdGggdGhlIGV4aXN0aW5nIGxvY2tkZXAKPiBj
YW4ndCBzbGVlcCBkZXRlY3Rpb24gcmF0aGVyIHRoYW4gaW52ZW50aW5nIHNvbWUgbmV3IGRlYnVn
Z2luZyBmb3IgaXQuCj4gCj4gSSB1bmRlcnN0YW5kIHRoaXMgbWVhbnMgdGhlIGRlYnVnZ2luZyBy
ZXF1aXJlcyBsb2NrZGVwIGVuYWJsZWQgYW5kCj4gd2lsbCBub3QgcnVuIGluIHByb2R1Y3Rpb24s
IGJ1dCBJJ20gb2YgdGhlIHZpZXcgdGhhdCBpcyBPSyBhbmQgaW4gbGluZQo+IHdpdGggZ2VuZXJh
bCBrZXJuZWwgcHJhY3RpY2UuCgpZZXMgYW5kIEkgZG8gYWdyZWUgd2l0aCB0aGlzIGluIGdlbmVy
YWwuCgo+IFRoZSBsYXN0IGRldGFpbCBpcyBJJ20gc3RpbGwgdW5jbGVhciB3aGF0IGEgR0ZQIGZs
YWdzIGEgYmxvY2thYmxlCj4gaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpIHNob3VsZCB1c2UuIElz
IEdGUF9LRVJORUwgT0s/CgpJIGhvcGUgSSB3aWxsIG5vdCBtYWtlIHRoaXMgbXVkZHkgYWdhaW4g
OykKaW52YWxpZGF0ZV9yYW5nZV9zdGFydCBpbiB0aGUgYmxvY2thYmxlIG1vZGUgY2FuIHVzZS9k
ZXBlbmQgb24gYW55IHNsZWVwYWJsZQphbGxvY2F0aW9uIGFsbG93ZWQgaW4gdGhlIGNvbnRleHQg
aXQgaXMgY2FsbGVkIGZyb20uIFNvIGluIG90aGVyIHdvcmRzCml0IGlzIG5vIGRpZmZlcmVudCBm
cm9tIGFueSBvdGhlciBmdW5jdGlvbiBpbiB0aGUga2VybmVsIHRoYXQgY2FsbHMgaW50bwphbGxv
Y2F0b3IuIEFzIHRoZSBBUEkgaXMgbWlzc2luZyBnZnAgY29udGV4dCB0aGVuIEkgaG9wZSBpdCBp
cyBub3QKY2FsbGVkIGZyb20gYW55IHJlc3RyaWN0ZWQgY29udGV4dHMgKGV4Y2VwdCBmcm9tIHRo
ZSBvb20gd2hpY2ggd2UgaGF2ZQohYmxvY2thYmxlIGZvcikuCgo+IExvY2tkZXAgaGFzCj4gY29t
cGxhaW5lZCBvbiB0aGF0IGluIHBhc3QgZHVlIHRvIGZzX3JlY2xhaW0gLSBob3cgZG8geW91IGtu
b3cgaWYgaXQKPiBpcyBhIGZhbHNlIHBvc2l0aXZlPwoKSSB3b3VsZCBoYXZlIHRvIHNlZSB0aGUg
c3BlY2lmaWMgbG9ja2RlcCBzcGxhdC4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
