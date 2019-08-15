Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED48F415
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 21:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3122E6EA4B;
	Thu, 15 Aug 2019 19:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A246F6E459;
 Thu, 15 Aug 2019 19:05:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C095AD72;
 Thu, 15 Aug 2019 19:05:28 +0000 (UTC)
Date: Thu, 15 Aug 2019 21:05:25 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815190525.GS9477@dhcp22.suse.cz>
References: <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815182448.GP21596@ziepe.ca>
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

T24gVGh1IDE1LTA4LTE5IDE1OjI0OjQ4LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVGh1
LCBBdWcgMTUsIDIwMTkgYXQgMDc6NDI6MDdQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
ID4gT24gVGh1IDE1LTA4LTE5IDEzOjU2OjMxLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+
IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA2OjAwOjQxUE0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3
cm90ZToKPiA+ID4gCj4gPiA+ID4gPiBBRkFJSyAnR0ZQX05PV0FJVCcgaXMgY2hhcmFjdGVyaXpl
ZCBieSB0aGUgbGFjayBvZiBfX0dGUF9GUyBhbmQKPiA+ID4gPiA+IF9fR0ZQX0RJUkVDVF9SRUNM
QUlNLi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIG1hdGNoZXMgdGhlIGV4aXN0aW5nIHRlc3Qg
aW4gX19uZWVkX2ZzX3JlY2xhaW0oKSAtIHNvIGlmIHlvdSBhcmUKPiA+ID4gPiA+IE9LIHdpdGgg
R0ZQX05PRlMsIGFrYSBfX0dGUF9JTyB3aGljaCB0cmlnZ2VycyB0cnlfdG9fY29tcGFjdF9wYWdl
cygpLAo+ID4gPiA+ID4gYWxsb2NhdGlvbnMgZHVyaW5nIE9PTSwgdGhlbiBJIHRoaW5rIGZzX3Jl
Y2xhaW0gYWxyZWFkeSBtYXRjaGVzIHdoYXQKPiA+ID4gPiA+IHlvdSBkZXNjcmliZWQ/Cj4gPiA+
ID4gCj4gPiA+ID4gTm8gR0ZQX05PRlMgaXMgZXF1YWxseSBiYWQuIFBsZWFzZSByZWFkIG15IG90
aGVyIGVtYWlsIGV4cGxhaW5pbmcgd2hhdAo+ID4gPiA+IHRoZSBvb21fcmVhcGVyIGFjdHVhbGx5
IHJlcXVpcmVzLiBJbiBzaG9ydCBubyBibG9ja2luZyBvbiBkaXJlY3Qgb3IKPiA+ID4gPiBpbmRp
cmVjdCBkZXBlbmRlY3kgb24gbWVtb3J5IGFsbG9jYXRpb24gdGhhdCBtaWdodCBzbGVlcC4KPiA+
ID4gCj4gPiA+IEl0IGlzIG11Y2ggZWFzaWVyIHRvIGZvbGxvdyB3aXRoIHNvbWUgaGludHMgb24g
Y29kZSwgc28gdGhlIHRydWUKPiA+ID4gcmVxdWlyZW1lbnQgaXMgdGhhdCB0aGUgT09NIHJlcGVh
ciBub3QgYmxvY2sgb24gR0ZQX0ZTIGFuZCBHRlBfSU8KPiA+ID4gYWxsb2NhdGlvbnMsIGdyZWF0
LCB0aGF0IGNvbnN0cmFpbnQgaXMgbm93IGNsZWFyLgo+ID4gCj4gPiBJIHN0aWxsIGRvIG5vdCBn
ZXQgd2h5IGRvIHlvdSBwdXQgRlMvSU8gaW50byB0aGUgcGljdHVyZS4gVGhpcyBpcyByZWFsbHkK
PiA+IGFib3V0IF9fR0ZQX0RJUkVDVF9SRUNMQUlNLgo+IAo+IExpa2UgSSBzYWlkIHRoaXMgaXMg
Y29tcGxpY2F0ZWQsIHRyYW5zbGF0aW5nICJubyBibG9ja2luZyBvbiBkaXJlY3Qgb3IKPiBpbmRp
cmVjdCBkZXBlbmRlY3kgb24gbWVtb3J5IGFsbG9jYXRpb24gdGhhdCBtaWdodCBzbGVlcCIgaW50
byBHRlAKPiBmbGFncyBpcyBoYXJkIGZvciB1cyBvdXRzaWRlIHRoZSBtbSBjb21tdW5pdHkuCj4g
Cj4gU28gdGhlIGNvbnRyYWludCBoZXJlIGlzIG5vIF9fR0ZQX0RJUkVDVF9SRUNMQUlNPwoKT0ss
IEkgYW0gb2J2aW91c2x5IGZhaWxpbmcgdG8gZXhwbGFpbiB0aGF0LiBTb3JyeSBhYm91dCB0aGF0
LiBZb3UgYXJlCnJpZ2h0IHRoYXQgdGhpcyBpcyBub3Qgc2ltcGxlLiBMZXQgbWUgdHJ5IGFnYWlu
LgoKVGhlIGNvbnRleHQgd2UgYXJlIGNhbGxpbmcgIWJsb2NrYWJsZSBub3RpZmllcnMgZnJvbSBo
YXMgdG8gZmluaXNoIGluIGEKX2Zpbml0ZV8gYW1vdW50IG9mIHRpbWUgKGFuZCBzd2lmdCBpcyBo
dWdlbHkgYXBwcmVjaWF0ZWQgYnkgdXNlcnMgb2YKb3RoZXJ3aXNlIG5vbi1yZXNwb25zaXZlIHN5
c3RlbSB0aGF0IGlzIHVuZGVyIE9PTSkuIFdlIGFyZSBvdXQgb2YgbWVtb3J5CnNvIHdlIGNhbm5v
dCBiZSBibG9ja2VkIHdhaXRpbmcgZm9yIG1lbW9yeS4gRGlyZWN0bHkgb3IgaW5kaXJlY3RseSAo
dmlhCmEgbG9jaywgd2FpdGluZyBmb3IgYW4gZXZlbnQgdGhhdCBuZWVkcyBtZW1vcnkgdG8gZmlu
aXNoIGluIGdlbmVyYWwpLiBTbwp5b3UgbmVlZCB0byB0cmFjayBkZXBlbmRlbmN5IG92ZXIgbW9y
ZSBjb21wbGljYXRlZCBjb250ZXh0cyB0aGFuIHRoZQpkaXJlY3QgY2FsbCBwYXRoICh0aGluayBv
ZiB3b3JrcXVldWUgZm9yIGV4YW1wbGUpLgoKPiBJIGJyaW5nIHVwIEZTL0lPIGJlY2F1c2UgdGhh
dCBpcyB3aGF0IFRlanVuIG1lbnRpb25lZCB3aGVuIEkgYXNrZWQgaGltCj4gYWJvdXQgcmVjbGFp
bSByZXN0cmljdGlvbnMsIGFuZCBpcyB3aGF0IGZzX3JlY2xhaW1fYWNxdWlyZSgpIGlzCj4gYWxy
ZWFkeSBzZW5zaXRpdmUgdG9vLiBJdCBpcyBwcmV0dHkgY29uZnVzaW5nIGlmIHdlIGhhdmUgcGxh
Y2VzIHVzaW5nCj4gdGhlIHdvcmQgJ3JlY2xhaW0nIHdpdGggZGlmZmVyZW50IHJlc3RyaWN0aW9u
cy4gOigKCmZzX3JlY2xhaW0gaGFzIGJlZW4gaW52ZW50ZWQgdG8gY2F0Y2ggcG90ZW50aWFsIGRl
YWRsb2NrcyB3aGVuIGEKR0ZQX05Pe0ZTL0lPfSBhbGxvY2F0aW9uIGhpdHMgaW50byBmcy9pbyBy
ZWNsYWltLiBUaGlzIGlzIGEgc3Vic2V0IG9mCnRoZSByZWNsYWltIHRoYXQgd2UgaGF2ZS4gVGhl
IG9vbSBjb250ZXh0IGlzIG1vcmUgcmVzdHJpY3RlZCBhbmQgaXQKY2Fubm90IGRlcGVuZCBvbiBf
YW55XyBtZW1vcnkgcmVjbGFpbSBiZWNhdXNlIGJ5IHRoZSB0aW1lIHdlIGhhdmUgZ290IHRvCnRo
aXMgY29udGV4dCBhbGwgdGhlIHJlY2xhaW0gaGFzIGFscmVhZHkgZmFpbGVkIGFuZCB3YWl0IHNv
bWUgbW9yZSB3aWxsCnNpbXBseSBub3QgaGVscC4KCj4gPiA+ICAgICAgICBDUFUwICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBrbWFsbG9jKEdGUF9LRVJORUwpCj4gPiAKPiA+IG5vIEkgbWVh
biBfX0dGUF9ESVJFQ1RfUkVDTEFJTSBoZXJlLgo+ID4gCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soKQo+ID4gPiAgIGZzX3JlY2xhaW1f
YWNxdWlyZSgpCj4gPiA+ICAgbXV0ZXhfbG9jaygpIDwtIGlsbGVnYWw6IGxvY2sgZGVwIGFzc2Vy
dGlvbgo+ID4gCj4gPiBJIGNhbm5vdCByZWFsbHkgY29tbWVudCBvbiBob3cgdGhhdCBpcyBhY2hp
ZXZlYWJsZSBieSBsb2NrZGVwLgo+IAo+ID8/PyBJIGFtIHRyeWluZyB0byBleHBsYWluIHRoaXMg
aXMgYWxyZWFkeSBkb25lIGFuZCB3b3JraW5nIHRvZGF5LiBUaGUKPiBhYm92ZSBleGFtcGxlIHdp
bGwgYWxyZWFkeSBmYXVsdCB3aXRoIGxvY2tkZXAgZW5hYmxlZC4KPiAKPiBUaGlzIGlzIGV4aXN0
aW5nIGRlYnVnZ2luZyB3ZSBjYW4gdXNlIGFuZCBpbXByb3ZlIHVwb24gcmF0aGVyIHRoYXQKPiBp
bnZlbnQgbmV3IGRlYnVnZ2luZy4KClRoaXMgaXMgd2hhdCB5b3UgY2xhaW0gYW5kIEkgYW0gc2F5
aW5nIHRoYXQgZnNfcmVjbGFpbSBpcyBhYm91dCBhCnJlc3RyaWN0ZWQgcmVjbGFpbSBjb250ZXh0
IGFuZCBpdCBpcyBhbiB1Z2x5IGhhY2suIEl0IGhhcyBwcm92ZW4gdG8KcmVwb3J0IGZhbHNlIHBv
c2l0aXZlcy4gTWF5YmUgaXQgY2FuIGJlIGV4dGVuZGVkIHRvIGEgZ2VuZXJpYyByZWNsYWltLgpJ
IGhhdmVuJ3QgdHJpZWQgdGhhdC4gRG8gbm90IGFpbSB0byB0cnkgaXQuCi0tIApNaWNoYWwgSG9j
a28KU1VTRSBMYWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
