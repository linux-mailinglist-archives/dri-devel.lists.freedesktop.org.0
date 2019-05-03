Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A81452F
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88C1892F1;
	Mon,  6 May 2019 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9A46E7EC;
 Fri,  3 May 2019 15:14:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 71469ACFA;
 Fri,  3 May 2019 15:14:38 +0000 (UTC)
Date: Fri, 3 May 2019 17:14:37 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] RFC: console: hack up console_trylock more
Message-ID: <20190503151437.dc2ty2mnddabrz4r@pathway.suse.cz>
References: <20190502141643.21080-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502141643.21080-1-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20170912 (1.9.0)
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDIwMTktMDUtMDIgMTY6MTY6NDMsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gY29uc29s
ZV90cnlsb2NrLCBjYWxsZWQgZnJvbSB3aXRoaW4gcHJpbnRrLCBjYW4gYmUgY2FsbGVkIGZyb20g
cHJldHR5Cj4gbXVjaCBhbnl3aGVyZS4gSW5jbHVkaW5nIHRyeV90b193YWtlX3VwLiBOb3RlIHRo
YXQgdGhpcyBpc24ndCBjb21tb24sCj4gdXN1YWxseSB0aGUgYm94IGlzIGluIHByZXR0eSBiYWQg
c2hhcGUgYXQgdGhhdCBwb2ludCBhbHJlYWR5LiBCdXQgaXQKPiByZWFsbHkgZG9lc24ndCBoZWxw
IHdoZW4gdGhlbiBsb2NrZGVwIGp1bXBzIGluIGFuZCBzcGFtcyB0aGUgbG9ncywKPiBwb3RlbnRp
YWxseSBvYnNjdXJpbmcgdGhlIHJlYWwgYmFja3RyYWNlIHdlJ3JlIHJlYWxseSBpbnRlcmVzdGVk
IGluLgo+IE9uZSBjYXNlIEkndmUgc2VlbiAoc2xpZ2h0bHkgc2ltcGxpZmllZCBiYWNrdHJhY2Up
Ogo+IAo+ICBDYWxsIFRyYWNlOgo+ICAgPElSUT4KPiAgIGNvbnNvbGVfdHJ5bG9jaysweGUvMHg2
MAo+ICAgdnByaW50a19lbWl0KzB4ZjEvMHgzMjAKPiAgIHByaW50aysweDRkLzB4NjkKPiAgIF9f
d2Fybl9wcmludGsrMHg0Ni8weDkwCj4gICBuYXRpdmVfc21wX3NlbmRfcmVzY2hlZHVsZSsweDJm
LzB4NDAKPiAgIGNoZWNrX3ByZWVtcHRfY3VycisweDgxLzB4YTAKPiAgIHR0d3VfZG9fd2FrZXVw
KzB4MTQvMHgyMjAKPiAgIHRyeV90b193YWtlX3VwKzB4MjE4LzB4NWYwCj4gICBwb2xsd2FrZSsw
eDZmLzB4OTAKPiAgIGNyZWRpdF9lbnRyb3B5X2JpdHMrMHgyMDQvMHgzMTAKPiAgIGFkZF9pbnRl
cnJ1cHRfcmFuZG9tbmVzcysweDE4Zi8weDIxMAo+ICAgaGFuZGxlX2lycSsweDY3LzB4MTYwCj4g
ICBkb19JUlErMHg1ZS8weDEzMAo+ICAgY29tbW9uX2ludGVycnVwdCsweGYvMHhmCj4gICA8L0lS
UT4KPiAKPiBUaGlzIGFsb25lIGlzbid0IGEgcHJvYmxlbSwgYnV0IHRoZSBzcGlubG9jayBpbiB0
aGUgc2VtYXBob3JlIGlzIGFsc28KPiBzdGlsbCBoZWxkIHdoaWxlIHdha2luZyB1cCB3YWl0ZXJz
ICh1cCgpIC0+IF9fdXAoKSAtPiB0cnlfdG9fd2FrZV91cCgpCj4gY2FsbGNoYWluKSwgd2hpY2gg
dGhlbiBjbG9zZXMgdGhlIHJ1bnF1ZXVlIHZzLiBzZW1hcGhvcmUubG9jayBsb29wLAo+IGFuZCB1
cHNldHMgbG9ja2RlcCwgd2hpY2ggaXNzdWVzIGEgY2lyY3VsYXIgbG9ja2luZyBzcGxhdCB0byBk
bWVzZy4KPiBXb3JzZSBpdCB1cHNldHMgZGV2ZWxvcGVycywgc2luY2Ugd2UgZG9uJ3Qgd2FudCB0
byBzcGFtIGRtZXNnIHdpdGgKPiBjbHV0dGVyIHdoZW4gdGhlIG1hY2hpbmUgaXMgZHlpbmcgYWxy
ZWFkeS4KPgo+IEZpeCB0aGlzIGJ5IGNyZWF0aW5nIGEgX19kb3duX3RyeWxvY2sgd2hpY2ggb25s
eSB0cnlsb2NrcyB0aGUKPiBzZW1hcGhvcmUubG9jay4gVGhpcyBpc24ndCBjb3JyZWN0IGluIGZ1
bGwgZ2VuZXJhbGl0eSwgYnV0IGdvb2QgZW5vdWdoCj4gZm9yIGNvbnNvbGVfbG9jazoKPiAKPiAt
IHRoZXJlJ3Mgb25seSBldmVyIG9uZSBjb25zb2xlX2xvY2sgaG9sZGVyLCB3ZSB3b24ndCBmYWls
IHNwdXJpb3VzbHkKPiAgIGJlY2F1c2Ugc29tZW9uZSBpcyBkb2luZyBhIGRvd24oKSBvciB1cCgp
IHdoaWxlIHRoZXJlJ3Mgc3RpbGwgcm9vbQo+ICAgKHVubGlrZSBvdGhlciBzZW1hcGhvcmVzIHdp
dGggY291bnQgPiAxKS4KPgo+IC0gY29uc29sZV91bmxvY2soKSBoYXMgb25lIG1hc3NpdmUgcmV0
cnkgbG9vcCwgd2hpY2ggd2lsbCBjYXRjaCBhbnlvbmUKPiAgIHdobyByYWNlcyB0aGUgdHJ5bG9j
ayBhZ2FpbnN0IHRoZSB1cCgpLiBUaGlzIG1ha2VzIHN1cmUgdGhhdCBubwo+ICAgcHJpbnRrIGxp
bmVzIHdpbGwgZ2V0IGxvc3QuIE1ha2luZyB0aGUgdHJ5bG9jayBtb3JlIHJhY3kgdGhlcmVmb3Jl
Cj4gICBoYXMgbm8gZnVydGhlciBpbXBhY3QuCgpUbyBiZSBob25lc3QsIEkgZG8gbm90IHNlZSBo
b3cgdGhpcyBjb3VsZCBzb2x2ZSB0aGUgcHJvYmxlbS4KClRoZSBjaXJjdWxhciBkZXBlbmRlbmN5
IGlzIHN0aWxsIHRoZXJlLiBJZiB0aGUgbmV3IF9fZG93bl90cnlsb2NrKCkKc3VjY2VlZHMgdGhl
biBjb25zb2xlX3VubG9jaygpIHdpbGwgZ2V0IGNhbGxlZCBpbiB0aGUgc2FtZSBjb250ZXh0CmFu
ZCBpdCB3aWxsIHN0aWxsIG5lZWQgdG8gY2FsbCB1cCgpIC0+IHRyeV90b193YWtlX3VwKCkuCgpO
b3RlIHRoYXQgdGhlcmUgYXJlIG1hbnkgb3RoZXIgY29uc29sZV9sb2NrKCkgY2FsbGVycyB0aGF0
IG1pZ2h0CmhhcHBlbiBpbiBwYXJhbGxlbCBhbmQgbWlnaHQgYXBwZWFyIGluIHRoZSB3YWl0IHF1
ZXVlLgoKQmVzdCBSZWdhcmRzLApQZXRyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
