Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B885BF2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FFB6E7DC;
	Thu,  8 Aug 2019 07:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B24CF6E710
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:30:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B8EE344;
 Wed,  7 Aug 2019 07:30:41 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3CB23F706;
 Wed,  7 Aug 2019 07:30:39 -0700 (PDT)
Subject: Re: drm pull for v5.3-rc1
To: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>
References: <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
 <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
 <CAHk-=wghASUU7QmoibQK7XS09na7rDRrjSrWPwkGz=qLnGp_Xw@mail.gmail.com>
 <20190806073831.GA26668@infradead.org>
 <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
 <20190806190937.GD30179@bombadil.infradead.org>
 <20190807064000.GC6002@infradead.org>
 <20190807141517.GA5482@bombadil.infradead.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <62cbe523-e8a4-cdfd-90c2-80260cefa5de@arm.com>
Date: Wed, 7 Aug 2019 15:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807141517.GA5482@bombadil.infradead.org>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas@shipmail.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDgvMjAxOSAxNToxNSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gVHVlLCBBdWcg
MDYsIDIwMTkgYXQgMTE6NDA6MDBQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+
IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDEyOjA5OjM4UE0gLTA3MDAsIE1hdHRoZXcgV2lsY294
IHdyb3RlOgo+Pj4gSGFzIGFueW9uZSBsb29rZWQgYXQgdHVybmluZyB0aGUgaW50ZXJmYWNlIGlu
c2lkZS1vdXQ/ICBpZSBzb21ldGhpbmcgbGlrZToKPj4+Cj4+PiAJc3RydWN0IG1tX3dhbGtfc3Rh
dGUgc3RhdGUgPSB7IC5tbSA9IG1tLCAuc3RhcnQgPSBzdGFydCwgLmVuZCA9IGVuZCwgfTsKPj4+
Cj4+PiAJZm9yX2VhY2hfcGFnZV9yYW5nZSgmc3RhdGUsIHBhZ2UpIHsKPj4+IAkJLi4uIGRvIHNv
bWV0aGluZyB3aXRoIHBhZ2UgLi4uCj4+PiAJfQo+Pj4KPj4+IHdpdGggYXBwcm9wcmlhdGUgbWFj
cm9sb2d5IGFsb25nIHRoZSBsaW5lcyBvZjoKPj4+Cj4+PiAjZGVmaW5lIGZvcl9lYWNoX3BhZ2Vf
cmFuZ2Uoc3RhdGUsIHBhZ2UpCQkJCVwKPj4+IAl3aGlsZSAoKHBhZ2UgPSBwYWdlX3JhbmdlX3dh
bGtfbmV4dChzdGF0ZSkpKQo+Pj4KPj4+IFRoZW4geW91IGRvbid0IG5lZWQgdG8gcGFja2FnZSBh
bnl0aGluZyB1cCBpbnRvIHN0cnVjdHMgdGhhdCBhcmUgc2hhcmVkCj4+PiBiZXR3ZWVuIHRoZSBj
YWxsZXIgYW5kIHRoZSBpdGVyYXRlZCBmdW5jdGlvbi4KPj4KPj4gSSdtIG5vdCBhbiBhbGwgdGhh
dCBodWdlIGZhbiBvZiBzdXBlciBtYWdpYyBtYWNybyBsb29wcy4gIEJ1dCBpbiB0aGlzCj4+IGNh
c2UgSSBkb24ndCBzZWUgaG93IGl0IGNvdWxkIGV2ZW4gd29yaywgYXMgd2UgZ2V0IHNwZWNpYWwg
Y2FsbGJhY2tzCj4+IGZvciBodWdlIHBhZ2VzIGFuZCBob2xlcywgYW5kIHBlb3BsZSBhcmUgdHJ5
aW5nIHRvIGFkZCBhIGZldyBtb3JlIG9wcwo+PiBhcyB3ZWxsLgo+IAo+IFdlIGNvdWxkIGhhdmUg
Yml0cyBpbiB0aGUgbW1fd2Fsa19zdGF0ZSB3aGljaCBpbmRpY2F0ZSB3aGF0IHRoaW5ncyB0byBy
ZXR1cm4KPiBhbmQgd2hhdCB0aGluZ3MgdG8gc2tpcC4gIFdlIGNvdWxkIChhbmQgcHJvYmFibHkg
c2hvdWxkKSBhbHNvIHVzZSBkaWZmZXJlbnQKPiBpdGVyYXRvciBuYW1lcyBpZiBwZW9wbGUgYWN0
dWFsbHkgd2FudCB0byBpdGVyYXRlIGRpZmZlcmVudCB0aGluZ3MuICBlZwo+IGZvcl9lYWNoX3B0
ZV9yYW5nZSgmc3RhdGUsIHB0ZSkgYXMgd2VsbCBhcyBmb3JfZWFjaF9wYWdlX3JhbmdlKCkuCj4g
CgpUaGUgaXRlcmF0b3IgYXBwcm9hY2ggY291bGQgYmUgYXdrd2FyZCBmb3IgdGhlIGxpa2VzIG9m
IG15IGdlbmVyaWMKcHRkdW1wIGltcGxlbWVudGF0aW9uWzFdLiBJdCB3b3VsZCByZXF1aXJlIGFu
IGl0ZXJhdG9yIHdoaWNoIHJldHVybnMgYWxsCmxldmVscyBhbmQgYWxsb3dzIHNraXBwaW5nIGxl
dmVscyB3aGVuIHJlcXVpcmVkICh0byBwcmV2ZW50IEtBU0FOCnNsb3dpbmcgdGhpbmdzIGRvd24g
dG9vIG11Y2gpLiBTbyBzb21ldGhpbmcgbGlrZToKCnN0YXJ0X3dhbGtfcmFuZ2UoJnN0YXRlKTsK
Zm9yX2VhY2hfcGFnZV9yYW5nZSgmc3RhdGUsIHBhZ2UpIHsKCXN3aXRjaChwYWdlLT5sZXZlbCkg
ewoJY2FzZSBQVEU6CgkJLi4uCgljYXNlIFBNRDoKCQlpZiAoLi4uKQoJCQlza2lwX3BtZCgmc3Rh
dGUpOwoJCS4uLgoJY2FzZSBIT0xFOgoJCS4uLi4KCS4uLgoJfQp9CmVuZF93YWxrX3JhbmdlKCZz
dGF0ZSk7CgpJdCBzZWVtcyBhIGxpdHRsZSBmcmFnaWxlIC0gZS5nLiB3ZSB3b3VsZG4ndCAoZWFz
aWx5KSBnZXQgdHlwZSBjaGVja2luZwp0aGF0IHlvdSBhcmUgYWN0dWFsbHkgdHJlYXRpbmcgYSBQ
VEUgYXMgYSBwdGVfdC4gVGhlIHN0YXRlIG11dGF0b3JzIGxpa2UKc2tpcF9wbWQoKSBhbHNvIHNl
ZW0gYSBiaXQgY2x1bXN5LgoKU3RldmUKClsxXQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMTkwNzMxMTU0NjAzLjQxNzk3LTIwLXN0ZXZlbi5wcmljZUBhcm0uY29tLwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
