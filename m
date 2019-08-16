Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797E90453
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 17:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1FF6E346;
	Fri, 16 Aug 2019 15:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6F66E342;
 Fri, 16 Aug 2019 15:05:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 82BA23001472;
 Fri, 16 Aug 2019 15:05:05 +0000 (UTC)
Received: from redhat.com (ovpn-123-168.rdu2.redhat.com [10.10.123.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2FA18780;
 Fri, 16 Aug 2019 15:05:02 +0000 (UTC)
Date: Fri, 16 Aug 2019 11:05:01 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816150501.GA3149@redhat.com>
References: <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <20190815201323.GU21596@ziepe.ca>
 <20190816081029.GA27790@dhcp22.suse.cz>
 <20190816121906.GC5398@ziepe.ca>
 <20190816122625.GA10499@dhcp22.suse.cz>
 <20190816143145.GD5398@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816143145.GD5398@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 16 Aug 2019 15:05:06 +0000 (UTC)
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
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org DRI Development" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
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

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTE6MzE6NDVBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDAyOjI2OjI1UE0gKzAyMDAsIE1pY2hh
bCBIb2NrbyB3cm90ZToKPiA+IE9uIEZyaSAxNi0wOC0xOSAwOToxOTowNiwgSmFzb24gR3VudGhv
cnBlIHdyb3RlOgo+ID4gPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAxMDoxMDoyOUFNICswMjAw
LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiA+ID4gT24gVGh1IDE1LTA4LTE5IDE3OjEzOjIzLCBK
YXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAw
OTozNToyNlBNICswMjAwLCBNaWNoYWwgSG9ja28gd3JvdGU6CgpbLi4uXQoKPiA+ID4gSSB3b3Vs
ZCBsaWtlIHRvIGluamVjdCBpdCBpbnRvIHRoZSBub3RpZmllciBwYXRoIGFzIHRoaXMgaXMgdmVy
eQo+ID4gPiBkaWZmaWN1bHQgZm9yIGRyaXZlciBhdXRob3JzIHRvIGRpc2NvdmVyIGFuZCBrbm93
IGFib3V0LCBidXQgSSdtCj4gPiA+IHdvcnJpZWQgYWJvdXQgeW91ciBmYWxzZSBwb3NpdGl2ZSBy
ZW1hcmsuCj4gPiA+IAo+ID4gPiBJIHRoaW5rIEkgdW5kZXJzdGFuZCB3ZSBjYW4gdXNlIG9ubHkg
R0ZQX0FUT01JQyBpbiB0aGUgbm90aWZpZXJzLCBidXQKPiA+ID4gd2UgbmVlZCBhIHN0cmF0ZWd5
IHRvIGhhbmRsZSBPT00gdG8gZ3VhcmVudGVlIGZvcndhcmQgcHJvZ3Jlc3MuCj4gPiAKPiA+IFlv
dXIgZXhhbXBsZSBpcyBmcm9tIHRoZSBub3RpZmllciByZWdpc3RyYXRpb24gSUlVQy4gCj4gCj4g
WWVzLCB0aGF0IGlzIHdoZXJlIHRoaXMgY29tbWl0IGhpdCBpdC4uIFRyaWdnZXJpbmcgdGhpcyB1
bmRlciBhbgo+IGFjdHVhbCBub3RpZmllciB0byBnZXQgYSBsb2NrZGVwIHJlcG9ydCBpcyBoYXJk
Lgo+IAo+ID4gQ2FuIHlvdSBwcmUtYWxsb2NhdGUgYmVmb3JlIHRha2luZyBsb2Nrcz8gQ291bGQg
eW91IHBvaW50IG1lIHRvIHNvbWUKPiA+IGV4YW1wbGVzIHdoZW4gdGhlIGFsbG9jYXRpb24gaXMg
bmVjZXNzYXJ5IGluIHRoZSByYW5nZSBub3RpZmllcgo+ID4gY2FsbGJhY2s/Cj4gCj4gSG1tLiBJ
IHRvb2sgYSBjYXJlZnVsIGxvb2ssIEkgb25seSBmb3VuZCBtbHg1IGFzIG9idmlvdXNseSBhbGxv
Y2F0aW5nCj4gbWVtb3J5Ogo+IAo+ICBtbHg1X2liX2ludmFsaWRhdGVfcmFuZ2UoKQo+ICAgbWx4
NV9pYl91cGRhdGVfeGx0KCkKPiAgICBfX2dldF9mcmVlX3BhZ2VzKGdmcCwgZ2V0X29yZGVyKHNp
emUpKTsKPiAKPiBIb3dldmVyLCBJIHRoaW5rIHRoaXMgY291bGQgYmUgY2hhbmdlZCB0byBmYWxs
IGJhY2sgdG8gc29tZSBzbWFsbAo+IGJ1ZmZlciBpZiBhbGxvY2F0aW9uIGZhaWxzLiBUaGUgZXhp
c3Rpbmcgc2NoZW1lIGxvb2tzIHNrZXRjaHkKPiAKPiBub3V2ZWF1IGRvZXM6Cj4gCj4gIG5vdXZl
YXVfc3ZtbV9pbnZhbGlkYXRlCj4gICBudmlmX29iamVjdF9tdGhkCj4gICAga21hbGxvYyhHRlBf
S0VSTkVMKQo+IAo+IEJ1dCBJIHRoaW5rIGl0IHJlbGlhYmx5IHVzZXMgYSBzdGFjayBidWZmZXIg
aGVyZQo+IAo+IGk5MTUgSSB0aGluayBEYW5pZWwgc2FpZCBoZSBhdWRpdGVkLgo+IAo+IGFtZF9t
bi4uIFRoZSBhY3R1YWwgaW52YWxpZGF0ZV9yYW5nZV9zdGFydCBkb2VzIG5vdCBhbGxvY2F0ZSBt
ZW1vcnksCj4gYnV0IGl0IGlzIGVudGFuZ2xlZCB3aXRoIHNvIG1hbnkgbG9ja3MgaXQgd291bGQg
bmVlZCBjYXJlZnVsIGFuYWx5c2lzCj4gdG8gYmUgc3VyZS4KPiAKPiBUaGUgb3RoZXJzIGxvb2sg
Z2VuZXJhbGx5IE9LLCB3aGljaCBpcyBnb29kLCBiZXR0ZXIgdGhhbiBJIGhvcGVkIDopCgpJdCBp
cyBvbiBteSBUT0RPIGxpc3QgdG8gZ2V0IHJpZCBvZiBhbGxvY2F0aW9uIGluIG5vdGlmaWVyIGNh
bGxiYWNrCihpaXJjIG5vdXZlYXUgYWxyZWFkeSB1c2UgdGhlIHN0YWNrIHVubGVzcyBpdCB3YXMg
bG9zdCBpbiBhbGwgdGhlCnJldmlzaW9uIGl0IHdhbnRzIHRocm91Z2gpLiBBbnl3YXkgaSBkbyBu
b3QgdGhpbmsgd2UgbmVlZCBhbGxvY2F0aW9uCmluIG5vdGlmaWVyLgoKQ2hlZXJzLApKw6lyw7Rt
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
