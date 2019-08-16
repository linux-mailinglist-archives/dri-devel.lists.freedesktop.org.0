Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2818FD44
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 10:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA126E2A9;
	Fri, 16 Aug 2019 08:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AB06E2A4;
 Fri, 16 Aug 2019 08:10:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41A16AD20;
 Fri, 16 Aug 2019 08:10:31 +0000 (UTC)
Date: Fri, 16 Aug 2019 10:10:29 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816081029.GA27790@dhcp22.suse.cz>
References: <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <20190815201323.GU21596@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815201323.GU21596@ziepe.ca>
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

T24gVGh1IDE1LTA4LTE5IDE3OjEzOjIzLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVGh1
LCBBdWcgMTUsIDIwMTkgYXQgMDk6MzU6MjZQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
IAo+ID4gPiBUaGUgbGFzdCBkZXRhaWwgaXMgSSdtIHN0aWxsIHVuY2xlYXIgd2hhdCBhIEdGUCBm
bGFncyBhIGJsb2NrYWJsZQo+ID4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkgc2hvdWxkIHVz
ZS4gSXMgR0ZQX0tFUk5FTCBPSz8KPiA+IAo+ID4gSSBob3BlIEkgd2lsbCBub3QgbWFrZSB0aGlz
IG11ZGR5IGFnYWluIDspCj4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGluIHRoZSBibG9ja2Fi
bGUgbW9kZSBjYW4gdXNlL2RlcGVuZCBvbiBhbnkgc2xlZXBhYmxlCj4gPiBhbGxvY2F0aW9uIGFs
bG93ZWQgaW4gdGhlIGNvbnRleHQgaXQgaXMgY2FsbGVkIGZyb20uIAo+IAo+ICdpbiB0aGUgY29u
dGV4dCBpcyBpcyBjYWxsZWQgZnJvbScgaXMgdGhlIG1hZ2ljIHBocmFzZSwgYXMKPiBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0IGlzIGNhbGxlZCB3aGlsZSBob2xkaW5nIHNldmVyYWwgZGlmZmVyZW50
IG1tCj4gcmVsYXRlZCBsb2Nrcy4gSSBrbm93IGF0IGxlYXN0IHdyaXRlIG1tYXBfc2VtIGFuZCBp
X21tYXBfcndzZW0KPiAod3JpdGU/KQo+IAo+IENhbiBHRlBfS0VSTkVMIGJlIGNhbGxlZCB3aGls
ZSBob2xkaW5nIHRob3NlIGxvY2tzPwoKaV9tbWFwX3J3c2VtIHdvdWxkIGJlIHByb2JsZW1hdGlj
IGJlY2F1c2UgaXQgaXMgdGFrZW4gZHVyaW5nIHRoZQpyZWNsYWltLgoKPiBUaGlzIGlzIHRoZSBx
dWVzdGlvbiBvZiBpbmRpcmVjdCBkZXBlbmRlbmN5IG9uIHJlY2xhaW0gdmlhIGxvY2tzIHlvdQo+
IHJhaXNlZCBlYXJsaWVyLgo+IAo+ID4gU28gaW4gb3RoZXIgd29yZHMgaXQgaXMgbm8gZGlmZmVy
ZW50IGZyb20gYW55IG90aGVyIGZ1bmN0aW9uIGluIHRoZQo+ID4ga2VybmVsIHRoYXQgY2FsbHMg
aW50byBhbGxvY2F0b3IuIEFzIHRoZSBBUEkgaXMgbWlzc2luZyBnZnAgY29udGV4dAo+ID4gdGhl
biBJIGhvcGUgaXQgaXMgbm90IGNhbGxlZCBmcm9tIGFueSByZXN0cmljdGVkIGNvbnRleHRzIChl
eGNlcHQKPiA+IGZyb20gdGhlIG9vbSB3aGljaCB3ZSBoYXZlICFibG9ja2FibGUgZm9yKS4KPiAK
PiBZZXMsIHRoZSBjYWxsZXJzIGFyZSBleGFjdGx5IG15IGNvbmNlcm4uCj4gIAo+ID4gPiBMb2Nr
ZGVwIGhhcwo+ID4gPiBjb21wbGFpbmVkIG9uIHRoYXQgaW4gcGFzdCBkdWUgdG8gZnNfcmVjbGFp
bSAtIGhvdyBkbyB5b3Uga25vdyBpZiBpdAo+ID4gPiBpcyBhIGZhbHNlIHBvc2l0aXZlPwo+ID4g
Cj4gPiBJIHdvdWxkIGhhdmUgdG8gc2VlIHRoZSBzcGVjaWZpYyBsb2NrZGVwIHNwbGF0Lgo+IAo+
IFNlZSBiZWxvdy4gSSBmb3VuZCBpdCB3aGVuIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoeSB0aGUg
cmVnaXN0cmF0aW9uCj4gb2YgdGhlIG1tdSBub3RpZmlmZXIgd2FzIHNvIG9kZGx5IGNvZGVkLgo+
IAo+IFRoZSBzaXR1YXRpb24gd2FzOgo+IAo+ICAgZG93bl93cml0ZSgmbW0tPm1tYXBfc2VtKTsK
PiAgIG1tX3Rha2VfYWxsX2xvY2tzKG1tKTsKPiAgIGttYWxsb2MoR0ZQX0tFUk5FTCk7ICA8LS0t
IGxvY2tkZXAgd2FybmluZwoKVWdoLiBtbV90YWtlX2FsbF9sb2NrcyA6LwoKPiBJIHVuZGVyc3Rv
b2QgRGFuaWVsIHNhaWQgaGUgc2F3IHRoaXMgZGlyZWN0bHkgb24gYSByZWNlbnQga2VybmVsIHdo
ZW4KPiB3b3JraW5nIHdpdGggaGlzIGxvY2tkZXAgcGF0Y2g/Cj4gCj4gQ2hlY2tpbmcgbXlzZWxm
LCBvbiB0b2RheXMga2VybmVsIEkgc2VlIGEgY2FsbCBjaGFpbjoKPiAKPiBzaHJpbmtfYWxsX21l
bW9yeQo+ICAgZnNfcmVjbGFpbV9hY3F1aXJlKHNjLmdmcF9tYXNrKTsKPiAgIFsuLl0KPiAgIGRv
X3RyeV90b19mcmVlX3BhZ2VzCj4gICAgc2hyaW5rX3pvbmVzCj4gICAgIHNocmlua19ub2RlCj4g
ICAgICBzaHJpbmtfbm9kZV9tZW1jZwo+ICAgICAgIHNocmlua19saXN0Cj4gICAgICAgIHNocmlu
a19hY3RpdmVfbGlzdAo+ICAgICAgICAgcGFnZV9yZWZlcmVuY2VkCj4gICAgICAgICAgcm1hcF93
YWxrCj4gICAgICAgICAgIHJtYXBfd2Fsa19maWxlCj4gICAgICAgICAgICBpX21tYXBfbG9ja19y
ZWFkCj4gICAgICAgICAgICAgZG93bl9yZWFkKGlfbW1hcF9yd3NlbSkKPiAKPiBTbyBpdCBpcyBw
b3NzaWJsZSB0aGF0IHRoZSBkb3duX3JlYWQoKSBhYm92ZSB3aWxsIGJsb2NrIG9uCj4gaV9tbWFw
X3J3c2VtIGJlaW5nIGhlbGQgaW4gdGhlIGNhbGxlciBvZiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
IHdoaWNoCj4gaXMgZG9pbmcga21hbGxvYyhHUEZfS0VSTkVMKS4KPiAKPiBJcyB0aGlzIE9LPyBU
aGUgbG9ja2RlcCBhbm5vdGF0aW9uIHNheXMgbm8uLgoKSXQncyBub3QgYXMgcGVyIHRoZSBhYm92
ZSBjb2RlIHBhdGNoIHdoaWNoIGlzIGVhc2lseSBwb3NzaWJsZSBiZWNhdXNlCm1tX3Rha2VfYWxs
X2xvY2tzIHdpbGwgbG9jayBhbGwgZmlsZSB2bWFzLgoKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExh
YnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
