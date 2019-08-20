Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A89597D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4466E80E;
	Tue, 20 Aug 2019 08:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDF46E80E;
 Tue, 20 Aug 2019 08:18:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 236DBB009;
 Tue, 20 Aug 2019 08:18:26 +0000 (UTC)
Date: Tue, 20 Aug 2019 10:18:25 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190820081825.GJ3111@dhcp22.suse.cz>
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
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org DRI Development" <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
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

T24gRnJpIDE2LTA4LTE5IDExOjMxOjQ1LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gRnJp
LCBBdWcgMTYsIDIwMTkgYXQgMDI6MjY6MjVQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgpb
Li4uXQo+ID4gSSBiZWxpZXZlIEkgaGF2ZSBnaXZlbiBzb21lIGV4YW1wbGVzIHdoZW4gaW50cm9k
dWNpbmcgX19HRlBfTk9MT0NLREVQLgo+IAo+IE9rYXksIEkgdGhpbmsgdGhhdCBpcyA3ZTc4NDQy
MjZmMTAgKCJsb2NrZGVwOiBhbGxvdyB0byBkaXNhYmxlIHJlY2xhaW0KPiBsb2NrdXAgZGV0ZWN0
aW9uIikgSG1tLCBzYWRseSB0aGUgbGttbCBsaW5rIGluIHRoZSBjb21taXQgaXMgYnJva2VuLgo+
IAo+IEh1bS4gVGhlcmUgYXJlIG5vIHVzZXJzIG9mIF9fR0ZQX05PTE9DS0RFUCB0b2RheT8/IENv
dWxkIGFsbCB0aGUgZmFsc2UKPiBwb3NpdGl2ZXMgaGF2ZSBiZWVuIGZpeGVkPz8KCkkgd291bGQg
YmUgbW9yZSB0aGFuIHN1cnByaXNlZC4gVGhvc2UgZmFsc2UgcG9zc2l0aXZlcyB3ZXJlIHVzdWFs
bHkKcGFwZXJlZCBvdmVyIGJ5IHVzaW5nIEdGUF9OT0ZTLiBBbmQgdGhlIG9yaWdpbmFsIHBsYW4g
d2FzIHRvIGNvbnZlcnQKdGhvc2UgYmFjayB0byBHRlBfS0VSTkVMIGxpa2UgYWxsb2NhdGlvbnMg
YW5kIHVzZSBfX0dGUF9OT0xPQ0tERVAuCiAKPiBLZWVwIGluIG1pbmQgdGhhdCB0aGlzIGZzX3Jl
Y2xhaW0gd2FzIHJld29ya2VkIGF3YXkgZnJvbSB0aGUgaGFja3kKPiBpbnRlcnJ1cHQgY29udGV4
dCBmbGFnIHRvIGEgZmFpcmx5IGVsZWdhbnQgcmVhbCBsb2NrIG1hcC4KCkkgYW0gZ2xhZCB0byBo
ZWFyIHRoYXQgYmVjYXVzZSB0aGF0IHdhcyBqdXN0IHRvbyB1Z2x5IHRvIGxpdmUuCgo+IEJhc2Vk
IG9uIG15IHJlYWQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLCBteSBmaXJzdCByZWFjdGlvbiB3b3Vs
ZCBiZSB0bwo+IHN1Z2dlc3QgbG9ja2RlcF9zZXRfY2xhc3MoKSB0byBzb2x2ZSB0aGUgcHJvYmxl
bSBkZXNjcmliZWQsIGllCj4gZGlmZmVyZW50IGNsYXNzZXMgZm9yICdpbnNpZGUgdHJhbnNhY3Rp
b24nIGFuZCAnb3V0c2lkZSB0cmFuc2FjdGlvbicKPiBvbiB4ZnNfcmVmY291bnRidF9pbml0X2N1
cnNvcigpCgpObyB0aGlzIGp1c3QgdHVybmVkIG91dCB0byBiZSB1bm1haW50YWluYWJsZS4gVGhl
IG51bWJlciBvZiBsb2NrIGNsYXNzZXMKd2FzIGdyb3dpbmcgaGlnaC4gSSByZWNvbW1lbmQgb24g
b2YgdGhlIERhdmUgQ2hpbm5lcidzIHJhbnQuIFNvcnJ5IG5vdApsaW5rIGhhbmR5LgoKPiBJIHVu
ZGVyc3Rvb2QgdGhhdCBnZW5lcmFsbHkgdGhhdCBpcyB0aGUgd2F5IHRvIGhhbmRsZSBsb2NrZGVw
IGZhbHNlCj4gcG9zaXRpdmVzLgo+IAo+IEFueWhvdywgaWYgeW91IGFyZSB3aWxsaW5nIHRvIGNv
bnNpZGVyIHRoYXQgbG9ja2RlcCBpc24ndCBicm9rZW4sIEkKPiBoYXZlIHNvbWUgaWRlYXMgb24g
aG93IHRvIG1ha2UgdGhpcyBjbGVhcmVyIGFuZCBpbmNyZWFzZQo+IGNvdmVyYWdlLiBXb3VsZCB5
b3UgYmUgd2lsbGluZyB0byBsb29rIGF0IHBhdGNoZXMgb24gdGhpcyB0b3BpYz8gKG5vdAo+IHNv
b24sIEkgaGF2ZSB0byBmaW5pc2ggbXkgbW11IG5vdGlmaWVyIHN0dWZmKQoKSSBoYXZlbid0IGNs
YWltZWQgdGhhdCB0aGUgbG9ja2RlcCBpcyBicm9rZW4uIEl0IGp1c3QgaGFkIHByb2JsZW1zIHRv
CmNhcHR1cmUgc29tZSBjb2RlIHBhdGhzIGFuZCBnZW5lcmF0ZWQgZmFsc2UgcG9zaXRpdmVzLiBJ
IHdvdWxkIHJlY29tbWVuZAp0YWxraW5nIHRvIGxvY2tkZXAgbWFpbnRhaW5lcnMgbXVjaCBtb3Jl
IHRoYW4gdG8gbWUgYmVjYXVzZSBJIHdvdWxkIGhhdmUKdG8gZGl2ZSBpbnRvIHRoZSBjb2RlIG11
Y2ggbW9yZSB0byBiZSB1c2VmdWwuIEkgY2FuIHN0aWxsIGNvbW1lbnQgb24gdGhlCk1NIHNpZGUg
b2YgdGhlIHRoaW5nIG9mIGNvdXJzZSBpZiB0aGF0IGlzIGhlbHBmdWwuCgo+ID4gPiBJIHdvdWxk
IGxpa2UgdG8gaW5qZWN0IGl0IGludG8gdGhlIG5vdGlmaWVyIHBhdGggYXMgdGhpcyBpcyB2ZXJ5
Cj4gPiA+IGRpZmZpY3VsdCBmb3IgZHJpdmVyIGF1dGhvcnMgdG8gZGlzY292ZXIgYW5kIGtub3cg
YWJvdXQsIGJ1dCBJJ20KPiA+ID4gd29ycmllZCBhYm91dCB5b3VyIGZhbHNlIHBvc2l0aXZlIHJl
bWFyay4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgSSB1bmRlcnN0YW5kIHdlIGNhbiB1c2Ugb25seSBH
RlBfQVRPTUlDIGluIHRoZSBub3RpZmllcnMsIGJ1dAo+ID4gPiB3ZSBuZWVkIGEgc3RyYXRlZ3kg
dG8gaGFuZGxlIE9PTSB0byBndWFyZW50ZWUgZm9yd2FyZCBwcm9ncmVzcy4KPiA+IAo+ID4gWW91
ciBleGFtcGxlIGlzIGZyb20gdGhlIG5vdGlmaWVyIHJlZ2lzdHJhdGlvbiBJSVVDLiAKPiAKPiBZ
ZXMsIHRoYXQgaXMgd2hlcmUgdGhpcyBjb21taXQgaGl0IGl0Li4gVHJpZ2dlcmluZyB0aGlzIHVu
ZGVyIGFuCj4gYWN0dWFsIG5vdGlmaWVyIHRvIGdldCBhIGxvY2tkZXAgcmVwb3J0IGlzIGhhcmQu
CgpBbGwgeW91IG5lZWQgaXMgdG8gZ2VuZXJhdGUgYSBtZW1vcnkgcHJlc3N1cmUuIFRoYXQgc2hv
dWxkbid0IGJlIHRoYXQKaGFyZC4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
