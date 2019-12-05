Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E6114457
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 17:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132D36E990;
	Thu,  5 Dec 2019 16:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D09E6E988
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:03:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-MoRTtIA4PDWwtQt6J_dX7Q-1; Thu, 05 Dec 2019 11:03:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E4D312A7E49;
 Thu,  5 Dec 2019 16:03:28 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC4D600D1;
 Thu,  5 Dec 2019 16:03:26 +0000 (UTC)
Date: Thu, 5 Dec 2019 11:03:24 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [GIT PULL] Please pull hmm changes
Message-ID: <20191205160324.GB5819@redhat.com>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191203024206.GC5795@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: MoRTtIA4PDWwtQt6J_dX7Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575561814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHd+4w0V9iVfUn6tAMIGauQiWjLxMUn18cIdw9bXNzA=;
 b=VaSz2b/5TeIzw/CS0oNKxhi+xt/6DOgoW3/N2h9jZo8IWNBqF36g0bpDH1uDZYHYNtQ955
 f0MROrh0HaLPHUv7va4uTno3RGcrTrA1r+F2HZ45iQETJPQbuxN7B73g+ezYG1nTulwHl3
 ocUg8CtIIUk08irOGnwwlxBlg4aVO1I=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDI6NDI6MTJBTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFNhdCwgTm92IDMwLCAyMDE5IGF0IDEwOjIzOjMxQU0gLTA4MDAsIExpbnVz
IFRvcnZhbGRzIHdyb3RlOgo+ID4gT24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMTA6MDMgQU0gTGlu
dXMgVG9ydmFsZHMKPiA+IDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IEknbGwgdHJ5IHRvIGZpZ3VyZSB0aGUgY29kZSBvdXQsIGJ1dCBteSBpbml0aWFs
IHJlYWN0aW9uIHdhcyAieWVhaCwKPiA+ID4gbm90IGluIG15IFZNIi4KPiA+IAo+ID4gV2h5IGlz
IGl0IG9rIHRvIHNvbWV0aW1lcyBkbwo+ID4gCj4gPiAgICAgV1JJVEVfT05DRShtbmktPmludmFs
aWRhdGVfc2VxLCBjdXJfc2VxKTsKPiA+IAo+ID4gKHRvIHBhaXIgd2l0aCB0aGUgdW5sb2NrZWQg
UkVBRF9PTkNFKSwgYW5kIHNvbWV0aW1lcyB0aGVuIGRvCj4gPiAKPiA+ICAgICBtbmktPmludmFs
aWRhdGVfc2VxID0gbW1uX21tLT5pbnZhbGlkYXRlX3NlcTsKPiA+IAo+ID4gTXkgaW5pdGlhbCBn
dWVzcyB3YXMgdGhhdCBsYXR0ZXIgaXMgb25seSBkb25lIGF0IGluaXRpYWxpemF0aW9uIHRpbWUs
Cj4gPiBidXQgYXQgbGVhc3QgaW4gb25lIGNhc2UgaXQncyBkb25lICphZnRlciogdGhlIG1uaSBo
YXMgYmVlbiBhZGRlZCB0bwo+ID4gdGhlIG1tbl9tbSAob2gsIGhvdyBJIGRlc3Bpc2UgdGhvc2Ug
bmFtZXMgLSBJIGNhbiBvbmx5IHJlcGVhdDogV1RGPykuCj4gCj4gWWVzLCB0aGUgb25seSBvY2N1
cnJlbmNlcyBhcmUgaW4gdGhlIG5vdGlmaWVyX2luc2VydCwgdW5kZXIgdGhlCj4gc3BpbmxvY2su
IFRoZSBvbmUgY2FzZSB3aGVyZSBpdCBpcyBvdXQgb2YgdGhlIG5hdHVyYWwgb3JkZXIgd2FzIHRv
Cj4gbWFrZSB0aGUgbWFuaXB1bGF0aW9uIG9mIHNlcSBhIGJpdCBzYW5lciwgYnV0IGluIGFsbCBj
YXNlcyBzaW5jZSB0aGUKPiBzcGlubG9jayBpcyBoZWxkIHRoZXJlIGlzIG5vIHdheSBmb3IgYW5v
dGhlciB0aHJlYWQgdG8gZ2V0IHRoZSBwb2ludGVyCj4gdG8gdGhlICdtbXVfaW50ZXJ2YWxfbm90
aWZpZXIgKicgdG8gZG8gdGhlIHVubG9ja2VkIHJlYWQuCj4gCj4gUmVnYXJkaW5nIHRoZSB1Z2x5
IG5hbWVzLi4gTmFtaW5nIGhhcyBiZWVuIHJlYWxseSBoYXJkIGhlcmUgYmVjYXVzZQo+IGN1cnJl
bnRseSBldmVyeXRoaW5nIGlzIGEgJ21tdSBub3RpZmllcicgYW5kIHRoZSBuYXR1cmFsIGFiYmVy
dmlhdGlvbnMKPiBmcm9tIHRoZXJlIGFyZSBjcnVtbXkuIEhlcmUgaXMgdGhlIGJhc2ljIHN1bW1h
cnk6Cj4gCj4gc3RydWN0IG1tdV9ub3RpZmllcl9tbSAoaWUgdGhlIG1tLT5tbXVfbm90aWZpZXJf
bW0pCj4gICAgLT4gbW1uX21tCj4gc3RydWN0IG1tX3N0cnVjdCAKPiAgICAtPiBtbQo+IHN0cnVj
dCBtbXVfbm90aWZpZXIgKGllIHRoZSB1c2VyIHN1YnNjcmlwdGlvbiB0byB0aGUgbW1fc3RydWN0
KQo+ICAgIC0+IG1uCj4gc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllciAodGhlIG90aGVyIGtp
bmQgb2YgdXNlciBzdWJzY3JpcHRpb24pCj4gICAgLT4gbW5pCgpXaGF0IGFib3V0ICJpbnRlcnZh
bCIgdGhlIGNvbnRleHQgc2hvdWxkIGFscmVhZHkgdGVsbCBwZW9wbGUKaXQgaXMgcmVsYXRlZCB0
byBtbXUgbm90aWZpZXIgYW5kIHRodXMgYSBub3RpZmllci4gSSB3b3VsZApqdXN0IHJlbW92ZSB0
aGUgbm90aWZpZXIgc3VmZml4LCB0aGlzIHdvdWxkIG1hdGNoIHRoZSBiZWxvdwpyYW5nZS4KCj4g
c3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAoaWUgdGhlIGFyZ3MgdG8gaW52YWxpZGF0ZV9yYW5n
ZSkKPiAgICAtPiByYW5nZQoKWWVhaCByYW5nZSBhcyBjb250ZXh0IHNob3VsZCB0ZWxsIHlvdSBp
dCBpcyByZWxhdGVkIHRvIG1tdQpub3RpZmllci4KCj4gCj4gSSBjYW4gc2VuZCBhIHBhdGNoIHRv
IHN3aXRjaCBtbW5fbW0gdG8gbW11X25vdGlmaWVyX21tLCB3aGljaCBpcyB0aGUKPiBvbmx5IHBy
ZS1leGlzdGluZyBuYW1lIGZvciB0aGlzIHZhbHVlLiBCdXQgSUlSQywgaXQgaXMgYSBzb21ld2hh
dCB1Z2x5Cj4gd2l0aCBsb25nIGxpbmUgd3JhcHBpbmcuICdtbmknIGlzIGEgcGFpbiwgSSBoYXZl
IHRvIHJlZmxlY3Qgb24gdGhhdC4KPiAoaG9uZXNseSwgSSBkaXNsaWtlIG1tdV9ub3RpZmlmZXJf
bW0gcXVpdGUgYSBsb3QgdG9vKQo+IAo+IEkgdGhpbmsgaXQgd291bGQgYmUgb3ZlcmFsbCBuaWNl
ciB3aXRoIGJldHRlciBuYW1lcyBmb3IgdGhlIG9yaWdpbmFsCj4gc3RydWN0cy4gUGVyaGFwczoK
PiAKPiAgbW1uXyogLSBNTVUgbm90aWZpZXIgcHJlZml4Cj4gIG1tbl9zdGF0ZSA8LSBzdHJ1Y3Qg
bW11X25vdGlmaWVyX21tCj4gIG1tbl9zdWJzY3JpcHRpb24gKG1tbl9zdWIpIDwtIHN0cnVjdCBt
bXVfbm90aWZpZXIKPiAgbW1uX3JhbmdlX3N1YnNjcmlwdGlvbiAobW1uX3JhbmdlX3N1YikgPC0g
c3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcgo+ICBtbW5faW52YWxpZGF0ZV9kZXNjIDwtIHN0
cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UKClRoaXMgbG9va3MgZ29vZC4KCj4gCj4gQXQgbGVhc3Qg
dGhpcyBpcyBob3cgSSBkZXNjcmliZSB0aGVtIGluIG15IG1pbmQuLiAgVGhpcyBpcyBhIGxvdCBv
Zgo+IGNodXJuLCBhbmQgc3ByZWFkcyB0aHJvdWdoIG1hbnkgZHJpdmVycy4gVGhpcyBpcyB3aHkg
SSBrZXB0IHRoZSBuYW1lcwo+IGFzLWlzIGFuZCB3ZSBlbmRlZCB1cCB3aXRoIHRoZSBhbHNvIHF1
aXRlIGJhZCAnbW11X2ludGVydmFsX25vdGlmaWVyJwo+IAo+IE1heWJlIGp1c3Qgc3dpdGNoIG1t
dV9ub3RpZmllcl9tbSBmb3IgbW1uX3N0YXRlIGFuZCBsZWF2ZSB0aGUgZHJpdmVycwo+IGFsb25l
Pwo+IAo+IEFueW9uZSBvbiB0aGUgQ0MgbGlzdCBoYXZlIGFkdmljZT8KCk1heWJlIHdlIGNhbiBk
byBhIHNlbWFudGljIHBhdGNoIHRvIGRvIGNvbnZlcnRpb24gYW5kIHRoZW4gTGludXMKY2FuIGVh
c2lseSBhcHBseSB0aGUgcGF0Y2ggYnkganVzdCByZS1ydW5uaW5nIHRoZSBjb2NjaW5lbGxlLgoK
Q2hlZXJzLApKw6lyw7RtZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
