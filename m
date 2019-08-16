Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5690169
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 14:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6363F6E354;
	Fri, 16 Aug 2019 12:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AA46E354;
 Fri, 16 Aug 2019 12:26:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F587AF55;
 Fri, 16 Aug 2019 12:26:28 +0000 (UTC)
Date: Fri, 16 Aug 2019 14:26:25 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816122625.GA10499@dhcp22.suse.cz>
References: <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <20190815201323.GU21596@ziepe.ca>
 <20190816081029.GA27790@dhcp22.suse.cz>
 <20190816121906.GC5398@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816121906.GC5398@ziepe.ca>
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

T24gRnJpIDE2LTA4LTE5IDA5OjE5OjA2LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gRnJp
LCBBdWcgMTYsIDIwMTkgYXQgMTA6MTA6MjlBTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
ID4gT24gVGh1IDE1LTA4LTE5IDE3OjEzOjIzLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+
IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA5OjM1OjI2UE0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3
cm90ZToKPiA+ID4gCj4gPiA+ID4gPiBUaGUgbGFzdCBkZXRhaWwgaXMgSSdtIHN0aWxsIHVuY2xl
YXIgd2hhdCBhIEdGUCBmbGFncyBhIGJsb2NrYWJsZQo+ID4gPiA+ID4gaW52YWxpZGF0ZV9yYW5n
ZV9zdGFydCgpIHNob3VsZCB1c2UuIElzIEdGUF9LRVJORUwgT0s/Cj4gPiA+ID4gCj4gPiA+ID4g
SSBob3BlIEkgd2lsbCBub3QgbWFrZSB0aGlzIG11ZGR5IGFnYWluIDspCj4gPiA+ID4gaW52YWxp
ZGF0ZV9yYW5nZV9zdGFydCBpbiB0aGUgYmxvY2thYmxlIG1vZGUgY2FuIHVzZS9kZXBlbmQgb24g
YW55IHNsZWVwYWJsZQo+ID4gPiA+IGFsbG9jYXRpb24gYWxsb3dlZCBpbiB0aGUgY29udGV4dCBp
dCBpcyBjYWxsZWQgZnJvbS4gCj4gPiA+IAo+ID4gPiAnaW4gdGhlIGNvbnRleHQgaXMgaXMgY2Fs
bGVkIGZyb20nIGlzIHRoZSBtYWdpYyBwaHJhc2UsIGFzCj4gPiA+IGludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQgaXMgY2FsbGVkIHdoaWxlIGhvbGRpbmcgc2V2ZXJhbCBkaWZmZXJlbnQgbW0KPiA+ID4g
cmVsYXRlZCBsb2Nrcy4gSSBrbm93IGF0IGxlYXN0IHdyaXRlIG1tYXBfc2VtIGFuZCBpX21tYXBf
cndzZW0KPiA+ID4gKHdyaXRlPykKPiA+ID4gCj4gPiA+IENhbiBHRlBfS0VSTkVMIGJlIGNhbGxl
ZCB3aGlsZSBob2xkaW5nIHRob3NlIGxvY2tzPwo+ID4gCj4gPiBpX21tYXBfcndzZW0gd291bGQg
YmUgcHJvYmxlbWF0aWMgYmVjYXVzZSBpdCBpcyB0YWtlbiBkdXJpbmcgdGhlCj4gPiByZWNsYWlt
Lgo+IAo+IE9rYXkuLiBTbyB0aGUgZnNfcmVjbGFpbSBkZWJ1Z2dpbmcgZG9lcyBjYXRjaCBlcnJv
cnMuCgpJIGRvIG5vdCB0aGluayBmc19yZWNsYWltIGlzIHRoZSB1ZG5lcmx5aW5nIG1lY2hhbmlz
bSB0byBjYXRjaCB0aGlzCmRlYWRsb2NrLiBJdCBpcyBhIHNpbXBsZSBBQSBkZWFkbG9jay4gWW91
IHRha2UgaV9tbWFwX3J3c2VtIGFuZCB0aGVuCmdvIGRvd24gdGhlIGFsbG9jYXRpb24gcGF0aCwg
ZGlyZWN0IHJlY2xhaW0gYW5kIHRha2UgdGhlIGxvY2sgYWdhaW4uCk5vdGhpbmcgcmVhbGx5IHN1
cnByaXNpbmcuIGZzX3JlY2xhaW0gaXMgcmVhbGx5IHRvIGNhdGNoIEdGUF9OT0ZTCmNvbnRleHQg
Y2FsbGluZyBpbnRvIGEgbGVzcyByZXN0cmljdGVkIChlLmcuIEdGUF9LRVJORUwgYWxsb2NhdGlv
bgpjb250ZXh0KS4KCj4gRG8geW91IGhhdmUgYW55Cj4gcmVmZXJlbmNlIGZvciB3aGF0IGEgZmFs
c2UgcG9zaXRpdmUgbG9va3MgbGlrZT8gCgpJIGJlbGlldmUgSSBoYXZlIGdpdmVuIHNvbWUgZXhh
bXBsZXMgd2hlbiBpbnRyb2R1Y2luZyBfX0dGUF9OT0xPQ0tERVAuCiAKPiBJIHdvdWxkIGxpa2Ug
dG8gaW5qZWN0IGl0IGludG8gdGhlIG5vdGlmaWVyIHBhdGggYXMgdGhpcyBpcyB2ZXJ5Cj4gZGlm
ZmljdWx0IGZvciBkcml2ZXIgYXV0aG9ycyB0byBkaXNjb3ZlciBhbmQga25vdyBhYm91dCwgYnV0
IEknbQo+IHdvcnJpZWQgYWJvdXQgeW91ciBmYWxzZSBwb3NpdGl2ZSByZW1hcmsuCj4gCj4gSSB0
aGluayBJIHVuZGVyc3RhbmQgd2UgY2FuIHVzZSBvbmx5IEdGUF9BVE9NSUMgaW4gdGhlIG5vdGlm
aWVycywgYnV0Cj4gd2UgbmVlZCBhIHN0cmF0ZWd5IHRvIGhhbmRsZSBPT00gdG8gZ3VhcmVudGVl
IGZvcndhcmQgcHJvZ3Jlc3MuCgpZb3VyIGV4YW1wbGUgaXMgZnJvbSB0aGUgbm90aWZpZXIgcmVn
aXN0cmF0aW9uIElJVUMuIENhbiB5b3UKcHJlLWFsbG9jYXRlIGJlZm9yZSB0YWtpbmcgbG9ja3M/
IENvdWxkIHlvdSBwb2ludCBtZSB0byBzb21lIGV4YW1wbGVzCndoZW4gdGhlIGFsbG9jYXRpb24g
aXMgbmVjZXNzYXJ5IGluIHRoZSByYW5nZSBub3RpZmllciBjYWxsYmFjaz8KLS0gCk1pY2hhbCBI
b2NrbwpTVVNFIExhYnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
