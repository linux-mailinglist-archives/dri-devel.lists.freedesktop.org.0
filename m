Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DA8E72B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FD36E951;
	Thu, 15 Aug 2019 08:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634BE6E94B;
 Thu, 15 Aug 2019 08:44:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39BCDAE84;
 Thu, 15 Aug 2019 08:44:31 +0000 (UTC)
Date: Thu, 15 Aug 2019 10:44:29 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815084429.GE9477@dhcp22.suse.cz>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
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

T24gV2VkIDE0LTA4LTE5IDEzOjQ1OjU4LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFdlZCwg
MTQgQXVnIDIwMTkgMjI6MjA6MjQgKzAyMDAgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4gd3JvdGU6Cj4gCj4gPiBJbiBzb21lIHNwZWNpYWwgY2FzZXMgd2UgbXVzdCBub3Qg
YmxvY2ssIGJ1dCB0aGVyZSdzIG5vdCBhCj4gPiBzcGlubG9jaywgcHJlZW1wdC1vZmYsIGlycXMt
b2ZmIG9yIHNpbWlsYXIgY3JpdGljYWwgc2VjdGlvbiBhbHJlYWR5Cj4gPiB0aGF0IGFybXMgdGhl
IG1pZ2h0X3NsZWVwKCkgZGVidWcgY2hlY2tzLiBBZGQgYSBub25fYmxvY2tfc3RhcnQvZW5kKCkK
PiA+IHBhaXIgdG8gYW5ub3RhdGUgdGhlc2UuCj4gPiAKPiA+IFRoaXMgd2lsbCBiZSB1c2VkIGlu
IHRoZSBvb20gcGF0aHMgb2YgbW11LW5vdGlmaWVycywgd2hlcmUgYmxvY2tpbmcgaXMKPiA+IG5v
dCBhbGxvd2VkIHRvIG1ha2Ugc3VyZSB0aGVyZSdzIGZvcndhcmQgcHJvZ3Jlc3MuIFF1b3Rpbmcg
TWljaGFsOgo+ID4gCj4gPiAiVGhlIG5vdGlmaWVyIGlzIGNhbGxlZCBmcm9tIHF1aXRlIGEgcmVz
dHJpY3RlZCBjb250ZXh0IC0gb29tX3JlYXBlciAtCj4gPiB3aGljaCBzaG91bGRuJ3QgZGVwZW5k
IG9uIGFueSBsb2NrcyBvciBzbGVlcGFibGUgY29uZGl0aW9uYWxzLiBUaGUgY29kZQo+ID4gc2hv
dWxkIGJlIHN3aWZ0IGFzIHdlbGwgYnV0IHdlIG1vc3RseSBkbyBjYXJlIGFib3V0IGl0IHRvIG1h
a2UgYSBmb3J3YXJkCj4gPiBwcm9ncmVzcy4gQ2hlY2tpbmcgZm9yIHNsZWVwYWJsZSBjb250ZXh0
IGlzIHRoZSBiZXN0IHRoaW5nIHdlIGNvdWxkIGNvbWUKPiA+IHVwIHdpdGggdGhhdCB3b3VsZCBk
ZXNjcmliZSB0aGVzZSBkZW1hbmRzIGF0IGxlYXN0IHBhcnRpYWxseS4iCj4gPiAKPiA+IFBldGVy
IGFsc28gYXNrZWQgd2hldGhlciB3ZSB3YW50IHRvIGNhdGNoIHNwaW5sb2NrcyBvbiB0b3AsIGJ1
dCBNaWNoYWwKPiA+IHNhaWQgdGhvc2UgYXJlIGxlc3Mgb2YgYSBwcm9ibGVtIGJlY2F1c2Ugc3Bp
bmxvY2tzIGNhbid0IGhhdmUgYW4KPiA+IGluZGlyZWN0IGRlcGVuZGVuY3kgdXBvbiB0aGUgcGFn
ZSBhbGxvY2F0b3IgYW5kIGhlbmNlIGNsb3NlIHRoZSBsb29wCj4gPiB3aXRoIHRoZSBvb20gcmVh
cGVyLgo+IAo+IEkgY29udGludWUgdG8gc3RydWdnbGUgd2l0aCB0aGlzLiAgSXQgaW50cm9kdWNl
cyBhIG5ldyBrZXJuZWwgc3RhdGUKPiAicnVubmluZyBwcmVlbXB0aWJseSBidXQgbXVzdCBub3Qg
Y2FsbCBzY2hlZHVsZSgpIi4gIEhvdyBkb2VzIHRoaXMgbWFrZQo+IGFueSBzZW5zZT8KPiAKPiBQ
ZXJoYXBzIGEgbXVjaCwgbXVjaCBtb3JlIGRldGFpbGVkIGRlc2NyaXB0aW9uIG9mIHRoZSBvb21f
cmVhcGVyCj4gc2l0dWF0aW9uIHdvdWxkIGhlbHAgb3V0LgogClRoZSBwcmltYXJ5IHBvaW50IGhl
cmUgaXMgdGhhdCB0aGVyZSBpcyBhIGRlbWFuZCBvZiBub24gYmxvY2thYmxlIG1tdQpub3RpZmll
cnMgdG8gYmUgY2FsbGVkIHdoZW4gdGhlIG9vbSByZWFwZXIgdGVhcnMgZG93biB0aGUgYWRkcmVz
cyBzcGFjZS4KQXMgdGhlIG9vbSByZWFwZXIgaXMgdGhlIHByaW1hcnkgZ3VhcmFudGVlIG9mIHRo
ZSBvb20gaGFuZGxpbmcgZm9yd2FyZApwcm9ncmVzcyBpdCBjYW5ub3QgYmUgYmxvY2tlZCBvbiBh
bnl0aGluZyB0aGF0IG1pZ2h0IGRlcGVuZCBvbiBibG9ja2FibGUKbWVtb3J5IGFsbG9jYXRpb25z
LiBUaGVzZSBhcmUgbm90IHJlYWxseSBlYXN5IHRvIHRyYWNrIGJlY2F1c2UgdGhleQptaWdodCBi
ZSBpbmRpcmVjdCAtIGUuZy4gbm90aWZpZXIgYmxvY2tzIG9uIGEgbG9jayB3aGljaCBvdGhlciBj
b250ZXh0CmhvbGRzIHdoaWxlIGFsbG9jYXRpbmcgbWVtb3J5IG9yIHdhaXRpbmcgZm9yIGEgZmx1
c2hlciB0aGF0IG5lZWRzIG1lbW9yeQp0byBwZXJmb3JtIGl0cyB3b3JrLiBJZiBzdWNoIGEgYmxv
Y2tpbmcgc3RhdGUgaGFwcGVucyB0aGF0IHdlIGNhbiBlbmQgdXAKaW4gYSBzaWxlbnQgaGFuZyB3
aXRoIGFuIHVudXNhYmxlIG1hY2hpbmUuCk5vdyB3ZSBob3BlIGZvciByZWFzb25hYmxlIGltcGxl
bWVudGF0aW9ucyBvZiBtbXUgbm90aWZpZXJzIChzdHJvbmcKd29yZHMgSSBrbm93IDspIGFuZCB0
aGlzIHNob3VsZCBiZSByZWxhdGl2ZWx5IHNpbXBsZSBhbmQgZWZmZWN0aXZlIGNhdGNoCmFsbCB0
b29sIHRvIGRldGVjdCBzb21ldGhpbmcgc3VzcGljaW91cyBpcyBnb2luZyBvbi4KCkRvZXMgdGhh
dCBtYWtlIHRoZSBzaXR1YXRpb24gbW9yZSBjbGVhcj8KCi0tIApNaWNoYWwgSG9ja28KU1VTRSBM
YWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
