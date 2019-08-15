Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E88F0A5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 18:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2926E9FC;
	Thu, 15 Aug 2019 16:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743616E9F8;
 Thu, 15 Aug 2019 16:32:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C67853E2D3;
 Thu, 15 Aug 2019 16:32:42 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8BCB17AD1;
 Thu, 15 Aug 2019 16:32:40 +0000 (UTC)
Date: Thu, 15 Aug 2019 12:32:38 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815163238.GA30781@redhat.com>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
 <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
 <20190815151028.GJ21596@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815151028.GJ21596@ziepe.ca>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 15 Aug 2019 16:32:43 +0000 (UTC)
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
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6MTA6MjhQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA0OjQzOjM4UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gCj4gPiBZb3UgaGF2ZSB0byB3YWl0IGZvciB0aGUgZ3B1IHRvIGZp
bm5pc2ggY3VycmVudCBwcm9jZXNzaW5nIGluCj4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LiBP
dGhlcndpc2UgdGhlcmUncyBubyBwb2ludCB0byBhbnkgb2YgdGhpcwo+ID4gcmVhbGx5LiBTbyB0
aGUgd2FpdF9ldmVudC9kbWFfZmVuY2Vfd2FpdCBhcmUgdW5hdm9pZGFibGUgcmVhbGx5Lgo+IAo+
IEkgZG9uJ3QgZW52eSB5b3VyIHRhc2sgOnwKPiAKPiBCdXQsIHdoYXQgeW91IGRlc2NyaWJlIHN1
cmUgc291bmRzIGxpa2UgYSAncmVnaXN0cmF0aW9uIGNhY2hlJyBtb2RlbCwKPiBub3QgdGhlICdz
aGFkb3cgcHRlJyBtb2RlbCBvZiBjb2hlcmVuY3kuCj4gCj4gVGhlIGtleSBkaWZmZXJlbmNlIGlz
IHRoYXQgYSByZWdpcnN0YXRpb25jYWNoZSBpcyBhbGxvd2VkIHRvIGJlY29tZQo+IGluY29oZXJl
bnQgd2l0aCB0aGUgVk1BJ3MgYmVjYXVzZSBpdCBob2xkcyBwYWdlIHBpbnMuIEl0IGlzIGEKPiBw
cm9ncmFtbWluZyBidWcgaW4gdXNlcnNwYWNlIHRvIGNoYW5nZSBWQSBtYXBwaW5ncyB2aWEgbW1h
cC9tdW5tYXAvZXRjCj4gd2hpbGUgdGhlIGRldmljZSBpcyB3b3JraW5nIG9uIHRoYXQgVkEsIGJ1
dCBpdCBkb2VzIG5vdCBoYXJtIHN5c3RlbQo+IGludGVncml0eSBiZWNhdXNlIG9mIHRoZSBwYWdl
IHBpbi4KPiAKPiBUaGUgY2FjaGUgZW5zdXJlcyB0aGF0IGVhY2ggaW5pdGlhdGVkIG9wZXJhdGlv
biBzZWVzIGEgRE1BIHNldHVwIHRoYXQKPiBtYXRjaGVzIHRoZSBjdXJyZW50IFZBIG1hcCB3aGVu
IHRoZSBvcGVyYXRpb24gaXMgaW5pdGlhdGVkIGFuZCBhbGxvd3MKPiBleHBlbnNpdmUgZGV2aWNl
IERNQSBzZXR1cHMgdG8gYmUgcmUtdXNlZC4KPiAKPiBBICdzaGFkb3cgcHRlJyBtb2RlbCAoaWUg
aG1tKSAqcmVhbGx5KiBuZWVkcyBkZXZpY2Ugc3VwcG9ydCB0bwo+IGRpcmVjdGx5IGJsb2NrIERN
QSBhY2Nlc3MgLSBpZSB0cmlnZ2VyICdkZXZpY2UgcGFnZSBmYXVsdCcuIGllIHRoZQo+IGludmFs
aWRhdGVfc3RhcnQgc2hvdWxkIGluZm9ybSB0aGUgZGV2aWNlIHRvIGVudGVyIGEgZmF1bHQgbW9k
ZSBhbmQKPiB0aGF0IGlzIGl0LiAgSWYgdGhlIGRldmljZSBjYW4ndCBkbyB0aGF0LCB0aGVuIHRo
ZSBkcml2ZXIgcHJvYmFibHkKPiBzaG91bGRuJ3QgcGVyc3VlIHRoaXMgbGV2ZWwgb2YgY29oZXJl
bmN5LiBUaGUgZHJpdmVyIHdvdWxkIHF1aWNrbHkgZ2V0Cj4gaW50byB0aGUgbWVzc3kgbG9ja2lu
ZyBwcm9ibGVtcyBsaWtlIGRtYV9mZW5jZV93YWl0IGZyb20gYSBub3RpZmllci4KCkkgdGhpbmsg
aGVyZSB3ZSBkbyBub3QgYWdyZWUgb24gdGhlIGhhcmR3YXJlIHJlcXVpcmVtZW50LiBGb3IgR1BV
CndlIHdpbGwgYWx3YXlzIG5lZWQgdG8gYmUgYWJsZSB0byB3YWl0IGZvciBzb21lIEdQVSBmZW5j
ZSBmcm9tIGluc2lkZQp0aGUgbm90aWZpZXIgY2FsbGJhY2ssIHRoZXJlIGlzIGp1c3Qgbm8gd2F5
IGFyb3VuZCB0aGF0IGZvciBtYW55IG9mCnRoZSBHUFVzIHRvZGF5IChpIGRvIG5vdCBzZWUgYW55
IGluZGljYXRpb24gb2YgdGhhdCBjaGFuZ2luZykuCgpEcml2ZXIgc2hvdWxkIGF2b2lkIGxvY2sg
Y29tcGxleGl0eSBieSB1c2luZyB3YWl0IHF1ZXVlIHNvIHRoYXQgdGhlCmRyaXZlciBub3RpZmll
ciBjYWxsYmFjayBjYW4gd2FpdCB3aXRob3V0IGhhdmluZyB0byBob2xkIHNvbWUgZHJpdmVyCmxv
Y2suIEhvd2V2ZXIgdGhlcmUgd2lsbCBiZSBhdCBsZWFzdCBvbmUgbG9jayBuZWVkZWQgdG8gdXBk
YXRlIHRoZQppbnRlcm5hbCBkcml2ZXIgc3RhdGUgZm9yIHRoZSByYW5nZSBiZWluZyBpbnZhbGlk
YXRlZC4gVGhhdCBsb2NrIGlzCmp1c3QgdGhlIGRldmljZSBkcml2ZXIgcGFnZSB0YWJsZSBsb2Nr
IGZvciB0aGUgR1BVIHBhZ2UgdGFibGUKYXNzb2NpYXRlZCB3aXRoIHRoZSBtbV9zdHJ1Y3QuIElu
IGFsbCBHUFUgZHJpdmVyIHNvIGZhciBpdCBpcyBhIHNob3J0CmxpdmVkIGxvY2sgYW5kIG5vdGhp
bmcgYmxvY2tpbmcgaXMgZG9uZSB3aGlsZSBob2xkaW5nIGl0IChpdCBpcyBqdXN0CmFib3V0IHVw
ZGF0aW5nIHBhZ2UgdGFibGUgZGlyZWN0b3J5IHJlYWxseSB3ZXRoZXIgaXQgaXMgZmlsbGluZyBp
dCBvcgpjbGVhcmluZyBpdCkuCgoKPiAKPiBJdCBpcyBpbXBvcnRhbnQgdG8gaWRlbnRpZnkgd2hh
dCBtb2RlbCB5b3UgYXJlIGdvaW5nIGZvciBhcyBkZWZpbmluZyBhCj4gJ3JlZ2lzdHJhdGlvbiBj
YWNoZScgY29oZXJlbmNlIGV4cGVjdGF0aW9uIGFsbG93cyB0aGUgZHJpdmVyIHRvIHNraXAKPiBi
bG9ja2luZyBpbiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LiBBbGwgaXQgZG9lcyBpcyBpbnZhbGlk
YXRlIHRoZQo+IGNhY2hlIHNvIHRoYXQgZnV0dXJlIG9wZXJhdGlvbnMgcGljayB1cCB0aGUgbmV3
IFZBIG1hcHBpbmcuCj4gCj4gSW50ZWwncyBIRkkgUkRNQSBkcml2ZXIgdXNlcyB0aGlzIG1vZGVs
IGV4dGVuc2l2ZWx5LCBhbmQgSSB0aGluayBpdCBpcwo+IHdlbGwgcHJvdmVuLCB3aXRoaW4gc29t
ZSBsaW1pdGF0aW9ucyBvZiBjb3Vyc2UuCj4gCj4gQXQgbGVhc3QsICdyZWdpc3RyYXRpb24gY2Fj
aGUnIGlzIHRoZSBvbmx5IHVzZSBtb2RlbCBJIGtub3cgb2Ygd2hlcmUKPiBpdCBpcyBhY2NlcHRh
YmxlIHRvIHNraXAgaW52YWxpZGF0ZV9yYW5nZV9lbmQuCgpIZXJlIEdQVSBhcmUgbm90IGluIHRo
ZSByZWdpc3RyYXRpb24gY2FjaGUgbW9kZWwsIGkga25vdyBpdCBtaWdodCBsb29rcwpsaWtlIGl0
IGJlY2F1c2Ugb2YgR1VQIGJ1dCBHVVAgd2FzIHVzZSBqdXN0IGJlY2F1c2UgaG1tIGRpZCBub3Qg
ZXhpc3QKYXQgdGhlIHRpbWUuCgpDaGVlcnMsCkrDqXLDtG1lCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
