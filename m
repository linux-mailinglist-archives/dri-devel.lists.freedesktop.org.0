Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824DE845F1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19C36E68B;
	Wed,  7 Aug 2019 07:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559BA89A56
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 19:09:42 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hv4q2-00022c-3C; Tue, 06 Aug 2019 19:09:38 +0000
Date: Tue, 6 Aug 2019 12:09:38 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: drm pull for v5.3-rc1
Message-ID: <20190806190937.GD30179@bombadil.infradead.org>
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
 <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
 <CAHk-=wghASUU7QmoibQK7XS09na7rDRrjSrWPwkGz=qLnGp_Xw@mail.gmail.com>
 <20190806073831.GA26668@infradead.org>
 <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RaeoCUSmhxSCGOxwB43DaNZ/5YjX3sQn/mta3yU5yC4=; b=HYsW2QiOT4sji3EIN4Q0wKhkO
 8usk4G3VXuLKfPFt93yayYnL11+Wg7CD6fo5kXE0hCCJsU9hPCfQz0e8rb+Cj/PRiYXJqhgwWmGPZ
 F8nDYUjkOC3GE94SGbYaBkWqx/G9v7lBO1ePtBuaCUt+kGyE5vM2VgrlPTY6FmO8VQ8Gy+lQmUfzi
 lxOePzlgNMzkgaDgPtOdsG+LAhyELSbgT9YNqFNxQ5C/Rdia7AkWDcuYmqvmp0BklX9DjFbIrJZXD
 VvZqWIteZ7nvupkqGl8SD0m+FH3vaDhoP4qemEWgLPkSTRlvRi3LRgWr6rbkK6Z1XOSj9D1wvKK/z
 Ys7utKYGQ==;
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Linux-MM <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTE6NTA6NDJBTSAtMDcwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gSW4gZmFjdCwgSSBkbyBub3RlIHRoYXQgYSBsb3Qgb2YgdGhlIHVzZXJzIGRvbid0
IGFjdHVhbGx5IHVzZSB0aGUKPiAidm9pZCAqcHJpdmF0ZSIgYXJndW1lbnQgYXQgYWxsIC0gdGhl
eSBqdXN0IHdhbnQgdGhlIHdhbGtlciAtIGFuZCBqdXN0Cj4gcGFzcyBpbiBhIE5VTEwgcHJpdmF0
ZSBwb2ludGVyLiBTbyB3ZSBoYXZlIHRoaW5ncyBsaWtlIHRoaXM6Cj4gCj4gPiArICAgICAgIGlm
ICh3YWxrX3BhZ2VfcmFuZ2UoJmluaXRfbW0sIHZhLCB2YSArIHNpemUsICZzZXRfbm9jYWNoZV93
YWxrX29wcywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpKSB7Cj4gCj4gYW5kIGlu
IGEgcGVyZmVjdCB3b3JsZCB3ZSdkIGhhdmUgYXJndW1lbnRzIHdpdGggZGVmYXVsdCB2YWx1ZXMg
c28gdGhhdAo+IHdlIGNvdWxkIHNraXAgdGhvc2UgZW50aXJlbHkgZm9yIHdoZW4gcGVvcGxlIGp1
c3QgZG9uJ3QgbmVlZCBpdC4KPiAKPiBJJ20gbm90IGEgaHVnZSBmYW4gb2YgQysrIGJlY2F1c2Ug
b2YgYSBsb3Qgb2YgdGhlIGNvbXBsZXhpdHkgKGFuZCBzb21lCj4gcmVhbGx5IGJhZCBkZWNpc2lv
bnMpLCBidXQgbWFueSBvZiB0aGUgX3N5bnRhY3RpY18gdGhpbmdzIGluIEMrKyB3b3VsZAo+IGJl
IG5pY2UgdG8gdXNlLiBUaGlzIG9uZSBkb2Vzbid0IHNlZW0gdG8gYmUgb25lIHRoYXQgdGhlIGdj
YyBwZW9wbGUKPiBoYXZlIHBpY2tlZCB1cCBhcyBhbiBleHRlbnNpb24gOygKPiAKPiBZZXMsIHll
cywgd2UgY291bGQgZG8gaXQgd2l0aCBhIG1hY3JvLCBJIGd1ZXNzLgo+IAo+ICAgICNkZWZpbmUg
d2Fsa19wYWdlX3JhbmdlKG1tLCBzdGFydCxlbmQsIG9wcywgLi4uKSBcCj4gICAgICAgIF9fd2Fs
a19wYWdlX3JhbmdlKG1tLCBzdGFydCwgZW5kLCAoTlVMTCAsICMjIF9fVkFfQVJHU19fKSkKPiAK
PiBidXQgSSdtIG5vdCBzdXJlIGl0J3Mgd29ydGh3aGlsZS4KCkhhcyBhbnlvbmUgbG9va2VkIGF0
IHR1cm5pbmcgdGhlIGludGVyZmFjZSBpbnNpZGUtb3V0PyAgaWUgc29tZXRoaW5nIGxpa2U6CgoJ
c3RydWN0IG1tX3dhbGtfc3RhdGUgc3RhdGUgPSB7IC5tbSA9IG1tLCAuc3RhcnQgPSBzdGFydCwg
LmVuZCA9IGVuZCwgfTsKCglmb3JfZWFjaF9wYWdlX3JhbmdlKCZzdGF0ZSwgcGFnZSkgewoJCS4u
LiBkbyBzb21ldGhpbmcgd2l0aCBwYWdlIC4uLgoJfQoKd2l0aCBhcHByb3ByaWF0ZSBtYWNyb2xv
Z3kgYWxvbmcgdGhlIGxpbmVzIG9mOgoKI2RlZmluZSBmb3JfZWFjaF9wYWdlX3JhbmdlKHN0YXRl
LCBwYWdlKQkJCQlcCgl3aGlsZSAoKHBhZ2UgPSBwYWdlX3JhbmdlX3dhbGtfbmV4dChzdGF0ZSkp
KQoKVGhlbiB5b3UgZG9uJ3QgbmVlZCB0byBwYWNrYWdlIGFueXRoaW5nIHVwIGludG8gc3RydWN0
cyB0aGF0IGFyZSBzaGFyZWQKYmV0d2VlbiB0aGUgY2FsbGVyIGFuZCB0aGUgaXRlcmF0ZWQgZnVu
Y3Rpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
