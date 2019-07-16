Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1A6ABC7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 17:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D296E140;
	Tue, 16 Jul 2019 15:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF39B89BFF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 15:30:02 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49E292054F;
 Tue, 16 Jul 2019 15:30:02 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g44_axVHNMBzxSURQB_-R+Rif7cZcg7PyZ_SS+5hcy5jZA@mail.gmail.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-5-brendanhiggins@google.com>
 <20190715221554.8417320665@mail.kernel.org>
 <CAFd5g47ikJmA0uGoavAFsh+hQvDmgsOi26tyii0612R=rt7iiw@mail.gmail.com>
 <CAFd5g44_axVHNMBzxSURQB_-R+Rif7cZcg7PyZ_SS+5hcy5jZA@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
User-Agent: alot/0.8.1
Date: Tue, 16 Jul 2019 08:30:01 -0700
Message-Id: <20190716153002.49E292054F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563291002;
 bh=Q8O6F/yaThVCvHW/cVKsV5tCbDe9BryORGQ4CN6Um0g=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=hmrRtRBTdm4kxBE8EvPPH4y/b/PKD8OaIKtKYc/eioDNf3b02pnbucEOFC99AWMzc
 pk0CyxfUyQZeYOCLsyuxQzfqzfUvbYo5Iph+PD8JRiCTu/ejPd29269kFVfk3dJjt8
 RJKmoux8/+m7uHXASWdbqf+lDk0usxb/6cFDsSio=
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTYgMDE6Mzc6MzQpCj4gT24gVHVlLCBK
dWwgMTYsIDIwMTkgYXQgMTI6NTcgQU0gQnJlbmRhbiBIaWdnaW5zCj4gPGJyZW5kYW5oaWdnaW5z
QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDM6MTUg
UE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gUXVv
dGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTIgMDE6MTc6MzApCj4gPiA+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUva3VuaXQva3VuaXQtc3RyZWFtLmggYi9pbmNsdWRlL2t1bml0L2t1bml0
LXN0cmVhbS5oCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAw
MDAwMDAwMDAwLi5hN2I1M2VhYmY2YmU0Cj4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsr
KyBiL2luY2x1ZGUva3VuaXQva3VuaXQtc3RyZWFtLmgKPiA+ID4gPiArLyoqCj4gPiA+ID4gKyAq
IHN0cnVjdCBrdW5pdF9zdHJlYW0gLSBhIHN0ZDo6c3RyZWFtIHN0eWxlIHN0cmluZyBidWlsZGVy
Lgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBBIHN0ZDo6c3RyZWFtIHN0eWxlIHN0cmluZyBidWls
ZGVyLiBBbGxvd3MgbWVzc2FnZXMgdG8gYmUgYnVpbHQgdXAgYW5kCj4gPiA+ID4gKyAqIHByaW50
ZWQgYWxsIGF0IG9uY2UuCj4gPiA+ID4gKyAqLwo+ID4gPiA+ICtzdHJ1Y3Qga3VuaXRfc3RyZWFt
IHsKPiA+ID4gPiArICAgICAgIC8qIHByaXZhdGU6IGludGVybmFsIHVzZSBvbmx5LiAqLwo+ID4g
PiA+ICsgICAgICAgc3RydWN0IGt1bml0ICp0ZXN0Owo+ID4gPiA+ICsgICAgICAgY29uc3QgY2hh
ciAqbGV2ZWw7Cj4gPiA+Cj4gPiA+IElzIHRoZSBsZXZlbCBjaGFuZ2VkPyBTZWUgbXkgY29tbWVu
dCBiZWxvdywgYnV0IEkgd29uZGVyIGlmIHRoaXMgd2hvbGUKPiA+ID4gc3RydWN0IGNhbiBnbyBh
d2F5IGFuZCB0aGUgd3JhcHBlcnMgY2FuIGp1c3Qgb3BlcmF0ZSBvbiAnc3RydWN0Cj4gPiA+IHN0
cmluZ19zdHJlYW0nIGluc3RlYWQuCj4gPgo+ID4gSSB3YXMgaW5jbGluZWQgdG8gYWdyZWUgd2l0
aCB5b3Ugd2hlbiBJIGZpcnN0IHJlYWQgeW91ciBjb21tZW50LCBidXQKPiA+IHRoZW4gSSB0aG91
Z2h0IGFib3V0IHRoZSBjYXNlIHRoYXQgc29tZW9uZSB3YW50cyB0byBhZGQgaW4gYSBkZWJ1Zwo+
ID4gbWVzc2FnZSAob2Ygd2hpY2ggSSBjdXJyZW50bHkgaGF2ZSBub25lKS4gSSB0aGluayB1bmRl
ciBtb3N0Cj4gPiBjaXJjdW1zdGFuY2VzIGEgdXNlciBvZiBrdW5pdF9zdHJlYW0gd291bGQgbGlr
ZWx5IHdhbnQgdG8gcGljayBhCj4gPiBkZWZhdWx0IHZlcmJvc2l0eSB0aGF0IG1heWJlIEkgc2hv
dWxkIHByb3ZpZGUsIGJ1dCBtYXkgc3RpbGwgd2FudAo+ID4gZGlmZmVyZW50IHZlcmJvc2l0eSBs
ZXZlbHMuCj4gPgo+ID4gVGhlIG1haW4gcmVhc29uIEkgd2FudCB0byBrZWVwIHRoZSB0eXBlcyBz
ZXBhcmF0ZSwgc3RyaW5nX3N0cmVhbSB2cy4KPiA+IGt1bml0X3N0cmVhbSwgaXMgdGhhdCB0aGV5
IGFyZSBpbnRlbmRlZCB0byBiZSB1c2VkIGRpZmZlcmVudGx5Lgo+ID4gc3RyaW5nX3N0cmVhbSBp
cyBqdXN0IGEgZ2VuZXJpYyBzdHJpbmcgYnVpbGRlci4gSWYgeW91IGFyZSB1c2luZyB0aGF0LAo+
ID4geW91IGFyZSBleHBlY3RpbmcgdG8gc2VlIHNvbWVvbmUgYnVpbGRpbmcgdGhlIHN0cmluZyBh
dCBzb21lIHBvaW50IGFuZAo+ID4gdGhlbiBkb2luZyBzb21ldGhpbmcgaW50ZXJlc3Rpbmcgd2l0
aCBpdC4ga3VuaXRfc3RyZWFtIHJlYWxseSB0ZWxscwo+ID4geW91IHNwZWNpZmljYWxseSB0aGF0
IEtVbml0IGlzIHB1dHRpbmcgdG9nZXRoZXIgYSBtZXNzYWdlIHRvCj4gPiBjb21tdW5pY2F0ZSBz
b21ldGhpbmcgdG8gYSB1c2VyIG9mIEtVbml0LiBJdCBpcyByZWFsbHkgdXNlZCBpbiBhIHZlcnkK
PiA+IHNwZWNpZmljIHdheSwgYW5kIEkgd291bGRuJ3Qgd2FudCB0byBnZW5lcmFsaXplIGl0cyB1
c2FnZSBiZXlvbmQgaG93Cj4gPiBpdCBpcyBjdXJyZW50bHkgdXNlZC4gSSB0aGluayBpbiBvcmRl
ciB0byBwcmVzZXJ2ZSB0aGUgYXV0aG9yJ3MKPiA+IGludGVudGlvbiBpdCBhZGRzIGNsYXJpdHkg
dG8ga2VlcCB0aGUgdHlwZXMgc2VwYXJhdGUgcmVnYXJkbGVzcyBvZiBob3cKPiA+IHNpbWlsYXIg
dGhleSBtaWdodCBiZSBpbiByZWFsaXR5LgoKWW91IG1heSB3YW50IHRvIGFkZCBzb21lIG9mIHRo
ZXNlIHJlYXNvbnMgdG8gdGhlIGNvbW1pdCB0ZXh0LgoKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAg
ICBpZiAoIXN0cmluZ19zdHJlYW1faXNfZW1wdHkoc3RyZWFtLT5pbnRlcm5hbF9zdHJlYW0pKSB7
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGt1bml0X2VycihzdHJlYW0tPnRlc3QsCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAiRW5kIG9mIHRlc3QgY2FzZSByZWFjaGVkIHdpdGgg
dW5jb21taXR0ZWQgc3RyZWFtIGVudHJpZXNcbiIpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICBr
dW5pdF9zdHJlYW1fY29tbWl0KHN0cmVhbSk7Cj4gPiA+ID4gKyAgICAgICB9Cj4gPiA+ID4gK30K
PiA+ID4gPiArCj4gPiA+Cj4gPiA+IE5pdHBpY2s6IERyb3AgdGhpcyBleHRyYSBuZXdsaW5lLgo+
ID4KPiA+IE9vcHMsIG5pY2UgY2F0Y2guCj4gCj4gTm90IHN1cGVyIGltcG9ydGFudCwgYnV0IEkg
ZG9uJ3Qgd2FudCB5b3UgdG8gdGhpbmsgdGhhdCBJIGFtIGlnbm9yaW5nCj4geW91LiBJIHRoaW5r
IHlvdSBtdXN0IGhhdmUgdW5pbnRlbnRpb25hbGx5IGRlbGV0ZWQgdGhlIGxhc3QgZnVuY3Rpb24K
PiBpbiB0aGlzIGZpbGUsIG9yIG1heWJlIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHNvbWV0aGluZyB0
aGF0IEkgYW0ganVzdAo+IG5vdCBzZWVpbmcsIGJ1dCBJIGRvbid0IHNlZSB0aGUgZXh0cmEgbmV3
bGluZSBoZXJlLgoKTm8gd29ycmllcy4gU29ycnkgZm9yIHRoZSBub2lzZS4KCj4gPiBwcm9wZXJ0
eSBvZiB0aGUgaW5wdXQsIGl0IG1heSBvciBtYXkgbm90IGJlIGVub3VnaCBpbmZvcm1hdGlvbiBv
biBpdHMKPiA+IG93biBmb3IgdGhlIGV4cGVjdGF0aW9uIHRvIGZhaWwsIGJ1dCB3ZSB3YW50IHRv
IHNoYXJlIHRoZSByZXN1bHQgb2YKPiA+IHRoZSBwcm9wZXJ0eSBjaGVjayB3aXRoIHRoZSB1c2Vy
IHJlZ2FyZGxlc3MsIEJVVCBvbmx5IGlmIHRoZQo+ID4gZXhwZWN0YXRpb24gYXMgYSB3aG9sZSBm
YWlscy4KPiA+Cj4gPiBIZW5jZSwgd2UgY2FuIGhhdmUgbXVsdGlwbGUgYHN0cnVjdCBrdW5pdF9z
dHJlYW1gcyBhc3NvY2lhdGVkIHdpdGggYQo+ID4gYHN0cnVjdCBrdW5pdGAgYWN0aXZlIGF0IGFu
eSBnaXZlbiB0aW1lLgoKTWFrZXMgc2Vuc2UuIEkgd2Fzbid0IHN1cmUgaWYgdGhlcmUgd2VyZSBt
b3JlIHRoYW4gb25lIHN0cmVhbSBhc3NvY2lhdGVkCndpdGggYSB0ZXN0LiBTb3VuZHMgbGlrZSB0
aGVyZSBhcmUgbWFueSB0byBvbmUgc28gaXQgY2FuJ3QganVzdCBiZSBhCm1lbWJlciBvZiB0aGUg
dGVzdC4gVGhpcyBjb3VsZCBiZSBkb2N1bWVudGVkIHNvbWV3aGVyZSBzbyB0aGlzIHF1ZXN0aW9u
CmRvZXNuJ3QgY29tZSB1cCBhZ2Fpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
