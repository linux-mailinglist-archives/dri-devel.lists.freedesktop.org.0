Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC988FDBA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 10:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C39892A1;
	Fri, 16 Aug 2019 08:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F4C892A1;
 Fri, 16 Aug 2019 08:24:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11D2CAFC3;
 Fri, 16 Aug 2019 08:24:30 +0000 (UTC)
Date: Fri, 16 Aug 2019 10:24:28 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816082428.GB27790@dhcp22.suse.cz>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815151509.9ddbd1f11fb9c4c3e97a67a5@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815151509.9ddbd1f11fb9c4c3e97a67a5@linux-foundation.org>
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
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDE1LTA4LTE5IDE1OjE1OjA5LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFRodSwg
MTUgQXVnIDIwMTkgMTA6NDQ6MjkgKzAyMDAgTWljaGFsIEhvY2tvIDxtaG9ja29Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gCj4gPiA+IEkgY29udGludWUgdG8gc3RydWdnbGUgd2l0aCB0aGlzLiAgSXQg
aW50cm9kdWNlcyBhIG5ldyBrZXJuZWwgc3RhdGUKPiA+ID4gInJ1bm5pbmcgcHJlZW1wdGlibHkg
YnV0IG11c3Qgbm90IGNhbGwgc2NoZWR1bGUoKSIuICBIb3cgZG9lcyB0aGlzIG1ha2UKPiA+ID4g
YW55IHNlbnNlPwo+ID4gPiAKPiA+ID4gUGVyaGFwcyBhIG11Y2gsIG11Y2ggbW9yZSBkZXRhaWxl
ZCBkZXNjcmlwdGlvbiBvZiB0aGUgb29tX3JlYXBlcgo+ID4gPiBzaXR1YXRpb24gd291bGQgaGVs
cCBvdXQuCj4gPiAgCj4gPiBUaGUgcHJpbWFyeSBwb2ludCBoZXJlIGlzIHRoYXQgdGhlcmUgaXMg
YSBkZW1hbmQgb2Ygbm9uIGJsb2NrYWJsZSBtbXUKPiA+IG5vdGlmaWVycyB0byBiZSBjYWxsZWQg
d2hlbiB0aGUgb29tIHJlYXBlciB0ZWFycyBkb3duIHRoZSBhZGRyZXNzIHNwYWNlLgo+ID4gQXMg
dGhlIG9vbSByZWFwZXIgaXMgdGhlIHByaW1hcnkgZ3VhcmFudGVlIG9mIHRoZSBvb20gaGFuZGxp
bmcgZm9yd2FyZAo+ID4gcHJvZ3Jlc3MgaXQgY2Fubm90IGJlIGJsb2NrZWQgb24gYW55dGhpbmcg
dGhhdCBtaWdodCBkZXBlbmQgb24gYmxvY2thYmxlCj4gPiBtZW1vcnkgYWxsb2NhdGlvbnMuIFRo
ZXNlIGFyZSBub3QgcmVhbGx5IGVhc3kgdG8gdHJhY2sgYmVjYXVzZSB0aGV5Cj4gPiBtaWdodCBi
ZSBpbmRpcmVjdCAtIGUuZy4gbm90aWZpZXIgYmxvY2tzIG9uIGEgbG9jayB3aGljaCBvdGhlciBj
b250ZXh0Cj4gPiBob2xkcyB3aGlsZSBhbGxvY2F0aW5nIG1lbW9yeSBvciB3YWl0aW5nIGZvciBh
IGZsdXNoZXIgdGhhdCBuZWVkcyBtZW1vcnkKPiA+IHRvIHBlcmZvcm0gaXRzIHdvcmsuIElmIHN1
Y2ggYSBibG9ja2luZyBzdGF0ZSBoYXBwZW5zIHRoYXQgd2UgY2FuIGVuZCB1cAo+ID4gaW4gYSBz
aWxlbnQgaGFuZyB3aXRoIGFuIHVudXNhYmxlIG1hY2hpbmUuCj4gPiBOb3cgd2UgaG9wZSBmb3Ig
cmVhc29uYWJsZSBpbXBsZW1lbnRhdGlvbnMgb2YgbW11IG5vdGlmaWVycyAoc3Ryb25nCj4gPiB3
b3JkcyBJIGtub3cgOykgYW5kIHRoaXMgc2hvdWxkIGJlIHJlbGF0aXZlbHkgc2ltcGxlIGFuZCBl
ZmZlY3RpdmUgY2F0Y2gKPiA+IGFsbCB0b29sIHRvIGRldGVjdCBzb21ldGhpbmcgc3VzcGljaW91
cyBpcyBnb2luZyBvbi4KPiA+IAo+ID4gRG9lcyB0aGF0IG1ha2UgdGhlIHNpdHVhdGlvbiBtb3Jl
IGNsZWFyPwo+IAo+IFllcywgdGhhbmtzLCBtdWNoLiAgTWF5YmUgYSBjb2RlIGNvbW1lbnQgYWxv
bmcgdGhlIGxpbmVzIG9mCj4gCj4gICBUaGlzIGlzIG9uIGJlaGFsZiBvZiB0aGUgb29tIHJlYXBl
ciwgc3BlY2lmaWNhbGx5IHdoZW4gaXQgaXMKPiAgIGNhbGxpbmcgdGhlIG1tdSBub3RpZmllcnMu
ICBUaGUgcHJvYmxlbSBpcyB0aGF0IGlmIHRoZSBub3RpZmllciB3ZXJlCj4gICB0byBibG9jayBv
biwgZm9yIGV4YW1wbGUsIG11dGV4X2xvY2soKSBhbmQgaWYgdGhlIHByb2Nlc3Mgd2hpY2ggaG9s
ZHMKPiAgIHRoYXQgbXV0ZXggd2VyZSB0byBwZXJmb3JtIGEgc2xlZXBpbmcgbWVtb3J5IGFsbG9j
YXRpb24sIHRoZSBvb20KPiAgIHJlYXBlciBpcyBub3cgYmxvY2tlZCBvbiBjb21wbGV0aW9uIG9m
IHRoYXQgbWVtb3J5IGFsbG9jYXRpb24uCgogICAgcmVhcGVyIGlzIG5vdyBibG9ja2VkIG9uIGNv
bXBsZXRpb24gb2YgdGhhdCBtZW1vcnkgYWxsb2NhdGlvbgogICAgYW5kIGNhbm5vdCBwcm92aWRl
IHRoZSBndWFyYW50ZWUgb2YgdGhlIE9PTSBmb3J3YXJkIHByb2dyZXNzLgoKT0suIAogCj4gYnR3
LCBkbyB3ZSBuZWVkIHRhc2tfc3RydWN0Lm5vbl9ibG9ja19jb3VudD8gIFBlcmhhcHMgdGhlIG9v
bSByZWFwZXIKPiB0aHJlYWQgY291bGQgc2V0IGEgbmV3IFBGX05PTkJMT0NLICh3aGljaCB3b3Vs
ZCBiZSBtb3JlIGdlbmVyYWwgdGhhbgo+IFBGX09PTV9SRUFQRVIpLiAgSWYgd2UgcnVuIG91dCBv
ZiBQRl8gZmxhZ3MsIHVzZSAoY3VycmVudCA9PSBvb21fcmVhcGVyX3RoKS4KCldlbGwsIEkgZG8g
bm90IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBoZXJlLiBBIHNpbXBsZSBjaGVjayBmb3IgdGhlIHZh
bHVlCnNlZW1zIHRvIGJlIHRyaXZpYWwuIFRoZXJlIGFyZSBxdWl0ZSBzb21lIGhvbGVzIGluIHRh
c2tfc3RydWN0IHRvIGhpZGUKdGhpcyBjb3VudGVyIHdpdGhvdXQgaW5jcmVhc2luZyB0aGUgc2l6
ZS4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
