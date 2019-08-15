Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C712B8ECA3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 15:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6626E99B;
	Thu, 15 Aug 2019 13:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3230A6E999;
 Thu, 15 Aug 2019 13:21:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6BF77AF2D;
 Thu, 15 Aug 2019 13:21:28 +0000 (UTC)
Date: Thu, 15 Aug 2019 15:21:27 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815132127.GI9477@dhcp22.suse.cz>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815122344.GA21596@ziepe.ca>
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

T24gVGh1IDE1LTA4LTE5IDA5OjIzOjQ0LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVGh1
LCBBdWcgMTUsIDIwMTkgYXQgMDg6NTg6MjlBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDA4OjU4OjA1UE0gLTAzMDAsIEphc29uIEd1bnRo
b3JwZSB3cm90ZToKPiA+ID4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MjA6MjRQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiBJbiBzb21lIHNwZWNpYWwgY2FzZXMgd2Ug
bXVzdCBub3QgYmxvY2ssIGJ1dCB0aGVyZSdzIG5vdCBhCj4gPiA+ID4gc3BpbmxvY2ssIHByZWVt
cHQtb2ZmLCBpcnFzLW9mZiBvciBzaW1pbGFyIGNyaXRpY2FsIHNlY3Rpb24gYWxyZWFkeQo+ID4g
PiA+IHRoYXQgYXJtcyB0aGUgbWlnaHRfc2xlZXAoKSBkZWJ1ZyBjaGVja3MuIEFkZCBhIG5vbl9i
bG9ja19zdGFydC9lbmQoKQo+ID4gPiA+IHBhaXIgdG8gYW5ub3RhdGUgdGhlc2UuCj4gPiA+ID4g
Cj4gPiA+ID4gVGhpcyB3aWxsIGJlIHVzZWQgaW4gdGhlIG9vbSBwYXRocyBvZiBtbXUtbm90aWZp
ZXJzLCB3aGVyZSBibG9ja2luZyBpcwo+ID4gPiA+IG5vdCBhbGxvd2VkIHRvIG1ha2Ugc3VyZSB0
aGVyZSdzIGZvcndhcmQgcHJvZ3Jlc3MuIFF1b3RpbmcgTWljaGFsOgo+ID4gPiA+IAo+ID4gPiA+
ICJUaGUgbm90aWZpZXIgaXMgY2FsbGVkIGZyb20gcXVpdGUgYSByZXN0cmljdGVkIGNvbnRleHQg
LSBvb21fcmVhcGVyIC0KPiA+ID4gPiB3aGljaCBzaG91bGRuJ3QgZGVwZW5kIG9uIGFueSBsb2Nr
cyBvciBzbGVlcGFibGUgY29uZGl0aW9uYWxzLiBUaGUgY29kZQo+ID4gPiA+IHNob3VsZCBiZSBz
d2lmdCBhcyB3ZWxsIGJ1dCB3ZSBtb3N0bHkgZG8gY2FyZSBhYm91dCBpdCB0byBtYWtlIGEgZm9y
d2FyZAo+ID4gPiA+IHByb2dyZXNzLiBDaGVja2luZyBmb3Igc2xlZXBhYmxlIGNvbnRleHQgaXMg
dGhlIGJlc3QgdGhpbmcgd2UgY291bGQgY29tZQo+ID4gPiA+IHVwIHdpdGggdGhhdCB3b3VsZCBk
ZXNjcmliZSB0aGVzZSBkZW1hbmRzIGF0IGxlYXN0IHBhcnRpYWxseS4iCj4gPiA+IAo+ID4gPiBC
dXQgdGhpcyBkZXNjcmliZXMgZnNfcmVjbGFpbV9hY3F1aXJlKCkgLSBpcyB0aGVyZSBzb21lIHJl
YXNvbiB3ZSBhcmUKPiA+ID4gY29uZmxhdGluZyBmc19yZWNsYWltIHdpdGggbm9uLXNsZWVwaW5n
Pwo+ID4gCj4gPiBObyBpZGVhIHdoeSB5b3UgdGllIHRoaXMgaW50byBmc19yZWNsYWltLiBXZSBj
YW4gZGVmaW5pdGx5IHNsZWVwIGluIHRoZXJlLAo+ID4gYW5kIGZvciBlLmcuIGtzd2FwZCAod2hp
Y2ggYWxzbyB3cmFwcyBldmVyeXRoaW5nIGluIGZzX3JlY2xhaW0pIHdlJ3JlCj4gPiBldmVudCBz
dXBwb3NlZCB0byBJIHRob3VnaHQuIFRvIG1ha2Ugc3VyZSB3ZSBjYW4gZ2V0IGF0IHRoZSBsYXN0
IGJpdCBvZgo+ID4gbWVtb3J5IGJ5IGZsdXNoaW5nIGFsbCB0aGUgcXVldWVzIGFuZCB3YWl0aW5n
IGZvciBldmVyeXRoaW5nIHRvIGJlIGNsZWFuZWQKPiA+IG91dC4KPiAKPiBBRkFJSyB0aGUgcG9p
bnQgb2YgZnNfcmVjbGFpbSBpcyB0byBwcmV2ZW50ICJpbmRpcmVjdCBkZXBlbmRlbmN5IHVwb24K
PiB0aGUgcGFnZSBhbGxvY2F0b3IiIGllIGEganVzdGlmaWNhdGlvbiB0aGF0IHdhcyBnaXZlbiB0
aGlzICFibG9ja2FibGUKPiBzdHVmZi4KPiAKPiBGb3IgaW5zdGFuY2U6Cj4gCj4gICBmc19yZWNs
YWltX2FjcXVpcmUoKQo+ICAga21hbGxvYyhHRlBfS0VSTkVMKSA8LSBsb2NrIGRlcCBhc3NlcnRp
b24KPiAKPiBBbmQgZnVydGhlciwgTWljaGFsJ3MgY29uY2VybiBhYm91dCBpbmRpcmVjdG5lc3Mg
dGhyb3VnaCBsb2NrcyBpcyBhbHNvCj4gaGFuZGxlZCBieSBsb2NrZGVwOgo+IAo+ICAgICAgICBD
UFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCkKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAga21hbGxvYyhHRlBfS0VSTkVMKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soKQo+ICAgZnNfcmVjbGFp
bV9hY3F1aXJlKCkKPiAgIG11dGV4X2xvY2soKSA8LSBsb2NrIGRlcCBhc3NlcnRpb24KPiAKPiBJ
biBvdGhlciB3b3JkcywgdG8gcHJldmVudCByZWN1cnNpb24gaW50byB0aGUgcGFnZSBhbGxvY2F0
b3IgeW91IHVzZQo+IGZzX3JlY2xhaW1fYWNxdWlyZSgpLCBhbmQgbG9ja2RlcCB2ZXJmaWVzIGl0
IGluIGl0cyB1c3VhbCByb2J1c3Qgd2F5LgoKZnNfcmVjbGFpbV9hY3F1aXJlIGlzIGFib3V0IEZT
L0lPIHJlY3Vyc2lvbnMgSUlVQy4gV2UgYXJlIHRhbGtpbmcgYWJvdXQKYW55ICFHRlBfTk9XQUlU
IGFsbG9jYXRpb24gY29udGV4dCBoZXJlIGFuZCBhbnkge2lufWRpcmVjdCBkZXBlbmRlbmN5IG9u
Cml0LiBXaGV0aGVyIGZzX3JlY2xhaW1fYWNxdWlyZSBjYW4gYmUgcmV1c2VkIGZvciB0aGF0IEkg
ZG8gbm90IGtub3cKYmVjYXVzZSBJIGFtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBsb2NrZGVwIG1h
Y2hpbmVyeSBlbm91Z2gKIAo+IEkgYXNrZWQgVGVqdW4gYWJvdXQgdGhpcyBvbmNlIGluIHJlZ2Fy
ZHMgdG8gV1FfTUVNX1JFQ0xBSU0gYW5kIGhlCj4gZXhwbGFpbmVkIHRoYXQgaXQgbWVhbnMgeW91
IGNhbid0IGNhbGwgdGhlIGFsbG9jYXRvciBmdW5jdGlvbnMgaW4gYQo+IHdheSB0aGF0IHdvdWxk
IHJlY3Vyc2UgaW50byByZWNsYWltIChpZSBpbnN0ZWFkIHVzZSBpbnN0ZWFkIEdGUF9BVE9NSUMs
IG9yCj4gdG9sZXJhdGUgYWxsb2NhdGlvbiBmYWlsdXJlLCBvciB2YXJpb3VzIG90aGVyIHRoaW5n
cykuCj4gCj4gU28sIHRoZSByZWFzb24gSSBicmluZyBpdCB1cCBpcyBoYWxmIHRoZSBqdXN0aWZp
Y2F0aW9ucyB5b3UgcG9zdGVkIGZvcgo+IGJsb2NrYWJsZSBoYWQgdG8gZG8gd2l0aCBub3QgcmVj
dXJzaW5nIGludG8gcmVjbGFpbSBhbmQgZGVhZGxvY2tpbmcsCj4gYW5kIGRpZG4ndCBzZWVtIHRv
IGhhdmUgbXVjaCB0byBkbyB3aXRoIGJsb2NraW5nLgo+IAo+IEknbSBhc2tpbmcgaWYgKm5vbi1i
bG9ja2luZyogaXMgcmVhbGx5IHRoZSByZXF1aXJlbWVudCBvciBpZiB0aGlzIGlzCj4ganVzdCB0
aGUgdXN1YWwgJ2RvIG5vdCBkZWFkbG9jayBvbiB0aGUgYWxsb2NhdG9yJyB0aGluZyByZWNsYWlt
IHBhdGhzCj4gYWxyZWFkIGhhdmU/CgpObywgbm9uLWJsb2NraW5nIGlzIGEgdmVyeSBjb2Fyc2Ug
YXBwcm94aW1hdGlvbiBvZiB3aGF0IHdlIHJlYWxseSBuZWVkLgpCdXQgaXQgc2hvdWxkIGdpdmUg
dXMgZXZlbiBhIHN0cm9uZ2VyIGNvbmRpdGlvbi4gRXNzZW50aWFsbHkgYW55IHNsZWVwCm90aGVy
IHRoYW4gYSBwcmVlbXB0aW9uIHNob3VsZG4ndCBiZSBhbGxvd2VkIGluIHRoYXQgY29udGV4dC4K
LS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
