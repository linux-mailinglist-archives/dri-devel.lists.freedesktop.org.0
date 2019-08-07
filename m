Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945985BD9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6C06E7A0;
	Thu,  8 Aug 2019 07:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5296E70E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:15:22 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hvMij-0000L4-QT; Wed, 07 Aug 2019 14:15:17 +0000
Date: Wed, 7 Aug 2019 07:15:17 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: drm pull for v5.3-rc1
Message-ID: <20190807141517.GA5482@bombadil.infradead.org>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807064000.GC6002@infradead.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlfBT6TXSUpnllA47N2HUtHetiSK58in3jxlr+iv0pw=; b=fl04xyXZ1MF4FV7R7c9+2e3mc
 BnEgn9ziqhqIJRRcqRGXr5xuLz626V4rw1XP31jZzwq1IoksUtAYJUgps0z8pBhH0+FMZFkhISBNx
 Q5YRJDQd0C6WBWV3zqHiLbtLFAMgbBa3U9JSXYKyw8RJ5M3Pf9JUD8STq452o7t/3toUUCeipkl05
 eu2Tihzhn0ue6tHKKThBIn0XkdjBi368CTpA9WdpKwBsxHwpN/izSGN7a10VxkbqlHcs7rNxywvMq
 PH89XHFpzIT7ys9UqwBp/TiaY+4/2uzjtzf9xtC9fXhtVE6Gk44R+jhXza0R4NTl71C4x7lJJ1jUD
 VaWCGWKzw==;
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas@shipmail.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Linux-MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTE6NDA6MDBQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTI6MDk6MzhQTSAtMDcwMCwgTWF0
dGhldyBXaWxjb3ggd3JvdGU6Cj4gPiBIYXMgYW55b25lIGxvb2tlZCBhdCB0dXJuaW5nIHRoZSBp
bnRlcmZhY2UgaW5zaWRlLW91dD8gIGllIHNvbWV0aGluZyBsaWtlOgo+ID4gCj4gPiAJc3RydWN0
IG1tX3dhbGtfc3RhdGUgc3RhdGUgPSB7IC5tbSA9IG1tLCAuc3RhcnQgPSBzdGFydCwgLmVuZCA9
IGVuZCwgfTsKPiA+IAo+ID4gCWZvcl9lYWNoX3BhZ2VfcmFuZ2UoJnN0YXRlLCBwYWdlKSB7Cj4g
PiAJCS4uLiBkbyBzb21ldGhpbmcgd2l0aCBwYWdlIC4uLgo+ID4gCX0KPiA+IAo+ID4gd2l0aCBh
cHByb3ByaWF0ZSBtYWNyb2xvZ3kgYWxvbmcgdGhlIGxpbmVzIG9mOgo+ID4gCj4gPiAjZGVmaW5l
IGZvcl9lYWNoX3BhZ2VfcmFuZ2Uoc3RhdGUsIHBhZ2UpCQkJCVwKPiA+IAl3aGlsZSAoKHBhZ2Ug
PSBwYWdlX3JhbmdlX3dhbGtfbmV4dChzdGF0ZSkpKQo+ID4gCj4gPiBUaGVuIHlvdSBkb24ndCBu
ZWVkIHRvIHBhY2thZ2UgYW55dGhpbmcgdXAgaW50byBzdHJ1Y3RzIHRoYXQgYXJlIHNoYXJlZAo+
ID4gYmV0d2VlbiB0aGUgY2FsbGVyIGFuZCB0aGUgaXRlcmF0ZWQgZnVuY3Rpb24uCj4gCj4gSSdt
IG5vdCBhbiBhbGwgdGhhdCBodWdlIGZhbiBvZiBzdXBlciBtYWdpYyBtYWNybyBsb29wcy4gIEJ1
dCBpbiB0aGlzCj4gY2FzZSBJIGRvbid0IHNlZSBob3cgaXQgY291bGQgZXZlbiB3b3JrLCBhcyB3
ZSBnZXQgc3BlY2lhbCBjYWxsYmFja3MKPiBmb3IgaHVnZSBwYWdlcyBhbmQgaG9sZXMsIGFuZCBw
ZW9wbGUgYXJlIHRyeWluZyB0byBhZGQgYSBmZXcgbW9yZSBvcHMKPiBhcyB3ZWxsLgoKV2UgY291
bGQgaGF2ZSBiaXRzIGluIHRoZSBtbV93YWxrX3N0YXRlIHdoaWNoIGluZGljYXRlIHdoYXQgdGhp
bmdzIHRvIHJldHVybgphbmQgd2hhdCB0aGluZ3MgdG8gc2tpcC4gIFdlIGNvdWxkIChhbmQgcHJv
YmFibHkgc2hvdWxkKSBhbHNvIHVzZSBkaWZmZXJlbnQKaXRlcmF0b3IgbmFtZXMgaWYgcGVvcGxl
IGFjdHVhbGx5IHdhbnQgdG8gaXRlcmF0ZSBkaWZmZXJlbnQgdGhpbmdzLiAgZWcKZm9yX2VhY2hf
cHRlX3JhbmdlKCZzdGF0ZSwgcHRlKSBhcyB3ZWxsIGFzIGZvcl9lYWNoX3BhZ2VfcmFuZ2UoKS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
